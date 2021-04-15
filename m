Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4299C6EAC9
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 19:13:10 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 e8-20020a17090a7288b029014e51f5a6baso7952941pjg.2
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 12:13:10 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 15 Apr 2021 14:11:22 -0500
Message-Id: <20210415191145.2137858-52-jason@jlekstrand.net>
In-Reply-To: <20210415191145.2137858-1-jason@jlekstrand.net>
References: <20210415191145.2137858-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 51/74] tests/i915/gem_exec_gttfill: Convert
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

---
 tests/i915/gem_exec_gttfill.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
index c0e27c9b..d375d671 100644
--- a/tests/i915/gem_exec_gttfill.c
+++ b/tests/i915/gem_exec_gttfill.c
@@ -105,7 +105,7 @@ static void submit(int fd, int gen,
 	gem_sync(fd, obj.handle);
 }
 
-static void fillgtt(int fd, unsigned ring, int timeout)
+static void fillgtt(int fd, const intel_ctx_t *ctx, unsigned ring, int timeout)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -125,7 +125,7 @@ static void fillgtt(int fd, unsigned ring, int timeout)
 	if (ring == ALL_ENGINES) {
 		struct intel_execution_engine2 *e;
 
-		__for_each_physical_engine(fd, e) {
+		for_each_ctx_engine(fd, ctx, e) {
 			if (!gem_class_can_store_dword(fd, e->class))
 				continue;
 
@@ -154,6 +154,7 @@ static void fillgtt(int fd, unsigned ring, int timeout)
 	execbuf.buffer_count = 1;
 	if (gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
+	execbuf.rsvd1 = ctx->id;
 
 	batches = calloc(count, sizeof(*batches));
 	igt_assert(batches);
@@ -208,29 +209,31 @@ static void fillgtt(int fd, unsigned ring, int timeout)
 igt_main
 {
 	const struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx = NULL;
 	int i915 = -1;
 
 	igt_fixture {
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(i915);
+		ctx = intel_ctx_create_all_physical(i915);
 		igt_fork_hang_detector(i915);
 	}
 
 	igt_subtest("basic") /* just enough to run a single pass */
-		fillgtt(i915, ALL_ENGINES, 1);
+		fillgtt(i915, ctx, ALL_ENGINES, 1);
 
 	igt_subtest_with_dynamic("engines") {
-		__for_each_physical_engine(i915, e) {
+		for_each_ctx_engine(i915, ctx, e) {
 			if (!gem_class_can_store_dword(i915, e->class))
 				continue;
 
 			igt_dynamic_f("%s", e->name)
-				fillgtt(i915, e->flags, 20);
+				fillgtt(i915, ctx, e->flags, 20);
 		}
 	}
 
 	igt_subtest("all")
-		fillgtt(i915, ALL_ENGINES, 20);
+		fillgtt(i915, ctx, ALL_ENGINES, 20);
 
 	igt_fixture {
 		igt_stop_hang_detector();
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
