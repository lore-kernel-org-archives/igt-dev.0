Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F682C48BF6
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E64C10F297;
	Mon, 26 Feb 2024 21:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MfeG5uKK";
	dkim-atps=neutral
Received: from outbound.mail.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A271710F29F
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqFy5j+zKMyJu5U2uW2v18Jr6YCbrDMvewaAXeZMI89uQjjbyg8Q5W9zBeI5yHBXfOSyvnEGEIKXV1khn4q0FpL7h0Ymz4n2/uPWebv1jre2WzjSAWs5EPLC7O2oEBiPwpVNLGKM71rUBwWm9VtwWtDX/hV5/xnT5FLODHCIZwkCMjU5QLL4gYed1LbbclDSAcWqEqIISYeDMNf+M4ouIQMFp38OEy3tjEutSLd25epfg/zPxD/SwBbVjdhAU/ecr/AtPyYLAgZthaAXK87ufNMlOrNr48mXW7EhS8UHELHDibY5cGx9FP6OAz2VlC8bsnoxVyDRkXbxv5GdOZKCAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9pB4paLQCVnofugxByAgtwiIW3APgBJ6L8XcRJpiPk=;
 b=P1kYNE1oM9uS1E8AvUZWZ/Km6HGaaJf/zZuC3WkTgnUDEFEohCWQVDThiND8wys718TNIB8d41Qbzbbjce5vj/8tGAVjpejztBe5MgqJidRI7MJKhaQIcxmsTkBlx1SRvcG37esVP3HQy4FeuunSGbikvO3zNYaiOUgfmfZDlysPhBcaDFgh11mi0M08ZDCPYkvIAi4RTvRc/qAfkRoxPDQWOuo7xLkUJEzfm/uodL75xVGPMOUoTDMwvDGRQCWWl/4fZx7sO20T99YidpX6V58TAtoM1J19TEg716z8ZRn0LAvwnpAz6qGZub1DXFrWSYTj1CmAJ3Obdw2T+3MD5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9pB4paLQCVnofugxByAgtwiIW3APgBJ6L8XcRJpiPk=;
 b=MfeG5uKKPfUWhQncW+G06PTspTrCN6n8LbBmlasA8km4OOeeWFFHswYI4rCxndk/L9OFFIY0VTGfjKcA04D9Qgc/mLI3HMqS8LvltddMys7MZDFT4Hb2az6pxWmGzNMFEIaCtKPFDeba6wfN5nSKayoEdHNA/mRrrln5jiTB3yw=
Received: from MN2PR16CA0008.namprd16.prod.outlook.com (2603:10b6:208:134::21)
 by MW3PR12MB4556.namprd12.prod.outlook.com (2603:10b6:303:52::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:14:44 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:134:cafe::f0) by MN2PR16CA0008.outlook.office365.com
 (2603:10b6:208:134::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:42 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:42 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>
Subject: [RFC PATCH v5 27/32] tests/kms_colorop: Add a sRGB test for EOTF ->
 Inverse EOTF -> EOTF
Date: Mon, 26 Feb 2024 16:14:11 -0500
Message-ID: <20240226211416.100660-28-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211416.100660-1-harry.wentland@amd.com>
References: <20240226211416.100660-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|MW3PR12MB4556:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d98dcc9-95c8-4e4f-9e3c-08dc370ff3df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rW8hjPCM/ej+HQr8Rjklb/PS0Lp3K/W5gQB2acb9+mnOvNT/kH+rT8KniUwwg1lewIAaLIwitOiISjCkzdVwXDWcolvGU5+P+UGcLFQNBx+C/NA7ZyOnuDIVM+ISig5XosRRyVVS/17LyP9FrZIpYfDPMExsiwNqhECfAwXo5B1KdXlIsYefA38UCQ/z9U5itcAR0Lohg1cGFgofx8B+9TYsAd9tpr24KC8PrEwYbbQoDCX+IWBd8bnv8tzFVLNcqYtZNWj+D1YeKQdWECLWxJ8T0bAcKDV7zGaNtZmgDeiYC/kNHEkSh5slqUI4+Vg1G2djxx1+KUnmUqddAyoxZjeWTv+CXTvwH+x21ZKApaowag5zf6mO6eLx2w/YGaYyQlxElMaveSfCJbv0mGKrJobc2QyZsPMwQNqjBgB36ikpmeZU5BE0oH/DaIQSwYC48ajKQRiGuejrZNe9BGULtzUPDuQXgED24GIOAAG882DPDxLsoiu3aw/DkYCsWXs2svssC+RCwyR4wOItQOgtAHLvEWgOJmjjYe2F8FYvOtXl9OoQ2WqNyCwpJ0GPJ5HuWhDT23vWayG+iIZaDcJJD8lZX+rITESA+LTSmzrU+vAmqeRZoYc07QsfyxsbfEilHx42FDT+05yyUGszhG8RXaJNLK6tSXI7EBlEUJQ5VF2/Lw75zdlIMtl6cbkpSpgN7oB83Rm/YJGNkHhzzFRhjRJFj759umXJUb62V0xyYZZLto8A1VjrqIfNsItq4xuO
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:43.4854 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d98dcc9-95c8-4e4f-9e3c-08dc370ff3df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4556
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

From: Alex Hung <alex.hung@amd.com>

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_colorop.c | 40 +++++++++++++++++++++-------------------
 tests/kms_colorop.h |  9 +++++++++
 2 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index dccc1772bfe3..ed4cb2652f9e 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -40,29 +40,30 @@
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
index 3188e6db4300..7d5cb4bd1669 100644
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
2.44.0

