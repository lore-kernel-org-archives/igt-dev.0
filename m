Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F147DC02199
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 23:13:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F1A10EBBB;
	Fri,  7 Feb 2025 23:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YvYP7v/6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB9410E335
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 23:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738969870; x=1770505870;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=pCtLLm03/6u8k+poTBIALdKV6CgOBaDsb9OeT+f65MY=;
 b=YvYP7v/6AmYNoHPT9FXngXN6P3dFIqSRamQzl80/+8keLP2LP5Yyj2Ma
 UJhDGFGP6ToqudGRGBed+i7txbeneIi1/VRsPEM38CFzhZfTB8yZhWnll
 +ZAvbwhcZ9CmBqS6UBlOOw5ts85ImA0sBrYHiJSYaauEyGzIGIiQU+pbD
 U208A86FADGIislN9QWAPTQbE/5OK+qxLL4uHqQuE0wONyCe/65kh2nPC
 v8RXOyrHrdrUUtb6GbBAd4cHShF8/wbClOco228hfGDiucMNteYedUP9m
 3gM4H48clmwWg5hDfWN/VVisAmfC6KQMWzMu3pX6eDaMGZiQDswvYAyhz Q==;
X-CSE-ConnectionGUID: rZr6jareTX+mhJJi4s5I9w==
X-CSE-MsgGUID: nkZHb7KgSEatJ+IIX/EOMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43281779"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="43281779"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 15:11:09 -0800
X-CSE-ConnectionGUID: FziL6mK8QM6QT2NPMAY2cA==
X-CSE-MsgGUID: 7uml5bb/S2e57xMHFhaN7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="111425882"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 15:11:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [CI i-g-t 10/10] runner/resultgen: Add cmdline to results.json
Date: Fri,  7 Feb 2025 15:09:44 -0800
Message-ID: <20250207231039.2883195-12-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207231039.2883195-2-lucas.demarchi@intel.com>
References: <20250207231039.2883195-2-lucas.demarchi@intel.com>
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

For easier repro scenarios, add the cmdline to the json: one can see the
exact command executed to try to reproduce a CI failure without needing
extra files.

Adding cmdline to the results.json doesn't need a version upgrade:
piglit can still parse the file.

Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 runner/json_tests_data/aborted-after-a-test/reference.json | 1 +
 runner/json_tests_data/aborted-on-boot/reference.json      | 1 +
 runner/json_tests_data/dmesg-escapes/reference.json        | 1 +
 runner/json_tests_data/dmesg-results/reference.json        | 1 +
 .../dmesg-warn-level-one-piglit-style/reference.json       | 1 +
 .../dmesg-warn-level-piglit-style/reference.json           | 1 +
 runner/json_tests_data/dmesg-warn-level/reference.json     | 1 +
 .../reference.json                                         | 1 +
 .../dynamic-subtests-keep-all/reference.json               | 3 ++-
 .../dynamic-subtests-keep-dynamic/reference.json           | 1 +
 .../dynamic-subtests-keep-requested/reference.json         | 3 ++-
 .../dynamic-subtests-keep-subtests/reference.json          | 3 ++-
 runner/json_tests_data/empty-result-files/reference.json   | 1 +
 runner/json_tests_data/graceful-notrun/reference.json      | 1 +
 .../incomplete-before-any-subtests/reference.json          | 1 +
 runner/json_tests_data/normal-run/reference.json           | 1 +
 .../notrun-results-multiple-mode/reference.json            | 1 +
 runner/json_tests_data/notrun-results/reference.json       | 1 +
 runner/json_tests_data/piglit-style-dmesg/reference.json   | 1 +
 .../json_tests_data/unprintable-characters/reference.json  | 1 +
 .../warnings-with-dmesg-warns/reference.json               | 1 +
 runner/json_tests_data/warnings/reference.json             | 1 +
 runner/resultgen.c                                         | 7 ++++++-
 23 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/runner/json_tests_data/aborted-after-a-test/reference.json b/runner/json_tests_data/aborted-after-a-test/reference.json
index 0776f7582..50ba9e6e1 100644
--- a/runner/json_tests_data/aborted-after-a-test/reference.json
+++ b/runner/json_tests_data/aborted-after-a-test/reference.json
@@ -3,6 +3,7 @@
   "results_version":10,
   "name":"normal-run",
   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "cmdline":[],
   "time_elapsed":{
     "__type__":"TimeAttribute",
     "start":1539953735.1110389,
diff --git a/runner/json_tests_data/aborted-on-boot/reference.json b/runner/json_tests_data/aborted-on-boot/reference.json
index 75f194660..238ec6fff 100644
--- a/runner/json_tests_data/aborted-on-boot/reference.json
+++ b/runner/json_tests_data/aborted-on-boot/reference.json
@@ -3,6 +3,7 @@
   "results_version":10,
   "name":"normal-run",
   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "cmdline":[],
   "time_elapsed":{
     "__type__":"TimeAttribute",
     "start":1539953735.1110389,
diff --git a/runner/json_tests_data/dmesg-escapes/reference.json b/runner/json_tests_data/dmesg-escapes/reference.json
index 91c573106..e74dc89e4 100644
--- a/runner/json_tests_data/dmesg-escapes/reference.json
+++ b/runner/json_tests_data/dmesg-escapes/reference.json
@@ -3,6 +3,7 @@
   "results_version":10,
   "name":"normal-run",
   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "cmdline":[],
   "time_elapsed":{
     "__type__":"TimeAttribute",
     "start":1539953735.1110389,
diff --git a/runner/json_tests_data/dmesg-results/reference.json b/runner/json_tests_data/dmesg-results/reference.json
index e9e011853..81890f7d2 100644
--- a/runner/json_tests_data/dmesg-results/reference.json
+++ b/runner/json_tests_data/dmesg-results/reference.json
@@ -3,6 +3,7 @@
   "results_version":10,
   "name":"normal-run",
   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "cmdline":[],
   "time_elapsed":{
     "__type__":"TimeAttribute",
     "start":1539953735.1110389,
diff --git a/runner/json_tests_data/dmesg-warn-level-one-piglit-style/reference.json b/runner/json_tests_data/dmesg-warn-level-one-piglit-style/reference.json
index 8d266cdfa..16c97d3a1 100644
--- a/runner/json_tests_data/dmesg-warn-level-one-piglit-style/reference.json
+++ b/runner/json_tests_data/dmesg-warn-level-one-piglit-style/reference.json
@@ -3,6 +3,7 @@
   "results_version":10,
   "name":"normal-run",
   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "cmdline":[],
   "time_elapsed":{
     "__type__":"TimeAttribute",
     "start":1539953735.1110389,
diff --git a/runner/json_tests_data/dmesg-warn-level-piglit-style/reference.json b/runner/json_tests_data/dmesg-warn-level-piglit-style/reference.json
index 4a1e8b313..e40000a27 100644
--- a/runner/json_tests_data/dmesg-warn-level-piglit-style/reference.json
+++ b/runner/json_tests_data/dmesg-warn-level-piglit-style/reference.json
@@ -3,6 +3,7 @@
   "results_version":10,
   "name":"normal-run",
   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "cmdline":[],
   "time_elapsed":{
     "__type__":"TimeAttribute",
     "start":1539953735.1110389,
diff --git a/runner/json_tests_data/dmesg-warn-level/reference.json b/runner/json_tests_data/dmesg-warn-level/reference.json
index 400e9cfbc..fca3f1a54 100644
--- a/runner/json_tests_data/dmesg-warn-level/reference.json
+++ b/runner/json_tests_data/dmesg-warn-level/reference.json
@@ -3,6 +3,7 @@
   "results_version":10,
   "name":"normal-run",
   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "cmdline":[],
   "time_elapsed":{
     "__type__":"TimeAttribute",
     "start":1539953735.1110389,
diff --git a/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/reference.json b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/reference.json
index 514de06a4..e3a6ffe3b 100644
--- a/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/reference.json
+++ b/runner/json_tests_data/dynamic-subtest-name-in-multiple-subtests/reference.json
@@ -3,6 +3,7 @@
   "results_version":10,
   "name":"dynamic-subtest-name-in-multiple-subtests",
   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "cmdline":[],
   "time_elapsed":{
     "__type__":"TimeAttribute",
     "start":1560163492.266377,
diff --git a/runner/json_tests_data/dynamic-subtests-keep-all/reference.json b/runner/json_tests_data/dynamic-subtests-keep-all/reference.json
index b2b716288..20e626144 100644
--- a/runner/json_tests_data/dynamic-subtests-keep-all/reference.json
+++ b/runner/json_tests_data/dynamic-subtests-keep-all/reference.json
@@ -3,6 +3,7 @@
   "results_version":10,
   "name":"dynamic-subtests",
   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "cmdline":[],
   "time_elapsed":{
     "__type__":"TimeAttribute",
     "start":1560163492.266377,
@@ -168,4 +169,4 @@
       }
     }
   }
-}
\ No newline at end of file
+}
diff --git a/runner/json_tests_data/dynamic-subtests-keep-dynamic/reference.json b/runner/json_tests_data/dynamic-subtests-keep-dynamic/reference.json
index c013d2821..37bd91e84 100644
--- a/runner/json_tests_data/dynamic-subtests-keep-dynamic/reference.json
+++ b/runner/json_tests_data/dynamic-subtests-keep-dynamic/reference.json
@@ -3,6 +3,7 @@
   "results_version":10,
   "name":"dynamic-subtests",
   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "cmdline":[],
   "time_elapsed":{
     "__type__":"TimeAttribute",
     "start":1560163492.266377,
diff --git a/runner/json_tests_data/dynamic-subtests-keep-requested/reference.json b/runner/json_tests_data/dynamic-subtests-keep-requested/reference.json
index c33c7ce7c..3a717f699 100644
--- a/runner/json_tests_data/dynamic-subtests-keep-requested/reference.json
+++ b/runner/json_tests_data/dynamic-subtests-keep-requested/reference.json
@@ -3,6 +3,7 @@
   "results_version":10,
   "name":"dynamic-subtests",
   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "cmdline":[],
   "time_elapsed":{
     "__type__":"TimeAttribute",
     "start":1560163492.266377,
@@ -120,4 +121,4 @@
       }
     }
   }
-}
\ No newline at end of file
+}
diff --git a/runner/json_tests_data/dynamic-subtests-keep-subtests/reference.json b/runner/json_tests_data/dynamic-subtests-keep-subtests/reference.json
index e53daa5a5..e4c320a0f 100644
--- a/runner/json_tests_data/dynamic-subtests-keep-subtests/reference.json
+++ b/runner/json_tests_data/dynamic-subtests-keep-subtests/reference.json
@@ -3,6 +3,7 @@
   "results_version":10,
   "name":"dynamic-subtests",
   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "cmdline":[],
   "time_elapsed":{
     "__type__":"TimeAttribute",
     "start":1560163492.266377,
@@ -120,4 +121,4 @@
       }
     }
   }
-}
\ No newline at end of file
+}
diff --git a/runner/json_tests_data/empty-result-files/reference.json b/runner/json_tests_data/empty-result-files/reference.json
index f81ffb81c..332e20693 100644
--- a/runner/json_tests_data/empty-result-files/reference.json
+++ b/runner/json_tests_data/empty-result-files/reference.json
@@ -3,6 +3,7 @@
   "results_version":10,
   "name":"empty-result-files",
   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "cmdline":[],
   "time_elapsed":{
     "__type__":"TimeAttribute",
     "start":1539953735.1110389,
diff --git a/runner/json_tests_data/graceful-notrun/reference.json b/runner/json_tests_data/graceful-notrun/reference.json
index c95bdfecc..ddad3d925 100644
--- a/runner/json_tests_data/graceful-notrun/reference.json
+++ b/runner/json_tests_data/graceful-notrun/reference.json
@@ -3,6 +3,7 @@
   "results_version":10,
   "name":"graceful-notrun",
   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "cmdline":[],
   "time_elapsed":{
     "__type__":"TimeAttribute",
     "start":1539953735.1110389,
diff --git a/runner/json_tests_data/incomplete-before-any-subtests/reference.json b/runner/json_tests_data/incomplete-before-any-subtests/reference.json
index 2a4bd4560..5fc1978eb 100644
--- a/runner/json_tests_data/incomplete-before-any-subtests/reference.json
+++ b/runner/json_tests_data/incomplete-before-any-subtests/reference.json
@@ -3,6 +3,7 @@
   "results_version":10,
   "name":"normal-run",
   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "cmdline":[],
   "time_elapsed":{
     "__type__":"TimeAttribute",
     "start":1539953735.1110389,
diff --git a/runner/json_tests_data/normal-run/reference.json b/runner/json_tests_data/normal-run/reference.json
index 0a00b1ca8..814e46920 100644
--- a/runner/json_tests_data/normal-run/reference.json
+++ b/runner/json_tests_data/normal-run/reference.json
@@ -3,6 +3,7 @@
   "results_version":10,
   "name":"normal-run",
   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "cmdline":[],
   "time_elapsed":{
     "__type__":"TimeAttribute",
     "start":1539953735.1110389,
diff --git a/runner/json_tests_data/notrun-results-multiple-mode/reference.json b/runner/json_tests_data/notrun-results-multiple-mode/reference.json
index 3f8b7fb09..80ba5ec2c 100644
--- a/runner/json_tests_data/notrun-results-multiple-mode/reference.json
+++ b/runner/json_tests_data/notrun-results-multiple-mode/reference.json
@@ -3,6 +3,7 @@
   "results_version":10,
   "name":"normal-run",
   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "cmdline":[],
   "time_elapsed":{
     "__type__":"TimeAttribute",
     "start":1539953735.1110389,
diff --git a/runner/json_tests_data/notrun-results/reference.json b/runner/json_tests_data/notrun-results/reference.json
index 800de38c5..42fcd0017 100644
--- a/runner/json_tests_data/notrun-results/reference.json
+++ b/runner/json_tests_data/notrun-results/reference.json
@@ -3,6 +3,7 @@
   "results_version":10,
   "name":"normal-run",
   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "cmdline":[],
   "time_elapsed":{
     "__type__":"TimeAttribute",
     "start":1539953735.1110389,
diff --git a/runner/json_tests_data/piglit-style-dmesg/reference.json b/runner/json_tests_data/piglit-style-dmesg/reference.json
index bf5d86ee3..6c751dc53 100644
--- a/runner/json_tests_data/piglit-style-dmesg/reference.json
+++ b/runner/json_tests_data/piglit-style-dmesg/reference.json
@@ -3,6 +3,7 @@
   "results_version":10,
   "name":"normal-run",
   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "cmdline":[],
   "time_elapsed":{
     "__type__":"TimeAttribute",
     "start":1539953735.1110389,
diff --git a/runner/json_tests_data/unprintable-characters/reference.json b/runner/json_tests_data/unprintable-characters/reference.json
index 88c62c34d..e1b3302a5 100644
--- a/runner/json_tests_data/unprintable-characters/reference.json
+++ b/runner/json_tests_data/unprintable-characters/reference.json
@@ -3,6 +3,7 @@
   "results_version":10,
   "name":"normal-run",
   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "cmdline":[],
   "time_elapsed":{
     "__type__":"TimeAttribute",
     "start":1539953735.1110389,
diff --git a/runner/json_tests_data/warnings-with-dmesg-warns/reference.json b/runner/json_tests_data/warnings-with-dmesg-warns/reference.json
index bd0bb3a3d..67797e789 100644
--- a/runner/json_tests_data/warnings-with-dmesg-warns/reference.json
+++ b/runner/json_tests_data/warnings-with-dmesg-warns/reference.json
@@ -3,6 +3,7 @@
   "results_version":10,
   "name":"normal-run",
   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "cmdline":[],
   "time_elapsed":{
     "__type__":"TimeAttribute",
     "start":1539953735.1110389,
diff --git a/runner/json_tests_data/warnings/reference.json b/runner/json_tests_data/warnings/reference.json
index a2b79da9e..2c483fdf5 100644
--- a/runner/json_tests_data/warnings/reference.json
+++ b/runner/json_tests_data/warnings/reference.json
@@ -3,6 +3,7 @@
   "results_version":10,
   "name":"normal-run",
   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
+  "cmdline":[],
   "time_elapsed":{
     "__type__":"TimeAttribute",
     "start":1539953735.1110389,
diff --git a/runner/resultgen.c b/runner/resultgen.c
index 87847bf5b..0d3a569cf 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -2281,7 +2281,7 @@ struct json_object *generate_results_json(int dirfd)
 {
 	struct settings settings;
 	struct job_list job_list;
-	struct json_object *obj, *elapsed;
+	struct json_object *obj, *elapsed, *arr;
 	struct results results;
 	int testdirfd, fd;
 	size_t i;
@@ -2319,6 +2319,11 @@ struct json_object *generate_results_json(int dirfd)
 		close(fd);
 	}
 
+	arr = json_object_new_array();
+	for (i = 0; i < settings.cmdline.argc; i++)
+		json_object_array_add(arr, json_object_new_string(settings.cmdline.argv[i]));
+	json_object_object_add(obj, "cmdline", arr);
+
 	elapsed = json_object_new_object();
 	json_object_object_add(elapsed, "__type__", json_object_new_string("TimeAttribute"));
 	if ((fd = openat(dirfd, "starttime.txt", O_RDONLY)) >= 0) {
-- 
2.48.1

