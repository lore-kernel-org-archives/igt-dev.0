Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC23C982C9
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 15:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3ABF10E3DA;
	Wed, 16 Sep 2026 15:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YSsPmT9P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E8510E3DA
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 15:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789573678; x=1821109678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E73pVok2eVODRSFfZa2tt/BGUMU5k2SCE48hwTY1aIE=;
 b=YSsPmT9PvmQ41ZOj3/77GG4/Bte+JriYe3HFosvajFZWD11ETvtrrxgg
 epk0J7JpeqZfsxtxZe5I6m0STGKGdzatuftUHgmh6VDDPor9zwV53XB/C
 QwuY614wq139qeBXHRbQqHYUoNa23xcZ/wFeQqxReMJ+pbaje4bBYUvWr
 tn6vdusgT5a5obGDKf1autLAitxjjtuIUT3FsCT3vpyDvDYTpk8zq4f0T
 6KcUzZ8SaqK0eCh4JbRiamNxBM6nuA8+IJaeewExpZ40Y+AnCK7Dtb5aS
 Fi3Gtl64bOaGrIkI+MC5aFmrWoQ+mY4OazOjgRvEgy9BFsDij3tg/OjIJ w==;
X-CSE-ConnectionGUID: /VdZ+KSUR+i5YnOJuJad8w==
X-CSE-MsgGUID: 12/We/VGTwmURB+N7poJ9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100549550"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100549550"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 08:47:57 -0700
X-CSE-ConnectionGUID: SCs2lcVXT9SOVi2qzSHGRA==
X-CSE-MsgGUID: +cE6AgHCTAilRvPP7x5wRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="277505377"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.146])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 08:47:56 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 1/2] runner: Add new option
 --save-results-after-each-test
Date: Wed, 16 Sep 2026 17:47:39 +0200
Message-ID: <20260916154740.130190-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916154740.130190-1-kamil.konieczny@linux.intel.com>
References: <20260916154740.130190-1-kamil.konieczny@linux.intel.com>
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

Create new option --save-results-after-each-test which will save
results.json after each test was run, not only after last one.

Please note that this could be somewhat misleading when a kernel
panic happens during an execution, as a real test causing this
will not be there. In such cases one still needs to run
igt_results to add that last one to results.

v2: changed name of option (Ryszard)

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 5 +++++
 runner/settings.c | 9 +++++++++
 runner/settings.h | 1 +
 3 files changed, 15 insertions(+)

diff --git a/runner/executor.c b/runner/executor.c
index 1592feee2..35ea704c2 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -2045,6 +2045,11 @@ static bool clear_old_results(char *path)
 		return false;
 	}
 
+	if (remove_file(dirfd, "results.old")) {
+		errf("Error clearing results.old : %m\n");
+		return false;
+	}
+
 	for (i = 0; true; i++) {
 		struct stat st;
 
diff --git a/runner/settings.c b/runner/settings.c
index 3ccf71870..eb67f651a 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -23,6 +23,7 @@ enum {
 	OPT_DISK_USAGE_LIMIT,
 	OPT_TEST_LIST,
 	OPT_IGNORE_MISSING,
+	OPT_SAVE_RESULTS_AFTER_EACH_TEST,
 	OPT_PIGLIT_DMESG,
 	OPT_DMESG_WARN_LEVEL,
 	OPT_OVERALL_TIMEOUT,
@@ -309,6 +310,8 @@ static const char *usage_str =
 	"                        Set an environment variable for the test process.\n"
 	"                        If only the key is provided, the current value is read\n"
 	"                        from the runner's environment (and saved for resumes).\n"
+	"  --save-results-after-each-test\n"
+	"			 Save results.json after each test was run\n"
 	"  -L, --list-all        List all matching subtests instead of running\n"
 	"  --collect-code-cov    Enables gcov-based collect of code coverage for tests.\n"
 	"                        Requires --collect-script FILENAME\n"
@@ -693,6 +696,7 @@ bool parse_options(int argc, char **argv,
 		{"abort-on-monitored-error", optional_argument, NULL, OPT_ABORT_ON_ERROR},
 		{"disk-usage-limit", required_argument, NULL, OPT_DISK_USAGE_LIMIT},
 		{"facts", no_argument, NULL, OPT_FACTS},
+		{"save-results-after-each-test", no_argument, NULL, OPT_SAVE_RESULTS_AFTER_EACH_TEST},
 		{"kmemleak", optional_argument, NULL, OPT_KMEMLEAK},
 		{"sync", no_argument, NULL, OPT_SYNC},
 		{"log-level", required_argument, NULL, OPT_LOG_LEVEL},
@@ -768,6 +772,9 @@ bool parse_options(int argc, char **argv,
 		case OPT_FACTS:
 			settings->facts = true;
 			break;
+		case OPT_SAVE_RESULTS_AFTER_EACH_TEST:
+			settings->save_results_after_each_test = true;
+			break;
 		case OPT_KMEMLEAK:
 			/* The default is once */
 			settings->kmemleak = true;
@@ -1235,6 +1242,7 @@ bool serialize_settings(struct settings *settings)
 	SERIALIZE_INT(f, settings, dry_run);
 	SERIALIZE_INT(f, settings, allow_non_root);
 	SERIALIZE_INT(f, settings, facts);
+	SERIALIZE_INT(f, settings, save_results_after_each_test);
 	SERIALIZE_INT(f, settings, kmemleak);
 	SERIALIZE_INT(f, settings, kmemleak_each);
 	SERIALIZE_INT(f, settings, sync);
@@ -1353,6 +1361,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 		PARSE_INT(settings, name, val, dry_run);
 		PARSE_INT(settings, name, val, allow_non_root);
 		PARSE_INT(settings, name, val, facts);
+		PARSE_INT(settings, name, val, save_results_after_each_test);
 		PARSE_INT(settings, name, val, kmemleak);
 		PARSE_INT(settings, name, val, kmemleak_each);
 		PARSE_INT(settings, name, val, sync);
diff --git a/runner/settings.h b/runner/settings.h
index 6c58c3282..4d1c17ffb 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -62,6 +62,7 @@ struct settings {
 	struct igt_list_head env_vars;
 	struct igt_vec hook_strs;
 	bool facts;
+	bool save_results_after_each_test;
 	bool kmemleak;
 	bool kmemleak_each;
 	bool sync;
-- 
2.55.0

