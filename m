Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6F210E6EF
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Mar 2022 15:23:00 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Mar 2022 17:20:15 +0200
Message-Id: <20220323152016.19033-3-petri.latvala@intel.com>
In-Reply-To: <20220323152016.19033-1-petri.latvala@intel.com>
References: <20220323152016.19033-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] runner_tests: Rename dynamic-subtests
 json test to dynamic-subtests-keep-dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In preparation for testing the rest of the options for prune_mode,
rename the current dynamic subtest result test to reflect the option
value.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
---
 .../0/dmesg.txt                                                | 0
 .../0/err.txt                                                  | 0
 .../0/journal.txt                                              | 0
 .../0/out.txt                                                  | 0
 .../1/dmesg.txt                                                | 0
 .../1/err.txt                                                  | 0
 .../1/journal.txt                                              | 0
 .../1/out.txt                                                  | 0
 .../2/dmesg.txt                                                | 0
 .../2/err.txt                                                  | 0
 .../2/journal.txt                                              | 0
 .../2/out.txt                                                  | 0
 .../json_tests_data/dynamic-subtests-keep-dynamic/README.txt   | 3 +++
 .../endtime.txt                                                | 0
 .../joblist.txt                                                | 0
 .../metadata.txt                                               | 1 +
 .../reference.json                                             | 0
 .../starttime.txt                                              | 0
 .../uname.txt                                                  | 0
 runner/json_tests_data/dynamic-subtests/README.txt             | 2 --
 runner/runner_json_tests.c                                     | 2 +-
 21 files changed, 5 insertions(+), 3 deletions(-)
 rename runner/json_tests_data/{dynamic-subtests => dynamic-subtests-keep-dynamic}/0/dmesg.txt (100%)
 rename runner/json_tests_data/{dynamic-subtests => dynamic-subtests-keep-dynamic}/0/err.txt (100%)
 rename runner/json_tests_data/{dynamic-subtests => dynamic-subtests-keep-dynamic}/0/journal.txt (100%)
 rename runner/json_tests_data/{dynamic-subtests => dynamic-subtests-keep-dynamic}/0/out.txt (100%)
 rename runner/json_tests_data/{dynamic-subtests => dynamic-subtests-keep-dynamic}/1/dmesg.txt (100%)
 rename runner/json_tests_data/{dynamic-subtests => dynamic-subtests-keep-dynamic}/1/err.txt (100%)
 rename runner/json_tests_data/{dynamic-subtests => dynamic-subtests-keep-dynamic}/1/journal.txt (100%)
 rename runner/json_tests_data/{dynamic-subtests => dynamic-subtests-keep-dynamic}/1/out.txt (100%)
 rename runner/json_tests_data/{dynamic-subtests => dynamic-subtests-keep-dynamic}/2/dmesg.txt (100%)
 rename runner/json_tests_data/{dynamic-subtests => dynamic-subtests-keep-dynamic}/2/err.txt (100%)
 rename runner/json_tests_data/{dynamic-subtests => dynamic-subtests-keep-dynamic}/2/journal.txt (100%)
 rename runner/json_tests_data/{dynamic-subtests => dynamic-subtests-keep-dynamic}/2/out.txt (100%)
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-dynamic/README.txt
 rename runner/json_tests_data/{dynamic-subtests => dynamic-subtests-keep-dynamic}/endtime.txt (100%)
 rename runner/json_tests_data/{dynamic-subtests => dynamic-subtests-keep-dynamic}/joblist.txt (100%)
 rename runner/json_tests_data/{dynamic-subtests => dynamic-subtests-keep-dynamic}/metadata.txt (94%)
 rename runner/json_tests_data/{dynamic-subtests => dynamic-subtests-keep-dynamic}/reference.json (100%)
 rename runner/json_tests_data/{dynamic-subtests => dynamic-subtests-keep-dynamic}/starttime.txt (100%)
 rename runner/json_tests_data/{dynamic-subtests => dynamic-subtests-keep-dynamic}/uname.txt (100%)
 delete mode 100644 runner/json_tests_data/dynamic-subtests/README.txt

diff --git a/runner/json_tests_data/dynamic-subtests/0/dmesg.txt b/runner/json_tests_data/dynamic-subtests-keep-dynamic/0/dmesg.txt
similarity index 100%
rename from runner/json_tests_data/dynamic-subtests/0/dmesg.txt
rename to runner/json_tests_data/dynamic-subtests-keep-dynamic/0/dmesg.txt
diff --git a/runner/json_tests_data/dynamic-subtests/0/err.txt b/runner/json_tests_data/dynamic-subtests-keep-dynamic/0/err.txt
similarity index 100%
rename from runner/json_tests_data/dynamic-subtests/0/err.txt
rename to runner/json_tests_data/dynamic-subtests-keep-dynamic/0/err.txt
diff --git a/runner/json_tests_data/dynamic-subtests/0/journal.txt b/runner/json_tests_data/dynamic-subtests-keep-dynamic/0/journal.txt
similarity index 100%
rename from runner/json_tests_data/dynamic-subtests/0/journal.txt
rename to runner/json_tests_data/dynamic-subtests-keep-dynamic/0/journal.txt
diff --git a/runner/json_tests_data/dynamic-subtests/0/out.txt b/runner/json_tests_data/dynamic-subtests-keep-dynamic/0/out.txt
similarity index 100%
rename from runner/json_tests_data/dynamic-subtests/0/out.txt
rename to runner/json_tests_data/dynamic-subtests-keep-dynamic/0/out.txt
diff --git a/runner/json_tests_data/dynamic-subtests/1/dmesg.txt b/runner/json_tests_data/dynamic-subtests-keep-dynamic/1/dmesg.txt
similarity index 100%
rename from runner/json_tests_data/dynamic-subtests/1/dmesg.txt
rename to runner/json_tests_data/dynamic-subtests-keep-dynamic/1/dmesg.txt
diff --git a/runner/json_tests_data/dynamic-subtests/1/err.txt b/runner/json_tests_data/dynamic-subtests-keep-dynamic/1/err.txt
similarity index 100%
rename from runner/json_tests_data/dynamic-subtests/1/err.txt
rename to runner/json_tests_data/dynamic-subtests-keep-dynamic/1/err.txt
diff --git a/runner/json_tests_data/dynamic-subtests/1/journal.txt b/runner/json_tests_data/dynamic-subtests-keep-dynamic/1/journal.txt
similarity index 100%
rename from runner/json_tests_data/dynamic-subtests/1/journal.txt
rename to runner/json_tests_data/dynamic-subtests-keep-dynamic/1/journal.txt
diff --git a/runner/json_tests_data/dynamic-subtests/1/out.txt b/runner/json_tests_data/dynamic-subtests-keep-dynamic/1/out.txt
similarity index 100%
rename from runner/json_tests_data/dynamic-subtests/1/out.txt
rename to runner/json_tests_data/dynamic-subtests-keep-dynamic/1/out.txt
diff --git a/runner/json_tests_data/dynamic-subtests/2/dmesg.txt b/runner/json_tests_data/dynamic-subtests-keep-dynamic/2/dmesg.txt
similarity index 100%
rename from runner/json_tests_data/dynamic-subtests/2/dmesg.txt
rename to runner/json_tests_data/dynamic-subtests-keep-dynamic/2/dmesg.txt
diff --git a/runner/json_tests_data/dynamic-subtests/2/err.txt b/runner/json_tests_data/dynamic-subtests-keep-dynamic/2/err.txt
similarity index 100%
rename from runner/json_tests_data/dynamic-subtests/2/err.txt
rename to runner/json_tests_data/dynamic-subtests-keep-dynamic/2/err.txt
diff --git a/runner/json_tests_data/dynamic-subtests/2/journal.txt b/runner/json_tests_data/dynamic-subtests-keep-dynamic/2/journal.txt
similarity index 100%
rename from runner/json_tests_data/dynamic-subtests/2/journal.txt
rename to runner/json_tests_data/dynamic-subtests-keep-dynamic/2/journal.txt
diff --git a/runner/json_tests_data/dynamic-subtests/2/out.txt b/runner/json_tests_data/dynamic-subtests-keep-dynamic/2/out.txt
similarity index 100%
rename from runner/json_tests_data/dynamic-subtests/2/out.txt
rename to runner/json_tests_data/dynamic-subtests-keep-dynamic/2/out.txt
diff --git a/runner/json_tests_data/dynamic-subtests-keep-dynamic/README.txt b/runner/json_tests_data/dynamic-subtests-keep-dynamic/README.txt
new file mode 100644
index 00000000..78bbf47c
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-dynamic/README.txt
@@ -0,0 +1,3 @@
+A test with dynamic subtests with prune-mode=keep-dynamic should
+generate separate subresults for the dynamic tests without the
+subtests.
diff --git a/runner/json_tests_data/dynamic-subtests/endtime.txt b/runner/json_tests_data/dynamic-subtests-keep-dynamic/endtime.txt
similarity index 100%
rename from runner/json_tests_data/dynamic-subtests/endtime.txt
rename to runner/json_tests_data/dynamic-subtests-keep-dynamic/endtime.txt
diff --git a/runner/json_tests_data/dynamic-subtests/joblist.txt b/runner/json_tests_data/dynamic-subtests-keep-dynamic/joblist.txt
similarity index 100%
rename from runner/json_tests_data/dynamic-subtests/joblist.txt
rename to runner/json_tests_data/dynamic-subtests-keep-dynamic/joblist.txt
diff --git a/runner/json_tests_data/dynamic-subtests/metadata.txt b/runner/json_tests_data/dynamic-subtests-keep-dynamic/metadata.txt
similarity index 94%
rename from runner/json_tests_data/dynamic-subtests/metadata.txt
rename to runner/json_tests_data/dynamic-subtests-keep-dynamic/metadata.txt
index 8c77de01..2442f37e 100644
--- a/runner/json_tests_data/dynamic-subtests/metadata.txt
+++ b/runner/json_tests_data/dynamic-subtests-keep-dynamic/metadata.txt
@@ -10,3 +10,4 @@ use_watchdog : 0
 piglit_style_dmesg : 0
 test_root : /path/does/not/exist
 results_path : /path/does/not/exist
+prune_mode : 0
diff --git a/runner/json_tests_data/dynamic-subtests/reference.json b/runner/json_tests_data/dynamic-subtests-keep-dynamic/reference.json
similarity index 100%
rename from runner/json_tests_data/dynamic-subtests/reference.json
rename to runner/json_tests_data/dynamic-subtests-keep-dynamic/reference.json
diff --git a/runner/json_tests_data/dynamic-subtests/starttime.txt b/runner/json_tests_data/dynamic-subtests-keep-dynamic/starttime.txt
similarity index 100%
rename from runner/json_tests_data/dynamic-subtests/starttime.txt
rename to runner/json_tests_data/dynamic-subtests-keep-dynamic/starttime.txt
diff --git a/runner/json_tests_data/dynamic-subtests/uname.txt b/runner/json_tests_data/dynamic-subtests-keep-dynamic/uname.txt
similarity index 100%
rename from runner/json_tests_data/dynamic-subtests/uname.txt
rename to runner/json_tests_data/dynamic-subtests-keep-dynamic/uname.txt
diff --git a/runner/json_tests_data/dynamic-subtests/README.txt b/runner/json_tests_data/dynamic-subtests/README.txt
deleted file mode 100644
index 3a63ab17..00000000
--- a/runner/json_tests_data/dynamic-subtests/README.txt
+++ /dev/null
@@ -1,2 +0,0 @@
-A test with dynamic subtests should generate separate subresults for
-the dynamic tests.
diff --git a/runner/runner_json_tests.c b/runner/runner_json_tests.c
index 43d7f6b9..882225c8 100644
--- a/runner/runner_json_tests.c
+++ b/runner/runner_json_tests.c
@@ -162,7 +162,7 @@ static const char *dirnames[] = {
 	"dmesg-warn-level",
 	"dmesg-warn-level-piglit-style",
 	"dmesg-warn-level-one-piglit-style",
-	"dynamic-subtests",
+	"dynamic-subtests-keep-dynamic",
 	"dynamic-subtest-name-in-multiple-subtests",
 	"unprintable-characters",
 	"empty-result-files",
-- 
2.30.2
