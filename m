Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E696E03E
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 10:53:59 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 10 Aug 2021 12:52:51 +0200
Message-Id: <20210810105323.31375-23-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210810105323.31375-1-zbigniew.kempczynski@intel.com>
References: <20210810105323.31375-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 22/54] tests/gem_exec_parallel: Adopt to
 use alloctor
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

For newer gens we're not able to rely on relocations. Adopt to use
offsets acquired from the allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_parallel.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_parallel.c
index 5920ac730..36bf5f742 100644
--- a/tests/i915/gem_exec_parallel.c
+++ b/tests/i915/gem_exec_parallel.c
@@ -49,6 +49,7 @@ static inline uint32_t hash32(uint32_t val)
 #define USERPTR 0x4
 
 #define NUMOBJ 16
+#define NUMTHREADS 1024
 
 struct thread {
 	pthread_t thread;
@@ -56,11 +57,13 @@ struct thread {
 	pthread_cond_t *cond;
 	unsigned flags;
 	uint32_t *scratch;
+	uint64_t *offsets;
 	unsigned id;
 	const intel_ctx_t *ctx;
 	unsigned engine;
 	uint32_t used;
 	int fd, gen, *go;
+	uint64_t ahnd;
 };
 
 static void *thread(void *data)
@@ -70,6 +73,7 @@ static void *thread(void *data)
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
 	const intel_ctx_t *tmp_ctx = NULL;
+	uint64_t offset;
 	uint32_t batch[16];
 	uint16_t used;
 	int fd, i;
@@ -112,7 +116,7 @@ static void *thread(void *data)
 	reloc.delta = 4*t->id;
 	obj[1].handle = gem_create(fd, 4096);
 	obj[1].relocs_ptr = to_user_pointer(&reloc);
-	obj[1].relocation_count = 1;
+	obj[1].relocation_count = !t->ahnd ? 1 : 0;
 	gem_write(fd, obj[1].handle, 0, batch, sizeof(batch));
 
 	memset(&execbuf, 0, sizeof(execbuf));
@@ -140,6 +144,18 @@ static void *thread(void *data)
 		if (t->flags & FDS)
 			obj[0].handle = gem_open(fd, obj[0].handle);
 
+		if (t->ahnd) {
+			offset = t->offsets[x];
+			i = 0;
+			batch[++i] = offset + 4*t->id;
+			batch[++i] = offset >> 32;
+			obj[0].offset = offset;
+			obj[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+			obj[1].offset = get_offset(t->ahnd, obj[1].handle, 4096, 0);
+			obj[1].flags |= EXEC_OBJECT_PINNED;
+			gem_write(fd, obj[1].handle, 0, batch, sizeof(batch));
+		}
+
 		gem_execbuf(fd, &execbuf);
 
 		if (t->flags & FDS)
@@ -158,7 +174,7 @@ static void *thread(void *data)
 
 static void check_bo(int fd, uint32_t *data, uint32_t handle, int pass, struct thread *threads)
 {
-	uint32_t x = hash32(handle * pass) % 1024;
+	uint32_t x = hash32(handle * pass) % NUMTHREADS;
 	uint32_t result;
 
 	if (!(threads[x].used & (1 << pass)))
@@ -213,6 +229,7 @@ static void all(int fd, const intel_ctx_t *ctx,
 	void *arg[NUMOBJ];
 	int go;
 	int i;
+	uint64_t ahnd = get_reloc_ahnd(fd, 0), offsets[NUMOBJ];
 
 	if (flags & CONTEXTS)
 		gem_require_contexts(fd);
@@ -238,9 +255,11 @@ static void all(int fd, const intel_ctx_t *ctx,
 		scratch[i] = handle[i] = handle_create(fd, flags, &arg[i]);
 		if (flags & FDS)
 			scratch[i] = gem_flink(fd, handle[i]);
+		offsets[i] = get_offset(ahnd, scratch[i], 4096, 0);
+
 	}
 
-	threads = calloc(1024, sizeof(struct thread));
+	threads = calloc(NUMTHREADS, sizeof(struct thread));
 	igt_assert(threads);
 
 	intel_detect_and_clear_missed_interrupts(fd);
@@ -248,7 +267,7 @@ static void all(int fd, const intel_ctx_t *ctx,
 	pthread_cond_init(&cond, 0);
 	go = 0;
 
-	for (i = 0; i < 1024; i++) {
+	for (i = 0; i < NUMTHREADS; i++) {
 		threads[i].id = i;
 		threads[i].fd = fd;
 		threads[i].gen = gen;
@@ -256,19 +275,21 @@ static void all(int fd, const intel_ctx_t *ctx,
 		threads[i].engine = engines[i % nengine];
 		threads[i].flags = flags;
 		threads[i].scratch = scratch;
+		threads[i].offsets = ahnd ? offsets : NULL;
 		threads[i].mutex = &mutex;
 		threads[i].cond = &cond;
 		threads[i].go = &go;
+		threads[i].ahnd = ahnd;
 
 		pthread_create(&threads[i].thread, 0, thread, &threads[i]);
 	}
 
 	pthread_mutex_lock(&mutex);
-	go = 1024;
+	go = NUMTHREADS;
 	pthread_cond_broadcast(&cond);
 	pthread_mutex_unlock(&mutex);
 
-	for (i = 0; i < 1024; i++)
+	for (i = 0; i < NUMTHREADS; i++)
 		pthread_join(threads[i].thread, NULL);
 
 	for (i = 0; i < NUMOBJ; i++) {
-- 
2.26.0
