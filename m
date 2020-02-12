Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734DF6EAA6
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2020 13:21:38 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Wed, 12 Feb 2020 15:21:14 +0200
Message-ID: <20200212132123.108506-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/9] Abort on Chamelium failure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This series introduces new mechanism for aborting a run from inside an IGT test.
It is intended to be used when we detect a critical issue with the environment
and further testing makes no sense.

The first user is Chamelium.

Using chamelium as a display for non-chamelium-aware test is challenging. The
board can be left in multiple different states after kms_chamelium tests even
though we have atexit() handlers and other measures which try to assure that all
ports are plugged in. Sadly this is not 100% reliable and causes a lot of
flip-flopping skips.

In an attempt to make connectors state less random igt_display_require() will
try to reset chamelium to a good state. If we fail to do so we abort the
execution because the testing configuration is an unknown.

The introduction of new test state (abort) will need some changes in cibuglog &
igt-viz and can be used to convert runner-injected igt@runner@abort stubs into a
results for a real tests that has a meaningful dmesg attached.

Arkadiusz Hiler (9):
  lib/tests: Extract fork helpers
  lib/tests: Add support for redirecting fork output to /dev/null
  lib: Make it possible to abort the whole execution from inside of a
    test
  runner/runner_tests: Extract helper for inspecting test result
  runner: Abort the run when test exits with IGT_EXIT_ABORT
  lib/chamelium: Clear error after checking if chamelium is reachable
  lib/chamelium: Make it clear that function asserts
  lib/chamelium: Add functions to initialize XMLRPC only
  lib/kms: Try to plug all Chamelium ports, abort if it fails

 lib/igt_chamelium.c                           | 165 +++++++--
 lib/igt_chamelium.h                           |   6 +-
 lib/igt_core.c                                |  46 ++-
 lib/igt_core.h                                |  29 ++
 lib/igt_kms.c                                 |  18 +
 lib/tests/igt_abort.c                         | 227 ++++++++++++
 lib/tests/igt_assert.c                        |  35 +-
 lib/tests/igt_conflicting_args.c              |  25 +-
 lib/tests/igt_describe.c                      | 135 ++-----
 lib/tests/igt_dynamic_subtests.c              |  18 -
 lib/tests/igt_fork.c                          |  71 ++--
 lib/tests/igt_invalid_subtest_name.c          |  18 -
 lib/tests/igt_no_exit.c                       |  18 -
 lib/tests/igt_segfault.c                      |  59 ++--
 lib/tests/igt_simulation.c                    | 101 +++---
 lib/tests/igt_tests_common.h                  | 110 ++++++
 lib/tests/meson.build                         |   1 +
 runner/executor.c                             |   3 +
 .../aborted-after-a-test/reference.json       |   6 +
 .../aborted-on-boot/reference.json            |   6 +
 .../dmesg-escapes/reference.json              |   3 +
 .../dmesg-results/reference.json              |   5 +
 .../reference.json                            |   3 +
 .../reference.json                            |   3 +
 .../dmesg-warn-level/reference.json           |   3 +
 .../reference.json                            |   3 +
 .../dynamic-subtests/reference.json           |   3 +
 .../reference.json                            |   5 +
 .../json_tests_data/normal-run/reference.json |   5 +
 .../reference.json                            |   4 +
 .../notrun-results/reference.json             |   5 +
 .../piglit-style-dmesg/reference.json         |   5 +
 .../unprintable-characters/reference.json     |   5 +-
 .../warnings-with-dmesg-warns/reference.json  |   5 +
 .../json_tests_data/warnings/reference.json   |   5 +
 runner/resultgen.c                            |  25 ++
 runner/runner_tests.c                         | 333 +++++++++++++++++-
 runner/testdata/abort-dynamic.c               |  46 +++
 runner/testdata/abort-fixture.c               |  37 ++
 runner/testdata/abort-simple.c                |  29 ++
 runner/testdata/abort.c                       |  36 ++
 runner/testdata/meson.build                   |   4 +
 tests/kms_chamelium.c                         |  11 +-
 tests/kms_color_chamelium.c                   |   7 +-
 44 files changed, 1287 insertions(+), 400 deletions(-)
 create mode 100644 lib/tests/igt_abort.c
 create mode 100644 runner/testdata/abort-dynamic.c
 create mode 100644 runner/testdata/abort-fixture.c
 create mode 100644 runner/testdata/abort-simple.c
 create mode 100644 runner/testdata/abort.c

-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
