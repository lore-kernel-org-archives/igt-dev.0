Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075EF606A320
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 15:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KAdNCsRK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD7010E345;
	Thu, 19 Nov 2026 15:56:50 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010034.outbound.protection.outlook.com [52.101.56.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04EF511260A
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 15:54:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nf/zyb+Ey93ud+dCaBAsmoi4+3BFODUx428MjXUg7SNgaaFR32k+z7Tkzd+1Y9+/4ojUgsrfUJ6hgUstPwMJQ88YINVDlepFzgJWMMT3cM6zfq5sP+pT/RO8FwkPh/FFt3OT0a6eEprRyrgAGNLFd6B7b4I/oEOvAw0UJdSeJPtCu5kKSg+gqXuwH/GT+9x/vJaHru/V6W/32BxNHH6rt4pmXHit6aH0rKkSXi/2pImJUU4XLpFpLVKxEevLu+bXX6JHnxyV8qSqdGt73SC0l7JFnhsfK5spKD4Rhso0KHJ/yr6M+WlIqhiPg/1vUmSNlIpQTgo7Rj34wgWT6iyKKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/EEKomxKm4CcgBighv54AgK/YN5Wbr4Iu85O+9Uhkk=;
 b=ZsiDi/wvyl5UqQZ9ujl3qpF05yN4If4AVgT2R1aFQTTJ7KusrGCurZl9Qm2BCg4xD1HBC2kzrsaSG2XwM58XpDrLBkoRUodGXyL5QowRK0su3B08UzdNqcednPWMG5Jzj8lqf7yENCGOO27ewKsQu3vXhgE6rFmqo5cMN4f5PS9E//Bbv7eypcUh3EDitVk40ZJ1AUTc1sxmRLMvrqNOF08paCxvoZ3Op+aJf5w9wQdkDdR9qdlTaNuC/f8WJxi/dVvZFH8C6WtZ8jbXApdg1yCrP6pAFBYEPWTsSVTboz7bDxOHs6BGHkbwqFBR0be/GjpKAwLKL44qqukpfkbyrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/EEKomxKm4CcgBighv54AgK/YN5Wbr4Iu85O+9Uhkk=;
 b=KAdNCsRKggNopNmDn6k9bAgpkiK7IgcM5i37fRTlv90y0rNvLAaWI/M4n5t7FBTuZ+K6C6QxDZGcQ4sgt5xxvPmdRXOvb9CdgSi2avLrvMr1MZyfVyZP8Mpi++4F9W1Ke6XTURjw0UEy5AkHvVhiwe9211V3hM2wCncrwejiLgE=
Received: from DS3P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:45e::13) by
 MW4PR12MB6779.namprd12.prod.outlook.com (2603:10b6:303:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.17; Thu, 19 Nov
 2026 15:54:43 +0000
Received: from CY7PEPF000000E8.namprd04.prod.outlook.com
 (2603:10b6:8:45e:cafe::5d) by DS3P221CA0011.outlook.office365.com
 (2603:10b6:8:45e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Thu,
 19 Nov 2026 15:54:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY7PEPF000000E8.mail.protection.outlook.com (10.167.247.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 15:54:42 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 09:54:39 -0600
Received: from hwentlanrmb (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 09:54:39 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v1 1/1] tests/kms_colorop: Add Gamma 2.4 and 2.6 tests
Date: Thu, 19 Nov 2026 10:54:32 -0500
Message-ID: <20261119155432.2494029-2-harry.wentland@amd.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119155432.2494029-1-harry.wentland@amd.com>
References: <20261119155432.2494029-1-harry.wentland@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000E8:EE_|MW4PR12MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: c079dfdd-ccfd-40ff-bbe8-08df46556d0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|18002099003|22082099003|261009223027099003|3023799007|56012099006|11063799006|261102123227099003|10067099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: wBoGE8GhRvr3LUBlt8H1H3lpdfZNeGb5lr7bfjkGK/dHL3DibxbGbTOdlUg/bFs9LhPm/I2FYrZvZr5giIb2B5R5sClBEbbqjLfUGf/KVTdnBvsbZxnqHHrhiFnTWwuWZNij4CmdItm/nvgvbXidhcR7/Qeo84ovMzlSvBt7XVKxmiqzO14oTGxGyrU2kRXgzHAup8QUg5JHl9EYkZ2WffD1k4LjSDKSLqBDnlvNoN/e3wTnDzCW3JdryvkVM9UokkswYGh5DuOhWcDd6Rt2A1Om7B2YMYCNCP6PZnBuHC/pKc0Bh1fD0+nMqD6u9nvLLxClif/kQhGeOPp4B44A+C9yGl2GTzP5X2pG3+LFDbjYE+wJoCFdI5LSASuILWy3AX1fgnWMVSsMoFRVSJrZG31mtAPgiCXt1KIjdfQHc2zfwWdzbyd9rj0NXFp451yc3NK5RlWOTmFP7W5ZIeqWS/VUfvdwhXhgH3cboSUqunVOVhRI5Z2UQyjGYGVOPZIucZ0ti5/3HiZ87/cNn7Zm0L3WCQNqlQ1ySSzinHvSszcukSJS8jL+8+gYL2Edmhq5YiPM2xjKn4tY0ZfL5JjSbQar0GG/b8Ox70+j1Bol+A+5wCnBOA/vYUFehriRhCtGoqitEgZFE00a9krd/vd1UXMCV4+N0uyF8uWU9pBX78IOK7AyFUrTxslyEQg8jiKvqYheBSAB1oEfX/R23uvTdA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(18002099003)(22082099003)(261009223027099003)(3023799007)(56012099006)(11063799006)(261102123227099003)(10067099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jsEUhfrE2kXnni64MC9wIxvb6Ukp4itMdcO/934ojQb24Kk/iA6OhS68DtdqmODl8xxOTmzWyuCp4RZS/pnCyL2Q/81o+47uQxf+SfOh39etrPi+pbFqUulttlXqE6DJQOrPU2loGAxXLY5iB0aTNkIiOyrlEH4Ibj/ZcEE2mUdL8n7ueD3iAQAFSruDHoh29ZyPmtcHnFoIbc1J8/nWLHvze1m8fW20+d3GIART8UeLV/YpgiULf9l/BlXJKXGS0vD57Q1pcQAdMm4g2cldKuZH38sWo4UO8K520YV2BI5D1iTuVYAEFMN60zOWXPhO+R13tnd0fqyi6jPUmc2COXfcmLCtula5POM3umSOJNwC5A8AnRiwW3SIcP/d0R89hj6xaTwRHvUk0x49MFY8jTAo3U2TX9xiZ6KorZa72jY55NXhVPZ7llsn3Qyq7liC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 15:54:42.4594 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c079dfdd-ccfd-40ff-bbe8-08df46556d0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY7PEPF000000E8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6779
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

kms_colorop already round-trips Gamma 2.2. A compositor that uses a
2.4 or 2.6 power curve needs the same check.

Tested on Navi 48.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color.c            | 20 +++++++++++++++++++
 lib/igt_color.h            |  4 ++++
 tests/kms_colorop.c        | 18 +++++++++++++++++
 tests/kms_colorop_helper.c | 40 ++++++++++++++++++++++++++++++++++++++
 tests/kms_colorop_helper.h |  8 ++++++++
 5 files changed, 90 insertions(+)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index 582fc6c0c3bc..decc5116e8f8 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -195,6 +195,26 @@ void igt_color_gamma_2_2_inv(igt_pixel_t *pixel)
 	igt_color_powf(pixel, 1/2.2f);
 }
 
+void igt_color_gamma_2_4(igt_pixel_t *pixel)
+{
+	igt_color_powf(pixel, 2.4f);
+}
+
+void igt_color_gamma_2_4_inv(igt_pixel_t *pixel)
+{
+	igt_color_powf(pixel, 1/2.4f);
+}
+
+void igt_color_gamma_2_6(igt_pixel_t *pixel)
+{
+	igt_color_powf(pixel, 2.6f);
+}
+
+void igt_color_gamma_2_6_inv(igt_pixel_t *pixel)
+{
+	igt_color_powf(pixel, 1/2.6f);
+}
+
 static void igt_color_apply_3x4_ctm(igt_pixel_t *pixel, const igt_matrix_3x4_t *matrix)
 {
 	igt_pixel_t result;
diff --git a/lib/igt_color.h b/lib/igt_color.h
index d66cfebc4191..8c598856d8fd 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -114,6 +114,10 @@ void igt_color_bt2020_oetf(igt_pixel_t *pixel);
 
 void igt_color_gamma_2_2(igt_pixel_t *pixel);
 void igt_color_gamma_2_2_inv(igt_pixel_t *pixel);
+void igt_color_gamma_2_4(igt_pixel_t *pixel);
+void igt_color_gamma_2_4_inv(igt_pixel_t *pixel);
+void igt_color_gamma_2_6(igt_pixel_t *pixel);
+void igt_color_gamma_2_6_inv(igt_pixel_t *pixel);
 
 void igt_color_ctm_3x4_50_desat(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_overdrive(igt_pixel_t *pixel);
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 0ccd1acdf06e..e118a9b978a6 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -40,6 +40,12 @@
  * SUBTEST: plane-XR24-XR24-gamma_2_2
  * SUBTEST: plane-XR24-XR24-gamma_2_2-gamma_2_2_inv
  * SUBTEST: plane-XR24-XR24-gamma_2_2-gamma_2_2_inv-gamma_2_2
+ * SUBTEST: plane-XR24-XR24-gamma_2_4
+ * SUBTEST: plane-XR24-XR24-gamma_2_4-gamma_2_4_inv
+ * SUBTEST: plane-XR24-XR24-gamma_2_4-gamma_2_4_inv-gamma_2_4
+ * SUBTEST: plane-XR24-XR24-gamma_2_6
+ * SUBTEST: plane-XR24-XR24-gamma_2_6-gamma_2_6_inv
+ * SUBTEST: plane-XR24-XR24-gamma_2_6-gamma_2_6_inv-gamma_2_6
  * SUBTEST: plane-XR24-XR24-ctm_3x4_50_desat
  * SUBTEST: plane-XR24-XR24-ctm_3x4_overdrive
  * SUBTEST: plane-XR24-XR24-ctm_3x4_oversaturate
@@ -70,6 +76,12 @@
  * SUBTEST: plane-XR30-XR30-gamma_2_2
  * SUBTEST: plane-XR30-XR30-gamma_2_2-gamma_2_2_inv
  * SUBTEST: plane-XR30-XR30-gamma_2_2-gamma_2_2_inv-gamma_2_2
+ * SUBTEST: plane-XR30-XR30-gamma_2_4
+ * SUBTEST: plane-XR30-XR30-gamma_2_4-gamma_2_4_inv
+ * SUBTEST: plane-XR30-XR30-gamma_2_4-gamma_2_4_inv-gamma_2_4
+ * SUBTEST: plane-XR30-XR30-gamma_2_6
+ * SUBTEST: plane-XR30-XR30-gamma_2_6-gamma_2_6_inv
+ * SUBTEST: plane-XR30-XR30-gamma_2_6-gamma_2_6_inv-gamma_2_6
  * SUBTEST: plane-XR30-XR30-ctm_3x4_50_desat
  * SUBTEST: plane-XR30-XR30-ctm_3x4_overdrive
  * SUBTEST: plane-XR30-XR30-ctm_3x4_oversaturate
@@ -448,6 +460,12 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		{ { &kms_colorop_gamma_22_oetf, NULL }, "gamma_2_2" },
 		{ { &kms_colorop_gamma_22_oetf, &kms_colorop_gamma_22_inv_oetf, NULL }, "gamma_2_2-gamma_2_2_inv" },
 		{ { &kms_colorop_gamma_22_oetf, &kms_colorop_gamma_22_inv_oetf, &kms_colorop_gamma_22_oetf, NULL }, "gamma_2_2-gamma_2_2_inv-gamma_2_2" },
+		{ { &kms_colorop_gamma_24_oetf, NULL }, "gamma_2_4" },
+		{ { &kms_colorop_gamma_24_oetf, &kms_colorop_gamma_24_inv_oetf, NULL }, "gamma_2_4-gamma_2_4_inv" },
+		{ { &kms_colorop_gamma_24_oetf, &kms_colorop_gamma_24_inv_oetf, &kms_colorop_gamma_24_oetf, NULL }, "gamma_2_4-gamma_2_4_inv-gamma_2_4" },
+		{ { &kms_colorop_gamma_26_oetf, NULL }, "gamma_2_6" },
+		{ { &kms_colorop_gamma_26_oetf, &kms_colorop_gamma_26_inv_oetf, NULL }, "gamma_2_6-gamma_2_6_inv" },
+		{ { &kms_colorop_gamma_26_oetf, &kms_colorop_gamma_26_inv_oetf, &kms_colorop_gamma_26_oetf, NULL }, "gamma_2_6-gamma_2_6_inv-gamma_2_6" },
 		{ { &kms_colorop_ctm_3x4_50_desat, NULL }, "ctm_3x4_50_desat" },
 		{ { &kms_colorop_ctm_3x4_overdrive, NULL }, "ctm_3x4_overdrive" },
 		{ { &kms_colorop_ctm_3x4_oversaturate, NULL }, "ctm_3x4_oversaturate" },
diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index 388b990ca4ff..41c3b95fab49 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -17,6 +17,10 @@ const char * const kms_colorop_lut1d_tf_names[KMS_COLOROP_LUT1D_NUM_ENUMS] = {
 	[KMS_COLOROP_LUT1D_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
 	[KMS_COLOROP_LUT1D_GAMMA_2_2_OETF] = "Gamma 2.2",
 	[KMS_COLOROP_LUT1D_GAMMA_2_2_INV_OETF] = "Gamma 2.2 Inverse",
+	[KMS_COLOROP_LUT1D_GAMMA_2_4_OETF] = "Gamma 2.4",
+	[KMS_COLOROP_LUT1D_GAMMA_2_4_INV_OETF] = "Gamma 2.4 Inverse",
+	[KMS_COLOROP_LUT1D_GAMMA_2_6_OETF] = "Gamma 2.6",
+	[KMS_COLOROP_LUT1D_GAMMA_2_6_INV_OETF] = "Gamma 2.6 Inverse",
 };
 
 const char * const kms_colorop_fixed_matrix_names[KMS_COLOROP_FIXED_MATRIX_NUM_ENUMS] = {
@@ -150,6 +154,42 @@ kms_colorop_t kms_colorop_gamma_22_inv_oetf = {
 	.transform = &igt_color_gamma_2_2_inv
 };
 
+kms_colorop_t kms_colorop_gamma_24_oetf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_GAMMA_2_4_OETF
+	},
+	.name = "gamma_2_4",
+	.transform = &igt_color_gamma_2_4
+};
+
+kms_colorop_t kms_colorop_gamma_24_inv_oetf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_GAMMA_2_4_INV_OETF
+	},
+	.name = "gamma_2_4_inv",
+	.transform = &igt_color_gamma_2_4_inv
+};
+
+kms_colorop_t kms_colorop_gamma_26_oetf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_GAMMA_2_6_OETF
+	},
+	.name = "gamma_2_6",
+	.transform = &igt_color_gamma_2_6
+};
+
+kms_colorop_t kms_colorop_gamma_26_inv_oetf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_GAMMA_2_6_INV_OETF
+	},
+	.name = "gamma_2_6_inv",
+	.transform = &igt_color_gamma_2_6_inv
+};
+
 kms_colorop_t kms_colorop_ctm_3x4_50_desat = {
 	.type = KMS_COLOROP_CTM_3X4,
 	.matrix_3x4 = &igt_matrix_3x4_50_desat,
diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
index 4392386eaa16..fee9f2250760 100644
--- a/tests/kms_colorop_helper.h
+++ b/tests/kms_colorop_helper.h
@@ -37,6 +37,10 @@ typedef enum kms_colorop_lut1d_tf {
 	KMS_COLOROP_LUT1D_PQ_125_INV_EOTF,
 	KMS_COLOROP_LUT1D_GAMMA_2_2_OETF,
 	KMS_COLOROP_LUT1D_GAMMA_2_2_INV_OETF,
+	KMS_COLOROP_LUT1D_GAMMA_2_4_OETF,
+	KMS_COLOROP_LUT1D_GAMMA_2_4_INV_OETF,
+	KMS_COLOROP_LUT1D_GAMMA_2_6_OETF,
+	KMS_COLOROP_LUT1D_GAMMA_2_6_INV_OETF,
 	KMS_COLOROP_LUT1D_NUM_ENUMS
 } kms_colorop_lut1d_tf_t;
 
@@ -106,6 +110,10 @@ extern kms_colorop_t kms_colorop_pq_125_eotf_2;
 extern kms_colorop_t kms_colorop_pq_125_inv_eotf;
 extern kms_colorop_t kms_colorop_gamma_22_oetf;
 extern kms_colorop_t kms_colorop_gamma_22_inv_oetf;
+extern kms_colorop_t kms_colorop_gamma_24_oetf;
+extern kms_colorop_t kms_colorop_gamma_24_inv_oetf;
+extern kms_colorop_t kms_colorop_gamma_26_oetf;
+extern kms_colorop_t kms_colorop_gamma_26_inv_oetf;
 extern kms_colorop_t kms_colorop_ctm_3x4_50_desat;
 extern kms_colorop_t kms_colorop_ctm_3x4_overdrive;
 extern kms_colorop_t kms_colorop_ctm_3x4_oversaturate;
-- 
2.56.1

