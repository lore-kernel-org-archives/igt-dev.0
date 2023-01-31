Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE98D10E34E
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Jan 2023 13:31:25 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 31 Jan 2023 19:06:56 +0530
Message-Id: <20230131133658.21970-6-nidhi1.gupta@intel.com>
In-Reply-To: <20230131133658.21970-1-nidhi1.gupta@intel.com>
References: <20230131133658.21970-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 5/7] tests/kms_plane_cursor: Limit the
 execution to two pipes
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

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

As the execution is taking more time, limit the execution to two (first
& last) pipes. This patch will ignores the cursor size of 256, since it
is causing simics crash.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_plane_cursor.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 9b27586c..9a94849a 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -277,6 +277,8 @@ igt_main
 		  "Tests atomic cursor positioning on primary plane and overlay plane "
 		  "with buffer larger than viewport used for display" },
 	};
+	enum pipe active_pipes[IGT_MAX_PIPES];
+	uint32_t last_pipe = 0;
 
 	igt_fixture {
 		int ret;
@@ -293,6 +295,11 @@ igt_main
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require(data.display.is_atomic);
 		igt_display_require_output(&data.display);
+
+		/* Get active pipes. */
+		for_each_pipe(&data.display, pipe)
+			active_pipes[last_pipe++] = pipe;
+		last_pipe--;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
@@ -304,11 +311,19 @@ igt_main
 							     DRM_PLANE_TYPE_OVERLAY))
 					continue;
 
+				if (igt_run_in_simulation() &&
+				    pipe != active_pipes[0] &&
+				    pipe != active_pipes[last_pipe])
+					continue;
+
 				test_init(&data, pipe, output);
 
 				for (j = 0; j < ARRAY_SIZE(cursor_sizes); j++) {
 					int size = cursor_sizes[j];
 
+					if (igt_run_in_simulation() && size >= 256)
+						continue;
+
 					igt_dynamic_f("pipe-%s-%s-size-%d",
 						      kmstest_pipe_name(pipe),
 						      igt_output_name(output),
-- 
2.39.0
