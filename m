Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E4D1061B0A
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 15:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C3410E71A;
	Mon, 30 Mar 2026 15:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LgFhKIyC";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011036.outbound.protection.outlook.com
 [40.93.194.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63CC10E6C7
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 15:35:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIJvf25hornmTOS3Xd8nv75KSFBKuTZWIW2tHwCfn3ts3GHWDoeeVQjhMMwlO03RchM6So1Uly5tgdZp5roYtjVJ2FsGO3K0t2cJaYbabgT2mewjgXh/Ek7tu0ftcFFB/6yulhyoSOqx5GSpqlbKCIU9LM0w3uSASfxjAwF/PZ2HsXO04t76/YdQUQ662e1+Ct7cH4qLbg8o9tlHiWh9Yajb0j9EVEAPHi3zRaJYWwpXzZKiA3GdOqGE6AvXYRiUdU6lUPJZMwy0yaHbfo6F6h2EHA+w3tro3D5yFNZyXTcBio0xiSB1dv2rISMf1THVMOPb+vAdL/86i+rpQeu4WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETrp0i8mtccW7iHUkRjBNKJCcmUSO1xyG7s4ZleNOl4=;
 b=jqMfMc0O/hF+s+XXPpbTtlGiOJ/yd6gCcbjf4vqxedGHpVH6/chxXYoz6LXtRENFOv1pDyDOpnOjwmUtX4efj449dJ1srFZhRqx1uPRNXQ3Fxof1/2dBByveso3QFRRBtmEFNEFHJ7arQK4X4KDHA7mSBbzuGwCLahXkQig6R2p1ZWDpzlvP7e6dg2vRC/zZykV826TAAZkX8hTP/OcBEOcL9oOSbzb1pQ1fXdwZCYdOOaHjMyjXc6P8uOq5+b2yuxynVva4TdUu1+Dr1oDwfV6X1+24WI74cRITp7oGx0FrM+zk+UoOo85HApCf/XuS18UzyLCzSQMjzNwIODu+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETrp0i8mtccW7iHUkRjBNKJCcmUSO1xyG7s4ZleNOl4=;
 b=LgFhKIyCcw23RHuzfQMxMQEKwkIqWtQMCs5tzbEwO/Z1+YFpRg8X/NCrwDr1CwWg9runZ/ZZgClK+FWUOprk1oHcR469GHLt67Tu3eBf5bxFXN1Cr0h7HyGW8zPJStDv06t18hgXTgUlTNH84x1B2/CdrrroHdxwd4gzyPjn2j8=
Received: from SJ0PR03CA0036.namprd03.prod.outlook.com (2603:10b6:a03:33e::11)
 by IA1PR12MB8310.namprd12.prod.outlook.com (2603:10b6:208:3ff::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 15:35:26 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::7a) by SJ0PR03CA0036.outlook.office365.com
 (2603:10b6:a03:33e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 15:35:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 15:35:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 30 Mar
 2026 10:35:22 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Mar
 2026 10:35:22 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 30 Mar 2026 10:35:21 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v2 02/11] lib/igt_kms,
 tests/kms_colorop_helper: Add CSC FF colorop infrastructure
Date: Mon, 30 Mar 2026 11:35:09 -0400
Message-ID: <20260330153518.99898-3-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330153518.99898-1-harry.wentland@amd.com>
References: <20260330153518.99898-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|IA1PR12MB8310:EE_
X-MS-Office365-Filtering-Correlation-Id: f9dcabb6-99b3-4081-d81f-08de8e71f56c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ZJ6+mbg9pVlACU+kdGpUYZ68rxrIkKwvt9ma8p/fnJFMc6gjN7Xb9RM5+UKifNVpKzZ5pQvjdDo//E826e9MxXQOAVp0moVy9PeUzTfxIItg0YikxBKUdj9IMGZFUZcUGyxGVvLLuvTPa1I/pdpFKW1jmPRmRza9BB9cVkMB6gdYA6jkYl3ydIhFqiZr7E0Lws3d4Bm/GeR3DqsFhI5dR8oC/qVh6E0zCxObI90I3GIMy7ozcCyiMT/t/AKpdJMRZY42dfItDH3e3dgcniH5v0SOaH+sJLgPaEKfGJ7a7AI6ru+WfOJYm+JLBHvL7R6vpx91yHkNrZRDMAebiRVvvP2gwMpRuyvWyTfZqr3Bd+jx8AoT0fHUbsNvqs4bg74yifFmX/GZMacM1ZkI8RbEXjK93MkImYXfMhnTw+yODGhsllZPOHoXzftE3EvVJFoJxrChyzHLJgGhzKlJBJVYJgoo1l/Hh0H4zRKy1zwHKjzwDwZ4F+zsghjdiSm4bRPZc/T8RxyGrdNla0WbFSE/znjXwt5whzcy4g5CvWD6f632BFmMyy1lr7jP4/dOlLfOq3JDK8/jqz1SrSSVxS92n1O2Css+xCFIjAImMd6NxzLyutDx+yfCKvgg1lKXHQmjjGaTR4HOEQNbB2Aw7LgwEPDi9DPwTAtWzSbAFqvnVGw7j/z3co+zI7hEv4wRlfUgbIBHFRieVP9fOiBiG/3BH55atgKJqFBtuN3tT48blyMAjG4E0zOPyCAMQADCD84KjI1DK+dv8bX80bfnepAqJQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Fc07NyDrUb4KAcYYcOSTd/+wW+yiZb+Fh5D1DZozTiLwosgYLtnWIEgHjZ7yTPx7aqNztOF6kC+TrO0OFS+SD0EbSqR1OmSjRbfD8AbyFxMX2pKZblBnImf6D5VgNYadVqGerI/Qi3Ee+5+yVf5+5GgUq1IoPBb5sYjd5Dgo7vJ+tjw60/3YPJb+ZnmvKxkSALQm4zRgD086RBvPM9nGPvwL1tFvgiQDAP74f07DIbuscNLjUMIfvjHSs2T9c6uEBB1BUtYAQYoWibthyjjN4l02cqsH+gdFpcFlPCpuZxeq/OqWb4iZVL0vMq+8qAT87VEUDtfuOTqSbhZprFANoBD9WuCshLINl358ou8Yf/9TMnfPggdwndTye5bFn4HY18TmoCNB6IJo1u7hn5zeRAa8qqWdRWnDtGGUVPGbj4id0GWDUYZ2m2FZdKMQ2Aa5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 15:35:23.1848 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9dcabb6-99b3-4081-d81f-08de8e71f56c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8310
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

Add support for CSC Fixed-Function colorops:
- Add IGT_COLOROP_CSC_FF_TYPE property to the colorop property enum
  and names array in igt_kms
- Add KMS_COLOROP_CSC_FF type to the test colorop type enum
- Add kms_colorop_csc_ff_info_t struct carrying the DRM enum string
  name plus encoding/range for software reference transforms
- Add can_use_colorop() handling: matches DRM_COLOROP_CSC_FF type and
  verifies the specific CSC_FF_TYPE enum value is supported
- Add set_colorop() handling: sets CSC_FF_TYPE via single enum property
- Define four CSC FF colorop instances: BT.709 limited/full, BT.601
  limited, and BT.2020 limited

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_kms.c              |  1 +
 lib/igt_kms.h              |  1 +
 tests/kms_colorop_helper.c | 45 ++++++++++++++++++++++++++++++++++++++
 tests/kms_colorop_helper.h | 12 +++++++++-
 4 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 57f5e099a313..1defb9a0ef3a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -716,6 +716,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_MULTIPLIER] = "MULTIPLIER",
 	[IGT_COLOROP_LUT3D_INTERPOLATION] = "LUT3D_INTERPOLATION",
 	[IGT_COLOROP_NEXT] = "NEXT",
+	[IGT_COLOROP_CSC_FF_TYPE] = "CSC_FF_TYPE",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 0bb2734ea3d7..2ce6a94cf93f 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -359,6 +359,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_MULTIPLIER,
 	IGT_COLOROP_LUT3D_INTERPOLATION,
 	IGT_COLOROP_NEXT,
+	IGT_COLOROP_CSC_FF_TYPE,
 	IGT_NUM_COLOROP_PROPS
 };
 
diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index aaee4e567ef6..4832c0f4eb23 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -200,6 +200,42 @@ kms_colorop_t kms_colorop_3dlut_17_12_rgb = {
 	.transform = &igt_color_3dlut_17_12_rgb,
 };
 
+kms_colorop_t kms_colorop_csc_bt709_limited = {
+	.type = KMS_COLOROP_CSC_FF,
+	.csc_ff_info = {
+		.csc_ff_type_name = "YUV709 Limited to RGB709",
+	},
+	.name = "CSC BT.709 Limited Range to RGB",
+	.transform = NULL,
+};
+
+kms_colorop_t kms_colorop_csc_bt709_full = {
+	.type = KMS_COLOROP_CSC_FF,
+	.csc_ff_info = {
+		.csc_ff_type_name = "YUV709 to RGB709",
+	},
+	.name = "CSC BT.709 Full Range to RGB",
+	.transform = NULL,
+};
+
+kms_colorop_t kms_colorop_csc_bt601_limited = {
+	.type = KMS_COLOROP_CSC_FF,
+	.csc_ff_info = {
+		.csc_ff_type_name = "YUV601 Limited to RGB601",
+	},
+	.name = "CSC BT.601 Limited Range to RGB",
+	.transform = NULL,
+};
+
+kms_colorop_t kms_colorop_csc_bt2020_limited = {
+	.type = KMS_COLOROP_CSC_FF,
+	.csc_ff_info = {
+		.csc_ff_type_name = "YUV2020 Limited to RGB2020",
+	},
+	.name = "CSC BT.2020 Limited Range to RGB",
+	.transform = NULL,
+};
+
 static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_colorop_t *desired)
 {
 	switch (desired->type) {
@@ -218,6 +254,11 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_MULTIPLIER);
 	case KMS_COLOROP_LUT3D:
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_3D_LUT);
+	case KMS_COLOROP_CSC_FF:
+		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_CSC_FF &&
+		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_CSC_FF_TYPE, desired->csc_ff_info.csc_ff_type_name))
+			return true;
+		return false;
 	default:
 		return false;
 	}
@@ -362,6 +403,10 @@ static void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
 
 		configure_3dlut(display, colorop, lut_size);
 		break;
+	case KMS_COLOROP_CSC_FF:
+		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CSC_FF_TYPE,
+					  colorop->csc_ff_info.csc_ff_type_name);
+		break;
 	default:
 		igt_fail(IGT_EXIT_FAILURE);
 	}
diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
index a081fa02db8e..6e8843b7b651 100644
--- a/tests/kms_colorop_helper.h
+++ b/tests/kms_colorop_helper.h
@@ -22,7 +22,8 @@ typedef enum kms_colorop_type {
 	KMS_COLOROP_CUSTOM_LUT1D,
 	KMS_COLOROP_CTM_3X4,
 	KMS_COLOROP_MULTIPLIER,
-	KMS_COLOROP_LUT3D
+	KMS_COLOROP_LUT3D,
+	KMS_COLOROP_CSC_FF
 } kms_colorop_type_t;
 
 typedef enum kms_colorop_lut1d_tf {
@@ -50,8 +51,13 @@ typedef struct kms_colorop_lut3d_info {
 	enum drm_colorop_lut3d_interpolation_type interpolation;
 } kms_colorop_lut3d_info_t;
 
+typedef struct kms_colorop_csc_ff_info {
+	const char *csc_ff_type_name;
+} kms_colorop_csc_ff_info_t;
+
 typedef struct kms_colorop {
 	kms_colorop_type_t type;
+	kms_colorop_csc_ff_info_t csc_ff_info;
 
 	union {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
@@ -94,6 +100,10 @@ extern kms_colorop_t kms_colorop_ctm_3x4_bt709_dec;
 extern kms_colorop_t kms_colorop_multiply_125;
 extern kms_colorop_t kms_colorop_multiply_inv_125;
 extern kms_colorop_t kms_colorop_3dlut_17_12_rgb;
+extern kms_colorop_t kms_colorop_csc_bt709_limited;
+extern kms_colorop_t kms_colorop_csc_bt709_full;
+extern kms_colorop_t kms_colorop_csc_bt601_limited;
+extern kms_colorop_t kms_colorop_csc_bt2020_limited;
 
 igt_colorop_t *get_color_pipeline(igt_display_t *display,
 			          igt_plane_t *plane,
-- 
2.53.0

