import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          width: screenSize.width,
          height: screenSize.height,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 110,
                top: 40,
                child: Container(
                  width: 154,
                  height: 59,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 37,
                        top: 0,
                        child: DefaultTextStyle(
                          style: TextStyle(
                            color: Color(0xFF1D1517),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0.09,
                          ),
                          child: Text('Hey there,'),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 29,
                        child: DefaultTextStyle(
                          style: TextStyle(
                            color: Color(0xFF1D1517),
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            height: 0.07,
                          ),
                          child: Text('Welcome Back'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 553,
                child: Container(
                  width: 315,
                  height: 60,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x4C95ADFE),
                        blurRadius: 22,
                        offset: Offset(0, 10),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 315,
                          height: 60,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(-1.00, 0.08),
                              end: Alignment(1, -0.08),
                              colors: [Color(0xFF252A3C), Color(0xFF9EA4B3)],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(99),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 118,
                        top: 18,
                        child: Container(
                          width: 79,
                          height: 24,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 2.50,
                                        top: 2,
                                        child: Container(
                                          width: 19,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/login/login.png'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 34,
                                top: 0,
                                child: DefaultTextStyle(
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    height: 0.09,
                                  ),
                                  child: Text('로그인'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 633,
                child: Container(
                  width: 315,
                  height: 18,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 151,
                        top: 0,
                        child: DefaultTextStyle(
                          style: TextStyle(
                            color: Color(0xFF1D1517),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0.12,
                          ),
                          child: Text(
                            'Or',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  left: 93,
                  top: 751,
                  child: DefaultTextStyle(
                    style: TextStyle(
                      color: Color(0xFF1D1517),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0.11,
                    ),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '계정이 아직 없으신가요? ',
                          ),
                          TextSpan(
                            text: '회원가입',
                            style: TextStyle(
                              color: Color(0xFF3F4864),
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              Positioned(
                left: 123,
                top: 671,
                child: Container(
                  width: 130,
                  height: 50,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 50,
                          height: 50,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 0.80,
                                          color: Color(0xFFDDD9DA)),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 15,
                                top: 15,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/login/google.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 80,
                        top: 0,
                        child: Container(
                          width: 50,
                          height: 50,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 0.80,
                                          color: Color(0xFFDDD9DA)),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 13,
                                top: 13,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 24,
                                          height: 24,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                child: Container(
                                                  width: 24,
                                                  height: 24,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/login/kakaotalk.png"),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 129,
                child: Container(
                  width: 315,
                  height: 139,
                  child: Stack(
                    children: [
                      Positioned(
                          left: 97,
                          top: 121,
                          child: DefaultTextStyle(
                            style: TextStyle(
                              color: Color(0xFFACA3A5),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              height: 0.12,
                            ),
                            child: Text(
                              '비밀번호를 잊으셨나요?',
                            ),
                          )),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 315,
                          height: 48,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 315,
                                  height: 48,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF7F8F8),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1, color: Color(0xFFF7F8F8)),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 15,
                                top: 15,
                                child: Container(
                                  width: 61,
                                  height: 18,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 18,
                                          height: 18,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 1.50,
                                                top: 2.25,
                                                child: Container(
                                                  width: 15,
                                                  height: 13.50,
                                                  child: Stack(children: [
                                                    Container(),
                                                  ]),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          left: 28,
                                          top: 0,
                                          child: DefaultTextStyle(
                                            style: TextStyle(
                                              color: Color(0xFFACA3A5),
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              height: 0.12,
                                            ),
                                            child: Text(
                                              'Email',
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 63,
                        child: Container(
                          width: 315,
                          height: 48,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 315,
                                  height: 48,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF7F8F8),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1, color: Color(0xFFF7F8F8)),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 282,
                                top: 15,
                                child: Container(
                                  width: 18,
                                  height: 18,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 2.06,
                                        top: 3.19,
                                        child: Container(
                                          width: 13.87,
                                          height: 11.83,
                                          child: Stack(children: [
                                            Container(),
                                          ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 15,
                                top: 15,
                                child: Container(
                                  width: 86,
                                  height: 18,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 18,
                                          height: 18,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 3.19,
                                                top: 2.06,
                                                child: Container(
                                                  width: 11.42,
                                                  height: 13.87,
                                                  child: Stack(children: [
                                                    Container(),
                                                  ]),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          left: 28,
                                          top: 0,
                                          child: DefaultTextStyle(
                                            style: TextStyle(
                                              color: Color(0xFFACA3A5),
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              height: 0.12,
                                            ),
                                            child: Text(
                                              'Password',
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
