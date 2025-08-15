Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC86ACA0EE0
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF8310EA62;
	Fri, 15 Aug 2025 04:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BgXDKJwe";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0EC10EA62
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:12:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmDnEeb4iGgr+VDBi95ISquHf/tASblxANzokN98DUMw2iOHcF5EaZ5gISgZwaiDgE4wKHy1+O2UmOsAsLlR8cd+EoAtNkzW5fUUZdAy6qMNVvnr8h/GhtOZumkc6pGGb2Sqo8SmYH/SKVHjcLwo4RGydukeGeYODDLfc5F7+AJ6Xwd+ZHvkNE/oYCa5jHSee5eHDJD4PRi934NG5TP0mnN6fQ7Rke3J2RsvUjJQt18JZFe4yLo4hY0Y1HHB+OcGCo98yO4+ORVwV2MoRDMIhWMku1A/DBLBljbof7W0W5rqrAVZ9A4MbFG13TqujYa+lG7qRoUL/qLcjB4HGm14lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iESJeXoxbqY4s8fvkOs7Tlo0Lrn2keS1Qjy3T3s08NM=;
 b=kPg9Kw4TAelSyuSZhfEJT2PXStsfPiKWokJCzNHIwV+LjN72lrBMpRub+jXTSYXflqi8pYo+R4ONtJ/pfmshl1lQMe4sQtI8hRP3xMSKlee5BRMdPCh/Dvfk3xwz5INjQ64edHPYgIA6sJbM+ONN/9mlkOhicA0FZRZP4JYVX6OaphIvpJCA1XzSMvKYmpawmyySaG7i+m5aPvB+jK9RGHDz3mQvDZ/wm24wZ1BY5xTzlJTW1KeLjqaKmUTRsl2PZ1rPXZOuwe1ClxD9NM0EqX3bJnyiAxIenUxN19L2NQGbICughhZ0M5La4x5p39EbSAJDi/iAML5YdP5yz0NiVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iESJeXoxbqY4s8fvkOs7Tlo0Lrn2keS1Qjy3T3s08NM=;
 b=BgXDKJweG4SYUMIwC2pJSMTRTBNSn5++3aCkFyABhrNlLv9BPu92EdBHvJxYQxyJfDX4TBGi+Bn0W3UmiOAm7GBmar2j8mooN2TGk8tWKbQGFdnmL9P5sY+V9UKp0nKNvL1WGx9oEbxI6yyo4OZ+88V0EfXooQNQzF9li6nFsXw=
Received: from SJ0PR13CA0045.namprd13.prod.outlook.com (2603:10b6:a03:2c2::20)
 by LV5PR12MB9825.namprd12.prod.outlook.com (2603:10b6:408:2ff::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 04:12:16 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::9c) by SJ0PR13CA0045.outlook.office365.com
 (2603:10b6:a03:2c2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.4 via Frontend Transport; Fri,
 15 Aug 2025 04:12:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:12:15 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:12:14 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 25/30] tests/kms_colorop: Add multiplier tests
Date: Thu, 14 Aug 2025 22:06:54 -0600
Message-ID: <20250815040659.3321102-26-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815040659.3321102-1-alex.hung@amd.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C7:EE_|LV5PR12MB9825:EE_
X-MS-Office365-Filtering-Correlation-Id: d356eed0-d3f2-4d5f-6952-08dddbb1eb16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wbHyWQU/kH5N45ecUgojbNaStCxUhpPFVXmPGDYZu/NnIHfPeJHaSynYPonP?=
 =?us-ascii?Q?zVWOb/dWoH05Qlx25aa6ZfNtoJEx1KBDohYOgsnWvZpmb6lkCrl6gamYSQGR?=
 =?us-ascii?Q?Kmz/wzMG1A9pChz7qDRyMm24T/kGC1WccF9gHbtiyTdNHuAQCUaJVn+hAi1k?=
 =?us-ascii?Q?YJD612RoRf3vlMZmM9DMDzRBExBqvvSAsc7v0vlPDYFTCtZXmYAMp9q60LA0?=
 =?us-ascii?Q?5W5Ub6Am52VKgISWNxNu0UJg6Cam4d55+5GcZiVDeTXcoqjYMTHNmwUNFIHK?=
 =?us-ascii?Q?acyZrs7r/+54GoXCScqfhSCDuFfwCFW6Vp8DuFORzaCa6G3p97oDfLWA2fOc?=
 =?us-ascii?Q?gRnVcIqq5QZU9Lsshva42ZG/fJlAWDtDxVJ0D9scFVszvhLHDl43FZuLaeWD?=
 =?us-ascii?Q?+XLXInzkDw5rGC5CSLFkDvyEjZLs+tyTWLCUdN9ftM5yjPSUDo/3dWI1DTV3?=
 =?us-ascii?Q?rAAOM/cUqcU1b7JIjgrimVUXylrIS4FJvv3zo1wMbVXno9zw7JBCKzlCFlBW?=
 =?us-ascii?Q?34y8HdHAOEEC6akXuX3+ze2s3qNu5AT42XD5tYYotd1601oWRnQBEC2x31uw?=
 =?us-ascii?Q?P/gFW6g8ZN+dPnLr/ddFtSmY1z8Ps5nqKm8jsO1itW4liX9t01rAlpMEAaFL?=
 =?us-ascii?Q?61d7dwNhvDWoHCDpeEDGCdpkwjBbFjAh0s/qNyFdNUYbTWjpmVwhwa1uZjq5?=
 =?us-ascii?Q?qFBc44GCRyeGecqXQ/fzjGG/d6/PQwmLe9JU4/SUbQVmySDAGKihnggs85Mt?=
 =?us-ascii?Q?E5xylrA6no8uifl/ZPo/fEApuEuz79dUDAo7GEW8i3yCfKOSn1/cPs9rvjWK?=
 =?us-ascii?Q?hk35kBJHb+dY7oAPesuX8UtLzADKs1BBaBJ+FxXI1DqcWqtaGWKSINvFl4TK?=
 =?us-ascii?Q?n0ouCsRb9lJ8VbGaEnkLprTW3ZoWkvpceAivBwEZx/Ik75egIiBqZIkp+c99?=
 =?us-ascii?Q?R2E5QrdZ8vMcwspIzpt1AivffbwGs9JQ4GAbcw3+hHUmSUtEfH0MqT9Ewg+T?=
 =?us-ascii?Q?lbCK7q5M3/d+I47XLcPCGpQgCnh4AQz/l2i5ppcEfUuyy8AMX2pDhkkaaiex?=
 =?us-ascii?Q?4c+mBLqjQKWLqdP1N/O5sJhZEy2AgoSBYK98PMU6y9gsDZyGWKhNeKzr7ix4?=
 =?us-ascii?Q?X0iVgJ6x4IECN4m8fwMXVQ/vVToy0vFbXUqbAtOuHEH/1EABY+wYv+v4BCj0?=
 =?us-ascii?Q?76yUaifrLwhqlbKpmwldvicoYDxN+OtMlO9cIF+GUaRk4QpO6ZP71zktx00n?=
 =?us-ascii?Q?2kmM86LWMwAi70Tkajkp0U1y5YjGh3AbmN60BluoxqNSDqGR9mP5Cl36cud0?=
 =?us-ascii?Q?WCniC9ilBjNII6FaQAYm+U2utVgwPRHqGOejJPJpqpQ7DjX4NKoeXud9fDX6?=
 =?us-ascii?Q?JRczmXN2dqMdryUaZ0CknIBoSP7TV1bx9wcDKNHGVBtuISna1TMtiR/O07ll?=
 =?us-ascii?Q?Cnt8gTR/0ykyBwsRUhzZbe44c96ThTiRb4ThSgC8K9I4flX/winltxHy1umz?=
 =?us-ascii?Q?9NtYlqEjPgD0wz+k/P4e5Q90pI77/iAUTzKi?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:12:15.4934 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d356eed0-d3f2-4d5f-6952-08dddbb1eb16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9825
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
---
 include/drm-uapi/drm_mode.h |  1 +
 lib/igt_color.c             | 10 ++++++++++
 lib/igt_color.h             |  3 +++
 lib/igt_kms.c               |  1 +
 lib/igt_kms.h               |  1 +
 tests/kms_colorop.c         | 11 +++++++++++
 tests/kms_colorop.h         | 15 +++++++++++++++
 7 files changed, 42 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index 106fbb889..fe3e98e20 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -890,6 +890,7 @@ enum drm_colorop_type {
 	DRM_COLOROP_1D_CURVE,
 	DRM_COLOROP_1D_LUT,
 	DRM_COLOROP_CTM_3X4,
+	DRM_COLOROP_MULTIPLIER,
 };
 
 /**
diff --git a/lib/igt_color.c b/lib/igt_color.c
index a58ba0e57..aa65eac20 100644
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
index 88de8166f..761dd2f95 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -133,4 +133,7 @@ void igt_color_ctm_3x4_overdrive(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_oversaturate(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_bt709_dec(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_bt709_enc(igt_pixel_t *pixel);
+
+void igt_color_multiply_125(igt_pixel_t *pixel);
+void igt_color_multiply_inv_125(igt_pixel_t *pixel);
 #endif
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index bdde2fc72..2ff70808b 100644
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
index d0a7ed037..cd64fd38f 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -376,6 +376,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_CURVE_1D_TYPE,
 	IGT_COLOROP_SIZE,
 	IGT_COLOROP_DATA,
+	IGT_COLOROP_MULTIPLIER,
 	IGT_COLOROP_NEXT,
 	IGT_NUM_COLOROP_PROPS
 };
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index bd7358a27..50cbc1a9d 100644
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
 		igt_colorop_set_custom_1dlut(display, colorop->colorop, colorop->lut1d, lut_size * sizeof(struct drm_color_lut32));
 		break;
+	case KMS_COLOROP_MULTIPLIER:
+		mult = colorop->multiplier * (mult << 32);	/* convert double to fixed number */
+		igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_MULTIPLIER, mult);
+		break;
 	case KMS_COLOROP_LUT3D:
 	default:
 		igt_fail(IGT_EXIT_FAILURE);
@@ -536,6 +545,8 @@ igt_main
 		{ { &kms_colorop_ctm_3x4_bt709_dec, NULL }, "ctm_3x4_bt709_dec" },
 		{ { &kms_colorop_ctm_3x4_bt709_enc, &kms_colorop_ctm_3x4_bt709_dec, NULL }, "ctm_3x4_bt709_enc_dec" },
 		{ { &kms_colorop_ctm_3x4_bt709_dec, &kms_colorop_ctm_3x4_bt709_enc, NULL }, "ctm_3x4_bt709_dec_enc" },
+		{ { &kms_colorop_multiply_125, NULL }, "multiply_125" },
+		{ { &kms_colorop_multiply_inv_125, NULL }, "multiply_inv_125" },
 	};
 
 	struct {
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index dfc42b352..b0371aff7 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -37,6 +37,7 @@ typedef enum kms_colorop_type {
 	KMS_COLOROP_ENUMERATED_LUT1D,
 	KMS_COLOROP_CUSTOM_LUT1D,
 	KMS_COLOROP_CTM_3X4,
+	KMS_COLOROP_MULTIPLIER,
 	KMS_COLOROP_LUT3D
 } kms_colorop_type_t;
 
@@ -74,6 +75,7 @@ typedef struct kms_colorop {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
 		igt_1dlut_t *lut1d;
 		const igt_matrix_3x4_t *matrix_3x4;
+		double multiplier;
 	};
 
 	const char *name;
@@ -224,5 +226,18 @@ kms_colorop_t kms_colorop_ctm_3x4_bt709_dec = {
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

