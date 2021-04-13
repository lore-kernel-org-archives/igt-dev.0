Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F8D6E1BC
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 03:54:14 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id p16so3529498plf.12
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 20:54:14 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Apr 2021 22:52:49 -0500
Message-Id: <20210413035350.261794-14-jason@jlekstrand.net>
In-Reply-To: <20210413035350.261794-1-jason@jlekstrand.net>
References: <20210413035350.261794-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 13/74] tests/i915/gem_exec_basic: Convert to
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

This acts as a template for the rest of this patch series.  The rough
idea is that we create a new context if the HW supports contexts and
otherwise we use intel_ctx_0().  Once we have an intel_ctx_t, we can
iterate over all of the engines in it in a consistent way.
---
 tests/i915/gem_exec_basic.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
index 31f6a234..e21f9ff1 100644
--- a/tests/i915/gem_exec_basic.c
+++ b/tests/i915/gem_exec_basic.c
@@ -41,10 +41,13 @@ static uint32_t batch_create(int fd)
 igt_main
 {
 	const struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx = NULL;
 	int fd = -1;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
+		ctx = intel_ctx_create_all_physical(fd);
+
 		/* igt_require_gem(fd); // test is mandatory */
 		igt_fork_hang_detector(fd);
 	}
@@ -54,12 +57,13 @@ igt_main
 			.handle = batch_create(fd),
 		};
 
-		__for_each_physical_engine(fd, e) {
+		for_each_ctx_engine(fd, ctx, e) {
 			igt_dynamic_f("%s", e->name) {
 				struct drm_i915_gem_execbuffer2 execbuf = {
 					.buffers_ptr = to_user_pointer(&exec),
 					.buffer_count = 1,
 					.flags = e->flags,
+					.rsvd1 = ctx->id,
 				};
 
 				gem_execbuf(fd, &execbuf);
@@ -72,6 +76,7 @@ igt_main
 
 	igt_fixture {
 		igt_stop_hang_detector();
+		intel_ctx_destroy(fd, ctx);
 		close(fd);
 	}
 }
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
