Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D687C54E55
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFE810F2A1;
	Mon, 26 Feb 2024 21:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="h4lo1Igz";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B50610F29F
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkREz6uX4b/I4pj3XAwJ3rqEwqzTQ8j3geLxQJtqwz56aZPCCEwR4UDjNq4rjVk78ZwDG60Qrv3KqSGAwnHdTrEVBNPt6ETZZ02qua8u2HO4sTrhDnoCPr4dTUHpTkOj7TN7LYOwnEgDm0DriIKcIY9ijeY8EKyeT1psqlac6NDg5ls5C6RfIA8PI82baYNcsxKmW0tuEweeTMXHOCSKAWwBjB5mj2VJzOTJy/SjwRvaB48JKyQTcPpy02LmSs94Tj/N8WPcjMXD/+4l0p4IRqb/YdrHGcKFKXHQ08FszaTQ9hq/aS+WX7FIAHh7qf4epbZx8J7lih/QL5H8hWVhvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBJCe+b0hSeYJs9BZTakfWWx3AIdOfYQxczrVwq0aiw=;
 b=H35+/w2VoDOUdwAvFRAkHMIoiMCOyZO3z7LxHFfekQyCez7aXOF/ZOkSVQEI53ifBENIwSx8Bzsxk1VsA1XADJ+a+3w/m95de7RdHc24yQv0GJcNdm7f0tN+fQVrNw8feWMuu1DP4yxo1nimVPqFW6gOwSTSSAj5HXfXOO+23pby5Q0gMd5YBVL56VV2x5TzpE2qx3oTxfClQ9xAWf0KvB2qkuCOFNrc6fnN/lvmaG0G17Ln3S4Bipq1hsbSPps6A4w/LXgVClsJumd61YvkxjHW56J9WPUnHmG4i40iVRLJ74PnGswDCRivNscbqfQcRT10RlOVhrs6LaYnpw+9YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBJCe+b0hSeYJs9BZTakfWWx3AIdOfYQxczrVwq0aiw=;
 b=h4lo1IgzJoIlcqW/jzq+0as168R/aYl7RYL+jAqW1JTFOSoJZwQwrSncGPq6KE2l7L482B82PKVp66azhPSDJGa6IU5l/A7TFIdUOPXU3URXvs8OaNpK1+C0SVaoSO3xVUFNUtwQkOFydWOxEZ3XjggFQWZ5E+nblUW1NPejzyg=
Received: from MN2PR16CA0034.namprd16.prod.outlook.com (2603:10b6:208:134::47)
 by CY8PR12MB7339.namprd12.prod.outlook.com (2603:10b6:930:51::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:14:45 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:134:cafe::4d) by MN2PR16CA0034.outlook.office365.com
 (2603:10b6:208:134::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:45 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:44 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:44 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:44 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v5 30/32] lib/igt_color: Add 1D LUT color transformation
 support
Date: Mon, 26 Feb 2024 16:14:14 -0500
Message-ID: <20240226211416.100660-31-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211416.100660-1-harry.wentland@amd.com>
References: <20240226211416.100660-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|CY8PR12MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: 033b6f3e-ce14-483f-cc37-08dc370ff4f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w6FIXoHJSWphsxhwRy6EbBbRv0gWasrRkf27PVkk1O8B0PMty6oDM6f2sJkIN+pNjeJz59x+OzUKLJ3VdOUZ/LGEpOvRV00OIHCBezDwbyc51GU5jCXT/iCYQ9zkeFvf4m3+aDGBRT7tziheIqXCIPhxiJSW+e1ameIFwSyDXsT5AtvQDV9pKo+r7Wyi/Lxb4CqlPzwVSq4CDAvMYL76oOmdNZCwetC7vgqJOr6mXeBeAvT5vETFa6B/wB9uO/6wDicqocVC+TVZ8TbSvgHxBg6uNjGrY6PR7lfOX7AD6KQqcseTfE8BquapfEzW1rJWvQfrVyOmYbfsnL+EL60z11VrA6gAOltSJmY3FflvQu+B1kEllyPdDQcuA2GfXv3d6Mn9CE/qp3ggHGi8BcG/RJFwYonCzFTZ2Ag6e4HcXBVQE9MI85eH3F+1Z2gFkXkMuF86te8oqu4lv/iXvknAsf1eIub3u92sZLKWm7oHsJjrOLufsOLAhUQmTn/jWsf+XmNJ2I3O68xqBusltd6mEYGX3GYphz6uxfOZWuxmdzWEARB56863Yi6kivSZyyCyOxM8pTc9MplGTCtJfqn6hp8SG+F4fvZK0AMw2kupUeuBqmTFCFoIAK/1EaQ131rClChB4wargUE0eDk4NZTcOiprxfAODZhSv0f9yAWBR2E0GmzuNft2sojzjMaC/IUoMazgZUH2p64F/DLjuYYDq+9A6o8FyjddCeMObWY60cjyI+ClrQ2gVTD8uXqopsPy
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:45.2198 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 033b6f3e-ce14-483f-cc37-08dc370ff4f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7339
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
index d9a27a442427..8550a3d4dc71 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -689,6 +689,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_TYPE] = "TYPE",
 	[IGT_COLOROP_BYPASS] = "BYPASS",
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
+	[IGT_COLOROP_SIZE] = "SIZE",
 	[IGT_COLOROP_DATA] = "DATA",
 	[IGT_COLOROP_NEXT] = "NEXT",
 };
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index d392ecfad852..ed71a249ddb0 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -352,6 +352,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_TYPE,
 	IGT_COLOROP_BYPASS,
 	IGT_COLOROP_CURVE_1D_TYPE,
+	IGT_COLOROP_SIZE,
 	IGT_COLOROP_DATA,
 	IGT_COLOROP_NEXT,
 	IGT_NUM_COLOROP_PROPS
-- 
2.44.0

