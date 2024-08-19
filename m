Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA004C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880F210E462;
	Mon, 19 Aug 2024 20:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MfEeAogf";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2992110E42C
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFzyzZCj/PK617u4As7fn7cyItgcQmrH4FJt64PgVVFLGvgFz4w3WEK+r5FO+ziUAijtcurD+RTTj/VzZsylFkR7EDRurE8lNCw7dFff44c5D3/b+PARwqz71Sl7+cxhJLrd8HB4/uYJWmIpSFVkO9P/ODf++KM/QgNQBUlYoJXbPJUzoNB4fOa0qjWc+7xWkyrOK0Xo65ZiiXBRXBZU0npQ3iMtOWDUsAtnsSBfSjyjMocQfgiYUIanr13WfRljmWVqg6JI0oHipieUEvR+b6Ad6xubI7eV3sPqckgPd1s0i5xMxwP5WtqkSSHiELt0zF7XnXwA5v7nOSlp2UObAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyl2OsOolkOWLh0JhehDmBj/XOzRZhMeDBIV4uB7YI4=;
 b=RJvtje/nxWo/s1y3nJ/CnNq8sJ/F9v8Q/DT7ujgn/laIjoiAzp7dcXQhFfwbZwtPpXwSWvWwmlOJ+51u30ec4YtqIUHRhjKbhPZz7R15gpDe21ktEEchriNY8s3bPaak7XZSUG4qNezBMQxdeMd73VTHnaQQPTQmWjTxJ3EDTN1M6Av75Yq+5bz2vBEuV7Mhnk+7qFFy/VKG7OsOoEamAhkof8Gh7zWzk/GBqYTd15SxN1fCKNtP4uGVvnwqsIDKxTbCr8lGjzoVRA8t0rSCH/GqcR4m17HgcQXz2tmcmv0GlVhhgrGFA6c+acQGqJxr6Bi5tzFf8w5cwpDKRKpuzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyl2OsOolkOWLh0JhehDmBj/XOzRZhMeDBIV4uB7YI4=;
 b=MfEeAogfmYqaxfbs+oU7BZhoLxCr8QfCsnukQc0Jnzi/wrCGuDrhQ9OTeGvzqjMEtOU+R9Kg5iDsvcsvxfZbwcreHP+WSpGmgZVzsiJJDH5SBUGoSBQGYi7aCwTlxuralpAgI3Vj2ujKK5nKthG+zLIhOqOvEve5UT8pJ4UrNdc=
Received: from BN0PR03CA0056.namprd03.prod.outlook.com (2603:10b6:408:e7::31)
 by MW4PR12MB7216.namprd12.prod.outlook.com (2603:10b6:303:226::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:34 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:e7:cafe::bb) by BN0PR03CA0056.outlook.office365.com
 (2603:10b6:408:e7::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:33 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:33 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 16/37] tests/kms_colorop: Add bypass test
Date: Mon, 19 Aug 2024 16:58:02 -0400
Message-ID: <20240819205823.316656-17-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|MW4PR12MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: aaf8a5d0-5553-4fbe-dda3-08dcc091b095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p5KisZcRmndUK1GMN4FKrOCkkI1P56WBx3syLMcCMokmWaX6/noaWwUbybdT?=
 =?us-ascii?Q?lXFMvrdRXb8phcsy2TQwJQSEP/7CQwVraFGfdQO4u2nE9s35vsaOJE2fzsuW?=
 =?us-ascii?Q?SrdylW/2KClSwmNq/QAbanwg6S6JLVrlfdOmtrta+gwKIcVPOi3ktLvUXS+o?=
 =?us-ascii?Q?2q0sgnzvhbAmi037G23xoQPDbjq0agLzK+8SSI/+emEcaXejYJ2EMLCCLUcm?=
 =?us-ascii?Q?ZDPNbRfCjqNZBDDoAYlzviBl2SqOIM47jCbDeyHiV4wBaR9q+/kfpSspzrUy?=
 =?us-ascii?Q?ChHFqxTTKJKtfT8/DQKkGuqnM2UxRGzSwyfhqRsFOokyfaQ9BFjfquNCX1tN?=
 =?us-ascii?Q?r9l/u9P8UrAEbFcEZ6xPj3tSTjRyT36LhwTkjerDT0il/9K8tfmlK8ai1eoV?=
 =?us-ascii?Q?f90qoegJGsdA+v9hsrLwzKHCzLHL+sulTAmtg6kqGMJGIDuf+PQYxiyHYr01?=
 =?us-ascii?Q?c6RGgcPqauER3NZFmGJq9zHuj0r7EMrEIcoSNQpBuOlUjOeqsgTAiHP0PVrc?=
 =?us-ascii?Q?XvCry2bdVlbUIeL331Hyu7CRrjmB+4muH3uuRI2US4GRETJohFTohnZII+RN?=
 =?us-ascii?Q?a1jMkpqBY7xdqHZXnvhLF10dJMo8V6tQjjY2MycbL7AEWEPniIifcKHLsTpJ?=
 =?us-ascii?Q?qb2Rm47r+IzTmQ1fSOgsGJ3oqdUr3E+1qUpqUv4g8B1/XZCSXItjW3gFNZSd?=
 =?us-ascii?Q?mPUuJaashu0Wm5WGJ0v4eDEDWzx41G5TKtKAxtU0wD96Iv5up803LHPz6G+J?=
 =?us-ascii?Q?AnYOTM6gObIeYDCkUQH1Oyfe1YqLdFvumyxjsbxqZCxham7NEUroB1KGewhf?=
 =?us-ascii?Q?+AklmmEDPquCCv/GOYOqGRbsv40HeJRy+Wdl8qIpxU5s6lx0cyIecEJF7qZd?=
 =?us-ascii?Q?Gg9HEvTc7mUqWLnhAUfD1hFzE/ISYENXbO9qh3ivyrXzODqxVFlP3bc8XR3x?=
 =?us-ascii?Q?srbA/LI4gBkAQK7x3vC5sTJ+ipN2h1s+1B9rSrexJse65bcQs2+S/Ww1R/Ce?=
 =?us-ascii?Q?LxuvENKSS0x1+nlfUh7AG0PQq6gpSt60PhFrgdWtY3sXJeltx9WkFnPdNQsf?=
 =?us-ascii?Q?8Bjn5Q+/CABvl2Bx9ItWbQW/6vlDQK4VGw2iC2Pquh7KdjOpxb4fDQazyM1Y?=
 =?us-ascii?Q?2xutkMOOQdVTQAtvsp73sjBnydU//VLwSECrd3dlvue/G/kZKpRAXV3QDpNh?=
 =?us-ascii?Q?MMmV0Gv2FPNw/CYXwA96QworDqbz2gUonRNeCfUpv9/xxLH0tJGHbsF3dHjM?=
 =?us-ascii?Q?nY6xGgnYet0lSNn2NopOCa562ztZAA6TqLJGLfv3GJACJJoSJW5kEqKzkrE8?=
 =?us-ascii?Q?zVEORLH1ifK0f69+YKsR/CSFuCUZkd7RwW0W2GtajSdWUpSuK7QIKlEvq0Hl?=
 =?us-ascii?Q?78KpSjKotg+iz9JVN+J3gMqU56hQriv51ktu/wUCMo5uCPsh+AlgKEBDWnWT?=
 =?us-ascii?Q?73hPJ5rLA6tdk+Us/7fuWpwV6Lv0G3hp?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:34.4545 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf8a5d0-5553-4fbe-dda3-08dcc091b095
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7216
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

We want to test that setting the color pipeline to bypass
yields the expected results.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index e782f75983c4..c65a3e73f08a 100644
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
2.46.0

