Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184F7CA0ED1
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6E910E9B9;
	Fri, 15 Aug 2025 04:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HfWuysJ+";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA5C10E9B9
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:09:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XH6EeCcRGU1rPRZlVGj9vRjqNFMSk54vZRzWTlYps2pHHdcFE3fBfH2BvjPL8DpGiNNmDE3CgLGA2JI+lS55c9CIyd8D7tmw7HlNcIztwi4l2FwI2VJQTDdfeGXTx0RLl9iu0vhNP1oVGcgEm3k61lAZUDqLxMd3fIHhwsF2iKw2kWNitsnWPpXUBBPj1QBT9jmK/7D8WRPXwx/a2oBU8cfd7UVRd5G/Q4BOgpR5zCghZ4QPLl7cftlld7NEDwZ2cnlaCglsIIJuLTk0GpGOYfaMM/oxaw5trWq25c7KW7J0xojQhYlFOM3N1SKxbU1L0CHJNYCYDyuKaYfg3YEEDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXRBZDIqiths2vf5pm1gVc20vSsqkw5XpoHg9H/8PGY=;
 b=JrLNFN6a82VN1VLHh/yj8qFGWcg/Hkw7BWVuKbdRo9NPoWnLLkgPDmtywoD1AXyVAL0p659sptcRn8WJlTbxtELb+g0U2ZQb7yKhmtSysoYUwnY4NFHdxRecF8Hjvv981nES8yOgSPa1LPptLgHbtVCmsZkPQH2cupAfbnfUd37gCWSgw/hVyPqQLVGk4+9RxCeaH1unQKNCP77JeuI08mHWcfBYt8JMUXLjbE+SoVRL8fUakF6/uYonA3MQtu+xbN8TqwewhEYfgOaASQrgzeAaYcJfI+ntRzMZ/urwRzNnXRy8fhpEN4nn+Uz9gMajfQvyCLKeIcO+Mnjwz9d0Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXRBZDIqiths2vf5pm1gVc20vSsqkw5XpoHg9H/8PGY=;
 b=HfWuysJ+CDaZ1A6eBNE2Tsn6FSUVPShFcGv2eNNNKMu1uRM6lcYygQAqZzUspnFptahbFzKdqQWhL5iK0xo3DdX/Gx58SyVu+TgsmeYWp2qvjCRexXISSiXND7O3c9YTjYeZIcx1Hzm3wCYYPLnPgDY5RJ0Ulnij2Q7AZYguYak=
Received: from MW4P223CA0017.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::22)
 by SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Fri, 15 Aug
 2025 04:09:39 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:303:80:cafe::97) by MW4P223CA0017.outlook.office365.com
 (2603:10b6:303:80::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 04:09:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:09:39 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:09:38 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 12/30] tests/kms_colorop: Add 3x4 CTM tests
Date: Thu, 14 Aug 2025 22:06:41 -0600
Message-ID: <20250815040659.3321102-13-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|SJ2PR12MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: f0844bce-6ca3-456a-cf4e-08dddbb18e10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fPU2YuSm38gOwCVZE9+Psf3AvluyPA/kUML5ObcQGQUQH7sTLG4UHU3KxIi3?=
 =?us-ascii?Q?6ZpOZqYISw7v68dxITMe2X1MK4PkSbLQBQ9dJiudgD4COVzRHa3+k9sYK58H?=
 =?us-ascii?Q?fxz+7HqsO+K16IkXfhHu/S8SSMIVEzFAlpK+1WvIDX5C4K/q/H6RYILxAAlx?=
 =?us-ascii?Q?QDDmaeK7wK6IColPR01vCwm7w+y9YYFBNjt3UsDLG4YBWv7iwzqbCU9wL74q?=
 =?us-ascii?Q?hnBGjDgEkBfh9zYjOLoVCrKf3rlaMbefZJK6ydE5OAKWUIrrG9pHkn3vi4Fs?=
 =?us-ascii?Q?hhFu2kVT71A9dmqlNhR7nc8MBDzDbkiaZ45G7+fHwQQZd5Zm7L+02PD9+6hZ?=
 =?us-ascii?Q?QMMoL/z3Ovy9o1WJT+Peca1aJnt14J2zpjE0T6EatUhazEarLXUfJz1MC6ps?=
 =?us-ascii?Q?dI4YZ0UmGxObAQUcNl9nreXikSrgG+55SQor0NBa9alRAodBQxjgpxNnI+D4?=
 =?us-ascii?Q?OHX+b9URJCOdi6EBI56CmWth6NA2v5dnFDag2PReptEi6qWx2iCUHA+WGmL6?=
 =?us-ascii?Q?A06G/HNjWE8q54e3WswErBVWGkekkHwrlOujqjKn6dBQHwFtofEv9sG1eLQE?=
 =?us-ascii?Q?JTKvb6Fv05RzkJvLeE+Iy0geH/6tMUImKpxNONHRtrkADVDyvopFxZzlXWML?=
 =?us-ascii?Q?B1DigCZzr6ZiIo5EbH2CpX453jnJ3oHFfS8xr/9Ldx8AJs9ohaRLdRkzP9mD?=
 =?us-ascii?Q?LHmXHEgb8N6+5EkrNBtZPIVP+CsZqyUT9hBKSsIBDu4rEzC1AIh3x0d79SKO?=
 =?us-ascii?Q?bDK6b/R/i2546p5Xs/5GRrOzHBOhFUYp4dlu0/1xmj/Xj0kAZKd17qI+zgHV?=
 =?us-ascii?Q?W+Ip6FmOX2ZY/TPfxJq93M07N3XwCFDxleaRN5XniLzu3h3IBljnO1qFI089?=
 =?us-ascii?Q?9Noaqfz1CWuXe1tsuF+ih8KgMEhcifV+d8X/piPM3KUHGleCXji6WwEzYxsC?=
 =?us-ascii?Q?BDuF83zju31No278bgDOarH2LIC+w1y4tajXxcMuU+RauOYTuT7ASC6YZer3?=
 =?us-ascii?Q?BkeQ1dkEPNHfb9Gkq2rFCqVmDRZkQ6NqtXzlDppzd1SqxSImBZ+IuNYGDCQ2?=
 =?us-ascii?Q?Tig3t5L0C3haK7Bj61p6W0jq6IEUe9fq4P/IBfqPqQyicQZuQpbpxHYW5LjO?=
 =?us-ascii?Q?aKRpWsviLF39J10kk//17IJaxj6X/FoRB5BDviV6f++R92S7HDQ6Z4hFzo8w?=
 =?us-ascii?Q?4og4Y4GKzvQCPq8mXkfoUXEI5CINMrfqZ/BG7q4pj++JrfnhlJtGjn6rPMoJ?=
 =?us-ascii?Q?R4ChACGYp7IY8SiYhoV5r1QTxDW/2gdUcPIfgzzvs6OjEmcnR5kc+7GfJ//Q?=
 =?us-ascii?Q?t4RXyEawo9zCTeuZbkEyVOzDlUbyUka6xBsptXbBPCh6/tC6cFPjtrOEyhY4?=
 =?us-ascii?Q?4SQNmz/OFOMq9SYdWv6YEo4UCWbzL3N7vi00jm96hSXJ8amIDI3zB/y168ka?=
 =?us-ascii?Q?d+k1oBwJYGwl45e1eUCgOEx9puRncajy3D1ZEuAVsH5M8mY0GWtY0rzzEIpK?=
 =?us-ascii?Q?SlqhyouLszGZyNVwqX7x8ZYJZYicsSOgOtMl?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:09:39.4299 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0844bce-6ca3-456a-cf4e-08dddbb18e10
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9163
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

From: Harry Wentland <harry.wentland@amd.com>

Add 3x4 CTM test for color pipeline API.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 42 +++++++++++++++++++++++++++++-------------
 tests/kms_colorop.h | 39 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 67 insertions(+), 14 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index e247477ec..8c595751e 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -40,9 +40,16 @@
  *
  * arg[1]:
  *
- * @srgb_eotf:                   sRGB EOTF
- * @srgb_inv_eotf:               sRGB Inverse EOTF
- * @srgb_eotf-srgb_inv_eotf:     sRGB EOTF -> sRGB Inverse EOTF
+ * @srgb_eotf:                  sRGB EOTF
+ * @srgb_inv_eotf:              sRGB Inverse EOTF
+ * @srgb_eotf-srgb_inv_eotf:    sRGB EOTF -> sRGB Inverse EOTF
+ * @ctm_3x4_50_desat:		3x4 matrix doing a 50% desaturation
+ * @ctm_3x4_overdrive:		3x4 matrix overdring all values by 50%
+ * @ctm_3x4_oversaturate:	3x4 matrix oversaturating values
+ * @ctm_3x4_bt709_enc:		BT709 encoding matrix
+ * @ctm_3x4_bt709_dec:		BT709 decoding matrix
+ * @ctm_3x4_bt709_enc_dec:	BT709 encoding matrix, followed by decoding matrix
+ * @ctm_3x4_bt709_dec_enc:	BT709 decoding matrix, followed by encoding matrix
  *
  */
 
@@ -181,10 +188,10 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 {
 	switch (desired->type) {
 	case KMS_COLOROP_ENUMERATED_LUT1D:
-		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE)
-			return true;
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE);
+	case KMS_COLOROP_CTM_3X4:
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_CTM_3X4);
 	case KMS_COLOROP_CUSTOM_LUT1D:
-	case KMS_COLOROP_CTM:
 	case KMS_COLOROP_LUT3D:
 	default:
 		return false;
@@ -204,13 +211,15 @@ static bool map_to_pipeline(igt_display_t *display,
 	int i = 0;
 	int prop_val = 0;
 
-	current_op = colorops[i++];
+	current_op = colorops[i];
+	i++;
 	igt_require(current_op);
 
 	while (next) {
 		if (can_use_colorop(display, next, current_op)) {
 			current_op->colorop = next;
-			current_op = colorops[i++];
+			current_op = colorops[i];
+			i++;
 			if (!current_op)
 				break;
 		}
@@ -272,8 +281,10 @@ static void set_colorop(igt_display_t *display,
 			igt_fail(IGT_EXIT_FAILURE);
 		}
 		break;
+	case KMS_COLOROP_CTM_3X4:
+		igt_colorop_set_ctm_3x4(display, colorop->colorop, colorop->matrix_3x4);
+		break;
 	case KMS_COLOROP_CUSTOM_LUT1D:
-	case KMS_COLOROP_CTM:
 	case KMS_COLOROP_LUT3D:
 	default:
 		igt_fail(IGT_EXIT_FAILURE);
@@ -330,9 +341,7 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
 
 #define DUMP_FBS 1
 
-#define MAX_COLOROPS 3
-#define NUM_COLOROP_TESTS 3
-#define MAX_NAME_SIZE 256
+#define MAX_COLOROPS 5
 
 static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_fb)
 {
@@ -469,7 +478,14 @@ igt_main
 	} tests[] = {
 		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
 		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
-		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" }
+		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" },
+		{ { &kms_colorop_ctm_3x4_50_desat, NULL }, "ctm_3x4_50_desat" },
+		{ { &kms_colorop_ctm_3x4_overdrive, NULL }, "ctm_3x4_overdrive" },
+		{ { &kms_colorop_ctm_3x4_oversaturate, NULL }, "ctm_3x4_oversaturate" },
+		{ { &kms_colorop_ctm_3x4_bt709_enc, NULL }, "ctm_3x4_bt709_enc" },
+		{ { &kms_colorop_ctm_3x4_bt709_dec, NULL }, "ctm_3x4_bt709_dec" },
+		{ { &kms_colorop_ctm_3x4_bt709_enc, &kms_colorop_ctm_3x4_bt709_dec, NULL }, "ctm_3x4_bt709_enc_dec" },
+		{ { &kms_colorop_ctm_3x4_bt709_dec, &kms_colorop_ctm_3x4_bt709_enc, NULL }, "ctm_3x4_bt709_dec_enc" },
 	};
 
 	igt_display_t display;
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index f414895dd..8f0c29cba 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -36,7 +36,7 @@ typedef int (*transform_pixel)(igt_pixel_t *pixel);
 typedef enum kms_colorop_type {
 	KMS_COLOROP_ENUMERATED_LUT1D,
 	KMS_COLOROP_CUSTOM_LUT1D,
-	KMS_COLOROP_CTM,
+	KMS_COLOROP_CTM_3X4,
 	KMS_COLOROP_LUT3D
 } kms_colorop_type_t;
 
@@ -56,6 +56,7 @@ typedef struct kms_colorop {
 
 	union {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
+		const igt_matrix_3x4_t *matrix_3x4;
 	};
 
 	const char *name;
@@ -85,4 +86,40 @@ kms_colorop_t kms_colorop_srgb_inv_eotf = {
 	.transform = &igt_color_srgb_inv_eotf
 };
 
+kms_colorop_t kms_colorop_ctm_3x4_50_desat = {
+	.type = KMS_COLOROP_CTM_3X4,
+	.matrix_3x4 = &igt_matrix_3x4_50_desat,
+	.name = "ctm_3x4_50_desat",
+	.transform = &igt_color_ctm_3x4_50_desat
+};
+
+kms_colorop_t kms_colorop_ctm_3x4_overdrive = {
+	.type = KMS_COLOROP_CTM_3X4,
+	.matrix_3x4 = &igt_matrix_3x4_overdrive,
+	.name = "ctm_3x4_overdrive",
+	.transform = &igt_color_ctm_3x4_overdrive
+};
+
+kms_colorop_t kms_colorop_ctm_3x4_oversaturate = {
+	.type = KMS_COLOROP_CTM_3X4,
+	.matrix_3x4 = &igt_matrix_3x4_oversaturate,
+	.name = "ctm_3x4_oversaturate",
+	.transform = &igt_color_ctm_3x4_oversaturate
+};
+
+kms_colorop_t kms_colorop_ctm_3x4_bt709_enc = {
+	.type = KMS_COLOROP_CTM_3X4,
+	.matrix_3x4 = &igt_matrix_3x4_bt709_enc,
+	.name = "ctm_3x4_bt709_enc",
+	.transform = &igt_color_ctm_3x4_bt709_enc
+};
+
+kms_colorop_t kms_colorop_ctm_3x4_bt709_dec = {
+	.type = KMS_COLOROP_CTM_3X4,
+	.matrix_3x4 = &igt_matrix_3x4_bt709_dec,
+	.name = "ctm_3x4_bt709_dec",
+	.transform = &igt_color_ctm_3x4_bt709_dec
+};
+
+
 #endif /* __KMS_COLOROP_H__ */
-- 
2.43.0

