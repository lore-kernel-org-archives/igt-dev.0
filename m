Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3BCCEACF9
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:19:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4E910EBDD;
	Sat, 15 Nov 2025 00:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4tVVFElF";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010030.outbound.protection.outlook.com [52.101.85.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A82F10EBDD
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:19:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emK8SslXOoET/myaBvVphbAgkalow6JlycC/dug/kGQyMTUJqdHlnA+e+2KVqPjZRCKEHMmeDD8Ncxahmt06s6pcFv+s4lQ9fJNEwy0QaMKwuw3RFBBO/2qnRM7RW/R9NF4SpzzydzqmaKQIj7jcnaee5afnocPsr+jXJSvrn0lrNbHumjZVCja273i77VQpWczxwX/lK3SdKIulcERujnGhXGC6Pmm/SXqhLYbDmHoZo2F2tDoWqjTGyHLX2iqGUDE/5LmFSJzhGeh09MGTOgOsp+5ZsxAZQQvEgW00qHtaVwPOVXIXfwAUna1BlvijFRL57KMr63uhwmZoaKAXrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1LKyodZbd5d2fiZICirpxnbm42uotgkabajfLeXZJA=;
 b=Elof1EI5t5nU/KOIGvWnRjK/8jXTNLx72ysPWpPAZyWd/nz4AFUb9+q8ZU0VbjzL568K6wEf23uSsloBzsqld0r7aQSp7Oe7u+8wAL2kLdT7oD1c2EHo2QKCrDhWis6p0+YI6+k4/XWlNkAq7eAjdYK+uIYtY636+YCvoD20CxDT6LlrEnruwDNhzf+o78WTy+CiPXUc4Bxn8qfc9glt3RfYxiG4sMdAllB5LxzqEjMti5x7rogx6DISIOKIrB7Z/UoHwBcMbfgQfAhNGfB0fFdOQt3gTGl3i8suAGWBstkcdZVjMXUjEZY6WluBvdC3R+H9m0drnHusYE5jKOsp3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1LKyodZbd5d2fiZICirpxnbm42uotgkabajfLeXZJA=;
 b=4tVVFElFpG14UNV1p2LXEamKCDY+Mwau9Y6RBK9+q+yX9R5osD4vNfM1pogQ5TAInhirT6o7sYFaY6x/utsp+6BSZKBC0ZMh2nSwD8H415g9i/O95uxgUZ9ZHNo7rtLxg0dNJAaf/X/agD/i6QG1h3xqx2vlbpJ0HKigGVGwKH0=
Received: from BL0PR02CA0100.namprd02.prod.outlook.com (2603:10b6:208:51::41)
 by CY8PR12MB7562.namprd12.prod.outlook.com (2603:10b6:930:95::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Sat, 15 Nov
 2025 00:19:41 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:208:51:cafe::4f) by BL0PR02CA0100.outlook.office365.com
 (2603:10b6:208:51::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:19:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:19:41 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:19:40 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 04/32] drm-uapi: Add COLOROP objects
Date: Fri, 14 Nov 2025 17:18:13 -0700
Message-ID: <20251115001841.3563993-5-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115001841.3563993-1-alex.hung@amd.com>
References: <20251115001841.3563993-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|CY8PR12MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: b79c8263-8606-4625-db44-08de23dcab96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4siWlU+S5RN0velhbZ57RE9cLzu1hDFnyaLFwi3KmFJ7gIYlJtg+kq5XJOvl?=
 =?us-ascii?Q?Wk0Q4ty55JZwgFsNQ5vdjCXhjgpJgbHcurvqDnnRue47GHqexicJero78kNT?=
 =?us-ascii?Q?cLEC1QzIrNYgysh0XDxJRXpRins9UxS2kkArdsnhxlkMggWAD6CDVXIZYpmU?=
 =?us-ascii?Q?BYghL7xj3vQeg7FXLXHvVSHmUx7g3YklGfuyZfxapAZzrw7jOmuziY3hoHSd?=
 =?us-ascii?Q?IXlEsPNVXAXvs28mT+SqmRn8yU1jCUB34dg4ozUsJjIT64vJMH7ZjNyFUDfW?=
 =?us-ascii?Q?nMuz9/Vm7l+CDxOPtKC6h/wgNujWkcymCA5qaGBcbo9h+RDvAXPHWZ2ECzdM?=
 =?us-ascii?Q?jgS16EISgxW95YNsa/CwfjK9tS5NmrCWUvQJek230TnYwwQLsFv1Rv8g+qil?=
 =?us-ascii?Q?IAKecJZIH4pV7A6gi/WTTtaznVCtXB7LWI1r+KPVq+qyFIZHC83VlQMXdFQD?=
 =?us-ascii?Q?BXfpPRFbYuasS3Fbbiqd7+t+/q0+EkG9SYT1cTh0oyD9AcYz0Pv1Dfb2BOHL?=
 =?us-ascii?Q?g4Wwp1/LWNddoAwSIUUptCmKVr4WplI5jZS1LSKZ9WHr2XCCtkH2hbF+mrF2?=
 =?us-ascii?Q?JgPu14/h//ok8gy10pgQ8uiYNI33LB6W+ahTfvhjRtjm+uaZaCH6zNyiuZOE?=
 =?us-ascii?Q?01+yNSxW7OU6o6zPezyJ+1+jOWiVzS8zYCMoZotjdXzddnQuQvJMHxxhnp49?=
 =?us-ascii?Q?290pBHMIT5zFkWhs1rsk1TPcOOwFwiMuCNdV6mAq1/1tiuZ/eAwwy9ifuQxW?=
 =?us-ascii?Q?X0MWscHpBmqPJvY14RkdeZI6XYxjTNB7wQz4AoFVt1MguPNqUUk8fKqSbDN4?=
 =?us-ascii?Q?sq6exS71p/6czam2/xKtItoTa1SkJ3dIunbhEVm/rBUSniMNT72FxdP7KSYI?=
 =?us-ascii?Q?ZGPSk0OOiD4X8KnJ5ErGOeWgov1VO2+HZ1TodNPM/lODNPmUV8iCHUsOxVae?=
 =?us-ascii?Q?0yV3gR4RrG36356ipSnxHfN9a1scrTWrossvhp6Fe1v2dFx3Af8io8n8OIyp?=
 =?us-ascii?Q?Togft0lC7jdHMoxgCOWWIPBAieyx3+iygClgeVglAFz2AZH2hZdf+1oWosw7?=
 =?us-ascii?Q?f3ott81Fjm1UCz2ftZxsiBiyLBuupelwXa+Cxwg6fJOtPQCn5ohTR0Jy5e4V?=
 =?us-ascii?Q?MSVRFwTEnlWt1hlgonLrwp2gdWfUSgCNSLcU8uwnyn79iUi5V9UpRv6TH6vn?=
 =?us-ascii?Q?eJ10/0YJHeOhM238ty3Xbz59h5mOECLyK4kzNn7EMy/U5VpDy07LgImksW58?=
 =?us-ascii?Q?NFGhdgo1aFv+igYyLpJeuLbVcltCqQmYkefh1p4L4TUvAN21cNbZKyl43LNh?=
 =?us-ascii?Q?rEUXcGVp3APxCTK9VWgQYluI5a22caalxeTYVyC9wHOfFuGn9a260t7NcXxt?=
 =?us-ascii?Q?MrUDqm1O5lZIp2hVVtyXPB0C4WD/BH9kSOBo9C7ySZCn76g5MoqCCGaBXCly?=
 =?us-ascii?Q?iY6kF8++L6WADGVXyvZcBlkFSVj+X1B6OzxP+PMVwINfxlZ3TtHSpRTC7T3c?=
 =?us-ascii?Q?LMjuPZ5ZfFxC2sykWqmD2yaGuo71JTyeB/KyjTtP01VRt5/7oXKKv30IIUew?=
 =?us-ascii?Q?AdnhhQ9a9YIrHGG6fHA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:19:41.1320 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b79c8263-8606-4625-db44-08de23dcab96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7562
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

DRM is introducing a new DRM core object, a drm_colorop. This
object will represent one color operation in a color pipeline.

Introduce the object type in the drm-uapi, including the
following types:
- DRM_COLOROP_1D_CURVE
- DRM_COLOROP_1D_LUT
- DRM_COLOROP_CTM_3X4
- DRM_COLOROP_MULTIPLIER
- DRM_COLOROP_3D_LUT

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
 include/drm-uapi/amdgpu_drm.h |  9 ----
 include/drm-uapi/drm_mode.h   | 92 +++++++++++++++++++++++++++++++++++
 2 files changed, 92 insertions(+), 9 deletions(-)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index b38f27d69..ca24519c7 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -1590,15 +1590,6 @@ struct drm_amdgpu_info_uq_metadata {
 #define AMDGPU_FAMILY_GC_11_5_0			150 /* GC 11.5.0 */
 #define AMDGPU_FAMILY_GC_12_0_0			152 /* GC 12.0.0 */
 
-/* FIXME wrong namespace! */
-struct drm_color_ctm_3x4 {
-	/*
-	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
-	 * (not two's complement!) format.
-	 */
-	__u64 matrix[12];
-};
-
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index c082810c0..de10ce859 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -629,6 +629,7 @@ struct drm_mode_connector_set_property {
 #define DRM_MODE_OBJECT_FB 0xfbfbfbfb
 #define DRM_MODE_OBJECT_BLOB 0xbbbbbbbb
 #define DRM_MODE_OBJECT_PLANE 0xeeeeeeee
+#define DRM_MODE_OBJECT_COLOROP 0xfafafafa
 #define DRM_MODE_OBJECT_ANY 0
 
 struct drm_mode_obj_get_properties {
@@ -846,6 +847,20 @@ struct drm_color_ctm {
 	__u64 matrix[9];
 };
 
+struct drm_color_ctm_3x4 {
+	/*
+	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
+	 * (not two's complement!) format.
+	 *
+	 * out   matrix          in
+	 * |R|   |0  1  2  3 |   | R |
+	 * |G| = |4  5  6  7 | x | G |
+	 * |B|   |8  9  10 11|   | B |
+	 *                       |1.0|
+	 */
+	__u64 matrix[12];
+};
+
 struct drm_color_lut {
 	/*
 	 * Values are mapped linearly to 0.0 - 1.0 range, with 0x0 == 0.0 and
@@ -857,6 +872,83 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+/*
+ * struct drm_color_lut32
+ *
+ * 32-bit per channel color LUT entry, similar to drm_color_lut.
+ */
+struct drm_color_lut32 {
+	__u32 red;
+	__u32 green;
+	__u32 blue;
+	__u32 reserved;
+};
+
+/**
+ * enum drm_colorop_type - Type of color operation
+ *
+ * drm_colorops can be of many different types. Each type behaves differently
+ * and defines a different set of properties. This enum defines all types and
+ * gives a high-level description.
+ */
+enum drm_colorop_type {
+	/**
+	 * @DRM_COLOROP_1D_CURVE:
+	 *
+	 * A 1D curve that is being applied to all color channels. The
+	 * curve is specified via tha CURVE_1D_TYPE colorop property.
+	 */
+	DRM_COLOROP_1D_CURVE,
+
+	/**
+	 * @DRM_COLOROP_1D_LUT:
+	 *
+	 * A simple 1D LUT of uniformly spaced &drm_color_lut32 entries,
+	 * packed into a blob via the DATA property. The driver's expected
+	 * LUT size is advertised via the SIZE property.
+	 */
+	DRM_COLOROP_1D_LUT,
+
+	/**
+	 * @DRM_COLOROP_CTM_3X4:
+	 *
+	 * A 3x4 matrix. Its values are specified via the
+	 * &drm_color_ctm_3x4 struct provided via the DATA property.
+	 */
+	DRM_COLOROP_CTM_3X4,
+
+	/**
+	 * @DRM_COLOROP_MULTIPLIER:
+	 *
+	 * A simple multiplier, applied to all color values. The
+	 * multiplier is specified as a S31.32 via the MULTIPLIER
+	 * property.
+	 */
+	DRM_COLOROP_MULTIPLIER,
+
+	/**
+	 * @DRM_COLOROP_3D_LUT:
+	 *
+	 * A 3D LUT of &drm_color_lut entries,
+	 * packed into a blob via the DATA property. The driver's expected
+	 * LUT size is advertised via the SIZE property.
+	 */
+	DRM_COLOROP_3D_LUT,
+};
+
+/**
+ * enum drm_colorop_lut3d_interpolation_type - type of 3DLUT interpolation
+ *
+ */
+enum drm_colorop_lut3d_interpolation_type {
+	/**
+	 * @DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL:
+	 *
+	 * Tetrahedral 3DLUT interpolation
+	 */
+	DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
+};
+
 /**
  * struct drm_plane_size_hint - Plane size hints
  * @width: The width of the plane in pixel
-- 
2.43.0

