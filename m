Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3976EB7D
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jun 2021 09:38:46 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id c5so20773965wrq.9
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 02:38:46 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue,  8 Jun 2021 11:38:29 +0200
Message-Id: <20210608093832.21267-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20210608093832.21267-1-daniel.vetter@ffwll.ch>
References: <20210608093832.21267-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/7] Revert "i915/gem_exec_reloc: Exercise
 concurrent relocations"
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

This reverts commit c1f30ee09ac2e7eb3e8e90245239731a169a6050.

This validates gpu relocations, which we're about to delete.

Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 tests/i915/gem_exec_reloc.c | 215 ------------------------------------
 1 file changed, 215 deletions(-)

diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index 3b200f557b2c..c3f42aff9c9a 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -796,216 +796,6 @@ static void basic_softpin(int fd)
 	gem_close(fd, obj[1].handle);
 }
 
-#define CONCURRENT 1024
-
-static uint64_t concurrent_relocs(int i915, int idx, int count)
-{
-	struct drm_i915_gem_relocation_entry *reloc;
-	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
-	unsigned long sz;
-	int offset;
-
-	sz = count * sizeof(*reloc);
-	sz = ALIGN(sz, 4096);
-
-	reloc = mmap(0, sz, PROT_WRITE, MAP_PRIVATE | MAP_ANON, -1, 0);
-	igt_assert(reloc != MAP_FAILED);
-
-	offset = 1;
-	if (gen >= 4 && gen < 8)
-		offset += 1;
-
-	for (int n = 0; n < count; n++) {
-		reloc[n].presumed_offset = ~0ull;
-		reloc[n].offset = (4 * n + offset) * sizeof(uint32_t);
-		reloc[n].delta = (count * idx + n) * sizeof(uint32_t);
-	}
-	mprotect(reloc, sz, PROT_READ);
-
-	return to_user_pointer(reloc);
-}
-
-static int flags_to_index(const struct intel_execution_engine2 *e)
-{
-	return (e->flags & 63) | ((e->flags >> 13) & 3) << 4;
-}
-
-static void xchg_u32(void *array, unsigned i, unsigned j)
-{
-	uint32_t *u32 = array;
-	uint32_t tmp = u32[i];
-	u32[i] = u32[j];
-	u32[j] = tmp;
-}
-
-static void concurrent_child(int i915,
-			     const struct intel_execution_engine2 *e,
-			     uint32_t *common, int num_common,
-			     int in, int out)
-{
-	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
-	int idx = flags_to_index(e);
-	uint64_t relocs = concurrent_relocs(i915, idx, CONCURRENT);
-	struct drm_i915_gem_exec_object2 obj[num_common + 2];
-	struct drm_i915_gem_execbuffer2 execbuf = {
-		.buffers_ptr = to_user_pointer(obj),
-		.buffer_count = ARRAY_SIZE(obj),
-		.flags = e->flags | I915_EXEC_HANDLE_LUT | (gen < 6 ? I915_EXEC_SECURE : 0),
-	};
-	uint32_t *batch = &obj[num_common + 1].handle;
-	unsigned long count = 0;
-	uint32_t *x;
-	int err = 0;
-
-	memset(obj, 0, sizeof(obj));
-	obj[0].handle = gem_create(i915, 64 * CONCURRENT * 4);
-
-	igt_permute_array(common, num_common, xchg_u32);
-	for (int n = 1; n <= num_common; n++) {
-		obj[n].handle = common[n - 1];
-		obj[n].relocation_count = CONCURRENT;
-		obj[n].relocs_ptr = relocs;
-	}
-
-	obj[num_common + 1].relocation_count = CONCURRENT;
-	obj[num_common + 1].relocs_ptr = relocs;
-
-	x = gem_mmap__device_coherent(i915, obj[0].handle,
-				      0, 64 * CONCURRENT * 4, PROT_READ);
-	x += idx * CONCURRENT;
-
-	do {
-		read(in, batch, sizeof(*batch));
-		if (!*batch)
-			break;
-
-		gem_execbuf(i915, &execbuf);
-		gem_sync(i915, *batch); /* write hazards lies */
-
-		for (int n = 0; n < CONCURRENT; n++) {
-			if (x[n] != *batch) {
-				igt_warn("%s: Invalid store [bad reloc] found:%08x at index %d, expected %08x\n",
-					 e->name, x[n], n, *batch);
-				err = -EINVAL;
-				break;
-			}
-		}
-
-		write(out, &err, sizeof(err));
-		count++;
-	} while (err == 0);
-
-	gem_close(i915, obj[0].handle);
-	igt_info("%s: completed %ld cycles\n", e->name, count);
-}
-
-static uint32_t create_concurrent_batch(int i915, unsigned int count)
-{
-	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
-	size_t sz = ALIGN(4 * (1 + 4 * count), 4096);
-	uint32_t handle = gem_create(i915, sz);
-	uint32_t *map, *cs;
-	uint32_t cmd;
-
-	cmd = MI_STORE_DWORD_IMM;
-	if (gen < 6)
-		cmd |= 1 << 22;
-	if (gen < 4)
-		cmd--;
-
-	cs = map = gem_mmap__device_coherent(i915, handle, 0, sz, PROT_WRITE);
-	for (int n = 0; n < count; n++) {
-		*cs++ = cmd;
-		*cs++ = 0;
-		if (gen >= 4) {
-			*cs++ = 0;
-			*cs++ = handle;
-		} else {
-			*cs++ = handle;
-			*cs++ = 0;
-		}
-	}
-	*cs++ = MI_BATCH_BUFFER_END;
-	munmap(map, sz);
-
-	return handle;
-}
-
-static void concurrent(int i915, int num_common)
-{
-	const struct intel_execution_engine2 *e;
-	int in[2], out[2];
-	uint32_t common[16];
-	int result = -1;
-	uint32_t batch;
-	int nchild;
-
-	/*
-	 * Exercise a few clients all trying to submit the same batch
-	 * buffer writing to different locations. This exercises that the
-	 * relocation handling within the gem_execbuf() ioctl is atomic
-	 * with respect to the batch -- that is this call to execbuf only
-	 * uses the relocations as supplied with the ioctl and does not
-	 * use any of the conflicting relocations from the concurrent
-	 * submissions.
-	 */
-
-	pipe(in);
-	pipe(out);
-
-	for (int n = 0; n < num_common; n++)
-		common[n] = gem_create(i915, 4 * 4 * CONCURRENT);
-
-	nchild = 0;
-	__for_each_physical_engine(i915, e) {
-		if (!gem_class_can_store_dword(i915, e->class))
-			continue;
-
-		igt_fork(child, 1)
-			concurrent_child(i915, e,
-					 common, num_common,
-					 in[0], out[1]);
-
-		if (++nchild == 64)
-			break;
-	}
-	close(in[0]);
-	close(out[1]);
-	igt_require(nchild > 1);
-
-	igt_until_timeout(5) {
-		batch = create_concurrent_batch(i915, CONCURRENT);
-
-		for (int n = 0; n < nchild; n++)
-			write(in[1], &batch, sizeof(batch));
-
-		for (int n = 0; n < nchild; n++) {
-			result = -1;
-			read(out[0], &result, sizeof(result));
-			if (result < 0)
-				break;
-		}
-
-		gem_close(i915, batch);
-		if (result < 0)
-			break;
-	}
-
-	batch = 0;
-	for (int n = 0; n < nchild; n++)
-		write(in[1], &batch, sizeof(batch));
-
-	close(in[1]);
-	close(out[0]);
-
-	igt_waitchildren();
-
-	for (int n = 0; n < num_common; n++)
-		gem_close(i915, common[n]);
-
-	igt_assert_eq(result, 0);
-}
-
 static uint32_t
 pin_scanout(igt_display_t *dpy, igt_output_t *output, struct igt_fb *fb)
 {
@@ -1270,11 +1060,6 @@ igt_main
 		}
 	}
 
-	igt_subtest("basic-concurrent0")
-		concurrent(fd, 0);
-	igt_subtest("basic-concurrent16")
-		concurrent(fd, 16);
-
 	igt_subtest("invalid-domains")
 		invalid_domains(fd);
 
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
