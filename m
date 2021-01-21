Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A136E06E
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Jan 2021 09:50:25 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 21 Jan 2021 11:50:15 +0200
Message-Id: <20210121095015.12102-2-petri.latvala@intel.com>
In-Reply-To: <20210121095015.12102-1-petri.latvala@intel.com>
References: <20210121095015.12102-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] runner: Add json test for handling
 graceful exit via SIGHUP
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
Cc: Arkadiusz Hiler <arek@hiler.eu>
---
 .../graceful-notrun/0/dmesg.txt               |   3 +
 .../json_tests_data/graceful-notrun/0/err.txt |   1 +
 .../graceful-notrun/0/journal.txt             |   2 +
 .../json_tests_data/graceful-notrun/0/out.txt |   2 +
 .../graceful-notrun/README.txt                |   2 +
 .../graceful-notrun/endtime.txt               |   1 +
 .../graceful-notrun/joblist.txt               |   5 +
 .../graceful-notrun/metadata.txt              |  12 ++
 .../graceful-notrun/reference.json            | 120 ++++++++++++++++++
 .../graceful-notrun/starttime.txt             |   1 +
 .../json_tests_data/graceful-notrun/uname.txt |   1 +
 runner/runner_json_tests.c                    |   1 +
 12 files changed, 151 insertions(+)
 create mode 100644 runner/json_tests_data/graceful-notrun/0/dmesg.txt
 create mode 100644 runner/json_tests_data/graceful-notrun/0/err.txt
 create mode 100644 runner/json_tests_data/graceful-notrun/0/journal.txt
 create mode 100644 runner/json_tests_data/graceful-notrun/0/out.txt
 create mode 100644 runner/json_tests_data/graceful-notrun/README.txt
 create mode 100644 runner/json_tests_data/graceful-notrun/endtime.txt
 create mode 100644 runner/json_tests_data/graceful-notrun/joblist.txt
 create mode 100644 runner/json_tests_data/graceful-notrun/metadata.txt
 create mode 100644 runner/json_tests_data/graceful-notrun/reference.json
 create mode 100644 runner/json_tests_data/graceful-notrun/starttime.txt
 create mode 100644 runner/json_tests_data/graceful-notrun/uname.txt

diff --git a/runner/json_tests_data/graceful-notrun/0/dmesg.txt b/runner/json_tests_data/graceful-notrun/0/dmesg.txt
new file mode 100644
index 00000000..0bc5b2be
--- /dev/null
+++ b/runner/json_tests_data/graceful-notrun/0/dmesg.txt
@@ -0,0 +1,3 @@
+6,951,3216186095083,-;Console: switching to colour dummy device 80x25
+14,952,3216186095097,-;[IGT] successtest: executing
+14,953,3216186101115,-;[IGT] successtest: starting subtest first-subtest
diff --git a/runner/json_tests_data/graceful-notrun/0/err.txt b/runner/json_tests_data/graceful-notrun/0/err.txt
new file mode 100644
index 00000000..aa5dd375
--- /dev/null
+++ b/runner/json_tests_data/graceful-notrun/0/err.txt
@@ -0,0 +1 @@
+Starting subtest: first-subtest
diff --git a/runner/json_tests_data/graceful-notrun/0/journal.txt b/runner/json_tests_data/graceful-notrun/0/journal.txt
new file mode 100644
index 00000000..26dd213c
--- /dev/null
+++ b/runner/json_tests_data/graceful-notrun/0/journal.txt
@@ -0,0 +1,2 @@
+first-subtest
+exit:-1 (0.014s)
diff --git a/runner/json_tests_data/graceful-notrun/0/out.txt b/runner/json_tests_data/graceful-notrun/0/out.txt
new file mode 100644
index 00000000..bc8ba599
--- /dev/null
+++ b/runner/json_tests_data/graceful-notrun/0/out.txt
@@ -0,0 +1,2 @@
+IGT-Version: 1.23-g0c763bfd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)
+Starting subtest: first-subtest
diff --git a/runner/json_tests_data/graceful-notrun/README.txt b/runner/json_tests_data/graceful-notrun/README.txt
new file mode 100644
index 00000000..e3c826bb
--- /dev/null
+++ b/runner/json_tests_data/graceful-notrun/README.txt
@@ -0,0 +1,2 @@
+Gracefully exit when runner is signaled with SIGHUP. The running test
+should be marked as 'notrun'.
diff --git a/runner/json_tests_data/graceful-notrun/endtime.txt b/runner/json_tests_data/graceful-notrun/endtime.txt
new file mode 100644
index 00000000..635f6ae9
--- /dev/null
+++ b/runner/json_tests_data/graceful-notrun/endtime.txt
@@ -0,0 +1 @@
+1539953735.172373
diff --git a/runner/json_tests_data/graceful-notrun/joblist.txt b/runner/json_tests_data/graceful-notrun/joblist.txt
new file mode 100644
index 00000000..31ef8413
--- /dev/null
+++ b/runner/json_tests_data/graceful-notrun/joblist.txt
@@ -0,0 +1,5 @@
+successtest first-subtest
+successtest second-subtest
+no-subtests
+skippers skip-one
+skippers skip-two
diff --git a/runner/json_tests_data/graceful-notrun/metadata.txt b/runner/json_tests_data/graceful-notrun/metadata.txt
new file mode 100644
index 00000000..55354725
--- /dev/null
+++ b/runner/json_tests_data/graceful-notrun/metadata.txt
@@ -0,0 +1,12 @@
+abort_mask : 3
+name : graceful-notrun
+dry_run : 0
+sync : 0
+log_level : 0
+overwrite : 0
+multiple_mode : 0
+inactivity_timeout : 0
+use_watchdog : 0
+piglit_style_dmesg : 0
+test_root : /path/does/not/exist
+results_path : /path/does/not/exist
diff --git a/runner/json_tests_data/graceful-notrun/reference.json b/runner/json_tests_data/graceful-notrun/reference.json
new file mode 100644
index 00000000..c95bdfec
--- /dev/null
+++ b/runner/json_tests_data/graceful-notrun/reference.json
@@ -0,0 +1,120 @@
+{
+  "__type__":"TestrunResult",
+  "results_version":10,
+  "name":"graceful-notrun",
+  "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "time_elapsed":{
+    "__type__":"TimeAttribute",
+    "start":1539953735.1110389,
+    "end":1539953735.1723731
+  },
+  "tests":{
+    "igt@successtest@first-subtest":{
+      "out":"IGT-Version: 1.23-g0c763bfd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)\nStarting subtest: first-subtest\n",
+      "igt-version":"IGT-Version: 1.23-g0c763bfd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)",
+      "result":"notrun",
+      "err":"Starting subtest: first-subtest\n",
+      "dmesg":"<6> [3216186.095083] Console: switching to colour dummy device 80x25\n<6> [3216186.095097] [IGT] successtest: executing\n<6> [3216186.101115] [IGT] successtest: starting subtest first-subtest\n"
+    },
+    "igt@successtest@second-subtest":{
+	"out":"",
+	"err":"",
+	"dmesg":"",
+	"result":"notrun"
+    },
+    "igt@no-subtests":{
+	"out":"",
+	"err":"",
+	"dmesg":"",
+	"result":"notrun"
+    },
+      "igt@skippers@skip-one":{
+	"out":"",
+	"err":"",
+	"dmesg":"",
+	"result":"notrun"
+    },
+      "igt@skippers@skip-two":{
+	"out":"",
+	"err":"",
+	"dmesg":"",
+	"result":"notrun"
+    },
+  },
+  "totals":{
+    "":{
+      "crash":0,
+      "pass":0,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":0,
+      "incomplete":0,
+      "abort":0,
+      "timeout":0,
+      "notrun":5,
+      "fail":0,
+      "warn":0
+    },
+    "root":{
+      "crash":0,
+      "pass":0,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":0,
+      "incomplete":0,
+      "abort":0,
+      "timeout":0,
+      "notrun":5,
+      "fail":0,
+      "warn":0
+    },
+    "igt@successtest":{
+      "crash":0,
+      "pass":0,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":0,
+      "incomplete":0,
+      "abort":0,
+      "timeout":0,
+      "notrun":2,
+      "fail":0,
+      "warn":0
+    },
+    "igt@no-subtests":{
+      "crash":0,
+      "pass":0,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":0,
+      "incomplete":0,
+      "abort":0,
+      "timeout":0,
+      "notrun":1,
+      "fail":0,
+      "warn":0
+    },
+    "igt@skippers":{
+      "crash":0,
+      "pass":0,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":0,
+      "incomplete":0,
+      "abort":0,
+      "timeout":0,
+      "notrun":2,
+      "fail":0,
+      "warn":0
+    },
+  },
+  "runtimes":{
+    "igt@successtest":{
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0,
+        "end":0.014
+      }
+    },
+  }
+}
diff --git a/runner/json_tests_data/graceful-notrun/starttime.txt b/runner/json_tests_data/graceful-notrun/starttime.txt
new file mode 100644
index 00000000..ae038f18
--- /dev/null
+++ b/runner/json_tests_data/graceful-notrun/starttime.txt
@@ -0,0 +1 @@
+1539953735.111039
diff --git a/runner/json_tests_data/graceful-notrun/uname.txt b/runner/json_tests_data/graceful-notrun/uname.txt
new file mode 100644
index 00000000..a7aef6f7
--- /dev/null
+++ b/runner/json_tests_data/graceful-notrun/uname.txt
@@ -0,0 +1 @@
+Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64
diff --git a/runner/runner_json_tests.c b/runner/runner_json_tests.c
index a7a1e8de..43d7f6b9 100644
--- a/runner/runner_json_tests.c
+++ b/runner/runner_json_tests.c
@@ -166,6 +166,7 @@ static const char *dirnames[] = {
 	"dynamic-subtest-name-in-multiple-subtests",
 	"unprintable-characters",
 	"empty-result-files",
+	"graceful-notrun",
 };
 
 igt_main
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
