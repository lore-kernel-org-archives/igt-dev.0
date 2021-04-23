Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88AAD6EC75
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 21:52:58 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id p16so21918583plf.12
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 14:52:58 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Apr 2021 16:52:42 -0500
Message-Id: <20210423215252.877174-1-jason@jlekstrand.net>
In-Reply-To: <20210423214853.876911-1-jason@jlekstrand.net>
References: <20210423214853.876911-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 79/89] tests/i915/gem_workarounds: Convert
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
 tests/i915/gem_workarounds.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/i915/gem_workarounds.c b/tests/i915/gem_workarounds.c
index 0daf0cd6..6e662ec2 100644
--- a/tests/i915/gem_workarounds.c
+++ b/tests/i915/gem_workarounds.c
@@ -84,7 +84,7 @@ static bool write_only(const uint32_t addr)
 
 #define MI_STORE_REGISTER_MEM (0x24 << 23)
 
-static int workaround_fail_count(int i915, uint32_t ctx)
+static int workaround_fail_count(int i915, const intel_ctx_t *ctx)
 {
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry *reloc;
@@ -130,12 +130,12 @@ static int workaround_fail_count(int i915, uint32_t ctx)
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
@@ -183,14 +183,15 @@ static int workaround_fail_count(int i915, uint32_t ctx)
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
@@ -220,7 +221,7 @@ static void check_workarounds(int fd, enum operation op, unsigned int flags)
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
