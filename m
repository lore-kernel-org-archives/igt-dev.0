Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CCCCA0ED1
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:11:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC3D10EA42;
	Fri, 15 Aug 2025 04:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p1NdveCh";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5DA10EA42
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:11:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eL00QL7e2phdhRjMVlaFqfif1HH8BY21mjExOPpYXJfldy2GktLygrFv6CDJBq63pyZTIZGLUwD9qvi4xzyoiohurO9uDkzZVn8kw9V9/HhFhxfEAVaHBUr9I5FR+uaCMQnJzgIdKPdMHle9if5G5zr1iHm148dY9O0hXUzj2jlaP54wmCcvC2OGmetlct963KFH0BvBdydiD1mEK49EQT0mOTcNePaAeRizwzsIhaVm6QYYy0hLeE2PvOgJaNy6AQZ7C85+rE5iGhliGvmzST9MjZUy3lnqbxROb+u+DfYhBrN1mkW06kPLWw64gZ50vj0Q/m3XATRPWuswtefVCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCvj5Pf2/5Grm6Gmpcio1LSI7hRNTjkJT+t+aM2cntM=;
 b=QWhzcy7oaHSE6px1wCLW+z/dVDWvUIncH4sLgI6yV2AZaXuv2++LZCKleiJgv2wXtfyxjCm48kBYaUTNvMFYBM+Xy/LPfxSgjrgCiv5RJvYnVhZoO69H19/2VjPOtjAbnjGQOEUe3BSzKSa/8eGgfif8UY/SGs9yTcbGzaSfEpMwx666v/q4/I/c8QxT1xuQnj1Egim5mT+hls3ir+ssN8xy15wribYmv77LvG8hvytVERRp50dUxr0Bl3PI7NeZX9xb2o6Gqr73oyAS8XflN4wrzaTqrYtbr2Qk9fZtQ4EaWnXoXgDsCzs4KBvIbwD1fPVId5wZupxvdj0SIDYmnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCvj5Pf2/5Grm6Gmpcio1LSI7hRNTjkJT+t+aM2cntM=;
 b=p1NdveChB++to0Q3J+XK5wjTBCMRnpyYb4zwnuTqqKd0NSGLD7I95gaojtoKswCrQ8/8oyjnjZdm2jmOzQgIt5bHIoDdb0IdC30RIJ5aqmjMXzimLsizc24TK/kygJ8ha/RwJIWknezZUrRVZjYQhqWa3grSHvroMBJRg6h77rg=
Received: from BYAPR21CA0021.namprd21.prod.outlook.com (2603:10b6:a03:114::31)
 by DM6PR12MB4354.namprd12.prod.outlook.com (2603:10b6:5:28f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 04:11:52 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::f0) by BYAPR21CA0021.outlook.office365.com
 (2603:10b6:a03:114::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.7 via Frontend Transport; Fri,
 15 Aug 2025 04:11:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:11:51 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:11:50 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 23/30] lib/igt_color: Add 1D LUT color transformation
 support
Date: Thu, 14 Aug 2025 22:06:52 -0600
Message-ID: <20250815040659.3321102-24-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|DM6PR12MB4354:EE_
X-MS-Office365-Filtering-Correlation-Id: 32529910-7563-43c1-c6b1-08dddbb1dcc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Yn546u1OsLyD04w99K82EdS7kaOun2HBfAQ5XELeFuI0OovF3OHzFCTLlsZF?=
 =?us-ascii?Q?XnM+fMbo4TxsfWZrLl4GtXtlMxhjSre3oeY3JJiUhbXPP9NHL/Op/ycakzk2?=
 =?us-ascii?Q?B/a0CUnJir98w1puL8iXES1zsYOU6btRxQqkB3grF7Iz7fn6A//XFow2juFw?=
 =?us-ascii?Q?ifC7Op79lZK3uhaDhv9BSCpUg8i4vuDLlBxteuwSjB6zjQEUnbXTSt5bEC4F?=
 =?us-ascii?Q?pCpuMxXpQjAmL+EFty5K5pJp7RDElq16AJvz/MqiUYpFQ28/ld94ZFcyjXEf?=
 =?us-ascii?Q?UKt87Up/o+yWmBJKUomf31Sd++quKIdYQ2TiCLt9HmkXqcmudqTaRnzy2a9E?=
 =?us-ascii?Q?gtfF9GN1RbKOgWQFrrb8aaL0FzZts18ckFs46WoPzbvormp8eoq/b+ygJeeM?=
 =?us-ascii?Q?MbJPidOz8ZPDeBqx4SezvBPvpuH1NfUhHAUimeiR6szIvxNqCNlNa9Hjhm49?=
 =?us-ascii?Q?7g3RxsOgA+bJkEXzdaKevs0UBMkNzn453GTPk+NeSbT/fCNVxIxyofG49CpS?=
 =?us-ascii?Q?j65vXkZygZVDqlhflmA+ZgiUn5NrccBxsO2OgJFXEe/s4FTQfUtnEnesLq6l?=
 =?us-ascii?Q?QKDIorOv3z/yjgAA8lWBpBp4Z5T4aX76IL7clk79ubOPD/NNz3/VG3IU3VLD?=
 =?us-ascii?Q?RMri/8xGEQSZ3McbUwDdgx7xOgaK0aZAJ4brTB5LOVfiBZHtOZWZRl21NR2h?=
 =?us-ascii?Q?8ryzwQRQXk4/dykqUKERdan7gAi0VDq3SUO1ldJDiYJMeSyxR2vDIcSpCFiw?=
 =?us-ascii?Q?TWVR/AJTB5I2i/w/nZHGHW7UoYx+vi60WbIs9beOdqoI04DbZjv6roV1EtHP?=
 =?us-ascii?Q?K3bYt5HoyniPuS7QgqiwgSkWPm3KEpzZeEWetW3xCrzaLbHuySjUSJdr8yWg?=
 =?us-ascii?Q?yAjYBapoI1R502P5Gx0Y0rneBwpLALSlAYIzcJcG5MT2JsWnFEzJ/y2xt++q?=
 =?us-ascii?Q?SNnAVhhlZpqdHAZzvTCZ2WCpc/cCYyeWEYakZ9D68VVhp1yqh6Os/sfbM8zU?=
 =?us-ascii?Q?RGR+81C5HBpoEsO59lM6Sab9TtTUSDnjnE/2OMGlFieMass5F4Nyzr23iSi0?=
 =?us-ascii?Q?Uv+5ZGCmG/hv8tYJpW4W0QQlj8zbmWu9YGSoR8t+ll5Vc1D5z3A70onyJoad?=
 =?us-ascii?Q?Td2Kx6OfldD5WsRc4Wj2If66SHZs9Vbc1oQ0yUzvr4sXeyUVHyQY4xFYj4/o?=
 =?us-ascii?Q?1T7ISuCdbcHm6/epYCHI4xgoIMw1ENBpCCkYLqiQrQUXFu41+M+BORmzHQAv?=
 =?us-ascii?Q?t/0tBubf+2akmX7ieGp9q3E2fXqJQmcUcxkshCQKyB0EcuKVLI+QnIMsYNO4?=
 =?us-ascii?Q?0iAiLwZXiUhbRIqMDFiJvcL3YrJsYS5ludfBn4amboIgBx8+ESb/Kfj/RDiN?=
 =?us-ascii?Q?S7bj2m6pBIrgq5i3Q3nwRzsmIT9+9lFOoo8KHyemur2eRBMIEVfIIJFoLee/?=
 =?us-ascii?Q?2kyaGqIRH5hFNYUQvi7Ylcf7eizqn/xvai55ft+jByOVDUCrzx+jCN0Xcann?=
 =?us-ascii?Q?26b1a3UjtkETECeknMblfIz944p4L0iq55Dz?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:11:51.4972 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32529910-7563-43c1-c6b1-08dddbb1dcc8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4354
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

Add definitions and functions for setting 1D LUT on a
drm_colorop.

Add support for the SIZE prop of a colorop, as that's
required for understanding the size of the LUT to
construct.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/drm_mode.h | 12 ++++++++++++
 lib/igt_color.c             |  8 ++++++++
 lib/igt_color.h             | 20 ++++++++++++++++++++
 lib/igt_kms.c               |  1 +
 lib/igt_kms.h               |  1 +
 5 files changed, 42 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index fce45b5cf..106fbb889 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -874,6 +874,18 @@ struct drm_color_lut {
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
 enum drm_colorop_type {
 	DRM_COLOROP_1D_CURVE,
 	DRM_COLOROP_1D_LUT,
diff --git a/lib/igt_color.c b/lib/igt_color.c
index 6a639813f..a58ba0e57 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -428,3 +428,11 @@ void igt_colorop_set_ctm_3x4(igt_display_t *display,
 	/* set blob property */
 	igt_colorop_replace_prop_blob(colorop, IGT_COLOROP_DATA, &ctm, sizeof(ctm));
 }
+
+void igt_colorop_set_custom_1dlut(igt_display_t *display,
+				  igt_colorop_t *colorop,
+				  const igt_1dlut_t *lut1d,
+				  const size_t lut_size)
+{
+	igt_colorop_replace_prop_blob(colorop, IGT_COLOROP_DATA, lut1d, lut_size);
+}
diff --git a/lib/igt_color.h b/lib/igt_color.h
index 9f56536a3..88de8166f 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -17,6 +17,8 @@
 #include "igt_fb.h"
 #include "igt_kms.h"
 
+#define MAX_COLOR_LUT_ENTRIES 4096
+
 struct igt_color_tf {
 	float g, a, b, c, d, e, f;
 };
@@ -37,6 +39,17 @@ typedef struct igt_pixel {
 	float b;
 } igt_pixel_t;
 
+typedef struct igt_1dlut {
+	struct drm_color_lut32 lut[MAX_COLOR_LUT_ENTRIES];
+} igt_1dlut_t;
+
+igt_1dlut_t igt_1dlut_srgb_inv_eotf = { {
+} };
+
+
+igt_1dlut_t igt_1dlut_srgb_eotf = { {
+} };
+
 typedef struct igt_matrix_3x4 {
 	/*
 	 * out   matrix          in
@@ -94,11 +107,18 @@ void igt_colorop_set_ctm_3x4(igt_display_t *display,
 			     igt_colorop_t *colorop,
 			     const igt_matrix_3x4_t *matrix);
 
+void igt_colorop_set_custom_1dlut(igt_display_t *display,
+				  igt_colorop_t *colorop,
+				  const igt_1dlut_t *lut1d,
+				  const size_t lut_size);
+
 /* transformations */
 
 void igt_color_srgb_inv_eotf(igt_pixel_t *pixel);
 void igt_color_srgb_eotf(igt_pixel_t *pixel);
 
+void igt_color_srgb_inv_eotf_custom_lut(igt_pixel_t *pixel);
+
 void igt_color_pq_inv_eotf(igt_pixel_t *pixel);
 void igt_color_pq_eotf(igt_pixel_t *pixel);
 
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index d1c23b4a4..bdde2fc72 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -710,6 +710,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_TYPE] = "TYPE",
 	[IGT_COLOROP_BYPASS] = "BYPASS",
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
+	[IGT_COLOROP_SIZE] = "SIZE",
 	[IGT_COLOROP_DATA] = "DATA",
 	[IGT_COLOROP_NEXT] = "NEXT",
 };
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 2a401cd3b..d0a7ed037 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -374,6 +374,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_TYPE,
 	IGT_COLOROP_BYPASS,
 	IGT_COLOROP_CURVE_1D_TYPE,
+	IGT_COLOROP_SIZE,
 	IGT_COLOROP_DATA,
 	IGT_COLOROP_NEXT,
 	IGT_NUM_COLOROP_PROPS
-- 
2.43.0

