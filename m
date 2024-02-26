Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E5AC5478C
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34F710F2A4;
	Mon, 26 Feb 2024 21:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="o9qttHQh";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C929610F2A3
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdxMj+W6yARRPIG8vkyXX2L81vNEFSOE4CkoVsWjLcdYYdGyofdlfaQK+l/4Z+c7Yp+oMllw9p1SZw/UC0YPOzijAgFVsySDkmb8rVonN6szjdy4ApvqEPBHym93poWH2vGpCxOc6gRVeR33DzGdDPOli9aIwyfIV3m5JeBEp3a7nsmqBaa6UECXJhCZ3uQyEPizPix94PLLQJm6gisD0mDNOvWnuT5ds7vjEp3RrjwRY6ikmUTBjiIU4UJUNuLLTDvEusjmwPF7adSjvLV8+Imr5dp/hh5CcVG/9qjGW3yZIptHb5oqJARtxLF54IqEZioBXveX4qX7ojM7PcEoGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/qhV/id4uR++yqxz8F7M5fZvEq0bwobJN/asQjKFEM=;
 b=VvPv+hb2piFmPTj8XVxAoJjV6YngOAMCTOB4RYNkTNkBsinZT/ohLulgpI38RSZ92fW27WRxxVhpzhu4itQEXVSsdx048FMAq1liSmKtIA7sBrBX76l3pk2oxvwbmyjOy8n4PwH4BpbOPaE4sRmnRHsHQegXBjReCWXbOFyvvN12mvgV2v5+MXREG8cr66c6kmqoT98Dgv1FgdXCsoRyJqW/QjbWvUJ0z6nMDNVJ784qAuNmLntFwCGH+J4lDxZ7kNvp/YsrYbkSeIJWuL/pb8hIOR7rJ+bdF8CBrmhS2fPuJ/6M1LYvdv+/p0EBQ6U0btUqCn95z7HPfod6vcSSCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/qhV/id4uR++yqxz8F7M5fZvEq0bwobJN/asQjKFEM=;
 b=o9qttHQh4b+5mUd5Ru6ocxIYeI5kB+bDwN2mLs3b0GYq4FaiuQKnyBBkhbiqgGk4BXj3vP1XpP26x1+8T4YOCYU7yGnjv7wmcHZ3tX1R6+jw69qAOHXXv5ilC1bdu38aDpCUC6i4sy3WkBH/W5+eXdjy4k3l+DSqLiueUan6eQ4=
Received: from SJ0PR03CA0268.namprd03.prod.outlook.com (2603:10b6:a03:3a0::33)
 by SJ0PR12MB7084.namprd12.prod.outlook.com (2603:10b6:a03:4ae::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:14:47 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::a4) by SJ0PR03CA0268.outlook.office365.com
 (2603:10b6:a03:3a0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:47 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:45 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 13:14:45 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:45 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>
Subject: [RFC PATCH v5 32/32] tests/kms_colorop: Add multiplier tests
Date: Mon, 26 Feb 2024 16:14:16 -0500
Message-ID: <20240226211416.100660-33-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211416.100660-1-harry.wentland@amd.com>
References: <20240226211416.100660-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|SJ0PR12MB7084:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b4fa38f-35b5-426c-03e7-08dc370ff600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eBTNvsaCJSIMSOkGYskZR2EhsHSzbNi7XruG5ln+QuAj9zQIMDpDDC5M9mATWJA7LmxExqWMwTQv/VUKMzB3TYfcmCeOJoUN73xIAL5WsZUvxHx77CZ0Zw8tWxVcKJ0CZr4YgSo74toeGpLoDD12XTLDWx2xNgmzWC81mSpx42j4yup9s6QniZuLFgqxTslCQ4SbfwuP5NxzQeQL2dfnMVo64gavu2PkBV9wxI4lk7qyCmenJ5Tunlh6tN92Gr+rezJGScMCUbP6pIRHoJHVZu6ztWqLP8MeskyIlR7bugk+Oc9Y8IerXQ9++UPWbqAfD6g7oTys/bEZxXzaKuiE9+xWrCumCOzhQTy1hsLNsR0i5XsNQu3DuSDGcX0vvP+MGoyzrKlzbEg6GnPrKQxp3JVhoiF9G65FgIkHIiJW0yci0BlCmnF/W2iTwxxE4EauSILBFQ7Wt3pKa3Ez2S02OfHPh+dMu2Vcj5YM/TY4ZzGijpZjL2h6CygjKnEAVEX0p6TFGWz+eNEBTy524RegNySS+SBdiObmeH8ZNeYA82FlmYEYdtM/G7c3KL6gGBSsjUahaLJyZVslp5SYDl9Yo/46PcTiU9iizRLOtRunGoll1qipjOLRCkTyXI95Wker3NBqnkNAxxuGJVPgPXGlyXvayS+8HXHSkHXzJH6LB0E0hAREzqHfCSV93Y0B3/DgBWy0+qFV8bcrAdsv8LDNX4AGheY0sfrB63ZT6WwwEChRHT++bp0Hk+yMh+hrrDfn
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:47.0219 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4fa38f-35b5-426c-03e7-08dc370ff600
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7084
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

This includes multiply_125 (125.0f) and multiply_inv_125 (1/125.0f).

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 include/drm-uapi/drm_mode.h |  1 +
 lib/igt_color.c             | 10 ++++++++++
 lib/igt_color.h             |  2 ++
 lib/igt_kms.c               |  1 +
 lib/igt_kms.h               |  1 +
 tests/kms_colorop.c         | 11 +++++++++++
 tests/kms_colorop.h         | 15 +++++++++++++++
 7 files changed, 41 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index 59dc8dcaa481..57b1dac3d516 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -878,6 +878,7 @@ enum drm_colorop_type {
 	DRM_COLOROP_1D_CURVE,
 	DRM_COLOROP_1D_LUT,
 	DRM_COLOROP_CTM_3X4,
+	DRM_COLOROP_MULTIPLIER,
 };
 
 /**
diff --git a/lib/igt_color.c b/lib/igt_color.c
index cc5ee3b0ba50..e6f435bf436c 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -197,6 +197,16 @@ void igt_color_ctm_3x4_bt709_dec(igt_pixel_t *pixel)
 	igt_color_apply_3x4_ctm(pixel, &igt_matrix_3x4_bt709_dec);
 }
 
+void igt_color_multiply_125(igt_pixel_t *pixel)
+{
+	igt_color_multiply(pixel, 125.0f);
+}
+
+void igt_color_multiply_inv_125(igt_pixel_t *pixel)
+{
+	igt_color_multiply(pixel, 1/125.0f);
+}
+
 static void
 igt_color_fourcc_to_pixel(uint32_t raw_pixel, uint32_t drm_format, igt_pixel_t *pixel)
 {
diff --git a/lib/igt_color.h b/lib/igt_color.h
index 4a9f9b7a3958..4cc34cab569e 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -147,5 +147,7 @@ void igt_color_ctm_3x4_oversaturate(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_bt709_dec(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_bt709_enc(igt_pixel_t *pixel);
 
+void igt_color_multiply_125(igt_pixel_t *pixel);
+void igt_color_multiply_inv_125(igt_pixel_t *pixel);
 
 #endif
\ No newline at end of file
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 8550a3d4dc71..abf675de8f43 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -691,6 +691,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
 	[IGT_COLOROP_SIZE] = "SIZE",
 	[IGT_COLOROP_DATA] = "DATA",
+	[IGT_COLOROP_MULTIPLIER] = "MULTIPLIER",
 	[IGT_COLOROP_NEXT] = "NEXT",
 };
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index ed71a249ddb0..d18333787bd5 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -354,6 +354,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_CURVE_1D_TYPE,
 	IGT_COLOROP_SIZE,
 	IGT_COLOROP_DATA,
+	IGT_COLOROP_MULTIPLIER,
 	IGT_COLOROP_NEXT,
 	IGT_NUM_COLOROP_PROPS
 };
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 8ce5a87f0f3f..fc58e4d59a85 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -69,6 +69,8 @@
  * @ctm_3x4_bt709_dec:			BT709 decoding matrix
  * @ctm_3x4_bt709_enc_dec:		BT709 encoding matrix, followed by decoding matrix
  * @ctm_3x4_bt709_dec_enc:		BT709 decoding matrix, followed by encoding matrix
+ * @multiply_125:			Multiplier by 125
+ * @multiply_inv_125:			Multiplier by inverse of 125
  *
  */
 
@@ -236,6 +238,8 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_LUT)
 			return true;
 		return false;
+	case KMS_COLOROP_MULTIPLIER:
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_MULTIPLIER);
 	case KMS_COLOROP_LUT3D:
 	default:
 		return false;
@@ -329,6 +333,7 @@ static void set_colorop(igt_display_t *display,
 			kms_colorop_t *colorop)
 {
 	uint64_t lut_size = 0;
+	uint64_t mult = 1;
 
 	igt_assert(colorop->colorop);
 	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, 0);
@@ -346,6 +351,10 @@ static void set_colorop(igt_display_t *display,
 		lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
 		igt_colorop_set_custom_1dlut(display, colorop->colorop, colorop->lut1d, lut_size * sizeof(struct drm_color_lut));
 		break;
+	case KMS_COLOROP_MULTIPLIER:
+		mult = colorop->multiplier * (mult << 32);	/* convert double to fixed number */
+		igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_MULTIPLIER, mult);
+		break;
 	case KMS_COLOROP_LUT3D:
 	default:
 		igt_fail(IGT_EXIT_FAILURE);
@@ -546,6 +555,8 @@ igt_main
 		{ { &kms_colorop_ctm_3x4_bt709_dec, NULL }, "ctm_3x4_bt709_dec" },
 		{ { &kms_colorop_ctm_3x4_bt709_enc, &kms_colorop_ctm_3x4_bt709_dec, NULL }, "ctm_3x4_bt709_enc_dec" },
 		{ { &kms_colorop_ctm_3x4_bt709_dec, &kms_colorop_ctm_3x4_bt709_enc, NULL }, "ctm_3x4_bt709_dec_enc" },
+		{ { &kms_colorop_multiply_125, NULL }, "multiply_125" },
+		{ { &kms_colorop_multiply_inv_125, NULL }, "multiply_inv_125" },
 	};
 
 	struct {
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index 13d15ea6637d..1def86bc3380 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -36,6 +36,7 @@ typedef enum kms_colorop_type {
 	KMS_COLOROP_ENUMERATED_LUT1D,
 	KMS_COLOROP_CUSTOM_LUT1D,
 	KMS_COLOROP_CTM_3X4,
+	KMS_COLOROP_MULTIPLIER,
 	KMS_COLOROP_LUT3D
 } kms_colorop_type_t;
 
@@ -73,6 +74,7 @@ typedef struct kms_colorop {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
 		igt_1dlut_t *lut1d;
 		const igt_matrix_3x4_t *matrix_3x4;
+		double multiplier;
 	};
 
 	const char *name;
@@ -223,5 +225,18 @@ kms_colorop_t kms_colorop_ctm_3x4_bt709_dec = {
 	.transform = &igt_color_ctm_3x4_bt709_dec
 };
 
+kms_colorop_t kms_colorop_multiply_125 = {
+	.type =	KMS_COLOROP_MULTIPLIER,
+	.multiplier = 125.0f,
+	.name = "multiply_125",
+	.transform = &igt_color_multiply_125
+};
+
+kms_colorop_t kms_colorop_multiply_inv_125 = {
+	.type =	KMS_COLOROP_MULTIPLIER,
+	.multiplier = 1/125.0f,
+	.name = "multiply_inv_125",
+	.transform = &igt_color_multiply_inv_125
+};
 
 #endif /* __KMS_COLOROP_H__ */
-- 
2.44.0

