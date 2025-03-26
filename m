Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCB7C3600B
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:45:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3932D10E79E;
	Wed, 26 Mar 2025 23:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mpBWZNFI";
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2082.outbound.protection.outlook.com [40.107.96.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A11510E79E
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:44:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMsBM47HLJv8Mf7FOSI9d8DxFsE1sEA6d0L2qrdoS1F5QmQo7T0KgZxnWWXdc14nZhBhoRzs7KFeF2rX6Zsnob2egLgGZSW0I4IE9KpLn1dsf1ynt1UsmF55jRFJIAvzE65Mo7F2S8k7deBnrnb6fik1UQECJXrkFJX81iMQMJjBL5xrFC5sX51/5K93p9aS6wC2xnX2YDCtDYhVUUBVVc8GJpzYGbQs7ECbGoWWKOraITSj/EUlVEUvZagb7Nhx52CIypMRgWQiBFLZ3dz7TC1jzsg3vd3/LLV3Ytfx0pQix0vXCqRAF+6P9JiTIygkfIoC9sS4OentqwqlfU+EgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2wk3HXQPVIXdwhaI3lXIHWOwwk2cdBiTqJNeDF5PvU=;
 b=WnKMw3T6Uq97C1/cCMAouKs3vcGldjlL4Aq0kzvVUmmwHqEFbHxoTLY7H9dH1cvHcBK5SCyYloeJ6k5hYj2onWBVK5Ejj7eiq2grmp0rvbBClRD2DA+ExgLOrpZnVzJ9eRvg31b+iOTiuzv17iEVN4DLXWk+HMGRLgu9ItHJ7x5mHCg1xygkBReDsIeQf5MVr00uyksTPCE9SE1zTEpgOssqgc076DpahdWyGo4UeAbitPqb0BP63nI/7LGdRoeZKay7QJ50SVhosWl8DPLvcMxxSlil+aAZQSkONwsXINd++VpWi2l4BYF3bFfXjof3/2G6Dx2QYEX1h1tRySZ+hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2wk3HXQPVIXdwhaI3lXIHWOwwk2cdBiTqJNeDF5PvU=;
 b=mpBWZNFIP86FM7ewn/H3X4HE/kz2mnwkMAjVz/BzTXv1rt4oTvAtp4NZ1kVPDPc6Ycd6n6HNPP8beYVdk8vSb6rzibv9O3QazucKrA2ihq/AT7X1bLvg6tOesl694Z2VRog2F8thwrz9bujF6HDBKcOKMt7WL8x5SXBSnItKxT0=
Received: from BL1PR13CA0418.namprd13.prod.outlook.com (2603:10b6:208:2c2::33)
 by SA3PR12MB7807.namprd12.prod.outlook.com (2603:10b6:806:304::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:44:57 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:2c2:cafe::dc) by BL1PR13CA0418.outlook.office365.com
 (2603:10b6:208:2c2::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:44:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:44:56 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:44:56 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 27/37] tests/kms_colorop: Add a sRGB test for EOTF ->
 Inverse EOTF -> EOTF
Date: Wed, 26 Mar 2025 17:35:59 -0600
Message-ID: <20250326233609.2980110-28-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326233609.2980110-1-alex.hung@amd.com>
References: <20250326233609.2980110-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|SA3PR12MB7807:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c37a8f2-c48d-4188-e0cb-08dd6cc036f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P2t/oJEOFJ/+TA2tdZTRY0El+UBHXKCeWJqMkDbfyhAjFNqbZAZQqRt2jv5W?=
 =?us-ascii?Q?wyzGid2+IxHjE0xRgEkO89CBnCosHAZBEXYv+3BBKsGOteQe9xHTLsTG9jTf?=
 =?us-ascii?Q?b+z94cM+Irb52uH0qQwA8abTx8fGkQ2K6qvC+HXKSK2qZrfaFYgthbQvvGnm?=
 =?us-ascii?Q?TfmOF6NefX62jsjm2/H3RgFov9dAaVmWJFmVsKPOF6MaYlZrVC5+0PAwwz6V?=
 =?us-ascii?Q?gTSxcDesgcc3qqOXnc8kmMTORirw5wXKhZxAf418eI1/6a0VxWYbLRkHD3yb?=
 =?us-ascii?Q?wKkv6nxC7tHFJKRNWrvEx30p0O04iWpQNvhbOFToTs5H6wrxE6ab5YsyIY74?=
 =?us-ascii?Q?PCxS+eaytpfTSPF2aDzVnQ1cb/0p5fvECBOBivFvpz2wQJsHdevGhj8lezzy?=
 =?us-ascii?Q?dJHE4Q4+DMKZuGNjiufFasihr9nN4HxsfLomTQ7oBoaeqqv+/e+UhRnwx5CN?=
 =?us-ascii?Q?qeGbPQQ4Mems95zXu4kxDGT3rSIjqt9ka54//hEs6jzaH680TlosJBoX4Rui?=
 =?us-ascii?Q?CYkPqFkdoi7ywWSz7YWtIt44+tb6dcv4+8919GkCX+cU0qq5pgsk4SH/QbHp?=
 =?us-ascii?Q?ymuHBXsD3MArEH+LL2RvVZ6vMlMiYiJ7Rtt8OOgsyNdiqNM8ujR/zYojeeUu?=
 =?us-ascii?Q?VN/KNVqqjEtS1diCCbu/KcHQDNpBT2q7SCWJIz/zeqH0vF4mWz/bt9rPEo7i?=
 =?us-ascii?Q?qK6j/1xp8+qdXHUzrfPMGZdKzCkdqs6xjjnmCaejU1HbweYrr3ACoR0A/fI3?=
 =?us-ascii?Q?8WHgOgVgVw0RFY8Dvv+eD75WqPGVGTqqp0jvOYIfL8newc5tnpN2T3MDtul/?=
 =?us-ascii?Q?ahmbL2x6VVCd7/scpB1wxK+9vFQSiHampbiboM00OHMwKHWSK/eYkbXf+Lqg?=
 =?us-ascii?Q?J6fnixTVlLS2XPA7fY+0XAriaRwDYcMsnwiZa7OhV14Mux5/MJIR9uYna6qH?=
 =?us-ascii?Q?m3Jm+tbF8qOo3AoRBDIMgFOjEZLZkEHesXaVdV4obML6uJbPkchL05gGHOvd?=
 =?us-ascii?Q?gZgE2O8cT7SzqWlw0L1ON8peh129ppOTxDegk8wFHXJrAfoaDiui/AfshLOt?=
 =?us-ascii?Q?F1BDxps2/szztCnYsFXsHNIa/O7OCj/PuiUbJFk4lmmXXWsRIf3Mto0xEoXy?=
 =?us-ascii?Q?vazoGFTlvfErLzxKKTx3mEe3zrNDMdSNx7cj3xtDjWh4D4M2W6rYnQhY65j2?=
 =?us-ascii?Q?sJ3Ky9sjZ2WHPrVQLBdD7QcMLz4vz6cpW6zf+fkWFHVFoWbNliLfEKvgQoMK?=
 =?us-ascii?Q?KmiTeMK+m3NkyIwZdk+4NnDJAEGp8RjtCcWp6JOqAA35nagLK18t6eoGAOPV?=
 =?us-ascii?Q?5jraN5IbGtPulT8BQDUHx+NYpZMuX7TIlFPkvQzJkSsEXavKvNllI+NoOleM?=
 =?us-ascii?Q?i3GrG8EZ3a+dsZb0ntHBSBonUH9CVf9W7s+HCdRJrbN1AarPQiAhG/aVa1+A?=
 =?us-ascii?Q?L/Uttjnk5mojooo+LC6fkI7tR6B6T5yZaFfWoIYE59CnFKbBi8sD9FCta4S9?=
 =?us-ascii?Q?GJ7RguzKAH38BRI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:44:56.7876 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c37a8f2-c48d-4188-e0cb-08dd6cc036f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7807
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
index 538c527f6..e86115372 100644
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

