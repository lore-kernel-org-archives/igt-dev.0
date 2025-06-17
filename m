Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AABC71155
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:37:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B928310E56A;
	Tue, 17 Jun 2025 04:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0IkbpTSL";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48FB710E56A
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:37:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVpC9/rip7JKh2YDHQXbKt9lm1a1ItGR/VGzaYUqY0CxnFRzNZil5QJ60OACnYb7MuB1/7ktFLkOuhhQxD6w38ndIgts+CIacjC9nrNXNy/4JYj5Lg3/328nnRIVBP1Hv1fAGGAzVL0CEXtrGBXmgPHMXrWSi94wjYy1VV7MaOGv/i0LMRydkaaZ3o3+xRZUxloIROza7QcmCQ58Ed4OdXIJz9Sq2K6aniPanXBiz6ABPvZ6WDZcFCX7XPcZr7KVRDOAnZ0/ggytrhQJIpwcuOUWa4B6Li1zqVSo54eUF6ZDuuDXrnXWeM1vBZpt9OBiRqz/mXSNFsHlPLInwW+vcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecX36Cmsp6t1kNqNSJUUEunI0zyRwOmONWGkg/vXeYM=;
 b=iexDtKLq7AU1dhCJykZUspOkfusUHDbjBqWqG+X9omZfjwPIJWnneFe020V8ZDeNergoThXY+iBMG1m010lkET7VfQ001Tw6ShSfMn+Wa9cfhKQcQSfDUbmsqcEXcZegINrLctJIRrpst2FAB2W9BI3ms7gOLfGRMOV7ffzBRT4jkNicqwhsMsilC69nT2XhoSE20cuOlVJfbT9BIrBldyg0C0K4PEPd3BnRPWmQt0R2BZ/j20gGvzQvQ1KHK5hfvVEiUBIzatgNNqzLgh8hamZW07IC65V540ZYDyk0NZz6h/Sli2n5rc3BLHAes7mEwqiD/kUkTxWQVE4fF/VjUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecX36Cmsp6t1kNqNSJUUEunI0zyRwOmONWGkg/vXeYM=;
 b=0IkbpTSLdxVQ4dJGaiahubEDIoOwpxIKHNAz/XrtI+f4E0/NFMuf3VkJ/t01yMrP76eLQPbe+GCPKmCvNJvubhhAVWf+ZDtbqBqsWfxRK+UHNdIe1lYp8SiEc35437cVHwlKyXW6D7rMieHw7pALGCKkh49u4phvTKP1U+PQdvY=
Received: from DS7PR03CA0036.namprd03.prod.outlook.com (2603:10b6:5:3b5::11)
 by DM4PR12MB6136.namprd12.prod.outlook.com (2603:10b6:8:a9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.42; Tue, 17 Jun
 2025 04:37:35 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:3b5:cafe::11) by DS7PR03CA0036.outlook.office365.com
 (2603:10b6:5:3b5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Tue,
 17 Jun 2025 04:37:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:37:34 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:37:33 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 04/36] lib/igt_kms: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Date: Mon, 16 Jun 2025 22:35:59 -0600
Message-ID: <20250617043631.2920587-5-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617043631.2920587-1-alex.hung@amd.com>
References: <20250617043631.2920587-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|DM4PR12MB6136:EE_
X-MS-Office365-Filtering-Correlation-Id: 596d1681-c20d-4a81-7299-08ddad58ae1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uGzIfzPgO7SwxRkfeeykTHyxhWGDABS+Jj/5Lazq9HMjv4WfnoQBXGgK8ze/?=
 =?us-ascii?Q?K1p6blPZckxyWkqXdox2EmAZylL/Zu3rVptU+cHfPNd3DDb5/by/g5wNfksN?=
 =?us-ascii?Q?WtCCnjmtvRHLBHey9PnFCAcLQlLVpIT6ynBZn+XsZ1a5HK3MqlMWf7hoYn71?=
 =?us-ascii?Q?GMR34kU7+IWpuTOeUiBTNDO6aorFtIstYQIS4UNCz0u0aI3I0FxSnD3YP0WY?=
 =?us-ascii?Q?DGh4S22eMXgWBT+C0pmJuVFxqFFaI9fk6+oP1Q3Z10gBrwzCw6XMX2vq/Fgm?=
 =?us-ascii?Q?CRq1I4HnpTYCD5dUDbL7XI4jFpijoCH/EJvysgo+CKnaw5CLSmpnXrS8k/az?=
 =?us-ascii?Q?IZ+ebiy9h6c3lkdzvYwwnGKtju+sIIm2EEoKfqIewMHBymEV00mo+tq1GpUg?=
 =?us-ascii?Q?NtGkUO3ypGQord6RRQl2xwcWm/mSiVMc3B/4y6eJBDEm0bduC7Aj5Onkvi1m?=
 =?us-ascii?Q?2Gi4GOQuD2xp9H73iyg30jEqZ1ZOOMFfKrQ6zaeu5Y3eprpU3/kSjYYoUSWh?=
 =?us-ascii?Q?ldqRWSawBEIX9GTEkF4/yUOsQzLzA13xjHMzU+Xuu3kMFVDH9ATBAF0Xs1e1?=
 =?us-ascii?Q?nEnQ1ojFue9FuaSpRWw0EAt4ejXAqwgTP2TWKxE/z4HnzIvYxJEm2OXFNiK4?=
 =?us-ascii?Q?1FTpocUOIhCxTLAHpAQBe6hsfvegEGSKeaqCmHLYFcdGo5KGW7XYhQvWxW8u?=
 =?us-ascii?Q?2ziJhNMT4WgsHcTHlqVZeO590EKSbpeqoB4u8/+lTKnu7vo100rpAkBWX8PL?=
 =?us-ascii?Q?Jeshl85TGJrwkk8JX5RmuC7xYMVzRy/jzb+EM6LdVrLaSJkbk1awigq0WGH4?=
 =?us-ascii?Q?/E98R2X5/JteEgT1PlZXCgLaNbxNK1slvdGhM3FVzKaled9zkrB0Chyx10MJ?=
 =?us-ascii?Q?qg4shwxVnbnKW+Ry+80k/lIdodkKh402n2/jUgo2vKWCFKD7+bGHEnHCtQ5W?=
 =?us-ascii?Q?gXc8NR+jVZHbgdAzBhNrySMI2VlxQePozEk/FaGgp6hY6D0WYQSQ9noWhIbr?=
 =?us-ascii?Q?GGP91xQiOxc5zx9RKhlq0VmP4jeej3rEIHZBqvw+5OjpDoMvtYHTSbn5ES/p?=
 =?us-ascii?Q?6EfUqgo99oZg3p2U/Vx0gTmX2gxSb9p79+Evgt9IK9CWsNnfiMEY9CTCnEi2?=
 =?us-ascii?Q?0MRfx9xRUGCB3EeH29lpKf9lQac+sShJ3ea2Z9rVNkYKw3raS2p79YngYtBr?=
 =?us-ascii?Q?744aUvNv8dleVS8Zl/vXmNe39KwaH4bBadb4wMLKIMTWpYG2J1DnuV5YexaX?=
 =?us-ascii?Q?dZzGqLJ/yQ/nkKbuJQFfVHr9SKS6jUdwJdZexRz3jiCeeowM7iNnz2jz2c4K?=
 =?us-ascii?Q?fJGwyT5SOtvRvbduxJTw0YEdGF9ynoAgElo2vHuGgfa5a8W2apLAfcwutE/T?=
 =?us-ascii?Q?/UFHPyZwIBhz3mazHObRCEqohQgsHIhT9w1WTf24GU0jK2d2iWEfIgjH59cD?=
 =?us-ascii?Q?ypxScgcyL34SIWPjrRGQHllhFaZrjwS2aeQCn8L7JRsq/gzqczhPskABmtC1?=
 =?us-ascii?Q?GwBtX6OUbHqIqxGlt1qpt9VLMMRrSONsAKBk?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:37:34.5620 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 596d1681-c20d-4a81-7299-08ddad58ae1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6136
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

v10:
 - Check !display->has_plane_color_pipeline before igt_plane_has_prop (
   IGT_PLANE_COLOR_ENCODING and IGT_PLANE_COLOR_RANGE) (Chaitanya Kumar Borah)

v6:
 - Ignore COLOR_RANGE and COLOR_ENCODING plane properties
   when DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/drm.h | 15 ++++++++++
 lib/igt_kms.c          | 63 ++++++++++++++++++++++++++++++++++--------
 lib/igt_kms.h          |  1 +
 tests/kms_properties.c | 22 +++++++++++----
 4 files changed, 83 insertions(+), 18 deletions(-)

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
index 35c381e40..57059e4f0 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2544,6 +2544,8 @@ static int get_drm_plane_type(int drm_fd, uint32_t plane_id)
 
 static void igt_plane_reset(igt_plane_t *plane)
 {
+	igt_display_t *display = plane->pipe->display;
+
 	/* Reset src coordinates. */
 	igt_plane_set_prop_value(plane, IGT_PLANE_SRC_X, 0);
 	igt_plane_set_prop_value(plane, IGT_PLANE_SRC_Y, 0);
@@ -2560,13 +2562,15 @@ static void igt_plane_reset(igt_plane_t *plane)
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
@@ -2981,6 +2985,9 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	if (drmSetClientCap(drm_fd, LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
 		display->has_virt_cursor_plane = 1;
 
+	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
+		display->has_plane_color_pipeline = 1;
+
 	plane_resources = drmModeGetPlaneResources(display->drm_fd);
 	igt_assert(plane_resources);
 
@@ -3608,6 +3615,29 @@ static uint32_t igt_plane_get_fb_id(igt_plane_t *plane)
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
@@ -3627,6 +3657,12 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_pipe_t *pipe,
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
 
@@ -5214,12 +5250,15 @@ void igt_plane_set_fb(igt_plane_t *plane, struct igt_fb *fb)
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
index 6f96b482f..bfbc3bfc8 100644
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
index b30387888..df8f21992 100644
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

