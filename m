Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE36C369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AB610E6AC;
	Wed, 30 Apr 2025 01:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TbYwui8Y";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80F610E6AC
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:41:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ihli3z98NH9oGs9aLKjORYYuBtbsvYx38XgXH6f7RE835AMwwFFlpPsbzsa9LlNzWW9nXyInUlKkOuukLV45GuFb4Dhm5SucydR+w/xMeoPGvHatV63dg1nRygBxmD1MSh0nxUtFX5XWbwe83MmhHPC45Kg8tCym4Wr7PZgS2X5XAWsThqfUShabPJUv/GnvRdzg3LxkbEsrNW2BONOEKPYjxITJKvVYTQA2bcqSaLkOIAFYI16V4/xEZEqGQi1CivbVA2DWpxx+bR8xe9Wx4YBRXUwYSCmx9h+V5643Xul2fCPfXkeDeW64YTYkHxad0CLzmO6qNQHSmQ85MneRkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsX1BNT7UD6F2vxQIDE4XJT6AiwN6YnGzgrq3xG0B5M=;
 b=x8z9HqoXWlggrAX0IcZ8PozHG1U0pVwr3OFRtZIxyEZBEv5316TJ9kTCQMdP2YS8Ogj6pZT7w+OZIkxsozKjmf0i6j86rPZ9Bi/oNZappL0GcivPdMrE62XJZohH6t/BXFn85zVCFAITCZlYBlB7n/Jpk/ls6YVSoNl8mTZ76gqMsTwVj9u2jY37CLQIvfV/yLbokESN2F+1KIQhNtzN2COpfIFB9541PV6aJnbQDjj0HK+oS9saas6KPzQDFksdS6uhwcBNLvD/2jmzEbnqL6OdV5L2EmOk0fIXCEGNNc3ZxVo4FA2cBP0WbZ5aUvNFTETu2B6e2B49PGfKbxcvaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsX1BNT7UD6F2vxQIDE4XJT6AiwN6YnGzgrq3xG0B5M=;
 b=TbYwui8YMkDhvXLfRN+B3IwIBzBV9Z/1/Mpy90t6MF8VD4JovvngYiacQkrIeWlrMvPKwQ5ur/FqXK4y+lT7YLDD08z6l67gGDL1eVgpkkHOunUSnqIf6HQFw8Gh0elW4nf27f+fnpRwsLOHMv4SMQbHoaVVGNEAmxoQIJnzOZg=
Received: from BYAPR07CA0094.namprd07.prod.outlook.com (2603:10b6:a03:12b::35)
 by CH3PR12MB8972.namprd12.prod.outlook.com (2603:10b6:610:169::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 01:41:03 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:12b:cafe::da) by BYAPR07CA0094.outlook.office365.com
 (2603:10b6:a03:12b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Wed,
 30 Apr 2025 01:41:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:41:02 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:41:01 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 28/36] lib/igt_color: Add 1D LUT color transformation
 support
Date: Tue, 29 Apr 2025 19:34:46 -0600
Message-ID: <20250430013454.226910-29-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|CH3PR12MB8972:EE_
X-MS-Office365-Filtering-Correlation-Id: 11ebc67f-828e-4735-b978-08dd87881125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ceVWO3DAi71c35Mxx/OY44JC5Z/KluQKKP3nlcGtVDz6NkqvY1ldrUme25w+?=
 =?us-ascii?Q?YkSJ8jJvGuq+h+7fUHtlC0QVpJDuznwXsNtyj84mO9dWjJNr1TFx/S+/uB96?=
 =?us-ascii?Q?tFkdtMzkBgO2pC/GXKtQv+3GWHnj7OJJ3HbH70mRiL4aG7CMpEN5Gw/TmtBT?=
 =?us-ascii?Q?RxtUxxKovSKO4YNYo19kHdKuOxAruoGfh2dJGB05yIDSptel6ztQvBgqdtvU?=
 =?us-ascii?Q?hKL9rRPlYJgkW1DEiETFeBuvvZHRw3M1ebO4RUFvVhFyP8Z8HSKRQpEZ3/80?=
 =?us-ascii?Q?RtuD0HX8P8PfbfwUWOd7Lx7mkPkGcOxkqgwVGj2Y7O6gonHPL5XSfOnSB6Mc?=
 =?us-ascii?Q?esMT1vzguz0l5V0luZCzjgFxjOwLtK2AiRbYMFO/LbSqkFq+QrnXvNf6XNsm?=
 =?us-ascii?Q?IfFbitreZzuIoFTIVhCfh8M6rZZDmi6ckkyIftIpNFRXwzhqwZLe3ai9omaH?=
 =?us-ascii?Q?oJTHUiPoCnSnsSzF3+8tbS9kwCoXLMmjtdSpVMxPZEKxpYn4mWCsoZql9LqX?=
 =?us-ascii?Q?EgGeGrJ0Wl0X5H20AhEncz91InCjp/Kc0RjxDy9T4F+eNcURAy19Jf23dwev?=
 =?us-ascii?Q?jcpt415PqpMsQ9NNY89QwrUlFJRlZFoO2iX25vuVaENDlG73cYG3Rt4Cpo3U?=
 =?us-ascii?Q?i5WeLfyds5TcuPnbL8gfljPzXEN7Tp15b3WVXaBUuuw4sxog/TP/eTsSSvRv?=
 =?us-ascii?Q?Q6EFcmpkWkmvLAznYJXCffG5KfledjPtuFecIVpNzSycyhEPb7MFI3pJuD38?=
 =?us-ascii?Q?+xW96wEoyUL26gwVt9FZSYw8LrcaPsJTOvDggGIdGi61YclBh5aPCGKojJTB?=
 =?us-ascii?Q?mp644AfZn+8ULSa12uxdzDr9NKMWxWDaRI5qKJQegVoRwT6z86xKzDl5lqK6?=
 =?us-ascii?Q?l68wVghUBARcGlbBfxOCmYmA0/cOS/bFj+qLxbij3wl3wu4bDii085Enf41W?=
 =?us-ascii?Q?a+DGS6ssPiPdYXOBwflaQ3A2KtTiOkRWnMBeZzlxPsZgYm8XRE6JI5gB5jeG?=
 =?us-ascii?Q?hD/LQHS8kRBmOucdVCJQrGpMwPE04gDKncj2VLWJEeR5kKTOLvex0XMDjQUN?=
 =?us-ascii?Q?yZe08WlmihxPFOQVrrLsBGe7wdaN7OW6KupQEIIMeQUVSF+CEbcIFQ6g1ybJ?=
 =?us-ascii?Q?adPDEgIAEKwk1rq9/PEvuxIxKB428wLnZO8fv+03YU4aRa6UxJZX5QoNpZoI?=
 =?us-ascii?Q?N+C2rocGbeBAZ1aIrsIKbGwhhBuOUZs9zPaboskCUi7jXjEyDfgScY/+QJSh?=
 =?us-ascii?Q?CpgAK8AtCrTV6lVh2KntRkmMlqT1lDSRrFuteiBEPu/VKRHBqqXvQomPJtmt?=
 =?us-ascii?Q?REQBmWtOOGQMXEHTz6SdGlt00imSWovmuqcAQy/CX0LSh3N5zbfg7TFczz6B?=
 =?us-ascii?Q?fyooEr5E7AkyEiQrBhoMUI8Yu2YXWaT+xooNMNYX2aNTyqCUeXYLTwN+eBGt?=
 =?us-ascii?Q?/4Am48iEqpH5HsEZi2NbeJMSVeFQ/m7n2Cw0BUQszTjIhhK/3fWzUjd5xrjL?=
 =?us-ascii?Q?YhK1Dp1ScZb8iFmyVVnY9GzwZNRKOszU2K2T?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:41:02.8064 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ebc67f-828e-4735-b978-08dd87881125
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8972
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

Add definitions and functions for setting 1D LUT on a
drm_colorop.

Add support for the SIZE prop of a colorop, as that's
required for understanding the size of the LUT to
construct.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color.c |  8 ++++++++
 lib/igt_color.h | 20 ++++++++++++++++++++
 lib/igt_kms.c   |  1 +
 lib/igt_kms.h   |  1 +
 4 files changed, 30 insertions(+)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index ec8b27d1e..cc5ee3b0b 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -440,3 +440,11 @@ void igt_colorop_set_ctm_3x4(igt_display_t *display,
 	/* set blob property */
 	igt_colorop_replace_prop_blob(colorop, IGT_COLOROP_DATA, &ctm, sizeof(ctm));
 }
+
+void igt_colorop_set_custom_1dlut(igt_display_t *display,
+				  igt_colorop_t *colorop,
+				  const igt_1dlut_t *lut1d,
+				  const size_t lut_size)
+{
+	igt_colorop_replace_prop_blob(colorop, IGT_COLOROP_DATA, lut1d, lut_size);
+}
\ No newline at end of file
diff --git a/lib/igt_color.h b/lib/igt_color.h
index 813bd19ba..4a9f9b7a3 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -15,6 +15,8 @@
 #include "igt_fb.h"
 #include "igt_kms.h"
 
+#define MAX_COLOR_LUT_ENTRIES 4096
+
 struct igt_color_tf {
     float g, a,b,c,d,e,f;
 };
@@ -35,6 +37,17 @@ typedef struct igt_pixel {
 	float b;
 } igt_pixel_t;
 
+typedef struct igt_1dlut {
+	struct drm_color_lut lut[MAX_COLOR_LUT_ENTRIES];
+} igt_1dlut_t;
+
+igt_1dlut_t igt_1dlut_srgb_inv_eotf = { {
+} };
+
+
+igt_1dlut_t igt_1dlut_srgb_eotf = { {
+} };
+
 typedef struct igt_matrix_3x4 {
 	/*
 	 * out   matrix          in
@@ -107,11 +120,18 @@ void igt_colorop_set_ctm_3x4(igt_display_t *display,
 			     igt_colorop_t *colorop,
 			     const igt_matrix_3x4_t *matrix);
 
+void igt_colorop_set_custom_1dlut(igt_display_t *display,
+				  igt_colorop_t *colorop,
+				  const igt_1dlut_t *lut1d,
+				  const size_t lut_size);
+
 /* transformations */
 
 void igt_color_srgb_inv_eotf(igt_pixel_t *pixel);
 void igt_color_srgb_eotf(igt_pixel_t *pixel);
 
+void igt_color_srgb_inv_eotf_custom_lut(igt_pixel_t *pixel);
+
 void igt_color_pq_inv_eotf(igt_pixel_t *pixel);
 void igt_color_pq_eotf(igt_pixel_t *pixel);
 
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 4b8105c94..0f75cd65c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -709,6 +709,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_TYPE] = "TYPE",
 	[IGT_COLOROP_BYPASS] = "BYPASS",
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
+	[IGT_COLOROP_SIZE] = "SIZE",
 	[IGT_COLOROP_DATA] = "DATA",
 	[IGT_COLOROP_NEXT] = "NEXT",
 };
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 580f21141..33bc8854c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -373,6 +373,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_TYPE,
 	IGT_COLOROP_BYPASS,
 	IGT_COLOROP_CURVE_1D_TYPE,
+	IGT_COLOROP_SIZE,
 	IGT_COLOROP_DATA,
 	IGT_COLOROP_NEXT,
 	IGT_NUM_COLOROP_PROPS
-- 
2.43.0

