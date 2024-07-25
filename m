Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584F9C3DA64
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 14:20:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A81810E83D;
	Thu, 25 Jul 2024 14:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gkf97ISQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E158F10E83B
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 14:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721917256; x=1753453256;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s392qunOW1TjMJ55h1abQAIduEquLxdRgOX/LCVQWy4=;
 b=Gkf97ISQFw4kWhlGDIVoYHMRfjqkS7BUkZYshhNYjVwI+0te90a9dcHJ
 hTqhvw6smuxuhLBKMLBR95tRq+d7fA9TBCnj3aQfwfSSk0Afc0MLJxmfQ
 V1FzIb5UFf8HEkPTMCCfLscl/1hi088mVbJqp0wbBZJcCcCrCy38tNC1S
 Lt8iBvzmgwLZtabJT8BTG7I9MrP/8xDIUutXaJ405yDvOQBbu9ZdQsnIv
 sFF08uAPztTOUwK/KZ70do9Yi3ETC9vt/JmcnGevCMqQSOVqt6P4Fk0+D
 hvG+35jK0uJOl2AQ4bEWYZMzGNz0c83B/ZWJJcWBOKjm04m77qp64BEHU w==;
X-CSE-ConnectionGUID: us4FZf6mRqSu5Ke5wd2MJw==
X-CSE-MsgGUID: DniuYYPWS0a1KFglOicNiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="23463862"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="23463862"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 07:20:54 -0700
X-CSE-ConnectionGUID: LmjmOSkwTlCCleaiNVjInw==
X-CSE-MsgGUID: gTNa+3HARTiyrIsse+nTqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="83938456"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.125.111.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 07:20:53 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 5/6] igt_hook: Allow multiple hook descriptors
Date: Thu, 25 Jul 2024 11:19:38 -0300
Message-ID: <20240725142028.51735-6-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240725142028.51735-1-gustavo.sousa@intel.com>
References: <20240725142028.51735-1-gustavo.sousa@intel.com>
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
 lib/igt_core.c                   | 27 +++++++-----
 lib/igt_hook.c                   | 75 ++++++++++++++++++++++++--------
 lib/igt_hook.h                   |  3 +-
 lib/tests/igt_hook.c             | 13 +++++-
 lib/tests/igt_hook_integration.c | 74 ++++++++++++++++++++++++++++---
 runner/settings.c                |  1 +
 6 files changed, 157 insertions(+), 36 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 51141722c89b..e0edfe18f50e 100644
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
-			ret = igt_hook_create(optarg, &igt_hook);
-			if (ret) {
-				igt_critical("Failed to initialize hook data: %s\n",
-					     igt_hook_error_str(ret));
-				ret = -2;
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
+		ret = igt_hook_create(hook_strs.elems, igt_vec_length(&hook_strs), &igt_hook);
+
+		if (ret) {
+			igt_critical("Failed to initialize hook data: %s\n",
+				     igt_hook_error_str(ret));
+			ret = -2;
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
index b9350fdd78b1..ae32668b15f0 100644
--- a/lib/igt_hook.c
+++ b/lib/igt_hook.c
@@ -35,9 +35,13 @@
 
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
@@ -172,15 +176,16 @@ static void igt_hook_update_test_fullname(struct igt_hook *igt_hook)
 
 /**
  * igt_hook_create:
- * @hook_str: Hook descriptor string.
+ * @hook_str: Array of hook strings.
+ * @n: Number of element in @hook_strs.
  * @igt_hook_ptr: Destination of the struct igt_hook pointer.
  *
  * Allocate and initialize an #igt_hook structure.
  *
- * This function parses the hook descriptor in @hook_str and initializes the
+ * This function parses the hook descriptors in @hook_strs and initializes the
  * struct. The pointer to the allocated structure is stored in @igt_hook_ptr.
  *
- * The hook descriptor comes from the argument to `--hook` of the test
+ * Each hook descriptor comes from the argument to `--hook` of the test
  * executable being run.
  *
  * If an error happens, the returned error number can be passed to
@@ -188,20 +193,43 @@ static void igt_hook_update_test_fullname(struct igt_hook *igt_hook)
  *
  * Returns: Zero on success and a non-zero value on error.
  */
-int igt_hook_create(const char *hook_str, struct igt_hook **igt_hook_ptr)
+int igt_hook_create(const char **hook_strs, size_t n, struct igt_hook **igt_hook_ptr)
 {
 	int ret;
-	evt_mask_t evt_mask;
-	const char *cmd;
+	size_t cmd_buffer_size;
+	char *cmd_buffer;
 	struct igt_hook *igt_hook = NULL;
 
-	ret = igt_hook_parse_hook_str(hook_str, &evt_mask, &cmd);
-	if (ret)
-		goto out;
+	/* Parse hook descriptors the first time to learn the needed size. */
+	cmd_buffer_size = 0;
+	for (size_t i = 0; i < n; i++) {
+		evt_mask_t evt_mask;
+		const char *cmd;
+
+		ret = igt_hook_parse_hook_str(hook_strs[i], &evt_mask, &cmd);
+		if (ret)
+			goto out;
+
+		cmd_buffer_size += strlen(cmd) + 1;
+	}
+
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
+	}
 
-	igt_hook = calloc(1, sizeof(*igt_hook));
-	igt_hook->evt_mask = evt_mask;
-	igt_hook->cmd = strdup(cmd);
 	igt_hook->test_name = malloc(TEST_NAME_INITIAL_SIZE);
 	igt_hook->test_name_size = TEST_NAME_INITIAL_SIZE;
 	igt_hook->subtest_name = malloc(TEST_NAME_INITIAL_SIZE);
@@ -237,7 +265,6 @@ void igt_hook_free(struct igt_hook *igt_hook)
 	if (!igt_hook)
 		return;
 
-	free(igt_hook->cmd);
 	free(igt_hook->test_name);
 	free(igt_hook->subtest_name);
 	free(igt_hook->dyn_subtest_name);
@@ -327,6 +354,7 @@ static void igt_hook_update_env_vars(struct igt_hook *igt_hook, struct igt_hook_
 void igt_hook_event_notify(struct igt_hook *igt_hook, struct igt_hook_evt *evt)
 {
 	evt_mask_t evt_bit;
+	bool has_match = false;
 
 	if (!igt_hook)
 		return;
@@ -334,9 +362,19 @@ void igt_hook_event_notify(struct igt_hook *igt_hook, struct igt_hook_evt *evt)
 	evt_bit = (1 << evt->evt_type);
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
 		igt_hook_update_env_vars(igt_hook, evt);
-		system(igt_hook->cmd);
+
+		for (size_t i = 0; igt_hook->descriptors[i].cmd; i++)
+			if (evt_bit & igt_hook->descriptors[i].evt_mask)
+				system(igt_hook->descriptors[i].cmd);
 	}
 
 	igt_hook_update_test_name_post_call(igt_hook, evt);
@@ -466,5 +504,8 @@ available to the command:\n\
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
index 83722cbb2f2b..e9f97b79b943 100644
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
 
-int igt_hook_create(const char *hook_str, struct igt_hook **igt_hook_ptr);
+int igt_hook_create(const char **hook_strs, size_t n, struct igt_hook **igt_hook_ptr);
 void igt_hook_free(struct igt_hook *igt_hook);
 void igt_hook_event_notify(struct igt_hook *igt_hook, struct igt_hook_evt *evt);
 const char *igt_hook_error_str(int error);
diff --git a/lib/tests/igt_hook.c b/lib/tests/igt_hook.c
index 0d71909e676a..676c6eb7a818 100644
--- a/lib/tests/igt_hook.c
+++ b/lib/tests/igt_hook.c
@@ -42,6 +42,15 @@ out:
 	return i;
 }
 
+static int igt_single_hook(const char *hook_str, struct igt_hook **igt_hook_ptr)
+{
+	const char *hook_strs[] = {
+		hook_str,
+	};
+
+	return igt_hook_create(hook_strs, 1, igt_hook_ptr);
+}
+
 static void test_invalid_hook_descriptors(void)
 {
 	struct {
@@ -59,7 +68,7 @@ static void test_invalid_hook_descriptors(void)
 			int err;
 			struct igt_hook *igt_hook;
 
-			err = igt_hook_create(invalid_cases[i].hook_desc, &igt_hook);
+			err = igt_single_hook(invalid_cases[i].hook_desc, &igt_hook);
 			igt_assert(err != 0);
 		}
 	}
@@ -112,7 +121,7 @@ static void test_all_env_vars(void)
 	ret = asprintf(&hook_str, "printenv -0 | grep -z ^IGT_HOOK >&%d", pipefd[1]);
 	igt_assert(ret > 0);
 
-	ret = igt_hook_create(hook_str, &igt_hook);
+	ret = igt_single_hook(hook_str, &igt_hook);
 	igt_assert(ret == 0);
 
 	igt_hook_event_notify(igt_hook, &evt);
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

