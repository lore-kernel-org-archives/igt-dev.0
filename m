Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FE3C3ABCC
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 14:05:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF33B10E5AD;
	Tue, 13 May 2025 14:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kNUBWnmu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C0B10E5AD
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 14:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747145149; x=1778681149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EkWVv75QiHqBJ5nNaM6IOCmhB7Qf8G7kF+PqjhPLyGQ=;
 b=kNUBWnmu1cKtJRJK3a6MwEBZFaWMuj0pcDpxRVd3+tz3b9870HIAde2u
 UsbmNZ1eh4XiQp21XPPOVBtfIMNZmPfKRySB+P65leV79nFdMjhsYop99
 0QyDGTl8+JEd8tIiZvkFvUYo+32TwCi00gYFUkkV7U1szxBbPL6uPcSrZ
 5yPwhLh5VHtN9+c/wHlpYrAVSupAYzq+2/06zHLCzxQPaqmxzFbHb8xXr
 OtzzWzEz9Hy1IgT3MNtcqTAqmuccMHgbP/btK5ON6ZOtl5GI9BR7Pq9U9
 KW/lzPUs3MwoaxQQITaiaGUCRpsqSc6kdXf40Q30BVKohbVH9SbeHA1Zn w==;
X-CSE-ConnectionGUID: 6qdEXQWgTFaDPwDjJigxlA==
X-CSE-MsgGUID: Pp/v+8YLQ5i9HwNq2qxu+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48245794"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="48245794"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 07:05:49 -0700
X-CSE-ConnectionGUID: gDLWrbJQSWKy8MbQFkJ+cQ==
X-CSE-MsgGUID: rS7xi5nLQ2i1M7cqBBPvlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="137583858"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.239.27])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 07:05:46 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 kamil.konieczny@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 4/5] lib/igt_fs: Add helper functions to create and
 remove directories
Date: Tue, 13 May 2025 19:58:24 +0530
Message-ID: <20250513142827.1129334-5-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250513142827.1129334-1-riana.tauro@intel.com>
References: <20250513142827.1129334-1-riana.tauro@intel.com>
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

Add helper function to create directory and return fd of
the created directory. Also add a function to remove
directories. This will be used by configfs

v2: reorder headers (Kamil)

Cc: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Reviewed-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_fs.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++-
 lib/igt_fs.h |  2 ++
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/lib/igt_fs.c b/lib/igt_fs.c
index 917ee80de..8f4d17546 100644
--- a/lib/igt_fs.c
+++ b/lib/igt_fs.c
@@ -21,9 +21,10 @@
  * IN THE SOFTWARE.
  *
  */
-
 #include <errno.h>
+#include <fcntl.h>
 #include <stdlib.h>
+#include <sys/stat.h>
 #include <unistd.h>
 
 #include "igt_fs.h"
@@ -94,3 +95,49 @@ ssize_t igt_writen(int fd, const char *buf, size_t len)
 	} while (total != len);
 	return total ?: ret;
 }
+
+/**
+ * igt_fs_create_dir: creates and opens directory
+ * @fd: file descriptor of parent directory
+ * @name: name of the directory to create
+ * @mode: permissions for the directory
+ *
+ * creates a directory under parent directory and returns
+ * the fd
+ *
+ * Returns: directory fd on success, -errno otherwise
+ */
+int igt_fs_create_dir(int fd, const char *name, mode_t mode)
+{
+	int ret;
+	int dirfd;
+
+	ret = mkdirat(fd, name, mode);
+	if (ret)
+		return -errno;
+
+	dirfd = openat(fd, name, O_DIRECTORY);
+	if (dirfd < 0)
+		return -errno;
+
+	return dirfd;
+}
+
+/**
+ * igt_fs_remove_directory: removes directory
+ * @fd: fd of parent directory
+ * @name: name of directory to remove
+ *
+ * removes directory under parent directory
+ *
+ * Returns: 0 on success, -errno otherwise
+ */
+int igt_fs_remove_dir(int fd, const char *name)
+{
+	int ret = unlinkat(fd, name, AT_REMOVEDIR);
+
+	if (ret)
+		return -errno;
+
+	return 0;
+}
diff --git a/lib/igt_fs.h b/lib/igt_fs.h
index 84c3fed62..ee3e7593b 100644
--- a/lib/igt_fs.h
+++ b/lib/igt_fs.h
@@ -27,6 +27,8 @@
 
 #include <stdio.h>
 
+int igt_fs_create_dir(int fd, const char *name, mode_t mode);
+int igt_fs_remove_dir(int fd, const char *name);
 ssize_t igt_readn(int fd, char *buf, size_t len);
 ssize_t igt_writen(int fd, const char *buf, size_t len);
 
-- 
2.47.1

