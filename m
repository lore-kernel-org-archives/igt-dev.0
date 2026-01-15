Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12960D4660A
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 17:58:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B325D10E7BD;
	Thu, 15 Jan 2026 17:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ysv2xN1R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFA210E7C4
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 17:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768499910; x=1800035910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5nYKWN4oIMfPNXAI6161pilk5WZjgWRl8gqAWQ0zGAM=;
 b=Ysv2xN1R5RbfLfa9Lc0n4PDhcK3iiYhRZWH9/O4DtHPF9as9+BHUZm0t
 t1w2SO1KoTu9osMaccDU816C8cX1IyOixwurQTjTn2ngkUggesVjqza56
 Q2frBb5iiRfIICXK6ntll7euqZpif+3AjaRpkLA6yRq5kZb6SAk1iRzTn
 gMzfoOCtcS5mMr+1cG0oh2DiRbzri4svQ9F26x6D0NotYvvTQxeytf9hY
 jXo7Fh827PJHM3bcNih9A/ODqEf2YD2gzOXvsuHDzrPCobuniLGRNtCPU
 zXNLhElIgAPBujZBLt/kLhZSppYs9PwMWjc+30M/vwaZM6hcF6y37yyzL A==;
X-CSE-ConnectionGUID: SjxdB/zJRNWkkGmDjqNSPg==
X-CSE-MsgGUID: qGDN+LlfQU2JJo94dII3tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69017168"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="69017168"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 09:58:30 -0800
X-CSE-ConnectionGUID: jDZ+6Na6QM2wIRPjIyGfow==
X-CSE-MsgGUID: kCRL511UTQqz/gyzZIArbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="204627207"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.58])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 09:58:29 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH i-g-t v1 3/4] runner: Add an on-demand test for large files
Date: Thu, 15 Jan 2026 18:58:09 +0100
Message-ID: <20260115175811.179898-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115175811.179898-1-kamil.konieczny@linux.intel.com>
References: <20260115175811.179898-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Ryszard Knop <ryszard.knop@intel.com>

The test in question does not carry large files, as that would require
adding massive files to Git. The tested logic is not any different for
large files, it's just a check if the JSON library can handle them.

To run this test, use generate_data.py. You'll need around 13GB of free
space and 10+ minutes to run this test successfully. The test will be
skipped by default if the SKIP_ME marker exists.

v2: added licence and copyright (Kamil)

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
 .../really-large-files/generate_data.py       | 23 +++++++
 .../really-large-files/joblist.txt            |  1 +
 .../really-large-files/metadata.txt           | 12 ++++
 .../really-large-files/reference.json         | 62 +++++++++++++++++++
 .../really-large-files/starttime.txt          |  1 +
 .../really-large-files/uname.txt              |  1 +
 runner/runner_json_tests.c                    |  8 ++-
 15 files changed, 120 insertions(+), 1 deletion(-)
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
index 000000000..6a445ba9c
--- /dev/null
+++ b/runner/json_tests_data/really-large-files/.gitignore
@@ -0,0 +1,3 @@
+reference.json
+0/out.txt
+SKIP_ME
\ No newline at end of file
diff --git a/runner/json_tests_data/really-large-files/0/dmesg.txt b/runner/json_tests_data/really-large-files/0/dmesg.txt
new file mode 100644
index 000000000..e69de29bb
diff --git a/runner/json_tests_data/really-large-files/0/err.txt b/runner/json_tests_data/really-large-files/0/err.txt
new file mode 100644
index 000000000..e69de29bb
diff --git a/runner/json_tests_data/really-large-files/0/journal.txt b/runner/json_tests_data/really-large-files/0/journal.txt
new file mode 100644
index 000000000..e69de29bb
diff --git a/runner/json_tests_data/really-large-files/0/out.txt b/runner/json_tests_data/really-large-files/0/out.txt
new file mode 100644
index 000000000..e85778cd0
--- /dev/null
+++ b/runner/json_tests_data/really-large-files/0/out.txt
@@ -0,0 +1 @@
+This test requires massive files generated with generate_data.py to actually test stuff.
\ No newline at end of file
diff --git a/runner/json_tests_data/really-large-files/README.txt b/runner/json_tests_data/really-large-files/README.txt
new file mode 100644
index 000000000..20f6f3b27
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
index 000000000..c76d0b575
--- /dev/null
+++ b/runner/json_tests_data/really-large-files/SKIP_ME
@@ -0,0 +1 @@
+This marker file exists to skip this test by default.
\ No newline at end of file
diff --git a/runner/json_tests_data/really-large-files/endtime.txt b/runner/json_tests_data/really-large-files/endtime.txt
new file mode 100644
index 000000000..635f6ae92
--- /dev/null
+++ b/runner/json_tests_data/really-large-files/endtime.txt
@@ -0,0 +1 @@
+1539953735.172373
diff --git a/runner/json_tests_data/really-large-files/generate_data.py b/runner/json_tests_data/really-large-files/generate_data.py
new file mode 100644
index 000000000..91eb4b7ca
--- /dev/null
+++ b/runner/json_tests_data/really-large-files/generate_data.py
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: MIT
+## Copyright (C) 2026    Intel Corporation                 ##
+
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
index 000000000..81f914a72
--- /dev/null
+++ b/runner/json_tests_data/really-large-files/joblist.txt
@@ -0,0 +1 @@
+successtest first-subtest
diff --git a/runner/json_tests_data/really-large-files/metadata.txt b/runner/json_tests_data/really-large-files/metadata.txt
new file mode 100644
index 000000000..08db4cc07
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
index 000000000..5e6629389
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
index 000000000..ae038f18b
--- /dev/null
+++ b/runner/json_tests_data/really-large-files/starttime.txt
@@ -0,0 +1 @@
+1539953735.111039
diff --git a/runner/json_tests_data/really-large-files/uname.txt b/runner/json_tests_data/really-large-files/uname.txt
new file mode 100644
index 000000000..a7aef6f78
--- /dev/null
+++ b/runner/json_tests_data/really-large-files/uname.txt
@@ -0,0 +1 @@
+Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64
diff --git a/runner/runner_json_tests.c b/runner/runner_json_tests.c
index b3a6068e4..e485d699e 100644
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
2.52.0

