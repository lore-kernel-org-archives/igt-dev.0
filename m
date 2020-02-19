Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0767E6E5C8
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2020 12:19:45 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 19 Feb 2020 14:19:40 +0200
Message-Id: <20200219121940.18247-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner/resultgen: Provide output when test
 output is completely empty
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

If a machine is hard-hanging or otherwise rebooted at the correct
time, intermediary output files get created but nothing ever gets
written to them. That yields results that are completely empty and
hard to categorize or even sometimes detect automatically. Handle this
corner case explicitly with a custom text explaining what might have
happened to prod result analysis towards fixing the real issue instead
of wondering if test result processing is faulty.

The race for getting empty files is easier to hit than it seems. The
files get created by the runner before calling exec(), and there's
plenty of time to hit a really hard crash.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 .../empty-result-files/0/dmesg.txt            |  0
 .../empty-result-files/0/err.txt              |  0
 .../empty-result-files/0/journal.txt          |  0
 .../empty-result-files/0/out.txt              |  0
 .../empty-result-files/README.txt             |  2 +
 .../empty-result-files/endtime.txt            |  1 +
 .../empty-result-files/joblist.txt            |  1 +
 .../empty-result-files/metadata.txt           | 12 ++++
 .../empty-result-files/reference.json         | 59 +++++++++++++++++++
 .../empty-result-files/starttime.txt          |  1 +
 .../empty-result-files/uname.txt              |  1 +
 runner/resultgen.c                            | 25 ++++++++
 runner/runner_json_tests.c                    |  1 +
 13 files changed, 103 insertions(+)
 create mode 100644 runner/json_tests_data/empty-result-files/0/dmesg.txt
 create mode 100644 runner/json_tests_data/empty-result-files/0/err.txt
 create mode 100644 runner/json_tests_data/empty-result-files/0/journal.txt
 create mode 100644 runner/json_tests_data/empty-result-files/0/out.txt
 create mode 100644 runner/json_tests_data/empty-result-files/README.txt
 create mode 100644 runner/json_tests_data/empty-result-files/endtime.txt
 create mode 100644 runner/json_tests_data/empty-result-files/joblist.txt
 create mode 100644 runner/json_tests_data/empty-result-files/metadata.txt
 create mode 100644 runner/json_tests_data/empty-result-files/reference.json
 create mode 100644 runner/json_tests_data/empty-result-files/starttime.txt
 create mode 100644 runner/json_tests_data/empty-result-files/uname.txt

diff --git a/runner/json_tests_data/empty-result-files/0/dmesg.txt b/runner/json_tests_data/empty-result-files/0/dmesg.txt
new file mode 100644
index 00000000..e69de29b
diff --git a/runner/json_tests_data/empty-result-files/0/err.txt b/runner/json_tests_data/empty-result-files/0/err.txt
new file mode 100644
index 00000000..e69de29b
diff --git a/runner/json_tests_data/empty-result-files/0/journal.txt b/runner/json_tests_data/empty-result-files/0/journal.txt
new file mode 100644
index 00000000..e69de29b
diff --git a/runner/json_tests_data/empty-result-files/0/out.txt b/runner/json_tests_data/empty-result-files/0/out.txt
new file mode 100644
index 00000000..e69de29b
diff --git a/runner/json_tests_data/empty-result-files/README.txt b/runner/json_tests_data/empty-result-files/README.txt
new file mode 100644
index 00000000..c0266342
--- /dev/null
+++ b/runner/json_tests_data/empty-result-files/README.txt
@@ -0,0 +1,2 @@
+A run that rebooted just when a test was about to launch produces just
+empty intermediary result files that get special processing.
diff --git a/runner/json_tests_data/empty-result-files/endtime.txt b/runner/json_tests_data/empty-result-files/endtime.txt
new file mode 100644
index 00000000..635f6ae9
--- /dev/null
+++ b/runner/json_tests_data/empty-result-files/endtime.txt
@@ -0,0 +1 @@
+1539953735.172373
diff --git a/runner/json_tests_data/empty-result-files/joblist.txt b/runner/json_tests_data/empty-result-files/joblist.txt
new file mode 100644
index 00000000..81f914a7
--- /dev/null
+++ b/runner/json_tests_data/empty-result-files/joblist.txt
@@ -0,0 +1 @@
+successtest first-subtest
diff --git a/runner/json_tests_data/empty-result-files/metadata.txt b/runner/json_tests_data/empty-result-files/metadata.txt
new file mode 100644
index 00000000..ef7eddb6
--- /dev/null
+++ b/runner/json_tests_data/empty-result-files/metadata.txt
@@ -0,0 +1,12 @@
+abort_mask : 0
+name : empty-result-files
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
diff --git a/runner/json_tests_data/empty-result-files/reference.json b/runner/json_tests_data/empty-result-files/reference.json
new file mode 100644
index 00000000..ef225601
--- /dev/null
+++ b/runner/json_tests_data/empty-result-files/reference.json
@@ -0,0 +1,59 @@
+{
+  "__type__":"TestrunResult",
+  "results_version":10,
+  "name":"empty-result-files",
+  "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "time_elapsed":{
+    "__type__":"TimeAttribute",
+    "start":1539953735.1110389,
+    "end":1539953735.1723731
+  },
+  "tests":{
+    "igt@successtest@first-subtest":{
+	"out":"This test didn't produce any output. The machine probably rebooted ungracefully.\n",
+	"err":"",
+	"dmesg":"",
+	"result":"incomplete"
+    },
+  },
+  "totals":{
+    "":{
+      "crash":0,
+      "pass":0,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":0,
+      "incomplete":1,
+      "timeout":0,
+      "notrun":0,
+      "fail":0,
+      "warn":0
+    },
+    "root":{
+      "crash":0,
+      "pass":0,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":0,
+      "incomplete":1,
+      "timeout":0,
+      "notrun":0,
+      "fail":0,
+      "warn":0
+    },
+    "igt@successtest":{
+      "crash":0,
+      "pass":0,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":0,
+      "incomplete":1,
+      "timeout":0,
+      "notrun":0,
+      "fail":0,
+      "warn":0
+    },
+  },
+  "runtimes":{
+  }
+}
diff --git a/runner/json_tests_data/empty-result-files/starttime.txt b/runner/json_tests_data/empty-result-files/starttime.txt
new file mode 100644
index 00000000..ae038f18
--- /dev/null
+++ b/runner/json_tests_data/empty-result-files/starttime.txt
@@ -0,0 +1 @@
+1539953735.111039
diff --git a/runner/json_tests_data/empty-result-files/uname.txt b/runner/json_tests_data/empty-result-files/uname.txt
new file mode 100644
index 00000000..a7aef6f7
--- /dev/null
+++ b/runner/json_tests_data/empty-result-files/uname.txt
@@ -0,0 +1 @@
+Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64
diff --git a/runner/resultgen.c b/runner/resultgen.c
index 105ec887..611d36cb 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -1220,6 +1220,29 @@ static bool stderr_contains_warnings(const char *beg, const char *end)
 	return false;
 }
 
+static bool json_field_has_data(struct json_object *obj, const char *key)
+{
+	struct json_object *field;
+
+	if (json_object_object_get_ex(obj, key, &field))
+		return strcmp(json_object_get_string(field), "");
+
+	return false;
+}
+
+static void override_completely_empty_results(struct json_object *obj)
+{
+	if (json_field_has_data(obj, "out") ||
+	    json_field_has_data(obj, "err") ||
+	    json_field_has_data(obj, "dmesg"))
+		return;
+
+	json_object_object_add(obj, "out",
+			       json_object_new_string("This test didn't produce any output. "
+						      "The machine probably rebooted ungracefully.\n"));
+	set_result(obj, "incomplete");
+}
+
 static void override_result_single(struct json_object *obj)
 {
 	const char *errtext = "", *result = "";
@@ -1246,6 +1269,8 @@ static void override_result_single(struct json_object *obj)
 			set_result(obj, "dmesg-fail");
 		}
 	}
+
+	override_completely_empty_results(obj);
 }
 
 static void override_results(char *binary,
diff --git a/runner/runner_json_tests.c b/runner/runner_json_tests.c
index bf4c285b..a7a1e8de 100644
--- a/runner/runner_json_tests.c
+++ b/runner/runner_json_tests.c
@@ -165,6 +165,7 @@ static const char *dirnames[] = {
 	"dynamic-subtests",
 	"dynamic-subtest-name-in-multiple-subtests",
 	"unprintable-characters",
+	"empty-result-files",
 };
 
 igt_main
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
