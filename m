Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442FB89F6F
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 16:38:07 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id e22so9076566pgv.10
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 09:38:07 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 14 Jun 2021 11:36:53 -0500
Message-Id: <20210614163704.365989-39-jason@jlekstrand.net>
In-Reply-To: <20210614163704.365989-1-jason@jlekstrand.net>
References: <20210614163704.365989-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 38/77] tests/i915/gem_exec_create: Convert
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
index 8556cb213..612eb032f 100644
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
