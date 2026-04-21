Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22BBF8925F
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 11:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E3A10EC2A;
	Tue, 21 Apr 2026 11:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S/W+WFio";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4069C10EC2A
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 11:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776770254; x=1808306254;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uTfYzxug4n2sdQnrgxzJxMnYAaO0NRq+o8vnrwrye3w=;
 b=S/W+WFioL39un70RcnI/C5b/VVjfJS0WDFIXEizVteF4w94XWUvIOux+
 tqGNpT8nTum593X2aludQY5fAkVUeA9NQlY4mz6Ygg7BZICX3IOCvupNo
 Jm1KMwytqArzCn+QQgSXkX+sctr/PV3TPI7b7xkUXwfRoiWLRnW3tN6mg
 wb9EZmSShkX+ZhmiG8hgBrC1YQu3Ak1RBytIum/Rj/eRtW78GP6t83HDU
 T+xolHQmZUKnkZxhIDrwa1DDOl0NUJEPU0aS8laU5/XBQ86wbkljkhnFt
 ABQmNglrXeZhlO0zMra0uZAZJ/dUC8gkI2uoMsZdN1kt6MVqW5IjA+Zww g==;
X-CSE-ConnectionGUID: NODiNBbYRWOPvfku/ExvzQ==
X-CSE-MsgGUID: dFK7PoFuQEGdgzKIeddAPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77401535"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="77401535"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 04:17:23 -0700
X-CSE-ConnectionGUID: KiVj/ObURlavlkFJWat0jA==
X-CSE-MsgGUID: 5PFqqML8RsSI/RgZY0K0CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="229340699"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 04:17:21 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t 2/4] runner: Create attachments directory to use by hooks
Date: Tue, 21 Apr 2026 13:17:12 +0200
Message-ID: <20260421111709.3163253-8-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421111709.3163253-6-zbigniew.kempczynski@intel.com>
References: <20260421111709.3163253-6-zbigniew.kempczynski@intel.com>
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
may write auxiliary files which filenames will be included in results.json.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 lib/igt_hook.c    |  4 +++
 runner/executor.c | 76 +++++++++++++++++++++++++++++++++++++++--------
 runner/executor.h |  2 ++
 3 files changed, 70 insertions(+), 12 deletions(-)

diff --git a/lib/igt_hook.c b/lib/igt_hook.c
index f86ed56f72..b8f25b6c7a 100644
--- a/lib/igt_hook.c
+++ b/lib/igt_hook.c
@@ -518,5 +518,9 @@ available to the command:\n\
 \n\
 Note that %s can be passed multiple times. Each descriptor is evaluated in turn\n\
 when matching events and running hook commands.\n\
+\n\
+When executed by the igt_runner, environment IGT_RUNNER_ATTACHMENTS_DIR\n\
+is passed additionally to the hook script. It contains directory where\n\
+script may write additional attachments like guc logs, etc.\n\
 ", option_name);
 }
diff --git a/runner/executor.c b/runner/executor.c
index 1485b59d1f..a8907c575a 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1,6 +1,7 @@
 #include <ctype.h>
 #include <errno.h>
 #include <fcntl.h>
+#include <ftw.h>
 #ifdef ANDROID
 #include "android/glib.h"
 #else
@@ -1779,17 +1780,22 @@ static int execute_next_entry(struct execute_state *state,
 	int errpipe[2] = { -1, -1 };
 	int socket[2] = { -1, -1 };
 	int outfd, errfd, socketfd;
-	char name[32];
+	char name[32], attname[32];
+	char attdirname[PATH_MAX];
 	pid_t child;
 	int result;
 	size_t idx = state->next;
 
 	snprintf(name, sizeof(name), "%zd", idx);
+	snprintf(attname, sizeof(attname), "%zd/%s", idx, DIR_ATTACHMENTS);
 	mkdirat(resdirfd, name, 0777);
+	mkdirat(resdirfd, attname, 0777);
 	if ((idirfd = openat(resdirfd, name, O_DIRECTORY | O_RDONLY | O_CLOEXEC)) < 0) {
 		errf("Error accessing individual test result directory\n");
 		return -1;
 	}
+	snprintf(attdirname, sizeof(attdirname), "%s/%s",
+		 settings->results_path, attname);
 
 	if (!open_output_files(idirfd, outputs, true)) {
 		errf("Error opening output files\n");
@@ -1870,6 +1876,7 @@ static int execute_next_entry(struct execute_state *state,
 			setenv("IGT_RUNNER_SOCKET_FD", envstring, 1);
 		}
 		setenv("IGT_SENTINEL_ON_STDERR", "1", 1);
+		setenv("IGT_RUNNER_ATTACHMENTS_DIR", attdirname, 1);
 
 		execute_test_process(outfd, errfd, socketfd, settings, entry);
 		/* unreachable */
@@ -1948,19 +1955,66 @@ static int remove_file(int dirfd, const char *name)
 	return unlinkat(dirfd, name, 0) && errno != ENOENT;
 }
 
-static bool clear_test_result_directory(int dirfd)
+static int ftw_attachment_removal(const char *fpath, const struct stat *sb,
+				  int typeflag, struct FTW *ftwbuf)
 {
-	int i;
+	(void)sb;
+	(void)ftwbuf;
+
+	switch (typeflag) {
+	case FTW_F:
+	case FTW_SL:
+		if (unlink(fpath)) {
+			errf("Error removing file %s: %s\n",
+			     fpath, strerror(errno));
+			return -1;
+		}
+		break;
+	case FTW_DP:
+		if (rmdir(fpath)) {
+			errf("Error removing directory %s: %s\n",
+			     fpath, strerror(errno));
+			return -1;
+		}
+		break;
+	default:
+		errf("Cannot remove %s (unsupported file type)\n", fpath);
+		return -1;
+	}
+
+	return 0;
+}
+
+static bool clear_test_result_directory(const char *name)
+{
+	char *attdirname;
+	int i, resdirfd;
+	int ret;
+
+	if ((resdirfd = open(name, O_DIRECTORY | O_RDONLY)) < 0)
+		return false;
 
 	for (i = 0; i < _F_LAST; i++) {
-		if (remove_file(dirfd, filenames[i])) {
+		if (remove_file(resdirfd, filenames[i])) {
 			errf("Error deleting %s from test result directory: %m\n",
 			     filenames[i]);
+			close(resdirfd);
 			return false;
 		}
 	}
 
-	return true;
+	close(resdirfd);
+
+	if (strlen(name) + strlen(DIR_ATTACHMENTS) + 1 >= PATH_MAX) {
+		errf("Attachments directory length exceeds PATH_MAX\n");
+		return false;
+	}
+
+	asprintf(&attdirname, "%s/%s", name, DIR_ATTACHMENTS);
+	ret = nftw(attdirname, ftw_attachment_removal, 4, FTW_PHYS | FTW_DEPTH);
+	free(attdirname);
+
+	return ret ? false : true;
 }
 
 static bool clear_old_results(char *path)
@@ -1991,19 +2045,17 @@ static bool clear_old_results(char *path)
 	}
 
 	for (i = 0; true; i++) {
-		int resdirfd;
+		struct stat st;
 
-		snprintf(name, sizeof(name), "%zd", i);
-		if ((resdirfd = openat(dirfd, name, O_DIRECTORY | O_RDONLY)) < 0)
+		snprintf(name, sizeof(name), "%s/%zd", path, i);
+		if (stat(name, &st))
 			break;
 
-		if (!clear_test_result_directory(resdirfd)) {
-			close(resdirfd);
+		if (!clear_test_result_directory(name)) {
 			close(dirfd);
 			return false;
 		}
-		close(resdirfd);
-		if (unlinkat(dirfd, name, AT_REMOVEDIR)) {
+		if (rmdir(name)) {
 			errf("Warning: Result directory %s contains extra files\n",
 			     name);
 		}
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

