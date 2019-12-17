Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0055C6E969
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2019 09:48:09 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 17 Dec 2019 11:47:59 +0200
Message-Id: <20191217094800.30687-10-petri.latvala@intel.com>
In-Reply-To: <20191217094800.30687-1-petri.latvala@intel.com>
References: <20191217094800.30687-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 10/11] runner/json_tests: Adapt to no longer
 reporting subtests with dynamic subtests
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
Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 .../dynamic-subtests/reference.json           | 54 ++++---------------
 1 file changed, 9 insertions(+), 45 deletions(-)

diff --git a/runner/json_tests_data/dynamic-subtests/reference.json b/runner/json_tests_data/dynamic-subtests/reference.json
index 24a1fe8c..ca8f6cd7 100644
--- a/runner/json_tests_data/dynamic-subtests/reference.json
+++ b/runner/json_tests_data/dynamic-subtests/reference.json
@@ -9,18 +9,6 @@
     "end":1560163492.4104891
   },
   "tests":{
-    "igt@dynamic@debug-log-checking":{
-      "out":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)\nStarting subtest: debug-log-checking\nStarting dynamic subtest: this-is-dynamic-1\nStack trace:\n  #0 ..\/lib\/igt_core.c:1607 __igt_fail_assert()\n  #1 ..\/runner\/testdata\/dynamic.c:11 __real_main3()\n  #2 ..\/runner\/testdata\/dynamic.c:3 main()\n  #3 ..\/csu\/libc-start.c:342 __libc_start_main()\n  #4 [_start+0x2a]\nDynamic subtest this-is-dynamic-1: FAIL (0.055s)\nStarting dynamic subtest: this-is-dynamic-2\nStack trace:\n  #0 ..\/lib\/igt_core.c:1607 __igt_fail_assert()\n  #1 ..\/runner\/testdata\/dynamic.c:5 __real_main3()\n  #2 ..\/runner\/testdata\/dynamic.c:3 main()\n  #3 ..\/csu\/libc-start.c:342 __libc_start_main()\n  #4 [_start+0x2a]\nDynamic subtest this-is-dynamic-2: FAIL (0.054s)\nSubtest debug-log-checking: FAIL (0.109s)\n",
-      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)",
-      "result":"fail",
-      "time":{
-        "__type__":"TimeAttribute",
-        "start":0,
-        "end":0.109
-      },
-      "err":"Starting subtest: debug-log-checking\nStarting dynamic subtest: this-is-dynamic-1\n(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, file ..\/runner\/testdata\/dynamic.c:8:\n(dynamic:20904) CRITICAL: Failed assertion: false\nDynamic subtest this-is-dynamic-1 failed.\n**** DEBUG ****\n(dynamic:20904) DEBUG: This print is from 1\n(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, file ..\/runner\/testdata\/dynamic.c:8:\n(dynamic:20904) CRITICAL: Failed assertion: false\n(dynamic:20904) igt_core-INFO: Stack trace:\n(dynamic:20904) igt_core-INFO:   #0 ..\/lib\/igt_core.c:1607 __igt_fail_assert()\n(dynamic:20904) igt_core-INFO:   #1 ..\/runner\/testdata\/dynamic.c:11 __real_main3()\n(dynamic:20904) igt_core-INFO:   #2 ..\/runner\/testdata\/dynamic.c:3 main()\n(dynamic:20904) igt_core-INFO:   #3 ..\/csu\/libc-start.c:342 __libc_start_main()\n(dynamic:20904) igt_core-INFO:   #4 [_start+0x2a]\n****  END  ****\nDynamic subtest this-is-d
 ynamic-1: FAIL (0.055s)\nStarting dynamic subtest: this-is-dynamic-2\n(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, file ..\/runner\/testdata\/dynamic.c:13:\n(dynamic:20904) CRITICAL: Failed assertion: false\nDynamic subtest this-is-dynamic-2 failed.\n**** DEBUG ****\n(dynamic:20904) DEBUG: This print is from 2\n(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, file ..\/runner\/testdata\/dynamic.c:13:\n(dynamic:20904) CRITICAL: Failed assertion: false\n(dynamic:20904) igt_core-INFO: Stack trace:\n(dynamic:20904) igt_core-INFO:   #0 ..\/lib\/igt_core.c:1607 __igt_fail_assert()\n(dynamic:20904) igt_core-INFO:   #1 ..\/runner\/testdata\/dynamic.c:5 __real_main3()\n(dynamic:20904) igt_core-INFO:   #2 ..\/runner\/testdata\/dynamic.c:3 main()\n(dynamic:20904) igt_core-INFO:   #3 ..\/csu\/libc-start.c:342 __libc_start_main()\n(dynamic:20904) igt_core-INFO:   #4 [_start+0x2a]\n****  END  ****\nDynamic subtest this-is-dynamic-2: FAIL (0.054s)\n
 Subtest debug-log-checking failed.\nNo log.\nSubtest debug-log-checking: FAIL (0.109s)\n",
-      "dmesg":"<6> [23426155.175691] Console: switching to colour dummy device 80x25\n<6> [23426155.175708] [IGT] dynamic: executing\n<6> [23426155.184875] [IGT] dynamic: starting subtest debug-log-checking\n<6> [23426155.184895] [IGT] dynamic: starting dynamic subtest this-is-dynamic-1\n<6> [23426155.240164] [IGT] dynamic: starting dynamic subtest this-is-dynamic-2\n<6> [23426155.293846] [IGT] dynamic: exiting, ret=98\n<6> [23426155.294003] Console: switching to colour frame buffer device 240x75\n"
-    },
     "igt@dynamic@debug-log-checking@this-is-dynamic-1":{
       "out":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)\nStarting subtest: debug-log-checking\nStarting dynamic subtest: this-is-dynamic-1\nStack trace:\n  #0 ..\/lib\/igt_core.c:1607 __igt_fail_assert()\n  #1 ..\/runner\/testdata\/dynamic.c:11 __real_main3()\n  #2 ..\/runner\/testdata\/dynamic.c:3 main()\n  #3 ..\/csu\/libc-start.c:342 __libc_start_main()\n  #4 [_start+0x2a]\nDynamic subtest this-is-dynamic-1: FAIL (0.055s)\n",
       "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)",
@@ -57,18 +45,6 @@
       "err":"Starting subtest: empty-container\nSubtest empty-container: SKIP (0.000s)\n",
       "dmesg":"<6> [23426155.304955] Console: switching to colour dummy device 80x25\n<6> [23426155.304968] [IGT] dynamic: executing\n<6> [23426155.308644] [IGT] dynamic: starting subtest empty-container\n<6> [23426155.308671] [IGT] dynamic: exiting, ret=77\n<6> [23426155.308822] Console: switching to colour frame buffer device 240x75\n"
     },
-    "igt@dynamic@normal":{
-      "out":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)\nStarting subtest: normal\nStarting dynamic subtest: normal-dynamic-subtest\nDynamic subtest normal-dynamic-subtest: SUCCESS (0.055s)\nSubtest normal: SUCCESS (0.100s)\n",
-      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)",
-      "result":"pass",
-      "time":{
-        "__type__":"TimeAttribute",
-        "start":0,
-        "end":0.100
-      },
-      "err":"Starting subtest: normal\nStarting dynamic subtest: normal-dynamic-subtest\nDynamic subtest normal-dynamic-subtest: SUCCESS (0.055s)\nSubtest normal: SUCCESS (0.100s)\n",
-      "dmesg":"<6> [23426155.175691] Console: switching to colour dummy device 80x25\n<6> [23426155.175708] [IGT] dynamic: executing\n<6> [23426155.184875] [IGT] dynamic: starting subtest normal\n<6> [23426155.184895] Dmesg output for normal\n<6> [23426155.184895] [IGT] dynamic: starting dynamic subtest normal-dynamic-subtest\n"
-    },
     "igt@dynamic@normal@normal-dynamic-subtest":{
       "out":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)\nStarting subtest: normal\nStarting dynamic subtest: normal-dynamic-subtest\nDynamic subtest normal-dynamic-subtest: SUCCESS (0.055s)\nSubtest normal: SUCCESS (0.100s)\n",
       "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)",
@@ -81,18 +57,6 @@
       "err":"Starting subtest: normal\nStarting dynamic subtest: normal-dynamic-subtest\nDynamic subtest normal-dynamic-subtest: SUCCESS (0.055s)\nSubtest normal: SUCCESS (0.100s)\n",
       "dmesg":"<6> [23426155.175691] Console: switching to colour dummy device 80x25\n<6> [23426155.175708] [IGT] dynamic: executing\n<6> [23426155.184875] [IGT] dynamic: starting subtest normal\n<6> [23426155.184895] Dmesg output for normal\n<6> [23426155.184895] [IGT] dynamic: starting dynamic subtest normal-dynamic-subtest\n"
     },
-    "igt@dynamic@incomplete":{
-      "out":"Starting subtest: incomplete\nStarting dynamic subtest: this-is-incomplete\nThis is some output\n",
-      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)",
-      "result":"incomplete",
-      "time":{
-        "__type__":"TimeAttribute",
-        "start":0,
-        "end":0
-      },
-      "err":"Starting subtest: incomplete\nStarting dynamic subtest: this-is-incomplete\n",
-      "dmesg":"<6> [23426155.184875] [IGT] dynamic: starting subtest incomplete\n<6> [23426155.184895] [IGT] dynamic: starting dynamic subtest this-is-incomplete\n<6> [23426155.184895] Dmesg output for incomplete\n"
-    },
     "igt@dynamic@incomplete@this-is-incomplete":{
       "out":"Starting subtest: incomplete\nStarting dynamic subtest: this-is-incomplete\nThis is some output\n",
       "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)",
@@ -121,38 +85,38 @@
   "totals":{
     "":{
       "crash":0,
-      "pass":3,
+      "pass":2,
       "dmesg-fail":0,
       "dmesg-warn":0,
       "skip":1,
-      "incomplete":2,
+      "incomplete":1,
       "timeout":0,
       "notrun":0,
-      "fail":3,
+      "fail":2,
       "warn":0
     },
     "root":{
       "crash":0,
-      "pass":3,
+      "pass":2,
       "dmesg-fail":0,
       "dmesg-warn":0,
       "skip":1,
-      "incomplete":2,
+      "incomplete":1,
       "timeout":0,
       "notrun":0,
-      "fail":3,
+      "fail":2,
       "warn":0
     },
     "igt@dynamic":{
       "crash":0,
-      "pass":3,
+      "pass":2,
       "dmesg-fail":0,
       "dmesg-warn":0,
       "skip":1,
-      "incomplete":2,
+      "incomplete":1,
       "timeout":0,
       "notrun":0,
-      "fail":3,
+      "fail":2,
       "warn":0
     }
   },
-- 
2.19.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
