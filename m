Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1B56E8EC
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Oct 2021 05:41:10 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon,  4 Oct 2021 07:40:56 +0200
Message-Id: <20211004054056.24346-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211004054056.24346-1-zbigniew.kempczynski@intel.com>
References: <20211004054056.24346-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/intel_bufops: Store gem bo size
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

intel_buf is keeping its size which may differ to underlying gem bo size.
Introduce keeping bo_size field which is used along with softpin mode
- like in intel_bb.

Patch also should remove previous discrepancy where intel_buf_bo_size()
returned requested (not gem bo size).

From now on user has an access to:
1. raw buffer size - intel_buf_size() - function returns how buffer data
   really takes in the memory
2. gem bo buffer size - intel_buf_bo_size() - function returns how big
   underlying gem object is

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/intel_batchbuffer.c   |  4 ++--
 lib/intel_bufops.c        | 27 ++++++++++++++++-----------
 lib/intel_bufops.h        |  3 +++
 tests/i915/api_intel_bb.c | 16 ++++++++--------
 4 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 5f41eefdb..e3e649ca3 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2016,7 +2016,7 @@ __intel_bb_add_intel_buf(struct intel_bb *ibb, struct intel_buf *buf,
 		}
 	}
 
-	obj = intel_bb_add_object(ibb, buf->handle, intel_buf_size(buf),
+	obj = intel_bb_add_object(ibb, buf->handle, intel_buf_bo_size(buf),
 				  buf->addr.offset, alignment, write);
 	buf->addr.offset = obj->offset;
 
@@ -2056,7 +2056,7 @@ bool intel_bb_remove_intel_buf(struct intel_bb *ibb, struct intel_buf *buf)
 
 	removed = intel_bb_remove_object(ibb, buf->handle,
 					 buf->addr.offset,
-					 intel_buf_size(buf));
+					 intel_buf_bo_size(buf));
 	if (removed) {
 		buf->addr.offset = INTEL_BUF_INVALID_ADDRESS;
 		buf->ibb = NULL;
diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 7199723bb..80c5bb80b 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -813,17 +813,16 @@ static void __intel_buf_init(struct buf_ops *bops,
 		size = bo_size;
 	}
 
-	/* Store real bo size to avoid mistakes in calculating it again */
+	/* Store buffer size to avoid mistakes in calculating it again */
 	buf->size = size;
+	buf->handle = handle;
 
-	if (handle)
-		buf->handle = handle;
-	else {
-		if (!__gem_create_in_memory_regions(bops->fd, &handle, &size, region))
-			buf->handle = handle;
-		else
-			buf->handle = gem_create(bops->fd, size);
-	}
+	if (!handle)
+		if (__gem_create_in_memory_regions(bops->fd, &buf->handle, &size, region))
+			igt_assert_eq(__gem_create(bops->fd, &size, &buf->handle), 0);
+
+	/* Store gem bo size */
+	buf->bo_size = size;
 
 	set_hw_tiled(bops, buf);
 }
@@ -1096,10 +1095,11 @@ void intel_buf_print(const struct intel_buf *buf)
 {
 	igt_info("[name: %s]\n", buf->name);
 	igt_info("[%u]: w: %u, h: %u, stride: %u, size: %" PRIx64
-		 ", buf-size: %" PRIx64 ", bpp: %u, tiling: %u, compress: %u\n",
+		 ", buf-size: %" PRIx64 ", bo-size: %" PRIx64
+		 ", bpp: %u, tiling: %u, compress: %u\n",
 		 buf->handle, intel_buf_width(buf), intel_buf_height(buf),
 		 buf->surface[0].stride, buf->surface[0].size,
-		 intel_buf_size(buf), buf->bpp,
+		 intel_buf_size(buf), intel_buf_bo_size(buf), buf->bpp,
 		 buf->tiling, buf->compression);
 	igt_info(" ccs <offset: %u, stride: %u, w: %u, h: %u> cc <offset: %u>\n",
 		 buf->ccs[0].offset,
@@ -1307,6 +1307,11 @@ uint64_t intel_buf_size(const struct intel_buf *buf)
 	return buf->size;
 }
 
+uint64_t intel_buf_bo_size(const struct intel_buf *buf)
+{
+	return buf->bo_size;
+}
+
 static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
 {
 	struct buf_ops *bops = calloc(1, sizeof(*bops));
diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index e09b21b2a..8148750f8 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -42,6 +42,8 @@ struct intel_buf {
 		uint32_t ctx;
 	} addr;
 
+	uint64_t bo_size;
+
 	/* Tracking */
 	struct intel_bb *ibb;
 	struct igt_list_head link;
@@ -98,6 +100,7 @@ intel_buf_ccs_height(int gen, const struct intel_buf *buf)
 }
 
 uint64_t intel_buf_size(const struct intel_buf *buf);
+uint64_t intel_buf_bo_size(const struct intel_buf *buf);
 
 struct buf_ops *buf_ops_create(int fd);
 struct buf_ops *buf_ops_create_with_selftest(int fd);
diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
index 492cedefd..293720b4b 100644
--- a/tests/i915/api_intel_bb.c
+++ b/tests/i915/api_intel_bb.c
@@ -1055,11 +1055,11 @@ static void offset_control(struct buf_ops *bops)
 	dst1 = create_buf(bops, WIDTH, HEIGHT, COLOR_00);
 	dst2 = create_buf(bops, WIDTH, HEIGHT, COLOR_77);
 
-	intel_bb_add_object(ibb, src->handle, intel_buf_size(src),
+	intel_bb_add_object(ibb, src->handle, intel_buf_bo_size(src),
 			    src->addr.offset, 0, false);
-	intel_bb_add_object(ibb, dst1->handle, intel_buf_size(dst1),
+	intel_bb_add_object(ibb, dst1->handle, intel_buf_bo_size(dst1),
 			    dst1->addr.offset, 0, true);
-	intel_bb_add_object(ibb, dst2->handle, intel_buf_size(dst2),
+	intel_bb_add_object(ibb, dst2->handle, intel_buf_bo_size(dst2),
 			    dst2->addr.offset, 0, true);
 
 	intel_bb_out(ibb, MI_BATCH_BUFFER_END);
@@ -1080,13 +1080,13 @@ static void offset_control(struct buf_ops *bops)
 	intel_bb_reset(ibb, true);
 
 	dst3 = create_buf(bops, WIDTH, HEIGHT, COLOR_33);
-	intel_bb_add_object(ibb, dst3->handle, intel_buf_size(dst3),
+	intel_bb_add_object(ibb, dst3->handle, intel_buf_bo_size(dst3),
 			    dst3->addr.offset, 0, true);
-	intel_bb_add_object(ibb, src->handle, intel_buf_size(src),
+	intel_bb_add_object(ibb, src->handle, intel_buf_bo_size(src),
 			    src->addr.offset, 0, false);
-	intel_bb_add_object(ibb, dst1->handle, intel_buf_size(dst1),
+	intel_bb_add_object(ibb, dst1->handle, intel_buf_bo_size(dst1),
 			    dst1->addr.offset, 0, true);
-	intel_bb_add_object(ibb, dst2->handle, intel_buf_size(dst2),
+	intel_bb_add_object(ibb, dst2->handle, intel_buf_bo_size(dst2),
 			    dst2->addr.offset, 0, true);
 
 	intel_bb_out(ibb, MI_BATCH_BUFFER_END);
@@ -1140,7 +1140,7 @@ static void delta_check(struct buf_ops *bops)
 
 	buf = create_buf(bops, 0x1000, 0x10, COLOR_CC);
 	buf->addr.offset = 0xfffff000;
-	intel_bb_add_object(ibb, buf->handle, intel_buf_size(buf),
+	intel_bb_add_object(ibb, buf->handle, intel_buf_bo_size(buf),
 			    buf->addr.offset, 0, false);
 
 	intel_bb_out(ibb, MI_STORE_DWORD_IMM);
-- 
2.26.0
