Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDD3CA0ED1
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:07:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208EB10E972;
	Fri, 15 Aug 2025 04:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1jvB5qn5";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF96C10E972
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:07:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EBBs3YLgZhZ0toB7hmUcTothN1iLJO0NW+3Q8+k973+qkXui7OQ4tsJYXdMBOg/CtixcaNP+IzKAxjQPm+WES5h7fjw03bys238A1Ywt5YkPbHVfc+nCKe6mL6fWyp7MA49iTIpq5z+0Gx+uZNGRJ0CSIv34i9aW9CI8RMhlv8d5QiPiQh/XybnAsrg4rmqAvtf/KpMioazII+eU3tbicKlA0+dxEBPMHLRk/0PEU0DQO0QV83bNfl0EawWAd+Ej7OHhw2a9Lp1O29U553SuH3PG3hFEm+hn4oBheccq13kqBtSYwcBrO9p8LP0JsVrMlP9VAU/WtyXfnYMHq49WIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUhsADsHJsOlZmmy/yU1gNJgpk2wLvfyaBxrSHiEr0I=;
 b=eFrCziJIesiL8iunmHeublRzfJ3p3jCKaykDMYXJ4m4oWxmVAan4kOqOZLb4kPfd5VeF8QX91rLLWChqC2rMCCHI66NDwd9uDYVebuZaFMeTkcpi3mu4HOWEOrKRu3Cbqw8jEpsTYvpDjeUGeAmi0rw0pDcWJRNWLXhI9CE0Tr/XeYmWEo7q1/siPKMnvhQW+mS3nfH8pFG9MG/g05LWGRSq3AhE75ZW6iPrkmsEddhjRG8FbCF2TqTUpGl9vajVeJlH923fAX+YseVQYtFYqYIeB7Qp2Y3aB6NtG4+HO2npsha6WC1W/+ts5aQs7z2/wzIlqNJnrzTgyLh8uFQ9fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUhsADsHJsOlZmmy/yU1gNJgpk2wLvfyaBxrSHiEr0I=;
 b=1jvB5qn5QULBlqIsi3xvHRoAohMg9evihiGZ92WTlZX/ItgYpL7RbumJ+sUqCwsTUohDSYYg7zlRCDvVB0gy/TmUEH33aje5q2koM55/F0VEUFX+qKQ3UZJD4Uwg6KKnL0EJ8/jN0Jpx6Edfqv8BI924ACGBxu+KIQyOb8vW9fw=
Received: from BYAPR03CA0027.namprd03.prod.outlook.com (2603:10b6:a02:a8::40)
 by CYXPR12MB9443.namprd12.prod.outlook.com (2603:10b6:930:db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 04:07:40 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a02:a8:cafe::98) by BYAPR03CA0027.outlook.office365.com
 (2603:10b6:a02:a8::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 04:07:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:07:39 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:07:37 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 02/30] lib/igt_kms: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Date: Thu, 14 Aug 2025 22:06:31 -0600
Message-ID: <20250815040659.3321102-3-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815040659.3321102-1-alex.hung@amd.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|CYXPR12MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c5cb01-6ffa-4254-9b25-08dddbb146b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F/WyP6AWCfB6EkWMMbMY2JH6Y5pTbKb8+qrzK3mk1sKcnLZnjuPoXM9gsOcV?=
 =?us-ascii?Q?rNu/Hw2PTMWHUls5T1nXw/gWd2/xbn8xD2rK2p10J+YUiYjWTSKA/kozk6zX?=
 =?us-ascii?Q?r/Jcwnt3yKTa4i+crfdX/QsYhYIN5yqNMxtHRDsYJ1K+WCqtWY804KlGi8Sj?=
 =?us-ascii?Q?G5Ri2S5NpUE7ULW4KMOxeTiJmLS7Od19EXf3t4yoHHrIUX3oO+vySokURiJT?=
 =?us-ascii?Q?VoJtAnOCaUaaFsYU2xx+nG7PMDZfxtqOxzrQa2TH8OQ9i7vfitpO0UNUDF4k?=
 =?us-ascii?Q?DqeIOMTf5WoN9tRRuAahQje9VIXcGkiX7pjwU1njQC95J5LHVz2v+wiih2iO?=
 =?us-ascii?Q?ms6YTrBgIT7H4NhLChRPBMFy3iTgsr0hC+26JHW247s/lD0a5OBpmbfeh9+n?=
 =?us-ascii?Q?jC6KupSqG9xPhYaNYJSb4CybGQvY4o580gTSvv443QVqDZnIYSiGeV4fKZEO?=
 =?us-ascii?Q?dHOQi9Tg35SZSZJxKMYzYGKjZYZo8iPOKdLo7ftI3zWh/wcdMfv3z0vdRonf?=
 =?us-ascii?Q?zZotKCof5iF5ZHwvyOLgUsZRBfLymD4obhw9buPlqkFfNv3v57W+ICETuXBr?=
 =?us-ascii?Q?HHzo+gKFPRxX3cEwIaY2T2RnCybnDTgps1QXQTn1jeb/3PVa0zdzskOViL6m?=
 =?us-ascii?Q?f5BLWardE+bOYJWOO2ElLJyyT5qi+QrtIeyLzZXApEn8xmCfoOpNg34Jmurq?=
 =?us-ascii?Q?zDXMW/s5Yygcb6ogvLam5AV+TznitqWR6nrixXqaa1S2950oxL/kuSuY4FtI?=
 =?us-ascii?Q?4E7O/XpIkk4TaHspr+JPXeOz/9UqEXtAYtJRGC5hmBRbOVDSAuc7SCoUuAjH?=
 =?us-ascii?Q?jIMEwFGBXWJGJZVvFXokI/WGserCBhBeIAM9uTkWkJ4etExV5SiHAu8cUelP?=
 =?us-ascii?Q?Zw7AhE5vuCuQVIAgAj66xMteMIFZOAzH6cOqVSxFqB5GlLkYmhe5Ftba5sPf?=
 =?us-ascii?Q?IvI+Zw/obMWnbqMGrglPw7qQm4h1ITnXqTkqCCf2IXYzTcxkWnTbNyNHHqB3?=
 =?us-ascii?Q?aV3ko0TqQdVO6N+v/qyWQp8dI/8Y+hntjnxM+yxhZjZ4ngFW9k9kSDzLJcEj?=
 =?us-ascii?Q?5RAZysvHQwVDdLGDAw6PUFn2CgtP6TAwGgtN0lpeR78ujuKVt33nyUJRmJ8R?=
 =?us-ascii?Q?fxXFFiUPyEBB69T+q44ddhd39yZCJuHt817A3wYwGjW1TaXJ7WdCrPCjVUUj?=
 =?us-ascii?Q?VazKvfldDDnmCNTVBrbdSasK4FKCXpThEgn8Cy3g0JdcWAXf9VRAW+gWOm6i?=
 =?us-ascii?Q?UaSpRODGmu6vGEjVH7sstIYBsrAOSMDwwf/lHZxDEsPFB+/JR9LtMFgo0AFI?=
 =?us-ascii?Q?1WM1vFgyl2LXJSS5Rq9CTKgHQrL0AuhgkbXiViRlZFRSQk+DmA5wHix4AigJ?=
 =?us-ascii?Q?9j5IDFa9DhEKrBQjE44HUTBXq6hvlzyJyv4wjgtThS+0Go7hSXBukFPMUOwq?=
 =?us-ascii?Q?qbYa1wY99bEKO4FF0H3mE/EeNHBqAqQQinjxiYZAWoAoiFdjpl2NvJZ7pIcH?=
 =?us-ascii?Q?OHTTFkRPX70Ic7f1ohGKPQrW3Icjqy6KlbPy?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:07:39.6906 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c5cb01-6ffa-4254-9b25-08dddbb146b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9443
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

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/drm.h | 15 ++++++++++
 lib/igt_kms.c          | 63 ++++++++++++++++++++++++++++++++++--------
 lib/igt_kms.h          |  1 +
 tests/kms_properties.c | 20 ++++++++++----
 4 files changed, 81 insertions(+), 18 deletions(-)

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
index 7191bf92e..a9641eba4 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2545,6 +2545,8 @@ static int get_drm_plane_type(int drm_fd, uint32_t plane_id)
 
 static void igt_plane_reset(igt_plane_t *plane)
 {
+	igt_display_t *display = plane->pipe->display;
+
 	/* Reset src coordinates. */
 	igt_plane_set_prop_value(plane, IGT_PLANE_SRC_X, 0);
 	igt_plane_set_prop_value(plane, IGT_PLANE_SRC_Y, 0);
@@ -2561,13 +2563,15 @@ static void igt_plane_reset(igt_plane_t *plane)
 	igt_plane_set_prop_value(plane, IGT_PLANE_FB_ID, 0);
 	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID, 0);
 
-	if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_ENCODING))
-		igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_ENCODING,
-			igt_color_encoding_to_str(IGT_COLOR_YCBCR_BT601));
+	if (!display->has_plane_color_pipeline) {
+		if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_ENCODING))
+			igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_ENCODING,
+				igt_color_encoding_to_str(IGT_COLOR_YCBCR_BT601));
 
-	if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_RANGE))
-		igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_RANGE,
-			igt_color_range_to_str(IGT_COLOR_YCBCR_LIMITED_RANGE));
+		if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_RANGE))
+			igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_RANGE,
+				igt_color_range_to_str(IGT_COLOR_YCBCR_LIMITED_RANGE));
+	}
 
 	/* Use default rotation */
 	if (igt_plane_has_prop(plane, IGT_PLANE_ROTATION))
@@ -2982,6 +2986,9 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	if (drmSetClientCap(drm_fd, LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
 		display->has_virt_cursor_plane = 1;
 
+	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
+		display->has_plane_color_pipeline = 1;
+
 	plane_resources = drmModeGetPlaneResources(display->drm_fd);
 	igt_assert(plane_resources);
 
@@ -3609,6 +3616,29 @@ static uint32_t igt_plane_get_fb_id(igt_plane_t *plane)
 	igt_assert_eq(r, 0);	\
 }
 
+static bool
+igt_atomic_ignore_plane_prop(igt_pipe_t *pipe, uint32_t prop)
+{
+	igt_display_t *display = pipe->display;
+
+	if (display->has_plane_color_pipeline) {
+		switch (prop) {
+		case IGT_PLANE_COLOR_ENCODING:
+		case IGT_PLANE_COLOR_RANGE:
+			return true;
+		default:
+			return false;
+		}
+	} else {
+		switch (prop) {
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
@@ -3628,6 +3658,12 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_pipe_t *pipe,
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
 
@@ -5222,12 +5258,15 @@ void igt_plane_set_fb(igt_plane_t *plane, struct igt_fb *fb)
 		igt_fb_set_position(fb, plane, 0, 0);
 		igt_fb_set_size(fb, plane, fb->width, fb->height);
 
-		if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_ENCODING))
-			igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_ENCODING,
-				igt_color_encoding_to_str(fb->color_encoding));
-		if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_RANGE))
-			igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_RANGE,
-				igt_color_range_to_str(fb->color_range));
+		if (!display->has_plane_color_pipeline) {
+			if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_ENCODING))
+				igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_ENCODING,
+					igt_color_encoding_to_str(fb->color_encoding));
+
+			if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_RANGE))
+				igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_RANGE,
+					igt_color_range_to_str(fb->color_range));
+		}
 
 		/* Hack to prioritize the plane on the pipe that last set fb */
 		igt_plane_set_pipe(plane, pipe);
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index f140ad91a..8ec39fa85 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -508,6 +508,7 @@ struct igt_display {
 	bool has_cursor_plane;
 	bool is_atomic;
 	bool has_virt_cursor_plane;
+	bool has_plane_color_pipeline;
 	bool first_commit;
 
 	uint64_t *modifiers;
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index b30387888..e646b8184 100644
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
@@ -111,6 +111,14 @@ static bool ignore_property(uint32_t obj_type, uint32_t prop_flags,
 		if (atomic && !strcmp(name, "DPMS"))
 			return true;
 		break;
+	case DRM_MODE_OBJECT_PLANE:
+		if (has_color_pipeline && !strcmp(name, "COLOR_RANGE"))
+			return true;
+
+		if (has_color_pipeline && !strcmp(name, "COLOR_ENCODING"))
+			return true;
+
+		break;
 	default:
 		break;
 	}
@@ -164,7 +172,7 @@ static bool has_additional_test_lookup(uint32_t obj_type, const char *name,
 
 	return false;
 }
-static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic)
+static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic, bool has_color_pipeline)
 {
 	drmModeObjectPropertiesPtr props =
 		drmModeObjectGetProperties(fd, id, type);
@@ -183,7 +191,7 @@ static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic)
 
 		igt_assert(prop);
 
-		if (ignore_property(type, prop->flags, prop->name, atomic)) {
+		if (ignore_property(type, prop->flags, prop->name, atomic, has_color_pipeline)) {
 			igt_debug("Ignoring property \"%s\"\n", prop->name);
 
 			continue;
@@ -230,7 +238,7 @@ static void run_plane_property_tests(igt_display_t *display, enum pipe pipe, igt
 		igt_info("Testing plane properties on %s.#%d-%s (output: %s)\n",
 			 kmstest_pipe_name(pipe), plane->index, kmstest_plane_type_name(plane->type), output->name);
 
-		test_properties(display->drm_fd, DRM_MODE_OBJECT_PLANE, plane->drm_plane->plane_id, atomic);
+		test_properties(display->drm_fd, DRM_MODE_OBJECT_PLANE, plane->drm_plane->plane_id, atomic, display->has_plane_color_pipeline);
 	}
 
 	cleanup_pipe(display, pipe, output, &fb);
@@ -244,7 +252,7 @@ static void run_crtc_property_tests(igt_display_t *display, enum pipe pipe, igt_
 
 	igt_info("Testing crtc properties on %s (output: %s)\n", kmstest_pipe_name(pipe), output->name);
 
-	test_properties(display->drm_fd, DRM_MODE_OBJECT_CRTC, display->pipes[pipe].crtc_id, atomic);
+	test_properties(display->drm_fd, DRM_MODE_OBJECT_CRTC, display->pipes[pipe].crtc_id, atomic, false);
 
 	cleanup_pipe(display, pipe, output, &fb);
 }
@@ -258,7 +266,7 @@ static void run_connector_property_tests(igt_display_t *display, enum pipe pipe,
 
 	igt_info("Testing connector properties on output %s (pipe: %s)\n", output->name, kmstest_pipe_name(pipe));
 
-	test_properties(display->drm_fd, DRM_MODE_OBJECT_CONNECTOR, output->id, atomic);
+	test_properties(display->drm_fd, DRM_MODE_OBJECT_CONNECTOR, output->id, atomic, false);
 
 	if (pipe != PIPE_NONE)
 		cleanup_pipe(display, pipe, output, &fb);
-- 
2.43.0

