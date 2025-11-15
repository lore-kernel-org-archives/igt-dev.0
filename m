Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035BACE8D6B
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:22:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC2E10EB85;
	Sat, 15 Nov 2025 00:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VC+wfC7c";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011009.outbound.protection.outlook.com
 [40.93.194.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC2510EB85
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:22:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3PaIQD+EptV8tFMqKPgaFYLGWDoSnrtHZtfNz4Nnyq+ncehWdB0rvUihuANALSZnvhTUEGqSVuU8R3+MO6YVCvcefQRBaaHFGm3gWrIBmBDemwg0uC/B/6486ihP3tXMPIFBQlCfE527Z3eKxX0g52j3s1ojr8X+5TL7Bis+R/SjGAYuOlivEB7gGZx25bcwQJpFUNuWhUGUgeeTi77R4kG0N9d5dsVa/T6/PINMZI9jMtlrjejqAPmuXYG6n8sQ61scKSMhwLjzobnbVW7Qa1kHniL614dJSTwPAn24hTr7Arb5tpWpYwE5PLC/3wey6teUye1V9RzwbYGSOW/1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWeRQjz/T26wuK+uIG1pvLph+/dC/ppIrD2HEqri5D4=;
 b=xH0FAM56f2gvPDv9meVyhV6HS2WH+OGbpY/UtCpuBCOjKLF+/uAYshrC/KXZcZSNitxcFo36mvlXoACGOtG4Gcqkj2Qc0rlNhRoysvtcXsRpp5ME5beAREq1Et9lzkIiiQr3u7wcCgEcFMDyNYFngmzSATCtTZtTwtj0l/HxJ1/BAo0GRsZ/yzcRgRsz64Z8aVmaVAHrH2S+2scRoECRWHUt9ycjiPbHoXo9D/OEASz2VrTEgB3/m5VdmQzTbfzurklFaO/0c0BJUWjs3RKTlhkBCENx/sMcWzcpwZpgsY2YuRHAdN4bzrMZ7zJ9GTCITVpRX5N7NM2s0/iD4eRMhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWeRQjz/T26wuK+uIG1pvLph+/dC/ppIrD2HEqri5D4=;
 b=VC+wfC7ciUubxxYNb/XFRQHJxrZs3dp5ZLvVsBv8ZEAP1/N256XhIDf0jPrs+6NjL5ue6Ib4VHSt8HT61P+jxC6hOMGpWvBPEQbNbVCVwKZIh/MONOveoLAYnsmSSu9vkMW/geLBKUKcVcPm61HCuRn+yMMTC3r3Kx6hL9hA+Qw=
Received: from MN0P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::32)
 by MN0PR12MB6029.namprd12.prod.outlook.com (2603:10b6:208:3cf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 00:22:53 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:52a:cafe::c4) by MN0P221CA0020.outlook.office365.com
 (2603:10b6:208:52a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:22:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:22:53 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:22:52 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 20/32] lib/igt_color: Add PQ variants for 0-1 and 0-125
 range
Date: Fri, 14 Nov 2025 17:18:29 -0700
Message-ID: <20251115001841.3563993-21-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|MN0PR12MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: 9245dd29-7fb1-4dcd-ae62-08de23dd1dfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6kgwBKQEacvETNBCEMpYzJ4n+yc1kCrNyPmGudMek94dL6ex6BvMD+uLDatH?=
 =?us-ascii?Q?0fraEb56d9nUcUsnmu/K+7xxolu9//+3CsQ2EezlWjzj6Kk9X0oV7RS8/xk7?=
 =?us-ascii?Q?58JMgqTG086T0edLQQ4zhPS2/XBcE1vnQpZvt8P/nVh5IZf1W7htVZJaVWmv?=
 =?us-ascii?Q?gH3PXxufHr01CbqFGmXxL2RsCtrcpxPyn9yWkuRnAio1mV4/R5Pu1LfhxR45?=
 =?us-ascii?Q?F3s+ieRR0CMRI+uDOWCLFanDCZUo9iFHhAs0LKCCqFX5vKQRVVIMK9ZbWpOq?=
 =?us-ascii?Q?KwIVF6e9HXxMAVfPVLNaGic7WP2kksMmcW8/egcLdvLAevRdGlUIyqkkvZvr?=
 =?us-ascii?Q?bHF98WEjqmbJEBGmWuBjngw0gQHSLhHZFCsS/a0DjmZYsZZsTPEC8ixpAywX?=
 =?us-ascii?Q?QPMmE8HELTTDXgWm+ieoz8R7S8jAjmoTQQpPmOEsOzFRX65LdPJDCQ8MaKLC?=
 =?us-ascii?Q?2Qg14BFs0+GiltlmrdxSW1tMP8khX/wTltnMIhA1zVUQMD4F2NeLEFBmVUYL?=
 =?us-ascii?Q?8WjPXzYognZSvagXsF3lfJtudFDnxgSo23DIG2ZEPcn5SpiOLN7xMWTmBszE?=
 =?us-ascii?Q?aClTIOX9Y56+fLU1vN6XTvhhovfVxLRwu5eJtRPZMTlUwH6Nu3SfLuwzQ32/?=
 =?us-ascii?Q?WKhFSINSPRJL4hTo2yYzoB65zXZG5zuLCkO0aNEmLq+z/MZbdo92JM5PSy5A?=
 =?us-ascii?Q?tzV3aGdmfHDmiKtIDh+39FoeLGffdZSZf4VcIsXb9sNSa7HcMGwYkX+fOhQU?=
 =?us-ascii?Q?gilHE5CbbomY9WlV5KuPwjOR8W5YKdd4sfhaSewQD3XvpyU24N5sH1ZOOyEu?=
 =?us-ascii?Q?MWIzAvIPeYFqM8k321ZJEtEApcw7uE2Z+dtSE6SV4f8V5kcrg73i40FqfD2E?=
 =?us-ascii?Q?XeoaE+lqzUsSB2P7w1IJyBpC899dGy4rAFDHtlBrhCbNbzrrTteFCfeUuzC1?=
 =?us-ascii?Q?yME5WumC63DPUAKCu/8rqImQ7sSX/hC8AwDQWKSEaCSfzYjhsVIOmRh8BO1H?=
 =?us-ascii?Q?9sMhp6Jj4ygz+IfmDeqLiQmsOnqcleoOwo7T8RyOIJAvm67EU813hW2ZeSzz?=
 =?us-ascii?Q?XRNvZe3o/hWuvc9z3+i2zIrTa7YQ3ptBq0d7Y7zf3a+qB9KWdM0ROce7RQKb?=
 =?us-ascii?Q?4IFr96dtqd8MsSp6Uxw+aW7yFpnU8PFCO2ruMpQDDi4CADEBUnOmMdVMxez6?=
 =?us-ascii?Q?5dme66FFa+0oplX6ZSsbOd0udEIZzU0bH7HfhL40Bko6vT2EkCGAl50/UTzC?=
 =?us-ascii?Q?By1iHcbcpCXSoQou/1M2K+wZ9T0UQRmWMto7lWdkp0cak9v+tOhFW/Kr7o0y?=
 =?us-ascii?Q?cVOTd2GzTY5semNKbYsM/0Qi565OR7f2CwvY5+JrEpwRRv3WfqFTkjALmRdk?=
 =?us-ascii?Q?06VlULR2pRu/a3EeSc37uqNQ99TY3zlNUoH8q2A/T7ZyS1cz5c+prW6QhHhB?=
 =?us-ascii?Q?lbtySavOxU8LxXz9j6thB6lFkRaXRS5fE2/fTO5Gag33peVGxWCeHx5OaMqz?=
 =?us-ascii?Q?nQYB5FZ6Dn9gSnPjtu/9yS1GAW8CjgiftXvrMj0NIXe951SvJXQ1Upr8QRtS?=
 =?us-ascii?Q?v/eqazzyT922TTjrHB0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:22:53.0459 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9245dd29-7fb1-4dcd-ae62-08de23dd1dfa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6029
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
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
 lib/igt_color.c | 79 +++++++++++++++++++++++++++++++++++++++++++------
 lib/igt_color.h | 13 ++++++++
 2 files changed, 83 insertions(+), 9 deletions(-)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index dac016755..e0b285162 100644
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
index cb4cd00e8..96bc9db5a 100644
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
@@ -90,6 +97,12 @@ void igt_colorop_set_ctm_3x4(igt_display_t *display,
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

