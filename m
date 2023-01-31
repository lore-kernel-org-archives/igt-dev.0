Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37C210E34E
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Jan 2023 13:31:23 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 31 Jan 2023 19:06:55 +0530
Message-Id: <20230131133658.21970-5-nidhi1.gupta@intel.com>
In-Reply-To: <20230131133658.21970-1-nidhi1.gupta@intel.com>
References: <20230131133658.21970-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 4/7] tests/kms_plane_alpha_blend: Restrict the
 execution to 2 pipes and planes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Restrict the execution of the subtests to two pipes and
two planes on simulation to reduce the execution time.

Signed-off-by: Bhanuprakash ModemSigned-off-by: Bhanuprakash ModemSigned-off-by: Bhanuprakash Modem
Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_plane_alpha_blend.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 38272ccb..1f89aa6f 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -482,8 +482,10 @@ static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, igt_output_t *
 {
 	igt_display_t *display = &data->display;
 	igt_plane_t *plane;
+	int first_plane = -1;
+	int last_plane = -1;
 
-	for_each_plane_on_pipe(display, pipe, plane) {
+	for_each_plane_on_pipe(&data->display, pipe, plane) {
 		if (!igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
 			continue;
 
@@ -496,6 +498,19 @@ static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, igt_output_t *
 		if (must_multiply && !has_multiplied_alpha(data, plane))
 			continue;
 
+		if (first_plane < 0)
+			first_plane = j__;
+
+		last_plane = j__;
+	}
+
+        for_each_plane_on_pipe(&data->display, pipe, plane) {
+		if (j__ != first_plane && j__ != last_plane)
+                        continue;
+
+		/* reset plane alpha properties between each plane */
+		reset_alpha(display, pipe);
+
 		igt_info("Testing plane %u\n", plane->index);
 		test(data, pipe, plane);
 		igt_plane_set_fb(plane, NULL);
@@ -615,6 +630,7 @@ static void run_subtests(data_t *data)
 {
 	igt_output_t *output;
 	enum pipe pipe;
+	int count = 0;
 
 	for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
 		igt_describe_f("%s\n", subtests[i].desc);
@@ -628,6 +644,9 @@ static void run_subtests(data_t *data)
 				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
 					run_test_on_pipe_planes(data, pipe, output, subtests[i].blend,
 								subtests[i].must_multiply, subtests[i].test);
+				count++;
+				if (count == 3 && igt_run_in_simulation())
+					break;
 			}
 		}
 	}
-- 
2.39.0
