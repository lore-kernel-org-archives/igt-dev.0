Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CD16E837
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Nov 2021 09:48:37 +0000 (UTC)
From: Perry Yuan <Perry.Yuan@amd.com>
Date: Fri, 19 Nov 2021 04:48:22 -0500
Message-ID: <20211119094822.2240179-1-Perry.Yuan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v1] amdgpu/amd_bypass: add check for the
 connection type of the CRC source
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
Cc: Alexander.Deucher@amd.com, Xinmei.Huang@amd.com, Ray.Huang@amd.com, Perry Yuan <Perry.Yuan@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

Bypass test will set the CRC pipe source as dprx, kernel drm driver will crash because
of the aux->transfer function is set NULL when only HDMI cable connection.
This patch add connection type check and status check to avoid invalid test
case run ,otherwise kernel will be crash for aux transfer function is
null under hdmi connection case.

BugLink: https://gitlab.freedesktop.org/drm/amd/-/issues/1546
Signed-off-by: Perry Yuan <Perry.Yuan@amd.com>
---
 tests/amdgpu/amd_bypass.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
index 75ad8521..28ba848c 100644
--- a/tests/amdgpu/amd_bypass.c
+++ b/tests/amdgpu/amd_bypass.c
@@ -31,6 +31,7 @@ typedef struct {
 	int width;
 	int height;
 	enum pipe pipe_id;
+	bool output_valid;
 	igt_display_t display;
 	igt_plane_t *primary;
 	igt_output_t *output;
@@ -57,6 +58,24 @@ const char *ptnstr[TEST_PATTERN_MAX] = {
 	"DP Color Squares VESA"
 };
 
+static void igt_amd_require_dp_connection(data_t *data)
+{
+       igt_display_t *display = &data->display;
+
+       data->output_valid = false;
+       /* find connected DP or eDP outputs */
+       for (int i=0; i < display->n_outputs; ++i) {
+               drmModeConnector *connector = display->outputs[i].config.connector;
+               if ((connector->connector_type == DRM_MODE_CONNECTOR_eDP ||
+						connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) &&
+						connector->connection == DRM_MODE_CONNECTED) {
+					data->output_valid = true;
+					return;
+               }
+       }
+       igt_skip("Requires connected DP or eDP output!\n");
+}
+
 /* Common test setup. */
 static void test_init(data_t *data)
 {
@@ -71,6 +90,9 @@ static void test_init(data_t *data)
 	data->output = igt_get_single_output_for_pipe(display, data->pipe_id);
 	igt_assert(data->output);
 
+	igt_amd_require_dp_connection(data);
+	igt_assert(data->output_valid);
+
 	data->mode = igt_output_get_mode(data->output);
 	igt_assert(data->mode);
 
-- 
2.25.1
