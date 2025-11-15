Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D960DCE8D6B
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:24:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6BA10EBD5;
	Sat, 15 Nov 2025 00:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2xwq6rBu";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013035.outbound.protection.outlook.com
 [40.93.196.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682E210EBD5
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:24:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xAmEqGumeyP2joTH/i1G7zQopJwFaYdgyRTMaGQVJQgtHIYJD0X2u20BrRVfYDcfZN3L90gFurzQj6Q3EU5nk8MNMyQruAG5dPmNrUuV6/d2EubWi+m08vonOPfInxrX+U8IYL6c79f91BBBFuoPFh5F/FTpxZqzOhUzbb1c9ec2+BYnkLGKTLVZpw0ZaNNbJIHMa/uK1esv0WHmaRKiTjw2es1SXHBjwDQIugSSyRWRbwpHaHohepe1pdGWJj99slVi26FBKsr4Akkwsx0XSRn7FV+Ienf86q9euF3NLQ/FoLfuAQJaF4Yi8dVzOype1E+7/CSLAzG5wZHDLH66ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZVhoJEOy9F3jgsoJW/eYpj2jHMEW4moyqYn1Mnrovg=;
 b=rNPE7/oMqMTS8efvOQnZUyosOHvjjyl6xaFgGnZrksSt2t8OStE0v9IGsclpwnVH6Y+JIAiFo28FKtb7HpF0Aj5rFlPGi67rCSHuu54d/Rr/KigATjwcRFhtlgb1u7B/minmAkERXzom9yWi6dJ/7Jfe1d2vD2c2llBemSngCJV+OLhAZlCn9pdyG7yHgWPuf+pw25DoDxAh1NQ9vxO8FM8IlXwIFkY+nKvSiRUAwpliWOGGUgY8XmlES8dBDS6lpSAQEkNXBoiKPwOkwAujSEjZqhfyyvRomiMv1wJN24qmSGyPkQxG42JiY9SM7bgTBrfgn38LGqiSTP2qHKfaFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZVhoJEOy9F3jgsoJW/eYpj2jHMEW4moyqYn1Mnrovg=;
 b=2xwq6rBuotPEA5J3cDK2/wbjedej82NI+gwcveYJUw0glVaJbt2nw7mvaJ/yrqswGAZEsGnrAFbsGuTk8VEO7UpxCu8U/6FSe9cxQO/8a7NeT2qfuch9xauTCNQ/hituCcyLN0Rell58GHlb04Zn89avstqYHhDQ0vk4yOGXf78=
Received: from DS7PR06CA0020.namprd06.prod.outlook.com (2603:10b6:8:2a::21) by
 BY5PR12MB4242.namprd12.prod.outlook.com (2603:10b6:a03:203::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.18; Sat, 15 Nov 2025 00:24:17 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:8:2a:cafe::1a) by DS7PR06CA0020.outlook.office365.com
 (2603:10b6:8:2a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Sat,
 15 Nov 2025 00:24:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:24:16 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:24:15 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 27/32] tests/kms_colorop: Add multiplier tests
Date: Fri, 14 Nov 2025 17:18:36 -0700
Message-ID: <20251115001841.3563993-28-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115001841.3563993-1-alex.hung@amd.com>
References: <20251115001841.3563993-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|BY5PR12MB4242:EE_
X-MS-Office365-Filtering-Correlation-Id: 8500b883-dc0b-44fb-9dd8-08de23dd4ff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iC3XtYlQsMwfK6wGL1Gvy9GLgPYWrr3s+ioUKUWvIoi4rTfInQj+s/PhTEcw?=
 =?us-ascii?Q?DSzkYBGZIolusAmTTc1W3t5JGvV9JuKih78Ji3PSK21SyO0ObyLpheh5KHUT?=
 =?us-ascii?Q?pa6si+NQfIDcVtd6SK2E1dd4XU+bRSX67Ml+B1gTpTdQOtgAm8luKZs4Hfdr?=
 =?us-ascii?Q?zRLa+d0vD29kDkJPoZFddYaYbV51VNHH6qdWx8VHhuemhkwRYH0Xrv1RJfYk?=
 =?us-ascii?Q?03IA3zenYwgag87p+6YL4pjWdD00sfvLADYsge2Z1h0Y4GQnt/g17pLqV3bw?=
 =?us-ascii?Q?Erk16W4+JsrDPm+UPl6tU3i0qg86rmzjImLXfexpq+YRRKV2+KmqEtoujihK?=
 =?us-ascii?Q?gwxxxU6SNlTjyqxBIZba1uRX2ZSL1YQgQWvrwT2SDHBNGzcg6rnoEk9CN3Wp?=
 =?us-ascii?Q?V4r5s+oZGJK7GNJ50sTbi50wG4x/4439b2kcwHd9bZCdEINTykMM5+tNoV8o?=
 =?us-ascii?Q?gesnWwicSgkE1e4E0i/1NxJklDCJhqYcVqCONw7smcPEWBabOffYUG3HzGyL?=
 =?us-ascii?Q?lZZUn3dL6QafZHmSlDvPwg32XTY4ad4BvZPgK8vL1fTS+7KfyY+1xndxIYRA?=
 =?us-ascii?Q?hgckYCV9sa8LkqRQ0JqdZ6HDCwGJkZPqCH5e8Ntql0qjM6jiDn+QxM8pME08?=
 =?us-ascii?Q?bueNnxIkQ1afU/3mRsQHAPjVj8hBaY8kvq2E3nyPoZo4OE05LejtpoWljSid?=
 =?us-ascii?Q?HFLWzz+hy+lQ6cz0fL+3JUEaR0bTixDcHBTSZwvJILzyMvhnNN9MrCsX8UVz?=
 =?us-ascii?Q?U7BnyVKOZcthdiHuSc8eWD61Q9RakZXEqpTgOx0izwfGKHA4p7W5FyEKP2VN?=
 =?us-ascii?Q?pMsig6BnAsdQ+28PeQcPkHXcCeMZg6H/3nQaWsp7GfrjCb0zBDTkf1rTLyBC?=
 =?us-ascii?Q?pHNLJxCuVr3ywC61RvsYD2tkiHRbGk+MqunLgPPcSU+crJtYdUEIfU+h6lXV?=
 =?us-ascii?Q?LacPPocyBQ/YO12eSKleczmnfkDA+tmnKFRwU/MIatgyApA52mV4j0Q6gcE2?=
 =?us-ascii?Q?mnwOlkVFa4hUwLcaVKpYFdutIhxm3dK/BF3gTQ796jc96I8oUHZKu+HWr6Db?=
 =?us-ascii?Q?oYjPmd9VFs2I62PyNxVh2xq8pRhJxwpjoKyURawKyCDaRjRkavbPuP/NSAqp?=
 =?us-ascii?Q?aS0xfTh+1ngA1ENjSxEoPXn0s1Yj9BaIMW+/PcpCdgLoSywXsKZMp/gcjgE7?=
 =?us-ascii?Q?WX4Et+DnEyA6nU9mcJ2mQ5RjhiLitrIAQBcVfvnWgOe/T0U5HE/ZMfp++cFC?=
 =?us-ascii?Q?L8kEMOoBeFVwZ2GIV67M9zOxIWgGgUE56sjALEXfXpkd/aCXCaL06TLiVvL0?=
 =?us-ascii?Q?H79C/qMSH+3U40nBPG9x9STKP1M+c8pmWEpCcy6GsgddAVW5nbecj4FfBQVI?=
 =?us-ascii?Q?GsOes0uFwEuUmeNFxAFWHmq3uTYrQw/zXQwMJr+ihaSvINf36C6ZKLi5YMXF?=
 =?us-ascii?Q?vrc+nhqDbqne2VnZMz3ojrw4Bg2/4I5CXdkgKggY/41DDY96rXiiJ/J1sRXH?=
 =?us-ascii?Q?ttaTvNrc98g6IXEkNphGpCXrD8EDd3lVO2NzeFXs628ICM9WeyVNdIlASnp6?=
 =?us-ascii?Q?iTb9MWHOyZtehonjKmo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:24:16.8425 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8500b883-dc0b-44fb-9dd8-08de23dd4ff3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4242
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

This includes multiply_125 (125.0f) and multiply_inv_125 (1/125.0f).

Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
 lib/igt_color.c     | 10 ++++++++++
 lib/igt_color.h     |  3 +++
 lib/igt_kms.c       |  1 +
 lib/igt_kms.h       |  1 +
 tests/kms_colorop.c | 11 +++++++++++
 tests/kms_colorop.h | 15 +++++++++++++++
 6 files changed, 41 insertions(+)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index f6ce69d9f..270e33432 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -203,6 +203,16 @@ void igt_color_ctm_3x4_bt709_dec(igt_pixel_t *pixel)
 	igt_color_apply_3x4_ctm(pixel, &igt_matrix_3x4_bt709_dec);
 }
 
+void igt_color_multiply_125(igt_pixel_t *pixel)
+{
+	igt_color_multiply(pixel, 125.0f);
+}
+
+void igt_color_multiply_inv_125(igt_pixel_t *pixel)
+{
+	igt_color_multiply(pixel, 1 / 125.0f);
+}
+
 static void
 igt_color_fourcc_to_pixel(uint32_t raw_pixel, uint32_t drm_format, igt_pixel_t *pixel)
 {
diff --git a/lib/igt_color.h b/lib/igt_color.h
index 1a39ee734..230640b36 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -130,4 +130,7 @@ void igt_color_ctm_3x4_overdrive(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_oversaturate(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_bt709_dec(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_bt709_enc(igt_pixel_t *pixel);
+
+void igt_color_multiply_125(igt_pixel_t *pixel);
+void igt_color_multiply_inv_125(igt_pixel_t *pixel);
 #endif
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b31ecdf52..2402c9caa 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -712,6 +712,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
 	[IGT_COLOROP_SIZE] = "SIZE",
 	[IGT_COLOROP_DATA] = "DATA",
+	[IGT_COLOROP_MULTIPLIER] = "MULTIPLIER",
 	[IGT_COLOROP_NEXT] = "NEXT",
 };
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 5cd32bdd5..80bc2e6ff 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -378,6 +378,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_CURVE_1D_TYPE,
 	IGT_COLOROP_SIZE,
 	IGT_COLOROP_DATA,
+	IGT_COLOROP_MULTIPLIER,
 	IGT_COLOROP_NEXT,
 	IGT_NUM_COLOROP_PROPS
 };
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index c4e6550b5..f70d9c6a3 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -51,6 +51,8 @@
  * @ctm_3x4_bt709_dec:			BT709 decoding matrix
  * @ctm_3x4_bt709_enc_dec:		BT709 encoding matrix, followed by decoding matrix
  * @ctm_3x4_bt709_dec_enc:		BT709 decoding matrix, followed by encoding matrix
+ * @multiply_125:			Multiplier by 125
+ * @multiply_inv_125:			Multiplier by inverse of 125
  *
  */
 
@@ -177,6 +179,8 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_LUT)
 			return true;
 		return false;
+	case KMS_COLOROP_MULTIPLIER:
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_MULTIPLIER);
 	case KMS_COLOROP_LUT3D:
 	default:
 		return false;
@@ -270,6 +274,7 @@ static void set_colorop(igt_display_t *display,
 			kms_colorop_t *colorop)
 {
 	uint64_t lut_size = 0;
+	uint64_t mult = 1;
 
 	igt_assert(colorop->colorop);
 	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, 0);
@@ -287,6 +292,10 @@ static void set_colorop(igt_display_t *display,
 		lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
 		igt_colorop_set_custom_1dlut(display, colorop->colorop, colorop->lut1d, lut_size * sizeof(struct drm_color_lut32));
 		break;
+	case KMS_COLOROP_MULTIPLIER:
+		mult = colorop->multiplier * (mult << 32);	/* convert double to fixed number */
+		igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_MULTIPLIER, mult);
+		break;
 	case KMS_COLOROP_LUT3D:
 	default:
 		igt_fail(IGT_EXIT_FAILURE);
@@ -496,6 +505,8 @@ igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		{ { &kms_colorop_ctm_3x4_bt709_dec, NULL }, "ctm_3x4_bt709_dec" },
 		{ { &kms_colorop_ctm_3x4_bt709_enc, &kms_colorop_ctm_3x4_bt709_dec, NULL }, "ctm_3x4_bt709_enc_dec" },
 		{ { &kms_colorop_ctm_3x4_bt709_dec, &kms_colorop_ctm_3x4_bt709_enc, NULL }, "ctm_3x4_bt709_dec_enc" },
+		{ { &kms_colorop_multiply_125, NULL }, "multiply_125" },
+		{ { &kms_colorop_multiply_inv_125, NULL }, "multiply_inv_125" },
 	};
 
 	struct {
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index 7fee7f8a7..c57865111 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -19,6 +19,7 @@ typedef enum kms_colorop_type {
 	KMS_COLOROP_ENUMERATED_LUT1D,
 	KMS_COLOROP_CUSTOM_LUT1D,
 	KMS_COLOROP_CTM_3X4,
+	KMS_COLOROP_MULTIPLIER,
 	KMS_COLOROP_LUT3D
 } kms_colorop_type_t;
 
@@ -56,6 +57,7 @@ typedef struct kms_colorop {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
 		igt_1dlut_t *lut1d;
 		const igt_matrix_3x4_t *matrix_3x4;
+		double multiplier;
 	};
 
 	const char *name;
@@ -206,5 +208,18 @@ kms_colorop_t kms_colorop_ctm_3x4_bt709_dec = {
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
2.43.0

