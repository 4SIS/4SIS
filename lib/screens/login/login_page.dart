import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375,
          height: 812,
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
                child: Stack(
                  children: [
                    Positioned(
                      left: 37,
                      top: 0,
                      child: Text(
                        'Hey there,',
                        style: TextStyle(
                          color: Color(0xFF1D1517),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0.09,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 29,
                      child: Text(
                        'Welcome Back',
                        style: TextStyle(
                          color: Color(0xFF1D1517),
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 0.07,
                        ),
                      ),
                    ),
                  ],
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
                          height: 24,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2.50, vertical: 2),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 19,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                "https://via.placeholder.com/19x20"),
                                            fit: BoxFit.fill,
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
                                child: Text(
                                  '로그인',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    height: 0.09,
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
                top: 633,
                child: Container(
                  width: 315,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 151,
                        top: 0,
                        child: Text(
                          'Or',
                          style: TextStyle(
                            color: Color(0xFF1D1517),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0.12,
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
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '계정이 아직 없으신가요? ',
                        style: TextStyle(
                          color: Color(0xFF1D1517),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0.11,
                        ),
                      ),
                      TextSpan(
                        text: '회원가입',
                        style: TextStyle(
                          color: Color(0xFF3F4864),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          height: 0.11,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                                      image: NetworkImage(
                                          "https://via.placeholder.com/20x20"),
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
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: double.infinity,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 24,
                                                height: 24,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        "https://via.placeholder.com/24x24"),
                                                    fit: BoxFit.fill,
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
                        child: Text(
                          '비밀번호를 잊으셨나요?',
                          style: TextStyle(
                            color: Color(0xFFACA3A5),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            height: 0.12,
                          ),
                        ),
                      ),
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
                                  height: 18,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 18,
                                          height: 18,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 1.50, vertical: 2.25),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 15,
                                                height: 13.50,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 28,
                                        top: 0,
                                        child: Text(
                                          'Email',
                                          style: TextStyle(
                                            color: Color(0xFFACA3A5),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 0.12,
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
                                  padding: const EdgeInsets.only(
                                    top: 3.19,
                                    left: 2.06,
                                    right: 2.06,
                                    bottom: 2.98,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 13.87,
                                        height: 11.83,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 15,
                                top: 15,
                                child: Container(
                                  height: 18,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 18,
                                          height: 18,
                                          padding: const EdgeInsets.only(
                                            top: 2.06,
                                            left: 3.19,
                                            right: 3.39,
                                            bottom: 2.06,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 11.42,
                                                height: 13.87,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 28,
                                        top: 0,
                                        child: Text(
                                          'Password',
                                          style: TextStyle(
                                            color: Color(0xFFACA3A5),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 0.12,
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
      ],
    );
  }
}
