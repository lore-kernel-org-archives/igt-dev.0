Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA206EC7B
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:33:08 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 mp5-20020a17090b1905b029016dd057935fso634819pjb.5
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:33:08 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:32:18 -0500
Message-Id: <20210609043259.102581-3-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 52/93] tests/i915/gem_exec_params: Convert
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
 tests/i915/gem_exec_params.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
index 6ab1ab11..729d38a4 100644
--- a/tests/i915/gem_exec_params.c
+++ b/tests/i915/gem_exec_params.c
@@ -299,8 +299,10 @@ static void test_larger_than_life_batch(int fd)
 {
 	const struct intel_execution_engine2 *e;
 	uint64_t size = 1ULL << 32; /* batch_len is __u32 as per the ABI */
+	const intel_ctx_t *ctx = intel_ctx_create_all_physical(fd);
 	struct drm_i915_gem_exec_object2 exec = {
 		.handle = batch_create_size(fd, size),
+		.rsvd1 = ctx->id,
 	};
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&exec),
@@ -316,7 +318,7 @@ static void test_larger_than_life_batch(int fd)
 	igt_require(size < gem_aperture_size(fd));
 	intel_require_memory(2, size, CHECK_RAM); /* batch + shadow */
 
-	__for_each_physical_engine(fd, e) {
+	for_each_ctx_engine(fd, ctx, e) {
 		/* Keep the batch_len implicit [0] */
 		execbuf.flags = e->flags;
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
