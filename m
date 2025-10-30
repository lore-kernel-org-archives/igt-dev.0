Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432DACCF9EA
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E479F10E8BD;
	Thu, 30 Oct 2025 04:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Mr+JJt6L";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013031.outbound.protection.outlook.com
 [40.93.196.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C6D10E8BD
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:33:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZc8Y7k0D3L8910ZWSSPSIyZqeVy51dKeihHjFDekv+OBY1dnY7iy8mtCaME48Y0XJk6UJdKzuuBgkYW3tzamyx1x32l8hEjYbJzo3duOaudzV0BgmmHrvBH8oFs68DVk34X5yfjFDY3U1c+tlF4djgGnz04iWlHI/6DUTwrr+37XUY89YE3nshfQCvlDaBcYDrgPPJN7HvkF1CJjbOy1i4yNZLfWpg34QCUhU1FqpZYpIfl/tKUEQnPIQ35eI0u3z0RpHpxzQOQcVOQx382YTME7aDkP7nGvvNC/EFlVfYfGLw2xi/A/m0yj0EY7e93Yj0uduJsOLFmArb98f0tQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HLHjCo3hBol0igZnzjurUpXMH4IhhZSItxpI7Gumg0=;
 b=IKTY8YULQMe82VAgakijDjBqUQFx9Xe+Jgxn9dIIp+tsSvUpEd7gMBqkv0DUlDHPKSpAFOD3ZxLr8/d6VE7rvxO7kU+pWQcWmVkm3+4xVGoSspaZ1maQqt2RPMUEXEUBFcKmMe4j0IZSJuGeSHxDNUQJYdI52mrvDpRq5FM+AvWCiZ6idAcDsq/bCu45XVYsFz74KZao2BlMbx3kO9pP7sZyI61UBNEt17KzPkkqIcZRcvCDCG3xKK2S7vhNG+F+cVolm12QlGR92ia6DMK/7q4E7ibNFOeL9i/PawKkJ/G0XO/rUrqFApxFuFYkymhlVQ8VYzcf2mW7dNyevRSJVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HLHjCo3hBol0igZnzjurUpXMH4IhhZSItxpI7Gumg0=;
 b=Mr+JJt6LChNXlwLd45ZmCvuQahnCb5bBn0KZouRk1oyQWwxiSJv0MK1SXBtxCbyaT82kyjKBs/Bh2MHMFA0swRheFHcbFBqUJ3j0M3fLYKViTMJdvtdDVuV5Ux8yJGZp5G50kv2zyhXvwl+iT6UQExkNdPdcNc8Kld1oSoDYUdM=
Received: from PH8PR05CA0003.namprd05.prod.outlook.com (2603:10b6:510:2cc::24)
 by DM4PR12MB9071.namprd12.prod.outlook.com (2603:10b6:8:bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 04:33:42 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:510:2cc:cafe::65) by PH8PR05CA0003.outlook.office365.com
 (2603:10b6:510:2cc::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.5 via Frontend Transport; Thu,
 30 Oct 2025 04:33:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 04:33:41 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:33:40 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 24/32] tests/kms_colorop: Add TF BT2020/BT709 tests
Date: Wed, 29 Oct 2025 22:27:53 -0600
Message-ID: <20251030042801.2315866-25-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|DM4PR12MB9071:EE_
X-MS-Office365-Filtering-Correlation-Id: 84556a20-0eb6-4d0b-472f-08de176d80d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UZ6LhYtqKqS/bDbLSpkgxSia7EsNCoGfOxFMnU220chkXfQfsi5h4/QBfUVq?=
 =?us-ascii?Q?G7CSA8RmaQuoW8LrBmQWOU8r1H5OjY+XZYjBpueaWPOnqcMXGtIudj5jTmPY?=
 =?us-ascii?Q?UKohH8OHLbfB5HrhufPNMd4ZAunwOiQDMc4UfWlsqEMBlfRAzYn2kb0l5+yl?=
 =?us-ascii?Q?WREcrAGfxacRWaNyQasYYrffSMKPTHBnMRu85DFUju8mnYXhOYdnjVKQkG1E?=
 =?us-ascii?Q?zCnyJQFMo1cV5C6NzYbR/dcAuucs/Azb2C73ysSCUsvue25rycablzU2rGVy?=
 =?us-ascii?Q?b3E2klHisM7LGxrUrmnCyNBZS6oxfG/ufvpIp63o+8v1yw1Np1UcRbW4jT4e?=
 =?us-ascii?Q?98vaiYpWZpgQiGCZpAoyyraR9aK8J60g3/tbUBt/SW/CUtgWphoN+HIUtzVx?=
 =?us-ascii?Q?+EYPDNQ8Qe+xHKHnlL6FN/KyBlCkkJsD0UfXpf825e8Zsx142mWDSWaK6fZA?=
 =?us-ascii?Q?fsr3S7jkuXNNvhDQI4nGgQeCdAxiLjmaOP3qPn7CM8OoWQUduCkOOFJ7xuhp?=
 =?us-ascii?Q?QhMTBj0kzR0HA0db/aNdHZPOiziy4T1Lk4455/5xdpcZmjfD4Dxqba9g5N3c?=
 =?us-ascii?Q?ea9INEVkiLsc3LVDh/2v1dxQn48srdPbwh5nsFPsLU8RghtHub0Ls4w9Khea?=
 =?us-ascii?Q?EhcJFJEwJ9I758oxJ4mCRf3xbuhT6zx6Xk1kKTB7R0dZd5Pj4Msx0iLGosom?=
 =?us-ascii?Q?UcBVPpUlxkwoG1lC4lmctJnmwepOk/Mo6L/+FBbrdbJdvzESPWoSdlHP+774?=
 =?us-ascii?Q?QNa7D7AZKPcFj2YQDEUodwcAvEdqspYljEUIjQy3NeIiVqg1cXg36eOrGa9r?=
 =?us-ascii?Q?UH8elqn5NHkUXLF+81RttF1S8l6JSEXKO0Pe6DGVzPsGQ5dI6D1elG3L+vDU?=
 =?us-ascii?Q?1FQMaglJ59hDwAHyUY9qa+ZT6HdnLD5J8J22ht1ZvKPsaAbwOdztAa/myoS+?=
 =?us-ascii?Q?ZUnQhlo5zXaCWmrWXfBjpx94a5V3IwRYGaUVSkgalupnKnq0ICKamdaQ1XqL?=
 =?us-ascii?Q?XhPKz4/pk252EUEf34A3omX3GCvqA/mPak6Aevk1T2EjZoEPXMw23r3JYTsn?=
 =?us-ascii?Q?jCU5Pp+ON7jgq5iqakjKJb4BTJA2/EGkVFvPMhRcKEK9E9zaw0cNyvwRxFTV?=
 =?us-ascii?Q?FKkFgcZNisUwrzr9nR7hDFNPYe0gVtL2s4pFmeFR535flAP/FXOhVyY+f2cu?=
 =?us-ascii?Q?nm9Fwj+DFYxxXRFZUUDR+EzuTbzWZM5009Ch9D8tMgDxaCAaSnmG4MuPA8Yk?=
 =?us-ascii?Q?LBSUMHXbjb3SNjWS29ZtLbkF18JHrCibhR16jaj6gCDPYIK9uiOU+odXZUPT?=
 =?us-ascii?Q?jyJb953fAxBNXlTTaNmA1aqJ6BcL/vG78jdDOKT+Fcup55fOKfDkBBMQ8sTB?=
 =?us-ascii?Q?e5gPQ2GLPUytMCsPdfmk+0WoJ06/51tOjmErrk1GtIi6SEdNxVpMdgv8z2H8?=
 =?us-ascii?Q?OS0nOMJf66gGlI/xGR5HxLM0SXL55zTU+yvY3x92/DNP40Ly06/03L6PQGVA?=
 =?us-ascii?Q?dViCUH7LU3KwuXpCUxZMFoJ7LIOJG6b6Zz1FLM/+xf+55sXRWeYPIDanhz6t?=
 =?us-ascii?Q?tlHvps2HcFgdkTpq/Kc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:33:41.2676 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84556a20-0eb6-4d0b-472f-08de176d80d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9071
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

Add tests for OETF, Inverse OEFT and INVERSE OETF -> OETF.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c |  6 ++++++
 tests/kms_colorop.h | 22 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 6aaa38fde..e098c0ffc 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -32,6 +32,9 @@
  * @srgb_inv_eotf:			sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf:		sRGB EOTF -> sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf-srgb_eotf:  sRGB EOTF -> sRGB Inverse EOTF -> sRGB EOTF
+ * @bt2020_inv_oetf:			BT.2020 Inverse OETF
+ * @bt2020_oetf:			BT.2020 OETF
+ * @bt2020_inv_oetf-bt2020_oetf:	BT.2020 Inverse OETF > BT.2020 OETF
  * @pq_eotf:				PQ EOTF
  * @pq_inv_eotf:			PQ Inverse EOTF
  * @pq_eotf-pq_inv_eotf:		PQ EOTF -> PQ Inverse EOTF
@@ -441,6 +444,9 @@ igt_main_args("d", long_options, help_str, opt_handler, NULL)
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
index d5656d813..bfa1030e0 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -25,6 +25,8 @@ typedef enum kms_colorop_type {
 typedef enum kms_colorop_lut1d_tf {
 	KMS_COLOROP_LUT1D_SRGB_EOTF,
 	KMS_COLOROP_LUT1D_SRGB_INV_EOTF,
+	KMS_COLOROP_LUT1D_BT2020_INV_OETF,
+	KMS_COLOROP_LUT1D_BT2020_OETF,
 	KMS_COLOROP_LUT1D_PQ_EOTF,
 	KMS_COLOROP_LUT1D_PQ_INV_EOTF,
 	KMS_COLOROP_LUT1D_PQ_125_EOTF,
@@ -35,6 +37,8 @@ typedef enum kms_colorop_lut1d_tf {
 const char * const kms_colorop_lut1d_tf_names[KMS_COLOROP_LUT1D_NUM_ENUMS] = {
 	[KMS_COLOROP_LUT1D_SRGB_EOTF] = "sRGB EOTF",
 	[KMS_COLOROP_LUT1D_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+	[KMS_COLOROP_LUT1D_BT2020_INV_OETF] = "BT.2020 Inverse OETF",
+	[KMS_COLOROP_LUT1D_BT2020_OETF] = "BT.2020 OETF",
 	[KMS_COLOROP_LUT1D_PQ_EOTF] = "PQ EOTF",
 	[KMS_COLOROP_LUT1D_PQ_INV_EOTF] = "PQ Inverse EOTF",
 	[KMS_COLOROP_LUT1D_PQ_125_EOTF] = "PQ 125 EOTF",
@@ -89,6 +93,24 @@ kms_colorop_t kms_colorop_srgb_inv_eotf = {
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

