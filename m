Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D12F99362
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 10:56:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E8310F093;
	Thu, 23 Apr 2026 10:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dfr0xdhT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7C710F093
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 10:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776941727; x=1808477727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uTfYzxug4n2sdQnrgxzJxMnYAaO0NRq+o8vnrwrye3w=;
 b=Dfr0xdhTjkeG/YRQ8u+t/f+KCHamTIEUYp04KT+h3PsE557TLdlobISl
 LTGXc6qU8gLXZCyEBbCyfqsEwDcRsa2XdgZqyPv/PRm71zwjeINaXZggD
 Ip0AS3kcYSNZ86mPpEsVvgkj6kHqUvJTYs3HluQtMeNQt48ac3heQjS7J
 pNgXTQaY6Un+IMTebDwsQl6n1d5aHkXV1Lbiv58Q8bootmcrpFWb+M9VI
 ACRFY9QmDuuLfiOb1R4i7x3svKhnipv0PkMsrUtNjl6qAoWNu555fTK9r
 3op8PIhIMyF09h1o667mxB64dSSyC4wtMWyxZU1J01qCiZRVkuzbwzIwQ w==;
X-CSE-ConnectionGUID: sUEMgWa/RuK7zLHE05/5vQ==
X-CSE-MsgGUID: rkEUup+cSQSxZoukfSlgTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77889799"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="77889799"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:55:27 -0700
X-CSE-ConnectionGUID: aiflYY3VRV+tBq+gqYSyFw==
X-CSE-MsgGUID: OXjjFhDLRSKmAksXeuW7zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="256106245"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.133])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:55:26 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v2 2/4] runner: Create attachments directory to use by
 hooks
Date: Thu, 23 Apr 2026 12:55:17 +0200
Message-ID: <20260423105514.175870-8-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423105514.175870-6-zbigniew.kempczynski@intel.com>
References: <20260423105514.175870-6-zbigniew.kempczynski@intel.com>
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

