Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380ABC71155
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:42:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1AD010E550;
	Tue, 17 Jun 2025 04:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3ETAJ9zL";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109F710E550
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:42:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFz4LzyATDjymcbNngnbaN8jxAKFt8oByImK39ifPKUppP4OGRvnTa6ZRypqeY38/pWVYweGEYu8UU9lZ88F++4VgDNqqgyw+VZ2WFFtw2SR3bVWNpHFao1U4lqmyTpCqNlB/RtwEWTO0rNSF8RqfRs/t7X4K/2QAGlIUDnaZK0R+0R7QXGsplmMCnM8cZHlKTpXemyn+yAdYVn1/v27l562BYKa8d3As/hxl+VfO4lLyrBIPL0yEBBfCDDG5U3xWBZL9H9gX36EyZzmjILv5AuFZlX9Hbcl8NPq9GjghHs+JJ1s1MTQCWUrFw1pS3Sh4pE1Ly3YcDYfnt2+Xl6/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+GxAzRkwSB5/CcfHimQbibbDgUjlmKcVbRUzzzMaEY=;
 b=vvVET0mgNrLqV9aAZapQbCYkEy9wmxxGYBQulEYOHuWdReBRbZvhZuIIJUDUOoWe6AJQO0qUYGtLqXFe+3QvAPbMgKgeMbY8E8PL1SDaOwLuROTEBPn89sRPWNWK5TWkdtCzsKPbKlnyae4CWlQBiAjxSU60MvoMrg/4W1MX5h9zdov1hc1cyPqakgp3DhBn6+CrMQasCepIQBxJxuuSMF9KuWByETKT1no6L7frqNteB5KRY714mzeMlT/d2VXKVStrZoD8T3kjIpeSVOUPf6ip2ZNGdAI2Pj/05r23SZn0mNxt+vt8wXffOODMZmBroEzWC+jRJWknrIvLeUrBHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+GxAzRkwSB5/CcfHimQbibbDgUjlmKcVbRUzzzMaEY=;
 b=3ETAJ9zLypCd8OZc/gSA3z/N9arCd8AFp6JAUz5AwVdgpPZbQTNsoY8P3IINq8OQlIWi12e8r6aMzmHzHUz7dL/F1hp5CdCrl9cN+ssXVV+YlByaxAhoplkNKEbizUoaNr7YjebJOLzwF1RCCFe5PI1Px/MkmhKd7aBxnK4wo28=
Received: from CH2PR11CA0010.namprd11.prod.outlook.com (2603:10b6:610:54::20)
 by IA0PR12MB8087.namprd12.prod.outlook.com (2603:10b6:208:401::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:42:33 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:54:cafe::2a) by CH2PR11CA0010.outlook.office365.com
 (2603:10b6:610:54::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.21 via Frontend Transport; Tue,
 17 Jun 2025 04:42:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 04:42:33 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:42:32 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 29/36] test/kms_colorop: Add tests that exercise the 1D LUT
 colorops
Date: Mon, 16 Jun 2025 22:36:24 -0600
Message-ID: <20250617043631.2920587-30-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|IA0PR12MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ed53938-1cf3-4c6b-3b75-08ddad596054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sfSgFpeoNbik2fSq7KBaJzoAvyDhv0JvkeR361AOWtNzwPVDvCOpX6SUtDPy?=
 =?us-ascii?Q?oM0FAKSRFp+AJJrv+uHEBnyu3dpfiMlp0YT6BS65ltBUs1cHzUwmTKqnM9f4?=
 =?us-ascii?Q?YL71/ELa5iT+tEYxHloDXnZhQVabpFgn0UUtrPtjI8NLh5v7GvFag63dTxEk?=
 =?us-ascii?Q?ap30DD2xyUqke1mV0yOLZNQWplYgChL90c3v3sst6jqOW2VQgjJCilsp9VY0?=
 =?us-ascii?Q?k2hpXZk5RmEe3TS4QCibyY5biXBJd6H7HUSwwtlfs3uk4RMdFL46GxFxSctm?=
 =?us-ascii?Q?AE5Iry8XM/U7efESOW3+GvD0JMzh7ESvhiyGqIDMhLzRIW2qKGombqvEOrCE?=
 =?us-ascii?Q?Z/wIKij2Eq8hdFgb+GKCoxAM5cvGz7OVaVkrPns9P5f+mTV3idaGvtwN+N/o?=
 =?us-ascii?Q?llcnj8zkXvDiTJLScI1b53dCnFr4sLJpDg7goZwB3N7bIDDWL6iMDmEYYu02?=
 =?us-ascii?Q?v+Mue8rNkEIvu2O4vCgZv5vIfhM34J4Tg0VqUQV6ypMd5QtX3r+PwkDvmQj2?=
 =?us-ascii?Q?W+E5xtZq74zQFFZvFE02g/s0fKJxQzMTHdmL56UarpwoG3FL7uUY2FG5poVM?=
 =?us-ascii?Q?3E2tRp7bznkKcXwOYzwzqnIDhmaAiD4tdwVAgMzIS7pnmYuA9m5Zevq8futZ?=
 =?us-ascii?Q?fsN/SVMfF8xduXbFvUvfwItdhPYFZHWNK6ai2eF6ZCe2FTdHX9OUuML/U1XG?=
 =?us-ascii?Q?5x5wtvFIuBW53Eg2IQo/jSG6IJzzPV4UYoFPImKEkI8JfrAAVnja45Ou9JFq?=
 =?us-ascii?Q?zpUslhBPqiMP1JvyEhav48hUpBoynM04KYcgVPUSwfeIKDHq3g8xa7Xvahe2?=
 =?us-ascii?Q?J8CgVr5dzeX+zixD2hUm17lZgq0z5ApdL+x8GC1dvNvGM76dWkMhcwkeVt2U?=
 =?us-ascii?Q?kBPEDr8efpm1GNeFMiWIOA/2p9KxpXDkB3wBl39+NLJpPXmU8CXSB01xbWsH?=
 =?us-ascii?Q?Fiozl7NK4Vcvk1S45LO/zWe6Xr7D4uwujf6lUkYarZNEGuvXqD2QyHpa14xK?=
 =?us-ascii?Q?TSeNq7EHMIWP0iWrzR9vPRBS8i9VDdxJGc9vuddFOLTCSstn9PCcheEED42X?=
 =?us-ascii?Q?h3jpIpXazz+anCCslNZXEkO9Vh23o6yuSWLS/v3nSwglZcwimF8uS0LNOCbv?=
 =?us-ascii?Q?b/HQehPnVReDiE+mFgc0V9Utbx+tDw+wykJDZWQQp9dakJl7TgFCRDardadU?=
 =?us-ascii?Q?bPoN7XKRKWVXnL1Jh1Y5mVn98UZwfM+ELB55PAzsFH2h1tk74A0Z+lScvaKo?=
 =?us-ascii?Q?mOB7CTdg7YHPAk3oCbsz2r+EUQuMuenLwGRVIATu3bNypkUvIeGvR36++fPY?=
 =?us-ascii?Q?+gcx4iUu+3LehKET6w+TGpM4yQaWqaiWn8ZiwJeONUL+7FDwJpav11+RieJ9?=
 =?us-ascii?Q?dSqXis0wxr4hIsXTRqBXKfwxWWskkRobsHVAV03IZyv8tN1PjQzr807D7eN/?=
 =?us-ascii?Q?UQ7cu3ZLVlAhbteqmi98J59Ku8MkUbI+hfCAwlC5FCG8cwDPzGPNS6TrKqn5?=
 =?us-ascii?Q?CfmpJk9myPLgx6m8Bsz3aeQBuzwKea6r5Gvz?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:42:33.5748 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed53938-1cf3-4c6b-3b75-08ddad596054
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8087
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

We'll use the sRGB EOTF and its inverse for convenience.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 35 +++++++++++++++++++++++++++++++++++
 tests/kms_colorop.h | 15 +++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 0f2feb50f..f5895c782 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -49,6 +49,8 @@
  * @srgb_inv_eotf:              	sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf:    	sRGB EOTF -> sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf-srgb_eotf:  sRGB EOTF -> sRGB Inverse EOTF -> sRGB EOTF
+ * @srgb_inv_eotf_lut:              	sRGB Inverse EOTF Custom LUT
+ * @srgb_inv_eotf_lut-srgb_eotf_lut:	sRGB Inverse EOTF Custom LUT -> sRGB EOTF Custom LUT
  * @bt2020_inv_oetf:			BT.2020 Inverse OETF
  * @bt2020_oetf:			BT.2020 OETF
  * @bt2020_inv_oetf-bt2020_oetf:	BT.2020 Inverse OETF > BT.2020 OETF
@@ -230,6 +232,9 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 	case KMS_COLOROP_CTM_3X4:
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_CTM_3X4);
 	case KMS_COLOROP_CUSTOM_LUT1D:
+		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_LUT)
+			return true;
+		return false;
 	case KMS_COLOROP_LUT3D:
 	default:
 		return false;
@@ -297,9 +302,33 @@ static igt_colorop_t *get_color_pipeline(igt_display_t *display,
 	return colorop;
 }
 
+static void fill_custom_1dlut(igt_display_t *display, kms_colorop_t *colorop)
+{
+	uint64_t lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
+	igt_pixel_t pixel;
+	float index;
+	int i;
+
+	for (i = 0; i < lut_size; i++) {
+		index = i / (float) lut_size;
+
+		pixel.r = index;
+		pixel.g = index;
+		pixel.b = index;
+
+		colorop->transform(&pixel);
+
+		colorop->lut1d->lut[i].red = pixel.r * 0xffff;
+		colorop->lut1d->lut[i].green = pixel.g * 0xffff;
+		colorop->lut1d->lut[i].blue = pixel.b * 0xffff;
+	}
+}
+
 static void set_colorop(igt_display_t *display,
 			kms_colorop_t *colorop)
 {
+	uint64_t lut_size = 0;
+
 	igt_assert(colorop->colorop);
 	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, 0);
 
@@ -312,6 +341,10 @@ static void set_colorop(igt_display_t *display,
 		igt_colorop_set_ctm_3x4(display, colorop->colorop, colorop->matrix_3x4);
 		break;
 	case KMS_COLOROP_CUSTOM_LUT1D:
+		fill_custom_1dlut(display, colorop);
+		lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
+		igt_colorop_set_custom_1dlut(display, colorop->colorop, colorop->lut1d, lut_size * sizeof(struct drm_color_lut_32));
+		break;
 	case KMS_COLOROP_LUT3D:
 	default:
 		igt_fail(IGT_EXIT_FAILURE);
@@ -494,6 +527,8 @@ igt_main
 		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, &kms_colorop_srgb_eotf_2, NULL }, "srgb_eotf-srgb_inv_eotf-srgb_eotf" },
+		{ { &kms_colorop_srgb_inv_eotf_lut, NULL }, "srgb_inv_eotf_lut" },
+		{ { &kms_colorop_srgb_inv_eotf_lut, &kms_colorop_srgb_eotf_lut, NULL }, "srgb_inv_eotf_lut-srgb_eotf_lut" },
 		{ { &kms_colorop_bt2020_inv_oetf, NULL }, "bt2020_inv_oetf" },
 		{ { &kms_colorop_bt2020_oetf, NULL }, "bt2020_oetf" },
 		{ { &kms_colorop_bt2020_inv_oetf, &kms_colorop_bt2020_oetf, NULL }, "bt2020_inv_oetf-bt2020_oetf" },
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index 7b98198f6..13d15ea66 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -71,6 +71,7 @@ typedef struct kms_colorop {
 
 	union {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
+		igt_1dlut_t *lut1d;
 		const igt_matrix_3x4_t *matrix_3x4;
 	};
 
@@ -110,6 +111,20 @@ kms_colorop_t kms_colorop_srgb_inv_eotf = {
 	.transform = &igt_color_srgb_inv_eotf
 };
 
+kms_colorop_t kms_colorop_srgb_inv_eotf_lut = {
+	.type = KMS_COLOROP_CUSTOM_LUT1D,
+	.lut1d = &igt_1dlut_srgb_inv_eotf,
+	.name = "srgb_inv_eotf_lut",
+	.transform = &igt_color_srgb_inv_eotf
+};
+
+kms_colorop_t kms_colorop_srgb_eotf_lut = {
+	.type = KMS_COLOROP_CUSTOM_LUT1D,
+	.lut1d = &igt_1dlut_srgb_eotf,
+	.name = "srgb_eotf_lut",
+	.transform = &igt_color_srgb_eotf
+};
+
 kms_colorop_t kms_colorop_bt2020_inv_oetf = {
 	.type = KMS_COLOROP_ENUMERATED_LUT1D,
 	.enumerated_lut1d_info = {
-- 
2.43.0

