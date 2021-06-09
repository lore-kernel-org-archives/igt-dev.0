Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4CDF6EC7B
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:31:25 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id t9so18380116pgn.4
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:31:25 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:30:20 -0500
Message-Id: <20210609043035.102359-35-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 34/93] tests/prime_busy: Convert to
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/prime_busy.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/tests/prime_busy.c b/tests/prime_busy.c
index 8bf50eaf..e2684837 100644
--- a/tests/prime_busy.c
+++ b/tests/prime_busy.c
@@ -40,7 +40,7 @@ static bool prime_busy(struct pollfd *pfd, bool excl)
 #define HANG 0x4
 #define POLL 0x8
 
-static void busy(int fd, unsigned ring, unsigned flags)
+static void busy(int fd, const intel_ctx_t *ctx, unsigned ring, unsigned flags)
 {
 	const int gen = intel_gen(intel_get_drm_devid(fd));
 	const uint32_t _bbe = MI_BATCH_BUFFER_END;
@@ -63,6 +63,7 @@ static void busy(int fd, unsigned ring, unsigned flags)
 	execbuf.flags = ring;
 	if (gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
+	execbuf.rsvd1 = ctx->id;
 
 	memset(obj, 0, sizeof(obj));
 	obj[SCRATCH].handle = gem_create(fd, 4096);
@@ -186,7 +187,7 @@ static void busy(int fd, unsigned ring, unsigned flags)
 	close(pfd[SCRATCH].fd);
 }
 
-static void test_mode(int fd, unsigned int flags)
+static void test_mode(int fd, const intel_ctx_t *ctx, unsigned int flags)
 {
 	const struct intel_execution_engine2 *e;
 	igt_hang_t hang = {};
@@ -196,7 +197,7 @@ static void test_mode(int fd, unsigned int flags)
 	else
 		hang = igt_allow_hang(fd, 0, 0);
 
-	__for_each_physical_engine(fd, e) {
+	for_each_ctx_engine(fd, ctx, e) {
 		if (!gem_class_can_store_dword(fd, e->class))
 			continue;
 
@@ -204,7 +205,7 @@ static void test_mode(int fd, unsigned int flags)
 			continue;
 
 		igt_dynamic_f("%s", e->name)
-			busy(fd, e->flags, flags);
+			busy(fd, ctx, e->flags, flags);
 	}
 
 	if ((flags & HANG) == 0)
@@ -215,11 +216,13 @@ static void test_mode(int fd, unsigned int flags)
 
 igt_main
 {
+	const intel_ctx_t *ctx;
 	int fd = -1;
 
 	igt_fixture {
 		fd = drm_open_driver_master(DRIVER_INTEL);
 		igt_require_gem(fd);
+		ctx = intel_ctx_create_all_physical(fd);
 	}
 
 	igt_subtest_group {
@@ -238,13 +241,15 @@ igt_main
 
 		for (const struct mode *m = modes; m->name; m++) {
 			igt_subtest_with_dynamic(m->name)
-				test_mode(fd, m->flags);
+				test_mode(fd, ctx, m->flags);
 
 			igt_subtest_with_dynamic_f("%s-wait", m->name)
-				test_mode(fd, m->flags | POLL);
+				test_mode(fd, ctx, m->flags | POLL);
 		}
 	}
 
-	igt_fixture
+	igt_fixture {
+		intel_ctx_destroy(fd, ctx);
 		close(fd);
+	}
 }
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
