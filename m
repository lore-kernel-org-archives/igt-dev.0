Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771D91091916
	for <igt-dev@archiver.kernel.org>; Thu, 19 Mar 2026 21:51:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263AB10E95B;
	Thu, 19 Mar 2026 21:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mfXqiWpy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEFB10E15A
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2026 21:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773957101; x=1805493101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xk3V9W+owK+CUnqVaMG3kvmp5eimMoJQHCNcqmymdfk=;
 b=mfXqiWpyYuwKU/Hq0uK8Zs1+CKlWMINgJRY3A2kKWEuI2Of8kGQsd8ot
 BdNVd3OaCuSb2BW44mx0L/CJdrrhzkHUoW7X6IyUJwBzIO4ohFpi83HiQ
 jyRKeHePhZDGd4qGXBfX9qFX5H4S+l4sGaSM+aMU7whEJGwnMdStBK60u
 /QnpAaiUoNS/K3sHBT0Eme1Tp2ELM7GapkQmB10P0CtKOuuDLLzL5c6eU
 9GyGVthvveuGfl6ILOoQWSOckgowZjQIelGwp18k2GwSh2JXEd3fV2Obp
 xhwSe8yRfssNz4vkEEIAo9nttPHWcz8BXlApunePMI79vOviU8sjGzLx1 A==;
X-CSE-ConnectionGUID: WHprrsfzQ1yz/3PSen8klg==
X-CSE-MsgGUID: hSLfH9SaROiE7GRet8AJkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75010859"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75010859"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 14:51:41 -0700
X-CSE-ConnectionGUID: 1nkuQtxxTfeWb5AVnybU1Q==
X-CSE-MsgGUID: e9L/vadFSwOCpmGhu1INHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="253576875"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.112])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 14:51:39 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH i-g-t 2/4] runner: Create attachments directory to use by hooks
Date: Thu, 19 Mar 2026 22:51:27 +0100
Message-ID: <20260319215124.2066611-8-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319215124.2066611-6-zbigniew.kempczynski@intel.com>
References: <20260319215124.2066611-6-zbigniew.kempczynski@intel.com>
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

Results parsing is currently limited to few predefined files.

Create "attachments" directory and export full path of created directory
to be used within hooks. From now on environment variable
IGT_RUNNER_ATTACHMENTS_DIR become visible when igt_runner is used
to execute tests. This env contains directory where subtests/dynsubtests
may write auxiliary files which finally be included in results.json.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
---
 lib/igt_hook.c    |  4 ++++
 runner/executor.c | 15 ++++++++++++++-
 runner/executor.h |  2 ++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/lib/igt_hook.c b/lib/igt_hook.c
index f86ed56f72..57817bdc12 100644
--- a/lib/igt_hook.c
+++ b/lib/igt_hook.c
@@ -518,5 +518,9 @@ available to the command:\n\
 \n\
 Note that %s can be passed multiple times. Each descriptor is evaluated in turn\n\
 when matching events and running hook commands.\n\
+\n\
+When executed by the igt_runner environment IGT_RUNNER_ATTACHMENTS_DIR\n\
+is passed additionally to the hook script. It contains directory where\n\
+script may write additional attachments like guc logs, etc.\n\
 ", option_name);
 }
diff --git a/runner/executor.c b/runner/executor.c
index 885a38a99f..8954073c36 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1779,18 +1779,30 @@ static int execute_next_entry(struct execute_state *state,
 	int errpipe[2] = { -1, -1 };
 	int socket[2] = { -1, -1 };
 	int outfd, errfd, socketfd;
-	char name[32];
+	char name[32], attname[32];
+	char resdirname[PATH_MAX - 32];
+	char attdirname[PATH_MAX];
 	pid_t child;
 	int result;
 	size_t idx = state->next;
+	DIR *currdir;
 
 	snprintf(name, sizeof(name), "%zd", idx);
+	snprintf(attname, sizeof(attname), "%zd/%s", idx, DIR_ATTACHMENTS);
 	mkdirat(resdirfd, name, 0777);
+	mkdirat(resdirfd, attname, 0777);
 	if ((ddirfd = openat(resdirfd, name, O_DIRECTORY | O_RDONLY | O_CLOEXEC)) < 0) {
 		errf("Error accessing individual test result directory\n");
 		return -1;
 	}
 
+	currdir = opendir(".");
+	fchdir(ddirfd);
+	getcwd(resdirname, sizeof(resdirname));
+	fchdir(dirfd(currdir));
+	closedir(currdir);
+	snprintf(attdirname, sizeof(attdirname), "%s/%s", resdirname, DIR_ATTACHMENTS);
+
 	if (!open_output_files(ddirfd, outputs, true)) {
 		errf("Error opening output files\n");
 		result = -1;
@@ -1870,6 +1882,7 @@ static int execute_next_entry(struct execute_state *state,
 			setenv("IGT_RUNNER_SOCKET_FD", envstring, 1);
 		}
 		setenv("IGT_SENTINEL_ON_STDERR", "1", 1);
+		setenv("IGT_RUNNER_ATTACHMENTS_DIR", attdirname, 1);
 
 		execute_test_process(outfd, errfd, socketfd, settings, entry);
 		/* unreachable */
diff --git a/runner/executor.h b/runner/executor.h
index 3b1cabcf55..bc6ac80dc4 100644
--- a/runner/executor.h
+++ b/runner/executor.h
@@ -25,6 +25,8 @@ enum {
 	_F_LAST,
 };
 
+#define DIR_ATTACHMENTS "attachments"
+
 bool open_output_files(int dirfd, int *fds, bool write);
 bool open_output_files_rdonly(int dirfd, int *fds);
 void close_outputs(int *fds);
-- 
2.43.0

