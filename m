Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F053EC3ABA5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:40:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD1010E6A2;
	Wed, 30 Apr 2025 01:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MM57eEqw";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F6D10E6A2
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:40:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z6vu3cjhsnPWKtP/fJzqb5IhphEJiHdIqtkEsKv8/2MNTqcY7sqi3l2eE2QwIYCZJcqX8hCvwjmjyepQbdc9cuhL84ZFfttakgOE5kpuCdPMX+FXrswS3wqBUpsEqO8x7+f2jNEievvI7oo9pdAugFbWybp9ljN+yx2ERgKg29VaNrjQRk/Vs7CMVwnBEm2v3WZf9ZifqoDTdP3SyL+YtRNCRNk2I49PNXUWLtnHLfng/mmRCWjmwN1NIpthzjI3ys+HyP9uLY5IB1ATiT9i7jPVAoQKa6Aa2NvbK2VQH2byxDT6GmQOATZ43XSBrsncZxk8C9uwnGUSutPRJXPAEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgOfKGkX8NHOSsLj3m23oGpiywtRXT1MK+qWhgkR6rE=;
 b=oHVA5KkyuBuQYz9fShnwXwRCr1a3cUXpBEQnnyP69/TTVM0QZWvQpNq9xYjSr2CBiK99vXaMByJad/bAL74B83usLvSYAFdWFnTzji9Nu1PwGJFllt+R7Ytxx3PQhnJPz4d0+XoCmuO3oL933gwHIrBm2Jh7K7upXo+8odVq2pqJ56NW4fQCWeu7ws0iwwD86GUt/1jrG1P/9vWvDGSY8SMl/xtVj15dfGJgLPrLGDN0UFVr6hqVI5gThpEMTakAcnc+V+S9Ra/eu9Fo4EBxNNjwIlxmS1NNsYyguUiYJwtSZCeQ5f5rhiIkj9Qd1BWIK19MsdJxdwaCSvhTPqn1Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgOfKGkX8NHOSsLj3m23oGpiywtRXT1MK+qWhgkR6rE=;
 b=MM57eEqwmzI/WJxI+L27tG0oJ/XbgRLfo3usYMQYrIrYISAf3rrUQjvgCfZB8D3O6sxAPDpVCnGXKVi9MLeTacKQWcCahGV9R/hEPKfYITCyK1Jwcyd5PrrRmOCHX0unJLAeLVbesyVlCNSla/9TGSxjNThRRWIKOvVSO/X3ARs=
Received: from MW4PR04CA0297.namprd04.prod.outlook.com (2603:10b6:303:89::32)
 by SJ5PPF4C62B9E70.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::991) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Wed, 30 Apr
 2025 01:40:51 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:303:89:cafe::d7) by MW4PR04CA0297.outlook.office365.com
 (2603:10b6:303:89::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 30 Apr 2025 01:40:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:40:50 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:40:49 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 27/36] tests/kms_colorop: Add tests for BT2020/BT709 TFs
Date: Tue, 29 Apr 2025 19:34:45 -0600
Message-ID: <20250430013454.226910-28-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|SJ5PPF4C62B9E70:EE_
X-MS-Office365-Filtering-Correlation-Id: 16e3b597-b23d-45bf-56c4-08dd878809ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BJSybzkBGn+g+Z/D6EpTOyU4BDdQRQKLbHjd8DLQSkmJjWMH9HGxncG8Q7QG?=
 =?us-ascii?Q?NcHkquvS2mgfXKDxq+yEXHysx8c2al/UYtnI825c8df+lARIFAhULAEKGIH7?=
 =?us-ascii?Q?4UvcCkrAO/9nl3T4U47ZdhrFghj1Im75eI8byQ9UrJ8vju/GKJGl5lXBatae?=
 =?us-ascii?Q?EB6CmSzk9bokYwS7sPh9wz/1Uapp+fiXpstcRH0FpIswvtSmrkb4+gmLKl6j?=
 =?us-ascii?Q?e2dJ151voN7eKy8qFIyv0h8L0A7znq6wYvw+RWi2f1IudlImVIDjCmiSzh8j?=
 =?us-ascii?Q?1OnEQFSo56bjnmpjp13XEfZdtr2QssjAQx62ADplnblq6WkQn1tJaBDyasQX?=
 =?us-ascii?Q?3ATLenhifJVMINzWs5iH22dY7Sud+dw44/mKwU7Bfm5i3ifvj70JMtR3WZld?=
 =?us-ascii?Q?yiLWh8GnZtNuz3PuvPjw7nHp3QHT45HHvqhYbNro2CMrjJXxkUvmO12sdjaV?=
 =?us-ascii?Q?xMpqmWxAr5ugsFNizPoAdxN6GPPLsu8/B8xwoE9PtIetKoz8tfNJdNJXPd6D?=
 =?us-ascii?Q?3Ss2vF+kklEqPdchVaM9g5OwrV+90dItNblrruV9u+DZTjRba2CnEtYN3CFR?=
 =?us-ascii?Q?5bQKGZjAh6zHp0Yl+nkktS9TEFArTzwEhDt2qEmsukteOPXKOcs77Y0CQdnS?=
 =?us-ascii?Q?aQvvxNml/cqFQzfvnqe+nOfQGUos8GMnUZvn28Ei/KoLMH85ESn1naknN5R8?=
 =?us-ascii?Q?6AImKVE8QYcwn6diThb+M5FjW+VNxEJZfq/8nEeQTG40KCan/h6R/O7HbCBN?=
 =?us-ascii?Q?xoS9o8SdtEDQNFX4kXf7DKR4Dw2kyaz71bur1e8vtSYoo4eK4ykiu17FUm3N?=
 =?us-ascii?Q?5HWi9SPd/PcoJq+kybLJxJLqAZ68eFn3vN5ZdENcB1rAJCtgnBoRROFug7wp?=
 =?us-ascii?Q?xtqgAb0IoESexlljcUKk50WqYPE5iAJ5UvMxVXvv9CocK8RZNCMYiZ6Qf36F?=
 =?us-ascii?Q?wcRpIkNs35NwSCUF4oMUfGn2EUyLtccVkA0PxfYcejAAN/IvTYaQO3KCJtvV?=
 =?us-ascii?Q?gC5iBTHt7xZPb5KAYbwI08Ct9r64VPseGRJs67CDxZzqzS1kJiSXH4ZO4rSO?=
 =?us-ascii?Q?El3Yjqd9fwaJerxmYMYLXoPumpywHlUapNOkqMaTJyCE19OBQLD7B5VKRJs1?=
 =?us-ascii?Q?dbPdUZVtIWdrk2V9f235Qvl1OnoGEPsuu3HWPIrfgcwvYCf69kTiaSRFDXoz?=
 =?us-ascii?Q?M+lr0PZBTI1FiHTo9R35U8Cm8giFlYv6HiRs+ub5zHeFweeaX3feYk50BaMM?=
 =?us-ascii?Q?6pgptfJTNnU9btdKecMlJe403hp5Jm8qcZCwcZZOcK55XxRNF5JFDlAfFIAr?=
 =?us-ascii?Q?IjzLCfW3o+r1D0PBuO/UEvgDRB13F+z8gSq4U/NFMd52WPnua3Mdk3FTd4P3?=
 =?us-ascii?Q?4M51MR78ZktY6bM/633neu4JuHxQJTsfZOrtmTmfOfLethlL9lDZzYdcgbnh?=
 =?us-ascii?Q?cYadSdYfmM6DmWPB5oReHpH6GHFPlNJX4q7cmDbD+MPZfBsYATU+NZdUPuS5?=
 =?us-ascii?Q?hGktowozJvQztAuYM6/gnGqlbUHkaAVZxscG?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:40:50.6981 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e3b597-b23d-45bf-56c4-08dd878809ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4C62B9E70
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c |  6 ++++++
 tests/kms_colorop.h | 22 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index c146e85d9..0f2feb50f 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -49,6 +49,9 @@
  * @srgb_inv_eotf:              	sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf:    	sRGB EOTF -> sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf-srgb_eotf:  sRGB EOTF -> sRGB Inverse EOTF -> sRGB EOTF
+ * @bt2020_inv_oetf:			BT.2020 Inverse OETF
+ * @bt2020_oetf:			BT.2020 OETF
+ * @bt2020_inv_oetf-bt2020_oetf:	BT.2020 Inverse OETF > BT.2020 OETF
  * @pq_eotf:                    	PQ EOTF
  * @pq_inv_eotf:                	PQ Inverse EOTF
  * @pq_eotf-pq_inv_eotf:        	PQ EOTF -> PQ Inverse EOTF
@@ -491,6 +494,9 @@ igt_main
 		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, &kms_colorop_srgb_eotf_2, NULL }, "srgb_eotf-srgb_inv_eotf-srgb_eotf" },
+		{ { &kms_colorop_bt2020_inv_oetf, NULL }, "bt2020_inv_oetf" },
+		{ { &kms_colorop_bt2020_oetf, NULL }, "bt2020_oetf" },
+		{ { &kms_colorop_bt2020_inv_oetf, &kms_colorop_bt2020_oetf, NULL }, "bt2020_inv_oetf-bt2020_oetf" },
 		{ { &kms_colorop_pq_eotf, NULL }, "pq_eotf" },
 		{ { &kms_colorop_pq_inv_eotf, NULL }, "pq_inv_eotf" },
 		{ { &kms_colorop_pq_eotf, &kms_colorop_pq_inv_eotf, NULL }, "pq_eotf-pq_inv_eotf" },
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index 7d5cb4bd1..7b98198f6 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -42,6 +42,8 @@ typedef enum kms_colorop_type {
 typedef enum kms_colorop_lut1d_tf {
 	KMS_COLOROP_LUT1D_SRGB_EOTF,
 	KMS_COLOROP_LUT1D_SRGB_INV_EOTF,
+	KMS_COLOROP_LUT1D_BT2020_INV_OETF,
+	KMS_COLOROP_LUT1D_BT2020_OETF,
 	KMS_COLOROP_LUT1D_PQ_EOTF,
 	KMS_COLOROP_LUT1D_PQ_INV_EOTF,
 	KMS_COLOROP_LUT1D_PQ_125_EOTF,
@@ -52,6 +54,8 @@ typedef enum kms_colorop_lut1d_tf {
 const char * const kms_colorop_lut1d_tf_names[KMS_COLOROP_LUT1D_NUM_ENUMS] = {
 	[KMS_COLOROP_LUT1D_SRGB_EOTF] = "sRGB EOTF",
 	[KMS_COLOROP_LUT1D_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+	[KMS_COLOROP_LUT1D_BT2020_INV_OETF] = "BT.2020 Inverse OETF",
+	[KMS_COLOROP_LUT1D_BT2020_OETF] = "BT.2020 OETF",
 	[KMS_COLOROP_LUT1D_PQ_EOTF] = "PQ EOTF",
 	[KMS_COLOROP_LUT1D_PQ_INV_EOTF] = "PQ Inverse EOTF",
 	[KMS_COLOROP_LUT1D_PQ_125_EOTF] = "PQ 125 EOTF",
@@ -106,6 +110,24 @@ kms_colorop_t kms_colorop_srgb_inv_eotf = {
 	.transform = &igt_color_srgb_inv_eotf
 };
 
+kms_colorop_t kms_colorop_bt2020_inv_oetf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_BT2020_INV_OETF
+	},
+	.name = "bt2020_inv_oetf",
+	.transform = &igt_color_bt2020_inv_oetf
+};
+
+kms_colorop_t kms_colorop_bt2020_oetf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_BT2020_OETF
+	},
+	.name = "bt2020_oetf",
+	.transform = &igt_color_bt2020_oetf
+};
+
 kms_colorop_t kms_colorop_pq_eotf = {
 	.type = KMS_COLOROP_ENUMERATED_LUT1D,
 	.enumerated_lut1d_info = {
-- 
2.43.0

