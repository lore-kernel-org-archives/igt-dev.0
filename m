Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F386E96A
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2019 09:48:09 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 17 Dec 2019 11:48:00 +0200
Message-Id: <20191217094800.30687-11-petri.latvala@intel.com>
In-Reply-To: <20191217094800.30687-1-petri.latvala@intel.com>
References: <20191217094800.30687-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 11/11] runner/json_tests: Add test for
 parsing dynamic subtests with same name
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

Multiple different subtests can have a dynamic subtest with the same
name. Add a test to make sure we correctly delimit the output parsing.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 .../0/dmesg.txt                               | 10 +++
 .../0/err.txt                                 | 10 +++
 .../0/journal.txt                             |  3 +
 .../0/out.txt                                 | 11 +++
 .../README.txt                                |  2 +
 .../endtime.txt                               |  1 +
 .../joblist.txt                               |  1 +
 .../metadata.txt                              | 12 +++
 .../reference.json                            | 84 +++++++++++++++++++
 .../starttime.txt                             |  1 +
 .../uname.txt                                 |  1 +
 runner/runner_json_tests.c                    |  1 +
 12 files changed, 137 insertions(+)
 create mode 100644 runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/0/dmesg.txt
 create mode 100644 runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/0/err.txt
 create mode 100644 runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/0/journal.txt
 create mode 100644 runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/0/out.txt
 create mode 100644 runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/README.txt
 create mode 100644 runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/endtime.txt
 create mode 100644 runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/joblist.txt
 create mode 100644 runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/metadata.txt
 create mode 100644 runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/reference.json
 create mode 100644 runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/starttime.txt
 create mode 100644 runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/uname.txt

diff --git a/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/0/dmesg.txt b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/0/dmesg.txt
new file mode 100644
index 00000000..59741e5f
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/0/dmesg.txt
@@ -0,0 +1,10 @@
+6,1157,23426155175691,-;Console: switching to colour dummy device 80x25
+14,1158,23426155175708,-;[IGT] dynamic: executing
+14,1159,23426155184875,-;[IGT] dynamic: starting subtest subtest-one
+14,1160,23426155184895,-;[IGT] dynamic: starting dynamic subtest this-name-is-shared
+14,1160,23426155184895,-;This dmesg output is from subtest-one/this-name-is-shared
+14,1159,23426155184875,-;[IGT] dynamic: starting subtest subtest-two
+14,1160,23426155184895,-;[IGT] dynamic: starting dynamic subtest this-name-is-shared
+14,1160,23426155184895,-;This dmesg output is from subtest-two/this-name-is-shared
+14,1162,23426155293846,-;[IGT] dynamic: exiting, ret=0
+6,1163,23426155294003,-;Console: switching to colour frame buffer device 240x75
diff --git a/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/0/err.txt b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/0/err.txt
new file mode 100644
index 00000000..3d551819
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/0/err.txt
@@ -0,0 +1,10 @@
+Starting subtest: subtest-one
+Starting dynamic subtest: this-name-is-shared
+This stderr output is from subtest-one/this-name-is-shared
+Dynamic subtest this-name-is-shared: SUCCESS (0.050s)
+Subtest subtest-one: SUCCESS (0.050s)
+Starting subtest: subtest-two
+Starting dynamic subtest: this-name-is-shared
+This stderr output is from subtest-two/this-name-is-shared
+Dynamic subtest this-name-is-shared: SUCCESS (0.050s)
+Subtest subtest-two: SUCCESS (0.050s)
diff --git a/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/0/journal.txt b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/0/journal.txt
new file mode 100644
index 00000000..3af2b007
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/0/journal.txt
@@ -0,0 +1,3 @@
+subtest-one
+subtest-two
+exit:0 (0.100s)
diff --git a/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/0/out.txt b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/0/out.txt
new file mode 100644
index 00000000..e025c096
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/0/out.txt
@@ -0,0 +1,11 @@
+IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)
+Starting subtest: subtest-one
+Starting dynamic subtest: this-name-is-shared
+This stdout output is from subtest-one/this-name-is-shared
+Dynamic subtest this-name-is-shared: SUCCESS (0.050s)
+Subtest subtest-one: SUCCESS (0.050s)
+Starting subtest: subtest-two
+Starting dynamic subtest: this-name-is-shared
+This stdout output is from subtest-two/this-name-is-shared
+Dynamic subtest this-name-is-shared: SUCCESS (0.050s)
+Subtest subtest-two: SUCCESS (0.050s)
diff --git a/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/README.txt b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/README.txt
new file mode 100644
index 00000000..e141077d
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/README.txt
@@ -0,0 +1,2 @@
+Parsing of dynamic subtest output is tricky if multiple subtests use
+the same name for a dynamic subtest.
diff --git a/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/endtime.txt b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/endtime.txt
new file mode 100644
index 00000000..5c7608b5
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/endtime.txt
@@ -0,0 +1 @@
+1560163492.410489
diff --git a/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/joblist.txt b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/joblist.txt
new file mode 100644
index 00000000..9296b9ed
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/joblist.txt
@@ -0,0 +1 @@
+dynamic subtest-one,subtest-two
diff --git a/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/metadata.txt b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/metadata.txt
new file mode 100644
index 00000000..8da1aee2
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/metadata.txt
@@ -0,0 +1,12 @@
+abort_mask : 0
+name : dynamic-subtest-name-in-multiple-subtests
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
diff --git a/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/reference.json b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/reference.json
new file mode 100644
index 00000000..370fce4d
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/reference.json
@@ -0,0 +1,84 @@
+{
+  "__type__":"TestrunResult",
+  "results_version":10,
+  "name":"dynamic-subtest-name-in-multiple-subtests",
+  "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "time_elapsed":{
+    "__type__":"TimeAttribute",
+    "start":1560163492.266377,
+    "end":1560163492.4104891
+  },
+  "tests":{
+    "igt@dynamic@subtest-one@this-name-is-shared":{
+      "out":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)\nStarting subtest: subtest-one\nStarting dynamic subtest: this-name-is-shared\nThis stdout output is from subtest-one\/this-name-is-shared\nDynamic subtest this-name-is-shared: SUCCESS (0.050s)\nSubtest subtest-one: SUCCESS (0.050s)\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)",
+      "result":"warn",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0,
+        "end":0.050000000000000003
+      },
+      "err":"Starting subtest: subtest-one\nStarting dynamic subtest: this-name-is-shared\nThis stderr output is from subtest-one\/this-name-is-shared\nDynamic subtest this-name-is-shared: SUCCESS (0.050s)\nSubtest subtest-one: SUCCESS (0.050s)\n",
+      "dmesg":"<6> [23426155.175691] Console: switching to colour dummy device 80x25\n<6> [23426155.175708] [IGT] dynamic: executing\n<6> [23426155.184875] [IGT] dynamic: starting subtest subtest-one\n<6> [23426155.184895] [IGT] dynamic: starting dynamic subtest this-name-is-shared\n<6> [23426155.184895] This dmesg output is from subtest-one\/this-name-is-shared\n"
+    },
+    "igt@dynamic@subtest-two@this-name-is-shared":{
+      "out":"Starting subtest: subtest-two\nStarting dynamic subtest: this-name-is-shared\nThis stdout output is from subtest-two\/this-name-is-shared\nDynamic subtest this-name-is-shared: SUCCESS (0.050s)\nSubtest subtest-two: SUCCESS (0.050s)\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)",
+      "result":"warn",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0,
+        "end":0.050000000000000003
+      },
+      "err":"Starting subtest: subtest-two\nStarting dynamic subtest: this-name-is-shared\nThis stderr output is from subtest-two\/this-name-is-shared\nDynamic subtest this-name-is-shared: SUCCESS (0.050s)\nSubtest subtest-two: SUCCESS (0.050s)\n",
+      "dmesg":"<6> [23426155.184875] [IGT] dynamic: starting subtest subtest-two\n<6> [23426155.184895] [IGT] dynamic: starting dynamic subtest this-name-is-shared\n<6> [23426155.184895] This dmesg output is from subtest-two\/this-name-is-shared\n<6> [23426155.293846] [IGT] dynamic: exiting, ret=0\n<6> [23426155.294003] Console: switching to colour frame buffer device 240x75\n"
+    }
+  },
+  "totals":{
+    "":{
+      "crash":0,
+      "pass":0,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":0,
+      "incomplete":0,
+      "timeout":0,
+      "notrun":0,
+      "fail":0,
+      "warn":2
+    },
+    "root":{
+      "crash":0,
+      "pass":0,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":0,
+      "incomplete":0,
+      "timeout":0,
+      "notrun":0,
+      "fail":0,
+      "warn":2
+    },
+    "igt@dynamic":{
+      "crash":0,
+      "pass":0,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":0,
+      "incomplete":0,
+      "timeout":0,
+      "notrun":0,
+      "fail":0,
+      "warn":2
+    }
+  },
+  "runtimes":{
+    "igt@dynamic":{
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0,
+        "end":0.10000000000000001
+      }
+    }
+  }
+}
diff --git a/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/starttime.txt b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/starttime.txt
new file mode 100644
index 00000000..b30b32ee
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/starttime.txt
@@ -0,0 +1 @@
+1560163492.266377
diff --git a/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/uname.txt b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/uname.txt
new file mode 100644
index 00000000..a7aef6f7
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/uname.txt
@@ -0,0 +1 @@
+Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64
diff --git a/runner/runner_json_tests.c b/runner/runner_json_tests.c
index 3443bd2b..21e87a02 100644
--- a/runner/runner_json_tests.c
+++ b/runner/runner_json_tests.c
@@ -163,6 +163,7 @@ static const char *dirnames[] = {
 	"dmesg-warn-level-piglit-style",
 	"dmesg-warn-level-one-piglit-style",
 	"dynamic-subtests",
+	"dynamic-subtest-name-in-multiple-subtests",
 };
 
 igt_main
-- 
2.19.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
