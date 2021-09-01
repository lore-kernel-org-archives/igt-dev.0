Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA1D6E17F
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Sep 2021 10:41:33 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Wed,  1 Sep 2021 16:04:01 +0530
Message-Id: <20210901103402.1253909-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20210901103402.1253909-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
References: <20210901103402.1253909-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t,
 V4 1/2] lib/i915: Use FIXED mapping only for discrete memory
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
List-ID: <igt-dev@lists.freedesktop.org>

The FIXED mapping is only used for discrete, and mapping type
is pre-defined. This disables the other type of mmap
offsets when discrete memory is used.

Taken from kernel commit:
commit 7961c5b60f23 ("drm/i915: Add TTM offset argument to mmap.")

Changes since V3:
	- Split change in two commits - Matthew Auld
Changes since V2:
        - Add previous logic check for GTT offset type - Ashutosh Dixit
        - Added documentation for library API change - Daniel Vetter
Changes since V1:
        - Make logic more readable - Petri Latvala

Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 lib/i915/gem_mman.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
index 0406a0b9..aa9ac6f3 100644
--- a/lib/i915/gem_mman.c
+++ b/lib/i915/gem_mman.c
@@ -73,9 +73,27 @@ bool gem_has_legacy_mmap(int fd)
 	return errno != EOPNOTSUPP;
 }
 
+/**
+ * gem_has_mmap_offset_type:
+ * @fd: open i915 drm file descriptor
+ * @*t: pointer to mmap_offset
+ *
+ * This functions checks the mmap offset type is supported or not.
+ * For discrete memory only FIXED mmap_offset type is supported
+ * and for non-discrete memory all other offset type except FIXED
+ * are supported.
+ *
+ * Returns: True if supported or False if not.
+ */
 bool gem_has_mmap_offset_type(int fd, const struct mmap_offset *t)
 {
-	return gem_has_mmap_offset(fd) || t->type == I915_MMAP_OFFSET_GTT;
+	if (gem_has_mmap_offset(fd))
+		if (gem_has_lmem(fd))
+			return t->type == I915_MMAP_OFFSET_FIXED;
+		else
+			return t->type != I915_MMAP_OFFSET_FIXED;
+	else
+		return t->type == I915_MMAP_OFFSET_GTT;
 }
 
 /**
-- 
2.31.1
