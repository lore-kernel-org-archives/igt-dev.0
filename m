Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B6210E2FE
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Apr 2022 00:36:39 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 14 Apr 2022 18:33:27 -0600
Message-ID: <20220415003328.514267-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 1/2] tests/kms_panel_fitting: Use 800x600 as
 lowest resolution for AMD devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

800x600 is lowest resolution for recent AMD devices.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_panel_fitting.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index 6c1b748d..7ed0d196 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -107,8 +107,13 @@ static void test_panel_fitting(data_t *d)
 				      DRM_FORMAT_MOD_LINEAR, &d->fb2);
 
 		/* Set up display to enable panel fitting */
-		mode->hdisplay = 640;
-		mode->vdisplay = 480;
+		if (is_amdgpu_device(display->drm_fd)) {
+			mode->hdisplay = 800;
+			mode->vdisplay = 600;
+		} else {
+			mode->hdisplay = 640;
+			mode->vdisplay = 480;
+		}
 		d->plane1 = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 		prepare_crtc(d, output, pipe, d->plane1, mode, COMMIT_LEGACY);
 
-- 
2.35.1
