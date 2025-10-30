Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B16CCF9E5
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC1B10E248;
	Thu, 30 Oct 2025 04:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="S0fsu55l";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010027.outbound.protection.outlook.com [52.101.201.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EB910E248
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:29:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTYBFZ/gB8j+XL3LLCZrn2V7NzZ3PqdYq8bR2xYV+CIA0SGnl1z9FHNfpcORIYOcDTgwHowX4UeLt8zZenTTh9+pHmSKOCcyDx2RHTHDalRFXmP8FDSS4sRXQFNolKeLDsoDfStHFZ7kD/t3I0le9xS7Oenln1F4baYtdUGSedpgVdNHElK6IU4IZJmJNgwR7OHS6nVVKdkiFpis2WyF9kxjmJl/x2KvdC3/Aw/i0qr0qwq9qwS3r/MRYx8wwNNAqMAVrUhiiKpRo+XhJxBZ+L8EyLi+8LhicH0p+BCNbzBflJ+RzXvX1I/O666y2eyxXDKpaAYH7DQyzc+p4E4BIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zN4/KB8ZQhCE3rVjnJiLUFYMsOpz2fA8HPOlOmgcSoc=;
 b=tTV0PrNvej9YTi8HlWnHWcDQNruXDLixtwSiYw//8MnxkAKisV3uXx99iwc1S8pZrdQNgzPffgSWHbBmakFQm64omYOj6dxs0NApxlmU7V7pJJXH+G2j4I6RsHUnM9fLEleTXj9JSZ3/TfqVtuHrt+3/aQU2b+S2Y1FqRMyzyOnJIHBETzekTTTNbNYm29njsyhsbGrTJ4H007aQu/998iqVIASTCjE9vco4zUTfNFZRg7LTSjshubvndvMj9ovsqJLW0bXoYZU1T7joZZzBpd3Jyf5OnSweawgBGcjShlCuux8bx64VxM7peL9Y7gYRbCBai3KmVa9Lb5PHf7zLhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zN4/KB8ZQhCE3rVjnJiLUFYMsOpz2fA8HPOlOmgcSoc=;
 b=S0fsu55lI6QHtyE4aYqENxAMI7EnyiCyYUc27END7a+E7eUgtOO9IXe5DDcQ3P/l4uAmFmDBI5Ooxj6CBQQIaF35imaattiDg2VWuR4B7t2AQdQBkE6e6q9zHQ3H/FGRZB/9cF38wVOVdvgEVvxNEeWiZOPu9+L6hnRHVBgEdU4=
Received: from BN9P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::16)
 by DS4PR12MB9561.namprd12.prod.outlook.com (2603:10b6:8:282::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 04:29:07 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:408:10a:cafe::b2) by BN9P221CA0001.outlook.office365.com
 (2603:10b6:408:10a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 04:29:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.0 via Frontend Transport; Thu, 30 Oct 2025 04:29:06 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:29:05 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 04/32] drm-uapi: Add COLOROP objects
Date: Wed, 29 Oct 2025 22:27:33 -0600
Message-ID: <20251030042801.2315866-5-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030042801.2315866-1-alex.hung@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|DS4PR12MB9561:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b06be9d-a9ce-4f74-a40f-08de176cdd39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ReeNYmtpW8QEJetArPYiOVcWkVLA/dB6JLdeEEa7REcum39lQfUNtRZZVVIG?=
 =?us-ascii?Q?qj5Ofc8FN1JanJf7nwwD07rk6eOneZ1hLkesfQ+mi1sp2RIjlDtEXVFdzV0U?=
 =?us-ascii?Q?RkLKcKwrn0um4lxeaZi0XSDWBa+dSnvGMOag+CMkq+WSIif5lpYcW6MnlOj9?=
 =?us-ascii?Q?qkmcu9yJGi5AVijvE8ZxriwMi7hO9oarAjvxL/4ochfhcqwKzkPxX7pAWgbp?=
 =?us-ascii?Q?WrRKFxvw6vzQq0KJCVaYix5anNFKZFwCyWtvScqurF4EmHh72kyw/NnF1K0z?=
 =?us-ascii?Q?DK7yqPTjnu5E2uQAhwxAfCBFCKsRXSZJj2yqEpatVYUPQQxMx3IRIMl4H+Pt?=
 =?us-ascii?Q?sQ7Kk5OwdCIWxFjY2j3htskQN6Wcgjscm9pmup+F7OEoGPZp+Voe0T2LEZsn?=
 =?us-ascii?Q?Sxs+tnOQEQ0Lnis4CHvPbtkEAEdT0Q+GsdAbddHEnBemdipzax6l8+Iy+5/n?=
 =?us-ascii?Q?BIeFbWU5lOq3CIJY5HH+/vOiURDpOwMRRaMBA2qDIgll9xMaZ6JGugyZ7kkF?=
 =?us-ascii?Q?5s9EfwYCutUC5dkqKKf3Ydy6GB/zWf5V2EMWEKy7RvVmSyt/OcyYFnOJa1yT?=
 =?us-ascii?Q?20hX/0DgwG2WMS78lrdS6kUhnuYkErw1erei//JGCDCOtZUrJIBCCsOXAHsV?=
 =?us-ascii?Q?Vi33FaHo2I2ElaanacmcSeAVZic+1hnufHxJX93vaYhPX8W6ZMiYcPBR5MVi?=
 =?us-ascii?Q?rmFdKDdhI4VPzU/Okq2MAShPdr8pJDSpeBKhdwqbVDYdB4mjpQRqETPqUhI6?=
 =?us-ascii?Q?UxPpQU2jEaxsEWI34eBT6IW9IIJdOqGr8/haXwepjqC+hEGIqVkMqaZoCCrV?=
 =?us-ascii?Q?bqBaBKLKznJWO3lxIPOiLMMObfqCdVB+8UaFLpxaBLc23E5U8w8FO9Bgx9ME?=
 =?us-ascii?Q?pob3wfIrtgtiMKJIvOzYXIHh8CcVK2fIvKW5cx8ElmXOESBKsoTirClTfwF0?=
 =?us-ascii?Q?glsRkmpGb1zsY7uVf2rdS4WYgxYIPLRMHpH4EHO92wUs24pAlg+Ea97iWVIA?=
 =?us-ascii?Q?FGm7IICrp6tGB6+Zo7jjxm0iLH36qXVKiOpVviO8cuK4vJ6gjnCcIsDSHGCO?=
 =?us-ascii?Q?G8u2m7vKVytYupozcm53izdJmrxBj3FZAP0qxuQ9tmFFvR9O8nA37uw7Mg1Q?=
 =?us-ascii?Q?0odIpfeK5x6mG3uncovK6MDDSjMlHSbrIA6r6Z995mQRcKs8Ig43t8puT+Wg?=
 =?us-ascii?Q?Cu5UxffS8MYSinCaf5v84hIbISdSNc7J4yqlxvA8JGAP3id0L9XoF4L0PSJ9?=
 =?us-ascii?Q?1VcSUlfeV63rq9wrYMEQ5IlngT3qoNgvWZ8+5TBYNY/cU3jLqlcg1VTRoh6P?=
 =?us-ascii?Q?eVReo9hOWbMIeeTMNAGi3eV1/2L9lGNQBZz360iAHS/CYjjp8fYWeW/h3heG?=
 =?us-ascii?Q?0UteuzKfvRzLN5Vsq9f4gr7298DsMqOEdVvNDwKHes5vLobsIFejGfYzadqv?=
 =?us-ascii?Q?VkMfKn+dMgLH6FDUIxf0+fzKdRcZQromJN0mV3x8gHFqO7q0CIpDoNbxw5bm?=
 =?us-ascii?Q?YiKnIo4OR52GDPXhWqI8z+bm1gETyrrAJ9cYDI+qi8Jn9TtbSC/QC9ByO1BR?=
 =?us-ascii?Q?cwt2eQNGsSnvM4Q3Jz4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:29:06.8213 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b06be9d-a9ce-4f74-a40f-08de176cdd39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9561
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

