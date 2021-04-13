Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313B26E21D
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 03:55:06 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id o123so10565592pfb.4
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 20:55:06 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Apr 2021 22:53:25 -0500
Message-Id: <20210413035350.261794-50-jason@jlekstrand.net>
In-Reply-To: <20210413035350.261794-1-jason@jlekstrand.net>
References: <20210413035350.261794-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 49/74] tests/i915/gem_shrink: Convert to
 intel_ctx_t
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

Only one subtest actually needs to iterate over engines.
---
 tests/i915/gem_shrink.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
index 2269da49..51f27bf0 100644
--- a/tests/i915/gem_shrink.c
+++ b/tests/i915/gem_shrink.c
@@ -37,8 +37,6 @@
 #define MADV_FREE 8
 #endif
 
-static unsigned int engines[I915_EXEC_RING_MASK + 1], nengine;
-
 static void get_pages(int fd, uint64_t alloc)
 {
 	uint32_t handle = gem_create(fd, alloc);
@@ -163,8 +161,10 @@ static void execbufN(int fd, uint64_t alloc)
 static void execbufX(int fd, uint64_t alloc)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	const struct intel_execution_engine2 *e;
 	struct drm_i915_gem_exec_object2 *obj;
 	struct drm_i915_gem_execbuffer2 execbuf;
+	const intel_ctx_t *ctx;
 	int count = alloc >> 20;
 	uint64_t obj_size;
 
@@ -174,23 +174,32 @@ static void execbufX(int fd, uint64_t alloc)
 	obj[count].handle = gem_create(fd, 4096);
 	gem_write(fd, obj[count].handle, 0, &bbe, sizeof(bbe));
 
-	for (int i = 1; i <= count; i++) {
-		int j = count - i;
+	ctx = intel_ctx_create_all_physical(fd);
 
-		obj[j+1].flags = 0;
+	for (int i = 1; i <= count;) {
+		for_each_ctx_engine(fd, ctx, e) {
+			int j = count - i;
 
-		obj[j].handle = gem_create(fd, 1 << 20);
-		obj[j].flags = EXEC_OBJECT_WRITE;
+			obj[j+1].flags = 0;
 
-		execbuf.buffers_ptr = to_user_pointer(&obj[j]);
-		execbuf.buffer_count = i + 1;
-		execbuf.flags = engines[j % nengine];
-		gem_execbuf(fd, &execbuf);
+			obj[j].handle = gem_create(fd, 1 << 20);
+			obj[j].flags = EXEC_OBJECT_WRITE;
+
+			execbuf.buffers_ptr = to_user_pointer(&obj[j]);
+			execbuf.buffer_count = i + 1;
+			execbuf.flags = e->flags;
+			execbuf.rsvd1 = ctx->id;
+			gem_execbuf(fd, &execbuf);
+
+			i++;
+		}
 	}
 
 	for (int i = 0; i <= count; i++)
 		gem_madvise(fd, obj[i].handle, I915_MADV_DONTNEED);
 	munmap(obj, obj_size);
+
+	intel_ctx_destroy(fd, ctx);
 }
 
 static void hang(int fd, uint64_t alloc)
@@ -428,7 +437,6 @@ igt_main
 	igt_fixture {
 		const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 		uint64_t mem_size = intel_get_total_ram_mb();
-		const struct intel_execution_engine2 *e;
 		int fd;
 
 		fd = drm_open_driver(DRIVER_INTEL);
@@ -450,11 +458,6 @@ igt_main
 		intel_require_memory(num_processes, alloc_size,
 				     CHECK_SWAP | CHECK_RAM);
 
-		nengine = 0;
-		__for_each_physical_engine(fd, e)
-			engines[nengine++] = e->flags;
-		igt_require(nengine);
-
 		close(fd);
 	}
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
