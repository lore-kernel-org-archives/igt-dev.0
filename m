Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01419C7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:42:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A743310E54D;
	Tue, 17 Jun 2025 04:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RFPRNmgr";
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2067.outbound.protection.outlook.com [40.107.102.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91AF410E54D
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:42:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SpX9w4UOJXlqDWfiMTE23+b887OcHcha4roGuxsui4Mls+e/FWc+R5GnAs/hgYW29hF6lNBXptVKxgWhnO8Ct+tq39WwteoAC7YSbrcCWY8ybrB3qj2WG85DjQn3sneZosgiBUMLDcr4/5iZI4H4x3VC6fL5I+0AnIerzsNEL5+XRlJ95W0JUm135EZkgtit3N4Nuqdmj/MWL3n/Gsw+kbO7ocsCCFkEz9yq1u1qqBFHz+gT+P3uvpmKQo1pK2cveyujMBhyIG0L7r3Wx+V3OZcKB/2WoRG0mgep6vhYxEla3kBMM0ZRQfPnW77YLgRaNy+NFXJrW8B01xUT/baUxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5iNWZa9Wxb1OctwlK0ZJC51qdLMOOoOpP1mRZ9Ezic=;
 b=W+D6vIKPxT6nftcP5ckPJpKyMaPWO0W/cgE5XtWlIRskI4QxOCXndpoVDdpQwBPFw3+Qdkgn7XNUCkb7IfXNwhaVJQKuo4qwpWGFQQmsnJzuZEEs/vjgsgj9U/GPbCIuRzEFZQ/0WoM7VdPQiKyqbO/hbePIQ//icnD2eITYfILGZQdvdxQSlyLiN6nnneQeG7q9yGSyAU8cIyTlOF3cwcZ8iXwOXg1MTq/fE7LA4IJZCQEaQpFDdL7uBoNo7zamW2atZ3WT5IylZpzTrb63M+yTb6opWSvXzBBzt3GIGiw0lQ7hLslIgFkmmctDebHIj7bQxdnYuGfnRHgXYYd6Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5iNWZa9Wxb1OctwlK0ZJC51qdLMOOoOpP1mRZ9Ezic=;
 b=RFPRNmgrt6K7IWGhQrt74iE6IYfvDWfxn+2qKx0mFD4A8n7jBPpVnCdczM34gA2DkbBXHl3vvAQd0zmYpsYRYThDRM1u6qKnfRHl3W7/Hv/sBAdTnzbyj8jaUJvidbMHykGJdZVR6RMBGUW9ktGOa9scfHbtOMKZOX+PIJanuSU=
Received: from CH2PR11CA0014.namprd11.prod.outlook.com (2603:10b6:610:54::24)
 by DS0PR12MB7558.namprd12.prod.outlook.com (2603:10b6:8:133::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Tue, 17 Jun
 2025 04:42:21 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:54:cafe::cf) by CH2PR11CA0014.outlook.office365.com
 (2603:10b6:610:54::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Tue,
 17 Jun 2025 04:42:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 04:42:21 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:42:20 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 28/36] lib/igt_color: Add 1D LUT color transformation
 support
Date: Mon, 16 Jun 2025 22:36:23 -0600
Message-ID: <20250617043631.2920587-29-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|DS0PR12MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d7d44d-5007-4277-2416-08ddad59591d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J+Q8jt22+qhyVdlbL3aHQcV7H5Xih+nCwXvYAjdN/DWQRScemOBK+GktXcM9?=
 =?us-ascii?Q?2WGk0wH/jskWDbC3yUhCoqVN8SIfuA9QuXg3zqQ7AiGMGbMra1pgU9iMvPG0?=
 =?us-ascii?Q?XAktMbAa3mLFGTIdVRmKWBQymbSiNWrDvBH3OM+Qy8VC996FFcw++qdBbuLX?=
 =?us-ascii?Q?Hh9rWvwYHxi0LgfCp/g2BbjZECDwmjtr9keDBBnLn+WquWY1dc46B+smc8Hq?=
 =?us-ascii?Q?628keE0yWTDUjUsC2Z9glqIgPIOuhnp7jQFgyUmip8miaCP9qw4MTcto8gHr?=
 =?us-ascii?Q?HYT+u8bh07fgfZ1SZYSMyAn8DFUQdEN6mGn626kOGRgstEYVrl1orhES71zK?=
 =?us-ascii?Q?AOWIGoavU/xbESpYkc2YqtWfJ3hVxqESboeIz9qbBymSXJ6cZo5UsuuHMral?=
 =?us-ascii?Q?+wCapW2pftjfg5ghVeRo9cHz5F2dRUnucM7eXQhzyfDw3nIorLhsyK3O960+?=
 =?us-ascii?Q?PvtlGcMjfLHWAD3t9kIIqWAFF8NYUasig/l1PzgQkS7JooAcT6Au8UtkP2ge?=
 =?us-ascii?Q?ljXLgKFtMhDAPBMy5KDeyb4VIk08ilWl7mtDE1sgSRxwNTHEjpaPD68QrOa1?=
 =?us-ascii?Q?6HsKELv91yAnlEOZ4QgPLDquBbuCNDqaobRxFRjA1qLKxETWhOoMxvbm3JpY?=
 =?us-ascii?Q?BmkFoOG0VI8Ea3GUnvvNgzmUskiqLGvQRUJJKKOBKkXz2Oyc9mmxVjjLuqxO?=
 =?us-ascii?Q?FpNurrcdc8FTJ3gSREdtYW+jDmzHk10ZRh+dm+RsyyDqGL28w86qyMyZOjPp?=
 =?us-ascii?Q?SI4hHLbGh1UhjDnpGiUXDMvuP5egbbIjbeVQPZaZ7Ey92MNJno4nczeUE9qN?=
 =?us-ascii?Q?Ecd5HigHScvUMDVMrRzRTGSKF6zDvr0ioPMQo2vHj3ibfMdCOzsuJZ8V/oNO?=
 =?us-ascii?Q?RapVxJs939CKu/MuGAMKrdQ8kPWualSOjlM8qMxvJPCQj4cL3VV5WkIS/O37?=
 =?us-ascii?Q?oXia4wKI4VxK4G+B6nSQsSVDOxdXn91VjYVU+dCbVai3pC1dQq+e/d/NLBeq?=
 =?us-ascii?Q?GbZC30PZmgtZCes2urJedxjo4JRXs3bc3FhXlvCwKu+rXcxNA4bS18ouP+Ye?=
 =?us-ascii?Q?TzfMh9gSthv2G2GsBfWR6xhqqyVvyx9/Yrsd5cV99J8yjtlGCrW+e/LS93HE?=
 =?us-ascii?Q?4Vu7S0l/4CfI3kapFu7u/hcid5I6jKxxkEm3cB/Sm8+5LqsPw8NBGce1iNke?=
 =?us-ascii?Q?1ZVEDcN3jM3UKddOmsSFJdF2EZW4IQg8+iD29XFgOAvbQuPg8ENTCD0rtC2a?=
 =?us-ascii?Q?iLGPPuKgWcO7lx4DD2EeqT0ijfazvYt6h0nXyJUL+SNugT+BLUyL3e3Y/gge?=
 =?us-ascii?Q?Zc6v8E1Ty02DCbgComeYPHGAGFVcOtdmoSCQ1i2EIrDbr3veU82DF/ctB68r?=
 =?us-ascii?Q?l19iXPj/0TNczumZ9pHZJVlFQEnGVyN2jOUq4pbjw5Mm8xHgugGPvkq8+bLq?=
 =?us-ascii?Q?J1Mi/j0JA2Swrgz1IAtwWkhDQAsMCc8/oE9UJY//Cy3JNhQrQzEZR03LCDdz?=
 =?us-ascii?Q?D18gXPkodxqhJwC/XsS5i3OBbbcBggHEO/Ai?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:42:21.4698 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d7d44d-5007-4277-2416-08ddad59591d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7558
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
 include/drm-uapi/drm_mode.h | 10 ++++++++++
 lib/igt_color.c             |  8 ++++++++
 lib/igt_color.h             | 20 ++++++++++++++++++++
 lib/igt_kms.c               |  1 +
 lib/igt_kms.h               |  1 +
 5 files changed, 40 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index fce45b5cf..c4cd1197d 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -874,6 +874,16 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+struct drm_color_lut_32 {
+	/*
+	* Data for high precision LUTs
+	*/
+	__u32 red;
+	__u32 green;
+	__u32 blue;
+	__u32 reserved;
+};
+
 enum drm_colorop_type {
 	DRM_COLOROP_1D_CURVE,
 	DRM_COLOROP_1D_LUT,
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
index 813bd19ba..d45d74863 100644
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
+	struct drm_color_lut_32 lut[MAX_COLOR_LUT_ENTRIES];
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
index 46b5ad8f7..e30573f94 100644
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
index dc7875136..efd729dc8 100644
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

