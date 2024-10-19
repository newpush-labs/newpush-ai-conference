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
      details: "November 15th, 2024. \n\nArtifical Intelligence and Security /// BUDAPEST /// LUPS"
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
        - title: Inspiring Keynotes and Opening Remarks
          text: The symposium kicks off with thought-provoking opening remarks from distinguished leaders who set the stage for a day of innovation and exploration. Dr. Deli Gergely, Rektor of Ludovika University of Public Service, along with Amb. Dr. Réka Szemerkényi, former Ambassador of Hungary to the USA, will welcome participants to this prestigious event. Keynotes from influential figures such as Kinga Daradics, CEO of eMAG, and Éva Hegedüs, Chairperson and CEO of Gránit Bank, will highlight global challenges and showcase Hungary's pioneering successes in the AI landscape. Expect a blend of insights on leadership, strategic challenges, and the future of AI technology.
          # Upload image to `assets/media/` and reference the filename here
          image: ludovika.jpg
        - title: Dynamic Panels - Navigating AIs Future
          text: Throughout the symposium, engaging panels will address the critical themes shaping the future of AI across various sectors. Industry leaders and experts will discuss how to lead through exponential change, the role of AI in cybersecurity, and the evolving responsibilities of governments, militaries, and civilian organizations in the AI-driven landscape. Sessions will delve into topics such as AI's role in education and the ethical considerations surrounding its development. Moderators like Dr. Réka Szemerkényi, Levente Juhász of Google, and Theodore S. Boone from Corvinus University will guide these discussions, ensuring diverse perspectives are shared.
          # Upload image to `assets/media/` and reference the filename here
          image: conference-headway-F2KRf_QfCqw.jpg
        - title: Technical Track & Hands-On Workshops
          text: Designed for technical enthusiasts and professionals, the tech track features in-depth sessions on the science behind AI and its practical applications. Led by experts like Johannes Bernhardt, Balázs Nagy, and László Rácz, these sessions will provide insights into modern cybersecurity frameworks, AI labs, and hands-on tools for defense strategies. Workshops will offer a closer look at building AI-driven solutions, emphasizing practical, real-world implementations that participants can bring back to their organizations. Expect a mix of technical depth and actionable insights tailored for those keen to deepen their knowledge in AI and cybersecurity.
          # Upload image to `assets/media/` and reference the filename here
          image: abstract.jpg
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

  # - block: markdown
  #   id: agenda
  #   content:
  #     title: Agenda
  #     text: |
  #       **DAY 1**
  #       {style="padding-top: 2rem"}
  #       {{< table path="schedule.csv" header="true" >}}

  #       **DAY 2**
  #       {style="padding-top: 2rem"}

  #       {{< table path="schedule.csv" header="true" >}}

  - block: my-events
    id: events
    content:
      title: Agenda
      room: MAIN AUDITORIUM
      text: | 
        {{< events "events" >}}

  - block: my-events
    id: events
    content:
      title: 
      room: TECH TRACK AUDITORIUM
      text: | 
        {{< events "events2" >}}
  # - block: testimonials
  #   content:
  #     title: ""
  #     text: ""
  #     items:
  #       - name: "Alice Smith"
  #         role: "Researcher at X"
  #         # Upload image to `assets/media/` and reference the filename here
  #         image: "testimonial-1.jpg"
  #         text: "It has to be the most insightful conference I've ever attended!"
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
