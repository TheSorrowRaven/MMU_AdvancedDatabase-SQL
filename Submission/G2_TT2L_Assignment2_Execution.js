
// Select the database to use.
use('movie_assignment2');

// Q3 Database Creation
db.createCollection('customer',
  {
    validator: {
      $jsonSchema: {
        bsonType: 'object',
        required: ['_id', 'name', 'email', 'contact'],
        properties: {
          name: {
            bsonType: 'string',
            description: 'Enter a name'
          },
          email: {
            bsonType: 'string',
            description: 'Enetr an email'
          },
          contact: {
            bsonType: 'string',
            description: 'Enter a phone number'
          }
        }
      }
    }
  });
db.createCollection('cinema',
  {
    validator: {
      $jsonSchema: {
        bsonType: 'object',
        required: ['_id', 'name', 'address'],
        properties: {
          name: {
            bsonType: 'string',
            description: 'Requires a name'
          },
          halls: {
            bsonType: 'array',
            description: 'Must be an array of numbers to indicate hall number',
            items: {
              bsonType: 'string'
            }
          }
        }
      }
    }
  });
db.createCollection('movie',
  {
    validator: {
      $jsonSchema: {
        bsonType: 'object',
        required: ['_id', 'name', 'language', 'classification'],
        properties: {
          name: {
            bsonType: 'string',
            description: 'Do insert a name'
          },
          release_date: {
            bsonType: 'date',
            description: 'Insert a valid date'
          },
          running_minutes: {
            bsonType: 'int',
            description: 'Give the movie them running minutes'
          },
          genre: {
            bsonType: 'string',
            description: 'Do insert a genre'
          },
          language: {
            bsonType: 'string',
            description: 'Do insert a language'
          },
          classification: {
            bsonType: 'string',
            description: 'Please insert a classification'
          }
        }
      }
    }
  });
db.createCollection('promotion',
  {
    validator: {
      $jsonSchema: {
        bsonType: 'object',
        required: ['_id', 'code'],
        properties: {
          code: {
            bsonType: 'string',
            description: 'Requires a name'
          }
        }
      }
    }
  });
db.createCollection('screening',
  {
    validator: {
      $jsonSchema: {
        bsonType: 'object',
        required: ['_id', 'movie', 'cinema'],
      }
    }
  });
db.createCollection('ticket',
  {
    validator: {
      $jsonSchema: {
        bsonType: 'object',
        required: ['_id', 'customer', 'screening', 'seats', 'nett_price'],
        properties: {
          seats: {
            bsonType: 'array',
            description: 'Must be an array of numbers to indicate seat number',
            items: {
              bsonType: 'string'
            }
          }
        }
      }
    }
  });

// Q4 Sample data
// ObjectID generation
customerIDs = [ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId()];
cinemaIDs = [ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId()];
movieIDs = [ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId()];
promotionIDs = [ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId()];
screeningIDs = [ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId()];
ticketIDs = [ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId(), ObjectId()];
// Customer
db.customer.insertMany(
  [
    {
      "_id": customerIDs[0],
      "name": "Fong Zheng Wei",
      "email": "fongzw@gmail.com",
      "contact": "0123229588",
      "membership": true
    },
    {
      "_id": customerIDs[1],
      "name": "Liew Jiann Shen",
      "email": "ljs0056@gmail.com",
      "contact": "0165846148",
      "membership": true
    },
    {
      "_id": customerIDs[2],
      "name": "Nagaindran",
      "email": "naga@gmail.com",
      "contact": "017565956",
      "membership": false
    },
    {
      "_id": customerIDs[3],
      "name": "Raven Lim",
      "email": "raven1010@gmail.com",
      "contact": "0125668646",
      "membership": false
    },
    {
      "_id": customerIDs[4],
      "name": "Khye Neoh",
      "email": "ky@gmail.com",
      "contact": "012656568",
      "membership": false
    },
    {
      "_id": customerIDs[5],
      "name": "Tee Wei How",
      "email": "twh0001@gmail.com",
      "contact": "0164554458",
      "membership": false
    },
    {
      "_id": customerIDs[6],
      "name": "William Hii",
      "email": "william@gmail.com",
      "contact": "0178565684",
      "membership": true
    },
    {
      "_id": customerIDs[7],
      "name": "David Hooi",
      "email": "david@gmail.com",
      "contact": "017565956",
      "membership": false
    },
    {
      "_id": customerIDs[8],
      "name": "Muthyramy",
      "email": "muthu@gmail.com",
      "contact": "0136985623",
      "membership": true
    },
    {
      "_id": customerIDs[9],
      "name": "Mohd Fariz",
      "email": "farez@gmail.com",
      "contact": "0158765484",
      "membership": true
    }
  ]
);
// Cinema
db.cinema.insertMany(
  [
    {
      "_id": cinemaIDs[0],
      "name": "SSC Cyberjaya",
      "address": {
        "street": "Jalan Teknokrat 1",
        "city": "Cyberjaya",
        "state": "Selangor"
      },
      "halls": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    },
    {
      "_id": cinemaIDs[1],
      "name": "SSC Puchong",
      "address": {
        "street": "Jalan Besar 5",
        "city": "Puchong",
        "state": "Selangor"
      },
      "halls": ["1", "2", "3", "4", "5", "6", "7", "8"]
    },
    {
      "_id": cinemaIDs[2],
      "name": "Malacca City",
      "address": {
        "street": "Jalan Hang Tuah 2",
        "city": "Melaka City",
        "state": "Melaka"
      },
      "halls": ["1", "2", "3", "4", "5", "6"]
    },
    {
      "_id": cinemaIDs[3],
      "name": "SSC Georgetown",
      "address": {
        "street": "Jalan Swenson 3",
        "city": "Georgetown",
        "state": "Penang"
      },
      "halls": ["1", "2", "3", "4", "5", "6"]
    },
    {
      "_id": cinemaIDs[4],
      "name": "SSC Johor",
      "address": {
        "street": "Jalan Ismail 4",
        "city": "Johor Bahru",
        "state": "Johor"
      },
      "halls": ["1", "2", "3", "4", "5", "6", "7", "8"]
    },
    {
      "_id": cinemaIDs[5],
      "name": "SSC Kuala Lumpur",
      "address": {
        "street": "Jalan Lumpur 6/9",
        "city": "Kuala Lumpur",
        "state": "Kuala Lumpur"
      },
      "halls": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    },
    {
      "_id": cinemaIDs[6],
      "name": "SSC Kuantan",
      "address": {
        "street": "Jalan Timur 1/1",
        "city": "Kuantan",
        "state": "Pahang"
      },
      "halls": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    },
    {
      "_id": cinemaIDs[7],
      "name": "SSC Ipoh",
      "address": {
        "street": "Jalan Sultan Idris 1",
        "city": "Ipoh",
        "state": "Perak"
      },
      "halls": ["1", "2", "3", "4", "5", "6"]
    },
    {
      "_id": cinemaIDs[8],
      "name": "SSC Seremban",
      "address": {
        "street": "Jalan Timur 1/1",
        "city": "Kuantan",
        "state": "Pahang"
      },
      "halls": ["1", "2", "3", "4"]
    },
    {
      "_id": cinemaIDs[9],
      "name": "SSC Ipoh",
      "address": {
        "street": "Jalan Melati 7",
        "city": "Seremban",
        "state": "Negeri Sembilan"
      },
      "halls": ["1", "2", "3", "4", "5", "6", "7", "8"]
    }
  ]
);
// Movie
db.movie.insertMany(
  [
    {
      "_id": movieIDs[0],
      "name": "The Super Mario Bros Movie",
      "release_date": new Date("2023-04-20"),
      "running_minutes": 93,
      "genre": "Animation",
      "language": "English",
      "classification": "P12",
      "categories": [
        {
          "name": "2D",
          "price": 16.50
        }
      ]
    },
    {
      "_id": movieIDs[1],
      "name": "Guardian of the Galaxy",
      "release_date": new Date("2023-05-05"),
      "running_minutes": 150,
      "genre": "Action",
      "language": "English",
      "classification": "P12",
      "categories": [
        {
          "name": "2D",
          "price": 16.50
        },
        {
          "name": "IMAX",
          "price": 23.50
        }
      ]
    },
    {
      "_id": movieIDs[2],
      "name": "Ponniyin Selvan Part 2",
      "release_date": new Date("2023-04-28"),
      "running_minutes": 165,
      "genre": "Historical",
      "language": "Tamil",
      "classification": "P12",
      "categories": [
        {
          "name": "2D",
          "price": 16.50
        },
        {
          "name": "IMAX",
          "price": 23.50
        }
      ]
    },
    {
      "_id": movieIDs[3],
      "name": "VII XII",
      "release_date": new Date("2023-05-04"),
      "running_minutes": 86,
      "genre": "Action",
      "language": "Malay",
      "classification": "13",
      "categories": [
        {
          "name": "2D",
          "price": 16.50
        },
        {
          "name": "IMAX",
          "price": 23.50
        }
      ]
    },
    {
      "_id": movieIDs[4],
      "name": "Flashover",
      "release_date": new Date("2023-04-28"),
      "running_minutes": 75,
      "genre": "Action",
      "language": "Mandarin",
      "classification": "P12",
      "categories": [
        {
          "name": "2D",
          "price": 16.50
        },
        {
          "name": "IMAX",
          "price": 23.50
        }
      ]
    },
    {
      "_id": movieIDs[5],
      "name": "The Ghost Station",
      "release_date": new Date("2023-05-04"),
      "running_minutes": 71,
      "genre": "Horror",
      "language": "Korean",
      "classification": "13",
      "categories": [
        {
          "name": "2D",
          "price": 16.50
        },
        {
          "name": "IMAX",
          "price": 23.50
        }
      ]
    },
    {
      "_id": movieIDs[6],
      "name": "Beautiful Disaster",
      "release_date": new Date("2023-05-04"),
      "running_minutes": 95,
      "genre": "Romance",
      "language": "English",
      "classification": "18",
      "categories": [
        {
          "name": "2D",
          "price": 16.50
        },
        {
          "name": "IMAX",
          "price": 23.50
        }
      ]
    },
    {
      "_id": movieIDs[7],
      "name": "John Wick 4",
      "release_date": new Date("2023-03-23"),
      "running_minutes": 170,
      "genre": "Action",
      "language": "English",
      "classification": "18",
      "categories": [
        {
          "name": "2D",
          "price": 16.50
        },
        {
          "name": "IMAX",
          "price": 23.50
        }
      ]
    },
    {
      "_id": movieIDs[8],
      "name": "Suzume",
      "release_date": new Date("2023-03-09"),
      "running_minutes": 120,
      "genre": "Animation",
      "language": "Japanese",
      "classification": "P12",
      "categories": [
        {
          "name": "2D",
          "price": 16.50
        }
      ]
    },
    {
      "_id": movieIDs[9],
      "name": "The First Slam Dunk",
      "release_date": new Date("2023-02-23"),
      "running_minutes": 125,
      "genre": "Animation",
      "language": "Japanese",
      "classification": "13",
      "categories": [
        {
          "name": "2D",
          "price": 16.50
        }
      ]
    }
  ]
);
// Promotion
db.promotion.insertMany(
  [
    {
      "_id": promotionIDs[0],
      "code": "",
      "description": "No promotion",
      "discount": 0.00,
      "promo_start": new Date("2000-01-01"),
      "promo_end": new Date("2999-12-31")
    },
    {
      "_id": promotionIDs[1],
      "code": "NEWSSC",
      "description": "Newcomer discount",
      "discount": 10.00,
      "promo_start": new Date("2023-05-11"),
      "promo_end": new Date("2023-06-11")
    },
    {
      "_id": promotionIDs[2],
      "code": "MAYBANK5",
      "description": "Maybank Promo",
      "discount": 5.00,
      "promo_start": new Date("2023-05-20"),
      "promo_end": new Date("2023-05-31")
    },
    {
      "_id": promotionIDs[3],
      "code": "MAY",
      "description": "Super Saver May",
      "discount": 5.50,
      "promo_start": new Date("2023-05-01"),
      "promo_end": new Date("2023-05-31")
    },
    {
      "_id": promotionIDs[4],
      "code": "ALLIANZ",
      "description": "AllianzBank Promo",
      "discount": 8.00,
      "promo_start": new Date("2023-05-25"),
      "promo_end": new Date("2023-06-05")
    },
    {
      "_id": promotionIDs[5],
      "code": "STUDENT",
      "description": "Student Price Promo",
      "discount": 7.50,
      "promo_start": new Date("2023-05-01"),
      "promo_end": new Date("2023-07-31")
    },
    {
      "_id": promotionIDs[6],
      "code": "JUNE6",
      "description": "June Fiesta",
      "discount": 6.60,
      "promo_start": new Date("2023-06-01"),
      "promo_end": new Date("2023-06-30")
    },
    {
      "_id": promotionIDs[7],
      "code": "SSCANNIVERSARY",
      "description": "SSC Anniversary",
      "discount": 10.00,
      "promo_start": new Date("2023-06-20"),
      "promo_end": new Date("2023-06-25")
    },
    {
      "_id": promotionIDs[8],
      "code": "ALLYEAR",
      "description": "All year discount",
      "discount": 5.00,
      "promo_start": new Date("2023-01-01"),
      "promo_end": new Date("2023-12-31")
    },
    {
      "_id": promotionIDs[9],
      "code": "HOLIDAY",
      "description": "Holiday Discount",
      "discount": 11.50,
      "promo_start": new Date("2023-12-01"),
      "promo_end": new Date("2023-12-15")
    }
  ]
);
// Screening
db.screening.insertMany(
  [
    {
      "_id": screeningIDs[0],
      "movie": movieIDs[9],
      "category": "2D",
      "cinema": cinemaIDs[3],
      "hall": "9",
      "time": new Date("2023-05-10T10:30:00")
    },
    {
      "_id": screeningIDs[1],
      "movie": movieIDs[0],
      "category": "2D",
      "cinema": cinemaIDs[4],
      "hall": "6",
      "time": new Date("2023-05-10T11:45:00")
    },
    {
      "_id": screeningIDs[2],
      "movie": movieIDs[8],
      "category": "2D",
      "cinema": cinemaIDs[2],
      "hall": "3",
      "time": new Date("2023-05-10T13:15:00")
    },
    {
      "_id": screeningIDs[3],
      "movie": movieIDs[1],
      "category": "2D",
      "cinema": cinemaIDs[4],
      "hall": "5",
      "time": new Date("2023-05-10T15:30:00")
    },
    {
      "_id": screeningIDs[4],
      "movie": movieIDs[7],
      "category": "IMAX",
      "cinema": cinemaIDs[1],
      "hall": "1",
      "time": new Date("2023-05-10T18:10:00")
    },
    {
      "_id": screeningIDs[5],
      "movie": movieIDs[2],
      "category": "2D",
      "cinema": cinemaIDs[2],
      "hall": "1",
      "time": new Date("2023-05-11T11:45:00")
    },
    {
      "_id": screeningIDs[6],
      "movie": movieIDs[6],
      "category": "IMAX",
      "cinema": cinemaIDs[3],
      "hall": "4",
      "time": new Date("2023-05-11T14:20:00")
    },
    {
      "_id": screeningIDs[7],
      "movie": movieIDs[3],
      "category": "2D",
      "cinema": cinemaIDs[1],
      "hall": "8",
      "time": new Date("2023-05-11T16:30:00")
    },
    {
      "_id": screeningIDs[8],
      "movie": movieIDs[5],
      "category": "IMAX",
      "cinema": cinemaIDs[4],
      "hall": "7",
      "time": new Date("2023-05-11T19:35:00")
    },
    {
      "_id": screeningIDs[9],
      "movie": movieIDs[4],
      "category": "2D",
      "cinema": cinemaIDs[3],
      "hall": "9",
      "time": new Date("2023-05-11T22:00:00")
    }
  ]
);
// Ticket
db.ticket.insertMany(
  [
    {
      "_id": ticketIDs[0],
      "customer": customerIDs[0],
      "screening": screeningIDs[6],
      "promotion": promotionIDs[0],
      "seats": ["3D", "3E"],
      "nett_price": 47.00
    },
    {
      "_id": ticketIDs[1],
      "customer": customerIDs[6],
      "screening": screeningIDs[3],
      "promotion": promotionIDs[1],
      "seats": ["2F"],
      "nett_price": 6.50
    },
    {
      "_id": ticketIDs[2],
      "customer": customerIDs[2],
      "screening": screeningIDs[4],
      "promotion": promotionIDs[7],
      "seats": ["5G", "5H", "5I"],
      "nett_price": 60.50
    },
    {
      "_id": ticketIDs[3],
      "customer": customerIDs[1],
      "screening": screeningIDs[5],
      "promotion": promotionIDs[0],
      "seats": ["2A"],
      "nett_price": 16.50
    },
    {
      "_id": ticketIDs[4],
      "customer": customerIDs[8],
      "screening": screeningIDs[1],
      "promotion": promotionIDs[0],
      "seats": ["6C", "6D"],
      "nett_price": 33.00
    },
    {
      "_id": ticketIDs[5],
      "customer": customerIDs[3],
      "screening": screeningIDs[6],
      "promotion": promotionIDs[2],
      "seats": ["4F", "4G", "4H", "4I", "4J", "4K"],
      "nett_price": 136.00
    },
    {
      "_id": ticketIDs[6],
      "customer": customerIDs[6],
      "screening": screeningIDs[9],
      "promotion": promotionIDs[0],
      "seats": ["1H"],
      "nett_price": 16.50
    },
    {
      "_id": ticketIDs[7],
      "customer": customerIDs[4],
      "screening": screeningIDs[7],
      "promotion": promotionIDs[4],
      "seats": ["3A", "3B"],
      "nett_price": 25.00
    },
    {
      "_id": ticketIDs[8],
      "customer": customerIDs[9],
      "screening": screeningIDs[4],
      "promotion": promotionIDs[0],
      "seats": ["7G", "7H", "7I", "7J"],
      "nett_price": 94.00
    },
    {
      "_id": ticketIDs[9],
      "customer": customerIDs[8],
      "screening": screeningIDs[3],
      "promotion": promotionIDs[3],
      "seats": ["5F"],
      "nett_price": 11.00
    }
  ]
);

// Q5 NoSQL
// i) Logical Operation
db.movie.find({
  $and: [
    { $or: [{ genre: "Action" }, { genre: "Animation" }] },
    { language: { $not: { $eq: "Japanese" } } },
    { release_date: { $gt: ISODate("2023-04-25T00:00:00.000Z") } }
  ]
});
// ii) Comparison Operation
db.promotion.find({
  $and: [
    { discount: { $gte: 10 } },
    { promo_start: { $gt: ISODate('2023-05-01T00:00:00Z') } },
    { promo_end: { $lte: ISODate('2023-06-31T00:00:00Z') } },
  ]
});
// iii) Aggregate Operation
db.ticket.aggregate(
  [
    {
      $group: {
        _id: "$customer",
        totalTicketSales: { $sum: "$nett_price" },
        averageTicketSales: { $avg: "$nett_price" },
      }
    }
  ]
);

// Q6 Update
// BEFORE
db.customer.findOne(
  {
    name: "Fong Zheng Wei"
  }
);
db.customer.updateOne(
  {
    email: "fongzw@gmail.com",
    contact: "0123229588"
  },
  {
    $set: {
      name: "Zheng Wei Fong",
      email: "zhengweifong@gmail.com",
      contact: "015484565865",
      membership: true
    }
  }
);
// AFTER
db.customer.findOne(
  {
    name: "Zheng Wei Fong"
  }
);

// Q7 Delete
// BEFORE
db.movie.distinct('_id', {}, {});
db.movie.deleteMany(
  { release_date: { $lte: ISODate("2023-03-31T00:00:00.000Z") } }
);
// AFTER
db.movie.distinct('_id', {}, {});

use('admin');
db.createUser(
  {
    user: "ZhengWeiSenpai",
    pwd: "myverysecurepassword", // or cleartext password
    roles: [
      { role: "readWrite", db: "movie_assignment2" }
    ]
  }
);

db.cinema.aggregate([
  {
    $lookup: {
      from: "screening",
      localField: "_id",
      foreignField: "cinema",
      as: "onScreen"
    }
  },
  {
    $project: { "onScreen.movie.name": 1, "onScreen.category": 1 }
  }
]);
