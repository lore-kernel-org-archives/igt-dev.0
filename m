Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29626E1F4
 for <igt-dev@lists.freedesktop.org>; Sat, 11 Jan 2020 05:36:54 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri, 10 Jan 2020 21:36:53 -0800
Message-Id: <fd2da281033416f29cba6e1ab616164b1cfc6928.1578720512.git.ashutosh.dixit@intel.com>
In-Reply-To: <037121df1ee6fcf1fa92ea4a7fb6ba31b39e80ac.1578720512.git.ashutosh.dixit@intel.com>
References: <037121df1ee6fcf1fa92ea4a7fb6ba31b39e80ac.1578720512.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] i915/treewide: Replace gem_mmap__gtt()
 by gem_mmap__device_coherent()
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

As another step towards supporting GPU's without mappable aperture,
globally replace gem_mmap__gtt() by gem_mmap__device_coherent(). This
will not affect GPU's with a mappable aperture but will fix tests on
GPU's without a mappable aperture through the use of WC mapping,
unless those tests test actual features available via the aperture.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 benchmarks/gem_busy.c                   |  2 +-
 benchmarks/gem_mmap.c                   |  4 ++--
 lib/igt_draw.c                          |  2 +-
 lib/igt_fb.c                            |  2 +-
 tests/i915/gem_blits.c                  |  2 +-
 tests/i915/gem_concurrent_all.c         |  4 ++--
 tests/i915/gem_create.c                 |  4 ++--
 tests/i915/gem_ctx_shared.c             | 10 ++++-----
 tests/i915/gem_ctx_sseu.c               |  2 +-
 tests/i915/gem_exec_balancer.c          |  2 +-
 tests/i915/gem_exec_basic.c             |  2 +-
 tests/i915/gem_exec_flush.c             |  4 ++--
 tests/i915/gem_exec_gttfill.c           |  4 ++--
 tests/i915/gem_exec_reloc.c             | 10 ++++-----
 tests/i915/gem_exec_schedule.c          |  4 ++--
 tests/i915/gem_fence_thrash.c           |  2 +-
 tests/i915/gem_fence_upload.c           |  6 +++---
 tests/i915/gem_gtt_cpu_tlb.c            |  4 ++--
 tests/i915/gem_gtt_hog.c                |  4 ++--
 tests/i915/gem_gtt_speed.c              | 12 +++++------
 tests/i915/gem_largeobject.c            |  2 +-
 tests/i915/gem_madvise.c                |  4 ++--
 tests/i915/gem_mmap_gtt.c               | 28 ++++++++++++-------------
 tests/i915/gem_mmap_offset_exhaustion.c |  2 +-
 tests/i915/gem_mmap_wc.c                |  2 +-
 tests/i915/gem_persistent_relocs.c      |  2 +-
 tests/i915/gem_pread.c                  |  2 +-
 tests/i915/gem_pwrite.c                 |  2 +-
 tests/i915/gem_pwrite_pread.c           |  8 +++----
 tests/i915/gem_reloc_vs_gpu.c           |  2 +-
 tests/i915/gem_render_copy.c            | 10 ++++-----
 tests/i915/gem_set_tiling_vs_gtt.c      |  2 +-
 tests/i915/gem_set_tiling_vs_pwrite.c   |  2 +-
 tests/i915/gem_shrink.c                 |  2 +-
 tests/i915/gem_storedw_loop.c           |  2 +-
 tests/i915/gem_streaming_writes.c       |  4 ++--
 tests/i915/gem_tiled_fence_blits.c      |  4 ++--
 tests/i915/gem_tiled_pread_basic.c      |  2 +-
 tests/i915/gem_tiled_pread_pwrite.c     |  4 ++--
 tests/i915/gem_tiled_swapping.c         |  6 +++---
 tests/i915/gem_tiled_wb.c               |  2 +-
 tests/i915/gem_tiled_wc.c               |  2 +-
 tests/i915/gem_tiling_max_stride.c      |  2 +-
 tests/i915/gem_userptr_blits.c          | 10 ++++-----
 tests/i915/gen3_mixed_blits.c           |  4 ++--
 tests/i915/gen3_render_mixed_blits.c    |  4 ++--
 tests/i915/gen3_render_tiledx_blits.c   |  4 ++--
 tests/i915/gen3_render_tiledy_blits.c   |  4 ++--
 tests/i915/i915_pm_rpm.c                | 18 ++++++++--------
 tests/i915/i915_suspend.c               |  6 +++---
 tests/kms_available_modes_crc.c         |  2 +-
 tests/kms_fence_pin_leak.c              |  2 +-
 tests/kms_psr.c                         |  2 +-
 tests/prime_mmap.c                      |  2 +-
 tests/prime_mmap_coherency.c            |  2 +-
 tests/prime_vgem.c                      |  8 +++----
 tools/intel_dp_compliance.c             | 12 +++++------
 57 files changed, 132 insertions(+), 132 deletions(-)

diff --git a/benchmarks/gem_busy.c b/benchmarks/gem_busy.c
index 2fb1edf98..55db17a7d 100644
--- a/benchmarks/gem_busy.c
+++ b/benchmarks/gem_busy.c
@@ -188,7 +188,7 @@ static int loop(unsigned ring, int reps, int ncpus, unsigned flags)
 	if (gem_mmap__has_wc(fd))
 		batch = gem_mmap__wc(fd, obj[1].handle, 0, 4096, PROT_WRITE);
 	else
-		batch = gem_mmap__gtt(fd, obj[1].handle, 4096, PROT_WRITE);
+		batch = gem_mmap__device_coherent(fd, obj[1].handle, 0, 4096, PROT_WRITE);
 	gem_set_domain(fd, obj[1].handle,
 			I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	batch[0] = MI_BATCH_BUFFER_END;
diff --git a/benchmarks/gem_mmap.c b/benchmarks/gem_mmap.c
index d3d4ad310..518f9fd9b 100644
--- a/benchmarks/gem_mmap.c
+++ b/benchmarks/gem_mmap.c
@@ -122,7 +122,7 @@ int main(int argc, char **argv)
 		gem_set_domain(fd, handle, I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
 		break;
 	case GTT:
-		ptr = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_WRITE);
+		ptr = gem_mmap__device_coherent(fd, handle, 0, OBJECT_SIZE, PROT_WRITE);
 		gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 		break;
 	case WC:
@@ -172,7 +172,7 @@ int main(int argc, char **argv)
 					ptr = gem_mmap__cpu(fd, handle, 0, OBJECT_SIZE, PROT_WRITE);
 					break;
 				case GTT:
-					ptr = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_WRITE);
+					ptr = gem_mmap__device_coherent(fd, handle, 0, OBJECT_SIZE, PROT_WRITE);
 					break;
 				case WC:
 					ptr = gem_mmap__wc(fd, handle, 0, OBJECT_SIZE, PROT_WRITE);
diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 6950bc493..8d23aa58c 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -375,7 +375,7 @@ static void draw_rect_mmap_gtt(int fd, struct buf_data *buf, struct rect *rect,
 	gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_GTT,
 		       I915_GEM_DOMAIN_GTT);
 
-	ptr = gem_mmap__gtt(fd, buf->handle, PAGE_ALIGN(buf->size),
+	ptr = gem_mmap__device_coherent(fd, buf->handle, 0, PAGE_ALIGN(buf->size),
 			    PROT_READ | PROT_WRITE);
 
 	draw_rect_ptr_linear(ptr, buf->stride, rect, color, buf->bpp);
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index c81b9de8e..72bb8c00d 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2336,7 +2336,7 @@ static void *map_bo(int fd, struct igt_fb *fb)
 		ptr = kmstest_dumb_map_buffer(fd, fb->gem_handle, fb->size,
 					      PROT_READ | PROT_WRITE);
 	else if (is_i915_device(fd))
-		ptr = gem_mmap__gtt(fd, fb->gem_handle, fb->size,
+		ptr = gem_mmap__device_coherent(fd, fb->gem_handle, 0, fb->size,
 				    PROT_READ | PROT_WRITE);
 	else if (is_vc4_device(fd))
 		ptr = igt_vc4_mmap_bo(fd, fb->gem_handle, fb->size,
diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
index f9cb12bb8..2473bb187 100644
--- a/tests/i915/gem_blits.c
+++ b/tests/i915/gem_blits.c
@@ -429,7 +429,7 @@ static void *download(const struct device *device,
 		break;
 
 	case GTT:
-		src = gem_mmap__gtt(device->fd, buffer->handle,
+		src = gem_mmap__device_coherent(device->fd, buffer->handle, 0,
 				   buffer->size,
 				   PROT_READ);
 
diff --git a/tests/i915/gem_concurrent_all.c b/tests/i915/gem_concurrent_all.c
index f1be4a85d..236893f33 100644
--- a/tests/i915/gem_concurrent_all.c
+++ b/tests/i915/gem_concurrent_all.c
@@ -907,8 +907,8 @@ static void gtt_copy_bo(struct buffers *b, drm_intel_bo *dst, drm_intel_bo *src)
 	gem_set_domain(fd, src->handle, I915_GEM_DOMAIN_GTT, 0);
 	gem_set_domain(fd, dst->handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 
-	s = gem_mmap__gtt(fd, src->handle, size, PROT_READ);
-	d = gem_mmap__gtt(fd, dst->handle, size, PROT_WRITE);
+	s = gem_mmap__device_coherent(fd, src->handle, 0, size, PROT_READ);
+	d = gem_mmap__device_coherent(fd, dst->handle, 0, size, PROT_WRITE);
 
 	memcpy(d, s, size);
 
diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
index 8fc128dae..32eb65191 100644
--- a/tests/i915/gem_create.c
+++ b/tests/i915/gem_create.c
@@ -219,8 +219,8 @@ static void *thread_clear(void *data)
 					     0, create.size, PROT_READ);
 			break;
 		case GTT:
-			ptr = __gem_mmap__gtt(i915, create.handle,
-					      create.size, PROT_READ);
+			ptr = __gem_mmap__device_coherent(i915, create.handle,
+					     0, create.size, PROT_READ);
 			break;
 		}
 		/* No set-domains as we are being as naughty as possible */
diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
index 30e37c3cc..820b96c1a 100644
--- a/tests/i915/gem_ctx_shared.c
+++ b/tests/i915/gem_ctx_shared.c
@@ -605,7 +605,7 @@ static void independent(int i915, unsigned ring, unsigned flags)
 	for (int i = 0; i < ARRAY_SIZE(priorities); i++) {
 		uint32_t *ptr;
 
-		ptr = gem_mmap__gtt(i915, handle[i], 4096, PROT_READ);
+		ptr = gem_mmap__device_coherent(i915, handle[i], 0, 4096, PROT_READ);
 		gem_set_domain(i915, handle[i], /* no write hazard lies! */
 			       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 		gem_close(i915, handle[i]);
@@ -650,7 +650,7 @@ static void reorder(int i915, unsigned ring, unsigned flags)
 	gem_context_destroy(i915, ctx[LO]);
 	gem_context_destroy(i915, ctx[HI]);
 
-	ptr = gem_mmap__gtt(i915, scratch, 4096, PROT_READ);
+	ptr = gem_mmap__device_coherent(i915, scratch, 0, 4096, PROT_READ);
 	gem_set_domain(i915, scratch, /* no write hazard lies! */
 		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	gem_close(i915, scratch);
@@ -705,7 +705,7 @@ static void promotion(int i915, unsigned ring)
 	gem_context_destroy(i915, ctx[LO]);
 	gem_context_destroy(i915, ctx[HI]);
 
-	ptr = gem_mmap__gtt(i915, dep, 4096, PROT_READ);
+	ptr = gem_mmap__device_coherent(i915, dep, 0, 4096, PROT_READ);
 	gem_set_domain(i915, dep, /* no write hazard lies! */
 			I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	gem_close(i915, dep);
@@ -713,7 +713,7 @@ static void promotion(int i915, unsigned ring)
 	igt_assert_eq_u32(ptr[0], ctx[HI]);
 	munmap(ptr, 4096);
 
-	ptr = gem_mmap__gtt(i915, result, 4096, PROT_READ);
+	ptr = gem_mmap__device_coherent(i915, result, 0, 4096, PROT_READ);
 	gem_set_domain(i915, result, /* no write hazard lies! */
 			I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	gem_close(i915, result);
@@ -768,7 +768,7 @@ static void smoketest(int i915, unsigned ring, unsigned timeout)
 	}
 	igt_waitchildren();
 
-	ptr = gem_mmap__gtt(i915, scratch, 4096, PROT_READ);
+	ptr = gem_mmap__device_coherent(i915, scratch, 0, 4096, PROT_READ);
 	gem_set_domain(i915, scratch, /* no write hazard lies! */
 			I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	gem_close(i915, scratch);
diff --git a/tests/i915/gem_ctx_sseu.c b/tests/i915/gem_ctx_sseu.c
index 48e4411c8..a888dd6c9 100644
--- a/tests/i915/gem_ctx_sseu.c
+++ b/tests/i915/gem_ctx_sseu.c
@@ -375,7 +375,7 @@ test_ggtt_args(int fd)
 	uint32_t bo;
 
 	bo = gem_create(fd, 4096);
-	arg.value = to_user_pointer(gem_mmap__gtt(fd, bo, 4096,
+	arg.value = to_user_pointer(gem_mmap__device_coherent(fd, bo, 0, 4096,
 						  PROT_READ | PROT_WRITE));
 
 	igt_assert_eq(__gem_context_get_param(fd, &arg), 0);
diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index f4909a978..5bfea15c4 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -278,7 +278,7 @@ static void invalid_balancer(int i915)
 		igt_assert_eq(__gem_context_set_param(i915, &p), -EFAULT);
 
 		handle = gem_create(i915, 4096 * 3);
-		ptr = gem_mmap__gtt(i915, handle, 4096 * 3, PROT_WRITE);
+		ptr = gem_mmap__device_coherent(i915, handle, 0, 4096 * 3, PROT_WRITE);
 		gem_close(i915, handle);
 
 		memset(&engines, 0, sizeof(engines));
diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
index 70dce34b5..5bb0b21a1 100644
--- a/tests/i915/gem_exec_basic.c
+++ b/tests/i915/gem_exec_basic.c
@@ -98,7 +98,7 @@ static void gtt(int fd, uint64_t flags)
 	handle = gem_create(fd, 4096);
 
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
-	execbuf = gem_mmap__gtt(fd, handle, 4096, PROT_WRITE);
+	execbuf = gem_mmap__device_coherent(fd, handle, 0, 4096, PROT_WRITE);
 	exec = (struct drm_i915_gem_exec_object2 *)(execbuf + 1);
 	gem_close(fd, handle);
 
diff --git a/tests/i915/gem_exec_flush.c b/tests/i915/gem_exec_flush.c
index 28708460b..69ee000d0 100644
--- a/tests/i915/gem_exec_flush.c
+++ b/tests/i915/gem_exec_flush.c
@@ -154,7 +154,7 @@ static void run(int fd, unsigned ring, int nchild, int timeout,
 
 		/* Prepara a mappable binding to prevent pread mighrating */
 		if (!snoop) {
-			ptr = gem_mmap__gtt(fd, obj[0].handle, 4096, PROT_READ);
+			ptr = gem_mmap__device_coherent(fd, obj[0].handle, 0, 4096, PROT_READ);
 			igt_assert_eq_u32(ptr[0], 0xabcdabcd);
 			munmap(ptr, 4096);
 		}
@@ -418,7 +418,7 @@ static void batch(int fd, unsigned ring, int nchild, int timeout,
 			break;
 
 		case BATCH_GTT:
-			ptr = gem_mmap__gtt(fd, obj[1].handle, 64<<10,
+			ptr = gem_mmap__device_coherent(fd, obj[1].handle, 0, 64<<10,
 					    PROT_WRITE);
 			break;
 
diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
index f810dafd1..4f54a2805 100644
--- a/tests/i915/gem_exec_gttfill.c
+++ b/tests/i915/gem_exec_gttfill.c
@@ -160,8 +160,8 @@ static void fillgtt(int fd, unsigned ring, int timeout)
 				       0, BATCH_SIZE, PROT_WRITE);
 		if (!batches[i].ptr) {
 			batches[i].ptr =
-				__gem_mmap__gtt(fd, batches[i].handle,
-						BATCH_SIZE, PROT_WRITE);
+				__gem_mmap__device_coherent(fd, batches[i].handle,
+						    0, BATCH_SIZE, PROT_WRITE);
 		}
 		igt_require(batches[i].ptr);
 	}
diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index ef995a676..78ea6eee1 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -129,7 +129,7 @@ static void from_mmap(int fd, uint64_t size, enum mode mode)
 		break;
 	case GTT:
 		reloc_handle = gem_create(fd, size);
-		relocs = gem_mmap__gtt(fd, reloc_handle, size, PROT_WRITE);
+		relocs = gem_mmap__device_coherent(fd, reloc_handle, 0, size, PROT_WRITE);
 		gem_set_domain(fd, reloc_handle,
 				I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 		gem_close(fd, reloc_handle);
@@ -418,7 +418,7 @@ static void basic_reloc(int fd, unsigned before, unsigned after, unsigned flags)
 			if (before == I915_GEM_DOMAIN_CPU)
 				wc = gem_mmap__cpu(fd, obj.handle, 0, OBJSZ, PROT_WRITE);
 			else if (before == I915_GEM_DOMAIN_GTT)
-				wc = gem_mmap__gtt(fd, obj.handle, OBJSZ, PROT_WRITE);
+				wc = gem_mmap__device_coherent(fd, obj.handle, 0, OBJSZ, PROT_WRITE);
 			else if (before == I915_GEM_DOMAIN_WC)
 				wc = gem_mmap__wc(fd, obj.handle, 0, OBJSZ, PROT_WRITE);
 			else
@@ -449,7 +449,7 @@ static void basic_reloc(int fd, unsigned before, unsigned after, unsigned flags)
 			if (after == I915_GEM_DOMAIN_CPU)
 				wc = gem_mmap__cpu(fd, obj.handle, 0, OBJSZ, PROT_READ);
 			else if (after == I915_GEM_DOMAIN_GTT)
-				wc = gem_mmap__gtt(fd, obj.handle, OBJSZ, PROT_READ);
+				wc = gem_mmap__device_coherent(fd, obj.handle, 0, OBJSZ, PROT_READ);
 			else if (after == I915_GEM_DOMAIN_WC)
 				wc = gem_mmap__wc(fd, obj.handle, 0, OBJSZ, PROT_READ);
 			else
@@ -488,7 +488,7 @@ static void basic_reloc(int fd, unsigned before, unsigned after, unsigned flags)
 			if (before == I915_GEM_DOMAIN_CPU)
 				wc = gem_mmap__cpu(fd, obj.handle, 0, OBJSZ, PROT_WRITE);
 			else if (before == I915_GEM_DOMAIN_GTT)
-				wc = gem_mmap__gtt(fd, obj.handle, OBJSZ, PROT_WRITE);
+				wc = gem_mmap__device_coherent(fd, obj.handle, 0, OBJSZ, PROT_WRITE);
 			else if (before == I915_GEM_DOMAIN_WC)
 				wc = gem_mmap__wc(fd, obj.handle, 0, OBJSZ, PROT_WRITE);
 			else
@@ -517,7 +517,7 @@ static void basic_reloc(int fd, unsigned before, unsigned after, unsigned flags)
 			if (after == I915_GEM_DOMAIN_CPU)
 				wc = gem_mmap__cpu(fd, obj.handle, 0, OBJSZ, PROT_READ);
 			else if (after == I915_GEM_DOMAIN_GTT)
-				wc = gem_mmap__gtt(fd, obj.handle, OBJSZ, PROT_READ);
+				wc = gem_mmap__device_coherent(fd, obj.handle, 0, OBJSZ, PROT_READ);
 			else if (after == I915_GEM_DOMAIN_WC)
 				wc = gem_mmap__wc(fd, obj.handle, 0, OBJSZ, PROT_READ);
 			else
diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index 0b6826fd6..a20985864 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -252,7 +252,7 @@ static void independent(int fd, unsigned int engine)
 	igt_require(engine != 0);
 
 	scratch = gem_create(fd, 4096);
-	ptr = gem_mmap__gtt(fd, scratch, 4096, PROT_READ);
+	ptr = gem_mmap__device_coherent(fd, scratch, 0, 4096, PROT_READ);
 	igt_assert_eq(ptr[0], 0);
 
 	fence = igt_cork_plug(&cork, fd);
@@ -1410,7 +1410,7 @@ static void reorder_wide(int fd, unsigned ring)
 		gem_context_set_priority(fd, execbuf.rsvd1, n);
 
 		obj[1].handle = gem_create(fd, sz);
-		batch = gem_mmap__gtt(fd, obj[1].handle, sz, PROT_WRITE);
+		batch = gem_mmap__device_coherent(fd, obj[1].handle, 0, sz, PROT_WRITE);
 		gem_set_domain(fd, obj[1].handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 
 		for (int m = 0; m < ring_size; m++) {
diff --git a/tests/i915/gem_fence_thrash.c b/tests/i915/gem_fence_thrash.c
index 9beada982..7f49c1c4c 100644
--- a/tests/i915/gem_fence_thrash.c
+++ b/tests/i915/gem_fence_thrash.c
@@ -77,7 +77,7 @@ bo_create (int fd, int tiling)
 
 	gem_set_tiling(fd, handle, tiling, 1024);
 
-	ptr = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_READ | PROT_WRITE);
+	ptr = gem_mmap__device_coherent(fd, handle, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
 
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	gem_close(fd, handle);
diff --git a/tests/i915/gem_fence_upload.c b/tests/i915/gem_fence_upload.c
index 17580aff8..1ba11c6ab 100644
--- a/tests/i915/gem_fence_upload.c
+++ b/tests/i915/gem_fence_upload.c
@@ -66,7 +66,7 @@ static void performance(void)
 
 		for (n = 0; n < count; n++) {
 			handle[n] = gem_create(fd, OBJECT_SIZE);
-			ptr[n] = gem_mmap__gtt(fd, handle[n], OBJECT_SIZE, PROT_READ | PROT_WRITE);
+			ptr[n] = gem_mmap__device_coherent(fd, handle[n], 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
 		}
 
 		gettimeofday(&start, NULL);
@@ -173,7 +173,7 @@ static void thread_performance(unsigned mask)
 
 		for (n = 0; n < count; n++) {
 			handle[n] = gem_create(fd, OBJECT_SIZE);
-			ptr[n] = gem_mmap__gtt(fd, handle[n], OBJECT_SIZE, PROT_READ | PROT_WRITE);
+			ptr[n] = gem_mmap__device_coherent(fd, handle[n], 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
 
 			if (mask & READ) {
 				readers[n].id = n;
@@ -253,7 +253,7 @@ static void *no_contention(void *closure)
 	int n;
 
 	for (n = 0; n < t->loops; n++) {
-		uint32_t *ptr = gem_mmap__gtt(t->fd, t->handle, OBJECT_SIZE, PROT_READ | PROT_WRITE);
+		uint32_t *ptr = gem_mmap__device_coherent(t->fd, t->handle, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
 		memset(ptr + (rand() % 256) * 4096 / 4, 0, 4096);
 		munmap(ptr, OBJECT_SIZE);
 	}
diff --git a/tests/i915/gem_gtt_cpu_tlb.c b/tests/i915/gem_gtt_cpu_tlb.c
index 0af6a1c42..9f1cc3e4b 100644
--- a/tests/i915/gem_gtt_cpu_tlb.c
+++ b/tests/i915/gem_gtt_cpu_tlb.c
@@ -59,7 +59,7 @@ create_bo(int fd)
 	handle = gem_create(fd, OBJ_SIZE);
 
 	/* Fill the BO with dwords starting at start_val */
-	data = gem_mmap__gtt(fd, handle, OBJ_SIZE, PROT_READ | PROT_WRITE);
+	data = gem_mmap__device_coherent(fd, handle, 0, OBJ_SIZE, PROT_READ | PROT_WRITE);
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	for (i = 0; i < OBJ_SIZE/4; i++)
 		data[i] = i;
@@ -82,7 +82,7 @@ igt_simple_main
 	handle = gem_create(fd, OBJ_SIZE);
 
 	/* touch one page */
-	ptr = gem_mmap__gtt(fd, handle, OBJ_SIZE, PROT_READ | PROT_WRITE);
+	ptr = gem_mmap__device_coherent(fd, handle, 0, OBJ_SIZE, PROT_READ | PROT_WRITE);
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	*ptr = 0xdeadbeef;
 	munmap(ptr, OBJ_SIZE);
diff --git a/tests/i915/gem_gtt_hog.c b/tests/i915/gem_gtt_hog.c
index 1ebef7765..da08e3a33 100644
--- a/tests/i915/gem_gtt_hog.c
+++ b/tests/i915/gem_gtt_hog.c
@@ -140,11 +140,11 @@ static void run(data_t *data, int child)
 	 * set-to-gtt-domain within the fault handler.
 	 */
 	if (write) {
-		ptr = gem_mmap__gtt(data->fd, handle, size,
+		ptr = gem_mmap__device_coherent(data->fd, handle, 0, size,
 				    PROT_READ | PROT_WRITE);
 		ptr[rand() % (size / 4)] = canary;
 	} else {
-		ptr = gem_mmap__gtt(data->fd, handle, size, PROT_READ);
+		ptr = gem_mmap__device_coherent(data->fd, handle, 0, size, PROT_READ);
 	}
 	x = ptr[rand() % (size / 4)];
 	munmap(ptr, size);
diff --git a/tests/i915/gem_gtt_speed.c b/tests/i915/gem_gtt_speed.c
index f0c1954fa..16c9378f9 100644
--- a/tests/i915/gem_gtt_speed.c
+++ b/tests/i915/gem_gtt_speed.c
@@ -255,7 +255,7 @@ igt_simple_main_args("s:", NULL, help_str, opt_handler, NULL)
 
 		/* prefault into gtt */
 		{
-			uint32_t *base = gem_mmap__gtt(fd, handle, size, PROT_READ | PROT_WRITE);
+			uint32_t *base = gem_mmap__device_coherent(fd, handle, 0, size, PROT_READ | PROT_WRITE);
 			volatile uint32_t *ptr = base;
 			int x = 0;
 
@@ -270,7 +270,7 @@ igt_simple_main_args("s:", NULL, help_str, opt_handler, NULL)
 		/* mmap read */
 		gettimeofday(&start, NULL);
 		for (loop = 0; loop < 1000; loop++) {
-			uint32_t *base = gem_mmap__gtt(fd, handle, size, PROT_READ | PROT_WRITE);
+			uint32_t *base = gem_mmap__device_coherent(fd, handle, 0, size, PROT_READ | PROT_WRITE);
 			volatile uint32_t *ptr = base;
 			int x = 0;
 
@@ -355,7 +355,7 @@ igt_simple_main_args("s:", NULL, help_str, opt_handler, NULL)
 		/* mmap write */
 		gettimeofday(&start, NULL);
 		for (loop = 0; loop < 1000; loop++) {
-			uint32_t *base = gem_mmap__gtt(fd, handle, size, PROT_READ | PROT_WRITE);
+			uint32_t *base = gem_mmap__device_coherent(fd, handle, 0, size, PROT_READ | PROT_WRITE);
 			volatile uint32_t *ptr = base;
 
 			for (i = 0; i < size/sizeof(*ptr); i++)
@@ -387,7 +387,7 @@ igt_simple_main_args("s:", NULL, help_str, opt_handler, NULL)
 		/* mmap clear */
 		gettimeofday(&start, NULL);
 		for (loop = 0; loop < 1000; loop++) {
-			uint32_t *base = gem_mmap__gtt(fd, handle, size, PROT_READ | PROT_WRITE);
+			uint32_t *base = gem_mmap__device_coherent(fd, handle, 0, size, PROT_READ | PROT_WRITE);
 			memset(base, 0, size);
 			munmap(base, size);
 		}
@@ -409,7 +409,7 @@ igt_simple_main_args("s:", NULL, help_str, opt_handler, NULL)
 		}
 
 		gettimeofday(&start, NULL);{
-			uint32_t *base = gem_mmap__gtt(fd, handle, size, PROT_READ | PROT_WRITE);
+			uint32_t *base = gem_mmap__device_coherent(fd, handle, 0, size, PROT_READ | PROT_WRITE);
 			for (loop = 0; loop < 1000; loop++)
 				memset(base, 0, size);
 			munmap(base, size);
@@ -431,7 +431,7 @@ igt_simple_main_args("s:", NULL, help_str, opt_handler, NULL)
 		/* mmap read */
 		gettimeofday(&start, NULL);
 		for (loop = 0; loop < 1000; loop++) {
-			uint32_t *base = gem_mmap__gtt(fd, handle, size, PROT_READ | PROT_WRITE);
+			uint32_t *base = gem_mmap__device_coherent(fd, handle, 0, size, PROT_READ | PROT_WRITE);
 			volatile uint32_t *ptr = base;
 			int x = 0;
 
diff --git a/tests/i915/gem_largeobject.c b/tests/i915/gem_largeobject.c
index fc9296cd2..cfb289c53 100644
--- a/tests/i915/gem_largeobject.c
+++ b/tests/i915/gem_largeobject.c
@@ -64,7 +64,7 @@ test_large_object(int fd)
 	igt_assert(ioctl(fd, DRM_IOCTL_I915_GEM_CREATE, &create) == 0);
 
 	/* prefault */
-	ptr = gem_mmap__gtt(fd, create.handle, obj_size,
+	ptr = gem_mmap__device_coherent(fd, create.handle, 0, obj_size,
 			    PROT_WRITE | PROT_READ);
 	*ptr = 0;
 
diff --git a/tests/i915/gem_madvise.c b/tests/i915/gem_madvise.c
index 7162a5c3e..56ce91cb4 100644
--- a/tests/i915/gem_madvise.c
+++ b/tests/i915/gem_madvise.c
@@ -63,7 +63,7 @@ dontneed_before_mmap(void)
 
 	handle = gem_create(fd, OBJECT_SIZE);
 	gem_madvise(fd, handle, I915_MADV_DONTNEED);
-	ptr = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_READ | PROT_WRITE);
+	ptr = gem_mmap__device_coherent(fd, handle, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
 	close(fd);
 
 	signal(SIGSEGV, sigtrap);
@@ -90,7 +90,7 @@ dontneed_after_mmap(void)
 	char *ptr;
 
 	handle = gem_create(fd, OBJECT_SIZE);
-	ptr = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_READ | PROT_WRITE);
+	ptr = gem_mmap__device_coherent(fd, handle, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
 	igt_assert(ptr);
 	gem_madvise(fd, handle, I915_MADV_DONTNEED);
 	close(fd);
diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
index af87ebc38..ac697c5bc 100644
--- a/tests/i915/gem_mmap_gtt.c
+++ b/tests/i915/gem_mmap_gtt.c
@@ -61,7 +61,7 @@ mmap_bo(int fd, uint32_t handle, uint64_t size)
 {
 	void *ptr;
 
-	ptr = gem_mmap__gtt(fd, handle, size, PROT_READ | PROT_WRITE);
+	ptr = gem_mmap__device_coherent(fd, handle, 0, size, PROT_READ | PROT_WRITE);
 
 	return ptr;
 }
@@ -199,7 +199,7 @@ test_read_write(int fd, enum test_read_write order)
 
 	handle = gem_create(fd, OBJECT_SIZE);
 
-	ptr = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_READ | PROT_WRITE);
+	ptr = gem_mmap__device_coherent(fd, handle, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 
 	if (order == READ_BEFORE_WRITE) {
@@ -223,8 +223,8 @@ test_read_write2(int fd, enum test_read_write order)
 
 	handle = gem_create(fd, OBJECT_SIZE);
 
-	r = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_READ);
-	w = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_READ | PROT_WRITE);
+	r = gem_mmap__device_coherent(fd, handle, 0, OBJECT_SIZE, PROT_READ);
+	w = gem_mmap__device_coherent(fd, handle, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
 
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 
@@ -270,7 +270,7 @@ test_wc(int fd)
 	gem_close(fd, handle);
 
 	handle = gem_create(fd, 4096);
-	gtt = gem_mmap__gtt(fd, handle, 4096, PROT_READ | PROT_WRITE);
+	gtt = gem_mmap__device_coherent(fd, handle, 0, 4096, PROT_READ | PROT_WRITE);
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	gem_close(fd, handle);
 
@@ -334,7 +334,7 @@ test_pf_nonblock(int i915)
 
 	igt_set_timeout(1, "initial pagefaulting did not complete within 1s");
 
-	ptr = gem_mmap__gtt(i915, spin->handle, 4096, PROT_WRITE);
+	ptr = gem_mmap__device_coherent(i915, spin->handle, 0, 4096, PROT_WRITE);
 	ptr[256] = 0;
 	munmap(ptr, 4096);
 
@@ -525,7 +525,7 @@ test_coherency(int fd)
 
 	handle = gem_create(fd, OBJECT_SIZE);
 
-	gtt = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_READ | PROT_WRITE);
+	gtt = gem_mmap__device_coherent(fd, handle, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
 	cpu = gem_mmap__cpu(fd, handle, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
 	set_domain_gtt(fd, handle);
 
@@ -555,7 +555,7 @@ test_clflush(int fd)
 
 	handle = gem_create(fd, OBJECT_SIZE);
 
-	gtt = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_READ | PROT_WRITE);
+	gtt = gem_mmap__device_coherent(fd, handle, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
 	set_domain_gtt(fd, handle);
 
 	igt_clflush_range(gtt, OBJECT_SIZE);
@@ -596,7 +596,7 @@ test_hang(int fd)
 			handle = gem_create(fd, OBJECT_SIZE);
 			gem_set_tiling(fd, handle, I915_TILING_X + i, 2048);
 
-			gtt[i] = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_WRITE);
+			gtt[i] = gem_mmap__device_coherent(fd, handle, 0, OBJECT_SIZE, PROT_WRITE);
 			set_domain_gtt(fd, handle);
 			gem_close(fd, handle);
 		}
@@ -752,7 +752,7 @@ test_huge_bo(int fd, int huge, int tiling)
 		igt_require(__gem_set_tiling(fd, bo, tiling, pitch) == 0);
 	igt_require(known_swizzling(fd, bo));
 
-	linear_pattern = gem_mmap__gtt(fd, bo, PAGE_SIZE,
+	linear_pattern = gem_mmap__device_coherent(fd, bo, 0, PAGE_SIZE,
 				       PROT_READ | PROT_WRITE);
 	for (i = 0; i < PAGE_SIZE; i++)
 		linear_pattern[i] = i;
@@ -772,7 +772,7 @@ test_huge_bo(int fd, int huge, int tiling)
 	munmap(ptr, size);
 
 	/* Obtain mapping for the object through GTT. */
-	ptr = __gem_mmap__gtt(fd, bo, size, PROT_READ | PROT_WRITE);
+	ptr = __gem_mmap__device_coherent(fd, bo, 0, size, PROT_READ | PROT_WRITE);
 	igt_require_f(ptr, "Huge BO GTT mapping not supported.\n");
 
 	set_domain_gtt(fd, bo);
@@ -845,7 +845,7 @@ test_huge_copy(int fd, int huge, int tiling_a, int tiling_b, int ncpus)
 			igt_require(__gem_set_tiling(fd, bo[0], abs(tiling_a), min_tile_width(devid, tiling_a)) == 0);
 			valid_size = rounddown(valid_size, tile_row_size(tiling_a, min_tile_width(devid, tiling_a)));
 		}
-		a = __gem_mmap__gtt(fd, bo[0], huge_object_size, PROT_READ | PROT_WRITE);
+		a = __gem_mmap__device_coherent(fd, bo[0], 0, huge_object_size, PROT_READ | PROT_WRITE);
 		igt_require(a);
 
 		bo[1] = gem_create(fd, huge_object_size);
@@ -853,7 +853,7 @@ test_huge_copy(int fd, int huge, int tiling_a, int tiling_b, int ncpus)
 			igt_require(__gem_set_tiling(fd, bo[1], abs(tiling_b), max_tile_width(devid, tiling_b)) == 0);
 			valid_size = rounddown(valid_size, tile_row_size(tiling_b, max_tile_width(devid, tiling_b)));
 		}
-		b = __gem_mmap__gtt(fd, bo[1], huge_object_size, PROT_READ | PROT_WRITE);
+		b = __gem_mmap__device_coherent(fd, bo[1], 0, huge_object_size, PROT_READ | PROT_WRITE);
 		igt_require(b);
 
 		gem_set_domain(fd, bo[0], I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
@@ -951,7 +951,7 @@ test_write_cpu_read_gtt(int fd)
 
 	handle = gem_create(fd, OBJECT_SIZE);
 
-	dst = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_READ);
+	dst = gem_mmap__device_coherent(fd, handle, 0, OBJECT_SIZE, PROT_READ);
 
 	src = gem_mmap__cpu(fd, handle, 0, OBJECT_SIZE, PROT_WRITE);
 
diff --git a/tests/i915/gem_mmap_offset_exhaustion.c b/tests/i915/gem_mmap_offset_exhaustion.c
index f243507e5..4e245b12a 100644
--- a/tests/i915/gem_mmap_offset_exhaustion.c
+++ b/tests/i915/gem_mmap_offset_exhaustion.c
@@ -60,7 +60,7 @@ create_and_map_bo(int fd)
 
 	handle = gem_create(fd, OBJECT_SIZE);
 
-	ptr = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_READ | PROT_WRITE);
+	ptr = gem_mmap__device_coherent(fd, handle, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
 
 	/* touch it to force it into the gtt */
 	*ptr = 0;
diff --git a/tests/i915/gem_mmap_wc.c b/tests/i915/gem_mmap_wc.c
index 375a9b505..5aef7a47d 100644
--- a/tests/i915/gem_mmap_wc.c
+++ b/tests/i915/gem_mmap_wc.c
@@ -339,7 +339,7 @@ test_write_gtt_read_wc(int fd)
 
 	dst = local_gem_mmap__wc(fd, handle, 0, OBJECT_SIZE, PROT_READ);
 
-	src = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_WRITE);
+	src = gem_mmap__device_coherent(fd, handle, 0, OBJECT_SIZE, PROT_WRITE);
 
 	memset(src, 0xaa, OBJECT_SIZE);
 	igt_assert(memcmp(dst, src, OBJECT_SIZE) == 0);
diff --git a/tests/i915/gem_persistent_relocs.c b/tests/i915/gem_persistent_relocs.c
index 7c831aaaf..d559db575 100644
--- a/tests/i915/gem_persistent_relocs.c
+++ b/tests/i915/gem_persistent_relocs.c
@@ -225,7 +225,7 @@ static void do_test(int fd, bool faulting_reloc)
 		relocs_bo_handle[i] = gem_create(fd, 4096);
 		gem_write(fd, relocs_bo_handle[i], 0, reloc, sizeof(reloc));
 
-		gtt_relocs_ptr[i] = gem_mmap__gtt(fd, relocs_bo_handle[i], 4096,
+		gtt_relocs_ptr[i] = gem_mmap__device_coherent(fd, relocs_bo_handle[i], 0, 4096,
 						  PROT_READ | PROT_WRITE);
 		gem_set_domain(fd, relocs_bo_handle[i],
 			       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
diff --git a/tests/i915/gem_pread.c b/tests/i915/gem_pread.c
index 5b926ab09..f0599a96b 100644
--- a/tests/i915/gem_pread.c
+++ b/tests/i915/gem_pread.c
@@ -47,7 +47,7 @@ static void *wrap_gem_mmap__gtt(int i915, uint32_t handle,
 				uint64_t offset, uint64_t length,
 				unsigned int prot)
 {
-	return gem_mmap__gtt(i915, handle, length, prot);
+	return gem_mmap__device_coherent(i915, handle, 0, length, prot);
 }
 
 static void pread_self(int i915)
diff --git a/tests/i915/gem_pwrite.c b/tests/i915/gem_pwrite.c
index 69f823d53..2e6d61c41 100644
--- a/tests/i915/gem_pwrite.c
+++ b/tests/i915/gem_pwrite.c
@@ -47,7 +47,7 @@ static void *wrap_gem_mmap__gtt(int i915, uint32_t handle,
 				uint64_t offset, uint64_t length,
 				unsigned int prot)
 {
-	return gem_mmap__gtt(i915, handle, length, prot);
+	return gem_mmap__device_coherent(i915, handle, 0, length, prot);
 }
 
 static void pwrite_self(int i915)
diff --git a/tests/i915/gem_pwrite_pread.c b/tests/i915/gem_pwrite_pread.c
index 9287c677e..b215c66cd 100644
--- a/tests/i915/gem_pwrite_pread.c
+++ b/tests/i915/gem_pwrite_pread.c
@@ -112,8 +112,8 @@ static void as_gtt_mmap(int fd, uint32_t src, uint32_t dst, void *buf, int len,
 	uint32_t *src_ptr, *dst_ptr;
 	BUILD_EXEC;
 
-	src_ptr = gem_mmap__gtt(fd, src, OBJECT_SIZE, PROT_WRITE);
-	dst_ptr = gem_mmap__gtt(fd, dst, OBJECT_SIZE, PROT_READ);
+	src_ptr = gem_mmap__device_coherent(fd, src, 0, OBJECT_SIZE, PROT_WRITE);
+	dst_ptr = gem_mmap__device_coherent(fd, dst, 0, OBJECT_SIZE, PROT_READ);
 
 	while (loops--) {
 		gem_set_domain(fd, src,
@@ -182,8 +182,8 @@ static void test_as_gtt_mmap(int fd, uint32_t src, uint32_t dst, int len)
 	int i;
 	BUILD_EXEC;
 
-	src_ptr = gem_mmap__gtt(fd, src, OBJECT_SIZE, PROT_WRITE);
-	dst_ptr = gem_mmap__gtt(fd, dst, OBJECT_SIZE, PROT_READ);
+	src_ptr = gem_mmap__device_coherent(fd, src, 0, OBJECT_SIZE, PROT_WRITE);
+	dst_ptr = gem_mmap__device_coherent(fd, dst, 0, OBJECT_SIZE, PROT_READ);
 
 	gem_set_domain(fd, src, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	for (i = 0; i < len/4; i++)
diff --git a/tests/i915/gem_reloc_vs_gpu.c b/tests/i915/gem_reloc_vs_gpu.c
index ebc71a68c..5423664b4 100644
--- a/tests/i915/gem_reloc_vs_gpu.c
+++ b/tests/i915/gem_reloc_vs_gpu.c
@@ -161,7 +161,7 @@ static void reloc_and_emit(int fd, drm_intel_bo *target_bo, bool faulting_reloc)
 
 	handle_relocs = gem_create(fd, 4096);
 	gem_write(fd, handle_relocs, 0, reloc, sizeof(reloc));
-	gtt_relocs = gem_mmap__gtt(fd, handle_relocs, 4096,
+	gtt_relocs = gem_mmap__device_coherent(fd, handle_relocs, 0, 4096,
 				   PROT_READ | PROT_WRITE);
 
 	exec[1].handle = special_bo->handle;
diff --git a/tests/i915/gem_render_copy.c b/tests/i915/gem_render_copy.c
index 5abb20367..4c69cfcdb 100644
--- a/tests/i915/gem_render_copy.c
+++ b/tests/i915/gem_render_copy.c
@@ -161,7 +161,7 @@ static void copy_linear_to_gtt(data_t *data, struct igt_buf *buf,
 	gem_set_domain(data->drm_fd, buf->bo->handle,
 		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 
-	map = gem_mmap__gtt(data->drm_fd, buf->bo->handle,
+	map = gem_mmap__device_coherent(data->drm_fd, buf->bo->handle, 0,
 			    buf->bo->size, PROT_READ | PROT_WRITE);
 
 	memcpy(map, linear, buf->bo->size);
@@ -177,7 +177,7 @@ static void copy_gtt_to_linear(data_t *data, struct igt_buf *buf,
 	gem_set_domain(data->drm_fd, buf->bo->handle,
 		       I915_GEM_DOMAIN_GTT, 0);
 
-	map = gem_mmap__gtt(data->drm_fd, buf->bo->handle,
+	map = gem_mmap__device_coherent(data->drm_fd, buf->bo->handle, 0,
 			    buf->bo->size, PROT_READ);
 
 	igt_memcpy_from_wc(linear, map, buf->bo->size);
@@ -278,7 +278,7 @@ static void *linear_copy_aux(data_t *data, struct igt_buf *buf)
 	gem_set_domain(data->drm_fd, buf->bo->handle,
 		       I915_GEM_DOMAIN_GTT, 0);
 
-	map = gem_mmap__gtt(data->drm_fd, buf->bo->handle,
+	map = gem_mmap__device_coherent(data->drm_fd, buf->bo->handle, 0,
 			    buf->bo->size, PROT_READ);
 
 	igt_memcpy_from_wc(linear, map + buf->ccs[0].offset, aux_size);
@@ -391,7 +391,7 @@ scratch_buf_copy(data_t *data,
 
 	gem_set_domain(data->drm_fd, dst->bo->handle,
 		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
-	linear_dst = gem_mmap__gtt(data->drm_fd, dst->bo->handle,
+	linear_dst = gem_mmap__device_coherent(data->drm_fd, dst->bo->handle, 0,
 				   dst->bo->size, PROT_WRITE);
 
 	if (src->tiling == I915_TILING_Yf) {
@@ -419,7 +419,7 @@ scratch_buf_copy(data_t *data,
 		gem_set_domain(data->drm_fd, src->bo->handle,
 			       I915_GEM_DOMAIN_GTT, 0);
 
-		linear_src = gem_mmap__gtt(data->drm_fd, src->bo->handle,
+		linear_src = gem_mmap__device_coherent(data->drm_fd, src->bo->handle, 0,
 					   src->bo->size, PROT_READ);
 
 		for (int y = 0; y < h; y++) {
diff --git a/tests/i915/gem_set_tiling_vs_gtt.c b/tests/i915/gem_set_tiling_vs_gtt.c
index 618c2d05f..5e2cd2a8a 100644
--- a/tests/i915/gem_set_tiling_vs_gtt.c
+++ b/tests/i915/gem_set_tiling_vs_gtt.c
@@ -64,7 +64,7 @@ igt_simple_main
 		tile_height = 8;
 
 	handle = gem_create(fd, OBJECT_SIZE);
-	ptr = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_READ | PROT_WRITE);
+	ptr = gem_mmap__device_coherent(fd, handle, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
 
 	/* gtt coherency is done with set_domain in libdrm, don't break that */
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
diff --git a/tests/i915/gem_set_tiling_vs_pwrite.c b/tests/i915/gem_set_tiling_vs_pwrite.c
index 25a28191b..dcc9480ea 100644
--- a/tests/i915/gem_set_tiling_vs_pwrite.c
+++ b/tests/i915/gem_set_tiling_vs_pwrite.c
@@ -60,7 +60,7 @@ igt_simple_main
 		data[i] = i;
 
 	handle = gem_create(fd, OBJECT_SIZE);
-	ptr = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_READ | PROT_WRITE);
+	ptr = gem_mmap__device_coherent(fd, handle, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
 
 	gem_set_tiling(fd, handle, I915_TILING_X, TEST_STRIDE);
 
diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
index 11aa9efc1..5af812a1b 100644
--- a/tests/i915/gem_shrink.c
+++ b/tests/i915/gem_shrink.c
@@ -73,7 +73,7 @@ static void pread_(int fd, uint64_t alloc)
 static void mmap_gtt(int fd, uint64_t alloc)
 {
 	uint32_t handle = gem_create(fd, alloc);
-	uint32_t *ptr = gem_mmap__gtt(fd, handle, alloc, PROT_WRITE);
+	uint32_t *ptr = gem_mmap__device_coherent(fd, handle, 0, alloc, PROT_WRITE);
 	for (int page = 0; page < alloc>>12; page++)
 		ptr[page<<10] = 0;
 	munmap(ptr, alloc);
diff --git a/tests/i915/gem_storedw_loop.c b/tests/i915/gem_storedw_loop.c
index bbd640431..09200e83d 100644
--- a/tests/i915/gem_storedw_loop.c
+++ b/tests/i915/gem_storedw_loop.c
@@ -60,7 +60,7 @@ mmap_coherent(int fd, uint32_t handle, int size)
 		return gem_mmap__wc(fd, handle, 0, size, PROT_WRITE);
 	} else {
 		coherent_domain = I915_GEM_DOMAIN_GTT;
-		return gem_mmap__gtt(fd, handle, size, PROT_WRITE);
+		return gem_mmap__device_coherent(fd, handle, 0, size, PROT_WRITE);
 	}
 }
 
diff --git a/tests/i915/gem_streaming_writes.c b/tests/i915/gem_streaming_writes.c
index e83d69deb..cbcd25c09 100644
--- a/tests/i915/gem_streaming_writes.c
+++ b/tests/i915/gem_streaming_writes.c
@@ -86,7 +86,7 @@ static void test_streaming(int fd, int mode, int sync)
 				  PROT_READ | PROT_WRITE);
 		break;
 	case 1: /* gtt */
-		s = gem_mmap__gtt(fd, src, OBJECT_SIZE,
+		s = gem_mmap__device_coherent(fd, src, 0, OBJECT_SIZE,
 				  PROT_READ | PROT_WRITE);
 		break;
 	case 2: /* wc */
@@ -282,7 +282,7 @@ static void test_batch(int fd, int mode, int reverse)
 				     PROT_READ | PROT_WRITE);
 		break;
 	case 1: /* gtt */
-		base = gem_mmap__gtt(fd, exec[BATCH].handle, batch_size,
+		base = gem_mmap__device_coherent(fd, exec[BATCH].handle, 0, batch_size,
 				     PROT_READ | PROT_WRITE);
 		break;
 	case 2: /* wc */
diff --git a/tests/i915/gem_tiled_fence_blits.c b/tests/i915/gem_tiled_fence_blits.c
index 93c79dc28..b4c8ef862 100644
--- a/tests/i915/gem_tiled_fence_blits.c
+++ b/tests/i915/gem_tiled_fence_blits.c
@@ -57,7 +57,7 @@ static uint32_t create_bo(int fd, uint32_t start_val)
 	gem_set_tiling(fd, handle, I915_TILING_X, width * 4);
 
 	/* Fill the BO with dwords starting at start_val */
-	ptr = gem_mmap__gtt(fd, handle, bo_size, PROT_WRITE);
+	ptr = gem_mmap__device_coherent(fd, handle, 0, bo_size, PROT_WRITE);
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	for (int i = 0; i < width * height; i++)
 		ptr[i] = start_val++;
@@ -70,7 +70,7 @@ static void check_bo(int fd, uint32_t handle, uint32_t start_val)
 {
 	uint32_t *ptr;
 
-	ptr = gem_mmap__gtt(fd, handle, bo_size, PROT_READ);
+	ptr = gem_mmap__device_coherent(fd, handle, 0, bo_size, PROT_READ);
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, 0);
 	igt_memcpy_from_wc(linear, ptr, bo_size);
 	munmap(ptr, bo_size);
diff --git a/tests/i915/gem_tiled_pread_basic.c b/tests/i915/gem_tiled_pread_basic.c
index 1ac9eccdb..f68bc31a8 100644
--- a/tests/i915/gem_tiled_pread_basic.c
+++ b/tests/i915/gem_tiled_pread_basic.c
@@ -72,7 +72,7 @@ create_bo(int fd)
 	gem_set_tiling(fd, handle, I915_TILING_X, WIDTH * sizeof(uint32_t));
 
 	/* Fill the BO with dwords starting at start_val */
-	data = gem_mmap__gtt(fd, handle, sizeof(linear),
+	data = gem_mmap__device_coherent(fd, handle, 0, sizeof(linear),
 			     PROT_READ | PROT_WRITE);
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	for (i = 0; i < WIDTH*HEIGHT; i++)
diff --git a/tests/i915/gem_tiled_pread_pwrite.c b/tests/i915/gem_tiled_pread_pwrite.c
index 0988a4e86..3d0635bae 100644
--- a/tests/i915/gem_tiled_pread_pwrite.c
+++ b/tests/i915/gem_tiled_pread_pwrite.c
@@ -80,7 +80,7 @@ create_bo_and_fill(int fd)
 	gem_set_tiling(fd, handle, current_tiling_mode, WIDTH * sizeof(uint32_t));
 
 	/* Fill the BO with dwords starting at start_val */
-	data = gem_mmap__gtt(fd, handle, sizeof(linear),
+	data = gem_mmap__device_coherent(fd, handle, 0, sizeof(linear),
 			     PROT_READ | PROT_WRITE);
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	for (i = 0; i < WIDTH*HEIGHT; i++)
@@ -131,7 +131,7 @@ igt_simple_main
 		gem_write(fd, handle_target, 0, linear, sizeof(linear));
 
 		/* Check the target bo's contents. */
-		data = gem_mmap__gtt(fd, handle_target, sizeof(linear), PROT_READ);
+		data = gem_mmap__device_coherent(fd, handle_target, 0, sizeof(linear), PROT_READ);
 		n = 0;
 		for (int pfn = 0; pfn < sizeof(linear)/PAGE_SIZE; pfn++) {
 			uint32_t page[PAGE_SIZE/sizeof(uint32_t)];
diff --git a/tests/i915/gem_tiled_swapping.c b/tests/i915/gem_tiled_swapping.c
index 9e0540ba9..8a31e70d4 100644
--- a/tests/i915/gem_tiled_swapping.c
+++ b/tests/i915/gem_tiled_swapping.c
@@ -78,7 +78,7 @@ create_bo(int fd)
 	handle = gem_create(fd, LINEAR_DWORDS);
 	gem_set_tiling(fd, handle, current_tiling_mode, WIDTH * sizeof(uint32_t));
 
-	data = __gem_mmap__gtt(fd, handle, LINEAR_DWORDS, PROT_READ | PROT_WRITE);
+	data = __gem_mmap__device_coherent(fd, handle, 0, LINEAR_DWORDS, PROT_READ | PROT_WRITE);
 	if (data == NULL) {
 		gem_close(fd, handle);
 		return 0;
@@ -94,7 +94,7 @@ fill_bo(int fd, uint32_t handle)
 	uint32_t *data;
 	int i;
 
-	data = gem_mmap__gtt(fd, handle, LINEAR_DWORDS,
+	data = gem_mmap__device_coherent(fd, handle, 0, LINEAR_DWORDS,
 			     PROT_READ | PROT_WRITE);
 
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
@@ -109,7 +109,7 @@ check_bo(int fd, uint32_t handle)
 	uint32_t *data;
 	int j;
 
-	data = gem_mmap__gtt(fd, handle, LINEAR_DWORDS, PROT_READ);
+	data = gem_mmap__device_coherent(fd, handle, 0, LINEAR_DWORDS, PROT_READ);
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, 0);
 	j = rand() % (WIDTH * HEIGHT);
 	igt_assert_f(data[j] == j, "mismatch at %i: %i\n", j, data[j]);
diff --git a/tests/i915/gem_tiled_wb.c b/tests/i915/gem_tiled_wb.c
index b7f352fc7..2f48ab3e0 100644
--- a/tests/i915/gem_tiled_wb.c
+++ b/tests/i915/gem_tiled_wb.c
@@ -71,7 +71,7 @@ create_bo(int fd)
 	/* Write throught the fence to tiled the data.
 	 * We then manually detile on reading back through the mmap(wc).
 	 */
-	data = gem_mmap__gtt(fd, handle, SIZE, PROT_READ | PROT_WRITE);
+	data = gem_mmap__device_coherent(fd, handle, 0, SIZE, PROT_READ | PROT_WRITE);
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	for (i = 0; i < WIDTH*HEIGHT; i++)
 		data[i] = i;
diff --git a/tests/i915/gem_tiled_wc.c b/tests/i915/gem_tiled_wc.c
index 845ec2280..85116b252 100644
--- a/tests/i915/gem_tiled_wc.c
+++ b/tests/i915/gem_tiled_wc.c
@@ -65,7 +65,7 @@ create_bo(int fd)
 	gem_set_tiling(fd, handle, I915_TILING_X, WIDTH * sizeof(uint32_t));
 
 	/* Fill the BO with dwords starting at start_val */
-	data = gem_mmap__gtt(fd, handle, SIZE, PROT_READ | PROT_WRITE);
+	data = gem_mmap__device_coherent(fd, handle, 0, SIZE, PROT_READ | PROT_WRITE);
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	for (i = 0; i < WIDTH*HEIGHT; i++)
 		data[i] = i;
diff --git a/tests/i915/gem_tiling_max_stride.c b/tests/i915/gem_tiling_max_stride.c
index 0e99d979f..4e166311c 100644
--- a/tests/i915/gem_tiling_max_stride.c
+++ b/tests/i915/gem_tiling_max_stride.c
@@ -99,7 +99,7 @@ igt_simple_main
 
 	handle = gem_create(fd, size);
 
-	ptr = gem_mmap__gtt(fd, handle, size, PROT_READ | PROT_WRITE);
+	ptr = gem_mmap__device_coherent(fd, handle, 0, size, PROT_READ | PROT_WRITE);
 
 	test_invalid_tiling(fd, handle, 0);
 	test_invalid_tiling(fd, handle, 64);
diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index a8d3783fb..2a6a03a79 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -92,7 +92,7 @@ static bool has_gtt_mmap(int i915)
 		goto out_ptr;
 	igt_assert(handle != 0);
 
-	map = __gem_mmap__gtt(i915, handle, 4096, PROT_WRITE);
+	map = __gem_mmap__device_coherent(i915, handle, 0, 4096, PROT_WRITE);
 	if (map)
 		munmap(map, 4096);
 
@@ -654,7 +654,7 @@ static void test_process_exit(int fd, int flags)
 		handle = create_userptr_bo(fd, sizeof(linear));
 
 		if (flags & PE_GTT_MAP) {
-			uint32_t *ptr = __gem_mmap__gtt(fd, handle, sizeof(linear), PROT_READ | PROT_WRITE);
+			uint32_t *ptr = __gem_mmap__device_coherent(fd, handle, 0, sizeof(linear), PROT_READ | PROT_WRITE);
 			if (ptr)
 				*ptr = 0;
 		}
@@ -883,7 +883,7 @@ static void *umap(int fd, uint32_t handle)
 	void *ptr;
 
 	if (can_gtt_mmap) {
-		ptr = gem_mmap__gtt(fd, handle, sizeof(linear),
+		ptr = gem_mmap__device_coherent(fd, handle, 0, sizeof(linear),
 				    PROT_READ | PROT_WRITE);
 	} else {
 		uint32_t tmp = gem_create(fd, sizeof(linear));
@@ -1252,11 +1252,11 @@ static void test_readonly_mmap(int i915)
 	igt_clflush_range(pages, sz);
 	original = g_compute_checksum_for_data(G_CHECKSUM_SHA1, pages, sz);
 
-	ptr = __gem_mmap__gtt(i915, handle, sz, PROT_WRITE);
+	ptr = __gem_mmap__device_coherent(i915, handle, 0, sz, PROT_WRITE);
 	igt_assert(ptr == NULL);
 
 	/* Optional kernel support for GTT mmaps of userptr */
-	ptr = __gem_mmap__gtt(i915, handle, sz, PROT_READ);
+	ptr = __gem_mmap__device_coherent(i915, handle, 0, sz, PROT_READ);
 	gem_close(i915, handle);
 
 	if (ptr) { /* Check that a write into the GTT readonly map fails */
diff --git a/tests/i915/gen3_mixed_blits.c b/tests/i915/gen3_mixed_blits.c
index 03a289df7..553c65058 100644
--- a/tests/i915/gen3_mixed_blits.c
+++ b/tests/i915/gen3_mixed_blits.c
@@ -414,7 +414,7 @@ create_bo(int fd, uint32_t val, int tiling)
 	gem_set_tiling(fd, handle, tiling, WIDTH*4);
 
 	/* Fill the BO with dwords starting at val */
-	v = gem_mmap__gtt(fd, handle, WIDTH * HEIGHT * 4,
+	v = gem_mmap__device_coherent(fd, handle, 0, WIDTH * HEIGHT * 4,
 			  PROT_READ | PROT_WRITE);
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	for (i = 0; i < WIDTH*HEIGHT; i++)
@@ -430,7 +430,7 @@ check_bo(int fd, uint32_t handle, uint32_t val)
 	uint32_t *v;
 	int i;
 
-	v = gem_mmap__gtt(fd, handle, WIDTH * HEIGHT * 4, PROT_READ);
+	v = gem_mmap__device_coherent(fd, handle, 0, WIDTH * HEIGHT * 4, PROT_READ);
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, 0);
 	for (i = 0; i < WIDTH*HEIGHT; i++) {
 		igt_assert_f(v[i] == val,
diff --git a/tests/i915/gen3_render_mixed_blits.c b/tests/i915/gen3_render_mixed_blits.c
index 15895c217..b72dab826 100644
--- a/tests/i915/gen3_render_mixed_blits.c
+++ b/tests/i915/gen3_render_mixed_blits.c
@@ -308,7 +308,7 @@ create_bo(int fd, uint32_t val, int tiling)
 	gem_set_tiling(fd, handle, tiling, WIDTH*4);
 
 	/* Fill the BO with dwords starting at val */
-	v = gem_mmap__gtt(fd, handle, WIDTH * HEIGHT * 4,
+	v = gem_mmap__device_coherent(fd, handle, 0, WIDTH * HEIGHT * 4,
 			  PROT_READ | PROT_WRITE);
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	for (i = 0; i < WIDTH*HEIGHT; i++)
@@ -324,7 +324,7 @@ check_bo(int fd, uint32_t handle, uint32_t val)
 	uint32_t *v;
 	int i;
 
-	v = gem_mmap__gtt(fd, handle, WIDTH * HEIGHT * 4, PROT_READ);
+	v = gem_mmap__device_coherent(fd, handle, 0, WIDTH * HEIGHT * 4, PROT_READ);
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, 0);
 	for (i = 0; i < WIDTH*HEIGHT; i++) {
 		igt_assert_f(v[i] == val,
diff --git a/tests/i915/gen3_render_tiledx_blits.c b/tests/i915/gen3_render_tiledx_blits.c
index f1a17714b..613fa2509 100644
--- a/tests/i915/gen3_render_tiledx_blits.c
+++ b/tests/i915/gen3_render_tiledx_blits.c
@@ -295,7 +295,7 @@ create_bo(int fd, uint32_t val)
 	gem_set_tiling(fd, handle, I915_TILING_X, WIDTH*4);
 
 	/* Fill the BO with dwords starting at val */
-	v = gem_mmap__gtt(fd, handle, WIDTH * HEIGHT * 4,
+	v = gem_mmap__device_coherent(fd, handle, 0, WIDTH * HEIGHT * 4,
 			  PROT_READ | PROT_WRITE);
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	for (i = 0; i < WIDTH*HEIGHT; i++)
@@ -311,7 +311,7 @@ check_bo(int fd, uint32_t handle, uint32_t val)
 	uint32_t *v;
 	int i;
 
-	v = gem_mmap__gtt(fd, handle, WIDTH * HEIGHT * 4, PROT_READ);
+	v = gem_mmap__device_coherent(fd, handle, 0, WIDTH * HEIGHT * 4, PROT_READ);
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, 0);
 	for (i = 0; i < WIDTH*HEIGHT; i++) {
 		igt_assert_f(v[i] == val,
diff --git a/tests/i915/gen3_render_tiledy_blits.c b/tests/i915/gen3_render_tiledy_blits.c
index 94127b62c..742ffc93b 100644
--- a/tests/i915/gen3_render_tiledy_blits.c
+++ b/tests/i915/gen3_render_tiledy_blits.c
@@ -295,7 +295,7 @@ create_bo(int fd, uint32_t val)
 	gem_set_tiling(fd, handle, I915_TILING_Y, WIDTH*4);
 
 	/* Fill the BO with dwords starting at val */
-	v = gem_mmap__gtt(fd, handle, WIDTH * HEIGHT * 4,
+	v = gem_mmap__device_coherent(fd, handle, 0, WIDTH * HEIGHT * 4,
 			  PROT_READ | PROT_WRITE);
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	for (i = 0; i < WIDTH*HEIGHT; i++)
@@ -311,7 +311,7 @@ check_bo(int fd, uint32_t handle, uint32_t val)
 	uint32_t *v;
 	int i;
 
-	v = gem_mmap__gtt(fd, handle, WIDTH * HEIGHT * 4, PROT_READ);
+	v = gem_mmap__device_coherent(fd, handle, 0, WIDTH * HEIGHT * 4, PROT_READ);
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, 0);
 	for (i = 0; i < WIDTH*HEIGHT; i++) {
 		igt_assert_f(v[i] == val,
diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index f5f813c3d..26e1cbf8a 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1020,7 +1020,7 @@ static void gem_mmap_subtest(bool gtt_mmap)
 	handle = gem_create(drm_fd, buf_size);
 
 	if (gtt_mmap) {
-		gem_buf = gem_mmap__gtt(drm_fd, handle, buf_size,
+		gem_buf = gem_mmap__device_coherent(drm_fd, handle, 0, buf_size,
 					PROT_READ | PROT_WRITE);
 	}
 	else {
@@ -1057,7 +1057,7 @@ static void gem_mmap_subtest(bool gtt_mmap)
 	disable_all_screens_and_wait(&ms_data);
 
 	if (gtt_mmap) {
-		gem_buf = gem_mmap__gtt(drm_fd, handle, buf_size,
+		gem_buf = gem_mmap__device_coherent(drm_fd, handle, 0, buf_size,
 					PROT_READ | PROT_WRITE);
 	}
 	else {
@@ -1392,8 +1392,8 @@ static void gem_evict_pwrite_subtest(void)
 
 	for (n = 0; n < num_trash_bos; n++) {
 		trash_bos[n].handle = gem_create(drm_fd, 1024*1024);
-		trash_bos[n].ptr = gem_mmap__gtt(drm_fd, trash_bos[n].handle,
-						 1024*1024, PROT_WRITE);
+		trash_bos[n].ptr = gem_mmap__device_coherent(drm_fd, trash_bos[n].handle,
+						  0, 1024*1024, PROT_WRITE);
 		*trash_bos[n].ptr = 0;
 	}
 
@@ -1535,7 +1535,7 @@ static void fill_igt_fb(struct igt_fb *fb, uint32_t color)
 	int i;
 	uint32_t *ptr;
 
-	ptr = gem_mmap__gtt(drm_fd, fb->gem_handle, fb->size, PROT_WRITE);
+	ptr = gem_mmap__device_coherent(drm_fd, fb->gem_handle, 0, fb->size, PROT_WRITE);
 	for (i = 0; i < fb->size/sizeof(uint32_t); i++)
 		ptr[i] = color;
 	igt_assert(munmap(ptr, fb->size) == 0);
@@ -1827,8 +1827,8 @@ static void pm_test_tiling(void)
 		for (j = 0, k = 1 << off_bit;
 		     k <= gtt_obj_max_size; k <<= 1, j++) {
 			handles[j] = gem_create(drm_fd, k);
-			gem_bufs[j] = gem_mmap__gtt(drm_fd, handles[j],
-						    k, PROT_WRITE);
+			gem_bufs[j] = gem_mmap__device_coherent(drm_fd, handles[j],
+						    0, k, PROT_WRITE);
 			memset(gem_bufs[j], 0x0, k);
 		}
 
@@ -1872,7 +1872,7 @@ static void pm_test_caching(void)
 
 	handle = gem_create(drm_fd, gtt_obj_max_size);
 	default_cache_level = gem_get_caching(drm_fd, handle);
-	gem_buf = gem_mmap__gtt(drm_fd, handle, gtt_obj_max_size, PROT_WRITE);
+	gem_buf = gem_mmap__device_coherent(drm_fd, handle, 0, gtt_obj_max_size, PROT_WRITE);
 
 	for (i = 0; i < ARRAY_SIZE(cache_levels); i++) {
 		igt_assert(wait_for_suspended());
@@ -1918,7 +1918,7 @@ static void fences_subtest(bool dpms)
 	gem_get_tiling(drm_fd, params.fb.gem_handle, &tiling, &swizzle);
 	igt_assert(tiling);
 
-	buf_ptr = gem_mmap__gtt(drm_fd, params.fb.gem_handle, params.fb.size,
+	buf_ptr = gem_mmap__device_coherent(drm_fd, params.fb.gem_handle, 0, params.fb.size,
 				PROT_WRITE | PROT_READ);
 	for (i = 0; i < params.fb.size/sizeof(uint32_t); i++)
 		buf_ptr[i] = i;
diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
index 5a2ec7669..8f0dc37ea 100644
--- a/tests/i915/i915_suspend.c
+++ b/tests/i915/i915_suspend.c
@@ -57,12 +57,12 @@ test_fence_restore(int fd, bool tiled2untiled, bool hibernate)
 	handle_tiled = gem_create(fd, OBJECT_SIZE);
 
 	/* Access the buffer objects in the order we want to have the laid out. */
-	ptr1 = gem_mmap__gtt(fd, handle1, OBJECT_SIZE, PROT_READ | PROT_WRITE);
+	ptr1 = gem_mmap__device_coherent(fd, handle1, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
 	gem_set_domain(fd, handle1, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	for (i = 0; i < OBJECT_SIZE/sizeof(uint32_t); i++)
 		ptr1[i] = i;
 
-	ptr_tiled = gem_mmap__gtt(fd, handle_tiled, OBJECT_SIZE,
+	ptr_tiled = gem_mmap__device_coherent(fd, handle_tiled, 0, OBJECT_SIZE,
 				  PROT_READ | PROT_WRITE);
 	gem_set_domain(fd, handle_tiled,
 		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
@@ -71,7 +71,7 @@ test_fence_restore(int fd, bool tiled2untiled, bool hibernate)
 	for (i = 0; i < OBJECT_SIZE/sizeof(uint32_t); i++)
 		ptr_tiled[i] = i;
 
-	ptr2 = gem_mmap__gtt(fd, handle2, OBJECT_SIZE, PROT_READ | PROT_WRITE);
+	ptr2 = gem_mmap__device_coherent(fd, handle2, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
 	gem_set_domain(fd, handle2, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	for (i = 0; i < OBJECT_SIZE/sizeof(uint32_t); i++)
 		ptr2[i] = i;
diff --git a/tests/kms_available_modes_crc.c b/tests/kms_available_modes_crc.c
index d1b7b5170..b7ae0a60f 100644
--- a/tests/kms_available_modes_crc.c
+++ b/tests/kms_available_modes_crc.c
@@ -61,7 +61,7 @@ static void do_write(int fd, int handle, void *buf, int size)
 {	void *screenbuf;
 
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
-	screenbuf = gem_mmap__gtt(fd, handle, size, PROT_WRITE);
+	screenbuf = gem_mmap__device_coherent(fd, handle, 0, size, PROT_WRITE);
 	memcpy(screenbuf, buf, size);
 	gem_munmap(screenbuf, size);
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
diff --git a/tests/kms_fence_pin_leak.c b/tests/kms_fence_pin_leak.c
index 8c9e10a56..627f8d89d 100644
--- a/tests/kms_fence_pin_leak.c
+++ b/tests/kms_fence_pin_leak.c
@@ -89,7 +89,7 @@ static void touch_fences(data_t *data)
 		uint32_t handle = data->bos[i]->handle;
 		void *ptr;
 
-		ptr = gem_mmap__gtt(data->drm_fd, handle, 4096, PROT_WRITE);
+		ptr = gem_mmap__device_coherent(data->drm_fd, handle, 0, 4096, PROT_WRITE);
 		gem_set_domain(data->drm_fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 		memset(ptr, 0, 4);
 		munmap(ptr, 4096);
diff --git a/tests/kms_psr.c b/tests/kms_psr.c
index d9be87d92..fe6801bab 100644
--- a/tests/kms_psr.c
+++ b/tests/kms_psr.c
@@ -270,7 +270,7 @@ static void run_test(data_t *data)
 		expected = "GREEN";
 		break;
 	case MMAP_GTT:
-		ptr = gem_mmap__gtt(data->drm_fd, handle, data->mod_size,
+		ptr = gem_mmap__device_coherent(data->drm_fd, handle, 0, data->mod_size,
 				    PROT_WRITE);
 		gem_set_domain(data->drm_fd, handle,
 			       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
diff --git a/tests/prime_mmap.c b/tests/prime_mmap.c
index fc9857844..b8c2400b0 100644
--- a/tests/prime_mmap.c
+++ b/tests/prime_mmap.c
@@ -86,7 +86,7 @@ test_correct(void)
 	igt_assert(errno == 0);
 
 	/* Check correctness vs GEM_MMAP_GTT */
-	ptr1 = gem_mmap__gtt(fd, handle, BO_SIZE, PROT_READ);
+	ptr1 = gem_mmap__device_coherent(fd, handle, 0, BO_SIZE, PROT_READ);
 	ptr2 = mmap(NULL, BO_SIZE, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
 	igt_assert(ptr1 != MAP_FAILED);
 	igt_assert(ptr2 != MAP_FAILED);
diff --git a/tests/prime_mmap_coherency.c b/tests/prime_mmap_coherency.c
index 39538767c..32d78ee1a 100644
--- a/tests/prime_mmap_coherency.c
+++ b/tests/prime_mmap_coherency.c
@@ -69,7 +69,7 @@ static int test_read_flush(void)
 
 	/* STEP #3: write 0x11 into BO 1. */
 	bo_2 = drm_intel_bo_alloc(bufmgr, "BO 2", width * height * 4, 4096);
-	ptr_gtt = gem_mmap__gtt(fd, bo_2->handle, width * height, PROT_READ | PROT_WRITE);
+	ptr_gtt = gem_mmap__device_coherent(fd, bo_2->handle, 0, width * height, PROT_READ | PROT_WRITE);
 	gem_set_domain(fd, bo_2->handle,
 		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	memset(ptr_gtt, 0xc5, width * height);
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 6595818c1..6096a35a6 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -145,7 +145,7 @@ static void test_fence_mmap(int i915, int vgem)
 	igt_fork(child, 1) {
 		close(master[0]);
 		close(slave[1]);
-		ptr = gem_mmap__gtt(i915, handle, 4096*1024, PROT_READ);
+		ptr = gem_mmap__device_coherent(i915, handle, 0, 4096*1024, PROT_READ);
 
 		gem_set_domain(i915, handle, I915_GEM_DOMAIN_GTT, 0);
 		for (i = 0; i < 1024; i++)
@@ -225,7 +225,7 @@ static void test_gtt(int vgem, int i915)
 	handle = prime_fd_to_handle(i915, dmabuf);
 	close(dmabuf);
 
-	ptr = gem_mmap__gtt(i915, handle, scratch.size, PROT_WRITE);
+	ptr = gem_mmap__device_coherent(i915, handle, 0, scratch.size, PROT_WRITE);
 	for (i = 0; i < 1024; i++)
 		ptr[1024*i] = i;
 	munmap(ptr, scratch.size);
@@ -237,7 +237,7 @@ static void test_gtt(int vgem, int i915)
 	}
 	munmap(ptr, scratch.size);
 
-	ptr = gem_mmap__gtt(i915, handle, scratch.size, PROT_READ);
+	ptr = gem_mmap__device_coherent(i915, handle, 0, scratch.size, PROT_READ);
 	for (i = 0; i < 1024; i++)
 		igt_assert_eq(ptr[1024*i], ~i);
 	munmap(ptr, scratch.size);
@@ -312,7 +312,7 @@ static void test_gtt_interleaved(int vgem, int i915)
 	 * not know about the shortcommings...
 	 */
 	ptr = vgem_mmap(vgem, &scratch, PROT_WRITE);
-	gtt = gem_mmap__gtt(i915, handle, scratch.size, PROT_WRITE);
+	gtt = gem_mmap__device_coherent(i915, handle, 0, scratch.size, PROT_WRITE);
 	for (i = 0; i < 1024; i++) {
 		gtt[1024*i] = i;
 		/* The read from WC should act as a flush for the GTT wcb */
diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
index 5cc3d37a7..09942935b 100644
--- a/tools/intel_dp_compliance.c
+++ b/tools/intel_dp_compliance.c
@@ -451,8 +451,8 @@ static int setup_framebuffers(struct connector *dp_conn)
 	igt_assert(dp_conn->fb);
 
 	/* Map the mapping of GEM object into the virtual address space */
-	dp_conn->pixmap = gem_mmap__gtt(drm_fd,
-					dp_conn->fb_video_pattern.gem_handle,
+	dp_conn->pixmap = gem_mmap__device_coherent(drm_fd,
+					dp_conn->fb_video_pattern.gem_handle, 0,
 					dp_conn->fb_video_pattern.size,
 					PROT_READ | PROT_WRITE);
 	if (dp_conn->pixmap == NULL)
@@ -481,8 +481,8 @@ static int setup_failsafe_framebuffer(struct connector *dp_conn)
 	igt_assert(dp_conn->failsafe_fb);
 
 	/* Map the mapping of GEM object into the virtual address space */
-	dp_conn->failsafe_pixmap = gem_mmap__gtt(drm_fd,
-						 dp_conn->fb_failsafe_pattern.gem_handle,
+	dp_conn->failsafe_pixmap = gem_mmap__device_coherent(drm_fd,
+						 dp_conn->fb_failsafe_pattern.gem_handle, 0,
 						 dp_conn->fb_failsafe_pattern.size,
 						 PROT_READ | PROT_WRITE);
 	if (dp_conn->failsafe_pixmap == NULL)
@@ -518,8 +518,8 @@ static int setup_video_pattern_framebuffer(struct connector *dp_conn)
 	igt_assert(dp_conn->test_pattern.fb);
 
 	/* Map the mapping of GEM object into the virtual address space */
-	dp_conn->test_pattern.pixmap = gem_mmap__gtt(drm_fd,
-						     dp_conn->test_pattern.fb_pattern.gem_handle,
+	dp_conn->test_pattern.pixmap = gem_mmap__device_coherent(drm_fd,
+						     dp_conn->test_pattern.fb_pattern.gem_handle, 0,
 						     dp_conn->test_pattern.fb_pattern.size,
 						     PROT_READ | PROT_WRITE);
 	if (dp_conn->test_pattern.pixmap == NULL)
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
