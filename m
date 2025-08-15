Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDADCA0EE0
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:10:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC52D10E9F8;
	Fri, 15 Aug 2025 04:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="N8Xj81F+";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B34B10E9F8
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:10:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOq31kgPI5t6aDqSt9MJj/sOOoac4kRyyW6Oeu3uNcwEm0lMCX1AhAN9Hpsr9dVWAwzABwxlG08VNAGkwpFhK4+F0aNJTbtNRvIfAbXFjjzQFnR5huEVpTEpLllzIeWWduzCFAL9PbGfFsh741xFFJxfSrEmyrEnpjxx7MLg3EGn8LS3nDGFw+RGGdtqzI1gM3Y3CSQ6wbCOfxdtn+dvZGSH3Icd8CcWl27huJixvIieMJZhtfuztt0dJG+t3eNaBTNAxQVDOzcSN+Gt3i3Nj3wo9gr5qhHSwPSfmPvpv+2OisrgHV0hw4t5VwlVMe2RC0YUW/3pA9ZAh/C7y+Vtnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLaZbr+8UTVWnXhF7dvjOPR3Tt0IL77mq9DlaoPLsTA=;
 b=LsDhCTDmib+6LCDOCJjfpVb4bzz+avQFpnLhG2xXLyo+HSmsCEQew3ToaMyhV2ba8/INw0C5ZmRca+zsVIlw7ohVMMLNvRogXrfItBXldz/ykikRli8DSxJ0r4+owfnoXTouwZC5SOH8Hwy7gtxGHPbzmty2ERhQ112ojIf9SX36w+iqTAxwQoiSGXC1L2e++kQrer//7dluBgCY2AzWRGGhjid9IQw3xuvSCZiHQsacSjRNdwfvlef2eKAoPxgXraEV7OhGNp2uZK9KhVDZayhi/EL8lnCrbYQM6phDZFuHdiMGQIh/H+mdHQRYQ8WXGkQN6di1Sz2+bgKPNdvWjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLaZbr+8UTVWnXhF7dvjOPR3Tt0IL77mq9DlaoPLsTA=;
 b=N8Xj81F+5rzByAFhcGD/MR8i8wBUx6Xg57iVN3bcrg9hCxzyxc2XPJP/sEaHYxrHtCEnuAdnEey2tsDfoCJZY+aKzxj0JfYvsfpDoh2v1YzCkd2WIxXbBbw2CaLlbJU3oou9PVMH9fvv7D2NOv5xnDTZfddwoSx2jmIEdAkPjcA=
Received: from BYAPR21CA0027.namprd21.prod.outlook.com (2603:10b6:a03:114::37)
 by IA1PR12MB7760.namprd12.prod.outlook.com (2603:10b6:208:418::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 04:10:52 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::99) by BYAPR21CA0027.outlook.office365.com
 (2603:10b6:a03:114::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.7 via Frontend Transport; Fri,
 15 Aug 2025 04:10:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:10:51 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:10:50 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 18/30] lib/igt_color: Add PQ variants for 0-1 and 0-125
 range
Date: Thu, 14 Aug 2025 22:06:47 -0600
Message-ID: <20250815040659.3321102-19-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|IA1PR12MB7760:EE_
X-MS-Office365-Filtering-Correlation-Id: e23802a4-0b12-4fa2-2846-08dddbb1b8e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u58uE50182W3l7v7QwIRM74iIdAvMJJ7wZJ2iRHeaFqTVL+x4EqYjBsLKFc8?=
 =?us-ascii?Q?OGGCEAQ9zOa3GfovKU9wh3QOwsJZOgB+lFMQYwPDEWW2ouqt9fGNUnv/LQa5?=
 =?us-ascii?Q?CHHrnH0DyoolU8wQALEh3rw4OvYlC9gif4kjSfk8lTomWk5m9dcjnZg34yyc?=
 =?us-ascii?Q?ppEqAkzwLdYbe4+CXxxBoxUrBc+bfBmempH+Bkku70LntcE7ZeMO6kGIc3Do?=
 =?us-ascii?Q?SHuSh5NMJVCItigXfq6MbFyynYzBkg9ciR8nR4DqA2r8IxenWW6HncJX9Ll5?=
 =?us-ascii?Q?nNJadkeaS8VyqJYt61znWwlSFnBEUewFupuaR/m93lilwaedl0zEXJ0OhvTY?=
 =?us-ascii?Q?NFKzMWTs+8FiJBLvT06GUxvdzDjSHW8ES8Zx8W8PtHvIj5CHkY+Ye4VebGVG?=
 =?us-ascii?Q?BzAuKhXoTDUllm5pqADMgAN1D9/FCwvRz6xC2HKK+oiYlg8lE/xnD1FNn5Mt?=
 =?us-ascii?Q?sr760KyZQujy22jGauaN6H4asaFs0EdvI7H7pKYNC3Sg74mq3y43ure5g8oj?=
 =?us-ascii?Q?yuzrcD/czpksFqtfuCpBi9czn5inJn0Y3q/eItFMEnqp5fxt7gHwd8WEXFnS?=
 =?us-ascii?Q?r7HgYYaSCTUMpIk91jnN6NcXYR8gByIYGDrO1mNDxx3rmQ4UK0Q3weW6321n?=
 =?us-ascii?Q?eJcMvGXY0RFAr/+ww0W2fnBQy5kiagvDPQNkehx63tKsEohSv6zygfE3Nnxs?=
 =?us-ascii?Q?Uml9qx61MyzgRYDaTUzSWyBVtupm7vruPclt4wcKO1EFElVLU76EH7qn1y4t?=
 =?us-ascii?Q?NvUwREQ8iMQvd2XjtvNx2BCBjv1zAC0izZlIxwdJqW8hOwfrOLji2B9PcQ8F?=
 =?us-ascii?Q?3ljIpgXnrLEAc6Rg9r+J6vOCI2cTXZDz11zodHCa9LIdf4sC23NRITRaPKEv?=
 =?us-ascii?Q?zN2VdAoTdM24+lQ5VKiCLIxRQ9hGNYIMhAhrBAQGJk73/ZdbAqn+GfxMjYvT?=
 =?us-ascii?Q?vgI8BJCL/5Vxw8yKHorSD6yHV89OmGeA/W8lNWba3hjHHdQu5x0s/OwfXy1A?=
 =?us-ascii?Q?9K8Rdr+1+HHM+E1fiLgD2d/LKgnTw53n8vxbG02iKwi0j0NLUK6hynLSz3Os?=
 =?us-ascii?Q?UxM/ZMo014tCO8ZQQw3f4MPJNfssFYIYo9V4SNBbsU0NSmldaItYGYAxqVv6?=
 =?us-ascii?Q?hifTGis7hDEFTE5LDXeES3Ir8epWxWQu+qaqH1Bxf+ZkFQTpmYCDyA3HGF7o?=
 =?us-ascii?Q?M8Cd5ycPfVyvDKUttEghySD8NSTZf4Rzh8D7nhTaYPQq7PGWcPV2MEYHgPio?=
 =?us-ascii?Q?odzicC3dLIPDQd5gwf2aDoBFCIPScJtGf5kjETPmZBDCuKIBFRcQRn5dPnwo?=
 =?us-ascii?Q?vKR8myw7E5PfQ7cm6RuT8cPOk09ItctVwy1hAi4aOvvXW8imTQRlvP4zr9eS?=
 =?us-ascii?Q?2oGRhRS0uPhbzc2JnTtEqNSUJdSFGaHbyZ3fq05KjPvTtnCOGWoS+54fjriO?=
 =?us-ascii?Q?x/4NuNFNfdtlCmFOUEgXOdb/fPFlBdlY3gWK+v/iXwR/A61E2WZI4+VXPsBW?=
 =?us-ascii?Q?n+ZSDmuCPzvv+/QD8QKVJc6r7c3/S7IDoRF8?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:10:51.2783 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e23802a4-0b12-4fa2-2846-08dddbb1b8e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7760
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

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color.c | 79 +++++++++++++++++++++++++++++++++++++++++++------
 lib/igt_color.h | 13 ++++++++
 2 files changed, 83 insertions(+), 9 deletions(-)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index adf08fa2a..106b54e9d 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -22,6 +22,13 @@ static float clamp(float val, float min, float max)
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
@@ -57,24 +64,78 @@ static void tf_inverse(const struct igt_color_tf *fn, struct igt_color_tf *inv)
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
index fe0037ae5..7e429a98f 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -21,8 +21,15 @@ struct igt_color_tf {
 	float g, a, b, c, d, e, f;
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
@@ -91,6 +98,12 @@ void igt_colorop_set_ctm_3x4(igt_display_t *display,
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

