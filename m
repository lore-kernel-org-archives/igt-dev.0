Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17D9F54AAE
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 13:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976A510E5D4;
	Tue, 24 Mar 2026 13:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nF5g6TGg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F38010E5D4
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 13:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774357975; x=1805893975;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3ku+/XDdaq/R3pERh2+6DYSXc0cl6zMFgJRBMsl+SRc=;
 b=nF5g6TGg1r3QX2ip7lNV7D2AnALgZYD2fNJmTjTXh1Gj5FhotO/G0I69
 LCLYTQ0dmue16k/LX08nOsNSGTe/icsR7wk7rNMFgXdVhlAZ5fYOPLvbr
 ZuwtPDw68Pe4awWDV3NZXKNRTBxvcSs/N6qB5/1Yy5+LdTOa9ekOuNCYe
 o+enGU4lmUKhL7w5OfU0/u9XDtDbpznNBcSDp4myq3JJS+I0RTUTGNY1P
 9BmnGKk+j4GyUJVp0ch0VD6aNPsBczQjHR871lq3PQh8a1EbMMe40TBjK
 uSl7q9aXwBkVUD9w+bYCgafPGeGlleCbGCB/B6koXWiErVDhEMtqzDcLD w==;
X-CSE-ConnectionGUID: h38UyYg8QXiyzUfVC/dc7A==
X-CSE-MsgGUID: pPc3p8cTRMqKdCOk/8bAnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="74394677"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="74394677"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 06:12:53 -0700
X-CSE-ConnectionGUID: ZYlaXapPSmSrV6iod60awg==
X-CSE-MsgGUID: e0MYFgmXSZWekIVtXWcapQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="223563554"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.143])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 06:12:51 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v2 2/6] runner: Create attachments directory to use by
 hooks
Date: Tue, 24 Mar 2026 14:12:38 +0100
Message-ID: <20260324131235.712916-10-zbigniew.kempczynski@intel.com>
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
---
 lib/igt_hook.c    |  4 ++++
 runner/executor.c | 44 +++++++++++++++++++++++++++++++++++++++++---
 runner/executor.h |  2 ++
 3 files changed, 47 insertions(+), 3 deletions(-)

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
index 1485b59d1f..bc421f7dbb 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1779,17 +1779,22 @@ static int execute_next_entry(struct execute_state *state,
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
@@ -1870,6 +1875,7 @@ static int execute_next_entry(struct execute_state *state,
 			setenv("IGT_RUNNER_SOCKET_FD", envstring, 1);
 		}
 		setenv("IGT_SENTINEL_ON_STDERR", "1", 1);
+		setenv("IGT_RUNNER_ATTACHMENTS_DIR", attdirname, 1);
 
 		execute_test_process(outfd, errfd, socketfd, settings, entry);
 		/* unreachable */
@@ -1950,7 +1956,10 @@ static int remove_file(int dirfd, const char *name)
 
 static bool clear_test_result_directory(int dirfd)
 {
-	int i;
+	DIR *dir;
+	struct dirent *entry;
+	int i, adirfd;
+	int ret = false;
 
 	for (i = 0; i < _F_LAST; i++) {
 		if (remove_file(dirfd, filenames[i])) {
@@ -1960,7 +1969,33 @@ static bool clear_test_result_directory(int dirfd)
 		}
 	}
 
-	return true;
+	if ((adirfd = openat(dirfd, DIR_ATTACHMENTS, O_DIRECTORY | O_RDONLY | O_CLOEXEC)) < 0) {
+		errf("Cannot open attachments directory\n");
+		return false;
+	}
+
+	if ((dir = fdopendir(adirfd)) == NULL) {
+		errf("Cannot fdopen attachments directory\n");
+		goto out1;
+	}
+
+	while ((entry = readdir(dir)) != NULL) {
+		if (!strcmp(entry->d_name, ".") || !strcmp(entry->d_name, ".."))
+			continue;
+
+		if (unlinkat(adirfd, entry->d_name, 0))  {
+			errf("Error removing %s\n", entry->d_name);
+			goto out2;
+		}
+	}
+
+	ret = true;
+out2:
+	closedir(dir);
+out1:
+	close(adirfd);
+
+	return ret;
 }
 
 static bool clear_old_results(char *path)
@@ -2002,6 +2037,9 @@ static bool clear_old_results(char *path)
 			close(dirfd);
 			return false;
 		}
+		if (unlinkat(resdirfd, DIR_ATTACHMENTS, AT_REMOVEDIR))
+			errf("Warning: Cannot remove attachments directory\n");
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

