Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDEB6E988
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 19:15:45 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id bb20so180186pjb.3
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 12:15:45 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 17 Jun 2021 14:15:01 -0500
Message-Id: <20210617191516.577394-15-jason@jlekstrand.net>
In-Reply-To: <20210617191256.577244-1-jason@jlekstrand.net>
References: <20210617191256.577244-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 64/79] tests/i915/gem_workarounds: Convert
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
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_workarounds.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/i915/gem_workarounds.c b/tests/i915/gem_workarounds.c
index 9cdc24374..e240901c4 100644
--- a/tests/i915/gem_workarounds.c
+++ b/tests/i915/gem_workarounds.c
@@ -85,7 +85,7 @@ static bool write_only(const uint32_t addr)
 
 #define MI_STORE_REGISTER_MEM (0x24 << 23)
 
-static int workaround_fail_count(int i915, uint32_t ctx)
+static int workaround_fail_count(int i915, const intel_ctx_t *ctx)
 {
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry *reloc;
@@ -131,12 +131,12 @@ static int workaround_fail_count(int i915, uint32_t ctx)
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(obj);
 	execbuf.buffer_count = 2;
-	execbuf.rsvd1 = ctx;
+	execbuf.rsvd1 = ctx->id;
 	gem_execbuf(i915, &execbuf);
 
 	gem_set_domain(i915, obj[0].handle, I915_GEM_DOMAIN_CPU, 0);
 
-	spin = igt_spin_new(i915, .ctx_id = ctx, .flags = IGT_SPIN_POLL_RUN);
+	spin = igt_spin_new(i915, .ctx = ctx, .flags = IGT_SPIN_POLL_RUN);
 	igt_spin_busywait_until_started(spin);
 
 	fw = igt_open_forcewake_handle(i915);
@@ -184,14 +184,15 @@ static int workaround_fail_count(int i915, uint32_t ctx)
 #define FD 0x2
 static void check_workarounds(int fd, enum operation op, unsigned int flags)
 {
-	uint32_t ctx = 0;
+	const intel_ctx_t *ctx;
 
 	if (flags & FD)
 		fd = gem_reopen_driver(fd);
 
+	ctx = intel_ctx_0(fd);
 	if (flags & CONTEXT) {
 		gem_require_contexts(fd);
-		ctx = gem_context_create(fd);
+		ctx = intel_ctx_create(fd, NULL);
 	}
 
 	igt_assert_eq(workaround_fail_count(fd, ctx), 0);
@@ -221,7 +222,7 @@ static void check_workarounds(int fd, enum operation op, unsigned int flags)
 	igt_assert_eq(workaround_fail_count(fd, ctx), 0);
 
 	if (flags & CONTEXT)
-		gem_context_destroy(fd, ctx);
+		intel_ctx_destroy(fd, ctx);
 	if (flags & FD)
 		close(fd);
 }
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
