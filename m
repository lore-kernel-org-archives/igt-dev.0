Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B730C54E56
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7184910F2A2;
	Mon, 26 Feb 2024 21:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="M484LeDE";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87F410F297
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRXlpziEmmuR2BpnXeLrQOBI8clY914N8cuKvor+D3VehYX4cZEfdjhmk4S59Uc+S5sHD4xBBeND1msCPxNFTOnDdWNmQGOyMe2eZQMuVu/1D9SxIx96f1PIDq+87t9MvS3gcvRAoya+G8u5ggcadHXslLyZnv3Te7nYc+mJcVMau+iv9eQfWJpX4/fH5e4XYYlqcHAOkaTyjX6aMvoufDdAR8bBd8wvcMjmlnxJlbVilOxbVdvk7dYIl8VDJJjMX0n/EcHersa6ZYnnhGeIEvMWJma3+HiClUqoFar/1fOFRepO8EpOIHej/obysxGYws9rnePz5woj0Btd0d+HIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5MxeCISiEPivBgSJVoTzFH5abMihWTPRUGQLkwO0No=;
 b=QbJCbydiCQynbH21HXXXfzxIhMGGZeSqhrEDaghtCJfJN/sR8NT7Jjo7KF9VhuCnMvujSxFv7++uNft7IHunDJ/76RK+DRPEjtmPkP8CQLyR2hkGXxQ+jkjY6pe2Gx2M1F+s5/MA5wBmLnsyDI6dr3ABzDVpDVpCB6aTqeGapslt03nhRFUVzdP+A+uc22NA3j017hlIHiRsg2FKHtGoaqf26qnJHgYuQWtvGb16OC9xn7PzH5QjXjg4xEe5hO8K06soMldmXlYgYsOvVhH4xqIXzTMp8TSa2/qC6ckWk22IxAG/JXURU2UpPzRpNhQvDccaoKyjo2Sw/rCixftJJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5MxeCISiEPivBgSJVoTzFH5abMihWTPRUGQLkwO0No=;
 b=M484LeDESSTVJQS9KAxO8ZupgV+ipc6PrE4mS6RQZgO9RqQyjjNeAHPes+JZbch1b+LCreT9myCWsotJdOSRHBjKJEraBGMoLruMozvww8aOUqS19B7R9uJR0ZGSqP3w0/q2nKiB2CVF1U383m2f4a81+JYKSDKEKaBwtYPohG8=
Received: from MN2PR16CA0003.namprd16.prod.outlook.com (2603:10b6:208:134::16)
 by DM6PR12MB4530.namprd12.prod.outlook.com (2603:10b6:5:2aa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:14:46 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:134:cafe::f1) by MN2PR16CA0003.outlook.office365.com
 (2603:10b6:208:134::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:45 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:45 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 13:14:44 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:44 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v5 31/32] test/kms_colorop: Add tests that exercise the 1D
 LUT colorops
Date: Mon, 26 Feb 2024 16:14:15 -0500
Message-ID: <20240226211416.100660-32-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211416.100660-1-harry.wentland@amd.com>
References: <20240226211416.100660-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|DM6PR12MB4530:EE_
X-MS-Office365-Filtering-Correlation-Id: efcc64fa-2476-42cd-c7bd-08dc370ff54e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RzTWITq9Pemti/loVqIHEbArLr512a3n32ZTyNJ3uDR0NpqQVA1VxLe9MBzI2tGqF2zCdSJADutnjZnb2D9GIwlRBid6SuPy94zmAtg8neRO5Snf3YCR4y2Lq/yZpKZOLk0wkZwyAlYX/HgffKHtVtwpRQKO1CNcMNg/VnCpJiizh7OVo7QiMDLAAb8PmRFgLTl5s+YrEs81uGdI76m/ULCyXSfbrUq3q1DbsRMHxFcPMYdQAFeUmhuuqs+6KfH52G5+1+y9wHhGXkbImeIppKxcwe6coHQc9Clnwzp02jOeGYPKETMHqx4/WeFDGGA78awUIj/ltbqWIhopIG4jAag7A8E9hRG4/JGuAigS1inQqODR0WKOhUQBEEg2CUkMKpZSey/Vov9UO18R8EuQny+HsaXTE/ej3oGZ6agyMArB21P/IFljN0DYXNCaLpk3vrMCKnSyBJBjE8wpxxccte4uBl8SHNu4la92Dbaay0iylpWjMDAx/BG0WnUOLpQ/vLBUf6izWdxj5zyw4Gx9s1EJwYRSo+XQGfiZsIxj2Dozv630iENW8V6JMsXvIe4y6Mrbb5V8ch8m+9H5t7fCb8Xw5CwLR5ypwZIASunpUd2vs7pTN7VOoWCU+AnCIGPxvdv6aqz7gXbjzFlNdT3WCBf0bRfjoFXdn3FOJGWoTk9fz3IZcvvzYSCAtqMwvOYLMhwKiQd6HRoJGHv1nYqcakrPfjpimFRjIxseLtcaH4I+FAoXEso+iAtQl/g/dDyI
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:45.8917 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efcc64fa-2476-42cd-c7bd-08dc370ff54e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4530
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

We'll use the sRGB EOTF and its inverse for convenience.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 35 +++++++++++++++++++++++++++++++++++
 tests/kms_colorop.h | 15 +++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 83614fc08d31..8ce5a87f0f3f 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -50,6 +50,8 @@
  * @srgb_inv_eotf:              	sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf:    	sRGB EOTF -> sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf-srgb_eotf:  sRGB EOTF -> sRGB Inverse EOTF -> sRGB EOTF
+ * @srgb_inv_eotf_lut:              	sRGB Inverse EOTF Custom LUT
+ * @srgb_inv_eotf_lut-srgb_eotf_lut:	sRGB Inverse EOTF Custom LUT -> sRGB EOTF Custom LUT
  * @bt2020_inv_oetf:			BT.2020 Inverse OETF
  * @bt2020_oetf:			BT.2020 OETF
  * @bt2020_inv_oetf-bt2020_oetf:	BT.2020 Inverse OETF > BT.2020 OETF
@@ -231,6 +233,9 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 	case KMS_COLOROP_CTM_3X4:
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_CTM_3X4);
 	case KMS_COLOROP_CUSTOM_LUT1D:
+		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_LUT)
+			return true;
+		return false;
 	case KMS_COLOROP_LUT3D:
 	default:
 		return false;
@@ -298,9 +303,33 @@ static igt_colorop_t *get_color_pipeline(igt_display_t *display,
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
 
@@ -313,6 +342,10 @@ static void set_colorop(igt_display_t *display,
 		igt_colorop_set_ctm_3x4(display, colorop->colorop, colorop->matrix_3x4);
 		break;
 	case KMS_COLOROP_CUSTOM_LUT1D:
+		fill_custom_1dlut(display, colorop);
+		lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
+		igt_colorop_set_custom_1dlut(display, colorop->colorop, colorop->lut1d, lut_size * sizeof(struct drm_color_lut));
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
index 7b98198f6430..13d15ea6637d 100644
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
2.44.0

