// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import '../models/flashcard.dart';
// import 'edit_flashcard_screen.dart';

// class FlashcardScreen extends StatefulWidget {
//   const FlashcardScreen({super.key});
//   @override
//   State<FlashcardScreen> createState() => _FlashcardScreenState();
// }

// class _FlashcardScreenState extends State<FlashcardScreen> {
//   final Box<Flashcard> flashcardBox = Hive.box<Flashcard>('flashcards');
//   int currentIndex = 0;
//   bool showAnswer = false;

//   void _nextCard() {
//     setState(() {
//       if (currentIndex < flashcardBox.length - 1) currentIndex++;
//       showAnswer = false;
//     });
//   }

//   void _prevCard() {
//     setState(() {
//       if (currentIndex > 0) currentIndex--;
//       showAnswer = false;
//     });
//   }

//   bool confirmDelete = false;
//   void _deleteCard(int index) {
//     if (confirmDelete) flashcardBox.deleteAt(index);
//     setState(() {
//       if (currentIndex >= flashcardBox.length) currentIndex--;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Flashcards',
//           style: TextStyle(fontWeight: FontWeight.w900),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(
//               Icons.add,
//               size: 40,
//               shadows: [],
//               applyTextScaling: true,
//               color: Colors.blueAccent,
//             ),
//             onPressed: () async {
//               await Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (_) => const EditFlashcardScreen()));
//               setState(() {});
//             },
//           ),
//         ],
//       ),
//       body: ValueListenableBuilder(
//         valueListenable: flashcardBox.listenable(),
//         builder: (context, Box<Flashcard> box, _) {
//           if (box.isEmpty) {
//             return const Center(child: Text('No flashcards. Tap + to add.'));
//           }
//           final card = box.getAt(currentIndex)!;
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 Text(
//                   'Card ${currentIndex + 1} of ${box.length}',
//                   style: const TextStyle(
//                       fontSize: 18,
//                       letterSpacing: 2.0,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 const SizedBox(height: 20),
//                 Card(
//                   elevation: 4,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(0)),
//                   child: Container(
//                     color: Colors.white,
//                     padding: const EdgeInsets.all(24),
//                     height: 200,
//                     alignment: Alignment.center,
//                     child: Text(
//                       showAnswer ? card.answer : card.question,
//                       style: const TextStyle(
//                           fontSize: 20, color: Colors.blueAccent),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: () => setState(() => showAnswer = !showAnswer),
//                   child: Text(
//                     showAnswer ? 'Hide Answer' : 'Show Answer',
//                     style: const TextStyle(color: Colors.blueAccent),
//                   ),
//                 ),
//                 const Spacer(),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     // IconButton(
//                     //   icon: const Icon(Icons.arrow_back),
//                     //   onPressed: _prevCard,
//                     // ),
//                     ElevatedButton(
//                       child: Text(
//                         'Previous',
//                         style:
//                             const TextStyle(fontSize: 16, color: Colors.black),
//                       ),
//                       onPressed: _prevCard,
//                     ),
//                     IconButton(
//                       icon: const Icon(
//                         Icons.edit,
//                         color: Colors.blueAccent,
//                       ),
//                       onPressed: () async {
//                         await Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => EditFlashcardScreen(
//                               flashcard: card,
//                               index: currentIndex,
//                             ),
//                           ),
//                         );
//                         setState(() {});
//                       },
//                     ),

//                     IconButton(
//                       icon: const Icon(
//                         Icons.delete,
//                         color: Colors.blueAccent,
//                       ),
//                       onPressed: () => _deleteCard(currentIndex),
//                     ),
//                     // IconButton(
//                     //   icon: const Icon(Icons.arrow_forward),
//                     //   onPressed: _nextCard,
//                     // ),
//                     ElevatedButton(
//                         onPressed: _nextCard,
//                         child: Text(
//                           'Next',
//                           style: const TextStyle(
//                               fontSize: 16, color: Colors.black),
//                         ))
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import '../models/flashcard.dart';
// import 'edit_flashcard_screen.dart';

// class FlashcardScreen extends StatefulWidget {
//   const FlashcardScreen({super.key});
//   @override
//   State<FlashcardScreen> createState() => _FlashcardScreenState();
// }

// class _FlashcardScreenState extends State<FlashcardScreen> {
//   final Box<Flashcard> flashcardBox = Hive.box<Flashcard>('flashcards');
//   int currentIndex = 0;
//   bool showAnswer = false;

//   void _nextCard() {
//     setState(() {
//       if (currentIndex < flashcardBox.length - 1) currentIndex++;
//       showAnswer = false;
//     });
//   }

//   void _prevCard() {
//     setState(() {
//       if (currentIndex > 0) currentIndex--;
//       showAnswer = false;
//     });
//   }

//   bool confirmDelete = false;
//   void _deleteCard(int index) {
//     if (confirmDelete) flashcardBox.deleteAt(index);
//     setState(() {
//       if (currentIndex >= flashcardBox.length) currentIndex--;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Flashcards',
//           style: TextStyle(fontWeight: FontWeight.w900),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(
//               Icons.add,
//               size: 40,
//               color: Colors.blueAccent,
//             ),
//             onPressed: () async {
//               await Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => const EditFlashcardScreen(),
//                 ),
//               );
//               setState(() {});
//             },
//           ),
//         ],
//       ),
//       body: ValueListenableBuilder(
//         valueListenable: flashcardBox.listenable(),
//         builder: (context, Box<Flashcard> box, _) {
//           if (box.isEmpty) {
//             return const Center(
//               child: Text('No flashcards. Tap + to add.'),
//             );
//           }

//           final card = box.getAt(currentIndex)!;

//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 Text(
//                   'Card ${currentIndex + 1} of ${box.length}',
//                   style: theme.textTheme.titleMedium?.copyWith(
//                     letterSpacing: 2.0,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Card(
//                   elevation: 4,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(0),
//                   ),
//                   child: Container(
//                     padding: const EdgeInsets.all(24),
//                     height: 200,
//                     alignment: Alignment.center,
//                     color: colorScheme.surface, // adaptive surface color
//                     child: Text(
//                       showAnswer ? card.answer : card.question,
//                       style: theme.textTheme.headlineSmall?.copyWith(
//                         color: colorScheme.primary,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: colorScheme.secondaryContainer,
//                   ),
//                   onPressed: () => setState(() => showAnswer = !showAnswer),
//                   child: Text(
//                     showAnswer ? 'Hide Answer' : 'Show Answer',
//                     style: TextStyle(color: colorScheme.primary),
//                   ),
//                 ),
//                 const Spacer(),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: colorScheme.surfaceVariant,
//                       ),
//                       onPressed: _prevCard,
//                       child: Text(
//                         'Previous',
//                         style: TextStyle(color: colorScheme.onSurface),
//                       ),
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.edit, color: colorScheme.primary),
//                       onPressed: () async {
//                         await Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => EditFlashcardScreen(
//                               flashcard: card,
//                               index: currentIndex,
//                             ),
//                           ),
//                         );
//                         setState(() {});
//                       },
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.delete, color: colorScheme.error),
//                       onPressed: () => _deleteCard(currentIndex),
//                     ),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: colorScheme.surfaceVariant,
//                       ),
//                       onPressed: _nextCard,
//                       child: Text(
//                         'Next',
//                         style: TextStyle(color: colorScheme.onSurface),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:startapp_sdk/startapp.dart';
import '../models/flashcard.dart';
import 'edit_flashcard_screen.dart';

class FlashcardScreen extends StatefulWidget {
  const FlashcardScreen({super.key});

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  final Box<Flashcard> flashcardBox = Hive.box<Flashcard>('FlashCards');
  int currentIndex = 0;
  bool showAnswer = false;
  bool isCardFlipping = false;
  final startAppSdk = StartAppSdk();
  StartAppBannerAd? mrecAd;
  StartAppNativeAd? nativeAd;
  bool showNativeAd = false;

  StartAppInterstitialAd? interstitialAd;
  StartAppRewardedVideoAd? rewardedVideoAd;
  int _coins = 0; // Track coins
  final Box _coinBox = Hive.box('userData'); // Store coins persistently

  @override
  void initState() {
    super.initState();
    _loadCoins();
    // startAppSdk.setTestAdsEnabled(true);
    startAppSdk.loadBannerAd(StartAppBannerType.MREC).then((mrecAd) {
      setState(() {
        this.mrecAd = mrecAd;
      });
    }).onError<StartAppException>((error, stackTrace) {
      // handle error
      print("Failed to load MREC: $error");
    });
    Future.delayed(Duration(seconds: 4), () {
      loadInterstitialAd();
    });
    Future.delayed(Duration(seconds: 7), () {
      loadRewardedVideoAd();
    });
    Future.delayed(Duration(seconds: 10), () {
      _loadNativeAd();
    });
  }

  void loadRewardedVideoAd() {
    startAppSdk.loadRewardedVideoAd(
      onAdNotDisplayed: () {
        debugPrint('onAdNotDisplayed: rewarded video');

        setState(() {
          // NOTE rewarded video ad can be shown only once
          this.rewardedVideoAd?.dispose();
          this.rewardedVideoAd = null;
        });
      },
      onAdHidden: () {
        debugPrint('onAdHidden: rewarded video');

        setState(() {
          // NOTE rewarded video ad can be shown only once
          this.rewardedVideoAd?.dispose();
          this.rewardedVideoAd = null;
        });
      },
      onVideoCompleted: () {
        debugPrint(
            'onVideoCompleted: rewarded video completed, user gain a reward');

        setState(() {
          // TODO give reward to user
        });
      },
    ).then((rewardedVideoAd) {
      setState(() {
        this.rewardedVideoAd = rewardedVideoAd;
      });
    }).onError((ex, stackTrace) {
      debugPrint("Error loading Rewarded Video ad: ${ex}");
    }).onError((error, stackTrace) {
      debugPrint("Error loading Rewarded Video ad: $error");
    });
  }

  void loadInterstitialAd() {
    startAppSdk.loadInterstitialAd().then((interstitialAd) {
      setState(() {
        this.interstitialAd = interstitialAd;
      });
    }).onError((ex, stackTrace) {
      debugPrint("Error loading Interstitial ad: ${ex}");
    }).onError((error, stackTrace) {
      debugPrint("Error loading Interstitial ad: $error");
    });
  }

  Future<void> _loadNativeAd() async {
    try {
      final nativeAd = await startAppSdk.loadNativeAd(
        prefs: StartAppAdPreferences(), // Optional ad preferences
        onAdImpression: () => print("Ad Impression Recorded"),
        onAdClicked: () => print("Ad Clicked"),
      );

      if (nativeAd! != null && mounted) {
        setState(() {
          this.nativeAd = nativeAd;
        });
      }
    } catch (e) {
      debugPrint("Failed to load Start.io Native Ad: $e");
    }
  }

  void _nextCard() {
    setState(() {
      if (currentIndex < flashcardBox.length - 1) currentIndex++;
      showAnswer = false;
    });
  }

  void _prevCard() {
    setState(() {
      if (currentIndex > 0) currentIndex--;
      showAnswer = false;
    });
  }

  Future<void> _deleteCard(BuildContext context, int index) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Flashcard'),
        content: const Text('Are you sure you want to delete this flashcard?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );

    // if (confirmed == true) {
    //   flashcardBox.deleteAt(index);
    //   setState(() {
    //     if (currentIndex >= flashcardBox.length) currentIndex--;
    //   });
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Flashcard deleted'),
    //       duration: Duration(seconds: 1),
    //     ),
    //   );
    // }
    if (confirmed == true) {
      flashcardBox.deleteAt(index);
      await Future.delayed(Duration(milliseconds: 100)); // Let Hive update
      setState(() {
        if (currentIndex >= flashcardBox.length && flashcardBox.length > 0) {
          currentIndex = flashcardBox.length - 1;
        } else if (flashcardBox.isEmpty) {
          currentIndex = 0;
        }
      });
    }
  }

  void _loadCoins() {
    setState(() {
      _coins = _coinBox.get('coins', defaultValue: 0);
    });
  }

  void _addCoins(int amount) {
    setState(() {
      _coins += amount;
      _coinBox.put('coins', _coins);
    });
  }

  void _toggleCard() {
    if (isCardFlipping) return;

    setState(() {
      isCardFlipping = true;
      showAnswer = !showAnswer;
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        isCardFlipping = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final screenHeight = MediaQuery.of(context).size.height;
    final halfHeight = screenHeight * 0.5;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.monetization_on,
                color: Colors.amber,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 2,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              SizedBox(width: 4),
              Text(
                _coins > 1000
                    ? '${(_coins / 1000).toStringAsFixed(1)}K'
                    : '$_coins',
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        title: Text(
          'FlashCards',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_rounded,
              size: 28,
              color: colorScheme.primary,
            ),
            onPressed: () async {
              // if (rewardedVideoAd != null) {
              //   rewardedVideoAd!.show().onError((error, stackTrace) {
              //     debugPrint("Error showing Rewarded Video ad: $error");
              //     return false;
              //   });
              // } else {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     SnackBar(content: Text('Rewarded ad is not loaded yet.')),
              //   );
              // }
              loadInterstitialAd();

              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const EditFlashcardScreen(),
                ),
              );
              setState(() {});
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: flashcardBox.listenable(),
          builder: (context, Box<Flashcard> box, _) {
            if (box.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.auto_stories_rounded,
                      size: 64,
                      color: colorScheme.onSurface.withOpacity(0.3),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No flashcards yet',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tap the + button to add your first card',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              );
            }

            // final card = box.getAt(currentIndex)!;
            final card = box.getAt(currentIndex);
            if (card == null) {
              return Center(
                child: Text(
                  'Card data is missing.',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              );
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: halfHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Card ${currentIndex + 1} of ${box.length}',
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: colorScheme.onSurface.withOpacity(0.7),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 24),
                          GestureDetector(
                            onTap: _toggleCard,
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              switchInCurve: Curves.easeInOut,
                              switchOutCurve: Curves.easeInOut,
                              transitionBuilder: (child, animation) {
                                final rotateAnim = Tween(begin: 0.5, end: 0.0)
                                    .animate(animation);
                                return RotationTransition(
                                  turns: rotateAnim,
                                  child: FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  ),
                                );
                              },
                              child: Container(
                                key: ValueKey<bool>(showAnswer),
                                padding: const EdgeInsets.all(28),
                                height:
                                    halfHeight - 80, // adjust to avoid overflow
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: colorScheme.surface,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 12,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: SingleChildScrollView(
                                    child: Text(
                                      showAnswer ? card.answer : card.question,
                                      style: theme.textTheme.headlineSmall
                                          ?.copyWith(
                                        color: colorScheme.onSurface,
                                        fontWeight: FontWeight.w600,
                                        fontSize: showAnswer
                                            ? (card.answer.length <= 20
                                                ? 42
                                                : 16)
                                            : null,
                                      ),
                                      //   textAlign: showAnswer
                                      //       ? (card.answer.length <= 20
                                      //           ? TextAlign.center
                                      //           : null)
                                      //       : TextAlign.center,
                                      // ),
                                      textAlign: showAnswer
                                          ? (card.answer.length <= 20
                                              ? TextAlign.center
                                              : TextAlign.start)
                                          : TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primaryContainer,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: _toggleCard,
                      child: Text(
                        showAnswer ? 'SHOW QUESTION' : 'SHOW ANSWER',
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.chevron_left_rounded,
                            size: 32,
                            color: currentIndex > 0
                                ? colorScheme.primary
                                : colorScheme.onSurface.withOpacity(0.3),
                          ),
                          onPressed: currentIndex > 0 ? _prevCard : null,
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.edit_rounded,
                                color: colorScheme.primary,
                              ),
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => EditFlashcardScreen(
                                      flashcard: card,
                                      index: currentIndex,
                                    ),
                                  ),
                                );
                                setState(() {});
                              },
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: Icon(
                                Icons.delete_rounded,
                                color: colorScheme.error,
                              ),
                              onPressed: () =>
                                  _deleteCard(context, currentIndex),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.chevron_right_rounded,
                            size: 32,
                            color: currentIndex < box.length - 1
                                ? colorScheme.primary
                                : colorScheme.onSurface.withOpacity(0.3),
                          ),
                          onPressed:
                              currentIndex < box.length - 1 ? _nextCard : null,
                        ),
                      ],
                    ),
                    mrecAd != null
                        ? Padding(
                            padding: const EdgeInsets.all(12),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.purple.withOpacity(0.1),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: StartAppBanner(mrecAd!),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     if (interstitialAd != null) {
                    //       interstitialAd!.show().then((shown) {
                    //         if (shown) {
                    //           setState(() {
                    //             // NOTE interstitial ad can be shown only once
                    //             this.interstitialAd = null;

                    //             // NOTE load again
                    //             loadInterstitialAd();
                    //           });
                    //         }

                    //         return null;
                    //       }).onError((error, stackTrace) {
                    //         debugPrint("Error showing Interstitial ad: $error");
                    //       });
                    //     }
                    //   },
                    //   child: Text('Show Interstitial'),
                    // ),this works
                    // ElevatedButton(
                    //   onPressed: () {
                    //     if (nativeAd != null) {
                    //       setState(() {
                    //         showNativeAd = true;
                    //       });
                    //     } else {
                    //       ScaffoldMessenger.of(context).showSnackBar(
                    //         SnackBar(
                    //             content: Text('Native ad is not loaded yet.')),
                    //       );
                    //     }
                    //   },
                    //   child: Text('Show Native Ad'),
                    // ),
                    // if (showNativeAd && nativeAd != null)this works
                    // SizedBox(
                    //   height: 300,
                    //   width: double.infinity,
                    //   child: Card(
                    //     elevation: 4,
                    //     child: Padding(
                    //       padding: EdgeInsets.all(12),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           if (nativeAd!.imageUrl != null)
                    //             ClipRRect(
                    //               borderRadius: BorderRadius.circular(8),
                    //               child: Image.network(
                    //                 nativeAd!.imageUrl!,
                    //                 height: 150,
                    //                 width: double.infinity,
                    //                 fit: BoxFit.cover,
                    //               ),
                    //             ),
                    //           SizedBox(height: 10),
                    //           if (nativeAd!.title != null)
                    //             Text(
                    //               nativeAd!.title!,
                    //               style: TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 18),
                    //             ),
                    //           SizedBox(height: 8),
                    //           if (nativeAd!.description != null)
                    //             Text(nativeAd!.description!,
                    //                 style: TextStyle(fontSize: 14)),
                    //           Spacer(),
                    //           if (nativeAd!.callToAction != null)
                    //             Align(
                    //               alignment: Alignment.bottomRight,
                    //               child: ElevatedButton(
                    //                 onPressed: () {
                    //                   nativeAd; // Correct method to trigger ad action
                    //                 },
                    //                 child: Text(nativeAd!.callToAction!),
                    //               ),
                    //             ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    if (nativeAd != null)
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Card(
                          elevation: 4,
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (nativeAd?.imageUrl != null)
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      nativeAd!.imageUrl!,
                                      height: 150,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                if (nativeAd?.imageUrl != null)
                                  SizedBox(height: 10),
                                if (nativeAd?.title != null)
                                  Text(
                                    nativeAd!.title!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                if (nativeAd?.title != null)
                                  SizedBox(height: 8),
                                if (nativeAd?.description != null)
                                  Text(nativeAd!.description!,
                                      style: TextStyle(fontSize: 14)),
                                Spacer(),
                                if (nativeAd?.callToAction != null)
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        nativeAd; // Correct method to trigger ad action
                                      },
                                      child: Text(nativeAd!.callToAction!),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     if (rewardedVideoAd != null) {
                    //       rewardedVideoAd!.show().onError((error, stackTrace) {
                    //         debugPrint(
                    //             "Error showing Rewarded Video ad: $error");
                    //         return false;
                    //       });
                    //     } else {
                    //       ScaffoldMessenger.of(context).showSnackBar(
                    //         SnackBar(
                    //             content:
                    //                 Text('Rewarded ad is not loaded yet.')),
                    //       );
                    //     }
                    //   },
                    //   child: Text('Get 10 coins watching ads!'),
                    // ),
                    ElevatedButton(
                      onPressed: () {
                        if (rewardedVideoAd != null) {
                          rewardedVideoAd!.show().then((_) {
                            // Add coins when ad is completed
                            _addCoins(100);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('+100 coins! Total: $_coins'),
                                duration: Duration(seconds: 2),
                              ),
                            );

                            // Reload the ad for next time
                            loadRewardedVideoAd();
                          }).onError((error, stackTrace) {
                            debugPrint(
                                "Error showing Rewarded Video ad: $error");
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Ads not loaded!')),
                          );
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.monetization_on, color: Colors.amber),
                          SizedBox(width: 8),
                          Text('Get 100 coins!'),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
