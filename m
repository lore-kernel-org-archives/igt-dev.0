Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18481CFD64E
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 15:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F5610E609;
	Wed,  7 Jan 2026 15:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aQ+XqPra";
	dkim-atps=neutral
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D8310E60B
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 15:10:33 +0000 (UTC)
Received: by mail-dl1-f50.google.com with SMTP id
 a92af1059eb24-11f42e97340so2969494c88.0
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jan 2026 07:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767798632; x=1768403432; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gRkSw/iVMcYhrrZk67Mor+fPy7VG54vMpjAlJif7SuU=;
 b=aQ+XqPraVq0kc1Il9tUSnGqdmUekSyuqXrrSfE5MlmWUW+s7wNsI2FA88e7hL8LLaw
 0sIWMdav+QWgOHGgB9oVbJ5Xo3zc0Fi3iKqCp7zwGzN0zY0Dqci13vxPU8DqEbYoEIDJ
 mcMVqabcxgL2drC+c/DNSwwsAgC+rJ6gEIrAKIER3KGCPN3MS0QZWRY7Eja8y6yZ1Itp
 frEbGF1Spix6u9cJKpuTeqL3+rsx1AxKIPiKA13oWbHbYs26b/+yc5Pc/erc7tu03zXJ
 Ek6bvne3pI27WeVlMM5sLqqfxrAxg5IWEwniwf5ZiC3GeDRvgfznvCNpxJDZHzDRN2cE
 rsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767798632; x=1768403432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gRkSw/iVMcYhrrZk67Mor+fPy7VG54vMpjAlJif7SuU=;
 b=tJUUOsyWdJ9OjAv7bjUi15eFwfwN9zyw8Bpgt61dfa91ttgjTigcJPIljLwJg+cP20
 IjYsL6DQ3pORI56woxy2R4reDPYj26ZYl67ywK3+8mESgSgmxi5t3FG4B9Pz0gFeODu8
 +G0Fy08wXw9dAjKhdcVn9rcaFuteGcI6B0AQWY9kzTQXNzNOmPw8FtWwYuxte/nLnib5
 AqSngpIHhEl04KJtJxy+oH/sgPWizLatnHhmM5hbrjMEGmBWPhyWy1VyXA4ZgLBb/fFe
 ORAkWfljT6OtyiVzWkIm+mefTUoFRTIN+QYQNpj9GB+J2z9d3D2sWSC1mb6XnhcxRINh
 jJ3g==
X-Gm-Message-State: AOJu0YwZ8sAG1Xh8D9jTEdcf4BgUg7zgwD2QEi6yc8vSSTn3kNzVjIpg
 s4/8227X4gyj0k+cbgZSSqU8Ak/BlAwE1Nwg+Au2arLJqR+WxtJwR8UVju68GT8A+eE=
X-Gm-Gg: AY/fxX5JI30dWhODw5ggNvfob3aXs+zqO4EfF5/PnH/NJ1j9vkeMfND5MUf4Llp6JY2
 hoi4Vby/hOQeGUrA7paoswlWUfyw1frqCezJ3BM1v2UINoicMOI6QkYRaUkehrzvhyg1bV4+PFy
 3tmgRo7R7zY8ffnJw38JNoweLkLLMGo7E7cc8iwCObL0VFApjjmJZG9FXGt5lJD4MNdwgj6suh2
 O9Fn8ltGveHaEzqdAIufK0oF0QDM17H24++Ya147r4n0TGFE5p0dOODvNbAO9UlgboOuiUbkZXJ
 e9TXiXCHgZmNMxUH91Qzf9oW5aGlIYJcpSMQKQnZvUZyy1gPoZCLXwW/38dgKdxVPH8rd0tI6uB
 +FM+nEWSzW+HYxKuijmVNMAn6uyZBXlDVBrZOm6VXdOrbuzMOqyG/ss/BBvqH/UaKEz863oQmW1
 gr7H+zbRs7RRKQNbYoUqnMjkmTfyowvLQsiV+GYFpVjWemXK8=
X-Google-Smtp-Source: AGHT+IF9dFy5n4SGNm2VDeoe0+bDzHLzBAy4X6Ncq4rV+lfpnD4od47KemeelBP750xrRZbZSlV+0g==
X-Received: by 2002:a05:693c:60d0:b0:2ae:582d:41ab with SMTP id
 5a478bee46e88-2b17d2e4f52mr1663784eec.28.1767798632014; 
 Wed, 07 Jan 2026 07:10:32 -0800 (PST)
Received: from localhost ([192.55.55.48]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b1706a53f0sm6810363eec.10.2026.01.07.07.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 07:10:31 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [RFC PATCH i-g-t 1/1] runner: add possibility to compress dmesgs
 inside json
Date: Wed,  7 Jan 2026 17:10:04 +0200
Message-ID: <20260107151004.327093-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107151004.327093-1-juhapekka.heikkila@gmail.com>
References: <20260107151004.327093-1-juhapekka.heikkila@gmail.com>
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

Here added compress-js parameter for runner. What it does is at per test level
for results.json in dmesg key is written text "compressed" to maintain
compatibility and on the side of it is written new key dmesg-compressed which
contain dmesg ran through zlib and base64 encoded.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 runner/resultgen.c    | 117 ++++++++++++++++++++++++++++++++++++------
 runner/runner_tests.c |   2 +
 runner/settings.c     |   7 +++
 runner/settings.h     |   1 +
 4 files changed, 112 insertions(+), 15 deletions(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index 1f7e79f24..ef6385598 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -8,6 +8,7 @@
 #include <sys/stat.h>
 #include <sys/types.h>
 #include <unistd.h>
+#include <zlib.h>
 
 #include <json.h>
 
@@ -961,12 +962,61 @@ static void generate_formatted_dmesg_line(char *message,
 	*f = '\0';
 }
 
+static struct json_object *encode_compressed_base64(const char *data, size_t len)
+{
+	uLongf destLen;
+	unsigned char *dest;
+	gchar *b64_text;
+	struct json_object *obj;
+
+	if (len == 0)
+		return NULL;
+
+	destLen = compressBound(len);
+	dest = malloc(destLen);
+
+	if (!dest)
+		return NULL;
+
+	if (compress(dest, &destLen, (const unsigned char*)data, len) != Z_OK) {
+		free(dest);
+		return NULL;
+	}
+
+	b64_text = g_base64_encode((const guchar *)dest, (gsize)destLen);
+	obj = json_object_new_string(b64_text);
+
+	g_free(b64_text);
+	free(dest);
+	return obj;
+}
+
 static void add_dmesg(struct json_object *obj,
-		      const char *dmesg, size_t dmesglen,
-		      const char *warnings, size_t warningslen)
+                      struct settings *settings, const char *dmesg,
+		      size_t dmesglen, const char *warnings, size_t warningslen)
 {
-	json_object_object_add(obj, "dmesg",
-			       new_escaped_json_string(dmesg, dmesglen));
+	bool used_compression = false;
+	struct json_object *compressed_obj;
+
+	if (settings && settings->compress_dmesg && dmesglen > 0) {
+	compressed_obj = encode_compressed_base64(dmesg, dmesglen);
+
+		if (compressed_obj) {
+			json_object_object_add(obj, "dmesg",
+					       json_object_new_string("compressed"));
+			json_object_object_add(obj, "dmesg-compressed",
+					       compressed_obj);
+			used_compression = true;
+		} else {
+			fprintf(stderr, "igt_resultgen: Compression failed, falling back to raw dmesg.\n");
+		}
+	}
+
+	/* If compression wasn't requested, or if it failed, write raw dmesg */
+	if (!used_compression) {
+		json_object_object_add(obj, "dmesg",
+				       new_escaped_json_string(dmesg, dmesglen));
+	}
 
 	if (warnings) {
 		json_object_object_add(obj, "dmesg-warnings",
@@ -974,7 +1024,8 @@ static void add_dmesg(struct json_object *obj,
 	}
 }
 
-static void add_empty_dmesgs_where_missing(struct json_object *tests,
+static void add_empty_dmesgs_where_missing(struct settings *settings,
+					   struct json_object *tests,
 					   char *binary,
 					   struct subtest_list *subtests)
 {
@@ -987,7 +1038,7 @@ static void add_empty_dmesgs_where_missing(struct json_object *tests,
 		generate_piglit_name(binary, subtests->subs[i].name, piglit_name, sizeof(piglit_name));
 		current_test = get_or_create_json_object(tests, piglit_name);
 		if (!json_object_object_get_ex(current_test, "dmesg", NULL)) {
-			add_dmesg(current_test, "", 0, NULL, 0);
+			add_dmesg(current_test, settings, "", 0, NULL, 0);
 		}
 
 		for (k = 0; k < subtests->subs[i].dynamic_size; k++) {
@@ -995,7 +1046,7 @@ static void add_empty_dmesgs_where_missing(struct json_object *tests,
 							 dynamic_piglit_name, sizeof(dynamic_piglit_name));
 			current_test = get_or_create_json_object(tests, dynamic_piglit_name);
 			if (!json_object_object_get_ex(current_test, "dmesg", NULL)) {
-				add_dmesg(current_test, "", 0, NULL, 0);
+				add_dmesg(current_test, settings, "", 0, NULL, 0);
 			}
 		}
 	}
@@ -1048,7 +1099,12 @@ static bool fill_from_dmesg(int fd,
 		if ((subtest = strstr(message, STARTING_SUBTEST_DMESG)) != NULL) {
 			if (current_test != NULL) {
 				/* Done with the previous subtest, file up */
-				add_dmesg(current_test, dmesg, dmesglen, warnings, warningslen);
+				add_dmesg(current_test,
+					  settings,
+					  dmesg,
+					  dmesglen,
+					  warnings,
+					  warningslen);
 
 				free(dmesg);
 				free(warnings);
@@ -1056,7 +1112,12 @@ static bool fill_from_dmesg(int fd,
 				dmesglen = warningslen = 0;
 
 				if (current_dynamic_test != NULL)
-					add_dmesg(current_dynamic_test, dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
+					add_dmesg(current_dynamic_test,
+						  settings,
+						  dynamic_dmesg,
+						  dynamic_dmesg_len,
+						  dynamic_warnings,
+						  dynamic_warnings_len);
 
 				free(dynamic_dmesg);
 				free(dynamic_warnings);
@@ -1075,7 +1136,12 @@ static bool fill_from_dmesg(int fd,
 		    (dynamic_subtest = strstr(message, STARTING_DYNAMIC_SUBTEST_DMESG)) != NULL) {
 			if (current_dynamic_test != NULL) {
 				/* Done with the previous dynamic subtest, file up */
-				add_dmesg(current_dynamic_test, dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
+				add_dmesg(current_dynamic_test,
+					  settings,
+					  dynamic_dmesg,
+					  dynamic_dmesg_len,
+					  dynamic_warnings,
+					  dynamic_warnings_len);
 
 				free(dynamic_dmesg);
 				free(dynamic_warnings);
@@ -1116,9 +1182,20 @@ static bool fill_from_dmesg(int fd,
 	free(line);
 
 	if (current_test != NULL) {
-		add_dmesg(current_test, dmesg, dmesglen, warnings, warningslen);
+		add_dmesg(current_test,
+			  settings,
+			  dmesg,
+			  dmesglen,
+			  warnings,
+			  warningslen);
+
 		if (current_dynamic_test != NULL) {
-			add_dmesg(current_dynamic_test, dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
+			add_dmesg(current_dynamic_test,
+				  settings,
+				  dynamic_dmesg,
+				  dynamic_dmesg_len,
+				  dynamic_warnings,
+				  dynamic_warnings_len);
 		}
 	} else {
 		/*
@@ -1134,17 +1211,27 @@ static bool fill_from_dmesg(int fd,
 			 * there are would have skip as their result
 			 * anyway.
 			 */
-			add_dmesg(current_test, dmesg, dmesglen, NULL, 0);
+			add_dmesg(current_test,
+				  settings,
+				  dmesg,
+				  dmesglen,
+				  NULL,
+				  0);
 		}
 
 		if (subtests->size == 0) {
 			generate_piglit_name(binary, NULL, piglit_name, sizeof(piglit_name));
 			current_test = get_or_create_json_object(tests, piglit_name);
-			add_dmesg(current_test, dmesg, dmesglen, warnings, warningslen);
+			add_dmesg(current_test,
+				  settings,
+				  dmesg,
+				  dmesglen,
+				  warnings,
+				  warningslen);
 		}
 	}
 
-	add_empty_dmesgs_where_missing(tests, binary, subtests);
+	add_empty_dmesgs_where_missing(settings, tests, binary, subtests);
 
 	free(dmesg);
 	free(dynamic_dmesg);
diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index 908979982..3ea221ffa 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -484,6 +484,7 @@ int igt_main()
 				       "--collect-script", "/usr/bin/true",
 				       "--hook", "echo hello",
 				       "--hook", "echo world",
+				       "--compress-js",
 				       "--prune-mode=keep-subtests",
 				       "test-root-dir",
 				       "path-to-results",
@@ -1000,6 +1001,7 @@ int igt_main()
 					       "--hook", "echo hello",
 					       "--hook", "echo hello\necho newline",
 					       "--hook", "echo hello\necho newline\\still the second line",
+					       "--compress-js",
 					       testdatadir,
 					       dirname,
 			};
diff --git a/runner/settings.c b/runner/settings.c
index 3ccf71870..7d7320d62 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -33,6 +33,7 @@ enum {
 	OPT_COV_RESULTS_PER_TEST,
 	OPT_HOOK,
 	OPT_HELP_HOOK,
+	OPT_COMPRESS_JSON_DMESG,
 	OPT_VERSION,
 	OPT_PRUNE_MODE,
 	OPT_HELP = 'h',
@@ -704,6 +705,7 @@ bool parse_options(int argc, char **argv,
 		{"collect-script", required_argument, NULL, OPT_CODE_COV_SCRIPT},
 		{"hook", required_argument, NULL, OPT_HOOK},
 		{"help-hook", no_argument, NULL, OPT_HELP_HOOK},
+		{"compress-js", no_argument, NULL, OPT_COMPRESS_JSON_DMESG},
 		{"multiple-mode", no_argument, NULL, OPT_MULTIPLE},
 		{"inactivity-timeout", required_argument, NULL, OPT_TIMEOUT},
 		{"per-test-timeout", required_argument, NULL, OPT_PER_TEST_TIMEOUT},
@@ -815,6 +817,9 @@ bool parse_options(int argc, char **argv,
 		case OPT_HELP_HOOK:
 			igt_hook_print_help(stdout, "--hook");
 			goto error;
+		case OPT_COMPRESS_JSON_DMESG:
+			settings->compress_dmesg = true;
+			break;
 		case OPT_MULTIPLE:
 			settings->multiple_mode = true;
 			break;
@@ -1253,6 +1258,7 @@ bool serialize_settings(struct settings *settings)
 	SERIALIZE_INT(f, settings, enable_code_coverage);
 	SERIALIZE_INT(f, settings, cov_results_per_test);
 	SERIALIZE_STR(f, settings, code_coverage_script);
+	SERIALIZE_INT(f, settings, compress_dmesg);
 	SERIALIZE_STR_ARRAY(f, settings, cmdline.argv, cmdline.argc);
 
 	if (settings->sync) {
@@ -1371,6 +1377,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 		PARSE_INT(settings, name, val, enable_code_coverage);
 		PARSE_INT(settings, name, val, cov_results_per_test);
 		PARSE_STR(settings, name, val, code_coverage_script);
+		PARSE_STR(settings, name, val, compress_dmesg);
 		PARSE_STR_ARRAY(settings, name, val, cmdline.argv, cmdline.argc);
 
 		printf("Warning: Unknown field in settings file: %s = %s\n",
diff --git a/runner/settings.h b/runner/settings.h
index 6c58c3282..09711c052 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -81,6 +81,7 @@ struct settings {
 	char *code_coverage_script;
 	bool enable_code_coverage;
 	bool cov_results_per_test;
+	bool compress_dmesg;
 	struct {
 		int argc;
 		char **argv;
-- 
2.43.0

