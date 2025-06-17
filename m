Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA99C7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:41:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC6110E4C8;
	Tue, 17 Jun 2025 04:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="svFSXUbf";
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2056.outbound.protection.outlook.com [40.107.96.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DB210E4C8
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:41:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPVt7qObuemwtXoHKYsAu9h2gVJFTSz5NXnXHDtXNjJhqC3SJ9GWZqLEP0Hz/6moZAPoaOGXOVjrCqB9JM5eUl7TGsP8i7+3d0WO+MoYLr4VhUR/pqE7H3rNsf4Ygxdd1kOyPl5ABEra2szYui8pFMa3Sug9F2kLWItS7u5DqVFL942JMGelDTOnLLp5OCve4kPDJRzvUq7A6pXa/g4DfpQeV4H4V0kXayQL24roGXjzrJa8aOvD3636M8NaKa6kCurNV/B/ePLlDcm0hbzZ1fESGr9ddgsdBow5kRoEDNFYkTDlYVNKEZP65cX5Km+/aKE1ChKA26hINx5QpseQMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPavEAjloFjP+AtGu2TChLm+Zx3+6vWt+/O0LFBGBh8=;
 b=BCz4ziU0HMUnrbhQyy99ONPsQOG4EgnsGOk9VFAOciRtQh5b2+hq8FUN1qQ4+Hc3G8I+0tWKdvYy/X0ofNXG5eUJo1G6wJmBmjU6uu6lpTkYOKIMzWnvWtG6gmbwOqv4wl/HVgs3PEmFrKzb40Ch5PEKcGzwDIiyiITv7fYb2LngWLHSE6yJpVumvJ72Jm9+PVNmukxAwPROX6exTN7VjcrpC7dVLgCKsmHShBMi/YBABF+ZTpi1auMx5foPsG+Nm8SpXMxEXfngXatBVEyDcnW7KuA8UxdMDTH8HhNaxep2n8YlCFe0GaWC5uFfRxxNYZ0CCxWjyPTpWBHvZzZCfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPavEAjloFjP+AtGu2TChLm+Zx3+6vWt+/O0LFBGBh8=;
 b=svFSXUbfEaujsuobo8eSr3ue72jaUrrUs5jDvieb2Ru3023CtQ3vK2LbYwU//8Igz2xe/BZJx91ZlUBgJ6OcqSzeBaKPuT4pF0nT3/oD+JsM9LAYkdpeDIfiQ+7WWEV/Rw4DCQkj/rVR+qLJHzTFV/8lQA5wpporVknrzshfBEU=
Received: from DM6PR02CA0105.namprd02.prod.outlook.com (2603:10b6:5:1f4::46)
 by MN2PR12MB4175.namprd12.prod.outlook.com (2603:10b6:208:1d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:41:46 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:1f4:cafe::ff) by DM6PR02CA0105.outlook.office365.com
 (2603:10b6:5:1f4::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Tue,
 17 Jun 2025 04:41:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:41:45 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:41:44 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 25/36] tests/kms_colorop: Add a sRGB test for EOTF ->
 Inverse EOTF -> EOTF
Date: Mon, 16 Jun 2025 22:36:20 -0600
Message-ID: <20250617043631.2920587-26-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|MN2PR12MB4175:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a5d4c15-7c09-45d4-e8e7-08ddad5943e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WXsmWcu4JF0NUUZG5ZbqtI4pFRbI8AeMqoy4PdvswSvILyv92PCZdCTdU44x?=
 =?us-ascii?Q?cs705bawJaH2RUPGh2EJ3mYsqr5+2lkXGcuVBjrYVv+K+ykGFc9lyqTJvQwy?=
 =?us-ascii?Q?c+HFtaagg1GET3D5T4AG4N/T3WCGjfJeSmdiUl9ZgnevUycQFKX13om/GtWo?=
 =?us-ascii?Q?M8WbkdtfyjygBTTTO4FMcswF/sOk0rUUlKgTuS4callcRaq9lvYElYro4Gs+?=
 =?us-ascii?Q?Ur9/llMvdk8I4L3FuUVHfEmA9MQX5y0vEEvUTcaCniyZtrF5/lfDsimNLLVW?=
 =?us-ascii?Q?jZ4nC79GfCHzV222psWFEnakPRemNYnGaNJaUlSOe/XE9vRygCGd5T27dNGH?=
 =?us-ascii?Q?gWx1c5sHTRDqlvRUgVsaRLlghiUnv8rEi/4DIOKeeeN7/hTfhsXdQsZy3C3a?=
 =?us-ascii?Q?IAK1KJOy7azuH5w+WuIFbjEJbgKoAn083SXopIGoqHOpFHkEoz6501a+V9kN?=
 =?us-ascii?Q?0K/hDdE5+py2RwuMmybzPa/Dhmb8dDMm4EW2QsdK+ViflsFF4breAZTW97/t?=
 =?us-ascii?Q?RkzyFl7vU+0NCX57/3fXHgC3hJHd+tRgfJJ+2tWafxg3HOeauEr2rrPiSsOV?=
 =?us-ascii?Q?7uJaHVRfIqPaxWAhwNQfi7XYkwf/is3/jC9QKe/hmbeIMEINGk8vG+UV8koY?=
 =?us-ascii?Q?qg6LFYMKscSj/4Qoa/IgqfXi3CMxlvitGtmZcLzIg7BbfVZmP/norwzPrixT?=
 =?us-ascii?Q?oXzHw7bk92YAIwT8iA937XiAYHhtLxxBe7aK1RtTHHSYdvqaMSxbGEq89iXA?=
 =?us-ascii?Q?FxOStf46FobkHmgz1s3L2LFvjLiLDJOz/RoXa1LJUQPe4ZmArFxpZa/FiG/X?=
 =?us-ascii?Q?TG/dNb58X4+H/3KAcQ6LEFSsnR2Nq/7YNDVpek2S4SYAu8p3lhosJqEiLvjv?=
 =?us-ascii?Q?ZoaUnJllHHg+y7APFkI096/aYCNH6vNVNaFbJgAATulBmDeZ5CMB2nVjXEVG?=
 =?us-ascii?Q?+vvGsVQHSy6F8AL5/bFLhk6mdipB6yC2TW4rEWrpUxk9iCBjK6MwXM1CiDli?=
 =?us-ascii?Q?V55nM/bX8JD6NTh8dcb4fH501Je342zA6+46EnIIdsOJEvY8V1fXy6cHHEjD?=
 =?us-ascii?Q?SO4GgsMPZck/jO1RplT6b7hHcTG9cWZAYeNxLDGUNHxuv2/pL2Fo5Lvu6air?=
 =?us-ascii?Q?5QFgDZcvMFK2X9JmsbFao0uhZPJg/2pOA/L174JhAlBsv4zj85Tx+PA5vYLB?=
 =?us-ascii?Q?pLaQpSglggk6XkX6RmM3S2KF/2+F6/f3rQmiG2az65OfSNWXbewgDEwXUgYf?=
 =?us-ascii?Q?wfXPnXUUUPyaiT+Ee4AZ+XWis/S/1iMUJRCp3cylf2BnVa0NwXPSvCGaewpX?=
 =?us-ascii?Q?evFTSehNUKcHbZhMinomKrqqzVX0CeuYjC/CnvrDteHwEoGcVU73argZ2wMc?=
 =?us-ascii?Q?qhMCfnLevp766SCIsv7yn10/rhp7Ql+dvZmd06VZJmg8iSXe/6j4SNFX3fMD?=
 =?us-ascii?Q?qUUD+aqPSajhZgRUWs/CN8rys3NMEAuEU5nHnfqxvnn04KH45ZHvuhrRvvu4?=
 =?us-ascii?Q?I90eG4IwbN9s7o70jZJcEaejAqlVYNtytRqQ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:41:45.8235 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a5d4c15-7c09-45d4-e8e7-08ddad5943e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4175
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

