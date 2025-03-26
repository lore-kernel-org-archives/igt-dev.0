Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD5BC36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:42:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818B210E793;
	Wed, 26 Mar 2025 23:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EpMpYQiv";
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2070.outbound.protection.outlook.com [40.107.212.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAD910E793
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:42:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=po+VlfV0hdkci1y9X5jf9Y191BIEOP7+enZQr6Qtbrk0ofHgIiIJF7kLT+X0ye8hloQYd7Dzdqpj1yHcc7EeL1Nq15Uk5ikBl72+rec7cA+d5hLM+NrEO7UPSZne/aneLJy3mcICV912YzgW9p+fb4N62mhvlErxk4mMt2fWlEr/IAyge7Q2CRAmYiG4tERjNmOwDdmKCCYIX27XcjVc1tzxy3GE4MIARUKplnnk0hjnqc2o9UCs6zPf91++MuyTPEDwo0kbjWHb5QmGRhHTFDHskOzxmlcqqIdy1oqc9UATmPnYsrj1cTK5a+4PcWVCjJQVKJC7V0sbpxkv+eS+FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rbx4C+5w5/Shgs0yYUfzoTa4qydMLvCSTqDZ9P4yUDA=;
 b=QryQgeGmG4J7Ckma2PQ3cxQGQnUWs8FU3eSWOH13Fx0PP3bx2wuHNmqaoaZPR6DobCgE/Rw+zPOsx1dV0sgzAYlWuBQe6NzpmYfGzIPHN7jKQTmEUjyQb1tutb76byJDMJ+1cEn2tm1HiUvmeDmKHGEVsS7g57jXraqvy3cbk3mbuZO3Xvbjidh0A2gUS9JU2tILQQYebtW++mM2jjPC8y8Gjeyt8fs4SOyc79g7L/phUHVH7yQ2uenoXyhIpy8+6Fp3KNOCTTzt9IcXpH+ai8OGKshbYvPFbS/ycT3mNSsYWkvcvT8Nro/YlBjiDySsx2nNYwYbIWQskeFDlXTGAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rbx4C+5w5/Shgs0yYUfzoTa4qydMLvCSTqDZ9P4yUDA=;
 b=EpMpYQiv7s1EswfsXP3HMxnZA5f1oW4ZKbubfhAvD4Ci6o3SqtPnJ1iZLmtNC3OXVCmIZReXGRJg/aySIuILTw6p+JQjVn1577TT7hd6otINclnlvmoh49i6+tILQyPiBmqbmwDtvQgcB3Wk4OTR4Ip/IQeNJlOREvdtf2nwjDs=
Received: from MN0PR02CA0011.namprd02.prod.outlook.com (2603:10b6:208:530::33)
 by MW4PR12MB5644.namprd12.prod.outlook.com (2603:10b6:303:189::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Wed, 26 Mar
 2025 23:42:45 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:208:530:cafe::bd) by MN0PR02CA0011.outlook.office365.com
 (2603:10b6:208:530::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:42:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:42:44 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:42:44 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 16/37] tests/kms_colorop: Add bypass test
Date: Wed, 26 Mar 2025 17:35:48 -0600
Message-ID: <20250326233609.2980110-17-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|MW4PR12MB5644:EE_
X-MS-Office365-Filtering-Correlation-Id: edc033a3-ca33-49d5-4cba-08dd6cbfe852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xGLAAa+bo1MfBG/TXYsn7oRoFrsUJANMbRvaWR9gI//22Rqxy04Mh0ze6g5r?=
 =?us-ascii?Q?Chxgi0SsNAOBAPTK2PFvXkeDZAxrCsJxWhucjLXN9eavScHg34RXqP+QvWkV?=
 =?us-ascii?Q?tvviPGDRf6sSlyxKF4DyPvmuFH4czL1iKIQdSPFB8PO1hPApxSlu3qbG5/N+?=
 =?us-ascii?Q?LwgROktwz1yUKYiu/cW04aSvEtM4blE/jy/tk0Ny9iizPMRrkMOvokD5DBTt?=
 =?us-ascii?Q?jcFBwiMmtYmG1R3NnkQCD8xaVTDJZ9Xi/jOA0DBXquR0GexZ1LGSzd/+naR8?=
 =?us-ascii?Q?9bfHe3xhliGakVbqJIAQqS5ujydim4aqTO6+T0P/pg2FJG/QLR5+ZGEGDy1X?=
 =?us-ascii?Q?fvMONxrYH4YfzmhXMuBq6LdVIZudYVew4xdFTb9f8NM9QrqfR3C/7ulUayDg?=
 =?us-ascii?Q?1BmB9NTqxb6IuCnQcrPahZvpFCIb5xsbKNqeijWpe3nPEDfdnfkNJIsOoYu4?=
 =?us-ascii?Q?5xQr65ni/MPuById2txgd8CyGTeINBfPRAvy37RU6nXrxTkkLwJWdYyiLDpW?=
 =?us-ascii?Q?PzdjJKUgq6XXCJF11zt+wD1ASRGs2f0n6mHEsuNXnFB6qws3ZACHgfuPdH/A?=
 =?us-ascii?Q?O/n5dj54th51ascrKnG/G01O2gg5jTqsgwL4lJvP5JID/WurfenpMt2CAOAL?=
 =?us-ascii?Q?jKXrshX7EDxS/aV4kGqO3LpKWzfhi1Q5pOS14XVoWyd8QmTcmUBtS7H9AwvK?=
 =?us-ascii?Q?vy8SP9n+gwXTAQhkoTdZ2D6wUka8cmeO7uap7WhN+VWRCqfn7hI8b1UG84f4?=
 =?us-ascii?Q?ZUVGhGh7zsl8QdEy5wvqhryDX4BMIbU7g7Ngj/4myQN6fqmdYnz+LYG+lxcS?=
 =?us-ascii?Q?elWbiRYiEktWGlnY8+bq7P7ApugR6knwLIX4g+GuiMckZycvWFtnyIYWLLm+?=
 =?us-ascii?Q?+NddfAL/Baj7CRAopM86HBEn3cQTk8mU/6atDzEtghORP01VNPnm3D8tZPhU?=
 =?us-ascii?Q?7bqNdiSYyyrb/230B8kxBRyDXgl0TmQ7EMuQlZ/3pVAJW960VkaDJUqYzxlb?=
 =?us-ascii?Q?SPTwa1qEl0c9zqHD/C46CBlKYS/5J/HmY7kQZ9ipR83MCx72U6kkVlu8GZFh?=
 =?us-ascii?Q?J7to4eQvvLjLVVVlGbxeOGlaSSnuq8GbD2TX4GoxM1kkRaHXCeWBFgAWKzNV?=
 =?us-ascii?Q?VGziq2nIyPnxeCUVyeHUNtb2x+4leBPiyaAvgLq/vr/OZyql9dzxDV9ZlTxs?=
 =?us-ascii?Q?xWK1wFEhW+pkyDrDvcCq3wp50SXfU6hT55i5QiFytALNBzTQlbv6tuzg3vXc?=
 =?us-ascii?Q?2GeKM88UG0d1V+gJz0ftKh/ns6EAPMhJGE0I8AXb1voVALYNeyUoZNjtKVnC?=
 =?us-ascii?Q?KPCJuXOiBjdtsXG5Dq5b18Ryhjrp1yovS/buRWXqEzUSkMgAmhvorPXMmvZZ?=
 =?us-ascii?Q?hOF50RWHnTNk5qk+EsDW1vnX0w2ybme17mgDaW86MFMOQ1dl2lKlxhv8wVTr?=
 =?us-ascii?Q?nJnwQS8gRQ3hMC+H9s7QI0pqXgFIFqLVolctEJN0xN3DUtqElEVss48VznvI?=
 =?us-ascii?Q?ZWhc8/XMgjSvUXw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:42:44.8270 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edc033a3-ca33-49d5-4cba-08dd6cbfe852
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5644
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

We want to test that setting the color pipeline to bypass
yields the expected results.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index e782f7598..c65a3e73f 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -40,6 +40,7 @@
  *
  * arg[1]:
  *
+ * @bypass:			Bypass Color Pipeline
  * @srgb_eotf:                  sRGB EOTF
  * @srgb_inv_eotf:              sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf:    sRGB EOTF -> sRGB Inverse EOTF
@@ -440,13 +441,18 @@ static void colorop_plane_test(igt_display_t *display,
 #endif
 	/* discover and set COLOR PIPELINE */
 
-	/* get COLOR_PIPELINE enum */
-	color_pipeline = get_color_pipeline(display, plane, colorops);
+	if (!colorops[0]) {
+		/* bypass test */
+		set_color_pipeline_bypass(plane);
+	} else {
+		/* get COLOR_PIPELINE enum */
+		color_pipeline = get_color_pipeline(display, plane, colorops);
 
-	/* skip test if we can't find applicable pipeline */
-	igt_skip_on(!color_pipeline);
+		/* skip test if we can't find applicable pipeline */
+		igt_skip_on(!color_pipeline);
 
-	set_color_pipeline(display, plane, colorops, color_pipeline);
+		set_color_pipeline(display, plane, colorops, color_pipeline);
+	}
 
 	igt_output_set_writeback_fb(output, &output_fb);
 
@@ -487,6 +493,7 @@ igt_main
 		kms_colorop_t *colorops[MAX_COLOROPS];
 		const char *name;
 	} tests[] = {
+		{ { NULL }, "bypass" },
 		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
 		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" },
-- 
2.43.0

