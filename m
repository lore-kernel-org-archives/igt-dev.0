Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89B66EC80
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:33:12 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so648742pjs.2
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:33:12 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:32:21 -0500
Message-Id: <20210609043259.102581-6-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 55/93] tests/i915/gem_exec_create: Convert
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
 tests/i915/gem_exec_create.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_create.c b/tests/i915/gem_exec_create.c
index 8556cb21..612eb032 100644
--- a/tests/i915/gem_exec_create.c
+++ b/tests/i915/gem_exec_create.c
@@ -61,16 +61,21 @@ static void all(int fd, unsigned flags, int timeout, int ncpus)
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj;
 	unsigned engines[I915_EXEC_RING_MASK + 1], nengine;
+	const intel_ctx_t *ctx;
 
 	nengine = 0;
 	if (flags & ENGINES) { /* Modern API to iterate over *all* engines */
 		const struct intel_execution_engine2 *e;
 
-		__for_each_physical_engine(fd, e)
+		ctx = intel_ctx_create_all_physical(fd);
+
+		for_each_ctx_engine(fd, ctx, e)
 			engines[nengine++] = e->flags;
 
 		/* Note: modifies engine map on context 0 */
 	} else {
+		ctx = intel_ctx_0(fd);
+
 		for_each_physical_ring(e, fd)
 			engines[nengine++] = eb_ring(e);
 	}
@@ -85,6 +90,7 @@ static void all(int fd, unsigned flags, int timeout, int ncpus)
 	execbuf.buffer_count = 1;
 	execbuf.flags |= I915_EXEC_HANDLE_LUT;
 	execbuf.flags |= I915_EXEC_NO_RELOC;
+	execbuf.rsvd1 = ctx->id;
 	if (__gem_execbuf(fd, &execbuf)) {
 		execbuf.flags = 0;
 		gem_execbuf(fd, &execbuf);
@@ -132,6 +138,7 @@ static void all(int fd, unsigned flags, int timeout, int ncpus)
 	}
 	igt_waitchildren();
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
+	intel_ctx_destroy(fd, ctx);
 }
 
 igt_main
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
