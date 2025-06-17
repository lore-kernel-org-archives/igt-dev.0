Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E716AC7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935ED10E4C7;
	Tue, 17 Jun 2025 04:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FxlSvgzQ";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D125A10E4C7
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:41:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=La5UJpEd65QxjA9puLTN9geiY38vjR4uwsJNfADecZx4biWGeBtVuCok4U2UuqrfbghG5/l5pL0fgn2yPHqpwpLyER2pRyZZYs6JJlEe9T2HOZvHd9eWLLGJ+HFV5ynCFfNYM19RPBTpLYTxZ3KSuFHHvy8nNcgbrWOY5Zt8pa6oGSEnf/3sXskTGRngnYnDz25JiaLSQXCmTj2+VdyjfPhm37S5VrYMeJuaaKy6eUGr3OD2mkCRmYcP5vzWfgTU89k+ZKNzfyyKUB1uhKBRI3Nrnc0WsJNVdHMZBuvI92tPjBCtsp5JczjqU5S986+puaK/GWoCDlKF/5iVHS33RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LiWiNAgRUFHVRzvTZawtB+myI8z3A4h708jRiCwKGHs=;
 b=hDEft9/lZcfzoHp3GigVNm2vEjEe6l3yf9iZDqE2kjRwa/gxXg8AiZNnroZiOvtyoI+LfRu8cyzU/rCrt81VG6MBG+DYe6L9MdDy1Lc9ZNyhIo4vhypxFRFbTXA5RemcLr9clmltgjbebvZSf3fnex+PrvMFuwZyInq9v+z03wZMeF1uhCyH5XuqMzBghhGLaK4QTL39g09WvPk6g+LE7nRBg0bUgO0epGvG7IsWNiSyqdv+mD7wQxsSfOKbxcUUU+lECTTPfdQZfOWoq4J/PMZIrJLETWI2qOq6VVPjXdVTYgE/jeWjo9Uf/jA9p+SELySxaUK3m5KPhIDZFFsWlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LiWiNAgRUFHVRzvTZawtB+myI8z3A4h708jRiCwKGHs=;
 b=FxlSvgzQOGFG05VXCBdc5TRMb2M38LfwjxY4XSqBhArTLpiB0krZh2Zb2Yk0jLC1uXQaSI8OSJGc03yLleSYjI843/NkzJ2bgsxmPl0dUcahuOJughbafgGeuz5MyIOaH1jIqzDJ3UGBwQLqHrtv+wxL/gmYlreaOCr7EBY9I0s=
Received: from DM5PR07CA0055.namprd07.prod.outlook.com (2603:10b6:4:ad::20) by
 CH2PR12MB4182.namprd12.prod.outlook.com (2603:10b6:610:ae::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Tue, 17 Jun 2025 04:41:10 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:4:ad:cafe::86) by DM5PR07CA0055.outlook.office365.com
 (2603:10b6:4:ad::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 17 Jun 2025 04:41:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:41:10 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:41:08 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 22/36] lib/igt_color: Add PQ variants for 0-1 and 0-125
 range
Date: Mon, 16 Jun 2025 22:36:17 -0600
Message-ID: <20250617043631.2920587-23-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617043631.2920587-1-alex.hung@amd.com>
References: <20250617043631.2920587-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|CH2PR12MB4182:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d49801b-67ca-4c3d-7708-08ddad592ece
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xr9YBsldkKF8Al5NG33LGecLhdGRg1wpEyq516w/k9aK3H3C6buk9GiYLi3D?=
 =?us-ascii?Q?U6DFSR5JhcdBt+HTqUFhPp0G7i0bHV24GFZ+Ik4Xf/6Kvwf2io6sSrKbVgK1?=
 =?us-ascii?Q?23sveVoF7eEEjKFYI5yBPnH9n+rvXotsSsvPiZ0x5YFvoqUxZBTbD8/E8Pxz?=
 =?us-ascii?Q?Tlh4PyzZcuKwQBIBzNFxd8ib7N/DjRClkg7lfA1LQsAk9QEqOlNpcuk6C0Jz?=
 =?us-ascii?Q?DfW4WK+XCMRwfjMRphUM6V7FdJcdc5TEINWa3EIsS5N6Wlns/utUmIidMSK7?=
 =?us-ascii?Q?jyrsxvJQNmHbQVOgteqWTFk705xNU7lnZ0MhR2qQMAZSejGxZ1miiE8ArWgZ?=
 =?us-ascii?Q?Tqt1TeKlIhUPwDVRYjDWCDBX1xiEWn1Y2ia2+hTdvD8Cxq+8V5RZc9HUDcSb?=
 =?us-ascii?Q?rmjtW5ERCD6jTHE/DZto+uot5sHUBYdtn/e5P/mct46qsIAmSMhEC+ZzzQsh?=
 =?us-ascii?Q?N1mpMTsq5lECrTbpRpTBKdj1Ile635NYTqTlx/lrBbaz/c9bzDU8IOR8W0R3?=
 =?us-ascii?Q?J/p2YV4XyAqv50c98k/QU2GoPTwAZH4mcKeCt0NKYm5cF3wsKpGISPiP+MTD?=
 =?us-ascii?Q?XXpSWQwbtAcom3RFN7+R2M40094lTGEkQjxOU5yYxSRBSoNz71VU7KyhcGSa?=
 =?us-ascii?Q?l2k+Ty0c5vRdOYPPOWM2VuxbmoDJ3KOVCOoRryE9Uu3fgmSIaRBM6R6jZrwE?=
 =?us-ascii?Q?W/ciVhpdPCtOFLembb1BnCgCyPTdkmb2JWZypRWec7SyihOqKVfa6lo6NE9q?=
 =?us-ascii?Q?4DzViddwFNaA/b+OrEeVYS0FfWIWX4Iqsl7hNrBHFrSx0rNNLvFpCrWlDtTR?=
 =?us-ascii?Q?vqYv+xV8aKtvLX9M3X7gPDLgPFU2M9kIYrfY84Si/FWETxvmyEQA2iay6nL0?=
 =?us-ascii?Q?A1gM6uWKWY/VzVCaKBbdzhpwFXKR1dsriQeXZVQqivQCdGbS9jQM7uMuUqS7?=
 =?us-ascii?Q?I8iXomPVsLcLEGUNskC/JTln6ZZKR8E4fNYj9QpJ4xuTCzo2oUygL55DoESL?=
 =?us-ascii?Q?WXxW85Xh4+lgyTpxBgQHPnh11zjTcO24+ZKNq8e4EqS6sfVUOxZMKdoY5BC+?=
 =?us-ascii?Q?FHtLRY0FMZ3Pie76U0mP0xo1LMWwdOIA2pWhO1ir2FW8ZNYU2dRsHQtDbV/Z?=
 =?us-ascii?Q?uR4FmZ8eYqrHjhY1NhGnVSIw0HMeTGfjO1BB9HLOE0aA0TKtRVajp/Lb/eod?=
 =?us-ascii?Q?WRzQ5qXad01RlwYN4PBhs0MXCg2w94ttHX41MwYuJaiBcTbEoPUk0vfJA8MQ?=
 =?us-ascii?Q?jnf5WwyvaYqLA8fnZBI+bv1WUw57jXY3kVyRgqUG6497UoYEMgPufK6ZkUAI?=
 =?us-ascii?Q?jwkGgxVR/N1qoyuDq32ZdKe3RImwyutwUetI8h758Im1nLy91lt7PQn5AHrf?=
 =?us-ascii?Q?Nfjzej0IeAMv2VWu4CDX8ALbSKsXaey5FtD0GjIhJ6Ya9Ovup0nB4TVc6z/d?=
 =?us-ascii?Q?sc7c5H4HMlLA15Jc7/dEjkJmgfcyVDjBYl7Rke+6xgRU1vfSWzIscoGGEuZZ?=
 =?us-ascii?Q?k4hVPSdZ+2MpRIMDHFsh1EPj9NX999XILhy1?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:41:10.4629 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d49801b-67ca-4c3d-7708-08ddad592ece
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4182
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

