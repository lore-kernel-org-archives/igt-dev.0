Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD694C02197
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 17:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1D610E9BC;
	Thu, 30 Jan 2025 17:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gnhFZeCv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9606210E06B
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 17:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738257736; x=1769793736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n5oOKzBoQch4bYHgJ9KSiuHu8oduFyXVf2XTvJGnDNo=;
 b=gnhFZeCv5/4J4V/rU53TK7/BUURixcIA/9CvKJ/rHUNAlkhw0VT++BAE
 QxEOj6MRZcsGfkHO50UpMdkL3OO0Q6VJKwNTNAXy80bx4R1SFopyo7UOj
 neuF1LpTJn3H3BfM5Iir36j2rvsq7tC5BL7VgdGdpaZgevtGght82Nohn
 u1OlU6YTwXHNxwKr8gMtdAmHIMY70ooxd/kFoTCx+Ehoegprrj9KBQnej
 vsgy9cseD/gyxrjsNro1cPdQfwwswMLDXwNPzmH5m+UsFZ3Sl93KZa5pd
 hoI7ei5JHqIGWUPq4YOAlDjYsMGCz7CYNzvYXgVDO2h60EDhFVtnl6VAC Q==;
X-CSE-ConnectionGUID: 3V4PMPHSQIWtVrnPb0bVcg==
X-CSE-MsgGUID: SKYeKkzATtKF1d4/bnqzSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42567085"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="42567085"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:22:13 -0800
X-CSE-ConnectionGUID: Dc9YRuC6TjmYqhcm9e2n/w==
X-CSE-MsgGUID: /YMqg47VQaujxKeD+gyOuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="109539673"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:22:12 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 09/10] runner/settings: Serialize command line
Date: Thu, 30 Jan 2025 09:21:48 -0800
Message-ID: <20250130172149.3657144-10-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250130172149.3657144-1-lucas.demarchi@intel.com>
References: <20250130172149.3657144-1-lucas.demarchi@intel.com>
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

Serialize the command line to metadata.txt. The expected format in the
metadata.txt is like below:

	cmdline.argc : 6
	cmdline.argv[0] : ./build/runner/igt_runner
	cmdline.argv[1] : -o
	cmdline.argv[2] : --test-list
	cmdline.argv[3] : /tmp/testlist.txt
	cmdline.argv[4] : build/tests/
	cmdline.argv[5] : /tmp/results

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 runner/settings.c | 21 +++++++++++++++++++++
 runner/settings.h |  4 ++++
 2 files changed, 25 insertions(+)

diff --git a/runner/settings.c b/runner/settings.c
index 62afd3534..84d8c85e9 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -529,6 +529,14 @@ static void free_hook_strs(struct igt_vec *hook_strs)
 	igt_vec_fini(hook_strs);
 }
 
+static void free_array_deep(void **arr, size_t n)
+{
+	for (size_t i = 0; i < n; i++)
+		free(arr[i]);
+
+	free(arr);
+}
+
 static bool file_exists_at(int dirfd, const char *filename)
 {
 	return faccessat(dirfd, filename, F_OK, 0) == 0;
@@ -646,6 +654,7 @@ void clear_settings(struct settings *settings)
 	free_regexes(&settings->exclude_regexes);
 	free_env_vars(&settings->env_vars);
 	free_hook_strs(&settings->hook_strs);
+	free_array_deep((void **)settings->cmdline.argv, settings->cmdline.argc);
 
 	init_settings(settings);
 }
@@ -875,6 +884,16 @@ bool parse_options(int argc, char **argv,
 		goto error;
 	}
 
+	settings->cmdline.argv = calloc(argc, sizeof(*settings->cmdline.argv));
+	if (!settings->cmdline.argv)
+		goto error;
+
+	settings->cmdline.argc = argc;
+	for (int i = 0; i < argc; i++) {
+		settings->cmdline.argv[i] = strdup(argv[i]);
+		if (!settings->cmdline.argv[i])
+			goto error;
+	}
 
 	return true;
 
@@ -1202,6 +1221,7 @@ bool serialize_settings(struct settings *settings)
 	SERIALIZE_INT(f, settings, enable_code_coverage);
 	SERIALIZE_INT(f, settings, cov_results_per_test);
 	SERIALIZE_STR(f, settings, code_coverage_script);
+	SERIALIZE_STR_ARRAY(f, settings, cmdline.argv, cmdline.argc);
 
 	if (settings->sync) {
 		fflush(f);
@@ -1315,6 +1335,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 		PARSE_INT(settings, name, val, enable_code_coverage);
 		PARSE_INT(settings, name, val, cov_results_per_test);
 		PARSE_STR(settings, name, val, code_coverage_script);
+		PARSE_STR_ARRAY(settings, name, val, cmdline.argv, cmdline.argc);
 
 		printf("Warning: Unknown field in settings file: %s = %s\n",
 		       name, val);
diff --git a/runner/settings.h b/runner/settings.h
index f69f09778..2266118a7 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -75,6 +75,10 @@ struct settings {
 	char *code_coverage_script;
 	bool enable_code_coverage;
 	bool cov_results_per_test;
+	struct {
+		int argc;
+		char **argv;
+	} cmdline;
 };
 
 /**
-- 
2.48.0

