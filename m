Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC99606A326
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 17:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fkt6X3BQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2284910EF1F;
	Mon, 19 Oct 2026 17:05:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B24210E9CE
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2026 17:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792429354; x=1823965354;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a/Z8t4jgltwwAlCGJTipYANeaPLxwP4qETZY5vaBNq0=;
 b=Fkt6X3BQir8OlKnal0FvGIvW4T7vA94UWb/OmsbAVLQftwxmP3y37eA/
 Pfl8y2ZAGYn29dc+nYijiQllM7hKqlTlLxVaJUeQmr4Ww+9TKujGoRAbJ
 e1Ko6gnSugXL+qqbXykHl3Fx6tfZ8FQi+5Bxtbc9pxxSB0r+NL6pdfFFZ
 3M9lgECzs4MLhwfuiOHu4oEJzL1mZ/SLzvMQz3O3jG5YwkAdsCtsWBc1s
 Mc76K1MhRtwdWJS319NkdPujG6jekhvm0EQxve4ZZsWTrjS0wHYn/QZ/k
 Rsu8KA+lmOGTW12n5HLBehgdFa82xgrV84LsX2TbCE8KKorNisdZXT80o g==;
X-CSE-ConnectionGUID: 6b8vwmUiTLSWz8jY2p2nkQ==
X-CSE-MsgGUID: CK9b0AQkSneMpW/8saXG8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="985937"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="985937"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 10:02:33 -0700
X-CSE-ConnectionGUID: TZhxgBfZSEKZPq4fnWdh2g==
X-CSE-MsgGUID: 99cBBUErQOGhEH36akpXQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2560355"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.31])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 10:02:32 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 1/2] runner: Create new option --max-reported-warns
Date: Mon, 19 Oct 2026 19:01:51 +0200
Message-ID: <20261019170152.139409-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019170152.139409-1-kamil.konieczny@linux.intel.com>
References: <20261019170152.139409-1-kamil.konieczny@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Make new option --max-reported-warns that will limit number of
reported warns when parsing dmesg. This limit will work only
for a single subtest or sub-subtest.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/settings.c | 13 +++++++++++++
 runner/settings.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/runner/settings.c b/runner/settings.c
index eb67f651a..8fa36cd07 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -36,6 +36,7 @@ enum {
 	OPT_HELP_HOOK,
 	OPT_VERSION,
 	OPT_PRUNE_MODE,
+	OPT_MAX_REPORTED_WARNS,
 	OPT_HELP = 'h',
 	OPT_NAME = 'n',
 	OPT_DRY_RUN = 'd',
@@ -283,6 +284,10 @@ static const char *usage_str =
 	"                        to the given one will override the test result to\n"
 	"                        dmesg-warn/dmesg-fail, assuming they go through filtering.\n"
 	"                        Defaults to 4 (KERN_WARNING).\n"
+	"  --max-reported-warns <number>\n"
+	"                        Report limited number of dmesg-warn/dmesg-fail present in dmesg.\n"
+	"                        Usually the very first ones are usable to track the root cause.\n"
+	"                        Default is unlimited.\n"
 	"  --piglit-style-dmesg  Filter dmesg like piglit does. Piglit considers matches\n"
 	"                        against a short filter list to mean the test result\n"
 	"                        should be changed to dmesg-warn/dmesg-fail. Without\n"
@@ -715,6 +720,7 @@ bool parse_options(int argc, char **argv,
 		{"use-watchdog", no_argument, NULL, OPT_WATCHDOG},
 		{"piglit-style-dmesg", no_argument, NULL, OPT_PIGLIT_DMESG},
 		{"dmesg-warn-level", required_argument, NULL, OPT_DMESG_WARN_LEVEL},
+		{"max-reported-warns", required_argument, NULL, OPT_MAX_REPORTED_WARNS},
 		{"prune-mode", required_argument, NULL, OPT_PRUNE_MODE},
 		{"blacklist", required_argument, NULL, OPT_BLACKLIST},
 		{"list-all", no_argument, NULL, OPT_LIST_ALL},
@@ -726,6 +732,7 @@ bool parse_options(int argc, char **argv,
 	optind = 1;
 
 	settings->dmesg_warn_level = -1;
+	settings->max_reported_warns = INT_MAX;
 	settings->prune_mode = -1;
 
 	while ((c = getopt_long(argc, argv, "hn:dt:x:e:fk::sl:omb:L",
@@ -845,6 +852,9 @@ bool parse_options(int argc, char **argv,
 		case OPT_DMESG_WARN_LEVEL:
 			settings->dmesg_warn_level = atoi(optarg);
 			break;
+		case OPT_MAX_REPORTED_WARNS:
+			settings->max_reported_warns = atoi(optarg);
+			break;
 		case OPT_PRUNE_MODE:
 			if (!set_prune_mode(settings, optarg)) {
 				usage(stderr, "Cannot parse prune mode");
@@ -1255,6 +1265,7 @@ bool serialize_settings(struct settings *settings)
 	SERIALIZE_INT(f, settings, use_watchdog);
 	SERIALIZE_INT(f, settings, piglit_style_dmesg);
 	SERIALIZE_INT(f, settings, dmesg_warn_level);
+	SERIALIZE_INT(f, settings, max_reported_warns);
 	SERIALIZE_INT(f, settings, prune_mode);
 	SERIALIZE_STR(f, settings, test_root);
 	SERIALIZE_STR(f, settings, results_path);
@@ -1352,6 +1363,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 	char *name = NULL, *val = NULL;
 
 	settings->dmesg_warn_level = -1;
+	settings->max_reported_warns = INT_MAX;
 
 	while (fscanf(f, "%ms : %m[^\n]", &name, &val) == 2) {
 		PARSE_INT(settings, name, val, abort_mask);
@@ -1374,6 +1386,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 		PARSE_INT(settings, name, val, use_watchdog);
 		PARSE_INT(settings, name, val, piglit_style_dmesg);
 		PARSE_INT(settings, name, val, dmesg_warn_level);
+		PARSE_INT(settings, name, val, max_reported_warns);
 		PARSE_INT(settings, name, val, prune_mode);
 		PARSE_STR(settings, name, val, test_root);
 		PARSE_STR(settings, name, val, results_path);
diff --git a/runner/settings.h b/runner/settings.h
index 4d1c17ffb..7d703ad35 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -78,6 +78,7 @@ struct settings {
 	bool piglit_style_dmesg;
 	int dmesg_warn_level;
 	int prune_mode;
+	int max_reported_warns;
 	bool list_all;
 	char *code_coverage_script;
 	bool enable_code_coverage;
-- 
2.55.0

