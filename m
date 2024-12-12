Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD37E7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 07:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CC010E0F6;
	Thu, 12 Dec 2024 07:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ks7Vq/j2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A16110E0F6
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 07:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733987790; x=1765523790;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1ELJ6cPYxiV0f4QD1FCk7govMzG1zSuUIb5tpsezdd0=;
 b=Ks7Vq/j2lSnkiftgF41xyuZUVbZpRgAoUADsQJwMc9mt3BjwKSASqdxP
 0i6Fw5Yzu8RzWzyF7dUD5PbtttRnkiykPBVsrPNoHM6iTLCaVvp2W+QcH
 lUCVHzouL91Ip/xTYw1fFnc4VD6rcQ0h1GuvjIhAyVrmy1/CYZiB0xvgy
 ud6O0eIoKbVz2cQJG5kXBrBNXFb+TXxvX1kLyQ+obKAowcn5sqN0r091D
 q15sR7Rzfcx6DAyIxG2sRuwzgxbfAJjiyBJm5xZ13DoQCQ6nrxTgHM+6z
 df6HvC0AaAEgfLSJe+Q/tU/YXqIsRY5PA7tOvYhdBJli2v1EBQZR78jk8 g==;
X-CSE-ConnectionGUID: csxv2CXYThmwgJmsNduEQw==
X-CSE-MsgGUID: dKG3kFJHQuioIGNVauEWeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="59787916"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="59787916"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 23:16:30 -0800
X-CSE-ConnectionGUID: kGb+LNpwSPeM0cEl/vYz/A==
X-CSE-MsgGUID: PNJDS5NPTO2Mg8LGaVxYeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96943268"
Received: from pbangalo-mobl1.amr.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.213.201.113])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 23:16:25 -0800
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
Subject: [PATCH i-g-t v12 3/3] runner/executor: Integrate igt_facts
 functionality
Date: Thu, 12 Dec 2024 08:15:27 +0100
Message-Id: <20241212071527.64595-4-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212071527.64595-1-peter.senna@linux.intel.com>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <20241212071527.64595-1-peter.senna@linux.intel.com>
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

Modifies the igt_runner to include calls to igt_facts() before the
execution of each test and after the final test concludes. Also adds
command line options to igt_runner:
 -f, --facts to enable igt_facts

igt_facts is disabled by default. If not explicitly enabled with the
command-line argument -f or --facts, igt_facts() will return
immediately without performing any operations.

The test name is obtained by calling
entry_display_name(&job_list->entries[state->next]).

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
Reviewed-by: Ryszard Knop <ryszard.knop@intel.com>
Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 runner/executor.c | 10 ++++++++++
 runner/settings.c |  9 ++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/runner/executor.c b/runner/executor.c
index 49ae8c90d..d4d704a34 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -30,6 +30,7 @@
 
 #include "igt_aux.h"
 #include "igt_core.h"
+#include "igt_facts.h"
 #include "igt_taints.h"
 #include "igt_vec.h"
 #include "executor.h"
@@ -2360,12 +2361,15 @@ bool execute(struct execute_state *state,
 	sigset_t sigmask;
 	double time_spent = 0.0;
 	bool status = true;
+	char *last_test = NULL;
 
 	if (state->dry) {
 		outf("Dry run, not executing. Invoke igt_resume if you want to execute.\n");
 		return true;
 	}
 
+	igt_facts_lists_init();
+
 	if (state->next >= job_list->size) {
 		outf("All tests already executed.\n");
 		return true;
@@ -2492,6 +2496,10 @@ bool execute(struct execute_state *state,
 		int result;
 		bool already_written = false;
 
+		/* Calls before running each test */
+		igt_facts(last_test);
+		last_test = entry_display_name(&job_list->entries[state->next]);
+
 		if (should_die_because_signal(sigfd)) {
 			status = false;
 			goto end;
@@ -2580,6 +2588,8 @@ bool execute(struct execute_state *state,
 			return execute(state, settings, job_list);
 		}
 	}
+	/* Last call to collect facts after the last test runs */
+	igt_facts(last_test);
 
 	if ((timefd = openat(resdirfd, "endtime.txt", O_CREAT | O_WRONLY | O_EXCL, 0666)) >= 0) {
 		dprintf(timefd, "%f\n", timeofday_double());
diff --git a/runner/settings.c b/runner/settings.c
index 0d27e7af3..0e8e4572e 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -1,3 +1,4 @@
+#include "igt_facts.h"
 #include "igt_hook.h"
 #include "igt_vec.h"
 #include "settings.h"
@@ -40,6 +41,7 @@ enum {
 	OPT_INCLUDE = 't',
 	OPT_EXCLUDE = 'x',
 	OPT_ENVIRONMENT = 'e',
+	OPT_FACTS = 'f',
 	OPT_SYNC = 's',
 	OPT_LOG_LEVEL = 'l',
 	OPT_OVERWRITE = 'o',
@@ -230,6 +232,7 @@ static const char *usage_str =
 	"                                   environment variable IGT_PING_HOSTNAME does\n"
 	"                                   not respond to ping.\n"
 	"                         all     - abort for all of the above.\n"
+	"  -f, --facts           Enable igt_facts tracking\n"
 	"  -s, --sync            Sync results to disk after every test\n"
 	"  -l {quiet,verbose,dummy}, --log-level {quiet,verbose,dummy}\n"
 	"                        Set the logger verbosity level\n"
@@ -665,6 +668,7 @@ bool parse_options(int argc, char **argv,
 		{"environment", required_argument, NULL, OPT_ENVIRONMENT},
 		{"abort-on-monitored-error", optional_argument, NULL, OPT_ABORT_ON_ERROR},
 		{"disk-usage-limit", required_argument, NULL, OPT_DISK_USAGE_LIMIT},
+		{"facts", no_argument, NULL, OPT_FACTS},
 		{"sync", no_argument, NULL, OPT_SYNC},
 		{"log-level", required_argument, NULL, OPT_LOG_LEVEL},
 		{"test-list", required_argument, NULL, OPT_TEST_LIST},
@@ -695,7 +699,7 @@ bool parse_options(int argc, char **argv,
 	settings->dmesg_warn_level = -1;
 	settings->prune_mode = -1;
 
-	while ((c = getopt_long(argc, argv, "hn:dt:x:e:sl:omb:L",
+	while ((c = getopt_long(argc, argv, "hn:dt:x:e:fsl:omb:L",
 				long_options, NULL)) != -1) {
 		switch (c) {
 		case OPT_VERSION:
@@ -736,6 +740,9 @@ bool parse_options(int argc, char **argv,
 				goto error;
 			}
 			break;
+		case OPT_FACTS:
+			igt_facts_config.enabled = true;
+			break;
 		case OPT_SYNC:
 			settings->sync = true;
 			break;
-- 
2.34.1

