Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E3A6E0AA
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Oct 2021 06:54:51 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  8 Oct 2021 08:54:27 +0200
Message-Id: <20211008065432.15482-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211008065432.15482-1-zbigniew.kempczynski@intel.com>
References: <20211008065432.15482-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/7] lib/intel_batchbuffer: Detect and use
 kernel alignment capability
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
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

For gens where relocations are supported kernel can set object offset
everywhere it wants but it honours the alignment setting.

For gens where we got no relocations and setting alignment is not
allowed in exec object we want to ensure allocator will still use it
to properly align the offset.

Detect kernel caps in alignment setting and use it for reloc/no-reloc
paths accordingly.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/intel_batchbuffer.c | 9 +++++++--
 lib/intel_batchbuffer.h | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 9c26fe207..ed7c25015 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1335,6 +1335,7 @@ __intel_bb_create(int i915, uint32_t ctx, uint32_t size, bool do_relocs,
 
 	igt_assert(ibb);
 
+	ibb->allows_passing_alignment = gem_allows_passing_alignment(i915);
 	ibb->uses_full_ppgtt = gem_uses_full_ppgtt(i915);
 	ibb->devid = intel_get_drm_devid(i915);
 	ibb->gen = intel_gen(ibb->devid);
@@ -1783,6 +1784,7 @@ __add_to_cache(struct intel_bb *ibb, uint32_t handle)
 	igt_assert(object);
 
 	object->handle = handle;
+	object->alignment = 0;
 	found = tsearch((void *) object, &ibb->root, __compare_objects);
 
 	if (*found == object) {
@@ -1905,7 +1907,7 @@ intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
 		   || ALIGN(offset, alignment) == offset);
 
 	object = __add_to_cache(ibb, handle);
-	object->alignment = alignment ?: 4096;
+	alignment = alignment ?: 4096;
 	__add_to_objects(ibb, object);
 
 	/*
@@ -1917,7 +1919,7 @@ intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
 	if (INVALID_ADDR(object->offset)) {
 		if (INVALID_ADDR(offset)) {
 			offset = __intel_bb_get_offset(ibb, handle, size,
-						       object->alignment);
+						       alignment);
 		} else {
 			offset = offset & (ibb->gtt_size - 1);
 
@@ -1962,6 +1964,9 @@ intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
 	if (ibb->uses_full_ppgtt && !ibb->enforce_relocs)
 		object->flags |= EXEC_OBJECT_PINNED;
 
+	if (ibb->allows_passing_alignment)
+		object->alignment = alignment;
+
 	return object;
 }
 
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 58bddb1a1..728985274 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -476,6 +476,7 @@ struct intel_bb {
 	uint64_t gtt_size;
 	bool supports_48b_address;
 	bool uses_full_ppgtt;
+	bool allows_passing_alignment;
 
 	struct igt_pxp pxp;
 	uint32_t ctx;
-- 
2.26.0
