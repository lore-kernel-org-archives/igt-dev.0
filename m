Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5146C19F2E
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 10:19:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7092210EA89;
	Thu, 27 Feb 2025 10:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ILo9jLwK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846BE10EA89
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 10:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740651583; x=1772187583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5c4sjkDTnCcxxWOtD3ivoYn1/0+Mg1EVJQQQvLyuPMY=;
 b=ILo9jLwKZ/+nrG6qwmRobg/DHloTeLd/qiK+vTWLm6JNTjE/Ot2fnSff
 uehWW0vf/op70Yi9LX8xw13PbjHz0tlEcdp1iPsVbI1X0JKGUHEtFyaDE
 VdLwTodEIuGtX4TPTG8G6Ynj5zGRoWxQOiZXXbI4HUSPbprH2PDXpMHO0
 wPQw6DvqW64j1ZkAFTYxw2pxIoqlGvIWAnfszJGCeS+C8bboR/3lPeG/D
 SjSuNQsa7Dt5F2GizDr4FO+GO15cfNQUaJ20U4QZ8sJThS7NNVwOfLwGg
 OiwQuqNlKSAULpSP/AtwK0W66ULN8dUvGVocKZPlD+4kL+3H5vMJuyekx w==;
X-CSE-ConnectionGUID: wlyw1dywQ8W4oEZGUE1vIg==
X-CSE-MsgGUID: +liGrPbHQAqNvG/02euwiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45185583"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="45185583"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 02:19:43 -0800
X-CSE-ConnectionGUID: JGqkEFtLSoSl6KDmrmjgaw==
X-CSE-MsgGUID: SDARcFv2R1+yDbY+9hDMNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122230166"
Received: from mviannax-mobl.amr.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.80.7])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 02:19:40 -0800
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 christian.koenig@amd.com, alexander.deucher@amd.com, jesse.zhang@amd.com,
 harry.wentland@amd.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v7 i-g-t 2/3] runner/executor: Integrate igt_kmemleak scans
Date: Thu, 27 Feb 2025 11:18:52 +0100
Message-Id: <20250227101853.361504-3-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227101853.361504-1-peter.senna@linux.intel.com>
References: <20250227101853.361504-1-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This patch modifies igt_runner to support runner_kmemleak() calls. By
default, kmemleak scanning is disabled, so new command-line options are
introduced to enable it:
 * -k, -k<option>, --kmemleak, --kmemleak=<option>

The available options are:
 * once: Perform a single kmemleak scan after all tests in the test list
 * complete.  each: Perform a kmemleak scan after each test completes.

If any kmemleaks are detected, they will be saved in the igt_runner results
directory under kmemleak.txt.

Additionally, this patch updates serialize_settings() and
read_settings_from_file() to persist igt_runner settings across runs. This
allows settings to be saved when running igt_runner --dry-run and later
restored when executing igt_resume.

The unit tests for igt_runner have been extended to verify:
 * Kmemleak scans are disabled by default.  Kmemleak scans can be enabled
 * via command-line arguments.  The kmemleak setting is correctly saved to
 * and restored from disk.

To test the new -k command-line option, this patch appends "--overwrite" to
*argv[] in runner_test.c to expand the argument array. This approach avoids
a major refactor of how *argv[] is defined across the file while keeping
the changes isolated to unit testing. Since this only affects tests, there
is no downstream impact.

Cc: christian.koenig@amd.com
Cc: alexander.deucher@amd.com
Cc: jesse.zhang@amd.com
Cc: harry.wentland@amd.com
Cc: zbigniew.kempczynski@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: ryszard.knop@intel.com
Cc: lucas.demarchi@intel.com
Cc: katarzyna.piecielska@intel.com
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 runner/executor.c     | 26 ++++++++++++++++++++++++--
 runner/runner_tests.c | 13 ++++++++++++-
 runner/settings.c     | 31 ++++++++++++++++++++++++++++++-
 runner/settings.h     |  2 ++
 4 files changed, 68 insertions(+), 4 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 999e7f719..4eb4f1c72 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -31,6 +31,7 @@
 #include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_facts.h"
+#include "kmemleak.h"
 #include "igt_taints.h"
 #include "igt_vec.h"
 #include "executor.h"
@@ -2370,6 +2371,14 @@ bool execute(struct execute_state *state,
 	if (settings->facts)
 		igt_facts_lists_init();
 
+	if (settings->kmemleak)
+		if (!runner_kmemleak_init(NULL)) {
+			errf("Failed to initialize kmemleak. Is kernel support enabled?\n"
+			     "Disabling kmemleak on igt_runner and continuing...\n");
+			settings->kmemleak = false;
+			settings->kmemleak_each = false;
+		}
+
 	if (state->next >= job_list->size) {
 		outf("All tests already executed.\n");
 		return true;
@@ -2497,10 +2506,18 @@ bool execute(struct execute_state *state,
 		bool already_written = false;
 
 		/* Collect facts before running each test */
-		if (settings->facts) {
+		if (settings->facts)
 			igt_facts(last_test);
+
+		if (settings->kmemleak_each)
+			if (!runner_kmemleak(last_test, resdirfd,
+					     settings->kmemleak_each,
+					     settings->sync))
+				errf("Failed to collect kmemleak logs after %s\n",
+				     last_test);
+
+		if (settings->facts || settings->kmemleak_each)
 			last_test = entry_display_name(&job_list->entries[state->next]);
-		}
 
 		if (should_die_because_signal(sigfd)) {
 			status = false;
@@ -2595,6 +2612,11 @@ bool execute(struct execute_state *state,
 	if (settings->facts)
 		igt_facts(last_test);
 
+	if (settings->kmemleak)
+		if (!runner_kmemleak(last_test, resdirfd,
+				     settings->kmemleak_each, settings->sync))
+			errf("Failed to collect kmemleak logs after the last test\n");
+
 	if ((timefd = openat(resdirfd, "endtime.txt", O_CREAT | O_WRONLY | O_EXCL, 0666)) >= 0) {
 		dprintf(timefd, "%f\n", timeofday_double());
 		close(timefd);
diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index 93b3ebc9f..e62e7b34d 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -191,6 +191,7 @@ static void assert_settings_equal(struct settings *one, struct settings *two)
 	igt_assert_eq(one->dry_run, two->dry_run);
 	igt_assert_eq(one->allow_non_root, two->allow_non_root);
 	igt_assert_eq(one->facts, two->facts);
+	igt_assert_eq(one->kmemleak, two->kmemleak);
 	igt_assert_eq(one->sync, two->sync);
 	igt_assert_eq(one->log_level, two->log_level);
 	igt_assert_eq(one->overwrite, two->overwrite);
@@ -305,6 +306,7 @@ igt_main
 		igt_assert(igt_list_empty(&settings->env_vars));
 		igt_assert(!igt_vec_length(&settings->hook_strs));
 		igt_assert(!settings->facts);
+		igt_assert(!settings->kmemleak);
 		igt_assert(!settings->sync);
 		igt_assert_eq(settings->log_level, LOG_LEVEL_NORMAL);
 		igt_assert(!settings->overwrite);
@@ -427,6 +429,7 @@ igt_main
 		igt_assert_eq(settings->include_regexes.size, 0);
 		igt_assert_eq(settings->exclude_regexes.size, 0);
 		igt_assert(!settings->facts);
+		igt_assert(!settings->kmemleak);
 		igt_assert(!settings->sync);
 		igt_assert_eq(settings->log_level, LOG_LEVEL_NORMAL);
 		igt_assert(!settings->overwrite);
@@ -465,6 +468,7 @@ igt_main
 				       "-b", blacklist_name,
 				       "--blacklist", blacklist2_name,
 				       "-f",
+				       "-k",
 				       "-s",
 				       "-l", "verbose",
 				       "--overwrite",
@@ -524,6 +528,7 @@ igt_main
 		igt_assert_eqstr(*((char **)igt_vec_elem(&settings->hook_strs, 1)), "echo world");
 
 		igt_assert(settings->facts);
+		igt_assert(settings->kmemleak);
 		igt_assert(settings->sync);
 		igt_assert_eq(settings->log_level, LOG_LEVEL_VERBOSE);
 		igt_assert(settings->overwrite);
@@ -719,6 +724,7 @@ igt_main
 	igt_subtest("parse-clears-old-data") {
 		const char *argv[] = { "runner",
 				       "-n", "foo",
+				       "--overwrite",
 				       "--dry-run",
 				       "--allow-non-root",
 				       "test-root-dir",
@@ -728,21 +734,26 @@ igt_main
 		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
 
 		igt_assert_eqstr(settings->name, "foo");
+		igt_assert(settings->overwrite);
 		igt_assert(settings->dry_run);
 		igt_assert(!settings->test_list);
 		igt_assert(!settings->facts);
+		igt_assert(!settings->kmemleak);
 		igt_assert(!settings->sync);
 
 		argv[1] = "--test-list";
 		argv[3] = "--facts";
-		argv[4] = "--sync";
+		argv[4] = "--kmemleak";
+		argv[5] = "--sync";
 
 		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
 
 		igt_assert_eqstr(settings->name, "results-path");
 		igt_assert(!settings->dry_run);
+		igt_assert(!settings->overwrite);
 		igt_assert(strstr(settings->test_list, "foo") != NULL);
 		igt_assert(settings->facts);
+		igt_assert(settings->kmemleak);
 		igt_assert(settings->sync);
 	}
 
diff --git a/runner/settings.c b/runner/settings.c
index a2fddcaf6..1d34c5bfe 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -42,6 +42,7 @@ enum {
 	OPT_EXCLUDE = 'x',
 	OPT_ENVIRONMENT = 'e',
 	OPT_FACTS = 'f',
+	OPT_KMEMLEAK = 'k',
 	OPT_SYNC = 's',
 	OPT_LOG_LEVEL = 'l',
 	OPT_OVERWRITE = 'o',
@@ -233,6 +234,16 @@ static const char *usage_str =
 	"                                   not respond to ping.\n"
 	"                         all     - abort for all of the above.\n"
 	"  -f, --facts           Enable facts tracking\n"
+	"  -k, -k<option>, --kmemleak, --kmemleak=<option>\n"
+	"                        Enable kmemleak tracking. Each kmemleak scan\n"
+	"                        can take from 5 to 60 seconds, slowing down\n"
+	"                        the run considerably. The default is to scan\n"
+	"                        only once after the last test. It is also\n"
+	"                        possible to scan after each test. Possible\n"
+	"                        options:\n"
+	"                         once - The default is to run one kmemleak\n"
+	"                                scan after the last test\n"
+	"                         each - Run one kmemleak scan after each test\n"
 	"  -s, --sync            Sync results to disk after every test\n"
 	"  -l {quiet,verbose,dummy}, --log-level {quiet,verbose,dummy}\n"
 	"                        Set the logger verbosity level\n"
@@ -682,6 +693,7 @@ bool parse_options(int argc, char **argv,
 		{"abort-on-monitored-error", optional_argument, NULL, OPT_ABORT_ON_ERROR},
 		{"disk-usage-limit", required_argument, NULL, OPT_DISK_USAGE_LIMIT},
 		{"facts", no_argument, NULL, OPT_FACTS},
+		{"kmemleak", optional_argument, NULL, OPT_KMEMLEAK},
 		{"sync", no_argument, NULL, OPT_SYNC},
 		{"log-level", required_argument, NULL, OPT_LOG_LEVEL},
 		{"test-list", required_argument, NULL, OPT_TEST_LIST},
@@ -712,7 +724,7 @@ bool parse_options(int argc, char **argv,
 	settings->dmesg_warn_level = -1;
 	settings->prune_mode = -1;
 
-	while ((c = getopt_long(argc, argv, "hn:dt:x:e:fsl:omb:L",
+	while ((c = getopt_long(argc, argv, "hn:dt:x:e:fk::sl:omb:L",
 				long_options, NULL)) != -1) {
 		switch (c) {
 		case OPT_VERSION:
@@ -756,6 +768,19 @@ bool parse_options(int argc, char **argv,
 		case OPT_FACTS:
 			settings->facts = true;
 			break;
+		case OPT_KMEMLEAK:
+			/* The default is once */
+			settings->kmemleak = true;
+			settings->kmemleak_each = false;
+			if (optarg) {
+				if (strcmp(optarg, "each") == 0) {
+					settings->kmemleak_each = true;
+				/* "once" is the default. No action needed */
+				} else if (strcmp(optarg, "once") != 0) {
+					usage(stderr, "Invalid kmemleak option");
+					goto error;
+				}
+			}
 		case OPT_SYNC:
 			settings->sync = true;
 			break;
@@ -1210,6 +1235,8 @@ bool serialize_settings(struct settings *settings)
 	SERIALIZE_INT(f, settings, dry_run);
 	SERIALIZE_INT(f, settings, allow_non_root);
 	SERIALIZE_INT(f, settings, facts);
+	SERIALIZE_INT(f, settings, kmemleak);
+	SERIALIZE_INT(f, settings, kmemleak_each);
 	SERIALIZE_INT(f, settings, sync);
 	SERIALIZE_INT(f, settings, log_level);
 	SERIALIZE_INT(f, settings, overwrite);
@@ -1326,6 +1353,8 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 		PARSE_INT(settings, name, val, dry_run);
 		PARSE_INT(settings, name, val, allow_non_root);
 		PARSE_INT(settings, name, val, facts);
+		PARSE_INT(settings, name, val, kmemleak);
+		PARSE_INT(settings, name, val, kmemleak_each);
 		PARSE_INT(settings, name, val, sync);
 		PARSE_INT(settings, name, val, log_level);
 		PARSE_INT(settings, name, val, overwrite);
diff --git a/runner/settings.h b/runner/settings.h
index 2266118a7..1f0b85318 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -58,6 +58,8 @@ struct settings {
 	struct igt_list_head env_vars;
 	struct igt_vec hook_strs;
 	bool facts;
+	bool kmemleak;
+	bool kmemleak_each;
 	bool sync;
 	int log_level;
 	bool overwrite;
-- 
2.34.1

