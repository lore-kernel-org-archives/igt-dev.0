Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5FA10E190
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Dec 2022 09:25:27 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Dec 2022 10:25:10 +0100
Message-Id: <20221205092511.16008-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221205092511.16008-1-zbigniew.kempczynski@intel.com>
References: <20221205092511.16008-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/gem_softpin: Add flink reopen
 eviction subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

For set of objects exported via global namespacing verify objects
can be randomly opened, binded, executed and closed. Random open
always returns same handle id so vma rebind is necessary. Exercise
this when objects are opened in more opened drm fds.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_softpin.c | 164 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
index a85a366408..beca9c220e 100644
--- a/tests/i915/gem_softpin.c
+++ b/tests/i915/gem_softpin.c
@@ -1149,6 +1149,154 @@ static void evict_single_offset(int fd, const intel_ctx_t *ctx, int timeout)
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
 }
 
+struct thread {
+	pthread_t thread;
+	pthread_mutex_t *mutex;
+	pthread_cond_t *cond;
+	uint32_t *scratch;
+	const intel_ctx_t *ctx;
+	unsigned int engine;
+	int fd, *go;
+};
+
+#define NUMOBJ 16
+#define NUMTHREADS 4
+
+static FILE *out;
+static void *thread(void *data)
+{
+	struct thread *t = data;
+	struct drm_i915_gem_exec_object2 obj[2];
+	struct drm_i915_gem_execbuffer2 execbuf;
+	const intel_ctx_t *ctx = NULL;
+	uint64_t offset_obj, offset_bb;
+	uint32_t batch = MI_BATCH_BUFFER_END;
+	int fd, succeeded = 0;
+
+	fd = gem_reopen_driver(t->fd);
+	ctx = intel_ctx_create(fd, &t->ctx->cfg);
+	offset_obj = gem_detect_safe_start_offset(fd);
+	offset_bb = ALIGN(offset_obj + 4096, gem_detect_safe_alignment(fd));
+	igt_debug("reopened fd: %d, ctx: %u, object offset: %llx, bb offset: %llx\n",
+		  fd, ctx->id, (long long) offset_obj, (long long) offset_bb);
+
+	pthread_mutex_lock(t->mutex);
+	while (*t->go == 0)
+		pthread_cond_wait(t->cond, t->mutex);
+	pthread_mutex_unlock(t->mutex);
+
+	memset(obj, 0, sizeof(obj));
+	obj[0].flags = EXEC_OBJECT_WRITE;
+	obj[1].handle = gem_create(fd, 4096);
+	gem_write(fd, obj[1].handle, 0, &batch, sizeof(batch));
+
+	memset(&execbuf, 0, sizeof(execbuf));
+	execbuf.buffers_ptr = to_user_pointer(obj);
+	execbuf.buffer_count = 2;
+	execbuf.flags = t->engine;
+	execbuf.flags |= I915_EXEC_HANDLE_LUT;
+	execbuf.flags |= I915_EXEC_NO_RELOC;
+	execbuf.rsvd1 = ctx->id;
+
+	igt_until_timeout(1) {
+		unsigned int x = rand() % NUMOBJ;
+		int ret;
+
+		obj[0].handle = gem_open(fd, t->scratch[x]);
+
+		obj[0].offset = offset_obj;
+		obj[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE |
+				EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		obj[1].offset = offset_bb;
+		obj[1].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+
+		ret = __gem_execbuf(fd, &execbuf);
+		if (ret)
+			igt_debug("<fd: %d, ctx: %u, x: %2u, engine: %d> "
+				  "object handle: %2u (flink: %2u), bb handle: %2u, "
+				  "offsets: %llx, %llx [ret: %d, succeeded: %d]\n",
+				  fd, ctx->id, x, t->engine,
+				  obj[0].handle, t->scratch[x], obj[1].handle,
+				  (long long) obj[0].offset,
+				  (long long) obj[1].offset, ret, succeeded);
+		else
+			succeeded++;
+
+		igt_assert(!ret);
+		gem_close(fd, obj[0].handle);
+	}
+
+	intel_ctx_destroy(fd, ctx);
+	gem_close(fd, obj[1].handle);
+	close(fd);
+
+	return NULL;
+}
+
+static void evict_flink(int fd, const intel_ctx_t *ctx,
+			const struct intel_execution_engine2 *engine)
+{
+	unsigned int engines[I915_EXEC_RING_MASK + 1], nengine;
+	uint32_t scratch[NUMOBJ], handle[NUMOBJ];
+	struct thread *threads;
+	pthread_mutex_t mutex;
+	pthread_cond_t cond;
+	int go;
+	int i;
+
+	igt_require(igt_allow_unlimited_files());
+
+	nengine = 0;
+	if (!engine) {
+		struct intel_execution_engine2 *e;
+
+		for_each_ctx_engine(fd, ctx, e)
+			engines[nengine++] = e->flags;
+	} else {
+		engines[nengine++] = engine->flags;
+	}
+	igt_require(nengine);
+
+	for (i = 0; i < NUMOBJ; i++) {
+		handle[i] = gem_create(fd, 4096);
+		scratch[i] = gem_flink(fd, handle[i]);
+	}
+
+	threads = calloc(NUMTHREADS, sizeof(struct thread));
+	igt_assert(threads);
+
+	intel_detect_and_clear_missed_interrupts(fd);
+	pthread_mutex_init(&mutex, 0);
+	pthread_cond_init(&cond, 0);
+	go = 0;
+
+	for (i = 0; i < NUMTHREADS; i++) {
+		threads[i].fd = fd;
+		threads[i].ctx = ctx;
+		threads[i].engine = engines[i % nengine];
+		threads[i].scratch = scratch;
+		threads[i].mutex = &mutex;
+		threads[i].cond = &cond;
+		threads[i].go = &go;
+
+		pthread_create(&threads[i].thread, 0, thread, &threads[i]);
+	}
+
+	pthread_mutex_lock(&mutex);
+	go = NUMTHREADS;
+	pthread_cond_broadcast(&cond);
+	pthread_mutex_unlock(&mutex);
+
+	for (i = 0; i < NUMTHREADS; i++)
+		pthread_join(threads[i].thread, NULL);
+
+	for (i = 0; i < NUMOBJ; i++)
+		gem_close(fd, handle[i]);
+
+	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
+	free(threads);
+}
+
 static void make_batch(int i915, uint32_t handle, uint64_t size)
 {
 	uint32_t *bb = gem_mmap__device_coherent(i915, handle, 0, size, PROT_WRITE);
@@ -1250,6 +1398,8 @@ igt_main
 		igt_require(gem_can_store_dword(fd, 0));
 
 		ctx = intel_ctx_create_all_physical(fd);
+
+		out = fopen("/tmp/log2", "w");
 	}
 
 	igt_describe("Check that invalid inputs are handled correctly.");
@@ -1307,6 +1457,20 @@ igt_main
 		igt_describe("Use same offset for all engines and for different handles.");
 		igt_subtest("evict-single-offset")
 			evict_single_offset(fd, ctx, 20);
+
+		igt_describe("Check eviction of vma on importing flink in reopened drm fds");
+		igt_subtest_with_dynamic("evict-flink") {
+			for_each_ctx_engine(fd, ctx, e) {
+				igt_dynamic(e->name)
+					evict_flink(fd, ctx, e);
+			}
+		}
+
+		igt_describe("Check eviction of vma on importing flink in reopened drm fds"
+			     " executing on randomly selected engines");
+		igt_subtest("evict-flink-all") {
+			evict_flink(fd, ctx, NULL);
+		}
 	}
 
 	igt_describe("Check start offset and alignment detection.");
-- 
2.34.1
