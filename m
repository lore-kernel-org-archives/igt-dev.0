Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C46A6EC75
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 21:50:31 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id h20so25876698plr.4
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 14:50:31 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Apr 2021 16:48:19 -0500
Message-Id: <20210423214853.876911-56-jason@jlekstrand.net>
In-Reply-To: <20210423214853.876911-1-jason@jlekstrand.net>
References: <20210423214853.876911-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 55/89] tests/i915/gem_exec_create: Convert
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
index 6529da7e..7434b3e4 100644
--- a/tests/i915/gem_exec_create.c
+++ b/tests/i915/gem_exec_create.c
@@ -60,16 +60,21 @@ static void all(int fd, unsigned flags, int timeout, int ncpus)
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
@@ -84,6 +89,7 @@ static void all(int fd, unsigned flags, int timeout, int ncpus)
 	execbuf.buffer_count = 1;
 	execbuf.flags |= I915_EXEC_HANDLE_LUT;
 	execbuf.flags |= I915_EXEC_NO_RELOC;
+	execbuf.rsvd1 = ctx->id;
 	if (__gem_execbuf(fd, &execbuf)) {
 		execbuf.flags = 0;
 		gem_execbuf(fd, &execbuf);
@@ -131,6 +137,7 @@ static void all(int fd, unsigned flags, int timeout, int ncpus)
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
