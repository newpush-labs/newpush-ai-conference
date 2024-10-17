---
title: 'Home'
date: 2023-10-24
type: landing

design:
  # Default section spacing
  spacing: "6rem"

sections:
  - block: hero-with-stats
    content:
      title: 25th ANNIVERSARY SYMPOSIUM
      text: "**THRIVING INTO THE EXPONENTIAL AGE**"
      details: "Nov 15th, 2024. \n\nArtifical Intelligence and Security /// BUDAPEST /// LUPS"
      primary_action:
        text: Get Tickets
        url: https://www.eventbrite.com/
        icon: ticket
      items:
        - name: "Speakers"
          description: "20+"
        - name: "Attendees"
          description: "200+"
        - name: "Ludovika University of Public Service"
          description: "Main Building"
        - name: "Location"
          description: "Budapest"
    design:
      spacing:
        padding: [0, 0, 0, 0]
        margin: [0, 0, 0, 0]
      # For full-screen, add `min-h-screen` below
      css_class: "bg-gradient-to-r from-rose-100 to-teal-100"
#      background:
#        color: ""
#        image:
#          # Add your image background to `assets/media/`.
#          filename: ""
#          filters:
#            brightness: 1.0
  - block: countdown
    content:
      title: "Limited Availability"
      text: "All proceeds go to charity."
      text_after: "Do your reservation!"
      date: '2024-11-15 09:00:00'
    design:
      # Section background color (CSS class)
      css_class: "bg-primary-500"
      # Reduce spacing
      spacing:
        padding: ["1rem", 0, "1rem", 0]
  - block: cta-image-paragraph
    id: about
    content:
      items:
        - title: 25TH ANNIVERSARY SYMPOSIUM FOR AI COLLABORATION
          text: The 25th Anniversary Symposium is coming home to Budapest. Join us at the 25th Anniversary Symposium 2024 to explore all the cutting-edge innovation AI could offer.
          # Upload image to `assets/media/` and reference the filename here
          image: city-daniel-abadia.jpg
        - title: DISCOVER
          text: Discover the latest in AI, GenAI, application development and much more.
          # Upload image to `assets/media/` and reference the filename here
          image: conference-headway-F2KRf_QfCqw.jpg
        - title: HEAR FROM LEADERS REDEFINING THE AI LANDSCAPE
          text: Hear valuable insights from data and AI experts and business leaders, while discovering the limitless possibilities of data, AI and application collaboration for your organization.
          # Upload image to `assets/media/` and reference the filename here
          image: round-table-evangeline-shaw-xRlI-L-kvrw.jpg
          button:
            text: Get Tickets
            url: https://www.eventbrite.com/
    design:
      # Section background color (CSS class)
      css_class: "bg-gray-100 dark:bg-gray-900"
  - block: people
    id: speakers
    content:
      title: Speakers
      text: ""
      user_groups: ['Speakers']
    design:
      show_role: true
      show_social: true
      show_interests: false
  - block: markdown
    id: agenda
    content:
      title: Agenda
      text: |
        **DAY 1**
        {style="padding-top: 2rem"}
        {{< table path="schedule.csv" header="true" >}}
        
        **DAY 2**
        {style="padding-top: 2rem"}

        {{< table path="schedule.csv" header="true" >}}
  - block: testimonials
    content:
      title: ""
      text: ""
      items:
        - name: "Alice Smith"
          role: "Researcher at X"
          # Upload image to `assets/media/` and reference the filename here
          image: "testimonial-1.jpg"
          text: "It has to be the most insightful conference I've ever attended!"
    design:
      spacing:
        # Reduce bottom spacing so the testimonial appears vertically centered between sections
        padding: ["6rem", 0, 0, 0]
  - block: logos
    content:
      title: "Sponsors Making This Possible"
      text: "Thanks to the following sponsors for making this incredible event possible!"
      # Image path relative to assets/media/ folder
      logo_folder: 'sponsors/'
    design:
      card:
        # Card background color (CSS class)
        css_class: "bg-primary-700"
        css_style: ""
  - block: newsletter
    content:
      title: "Stay up to date"
      text: "Be the first to receive conference updates such as added speakers, deadlines, and ticket deals."
      text_cta: "Sign up to our newsletter 🔥"
      button:
        text: "Subscribe"
      convertkit:
        form_id: ''
        msg_subscribed: "Success! Please check your email to confirm your subscription."
    design:
      card:
        # Card background color (CSS class)
        css_class: "bg-primary-700"
        css_style: ""
---
