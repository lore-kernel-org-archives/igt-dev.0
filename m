Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A396E19A
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 03:55:22 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id u11so4117390pjr.0
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 20:55:22 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Apr 2021 22:53:36 -0500
Message-Id: <20210413035350.261794-61-jason@jlekstrand.net>
In-Reply-To: <20210413035350.261794-1-jason@jlekstrand.net>
References: <20210413035350.261794-1-jason@jlekstrand.net>
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
