Return-path: <SRS0=itlh=TC=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E03510E1AC
 for <igt-dev@lists.freedesktop.org>; Sat, 19 Feb 2022 00:13:56 +0000 (UTC)
From: Jasmine Newsome <jasmine.newsome@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 18 Feb 2022 16:10:12 -0800
Message-Id: <20220219001013.3528897-2-jasmine.newsome@intel.com>
In-Reply-To: <20220219001013.3528897-1-jasmine.newsome@intel.com>
References: <20220219001013.3528897-1-jasmine.newsome@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_dummyload.c: Save more context
 info in spinner
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: jasmine.newsome@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Save igt_spin_factory info in igt_spin. This will allow
for access to the actual context within the spinner.
Previously, only the context id was accessible. This
might help make spinner code cleaner.

Signed-off-by: Jasmine Newsome <jasmine.newsome@intel.com>
---
 lib/igt_dummyload.c |  1 +
 lib/igt_dummyload.h | 43 +++++++++++++++++++++++--------------------
 2 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index 645db922..0b2be154 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -421,6 +421,7 @@ emit_recursive_batch(igt_spin_t *spin,
 	}
 
 	spin->cmd_precondition = *spin->condition;
+	spin->opts = *opts;
 
 	return fence_fd;
 }
diff --git a/lib/igt_dummyload.h b/lib/igt_dummyload.h
index f0205261..af9e6a43 100644
--- a/lib/igt_dummyload.h
+++ b/lib/igt_dummyload.h
@@ -33,6 +33,28 @@
 #include "i915_drm.h"
 #include "intel_ctx.h"
 
+
+/**
+ * igt_spin_factory_t:
+ * @ctx_id: GEM context handle
+ * @ctx: intel_ctx_t context wrapper
+ * @dependency: GEM object to depend on
+ * @engine: Flags describing the engine to execute on
+ * @flags: Set of IGT_SPIN_* flags
+ * @fence: In-fence to wait on
+ *
+ * A factory struct which contains creation parameters for an igt_spin_t.
+ */
+typedef struct igt_spin_factory {
+	uint32_t ctx_id;
+	const intel_ctx_t *ctx;
+	uint32_t dependency;
+	unsigned int engine;
+	unsigned int flags;
+	int fence;
+	uint64_t ahnd;
+} igt_spin_factory_t;
+
 typedef struct igt_spin {
 	struct igt_list_head link;
 
@@ -60,28 +82,9 @@ typedef struct igt_spin {
 #define SPIN_CLFLUSH (1 << 0)
 
 	uint64_t ahnd;
+	struct igt_spin_factory opts;
 } igt_spin_t;
 
-/**
- * igt_spin_factory_t:
- * @ctx_id: GEM context handle
- * @ctx: intel_ctx_t context wrapper
- * @dependency: GEM object to depend on
- * @engine: Flags describing the engine to execute on
- * @flags: Set of IGT_SPIN_* flags
- * @fence: In-fence to wait on
- *
- * A factory struct which contains creation parameters for an igt_spin_t.
- */
-typedef struct igt_spin_factory {
-	uint32_t ctx_id;
-	const intel_ctx_t *ctx;
-	uint32_t dependency;
-	unsigned int engine;
-	unsigned int flags;
-	int fence;
-	uint64_t ahnd;
-} igt_spin_factory_t;
 
 #define IGT_SPIN_FENCE_IN      (1 << 0)
 #define IGT_SPIN_FENCE_SUBMIT  (1 << 1)
-- 
2.25.1
