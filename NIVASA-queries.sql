USE Nivasa;

-- ─────────────────────────────────────────────
-- QUERY 1: Price-First Ranking
-- Ranks properties by a value score = rent / distance
-- Lower score = cheaper rent relative to distance from NIT
-- A property at Rs.4500 and 0.8km beats one at Rs.4000 and 3km
-- ─────────────────────────────────────────────
SELECT
    p.property_id,
    p.title,
    p.type,
    p.area,
    p.rent_per_month,
    p.distance_from_nit,
    ROUND(p.rent_per_month / p.distance_from_nit, 2) AS price_per_km,
    RANK() OVER (ORDER BY p.rent_per_month / p.distance_from_nit ASC) AS value_rank
FROM Properties p
WHERE p.rent_per_month IS NOT NULL
ORDER BY value_rank;


-- ─────────────────────────────────────────────
-- QUERY 2: Filter by Price Range + Distance
-- Core student search: budget under Rs.7000, within 3km of NIT
-- ─────────────────────────────────────────────
SELECT
    p.property_id,
    p.title,
    p.type,
    p.area,
    p.rent_per_month,
    p.distance_from_nit,
    p.is_furnished,
    p.roommates_allowed
FROM Properties p
WHERE p.rent_per_month <= 7000
  AND p.distance_from_nit <= 3.0
ORDER BY p.rent_per_month ASC;


-- ─────────────────────────────────────────────
-- QUERY 3: Filter by Amenities (Wifi + Water Included)
-- Students who specifically need wifi and included water bill
-- ─────────────────────────────────────────────
SELECT
    p.title,
    p.type,
    p.area,
    p.rent_per_month,
    p.distance_from_nit,
    a.wifi,
    a.water_included
FROM Properties p
JOIN Amenities a ON p.property_id = a.property_id
WHERE a.wifi = TRUE
  AND a.water_included = TRUE
ORDER BY p.rent_per_month ASC;


-- ─────────────────────────────────────────────
-- QUERY 4: Average Rent by Property Type
-- Market overview — how much does each type typically cost
-- ─────────────────────────────────────────────
SELECT
    type,
    COUNT(*) AS total_listings,
    ROUND(AVG(rent_per_month), 2) AS avg_rent,
    MIN(rent_per_month) AS min_rent,
    MAX(rent_per_month) AS max_rent
FROM Properties
GROUP BY type
ORDER BY avg_rent ASC;


-- ─────────────────────────────────────────────
-- QUERY 5: Verified Landlord Listings Only
-- Filters to only show properties from verified landlords
-- for student safety
-- ─────────────────────────────────────────────
SELECT
    p.title,
    p.type,
    p.rent_per_month,
    p.distance_from_nit,
    l.name AS landlord_name,
    l.phone AS landlord_contact
FROM Properties p
JOIN Landlords l ON p.landlord_id = l.landlord_id
WHERE l.is_verified = TRUE
ORDER BY p.rent_per_month ASC;
