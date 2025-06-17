Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0751C7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A922D10E4C7;
	Tue, 17 Jun 2025 04:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uZ/zJ+a1";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198E210E4C7
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:41:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yuAjPrCgRopnP5kbDc6tpcA5zsAj5xDwOSy5ZqcPWnxZ3c9Zd4PgDPzjL6hYrB5H3f7WfBtdXcWWaZzTq3AlkVH+ihoZFrkd0KjfcdSxAeHn5pYB1ABzdvTs1qJL/jj+mVOFfeEdvY6tvAAhMQj9ytLewwYh4lusacffiHB8KtzDQdgt3CjW700IFmWN64jzFmpCrZdi2p3goQV2c3kLPcS3cka39XXLnabHg3r+6dFPgmrD9BOMkyNONiyWtCER4l/pppcJYKyq3p13WFAdjcxbvwduvEeo6PpzcN0GulIHsgB0z7YJmc88UHMcb7ieWIWj9m7GiMCN0X+n2n48MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkBQy9O+DZ7V4wEhL6+8t02DCykbFsQAF+zQcbUOiVs=;
 b=Mp2MF6cXJtRIfXSa+bC5EMVetVL5UrofTv/kogp3l1qIlnOOH2bS+PBuOkEFfdJP76KbKeta6NQvIxxbwYFzXwXsY3RKOv+SwXqIEcJAIHRI9T3fa4GD4juRGGeSK/7VBTrwajWCNAB+mFKkfTWMhUnSS5KfQSAB+DARnpa51m9FSXFptlVDX5Ab21hEhdypDV0qcnBb1IbGqk0WjSSPPiwzMI43E5/dsNLHgyEvKsInf+MTKvAie8jpnUo7BnY80UngA0HanJaYoQxnICpC7zeEOrIdMVToLbSjkJgmhYBGmrBWzuFFdgz14D6mkmnSL4z2IgNYXqw2Eq/eZ+saMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkBQy9O+DZ7V4wEhL6+8t02DCykbFsQAF+zQcbUOiVs=;
 b=uZ/zJ+a1iS1cyYnc63PG37PWvJsXCT68KC8+/nPrhmrnrbJnV40oARdCJmbz6uyVg8CYOkA3uDr18fd4DPTtQ9UTIL0Y6W7YiKYDH4u8IruIwz6Rdrlamp8qY5iNFDxiSg/wYWS7li3rkRlcxuTi4hAjIzqIgoi1QE1X6z2UQm0=
Received: from DM6PR07CA0050.namprd07.prod.outlook.com (2603:10b6:5:74::27) by
 SJ0PR12MB7067.namprd12.prod.outlook.com (2603:10b6:a03:4ae::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Tue, 17 Jun 2025 04:41:22 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:74:cafe::b9) by DM6PR07CA0050.outlook.office365.com
 (2603:10b6:5:74::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Tue,
 17 Jun 2025 04:41:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:41:21 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:41:20 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 23/36] tests/kms_colorop: Add tests for PQ variants
Date: Mon, 16 Jun 2025 22:36:18 -0600
Message-ID: <20250617043631.2920587-24-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|SJ0PR12MB7067:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d0e2900-06f6-466e-9222-08ddad5935a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IWD/8RwR551KK4gs4Ly2FHsHGyqP+TC3cnMIJl89Ft8tF+AF2ZEFcmvkRs4S?=
 =?us-ascii?Q?Hcm4r43ddVB30qf6iuNG+Tl43TKdLss5s3syP/a/r2rfInM/5LYFTlNOlQyh?=
 =?us-ascii?Q?VV6oFxg2zRtaNBeAnjhQHb417YTLl9dbOlydLtMTwYwQ4YDoNvOrZGlvgxNf?=
 =?us-ascii?Q?hSY9x5Cec/q1+BTl7IVrohRnGAmFd0YQdx4cF8FcyyMNiTiUwcRST9OftTXK?=
 =?us-ascii?Q?okiPkReeq27v1JJ4SZKOfeLJ/wuBUWvayqfyHkbpkwEuUhW+1slhpa1i6ML7?=
 =?us-ascii?Q?RMPWaT0bh0BDdysK004nm+IkicKVBzdY5kBaIIgpIX4hrr7xE3CDKAgJ1wKZ?=
 =?us-ascii?Q?GafwdHDB8wMbQAcU/WfevV3favAZpGvXmQBuxw7jVUFNfYY4O4Xc/eNdat07?=
 =?us-ascii?Q?UDHBmyCK943mxd/OZV0mkTwbfjm/Zwm0PZRbe7YZSJWvDWQwKz45eVOZSMeg?=
 =?us-ascii?Q?9y6QPM43ayNA48SyG2NL8B0WSL92ckx30gRxNNTI0gE5hv99ya+0pXwchEgD?=
 =?us-ascii?Q?ANb7j8VxeeW95P/mVjsHGUfnRHnTkwef4NeZBW0gTUGgUiQcZW04cqkGcVn8?=
 =?us-ascii?Q?ga1k6ew/2Syp1DiPPgojYD96/Vwnkj14gE/QfWQiAbF5gSRAk/Q5l5Bcv8Gf?=
 =?us-ascii?Q?zdPSzV7xOFs5KvrgKxuFrG6q82mzjvnIlLVYTGmRzE9QIdSXE+dW/iE9r1lE?=
 =?us-ascii?Q?ZkQwZ7844nN6wD6AfaKysgF40vEJ2bF0Kk5bEw1VGcJe0H756AWVd3rqpayk?=
 =?us-ascii?Q?L/5YolHopJufPG116O3Zf8zxNxPy9r3JNG6CRZv5GIQf7qWQKlGT7nZD0U/X?=
 =?us-ascii?Q?Z+rzbOvTAVM1iFXuDAak6sIaNrjW0Pfn+wgDWGkUjtx/43785jmqhVkYpjb/?=
 =?us-ascii?Q?Fde5hBN0s5t5xPL6gwLqJm9LyPUvvrkVxCNebZmtaSM234ZT1j+09LLoM+CK?=
 =?us-ascii?Q?4CC+b0uoaGz3kxK0Jj1Pua5wk6lKJcM+tpd4fHeVzyZDoC+J5ZadkE1ItPSg?=
 =?us-ascii?Q?8Grgtsqone/VYcc425h0sBrVSb18ZuaNNW8hw2Y9JDrT6oNNx5nc+DuPPFGU?=
 =?us-ascii?Q?9TwMszetj0ezma2XRC4LAf8iq/W00fFsY3JEBUoDXH7WeJjzNeBuVs6tWZ3l?=
 =?us-ascii?Q?Yv9sCPvj1WRNcHsgU/9TFligkAJ9vCCXeS92u863YZESdIWxZSZLdmkGLl6M?=
 =?us-ascii?Q?IyWyd/kyvoxGJEo42QKhrnoK/5RLb34jykkez1RHwrF6zyacjqNWWAjDYqrO?=
 =?us-ascii?Q?Qb+4ccPPwYntOWGNuYq3Aa56xBzKzKKZzAFesYR0UlGv3ogyeLwyLZW8QWnS?=
 =?us-ascii?Q?xh86nruyg5gCDcLeI/azsrGFbxd02KFcGofj+UQAKaRcPtSa+JGLyznarK5A?=
 =?us-ascii?Q?OYUUOdnwSoEVVSDRXB1+JPosytDSffIBF1YTYHQ/vGmvENwkkQoY6YWU7sr3?=
 =?us-ascii?Q?ol3ib/G3j6oek4Px3SMUNSItOpyaFH9CObyxmWMFTm/UBaDVOcpM/imjNaox?=
 =?us-ascii?Q?p0dgkH68khd0th1SF83do8/V4KzGpqqOltY5?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:41:21.9673 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0e2900-06f6-466e-9222-08ddad5935a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7067
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

