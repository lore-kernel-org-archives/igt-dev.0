Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DC2C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5761E10E471;
	Mon, 19 Aug 2024 20:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kibeDrNL";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FF110E46B
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8vbXXSqsrRs2SUAaA9ei6jlTVm9fZnTZLQSxAeHLisMoz2XWROqwRaY0FxYppGvbMOCqMFMpSx8IZG6x3lQ6LQUuROGQiygaIW3zoWBANKH9rtm1XODElxCbZGYwulvPDUMVIpaf3fV9pimxfPMTxNvBeWCaEy/ozkxH299zOJ2s1D+oisn/D72wlfmiRHl0GVqzQqrJa6iBJYiQNvFtHdUGa8w1O7a5qqEoO661S0XZ5nplkRaxCjqGHrlmXfWSA5MhQZG5Yl/A86H7jOM6VJosv6sY7O4jzSR9fsEezKUbSlQfFUfoDTCownHdfk8wYsNfq6UlTefO7mjKl3WWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUaoEROKzt57clVhkO6DY8SQ3Enbh2fJgQMzxtDQrLc=;
 b=duY0OmMb2BR8z/IYDpB0TOcNALinwytgVzr5g+0wtCK1fYILGQ0axvrmgVCO8cHbRj9pH3wYuBEwTnmHbFTevfaFhHVE58wwuzGZ4sqj7cqEfXVhmzKGCG4VxEJwTTTET//S3PfjrfaiIBYNUCQtaFfJDmz09g7fLxGmYG0RIaBXUYyry3pDFzd99/OW668l+XqTYEjTGCXpEoYjw6xG0cod1UqfQIpIjb9mnHIPHLJdhYWjTRwnu47Q8td6bdR/Bvsg8VtjIcw7sdTJxItkiDR5740GIBqVGJCeC3JGYKMhCFUDrktSq5XRxNFkfnN0oF0/qTz4TJtk+Zt9O+r5Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUaoEROKzt57clVhkO6DY8SQ3Enbh2fJgQMzxtDQrLc=;
 b=kibeDrNLbKdhSqbRxAKieHayu1IUnslOtZHMqhUqsQUJcJVC+ySpurlqHkIQzFIR4wg8zzdDRPqYd8qpnAnE++9E0jt7F1R/M7S/zP3Q9PPLXgVD64pQhURPwywBFPhuPB45zZUu2XxR6ReUXBD8K1NwcTYZ5rYx6KnUPitX2/o=
Received: from BN0PR02CA0059.namprd02.prod.outlook.com (2603:10b6:408:e5::34)
 by CH3PR12MB8458.namprd12.prod.outlook.com (2603:10b6:610:155::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Mon, 19 Aug
 2024 20:58:39 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:e5:cafe::da) by BN0PR02CA0059.outlook.office365.com
 (2603:10b6:408:e5::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.22 via Frontend
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
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:38 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:38 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 25/37] tests/kms_colorop: Add tests for PQ variants
Date: Mon, 19 Aug 2024 16:58:11 -0400
Message-ID: <20240819205823.316656-26-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|CH3PR12MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: def85d94-aed1-4b7a-8e83-08dcc091b33b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HlhGyAmGDLNbiefowSUWLIuackWrjl7vneuAQL9eaHL+lisBPPjeOaLfQdm4?=
 =?us-ascii?Q?McfTHYhTUl0V+cdsvQaFEkGziNplntICNmYs66IV9T1d6Ci7NocDSEjNtbGh?=
 =?us-ascii?Q?vrRByUBIaenqU1MK7y0MpGjvFoBHhtIkDQln53CtLlTvwhYxS08betmRzbdz?=
 =?us-ascii?Q?aOwTekNcVhgKhIZUP3ti8PGV4yOz/P9Q70BPf4M8SAxGwfDe2q3f3l0Zm0pt?=
 =?us-ascii?Q?56ZuKvMA8LT0vXWhBDHiJszMpbgcW8mGyWiVfNPgVOEJDll2VFIJduQp21SL?=
 =?us-ascii?Q?qyWKzDqSjGp9mNg1V5q5sLS56IBJUZFusz/c2G087GFen0hybDQGrwZk1ZB/?=
 =?us-ascii?Q?rEJ56SXeyJ16cYm8yk0ij9l1AjrRvUwlv+EVPhmARsgxLfFkhOjxT0RNp7Br?=
 =?us-ascii?Q?ZSmmvyJujjxid1f/YRDcBs9EOYldF1orXdnyP1OWL0fc8ayCrzjjemIEyIPq?=
 =?us-ascii?Q?Didu79xpmz1Zcr3HZACi7l78NjTTDsmeE8lJziSzyGoXGYX4e6Fa8xh9+IWq?=
 =?us-ascii?Q?sOUQNkcqAw1GUrsz/J0H6XdLjJS3wRmlIIIwK/9aJq+ZA8T0l0ElvPneS5JH?=
 =?us-ascii?Q?2f1uzhk/LwMR1jDVvrVaxuveBm1qReaKQPR+JirYW1ieb+LBcj4qm5gz+V+Y?=
 =?us-ascii?Q?vKDRfYuN4RDRrEZk4J0HHtn6zAS7w67XgZfMwrcXfgJsmClyErWxHxRb7VZt?=
 =?us-ascii?Q?cYj42VmDqmKD/uwRAU44fHqNdXnubHCwjDlPsyvun4PjLe4CXle268n9CwSZ?=
 =?us-ascii?Q?aJr3Kt6j3l75gGn9hfjQxxJhRUj9hQDqceOIgnAd3sI3+ClF7Jl3tFc8WVM/?=
 =?us-ascii?Q?Lij8nC8Zea+KQtDnxSP+jOlHHsvxiKYpv/+86iLBT0B0frJk43sKajCv31Ai?=
 =?us-ascii?Q?cN9ieNx8heusmTBGdnFEsEs4wcxw5D+k4NWWqnpc7nZTRi2yYpGb3/N8615d?=
 =?us-ascii?Q?S0duGBQMQX+0cuyKRhOdsrrPYHa5RQpIPY8sVLxWc+VWV9dpKq6vGfJLvKZ3?=
 =?us-ascii?Q?1sCKLwASRYGaRWTGb3db6CVRGnH7IoBOpZxeqviG7W15oRy0rxzxHtt+2gxN?=
 =?us-ascii?Q?HttFkcciiZEf9FJV/3+d8POiJFYotynsXwUmt50tsBDtgoRoKROH73RcwiN/?=
 =?us-ascii?Q?gzN8gYBvuIkaDooFXovLP9nuL0LV2IKFaYw8SKHfkA2rJVbJpmL9B4DxC7EZ?=
 =?us-ascii?Q?NUR14s7+aReuKT/0WC3m0JsjciZ6DSZ97Gj8BBdN68TYouSlgqbycc2+/nN7?=
 =?us-ascii?Q?FlvIK9C2bSqRIuG8ALv4/FhAnz8IoofzRXXhi1gH1sbiNLIumUdw1/ThC7rQ?=
 =?us-ascii?Q?jpK1jYyGdO67uyDVnSmhqY1SF81mUjLuqLWAGCO8FbSlGIiLMAtab5aj6UQY?=
 =?us-ascii?Q?evUJAzeJ+CHWLRfdD/WrRl0jDGXd4pC+iiuMHnfRzykQz2KMLbbic8cmUt8J?=
 =?us-ascii?Q?QdioRLRFNuJpjDtOi8ZbzlVaop8gL/9o?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:38.8958 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: def85d94-aed1-4b7a-8e83-08dcc091b33b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8458
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

Add tests exercising the PQ EOTF and its inverse, both
for the [0.0, 1.0] variant as well as the [0.0, 125.0]
scaled variant.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 32 ++++++++++++++-----------
 tests/kms_colorop.h | 57 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+), 13 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 659fe63a5e4d..538c527f6d5c 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -49,6 +49,13 @@
  * @srgb_eotf:                  sRGB EOTF
  * @srgb_inv_eotf:              sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf:    sRGB EOTF -> sRGB Inverse EOTF
+ * @pq_eotf:                    PQ EOTF
+ * @pq_inv_eotf:                PQ Inverse EOTF
+ * @pq_eotf-pq_inv_eotf:        PQ EOTF -> PQ Inverse EOTF
+ * @pq_125_eotf:                PQ EOTF for [0.0, 125.0] optical range
+ * @pq_125_inv_eotf:            PQ Inverse EOTF for [0.0, 125.0] optical range
+ * @pq_125_eotf-pq_125_inv_eotf: PQ EOTF -> PQ Inverse EOTF with [0.0, 125.0] optical range
+ * @pq_125_eotf-pq_125_inv_eotf-pq_125_eotf: PQ EOTF -> PQ Inverse EOTF -> PQ EOTF with [0.0, 125.0] optical range
  * @ctm_3x4_50_desat:		3x4 matrix doing a 50% desaturation
  * @ctm_3x4_overdrive:		3x4 matrix overdring all values by 50%
  * @ctm_3x4_oversaturate:	3x4 matrix oversaturating values
@@ -213,7 +220,10 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 {
 	switch (desired->type) {
 	case KMS_COLOROP_ENUMERATED_LUT1D:
-		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE);
+		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE &&
+		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_CURVE_1D_TYPE, kms_colorop_lut1d_tf_names[desired->enumerated_lut1d_info.tf]))
+			return true;
+		return false;
 	case KMS_COLOROP_CTM_3X4:
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_CTM_3X4);
 	case KMS_COLOROP_CUSTOM_LUT1D:
@@ -293,18 +303,7 @@ static void set_colorop(igt_display_t *display,
 	/* TODO set to desired value from kms_colorop_t */
 	switch (colorop->type) {
 	case KMS_COLOROP_ENUMERATED_LUT1D:
-		switch (colorop->enumerated_lut1d_info.tf) {
-		case KMS_COLOROP_LUT1D_SRGB_EOTF:
-			igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, "sRGB EOTF");
-			break;
-		case KMS_COLOROP_LUT1D_SRGB_INV_EOTF:
-			igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, "sRGB Inverse EOTF");
-			break;
-		case KMS_COLOROP_LUT1D_PQ_EOTF:
-		case KMS_COLOROP_LUT1D_PQ_INV_EOTF:
-		default:
-			igt_fail(IGT_EXIT_FAILURE);
-		}
+		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, kms_colorop_lut1d_tf_names[colorop->enumerated_lut1d_info.tf]);
 		break;
 	case KMS_COLOROP_CTM_3X4:
 		igt_colorop_set_ctm_3x4(display, colorop->colorop, colorop->matrix_3x4);
@@ -490,6 +489,13 @@ igt_main
 		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
 		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" },
+		{ { &kms_colorop_pq_eotf, NULL }, "pq_eotf" },
+		{ { &kms_colorop_pq_inv_eotf, NULL }, "pq_inv_eotf" },
+		{ { &kms_colorop_pq_eotf, &kms_colorop_pq_inv_eotf, NULL }, "pq_eotf-pq_inv_eotf" },
+		{ { &kms_colorop_pq_125_eotf, NULL }, "pq_125_eotf" },
+		{ { &kms_colorop_pq_125_inv_eotf, NULL }, "pq_125_inv_eotf" },
+		{ { &kms_colorop_pq_125_eotf, &kms_colorop_pq_125_inv_eotf, NULL }, "pq_125_eotf-pq_125_inv_eotf" },
+		{ { &kms_colorop_pq_125_eotf, &kms_colorop_pq_125_inv_eotf, &kms_colorop_pq_125_eotf_2, NULL }, "pq_125_eotf-pq_125_inv_eotf-pq_125_eotf" },
 		{ { &kms_colorop_ctm_3x4_50_desat, NULL }, "ctm_3x4_50_desat" },
 		{ { &kms_colorop_ctm_3x4_overdrive, NULL }, "ctm_3x4_overdrive" },
 		{ { &kms_colorop_ctm_3x4_oversaturate, NULL }, "ctm_3x4_oversaturate" },
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index 30278ca4edbd..3188e6db4300 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -44,8 +44,20 @@ typedef enum kms_colorop_lut1d_tf {
 	KMS_COLOROP_LUT1D_SRGB_INV_EOTF,
 	KMS_COLOROP_LUT1D_PQ_EOTF,
 	KMS_COLOROP_LUT1D_PQ_INV_EOTF,
+	KMS_COLOROP_LUT1D_PQ_125_EOTF,
+	KMS_COLOROP_LUT1D_PQ_125_INV_EOTF,
+	KMS_COLOROP_LUT1D_NUM_ENUMS
 } kms_colorop_lut1d_tf_t;
 
+const char * const kms_colorop_lut1d_tf_names[KMS_COLOROP_LUT1D_NUM_ENUMS] = {
+	[KMS_COLOROP_LUT1D_SRGB_EOTF] = "sRGB EOTF",
+	[KMS_COLOROP_LUT1D_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+	[KMS_COLOROP_LUT1D_PQ_EOTF] = "PQ EOTF",
+	[KMS_COLOROP_LUT1D_PQ_INV_EOTF] = "PQ Inverse EOTF",
+	[KMS_COLOROP_LUT1D_PQ_125_EOTF] = "PQ 125 EOTF",
+	[KMS_COLOROP_LUT1D_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
+};
+
 typedef struct kms_colorop_enumerated_lut1d_info {
 	kms_colorop_lut1d_tf_t tf;
 } kms_colorop_enumerated_lut1d_info_t;
@@ -85,6 +97,51 @@ kms_colorop_t kms_colorop_srgb_inv_eotf = {
 	.transform = &igt_color_srgb_inv_eotf
 };
 
+kms_colorop_t kms_colorop_pq_eotf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_PQ_EOTF
+	},
+	.name = "pq_eotf",
+	.transform = &igt_color_pq_eotf
+};
+
+kms_colorop_t kms_colorop_pq_inv_eotf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_PQ_INV_EOTF
+	},
+	.name = "pq_inv_eotf",
+	.transform = &igt_color_pq_inv_eotf
+};
+
+kms_colorop_t kms_colorop_pq_125_eotf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_PQ_125_EOTF
+	},
+	.name = "pq_125_eotf",
+	.transform = &igt_color_pq_125_eotf
+};
+
+kms_colorop_t kms_colorop_pq_125_eotf_2 = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_PQ_125_EOTF
+	},
+	.name = "pq_125_eotf",
+	.transform = &igt_color_pq_125_eotf
+};
+
+kms_colorop_t kms_colorop_pq_125_inv_eotf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_PQ_125_INV_EOTF
+	},
+	.name = "pq_125_inv_eotf",
+	.transform = &igt_color_pq_125_inv_eotf
+};
+
 kms_colorop_t kms_colorop_ctm_3x4_50_desat = {
 	.type = KMS_COLOROP_CTM_3X4,
 	.matrix_3x4 = &igt_matrix_3x4_50_desat,
-- 
2.46.0

