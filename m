Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C8AC48BF6
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7698910E6DC;
	Mon, 26 Feb 2024 21:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RafDAGsL";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643E610F299
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7O9HgbUysKJX7wHxyqH4suaRdL2lNCQRenZ9/SQJ0h6EXdrLpGsfD3Tth7a4bCvf4XVh0MLVJjcu++NRBKAX/btpECvmpbAhXZICFGOL7PXOxQ9onDnnX516+Q1NFp7xfiILpxbm+bl6aNNijwG8fKNW/W2ROp7uFD3vhJI5q8e7nWQsEoFHdvxUCPYvM8l6Vib1kEAwDZys1tnJCsRP7ctLi+rvCLmMlu4xkr0SUOu4shJLbM7KI4flP9/M496C8xC3q5BN3lNbPr9qZDQX9kCkic48pL98WZY04IceVzRqMngbzbeH/ImxSvXxvQpdYL/CF1iSAhSyB4nuUlVVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMTQyI2jQqh9H/xyGbeo8oWU7wKdDJZgwfXPIvN4DYU=;
 b=L9Hmu8cCQ8rz0h6UbRkcpqdeCGv8pK+DZRaLR9Y+B5KUzkd2CQLY86vXpdF3Gx8xeS/B3XULtx87lIT1OC7qzHaOYuRroM2YeAR50IjzTKJq0UTNuptxO8ONOIcOPLDbM3DFBD+ZRPRfQkwVq27QRXwHycQZL1uik6qHAp2dSF+bYOLyJR6c0XwMHNLPw5Gopso/Zf07DWZYgRgdk0hh3ximvenIGOVSiIu3mt6Ha2DgVyQS4uzZpfP+XzfarErhtAbpjD4HmIrPiiF5IA4YBNe5TNNPsDDTBQsr5O+5zIonKh9I15nZGr9ZSQexL1jR7C73qTdhbXTv07kdFzwAcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMTQyI2jQqh9H/xyGbeo8oWU7wKdDJZgwfXPIvN4DYU=;
 b=RafDAGsL/SU1O1Br6x/i+OrZNi/v1JqdMoUXjgycQvXy2Ih7EG2kOOjTMPOUQFLcURl738nbtmbC+yeosuGG+CIdkj5O1HTHwgHkpOjv2g7Bh6RQw59fMcbNNHc6eWQ4dcsZbfGJC6PZG9tf3UpNwys0HXnvAmt5yPIBq6Tq/jQ=
Received: from MN2PR15CA0026.namprd15.prod.outlook.com (2603:10b6:208:1b4::39)
 by CY5PR12MB6226.namprd12.prod.outlook.com (2603:10b6:930:22::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.33; Mon, 26 Feb
 2024 21:14:42 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:1b4::4) by MN2PR15CA0026.outlook.office365.com
 (2603:10b6:208:1b4::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:42 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:41 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:41 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:41 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v5 24/32] lib/igt_color: Add PQ variants for 0-1 and 0-125
 range
Date: Mon, 26 Feb 2024 16:14:08 -0500
Message-ID: <20240226211416.100660-25-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211416.100660-1-harry.wentland@amd.com>
References: <20240226211416.100660-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|CY5PR12MB6226:EE_
X-MS-Office365-Filtering-Correlation-Id: 0affbb9a-4846-4c2d-b84a-08dc370ff325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KTdzwgxrJpbnPUZSdBdfadJINUMgxXWN6bXlaCp7YuN3xjWuIzJFVpcr96+ovTf/1QVbwU5uj54LSnUWSkxHumhpIkJ+HYFlE0XaVosIpgafkiq9Zopl9/UumXx/O84iE7zNKKhk50RQ0WJVVfMKwtbHjPoHvvFBK6rjjOC51c8d/u39haUWefLW4qwLP1+WWKzQf6FDolQOvSbDey4cIFB0OCL9xhtBnyPXXIa0qKBtohdcgfjj1ZV9JogwgLi9hn0+2VoLtgwUUtZ4672Wvw1S+IzfnpLbKQV8R4dgC68O1aEWTYKZo/6m9LkGKtGYqkJcZmPXEBBgfRdt+2k+2BOLN/98ns0pFBf/ZKchTW/dEyZ/+OzXg9cKNYGWaL8qMi5a4U2CcII1Cn+7sT4fpoJURXCZYEo0OW2qPUsL5eDY+yf6Ui+xG8J0KV/FdTdrtYpEcs7J9b/8Mi1iay/42ddyiGGyopiqHMY/7QWszHHJctQRTNgyWffPRgkvrOZj/FkqqzO9vMSeoi7cDcUIYAu/tVmTuzxgchtBrTjuoqy6WoZLJvUL++j6mYFxK+fohwcd89WYyDJLY52stKFVNt4DtdKKYI/GOtgydr8QY/XAzaZ1s2BZYFi8gcWkzcPFV14McZ0UpAiQdmRnfOtCGKdARUJ9hVrX87FWpn/uuhbunL3jUEJA+De8QNUZc2am9h64En1GwZAqNApVmTVedxq9b7DIS7DwDFxYlEeMg+ICRDo4BgO1zQ1DLCM9enUF
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:42.2515 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0affbb9a-4846-4c2d-b84a-08dc370ff325
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6226
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

Add PQ SW transforms. The most obvious to do the PQ EOTF
is to transform [0.0, 1.0] non-linear values to [0.0, 1.0]
linear values, and same in the inverse. So we add transforms
that do this.

Some HW (like AMD's) has scaling baked into the PQ EOTF
and will scale [0.0, 1.0] non-linear values to [0.0, 125.0]
linear values when applying the PQ EOTF. The inverse will
take [0.0, 125.0] linear values and output [0.0, 1.0]
linear values. We're adding a transform that can handle
this variant as well.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color.c | 81 +++++++++++++++++++++++++++++++++++++++++++------
 lib/igt_color.h | 13 ++++++++
 2 files changed, 84 insertions(+), 10 deletions(-)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index 43179a17e41b..0926385f4d82 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -20,6 +20,13 @@ static float clamp(float val, float min, float max)
 	return ((val < min) ? min : ((val > max) ? max : val));
 }
 
+static void igt_color_multiply(igt_pixel_t *pixel, float multiplier)
+{
+	pixel->r *= multiplier;
+	pixel->g *= multiplier;
+	pixel->b *= multiplier;
+}
+
 static float igt_color_tf_eval_unclamped(const struct igt_color_tf *fn, float x)
 {
 	if (x < fn->d)
@@ -51,24 +58,78 @@ static void tf_inverse(const struct igt_color_tf *fn, struct igt_color_tf *inv)
 	}
 }
 
-void igt_color_srgb_inv_eotf(igt_pixel_t *pixel)
+static float pq_eval(const struct igt_color_tf_pq *pq, float x)
+{
+	return powf(fmaxf(pq->A + pq->B * powf(x, pq->C), 0)
+		       / (pq->D + pq->E * powf(x, pq->C)),
+			    pq->F);
+}
+
+static void pq_inv(struct igt_color_tf_pq *inv)
+{
+	inv->A = -pq_eotf.A;
+	inv->B = pq_eotf.D;
+	inv->C = 1.0f / pq_eotf.F;
+	inv->D = pq_eotf.B;
+	inv->E = -pq_eotf.E;
+	inv->F = 1.0f / pq_eotf.C;
+}
+
+static void igt_color_tf(igt_pixel_t *pixel, const struct igt_color_tf *tf)
+{
+	pixel->r = igt_color_tf_eval(tf, pixel->r);
+	pixel->g = igt_color_tf_eval(tf, pixel->g);
+	pixel->b = igt_color_tf_eval(tf, pixel->b);
+}
+
+static void igt_color_inv_tf(igt_pixel_t *pixel, const struct igt_color_tf *tf)
 {
 	struct igt_color_tf inv;
 
-	tf_inverse(&srgb_eotf, &inv);
-
-	pixel->r = igt_color_tf_eval(&inv, pixel->r);
-	pixel->g = igt_color_tf_eval(&inv, pixel->g);
-	pixel->b = igt_color_tf_eval(&inv, pixel->b);
+	tf_inverse(tf, &inv);
+	igt_color_tf(pixel, &inv);
 }
 
-
+static void tf_pq(igt_pixel_t *pixel, const struct igt_color_tf_pq *pq)
+{
+	pixel->r = pq_eval(pq, pixel->r);
+	pixel->g = pq_eval(pq, pixel->g);
+	pixel->b = pq_eval(pq, pixel->b);
+}
 
 void igt_color_srgb_eotf(igt_pixel_t *pixel)
 {
-	pixel->r = igt_color_tf_eval(&srgb_eotf, pixel->r);
-	pixel->g = igt_color_tf_eval(&srgb_eotf, pixel->g);
-	pixel->b = igt_color_tf_eval(&srgb_eotf, pixel->b);
+	igt_color_tf(pixel, &srgb_eotf);
+}
+
+void igt_color_srgb_inv_eotf(igt_pixel_t *pixel)
+{
+	igt_color_inv_tf(pixel, &srgb_eotf);
+}
+
+void igt_color_pq_eotf(igt_pixel_t *pixel)
+{
+	tf_pq(pixel, &pq_eotf);
+}
+
+void igt_color_pq_inv_eotf(igt_pixel_t *pixel)
+{
+	struct igt_color_tf_pq inv;
+
+	pq_inv(&inv);
+	tf_pq(pixel, &inv);
+}
+
+void igt_color_pq_125_eotf(igt_pixel_t *pixel)
+{
+	igt_color_pq_eotf(pixel);
+	igt_color_multiply(pixel, 125.0f);
+}
+
+void igt_color_pq_125_inv_eotf(igt_pixel_t *pixel)
+{
+	igt_color_multiply(pixel, 1/125.0f);
+	igt_color_pq_inv_eotf(pixel);
 }
 
 static void igt_color_apply_3x4_ctm(igt_pixel_t *pixel, const igt_matrix_3x4_t *matrix)
diff --git a/lib/igt_color.h b/lib/igt_color.h
index d218550f6dd0..a97383fabaf3 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -19,8 +19,15 @@ struct igt_color_tf {
     float g, a,b,c,d,e,f;
 };
 
+struct igt_color_tf_pq {
+	float A, B, C, D, E, F, G;
+};
+
+
 const struct igt_color_tf srgb_eotf = {2.4f, (float)(1/1.055), (float)(0.055/1.055), (float)(1/12.92), 0.04045f, 0, 0};
 
+const struct igt_color_tf_pq pq_eotf = {-107/128.0f, 1.0f, 32/2523.0f, 2413/128.0f, -2392/128.0f, 8192/1305.0f };
+
 typedef struct igt_pixel {
 	float r;
 	float g;
@@ -104,6 +111,12 @@ void igt_colorop_set_ctm_3x4(igt_display_t *display,
 void igt_color_srgb_inv_eotf(igt_pixel_t *pixel);
 void igt_color_srgb_eotf(igt_pixel_t *pixel);
 
+void igt_color_pq_inv_eotf(igt_pixel_t *pixel);
+void igt_color_pq_eotf(igt_pixel_t *pixel);
+
+void igt_color_pq_125_inv_eotf(igt_pixel_t *pixel);
+void igt_color_pq_125_eotf(igt_pixel_t *pixel);
+
 void igt_color_ctm_3x4_50_desat(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_overdrive(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_oversaturate(igt_pixel_t *pixel);
-- 
2.44.0

