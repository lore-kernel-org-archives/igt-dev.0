Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5E9C5516D
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 18:03:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448A810F380;
	Fri, 31 Jul 2026 18:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RI7s6XZY";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010003.outbound.protection.outlook.com
 [52.101.193.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06D410F36A
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 18:02:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QaXBpDwsIlbWy2XEJv/NbQMGi2Lw2DHGONhn3QUBlFQaZwrprmLAToeEzSGTi79KfS2qD57r5kCtiwg4Fu+YtfCe3/cRnKKPY50pDnJTXVq75QCzJSQpBnGUgGNRwRrCl5DOB1jsagswdt752fYeToX7o41KTulTQl05h4JORWeqgX5UAJ1ZzwFNubViRlIC8Ye1oWlKzFfWcZ4OGhdnKBXzyUoG+RWQHu4djll1aH8EZ05abx9+FDFjNfYKCzn4fYa5uecTjEs/qsRzaMjmuxpvDYD+RVWldljaAXsa2Bew4wurBl9s9eAPuFwdjZNid1fQRBy7OTFNSwFfn/dnhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oq7gBvsH8QNtZZw14YzmCwjIs7jtqcNboPzWzJtga6Q=;
 b=uqVT6gYZmAa9bpBOPFa4GfYVKqMgb0zEoWkbKCYGzuMdRJokw9tQzoDb0OdzTzndOh5M7dRqxmfMwoTEIZRSzpEZhlxbN8LztLpOrZae//HfsjAxi6M0Q+hUKmeu0JndXHkhwCuUFdT44iqLO3nF2SX27P786AG71F2yyArFHNOKADGQ6HxrUgsali/fl21SdvT4nysqn2j4XRMX+u8ap7/UKxR+4h9d/eqm8lfuFRU3RKTE6d//ekbUy+l3qydajp67Cz3/jXSDNRwpIeQ0A7+n4iw001iF2ACUXgnIqXMQxW5iytHGnJtaTFdBgqx7Elb0N0niyfB9sel6aIGbrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oq7gBvsH8QNtZZw14YzmCwjIs7jtqcNboPzWzJtga6Q=;
 b=RI7s6XZYWsIJrOC9DPVgRZgLx0vzyihnfarN/sO3SNxHoFCI4/BHffJA8/UpPPYHGUaja1SLdEc/d4UM5iOJ6GaNd1RtwByLSQnaG042JEGInt/ziLX2cEslLYsYG+Vm5bcE1GuGuIv9L0Ry0o4K23KPLu6zrdmN2LLpxiJCkUE=
Received: from CH0PR13CA0010.namprd13.prod.outlook.com (2603:10b6:610:b1::15)
 by CY8PR12MB8314.namprd12.prod.outlook.com (2603:10b6:930:7b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 18:02:10 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:b1:cafe::28) by CH0PR13CA0010.outlook.office365.com
 (2603:10b6:610:b1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.10 via Frontend Transport; Fri,
 31 Jul 2026 18:02:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 18:02:10 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 13:02:10 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 31 Jul 2026 13:02:09 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v4 03/10] tests/kms_colorop_helper: Add Fixed Matrix colorop
 infrastructure
Date: Fri, 31 Jul 2026 14:01:53 -0400
Message-ID: <20260731180200.668795-4-harry.wentland@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731180200.668795-1-harry.wentland@amd.com>
References: <20260731180200.668795-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|CY8PR12MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: b475016e-aec4-4c3b-940b-08deef2dd7b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|82310400026|376014|36860700016|22082099003|18002099003|3023799007|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: R/2GCtKjjckgM9k9pUHLGcRvQXvtADrKc48Nivl8drsuuKOdpJxdDRvmuS26WJc11JD/1RSNpp/8aoHc6/C5WHWVh2sSiqF8EUUczZnObTogfWpcqZ938HZSRx/YEJZ3pw/vuXr+LzazHMOiT56Fn3debc5zkQ+uCD4MFWnw0SJ0rBQaf9KeOIbYkSxfGmk28ZMZwgTpVULAaGyQWgGwIRMclAaCCZcPfFj6+9sSFb7nE4tz9uFyo8RX4ZZplHMsJsm57m5sIJmDs+pf+jxWiEhcWJBwmFnPmIiMuHXOaIV4U5PH5u1DMVqgmapniNUKWDRmSSHXFs6pnyy6ejC4BCqFr+9xGdBOSjbACKv2vPpEqrwWPkBhWOz3JyLNtN2LT1tgu5oUngro6mryBAp1w8PZs7CLkSMn5zIvIIpsdhYEQZ6aOJCO7lDrW3q+M9cUx7YKZHfIpyMKkMI79NGaMFqOFk+/WfspAIWVJJMQiRjT3y+1d6HzZ3a/72egqL72ejQ/MICOak9YvT5Ve+tRNsxvv/9Un5IC13JlrjsyluSjRduvwOP1dzFjLNExojcooEZK1UqiWhW6CFACw6Bx2rrTm7QqzVCFP+5EPzWdQxBxTqcfDJwPW6rk0yFeSHZ5kU6cjkpf/rqzHLZMrhg8if5ogKR54VBNIy4lpJKwqHhWDzJQcp/L0JLGuIXfuhGq3F1X9qOEMvQiwsFF12MmHA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(22082099003)(18002099003)(3023799007)(10067099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Tf3pUJywsYyipSOQyY9T3DE06v5K82jikqV2suppEH/yVPQaAsT1t1+oZp+vW81QJqpyO2RVjfQm/hvQlBTTKy8V70AzdfhEyzYQJ/P9nl29nseavY0gnnAdPNhpHNtJeYPQiGAwKhwLY53oPNkz5rxp/Vlt/PnVH6IDCyqJKuBC2OAFqkblpAk0X52bSKJK2TQc3J4UCjMntXI6S+Hg2cxle2buo/hi8w3g8IEvKuf3s8EHcpvZQRY3bAXYXy7MH63F4+ZE3nwp5m4hnW6wvr3ZSNlG0DHs64QWrlykRr4i6OdoLOBYvWYMn4A/xXkhVIYbMoS/PN06AD0MNWN3FPX47inJ3JjrJti5TxFH/hUq+VYRxiyxFTRfXc805ywSGg5AF2bJj2rdr3KlxJc9FOc69RerXOMUDkGgk1HMBB+t32awR753wxl6bBtMgPPI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 18:02:10.4069 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b475016e-aec4-4c3b-940b-08deef2dd7b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8314
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

Add support for Fixed Matrix colorops:
- Add KMS_COLOROP_FIXED_MATRIX type to the test colorop type enum
- Add kms_colorop_fixed_matrix_info_t struct carrying the DRM enum string
  name plus encoding/range for software reference transforms
- Add can_use_colorop() handling: matches DRM_COLOROP_FIXED_MATRIX type and
  verifies the specific FIXED_MATRIX enum value is supported
- Add set_colorop() handling: sets FIXED_MATRIX via single enum property
- Define four FIXED_MATRIX colorop instances: BT.709 limited/full, BT.601
  limited, and BT.2020 limited

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_colorop_helper.c | 52 ++++++++++++++++++++++++++++++++++++++
 tests/kms_colorop_helper.h | 14 +++++++++-
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index aaee4e567ef6..3243d01d3e58 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -4,6 +4,7 @@
  */
 
 #include "kms_colorop_helper.h"
+#include "igt_color_encoding.h"
 
 const char * const kms_colorop_lut1d_tf_names[KMS_COLOROP_LUT1D_NUM_ENUMS] = {
 	[KMS_COLOROP_LUT1D_SRGB_EOTF] = "sRGB EOTF",
@@ -200,6 +201,48 @@ kms_colorop_t kms_colorop_3dlut_17_12_rgb = {
 	.transform = &igt_color_3dlut_17_12_rgb,
 };
 
+kms_colorop_t kms_colorop_bt709_limited_ycbcr_to_rgb = {
+	.type = KMS_COLOROP_FIXED_MATRIX,
+	.fixed_matrix_info = {
+		.fixed_matrix_type_name = "YCbCr 709 Limited to RGB",
+		.encoding = IGT_COLOR_YCBCR_BT709,
+		.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
+	},
+	.name = "YCbCr BT.709 Limited Range to RGB",
+	.transform = NULL,
+};
+
+kms_colorop_t kms_colorop_bt709_full_ycbcr_to_rgb = {
+	.type = KMS_COLOROP_FIXED_MATRIX,
+	.fixed_matrix_info = {
+		.fixed_matrix_type_name = "YCbCr 709 Full to RGB",
+		.encoding = IGT_COLOR_YCBCR_BT709,
+		.range = IGT_COLOR_YCBCR_FULL_RANGE,
+	},
+	.name = "YCbCr BT.709 Full Range to RGB",
+	.transform = NULL,
+};
+
+kms_colorop_t kms_colorop_bt601_limited_ycbcr_to_rgb = {
+	.type = KMS_COLOROP_FIXED_MATRIX,
+	.fixed_matrix_info = {
+		.fixed_matrix_type_name = "YCbCr 601 Limited to RGB",
+		.encoding = IGT_COLOR_YCBCR_BT601,
+		.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
+	},
+	.name = "YCbCr BT.601 Limited Range to RGB",
+	.transform = NULL,
+};
+
+kms_colorop_t kms_colorop_bt2020_limited_ycbcr_to_rgb = {
+	.type = KMS_COLOROP_FIXED_MATRIX,
+	.fixed_matrix_info = {
+		.fixed_matrix_type_name = "YCbCr 2020 Limited to RGB NC",
+	},
+	.name = "YCbCr BT.2020 Limited Range to RGB",
+	.transform = NULL,
+};
+
 static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_colorop_t *desired)
 {
 	switch (desired->type) {
@@ -218,6 +261,11 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_MULTIPLIER);
 	case KMS_COLOROP_LUT3D:
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_3D_LUT);
+	case KMS_COLOROP_FIXED_MATRIX:
+		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_FIXED_MATRIX &&
+		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_FIXED_MATRIX, desired->fixed_matrix_info.fixed_matrix_type_name))
+			return true;
+		return false;
 	default:
 		return false;
 	}
@@ -362,6 +410,10 @@ static void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
 
 		configure_3dlut(display, colorop, lut_size);
 		break;
+	case KMS_COLOROP_FIXED_MATRIX:
+		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_FIXED_MATRIX,
+					  colorop->fixed_matrix_info.fixed_matrix_type_name);
+		break;
 	default:
 		igt_fail(IGT_EXIT_FAILURE);
 	}
diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
index a081fa02db8e..9a1477666c82 100644
--- a/tests/kms_colorop_helper.h
+++ b/tests/kms_colorop_helper.h
@@ -22,7 +22,8 @@ typedef enum kms_colorop_type {
 	KMS_COLOROP_CUSTOM_LUT1D,
 	KMS_COLOROP_CTM_3X4,
 	KMS_COLOROP_MULTIPLIER,
-	KMS_COLOROP_LUT3D
+	KMS_COLOROP_LUT3D,
+	KMS_COLOROP_FIXED_MATRIX,
 } kms_colorop_type_t;
 
 typedef enum kms_colorop_lut1d_tf {
@@ -50,8 +51,15 @@ typedef struct kms_colorop_lut3d_info {
 	enum drm_colorop_lut3d_interpolation_type interpolation;
 } kms_colorop_lut3d_info_t;
 
+typedef struct kms_colorop_fixed_matrix_info {
+	const char *fixed_matrix_type_name;
+	enum igt_color_encoding encoding;
+	enum igt_color_range range;
+} kms_colorop_fixed_matrix_info_t;
+
 typedef struct kms_colorop {
 	kms_colorop_type_t type;
+	kms_colorop_fixed_matrix_info_t fixed_matrix_info;
 
 	union {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
@@ -94,6 +102,10 @@ extern kms_colorop_t kms_colorop_ctm_3x4_bt709_dec;
 extern kms_colorop_t kms_colorop_multiply_125;
 extern kms_colorop_t kms_colorop_multiply_inv_125;
 extern kms_colorop_t kms_colorop_3dlut_17_12_rgb;
+extern kms_colorop_t kms_colorop_bt709_limited_ycbcr_to_rgb;
+extern kms_colorop_t kms_colorop_bt709_full_ycbcr_to_rgb;
+extern kms_colorop_t kms_colorop_bt601_limited_ycbcr_to_rgb;
+extern kms_colorop_t kms_colorop_bt2020_limited_ycbcr_to_rgb;
 
 igt_colorop_t *get_color_pipeline(igt_display_t *display,
 			          igt_plane_t *plane,
-- 
2.55.0

