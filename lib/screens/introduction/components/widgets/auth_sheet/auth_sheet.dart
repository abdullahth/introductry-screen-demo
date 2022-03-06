import 'package:flutter/material.dart';
import 'package:intro_example/screens/introduction/components/paints/auth_sheet_paint/auth_sheet_paint.dart';

class AuthSheet extends StatefulWidget {
  final Function() expandCallback;
  bool isExpanded;
  AuthSheet({Key? key, required this.expandCallback, this.isExpanded = true})
      : super(key: key);

  @override
  State<AuthSheet> createState() => _AuthSheetState();
}

class _AuthSheetState extends State<AuthSheet> {
  final TextEditingController emailController = TextEditingController(),
      nameController = TextEditingController(),
      passwordController = TextEditingController(),
      repasswordController = TextEditingController();

  late bool isSignUp, showExtraFields;

  @override
  void initState() {
    isSignUp = true;
    showExtraFields = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SizedBox(
      width: deviceSize.width,
      height: deviceSize.height * 0.8,
      child: CustomPaint(
        painter: AuthSheetPaint(),
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: deviceSize.height * 0.075),
            width: deviceSize.width * 0.8,
            height: deviceSize.height * 0.65,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: InkWell(
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    widget.expandCallback.call();
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(flex: 2),
                      InkWell(
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            if (widget.isExpanded) {
                              widget.expandCallback.call();
                            }
                            isSignUp = true;
                          });
                          Future.delayed(const Duration(milliseconds: 250), () {
                            setState(() {
                              showExtraFields = true;
                            });
                          });
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: isSignUp ? Colors.white : Colors.black45,
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      if (!widget.isExpanded) ...[
                        const Spacer(),
                        InkWell(
                            hoverColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                isSignUp = false;
                              });
                              Future.delayed(const Duration(milliseconds: 250),
                                  () {
                                setState(() {
                                  showExtraFields = false;
                                });
                              });
                            },
                            child: Text('Sign In',
                                style: TextStyle(
                                  color:
                                      !isSignUp ? Colors.white : Colors.black45,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                )))
                      ],
                      const Spacer(flex: 2),
                    ],
                  ),
                )),
                Expanded(
                  flex: 9,
                  child: Column(
                    children: [
                      const Spacer(flex: 2),
                      Expanded(
                          child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                              opacity: showExtraFields ? 1 : 0,
                              child: Material(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Center(
                                        child: TextFormField(
                                            controller: nameController,
                                            decoration: InputDecoration(
                                              hintStyle: TextStyle(
                                                  color: Colors.grey.shade400),
                                              hintText: 'Full Name',
                                              border: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                            ))),
                                  )))),
                      const SizedBox(height: 12),
                      Expanded(
                          child: Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.white,
                              child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Center(
                                      child: TextFormField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade400),
                                      hintText: 'Email',
                                      border: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                    ),
                                  ))))),
                      const SizedBox(height: 12),
                      Expanded(
                          child: Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.white,
                              child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Center(
                                      child: TextFormField(
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade400),
                                      hintText: 'Password',
                                      border: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                    ),
                                  ))))),
                      const SizedBox(height: 12),
                      Expanded(
                          child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                              opacity: showExtraFields ? 1 : 0,
                              child: Material(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Center(
                                        child: TextFormField(
                                            controller: repasswordController,
                                            decoration: InputDecoration(
                                              hintStyle: TextStyle(
                                                  color: Colors.grey.shade400),
                                              hintText: 'Re-Password',
                                              border: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                            ))),
                                  )))),
                      const SizedBox(height: 12),
                      if (!showExtraFields) ...[
                        SizedBox(
                            height: 24,
                            child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                                opacity: !showExtraFields ? 1 : 0,
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          InkWell(
                                              hoverColor: Colors.transparent,
                                              splashColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              focusColor: Colors.transparent,
                                              onTap: () {},
                                              child: const Text(
                                                  'Forgotten Password?',
                                                  style: TextStyle(
                                                      color: Colors.black45)))
                                        ])))),
                      ],
                      const Spacer(),
                      Expanded(
                          child: SizedBox(
                              width: deviceSize.width,
                              child: Material(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: InkWell(
                                      hoverColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      child: Center(
                                          child: Text('Submit',
                                              style: TextStyle(
                                                  color: Colors.blue.shade500,
                                                  fontSize: 20,
                                                  fontWeight:
                                                      FontWeight.w800))))))),
                      SizedBox(height: deviceSize.height * 0.1)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
