Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C623C369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34CEF10E692;
	Wed, 30 Apr 2025 01:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dcIYGGpJ";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6B410E692
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:39:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3vafUPuJqhAZpVrkCWpk7POSt8DwvnJ8lKYke+V4Tr4nI534FSSDToCJxFHWAMH6z+2caCt7gIzB5s9SSDwJOkIDxWD62nJd530xQimjFCFIib+UwLwDylTWGmQFGSxRe2z/qnmCqp7yLWE8Aw6E0Yx1KyI/xWQuAcFdo2kWccIR3dZjhmjpUsteybyhASTcDcYpvr+KPchlpaZEcRK7TNC3gYqKH1+7Y002W95XDPOq75lSOZmvtD3UjP4HSmXXZtbe82+2PDPjVJvLNze0nHCNyRHcJY2jzKRyVC3cukiA3z5UarZAp0FLm7PNCfdl7zYqp7uYN4Qvvr0lempmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LiWiNAgRUFHVRzvTZawtB+myI8z3A4h708jRiCwKGHs=;
 b=d+n6F8vLamZjZVvbTQiGrvFKF5HP53XLADoTHn20ERrANm1oQaa4TMIiTiDObTUcmrCuhib9fSf91gsgiXFGcz9zWWTnKiWP4bgg2NULXspKmGIxa9hO/m9VdgZAnkDlYfsXPA+ii9r9pBtZPrfrccYCRAvvLlk6uO3znMMZ3Db/paHOQ9+A+ezzUwiOkt5nLGGbi7eVXjvepLMImkqRgL2QtBNBSVW73g4qV4jfYzPyv1VTyTX2qOHrJo43iSimCvH13T7/nHiZbdL/wzsN15UvpAhOADz867MOsevOHJr2L8/SDp6sIa6bk3txtnR8So1Yj5GBXHXFpSX0mluQ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LiWiNAgRUFHVRzvTZawtB+myI8z3A4h708jRiCwKGHs=;
 b=dcIYGGpJ3nbBpuEmdYspJFjh/WFNv2Gm7LbNotdHe8vBxUv4C+BVk2Y6LS7wcVzrZkmZU5CGO+KrZuhALMWEvnmZkUJc/GC2+GerMkCweR2resRsvC42TwezymsFpAKPXO0NkFEFNN2HXncFyCPlau127eaqeGhucN5o+stcoug=
Received: from SJ0PR13CA0095.namprd13.prod.outlook.com (2603:10b6:a03:2c5::10)
 by CH1PR12MB9623.namprd12.prod.outlook.com (2603:10b6:610:2b3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 01:39:49 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::77) by SJ0PR13CA0095.outlook.office365.com
 (2603:10b6:a03:2c5::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.18 via Frontend Transport; Wed,
 30 Apr 2025 01:39:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:39:49 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:39:47 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 22/36] lib/igt_color: Add PQ variants for 0-1 and 0-125
 range
Date: Tue, 29 Apr 2025 19:34:40 -0600
Message-ID: <20250430013454.226910-23-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430013454.226910-1-alex.hung@amd.com>
References: <20250430013454.226910-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|CH1PR12MB9623:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c506f5c-a645-47e6-bb0e-08dd8787e58a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9GL0m0YOj6BSiqPFVfkMfeyQQFOoU+9NNN3OZJGbXXN88v7lAOiXY+R5y9wo?=
 =?us-ascii?Q?+8+7kMlipW/k3l1rr0GNlD2d02kV0hBGd181fO/CmDsXRFlMxHBMWnMctiQw?=
 =?us-ascii?Q?ix8y+gLpd7PTMMPaHmM128IXwvRc1uBABvKrDSPBjkha3Q2sIwra+uPmw5u+?=
 =?us-ascii?Q?ibqX8TPb4UJ+YAS0JgIVWGgseKJI+nSpgiLc4d+56mb0Pm3ixYOvpXL0kqfD?=
 =?us-ascii?Q?mIeMQedhZPFUBBri6b2yrioZmbRSyPd3v6CaCat1x1AdAY9i6A7UgnlMFtHG?=
 =?us-ascii?Q?EZRv3MxrpKHOzQkgfELi7o2OQKs3KiZjnkBtL+WWvfHQxuh/hBO18BdeBLKG?=
 =?us-ascii?Q?mXYIkuojsGfwOUpkOBFait+znuWEd8OXbsRhRGya+gqqrSZwwM1ZGxocBFCJ?=
 =?us-ascii?Q?9gfd3qo+a2c2KjVD3Jsi//EcmnSQMd43WXF7+DlTZNNOAL1UdXw8bzftJR7O?=
 =?us-ascii?Q?/xQl9ZViCx0KA+pczYG7GfjkP/eso2N9moAtLEnkzYzQN7wni5UuWMVGwacQ?=
 =?us-ascii?Q?SsBbKXI3SxeHDVQ/mkF4BfK4/5zl16QPXb80MUWi4hkWa2CA+6h7uQMJVTzE?=
 =?us-ascii?Q?RZhahOKhme/lMtgOx4rBocdX1ff6RLSUhntmnNyChkk5pwR7G5vnzvxB75kL?=
 =?us-ascii?Q?v5WGP9nDRn0QPX1wdUqCKKf/U857109YRJLlgebwxUI/YZkIs7jLil705hGv?=
 =?us-ascii?Q?bI5+Ui5il4614YGwg50nMnJY+bpyerRlXsNjgmVzmEgqHlr7HNj67QUTsCpy?=
 =?us-ascii?Q?Wo0faK2u5uvOxNyMbyowiiLJAGvBMHqkwIZm7ud+KLFwoIUR5x1Z3ZJwZNQt?=
 =?us-ascii?Q?BQFYlmbCpY9BSCWhmn5i1l7En4hu+BP7/oD/qiDWk2lGCBDY2cRuCt7qGgU+?=
 =?us-ascii?Q?VJpP//fAJOx2V6ZsJCi/u05jAYgF/uT3J80qHi6tOY4bpyvugGgNhAZTiVi2?=
 =?us-ascii?Q?1zBonBV3Fq+mqGTb6v8p2g52TrNLll13+NNDEfJPTCjO70JlkZ01aT5RZxR+?=
 =?us-ascii?Q?FKwfCQNW/lUx8RJIFx6s9SJlal/suBA93b+8LZjNBsdue1/46FNbp5WVGasu?=
 =?us-ascii?Q?cFIvvAJkPJxjvlfRIBMceUplVgNWJ+YiBMbLltw48Cg/OQ2bAlzZUFzKgBr8?=
 =?us-ascii?Q?zqkL1kmH6/tJ9Clj0uh4mXjsblHCDXhCfoV6Q76P0YyCwE3E753x1hSHZFWZ?=
 =?us-ascii?Q?rLWjldIYhUOFQ3kXa8l/og8LOV/GPTZsdUCJUBLskZpvYu9wDdbc2U0C8lmY?=
 =?us-ascii?Q?y+lrkdKX49lUWaLscahZcnIe0fuOwQGR2qAezV5t2HBJA6WnWG6p1Div7UqY?=
 =?us-ascii?Q?vc7o2E1luYRSow7bCMWQPxHSKU1kKcQ6QpQ9LW47NVfLX7vcx8Oq7UCNQ4Cc?=
 =?us-ascii?Q?dqgCMzVEitweHPePhiisvkgZSHyV4+c0fgj9te0UTVakiJAs1oKP657ciKzc?=
 =?us-ascii?Q?UyIk32Z5qcUgDroC5eXo6/B5oRPSVcNLhYixGFU209YTXgWVh2lx5FDMSJLe?=
 =?us-ascii?Q?WGCRyyCaskOZea9+cQEwp4EDaATgxko+REhc?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:39:49.6470 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c506f5c-a645-47e6-bb0e-08dd8787e58a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9623
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

