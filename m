Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDC96E3E1
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2020 11:20:05 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 22 Apr 2020 14:19:52 +0300
Message-Id: <20200422111952.16969-3-petri.latvala@intel.com>
In-Reply-To: <20200422111952.16969-1-petri.latvala@intel.com>
References: <20200422111952.16969-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] runner: Add json unit test for
 --prune-dynamic-results
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

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 .../README.txt                                |  4 +--
 .../metadata.txt                              |  3 +-
 .../reference.json                            | 36 +++++++------------
 runner/runner_json_tests.c                    |  1 +
 4 files changed, 17 insertions(+), 27 deletions(-)

diff --git a/runner/json_tests_data/dynamic-subtests-prune-dynamics/README.txt b/runner/json_tests_data/dynamic-subtests-prune-dynamics/README.txt
index 3a63ab17..fcc12410 100644
--- a/runner/json_tests_data/dynamic-subtests-prune-dynamics/README.txt
+++ b/runner/json_tests_data/dynamic-subtests-prune-dynamics/README.txt
@@ -1,2 +1,2 @@
-A test with dynamic subtests should generate separate subresults for
-the dynamic tests.
+A test with dynamic subtests should only generate the subtest results
+when --prune-dynamic-results is used.
diff --git a/runner/json_tests_data/dynamic-subtests-prune-dynamics/metadata.txt b/runner/json_tests_data/dynamic-subtests-prune-dynamics/metadata.txt
index 8c77de01..7a5a6717 100644
--- a/runner/json_tests_data/dynamic-subtests-prune-dynamics/metadata.txt
+++ b/runner/json_tests_data/dynamic-subtests-prune-dynamics/metadata.txt
@@ -1,5 +1,5 @@
 abort_mask : 0
-name : dynamic-subtests
+name : dynamic-subtests-prune-dynamics
 dry_run : 0
 sync : 0
 log_level : 0
@@ -8,5 +8,6 @@ multiple_mode : 1
 inactivity_timeout : 0
 use_watchdog : 0
 piglit_style_dmesg : 0
+prune_dynamics : 1
 test_root : /path/does/not/exist
 results_path : /path/does/not/exist
diff --git a/runner/json_tests_data/dynamic-subtests-prune-dynamics/reference.json b/runner/json_tests_data/dynamic-subtests-prune-dynamics/reference.json
index c013d282..21e38be2 100644
--- a/runner/json_tests_data/dynamic-subtests-prune-dynamics/reference.json
+++ b/runner/json_tests_data/dynamic-subtests-prune-dynamics/reference.json
@@ -1,7 +1,7 @@
 {
   "__type__":"TestrunResult",
   "results_version":10,
-  "name":"dynamic-subtests",
+  "name":"dynamic-subtests-prune-dynamics",
   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
   "time_elapsed":{
     "__type__":"TimeAttribute",
@@ -9,29 +9,17 @@
     "end":1560163492.4104891
   },
   "tests":{
-    "igt@dynamic@debug-log-checking@this-is-dynamic-1":{
-      "out":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)\nStarting subtest: debug-log-checking\nStarting dynamic subtest: this-is-dynamic-1\nStack trace:\n  #0 ..\/lib\/igt_core.c:1607 __igt_fail_assert()\n  #1 ..\/runner\/testdata\/dynamic.c:11 __real_main3()\n  #2 ..\/runner\/testdata\/dynamic.c:3 main()\n  #3 ..\/csu\/libc-start.c:342 __libc_start_main()\n  #4 [_start+0x2a]\nDynamic subtest this-is-dynamic-1: FAIL (0.055s)\n",
+    "igt@dynamic@debug-log-checking":{
+      "out":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)\nStarting subtest: debug-log-checking\nStarting dynamic subtest: this-is-dynamic-1\nStack trace:\n  #0 ..\/lib\/igt_core.c:1607 __igt_fail_assert()\n  #1 ..\/runner\/testdata\/dynamic.c:11 __real_main3()\n  #2 ..\/runner\/testdata\/dynamic.c:3 main()\n  #3 ..\/csu\/libc-start.c:342 __libc_start_main()\n  #4 [_start+0x2a]\nDynamic subtest this-is-dynamic-1: FAIL (0.055s)\nStarting dynamic subtest: this-is-dynamic-2\nStack trace:\n  #0 ..\/lib\/igt_core.c:1607 __igt_fail_assert()\n  #1 ..\/runner\/testdata\/dynamic.c:5 __real_main3()\n  #2 ..\/runner\/testdata\/dynamic.c:3 main()\n  #3 ..\/csu\/libc-start.c:342 __libc_start_main()\n  #4 [_start+0x2a]\nDynamic subtest this-is-dynamic-2: FAIL (0.054s)\nSubtest debug-log-checking: FAIL (0.109s)\n",
       "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)",
       "result":"fail",
       "time":{
         "__type__":"TimeAttribute",
         "start":0,
-        "end":0.055
-      },
-      "err":"Starting subtest: debug-log-checking\nStarting dynamic subtest: this-is-dynamic-1\n(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, file ..\/runner\/testdata\/dynamic.c:8:\n(dynamic:20904) CRITICAL: Failed assertion: false\nDynamic subtest this-is-dynamic-1 failed.\n**** DEBUG ****\n(dynamic:20904) DEBUG: This print is from 1\n(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, file ..\/runner\/testdata\/dynamic.c:8:\n(dynamic:20904) CRITICAL: Failed assertion: false\n(dynamic:20904) igt_core-INFO: Stack trace:\n(dynamic:20904) igt_core-INFO:   #0 ..\/lib\/igt_core.c:1607 __igt_fail_assert()\n(dynamic:20904) igt_core-INFO:   #1 ..\/runner\/testdata\/dynamic.c:11 __real_main3()\n(dynamic:20904) igt_core-INFO:   #2 ..\/runner\/testdata\/dynamic.c:3 main()\n(dynamic:20904) igt_core-INFO:   #3 ..\/csu\/libc-start.c:342 __libc_start_main()\n(dynamic:20904) igt_core-INFO:   #4 [_start+0x2a]\n****  END  ****\nDynamic subtest this-is-d
 ynamic-1: FAIL (0.055s)\n",
-      "dmesg":"<6> [23426155.175691] Console: switching to colour dummy device 80x25\n<6> [23426155.175708] [IGT] dynamic: executing\n<6> [23426155.184875] [IGT] dynamic: starting subtest debug-log-checking\n<6> [23426155.184895] [IGT] dynamic: starting dynamic subtest this-is-dynamic-1\n"
-    },
-    "igt@dynamic@debug-log-checking@this-is-dynamic-2":{
-      "out":"Starting dynamic subtest: this-is-dynamic-2\nStack trace:\n  #0 ..\/lib\/igt_core.c:1607 __igt_fail_assert()\n  #1 ..\/runner\/testdata\/dynamic.c:5 __real_main3()\n  #2 ..\/runner\/testdata\/dynamic.c:3 main()\n  #3 ..\/csu\/libc-start.c:342 __libc_start_main()\n  #4 [_start+0x2a]\nDynamic subtest this-is-dynamic-2: FAIL (0.054s)\nSubtest debug-log-checking: FAIL (0.109s)\n",
-      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)",
-      "result":"fail",
-      "time":{
-        "__type__":"TimeAttribute",
-        "start":0,
-        "end":0.054
+        "end":0.109
       },
-      "err":"Starting dynamic subtest: this-is-dynamic-2\n(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, file ..\/runner\/testdata\/dynamic.c:13:\n(dynamic:20904) CRITICAL: Failed assertion: false\nDynamic subtest this-is-dynamic-2 failed.\n**** DEBUG ****\n(dynamic:20904) DEBUG: This print is from 2\n(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, file ..\/runner\/testdata\/dynamic.c:13:\n(dynamic:20904) CRITICAL: Failed assertion: false\n(dynamic:20904) igt_core-INFO: Stack trace:\n(dynamic:20904) igt_core-INFO:   #0 ..\/lib\/igt_core.c:1607 __igt_fail_assert()\n(dynamic:20904) igt_core-INFO:   #1 ..\/runner\/testdata\/dynamic.c:5 __real_main3()\n(dynamic:20904) igt_core-INFO:   #2 ..\/runner\/testdata\/dynamic.c:3 main()\n(dynamic:20904) igt_core-INFO:   #3 ..\/csu\/libc-start.c:342 __libc_start_main()\n(dynamic:20904) igt_core-INFO:   #4 [_start+0x2a]\n****  END  ****\nDynamic subtest this-is-dynamic-2: FAIL (0.054s)\nSubtest debu
 g-log-checking failed.\nNo log.\nSubtest debug-log-checking: FAIL (0.109s)\n",
-      "dmesg":"<6> [23426155.240164] [IGT] dynamic: starting dynamic subtest this-is-dynamic-2\n<6> [23426155.293846] [IGT] dynamic: exiting, ret=98\n<6> [23426155.294003] Console: switching to colour frame buffer device 240x75\n"
+      "err":"Starting subtest: debug-log-checking\nStarting dynamic subtest: this-is-dynamic-1\n(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, file ..\/runner\/testdata\/dynamic.c:8:\n(dynamic:20904) CRITICAL: Failed assertion: false\nDynamic subtest this-is-dynamic-1 failed.\n**** DEBUG ****\n(dynamic:20904) DEBUG: This print is from 1\n(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, file ..\/runner\/testdata\/dynamic.c:8:\n(dynamic:20904) CRITICAL: Failed assertion: false\n(dynamic:20904) igt_core-INFO: Stack trace:\n(dynamic:20904) igt_core-INFO:   #0 ..\/lib\/igt_core.c:1607 __igt_fail_assert()\n(dynamic:20904) igt_core-INFO:   #1 ..\/runner\/testdata\/dynamic.c:11 __real_main3()\n(dynamic:20904) igt_core-INFO:   #2 ..\/runner\/testdata\/dynamic.c:3 main()\n(dynamic:20904) igt_core-INFO:   #3 ..\/csu\/libc-start.c:342 __libc_start_main()\n(dynamic:20904) igt_core-INFO:   #4 [_start+0x2a]\n****  END  ****\nDynamic subtest this-is-d
 ynamic-1: FAIL (0.055s)\nStarting dynamic subtest: this-is-dynamic-2\n(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, file ..\/runner\/testdata\/dynamic.c:13:\n(dynamic:20904) CRITICAL: Failed assertion: false\nDynamic subtest this-is-dynamic-2 failed.\n**** DEBUG ****\n(dynamic:20904) DEBUG: This print is from 2\n(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, file ..\/runner\/testdata\/dynamic.c:13:\n(dynamic:20904) CRITICAL: Failed assertion: false\n(dynamic:20904) igt_core-INFO: Stack trace:\n(dynamic:20904) igt_core-INFO:   #0 ..\/lib\/igt_core.c:1607 __igt_fail_assert()\n(dynamic:20904) igt_core-INFO:   #1 ..\/runner\/testdata\/dynamic.c:5 __real_main3()\n(dynamic:20904) igt_core-INFO:   #2 ..\/runner\/testdata\/dynamic.c:3 main()\n(dynamic:20904) igt_core-INFO:   #3 ..\/csu\/libc-start.c:342 __libc_start_main()\n(dynamic:20904) igt_core-INFO:   #4 [_start+0x2a]\n****  END  ****\nDynamic subtest this-is-dynamic-2: FAIL (0.054s)\n
 Subtest debug-log-checking failed.\nNo log.\nSubtest debug-log-checking: FAIL (0.109s)\n",
+      "dmesg":"<6> [23426155.175691] Console: switching to colour dummy device 80x25\n<6> [23426155.175708] [IGT] dynamic: executing\n<6> [23426155.184875] [IGT] dynamic: starting subtest debug-log-checking\n<6> [23426155.184895] [IGT] dynamic: starting dynamic subtest this-is-dynamic-1\n<6> [23426155.240164] [IGT] dynamic: starting dynamic subtest this-is-dynamic-2\n<6> [23426155.293846] [IGT] dynamic: exiting, ret=98\n<6> [23426155.294003] Console: switching to colour frame buffer device 240x75\n"
     },
     "igt@dynamic@empty-container":{
       "out":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)\nStarting subtest: empty-container\nThis should skip\nNo dynamic tests executed.\nSubtest empty-container: SKIP (0.000s)\n",
@@ -45,19 +33,19 @@
       "err":"Starting subtest: empty-container\nSubtest empty-container: SKIP (0.000s)\n",
       "dmesg":"<6> [23426155.304955] Console: switching to colour dummy device 80x25\n<6> [23426155.304968] [IGT] dynamic: executing\n<6> [23426155.308644] [IGT] dynamic: starting subtest empty-container\n<6> [23426155.308671] [IGT] dynamic: exiting, ret=77\n<6> [23426155.308822] Console: switching to colour frame buffer device 240x75\n"
     },
-    "igt@dynamic@normal@normal-dynamic-subtest":{
+    "igt@dynamic@normal":{
       "out":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)\nStarting subtest: normal\nStarting dynamic subtest: normal-dynamic-subtest\nDynamic subtest normal-dynamic-subtest: SUCCESS (0.055s)\nSubtest normal: SUCCESS (0.100s)\n",
       "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)",
       "result":"pass",
       "time":{
         "__type__":"TimeAttribute",
         "start":0,
-        "end":0.055
+        "end":0.100
       },
       "err":"Starting subtest: normal\nStarting dynamic subtest: normal-dynamic-subtest\nDynamic subtest normal-dynamic-subtest: SUCCESS (0.055s)\nSubtest normal: SUCCESS (0.100s)\n",
       "dmesg":"<6> [23426155.175691] Console: switching to colour dummy device 80x25\n<6> [23426155.175708] [IGT] dynamic: executing\n<6> [23426155.184875] [IGT] dynamic: starting subtest normal\n<6> [23426155.184895] Dmesg output for normal\n<6> [23426155.184895] [IGT] dynamic: starting dynamic subtest normal-dynamic-subtest\n"
     },
-    "igt@dynamic@incomplete@this-is-incomplete":{
+    "igt@dynamic@incomplete":{
       "out":"Starting subtest: incomplete\nStarting dynamic subtest: this-is-incomplete\nThis is some output\n",
       "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)",
       "result":"incomplete",
@@ -93,7 +81,7 @@
       "abort":0,
       "timeout":0,
       "notrun":0,
-      "fail":2,
+      "fail":1,
       "warn":0
     },
     "root":{
@@ -106,7 +94,7 @@
       "abort":0,
       "timeout":0,
       "notrun":0,
-      "fail":2,
+      "fail":1,
       "warn":0
     },
     "igt@dynamic":{
@@ -119,7 +107,7 @@
       "abort":0,
       "timeout":0,
       "notrun":0,
-      "fail":2,
+      "fail":1,
       "warn":0
     }
   },
diff --git a/runner/runner_json_tests.c b/runner/runner_json_tests.c
index a7a1e8de..29996ab5 100644
--- a/runner/runner_json_tests.c
+++ b/runner/runner_json_tests.c
@@ -163,6 +163,7 @@ static const char *dirnames[] = {
 	"dmesg-warn-level-piglit-style",
 	"dmesg-warn-level-one-piglit-style",
 	"dynamic-subtests",
+	"dynamic-subtests-prune-dynamics",
 	"dynamic-subtest-name-in-multiple-subtests",
 	"unprintable-characters",
 	"empty-result-files",
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
