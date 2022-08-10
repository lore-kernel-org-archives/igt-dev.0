Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405BDB15C4
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Aug 2022 13:55:46 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Wed, 10 Aug 2022 15:55:30 +0200
Message-Id: <20220810135530.992455-4-ryszard.knop@intel.com>
In-Reply-To: <20220810135530.992455-1-ryszard.knop@intel.com>
References: <20220810135530.992455-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] runner: Add an on-demand test for large
 files
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The test in question does not carry large files, as that would require
adding massive files to Git. The tested logic is not any different for
large files, it's just a check if the JSON library can handle them.

To run this test, use generate_data.py. You'll need around 13GB of free
space and 10+ minutes to run this test successfully. The test will be
skipped by default if the SKIP_ME marker exists.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 .../really-large-files/.gitignore             |  3 +
 .../really-large-files/0/dmesg.txt            |  0
 .../really-large-files/0/err.txt              |  0
 .../really-large-files/0/journal.txt          |  0
 .../really-large-files/0/out.txt              |  1 +
 .../really-large-files/README.txt             |  7 +++
 .../really-large-files/SKIP_ME                |  1 +
 .../really-large-files/endtime.txt            |  1 +
 .../really-large-files/generate_data.py       | 20 ++++++
 .../really-large-files/joblist.txt            |  1 +
 .../really-large-files/metadata.txt           | 12 ++++
 .../really-large-files/reference.json         | 62 +++++++++++++++++++
 .../really-large-files/starttime.txt          |  1 +
 .../really-large-files/uname.txt              |  1 +
 runner/runner_json_tests.c                    |  8 ++-
 15 files changed, 117 insertions(+), 1 deletion(-)
 create mode 100644 runner/json_tests_data/really-large-files/.gitignore
 create mode 100644 runner/json_tests_data/really-large-files/0/dmesg.txt
 create mode 100644 runner/json_tests_data/really-large-files/0/err.txt
 create mode 100644 runner/json_tests_data/really-large-files/0/journal.txt
 create mode 100644 runner/json_tests_data/really-large-files/0/out.txt
 create mode 100644 runner/json_tests_data/really-large-files/README.txt
 create mode 100644 runner/json_tests_data/really-large-files/SKIP_ME
 create mode 100644 runner/json_tests_data/really-large-files/endtime.txt
 create mode 100644 runner/json_tests_data/really-large-files/generate_data.py
 create mode 100644 runner/json_tests_data/really-large-files/joblist.txt
 create mode 100644 runner/json_tests_data/really-large-files/metadata.txt
 create mode 100644 runner/json_tests_data/really-large-files/reference.json
 create mode 100644 runner/json_tests_data/really-large-files/starttime.txt
 create mode 100644 runner/json_tests_data/really-large-files/uname.txt

diff --git a/runner/json_tests_data/really-large-files/.gitignore b/runner/json_tests_data/really-large-files/.gitignore
new file mode 100644
index 00000000..6a445ba9
--- /dev/null
+++ b/runner/json_tests_data/really-large-files/.gitignore
@@ -0,0 +1,3 @@
+reference.json
+0/out.txt
+SKIP_ME
\ No newline at end of file
diff --git a/runner/json_tests_data/really-large-files/0/dmesg.txt b/runner/json_tests_data/really-large-files/0/dmesg.txt
new file mode 100644
index 00000000..e69de29b
diff --git a/runner/json_tests_data/really-large-files/0/err.txt b/runner/json_tests_data/really-large-files/0/err.txt
new file mode 100644
index 00000000..e69de29b
diff --git a/runner/json_tests_data/really-large-files/0/journal.txt b/runner/json_tests_data/really-large-files/0/journal.txt
new file mode 100644
index 00000000..e69de29b
diff --git a/runner/json_tests_data/really-large-files/0/out.txt b/runner/json_tests_data/really-large-files/0/out.txt
new file mode 100644
index 00000000..e85778cd
--- /dev/null
+++ b/runner/json_tests_data/really-large-files/0/out.txt
@@ -0,0 +1 @@
+This test requires massive files generated with generate_data.py to actually test stuff.
\ No newline at end of file
diff --git a/runner/json_tests_data/really-large-files/README.txt b/runner/json_tests_data/really-large-files/README.txt
new file mode 100644
index 00000000..20f6f3b2
--- /dev/null
+++ b/runner/json_tests_data/really-large-files/README.txt
@@ -0,0 +1,7 @@
+Check if an incredibly large JSON is generated and tested properly.
+This requires a large out.txt file to be available - it's not in
+the repo directly, run generate_data.py to test that properly.
+The SKIP_ME marker file exists to skip this test by default.
+
+The logic for small/large files does not change, testing this for each
+commit takes a long time and does not really check anything special.
diff --git a/runner/json_tests_data/really-large-files/SKIP_ME b/runner/json_tests_data/really-large-files/SKIP_ME
new file mode 100644
index 00000000..c76d0b57
--- /dev/null
+++ b/runner/json_tests_data/really-large-files/SKIP_ME
@@ -0,0 +1 @@
+This marker file exists to skip this test by default.
\ No newline at end of file
diff --git a/runner/json_tests_data/really-large-files/endtime.txt b/runner/json_tests_data/really-large-files/endtime.txt
new file mode 100644
index 00000000..635f6ae9
--- /dev/null
+++ b/runner/json_tests_data/really-large-files/endtime.txt
@@ -0,0 +1 @@
+1539953735.172373
diff --git a/runner/json_tests_data/really-large-files/generate_data.py b/runner/json_tests_data/really-large-files/generate_data.py
new file mode 100644
index 00000000..d3852c6b
--- /dev/null
+++ b/runner/json_tests_data/really-large-files/generate_data.py
@@ -0,0 +1,20 @@
+import json
+
+print("Hope you've got enough memory for this! Generating text...")
+PREFIX = "it's time for " + ("A" * 1024 * 1024 * 1024 * 4)
+
+print("Writing to out.txt...")
+with open('0/out.txt', 'w') as f:
+	f.write(PREFIX)
+
+print("Loading reference.json...")
+with open('reference.json', 'r') as f:
+	data = json.load(f)
+
+print("Writing new reference.json...")
+with open('reference.json', 'w') as f:
+	data['tests']['igt@successtest@first-subtest']['out'] = PREFIX
+	json.dump(data, f)
+
+print("Removing SKIP_ME...")
+os.unlink("SKIP_ME")
diff --git a/runner/json_tests_data/really-large-files/joblist.txt b/runner/json_tests_data/really-large-files/joblist.txt
new file mode 100644
index 00000000..81f914a7
--- /dev/null
+++ b/runner/json_tests_data/really-large-files/joblist.txt
@@ -0,0 +1 @@
+successtest first-subtest
diff --git a/runner/json_tests_data/really-large-files/metadata.txt b/runner/json_tests_data/really-large-files/metadata.txt
new file mode 100644
index 00000000..08db4cc0
--- /dev/null
+++ b/runner/json_tests_data/really-large-files/metadata.txt
@@ -0,0 +1,12 @@
+abort_mask : 0
+name : really-large-files
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
diff --git a/runner/json_tests_data/really-large-files/reference.json b/runner/json_tests_data/really-large-files/reference.json
new file mode 100644
index 00000000..5e662938
--- /dev/null
+++ b/runner/json_tests_data/really-large-files/reference.json
@@ -0,0 +1,62 @@
+{
+  "__type__":"TestrunResult",
+  "results_version":10,
+  "name":"really-large-files",
+  "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "time_elapsed":{
+    "__type__":"TimeAttribute",
+    "start":1539953735.1110389,
+    "end":1539953735.1723731
+  },
+  "tests":{
+    "igt@successtest@first-subtest":{
+	"out":"This test requires massive files generated with generate_data.py to actually test stuff.",
+	"err":"",
+	"dmesg":"",
+	"result":"incomplete"
+    }
+  },
+  "totals":{
+    "":{
+      "crash":0,
+      "pass":0,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":0,
+      "incomplete":1,
+      "abort":0,
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
+      "abort":0,
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
+      "abort":0,
+      "timeout":0,
+      "notrun":0,
+      "fail":0,
+      "warn":0
+    }
+  },
+  "runtimes":{
+  }
+}
diff --git a/runner/json_tests_data/really-large-files/starttime.txt b/runner/json_tests_data/really-large-files/starttime.txt
new file mode 100644
index 00000000..ae038f18
--- /dev/null
+++ b/runner/json_tests_data/really-large-files/starttime.txt
@@ -0,0 +1 @@
+1539953735.111039
diff --git a/runner/json_tests_data/really-large-files/uname.txt b/runner/json_tests_data/really-large-files/uname.txt
new file mode 100644
index 00000000..a7aef6f7
--- /dev/null
+++ b/runner/json_tests_data/really-large-files/uname.txt
@@ -0,0 +1 @@
+Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64
diff --git a/runner/runner_json_tests.c b/runner/runner_json_tests.c
index 9f487855..6bb1eb9f 100644
--- a/runner/runner_json_tests.c
+++ b/runner/runner_json_tests.c
@@ -89,12 +89,17 @@ static void compare(struct json_t *one,
 static void run_results_and_compare(int dirfd, const char *dirname)
 {
 	int testdirfd = openat(dirfd, dirname, O_RDONLY | O_DIRECTORY);
-	int reference;
+	int skipfd, reference;
 	struct json_t *resultsobj, *referenceobj;
 	struct json_error_t error;
 
 	igt_assert_fd(testdirfd);
 
+	skipfd = openat(testdirfd, "SKIP_ME", O_RDONLY);
+	igt_skip_on_f(skipfd != -1, "SKIP_ME marker exists - see the README "
+				    "for this test for more information.\n");
+	close(skipfd);
+
 	igt_assert((resultsobj = generate_results_json(testdirfd)) != NULL);
 
 	reference = openat(testdirfd, "reference.json", O_RDONLY);
@@ -134,6 +139,7 @@ static const char *dirnames[] = {
 	"dynamic-subtest-name-in-multiple-subtests",
 	"unprintable-characters",
 	"empty-result-files",
+	"really-large-files",
 	"graceful-notrun",
 };
 
-- 
2.37.1
