Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B302C369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:40:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E7710E692;
	Wed, 30 Apr 2025 01:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZQu4RcK5";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B9410E692
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:40:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cwVrtUMYvfTHx5f69aBGYH4KP4aj49EMuVTkRNGz+hA2MCwTTfU47YtQXGXXCJmUBtohxqCM25BkjJvl0BXaA5CpjCrBYy1KVjSz9S/Y+knYq/SfXv5CItzTWwIjsW9nO2TGsuztlI2cAnUGEhhhvvzZ7PCFphveFuHFWMU5Z+upATCelxlgcJ3YSyeR9U0DZM3JvxRNY9GMC7Kw5hFtQKY2zT6yR4sEIEkhE+On+nXPH4ePUA/eengtEfW+Jr+ygWaKSIqhS1aEjkOfs47mdY3W5Cu5LUR5DW0stU+8qmHgAdq0iSjGFr2mFJc/Q0nI0rVZcbZvLQv1kJWssDlTqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkBQy9O+DZ7V4wEhL6+8t02DCykbFsQAF+zQcbUOiVs=;
 b=t18TFbh0rZAemHD4QPc9w/H0fYHX1fJ30ocY6uOe2vOEHArkC2cimEm7UuWif6Vf8gsrGR/iICWcR+9AJwe89gwDSLcWCyDMwHFrBWKGFJ2go2qG34980piMHZ8+WMJs3EjbxkgCc0d1Zoiq0hk6TxPcDjvMvlTAg/bstkpyBBHdROi4xVsi5R/EU4+WdXu75V9mQGrsBTxKIgcCoW0FhExy/uAq+0Tujh5o4SJRnBl1uUBfMQaY0KDhM8EFw4Il4KaDpOuZDr+pKyOpL2gz31FacgCvtkiDqhzvBtA1MzYpl88p/MybhatCzJXFfA0Tj6s3+jKdNqABm6wdjLU+Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkBQy9O+DZ7V4wEhL6+8t02DCykbFsQAF+zQcbUOiVs=;
 b=ZQu4RcK5cl7Xc0iVl72+zWYxRf26yxInAUxf6affWTCQ8wbqN7AeSynHl8pTwL2h2sqwAR19cXdGxhNYsiWMpdq/q5q82YKCjOBG9h+f+EjdbymGhgkye7Z38hGQGA5NQ4Mv0IabR0pRDU1g3ZqOQGnZrAY2QxnjsZ8KTui0pM4=
Received: from BYAPR07CA0097.namprd07.prod.outlook.com (2603:10b6:a03:12b::38)
 by BN5PR12MB9538.namprd12.prod.outlook.com (2603:10b6:408:2ac::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 01:40:02 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:12b:cafe::8f) by BYAPR07CA0097.outlook.office365.com
 (2603:10b6:a03:12b::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Wed,
 30 Apr 2025 01:40:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:40:01 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:40:00 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 23/36] tests/kms_colorop: Add tests for PQ variants
Date: Tue, 29 Apr 2025 19:34:41 -0600
Message-ID: <20250430013454.226910-24-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|BN5PR12MB9538:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df7e48a-cb74-459b-091a-08dd8787ece3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W+ZQER9iEl3IBeFwSyXbhkVWlERamElyB1Vraj9U5tb0sRaBv8Ia2PdG6atZ?=
 =?us-ascii?Q?1TaQJ0cRuQGVlaW+ewEAhlNEjdUb4Q5iK8HxSjHlsMwTe1+13LE0cSnTLKa7?=
 =?us-ascii?Q?p94f672EoWoX9JO2bs9meUGjmt/4x7yfvuhFo3qDyzke/BrGx7lvdx+fc6k5?=
 =?us-ascii?Q?xtuYPrUVcP9oJk4+58hlAXxJC9hnrXfMmNeVTl2RdUdmS7GvFumP6ER6COZK?=
 =?us-ascii?Q?SJLWl4+aTnLNfVCcCHR1p+K9ciS60Fo0CfwnXb/9+rPzGpqto+YF5vMr2I/j?=
 =?us-ascii?Q?iTRYMd9Rtt5/t8do0HCH+K0+llFETpFLnnl8BdRM+7gnjAhwVwt2T3gFXdg7?=
 =?us-ascii?Q?75rbyfGDtKSnQDbO0Kh9Ukbn2sXH76H7p4qdJbLi0he2xrVlyJFeo9Mi4A5G?=
 =?us-ascii?Q?cOQSIP2nT47mq/2kG4CzQS/Jot9KfNiPQrlyU8aTctuHB/wkitWwksf8gnrG?=
 =?us-ascii?Q?3xOrJ6ch8tvx++6WKtj6MBn4gsdQoqUTFug3QfhtOvquiPA1ossGQ8jl6U61?=
 =?us-ascii?Q?tHMSBK508dO2Z1Qmky1QebHyBVaWRTxxCZ8ZsKdbBraoGCaVqQVrUcDmcZ3i?=
 =?us-ascii?Q?v9PgbM6cvLUoxpq6lRZLArQUu1niECftDBr7Y0yepZXdUVsMviv81+AQ5ZvI?=
 =?us-ascii?Q?ZoA4W9hQRHgP4JR3LH/JqUecdQyLzTYk3MpCqrprKnE1h4ZvPCKVlzWQ9OTK?=
 =?us-ascii?Q?coYlGJBQb0J5Cgp7fWwOJtyNpYH7xiXMDxA9Cth3ka/m9xUekwiqUxjAhiZ/?=
 =?us-ascii?Q?JUDwflt+GfgttlO6SD56sVJ48Tg4zgQal4W5vrEExEh65ozPMg7U8XsHTkXh?=
 =?us-ascii?Q?eBvmaNqpYsu9d05Sbupc/ezFGLxzIMnIImo2+QUQeK2gauptUnAgGnSnV1wL?=
 =?us-ascii?Q?rItqbRlmhMjM9yOie/RoeRGnQdJOdH6ruI0bS+xLdruu4WBsuMEQn3x44o9v?=
 =?us-ascii?Q?z4FeXBe7RXs+vJBZXWHeL/vmR66lGFOqhq5HOwdzsDpFakyW0iNlGQ0BiFWN?=
 =?us-ascii?Q?Aam4Gy5Lo/ncuY2S3ZG1NpBX6yRG5cCmKfU5TxC5OMZPsl2O8pXVl218eINu?=
 =?us-ascii?Q?gqM1PAvimmAQaWYwD1eGmmngNlwIr+/tpX+MnakLkHMxJjn2WaTg911atZu9?=
 =?us-ascii?Q?48QqeQsX7sDGF4kt+dy9I3oGzp8pxlvYcwR0w6QUP8z8GGwHnb5LgAlMa+mb?=
 =?us-ascii?Q?9JFfPv0Ayy9llhNvL8OrEfH8wMTY2XJyXfoPkZQC7wgcV10gIJVZeuX+LAw4?=
 =?us-ascii?Q?MlmipX+lfTrQhxK/mdmETM/BfmRxxkJpX+rZONvEsETPRfm2LwDgZhWt1gxi?=
 =?us-ascii?Q?yp7r9sIo87MMYbO/kjszrwa0VWy/kNykcoIDTbJV6SD5IKHC8ic24RDGHYgw?=
 =?us-ascii?Q?shsbscnlL4jr7L7sYonfwYOdAW0iGXgFPfR4q9v1nnVMuUd/FowNzOZrdhNH?=
 =?us-ascii?Q?3K+8vUwk74ge8ZOmCuKVMEADehPUfFVXI7vsejIGSErptCo9s+59LKFMRcgf?=
 =?us-ascii?Q?9uXGBQzGq8fUytyz/G0yRGKdghJ7pXT40oal?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:40:01.9719 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df7e48a-cb74-459b-091a-08dd8787ece3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9538
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

Add tests exercising the PQ EOTF and its inverse, both
for the [0.0, 1.0] variant as well as the [0.0, 125.0]
scaled variant.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 32 ++++++++++++++-----------
 tests/kms_colorop.h | 57 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+), 13 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 8132f8f99..b7de2080f 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -48,6 +48,13 @@
  * @srgb_eotf:                  sRGB EOTF
  * @srgb_inv_eotf:              sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf:    sRGB EOTF -> sRGB Inverse EOTF
+ * @pq_eotf:                    PQ EOTF
+ * @pq_inv_eotf:                PQ Inverse EOTF
+ * @pq_eotf-pq_inv_eotf:        PQ EOTF -> PQ Inverse EOTF
+ * @pq_125_eotf:                PQ EOTF for [0.0, 125.0] optical range
+ * @pq_125_inv_eotf:            PQ Inverse EOTF for [0.0, 125.0] optical range
+ * @pq_125_eotf-pq_125_inv_eotf: PQ EOTF -> PQ Inverse EOTF with [0.0, 125.0] optical range
+ * @pq_125_eotf-pq_125_inv_eotf-pq_125_eotf: PQ EOTF -> PQ Inverse EOTF -> PQ EOTF with [0.0, 125.0] optical range
  * @ctm_3x4_50_desat:		3x4 matrix doing a 50% desaturation
  * @ctm_3x4_overdrive:		3x4 matrix overdring all values by 50%
  * @ctm_3x4_oversaturate:	3x4 matrix oversaturating values
@@ -212,7 +219,10 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 {
 	switch (desired->type) {
 	case KMS_COLOROP_ENUMERATED_LUT1D:
-		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE);
+		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE &&
+		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_CURVE_1D_TYPE, kms_colorop_lut1d_tf_names[desired->enumerated_lut1d_info.tf]))
+			return true;
+		return false;
 	case KMS_COLOROP_CTM_3X4:
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_CTM_3X4);
 	case KMS_COLOROP_CUSTOM_LUT1D:
@@ -292,18 +302,7 @@ static void set_colorop(igt_display_t *display,
 	/* TODO set to desired value from kms_colorop_t */
 	switch (colorop->type) {
 	case KMS_COLOROP_ENUMERATED_LUT1D:
-		switch (colorop->enumerated_lut1d_info.tf) {
-		case KMS_COLOROP_LUT1D_SRGB_EOTF:
-			igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, "sRGB EOTF");
-			break;
-		case KMS_COLOROP_LUT1D_SRGB_INV_EOTF:
-			igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, "sRGB Inverse EOTF");
-			break;
-		case KMS_COLOROP_LUT1D_PQ_EOTF:
-		case KMS_COLOROP_LUT1D_PQ_INV_EOTF:
-		default:
-			igt_fail(IGT_EXIT_FAILURE);
-		}
+		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, kms_colorop_lut1d_tf_names[colorop->enumerated_lut1d_info.tf]);
 		break;
 	case KMS_COLOROP_CTM_3X4:
 		igt_colorop_set_ctm_3x4(display, colorop->colorop, colorop->matrix_3x4);
@@ -490,6 +489,13 @@ igt_main
 		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
 		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" },
+		{ { &kms_colorop_pq_eotf, NULL }, "pq_eotf" },
+		{ { &kms_colorop_pq_inv_eotf, NULL }, "pq_inv_eotf" },
+		{ { &kms_colorop_pq_eotf, &kms_colorop_pq_inv_eotf, NULL }, "pq_eotf-pq_inv_eotf" },
+		{ { &kms_colorop_pq_125_eotf, NULL }, "pq_125_eotf" },
+		{ { &kms_colorop_pq_125_inv_eotf, NULL }, "pq_125_inv_eotf" },
+		{ { &kms_colorop_pq_125_eotf, &kms_colorop_pq_125_inv_eotf, NULL }, "pq_125_eotf-pq_125_inv_eotf" },
+		{ { &kms_colorop_pq_125_eotf, &kms_colorop_pq_125_inv_eotf, &kms_colorop_pq_125_eotf_2, NULL }, "pq_125_eotf-pq_125_inv_eotf-pq_125_eotf" },
 		{ { &kms_colorop_ctm_3x4_50_desat, NULL }, "ctm_3x4_50_desat" },
 		{ { &kms_colorop_ctm_3x4_overdrive, NULL }, "ctm_3x4_overdrive" },
 		{ { &kms_colorop_ctm_3x4_oversaturate, NULL }, "ctm_3x4_oversaturate" },
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index 30278ca4e..3188e6db4 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -44,8 +44,20 @@ typedef enum kms_colorop_lut1d_tf {
 	KMS_COLOROP_LUT1D_SRGB_INV_EOTF,
 	KMS_COLOROP_LUT1D_PQ_EOTF,
 	KMS_COLOROP_LUT1D_PQ_INV_EOTF,
+	KMS_COLOROP_LUT1D_PQ_125_EOTF,
+	KMS_COLOROP_LUT1D_PQ_125_INV_EOTF,
+	KMS_COLOROP_LUT1D_NUM_ENUMS
 } kms_colorop_lut1d_tf_t;
 
+const char * const kms_colorop_lut1d_tf_names[KMS_COLOROP_LUT1D_NUM_ENUMS] = {
+	[KMS_COLOROP_LUT1D_SRGB_EOTF] = "sRGB EOTF",
+	[KMS_COLOROP_LUT1D_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+	[KMS_COLOROP_LUT1D_PQ_EOTF] = "PQ EOTF",
+	[KMS_COLOROP_LUT1D_PQ_INV_EOTF] = "PQ Inverse EOTF",
+	[KMS_COLOROP_LUT1D_PQ_125_EOTF] = "PQ 125 EOTF",
+	[KMS_COLOROP_LUT1D_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
+};
+
 typedef struct kms_colorop_enumerated_lut1d_info {
 	kms_colorop_lut1d_tf_t tf;
 } kms_colorop_enumerated_lut1d_info_t;
@@ -85,6 +97,51 @@ kms_colorop_t kms_colorop_srgb_inv_eotf = {
 	.transform = &igt_color_srgb_inv_eotf
 };
 
+kms_colorop_t kms_colorop_pq_eotf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_PQ_EOTF
+	},
+	.name = "pq_eotf",
+	.transform = &igt_color_pq_eotf
+};
+
+kms_colorop_t kms_colorop_pq_inv_eotf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_PQ_INV_EOTF
+	},
+	.name = "pq_inv_eotf",
+	.transform = &igt_color_pq_inv_eotf
+};
+
+kms_colorop_t kms_colorop_pq_125_eotf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_PQ_125_EOTF
+	},
+	.name = "pq_125_eotf",
+	.transform = &igt_color_pq_125_eotf
+};
+
+kms_colorop_t kms_colorop_pq_125_eotf_2 = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_PQ_125_EOTF
+	},
+	.name = "pq_125_eotf",
+	.transform = &igt_color_pq_125_eotf
+};
+
+kms_colorop_t kms_colorop_pq_125_inv_eotf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_PQ_125_INV_EOTF
+	},
+	.name = "pq_125_inv_eotf",
+	.transform = &igt_color_pq_125_inv_eotf
+};
+
 kms_colorop_t kms_colorop_ctm_3x4_50_desat = {
 	.type = KMS_COLOROP_CTM_3X4,
 	.matrix_3x4 = &igt_matrix_3x4_50_desat,
-- 
2.43.0

