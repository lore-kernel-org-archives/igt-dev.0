Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F125CAC587
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 13:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E273210E70A;
	Tue,  9 Sep 2025 13:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BDNgp1OF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE0810E709
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 13:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757423360; x=1788959360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A06ZFnm2v9xTk5Ctg7w6Kvf97quGAKgjiBz+hRuu7E0=;
 b=BDNgp1OFNnkViBydCKyDAXhNS208VycZvhSgFK+nx/GjjrJ85fI47D5J
 LR1DQQAJcyK1XujgzS7dTztlxlbw5WQnukoHE2BwaZX8IbTdzQNJbKbC6
 Xnyw8qsFcYkv0L6rEhk4LPM8PeWjWQpyux1aCLk4X3kNDQ9moQsMLyQfG
 RToi1kfrfdNCVAXjrMYIBHgGW9AnYgilO0HXCdu5lr6Rf8ikH6TSP2YOa
 ckelj36UA6CxX0vdaFS/lWOd9npm7bjGcgOTbNGQXK4OTMtzHmvQIf6xG
 j7+/M5mz85BcMcLe79vG4uXbu4MorE0sOuzc7a8R2u0FlKu5mDhL9CNum A==;
X-CSE-ConnectionGUID: VVKPKlX2TgykH6GajkEELw==
X-CSE-MsgGUID: 5GAjhmjvT6iLCXIFYvWZYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59644845"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="59644845"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:08:25 -0700
X-CSE-ConnectionGUID: ELlAQf1+TGCYLPF3D/K27g==
X-CSE-MsgGUID: c9GGf/lBQYy4yWlyjPIKXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172998495"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:08:23 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_fs: add igt_fs_check_root_perm() helper
Date: Tue,  9 Sep 2025 15:08:07 +0200
Message-ID: <20250909130808.54117-2-peter.senna@linux.intel.com>
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
where strict root-only write access is required.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Cc: Kamil Konieczny  <kamil.konieczny@linux.intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 lib/igt_fs.c | 28 ++++++++++++++++++++++++++++
 lib/igt_fs.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/lib/igt_fs.c b/lib/igt_fs.c
index 8f4d17546..0e408c89b 100644
--- a/lib/igt_fs.c
+++ b/lib/igt_fs.c
@@ -25,6 +25,7 @@
 #include <fcntl.h>
 #include <stdlib.h>
 #include <sys/stat.h>
+#include <stdbool.h>
 #include <unistd.h>
 
 #include "igt_fs.h"
@@ -141,3 +142,30 @@ int igt_fs_remove_dir(int fd, const char *name)
 
 	return 0;
 }
+
+/**
+ * igt_fs_check_root_perm: Checks if the user and group are root and that
+ *                         only the user can write to the file.
+ * @dirfd: file descriptor of the directory containing the file
+ * @pathname: name of the file to check
+ *
+ * Returns: true if the file is owned by root and only root can write to it.
+ */
+bool igt_fs_check_root_perm(int dirfd, const char *pathname)
+{
+	struct stat st;
+
+	if (fstatat(dirfd, pathname, &st, 0))
+		return false;
+
+	if (st.st_uid != 0 || st.st_gid != 0)
+		return false;
+
+	if (st.st_mode & S_IWGRP)
+		return false;
+
+	if (st.st_mode & S_IWOTH)
+		return false;
+
+	return true;
+}
diff --git a/lib/igt_fs.h b/lib/igt_fs.h
index ee3e7593b..ee547c133 100644
--- a/lib/igt_fs.h
+++ b/lib/igt_fs.h
@@ -31,5 +31,6 @@ int igt_fs_create_dir(int fd, const char *name, mode_t mode);
 int igt_fs_remove_dir(int fd, const char *name);
 ssize_t igt_readn(int fd, char *buf, size_t len);
 ssize_t igt_writen(int fd, const char *buf, size_t len);
+bool igt_fs_check_root_perm(int dirfd, const char *pathname);
 
 #endif /* __IGT_FS_H__ */
-- 
2.43.0

