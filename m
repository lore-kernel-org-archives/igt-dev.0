Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00FBF531CB
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 20:17:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801A710E52D;
	Mon, 13 Apr 2026 20:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OK1coiHn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A68F10E52D
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 20:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776111465; x=1807647465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B7M6i1Ll7iG8TWrs2zADlLOj/HU994d6kYB1XvnXzno=;
 b=OK1coiHn+XYTDR3pyZt/7hxufZei7nvAke65CSKnuyk+sxkz7HIlYXm/
 /af/W+p7OSAYDDML+AeYtvGft7/eQl8ja5P2ydRU+IKgSs6ZLYnh1hIMT
 zUIETb6poIYl1Lp9FMDR41I5bZvuWtB6lfAZQ9YEkKvt+4d/ewNp8dReZ
 cMY+0TxtEFgaQHxBJ/xIVaxMpnjOvZlV7vWsyXJ2W+LU9Z1H6E7hIeIqQ
 QxcUkGUf/cpsFEGcp1oYr9Q8rOaWkqsPc7h00JBuBWAlpFp8IgdSBFSSG
 hG6nfmC1bXj5woizG6RM8S22U8R/B2+/y+oMymTjqByCqBt5tHtIQb86y w==;
X-CSE-ConnectionGUID: VPk6gmVeSOiAra2gY7hrpA==
X-CSE-MsgGUID: arx3g8utStqKIurEh9oKcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80918919"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="80918919"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 13:17:45 -0700
X-CSE-ConnectionGUID: sQye8fpyQFSkHxlFO638OA==
X-CSE-MsgGUID: LtzbRelgRSiiK/ZaGk/X/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="229816443"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.10])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 13:17:44 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v3 2/5] runner: Create attachments directory to use by
 hooks
Date: Mon, 13 Apr 2026 22:17:25 +0200
Message-ID: <20260413201722.808673-9-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
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
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
---
v2: simplify attachment dirname concatenation (Kamil)
    remove files in attachments dir when overwrite is set (Kamil)
v3: unify 'attdir*' variables (Krzysztof)
    do recursive removal in attachments directories (Gustavo)
---
 lib/igt_hook.c    |  4 +++
 runner/executor.c | 75 +++++++++++++++++++++++++++++++++++++++++++++--
 runner/executor.h |  2 ++
 3 files changed, 78 insertions(+), 3 deletions(-)

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
index 1485b59d1f..af39b12aea 100644
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
@@ -1948,9 +1955,61 @@ static int remove_file(int dirfd, const char *name)
 	return unlinkat(dirfd, name, 0) && errno != ENOENT;
 }
 
+static int ftw_attachment_removal(const char *fpath, const struct stat *sb,
+				  int typeflag, struct FTW *ftwbuf)
+{
+	(void)sb;
+	(void)ftwbuf;
+
+	if (typeflag == FTW_F) {
+		if (unlink(fpath)) {
+			errf("Cannot remove file %s\n", fpath);
+			return -1;
+		}
+	} else if (typeflag == FTW_DP) {
+		if (rmdir(fpath)) {
+			errf("Cannot remove directory %s\n", fpath);
+			return -1;
+		}
+	} else {
+		errf("Cannot remove %s (unsupported file type)\n", fpath);
+		return -1;
+	}
+
+	return 0;
+}
+
+static bool clear_attachments_dir_recursively(int attdirfd)
+{
+	char attdirname[PATH_MAX];
+	DIR *currdir;
+	int ret;
+
+	currdir = opendir(".");
+	fchdir(attdirfd);
+	getcwd(attdirname, sizeof(attdirname));
+
+	/* Sanity check we're in attachments directory structure */
+	if (!strstr(attdirname, DIR_ATTACHMENTS)) {
+		errf("Cowardly refusing removing in directory which is not "
+		     "attachments directory [currdir: %s]!\n", attdirname);
+		ret = -1;
+		goto out;
+	}
+
+	ret = nftw(attdirname, ftw_attachment_removal, 4, FTW_PHYS | FTW_DEPTH);
+
+out:
+	fchdir(dirfd(currdir));
+	closedir(currdir);
+
+	return ret ? false : true;
+}
+
 static bool clear_test_result_directory(int dirfd)
 {
-	int i;
+	int i, attdirfd;
+	int ret = true;
 
 	for (i = 0; i < _F_LAST; i++) {
 		if (remove_file(dirfd, filenames[i])) {
@@ -1960,7 +2019,16 @@ static bool clear_test_result_directory(int dirfd)
 		}
 	}
 
-	return true;
+	if ((attdirfd = openat(dirfd, DIR_ATTACHMENTS, O_DIRECTORY | O_RDONLY | O_CLOEXEC)) < 0) {
+		errf("Cannot open attachments directory\n");
+		return false;
+	}
+
+	ret = clear_attachments_dir_recursively(attdirfd);
+	if (!ret)
+		errf("Cannot clear attachments dir recursively\n");
+
+	return ret;
 }
 
 static bool clear_old_results(char *path)
@@ -2002,6 +2070,7 @@ static bool clear_old_results(char *path)
 			close(dirfd);
 			return false;
 		}
+
 		close(resdirfd);
 		if (unlinkat(dirfd, name, AT_REMOVEDIR)) {
 			errf("Warning: Result directory %s contains extra files\n",
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

