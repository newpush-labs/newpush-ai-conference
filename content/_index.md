---
title: 'Home'
date: 2023-10-24
type: landing
share: true
design:
  # Default section spacing
  spacing: "6rem"

sections:
  - block: hero-with-stats
    content:
      title: BAISS Budapest AI Security Symposium
      text: "**THRIVING INTO THE EXPONENTIAL AGE**"
      details: "November 15th, 2024. \n\n <a href='https://ludovika-campus.uni-nke.hu/campusaink/ludovika-campus/orczy-uti-kollegium'><u>LUDOVIKA UNIVERSITY OF PUBLIC SERVICE</u></a>\n\n<a href='https://www.google.com/maps/place/Nemzeti+K%C3%B6zszolg%C3%A1lati+Egyetem+Orczy+%C3%9Ati+Koll%C3%A9gium/@47.4800445,19.0894145,253m/data=!3m1!1e3!4m6!3m5!1s0x4741dce5d67d27e3:0x35bcfe5ad94d3aeb!8m2!3d47.4796629!4d19.0896636!16s%2Fg%2F11cs1w8xq8?entry=ttu&g_ep=EgoyMDI0MTExMS4wIKXMDSoASAFQAw%3D%3D'><u>1089 Budapest, Orczy út 1.</u></a>"
      primary_action:
        text: Get Tickets
        url: https://www.tixtree.com/e/25th-anniversary-symposium-artificial-intelligence-and-security-thriving-in-the-exponential-age-5e371b274895
        icon: ticket
      items:
        - name: "Speakers"
          description: "20+"
        - name: "Attendees"
          description: "200+"
        - name: "Location"
          description: "Ludovika Campus"
        - name: "Address"
          description: "1089 Budapest, Orczy út 1."
    design:
      spacing:
        padding: [0, 0, 0, 0]
        margin: [0, 0, 0, 0]
      # For full-screen, add `min-h-screen` below
      # css_class: "bg-gradient-to-r from-rose-100 to-teal-100"
      background:
        image:
          # Add your image background to `assets/media/`.
          filename: "newsletter_background.jpg"
          filters:
            brightness: 1.0
  - block: countdown
    content:
      title: "Exclusive Opportunity"
      text: "Secure your spot now<br> and support a great cause!"
      text_after: "[Reserve your place today!](https://www.tixtree.com/e/25th-anniversary-symposium-artificial-intelligence-and-security-thriving-in-the-exponential-age-5e371b274895)"
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
            url: https://www.tixtree.com/e/25th-anniversary-symposium-artificial-intelligence-and-security-thriving-in-the-exponential-age-5e371b274895
    design:
      # Section background color (CSS class)
      css_class: "bg-gray-100 dark:bg-gray-900"
  - block: speakers
    id: speakers
    content:
      title: Speakers
      text: ""
      user_groups: ['Speakers']
    design:
      show_role: true
      show_social: true
      show_interests: false

  - block: my-events
    id: agenda
    content:
      title: Agenda
      room: MAIN AUDITORIUM
      text: | 
        {{< events "events" >}}
    design:
      spacing:
        # Reduce bottom spacing so the testimonial appears vertically centered between sections
        padding: ["1rem", 0, 0, 0]
  - block: my-events
    id: agenda2
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
        padding: ["1rem", 0, 0, 0]
  - block: logos
    content:
      title: "Sponsors Making This Possible"
      text: "Thanks to the following sponsors for making this incredible event possible! Your generous contributions help us support this event, with all proceeds going to charity for children in Ukraine. We couldn't have done it without your support!"
      # Image path relative to assets/media/ folder
      logo_folder: 'sponsors/'
    design:
      card:
        # Card background color (CSS class)
        css_class: "bg-primary-700"
        css_style: ""
      spacing:
        padding: ["1rem", 0, 0, 0]

  # - block: newsletter
  #   content:
  #     title: "Stay up to date"
  #     text: "Be the first to receive conference updates such as added speakers, deadlines, and ticket deals."
  #     text_cta: "Sign up to our newsletter 🔥"
  #     button:
  #       text: "Subscribe"
  #     convertkit:
  #       form_id: ''
  #       msg_subscribed: "Success! Please check your email to confirm your subscription."
  #   design:
  #     card:
  #       # Card background color (CSS class)
  #       css_class: "bg-primary-700"
  #       css_style: ""
---
