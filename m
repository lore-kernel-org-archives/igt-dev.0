Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0378C369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:40:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A23D10E6AC;
	Wed, 30 Apr 2025 01:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kJlcUsGC";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9519910E692
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:40:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VrnxClktOesnh3bg4MVhQbQsljPQVuv86t7UB3nymPcZHHFqY0fqj4N5bZUUjMpTpfNgbLa3K9ON8qMgdgSHlWnl+pE52mF9m/BituYS01bCL0osO6TFUhThy21B+a8DSSsEfGWgTxf57nKZv6gZ+ECRap7dDuMhkXgiWu9Gs86EJpopnVojgXQ1b0FedOudwIZu9zrJYgDpFC9ojLKiRqRluOJH5eeEZCOFwR81Mzdmq2oTzlzS9DskCUZKZWI5N5wV73nQhpYo6FS7sjN2NR0OrVPBq+LKrW1HDx5K1uQfYolXR856z/8yUSLDQZTv9Fz0J/73/iweXDndZGqv8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPavEAjloFjP+AtGu2TChLm+Zx3+6vWt+/O0LFBGBh8=;
 b=jCgKaalH4frk1UzSLsbO/YuFXDZD8uYBi7mTXb07cLeykrWPDWnqc9IdesSSmOc9//YQ2affIzKJuRzTFHkhrG/a6xgUucz9oMEp9zZ7K4MIIB3gp9wglLa22v4ELcRsrJg8HJE3uKCp1J86TIykay87KmvQVQwV9MKoW9cflKWHO8pHe2NGbSaUDRGQEQBXIZ/rK+l+MuUebxMXdKa7dZUZ3H6S21bHHwpP/t8dXnSZNsrTaDkAD4UFiWPiJBRnerZ6SFRgZuB4CcooaZYSoBRriA066NtEIbxNahK3PNUNRLTK/TFpxdrOThfCEB4ssorSKQy+3EshAk0OuUPxRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPavEAjloFjP+AtGu2TChLm+Zx3+6vWt+/O0LFBGBh8=;
 b=kJlcUsGCfwruFiOMXARFSXHKFDxvDV5D14qmkgjotCTVjZFWzVfIqqEdbcHG/SnB16G5Q/6MXyVwjMexFin7UuZEXPzpt0fLvEXmfSVvBSjQWlJvyBpa5OkSmMwf8AnwBqAigYiC4RFTnTvLlk5cirIirk1zIcE8F/GrYFabLIU=
Received: from SJ0PR13CA0104.namprd13.prod.outlook.com (2603:10b6:a03:2c5::19)
 by SA1PR12MB7245.namprd12.prod.outlook.com (2603:10b6:806:2bf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Wed, 30 Apr
 2025 01:40:26 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::4c) by SJ0PR13CA0104.outlook.office365.com
 (2603:10b6:a03:2c5::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 30 Apr 2025 01:40:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:40:25 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:40:24 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 25/36] tests/kms_colorop: Add a sRGB test for EOTF ->
 Inverse EOTF -> EOTF
Date: Tue, 29 Apr 2025 19:34:43 -0600
Message-ID: <20250430013454.226910-26-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|SA1PR12MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: c5a4f033-b1ee-4031-a66a-08dd8787fb1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JZPBowBJLkcYS0U53d+zk1f9blkMV9ayxYYf7+2Rn/5ngvYvWa8JuOYiQDn0?=
 =?us-ascii?Q?aTvPlnrLyYxh6tI0BPtlmPMjzTHJt9gxQUxJYF+ajgOrOnMY2GXzvvIPbuDd?=
 =?us-ascii?Q?taMlJRJVyhb/53g+8ce/DUqy/IY5mIzZeZDngU4LqMJRL8J7RfxbkAQNkZqR?=
 =?us-ascii?Q?s0LzKFOk7rvkC5AkbWahdGlUwXGEwEIi1+AWTCzIRoWQ0ziIfUbzBvCsDz6L?=
 =?us-ascii?Q?3aCyLVMzxDO2kWAczC6Cw3AvfdIWzAcnYpqU18SkX+bSuJVgqi2IvmV8xfHc?=
 =?us-ascii?Q?g6lyWv/pkP0zw4VSPA8+0LO2CMHZrLrcR1m4PLeVWQXa8DduZ8gkgs7z2HkB?=
 =?us-ascii?Q?7iXNTwL+q50IdGkjOZEDtSyRBKt71v1nOV86tF+sMFPpQO7mnQuRfOdI/lDL?=
 =?us-ascii?Q?/nJI5CmjhPPH3hShPyi4GuNkf/Zf6t6ddr8whehmry9YgJvu0tUuKwv6MsEl?=
 =?us-ascii?Q?erXmKMbRMAqvfghuvD1N58LwzakbZWB6p9pUZ5YlN0lKVpyVEA2+It5B+N2M?=
 =?us-ascii?Q?o2JwcFzoq+uivjf3qu/Fb/9GlqCXbZYjY8ympEA3qljfZmPCBhuUtWYV82X9?=
 =?us-ascii?Q?+iPnGpPK2vj7tjJflo+A1pLR4i5ZHXl0EiFnJ3zrAc63Dv0LFq01eu84L9hC?=
 =?us-ascii?Q?761O74zJ/edwS4CONsuVxxCivYCFAc7oYpMB41KoBDKEGkobKf6JPMqm5kth?=
 =?us-ascii?Q?HC6FAuIZGyE2No4uLom9S2k7lIgi322lwPngvXc+HG/NxtrOA2z3/TdY8HR/?=
 =?us-ascii?Q?AxcCn7hjNAD7gyZELWSYD059NQLULZngNZtqha86uJ3oo5mN0SRbVPNLehDb?=
 =?us-ascii?Q?Xu7BfrstH0c41Nc5AOZhYHRXw8T1H3144zF+yvGseYKhUT5K1C+GpAPtvYWp?=
 =?us-ascii?Q?bhxf+N225B6gT0Qk6sItA3IGKcz+4o+t8JSBjHWTPaGGvWmM8RklmBmD7ilJ?=
 =?us-ascii?Q?BYPoX0A3rqAlNb+S35topaBx/mXb46uto0KiOuz18uKXps+HL43B9aneIrRL?=
 =?us-ascii?Q?M6jzIWBCu3vdv1E+m+aCbVvBcwQ9Ny0pIoM8xtvmrFvSLD0mP2cB3PFASpAk?=
 =?us-ascii?Q?rsT627ziBHAIyYcT2WEhVn+w/hwNhP4T7eoZ6KCgVqHJNsp5B6zJPQohRNnQ?=
 =?us-ascii?Q?YdVeOQmukfVYckZlRT+K1hDbFoY1CB6fEGhdxvqePLQboMOKpySUgaP4tYHo?=
 =?us-ascii?Q?YPH2I8V3xE5NqCjLQBeLB1OkV61jKwDCA01bRAUjj6lhZDmQDYZAS4u4OEFV?=
 =?us-ascii?Q?yRVAmW2XEsdL8yawE5LnQaQq3w5ftigS66MK8aHj+9Vcftb7yUCPqYDJqnMU?=
 =?us-ascii?Q?NjegLiNPfeVSvm2VfxbuL4q20xQTye992e3LRUPDKv38/asdtiAQ7wTI/JcJ?=
 =?us-ascii?Q?uyHxYdN9FP95IPvonsNG1vgoBRPMt8GnF1nF1ooGb4MhO4TW7xfOD40QJ1KO?=
 =?us-ascii?Q?G1wv7jZw/5VjCBhdKIjv38hYcBOM9Oqkqufs1uUsjmkIcy7kDmiOsBUSqged?=
 =?us-ascii?Q?Lt75FnBonbmeMRz7ldzH2QzOyEOuq7hI668M?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:40:25.8486 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a4f033-b1ee-4031-a66a-08dd8787fb1e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7245
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

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_colorop.c | 40 +++++++++++++++++++++-------------------
 tests/kms_colorop.h |  9 +++++++++
 2 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index b7de2080f..c146e85d9 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -39,29 +39,30 @@
  *
  * arg[1]:
  *
- * @XR24-XR24:			XRGB8888 framebuffer and writeback buffer
- * @XR30-XR30:			XRGB8888 framebuffer and writeback buffer
+ * @XR24-XR24:				XRGB8888 framebuffer and writeback buffer
+ * @XR30-XR30:				XRGB8888 framebuffer and writeback buffer
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
+ * @srgb_eotf:                  	sRGB EOTF
+ * @srgb_inv_eotf:              	sRGB Inverse EOTF
+ * @srgb_eotf-srgb_inv_eotf:    	sRGB EOTF -> sRGB Inverse EOTF
+ * @srgb_eotf-srgb_inv_eotf-srgb_eotf:  sRGB EOTF -> sRGB Inverse EOTF -> sRGB EOTF
+ * @pq_eotf:                    	PQ EOTF
+ * @pq_inv_eotf:                	PQ Inverse EOTF
+ * @pq_eotf-pq_inv_eotf:        	PQ EOTF -> PQ Inverse EOTF
+ * @pq_125_eotf:                	PQ EOTF for [0.0, 125.0] optical range
+ * @pq_125_inv_eotf:            	PQ Inverse EOTF for [0.0, 125.0] optical range
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
 
@@ -489,6 +490,7 @@ igt_main
 		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
 		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" },
+		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, &kms_colorop_srgb_eotf_2, NULL }, "srgb_eotf-srgb_inv_eotf-srgb_eotf" },
 		{ { &kms_colorop_pq_eotf, NULL }, "pq_eotf" },
 		{ { &kms_colorop_pq_inv_eotf, NULL }, "pq_inv_eotf" },
 		{ { &kms_colorop_pq_eotf, &kms_colorop_pq_inv_eotf, NULL }, "pq_eotf-pq_inv_eotf" },
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index 3188e6db4..7d5cb4bd1 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -88,6 +88,15 @@ kms_colorop_t kms_colorop_srgb_eotf = {
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

