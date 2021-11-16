Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAB86E0DF
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Nov 2021 17:31:40 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id 132so21324090qkj.11
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Nov 2021 09:31:40 -0800 (PST)
From: Mark Yacoub <markyacoub@chromium.org>
Date: Tue, 16 Nov 2021 12:31:31 -0500
Message-Id: <20211116173131.240657-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests: Skip tests using LUTs when the driver
 doesn't support it.
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
Cc: robdclark@chromium.org, petri.latvala@intel.com, seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@google.com>

[Why]
Some drivers such as msm do not support CTM and their CRTC doesn't have
LUT props. Tests should skip relevant tests when it's not supported.

[How]
Check for the LUT pipe prop before starting relevant subtest.

Tested on Trogdor (msm)

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 tests/kms_color.c |  8 ++++++++
 tests/kms_plane.c | 52 ++++++++++++++++++++++++++++-------------------
 2 files changed, 39 insertions(+), 21 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 775f3596..99a59cd8 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -905,6 +905,14 @@ igt_main
 	}
 
 	for_each_pipe_static(pipe) {
+		igt_fixture {
+			igt_require_f(igt_pipe_has_prop(&data.display, pipe,
+											IGT_CRTC_GAMMA_LUT) &&
+								igt_pipe_has_prop(&data.display, pipe,
+												IGT_CRTC_DEGAMMA_LUT),
+							"Driver doesn't support CTM.\n");
+		}
+
 		igt_subtest_group
 			run_tests_for_pipe(&data, pipe);
 
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 405d4c21..d82214ed 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1090,28 +1090,38 @@ run_tests_for_pipe_plane(data_t *data)
 		igt_require(data->display.pipes[pipe].n_planes > 0);
 	}
 
-	igt_describe("verify the pixel formats for given plane and pipe");
-	igt_subtest_with_dynamic_f("pixel-format") {
-		count = 0;
-		for_each_pipe(&data->display, pipe) {
-			igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe))
-				test_pixel_formats(data, pipe);
-			if (is_pipe_limit_reached(++count))
-				break;
-		}
-	}
-	igt_describe("verify the pixel formats for given plane and pipe with source clamping");
-	igt_subtest_with_dynamic_f("pixel-format-source-clamping") {
-		count = 0;
-		for_each_pipe(&data->display, pipe) {
-			igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe)) {
-				data->crop = 4;
-				test_pixel_formats(data, pipe);
+		igt_describe("Verify the pixel formats for given plane and pipe");
+		igt_subtest_group {
+			igt_fixture {
+				igt_require_f(igt_pipe_has_prop(&data->display, pipe,
+												IGT_CRTC_GAMMA_LUT) &&
+								  igt_pipe_has_prop(&data->display, pipe,
+													IGT_CRTC_DEGAMMA_LUT),
+							  "Driver doesn't support CTM.\n");
 			}
-			if (is_pipe_limit_reached(++count))
-				break;
-		}
-	}
+
+			igt_subtest_with_dynamic_f("pixel-format") {
+				count = 0;
+				for_each_pipe(&data->display, pipe) {
+					igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe))
+						test_pixel_formats(data, pipe);
+					if (is_pipe_limit_reached(++count))
+						break;
+				}
+			}
+		    igt_subtest_with_dynamic_f("pixel-format-source-clamping") {
+				count = 0;
+				for_each_pipe(&data->display, pipe) {
+				    igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe)) {
+						data->crop = 4;
+						test_pixel_formats(data, pipe);
+				    }
+				    if (is_pipe_limit_reached(++count))
+						break;
+				}
+		    }
+        }
+
 
 	data->crop = 0;
 	igt_describe("verify plane position using two planes to create a fully covered screen");
-- 
2.34.0.rc1.387.gb447b232ab-goog
