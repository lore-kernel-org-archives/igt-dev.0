Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7586EC7E
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:33:11 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id v13so11883443ple.9
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:33:11 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:32:20 -0500
Message-Id: <20210609043259.102581-5-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 54/93] tests/i915/gem_exec_capture: Convert
 to intel_ctx_t
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/gem_exec_capture.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index a6b3d987..edad62a9 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -61,7 +61,8 @@ static void check_error_state(int dir, struct drm_i915_gem_exec_object2 *obj)
 	igt_assert(found);
 }
 
-static void __capture1(int fd, int dir, unsigned ring, uint32_t target)
+static void __capture1(int fd, int dir, const intel_ctx_t *ctx,
+		       unsigned ring, uint32_t target)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 obj[4];
@@ -148,6 +149,7 @@ static void __capture1(int fd, int dir, unsigned ring, uint32_t target)
 	execbuf.flags = ring;
 	if (gen > 3 && gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
+	execbuf.rsvd1 = ctx->id;
 
 	igt_assert(!READ_ONCE(*seqno));
 	gem_execbuf(fd, &execbuf);
@@ -168,12 +170,12 @@ static void __capture1(int fd, int dir, unsigned ring, uint32_t target)
 	gem_close(fd, obj[SCRATCH].handle);
 }
 
-static void capture(int fd, int dir, unsigned ring)
+static void capture(int fd, int dir, const intel_ctx_t *ctx, unsigned ring)
 {
 	uint32_t handle;
 
 	handle = gem_create(fd, 4096);
-	__capture1(fd, dir, ring, handle);
+	__capture1(fd, dir, ctx, ring, handle);
 	gem_close(fd, handle);
 }
 
@@ -496,7 +498,8 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
 	free(offsets);
 }
 
-static void prioinv(int fd, int dir, unsigned ring, const char *name)
+static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
+		    unsigned ring, const char *name)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_exec_object2 obj = {
@@ -506,6 +509,7 @@ static void prioinv(int fd, int dir, unsigned ring, const char *name)
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
 		.flags = ring,
+		.rsvd1 = ctx->id,
 	};
 	int64_t timeout = NSEC_PER_SEC; /* 1s, feeling generous, blame debug */
 	uint64_t ram, gtt, size = 4 << 20;
@@ -573,7 +577,7 @@ static void userptr(int fd, int dir)
 	igt_assert(posix_memalign(&ptr, 4096, 4096) == 0);
 	igt_require(__gem_userptr(fd, ptr, 4096, 0, 0, &handle) == 0);
 
-	__capture1(fd, dir, 0, handle);
+	__capture1(fd, dir, intel_ctx_0(fd), 0, handle);
 
 	gem_close(fd, handle);
 	free(ptr);
@@ -596,14 +600,15 @@ static size_t safer_strlen(const char *s)
 	return s ? strlen(s) : 0;
 }
 
-#define test_each_engine(T, i915, e) \
-	igt_subtest_with_dynamic(T) __for_each_physical_engine(i915, e) \
+#define test_each_engine(T, i915, ctx, e) \
+	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
 		for_each_if(gem_class_can_store_dword(i915, (e)->class)) \
 			igt_dynamic_f("%s", (e)->name)
 
 igt_main
 {
 	const struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx = NULL;
 	igt_hang_t hang;
 	int fd = -1;
 	int dir = -1;
@@ -620,15 +625,16 @@ igt_main
 		igt_require_gem(fd);
 		gem_require_mmap_wc(fd);
 		igt_require(has_capture(fd));
-		igt_allow_hang(fd, 0, HANG_ALLOW_CAPTURE);
+		ctx = intel_ctx_create_all_physical(fd);
+		igt_allow_hang(fd, ctx->id, HANG_ALLOW_CAPTURE);
 
 		dir = igt_sysfs_open(fd);
 		igt_require(igt_sysfs_set(dir, "error", "Begone!"));
 		igt_require(safer_strlen(igt_sysfs_get(dir, "error")) > 0);
 	}
 
-	test_each_engine("capture", fd, e)
-		capture(fd, dir, e->flags);
+	test_each_engine("capture", fd, ctx, e)
+		capture(fd, dir, ctx, e->flags);
 
 	igt_subtest_f("many-4K-zero") {
 		igt_require(gem_can_store_dword(fd, 0));
@@ -662,8 +668,8 @@ igt_main
 		userptr(fd, dir);
 	}
 
-	test_each_engine("pi", fd, e)
-		prioinv(fd, dir, e->flags, e->name);
+	test_each_engine("pi", fd, ctx, e)
+		prioinv(fd, dir, ctx, e->flags, e->name);
 
 	igt_fixture {
 		close(dir);
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
