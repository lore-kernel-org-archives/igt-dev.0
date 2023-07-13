Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5750410E03A
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 14:18:57 +0000 (UTC)
From: Stylon Wang <stylon.wang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 13 Jul 2023 22:18:30 +0800
Message-ID: <20230713141830.335019-1-stylon.wang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t] test/amdgpu/amd_color: Add test description
 to amd_color tests
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

Signed-off-by: Stylon Wang <stylon.wang@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/amdgpu/amd_color.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
index 34002ed88..4a98df3be 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -22,6 +22,8 @@
 
 #include "igt.h"
 
+IGT_TEST_DESCRIPTION("Test Color Features for DRM conformance");
+
 /* (De)gamma LUT. */
 typedef struct lut {
 	struct drm_color_lut *data;
@@ -409,8 +411,11 @@ igt_main
 		igt_display_require_output(&data.display);
 	}
 
+	igt_describe("Tests correctness of linear degamma on CRTC");
 	igt_subtest("crtc-linear-degamma") test_crtc_linear_degamma(&data);
+	igt_describe("Tests correctness of linear regamma on CRTC");
 	igt_subtest("crtc-linear-regamma") test_crtc_linear_regamma(&data);
+	igt_describe("Tests color accuracy of CRTC degamma and regamma");
 	igt_subtest("crtc-lut-accuracy") test_crtc_lut_accuracy(&data);
 
 	igt_fixture
-- 
2.40.1
