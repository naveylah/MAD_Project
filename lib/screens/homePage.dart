import 'package:flutter/material.dart';
import 'package:mad_mad/Models/sidebar.dart';
import '../Models/colour.dart';
import 'subjectPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: homePage(),
        routes: {
          "/subjectPage": (context) => subjectPage(),
        },
        initialRoute: "/");
  }
}

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white54,
          ),
        ),
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.white),
              textTheme: TextTheme().apply(bodyColor: Colors.white),
            ),
            child: PopupMenuButton<int>(
              color: Colors.white54,
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text('Profile'),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text('Message'),
                ),
                PopupMenuDivider(),
                PopupMenuItem<int>(
                  value: 2,
                  child: Row(
                    children: [
                      Icon(Icons.logout),
                      const SizedBox(width: 8),
                      Text('Sign Out'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://cdn.pixabay.com/photo/2019/04/10/11/56/watercolour-4116932__340.png"))),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello,",
                    style: TextStyle(fontSize: 13, fontFamily: 'circe'),
                  ),
                  Text(
                    "Qistina Sayara",
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'circe',
                        fontWeight: FontWeight.w700),
                  ),
                  Expanded(child: Container()),
                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                        Expanded(
                          child: TextField(
                            style: TextStyle(fontSize: 14, fontFamily: 'circe'),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search for Courses or Tutors"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              color: lightBlue,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Available Courses",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      TextButton(
                        //style:
                        //  TextStyle(color: Colors.blueAccent, fontSize: 13),
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => subjectPage()),
                          );
                        },
                        child: const Text('See all'),
                      )
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          subjWidget(
                              "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUSEhIVFRUVFhgXFhgXGBgYFRcYFRUXFhUXFxYYHyggGB0lHRcVITEhJSktLi4uFx8zODMtNygtLisBCgoKDg0OGxAQGy8lHyU1Mi0tLS0rLS0tLS0tLS0tLi0tLS0tNS0tLS0vLS0tKy0tLS0tLS0tLS0tLS0tLS0tLf/AABEIAOEA4QMBIgACEQEDEQH/xAAcAAEAAQUBAQAAAAAAAAAAAAAAAgMEBQYHAQj/xABJEAACAQIDAwcGCQoFBQEAAAABAgADEQQSIQUxUQYTQWFxgZEHIjJSobEUNEJzssHR4fAVFiMkM1NikpPSF1VyorNDVHTC8Tb/xAAaAQEAAgMBAAAAAAAAAAAAAAAAAQIDBAUG/8QAPBEAAgECAgUIBwYHAQAAAAAAAAECAxEEIQUSMUFhUXGBkaHB0fATFDNSU7HSIkJykqLhIzI0wtPi8RX/2gAMAwEAAhEDEQA/AO4xEQBIq15FmkkgEoiIAiIgCIkSYBKJC3XJAwD2IiAIiIAiIgCRVri8izSS7oBKIiAIiIAiJEmASiQEkDAPYiIAlNmkyJFVgBVk4iAIiIAiIgCQvaW9XEdC+Mp8wza+0wTYug993slQCYbaG2cNhNa9dFNvRvd7cQgux8JqO1vKkguMNQZ/4qhyr2hRckdtpaMJS2IhnSJjtobcw1A2rV6dM8GYBv5d84ttXlpja9w1cop+TS/RjxHnHvJmvnjxmaOH5WRc+j8DtClWXNRqpUHFGDeNt0u580UKzIwZGZGG5lJVh2EaibTsryhY2jYM61l4VB51up1sb9ZvEsO1sYudulF6w4iaTszym4aoAK6PRPH9pT8VGb/bNmwFalXXPRqpUXipBt1G24zDKDjtRJk0HTJywKMv3bpXoV76HfKk2LiIiCBERAEgsnPCIBGSAgCewBERAEREAREQBERAEtMVV6PGVqtSwv4S3w9O5uej3wSVKaBRmbS2uvRMXidssdKYsOJ1PhuEjtvFZmyDcu/rP3TFyC8Y72Y7bWxKOKYvVU84QBnU5W0Fhe2h7xOdcqNnrhKwphiwZA4JAuLsy2Nt/o7+udWnNPKb8ap/ML/yVJmozlrWuRJKxglcHce6ezHAyoKp6DNvWMZeyLVFG8+Esy5O86SBMawNz5I7Bp4pGquzAK+TKtheyq18xv633ze9hYdcKXWgMgOXN0lrA2uWvxPjNa8mXxap88f+NJtFGqCx693cJyMbX1a1OLla8nlfb9mS+bXS0bNKF4Sdt3evBmx4La4Y5agAv09Hfwl3iKNtRumsTP7GxWdcjb19q/du8JmRikrZovsNUuNeiVpFUA3CUMNikqAlGBsbHtEOSTS3vuK2bzLmIiSQIiIAiIgCIiAIiIAiIgCIlDE1LC3SYBQrvmNh2Ce42sKVPTfuHaemTwtP5XhMFtPF845sfNXQfWYLJXdi0Jnks+T+1UxFY0whAClrk77EDcN2+bKcGnq+0y9SlOnLVmrMmFWM1eLujDTWuVHJMYt1qCqUZUCWy5lIDM3EEHzjN8OATrHf9sots0dDHvEom4u6JbVszlD+Tut8mvTPaGHuvKY8nuJ/eUP5n/smwjlayuy1KYKqzC66HQkDQ7/ETZsPWDorrezqGF9DYi4kxxLlsfYbNfBVKNnNWT4p/I5z/h9iT/1KA7C5t/slWn5OqnysQg7FY+8idIp0mb0QT+OMuU2cx3kD2y3pZmtqxNc5N7EGEpGmHL5mLEkW1IAsBrppxmQo0CGube2ZldnL0kn2SoMCnD2ma1WhGrOM57Yu65/KMkKmqmlvMRK2GrlGDDo9o6RMl8CT1faZquB20tSoaWUqRexuCDlOvZNmNKcouUVdLbwMTqRTSb27DatvY+1EZDrU3H+H5X1DvmF2Hi+bqr6rWVu/ce4/XKONcnKDuG4dp190xGzNppXDtTzeY5Q3FtVsbjq1E8fpHEVVi5VY7KduZXz/AFZrijqYenH0Sg/vX89GR1KJTotdVPEA+IlSetOQIiIAiIgCIiAIiRYwCUSFu2SBgHstqtLMbgjgeqab5SNrsiU1oVnRxU8/IzLplOhK79eicv2PtSvTNU069VM9XM1nZczG92ax1J4mYlVi1JrO3jbsOjQ0fOoqbvbWv0WV+3cd42xiciZF3tp2Dp+ya7U3HsPumnbE5X1qbgYi9VDYNns7AcVY6nsPsm9YLF4fEKxp7wDceiw00NtxEtCWuropicJPCyUZ79jW/vuav5Pj+sP8230lm/vextv6JoHk9+MP82fpLOgzqaU/qX0HIwPsV0lnz1Ub6YPYf/sDH+sjLLswJzjbbyOH7Qa9Wp/rP0jOp7NH6jQ+ap/RnLNoftqn+tveZ1TZvxGh81T+jNWhtZ6PTPsafP3GbGg4CUnxiD5V+zWR2gf0Z7piJs3PPJXM8jggEbjJS3wPoL+Oky4kkHonMNh/Gz21PrnTgJzLYq2xh7an1zo4P2Nb8PiamI9pT5/A2TGLqD12mqcgKRZaije2IIHeFE3Oolxaa75Jso51m6MQ4HUSq6/V3zy2I0fKpKqlsqOn0autrdiVuLtkdiFdRUeVX7rdp1EOost+qVZaYqnrfjK1CpcdYnYOeVYiIAkVN9ZEteTAgHsREASIkp4RAIyQEASNU2BPVCByXlxSZcobfzjd+h1mi4He/wDqPuM7Pys2G+LSmqOqlGLEsSNCtrC00fZfk9xV6udqdP8ASELc5s6+uMu4HgbHqmjh8L6ClKnHNbumV+zl3nocPjqX8JzlZpyvtyyst281sTYtnfClRqmEAapSQMy6HMhIDLl3tcX0GummtptGwuQyUnFSs3OlTcKB5l+gm+rW7h2ynyr5Kvn+G4E81iUBzKLBaq21BG7NbjoenoI28NFwvfea2lsZTxGrCm7pZ348L58/L0GI8mOLWpXYjeKZuOkecnsnSLziXJujWq1TVwZyYmkhc093OAFQy2OhvfceGtt86dyT5UU8YpBHN100qUm0II0JUHW19OI3Hr6GOblU1m75LNd63PlW5nCw0VGFkree3g95sAElPImkZ2cXxWAqM1aqqMadOocxA0F2P4PC4vOl7N+I0Pmqf0ZmKVBVXKqqq6mwAA84ktp1km/bLfG0lWkFVQqrYAAWAABsABuExQp6judLGaQ9ZioatrPLPda2fHzzz2j6HeJiZm8RSzLa9pbps5ekk+yZLHPTsVcD6C/jpMuFMiq2FhuEkRJIJdZ7hOYbFa+MPbU+udNE5jsP42e2p9c6OC9jW/D4mriPaU+fwNvE1bkDh3SnXDqy3xD2zAi/mqLi+8TN7SrFQSrageiN5149H3SwwuMqM1mLILbyb900Yxbi7GxKolK3gb/s3Ec5TsfSGh+o/jhPabZW17DMLsvE5aikHRtD2H75nsYu4yhLyZdXkGN5Glqo/G6VFWCoVZKIgCIiAIiIAlOsPNPZKkQDGzyTqpY28JGCx5IVfRPYfdJyFb0T2H3QScg2XsSpXqZ8NU5rEU05ymw0DFSoyk9FwTqbjoOkvx+vPmT9U2th/SHoitlHX02430NjddRkvJ58Yf5s/SWZ3lbyVXFgVKbc1iaetOqLg6ahWI1twO8eIPU0k1HEtbNnnijTwV3RRT5I8qxiSaFdeZxdPR6Z0zW3sgPiV6OsazP4+sVAtpczmO06tStzZxVHmsXQYq1VGKu4X0D5unXcdosDabPsrbr1xzdQDMuoYaZhuNxx7Jz5wsrm0prWsZj4Y/re6XWMa9IE9NvcZjpkMT+xXu9xmIyF8Jb1KDkk84QOgW++XIiSVRZ/Az01G/HfJ0sJYg5mNpidv1buF6FHtP3WmN165w8TppUasqahe2V9a3Plqv5m7TwjnFScrX4fubkJzDYXxs9tT65mK75VJ4CX2C5MI9NHZ3DMoYgWsLi/SJuaP03UqxqQp0b3VvaWttXuZ7THX0fBOE51LWfu3vv97IxlVCCb7+n7ZCZ/81KX7yp7Psj81KX7yp4j7Jtes4n4S/P/AKmH1ah8V/kf1FvslDYdbC3sm5YvcO2YDYGywjkAkqjE68dwHsvM1i3ubcJkjKUleSs96vftKSUYvVi7pb9nYV8L6PfK0hSWwAk5YoIiIAiIgCIiAIiIBTqUww1lnUokfbLvEAldJSwtT5J7oJLeUq58034H3Sy2jTam9gSFOq6nvHdLGoSQdbm3TIbLqJrvk8+MP82fpLN02vtOnhqL1qpsiDvJ6FUdJJ0E0jkZUFHEMa36Mc2wJbRQQVY3J0GgMtcVjV2jVbFYglNm4QkqDoaz/wCneSdBbgQu9jbqaTjfEN7rLyjSwT/g24stMbjKr0TtDFFKYrVLUaeudqdgFIFtQAN537+kA7NsTYzU0FapcM40QixUHXzuDHTTo91nyYwL4/EflHFLlpJphKJ9EBTo9uojf0nXcFm9VHTcxXsJE0Zyy1fPMbMYq+sYSZDE/sV7vcZXy0v4PESntCopSwIOo0BHXMLyRkvcvREgtQHcQewzB/nbQ9Sv/TP2yJSUdpenRqVL6kW7ciKe2NKxJ/hPsEpc+OMtNrbdpVGDKla9rG9Mjs6esyw/KyepW/pn7Z43H4OrLEzcYtptu6459mznR2qVCo6cbxd7chf7UcFDbh9k23BkGmhG4opH8omgvtRCCMlbUW/Zn7ZYpy5akBTDsAosBlU6dpm7olzwrlrwlnbYuS/iVr4KpVgklaz335OZ8h1Kezl/+IT/ALw/01+yZ7k7tXFY1GejVWyNlYMqqwNgRpl3WO/tnbjjFJ2VOfUvqNGpo6pCOtKUUuLfgb3TARNOnXtJ1/HZKeHp3Nz0e+UNk0a3NlcSVZs3m5ehbC17Aa3vMiiACwm1GWsr2tz7TQkrNq9+KJxESxUREQBERAEREASKteRZpJBAJSxrJla47RL6RZQd4glFpjsPztPr3r28JrR036Wlny15WYjC4gU6QplebVvOUk3JYHcRpoJp+O5WV6uYMKYz78qkdvT0zE60U7M6dHRmIqQU42s81n+xecpsS+KqJhkcU8OSOdqXHnW1sBw7dCeoa2eEwwx9RaVMFMBhjYAXHOsPt47wDfe0xfw9uA8JlMBt6rTRadNKY9VQvE3LNr06mZPWaaX2b9Xbzlv/ACMX97V634G9ooAAAAAFgBoABuAE0rlIP1l7j1bdmRfrvMpsLa1apVKVAuXIzeaLG4KjffrlflHsk1AKiC7KLEesOrrGs3dF4iEK13kmrc2afd5scrSeEqRjqOzas8s+Xz2Go2kqTlTdSVPEGx16xIsLGx0I3g7x3SrhMK9RsqKSfYOsnoE9RJ2TctnHZ25Hnoq7WrtNk5HjzH4XHjbX6pvGBP6Ne/3ma5s3BCjTCDXpJ4k7z+OEsMdisZQplvha2GgHNJcknQazyWJqemxDlBN3eXy3s9Hh6MVRSnKMdVb790Xs428N6vF5y786cZ+/H8lP+2ejlVjf3w/kp/2y3qWK+G+uP1C+G+NDqqf4zp95wvlfTQY6sBoOcfxzkkeJPhNwwm3NoVL82WqFbXKpTIF93yRfcb+yaztDktjatRqhw9W7XJuATrqfbeYKuDryy1euUF/cdLR+Iw2HlKTqJprdGfLf3DXii8faJ0PyJuedxS/JKoT2hmA9hM1b8zMZ/wBvU8BNv5DpXwCVAcBWqPVYEsCFAVRZVsb9Jc3/AIpSngK6km0vzw+o2MdpLDVKEoQd27fdlyp748DqsTUvzrxP+WV/5l+ybDs3ENUpK70mpM17oxBZdSNSNOvvmapRnTV5W6JJ/Js4Ckns+TLyIkCb9kxFicSFuEkDAPYiIAlNjeTInirxgBVkoiAIiIBzrlPyBxOKxL1vhqqrWCKaeqKBotwddSdeuYv/AAqxX/fJ/SP906wZY02ytr3yb8F1IyxrVUrKckuEn4nIqvILEqxU4pbg29A/bKici64ZWGKXzQBqh13jjw906jtrBZhzii5G/rHGYORfgupGRV6rX88vzPxMDsvk/Wp1VrNXUgXGQKfOB33J7BM+Z5Ehu5Vtt3bvzu5Crh0b0kVu0A++eogAsoAHACw9klEXytu89BFs7iYPldfml4Zvqa31zOShj8ItVCjXsekbwQbgiZsNUVOrGb2JmOtBzpuK3mk0TTsL7+nfKoakAbaHs/Hh0zODkvT9dvZ9klV5No2pd79O7XrOk7ctIYdv+Z9TOSsBWX/S78mrLzNYDeK5vffbImUn2zb5omH5M5WPNYmvTL2uKb5cxG6+XfvPjM9T5HPlBfaONB6bVjac6v6CtVlNVLX5Ys36anTgouPajOxMMORrf5jj/wCt90fma3+Y4/8ArfdMXoaHxf0svry93tRmRMnNT/M1v8xx/wDW+6Z/ZmENKktM1KlUqLZ6hzO2pPnHp327pjq06cV9iet0NEqTbzReyCyc8ImEkjJAQBPYAiIgCIiAIiIAiIgCUMRRvqN8rxALOjXtod0o4jZdN/OU5SeG7wl5VoA67jKBosN3sgsuBYHYbeuPAzz8ht648DMhnfrnmd+vwkWJuyx/IjeuPAzz8ht648DL/O/X4Rnfr8IsLssPyG3rjwM9/IjeuPAy+zv1+EZ36/CLC7LH8iN648DPV2Gelx3D75e536/CMz/xRYXZ7QwdOlr08Tv7uEjUqFjbwEktBjv07Zc0qQXdJK3PaS2AEnEQQIiIAiIgCIiAIiIAiIgCIiAIiIAiJQoYhXBKMrAEqSpBAKmzDTpB0tAK8Shz658mZc4GYrcZgpNg2Xfa4IvKFTa2HUlWr0gwNiDUUEHgQTpAL6Jb4nGU6YDVKiIDuLMFB7CZ7QxCOudHVl9ZSCum/UaQCvEtaGPpVDanVpuRrZWVj7DKmJxCU1L1HVFG9mIVR2k6CAVolGpXVVzsyhbXzEgLbjc6Slhto0ahy061NzvsrqxtxsDALuJQSurFlVlLIQGAIJUkXAYDdprrFCurglGVgCVJUggFTZgbdIOloBXiWlDaFF2ypVps3BXUnTfoDJ4nF06YBqVEQHQFmCg9l4BcRKVGsrqGRgyncVIIPYRKsAREQBERAEREAREQBESJMAlEhlkgYB7ERAE0jyTfFa3/AJdb/wBJu81jB8hcDSrjE06LCorlwecqEBje/mlrW1Om6WTVmmCwwn/6Ct/4K/8AKsxW3+TmEO2MJTOHp5K6V3qrbR3ys2ZhxvrN6TZFEYlsWF/TNTFItc2yBs1st7XvbXfpGJ2TSevTxLLerRV1RrmwFQWbzb2OnHiZKlbZyA0nyq4e7bPppRWp+mKrSJCq+igIT8kHdeZqhhTS2VXU4anhjzFcmlTYOoJR9cw3kixmW25sKhiworpmyElLMykEix1UyWA2HQpUGwyIRSfOGUsxuKgswuTcadA3SNb7KQOScjsMtXFbPSnRXDVaS889UuQ2Jp8KagWNwGB13ZuBE2jyp7UomthcHXcrRZjWxBUFmCqGWkMqgk3bN2ZQZtR5KYXLhl5s/qhBoHM2Zba2LXuwJAJB32l5T2RRGJbFhf0z0xTLXJ8xTewF7DW17b7CWc05XBqvk7q0sbswYauq1RRbmXVhoQhD0jY7rDLbrWW/kr2RQHwmsKS85Txdakj285UAWyg9A1PjNxwOxqNGrWrU1yviCrVTckEqCAQpNl3m9t95LZWx6OGFRaK5RUqNVfUm7vbMdToNBpukOW1LeDVuSFZV2ltVWIU56LWJtdQjXbXoGZdesTzyVtfB12Hotiq7KeIIWxEzO3eRmCxbirXo3cC2ZWZCRwbKRftOsyuAwNOjTWjSQJTUWVRu4ntvqSTvvEmmvO4HC+S2FSquAoJRWhXNXnFxTOV5xKbkGmgA1YaAA+qPWm9+VOiXxGz1FFa5L1gKTNlVzlp6Fju+6bMeSOENCnhzSOSk/OJd2Lq2bNcVCc2/rlblByaw2NCDE0y3Nk5bOy2zWzeiRe9hv4SzqJyuCXJfDGnhaaHDphm84mkjB1Ul2N8w3k6MesnU75mJj9i7IpYWitCgpWmpJALMxuxLHViTvJmQmN7QIiJAERIs0A8Y+MkJTAvKsAREQBIyU8IgEZICAJ7AEREAREQBKZa8mRPFWAFElEQBERAEREASAk54RAI2kgIAnsAREQBERAIs0gNZNlvPQIAAnsRAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREAREQBERAEREA//9k=",
                              "English Literature",
                              "Books from Sing Dawn, Captain Nobody and more",
                              "3",
                              "18"),
                          subjWidget(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHqzZdDNllk_NuiTngzqVtcNpEvNKPKsSeZ6nn7tAq-HI9dj-QEBmNxUeAkJRnnwkJuIo&usqp=CAU",
                              "Chemistry",
                              "Learn stoichiometry, thermodynamics, virtual laboratory experiments, and more.",
                              "5",
                              "25"),
                          subjWidget(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSY2DNqayD1IShksvnpl_U12qBKQiL8GUtOF-ib4PmYzRlu--U1QcEODJZM8J1cqiEkgeo&usqp=CAU",
                              "History",
                              "Learn calculus, sets and more",
                              "4",
                              "15"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  InkWell subjWidget(
      String img, String subj, String def, String form, String price) {
    return InkWell(
      onTap: opensubjectPage,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        height: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.white),
        child: Row(
          children: [
            Container(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(30)),
                    child: Container(
                      height: 125,
                      width: 150,
                    ),
                  ),
                  Container(
                    height: 130,
                    padding: EdgeInsets.only(left: 5, top: 5),
                    child: Stack(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          child: RotatedBox(
                            quarterTurns: 2,
                            child: Icon(
                              Icons.star,
                              color: darkBlue,
                              size: 60,
                            ),
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          child: Center(
                            child: Text(
                              "4.5",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    left: 50,
                    child: Hero(
                      tag: img,
                      child: Container(
                        width: 100,
                        height: 130,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage('$img'),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "FORM $form",
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => subjectPage()),
                        );
                      },
                      child: Text('$subj'),
                      // subj,
                      // style:
                      //   TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '$def',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: darkBlue),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "\$$price ETH/session",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void opensubjectPage() {
    Navigator.pushNamed(context, '/subjectPage');
  }
}
