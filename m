Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C2C6EC67
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 21:49:56 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id p67so29964184pfp.10
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 14:49:56 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Apr 2021 16:47:58 -0500
Message-Id: <20210423214853.876911-35-jason@jlekstrand.net>
In-Reply-To: <20210423214853.876911-1-jason@jlekstrand.net>
References: <20210423214853.876911-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 34/89] tests/prime_busy: Convert to
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
index aec76393..5c8e44ab 100644
--- a/tests/prime_busy.c
+++ b/tests/prime_busy.c
@@ -39,7 +39,7 @@ static bool prime_busy(struct pollfd *pfd, bool excl)
 #define HANG 0x4
 #define POLL 0x8
 
-static void busy(int fd, unsigned ring, unsigned flags)
+static void busy(int fd, const intel_ctx_t *ctx, unsigned ring, unsigned flags)
 {
 	const int gen = intel_gen(intel_get_drm_devid(fd));
 	const uint32_t _bbe = MI_BATCH_BUFFER_END;
@@ -62,6 +62,7 @@ static void busy(int fd, unsigned ring, unsigned flags)
 	execbuf.flags = ring;
 	if (gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
+	execbuf.rsvd1 = ctx->id;
 
 	memset(obj, 0, sizeof(obj));
 	obj[SCRATCH].handle = gem_create(fd, 4096);
@@ -185,7 +186,7 @@ static void busy(int fd, unsigned ring, unsigned flags)
 	close(pfd[SCRATCH].fd);
 }
 
-static void test_mode(int fd, unsigned int flags)
+static void test_mode(int fd, const intel_ctx_t *ctx, unsigned int flags)
 {
 	const struct intel_execution_engine2 *e;
 	igt_hang_t hang = {};
@@ -195,7 +196,7 @@ static void test_mode(int fd, unsigned int flags)
 	else
 		hang = igt_allow_hang(fd, 0, 0);
 
-	__for_each_physical_engine(fd, e) {
+	for_each_ctx_engine(fd, ctx, e) {
 		if (!gem_class_can_store_dword(fd, e->class))
 			continue;
 
@@ -203,7 +204,7 @@ static void test_mode(int fd, unsigned int flags)
 			continue;
 
 		igt_dynamic_f("%s", e->name)
-			busy(fd, e->flags, flags);
+			busy(fd, ctx, e->flags, flags);
 	}
 
 	if ((flags & HANG) == 0)
@@ -214,11 +215,13 @@ static void test_mode(int fd, unsigned int flags)
 
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
@@ -237,13 +240,15 @@ igt_main
 
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
