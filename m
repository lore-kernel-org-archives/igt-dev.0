Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA99C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:44:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E310710E79D;
	Wed, 26 Mar 2025 23:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rnmX67h5";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A1D10E79E
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:44:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBMmP/hyENP86T5WuEbH9aWBAL8d3d0x4zuwFmoC77vtPURdRakOtUx/nGFKeq7nQttWhnvo++w97DjwuRqgIWyakiAMHVYDY6250RBGsHzT/YumX84TD8B01tZ55LTdDWfDXSkXLsCyyX2AGIcJfSFhqMixn16FEI/DQ7rx8A8NMgjAWpAv3Rq7jIIAAt6F4S+0V2LPp7APepY87uSpF8i/eUwTMj0IDqVXxHqWNjbkyKj6xbPNEut1U7L3YrfOqpG40H/YUQ3Yb1lHrR04o21bviO0HL9TZB5Qu4zyENo82HaoVOQm1WfeqdRDPf4xSkpXk/p5Asf4X/fWu1QX6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LiWiNAgRUFHVRzvTZawtB+myI8z3A4h708jRiCwKGHs=;
 b=IdC6+aYCHmI1GE+APLXbkoVqUtg0QjN+iiMfm6YMf5PkFmPWfCFpLmVHDtgxUI0+sW+b7eu1zyfQ1iyNIfFEKqJjf1EZrf7mGWCX18YD3uS3dJzHHURfbgKqY8nT7Lg6d+Ki0TRcX9IB9DgriAOHjoHLkmOFI31OtwyxDsFi0/XrVcCVdHGvJbQ3N2WsOYfctwOUxPGDfrwL0xzeedp43acSd0RuqIlXao/nGvexygmht7aEmFtiQgTxqABcaaIBWQ4vtJwbpzP7S2+AIFo8j/kOEe9EUe3Snoukyw9C+y50v6t9h5pe7T8ZSbTtXC8dSIw+BZEjyj9KPKXDNT+FGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LiWiNAgRUFHVRzvTZawtB+myI8z3A4h708jRiCwKGHs=;
 b=rnmX67h54YmFiUM8T+YLMmfKKyMcbOnd6clfr1hqWZdDquyOyYm4Kprj85b/9YSauzqnIGrNXTsuW8nyWX95CwUeYuWRVzcb2OzqgdJX5WqMmmWDFSOY69f6/T3oWmtmFVKQvFT6bK2Ut5AytmtLMaKFTECrnkuS7VvPRVf1cAs=
Received: from BL1PR13CA0404.namprd13.prod.outlook.com (2603:10b6:208:2c2::19)
 by CH1PPF73CDB1C12.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::615) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:44:21 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:2c2:cafe::2e) by BL1PR13CA0404.outlook.office365.com
 (2603:10b6:208:2c2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.26 via Frontend Transport; Wed,
 26 Mar 2025 23:44:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:44:20 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:44:20 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 24/37] lib/igt_color: Add PQ variants for 0-1 and 0-125
 range
Date: Wed, 26 Mar 2025 17:35:56 -0600
Message-ID: <20250326233609.2980110-25-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326233609.2980110-1-alex.hung@amd.com>
References: <20250326233609.2980110-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|CH1PPF73CDB1C12:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d46a3f-8f09-4d89-82df-08dd6cc0219c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?huE4tRnbw+3dxLugEiugk8AVbxTrCr4yfFvN65GMr/8ZO5GWF3nPIj8zuQkG?=
 =?us-ascii?Q?3yADD1cspiH/z9w95mRfOMFY3NvvIpHALZ8qnEZW2zKM/UrzLd1Weyp4piww?=
 =?us-ascii?Q?Lg1KGdS7BZFlkIicMmG1vwYams9r+f/+BKjIFxvj1EO2B7Hp7jYAyh3ry1jH?=
 =?us-ascii?Q?ES/uS1v9bj4C+RSfLtzFJTKt7LVhbvzu9LnzrFzmseVFMd/XnblK+GSjCTL2?=
 =?us-ascii?Q?Ko8/2tynYxKBD7VYXNsAi+i+iagQNZ09hytmZYGlNpK88ZAuTbyLQj1+4jB/?=
 =?us-ascii?Q?dSH+3cWTG35j6Rd3QAOb9ZchUFN92Yld7iMo1TNQh0fNBlIeqww+ix9MhKOe?=
 =?us-ascii?Q?pin1lS0GbeDHZwfwYC+Ce66mh5F22pHe0JpuXtG3bfUs+KcjvUJHcJOYN562?=
 =?us-ascii?Q?S3AKKr0hrjf6P/VawWmYNdD5ZP48uSXnsKeIYX+Gnc37MRvQkhljTdZS2lxT?=
 =?us-ascii?Q?U9wK29XK4lr0aZYC+z7gDvjokAuxn5bjBlfHG0UXtQcyLpCH/xxtCqistI0P?=
 =?us-ascii?Q?w17nh50P+F2LvzezoFdzW2/2xZ/fe7rS1ynA0AkiCcLkCRUVXupJL9StCzI2?=
 =?us-ascii?Q?ktb5iX7HLfcLT1FpU6FQC3YDg0oxltxWJCjF3eTgxvzTTkOLBJP4+IeGb1Yi?=
 =?us-ascii?Q?ua0rlBuOepLZJK2tLPqTsOXeegalUY/W/Wpn3cxpjyf9hCBexcpG/eCKreEt?=
 =?us-ascii?Q?uPvBO+7uhnF73d6elAYU4A/S+YfvEy+yKhWyoRVLvZbnK2FMD8Fu7cx8NDPN?=
 =?us-ascii?Q?zowahrQEopcELDdxTY8Jwsp2eNZFJF2WNyXAtfVEw9ldAo0UH76ryA2MYGHo?=
 =?us-ascii?Q?JBFguSup6nbxrhbqY0bXSx+zK8EtgqRGiWuco+R4kVSg3b0G7FZjGFOcmWkX?=
 =?us-ascii?Q?HMWWpGcF5JwLXumc9npFWBOzfqHrKJ3Cv4eepgcSlfpfeV0Poe87/GGeexKa?=
 =?us-ascii?Q?w59tqE/dfFoea9DrWARqgo+/tfcH5Lj0CEh15anageJCwx9KvsnCj4/RK7Je?=
 =?us-ascii?Q?g5AxZhAzXDnZGO/RtA79DkLIKn7TtsCiMPBUQyTJPbBL0Sd8nT75WD7SmBhC?=
 =?us-ascii?Q?0ukeMrJ2haNeMDmlui0vWCD5npnbubUlMJsZEBgQyHxvgob1AbgcsywbmXDe?=
 =?us-ascii?Q?Y4nnOPTv6RAPimZfdSQ5AwhrtPyQYywdB74lROtuHG2zGadP7N19sREBR5u0?=
 =?us-ascii?Q?FtyyRKaULFUBm8F8ACXeRp4VEP35rwkCTwT8uN7TZ3D7g3923N9rbH0yu1NM?=
 =?us-ascii?Q?DFdRNF1Jr/PsYjABoUcQg4eRE7ApjGHoDVzq/3A4JvMDUE4DzjVZTd6B48Fd?=
 =?us-ascii?Q?rspMXNwxEnOs7EyPeV5qqQcBh9Nr2bmrKOuKV/lhKXt2fDzme9jtcaYVyd7T?=
 =?us-ascii?Q?3ZEGLOkA8xvJmePHUr+/hL2mCI8EL55Ndk5t8o4cXsQtjCsiNFXFRC7ZiJBP?=
 =?us-ascii?Q?BJkrJ53R3jFbEaKttLA2eYnTDlLBhXXJAuH+Oe1QPZm5vpcmiH641J5KepO8?=
 =?us-ascii?Q?46LSnf3vHmXJxDA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:44:20.9435 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d46a3f-8f09-4d89-82df-08dd6cc0219c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF73CDB1C12
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
 lib/igt_color.c | 79 +++++++++++++++++++++++++++++++++++++++++++------
 lib/igt_color.h | 13 ++++++++
 2 files changed, 83 insertions(+), 9 deletions(-)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index 43179a17e..0926385f4 100644
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
 {
-	struct igt_color_tf inv;
+	return powf(fmaxf(pq->A + pq->B * powf(x, pq->C), 0)
+		       / (pq->D + pq->E * powf(x, pq->C)),
+			    pq->F);
+}
 
-	tf_inverse(&srgb_eotf, &inv);
+static void pq_inv(struct igt_color_tf_pq *inv)
+{
+	inv->A = -pq_eotf.A;
+	inv->B = pq_eotf.D;
+	inv->C = 1.0f / pq_eotf.F;
+	inv->D = pq_eotf.B;
+	inv->E = -pq_eotf.E;
+	inv->F = 1.0f / pq_eotf.C;
+}
 
-	pixel->r = igt_color_tf_eval(&inv, pixel->r);
-	pixel->g = igt_color_tf_eval(&inv, pixel->g);
-	pixel->b = igt_color_tf_eval(&inv, pixel->b);
+static void igt_color_tf(igt_pixel_t *pixel, const struct igt_color_tf *tf)
+{
+	pixel->r = igt_color_tf_eval(tf, pixel->r);
+	pixel->g = igt_color_tf_eval(tf, pixel->g);
+	pixel->b = igt_color_tf_eval(tf, pixel->b);
 }
 
+static void igt_color_inv_tf(igt_pixel_t *pixel, const struct igt_color_tf *tf)
+{
+	struct igt_color_tf inv;
+
+	tf_inverse(tf, &inv);
+	igt_color_tf(pixel, &inv);
+}
 
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
index d218550f6..a97383fab 100644
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
2.43.0

