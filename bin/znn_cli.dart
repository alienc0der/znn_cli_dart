import 'dart:async';

import 'package:args/args.dart';
import 'package:znn_cli_dart/lib.dart';
import 'package:znn_sdk_dart/znn_sdk_dart.dart';

Future<int> main(List<String> arguments) async {
  final ArgParser argParser = parseArgs();
  final argResult = argParser.parse(args);
  args = argResult.rest;

  args = arguments;

  handleFlags(argResult);

  ensureDirectoriesExist();

  if (!commandsWithoutWallet.contains(args[0])) {
    await unlockWallet(argResult);
  }
  await connectToNode(argResult);
  await handleCli();
  znnClient.wsClient.stop();

  return 0;
}
