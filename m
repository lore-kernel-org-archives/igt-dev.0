Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26EC89F55
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 16:38:02 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id u18so6245001plc.0
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 09:38:02 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 14 Jun 2021 11:36:50 -0500
Message-Id: <20210614163704.365989-36-jason@jlekstrand.net>
In-Reply-To: <20210614163704.365989-1-jason@jlekstrand.net>
References: <20210614163704.365989-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 35/77] tests/i915/gem_exec_params: Convert
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
index 6ab1ab110..729d38a43 100644
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
