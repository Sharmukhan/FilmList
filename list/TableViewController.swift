//
//  TableViewController.swift
//  list
//
//  Created by Kymbat Sharmukhan on 23.05.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    var arrayFilms = [Films(name: "Невероятная жизнь Уолтера Митти",
                            genre: "Жанр: Приключения",
                            age: "Год выхода: 2013",
                            description: "Уолтер Митти — сотрудник отдела иллюстраций журнала Life. Его работа — сплошная рутина, хотя в своих мечтах он уносится очень далеко. В присланных фотографом Шоном О’Коннелом негативах для обложки журнала не хватает одного кадра. Единственный шанс получить фотографию — найти самого Шона. И Уолтер отправляется в долгое путешествие.",
                           image: "mitti"),
                      Films(name: "6 демонов Эмили Роуз",
                            genre: "Жанр: Ужасы ",
                            age: "Год выхода: 2005",
                            description: "В 1976 году сеанс изгнания дьявола из девушки Эмили Роуз закончился её смертью. Священнику-экзорцисту, проводившему обряд, было предъявлено обвинение в убийстве, хотя процесс был официально инициирован католической церковью. В поисках справедливости священник изучает историю появления на земле демона, погубившего девушку, и пытается доказать в суде факт существования потусторонних сил и их способности вмешиваться в жизнь людей.",
                           image: "rose"),
                      Films(name: "Голая правда",
                            genre: "Жанр: Комедия",
                            age: "Год выхода: 2009",
                            description:"Он - восходящая звезда нового телешоу, и его жизненное кредо — «секс, наркотики и рок-н-ролл», он совсем не признает равенство полов, политкорректность и так далее… В общем, настоящий мачо.",
                           image: "true"),
                      Films(name: "Пеле",
                            genre: "Жанр: Cпорт",
                            age: "Год выхода: 2015",
                           description: "История стремительного восхождения талантливого мальчика Пеле из трущоб Сан-Паулу - от дворовой босоногой команды до победы на Чемпионате мира.",
                           image: "pele"),
                      Films(name: "Спирит",
                            genre: "Жанр: Мультфильм",
                            age: "Год выхода: 2002",
                            description: "История стремительного восхождения талантливого мальчика Пеле из трущоб Сан-Паулу - от дворовой босоногой команды до победы на Чемпионате мира.",
                           image: "spirit")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func addFilm(_ sender: Any) {
        
        arrayFilms.append(Films(name: "Avatar",
                                genre: "Жанр: Фантастика",
                                age: "Год выпуска: 2009",
                                description: "Бывший морпех Джейк Салли прикован к инвалидному креслу. Несмотря на немощное тело, Джейк в душе по-прежнему остается воином. Он получает задание совершить путешествие в несколько световых лет к базе землян на планете Пандора, где корпорации добывают редкий минерал, имеющий огромное значение для выхода Земли из энергетического кризиса.",
                               image: "Avatar"))
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayFilms.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = "\(arrayFilms[indexPath.row].name)"
        
        let label2 = cell.viewWithTag(1001) as! UILabel
        label2.text = "\(arrayFilms[indexPath.row].genre)"
        
        let label3 = cell.viewWithTag(1002) as! UILabel
        label3.text = "\(arrayFilms[indexPath.row].age)"
        
        let image = cell.viewWithTag(1003) as! UIImageView
        image.image = UIImage(named: arrayFilms[indexPath.row].image)
        

        // Configure the cell...

        return cell
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detaileVc = storyboard?.instantiateViewController(identifier: "ditaleViewController") as! ViewController
        navigationController?.show(detaileVc, sender: self)
        
        detaileVc.films = arrayFilms[indexPath.row]
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            arrayFilms.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
