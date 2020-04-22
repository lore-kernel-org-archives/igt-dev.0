Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB62F6E3EB
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2020 11:20:05 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 22 Apr 2020 14:19:51 +0300
Message-Id: <20200422111952.16969-2-petri.latvala@intel.com>
In-Reply-To: <20200422111952.16969-1-petri.latvala@intel.com>
References: <20200422111952.16969-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] TO BE SQUASHED OVER: Copy
 dynamic-subtests json test
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

This commit is just a copy of runner/json_test_data/dynamic-subtests
to make it easier to see in the later patch what is different in
dynamic-subtests-prune-dynamics. Will be squashed when merging.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 .../0/dmesg.txt                               |   7 +
 .../dynamic-subtests-prune-dynamics/0/err.txt |  36 +++++
 .../0/journal.txt                             |   2 +
 .../dynamic-subtests-prune-dynamics/0/out.txt |  19 +++
 .../1/dmesg.txt                               |   5 +
 .../dynamic-subtests-prune-dynamics/1/err.txt |   2 +
 .../1/journal.txt                             |   2 +
 .../dynamic-subtests-prune-dynamics/1/out.txt |   5 +
 .../2/dmesg.txt                               |  11 ++
 .../dynamic-subtests-prune-dynamics/2/err.txt |   8 ++
 .../2/journal.txt                             |   4 +
 .../dynamic-subtests-prune-dynamics/2/out.txt |  10 ++
 .../README.txt                                |   2 +
 .../endtime.txt                               |   1 +
 .../joblist.txt                               |   3 +
 .../metadata.txt                              |  12 ++
 .../reference.json                            | 135 ++++++++++++++++++
 .../starttime.txt                             |   1 +
 .../dynamic-subtests-prune-dynamics/uname.txt |   1 +
 19 files changed, 266 insertions(+)
 create mode 100644 runner/json_tests_data/dynamic-subtests-prune-dynamics/0/dmesg.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-prune-dynamics/0/err.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-prune-dynamics/0/journal.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-prune-dynamics/0/out.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-prune-dynamics/1/dmesg.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-prune-dynamics/1/err.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-prune-dynamics/1/journal.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-prune-dynamics/1/out.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-prune-dynamics/2/dmesg.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-prune-dynamics/2/err.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-prune-dynamics/2/journal.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-prune-dynamics/2/out.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-prune-dynamics/README.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-prune-dynamics/endtime.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-prune-dynamics/joblist.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-prune-dynamics/metadata.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-prune-dynamics/reference.json
 create mode 100644 runner/json_tests_data/dynamic-subtests-prune-dynamics/starttime.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-prune-dynamics/uname.txt

diff --git a/runner/json_tests_data/dynamic-subtests-prune-dynamics/0/dmesg.txt b/runner/json_tests_data/dynamic-subtests-prune-dynamics/0/dmesg.txt
new file mode 100644
index 00000000..c87b4271
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-prune-dynamics/0/dmesg.txt
@@ -0,0 +1,7 @@
+6,1157,23426155175691,-;Console: switching to colour dummy device 80x25
+14,1158,23426155175708,-;[IGT] dynamic: executing
+14,1159,23426155184875,-;[IGT] dynamic: starting subtest debug-log-checking
+14,1160,23426155184895,-;[IGT] dynamic: starting dynamic subtest this-is-dynamic-1
+14,1161,23426155240164,-;[IGT] dynamic: starting dynamic subtest this-is-dynamic-2
+14,1162,23426155293846,-;[IGT] dynamic: exiting, ret=98
+6,1163,23426155294003,-;Console: switching to colour frame buffer device 240x75
diff --git a/runner/json_tests_data/dynamic-subtests-prune-dynamics/0/err.txt b/runner/json_tests_data/dynamic-subtests-prune-dynamics/0/err.txt
new file mode 100644
index 00000000..3c280788
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-prune-dynamics/0/err.txt
@@ -0,0 +1,36 @@
+Starting subtest: debug-log-checking
+Starting dynamic subtest: this-is-dynamic-1
+(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, file ../runner/testdata/dynamic.c:8:
+(dynamic:20904) CRITICAL: Failed assertion: false
+Dynamic subtest this-is-dynamic-1 failed.
+**** DEBUG ****
+(dynamic:20904) DEBUG: This print is from 1
+(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, file ../runner/testdata/dynamic.c:8:
+(dynamic:20904) CRITICAL: Failed assertion: false
+(dynamic:20904) igt_core-INFO: Stack trace:
+(dynamic:20904) igt_core-INFO:   #0 ../lib/igt_core.c:1607 __igt_fail_assert()
+(dynamic:20904) igt_core-INFO:   #1 ../runner/testdata/dynamic.c:11 __real_main3()
+(dynamic:20904) igt_core-INFO:   #2 ../runner/testdata/dynamic.c:3 main()
+(dynamic:20904) igt_core-INFO:   #3 ../csu/libc-start.c:342 __libc_start_main()
+(dynamic:20904) igt_core-INFO:   #4 [_start+0x2a]
+****  END  ****
+Dynamic subtest this-is-dynamic-1: FAIL (0.055s)
+Starting dynamic subtest: this-is-dynamic-2
+(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, file ../runner/testdata/dynamic.c:13:
+(dynamic:20904) CRITICAL: Failed assertion: false
+Dynamic subtest this-is-dynamic-2 failed.
+**** DEBUG ****
+(dynamic:20904) DEBUG: This print is from 2
+(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, file ../runner/testdata/dynamic.c:13:
+(dynamic:20904) CRITICAL: Failed assertion: false
+(dynamic:20904) igt_core-INFO: Stack trace:
+(dynamic:20904) igt_core-INFO:   #0 ../lib/igt_core.c:1607 __igt_fail_assert()
+(dynamic:20904) igt_core-INFO:   #1 ../runner/testdata/dynamic.c:5 __real_main3()
+(dynamic:20904) igt_core-INFO:   #2 ../runner/testdata/dynamic.c:3 main()
+(dynamic:20904) igt_core-INFO:   #3 ../csu/libc-start.c:342 __libc_start_main()
+(dynamic:20904) igt_core-INFO:   #4 [_start+0x2a]
+****  END  ****
+Dynamic subtest this-is-dynamic-2: FAIL (0.054s)
+Subtest debug-log-checking failed.
+No log.
+Subtest debug-log-checking: FAIL (0.109s)
diff --git a/runner/json_tests_data/dynamic-subtests-prune-dynamics/0/journal.txt b/runner/json_tests_data/dynamic-subtests-prune-dynamics/0/journal.txt
new file mode 100644
index 00000000..aa8cef0c
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-prune-dynamics/0/journal.txt
@@ -0,0 +1,2 @@
+debug-log-checking
+exit:98 (0.130s)
diff --git a/runner/json_tests_data/dynamic-subtests-prune-dynamics/0/out.txt b/runner/json_tests_data/dynamic-subtests-prune-dynamics/0/out.txt
new file mode 100644
index 00000000..286da3f3
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-prune-dynamics/0/out.txt
@@ -0,0 +1,19 @@
+IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)
+Starting subtest: debug-log-checking
+Starting dynamic subtest: this-is-dynamic-1
+Stack trace:
+  #0 ../lib/igt_core.c:1607 __igt_fail_assert()
+  #1 ../runner/testdata/dynamic.c:11 __real_main3()
+  #2 ../runner/testdata/dynamic.c:3 main()
+  #3 ../csu/libc-start.c:342 __libc_start_main()
+  #4 [_start+0x2a]
+Dynamic subtest this-is-dynamic-1: FAIL (0.055s)
+Starting dynamic subtest: this-is-dynamic-2
+Stack trace:
+  #0 ../lib/igt_core.c:1607 __igt_fail_assert()
+  #1 ../runner/testdata/dynamic.c:5 __real_main3()
+  #2 ../runner/testdata/dynamic.c:3 main()
+  #3 ../csu/libc-start.c:342 __libc_start_main()
+  #4 [_start+0x2a]
+Dynamic subtest this-is-dynamic-2: FAIL (0.054s)
+Subtest debug-log-checking: FAIL (0.109s)
diff --git a/runner/json_tests_data/dynamic-subtests-prune-dynamics/1/dmesg.txt b/runner/json_tests_data/dynamic-subtests-prune-dynamics/1/dmesg.txt
new file mode 100644
index 00000000..d6e16a46
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-prune-dynamics/1/dmesg.txt
@@ -0,0 +1,5 @@
+6,1164,23426155304955,-;Console: switching to colour dummy device 80x25
+14,1165,23426155304968,-;[IGT] dynamic: executing
+14,1166,23426155308644,-;[IGT] dynamic: starting subtest empty-container
+14,1167,23426155308671,-;[IGT] dynamic: exiting, ret=77
+6,1168,23426155308822,-;Console: switching to colour frame buffer device 240x75
diff --git a/runner/json_tests_data/dynamic-subtests-prune-dynamics/1/err.txt b/runner/json_tests_data/dynamic-subtests-prune-dynamics/1/err.txt
new file mode 100644
index 00000000..6247e714
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-prune-dynamics/1/err.txt
@@ -0,0 +1,2 @@
+Starting subtest: empty-container
+Subtest empty-container: SKIP (0.000s)
diff --git a/runner/json_tests_data/dynamic-subtests-prune-dynamics/1/journal.txt b/runner/json_tests_data/dynamic-subtests-prune-dynamics/1/journal.txt
new file mode 100644
index 00000000..3e4ce5c4
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-prune-dynamics/1/journal.txt
@@ -0,0 +1,2 @@
+empty-container
+exit:77 (0.014s)
diff --git a/runner/json_tests_data/dynamic-subtests-prune-dynamics/1/out.txt b/runner/json_tests_data/dynamic-subtests-prune-dynamics/1/out.txt
new file mode 100644
index 00000000..704734dc
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-prune-dynamics/1/out.txt
@@ -0,0 +1,5 @@
+IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)
+Starting subtest: empty-container
+This should skip
+No dynamic tests executed.
+Subtest empty-container: SKIP (0.000s)
diff --git a/runner/json_tests_data/dynamic-subtests-prune-dynamics/2/dmesg.txt b/runner/json_tests_data/dynamic-subtests-prune-dynamics/2/dmesg.txt
new file mode 100644
index 00000000..046ef579
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-prune-dynamics/2/dmesg.txt
@@ -0,0 +1,11 @@
+6,1157,23426155175691,-;Console: switching to colour dummy device 80x25
+14,1158,23426155175708,-;[IGT] dynamic: executing
+14,1159,23426155184875,-;[IGT] dynamic: starting subtest normal
+6,1160,23426155184895,-;Dmesg output for normal
+6,1160,23426155184895,-;[IGT] dynamic: starting dynamic subtest normal-dynamic-subtest
+14,1159,23426155184875,-;[IGT] dynamic: starting subtest incomplete
+14,1160,23426155184895,-;[IGT] dynamic: starting dynamic subtest this-is-incomplete
+6,1160,23426155184895,-;Dmesg output for incomplete
+14,1161,23426155240164,-;[IGT] dynamic: starting subtest resume
+14,1162,23426155293846,-;[IGT] dynamic: exiting, ret=0
+6,1163,23426155294003,-;Console: switching to colour frame buffer device 240x75
diff --git a/runner/json_tests_data/dynamic-subtests-prune-dynamics/2/err.txt b/runner/json_tests_data/dynamic-subtests-prune-dynamics/2/err.txt
new file mode 100644
index 00000000..1eae6061
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-prune-dynamics/2/err.txt
@@ -0,0 +1,8 @@
+Starting subtest: normal
+Starting dynamic subtest: normal-dynamic-subtest
+Dynamic subtest normal-dynamic-subtest: SUCCESS (0.055s)
+Subtest normal: SUCCESS (0.100s)
+Starting subtest: incomplete
+Starting dynamic subtest: this-is-incomplete
+Starting subtest: resume
+Subtest resume: SUCCESS (0.109s)
diff --git a/runner/json_tests_data/dynamic-subtests-prune-dynamics/2/journal.txt b/runner/json_tests_data/dynamic-subtests-prune-dynamics/2/journal.txt
new file mode 100644
index 00000000..9469e227
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-prune-dynamics/2/journal.txt
@@ -0,0 +1,4 @@
+normal
+incomplete
+resume
+exit:0 (0.130s)
diff --git a/runner/json_tests_data/dynamic-subtests-prune-dynamics/2/out.txt b/runner/json_tests_data/dynamic-subtests-prune-dynamics/2/out.txt
new file mode 100644
index 00000000..3063844b
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-prune-dynamics/2/out.txt
@@ -0,0 +1,10 @@
+IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)
+Starting subtest: normal
+Starting dynamic subtest: normal-dynamic-subtest
+Dynamic subtest normal-dynamic-subtest: SUCCESS (0.055s)
+Subtest normal: SUCCESS (0.100s)
+Starting subtest: incomplete
+Starting dynamic subtest: this-is-incomplete
+This is some output
+Starting subtest: resume
+Subtest resume: SUCCESS (0.109s)
diff --git a/runner/json_tests_data/dynamic-subtests-prune-dynamics/README.txt b/runner/json_tests_data/dynamic-subtests-prune-dynamics/README.txt
new file mode 100644
index 00000000..3a63ab17
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-prune-dynamics/README.txt
@@ -0,0 +1,2 @@
+A test with dynamic subtests should generate separate subresults for
+the dynamic tests.
diff --git a/runner/json_tests_data/dynamic-subtests-prune-dynamics/endtime.txt b/runner/json_tests_data/dynamic-subtests-prune-dynamics/endtime.txt
new file mode 100644
index 00000000..5c7608b5
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-prune-dynamics/endtime.txt
@@ -0,0 +1 @@
+1560163492.410489
diff --git a/runner/json_tests_data/dynamic-subtests-prune-dynamics/joblist.txt b/runner/json_tests_data/dynamic-subtests-prune-dynamics/joblist.txt
new file mode 100644
index 00000000..4fdcc5f1
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-prune-dynamics/joblist.txt
@@ -0,0 +1,3 @@
+dynamic debug-log-checking
+dynamic empty-container
+dynamic normal,incomplete,resume
diff --git a/runner/json_tests_data/dynamic-subtests-prune-dynamics/metadata.txt b/runner/json_tests_data/dynamic-subtests-prune-dynamics/metadata.txt
new file mode 100644
index 00000000..8c77de01
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-prune-dynamics/metadata.txt
@@ -0,0 +1,12 @@
+abort_mask : 0
+name : dynamic-subtests
+dry_run : 0
+sync : 0
+log_level : 0
+overwrite : 0
+multiple_mode : 1
+inactivity_timeout : 0
+use_watchdog : 0
+piglit_style_dmesg : 0
+test_root : /path/does/not/exist
+results_path : /path/does/not/exist
diff --git a/runner/json_tests_data/dynamic-subtests-prune-dynamics/reference.json b/runner/json_tests_data/dynamic-subtests-prune-dynamics/reference.json
new file mode 100644
index 00000000..c013d282
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-prune-dynamics/reference.json
@@ -0,0 +1,135 @@
+{
+  "__type__":"TestrunResult",
+  "results_version":10,
+  "name":"dynamic-subtests",
+  "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "time_elapsed":{
+    "__type__":"TimeAttribute",
+    "start":1560163492.266377,
+    "end":1560163492.4104891
+  },
+  "tests":{
+    "igt@dynamic@debug-log-checking@this-is-dynamic-1":{
+      "out":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)\nStarting subtest: debug-log-checking\nStarting dynamic subtest: this-is-dynamic-1\nStack trace:\n  #0 ..\/lib\/igt_core.c:1607 __igt_fail_assert()\n  #1 ..\/runner\/testdata\/dynamic.c:11 __real_main3()\n  #2 ..\/runner\/testdata\/dynamic.c:3 main()\n  #3 ..\/csu\/libc-start.c:342 __libc_start_main()\n  #4 [_start+0x2a]\nDynamic subtest this-is-dynamic-1: FAIL (0.055s)\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)",
+      "result":"fail",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0,
+        "end":0.055
+      },
+      "err":"Starting subtest: debug-log-checking\nStarting dynamic subtest: this-is-dynamic-1\n(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, file ..\/runner\/testdata\/dynamic.c:8:\n(dynamic:20904) CRITICAL: Failed assertion: false\nDynamic subtest this-is-dynamic-1 failed.\n**** DEBUG ****\n(dynamic:20904) DEBUG: This print is from 1\n(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, file ..\/runner\/testdata\/dynamic.c:8:\n(dynamic:20904) CRITICAL: Failed assertion: false\n(dynamic:20904) igt_core-INFO: Stack trace:\n(dynamic:20904) igt_core-INFO:   #0 ..\/lib\/igt_core.c:1607 __igt_fail_assert()\n(dynamic:20904) igt_core-INFO:   #1 ..\/runner\/testdata\/dynamic.c:11 __real_main3()\n(dynamic:20904) igt_core-INFO:   #2 ..\/runner\/testdata\/dynamic.c:3 main()\n(dynamic:20904) igt_core-INFO:   #3 ..\/csu\/libc-start.c:342 __libc_start_main()\n(dynamic:20904) igt_core-INFO:   #4 [_start+0x2a]\n****  END  ****\nDynamic subtest this-is-d
 ynamic-1: FAIL (0.055s)\n",
+      "dmesg":"<6> [23426155.175691] Console: switching to colour dummy device 80x25\n<6> [23426155.175708] [IGT] dynamic: executing\n<6> [23426155.184875] [IGT] dynamic: starting subtest debug-log-checking\n<6> [23426155.184895] [IGT] dynamic: starting dynamic subtest this-is-dynamic-1\n"
+    },
+    "igt@dynamic@debug-log-checking@this-is-dynamic-2":{
+      "out":"Starting dynamic subtest: this-is-dynamic-2\nStack trace:\n  #0 ..\/lib\/igt_core.c:1607 __igt_fail_assert()\n  #1 ..\/runner\/testdata\/dynamic.c:5 __real_main3()\n  #2 ..\/runner\/testdata\/dynamic.c:3 main()\n  #3 ..\/csu\/libc-start.c:342 __libc_start_main()\n  #4 [_start+0x2a]\nDynamic subtest this-is-dynamic-2: FAIL (0.054s)\nSubtest debug-log-checking: FAIL (0.109s)\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)",
+      "result":"fail",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0,
+        "end":0.054
+      },
+      "err":"Starting dynamic subtest: this-is-dynamic-2\n(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, file ..\/runner\/testdata\/dynamic.c:13:\n(dynamic:20904) CRITICAL: Failed assertion: false\nDynamic subtest this-is-dynamic-2 failed.\n**** DEBUG ****\n(dynamic:20904) DEBUG: This print is from 2\n(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, file ..\/runner\/testdata\/dynamic.c:13:\n(dynamic:20904) CRITICAL: Failed assertion: false\n(dynamic:20904) igt_core-INFO: Stack trace:\n(dynamic:20904) igt_core-INFO:   #0 ..\/lib\/igt_core.c:1607 __igt_fail_assert()\n(dynamic:20904) igt_core-INFO:   #1 ..\/runner\/testdata\/dynamic.c:5 __real_main3()\n(dynamic:20904) igt_core-INFO:   #2 ..\/runner\/testdata\/dynamic.c:3 main()\n(dynamic:20904) igt_core-INFO:   #3 ..\/csu\/libc-start.c:342 __libc_start_main()\n(dynamic:20904) igt_core-INFO:   #4 [_start+0x2a]\n****  END  ****\nDynamic subtest this-is-dynamic-2: FAIL (0.054s)\nSubtest debu
 g-log-checking failed.\nNo log.\nSubtest debug-log-checking: FAIL (0.109s)\n",
+      "dmesg":"<6> [23426155.240164] [IGT] dynamic: starting dynamic subtest this-is-dynamic-2\n<6> [23426155.293846] [IGT] dynamic: exiting, ret=98\n<6> [23426155.294003] Console: switching to colour frame buffer device 240x75\n"
+    },
+    "igt@dynamic@empty-container":{
+      "out":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)\nStarting subtest: empty-container\nThis should skip\nNo dynamic tests executed.\nSubtest empty-container: SKIP (0.000s)\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)",
+      "result":"skip",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0,
+        "end":0
+      },
+      "err":"Starting subtest: empty-container\nSubtest empty-container: SKIP (0.000s)\n",
+      "dmesg":"<6> [23426155.304955] Console: switching to colour dummy device 80x25\n<6> [23426155.304968] [IGT] dynamic: executing\n<6> [23426155.308644] [IGT] dynamic: starting subtest empty-container\n<6> [23426155.308671] [IGT] dynamic: exiting, ret=77\n<6> [23426155.308822] Console: switching to colour frame buffer device 240x75\n"
+    },
+    "igt@dynamic@normal@normal-dynamic-subtest":{
+      "out":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)\nStarting subtest: normal\nStarting dynamic subtest: normal-dynamic-subtest\nDynamic subtest normal-dynamic-subtest: SUCCESS (0.055s)\nSubtest normal: SUCCESS (0.100s)\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)",
+      "result":"pass",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0,
+        "end":0.055
+      },
+      "err":"Starting subtest: normal\nStarting dynamic subtest: normal-dynamic-subtest\nDynamic subtest normal-dynamic-subtest: SUCCESS (0.055s)\nSubtest normal: SUCCESS (0.100s)\n",
+      "dmesg":"<6> [23426155.175691] Console: switching to colour dummy device 80x25\n<6> [23426155.175708] [IGT] dynamic: executing\n<6> [23426155.184875] [IGT] dynamic: starting subtest normal\n<6> [23426155.184895] Dmesg output for normal\n<6> [23426155.184895] [IGT] dynamic: starting dynamic subtest normal-dynamic-subtest\n"
+    },
+    "igt@dynamic@incomplete@this-is-incomplete":{
+      "out":"Starting subtest: incomplete\nStarting dynamic subtest: this-is-incomplete\nThis is some output\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)",
+      "result":"incomplete",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0,
+        "end":0
+      },
+      "err":"Starting subtest: incomplete\nStarting dynamic subtest: this-is-incomplete\n",
+      "dmesg":"<6> [23426155.184875] [IGT] dynamic: starting subtest incomplete\n<6> [23426155.184895] [IGT] dynamic: starting dynamic subtest this-is-incomplete\n<6> [23426155.184895] Dmesg output for incomplete\n"
+    },
+    "igt@dynamic@resume":{
+      "out":"This is some output\nStarting subtest: resume\nSubtest resume: SUCCESS (0.109s)\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)",
+      "result":"pass",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0,
+        "end":0.109
+      },
+      "err":"Starting subtest: resume\nSubtest resume: SUCCESS (0.109s)\n",
+      "dmesg":"<6> [23426155.240164] [IGT] dynamic: starting subtest resume\n<6> [23426155.293846] [IGT] dynamic: exiting, ret=0\n<6> [23426155.294003] Console: switching to colour frame buffer device 240x75\n"
+    }
+  },
+  "totals":{
+    "":{
+      "crash":0,
+      "pass":2,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":1,
+      "incomplete":1,
+      "abort":0,
+      "timeout":0,
+      "notrun":0,
+      "fail":2,
+      "warn":0
+    },
+    "root":{
+      "crash":0,
+      "pass":2,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":1,
+      "incomplete":1,
+      "abort":0,
+      "timeout":0,
+      "notrun":0,
+      "fail":2,
+      "warn":0
+    },
+    "igt@dynamic":{
+      "crash":0,
+      "pass":2,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":1,
+      "incomplete":1,
+      "abort":0,
+      "timeout":0,
+      "notrun":0,
+      "fail":2,
+      "warn":0
+    }
+  },
+  "runtimes":{
+    "igt@dynamic":{
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0,
+        "end":0.27400000000000002
+      }
+    }
+  }
+}
diff --git a/runner/json_tests_data/dynamic-subtests-prune-dynamics/starttime.txt b/runner/json_tests_data/dynamic-subtests-prune-dynamics/starttime.txt
new file mode 100644
index 00000000..b30b32ee
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-prune-dynamics/starttime.txt
@@ -0,0 +1 @@
+1560163492.266377
diff --git a/runner/json_tests_data/dynamic-subtests-prune-dynamics/uname.txt b/runner/json_tests_data/dynamic-subtests-prune-dynamics/uname.txt
new file mode 100644
index 00000000..a7aef6f7
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-prune-dynamics/uname.txt
@@ -0,0 +1 @@
+Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
