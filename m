Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF09C98315
	for <igt-dev@archiver.kernel.org>; Sun, 18 Jan 2026 20:00:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E23F10E160;
	Sun, 18 Jan 2026 20:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VLNfqPV9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B618610E160
 for <igt-dev@lists.freedesktop.org>; Sun, 18 Jan 2026 20:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768766457; x=1800302457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bcApUGDeNaOHPh1nVkhMpqPz9lqrZlTCRUSUCaxkHRs=;
 b=VLNfqPV9esmX0Y2iq2x/Mq4FqN9vBOAwiyUz572w1LSpK4TkZYjOYozb
 SrAH6mT9t0v1h4VhMzxOe1NC61XA4DF09t6N+b8zax6XaJxAjzkEuedTI
 KUJ0XkeWJqMkxQSbf2+scUOMfFgOQLZ47JkK2SdYYyYmT2BVN62qegI19
 b2Iw0y9umjWLkUAMwMGSM1vnvevXg5UjrmAbV3YgZpH1XSpJRAoq40YRR
 o7J30pwdp5R/g/yk3RgTMkI9KfVKI9ATOKy1y7qAOmUJLQyhDZQVGtTQa
 TgOJ4ZkN9tCibKFlMlpg+5rNQr5uHxo+oAei/mDT3jP8hjs/NTi22DQEZ Q==;
X-CSE-ConnectionGUID: osOIX7LERmyKYDqmCNv87w==
X-CSE-MsgGUID: nxWGFLbVSnqeoIa3V8Ku0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87403809"
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; d="scan'208";a="87403809"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 12:00:56 -0800
X-CSE-ConnectionGUID: 2TRo4+0RTNeytGmM4eqW/w==
X-CSE-MsgGUID: vfmMU9oESJCWsebJ3+ErDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; d="scan'208";a="243255284"
Received: from cdfennel-mobl2.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.32.238])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 12:00:55 -0800
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH v2 i-g-t 1/2] lib/igt_fs: add igt_fs_check_root_perm() helper
Date: Sun, 18 Jan 2026 21:00:09 +0100
Message-ID: <20260118200010.18669-1-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909130808.54117-1-peter.senna@linux.intel.com>
References: <20250909130808.54117-1-peter.senna@linux.intel.com>
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

Add igt_fs_check_root_perm() to check that a file is owned by root
(uid=0, gid=0) and that only the owner has write permissions.

This will be used for validating the permissions and ownership of files
where strict root-only write access is required. Example usage:

 int result = igt_fs_check_root_perm(dirfd, pathname);
 if (result == -ENOENT) {
 	igt_skip("File does not exist\n");
 } else if (result < 0) {
 	igt_skip("Cannot stat file: %s\n", strerror(-result));
 } else {
 	igt_assert_f(result == 0, "Permission check failed\n");
 }

Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---

Changes from v1:
 - changed return type from bool to int
 - Use errno code including for file not found

 lib/igt_fs.c | 32 ++++++++++++++++++++++++++++++++
 lib/igt_fs.h |  1 +
 2 files changed, 33 insertions(+)

diff --git a/lib/igt_fs.c b/lib/igt_fs.c
index 8f4d17546..660def4cd 100644
--- a/lib/igt_fs.c
+++ b/lib/igt_fs.c
@@ -25,6 +25,7 @@
 #include <fcntl.h>
 #include <stdlib.h>
 #include <sys/stat.h>
+#include <stdbool.h>
 #include <unistd.h>
 
 #include "igt_fs.h"
@@ -141,3 +142,34 @@ int igt_fs_remove_dir(int fd, const char *name)
 
 	return 0;
 }
+
+/**
+ * igt_fs_check_root_perm: Checks if the user and group are root and that
+ *                         only the user can write to the file.
+ * @dirfd: file descriptor of the directory containing the file
+ * @pathname:  name of the file to check
+ *
+ * Returns:
+ *  0 if the file is owned by root and only root can write to it (success),
+ *  1 if the file exists but fails permission checks (failure),
+ * -ENOENT if the file does not exist,
+ * -errno for other stat failures
+ */
+int igt_fs_check_root_perm(int dirfd, const char *pathname)
+{
+	struct stat st;
+
+	if (fstatat(dirfd, pathname, &st, 0))
+		return -errno;
+
+	if (st.st_uid != 0 || st.st_gid != 0)
+		return 1;
+
+	if (st.st_mode & S_IWGRP)
+		return 1;
+
+	if (st.st_mode & S_IWOTH)
+		return 1;
+
+	return 0;
+}
diff --git a/lib/igt_fs.h b/lib/igt_fs.h
index ee3e7593b..3a3f81d80 100644
--- a/lib/igt_fs.h
+++ b/lib/igt_fs.h
@@ -31,5 +31,6 @@ int igt_fs_create_dir(int fd, const char *name, mode_t mode);
 int igt_fs_remove_dir(int fd, const char *name);
 ssize_t igt_readn(int fd, char *buf, size_t len);
 ssize_t igt_writen(int fd, const char *buf, size_t len);
+int igt_fs_check_root_perm(int dirfd, const char *pathname);
 
 #endif /* __IGT_FS_H__ */
-- 
2.43.0

