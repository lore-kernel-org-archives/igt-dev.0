Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1545CC0219D
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 23:13:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B379310E337;
	Fri,  7 Feb 2025 23:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QI2ifcu3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9356110E348
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 23:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738969870; x=1770505870;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=phVVPDHOCRCBADY/eqGV0GQlSPWtjjUeMlUbn5imzBM=;
 b=QI2ifcu3/O8ZLLmyPcrYGmbKdO8p35vj3hKlpRtbT+i9WiN3qFVztye3
 aBY9VfeINFCLntmLdAMlObbYMQb+qIL/zB1qJayCxc0Fhnsq4BihA3dym
 jtJ3fmiOCkEMB0T/zk1dPqnbqZE+Onzu5lAR5hDAKbQmdlAGwmfvOy4RM
 jWh3/H3CHayZ7WqOeIqAbqn93TiY6Wg+FSksdTWeJAKAhOWWuQPuQx2YG
 9/rXYEDdmalbQ3ooEHkVXDvzH69//KDncqbz1Tv8gnRxhYwhjOfEEdZps
 vV6cWRPqFjcpGnmDgESr5JUCOngp/pg0SYdY+QaYZOAm7JDKg6ZHakmaX Q==;
X-CSE-ConnectionGUID: tzj1wjlETXCCFfv9jtrP/Q==
X-CSE-MsgGUID: SuxHd+9MS2qEWPaDhLrCuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43281778"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="43281778"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 15:11:09 -0800
X-CSE-ConnectionGUID: w1o9bZeJSEOhNZU70/xdYQ==
X-CSE-MsgGUID: sKXSsk/AT6evbunAv6YkRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="111425879"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 15:11:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [CI i-g-t 09/10] runner/settings: Serialize command line
Date: Fri,  7 Feb 2025 15:09:43 -0800
Message-ID: <20250207231039.2883195-11-lucas.demarchi@intel.com>
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

Serialize the command line to metadata.txt. The expected format in the
metadata.txt is like below:

	cmdline.argc : 6
	cmdline.argv[0] : ./build/runner/igt_runner
	cmdline.argv[1] : -o
	cmdline.argv[2] : --test-list
	cmdline.argv[3] : /tmp/testlist.txt
	cmdline.argv[4] : build/tests/
	cmdline.argv[5] : /tmp/results

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 runner/settings.c | 24 ++++++++++++++++++++++++
 runner/settings.h |  4 ++++
 2 files changed, 28 insertions(+)

diff --git a/runner/settings.c b/runner/settings.c
index 1da005806..a2fddcaf6 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -530,6 +530,17 @@ static void free_hook_strs(struct igt_vec *hook_strs)
 	igt_vec_fini(hook_strs);
 }
 
+static void free_array_deep(void **arr, size_t n)
+{
+	if (!arr)
+		return;
+
+	for (size_t i = 0; i < n; i++)
+		free(arr[i]);
+
+	free(arr);
+}
+
 static bool file_exists_at(int dirfd, const char *filename)
 {
 	return faccessat(dirfd, filename, F_OK, 0) == 0;
@@ -647,6 +658,7 @@ void clear_settings(struct settings *settings)
 	free_regexes(&settings->exclude_regexes);
 	free_env_vars(&settings->env_vars);
 	free_hook_strs(&settings->hook_strs);
+	free_array_deep((void **)settings->cmdline.argv, settings->cmdline.argc);
 
 	init_settings(settings);
 }
@@ -876,6 +888,16 @@ bool parse_options(int argc, char **argv,
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
 
@@ -1204,6 +1226,7 @@ bool serialize_settings(struct settings *settings)
 	SERIALIZE_INT(f, settings, enable_code_coverage);
 	SERIALIZE_INT(f, settings, cov_results_per_test);
 	SERIALIZE_STR(f, settings, code_coverage_script);
+	SERIALIZE_STR_ARRAY(f, settings, cmdline.argv, cmdline.argc);
 
 	if (settings->sync) {
 		fflush(f);
@@ -1319,6 +1342,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
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
2.48.1

