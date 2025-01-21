Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1966C02182
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 22:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B14010E269;
	Tue, 21 Jan 2025 22:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQqisra7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3537810E1FF
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 22:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737500272; x=1769036272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wki/YGHb7wGqpg1z83H9pfWaniybuOPYBHeYg4QF8Qk=;
 b=GQqisra7OSnB2dkFlDLHKvQlVHKFcND895lauKfiwkiWXEylIXsIr8ss
 q2y8G2rIH4Qjw3z6+B5ZfuUbJtXosQhSUGhEDPI4sBXmfor6l4VUcf0Zo
 dtlqk0JW5e+RPG0b+rbcMAc1qd7Bh2IeuietO4avqzli92iT5bIkF9R6R
 AiR+f6PUzBDgeZ9dYlgnO1Qr1Qb6+94Fdk+S7Pffnyy76os1DshVcNLRK
 yaai4FL0pzJhPWDdvKL4j1kXJDpCqY15+fZ+q3t3ZRiR/pqTDZzxnOlNG
 e5K6qlNMlH6OKysDxvLNjBEHcJTuNtjPuBLhGCFQwg18QVRcdim0E/Rpj A==;
X-CSE-ConnectionGUID: weVViQehSaS+RwW1lQhdRw==
X-CSE-MsgGUID: GKuiLdVkQFi5nOpsmUjgmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="55352728"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; d="scan'208";a="55352728"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 14:57:52 -0800
X-CSE-ConnectionGUID: YkPxJ29+RQSEHW3FLnf+mg==
X-CSE-MsgGUID: 18imtH+eTby0rlIlP/Xb7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="111933681"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 14:57:52 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 6/7] runner/settings: Serialize command line
Date: Tue, 21 Jan 2025 14:57:32 -0800
Message-ID: <20250121225733.808978-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250121225733.808978-1-lucas.demarchi@intel.com>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
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
 runner/settings.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 runner/settings.h |  5 +++++
 2 files changed, 47 insertions(+)

diff --git a/runner/settings.c b/runner/settings.c
index 2787869ee..ed1afc205 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -529,6 +529,18 @@ static void free_hook_strs(struct igt_vec *hook_strs)
 	igt_vec_fini(hook_strs);
 }
 
+static void free_cmdline(struct settings *settings)
+{
+	if (!settings->cmdline.allocated)
+		return;
+
+	for (size_t i = 0; i < settings->cmdline.argc; i++)
+		free(settings->cmdline.argv[i]);
+
+	free(settings->cmdline.argv);
+}
+
+
 static bool file_exists_at(int dirfd, const char *filename)
 {
 	return faccessat(dirfd, filename, F_OK, 0) == 0;
@@ -646,6 +658,7 @@ void clear_settings(struct settings *settings)
 	free_regexes(&settings->exclude_regexes);
 	free_env_vars(&settings->env_vars);
 	free_hook_strs(&settings->hook_strs);
+	free_cmdline(settings);
 
 	init_settings(settings);
 }
@@ -875,6 +888,8 @@ bool parse_options(int argc, char **argv,
 		goto error;
 	}
 
+	settings->cmdline.argc = argc;
+	settings->cmdline.argv = argv;
 
 	return true;
 
@@ -1055,6 +1070,7 @@ static bool serialize_hook_strs(struct settings *settings, int dirfd)
 bool serialize_settings(struct settings *settings)
 {
 #define SERIALIZE_LINE(f, s, name, format) fprintf(f, "%s : " format "\n", #name, s->name)
+#define SERIALIZE_ARRAY_ITEM(f, s, name, _i, format) fprintf(f, "%s[%d] : " format "\n", #name, _i, s->name[_i])
 
 	FILE *f;
 	int dirfd, covfd;
@@ -1123,6 +1139,10 @@ bool serialize_settings(struct settings *settings)
 	SERIALIZE_LINE(f, settings, cov_results_per_test, "%d");
 	SERIALIZE_LINE(f, settings, code_coverage_script, "%s");
 
+	SERIALIZE_LINE(f, settings, cmdline.argc, "%d");
+	for (int i = 0; i < settings->cmdline.argc; i++)
+		SERIALIZE_ARRAY_ITEM(f, settings, cmdline.argv, i, "%s");
+
 	if (settings->sync) {
 		fflush(f);
 		fsync(fileno(f));
@@ -1177,9 +1197,21 @@ static char *parse_str(char **pval)
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
@@ -1211,6 +1243,15 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 		PARSE_INT(settings, name, val, enable_code_coverage);
 		PARSE_INT(settings, name, val, cov_results_per_test);
 		PARSE_STR(settings, name, val, code_coverage_script);
+		PARSE_INT(settings, name, val, cmdline.argc);
+
+		if (settings->cmdline.argc && !settings->cmdline.argv) {
+			settings->cmdline.allocated = true;
+			settings->cmdline.argv = calloc(settings->cmdline.argc,
+							sizeof(*settings->cmdline.argv));
+		}
+
+		PARSE_ARRAY_STR(settings, name, val, cmdline.argv, cmdline.argc);
 
 		printf("Warning: Unknown field in settings file: %s = %s\n",
 		       name, val);
@@ -1234,6 +1275,7 @@ cleanup:
 	return true;
 }
 #undef PARSE_LINE
+#undef PARSE_LINE_ARRAY
 
 /**
  * read_env_vars_from_file() - load env vars from a file
diff --git a/runner/settings.h b/runner/settings.h
index f69f09778..d563a0d16 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -75,6 +75,11 @@ struct settings {
 	char *code_coverage_script;
 	bool enable_code_coverage;
 	bool cov_results_per_test;
+	struct {
+		bool allocated;
+		int argc;
+		char **argv;
+	} cmdline;
 };
 
 /**
-- 
2.48.0

