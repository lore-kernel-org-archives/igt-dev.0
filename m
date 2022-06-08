Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5615D10E16B
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jun 2022 14:56:16 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
To: igt-dev <igt-dev@lists.freedesktop.org>
Date: Wed,  8 Jun 2022 20:27:36 +0530
Message-Id: <20220608145736.31640-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] prime_busy: Replace open-coded spinner
 with igt_spin_t
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

Now that we can create arbitrary dependencies with the igt_spin_t dummy
load, we can replace the custom spinner in prime_busy.

v2:
  put_ahnd() used [Zbigniew]

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/prime_busy.c | 138 ++++++++-------------------------------------
 1 file changed, 25 insertions(+), 113 deletions(-)

diff --git a/tests/prime_busy.c b/tests/prime_busy.c
index 0b657b67a03e..343020f13ea3 100644
--- a/tests/prime_busy.c
+++ b/tests/prime_busy.c
@@ -42,112 +42,36 @@ static bool prime_busy(struct pollfd *pfd, bool excl)
 
 static void busy(int fd, const intel_ctx_t *ctx, unsigned ring, unsigned flags)
 {
-	const int gen = intel_gen(intel_get_drm_devid(fd));
-	const uint32_t _bbe = MI_BATCH_BUFFER_END;
-	struct drm_i915_gem_exec_object2 obj[2];
-	struct pollfd pfd[2];
 #define SCRATCH 0
 #define BATCH 1
-	struct drm_i915_gem_relocation_entry store[1024+1];
-	struct drm_i915_gem_execbuffer2 execbuf;
-	unsigned size = ALIGN(ARRAY_SIZE(store)*16 + 4, 4096);
-	struct timespec tv;
-	uint32_t *batch, *bbe;
-	int i, count, timeout;
+	uint32_t handle = gem_create(fd, 4096);
+	struct pollfd pfd[2] = {};
+	uint64_t ahnd;
+	igt_spin_t *spin;
+	int timeout;
 
 	gem_quiescent_gpu(fd);
 
-	memset(&execbuf, 0, sizeof(execbuf));
-	execbuf.buffers_ptr = to_user_pointer(obj);
-	execbuf.buffer_count = 2;
-	execbuf.flags = ring;
-	if (gen < 6)
-		execbuf.flags |= I915_EXEC_SECURE;
-	execbuf.rsvd1 = ctx->id;
-
-	memset(obj, 0, sizeof(obj));
-	obj[SCRATCH].handle = gem_create(fd, 4096);
-
-	obj[BATCH].handle = gem_create(fd, size);
-	obj[BATCH].offset = 1 << 20;
-	gem_write(fd, obj[BATCH].handle, 0, &_bbe, sizeof(_bbe));
-	igt_require(__gem_execbuf(fd, &execbuf) == 0); /* prebind the buffers */
-
-	obj[BATCH].relocs_ptr = to_user_pointer(store);
-	obj[BATCH].relocation_count = ARRAY_SIZE(store);
-	memset(store, 0, sizeof(store));
+	ahnd = get_reloc_ahnd(fd, ctx->id);
+	spin = igt_spin_new(fd,
+			    .ahnd = ahnd,
+			    .ctx = ctx, .engine = ring,
+			    .dependency = handle,
+			    .flags = (flags & HANG ? IGT_SPIN_NO_PREEMPTION : 0));
+	igt_spin_end(spin);
+	gem_sync(fd, spin->handle);
 
 	if (flags & BEFORE) {
-		memset(pfd, 0, sizeof(pfd));
-		pfd[SCRATCH].fd = prime_handle_to_fd(fd, obj[SCRATCH].handle);
-		pfd[BATCH].fd = prime_handle_to_fd(fd, obj[BATCH].handle);
+		pfd[SCRATCH].fd = prime_handle_to_fd(fd, spin->obj[SCRATCH].handle);
+		pfd[BATCH].fd = prime_handle_to_fd(fd, spin->obj[BATCH].handle);
 	}
 
-	batch = gem_mmap__device_coherent(fd, obj[BATCH].handle, 0, size, PROT_WRITE);
-	gem_set_domain(fd, obj[BATCH].handle,
-			I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
-
-	i = 0;
-	for (count = 0; count < 1024; count++) {
-		uint64_t offset;
-
-		store[count].target_handle = obj[SCRATCH].handle;
-		store[count].presumed_offset = obj[SCRATCH].offset;
-		store[count].offset = sizeof(uint32_t) * (i + 1);
-		store[count].delta = sizeof(uint32_t) * count;
-		store[count].read_domains = I915_GEM_DOMAIN_RENDER;
-		store[count].write_domain = I915_GEM_DOMAIN_RENDER;
-
-		offset = store[count].presumed_offset + store[count].delta;
-
-		batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
-		if (gen >= 8) {
-			batch[++i] = offset;
-			batch[++i] = offset >> 32;
-		} else if (gen >= 4) {
-			batch[++i] = 0;
-			batch[++i] = offset;
-			store[count].offset += sizeof(uint32_t);
-		} else {
-			batch[i]--;
-			batch[++i] = offset;
-		}
-		batch[++i] = count;
-		i++;
-	}
-
-	bbe = &batch[i];
-	store[count].target_handle = obj[BATCH].handle; /* recurse */
-	store[count].presumed_offset = obj[BATCH].offset;
-	store[count].offset = sizeof(uint32_t) * (i + 1);
-	store[count].delta = 0;
-	store[count].read_domains = I915_GEM_DOMAIN_COMMAND;
-	store[count].write_domain = 0;
-	batch[i] = MI_BATCH_BUFFER_START;
-	if (gen >= 8) {
-		batch[i] |= 1 << 8 | 1;
-		batch[++i] = obj[BATCH].offset;
-		batch[++i] = obj[BATCH].offset >> 32;
-	} else if (gen >= 6) {
-		batch[i] |= 1 << 8;
-		batch[++i] = obj[BATCH].offset;
-	} else {
-		batch[i] |= 2 << 6;
-		batch[++i] = obj[BATCH].offset;
-		if (gen < 4) {
-			batch[i] |= 1;
-			store[count].delta = 1;
-		}
-	}
-	i++;
-
-	igt_assert(i < size/sizeof(*batch));
-	igt_require(__gem_execbuf(fd, &execbuf) == 0);
+	igt_spin_reset(spin);
+	gem_execbuf(fd, &spin->execbuf);
 
 	if (flags & AFTER) {
-		memset(pfd, 0, sizeof(pfd));
-		pfd[SCRATCH].fd = prime_handle_to_fd(fd, obj[SCRATCH].handle);
-		pfd[BATCH].fd = prime_handle_to_fd(fd, obj[BATCH].handle);
+		pfd[SCRATCH].fd = prime_handle_to_fd(fd, spin->obj[SCRATCH].handle);
+		pfd[BATCH].fd = prime_handle_to_fd(fd, spin->obj[BATCH].handle);
 	}
 
 	igt_assert(prime_busy(&pfd[SCRATCH], false));
@@ -158,8 +82,7 @@ static void busy(int fd, const intel_ctx_t *ctx, unsigned ring, unsigned flags)
 
 	timeout = 120;
 	if ((flags & HANG) == 0) {
-		*bbe = MI_BATCH_BUFFER_END;
-		__sync_synchronize();
+		igt_spin_end(spin);
 		timeout = 1;
 	}
 
@@ -168,23 +91,18 @@ static void busy(int fd, const intel_ctx_t *ctx, unsigned ring, unsigned flags)
 		pfd[BATCH].events = POLLOUT;
 		igt_assert(poll(pfd, 1, timeout * 1000) == 1);
 	} else {
-		memset(&tv, 0, sizeof(tv));
+		struct timespec tv = {};
 		while (prime_busy(&pfd[BATCH], true))
 			igt_assert(igt_seconds_elapsed(&tv) < timeout);
 	}
 	igt_assert(!prime_busy(&pfd[SCRATCH], true));
 
-	munmap(batch, size);
-	batch = gem_mmap__device_coherent(fd, obj[SCRATCH].handle, 0, 4096, PROT_READ);
-	for (i = 0; i < 1024; i++)
-		igt_assert_eq_u32(batch[i], i);
-	munmap(batch, 4096);
-
-	gem_close(fd, obj[BATCH].handle);
-	gem_close(fd, obj[SCRATCH].handle);
+	igt_spin_free(fd, spin);
+	gem_close(fd, handle);
 
 	close(pfd[BATCH].fd);
 	close(pfd[SCRATCH].fd);
+	put_ahnd(ahnd);
 }
 
 static void test_mode(int fd, const intel_ctx_t *ctx, unsigned int flags)
@@ -198,12 +116,6 @@ static void test_mode(int fd, const intel_ctx_t *ctx, unsigned int flags)
 		hang = igt_allow_hang(fd, ctx->id, 0);
 
 	for_each_ctx_engine(fd, ctx, e) {
-		if (!gem_class_can_store_dword(fd, e->class))
-			continue;
-
-		if (!gem_class_has_mutable_submission(fd, e->class))
-			continue;
-
 		igt_dynamic_f("%s", e->name)
 			busy(fd, ctx, e->flags, flags);
 	}
@@ -220,7 +132,7 @@ igt_main
 	int fd = -1;
 
 	igt_fixture {
-		fd = drm_open_driver_master(DRIVER_INTEL);
+		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 		ctx = intel_ctx_create_all_physical(fd);
 	}
-- 
2.20.1
