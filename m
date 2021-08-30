Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB2A89BF5
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Aug 2021 09:30:00 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Mon, 30 Aug 2021 14:52:14 +0530
Message-Id: <20210830092214.1204343-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t,
 V2] lib/i915: Use FIXED mapping only for discrete memory
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

Changes since V1:
	- Make logic more readable - Petri Latvala

Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 include/drm-uapi/i915_drm.h | 1 +
 lib/i915/gem_mman.c         | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index a1c0030c..b46367f2 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -871,6 +871,7 @@ struct drm_i915_gem_mmap_offset {
 #define I915_MMAP_OFFSET_WC  1
 #define I915_MMAP_OFFSET_WB  2
 #define I915_MMAP_OFFSET_UC  3
+#define I915_MMAP_OFFSET_FIXED 4
 
 	/*
 	 * Zero-terminated chain of extensions.
diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
index 0406a0b9..89bbbf7f 100644
--- a/lib/i915/gem_mman.c
+++ b/lib/i915/gem_mman.c
@@ -75,7 +75,13 @@ bool gem_has_legacy_mmap(int fd)
 
 bool gem_has_mmap_offset_type(int fd, const struct mmap_offset *t)
 {
-	return gem_has_mmap_offset(fd) || t->type == I915_MMAP_OFFSET_GTT;
+	if (gem_has_mmap_offset(fd))
+		if (gem_has_lmem(fd))
+			return t->type == I915_MMAP_OFFSET_FIXED;
+		else
+			return t->type != I915_MMAP_OFFSET_FIXED;
+	else
+		return false;
 }
 
 /**
-- 
2.31.1
