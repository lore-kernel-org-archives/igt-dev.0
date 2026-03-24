Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2596F54AAD
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 13:13:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5955910E661;
	Tue, 24 Mar 2026 13:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TvZMs/r4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTP id CC0E310E661
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 13:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774358014; x=1805894014;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y7T4OdD2IN3pDMEhHR2V/47S/Q74VOOQEHFr4hqCmGk=;
 b=TvZMs/r4VKvksDolMKdRabftrYUwMZLETc2iqCXq8ntSoslzIaafPoLW
 KmI3eQ/pH2njYzZgUw/bC+rkNxHAoaY0+cWvpZAc0j5SrxnM6Xv96N633
 G6o1CZ/sUVofTp808sNbjQtTXot5ZdMRQPMkGXBI3EH/t/7M96gTB+539
 tNnSBUg019GZsBPj6zk04mbsutiXYbItUvOowii8Lv7fGaBREx+mGE63e
 hCn03ltCkHwxwYtVSf1b35R+msv/5uKWYzcmSssQ0G3qUgdGmcuC6jb2p
 dPMwYejdyxA+GaY2/dYLwEFOPL+jLMzywwUBLV51dliZ+Lr0dhhI6b0gR g==;
X-CSE-ConnectionGUID: +0b9+YodQauPJBssby8Vsw==
X-CSE-MsgGUID: aZsU6l5JQPyUXnUV4GCjkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="74395332"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="74395332"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 06:13:08 -0700
X-CSE-ConnectionGUID: LIn2aJM5SGe375tJLlXH+A==
X-CSE-MsgGUID: 6CmZFmwNSXS0/TrGY2DyOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="223563615"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.143])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 06:13:07 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v2 6/6] runner: Add hook-exec-allowlist to execute hooks
 selectively
Date: Tue, 24 Mar 2026 14:12:42 +0100
Message-ID: <20260324131235.712916-14-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324131235.712916-8-zbigniew.kempczynski@intel.com>
References: <20260324131235.712916-8-zbigniew.kempczynski@intel.com>
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

Hook scripts like GuC log copy takes few seconds to complete. This would
lead to large increase of CI execution time.  Add -a/--hook-exec-allowlist
argument to igt_runner to pass file with regexps which matched will
allow executing hook scripts. Syntax of this file is same to blocklists.

Some limitation of this code is hooks will be executed with subtest
granularity - if multiple_mode is used regexp will compare only first
subtest so all subtest in group will call hooks. This is likely not
a big problem as CI executes each subtest individually (without
multiple_mode).

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
---
 runner/executor.c | 32 +++++++++++++++++++++++++++++---
 runner/settings.c | 14 +++++++++++++-
 runner/settings.h |  2 ++
 3 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index bc421f7dbb..ab34ed8258 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1615,6 +1615,18 @@ static int monitor_output(pid_t child,
 	return killed;
 }
 
+static bool matches_any(const char *str, struct regex_list *list)
+{
+	size_t i;
+
+	for (i = 0; i < list->size; i++) {
+		if (g_regex_match(list->regexes[i], str, 0, NULL))
+			return true;
+	}
+
+	return false;
+}
+
 static void __attribute__((noreturn))
 execute_test_process(int outfd, int errfd, int socketfd,
 		     struct settings *settings,
@@ -1623,6 +1635,7 @@ execute_test_process(int outfd, int errfd, int socketfd,
 	struct igt_vec arg_vec;
 	char *arg;
 	size_t rootlen;
+	bool use_hooks = true;
 
 	dup2(outfd, STDOUT_FILENO);
 	dup2(errfd, STDERR_FILENO);
@@ -1646,11 +1659,24 @@ execute_test_process(int outfd, int errfd, int socketfd,
 		arg = strdup("--run-subtest");
 		igt_vec_push(&arg_vec, &arg);
 
-		if ((dynbegin = strchr(entry->subtests[0], '@')) != NULL)
+		if ((dynbegin = strchr(entry->subtests[0], '@')) != NULL) {
 			argsize = dynbegin - entry->subtests[0];
-		else
+		} else {
 			argsize = strlen(entry->subtests[0]);
 
+			if (settings->use_hook_allow_regexes) {
+				char *piglit_name;
+
+				asprintf(&piglit_name, "igt@%s@%s",
+					 entry->binary, entry->subtests[0]);
+
+				if (!matches_any(piglit_name, &settings->hook_allow_regexes))
+					use_hooks = false;
+
+				free(piglit_name);
+			}
+		}
+
 		arg = malloc(argsize + 1);
 		memcpy(arg, entry->subtests[0], argsize);
 		arg[argsize] = '\0';
@@ -1677,7 +1703,7 @@ execute_test_process(int outfd, int errfd, int socketfd,
 		}
 	}
 
-	for (size_t i = 0; i < igt_vec_length(&settings->hook_strs); i++) {
+	for (size_t i = 0; use_hooks && i < igt_vec_length(&settings->hook_strs); i++) {
 		arg = strdup("--hook");
 		igt_vec_push(&arg_vec, &arg);
 		arg = strdup(*((char **)igt_vec_elem(&settings->hook_strs, i)));
diff --git a/runner/settings.c b/runner/settings.c
index 7c29f2d3ab..eb3d05405c 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -50,6 +50,7 @@ enum {
 	OPT_TIMEOUT = 'c',
 	OPT_WATCHDOG = 'g',
 	OPT_BLACKLIST = 'b',
+	OPT_HOOK_EXEC_ALLOWLIST = 'a',
 	OPT_LIST_ALL = 'L',
 };
 
@@ -320,6 +321,9 @@ static const char *usage_str =
 	"                        Forward HOOK_STR to the --hook option of each test.\n"
 	"  --help-hook\n"
 	"                        Show detailed usage information for --hook.\n"
+	"  -a, --hook-exec-allowlist FILENAME\n"
+	"                        Tests name regexes from FILENAME for which hooks scripts\n"
+	"                        may be executed\n"
 	"\n"
 	"  [test_root]           Directory that contains the IGT tests. The environment\n"
 	"                        variable IGT_TEST_ROOT will be used if set, overriding\n"
@@ -715,6 +719,7 @@ bool parse_options(int argc, char **argv,
 		{"dmesg-warn-level", required_argument, NULL, OPT_DMESG_WARN_LEVEL},
 		{"prune-mode", required_argument, NULL, OPT_PRUNE_MODE},
 		{"blacklist", required_argument, NULL, OPT_BLACKLIST},
+		{"hook-exec-allowlist", required_argument, NULL, OPT_HOOK_EXEC_ALLOWLIST},
 		{"list-all", no_argument, NULL, OPT_LIST_ALL},
 		{ 0, 0, 0, 0},
 	};
@@ -726,7 +731,7 @@ bool parse_options(int argc, char **argv,
 	settings->dmesg_warn_level = -1;
 	settings->prune_mode = -1;
 
-	while ((c = getopt_long(argc, argv, "hn:dt:x:e:fk::sl:omb:L",
+	while ((c = getopt_long(argc, argv, "hn:dt:x:e:fk::sl:omb:a:L",
 				long_options, NULL)) != -1) {
 		switch (c) {
 		case OPT_VERSION:
@@ -852,6 +857,13 @@ bool parse_options(int argc, char **argv,
 					"blacklist"))
 				goto error;
 			break;
+		case OPT_HOOK_EXEC_ALLOWLIST:
+			if (!parse_list(&settings->hook_allow_regexes,
+					absolute_path(optarg),
+					"hook-exec-allowlist"))
+				goto error;
+			settings->use_hook_allow_regexes = true;
+			break;
 		case OPT_LIST_ALL:
 			settings->list_all = true;
 			break;
diff --git a/runner/settings.h b/runner/settings.h
index 6c58c3282c..b81f6adc6d 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -59,6 +59,8 @@ struct settings {
 	bool allow_non_root;
 	struct regex_list include_regexes;
 	struct regex_list exclude_regexes;
+	struct regex_list hook_allow_regexes;
+	bool use_hook_allow_regexes;
 	struct igt_list_head env_vars;
 	struct igt_vec hook_strs;
 	bool facts;
-- 
2.43.0

