Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon,  7 Dec 2020 16:11:50 +0000
Message-Id: <20201207161150.1841453-2-chris@chris-wilson.co.uk>
In-Reply-To: <20201207161150.1841453-1-chris@chris-wilson.co.uk>
References: <20201207161150.1841453-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] i915/query: Directly check query
 results against GETPARAM
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
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Simplify the cross-check by asserting that the existence of an engine in
the list matches the existence of the engine as reported by GETPARAM.
By using the comparison, we check both directions at once.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 tests/i915/i915_query.c | 49 ++++++++---------------------------------
 1 file changed, 9 insertions(+), 40 deletions(-)

diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
index cdf2d3403..b415650ae 100644
--- a/tests/i915/i915_query.c
+++ b/tests/i915/i915_query.c
@@ -719,46 +719,15 @@ static void engines(int fd)
 	gem_context_reset_engines(fd, 0);
 
 	/* Check results match the legacy GET_PARAM (where we can). */
-	for (i = 0; i < engines->num_engines; i++) {
-		struct drm_i915_engine_info *engine =
-			(struct drm_i915_engine_info *)&engines->engines[i];
-
-		switch (engine->engine.engine_class) {
-		case I915_ENGINE_CLASS_RENDER:
-			/* Will be tested later. */
-			break;
-		case I915_ENGINE_CLASS_COPY:
-			igt_assert(gem_has_blt(fd));
-			break;
-		case I915_ENGINE_CLASS_VIDEO:
-			switch (engine->engine.engine_instance) {
-			case 0:
-				igt_assert(gem_has_bsd(fd));
-				break;
-			case 1:
-				igt_assert(gem_has_bsd2(fd));
-				break;
-			}
-			break;
-		case I915_ENGINE_CLASS_VIDEO_ENHANCE:
-			igt_assert(gem_has_vebox(fd));
-			break;
-		default:
-			igt_assert(0);
-		}
-	}
-
-	/* Reverse check to the above - all GET_PARAM engines are present. */
-	igt_assert(has_engine(engines, I915_ENGINE_CLASS_RENDER, 0));
-	if (gem_has_blt(fd))
-		igt_assert(has_engine(engines, I915_ENGINE_CLASS_COPY, 0));
-	if (gem_has_bsd(fd))
-		igt_assert(has_engine(engines, I915_ENGINE_CLASS_VIDEO, 0));
-	if (gem_has_bsd2(fd))
-		igt_assert(has_engine(engines, I915_ENGINE_CLASS_VIDEO, 1));
-	if (gem_has_vebox(fd))
-		igt_assert(has_engine(engines, I915_ENGINE_CLASS_VIDEO_ENHANCE,
-				       0));
+	igt_assert_eq(has_engine(engines, I915_ENGINE_CLASS_RENDER, 0), 1);
+	igt_assert_eq(has_engine(engines, I915_ENGINE_CLASS_COPY, 0),
+		      gem_has_blt(fd));
+	igt_assert_eq(has_engine(engines, I915_ENGINE_CLASS_VIDEO, 0),
+		      gem_has_bsd(fd));
+	igt_assert_eq(has_engine(engines, I915_ENGINE_CLASS_VIDEO, 1),
+		      gem_has_bsd2(fd));
+	igt_assert_eq(has_engine(engines, I915_ENGINE_CLASS_VIDEO_ENHANCE, 0),
+		      gem_has_vebox(fd));
 
 	free(engines);
 }
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
