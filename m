Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061F4C5320E
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:59:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B2310E485;
	Mon, 19 Aug 2024 20:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NlyqvTAJ";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2049.outbound.protection.outlook.com [40.107.100.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0659F10E478
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KvQv28v4hQdwRgFERWUPmeDlRoVeUk8lQDFgXolk+Fa3gwESKfY9MWPOMHEk9Sb0XBlU88LpOc2y4OIDYZp8p4M+PXDpTKvBTe2znBAXsDBVj6gjzZx8FKVIZ7wxsVbedeiy7t7t3DmvEhFuxcjNYCzsa2kyL7bdfQDVJyT3/Uohh988/c3fBH1WRsbpA/pFTuid1VM6Lj0b1F5QshxV5zKjET9CXVEhTHIl5C0RUT/zra8HUJQKd4UjylgUR02HSKBPRFr7+c5mrDYGJY5L5gjroFT8DnMp6Zfg5YyGZapU3lE2i7m+oO86skix15AQ2uGgnJ9BhOGwAFbPfv1A+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kd24USnoxfEzUyYTcEctXnolFHhGGjJyiky8YffIbsg=;
 b=l3beSrx5MFrWFzP1l7tyvg/YAMlCxETN41eKLA9mnn71Nr8SGgF71/wVQeKWxd1EhfBflJ0XXydkOVOhyJ7LsUoL1k6lt7RwNqoDBz+lUg+ZtA8QtV9tBQxQsYtBQQl3oNm5ahF1AU0z+JBp8nUl5M94EcF60xAOs49ZcQpRtSot/3oImSJOuDkXwbs8kgufavOZHFFvJYI1aJWP8vWWONQ5nllM9OeHpZTz0lcHDrArJUN6xm7am0aVhRPs8cPR0j4TJbx6azAl1er/uc0VsmXriqAqwp2ezX/xhckBa2DcjMWpGTsnu1gaCRFgY4I5EnoBzNWEFfSfklOVuTOAqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kd24USnoxfEzUyYTcEctXnolFHhGGjJyiky8YffIbsg=;
 b=NlyqvTAJm5+W4pSmGZjRkpQolfaf6JbW7dkXp0l6Bc6FHoQ7vB4MBTyE5qW+MX5UR9ya13m+ciNyEoyVU0kWW4OKANmHxOj+wUtsyLcBQKZT7e6mI8myloeGytXfbOqzRSV9pWgnwSu9FjgrsQskNkBzgkNOpLUMtGw2J7NDVuE=
Received: from BN0PR02CA0039.namprd02.prod.outlook.com (2603:10b6:408:e5::14)
 by BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:38 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:e5:cafe::b6) by BN0PR02CA0039.outlook.office365.com
 (2603:10b6:408:e5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:38 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:38 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:37 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:37 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 24/37] lib/igt_color: Add PQ variants for 0-1 and 0-125
 range
Date: Mon, 19 Aug 2024 16:58:10 -0400
Message-ID: <20240819205823.316656-25-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|BL3PR12MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: 826b9978-3db7-41c1-a410-08dcc091b310
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aixlBBcvraiFeU/9lioXXFZN8Fzx8Big6XBP9MejgaY0LGwY3w/umtcgHQxQ?=
 =?us-ascii?Q?N2GvQdeaEFN13PPAl95PkznTp7AXok6DCjLqk8daSsXk1rUuWXKIq1oWID+q?=
 =?us-ascii?Q?7CADekSrVbVlEpkI+DKtvX65cG9qMvKo5whazZTNZID8KV8bfEbWeMkbvJfk?=
 =?us-ascii?Q?v0beyBsOFT9xNcAg2TkPOBx7nH3McgrwaP0BbNW3ptmcx45sguOJzMlXQsO1?=
 =?us-ascii?Q?wXwCMSCh5SCS54c0Yp3j08HxeFxnFahMHCnq2gGRMKPMXFBTPfl0L0re2zNG?=
 =?us-ascii?Q?8osFsUwFKRgTnJFfNCQtBV3fKakSwL3OBTMr3Wswj5kospxu5aY3Svzv4t8y?=
 =?us-ascii?Q?8hOnnIkndG/1MMuSeZdB2fFabzWjPDVSVQSzQZWWOoxZiB6I9cx9vC46cspg?=
 =?us-ascii?Q?5VsixNDbc/J5nyQv2RStviaYaoPge9mUF8U6FIqMw7RPQLAs0RwUFu5quynR?=
 =?us-ascii?Q?nNQ2tfyz/RM0Wa3qOtQak6hImftQ67UbFxB7Go3L9oK2jo3KnkkckAUZYgST?=
 =?us-ascii?Q?1Gkk31d/vKrpylWd6ZJNerUSP3zW3fuxr5ITYVPyE0fHHdEfh7+qdGSlryCF?=
 =?us-ascii?Q?GmQzYn2z7TZ86abW9QEq4TTyV3YcJYVfXQ+F+G64QqESBwv/NQ8oUrPHRJqv?=
 =?us-ascii?Q?rZof7lBWmmTj/Zt90AM0L93N2mVRiX9fygfNXTyggNsp/hVEmHyRJE0Ly0Rh?=
 =?us-ascii?Q?Qaj+4RMQ09mM72nXT5ErAUk3SGpm/E/iML90sNRJA5XlRkpwtNoFnejvJSyA?=
 =?us-ascii?Q?nWECzRDLRoY0h7DKKgAQ3Hqhe2eET24lernu9qnFN14k6YdkvdcYRXUgnAom?=
 =?us-ascii?Q?AyQw3NCAl4OXVOiFL2PSNVDx+SqicLVZD+t0Tl7ZTSDsfWOtJm1CaDXAZEDf?=
 =?us-ascii?Q?lNuIv95pyECEk732/N+rNZj0QtPYi265ht3Kd9Mxl1liA9qYBD8C8EvXHbo1?=
 =?us-ascii?Q?qsZb5INgTdBUixsoabdBs99OvD8i2MHGfhQQXkSHqYDsfa6dVGIlA5GUG4Ql?=
 =?us-ascii?Q?7sAWof/mvI7YdFL0mZmvjoK65RGtppvceP94HFzYe3pTD4zeftz9unOOHXVw?=
 =?us-ascii?Q?L+AS595F9d7JXMqoyVc3iMgVHGQj/+aJNVol+zstnKumwXBuhcE/uum6EGEm?=
 =?us-ascii?Q?z+YovO9CB4RqBv56BpFCWUp7UqjeZu3tKl1Jgobc9Nb4FJd0bmO0SXG67CYF?=
 =?us-ascii?Q?A/KodFvV+3CHjlb3YdSxeLb7SpvHfScwRReeAfHEBk3wLl4Rz3FuxthLLMZm?=
 =?us-ascii?Q?ILcw/RQ82zAOiURLIawDh4Eesix8D3fSA4SfalOKgbTj/IyeTrMsplMOjeDL?=
 =?us-ascii?Q?M5+kb8/wTmE90QwoE6L2GpUvMIxb3ypG7qaxA1cs5JkKsyVuBAB6XJAsyfEj?=
 =?us-ascii?Q?ThCtuwr4br0RFQssbJzlTh80v0rO9zsFq4Oz72o8WuV6BslrJhc1whkyzQGr?=
 =?us-ascii?Q?junJ304ctFUnsWYc7IAud2zF+GBHACES?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:38.6145 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 826b9978-3db7-41c1-a410-08dcc091b310
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6642
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
2.46.0

