//
//  YamiTests.swift
//  YamiTests
//
//  Created by 贾金达 on 3/30/23.
//

import XCTest
@testable import Yami

final class YamiTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testJsonDecode() throws {
        let json = """
        {
        "idMeal":"52768",
        "strMeal":"Apple Frangipan Tart",
        "strDrinkAlternate":null,
        "strCategory":"Dessert",
        "strArea":"British",
        "strInstructions":"Preheat the oven to 200C/180C Fan/Gas 6. Put the biscuits in a large re-sealable freezer bag and bash with a rolling pin into fine crumbs. Melt the butter in a small pan, then add the biscuit crumbs and stir until coated with butter. Tip into the tart tin and, using the back of a spoon, press over the base and sides of the tin to give an even layer. Chill in the fridge while you make the filling. Cream together the butter and sugar until light and fluffy. You can do this in a food processor if you have one. Process for 2-3 minutes. Mix in the eggs, then add the ground almonds and almond extract and blend until well combined. Peel the apples, and cut thin slices of apple. Do this at the last minute to prevent the apple going brown. Arrange the slices over the biscuit base. Spread the frangipane filling evenly on top. Level the surface and sprinkle with the flaked almonds. Bake for 20-25 minutes until golden-brown and set. Remove from the oven and leave to cool for 15 minutes. Remove the sides of the tin. An easy way to do this is to stand the tin on a can of beans and push down gently on the edges of the tin. Transfer the tart, with the tin base attached, to a serving plate. Serve warm with cream, crème fraiche or ice cream.",
        "strMealThumb":"https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg",
        "strTags":"Tart,Baking,Fruity",
        "strYoutube":"https://www.youtube.com/watch?v=rp8Slv4INLk",
        "strIngredient1":"digestive biscuits",
        "strIngredient2":"butter",
        "strIngredient3":"Bramley apples",
        "strIngredient4":"butter, softened",
        "strIngredient5":"caster sugar",
        "strIngredient6":"free-range eggs, beaten",
        "strIngredient7":"ground almonds",
        "strIngredient8":"almond extract",
        "strIngredient9":"flaked almonds",
        "strIngredient10":"",
        "strIngredient11":"",
        "strIngredient12":"",
        "strIngredient13":"",
        "strIngredient14":"",
        "strIngredient15":"",
        "strIngredient16":null,
        "strIngredient17":null,
        "strIngredient18":null,
        "strIngredient19":null,
        "strIngredient20":null,
        "strMeasure1":"175g/6oz",
        "strMeasure2":"75g/3oz",
        "strMeasure3":"200g/7oz",
        "strMeasure4":"75g/3oz",
        "strMeasure5":"75g/3oz",
        "strMeasure6":"2",
        "strMeasure7":"75g/3oz",
        "strMeasure8":"1 tsp",
        "strMeasure9":"50g/1¾oz",
        "strMeasure10":"",
        "strMeasure11":"",
        "strMeasure12":"",
        "strMeasure13":"",
        "strMeasure14":"",
        "strMeasure15":"",
        "strMeasure16":null,
        "strMeasure17":null,
        "strMeasure18":null,
        "strMeasure19":null,
        "strMeasure20":null,
        "strSource":null,
        "strImageSource":null,
        "strCreativeCommonsConfirmed":null,
        "dateModified":null
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        let recipe = try decoder.decode(Recipe.self, from: json)

        print(recipe.strMeal) // Prints "Durian"
    }

    func testLoadFunc() throws {
        var recipelist: RecipeCollection = Yami.load("meals.json")
        print(recipelist.meals[0].strYoutube ?? "")
    }
    
    func testRecipesLoadFunc() throws {
        var recipes: [Recipe] = Yami.loadRecipes("meals.json")
        print(recipes[0].strYoutube ?? "")
    }
    
}
