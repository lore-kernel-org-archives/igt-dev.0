Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252B76F612
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 18:16:12 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Wed, 29 Jan 2020 20:15:53 +0200
Message-Id: <20200129181601.15918-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/9] lib/ioctl_wrappers: Query if device
 supports set/get legacy tiling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>

Add a method to query if the device supports setting and getting legacy
tiling formats for buffer objects.

Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 lib/ioctl_wrappers.c | 17 +++++++++++++++++
 lib/ioctl_wrappers.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 627717d2..c1abb575 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -133,6 +133,23 @@ __gem_get_tiling(int fd, struct drm_i915_gem_get_tiling *arg)
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
index 7614e688..0ea77738 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -146,6 +146,7 @@ void gem_require_caching(int fd);
 void gem_require_ring(int fd, unsigned ring);
 bool gem_has_mocs_registers(int fd);
 void gem_require_mocs_registers(int fd);
+bool gem_has_legacy_hw_tiling(int fd);
 
 #define gem_has_ring(f, r) gem_context_has_engine(f, 0, r)
 
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
