Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D9FC28B25
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 23:40:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A19910E86C;
	Wed,  5 Mar 2025 23:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JN9zhZOL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E7210E86C
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 23:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741218015; x=1772754015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wh+YEoZiPRI0FhhTGoOd+S322U6tO+Lz9hobpDtQpsY=;
 b=JN9zhZOLcQ42AkGXS7+S2MRoW5EHeQiYMdmsaDR/OdgJbifVIBTqjjIF
 ADMKDQGQcDHB5nyCiDLu+Q5GmtHRbXfygYQKOMfBKJlPY2i5gIHgxvqUa
 0P/fsutaJiBTnds5OuvySmldG0yvhaVkzJ8M/oWqjomO0zCBq+O1owClH
 ZlnvQYdU7ZdJiSj2kuaDRUbvz8qemEX2Z05cdFD6z33w9UJpJOJ1BKvb5
 CuHWGwIgwciio55NkJNC1psDE9rUQHJdvuyVDAKxOjdx3+5exn5YFvLG4
 XyDxNRQNp3CL0GM23JNuzOL1Dtq1Po6EkbsPNJjSlG7Em9N1YQp/N5C0I A==;
X-CSE-ConnectionGUID: pRHfUGR7SJOVh2ChUbjrAw==
X-CSE-MsgGUID: cac1nyRZQDCbdQHxP+yt3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41917113"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="41917113"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 15:40:15 -0800
X-CSE-ConnectionGUID: l1mDLs1jSCOw/Acl7snRIQ==
X-CSE-MsgGUID: BipClD3fRbS/cVCsa/Y/Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="118849534"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 15:40:15 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH i-g-t v5 4/6] tests/intel/xe_pxp: Test PXP submissions
Date: Wed,  5 Mar 2025 15:39:45 -0800
Message-ID: <20250305233951.3488609-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305233951.3488609-1-daniele.ceraolospurio@intel.com>
References: <20250305233951.3488609-1-daniele.ceraolospurio@intel.com>
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

The render supports PXP usage via rendercopy. We can use this to test
that a user is able to correctly encrypt their data. In particular, we
cover these 2 scenarios:

1) copy from clear to encrypted - we expect the dest buffer to not match
   the src one due to the encryption.

2) copy from encrypted to encrypted = we expect the 2 BOs to match since
   they hold the same data encrypted with the same key.

Note that the clear to clear copy is already covered by the
xe_render_copy test, while encrypted to clear is obviously not a
supported case.

Since the render_copy uses the intel_batchbuffer helpers, those helpers
have been updated to support vm bind of protected objects.

v2: move igt_require calls inside the subtest
v3: Better comments for rsvd1 overload, rename variables for clarity,
updated commit msg.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 lib/intel_batchbuffer.c |  37 ++++--
 tests/intel/xe_pxp.c    | 275 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 304 insertions(+), 8 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 72bbbf8c6..ee499ee7f 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1332,8 +1332,19 @@ void intel_bb_destroy(struct intel_bb *ibb)
 	free(ibb);
 }
 
+/*
+ * Since we re-use drm_i915_gem_exec_object2 to store details about the object
+ * for submission to Xe, we don't have dedicated fields for the info needed for
+ * binding the object, so we store it into rsvd1. The data is stores as follows:
+ *   Bits 63-12: Objects size in multiples of SZ_4K (i.e. size / SZ_4K)
+ *   Bits 9-11: Unused
+ *   Bit 8: Object protected
+ *   Bits 0-7: Pat index
+ */
 #define XE_OBJ_SIZE(rsvd1) ((rsvd1) & ~(SZ_4K-1))
-#define XE_OBJ_PAT_IDX(rsvd1) ((rsvd1) & (SZ_4K-1))
+#define XE_OBJ_PAT_IDX(rsvd1) ((rsvd1) & (0xFF))
+#define XE_OBJ_PXP_BIT (0x100)
+#define XE_OBJ_PXP(rsvd1) ((rsvd1) & (XE_OBJ_PXP_BIT))
 
 static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct intel_bb *ibb,
 						   uint32_t op, uint32_t flags,
@@ -1355,6 +1366,9 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct intel_bb *ibb,
 
 		ops->op = op;
 		ops->flags = flags;
+
+		if (XE_OBJ_PXP(objects[i]->rsvd1))
+			ops->flags |= DRM_XE_VM_BIND_FLAG_CHECK_PXP;
 		ops->obj_offset = 0;
 		ops->addr = objects[i]->offset;
 		ops->range = XE_OBJ_SIZE(objects[i]->rsvd1);
@@ -1745,7 +1759,7 @@ static void __remove_from_objects(struct intel_bb *ibb,
 static struct drm_i915_gem_exec_object2 *
 __intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
 		      uint64_t offset, uint64_t alignment, uint8_t pat_index,
-		      bool write)
+		      bool protected, bool write)
 {
 	struct drm_i915_gem_exec_object2 *object;
 
@@ -1822,17 +1836,24 @@ __intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
 		object->alignment = alignment;
 		object->rsvd1 = size;
 		igt_assert(!XE_OBJ_PAT_IDX(object->rsvd1));
+		igt_assert(!XE_OBJ_PXP(object->rsvd1));
 
 		if (pat_index == DEFAULT_PAT_INDEX)
 			pat_index = intel_get_pat_idx_wb(ibb->fd);
 
 		/*
-		 * XXX: For now encode the pat_index in the first few bits of
-		 * rsvd1. intel_batchbuffer should really stop using the i915
-		 * drm_i915_gem_exec_object2 to encode VMA placement
-		 * information on xe...
+		 * XXX: For now encode the pat_index and whether the bo is
+		 * protected in the first few bits of rsvd1 (8 bits for the
+		 * pat and 1 bit for the flag, see comment above
+		 * xe_alloc_bind_ops for the full map).
+		 * intel_batchbuffer should really stop using the i915
+		 * drm_i915_gem_exec_object2 to encode VMA placement information
+		 * on xe...
 		 */
 		object->rsvd1 |= pat_index;
+
+		if (protected)
+			object->rsvd1 |= XE_OBJ_PXP_BIT;
 	}
 
 	return object;
@@ -1845,7 +1866,7 @@ intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
 	struct drm_i915_gem_exec_object2 *obj = NULL;
 
 	obj = __intel_bb_add_object(ibb, handle, size, offset,
-				    alignment, DEFAULT_PAT_INDEX, write);
+				    alignment, DEFAULT_PAT_INDEX, false, write);
 	igt_assert(obj);
 
 	return obj;
@@ -1909,7 +1930,7 @@ __intel_bb_add_intel_buf(struct intel_bb *ibb, struct intel_buf *buf,
 
 	obj = __intel_bb_add_object(ibb, buf->handle, intel_buf_bo_size(buf),
 				    buf->addr.offset, alignment, buf->pat_index,
-				    write);
+				    buf->is_protected, write);
 	igt_assert(obj);
 	buf->addr.offset = obj->offset;
 
diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
index d77f219bd..ad414de10 100644
--- a/tests/intel/xe_pxp.c
+++ b/tests/intel/xe_pxp.c
@@ -4,6 +4,10 @@
  */
 
 #include "igt.h"
+#include "intel_batchbuffer.h"
+#include "intel_bufops.h"
+#include "intel_mocs.h"
+#include "intel_pat.h"
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
@@ -39,6 +43,15 @@ static int __pxp_bo_create(int fd, uint32_t vm, uint64_t size,
 	return ret;
 }
 
+static uint32_t pxp_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t type)
+{
+	uint32_t handle;
+
+	igt_assert_eq(__pxp_bo_create(fd, vm, size, type, &handle), 0);
+
+	return handle;
+}
+
 static int __create_pxp_rcs_queue(int fd, uint32_t vm,
 				  uint32_t session_type,
 				  uint32_t *q)
@@ -57,6 +70,17 @@ static int __create_pxp_rcs_queue(int fd, uint32_t vm,
 	return __xe_exec_queue_create(fd, vm, 1, 1, &inst, ext_ptr, q);
 }
 
+static uint32_t create_pxp_rcs_queue(int fd, uint32_t vm)
+{
+	uint32_t q;
+	int err;
+
+	err = __create_pxp_rcs_queue(fd, vm, DRM_XE_PXP_TYPE_HWDRM, &q);
+	igt_assert_eq(err, 0);
+
+	return q;
+}
+
 static int query_pxp_status(int fd)
 {
 	struct drm_xe_query_pxp_status *pxp_query;
@@ -175,13 +199,252 @@ static void test_pxp_queue_creation(int fd, bool pxp_supported)
 	xe_vm_destroy(fd, vm);
 }
 
+static void fill_bo_content(int fd, uint32_t bo, uint32_t size, uint8_t initcolor)
+{
+	uint32_t *ptr;
+
+	ptr = xe_bo_mmap_ext(fd, bo, size, PROT_READ|PROT_WRITE);
+
+	/* read and count all dword matches till size */
+	memset(ptr, initcolor, size);
+
+	igt_assert(munmap(ptr, size) == 0);
+}
+
+static void __check_bo_color(int fd, uint32_t bo, uint32_t size, uint32_t color, bool should_match)
+{
+	uint64_t comp;
+	uint64_t *ptr;
+	int i, num_matches = 0;
+
+	comp = color;
+	comp = comp | (comp << 32);
+
+	ptr =  xe_bo_mmap_ext(fd, bo, size, PROT_READ);
+
+	igt_assert_eq(size % sizeof(uint64_t), 0);
+
+	for (i = 0; i < (size / sizeof(uint64_t)); i++)
+		if (ptr[i] == comp)
+			++num_matches;
+
+	if (should_match)
+		igt_assert_eq(num_matches, (size / sizeof(uint64_t)));
+	else
+		igt_assert_eq(num_matches, 0);
+}
+
+static void check_bo_color(int fd, uint32_t bo, uint32_t size, uint8_t color, bool should_match)
+{
+	uint32_t comp;
+
+	/*
+	 * We memset the buffer using a u8 color value. However, this is too
+	 * small to ensure the encrypted data does not accidentally match it,
+	 * so we scale it up to a bigger size.
+	 */
+	comp = color;
+	comp = comp | (comp << 8) | (comp << 16) | (comp << 24);
+
+	return __check_bo_color(fd, bo, size, comp, should_match);
+}
+
+static uint32_t __bo_create_and_fill(int fd, uint32_t vm, bool protected,
+				     uint32_t size, uint8_t init_color)
+{
+	uint32_t bo;
+
+	if (protected)
+		bo = pxp_bo_create(fd, vm, size, DRM_XE_PXP_TYPE_HWDRM);
+	else
+		bo = xe_bo_create(fd, vm, size, system_memory(fd), 0);
+
+	fill_bo_content(fd, bo, size, init_color);
+
+	return bo;
+}
+
+static uint32_t pxp_bo_create_and_fill(int fd, uint32_t vm, uint32_t size,
+				       uint8_t init_color)
+{
+	return __bo_create_and_fill(fd, vm, true, size, init_color);
+}
+
+static uint32_t regular_bo_create_and_fill(int fd, uint32_t vm, uint32_t size,
+					   uint8_t init_color)
+{
+	return __bo_create_and_fill(fd, vm, false, size, init_color);
+}
+
+static struct intel_buf *buf_create(int fd, struct buf_ops *bops, uint32_t handle,
+				    int width, int height, int bpp, uint64_t size)
+{
+	igt_assert(handle);
+	igt_assert(size);
+	return intel_buf_create_full(bops, handle, width, height, bpp, 0,
+				     I915_TILING_NONE, 0, size, 0,
+				     system_memory(fd),
+				     DEFAULT_PAT_INDEX, DEFAULT_MOCS_INDEX);
+}
+
+/* Rendering tests surface attributes */
+#define TSTSURF_WIDTH		64
+#define TSTSURF_HEIGHT		64
+#define TSTSURF_BYTESPP		4
+#define TSTSURF_STRIDE		(TSTSURF_WIDTH * TSTSURF_BYTESPP)
+#define TSTSURF_SIZE		(TSTSURF_STRIDE * TSTSURF_HEIGHT)
+#define TSTSURF_INITCOLOR1  0xAA
+#define TSTSURF_FILLCOLOR1  0x55
+#define TSTSURF_INITCOLOR2  0x33
+
+static void pxp_rendercopy(int fd, uint32_t q, uint32_t vm, uint32_t copy_size,
+			   uint32_t srcbo, bool src_pxp, uint32_t dstbo, bool dst_pxp)
+{
+	igt_render_copyfunc_t render_copy;
+	struct intel_buf *srcbuf, *dstbuf;
+	struct buf_ops *bops;
+	struct intel_bb *ibb;
+
+	/*
+	 * we use the defined width and height below, which only works if the BO
+	 * size is TSTSURF_SIZE
+	 */
+	igt_assert_eq(copy_size, TSTSURF_SIZE);
+
+	render_copy = igt_get_render_copyfunc(intel_get_drm_devid(fd));
+	igt_assert(render_copy);
+
+	bops = buf_ops_create(fd);
+	igt_assert(bops);
+
+	ibb = intel_bb_create_with_context(fd, q, vm, NULL, 4096);
+	igt_assert(ibb);
+	intel_bb_set_pxp(ibb, true, DISPLAY_APPTYPE, DRM_XE_PXP_HWDRM_DEFAULT_SESSION);
+
+	dstbuf = buf_create(fd, bops, dstbo, TSTSURF_WIDTH, TSTSURF_HEIGHT,
+			    TSTSURF_BYTESPP * 8, TSTSURF_SIZE);
+	intel_buf_set_pxp(dstbuf, dst_pxp);
+
+	srcbuf = buf_create(fd, bops, srcbo, TSTSURF_WIDTH, TSTSURF_HEIGHT,
+			    TSTSURF_BYTESPP * 8, TSTSURF_SIZE);
+	intel_buf_set_pxp(srcbuf, src_pxp);
+
+	render_copy(ibb, srcbuf, 0, 0, TSTSURF_WIDTH, TSTSURF_HEIGHT, dstbuf, 0, 0);
+	intel_bb_sync(ibb);
+
+	intel_buf_destroy(srcbuf);
+	intel_buf_destroy(dstbuf);
+	intel_bb_destroy(ibb);
+	buf_ops_destroy(bops);
+}
+
+/**
+ * SUBTEST: regular-src-to-pxp-dest-rendercopy
+ * Description: copy from a regular BO to a PXP one and verify the encryption
+ */
+static void test_render_regular_src_to_pxp_dest(int fd)
+{
+	uint32_t vm, srcbo, dstbo;
+	uint32_t q;
+
+	vm = xe_vm_create(fd, 0, 0);
+
+	/*
+	 * Perform a protected render operation but only label the dest as
+	 * protected. After rendering, the content should be encrypted.
+	 */
+	q = create_pxp_rcs_queue(fd, vm);
+
+	srcbo = regular_bo_create_and_fill(fd, vm, TSTSURF_SIZE, TSTSURF_FILLCOLOR1);
+	dstbo = pxp_bo_create_and_fill(fd, vm, TSTSURF_SIZE, TSTSURF_INITCOLOR1);
+
+	pxp_rendercopy(fd, q, vm, TSTSURF_SIZE, srcbo, false, dstbo, true);
+
+	check_bo_color(fd, dstbo, TSTSURF_SIZE, TSTSURF_FILLCOLOR1, false);
+
+	gem_close(fd, srcbo);
+	gem_close(fd, dstbo);
+	xe_exec_queue_destroy(fd, q);
+	xe_vm_destroy(fd, vm);
+}
+
+static int bocmp(int fd, uint32_t bo1, uint32_t bo2, uint32_t size)
+{
+	uint32_t *ptr1, *ptr2;
+	int ret;
+
+	ptr1 = xe_bo_mmap_ext(fd, bo1, size, PROT_READ);
+	ptr2 = xe_bo_mmap_ext(fd, bo2, size, PROT_READ);
+
+	ret = memcmp(ptr1, ptr2, size);
+
+	igt_assert_eq(munmap(ptr1, size), 0);
+	igt_assert_eq(munmap(ptr2, size), 0);
+
+	return ret;
+}
+
+/**
+ * SUBTEST: pxp-src-to-pxp-dest-rendercopy
+ * Description: copy between 2 PXP BOs and verify the encryption
+ */
+
+static void test_render_pxp_protsrc_to_protdest(int fd)
+{
+	uint32_t vm, srcbo, dstbo, dstbo2;
+	uint32_t q;
+
+	vm = xe_vm_create(fd, 0, 0);
+
+	q = create_pxp_rcs_queue(fd, vm);
+
+	/*
+	 * Copy from a regular src to a PXP dst to get a buffer with a
+	 * valid encryption.
+	 */
+	srcbo = regular_bo_create_and_fill(fd, vm, TSTSURF_SIZE, TSTSURF_FILLCOLOR1);
+	dstbo = pxp_bo_create_and_fill(fd, vm, TSTSURF_SIZE, TSTSURF_INITCOLOR1);
+
+	pxp_rendercopy(fd, q, vm, TSTSURF_SIZE, srcbo, false, dstbo, true);
+
+	check_bo_color(fd, dstbo, TSTSURF_SIZE, TSTSURF_FILLCOLOR1, false);
+
+	/*
+	 * Reuse prior dst as the new-src and create dst2 as the new-dest.
+	 * After the rendering, we should find no difference in content since
+	 * both new-src and new-dest are labelled as encrypted. HW should read
+	 * and decrypt new-src, perform the copy and re-encrypt with the same
+	 * key when going into new-dest
+	 */
+	dstbo2 = pxp_bo_create_and_fill(fd, vm, TSTSURF_SIZE, TSTSURF_INITCOLOR2);
+
+	pxp_rendercopy(fd, q, vm, TSTSURF_SIZE, dstbo, true, dstbo2, true);
+
+	igt_assert_eq(bocmp(fd, dstbo, dstbo2, TSTSURF_SIZE), 0);
+
+	gem_close(fd, srcbo);
+	gem_close(fd, dstbo);
+	gem_close(fd, dstbo2);
+	xe_exec_queue_destroy(fd, q);
+	xe_vm_destroy(fd, vm);
+}
+
+static void require_pxp_render(bool pxp_supported, uint32_t devid)
+{
+	igt_require_f(pxp_supported, "PXP not supported\n");
+	igt_require_f(igt_get_render_copyfunc(devid),
+		      "No rendercopy found for devid=%x\n", devid);
+}
+
 igt_main
 {
 	int xe_fd = -1;
 	bool pxp_supported = true;
+	uint32_t devid = 0;
 
 	igt_fixture {
 		xe_fd = drm_open_driver(DRIVER_XE);
+		devid = intel_get_drm_devid(xe_fd);
 		igt_require(xe_has_engine_class(xe_fd, DRM_XE_ENGINE_CLASS_RENDER));
 		pxp_supported = is_pxp_hw_supported(xe_fd);
 	}
@@ -195,6 +458,18 @@ igt_main
 		test_pxp_queue_creation(xe_fd, pxp_supported);
 	}
 
+	igt_subtest_group {
+		igt_describe("Verify protected render operations:");
+		igt_subtest("regular-src-to-pxp-dest-rendercopy") {
+			require_pxp_render(pxp_supported, devid);
+			test_render_regular_src_to_pxp_dest(xe_fd);
+		}
+		igt_subtest("pxp-src-to-pxp-dest-rendercopy") {
+			require_pxp_render(pxp_supported, devid);
+			test_render_pxp_protsrc_to_protdest(xe_fd);
+		}
+	}
+
 	igt_fixture {
 		close(xe_fd);
 	}
-- 
2.43.0

