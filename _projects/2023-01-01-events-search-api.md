---
layout: project
title: Events Search API
tech: REST, Python, Flask, Celery, PostgreSQL, Docker
---

![Drag Racing](/images/event_search_api_component_diagram.png)

Events Search API was designed to fetch events from a third-party provider, store them in a PostgreSQL database, and offer a user-friendly endpoint for event search based on start and end dates. This project aimed to streamline event management and retrieval to offer up-to-date event information to users.

**Link:** [GitHub Repository](https://github.com/sousatg/event_search_api)

<!--more-->


![Drag Racing](/images/event_search_api_component_diagram.png)

### Description

Events Search API was designed to fetch events from a third-party provider, store them in a PostgreSQL database, and offer a user-friendly endpoint for event search based on start and end dates. This project aimed to streamline event management and retrieval to offer up-to-date event information to users.

To search a event users just need to send a GET request with the `start_at` and `ends_at` query parameters defined:

```
curl http://<url>/search?starts_at=2000-06-30T20:00:00Z&ends_at=2021-02-10T23:00:00Z
```

And we will get a response with all events available during that time window:
```
{
  "data": {
    "events": [
      {
        "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
        "title": "string",
        "start_date": "2023-09-12",
        "start_time": "22:38:19",
        "end_date": "2023-09-12",
        "end_time": "14:45:15",
        "min_price": 0,
        "max_price": 0
      }
    ]
  },
  "error": null
}
```

### Project Goals

- Develop a REST API
- Create a architecture that would be easy to scale and add easy to add more event providers
- Use ADR's to document the architectural decisions of the project
- Explore to use of Celery Beat to creat cronjob's

### Features

- Search events by start and end date
