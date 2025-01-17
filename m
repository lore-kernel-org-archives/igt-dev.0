Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3193FC0218C
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 23:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95BB10EB8D;
	Fri, 17 Jan 2025 23:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDcSNKqp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EE910E327
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2025 23:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737155890; x=1768691890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0bIpqpRGXhdt7dZ7o9w0zG5EDwuYRTm21SM0zRihHV4=;
 b=QDcSNKqpo5Xy1yAR/I42mcKyDci1XJngjtwcqNgS1sEtt6VQhGzN1yH/
 B5jntahMfjAFLFV63s/iWJREngWZn8MPaoEIVuqk/EDxlGp9KV+/3Zclk
 P46Aw4DAIp9iM2b9zRUcVn+4Lv92caGkgbwud3ja1F5iKgjLAEgrAiFsg
 E5hr2x/X2FhAm3Y605vaJmE9mnt8/iR3HmYCheS7xClO5dz8F5KrYKHkr
 nO0USvBYG7+HgXuWXWTiQlMnW0boC9BVBxf9TI7UYwOOw7KMHPkpgFxNN
 urcjafuKdgs71Bj5TzsCxU7k7TQPryIGe/5GeiYCrqThdr1LPDuqdJ+wc w==;
X-CSE-ConnectionGUID: 5KIMKnLPSzO+gbqgqAEw7A==
X-CSE-MsgGUID: afJApi7XQvauICtWe4SVCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37627820"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; d="scan'208";a="37627820"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 15:18:10 -0800
X-CSE-ConnectionGUID: mbxn7KFQSWareO+J3/gf1A==
X-CSE-MsgGUID: b8ODfZaATr2YeqpAe2JGPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106819383"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 15:18:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 4/5] runner/settings: Serialize command line
Date: Fri, 17 Jan 2025 15:17:50 -0800
Message-ID: <20250117231751.429703-10-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250117231751.429703-1-lucas.demarchi@intel.com>
References: <20250117231751.429703-1-lucas.demarchi@intel.com>
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
 runner/settings.c | 27 +++++++++++++++++++++++++++
 runner/settings.h |  4 ++++
 2 files changed, 31 insertions(+)

diff --git a/runner/settings.c b/runner/settings.c
index 96377f1de..1d65195c9 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -874,6 +874,8 @@ bool parse_options(int argc, char **argv,
 		goto error;
 	}
 
+	settings->cmdline.argc = argc;
+	settings->cmdline.argv = argv;
 
 	return true;
 
@@ -1054,6 +1056,7 @@ static bool serialize_hook_strs(struct settings *settings, int dirfd)
 bool serialize_settings(struct settings *settings)
 {
 #define SERIALIZE_LINE(f, s, name, format) fprintf(f, "%s : " format "\n", #name, s->name)
+#define SERIALIZE_ARRAY_ITEM(f, s, name, _i, format) fprintf(f, "%s[%d] : " format "\n", #name, _i, s->name[_i])
 
 	FILE *f;
 	int dirfd, covfd;
@@ -1122,6 +1125,10 @@ bool serialize_settings(struct settings *settings)
 	SERIALIZE_LINE(f, settings, cov_results_per_test, "%d");
 	SERIALIZE_LINE(f, settings, code_coverage_script, "%s");
 
+	SERIALIZE_LINE(f, settings, cmdline.argc, "%d");
+	for (int i = 0; i < settings->cmdline.argc; i++)
+		SERIALIZE_ARRAY_ITEM(f, settings, cmdline.argv, i, "%s");
+
 	if (settings->sync) {
 		fflush(f);
 		fsync(fileno(f));
@@ -1176,9 +1183,21 @@ static char *parse_str(char **pval)
 		s->field = _f(&val);		\
 		goto cleanup;			\
 	}
+#define PARSE_LINE_ARRAY(s, name, val, field, _f, _max)		\
+	do {							\
+		int idx;					\
+		if (sscanf(name, #field "[%u]", &idx) == 1 &&	\
+		    idx < s->_max) {				\
+			s->field[idx] = _f(&val);		\
+			goto cleanup;				\
+		}						\
+	} while (0)
+
 #define PARSE_INT(s, name, val, field) PARSE_LINE(s, name, val, field, parse_int)
 #define PARSE_UL(s, name, val, field)  PARSE_LINE(s, name, val, field, parse_ul)
 #define PARSE_STR(s, name, val, field) PARSE_LINE(s, name, val, field, parse_str)
+#define PARSE_ARRAY_STR(s, name, val, field, _max) \
+	PARSE_LINE_ARRAY(s, name, val, field, parse_str, _max)
 
 bool read_settings_from_file(struct settings *settings, FILE *f)
 {
@@ -1210,6 +1229,13 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 		PARSE_INT(settings, name, val, enable_code_coverage);
 		PARSE_INT(settings, name, val, cov_results_per_test);
 		PARSE_STR(settings, name, val, code_coverage_script);
+		PARSE_INT(settings, name, val, cmdline.argc);
+
+		if (settings->cmdline.argc && !settings->cmdline.argv)
+			settings->cmdline.argv = calloc(settings->cmdline.argc,
+							sizeof(*settings->cmdline.argv));
+
+		PARSE_ARRAY_STR(settings, name, val, cmdline.argv, cmdline.argc);
 
 		printf("Warning: Unknown field in settings file: %s = %s\n",
 		       name, val);
@@ -1233,6 +1259,7 @@ cleanup:
 	return true;
 }
 #undef PARSE_LINE
+#undef PARSE_LINE_ARRAY
 
 /**
  * read_env_vars_from_file() - load env vars from a file
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

