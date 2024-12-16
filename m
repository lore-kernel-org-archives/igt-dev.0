Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E332CE7717F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Dec 2024 08:25:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BDC10E3DD;
	Mon, 16 Dec 2024 08:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CZH5WaNL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB3810E3DD
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Dec 2024 08:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734337556; x=1765873556;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5hKzbFPmF39CENCkuxxu3h8lcyEmlSk2Lhkz5RSN6qA=;
 b=CZH5WaNL7EH5rDNbN0eQ/FhpT3NYTEfnoi6+fZ7kbul5STPZNIGHZ9dB
 pWb6g6mLle0A2Bq0QEd/RUyJL+N43YdB46fwFuqQUy+uqZv+6kPSZvCIJ
 fGPQySTWpz3HpS3VnX6t7HbRtuknN2YzHRV8ByArubQjUrW9PniQ7VRIp
 Wi5c2B4UnnCvbdv8dLJHnkJf2Jb1daGM00G/JcX8gsF6enq7cyQLMXRQU
 F+Cn4CgdBI5iWrXsnF3OM0NLp7uLt4RpQ5uGQJfDsAFV+7pESB2d4Wx6b
 5b/yyqEex3cuGMLmrACMraxDS2NvxIJKCevX9ql2wS3SRwIkY+ePU7EMr Q==;
X-CSE-ConnectionGUID: vY9PWSlfTESase4DIIX6sA==
X-CSE-MsgGUID: /hjM3mW+Qy2aK9ASfb6x1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34590627"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="34590627"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 00:25:56 -0800
X-CSE-ConnectionGUID: QAUGQRsVQn+sgcqwJ8RM+g==
X-CSE-MsgGUID: LqwQ/nEaS6eNJP/+6K8D8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="128122591"
Received: from crooney-mobl.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.213.202.5])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 00:25:52 -0800
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Helen Koike <helen.koike@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Rob Clark <robdclark@chromium.org>, Ryszard Knop <ryszard.knop@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 dominik.karol.piatkowski@intel.com, himal.prasad.ghimiray@intel.com,
 katarzyna.piecielska@intel.com, luciano.coelho@intel.com,
 nirmoy.das@intel.com, stuart.summers@intel.com
Subject: [PATCH i-g-t v14 3/3] runner/executor: Integrate igt_facts
 functionality
Date: Mon, 16 Dec 2024 09:25:04 +0100
Message-Id: <20241216082504.6687-4-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216082504.6687-1-peter.senna@linux.intel.com>
References: <20241216061036.194296-1-peter.senna@linux.intel.com>
 <20241216082504.6687-1-peter.senna@linux.intel.com>
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

Modifies igt_runner to include calls to igt_facts() before the
execution of each test and after the final test concludes. Facts are
disabled by default, so add command line options to igt_runner to
enable facts:  -f, --facts

Updates serialize_settings() and read_settings_from_file() to save
and restore igt_runner settings to and from disk. This is used when
calling igt_runner with '--dry-run' and then by calling igt_resume
instead of igt_runner.

Updates unit testing for igt_runner to test that:
 - Facts are disabled by default
 - Facts can be enabled by command line arguments
 - The choice about facts being enabled or not is saved to disk
   and restored from disk

CC: Helen Koike <helen.koike@collabora.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>
CC: Jani Saarinen <jani.saarinen@intel.com>
CC: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Maíra Canal <mcanal@igalia.com>
CC: Melissa Wen <mwen@igalia.com>
CC: Petri Latvala <adrinael@adrinael.net>
CC: Rob Clark <robdclark@chromium.org>
CC: Ryszard Knop <ryszard.knop@intel.com>
CC: Swati Sharma <swati2.sharma@intel.com>
CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
CC: dominik.karol.piatkowski@intel.com
CC: himal.prasad.ghimiray@intel.com
CC: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
CC: katarzyna.piecielska@intel.com
CC: luciano.coelho@intel.com
CC: nirmoy.das@intel.com
CC: stuart.summers@intel.com
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Ryszard Knop <ryszard.knop@intel.com>
Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 runner/executor.c     | 14 ++++++++++++++
 runner/runner_tests.c | 11 ++++++++++-
 runner/settings.c     | 10 +++++++++-
 runner/settings.h     |  1 +
 4 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 49ae8c90d..999e7f719 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -30,6 +30,7 @@
 
 #include "igt_aux.h"
 #include "igt_core.h"
+#include "igt_facts.h"
 #include "igt_taints.h"
 #include "igt_vec.h"
 #include "executor.h"
@@ -2360,11 +2361,14 @@ bool execute(struct execute_state *state,
 	sigset_t sigmask;
 	double time_spent = 0.0;
 	bool status = true;
+	char *last_test = NULL;
 
 	if (state->dry) {
 		outf("Dry run, not executing. Invoke igt_resume if you want to execute.\n");
 		return true;
 	}
+	if (settings->facts)
+		igt_facts_lists_init();
 
 	if (state->next >= job_list->size) {
 		outf("All tests already executed.\n");
@@ -2492,6 +2496,12 @@ bool execute(struct execute_state *state,
 		int result;
 		bool already_written = false;
 
+		/* Collect facts before running each test */
+		if (settings->facts) {
+			igt_facts(last_test);
+			last_test = entry_display_name(&job_list->entries[state->next]);
+		}
+
 		if (should_die_because_signal(sigfd)) {
 			status = false;
 			goto end;
@@ -2581,6 +2591,10 @@ bool execute(struct execute_state *state,
 		}
 	}
 
+	/* Collect facts after the last test runs */
+	if (settings->facts)
+		igt_facts(last_test);
+
 	if ((timefd = openat(resdirfd, "endtime.txt", O_CREAT | O_WRONLY | O_EXCL, 0666)) >= 0) {
 		dprintf(timefd, "%f\n", timeofday_double());
 		close(timefd);
diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index a661722ac..8441763f2 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -190,6 +190,7 @@ static void assert_settings_equal(struct settings *one, struct settings *two)
 	igt_assert_eqstr(one->name, two->name);
 	igt_assert_eq(one->dry_run, two->dry_run);
 	igt_assert_eq(one->allow_non_root, two->allow_non_root);
+	igt_assert_eq(one->facts, two->facts);
 	igt_assert_eq(one->sync, two->sync);
 	igt_assert_eq(one->log_level, two->log_level);
 	igt_assert_eq(one->overwrite, two->overwrite);
@@ -302,6 +303,7 @@ igt_main
 		igt_assert_eq(settings->exclude_regexes.size, 0);
 		igt_assert(igt_list_empty(&settings->env_vars));
 		igt_assert(!igt_vec_length(&settings->hook_strs));
+		igt_assert(!settings->facts);
 		igt_assert(!settings->sync);
 		igt_assert_eq(settings->log_level, LOG_LEVEL_NORMAL);
 		igt_assert(!settings->overwrite);
@@ -423,6 +425,7 @@ igt_main
 		igt_assert(!settings->dry_run);
 		igt_assert_eq(settings->include_regexes.size, 0);
 		igt_assert_eq(settings->exclude_regexes.size, 0);
+		igt_assert(!settings->facts);
 		igt_assert(!settings->sync);
 		igt_assert_eq(settings->log_level, LOG_LEVEL_NORMAL);
 		igt_assert(!settings->overwrite);
@@ -460,6 +463,7 @@ igt_main
 				       "--environment", "ENVS_WITH_JUST_KEYS",
 				       "-b", blacklist_name,
 				       "--blacklist", blacklist2_name,
+				       "-f",
 				       "-s",
 				       "-l", "verbose",
 				       "--overwrite",
@@ -518,6 +522,7 @@ igt_main
 		igt_assert_eqstr(*((char **)igt_vec_elem(&settings->hook_strs, 0)), "echo hello");
 		igt_assert_eqstr(*((char **)igt_vec_elem(&settings->hook_strs, 1)), "echo world");
 
+		igt_assert(settings->facts);
 		igt_assert(settings->sync);
 		igt_assert_eq(settings->log_level, LOG_LEVEL_VERBOSE);
 		igt_assert(settings->overwrite);
@@ -724,16 +729,19 @@ igt_main
 		igt_assert_eqstr(settings->name, "foo");
 		igt_assert(settings->dry_run);
 		igt_assert(!settings->test_list);
+		igt_assert(!settings->facts);
 		igt_assert(!settings->sync);
 
 		argv[1] = "--test-list";
-		argv[3] = "--sync";
+		argv[3] = "--facts";
+		argv[4] = "--sync";
 
 		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
 
 		igt_assert_eqstr(settings->name, "results-path");
 		igt_assert(!settings->dry_run);
 		igt_assert(strstr(settings->test_list, "foo") != NULL);
+		igt_assert(settings->facts);
 		igt_assert(settings->sync);
 	}
 
@@ -966,6 +974,7 @@ igt_main
 					       "-t", "pattern2",
 					       "-x", "xpattern1",
 					       "-x", "xpattern2",
+					       "-f",
 					       "-s",
 					       "-l", "verbose",
 					       "--overwrite",
diff --git a/runner/settings.c b/runner/settings.c
index 0d27e7af3..92fd42ea6 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -40,6 +40,7 @@ enum {
 	OPT_INCLUDE = 't',
 	OPT_EXCLUDE = 'x',
 	OPT_ENVIRONMENT = 'e',
+	OPT_FACTS = 'f',
 	OPT_SYNC = 's',
 	OPT_LOG_LEVEL = 'l',
 	OPT_OVERWRITE = 'o',
@@ -230,6 +231,7 @@ static const char *usage_str =
 	"                                   environment variable IGT_PING_HOSTNAME does\n"
 	"                                   not respond to ping.\n"
 	"                         all     - abort for all of the above.\n"
+	"  -f, --facts           Enable facts tracking\n"
 	"  -s, --sync            Sync results to disk after every test\n"
 	"  -l {quiet,verbose,dummy}, --log-level {quiet,verbose,dummy}\n"
 	"                        Set the logger verbosity level\n"
@@ -665,6 +667,7 @@ bool parse_options(int argc, char **argv,
 		{"environment", required_argument, NULL, OPT_ENVIRONMENT},
 		{"abort-on-monitored-error", optional_argument, NULL, OPT_ABORT_ON_ERROR},
 		{"disk-usage-limit", required_argument, NULL, OPT_DISK_USAGE_LIMIT},
+		{"facts", no_argument, NULL, OPT_FACTS},
 		{"sync", no_argument, NULL, OPT_SYNC},
 		{"log-level", required_argument, NULL, OPT_LOG_LEVEL},
 		{"test-list", required_argument, NULL, OPT_TEST_LIST},
@@ -695,7 +698,7 @@ bool parse_options(int argc, char **argv,
 	settings->dmesg_warn_level = -1;
 	settings->prune_mode = -1;
 
-	while ((c = getopt_long(argc, argv, "hn:dt:x:e:sl:omb:L",
+	while ((c = getopt_long(argc, argv, "hn:dt:x:e:fsl:omb:L",
 				long_options, NULL)) != -1) {
 		switch (c) {
 		case OPT_VERSION:
@@ -736,6 +739,9 @@ bool parse_options(int argc, char **argv,
 				goto error;
 			}
 			break;
+		case OPT_FACTS:
+			settings->facts = true;
+			break;
 		case OPT_SYNC:
 			settings->sync = true;
 			break;
@@ -1098,6 +1104,7 @@ bool serialize_settings(struct settings *settings)
 		SERIALIZE_LINE(f, settings, name, "%s");
 	SERIALIZE_LINE(f, settings, dry_run, "%d");
 	SERIALIZE_LINE(f, settings, allow_non_root, "%d");
+	SERIALIZE_LINE(f, settings, facts, "%d");
 	SERIALIZE_LINE(f, settings, sync, "%d");
 	SERIALIZE_LINE(f, settings, log_level, "%d");
 	SERIALIZE_LINE(f, settings, overwrite, "%d");
@@ -1168,6 +1175,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 		PARSE_LINE(settings, name, val, name, val ? strdup(val) : NULL);
 		PARSE_LINE(settings, name, val, dry_run, numval);
 		PARSE_LINE(settings, name, val, allow_non_root, numval);
+		PARSE_LINE(settings, name, val, facts, numval);
 		PARSE_LINE(settings, name, val, sync, numval);
 		PARSE_LINE(settings, name, val, log_level, numval);
 		PARSE_LINE(settings, name, val, overwrite, numval);
diff --git a/runner/settings.h b/runner/settings.h
index 8335f0b8c..f69f09778 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -57,6 +57,7 @@ struct settings {
 	struct regex_list exclude_regexes;
 	struct igt_list_head env_vars;
 	struct igt_vec hook_strs;
+	bool facts;
 	bool sync;
 	int log_level;
 	bool overwrite;
-- 
2.34.1

