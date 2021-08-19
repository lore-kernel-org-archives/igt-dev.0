Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FFD6E840
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Aug 2021 12:00:14 +0000 (UTC)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 19 Aug 2021 13:59:40 +0200
Message-Id: <20210819115942.23920-2-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210819115942.23920-1-thomas.hellstrom@linux.intel.com>
References: <20210819115942.23920-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/ioctl_wrappers: Query if device
 supports set/get legacy tiling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: apoorva1.singh@intel.com, zbigniew.kempczynski@intel.com, Vanshidhar Konda <vanshidhar.r.konda@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>

Add a method to query if the device supports setting and getting legacy
tiling formats for buffer objects.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
---
 lib/ioctl_wrappers.c | 17 +++++++++++++++++
 lib/ioctl_wrappers.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 09eb3ce7..3f412f7a 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -136,6 +136,23 @@ __gem_get_tiling(int fd, struct drm_i915_gem_get_tiling *arg)
 	return err;
 }
 
+/**
+ * gem_has_legacy_hw_tiling:
+ * @fd: open i915 drm file descriptor
+ *
+ * Feature check to query if the device supports setting/getting
+ * legacy tiling formats for buffer objects
+ *
+ * Returns: True if tiling is supported
+ */
+bool
+gem_has_legacy_hw_tiling(int fd)
+{
+	struct drm_i915_gem_get_tiling arg = {};
+
+	return (__gem_get_tiling(fd, &arg) != -EOPNOTSUPP);
+}
+
 /**
  * gem_get_tiling:
  * @fd: open i915 drm file descriptor
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index 9a897fec..d248c568 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -118,6 +118,7 @@ void gem_require_caching(int fd);
 void gem_require_ring(int fd, unsigned ring);
 bool gem_has_mocs_registers(int fd);
 void gem_require_mocs_registers(int fd);
+bool gem_has_legacy_hw_tiling(int fd);
 
 #define gem_has_ring(f, r) gem_context_has_engine(f, 0, r)
 
-- 
2.31.1
