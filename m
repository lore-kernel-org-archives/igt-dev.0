Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BB96EC68
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 21:49:26 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id m12so15351388pgr.9
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 14:49:26 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Apr 2021 16:47:39 -0500
Message-Id: <20210423214853.876911-16-jason@jlekstrand.net>
In-Reply-To: <20210423214853.876911-1-jason@jlekstrand.net>
References: <20210423214853.876911-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 15/89] lib/dummyload: Better document
 igt_spin_factory
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

---
 lib/igt_dummyload.h | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/lib/igt_dummyload.h b/lib/igt_dummyload.h
index a75fcdeb..f3d7c128 100644
--- a/lib/igt_dummyload.h
+++ b/lib/igt_dummyload.h
@@ -59,13 +59,23 @@ typedef struct igt_spin {
 #define SPIN_CLFLUSH (1 << 0)
 } igt_spin_t;
 
-struct igt_spin_factory {
+/**
+ * igt_spin_factory_t:
+ * @ctx: GEM context handle
+ * @dependency: GEM object to depend on
+ * @engine: Flags describing the engine to execute on
+ * @flags: Set of IGT_SPIN_* flags
+ * @fence: In-fence to wait on
+ *
+ * A factory struct which contains creation parameters for an igt_spin_t.
+ */
+typedef struct igt_spin_factory {
 	uint32_t ctx;
 	uint32_t dependency;
 	unsigned int engine;
 	unsigned int flags;
 	int fence;
-};
+} igt_spin_factory_t;
 
 #define IGT_SPIN_FENCE_IN      (1 << 0)
 #define IGT_SPIN_FENCE_SUBMIT  (1 << 1)
@@ -78,14 +88,14 @@ struct igt_spin_factory {
 #define IGT_SPIN_SOFTDEP       (1 << 8)
 
 igt_spin_t *
-__igt_spin_factory(int fd, const struct igt_spin_factory *opts);
+__igt_spin_factory(int fd, const igt_spin_factory_t *opts);
 igt_spin_t *
-igt_spin_factory(int fd, const struct igt_spin_factory *opts);
+igt_spin_factory(int fd, const igt_spin_factory_t *opts);
 
 #define __igt_spin_new(fd, ...) \
-	__igt_spin_factory(fd, &((struct igt_spin_factory){__VA_ARGS__}))
+	__igt_spin_factory(fd, &((igt_spin_factory_t){__VA_ARGS__}))
 #define igt_spin_new(fd, ...) \
-	igt_spin_factory(fd, &((struct igt_spin_factory){__VA_ARGS__}))
+	igt_spin_factory(fd, &((igt_spin_factory_t){__VA_ARGS__}))
 
 void igt_spin_set_timeout(igt_spin_t *spin, int64_t ns);
 void igt_spin_reset(igt_spin_t *spin);
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
