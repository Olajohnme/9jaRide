create table trips (
  id uuid primary key default gen_random_uuid(),
  driver_id uuid not null,
  from_city text not null,
  to_city text not null,
  departure_at timestamptz not null,
  total_seats int not null check (total_seats between 1 and 7),
  price_kobo int not null,
  created_at timestamptz default now()
);

create table bookings (
  id uuid primary key default gen_random_uuid(),
  trip_id uuid references trips on delete cascade,
  passenger_id uuid not null,
  seats int default 1,
  status text default 'pending',
  created_at timestamptz default now()
);
