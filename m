Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18547C5320E
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:59:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E2610E48A;
	Mon, 19 Aug 2024 20:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VhfgDp/q";
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2041.outbound.protection.outlook.com [40.107.101.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCCF10E478
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QN+fj9UJkTzKxFJJ+XVoB74Tu/WY5ONpEfUjS+6S8wuZH9HSrnNWq+s5dfO8X97iXjFuwDhSvZurr8D5T88uKrv1/RIC0A4TzeHMZkZy5sH+SwmeUzlnRhWHkZo3TQlBtHdY4huTJaiDAH6GGAi4ZM/wsC1o6BkV6w+Ts8/jigmoPN1c+stVSUlpO1AprO4Rvv2Nwi3sV5/WD1KmxscjoH9V+cWw5xKOba6hGMpxFkc69FtBk0iV1540MSe/qf5eDjGMOLf6cRBk5ChOO9qeLiXdFES02g7DWeVdeNyy79vEgzw3KaqLqQ6FHJFc9pleWGH0g2P6nMrND2rhA2t5pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZczkHRcIM/gi5sZJgXIiTNkxVeWzPefnNAt0aOzom2Y=;
 b=i+Y6Hgy+L4u+SpOa560xRdRb59g3sv0GzLhEH6u9wKf/li9gPNNbzpuAff4uCelcHndP8tq5hc0Z8yA7576ZJeAFKSqwrO+Tnlz8RyENDOhfuojHoSr0VHVkGfPSW7ljPMfk4umga08pjzAxka7cVZZGUtuieJ6MVQxyZJAZJ5eI9ktrIOgpkvL/IDZnoNF7pEeLaV+L8b7ce7j2KOjlynfEtYD039wYs6nb04lUucS/rvf9QI6wQkwp8yMYJ/yZS0XeV6bZttltfX3V+1PYYaoqFEwITHno+S3E2B5YD6CT8TpXMcD9xM29zv94X8MBmwQ3FSI6PuffOuPLAuU4Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZczkHRcIM/gi5sZJgXIiTNkxVeWzPefnNAt0aOzom2Y=;
 b=VhfgDp/q6n+W0x3nkmnAVcYa6LDjBPUYdIYtpjAsue1lpkef9tf+wts/NTgBKxFaZ4OasB4CEJ1KbKWj2DJGCVO1m/4Spc+Lkj8JY/SWOeIch0uxyJVsyYxHLhaJUbTAms4tbF7tWMaogCcRVxtlFoUAj5c0jVqk/JEQp5Y9B8I=
Received: from BN9P222CA0003.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::8)
 by MN0PR12MB6294.namprd12.prod.outlook.com (2603:10b6:208:3c1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:41 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:408:10c:cafe::3b) by BN9P222CA0003.outlook.office365.com
 (2603:10b6:408:10c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:41 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:41 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:40 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 30/37] lib/igt_color: Add 1D LUT color transformation
 support
Date: Mon, 19 Aug 2024 16:58:16 -0400
Message-ID: <20240819205823.316656-31-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|MN0PR12MB6294:EE_
X-MS-Office365-Filtering-Correlation-Id: 19ecbe2e-4246-4b4a-eed1-08dcc091b4cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wFOhnwJbxUvfFfrQoXqG+ySIvw5rEVRnBkTGSoDFJeJXOd6/ADKZJOt6R7Qm?=
 =?us-ascii?Q?Fv3sHV6Kb58ADVjXRWyZiRDCVQti3wExJDu3SBQEWX/i9sYIP+cXwV9PzAri?=
 =?us-ascii?Q?Q1Ovb+1Mifv0PerX57mHf8XuzT+5gWk+LoiSpmTsTKrnO6H9MyJmOtiSa122?=
 =?us-ascii?Q?c9/VJrZlr8SPfe3KhVt0dwsiZse88AEuVciW0+9wwTknTFwwarTxYOESKVGc?=
 =?us-ascii?Q?sxeMysElspMdn/QkRkot9nXbK0h3BP5bEHGzE/ZqOu+uF3P6PvsLvaEq3SA8?=
 =?us-ascii?Q?YlPdHxHMYR+6/Pf7nZB2dfEguWu2dA02ZVScSijX3QlA07fGNtMhKtM3T5X1?=
 =?us-ascii?Q?mgQbfBjw/YNDhWfPQ3RAtL5a1CE1FuJlB8QHrh9ZZ7aceL/IAP3zsapq4QIz?=
 =?us-ascii?Q?04F8GitVlvtP0sMOSqfphL0A8s8pVOaQJ3xS3dyG1USKjFB88f22FoSh+YfT?=
 =?us-ascii?Q?ER0wLqDE+2/fqxxyInqTo5czUMbzcY48f2N9JE8OL5l7WFv5GcwxcwmIgsfv?=
 =?us-ascii?Q?dYEPV8BXsybo7xP2/SRjRVc543l4NEc5endChTZabdOcwxTFs7TcxkYxfPzV?=
 =?us-ascii?Q?5iJVaushg3AoTIab7dW6CU9u5TUFQ5h5bfs88Q4PMj0xKIepTTLsNUPBKjQX?=
 =?us-ascii?Q?lFA/CQwChGs8DcxdXEvQEzb/J/y5cS3gsQdJYLQ3/aTbAbjV3Zs/NRnIio0Y?=
 =?us-ascii?Q?oQBbLnQ/EjjbXbM42DMJd6UGi8RWu8Y+gJ3tZ8gyXaojE50wvkwS8pFnzXxC?=
 =?us-ascii?Q?K+pwq3EZm8YekuXOZ6c/L3tN8Vnx5qoUZPhg3+TSVeXQqMuMOXv1GBVoCUU2?=
 =?us-ascii?Q?Upey8EHdkZT9s6dYcxDf/xGaJPAeQFYLxeH7FZCSv6gPQCqhhQlZhBaIk/2+?=
 =?us-ascii?Q?Mq1HpluxCvdlxBwJjSVhjZw+cdnQudzgnRav0NyIc9iB6uhCF2w1pwd6wMNt?=
 =?us-ascii?Q?FL5VJZBZ3iogj5I+XG7hlmD2MWInOzQqHhTIgyqoHfDun63Iadnuj53Eo2rR?=
 =?us-ascii?Q?26uWzCaIuyuLhuv/+eBBlc7fDThyc1JOZc8OqiNLzwJX+XGrrRuG8oTqTfRv?=
 =?us-ascii?Q?6608ezJ9dGb0MRUlFlw8qAToembqzs0NGX+Gg2f7aSSDvp1fUxx0HlMi2XoP?=
 =?us-ascii?Q?umWvxy7eNcZ171WY/0t/DvF0+zEVTD1btxGKuQFq398mxErq4afD3OTjUOMc?=
 =?us-ascii?Q?xg/iAqbnz2KK3QJJhC9A8YPajX2rw/ChX9H+t6MR5BVuZtdvRXVz2zFe1sqI?=
 =?us-ascii?Q?zMfgE+7WJjuWE47nP4F4dI6qqLG5X/gqJFr1Qq/gnDKaWxZsh2Z7myVz0/z+?=
 =?us-ascii?Q?z38Li8ADuKUq6jb5lwf/csidA7Zb8JqmpGCnzdCiwN3puIg44KIU0q+GQzI4?=
 =?us-ascii?Q?Ri4qFQ0hMJOgdkD53G+5pvFg/CWDGgQMsxNUEOsOKo/3IBZhkqeul7K6EJHN?=
 =?us-ascii?Q?QN2quHdVB2Nzss0xqQ7Cf/+KLVWuQx3c?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:41.5106 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ecbe2e-4246-4b4a-eed1-08dcc091b4cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6294
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
index ec8b27d1ef6f..cc5ee3b0ba50 100644
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
index 813bd19ba439..4a9f9b7a3958 100644
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
index fc3a76250925..efbcddec12d7 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -695,6 +695,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_TYPE] = "TYPE",
 	[IGT_COLOROP_BYPASS] = "BYPASS",
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
+	[IGT_COLOROP_SIZE] = "SIZE",
 	[IGT_COLOROP_DATA] = "DATA",
 	[IGT_COLOROP_NEXT] = "NEXT",
 };
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 72880609ddaf..3e789050c860 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -353,6 +353,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_TYPE,
 	IGT_COLOROP_BYPASS,
 	IGT_COLOROP_CURVE_1D_TYPE,
+	IGT_COLOROP_SIZE,
 	IGT_COLOROP_DATA,
 	IGT_COLOROP_NEXT,
 	IGT_NUM_COLOROP_PROPS
-- 
2.46.0

