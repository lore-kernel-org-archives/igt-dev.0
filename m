Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439738970B
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2020 04:47:10 +0000 (UTC)
From: nidhi1.gupta@intel.com
Date: Tue, 10 Nov 2020 10:25:10 +0530
Message-Id: <20201110045510.14716-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] Fix IGT Warnings due to dynamic subtest
 inclusion
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
To: igt-dev@lists.freedesktop.org
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Nidhi Gupta <nidhi1.gupta@intel.com>

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_atomic_interruptible.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index 27bb6a2b..f98023ca 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -288,7 +288,9 @@ igt_main
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_plane_test(&display, pipe, output, test_legacy_modeset, DRM_PLANE_TYPE_PRIMARY);
+			{
 				break;
+			}
 		}
 	}
 
@@ -296,7 +298,9 @@ igt_main
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_plane_test(&display, pipe, output, test_atomic_modeset, DRM_PLANE_TYPE_PRIMARY);
+			{
 				break;
+			}
 		}
 	}
 
@@ -304,7 +308,9 @@ igt_main
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_plane_test(&display, pipe, output, test_legacy_dpms, DRM_PLANE_TYPE_PRIMARY);
+			{
 				break;
+			}
 		}
 	}
 
@@ -312,7 +318,9 @@ igt_main
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_plane_test(&display, pipe, output, test_pageflip, DRM_PLANE_TYPE_PRIMARY);
+			{
 				break;
+			}
 		}
 	}
 
@@ -320,7 +328,9 @@ igt_main
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_plane_test(&display, pipe, output, test_setcursor, DRM_PLANE_TYPE_CURSOR);
+			{
 				break;
+			}
 		}
 	}
 
@@ -328,7 +338,9 @@ igt_main
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_plane_test(&display, pipe, output, test_setplane, DRM_PLANE_TYPE_PRIMARY);
+			{
 				break;
+			}
 		}
 	}
 
@@ -336,7 +348,9 @@ igt_main
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_plane_test(&display, pipe, output, test_setplane, DRM_PLANE_TYPE_CURSOR);
+			{
 				break;
+			}
 		}
 	}
 
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
