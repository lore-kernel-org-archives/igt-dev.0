Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3486EC82
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:31:00 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 27so18392945pgy.3
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:31:00 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:30:00 -0500
Message-Id: <20210609043035.102359-15-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 14/93] tests/i915/gem_exec_basic: Convert to
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/gem_exec_basic.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
index 872b1d3b..ae7c275d 100644
--- a/tests/i915/gem_exec_basic.c
+++ b/tests/i915/gem_exec_basic.c
@@ -45,10 +45,13 @@ igt_main
 	struct drm_i915_query_memory_regions *query_info;
 	struct igt_collection *regions, *set;
 	uint32_t batch_size;
+	const intel_ctx_t *ctx = NULL;
 	int fd = -1;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
+		ctx = intel_ctx_create_all_physical(fd);
+
 		/* igt_require_gem(fd); // test is mandatory */
 		igt_fork_hang_detector(fd);
 
@@ -70,12 +73,13 @@ igt_main
 			memset(&exec, 0, sizeof(exec));
 			exec.handle = batch_create(fd, batch_size, region);
 
-			__for_each_physical_engine(fd, e) {
+			for_each_ctx_engine(fd, ctx, e) {
 				igt_dynamic_f("%s-%s", e->name, sub_name) {
 					struct drm_i915_gem_execbuffer2 execbuf = {
 						.buffers_ptr = to_user_pointer(&exec),
 						.buffer_count = 1,
 						.flags = e->flags,
+						.rsvd1 = ctx->id,
 					};
 
 					gem_execbuf(fd, &execbuf);
@@ -91,6 +95,7 @@ igt_main
 		free(query_info);
 		igt_collection_destroy(set);
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
