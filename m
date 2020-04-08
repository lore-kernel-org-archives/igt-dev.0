Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed,  8 Apr 2020 21:50:56 +0100
Message-Id: <20200408205056.2113025-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Show the actual error from submitting
 the rendercopy
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/gpu_cmds.c        | 13 ++++++-------
 lib/rendercopy_gen4.c | 13 ++++++-------
 lib/rendercopy_gen6.c | 13 ++++++-------
 lib/rendercopy_gen7.c | 13 ++++++-------
 lib/rendercopy_gen8.c | 13 ++++++-------
 lib/rendercopy_gen9.c | 13 ++++++-------
 6 files changed, 36 insertions(+), 42 deletions(-)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index 79412725a..dc0ae96c6 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -39,13 +39,12 @@ gen7_render_flush(struct intel_batchbuffer *batch, uint32_t batch_end)
 void
 gen7_render_context_flush(struct intel_batchbuffer *batch, uint32_t batch_end)
 {
-	int ret;
-
-	ret = drm_intel_bo_subdata(batch->bo, 0, 4096, batch->buffer);
-	if (ret == 0)
-		ret = drm_intel_gem_bo_context_exec(batch->bo, batch->ctx,
-				batch_end, 0);
-	igt_assert(ret == 0);
+	igt_assert_eq(drm_intel_bo_subdata(batch->bo,
+					   0, 4096, batch->buffer),
+		      0);
+	igt_assert_eq(drm_intel_gem_bo_context_exec(batch->bo, batch->ctx,
+						    batch_end, 0),
+		      0);
 }
 
 uint32_t
diff --git a/lib/rendercopy_gen4.c b/lib/rendercopy_gen4.c
index d07b8e488..413e33578 100644
--- a/lib/rendercopy_gen4.c
+++ b/lib/rendercopy_gen4.c
@@ -124,13 +124,12 @@ static void
 gen4_render_flush(struct intel_batchbuffer *batch,
 		  drm_intel_context *context, uint32_t batch_end)
 {
-	int ret;
-
-	ret = drm_intel_bo_subdata(batch->bo, 0, 4096, batch->buffer);
-	if (ret == 0)
-		ret = drm_intel_gem_bo_context_exec(batch->bo, context,
-						    batch_end, 0);
-	assert(ret == 0);
+	igt_assert_eq(drm_intel_bo_subdata(batch->bo,
+					   0, 4096, batch->buffer),
+		      0);
+	igt_assert_eq(drm_intel_gem_bo_context_exec(batch->bo, context,
+						    batch_end, 0),
+		      0);
 }
 
 static uint32_t
diff --git a/lib/rendercopy_gen6.c b/lib/rendercopy_gen6.c
index 870347748..16cbb679b 100644
--- a/lib/rendercopy_gen6.c
+++ b/lib/rendercopy_gen6.c
@@ -62,13 +62,12 @@ static void
 gen6_render_flush(struct intel_batchbuffer *batch,
 		  drm_intel_context *context, uint32_t batch_end)
 {
-	int ret;
-
-	ret = drm_intel_bo_subdata(batch->bo, 0, 4096, batch->buffer);
-	if (ret == 0)
-		ret = drm_intel_gem_bo_context_exec(batch->bo, context,
-						    batch_end, 0);
-	igt_assert(ret == 0);
+	igt_assert_eq(drm_intel_bo_subdata(batch->bo,
+					   0, 4096, batch->buffer),
+		      0);
+	igt_assert_eq(drm_intel_gem_bo_context_exec(batch->bo,
+						    context, batch_end, 0),
+		      0);
 }
 
 static uint32_t
diff --git a/lib/rendercopy_gen7.c b/lib/rendercopy_gen7.c
index b88b75e98..93b4da720 100644
--- a/lib/rendercopy_gen7.c
+++ b/lib/rendercopy_gen7.c
@@ -36,13 +36,12 @@ static void
 gen7_render_flush(struct intel_batchbuffer *batch,
 		  drm_intel_context *context, uint32_t batch_end)
 {
-	int ret;
-
-	ret = drm_intel_bo_subdata(batch->bo, 0, 4096, batch->buffer);
-	if (ret == 0)
-		ret = drm_intel_gem_bo_context_exec(batch->bo, context,
-						    batch_end, 0);
-	igt_assert(ret == 0);
+	igt_assert_eq(drm_intel_bo_subdata(batch->bo,
+					   0, 4096, batch->buffer),
+		      0);
+	igt_assert_eq(drm_intel_gem_bo_context_exec(batch->bo, context,
+						    batch_end, 0),
+		      0);
 }
 
 static uint32_t
diff --git a/lib/rendercopy_gen8.c b/lib/rendercopy_gen8.c
index bace64a7a..75005d0b9 100644
--- a/lib/rendercopy_gen8.c
+++ b/lib/rendercopy_gen8.c
@@ -132,13 +132,12 @@ static void
 gen6_render_flush(struct intel_batchbuffer *batch,
 		  drm_intel_context *context, uint32_t batch_end)
 {
-	int ret;
-
-	ret = drm_intel_bo_subdata(batch->bo, 0, 4096, batch->buffer);
-	if (ret == 0)
-		ret = drm_intel_gem_bo_context_exec(batch->bo, context,
-						    batch_end, 0);
-	igt_assert(ret == 0);
+	igt_assert_eq(drm_intel_bo_subdata(batch->bo,
+					   0, 4096, batch->buffer),
+		      0);
+	igt_assert_eq(drm_intel_gem_bo_context_exec(batch->bo, context,
+						    batch_end, 0),
+		      0);
 }
 
 /* Mostly copy+paste from gen6, except height, width, pitch moved */
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index f364c2b9e..85ae4cabc 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -182,13 +182,12 @@ static void
 gen6_render_flush(struct intel_batchbuffer *batch,
 		  drm_intel_context *context, uint32_t batch_end)
 {
-	int ret;
-
-	ret = drm_intel_bo_subdata(batch->bo, 0, 4096, batch->buffer);
-	if (ret == 0)
-		ret = drm_intel_gem_bo_context_exec(batch->bo, context,
-						    batch_end, 0);
-	assert(ret == 0);
+	igt_assert_eq(drm_intel_bo_subdata(batch->bo,
+					   0, 4096, batch->buffer),
+		      0);
+	igt_assert_eq(drm_intel_gem_bo_context_exec(batch->bo,
+						    context, batch_end, 0),
+		      0);
 }
 
 /* Mostly copy+paste from gen6, except height, width, pitch moved */
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
