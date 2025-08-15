Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61425CA0EE4
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:13:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE0810EA78;
	Fri, 15 Aug 2025 04:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bRoEPv8F";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE54610EA78
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:12:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFm5FejrjW7WrMEGHj8+f4rf3LvC8ON6H0f8MwSdi1yJzdtPNU7KK863KPVqfpYtFW7gHmKIBrjyHVcCoRfMMYHcllfcUXbM05x9x/DSfvnhvHx6SDFr2B+4Br5Lf7S62ss35q4C+FEdISWLgsQnqJ8XhPVrha/EGcWXBppXnYB4IrtCLMhyC/aHmKEqv+8lAty8HsvD+cd/4AcBcJQB4DMLwUHXx9LNYhgnvBpD8uyQtVla64VMJlDrdKRqF9PlOmOHWfoHj/atX75mbPU0VkkYbdB/xmaNFg3dKVuXQZ5p1pejlUZLnxIUtV5uBoGfOphKFMywe93laeoNvcfluw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqfX9PdpdmRhmYq2fdOoI/ZfEdHE9T33V6jGv7DOrxE=;
 b=lKX5ZZzxfyuQev7PQaUzJF+6AkI+RTrEVmNiLCjp2eHKxiZzfeJTsKOONifUCo2EAfOHGMtp+GIYMjB0htkJ/XJrsFeeeYg1VgOgVa03oYP1gQ24AJFfaIH57MX8iHftuxBgz7wikTK137sSdXyOOVtZwTyIIBjU3FA5zAqaviURvPaorsU/CEbfez/LFrda6hKKS3pHdgHlAPMqHktZi2EVFysMzjZ0NM8Ib4TNirZz2t1b3U/p/wQH4XsmqsLy4I+E8Zivz0QbZNTWxt8aCRGuf1GwFROqIJwCbWLf2W0loxaVt5rpbegyuBMmYH+GMMFUM+TnvmbzocKUGruWHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqfX9PdpdmRhmYq2fdOoI/ZfEdHE9T33V6jGv7DOrxE=;
 b=bRoEPv8F2dDkvzq+jR4gKKxbrY4wNVmlqw0TZKC9fRCGVYZNVTnzqmtnL75U6qmhdmKaqh+mj//NPjZnmf9uKqR5Rum3Ei6smPG4y1gy3g/ADMm/GsWMOelLHLmrwj5n+bctP4G6qy/Px6ykEJyKz5DEM5HnRlR1W/LMEN5iCKY=
Received: from BY5PR17CA0044.namprd17.prod.outlook.com (2603:10b6:a03:167::21)
 by DS7PR12MB6143.namprd12.prod.outlook.com (2603:10b6:8:99::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Fri, 15 Aug
 2025 04:12:52 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:a03:167:cafe::52) by BY5PR17CA0044.outlook.office365.com
 (2603:10b6:a03:167::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.15 via Frontend Transport; Fri,
 15 Aug 2025 04:12:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:12:52 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:12:51 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 28/30] drm-uapi: Update kernel doc for drm_colorop_type
Date: Thu, 14 Aug 2025 22:06:57 -0600
Message-ID: <20250815040659.3321102-29-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C4:EE_|DS7PR12MB6143:EE_
X-MS-Office365-Filtering-Correlation-Id: abf41815-51d1-44a2-3d81-08dddbb200f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VlYc5neHlvcgTO6zrgHMQRTBkCfWo9M9t9xGijCgzxeb1ElQHePGNTK+7F8V?=
 =?us-ascii?Q?urQnYu0d1qHtnoeRaVJz7BKbdXeWnHCTzJM4JRpv1dKGStosiWEUmc+noiUd?=
 =?us-ascii?Q?psBDA6dymCZ2QY42/rPL5ZKjUkqvQS7gBuiJBsJ3iB1yHUau3ndWvY3T2Dd8?=
 =?us-ascii?Q?RKaypQhaa16tFpkgZ1KrNXDAyoMHpHy6pcOfo0t4Aen7IhEHY6WHzLqVodFG?=
 =?us-ascii?Q?Y17+x4iZi4BfTvfGh16n+tY6rYQLxvHn+7JQN7PzAleA7Ybkt+pMJBLhfZvF?=
 =?us-ascii?Q?iWZ03Lw6Exxkb7GHiz5dsOYlSiJLaWxaaB7XkpaMGYL0vME+2+WrCIX6Fnn6?=
 =?us-ascii?Q?Cx0vXl7sPiwANeFjuIW+O0ezTeKe3HsN3zUboiLKQdXLXsbE16Cc7JX7YmeD?=
 =?us-ascii?Q?7wf2Ayn++IgAODsXfxJindZPfhpl0tdO2nVs8fwvll9PMg8MoosqZQFFWPY2?=
 =?us-ascii?Q?fu8v7SQgXV6uiurkxl1DgOsSgcdw9blA41tPpntSP+6mwc9L0FLG8DOtuhS/?=
 =?us-ascii?Q?d9nL0yT3xY5XuNl4qaCG9zFHbPftDCCHg4c0QU06yo/b+mXmyC8/4kz03ZQI?=
 =?us-ascii?Q?3rSj772lPdydzxckv9cTLJYudbIDYoaGWHHr99pOuOf5hKjb+g55BwjVp4U1?=
 =?us-ascii?Q?Ml9lt3sDcEeDMQXHSpwCWZdJyVNEgHN1wv4yatljeQHKE/Os39+L4M/aPYlK?=
 =?us-ascii?Q?aPy36tpEjOiUxfFzG56Hcls0HkKOJb70MpQNGmMgA/fzHWp1eqVZLiwB4Ci8?=
 =?us-ascii?Q?iEPSRez1tvMzQl/ag75KgU5PuNN3AljhOLOZ8NGpMA3MgQaQRajsWG+ZhF+y?=
 =?us-ascii?Q?hckCvY26YeNqFKsYx1Q5kaugQdZjJHtM5RhFoBKOishMzYIV6tbW1F7mAg+/?=
 =?us-ascii?Q?1Vqe6WjBzvPns/zd8gNBOYOLWtP+lEv3VxO3zvaWvxTY46+HHIF7oDM6oMhn?=
 =?us-ascii?Q?b/4xjOmu/2QA0QWByHgkxlPNi4T6EXQMBo5dw/+hEBazScxoSuYqUWky57rR?=
 =?us-ascii?Q?Nx8vNvrSbtjPzsBdpB3duGNjd4y7iFcrQa8iK39qpveXY5gTi8vV+G3WwRNG?=
 =?us-ascii?Q?JzpqCRy8X1JoeihROb1zgyRGIpUYzmdkm29lHRXHI5/WOOv+EdBC5omTAzrK?=
 =?us-ascii?Q?snXMx09Xq8UzN4/9Giq5YlTsmYj3VdoRZYxwYyyOZPgP0ax4Pu3xm64XRirA?=
 =?us-ascii?Q?WsEfkCdP3LIXkTcvHcO71qyJKoAWiwXcC84/PllSYd9/PO+9maRiOMhzdOOP?=
 =?us-ascii?Q?NYWW/0rVQmi8/mQb5+ERvvrkVOlDDyLvLJpmp8LU03bTTI0kVG5slh1yGeXd?=
 =?us-ascii?Q?B2T5TgSGfilxyjyc7f0WOxk1xuehOhd2s6BrG+g24iMpshy3eadlYAsO4Y4X?=
 =?us-ascii?Q?zDChKw35p2isw6baDs4oYWDt9X3nszYVdDPbArbjjESjXwgrfStU2zY4+oxJ?=
 =?us-ascii?Q?BMn2DhshKzg8M3KNXPWh8guI9SKj3+Se4xuY3gE0oKnGv7tUFyHO2e++m2YA?=
 =?us-ascii?Q?ljj1yvhyEDFGEOYbW+zI+DHWYzRpe6egwJAn?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:12:52.1678 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abf41815-51d1-44a2-3d81-08dddbb200f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6143
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

Sync up with kernel documents.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 include/drm-uapi/drm_mode.h | 44 +++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index 009bb3e7f..e00b21067 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -886,11 +886,55 @@ struct drm_color_lut32 {
 	__u32 reserved;
 };
 
+/**
+ * enum drm_colorop_type - Type of color operation
+ *
+ *
+ * drm_colorops can be of many different types. Each type behaves differently
+ * and defines a different set of properties. This enum defines all types and
+ * gives a high-level description.
+ */
 enum drm_colorop_type {
+	/**
+	 * @DRM_COLOROP_1D_CURVE:
+	 *
+	 * A 1D curve that is being applied to all color channels. The
+	 * curve is specified via tha CURVE_1D_TYPE colorop property.
+	 */
 	DRM_COLOROP_1D_CURVE,
+
+	/**
+	 * @DRM_COLOROP_1D_LUT:
+	 *
+	 * A simple 1D LUT of uniformly spaced &drm_color_lut32 entries,
+	 * packed into a blob via the DATA property. The driver's expected
+	 * LUT size is advertised via the SIZE property.
+	 */
 	DRM_COLOROP_1D_LUT,
+
+	/**
+	 * @DRM_COLOROP_CTM_3X4:
+	 *
+	 * A 3x4 matrix. Its values are specified via the
+	 * &drm_color_ctm_3x4 struct provided via the DATA property.
+	 */
 	DRM_COLOROP_CTM_3X4,
+
+	/**
+	 * @DRM_COLOROP_MULTIPLIER:
+	 *
+	 * A simple multiplier, applied to all color values. The
+	 * multiplier is specified as a S31.32 via the MULTIPLIER
+	 * property.
+	 */
 	DRM_COLOROP_MULTIPLIER,
+	/**
+	 * @DRM_COLOROP_3D_LUT:
+	 *
+	 * A 3D LUT of &drm_color_lut entries,
+	 * packed into a blob via the DATA property. The driver's expected
+	 * LUT size is advertised via the SIZE property.
+	 */
 	DRM_COLOROP_3D_LUT,
 };
 
-- 
2.43.0

