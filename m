Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FE98982A
 for <igt-dev@lists.freedesktop.org>; Sat,  2 Jan 2021 12:00:22 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Sat,  2 Jan 2021 06:17:55 +0530
Message-Id: <20210102004755.3187052-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_properties:Add subtest description
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
To: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com, nidhi1.gupta@intel.com
Cc: Gupta@freedesktop.org, S@freedesktop.org, B@freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Added description for all subtests

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
Cc: B S, Karthik <Karthik.B.S@intel.com>
---
 tests/kms_properties.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index b743f9d6..77489823 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -735,35 +735,45 @@ igt_main
 		igt_display_require(&display, display.drm_fd);
 	}
 
+	igt_describe("Test plane properties with legacy commit");
 	igt_subtest("plane-properties-legacy")
 		plane_properties(&display, false);
 
+	igt_describe("Test plane properties with atomic commit");
 	igt_subtest("plane-properties-atomic")
 		plane_properties(&display, true);
 
+	igt_describe("Test crtc properties with legacy commit");
 	igt_subtest("crtc-properties-legacy")
 		crtc_properties(&display, false);
 
+	igt_describe("Test crtc properties with atomic commit");
 	igt_subtest("crtc-properties-atomic")
 		crtc_properties(&display, true);
 
+	igt_describe("Test connector properties with legacy commit");
 	igt_subtest("connector-properties-legacy")
 		connector_properties(&display, false);
 
+	igt_describe("Test connector properties with atomic commit");
 	igt_subtest("connector-properties-atomic")
 		connector_properties(&display, true);
 
+	igt_describe("checks each property of any type with combination of mode object with legacy commit");
 	igt_subtest("invalid-properties-legacy")
 		invalid_properties(&display, false);
 
+	igt_describe("checks each property of any type with combination of mode object with atomic commit");
 	igt_subtest("invalid-properties-atomic")
 		invalid_properties(&display, true);
 
+	igt_describe("validate the properties of all planes, crtc and connectors with atomic commit");
 	igt_subtest("get_properties-sanity-atomic") {
 		igt_skip_on(!display.is_atomic);
 		get_prop_sanity(&display, true);
 	}
 
+	igt_describe("validate the properties of all planes, crtc and connectors with legacy commit");
 	igt_subtest("get_properties-sanity-non-atomic") {
 		if (display.is_atomic)
 			igt_assert_eq(drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 0), 0);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
