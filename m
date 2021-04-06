Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C59C89F99
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Apr 2021 02:50:22 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Tue,  6 Apr 2021 08:30:25 +0530
Message-Id: <20210406030025.11380-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_pipe_b_c_ivb : Added test
 description
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

Added test description

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_pipe_b_c_ivb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/kms_pipe_b_c_ivb.c b/tests/kms_pipe_b_c_ivb.c
index 94768eec..5823ae2a 100644
--- a/tests/kms_pipe_b_c_ivb.c
+++ b/tests/kms_pipe_b_c_ivb.c
@@ -264,18 +264,28 @@ igt_main
 		igt_display_require(&data.display, data.drm_fd);
 	}
 
+	igt_describe("Tests pipe-B and pipe-C interactions in IVB by enabling pipe-B with mode "
+		     "that requires 3 lanes and then enabling pipe-c with dpms off/on pipe-B.");
 	igt_subtest("pipe-B-dpms-off-modeset-pipe-C")
 		test_dpms(&data);
 
+	igt_describe("Tests pipe-B and pipe-C interactions in IVB by enabling 2 different modes "
+		     "on pipe-B and then a single mode on pipe-C.");
 	igt_subtest("pipe-B-double-modeset-then-modeset-pipe-C")
 		test_lane_reduction(&data);
 
+	igt_describe("Tests pipe-B and pipe-C interactions in IVB by disabling pipe-B and then "
+		     "setting mode on pipe-C.");
 	igt_subtest("disable-pipe-B-enable-pipe-C")
 		test_disable_pipe_B(&data);
 
+	igt_describe("Tests pipe-B and pipe-C interactions in IVB by enabling pipe-B with 3 lanes "
+		     "from pipe-C.");
 	igt_subtest("from-pipe-C-to-B-with-3-lanes")
 		test_from_C_to_B_with_3_lanes(&data);
 
+	igt_describe("Tests pipe-B and pipe-C interactions in IVB by enabling pipe-C while pipe-B "
+		     "has 3-lanes");
 	igt_subtest("enable-pipe-C-while-B-has-3-lanes")
 		test_fail_enable_pipe_C_while_B_has_3_lanes(&data);
 
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
