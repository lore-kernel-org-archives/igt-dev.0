Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDEACCF9E5
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FB310E8BF;
	Thu, 30 Oct 2025 04:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zNUfcYu0";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010016.outbound.protection.outlook.com
 [52.101.193.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8C110E8BF
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:33:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUzCL+fUFrez3WLaQt9pp3+CPOe6eAmJV3Y3da3FHmOBEdgkU07tKvYEniVxW1+b/X5nMd6ui1tH2XYZEtZXEADwSIjmrJlTqPLA0Ib4I+k96+Bb37/Sxr/xmD2WqfNCTDr1xSqjPhLZDJ4Y7y7WIV+2vYrDUIpFyE7Zf6aCkHWltePl0Bxas7aq50GzlGG8kZyIFiu7qUHfu1rZjHfFSWDdyMcUJMfZn0vra5tpyyJ8vXuGo1yEyoLGYOfU1ZVTDZP4kiPpsjBEgnSiPb1R/e92AfFvKB52hcFcQoBMz8ZAOVOxkdPLK9myVN0cj7zGF9iHJmjGSj5CGbIvtr+kuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtDKEMPi5xjFt5zUF9iSeX8cQeHKI9gIAV5f48rZfSM=;
 b=ldfFGbX/yV8qglDRtVZ2vj5amoUcPYyYSaDgEo7CDsHR1SGFb6TVD/s451xBvV+oCeLgNvFbTw2RYaduabUmPoWsYe9WZdIVq/0ZADB2pXqpPSL+ZjEtZqszkKN9cDwUSV0lHhcU1ZQSCUBnZU2E9KVZ7pawHIG2m/8mJQMnnh2rC7LB1UByLAXlTSVLUSz9Xu6Ih9dAoRWjSf26h8lGYZKDI/x9OQKbOHENbynJwkChJ4PP8RxpoZqmObg78Z5BTGimh9wldimquXgZedacmpyFukLEamDJJgdFmYbdWjzQgE6dm07tJtWWcAH00qakzpXkqOknU0cLyQfxHAzBkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtDKEMPi5xjFt5zUF9iSeX8cQeHKI9gIAV5f48rZfSM=;
 b=zNUfcYu0tXqqcPiIA/gIAa43Rzq8CssBzxV74UCIvJ/KaHC2uQe8eaarD69Ny7x1YzpSurlwvcI9iG3iYFATKn0G2ik8AC9q8iN4Uj05Ho9IvLX3j9Ovph9zGZgbSYNG1yubVycVbKUBEXOilfTbA2eGkQe1eLsuWZD840eXvME=
Received: from PH0PR07CA0012.namprd07.prod.outlook.com (2603:10b6:510:5::17)
 by CYYPR12MB8703.namprd12.prod.outlook.com (2603:10b6:930:c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 04:33:53 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:510:5:cafe::7c) by PH0PR07CA0012.outlook.office365.com
 (2603:10b6:510:5::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Thu,
 30 Oct 2025 04:33:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 04:33:53 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:33:52 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 25/32] lib/igt_color: Add 1D LUT color transformation
 support
Date: Wed, 29 Oct 2025 22:27:54 -0600
Message-ID: <20251030042801.2315866-26-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030042801.2315866-1-alex.hung@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|CYYPR12MB8703:EE_
X-MS-Office365-Filtering-Correlation-Id: c2fd6a57-b6a6-4957-ece3-08de176d8812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xeq/ix5oQyUWt9hYiGl6Fl6fYVLoY7LzjBpo/eMiPzSM/yatcz0UPfsm/yEp?=
 =?us-ascii?Q?LTHKK3ElzB8TLi2FLNfywHmbR+u0GflaMbfmhFmxSvFmZ3WHFc48oesJwIu9?=
 =?us-ascii?Q?EPnIs11z6NLSFlCrw1I6fyyc4Nud7CjVN9ekKXtsz9X/DWEYG1dYKciiOe8D?=
 =?us-ascii?Q?M2idNWVHpGL7Nn3kTTe4Uwe15C0nArp5hG+JaH/2DGYnNGJfi+zb/sLbMBzQ?=
 =?us-ascii?Q?dHRwqSvAUCp1Xfpk2FSeCemuQatl3Da1u3ajBPZfVz9KmR1EmpYAovzkvjMa?=
 =?us-ascii?Q?dXxq0rPmUoYCnNjGYR/XsyA/csfKWJrl3UlVz1HcUKr4hhXkk2f3aYq7VOSm?=
 =?us-ascii?Q?TD9IZi8TPkbTct6auNhJf2yHzDgrgGyMkChwGFRLUXQ4755V6hlH944hY6yA?=
 =?us-ascii?Q?fvS4cCYaXurHlyQab+JsHIe3FEa+pps1hroxXCwEL+6i1ew5VzQWScx3cAHa?=
 =?us-ascii?Q?fPVuPOAPmgGaVHE/+zX+5xnyt2nJggumimgRZReHsv2eDrteRT0qcEc6gnEw?=
 =?us-ascii?Q?+bdjUIsi45q1xcxyxR003fnKbIOgjEMvvVqoKIALkQwbP12dQMdqbzhvoZZl?=
 =?us-ascii?Q?eqHwlIQBSU+oI6iOJ5Nimm02o9bOzokp77FJWIW2g97hX5ITgKkaUDY9iPDk?=
 =?us-ascii?Q?wqrA7lRqldb2VS3YeNVY07IgR2HmPC5DrKeXzwxaNzzqj2vafaUIuje36vae?=
 =?us-ascii?Q?iYULFxlv0vr6ZKJBUo6TeMf+6wdJ3Tskw0kP0xaZn96L4Mou3FzVzFfcGiRP?=
 =?us-ascii?Q?5vzR9+SLzEfFpEE0TA5yIEQ0eid/DRzBIjsNQxub/E+tu5RSwoFJNOGypfyF?=
 =?us-ascii?Q?LCehR1Iaq+BcOH+HzSjS+ozEb3o+D7y3XDJd1vRntzWSKdv3Cu211xpKi9WV?=
 =?us-ascii?Q?n7E+/sBh81O+xC3JRbojL1ZSyHXF9JhOyz7KxZTNP2KRoWLkSv+5WPV8d7oI?=
 =?us-ascii?Q?6LPBo9uTwl/LXSZLMXW1MNXW6WRDrF6o7/RQ1a3NyL7CFXAm/M7mUdVV0bwb?=
 =?us-ascii?Q?+L3s1xHXmWhzi+6vKtSu+23T5y+DIi3tRoxzcRxQvoU3f0l7Cw5khO2/cLqb?=
 =?us-ascii?Q?iK3CGPG6CPhlZCnfNJAFX7aIUlFMuTzlyR1vYg8y5uJ/GPnPKsmGpHHRdl3o?=
 =?us-ascii?Q?r3Tp4YlDMYQcjVufoKQzfF6IFzQxsaMCtsu2mJH/8sepWp9aEvy5uhPk/Rij?=
 =?us-ascii?Q?iR5owynMueRmVhK8zVBcoSpU/S/pAIbQMm2tM/vYgqbRrG45FjQmRnVnsNa3?=
 =?us-ascii?Q?zjZID2abHifVTdCccXQpQghXTLyEc/wwqCUB//v62hK32q+8hfp0kCZJhoOF?=
 =?us-ascii?Q?7T5ndwgpvwX7qGGzqX/duiiB3wPe45rZGsmN06oYB95l/Uzx4n+SzeSa8MDQ?=
 =?us-ascii?Q?nEbq5g6HUPcvt+h3TSXalEukpeEar5sBEszCxksfAfU23WIzXeyHsfuFn15F?=
 =?us-ascii?Q?ItQ8iafOyrxH6Xpm7KmikLtG3dTC70KGMPqSJCRTsIVi8wu80U6BLRsknEA4?=
 =?us-ascii?Q?e1pXwaupcubjVqDOQOOH5Jej3f/QHFBHdAg7f1LpsH9OC5kzztLuNQhmd2Om?=
 =?us-ascii?Q?FtS8yHKNdokThtagJqY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:33:53.4338 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2fd6a57-b6a6-4957-ece3-08de176d8812
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8703
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
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color.c |  8 ++++++++
 lib/igt_color.h | 18 ++++++++++++++++++
 lib/igt_kms.c   |  1 +
 lib/igt_kms.h   |  1 +
 4 files changed, 28 insertions(+)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index d3c030199..f6ce69d9f 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -428,3 +428,11 @@ void igt_colorop_set_ctm_3x4(igt_display_t *display,
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
diff --git a/lib/igt_color.h b/lib/igt_color.h
index 0fd9ba691..1a39ee734 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -17,6 +17,8 @@
 #include "igt_fb.h"
 #include "igt_kms.h"
 
+#define MAX_COLOR_LUT_ENTRIES 4096
+
 struct igt_color_tf {
 	float g, a, b, c, d, e, f;
 };
@@ -37,6 +39,17 @@ typedef struct igt_pixel {
 	float b;
 } igt_pixel_t;
 
+typedef struct igt_1dlut {
+	struct drm_color_lut32 lut[MAX_COLOR_LUT_ENTRIES];
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
@@ -93,6 +106,11 @@ void igt_colorop_set_ctm_3x4(igt_display_t *display,
 			     igt_colorop_t *colorop,
 			     const igt_matrix_3x4_t *matrix);
 
+void igt_colorop_set_custom_1dlut(igt_display_t *display,
+				  igt_colorop_t *colorop,
+				  const igt_1dlut_t *lut1d,
+				  const size_t lut_size);
+
 /* transformations */
 
 void igt_color_srgb_inv_eotf(igt_pixel_t *pixel);
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 9ec15f30e..041daa178 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -710,6 +710,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_TYPE] = "TYPE",
 	[IGT_COLOROP_BYPASS] = "BYPASS",
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
+	[IGT_COLOROP_SIZE] = "SIZE",
 	[IGT_COLOROP_DATA] = "DATA",
 	[IGT_COLOROP_NEXT] = "NEXT",
 };
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e0bf9a663..fbc0e66ef 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -374,6 +374,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_TYPE,
 	IGT_COLOROP_BYPASS,
 	IGT_COLOROP_CURVE_1D_TYPE,
+	IGT_COLOROP_SIZE,
 	IGT_COLOROP_DATA,
 	IGT_COLOROP_NEXT,
 	IGT_NUM_COLOROP_PROPS
-- 
2.43.0

