Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C1CCA0EE8
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:11:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2269610EA0B;
	Fri, 15 Aug 2025 04:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ctkj/3Hp";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CFB10EA0B
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:11:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/hULXE/xG2NWLjtWKZqIBl86D1alq+9mtQQYN8GmyyFTwC1tZOsWLGQEtNyY6S5v/NnlS7OekT/auqUBQxDGvqUo7gsCLLWDXhuAdovs46dT1k89XDAICts9y69VNsYeHN2sMPacKqCKiunn6cPK79xxlFZmdE4I/IxJ+o1ucz/WSjpO1kKYYZlTZ68Al5P4cAU9PqvqsMvGpLVEWquwYAO9g/iaDYjXv0C4dxW+W64AaTSHBUf865435IZ4tUdaQWX7tWIjH+oR7PO/yiDFFKYCgXG7jk+yydiBkyOJnKajrj8FRlAqkMfP5yOgnuqxw2Q2d/sJ7+5OJC8ClPd8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bw+6Hqbmjm7YGzQqF+jhcnJOjn+1I7oik1ptBt1mC5Q=;
 b=KjbNpmSW5oS43DU1hUaAaax8U0aRXut69HLX/GhyOdolhd7ldiOdDwc6IuQb3m49ubTg/AH5Ek9mVIHYrORHpanaUIXgVLQLMb7w0wZ/ED7V2rdMokOwXG0FDPNTScpkEnwFaBslk2aXAt/x52x4jVS82LX8hU49GIkZ4ro5X7qLtxeIXyYuAs3bTiVvEia0Sm37NkD4siwhL02EGR1RPhaLEm3ZWEVPx4iJE2xbIQ2NPvMP3bfipdL8GUxB2Q17qmcv9lZ1ld3jFqlH37BGR/wWukEPDaQm7Cc2If2cMsdsO601eGlz3J9ujAsTnl044Jm3OPlP4XcR1nroAPSbyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bw+6Hqbmjm7YGzQqF+jhcnJOjn+1I7oik1ptBt1mC5Q=;
 b=Ctkj/3Hp0on/moFlq0xIo69PoFkH0ZT3NF3iwptdq1sT8So/somamHUSVgNtjXwoLg1k7r+J3dO9qf5noEkdZP7sjgtkypNYz55z+n2BsYc6b88zgjG9XFBEDOxWlKEu+Eat33RCwriQRUgcVSfy+GCVr7fBKjHt8fdwKs0OvS0=
Received: from SJ0PR03CA0183.namprd03.prod.outlook.com (2603:10b6:a03:2ef::8)
 by DS0PR12MB6632.namprd12.prod.outlook.com (2603:10b6:8:d0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.13; Fri, 15 Aug 2025 04:11:15 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::da) by SJ0PR03CA0183.outlook.office365.com
 (2603:10b6:a03:2ef::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 04:11:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:11:15 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:11:14 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 20/30] tests/kms_colorop: Add a TF sRGB test
Date: Thu, 14 Aug 2025 22:06:49 -0600
Message-ID: <20250815040659.3321102-21-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|DS0PR12MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: 404defa9-eb42-43ae-5e23-08dddbb1c74f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9m3jHqclYdQQuaJRfP3NOUh9S9kUFWkmBl5DeYc/yOAMRjdJ1QYgezMugCl7?=
 =?us-ascii?Q?5q8nAPrTztxzs3hXete9WVjqh+eQiseSuFuTqMXZ35a76SXhnj9lRPlKtUWV?=
 =?us-ascii?Q?qJ614xqrMhr/O5NPKQD3tb/oXXWnr02pExZYmMwL8Q6IlJ6U2nIjtoa/SbNy?=
 =?us-ascii?Q?an/8y5P4e5z3ucwBqCZoS2UrcelP7XaMHZ+zE5GqEj1+aWCQ97c+zTc2YPx9?=
 =?us-ascii?Q?kPceUB0o6VltWsniljKyH63oFMwUOFD1WakAttbRranMzPHTUmHcbI9leiVc?=
 =?us-ascii?Q?rFgtcPuAjyyuNUrnSgHnOVi9OskEGp2N0uMwkwzICOJ74tEy1AqIT4O2/A4e?=
 =?us-ascii?Q?DY3+0gb0mFeF82LfYIPqdlAxXXUbLnz2F1MGuVG1uiDWyDbPXURvB5xGQDdG?=
 =?us-ascii?Q?MrmBMgnQyND2Sa8lwB09U5dOaPw9Z0RGTd7wmiXrUu7XRw081GywZkDrbCe8?=
 =?us-ascii?Q?kRCmMzVx59FQPWmESlvHkVwB843N7McuGnczyoi3aUPsZzaF2tu5J9AHSEa6?=
 =?us-ascii?Q?yOUxu11WBzQDT6K/D14B4icZRxwiWQHUDEYYiXPk3ouFq84fWpMSTT9xlMPH?=
 =?us-ascii?Q?a4wkbE8el5WoqbRVTjYJQ9IQnljaD7WIWuKZHzanLvsjzQDdk2LFcYdtrzu7?=
 =?us-ascii?Q?QT7mtdifYQjjd0BdYu00czCRIRhggQVehsglpxngOAA/bZj9qzkGX/Ob3Tk/?=
 =?us-ascii?Q?I4YUyfIJDryyEX7uZTyhNMEZsdcija4WDEhIj8X+Lk1d9wntkA7yG6VvwyP1?=
 =?us-ascii?Q?KYpMVGANlhczuC8G2Jygb4e82OK1JKYB0PH3cPb/UDpxh3Md86DC21prxCiY?=
 =?us-ascii?Q?h3r2xv0ourNEAkDNDuMb6G9mp76zBhFGdmtBTWQDld174RaN6XhcgEipr66s?=
 =?us-ascii?Q?sVvarAVE0Qm4HkYbD7yQzdWDQ2kBHR3bzUJcc1frz+CFhLorIRdzAyynv48U?=
 =?us-ascii?Q?Ji4n3mGvIcJQxaCui8V2t9dJJE504kdS9maidhuMTQyo+D544tyk1AZIuH9j?=
 =?us-ascii?Q?fto4ZqvCifHqKnuKY278go4qDO0DbfizbRpHGglMvfGsPEvj1GNf+sZcxZs8?=
 =?us-ascii?Q?0iNMW6UvL9837lLYyAB5t6oITZPiScPLtZT7eDYlgBzMur6cX69MfN2gMqwf?=
 =?us-ascii?Q?bHOh9OW6hhoBGUUGJrp38wxQTQPFB279Mu7pVkeqqrFH+SNruCKYHzwf1MgG?=
 =?us-ascii?Q?d4KgvXOAv52fODzAEZXghaM5VcaZLQmnlhE+LW0sLdgX1yBXpPEnguGilewk?=
 =?us-ascii?Q?4iPyMSpOOa+815mFbGhnuyznQtPIOGv8ItBi6Q0kp9R2itLWKnYI3fD1pSKE?=
 =?us-ascii?Q?sCr+PeeZj/+i2ip7Ju3hesfFuKNf/j7UEl2Dv/j1MMVzE+7A6o6Sfgw/92ll?=
 =?us-ascii?Q?bbFSHY+M3JcDzHybZltog2ABC3OahzqIC4jpxC/90A15w4bqx9XGMEXw/X9j?=
 =?us-ascii?Q?+//P/rPMOXZVssybRkrJO5eAd9w2di55kimCqkQ8FTLTANzb5b3kcaxnSlb9?=
 =?us-ascii?Q?CmxgpDPrXAADvxArVDi/LBTJdpQvYChT2KnU?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:11:15.4709 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 404defa9-eb42-43ae-5e23-08dddbb1c74f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6632
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
---
 tests/kms_colorop.c | 40 +++++++++++++++++++++-------------------
 tests/kms_colorop.h |  9 +++++++++
 2 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index c650ea59e..98e78f8c9 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -40,29 +40,30 @@
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
 
@@ -479,6 +480,7 @@ igt_main
 		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
 		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" },
+		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, &kms_colorop_srgb_eotf_2, NULL }, "srgb_eotf-srgb_inv_eotf-srgb_eotf" },
 		{ { &kms_colorop_pq_eotf, NULL }, "pq_eotf" },
 		{ { &kms_colorop_pq_inv_eotf, NULL }, "pq_inv_eotf" },
 		{ { &kms_colorop_pq_eotf, &kms_colorop_pq_inv_eotf, NULL }, "pq_eotf-pq_inv_eotf" },
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index 0f56361df..494fd7d5d 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -89,6 +89,15 @@ kms_colorop_t kms_colorop_srgb_eotf = {
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

