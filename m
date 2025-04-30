Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F71C369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:36:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5BA10E24D;
	Wed, 30 Apr 2025 01:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hK0ghGBP";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2068.outbound.protection.outlook.com [40.107.100.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F5510E24D
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:36:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mjEYYC9Qg40WhPTwrdRUDpyKrGV7CgmEGctOzmfCDy1lP5gHJNEbX6zvktsw5Cgw7nRxAjH5yJwGJiyZrMw9pe7fmqoYp1MrozHDjHVn6rMKjEubLPLzQYl1GLSvxWrYZkTQ6jZy4cSfM0L0Pqtzr5F1A/8ZzFXFzB+eRIN9KD0Thpz6CeNZmCnlj/j3bmRGW915VnGwSiS8cO3sZC2IdHvr6xFWVbjw0p6yNjBmOG4ate6GztStYVfYvKrpEJNKikMDg8qXHuDHKgnRFnZzXkz6bruUeimp8FoU05wmBF80wCpDp5RVWaHdS8DsFcq45WXEhTZIhLl7dX7FHliiwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLWKv4vSU4GyQnBtUAiGY1R/qWdGiXLB0e2fUfGZ/Sc=;
 b=Y0I8cOG8bI+dOfQblwkqaNNc0of49ZQpJwaME6sbttypWUD6AEX22469HmnXEFjBdC+ocOiPfDz42qTOfjSTdr6FQoG2e3OxP4Rtyr5lc1rmbW5DwaQkQGyRrCAImX2Iz+rJgAcjFdjcKdXuZEGFFklsYijdfFRXs5PvZ8BnhEKsHyBFaXUz/2jLJBhO8da/KzeyZgTMwUUutOsRl7lWFw/nNo1fTJMe0Qtk87Qnwn2ea76vox2QLKSgV9HcN88GX/7rnM//as/BcuXlMQMQH8jyABev1TKXCajaM9vRrcAaGSdU1gCbcTnyKYEAW2tql2yylUWWUQf6krNxAkza9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLWKv4vSU4GyQnBtUAiGY1R/qWdGiXLB0e2fUfGZ/Sc=;
 b=hK0ghGBPxopfyVYOJTUiGC9F2Zw3+vBro9GTsHBqi6m9OovM79LbyzQblxUV3D9nOCcc7X+bvK/8ZeUU6HIuDmOd7yWhCBXT4FK7Bx+B2OxUdC/L88Ybp8NWtjWgVXSPUPiRdLdq4wy6MIFS+3b3Kjhlg9ATFe7YNGc4qed4AKE=
Received: from BYAPR06CA0032.namprd06.prod.outlook.com (2603:10b6:a03:d4::45)
 by PH7PR12MB7354.namprd12.prod.outlook.com (2603:10b6:510:20d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 01:36:11 +0000
Received: from SJ5PEPF000001D0.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::b9) by BYAPR06CA0032.outlook.office365.com
 (2603:10b6:a03:d4::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Wed,
 30 Apr 2025 01:36:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D0.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:36:11 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:36:09 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 04/36] lib/igt_kms: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Date: Tue, 29 Apr 2025 19:34:22 -0600
Message-ID: <20250430013454.226910-5-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430013454.226910-1-alex.hung@amd.com>
References: <20250430013454.226910-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D0:EE_|PH7PR12MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eda76e0-b32a-4732-2ba1-08dd87876360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fm1YT7ajxGgjl9iRpog4wVhX3LMDvQgtJohNA3kTgTSBTWc7mCMDR2t82tIW?=
 =?us-ascii?Q?//puEE73sSZzp3mvBtVU0WsckvNKedKRT+G5Z6pB4VWgdXMurckJHKRraIpi?=
 =?us-ascii?Q?g1zhkY9EI0g3aEFN2a+YkHy/PZEbrOOegHlPpSErR6XQ0QjEu2k/zIrtLZ5V?=
 =?us-ascii?Q?DNH/5f8mVU1iZllWGHS/XbrMB9Mav6fGN+ww1B1hZkTSWORealrKAjJk/HFf?=
 =?us-ascii?Q?XQ63c9sjIVDErmYcSeo7HRuZVzctpASOSFuIcKKHPYumDgoYBMeKB8PM5CJR?=
 =?us-ascii?Q?m2reIfeLFnHewk/CGYY+w2tyhnxTmNqGw1aMhHqRhysD9diuPi8Le47CVXse?=
 =?us-ascii?Q?L3KU0Q2tK/OGoVPhAMD8Saha1ZYQPahHIT5JU73QxcBsKn6hf1GY57d9jTwb?=
 =?us-ascii?Q?5UlAfom1rUcf7o09O5NOFcA8zLghiWBbLbYtpJyh7qY8P0IEL4Yp3o02lMJG?=
 =?us-ascii?Q?IWRH08C+6FDJu7uP4E9goIUlbR6HzxQn30KUPa6y8AiaahYK69YIWA0VtRRZ?=
 =?us-ascii?Q?BJUZIM7R2DkrFCYo4b7dgHrDlVoel3pB4/STP38y6tFRkXjajM4sdYAMC1YN?=
 =?us-ascii?Q?xyKNEQve4OJz/aOeuP5Mf+4mX6/41PDNmwOhKidydCQvxZzDy89bRy8VWQt5?=
 =?us-ascii?Q?fALjUuzLedDd3pk89gbV0z4Jk0gxM6FrrEx0/hVwRlqu3uOK0xGPwENKoCmf?=
 =?us-ascii?Q?dMUuO/5h7rv+04hI7OnW25WvPjkpaHYP83pCgjzz3rEamGmGnb9sqcTJeIWm?=
 =?us-ascii?Q?COGO548IMF2drh0ZzBmPKIgLCdZ6SoW9Zx8BdJvt6ecigMvwMPLt98MevdYj?=
 =?us-ascii?Q?yL1EkfQmIusPGwfhM2a4AE71w+zHJMV2hJMUz4RwPLJvrT5StrU6S3jDF0c0?=
 =?us-ascii?Q?7AKp/ZDZ/kB6kVpiWhWfXWkQ8uSNHLjBhNA/IhmN/mjaYQ+X01AeyPgEx6HC?=
 =?us-ascii?Q?FRFnICCKFmF8UyB9dPbbvrSoOINvzguO1fDKmW3kTBAWpz/fPXWsAaEifDts?=
 =?us-ascii?Q?GTBUuYIp+ltk+qegJTO0HbjqtiQ7y0YpyMzY5Ja/bwWeD9mlSJF+gEp7d+wW?=
 =?us-ascii?Q?MzdrQ7/Jf4/aFgQSIgF3Ts1ymO8lUVERBpigimlAiGRpRQvDsanpu7H8w/Of?=
 =?us-ascii?Q?FCSW9dJ+mM5TYq55FdsM1c0tGuNgc+NDJIn2SfMsA0Erh3+mbiRUMbkXnWmC?=
 =?us-ascii?Q?THJm2G8tOIfuweq5gE5YD4kpe9dZDvtZOroHSE6ZETo93CvJbxqwp3xf5HKF?=
 =?us-ascii?Q?Fete0nRYMADmLwvuJNXVjsyFSn6kb4F0hc1p7FBfjv6WV3slTSA1748Nut04?=
 =?us-ascii?Q?HDXUzR/0Mpf7GlkCcHVCJnmgdxDiZhfoa4H95ec8jOR5zkfbvTgZjHRC+rkd?=
 =?us-ascii?Q?yrTLbHkAbcNXALolqisSLwbqQdhB7DChVgLLV/LD1TFohTXuHXiQxsiz2MYU?=
 =?us-ascii?Q?tAujsiwb2+BK9+I2ejrF5m67A5Z2JbbZPurIuFsdStffwe/gFY6OMTNpTNCy?=
 =?us-ascii?Q?pY5FvXyDKdY9Er+QVeed3MxGPpCFU7EmDiSj?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:36:11.2655 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eda76e0-b32a-4732-2ba1-08dd87876360
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7354
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Harry Wentland <harry.wentland@amd.com>

Setting the COLOR_PIPELINE plane prop is only allowed when the
DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set.

Setting COLOR_RANGE and COLOR_ENCODING is only allowed when the
DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is NOT set.

v6:
 - Ignore COLOR_RANGE and COLOR_ENCODING plane properties
   when DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/drm.h | 15 +++++++++++++++
 lib/igt_kms.c          | 32 ++++++++++++++++++++++++++++++++
 lib/igt_kms.h          |  1 +
 tests/kms_properties.c | 22 ++++++++++++++++------
 4 files changed, 64 insertions(+), 6 deletions(-)

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index 4e4f7c2c3..6b9af3348 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -869,6 +869,21 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
 
+/**
+ * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
+ *
+ * If set to 1, the DRM core will
+ * - expose plane COLOR_PIPELINE properties for pre-blending color management.
+ * - reject setting of these plane properties:
+ *   - COLOR_ENCODING
+ *   - COLOR_RANGE
+ *
+ * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
+ *
+ * This capability is currently in development.
+ */
+#define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
+
 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 9b817c98f..9ebe22d1b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2981,6 +2981,9 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	if (drmSetClientCap(drm_fd, LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
 		display->has_virt_cursor_plane = 1;
 
+	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
+		display->has_plane_color_pipeline = 1;
+
 	plane_resources = drmModeGetPlaneResources(display->drm_fd);
 	igt_assert(plane_resources);
 
@@ -3608,6 +3611,29 @@ static uint32_t igt_plane_get_fb_id(igt_plane_t *plane)
 	igt_assert_eq(r, 0);	\
 }
 
+static bool
+igt_atomic_ignore_plane_prop(igt_pipe_t *pipe, uint32_t prop)
+{
+	igt_display_t *display = pipe->display;
+
+	if (display->has_plane_color_pipeline) {
+		switch(prop) {
+		case IGT_PLANE_COLOR_ENCODING:
+		case IGT_PLANE_COLOR_RANGE:
+			return true;
+		default:
+			return false;
+		}
+	} else {
+		switch(prop) {
+		default:
+			return false;
+		}
+	}
+
+	return false;
+}
+
 /*
  * Add position and fb changes of a plane to the atomic property set
  */
@@ -3627,6 +3653,12 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_pipe_t *pipe,
 	    igt_plane_get_fb_id(plane));
 
 	for (i = 0; i < IGT_NUM_PLANE_PROPS; i++) {
+		if (igt_atomic_ignore_plane_prop(pipe, i)) {
+			igt_debug("plane %s.%d: Ignoring property \"%s\" to 0x%"PRIx64"/%"PRIi64"\n",
+				kmstest_pipe_name(pipe->pipe), plane->index, igt_plane_prop_names[i],
+			plane->values[i], plane->values[i]);			continue;
+		}
+
 		if (!igt_plane_is_prop_changed(plane, i))
 			continue;
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 9b5a940f7..7531ae53b 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -503,6 +503,7 @@ struct igt_display {
 	bool has_cursor_plane;
 	bool is_atomic;
 	bool has_virt_cursor_plane;
+	bool has_plane_color_pipeline;
 	bool first_commit;
 
 	uint64_t *modifiers;
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 408e23578..01ec3bedc 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -101,7 +101,7 @@ static void cleanup_pipe(igt_display_t *display, enum pipe pipe, igt_output_t *o
 }
 
 static bool ignore_property(uint32_t obj_type, uint32_t prop_flags,
-			    const char *name, bool atomic)
+			    const char *name, bool atomic, bool has_color_pipeline)
 {
 	if (prop_flags & DRM_MODE_PROP_IMMUTABLE)
 		return true;
@@ -111,6 +111,16 @@ static bool ignore_property(uint32_t obj_type, uint32_t prop_flags,
 		if (atomic && !strcmp(name, "DPMS"))
 			return true;
 		break;
+	case DRM_MODE_OBJECT_PLANE:
+		if (has_color_pipeline && !strcmp(name, "COLOR_RANGE")) {
+			printf("hwhw: ignoring COLOR_RANGE\n");
+			return true;
+		}
+		if (has_color_pipeline && !strcmp(name, "COLOR_ENCODING")) {
+			printf("hwhw: ignoring COLOR_ENCODING\n");
+			return true;
+		}
+		break;
 	default:
 		break;
 	}
@@ -164,7 +174,7 @@ static bool has_additional_test_lookup(uint32_t obj_type, const char *name,
 
 	return false;
 }
-static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic)
+static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic, bool has_color_pipeline)
 {
 	drmModeObjectPropertiesPtr props =
 		drmModeObjectGetProperties(fd, id, type);
@@ -183,7 +193,7 @@ static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic)
 
 		igt_assert(prop);
 
-		if (ignore_property(type, prop->flags, prop->name, atomic)) {
+		if (ignore_property(type, prop->flags, prop->name, atomic, has_color_pipeline)) {
 			igt_debug("Ignoring property \"%s\"\n", prop->name);
 
 			continue;
@@ -230,7 +240,7 @@ static void run_plane_property_tests(igt_display_t *display, enum pipe pipe, igt
 		igt_info("Testing plane properties on %s.#%d-%s (output: %s)\n",
 			 kmstest_pipe_name(pipe), plane->index, kmstest_plane_type_name(plane->type), output->name);
 
-		test_properties(display->drm_fd, DRM_MODE_OBJECT_PLANE, plane->drm_plane->plane_id, atomic);
+		test_properties(display->drm_fd, DRM_MODE_OBJECT_PLANE, plane->drm_plane->plane_id, atomic, display->has_plane_color_pipeline);
 	}
 
 	cleanup_pipe(display, pipe, output, &fb);
@@ -244,7 +254,7 @@ static void run_crtc_property_tests(igt_display_t *display, enum pipe pipe, igt_
 
 	igt_info("Testing crtc properties on %s (output: %s)\n", kmstest_pipe_name(pipe), output->name);
 
-	test_properties(display->drm_fd, DRM_MODE_OBJECT_CRTC, display->pipes[pipe].crtc_id, atomic);
+	test_properties(display->drm_fd, DRM_MODE_OBJECT_CRTC, display->pipes[pipe].crtc_id, atomic, false);
 
 	cleanup_pipe(display, pipe, output, &fb);
 }
@@ -258,7 +268,7 @@ static void run_connector_property_tests(igt_display_t *display, enum pipe pipe,
 
 	igt_info("Testing connector properties on output %s (pipe: %s)\n", output->name, kmstest_pipe_name(pipe));
 
-	test_properties(display->drm_fd, DRM_MODE_OBJECT_CONNECTOR, output->id, atomic);
+	test_properties(display->drm_fd, DRM_MODE_OBJECT_CONNECTOR, output->id, atomic, false);
 
 	if (pipe != PIPE_NONE)
 		cleanup_pipe(display, pipe, output, &fb);
-- 
2.43.0

