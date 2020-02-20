Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 20 Feb 2020 09:41:34 +0000
Message-Id: <20200220094134.1560435-3-chris@chris-wilson.co.uk>
In-Reply-To: <20200220094134.1560435-1-chris@chris-wilson.co.uk>
References: <20200220094134.1560435-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] igt/kms_draw_crc: Test for a working
 GPU first
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

The draw-method-blt subtests require a working GPU, so create a subtest
group for the draw-methods, and skip the BLT group using
 igt_require_gem() in its fixture.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/kms_draw_crc.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/tests/kms_draw_crc.c b/tests/kms_draw_crc.c
index fa7433ab2..917a55432 100644
--- a/tests/kms_draw_crc.c
+++ b/tests/kms_draw_crc.c
@@ -331,14 +331,24 @@ igt_main
 
 	for (format_idx = 0; format_idx < N_FORMATS; format_idx++) {
 	for (method = 0; method < IGT_DRAW_METHOD_COUNT; method++) {
-	for (tiling_idx = 0; tiling_idx < N_TILING_METHODS; tiling_idx++) {
-		igt_subtest_f("draw-method-%s-%s-%s",
-			      format_str(format_idx),
-			      igt_draw_get_method_name(method),
-			      tiling_str(tiling_idx))
-			draw_method_subtest(method, format_idx,
-					    tilings[tiling_idx]);
-	} } }
+	igt_subtest_group {
+		igt_fixture {
+			if (method == IGT_DRAW_BLT)
+				igt_require_gem(drm_fd);
+		}
+
+		for (tiling_idx = 0;
+		     tiling_idx < N_TILING_METHODS;
+		     tiling_idx++) {
+			igt_subtest_f("draw-method-%s-%s-%s",
+				      format_str(format_idx),
+				      igt_draw_get_method_name(method),
+				      tiling_str(tiling_idx))
+				draw_method_subtest(method,
+						    format_idx,
+						    tilings[tiling_idx]);
+		}
+	}}}
 
 	igt_subtest("fill-fb")
 		fill_fb_subtest();
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
