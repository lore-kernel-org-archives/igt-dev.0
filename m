Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C83E10E057
 for <igt-dev@lists.freedesktop.org>; Sat, 16 Dec 2023 00:41:12 +0000 (UTC)
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 15 Dec 2023 16:40:24 -0800
Subject: [PATCH i-g-t 4/4] tests/kms_atomic: Add subtest for solid fill
 cursor planes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231215-solid-fill-v1-4-12932f9f452d@quicinc.com>
References: <20231215-solid-fill-v1-0-12932f9f452d@quicinc.com>
In-Reply-To: <20231215-solid-fill-v1-0-12932f9f452d@quicinc.com>
To: <igt-dev@lists.freedesktop.org>, Petri Latvala <adrinael@adrinael.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Simon Ser <contact@emersion.fr>, Rob Clark <robdclark@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add a subtest for testing solid fill cursor planes.

This test will commit a solid fill cursor plane on top of a normal
framebuffer primary plane and compare the resulting CRC with the CRC
value of a framebuffer cursor and primary plane of the same contents.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/kms_atomic.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 8f81e65ad84f..057fba0d6767 100755
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -1349,10 +1349,18 @@ static void test_solid_fill_plane(data_t *data, igt_output_t *output,  igt_plane
 		.pad = 0x0,
 	};
 
-	rect.x1 = 0;
-	rect.x2 = mode->hdisplay;
-	rect.y1 = 0;
-	rect.y2 = mode->vdisplay;
+	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
+	{
+		rect.x1 = 0;
+		rect.x2 = mode->hdisplay;
+		rect.y1 = 0;
+		rect.y2 = mode->vdisplay;
+	} else {
+		rect.x1 = mode->hdisplay / 2 - 50;
+		rect.x2 = mode->hdisplay / 2 + 50;
+		rect.y1 = mode->vdisplay / 2 - 50;
+		rect.y2 = mode->vdisplay / 2 + 50;
+	}
 
 	height = rect.y2 - rect.y1;
 	width = rect.x2 - rect.x1;
@@ -1728,6 +1736,24 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
+	igt_describe("Test case for solid fill cursor planes");
+	igt_subtest_with_dynamic("plane-cursor-solid-fill") {
+		for_each_pipe_with_single_output(&data.display, pipe, output) {
+			igt_plane_t *cursor =
+				igt_pipe_get_plane_type(&data.display.pipes[pipe], DRM_PLANE_TYPE_CURSOR);
+			if (!pipe_output_combo_valid(&data.display, pipe, output))
+				continue;
+			if (!cursor)
+				continue;
+
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+				atomic_setup(&data, pipe, output);
+				test_solid_fill_plane(&data, output, cursor);
+				atomic_clear(&data, pipe, output);
+			}
+		}
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);

-- 
2.43.0
