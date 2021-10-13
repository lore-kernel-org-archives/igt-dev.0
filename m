Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F246E1BD
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Oct 2021 22:17:44 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu, 14 Oct 2021 01:17:21 +0300
Message-Id: <20211013221727.6392-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20211013221727.6392-1-ville.syrjala@linux.intel.com>
References: <20211013221727.6392-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/8] tests/kms_plane: Use IGT_MODIFIER_{FMT,
 ARGS}
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Use IGT_MODIFIER_{FMT,ARGS} to print a human readable name for
the modifier.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_plane.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index effc54cecbf7..405d4c2180a6 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -768,8 +768,8 @@ static bool test_format_plane_rgb(data_t *data, enum pipe pipe,
 				  igt_crc_t ref_crc[],
 				  struct igt_fb *fb)
 {
-	igt_info("Testing format " IGT_FORMAT_FMT " / modifier 0x%" PRIx64 " on %s.%u\n",
-		 IGT_FORMAT_ARGS(format), modifier,
+	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
+		 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
 		 kmstest_pipe_name(pipe), plane->index);
 
 	return test_format_plane_colors(data, pipe, plane,
@@ -806,8 +806,8 @@ static bool test_format_plane_yuv(data_t *data, enum pipe pipe,
 						     igt_color_range_to_str(r)))
 				continue;
 
-			igt_info("Testing format " IGT_FORMAT_FMT " / modifier 0x%" PRIx64 " (%s, %s) on %s.%u\n",
-				 IGT_FORMAT_ARGS(format), modifier,
+			igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " (%s, %s) on %s.%u\n",
+				 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
 				 igt_color_encoding_to_str(e),
 				 igt_color_range_to_str(r),
 				 kmstest_pipe_name(pipe), plane->index);
@@ -886,8 +886,8 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 
 	igt_pipe_crc_start(data->pipe_crc);
 
-	igt_info("Testing format " IGT_FORMAT_FMT " / modifier 0x%" PRIx64 " on %s.%u\n",
-		 IGT_FORMAT_ARGS(ref.format), ref.modifier,
+	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
+		 IGT_FORMAT_ARGS(ref.format), IGT_MODIFIER_ARGS(ref.modifier),
 		 kmstest_pipe_name(pipe), plane->index);
 
 	if (data->display.is_atomic) {
@@ -948,8 +948,8 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 			};
 
 			if (igt_vec_index(&tested_formats, &rf) >= 0) {
-				igt_info("Skipping format " IGT_FORMAT_FMT " / modifier 0x%" PRIx64 " on %s.%u\n",
-					 IGT_FORMAT_ARGS(f.format), f.modifier,
+				igt_info("Skipping format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
+					 IGT_FORMAT_ARGS(f.format), IGT_MODIFIER_ARGS(f.modifier),
 					 kmstest_pipe_name(pipe), plane->index);
 				continue;
 			}
-- 
2.32.0
