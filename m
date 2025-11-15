Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B748CCE8D6B
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:23:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E27710EBA2;
	Sat, 15 Nov 2025 00:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tXaC7jlz";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013020.outbound.protection.outlook.com
 [40.93.196.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BDC10EBA2
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:23:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LooTO91jTBghf6RZHwtEC+WiGmTLM851gy5WaLtiadfheI0t1mLEwP1TGdCTiTfhYOVTYwBmWUQ2l0oeD2nO7IxwzhpnwZXo5Z0KU66/eGi0DQEflsct6EgYRHNRq9io3V9w7DlRmwhOPtm0PV6GVwng4fpkE6xi5Rz0qzeOI3HC1iWB1ee4Qn6l27CgzuNHHNjR7170iE9qIHzz6bm9V36Apy26ja2QIx6rt8mzy9IkTlSbiiskjID3ppFnSPHIRK/C+eYISaj4JM7HKP4kJueVrq6TISGKu1dAfMTvebwnFOlL0D7AOGgGONOUIhucF80M9HrnZ+68x7AgPvBDIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgjI8Xx5AvffHzhYVOPWqTvKCVAO0QJLoZQsZgSFtv0=;
 b=sPwZk8KU5RND2bNXcD6Q4llrdX+hf2f2haujzJUjpkwUJTesjIuimMJbGTqdp3XHIz+lKVM4vPO5JmcIadTcJLgU0QZLYaxnNI5bj5hCnKN0Wxm5z3UbGJGF3OSAUuyp5FIYtPt7WBdP5MJjW9gfPYSEGNttKFvCthqJx7epbNvex5pMJUSnpdXMDU/naLVaLCEoTbvECaaJIHXr58gjzOAs4BSCtrigP6F0l6bd2aMRugDnJEUIxB4uMBx/USBLpSD4tDzEpmDzaDbm9095YGFrQ6yEv9x7zoLAvU3qih+eM+silRfFuSQvGmy3AkaT38vFVl4xc4Hn+ZVk+FpKng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgjI8Xx5AvffHzhYVOPWqTvKCVAO0QJLoZQsZgSFtv0=;
 b=tXaC7jlzNJ85wrOIFaChb6Lps95pWS+bYr88jnIpK5abmMJUCdEg0TNPodbEa7AIaCMPtXyl9+GGZG92L3rL+cePbXXRtJGQJqEbsG0HEsKkORHUW3GuI32sR4yz3a4+zKjJhOULxE10hlEem5z3KFqRurpcKjRK6vobZ9wbEdA=
Received: from MN0P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::11)
 by BN7PPFA42F4F89B.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6dd) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 00:23:17 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:52a:cafe::30) by MN0P221CA0004.outlook.office365.com
 (2603:10b6:208:52a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:23:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:23:17 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:23:15 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 22/32] tests/kms_colorop: Add a TF sRGB test
Date: Fri, 14 Nov 2025 17:18:31 -0700
Message-ID: <20251115001841.3563993-23-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|BN7PPFA42F4F89B:EE_
X-MS-Office365-Filtering-Correlation-Id: 730dca3b-8f54-4627-8e95-08de23dd2c45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IeYcWX5oK3IF7o3K7K7J0TYl5YnLe/bH+zGy2/BT2ghyRpN7cVmxTf/FWrTo?=
 =?us-ascii?Q?q8n6CU2D1Cj7w430YXRKeLrGPo1DeY9Ey5RF0z39anhykQyguPfhPQOAsyTy?=
 =?us-ascii?Q?4EXPIeJLQgmW/RIqIZ3JeqzNKWo9edOjeRrJvqAr4YBTCgPgpPIBV6LWgvKD?=
 =?us-ascii?Q?zt00i2WCAsGVfJ5bNzMT716EQQpqDF+1/7qTQxJGnkqWLDd86DoizL9mVmJ1?=
 =?us-ascii?Q?L0Fp/pAId9gYEVanVsmA9vVZk1PpUKKdTYE6qXy2XONkYXRBwact2t8vKF9l?=
 =?us-ascii?Q?m/qVVSKSJEMFsG3El23qz58EgGVgwvJtydabXgEawP/XT6B/kuYUjsiFlNdC?=
 =?us-ascii?Q?yz3o8Jhv9SAbZbUWFzkq2HkyPt3vfLxk4PJyvHvtLBq6QgiboWs0MNpdHNuQ?=
 =?us-ascii?Q?HbEYD20dA97DJGS8PZ5ho04UxkFroHFo/BU5tMVrXGYSCIExecWTSFHhnmVd?=
 =?us-ascii?Q?B7xO7AkJbjR/c6COaWjMyRE3wqSanNg0dQDe/3WQThU6FMlO2vCd0GQbUpzf?=
 =?us-ascii?Q?xt6XEdHrgLTffcA3MGYqi6/pYUPDo8li1CbXsxJoUCjeckpR/Bro4KB2isVU?=
 =?us-ascii?Q?bB3th+jGOwfFcRrihVLWKLqnSCgY+wyIa6q/oVADd4mq8qCh39TjvvRZc/5j?=
 =?us-ascii?Q?f3NVvClnPk2m2U0ahpzFsXJRL+voBQ2nyXp/Gn7QNXUNaAHpVYKf6URXr3l0?=
 =?us-ascii?Q?m3h3OHq2noPZzdRLEwdGuPxdkxs282BG3xgI2Q7goNfKzXqN1Kjbv3X8W8YY?=
 =?us-ascii?Q?mfwRkLPFb1z4CGdB1wcjClA74x0LrLH9GtQzjH3kXTOINhNnDhi9hVASu1RK?=
 =?us-ascii?Q?4tgCiwq7r6AUrZED4OZsAcW5T7Cu4dORv2WQevm/b6Nt345oIHNega/LrKVY?=
 =?us-ascii?Q?fc08gGLkWplTyYD0DqgyB7yfWHMh4wDsn/UkHabFlHFqtn6UiLgdqmZrz4Yq?=
 =?us-ascii?Q?qpsM9y8ILpb2BoE11yINnuB2LU3e/8beV9Lp5V0R5/QHyw3eLrYbbHqOaNI5?=
 =?us-ascii?Q?lCzbT4LhoIWhQIatNL9X2ZFa3ywtZDvAHUnoobF85vpXB0G5XAjLBwVdCqdo?=
 =?us-ascii?Q?5N/d580mN7vHUyFh02/05Luwy8grld/TmYfeqw5gU8rSk9TKiWw/zp+APrxf?=
 =?us-ascii?Q?yTuTQvldVL2W6s0SxBSDguZqzgNO+79d5dm74V7tOEjy1mLbXYltDq3Ts9VR?=
 =?us-ascii?Q?1UURcRS7bChXfrQpJ3I1PgineY49XUqvekGJLa2JDXaeA2+GYM9c2GBxzFLS?=
 =?us-ascii?Q?0ZIP2jkcdpEMxKxQrT/Alyhslk3aQ86rU7bN0Tf/aHxgMfeVk/ZtYvfQEBqM?=
 =?us-ascii?Q?jtCngdvzmdtivaDx/pWSVnirp8kgTVYP4fie4/nH6/7MvZH+h3iUuI2ZKxA9?=
 =?us-ascii?Q?y068H6EJdKb3jo6YPeXu8mdrqdULj216Gq+UXeVwU8NXJ1xIy/gJoQUYaXR0?=
 =?us-ascii?Q?UkTkCcwzwLlhduDFcw/LX0l78qM3smjw6Uvf13Oxnt/ECC8z4VaY2phSARXd?=
 =?us-ascii?Q?h9LZ4QYQ1c/bACxIBWUDF2PCGGkRHlO+ftaXQ5lahPPKorptYi3Mxd/EmWJx?=
 =?us-ascii?Q?QKxDUOy+Qo8Y1zsHqzE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:23:17.0242 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 730dca3b-8f54-4627-8e95-08de23dd2c45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFA42F4F89B
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

Add test for EOTF -> Inverse EOTF -> EOTF

Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
 tests/kms_colorop.c | 40 +++++++++++++++++++++-------------------
 tests/kms_colorop.h |  9 +++++++++
 2 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 6c62ebe01..6aaa38fde 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -22,29 +22,30 @@
  *
  * arg[1]:
  *
- * @XR24-XR24:			XRGB8888 framebuffer and writeback buffer
- * @XR30-XR30:			XRGB2101010 framebuffer and writeback buffer
+ * @XR24-XR24:				XRGB8888 framebuffer and writeback buffer
+ * @XR30-XR30:				XRGB2101010 framebuffer and writeback buffer
  *
  * arg[2]:
  *
- * @bypass:			Bypass Color Pipeline
- * @srgb_eotf:                  sRGB EOTF
- * @srgb_inv_eotf:              sRGB Inverse EOTF
- * @srgb_eotf-srgb_inv_eotf:    sRGB EOTF -> sRGB Inverse EOTF
- * @pq_eotf:                    PQ EOTF
- * @pq_inv_eotf:                PQ Inverse EOTF
- * @pq_eotf-pq_inv_eotf:        PQ EOTF -> PQ Inverse EOTF
- * @pq_125_eotf:                PQ EOTF for [0.0, 125.0] optical range
- * @pq_125_inv_eotf:            PQ Inverse EOTF for [0.0, 125.0] optical range
- * @pq_125_eotf-pq_125_inv_eotf: PQ EOTF -> PQ Inverse EOTF with [0.0, 125.0] optical range
+ * @bypass:				Bypass Color Pipeline
+ * @srgb_eotf:				sRGB EOTF
+ * @srgb_inv_eotf:			sRGB Inverse EOTF
+ * @srgb_eotf-srgb_inv_eotf:		sRGB EOTF -> sRGB Inverse EOTF
+ * @srgb_eotf-srgb_inv_eotf-srgb_eotf:  sRGB EOTF -> sRGB Inverse EOTF -> sRGB EOTF
+ * @pq_eotf:				PQ EOTF
+ * @pq_inv_eotf:			PQ Inverse EOTF
+ * @pq_eotf-pq_inv_eotf:		PQ EOTF -> PQ Inverse EOTF
+ * @pq_125_eotf:			PQ EOTF for [0.0, 125.0] optical range
+ * @pq_125_inv_eotf:			PQ Inverse EOTF for [0.0, 125.0] optical range
+ * @pq_125_eotf-pq_125_inv_eotf:	PQ EOTF -> PQ Inverse EOTF with [0.0, 125.0] optical range
  * @pq_125_eotf-pq_125_inv_eotf-pq_125_eotf: PQ EOTF -> PQ Inverse EOTF -> PQ EOTF with [0.0, 125.0] optical range
- * @ctm_3x4_50_desat:		3x4 matrix doing a 50% desaturation
- * @ctm_3x4_overdrive:		3x4 matrix overdring all values by 50%
- * @ctm_3x4_oversaturate:	3x4 matrix oversaturating values
- * @ctm_3x4_bt709_enc:		BT709 encoding matrix
- * @ctm_3x4_bt709_dec:		BT709 decoding matrix
- * @ctm_3x4_bt709_enc_dec:	BT709 encoding matrix, followed by decoding matrix
- * @ctm_3x4_bt709_dec_enc:	BT709 decoding matrix, followed by encoding matrix
+ * @ctm_3x4_50_desat:			3x4 matrix doing a 50% desaturation
+ * @ctm_3x4_overdrive:			3x4 matrix overdring all values by 50%
+ * @ctm_3x4_oversaturate:		3x4 matrix oversaturating values
+ * @ctm_3x4_bt709_enc:			BT709 encoding matrix
+ * @ctm_3x4_bt709_dec:			BT709 decoding matrix
+ * @ctm_3x4_bt709_enc_dec:		BT709 encoding matrix, followed by decoding matrix
+ * @ctm_3x4_bt709_dec_enc:		BT709 decoding matrix, followed by encoding matrix
  *
  */
 
@@ -439,6 +440,7 @@ igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
 		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" },
+		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, &kms_colorop_srgb_eotf_2, NULL }, "srgb_eotf-srgb_inv_eotf-srgb_eotf" },
 		{ { &kms_colorop_pq_eotf, NULL }, "pq_eotf" },
 		{ { &kms_colorop_pq_inv_eotf, NULL }, "pq_inv_eotf" },
 		{ { &kms_colorop_pq_eotf, &kms_colorop_pq_inv_eotf, NULL }, "pq_eotf-pq_inv_eotf" },
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index ec25722fd..d5656d813 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -71,6 +71,15 @@ kms_colorop_t kms_colorop_srgb_eotf = {
 	.transform = &igt_color_srgb_eotf
 };
 
+kms_colorop_t kms_colorop_srgb_eotf_2 = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_SRGB_EOTF
+	},
+	.name = "srgb_eotf",
+	.transform = &igt_color_srgb_eotf
+};
+
 kms_colorop_t kms_colorop_srgb_inv_eotf = {
 	.type = KMS_COLOROP_ENUMERATED_LUT1D,
 	.enumerated_lut1d_info = {
-- 
2.43.0

