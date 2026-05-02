# Nivasa — Hyper-local Rental Listing Platform (Database Prototype)

## Overview
Finding affordable rental accommodation near a university is a genuine pain point
for students. Nivasa is a database prototype designed to solve exactly that —
a hyper-local rental platform built specifically for the student demographic,
centered around **price-first discovery** relative to distance from campus.

This project focuses on the relational database design and analytical query layer
of the platform, using NIT Raipur as the reference location.

---

## Problem Statement
Students searching for PGs or flats near campus face two core challenges:
- Listings are scattered with no structured price vs. distance comparison
- No way to filter verified landlords from unverified ones

Nivasa addresses both by structuring rental data relationally and introducing
a **value score** (rent ÷ distance) to surface the most cost-efficient options first.

---

## Database Schema
Four tables model the platform's core entities:

- **Landlords** — contact info and verification status
- **Properties** — listing details including type, rent, distance from NIT, furnishing
- **Amenities** — per-property amenity flags (wifi, AC, laundry, parking, water)

Relationships are enforced via foreign keys across all tables.

---

## Key Queries

### 1. Price-First Ranking
Ranks all listings by `rent ÷ distance_from_campus` — a value score that
rewards proximity. A Rs. 4,500 room at 0.8km ranks higher than a Rs. 4,000
room at 3.2km, reflecting real student priorities.

### 2. Budget + Distance Filter
Core student search: properties under a set rent ceiling within a defined
radius of campus. Replicates the most common real-world filtering behavior.

### 3. Amenity-Based Filtering
Filters listings by specific needs (wifi, water included, AC) using
JOIN across the Amenities table.

### 4. Market Overview by Property Type
Aggregates average, min, and max rent across PG, Flat, and Room categories —
useful for understanding the local rental market at a glance.

### 5. Verified Landlords Only
Safety-first filter that surfaces only listings from landlords with
verified status, with contact details included.

---

## Tech Stack
- MySQL
- Concepts: Relational schema design, Foreign key constraints, INNER JOINs,
  Window functions (RANK OVER), Aggregate functions, Conditional filtering

---

## How to Run
1. Clone this repository
2. Open MySQL Workbench or any SQL client
3. Run `schema/schema.sql` first — creates database, tables, and inserts sample data
4. Run any query from `queries/queries.sql`

---

## Sample Data
The prototype includes 8 property listings across localities near NIT Raipur
(Tatibandh, Saddu, Khamardih, Mowa) with realistic rent ranges (Rs. 3,000 – 15,000)
and distances between 0.5km and 4.5km from campus.

---

## Skills Demonstrated
- Relational database design with normalized structure
- Business logic encoded in SQL (value ranking, safety filtering)
- Multi-table JOINs and window functions
- Real-world problem framing and schema decisions
