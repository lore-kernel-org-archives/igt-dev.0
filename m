Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E5A10E374
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Aug 2023 14:42:11 +0000 (UTC)
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Aug 2023 20:08:15 +0530
Message-Id: <20230829143821.1417623-4-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20230829143821.1417623-1-chaitanya.kumar.borah@intel.com>
References: <20230829143821.1417623-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/9] tests/kms_color: Add infrastructure for
 plane color pipeline test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chaitanya.kumar.borah@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Set up the base to run plane color tests.

Co-developed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_color.c | 70 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 0b6e1d6f0..667eb2168 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -1032,6 +1032,55 @@ run_invalid_tests_for_pipe(data_t *data)
 	}
 }
 
+static void run_plane_color_test(data_t *data, enum pipe pipe,
+				 bool (*test_t)(data_t*, igt_plane_t*))
+{
+	igt_plane_t *plane;
+	int count = 0;
+	int first_plane = -1;
+	int last_plane = -1;
+
+	for_each_plane_on_pipe(&data->display, pipe, plane) {
+		if (plane->type == DRM_PLANE_TYPE_CURSOR)
+			continue;
+
+		if (first_plane < 0)
+			first_plane = j__;
+
+		last_plane = j__;
+	}
+
+	for_each_plane_on_pipe(&data->display, pipe, plane) {
+		if (plane->type == DRM_PLANE_TYPE_CURSOR)
+			continue;
+
+		if (j__ != first_plane && j__ != last_plane)
+			continue;
+
+		igt_assert(test_t(data, plane));
+
+		count++;
+	}
+
+	if (!count)
+		igt_skip("No valid planes found.\n");
+}
+
+static void
+run_colorpipeline_tests_for_plane(data_t *data, enum pipe p,
+				  bool (*test_t)(data_t*, igt_plane_t*))
+{
+	test_setup(data, p);
+
+	data->drm_format = DRM_FORMAT_XRGB8888;
+	data->mode = igt_output_get_mode(data->output);
+
+	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name)
+		run_plane_color_test(data, p, test_t);
+
+	test_cleanup(data);
+}
+
 static void
 run_tests_for_pipe(data_t *data)
 {
@@ -1160,6 +1209,13 @@ run_tests_for_pipe(data_t *data)
 		  .desc = "Check the color transformation for correct signed handling",
 		},
 	};
+	struct {
+		const char *name;
+		bool (*test_t)(data_t*, igt_plane_t*);
+		const char *desc;
+	} plane_colorpipeline_tests[] = {};
+	enum pipe active_pipes[IGT_MAX_PIPES];
+	uint32_t last_pipe = 0;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(gamma_degamma_tests); i++) {
@@ -1188,6 +1244,20 @@ run_tests_for_pipe(data_t *data)
 		}
 	}
 
+	for (i = 0; i < ARRAY_SIZE(plane_colorpipeline_tests); i++) {
+		igt_describe_f("%s", plane_colorpipeline_tests[i].desc);
+		igt_subtest_with_dynamic_f("%s", plane_colorpipeline_tests[i].name) {
+			for_each_pipe(&data->display, pipe) {
+				if (pipe != active_pipes[0] &&
+				    pipe != active_pipes[last_pipe])
+					continue;
+
+				run_colorpipeline_tests_for_plane(data, pipe,
+								  plane_colorpipeline_tests[i].test_t);
+			}
+		}
+	}
+
 	igt_fixture
 		igt_require(data->display.is_atomic);
 
-- 
2.25.1
