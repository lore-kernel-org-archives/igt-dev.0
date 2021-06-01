Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Lee Shawn C <shawn.c.lee@intel.com>
Date: Tue,  1 Jun 2021 11:41:16 +0800
Message-Id: <20210601034116.8396-1-shawn.c.lee@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_dp_dsc: Transmit correct DRM
 connector structure.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org
Cc: charlton.lin@intel.com, Lee Shawn C <shawn.c.lee@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

1. Pass one more parameter (current drmModeConnector) when
   call "run_test()". Use it to retrieve proper connector_type.
2. SIGSEGV fault would happen due to "igt_output" did not
   store properly in "data->output". Main funciton already
   pass "igt_output" pointer into "run_test()" function.
   Use this pointer instead of "data->output" to get display mode.

Fixes: a1772be7dede ("tests/kms_dp_dsc: Bug fix for DP on Pipe A")

Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 tests/kms_dp_dsc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/kms_dp_dsc.c b/tests/kms_dp_dsc.c
index ea7c9f4f72ce..e434384da369 100644
--- a/tests/kms_dp_dsc.c
+++ b/tests/kms_dp_dsc.c
@@ -224,11 +224,11 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 }
 
 static void run_test(data_t *data, igt_output_t *output,
-		     enum dsc_test_type test_type)
+		     drmModeConnector *connector, enum dsc_test_type test_type)
 {
 	enum pipe pipe;
 
-	data->mode = igt_output_get_mode(data->output);
+	data->mode = igt_output_get_mode(output);
 	igt_create_pattern_fb(data->drm_fd, data->mode->hdisplay,
 			      data->mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
@@ -239,7 +239,7 @@ static void run_test(data_t *data, igt_output_t *output,
 		if (is_i915_device(data->drm_fd)) {
 			uint32_t devid = intel_get_drm_devid(data->drm_fd);
 
-			if (data->connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
+			if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
 			    data->pipe == PIPE_A && IS_GEN11(devid)) {
 				igt_debug("DSC not supported on Pipe A on external DP in Gen11 platforms\n");
 				continue;
@@ -304,7 +304,7 @@ igt_main
 					continue;
 				}
 				test_conn_cnt++;
-				run_test(&data, output, test_basic_dsc_enable);
+				run_test(&data, output, connector, test_basic_dsc_enable);
 			}
 			igt_skip_on(test_conn_cnt == 0);
 		}
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
