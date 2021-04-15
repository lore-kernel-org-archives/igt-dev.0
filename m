Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278FB6EAD0
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 19:13:23 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id z22so7504734plo.3
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 12:13:23 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 15 Apr 2021 14:11:31 -0500
Message-Id: <20210415191145.2137858-61-jason@jlekstrand.net>
In-Reply-To: <20210415191145.2137858-1-jason@jlekstrand.net>
References: <20210415191145.2137858-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 60/74] tests/i915/gem_cs_tlb: Convert to
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

---
 tests/i915/gem_cs_tlb.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_cs_tlb.c b/tests/i915/gem_cs_tlb.c
index f72879c3..d87aa829 100644
--- a/tests/i915/gem_cs_tlb.c
+++ b/tests/i915/gem_cs_tlb.c
@@ -90,7 +90,8 @@ mmap_coherent(int fd, uint32_t handle, int size)
 	return ptr;
 }
 
-static void run_on_ring(int fd, unsigned ring_id, const char *ring_name)
+static void run_on_ring(int fd, const intel_ctx_t *ctx,
+			unsigned ring_id, const char *ring_name)
 {
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 execobj;
@@ -116,6 +117,7 @@ static void run_on_ring(int fd, unsigned ring_id, const char *ring_name)
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(&execobj);
 	execbuf.buffer_count = 1;
+	execbuf.rsvd1 = ctx->id;
 	execbuf.flags = ring_id;
 
 	/* Execute once to allocate a gtt-offset */
@@ -143,17 +145,19 @@ static void run_on_ring(int fd, unsigned ring_id, const char *ring_name)
 igt_main
 {
 	const struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx = NULL;
 	int fd = -1;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
+		ctx = intel_ctx_create_all_physical(fd);
 	}
 
 	igt_subtest_with_dynamic("engines") {
-		__for_each_physical_engine(fd, e) {
+		for_each_ctx_engine(fd, ctx, e) {
 			igt_dynamic_f("%s", e->name)
-				run_on_ring(fd, e->flags, e->name);
+				run_on_ring(fd, ctx, e->flags, e->name);
 		}
 	}
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
