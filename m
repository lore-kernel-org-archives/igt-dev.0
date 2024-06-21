Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0C4C2BD05
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 19:53:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F6810E0D6;
	Fri, 21 Jun 2024 19:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Au+V8s1p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1908610E15E
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 19:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718999588; x=1750535588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MXfgIM0tHNqUubJT61VzRUw65ZQ+uB7Y9eRJ9J2jhHg=;
 b=Au+V8s1pAv5bh7XGDG66SMq70fcBEsqGxOUi1sluhL9ad3UPZnxAkede
 HMWmz1LTjTEYDrQVkkQ6xtXX4yq2GGRziOeO5pqkQpdEd8a/Te8+38Tee
 4HFEcM+xjbyeoMnOjqREgOIxttlVgmAuE0tPsvvQaY75NCzyNvovsgLek
 QMRNw52lh68whRWItSEo0I2tphLQ9VzDa8SfCpKuTm0cwKVxqZbxWA3Th
 mCLvNIAOxvGttBKAos4OF719N2N+RpbBegIPErs+gTXFGOFe1KRXjNKmC
 lx1nDOToNunsv1hr5Cj81PdcYXJv2V1Ptnvf8qGKCL7UfXEF6vGdqJiCd A==;
X-CSE-ConnectionGUID: e1hNj3aTSXKFjyPri4J2Kg==
X-CSE-MsgGUID: 9mHcP7npQ9aBtNhALiF5Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15925562"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="15925562"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 12:53:08 -0700
X-CSE-ConnectionGUID: +PGCdQ4HRVu4wNpcCrTVnA==
X-CSE-MsgGUID: mgnPWDPoScm1jX7wPOVNBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="73432165"
Received: from dgramcko-desk.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.124.221.63])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 12:53:07 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: [PATCH i-g-t v2 5/7] igt_hook: Allow multiple hook descriptors
Date: Fri, 21 Jun 2024 16:51:50 -0300
Message-ID: <20240621195150.390462-8-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240621195150.390462-1-gustavo.sousa@intel.com>
References: <20240621195150.390462-1-gustavo.sousa@intel.com>
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

Extend the current hook functionality to allow using multiple hook
descriptors. That allows running a test binary like the following:

    my-test --hook pre-subtest:do-something \
            --hook post-subtest:do-somthing-else

Which is more convenient to the user than having to implement a script
that checks the value of IGT_HOOK_EVENT environment variable.

Note that we still need to add the same support for igt_runner, which is
left for a followup change.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/igt_core.c                   | 27 ++++++-----
 lib/igt_hook.c                   | 77 +++++++++++++++++++++++---------
 lib/igt_hook.h                   |  3 +-
 lib/tests/igt_hook.c             | 16 +++++--
 lib/tests/igt_hook_integration.c | 74 +++++++++++++++++++++++++++---
 runner/settings.c                |  1 +
 6 files changed, 157 insertions(+), 41 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 6463a5bdcae5..3764525d4a66 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -78,6 +78,7 @@
 #include "igt_map.h"
 #include "igt_device_scan.h"
 #include "igt_thread.h"
+#include "igt_vec.h"
 #include "runnercomms.h"
 
 #define UNW_LOCAL_ONLY
@@ -1115,10 +1116,12 @@ static int common_init(int *argc, char **argv,
 	struct option *combined_opts;
 	int extra_opt_count;
 	int all_opt_count;
+	struct igt_vec hook_strs;
 	int ret = 0;
 
 	common_init_env();
 	IGT_INIT_LIST_HEAD(&subgroup_descriptions);
+	igt_vec_init(&hook_strs, sizeof(char *));
 
 	command_str = argv[0];
 	if (strrchr(command_str, '/'))
@@ -1241,17 +1244,7 @@ static int common_init(int *argc, char **argv,
 			break;
 		case OPT_HOOK:
 			assert(optarg);
-			if (igt_hook) {
-				igt_warn("Overriding previous hook descriptor\n");
-				igt_hook_free(igt_hook);
-			}
-			igt_hook = igt_hook_create(optarg, &ret);
-			if (!igt_hook) {
-				igt_critical("Failed to initialize hook data: %s\n",
-					     igt_hook_error_str(ret));
-				ret = ret > 0 ? -2 : -3;
-				goto out;
-			}
+			igt_vec_push(&hook_strs, &optarg);
 			break;
 		case OPT_HELP_HOOK:
 			igt_hook_print_help(stdout, "--hook");
@@ -1285,11 +1278,23 @@ static int common_init(int *argc, char **argv,
 		}
 	}
 
+	if (igt_vec_length(&hook_strs)) {
+		igt_hook = igt_hook_create(hook_strs.elems, igt_vec_length(&hook_strs), &ret);
+
+		if (!igt_hook) {
+			igt_critical("Failed to initialize hook data: %s\n",
+				     igt_hook_error_str(ret));
+			ret = ret > 0 ? -2 : -3;
+			goto out;
+		}
+	}
+
 	common_init_config();
 
 out:
 	free(short_opts);
 	free(combined_opts);
+	igt_vec_fini(&hook_strs);
 
 	/* exit immediately if this test has no subtests and a subtest or the
 	 * list of subtests has been requested */
diff --git a/lib/igt_hook.c b/lib/igt_hook.c
index a4421e2b1543..4a7c598e5d43 100644
--- a/lib/igt_hook.c
+++ b/lib/igt_hook.c
@@ -36,9 +36,13 @@
 
 typedef uint16_t evt_mask_t;
 
-struct igt_hook {
+struct igt_hook_descriptor {
 	evt_mask_t evt_mask;
 	char *cmd;
+};
+
+struct igt_hook {
+	struct igt_hook_descriptor *descriptors;
 	char *test_name;
 	size_t test_name_size;
 	char *subtest_name;
@@ -174,15 +178,16 @@ static void igt_hook_update_test_fullname(struct igt_hook *igt_hook)
 
 /**
  * igt_hook_create:
- * @hook_str: Hook descriptor string.
+ * @hook_str: Array of hook strings.
+ * @n: Number of element in @hook_strs.
  * @error: Pointer to error number.
  *
  * Allocate and initialize an #igt_hook structure.
  *
- * This function parses the hook descriptor @hook_str and initializes the struct
- * to be returned.
+ * This function parses the hook descriptors in @hook_strs and initializes the
+ * struct to be returned.
  *
- * The hook descriptor comes from the argument to `--hook` of the test
+ * Each hook descriptor comes from the argument to `--hook` of the test
  * executable being run.
  *
  * If not #NULL, @error is used to store a non-zero error number if an error
@@ -191,25 +196,41 @@ static void igt_hook_update_test_fullname(struct igt_hook *igt_hook)
  *
  * Returns: The pointer to the #igt_hook structure on success or #NULL on error.
  */
-struct igt_hook *igt_hook_create(const char *hook_str, int *error)
+struct igt_hook *igt_hook_create(const char **hook_strs, size_t n, int *error)
 {
 	int err;
-	evt_mask_t evt_mask;
-	const char *cmd;
+	size_t cmd_buffer_size;
+	char *cmd_buffer;
 	struct igt_hook *igt_hook = NULL;
 
+	/* Parse hook descriptors the first time to learn the needed size. */
+	cmd_buffer_size = 0;
+	for (size_t i = 0; i < n; i++) {
+		evt_mask_t evt_mask;
+		const char *cmd;
 
-	err = igt_hook_parse_hook_str(hook_str, &evt_mask, &cmd);
-	if (err)
-		goto out;
+		err = igt_hook_parse_hook_str(hook_strs[i], &evt_mask, &cmd);
+		if (err)
+			goto out;
 
-	igt_hook = calloc(1, sizeof(*igt_hook));
-	igt_hook->evt_mask = evt_mask;
+		cmd_buffer_size += strlen(cmd) + 1;
+	}
 
-	igt_hook->cmd = strdup(cmd);
-	if (!igt_hook->cmd) {
-		err = -errno;
-		goto out;
+	igt_hook = calloc(1, (sizeof(*igt_hook) + (n + 1) * sizeof(*igt_hook->descriptors) +
+			      cmd_buffer_size));
+
+	/* Now parse hook descriptors a second time and store the result. */
+	igt_hook->descriptors = (void *)igt_hook + sizeof(*igt_hook);
+	cmd_buffer = (void *)igt_hook->descriptors + (n + 1) * sizeof(*igt_hook->descriptors);
+	for (size_t i = 0; i < n; i++) {
+		evt_mask_t evt_mask;
+		const char *cmd;
+
+		igt_hook_parse_hook_str(hook_strs[i], &evt_mask, &cmd);
+		strcpy(cmd_buffer, cmd);
+		igt_hook->descriptors[i].evt_mask = evt_mask;
+		igt_hook->descriptors[i].cmd = cmd_buffer;
+		cmd_buffer += strlen(cmd) + 1;
 	}
 
 	igt_hook->test_name = malloc(TEST_NAME_INITIAL_SIZE);
@@ -251,7 +272,6 @@ void igt_hook_free(struct igt_hook *igt_hook)
 	if (!igt_hook)
 		return;
 
-	free(igt_hook->cmd);
 	free(igt_hook->test_name);
 	free(igt_hook->subtest_name);
 	free(igt_hook->dyn_subtest_name);
@@ -338,17 +358,29 @@ static void igt_hook_update_env_vars(struct igt_hook *igt_hook, struct igt_hook_
  */
 void igt_hook_push_evt(struct igt_hook *igt_hook, struct igt_hook_evt *evt)
 {
+	bool has_match = false;
 	evt_mask_t evt_bit = (1 << evt->evt_type);
 
 	igt_hook_update_test_name_pre_call(igt_hook, evt);
 
-	if ((evt_bit & igt_hook->evt_mask)) {
+	for (size_t i = 0; igt_hook->descriptors[i].cmd; i++) {
+		if (evt_bit & igt_hook->descriptors[i].evt_mask) {
+			has_match = true;
+			break;
+		}
+	}
+
+	if (has_match) {
 		struct igt_helper_process proc = {};
 
 		igt_fork_helper(&proc) {
 			igt_hook_update_env_vars(igt_hook, evt);
-			system(igt_hook->cmd);
+
+			for (size_t i = 0; igt_hook->descriptors[i].cmd; i++)
+				if (evt_bit & igt_hook->descriptors[i].evt_mask)
+					system(igt_hook->descriptors[i].cmd);
 		}
+
 		igt_wait_helper(&proc);
 	}
 
@@ -485,5 +517,8 @@ available to the command:\n\
   values are: SUCCESS, SKIP or FAIL. This is only applicable on \"post-*\"\n\
   events and will be the empty string for other types of events.\n\
 \n\
-");
+\n\
+Note that %s can be passed multiple times. Each descriptor is evaluated in turn\n\
+when matching events and running hook commands.\n\
+", option_name);
 }
diff --git a/lib/igt_hook.h b/lib/igt_hook.h
index a7b67837e5a4..e5b57260e3cb 100644
--- a/lib/igt_hook.h
+++ b/lib/igt_hook.h
@@ -6,6 +6,7 @@
 #ifndef IGT_HOOK_H
 #define IGT_HOOK_H
 
+#include <stddef.h>
 #include <stdio.h>
 
 /**
@@ -60,7 +61,7 @@ struct igt_hook_evt {
 	const char *result;
 };
 
-struct igt_hook *igt_hook_create(const char *hook_str, int *error);
+struct igt_hook *igt_hook_create(const char **hook_strs, size_t n, int *error);
 void igt_hook_free(struct igt_hook *igt_hook);
 void igt_hook_push_evt(struct igt_hook *igt_hook, struct igt_hook_evt *evt);
 const char *igt_hook_error_str(int error);
diff --git a/lib/tests/igt_hook.c b/lib/tests/igt_hook.c
index c8a93952abed..a2def893d7f7 100644
--- a/lib/tests/igt_hook.c
+++ b/lib/tests/igt_hook.c
@@ -42,12 +42,22 @@ out:
 	return i;
 }
 
+
+static struct igt_hook *igt_single_hook(const char *hook_str, int *error)
+{
+	const char *hook_strs[] = {
+		hook_str,
+	};
+
+	return igt_hook_create(hook_strs, 1, error);
+}
+
 static void test_null_error_pointer(void)
 {
 	struct igt_hook *igt_hook;
 
 	/* Ensure passing NULL error pointer does not cause issues. */
-	igt_hook = igt_hook_create("invalid:echo hello", NULL);
+	igt_hook = igt_single_hook("invalid:echo hello", NULL);
 	igt_assert(igt_hook == NULL);
 }
 
@@ -68,7 +78,7 @@ static void test_invalid_hook_descriptors(void)
 			int err = 0;
 			struct igt_hook *igt_hook;
 
-			igt_hook = igt_hook_create(invalid_cases[i].hook_desc, &err);
+			igt_hook = igt_single_hook(invalid_cases[i].hook_desc, &err);
 			igt_assert(igt_hook == NULL);
 			igt_assert(err != 0);
 		}
@@ -122,7 +132,7 @@ static void test_all_env_vars(void)
 	ret = asprintf(&hook_str, "printenv -0 | grep -z ^IGT_HOOK >&%d", pipefd[1]);
 	igt_assert(ret > 0);
 
-	igt_hook = igt_hook_create(hook_str, NULL);
+	igt_hook = igt_single_hook(hook_str, NULL);
 	igt_assert(igt_hook);
 
 	igt_hook_push_evt(igt_hook, &evt);
diff --git a/lib/tests/igt_hook_integration.c b/lib/tests/igt_hook_integration.c
index c552d5a4e796..8dffa0819f9b 100644
--- a/lib/tests/igt_hook_integration.c
+++ b/lib/tests/igt_hook_integration.c
@@ -215,6 +215,14 @@ out:
 	return true;
 }
 
+
+#define checked_snprintf(char_array, format...) \
+	({\
+		int ret__ = snprintf(char_array, sizeof(char_array), format); \
+		internal_assert(0 < ret__ && ret__ < sizeof(char_array)); \
+		ret__; \
+	})
+
 static void run_tests_and_match_env(const char *evt_descriptors, const char **expected_envs[])
 {
 	int i;
@@ -230,11 +238,9 @@ static void run_tests_and_match_env(const char *evt_descriptors, const char **ex
 	/* Use grep to filter only env var set by us. This should ensure that
 	 * writing to the pipe will not block due to capacity, since we only
 	 * read from the pipe after the shell command is done. */
-	ret = snprintf(hook_str, sizeof(hook_str),
-		     "%1$s:printenv -0 | grep -z ^IGT_HOOK >&%2$d; printf -- ---\\\\00 >&%2$d",
-		     evt_descriptors,
-		     pipefd[1]);
-	internal_assert(0 < ret && ret < sizeof(hook_str));
+	checked_snprintf(hook_str,
+			 "%1$s:printenv -0 | grep -z ^IGT_HOOK >&%2$d; printf -- ---\\\\00 >&%2$d",
+			 evt_descriptors, pipefd[1]);
 
 	set_fake_argv("igt_hook_integration", "--hook", hook_str, NULL);
 
@@ -254,6 +260,59 @@ static void run_tests_and_match_env(const char *evt_descriptors, const char **ex
 
 }
 
+static void test_multiple_hook_options(void)
+{
+	int ret;
+	int pipefd[2];
+	pid_t pid;
+	char hook_strs[3][128];
+	char hook_out[4096] = {};
+	char expected_output[] = (
+		"  hook-2 pre-subtest igt@igt_hook_integration@a\n"
+		"  hook-0 post-subtest igt@igt_hook_integration@a\n"
+		"  hook-1 post-subtest igt@igt_hook_integration@a\n"
+		"  hook-2 pre-subtest igt@igt_hook_integration@b\n"
+		"  hook-0 post-subtest igt@igt_hook_integration@b\n"
+		"  hook-1 post-subtest igt@igt_hook_integration@b\n"
+		"  hook-0 post-test igt@igt_hook_integration\n"
+	);
+
+	ret = pipe(pipefd);
+	internal_assert(ret == 0);
+
+	checked_snprintf(hook_strs[0],
+			 "post-test,post-subtest:echo '  hook-0' $IGT_HOOK_EVENT $IGT_HOOK_TEST_FULLNAME >&%d",
+			 pipefd[1]);
+
+	checked_snprintf(hook_strs[1],
+			 "post-subtest:echo '  hook-1' $IGT_HOOK_EVENT $IGT_HOOK_TEST_FULLNAME >&%d",
+			 pipefd[1]);
+
+	checked_snprintf(hook_strs[2],
+			 "pre-subtest:echo '  hook-2' $IGT_HOOK_EVENT $IGT_HOOK_TEST_FULLNAME >&%d",
+			 pipefd[1]);
+
+	set_fake_argv("igt_hook_integration",
+		      "--hook", hook_strs[0],
+		      "--hook", hook_strs[1],
+		      "--hook", hook_strs[2],
+		      NULL);
+
+	pid = do_fork_bg_with_pipes(fake_main, NULL, NULL);
+	internal_assert(safe_wait(pid, &ret) != -1);
+	internal_assert_wexited(ret, IGT_EXIT_FAILURE);
+
+	close(pipefd[1]);
+	read_whole_pipe(pipefd[0], hook_out, sizeof(hook_out));
+	close(pipefd[0]);
+
+	if (strcmp(hook_out, expected_output)) {
+		printf("Expected output:\n%s\n\n", expected_output);
+		printf("Output from hook:\n%s\n", hook_out);
+	}
+	internal_assert(strcmp(hook_out, expected_output) == 0);
+}
+
 int main(int argc, char **argv)
 {
 	{
@@ -307,4 +366,9 @@ int main(int argc, char **argv)
 		printf("Check multiple event types tracking\n");
 		run_tests_and_match_env("post-dyn-subtest,pre-subtest", expected_envs);
 	}
+
+	{
+		printf("Check multiple hook options\n");
+		test_multiple_hook_options();
+	}
 }
diff --git a/runner/settings.c b/runner/settings.c
index e554a5c70776..6fd742cc826d 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -758,6 +758,7 @@ bool parse_options(int argc, char **argv,
 				fprintf(stderr, "Newlines in --hook are currently unsupported.\n");
 				goto error;
 			}
+			/* FIXME: Allow as many options as allowed by test binaries. */
 			settings->hook_str = optarg;
 			break;
 		case OPT_HELP_HOOK:
-- 
2.45.2

