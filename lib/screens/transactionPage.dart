import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';
import 'package:http/http.dart';
import 'package:mad_mad/Models/sidebar.dart';
import 'package:mad_mad/screens/homePage.dart';
import '../colour.dart'; 
class trxConfirm extends StatefulWidget {
  trxConfirm({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _trxConfirm createState() => _trxConfirm();
}

class _trxConfirm extends State<trxConfirm> {
  @override
  Widget build(BuildContext context) {
    String rpcUrl = "http://127.0.0.1:7545";
    String wsUrl = "ws://127.0.0.1:7545/";
    Future<void> sendEther() async {
      Web3Client client = Web3Client(rpcUrl, Client(), socketConnector: () {
        return IOWebSocketChannel.connect(wsUrl).cast<String>();
      });

      String privateKey =
          "85be074b7d980d5547c1777ff46baa45953ab24755baa64d2cf5201f7d655fce";
      Credentials credentials =
          await client.credentialsFromPrivateKey(privateKey);
      EthereumAddress receiver =
          EthereumAddress.fromHex("0x61F7ed85BDd045a178327c9b740e4Fa52402eB5E");

      EthereumAddress ownAddress = await credentials.extractAddress();
      print(ownAddress);

      client.sendTransaction(
          credentials,
          Transaction(
              from: ownAddress,
              to: receiver,
              value: EtherAmount.fromUnitAndValue(EtherUnit.ether, 20)));
    }

    void popUp() {
      sendEther();
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Positioned(
                    right: -40.0,
                    top: -40.0,
                    child: InkResponse(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Form(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          child: Text('Transaction successful. Thank you.'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            child: Text("ok"),
                            color: darkBlue,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color(0xffe7f4f5),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black26,
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
                color: Colors.white38.withOpacity(0.4),
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
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://img.pngio.com/e-learning-100-free-icons-svg-eps-psd-png-files-learn-png-600_564.png'),
                                fit: BoxFit.contain)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(30),
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "English Literature Class",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            fontFamily: 'product'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Hello there! You are about to subscribe to English Literature Class for 18 ETH that will be deducted from your ethereum account!",
                        style: TextStyle(
                          fontFamily: 'circe',
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          width: 500,
                          height: 151,
                          color: yellow,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "Transaction detail: ",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "\nClass: English Literature\nSubscription: 8 classes.\nTotal (ETH): 18",
                                    style: TextStyle(
                                        fontFamily: 'circe',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(darkBlue)),
                            onPressed: () => popUp(),
                            child: Text(
                              'Proceed',
                              style: TextStyle(fontSize: 15),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
