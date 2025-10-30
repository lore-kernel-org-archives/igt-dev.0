Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A9CCCF9EA
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:32:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9639210E8BB;
	Thu, 30 Oct 2025 04:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tYl+x3Y1";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013039.outbound.protection.outlook.com
 [40.93.201.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C8C10E8BB
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:32:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXvRMGw3BqNyYw5Obo+j1t1eYeI5vdtt3nmXHBvz7wEVWCmhpQ49z5Nc1F2Ca59x0EaNFVjvc/Hrrxqum2GCOmKMS6QNo+DTAyTnGeRHJkgx1vtM5H+IbTR23TU7UIcUTjOQba/2mhoRvOZa9ydLya4d5ZyejqJJOfO4+LTVssaeyJKRQjobmFHIBuMijU4y84IsWesEVDgnf18zUmNBoVIgSzxVxg62TKYrbfWrWMYw8QQxevgoFduvnDGLFXd10fid0z2nB/xWOgZyDZ4PUErDYb0wekgHYpSnFcCOHHg0iEoQ7iuGlwjqu44odygAABtuFbufm9KtlgSt33VnDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+A9O0IRfa3IUSr/ERuza6+a4SbL29O13ScUWXMEbi0=;
 b=iYczTMjxuQc2t5CmkUe4mTmeFsSSryax9kFWXJJ9bPfDuFbCSdv8dywL09gTd3x13SSSR/sgCP82FLNE5osdsxF5vI51uPksrMa9cvPYksafKeimaFAdTBnQa1jv9P51/lKZWtCBhEp9UbUV678StN2j666xXDHN8+FUp/OryAAfRaRG+pT90SuJV9OQkvofZKiI6qH/0XN0aRCNTYcfw3SJXj2Vk3MKatptThp+QNDl2vglaIE6p7YHwWOm3X15cSuQkAtxPBqmyryG6h8Y3IG2eURW+4k2jcQncJg3L6i7LUU4INwqw9C8MqHcVQ69qLWFX4EIUATGmduevn8wFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+A9O0IRfa3IUSr/ERuza6+a4SbL29O13ScUWXMEbi0=;
 b=tYl+x3Y1hjG90JYlSsnL3fKHNPYVjDG+K5RflgUT7jetDRSptQeDbSnU34KO32TMsxeq8X+u+3T50//Bl5eIaEJLDdJa0tez7fxSaaxQuuRYvI/MaaWxgR0REj2hIGq27BdTj/W85PiBdFMJwxEJKhUR4zCz+93BEAHbDnOvpCQ=
Received: from PH5P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::7)
 by IA1PR12MB6091.namprd12.prod.outlook.com (2603:10b6:208:3ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 04:32:53 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:510:34a:cafe::b1) by PH5P220CA0006.outlook.office365.com
 (2603:10b6:510:34a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 04:32:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 04:32:52 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:32:51 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 20/32] lib/igt_color: Add PQ variants for 0-1 and 0-125
 range
Date: Wed, 29 Oct 2025 22:27:49 -0600
Message-ID: <20251030042801.2315866-21-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030042801.2315866-1-alex.hung@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|IA1PR12MB6091:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e731552-d66c-4183-388a-08de176d63fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2+RmZnAVMn7cK4+mpEsvQRp8AN/5OhDhkQBAvb0wrMItGEaBk0BrM1xi/Kyk?=
 =?us-ascii?Q?j7UBivnaRN9pMsJ9zfLeITG3ZiZVtROaWwQXX0HFDXVtsBCy5zpgLukez0dB?=
 =?us-ascii?Q?Mn8p9wxlkE2+8LIBWnNczWSRo2QwTsj2h4IcYE9h7tiiCh6J1oDCUFTPsHwS?=
 =?us-ascii?Q?gDopwT1y2RlVIyCmitbabbPf9NvSHU/60jC9bV4ulxm4mlotaT620AXNSydT?=
 =?us-ascii?Q?jjSKsH/+ZnCzKZ3nEIINRDCP9eCUk+Cza7pmxrKC4chFRPDoU0oVtbnEkKBt?=
 =?us-ascii?Q?L7U6D+crXbbL09fzOmu4XXKgky5t6G0UKWJu9VboECNONWnRqk/m/+F+g3/T?=
 =?us-ascii?Q?s+aOXttrtLUxbQ4Yol8ozL3k78s6lCz8WWevhpC5CdsSidfNW2y1AIPm5+Nv?=
 =?us-ascii?Q?fMbVyC5+2R70GLe9AWQPkW5AH3VsWQxdZVnBlCKAfYCnccMzCIaaUr8ZG2uB?=
 =?us-ascii?Q?uXUoqJP0alzTt2XWCS4Ko0vPI3+yE80N5iSSgALAArjtRqI3Ja8TJDnIiqtM?=
 =?us-ascii?Q?gT2os27tGvlNv23ptVPaql2SZgWx9PwUP6bxkwsV9iofEVV4CZjCyyMWdOhN?=
 =?us-ascii?Q?VKWWZuZ7zrrE48B6YFlslxF02M4u0wENe+32E8ZgrMLzUBygkBRbPcOmRHgb?=
 =?us-ascii?Q?6DjsVBn22oxzp/KdwczQhFpBV1k0LU9W8eU0cbg6NMjRSokkrZ3snPYcvw6n?=
 =?us-ascii?Q?cqLupiLNjihK2izt8SNSPXaTxZyPRdOiRusjsukszU/v8zxXqNR8O3j40QFA?=
 =?us-ascii?Q?0x3JvOWjF/Qpke4P90U43jOKjDvxnEXYA0Mw/RLQvMOFxl1Rvj9zdARvEdRq?=
 =?us-ascii?Q?x0BnHt/RuitqfxUaAhXKEmzc51GtipGE59yohUz673p6SZnjyeKvPGLopYC8?=
 =?us-ascii?Q?WtNVqL/n1RsujNcNrfB662H1ybILiSAUCEWT/jFJtwCazsUw9XNdukXdue+J?=
 =?us-ascii?Q?7rMVaEDeqPMXJk8xN5jDzQsdqKwelCkCfEk1sKrhmHkyII5nYREf+Gs1gr6E?=
 =?us-ascii?Q?i6KsKYfiw0odIvqPKVUe1xK4e4A37N5NjHoKFQia3vjVtVRWHpIqcb/gCnwa?=
 =?us-ascii?Q?V/zBzpYxbFRM7ay9vTnT+yxnLgyqSeZNh3bUO0V9i80lGERawLSOqAUq7i0A?=
 =?us-ascii?Q?rvtE0qX7rQhPq8qCfBLyE/NXIxrnEfSoBq/hb+WnpeHLNdZyReiZvRUlV+RD?=
 =?us-ascii?Q?s1t6dsc5gQOk008M/Iy6iy55VFVt8QVPaiL6y/BP7p5hoVGAC9MS12zizhMp?=
 =?us-ascii?Q?oX9mIKBvKVnXagH/dOb745SUoQg9O+sPa9KynOFbprMGeeLmnawoM2KcaVCM?=
 =?us-ascii?Q?iXigl9T/6b6Mfld5oOh9txat2ALJoW0YNA1xpwWAgaaRxdo9u84Eoje0/qSs?=
 =?us-ascii?Q?8/I3DHKbK7V6J3IFxz5lY3kqdG2k4nUluIh2PJT/Seh77CSwMNAIVTNgyJmf?=
 =?us-ascii?Q?XNwFXJJ4QvVZ7OLjHgBEyHEkCCr63URj9d1zgm9YnmbILPfi0/NDWZisJYP3?=
 =?us-ascii?Q?4iIDeTM4434EJqOhHu8yBZaMhjbrjfwPRTs2UPrcDGnDj5EHlBhNwpfX4cNY?=
 =?us-ascii?Q?1sOuJECpFMdv4MjjvYU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:32:52.8806 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e731552-d66c-4183-388a-08de176d63fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6091
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

