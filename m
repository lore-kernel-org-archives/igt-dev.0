Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38AF6E8B2
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Feb 2021 09:48:37 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Fri, 19 Feb 2021 15:19:16 +0530
Message-Id: <20210219094916.673519-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3] tests/kms_properties: Add subtest
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
Cc: B@freedesktop.org, Sharma@freedesktop.org, S@freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Added description for all subtests

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: Sharma, Swati2 <swati2.sharma@intel.com>
Cc: B S, Karthik <Karthik.B.S@intel.com>

v2, v3: modified subtests description to be more specific. (swati)
---
 tests/kms_properties.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index b743f9d6..c7d7fe73 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -735,35 +735,51 @@ igt_main
 		igt_display_require(&display, display.drm_fd);
 	}
 
+	igt_describe("Tests plane properties with legacy commit");
 	igt_subtest("plane-properties-legacy")
 		plane_properties(&display, false);
 
+	igt_describe("Tests plane properties with atomic commit");
 	igt_subtest("plane-properties-atomic")
 		plane_properties(&display, true);
 
+	igt_describe("Tests crtc properties with legacy commit");
 	igt_subtest("crtc-properties-legacy")
 		crtc_properties(&display, false);
 
+	igt_describe("Tests crtc properties with atomic commit");
 	igt_subtest("crtc-properties-atomic")
 		crtc_properties(&display, true);
 
+	igt_describe("Tests connector properties with legacy commit");
 	igt_subtest("connector-properties-legacy")
 		connector_properties(&display, false);
 
+	igt_describe("Tests connector properties with atomic commit");
 	igt_subtest("connector-properties-atomic")
 		connector_properties(&display, true);
 
+	igt_describe("Checks each property of any type with combination of mode object with legacy "
+			"commit and make sure only valid properties are set to mode object else "
+			"return with relevant error");
+
 	igt_subtest("invalid-properties-legacy")
 		invalid_properties(&display, false);
 
+	igt_describe("Checks each property of any type with combination of mode object with atomic "
+		       "commit and make sure only valid properties are set to mode object else "
+		       "return with relevant error");
+
 	igt_subtest("invalid-properties-atomic")
 		invalid_properties(&display, true);
 
+	igt_describe("Test validates the properties of all planes, crtc and connectors with atomic commit");
 	igt_subtest("get_properties-sanity-atomic") {
 		igt_skip_on(!display.is_atomic);
 		get_prop_sanity(&display, true);
 	}
 
+	igt_describe("Test validates the properties of all planes, crtc and connectors with legacy commit");
 	igt_subtest("get_properties-sanity-non-atomic") {
 		if (display.is_atomic)
 			igt_assert_eq(drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 0), 0);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
