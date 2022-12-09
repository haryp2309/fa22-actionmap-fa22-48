# frozen_string_literal: true

module SeedData
  def self.states
    # Missing Micronesia and Marshall Islands.
    file_content = File.read(Rails.root.join('lib/assets/states.json'), encoding: 'UTF-8')
    JSON.parse(file_content)
  end

  # Sample seed data for dev environment
  def self.representatives
    [
      {
        name:            'Gavin Newsom',
        news_items:      [
          {
            title:       'Newsom Orders Second Shutdown of Restaurants and Indoor Businesses amid COVID-19',
            description: 'The new order affects 19 California counties with a surging number of coronavirus cases',
            link:        'https://people.com/human-interest/california-gov-gavin-newsom-orders-second-shutdown-of-restaurants-and-indoor-businesses-amid-covid-19/'
          },
          {
            title:       "Newsom warns that young adults are not 'invincible' to Coronavirus",
            description: 'Gov. Gavin Newsom said Monday that the surge in coronavirus cases hitting California was due in part to younger people who might believe “they are invincible” but nonetheless are becoming sick from COVID-19.',
            link:        'https://www.latimes.com/california/story/2020-07-06/young-adult-who-think-they-are-invincible-hit-hard-by-coronavirus-newsom-says'
          }
        ],
        address:         [{
          line1: 'United States Senate',
          line2: '331 Hart Senate Office Building',
          city:  'Berkeley',
          state: 'CA',
          zip:   '20510'
        }],
        political_party: 'Democratic Party',
        photo_url:       'http://bioguide.congress.gov/bioguide/photo/F/F000062.jpg'
      },
      {
        name:            'Alexander Ocasio Cortez',
        news_items:      [
          {
            title:       'What AOC and other House Dems want to do about Climate Change',
            description: 'A new select committee report is perfectly in tune with the growing climate policy alignment on the left around standards, investments, and justice.',
            link:        'https://www.vox.com/energy-and-environment/2020/6/30/21305891/aoc-climate-change-house-democrats-select-committee-report'
          },
          {
            title:       'AOC among Dems who launch a fundraising campaign on a progressive platform',
            description: 'Democratic Reps. Alexandria Ocasio-Cortez of New York, Ilhan Omar of Minnesota, Rashida Tlaib of Michigan and Ayanna Pressley of Massachusetts are launching a joint fundraising committee called the "Squad Victory Fund," the latest effort by the well-known freshmen lawmakers to support one another and their advocacy for progressive priorities.',
            link:        'https://www.cnn.com/2020/07/01/politics/squad-ocasio-cortez-tlaib-omar-pressley/index.html'
          },
          {
            title:       'AOC opts to skip debate citing social distancing rules',
            description: 'New York Rep. Alexandria Ocasio-Cortez insisted Monday she’s “not skipping debates” like her predecessor, Joe Crowley, did to disastrous effect two years ago — even though she is ducking one Wednesday citing social distancing rules despite having been out at a George Floyd protest and other group events this month.',
            link:        'https://nypost.com/2020/06/15/aoc-defends-decision-not-to-attend-wednesdays-debate-in-person/'
          }
        ],
        address:         [{
          line1: 'United States Senate',
          line2: '331 Hart Senate Office Building',
          city:  'Berkeley',
          state: 'CA',
          zip:   '20510'
        }],
        political_party: 'Democratic Party',
        photo_url:       'http://bioguide.congress.gov/bioguide/photo/F/F000062.jpg'
      }
    ]
  end

  def self.events
    [
      {
        name:         'Pride Parade',
        description:  'Annual pride parade',
        start_time:   Time.zone.now + 4.weeks,
        end_time:     Time.zone.now + 4.weeks + 1.hour,
        state_symbol: 'CA',
        fips_code:    1
      },
      {
        name:         'First Fridays',
        description:  'Oakland\'s monthly first Fridays',
        start_time:   Time.zone.now + 4.weeks,
        end_time:     Time.zone.now + 4.weeks + 1.hour,
        state_symbol: 'CA',
        fips_code:    '001'
      },
      {
        name:         'BLM',
        description:  'Black Lives Matter Parade',
        start_time:   Time.zone.now + 4.weeks,
        end_time:     Time.zone.now + 4.weeks + 1.hour,
        state_symbol: 'OR',
        fips_code:    '051'
      },
      {
        name:         'Disability Pride Parade',
        description:  'Celebrate disabled people!',
        start_time:   Time.zone.now + 4.weeks,
        end_time:     Time.zone.now + 4.weeks + 1.hour,
        state_symbol: 'IL',
        fips_code:    '031'
      },
      {
        name:         'Climate Strike',
        description:  'Earth Day march',
        start_time:   Time.zone.now + 4.weeks,
        end_time:     Time.zone.now + 4.weeks + 1.hour,
        state_symbol: 'WA',
        fips_code:    '033'
      }
    ]
  end

  def self.issues
    [
      'Free Speech',
      'Immigration',
      'Terrorism',
      'Social Security and Medicare',
      'Abortion',
      'Student Loans',
      'Gun Control',
      'Unemployment',
      'Climate Change',
      'Homelessness',
      'Racism',
      'Tax Reform',
      'Net Neutrality',
      'Religious Freedom',
      'Border Security',
      'Minimum Wage',
      'Equal Pay'
    ]
  end
end
