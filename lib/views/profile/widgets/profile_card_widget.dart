import 'package:betweener/core/util/constants.dart';
import 'package:betweener/providers/followers_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileCardWidget extends StatelessWidget {
  final String name;
  final String email;
  final String phoneNumber;
  final String followersCount;
  final Function()? editOnTap;

  const ProfileCardWidget(
      {super.key,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.followersCount,
      required this.editOnTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      height: MediaQuery.of(context).size.height / 5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: kPrimaryColor),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.width / 10,
                backgroundColor: Colors.white,
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    email,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white38,
                        ),
                        child: const Text(
                          'followers',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Consumer<FollowersProvider>(
                        builder: (context, followersProvider, child) {
                          if (followersProvider.state ==
                              FollowersProviderState.loaded) {
                            return Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white38,
                              ),
                              child: Text(
                                followersProvider.followersCount.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
          Align(
              alignment: Alignment.topRight,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: editOnTap,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
