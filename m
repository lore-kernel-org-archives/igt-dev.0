Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92F3CCA470
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 15:09:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70436899D4;
	Wed,  8 Oct 2025 15:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="amal6/mk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE40899D4
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 15:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759936186; x=1791472186;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xO5fWNYb+2s9++KwikfjndUCyyuuwe/A5kg/yxIA+tY=;
 b=amal6/mk0OfckUPiURKf5zOE5C9ItopL5JdFs4bWHsUVUreA+cHZ86GF
 vVRXNsOG2SdM1RZg7f4nPV7xFo9zkzpORBd8V2kq2Wmloh8+WdvDJgAub
 ETauNx+2dXH0vt4iqkfb4euRNdX2QaosAiFY5BkVxJ3FDuBSCB3FiqWTF
 9HQue/0DZ59o/rNSRz7Es5BMiZE7w7EoEYULW6841X4rhIiPtbwp5+cvn
 fE8N3ZSn2LunZff3vMMrbCQX2oQk+/kWvcyOqh4Z9IjtiFcZZqRWNPHng
 ctgvTNNxe59iZtZUORV2vqy1l/yKS1SHnnXLvfQGLFK0zOIQ2PpdwBi5h g==;
X-CSE-ConnectionGUID: fn1QWn8oSSmlDvARvagpsQ==
X-CSE-MsgGUID: PrAig+pRR8Gm6t0V5QO0JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="73477869"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="73477869"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 08:09:46 -0700
X-CSE-ConnectionGUID: 4dKueP+oTl2VEs150Wewcw==
X-CSE-MsgGUID: /R8bkhhdSeSfSuNJdaXHXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="180284090"
Received: from unknown (HELO localhost) ([172.28.180.171])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 08:09:44 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>
Subject: [PATCH i-g-t] lib/xe/xe_sriov_debugfs: Adapt SR-IOV debugfs helpers
 to new layout
Date: Wed,  8 Oct 2025 17:09:39 +0200
Message-Id: <20251008150939.670778-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Update SR-IOV debugfs helpers to support the new layout while preserving
backward compatibility with the legacy paths.

The attribute path resolver:
 - Tries the new tree first:
     sriov/{pf|vfN}/tileT[/gtG]/<attr>
 - Falls back to legacy:
     gtG/{pf|vfN}/<attr>
 - Maps vram_* -> lmem_* only for legacy paths

Link: https://lore.kernel.org/intel-xe/20250928140029.198847-1-michal.wajdeczko@intel.com/

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 lib/xe/xe_sriov_debugfs.c | 178 ++++++++++++++++++++++++++------------
 1 file changed, 124 insertions(+), 54 deletions(-)

diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
index e12e12c8c..4ede9788e 100644
--- a/lib/xe/xe_sriov_debugfs.c
+++ b/lib/xe/xe_sriov_debugfs.c
@@ -17,25 +17,98 @@
 
 #define SRIOV_DEBUGFS_PATH_MAX 96
 
-static char *xe_sriov_pf_debugfs_path(int pf, unsigned int vf_num, unsigned int gt_num, char *path,
-				      int pathlen)
+enum attr_scope {
+	SCOPE_TILE,
+	SCOPE_GT,
+};
+
+static enum attr_scope attr_scope(const char *attr)
+{
+	if (!strncmp(attr, "ggtt_", 5) || !strncmp(attr, "vram_", 5))
+		return SCOPE_TILE;
+
+	return SCOPE_GT;
+}
+
+static int access_attr_path(int dirfd, const char *attr, unsigned int vf_num,
+			    unsigned int tile, unsigned int gt_num,
+			    char *attr_path, size_t path_size)
+{
+	const bool is_vf = vf_num > 0;
+	int n;
+
+	switch (attr_scope(attr)) {
+	case SCOPE_TILE:
+		n = is_vf ? snprintf(attr_path, path_size, "sriov/vf%u/tile%u/%s", vf_num,
+				     tile, attr) :
+			    snprintf(attr_path, path_size, "sriov/pf/tile%u/%s", tile, attr);
+		break;
+	case SCOPE_GT:
+		n = is_vf ? snprintf(attr_path, path_size, "sriov/vf%u/tile%u/gt%u/%s",
+				     vf_num, tile, gt_num, attr) :
+			    snprintf(attr_path, path_size, "sriov/pf/tile%u/gt%u/%s", tile,
+				     gt_num, attr);
+		break;
+	};
+
+	igt_assert(n >= 0 && (size_t)n < path_size);
+
+	return igt_sysfs_has_attr(dirfd, attr_path) ? 0 : -ENOENT;
+}
+
+static int access_legacy_attr_path(int dirfd, const char *attr, unsigned int vf_num,
+				   unsigned int gt_num, char *attr_path,
+				   size_t path_size)
+{
+	const bool is_vf = vf_num > 0;
+	char legacy[64];
+	const char *name = attr;
+	int n;
+
+	/* Map vram_* to lmem_* only for legacy layout */
+	if (!strncmp(attr, "vram_", 5)) {
+		n = snprintf(legacy, sizeof(legacy), "lmem_%s", attr + 5);
+
+		igt_assert(n >= 0 || (size_t)n < sizeof(legacy));
+		name = legacy;
+	}
+
+	n = is_vf ? snprintf(attr_path, path_size, "gt%u/vf%u/%s", gt_num, vf_num, name) :
+		    snprintf(attr_path, path_size, "gt%u/pf/%s", gt_num, name);
+	igt_assert(n >= 0 && (size_t)n < path_size);
+
+	return igt_sysfs_has_attr(dirfd, attr_path) ? 0 : -ENOENT;
+}
+
+static int attr_path_resolve(int pf, unsigned int vf_num, unsigned int gt_num,
+			     const char *attr, int dirfd, char *attr_path,
+			     size_t path_size)
 {
-	char sriov_path[SRIOV_DEBUGFS_PATH_MAX];
+	struct xe_device *xe_dev = xe_device_get(pf);
+	int tile, ret = 0;
 
-	if (!igt_debugfs_path(pf, path, pathlen))
-		return NULL;
+	igt_assert(xe_dev && igt_sriov_is_pf(pf));
+	tile = xe_get_tile(xe_dev, gt_num);
+	if (igt_debug_on(tile < 0))
+		return -ENOENT;
 
-	if (vf_num)
-		snprintf(sriov_path, SRIOV_DEBUGFS_PATH_MAX, "/gt%u/vf%u/", gt_num, vf_num);
-	else
-		snprintf(sriov_path, SRIOV_DEBUGFS_PATH_MAX, "/gt%u/pf/", gt_num);
+	ret = access_attr_path(dirfd, attr, vf_num, tile, gt_num, attr_path, path_size);
+	if (ret) {
+		char first_path[SRIOV_DEBUGFS_PATH_MAX];
 
-	strncat(path, sriov_path, pathlen - strlen(path));
+		snprintf(first_path, sizeof(first_path), "%.*s",
+			 (int)((path_size < sizeof(first_path) - 1) ?
+				path_size : sizeof(first_path) - 1),
+			 attr_path);
 
-	if (access(path, F_OK))
-		return NULL;
+		ret = access_legacy_attr_path(dirfd, attr, vf_num, gt_num,
+					      attr_path, path_size);
 
-	return path;
+		igt_debug_on_f(ret, "Failed to access '%s'; tried %s, %s\n", attr,
+			       first_path, attr_path);
+	}
+
+	return ret;
 }
 
 /**
@@ -49,26 +122,29 @@ static char *xe_sriov_pf_debugfs_path(int pf, unsigned int vf_num, unsigned int
  * Opens SR-IOV debugfs attribute @attr for given PF device @pf, VF number @vf_num on GT @gt_num.
  *
  * Returns:
- * File descriptor or -1 on failure.
+ * File descriptor or negative error code on failure.
  */
 int xe_sriov_pf_debugfs_attr_open(int pf, unsigned int vf_num, unsigned int gt_num,
 				  const char *attr, int mode)
 {
-	char path[PATH_MAX];
-	int debugfs;
-
-	igt_assert(igt_sriov_is_pf(pf) && is_xe_device(pf));
-	igt_assert(gt_num < xe_number_gt(pf));
-
-	if (!xe_sriov_pf_debugfs_path(pf, vf_num, gt_num, path, sizeof(path)))
-		return -1;
+	char attr_path[SRIOV_DEBUGFS_PATH_MAX];
+	int dirfd, attr_fd, ret;
 
-	strncat(path, attr, sizeof(path) - strlen(path));
+	dirfd = igt_debugfs_dir(pf);
+	if (igt_debug_on(dirfd < 0))
+		return -ENOENT;
 
-	debugfs = open(path, mode);
-	igt_debug_on(debugfs < 0);
+	ret = attr_path_resolve(pf, vf_num, gt_num, attr, dirfd, attr_path, sizeof(attr_path));
+	if (ret) {
+		close(dirfd);
+		return ret;
+	}
 
-	return debugfs;
+	attr_fd = openat(dirfd, attr_path, mode);
+	igt_debug_on_f(attr_fd < 0, "Failed to open '%s' (%s)\n",
+		       attr, attr_path);
+	close(dirfd);
+	return attr_fd;
 }
 
 /**
@@ -91,7 +167,7 @@ const char *xe_sriov_debugfs_provisioned_attr_name(enum xe_sriov_shared_res res)
 	case XE_SRIOV_SHARED_RES_GGTT:
 		return "ggtt_provisioned";
 	case XE_SRIOV_SHARED_RES_LMEM:
-		return "lmem_provisioned";
+		return "vram_provisioned";
 	}
 
 	return NULL;
@@ -323,19 +399,6 @@ int xe_sriov_pf_debugfs_read_check_ranges(int pf_fd, enum xe_sriov_shared_res re
 	return ret;
 }
 
-static int xe_sriov_pf_debugfs_path_open(int pf, unsigned int vf_num,
-					 unsigned int gt_num)
-{
-	char path[PATH_MAX];
-
-	if (igt_debug_on_f(!xe_sriov_pf_debugfs_path(pf, vf_num, gt_num, path,
-						     sizeof(path)),
-			   "path: %s\n", path))
-		return -1;
-
-	return open(path, O_RDONLY);
-}
-
 /**
  * DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC - Define a function for accessing debugfs attributes
  * @type: Data type of the value to read or write (e.g., `uint32_t`, `bool`, etc.)
@@ -373,20 +436,27 @@ static int xe_sriov_pf_debugfs_path_open(int pf, unsigned int vf_num,
  * - `0` on success
  * - Negative error code on failure
  */
-#define DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(type, suffix, sysfs_func)		\
-	int __xe_sriov_pf_debugfs_##suffix(int pf, unsigned int vf_num,		\
-					   unsigned int gt_num,			\
-					   const char *attr, type value)	\
-	{									\
-		bool ret;							\
-		int dir = xe_sriov_pf_debugfs_path_open(pf, vf_num, gt_num);	\
-										\
-		if (igt_debug_on(dir < 0))					\
-			return dir;						\
-										\
-		ret = sysfs_func(dir, attr, value);				\
-		close(dir);							\
-		return ret ? 0 : -1;						\
+#define DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC(type, suffix, sysfs_func)\
+	int __xe_sriov_pf_debugfs_##suffix(int pf, unsigned int vf_num,				\
+					   unsigned int gt_num,					\
+					   const char *attr, type value)			\
+	{											\
+		char attr_path[SRIOV_DEBUGFS_PATH_MAX];						\
+		int err, dirfd = igt_debugfs_dir(pf);						\
+		bool ok;									\
+												\
+		if (igt_debug_on(dirfd < 0))							\
+			return dirfd;								\
+		err = attr_path_resolve(pf, vf_num, gt_num, attr,				\
+					dirfd, attr_path, sizeof(attr_path));			\
+		if (err) {									\
+			close(dirfd);								\
+			return err;								\
+		}										\
+												\
+		ok = sysfs_func(dirfd, attr_path, value);					\
+		close(dirfd);									\
+		return ok ? 0 : -1;								\
 	}
 
 /**
-- 
2.31.1

