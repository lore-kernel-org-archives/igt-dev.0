Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE554C5320E
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9036E10E486;
	Mon, 19 Aug 2024 20:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UCVm0LOC";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE71710E48A
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULgRiN+FqJI44svMIQ79LFahVwIumsIOgzBZFp+0FE+fZyfoqA2Uygj2IRSryuvp3+jUt0Wsg5orhoBnGhDDJyOMGuNqTg9FQiFeWg/hMxrg5tt6wHCXSEGdbhT0kG+ugcZ31sk5TJoUKB4ZDAcKXlTnZPQEeDBVJfZZR0uxwGt7mtdr8lYLiRRrn46H1u9qXF/dqacXmgu5AJgIhMfop0gStBdXh8Lvc4xTb7f9ZI89DKXH64USdxmdKcMTRnzQqpHGywHRKgrmAaWxPKDdW1/b0nR9/01YLXhmrWtNh+RcGTWyfRemhnGRsIUskSCDEtUCEdnd2rfEGQb29lCeTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sd+M9QyRtkXuikDrgJQw048kpviD6L1QFXHNTH65Zo=;
 b=TEoaQ9NDnRtgJJBUWAfGIWikE3VoqcrKY8BZr4EBcY+Qgfind/USEgKZHVrsVUbNFqMWjlHSaMDnasQxrKjfV5xWWqwSerAJ2EJApXWKa3b3ocz+0wyXkPtiQQzLLmZyTHJsQUURQQzaB9RP2RLiJw1v2O/iG/jKsTzbmV/p7DycX6mM+iSRFN2ohlmzwqjfs+KINpUAjqoyxN1F9ayuHkJ01tnGjw90hnav2GjIUXhO3s2GKey9XmdNT5rs1CvYMjBcb/n8XYj17QSjU1M9bHRrWwCZ+jPWzunQdk3PtYyJJHEacrSVMtBIAhNDG2OYUhHCsplfuFED1BFJ1JEhBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sd+M9QyRtkXuikDrgJQw048kpviD6L1QFXHNTH65Zo=;
 b=UCVm0LOCHYRRtLGq82YgJCWk+zYS+BK96FOE17PCg31L6Lbzq6ZVVMTHOx6kOAJj/5qgMpAgBUiiGAaDPiyWup5HhXju+mShU3/r7I+b9FwKfOPFPUxSghmCZp50kmuzNZBGHgOYfNeV4Vzfn2XtasZxVoBKy/ZH4unzeHmD+VM=
Received: from BN0PR02CA0033.namprd02.prod.outlook.com (2603:10b6:408:e5::8)
 by IA1PR12MB7590.namprd12.prod.outlook.com (2603:10b6:208:42a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:40 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:e5:cafe::c0) by BN0PR02CA0033.outlook.office365.com
 (2603:10b6:408:e5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:40 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:39 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 28/37] lib/igt_color: add BT2020/BT709 transfer functions
Date: Mon, 19 Aug 2024 16:58:14 -0400
Message-ID: <20240819205823.316656-29-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|IA1PR12MB7590:EE_
X-MS-Office365-Filtering-Correlation-Id: 723945b7-32a5-48e7-356a-08dcc091b425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RzqZ5lffq7dlb0FvbSJR1ko7rPTXCP2h7AdOLyfH9Y/q2SD/xkW+tfedo1M6?=
 =?us-ascii?Q?h8MvQ8TzmlGNY0ulQPE95pUxCVTrS5+Riwvbm2spjTurJaWtuMsj81n2O8qb?=
 =?us-ascii?Q?z6u+67RwxTM9zDzZxNxZgiTMDE0u3F8Fvh3gVL6zRr+ojNfBvGdOg4cLMhmc?=
 =?us-ascii?Q?xHhIlggIxDHpEH7yXLDgYST6DewxRzF5ZmYRukwfHJdqU5qjezkei+1O1I4P?=
 =?us-ascii?Q?NmcgFLnwUA1tr/zvzmeAQ4sJG54S+Dn5aC+9OeHaWHvdcmxcJUBnRo3JlAVg?=
 =?us-ascii?Q?UInDd+5elxgb7fx1zT3MWP+J3zmMExAxMn9LpztI7A1J6hVRmwzzEhi1DbFs?=
 =?us-ascii?Q?mAQqUdlz5ft7UBIC+x1qv7KgWoW8KyTyk5bxvvyLin0lrDQ30H5YGsa5yDET?=
 =?us-ascii?Q?7+Uwmp4Z6g9qWpNz+iF1iCkzHnA8ruujzW8vhhTdsJ4d6dlxm0G3rMwXOmyf?=
 =?us-ascii?Q?Y7OGMjjYRqAtADggLEUfLvS4MkQ2TTSyiTPmVxp2hsxteZUXA4887kdcqSNx?=
 =?us-ascii?Q?0+dznLs+n1RbiaV2RWB1a19LuKk/x+Ke/A/pNhp9oWQDDUEUbKHdmmVGKBGo?=
 =?us-ascii?Q?46ZNlcSZg9OHHt9gTNGUtJoUhLFNeJBGWUTCBmO5FnjoQAqmw2YDzmAhlS7D?=
 =?us-ascii?Q?XMcDirY5L1JwRAMaP2ZgopNbg7XEQ0Bv1bRsBSSVN3hnvggGP37WoyqglAa5?=
 =?us-ascii?Q?Id9ho6FUmxeRnQ3bP7JaJH2Li7qeByofckwPe2emKETz4Jo4hM8apv9yEy08?=
 =?us-ascii?Q?bDMqE9bVIneAUEJ64keqMDVcOomTxgYRZdJGNqJbZNccVl17/dt9WFI/GKIr?=
 =?us-ascii?Q?7P2a3OulsijQJa3ucEuOBf8+Sw+Va9OzEkGLnQbOpSNb4QTh00SBN8PNgRlD?=
 =?us-ascii?Q?gAxditmyZj8qogcsTU9JMpV52DvaxDIU7ERA4wOIH7Rvh+GD8Y+RqrVfy6D8?=
 =?us-ascii?Q?GgTmoo40bJSGXnVtnpmR04OIE9GQL7EMK+luwtPyNxW05oovLgmhD4Jhzlth?=
 =?us-ascii?Q?UMls4eoFdO4YP1NyBIiD7U27dHvSiMBcOFrahW/mwODBBkekKtf1naRIIGNI?=
 =?us-ascii?Q?G3TMJNpUtvPOWcxdE7EIACVV3+JKtY3OKBv4xJC/zPJ7p5lnQ2XpmjUxUA49?=
 =?us-ascii?Q?tSabiiegmK1ozgGT8wrFdf9fo6UBrQ/zBB3ZBJqxkwSgPUbfXSTbaso2QPFa?=
 =?us-ascii?Q?S9i6JfLGAXaagDKgXurjxC+PCL6ZEg7stBD0H2IN90as2BoAK0frYdOOnAtK?=
 =?us-ascii?Q?6kzVxpBN1oo9p4jhYJUp2K86O6NXWbBOrTURZnAUpiGdwE5ZZI2lE2MGilyu?=
 =?us-ascii?Q?aEL6QaMT21m6lG4rDKgAHxhPF6vuqEtV3yvbVjn9g+3SHSMrgVj/OirSAKXY?=
 =?us-ascii?Q?G1LjlTNuI41y05slf13TsgyZMno5OWpJ9C2QVc86m8XOOsbx0EPj1MADYovS?=
 =?us-ascii?Q?g6o+yY3AXUZ72b1lEcyrXJNaapDoOdIg?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:40.4271 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 723945b7-32a5-48e7-356a-08dcc091b425
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7590
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

BT.709 and BT.2020 transfer functions are identical, the
only difference beind that BT.2020 is defined with a higher
precision for 10 and 12 bpc encodings.

These transfer functions are defined as OETFs, not EOTFs,
so we create functions for them as OETF and its inverse.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color.c | 10 ++++++++++
 lib/igt_color.h |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index 0926385f4d82..ec8b27d1ef6f 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -107,6 +107,16 @@ void igt_color_srgb_inv_eotf(igt_pixel_t *pixel)
 	igt_color_inv_tf(pixel, &srgb_eotf);
 }
 
+void igt_color_bt2020_inv_oetf(igt_pixel_t *pixel)
+{
+	igt_color_tf(pixel, &bt2020_inv_oetf);
+}
+
+void igt_color_bt2020_oetf(igt_pixel_t *pixel)
+{
+	igt_color_inv_tf(pixel, &bt2020_inv_oetf);
+}
+
 void igt_color_pq_eotf(igt_pixel_t *pixel)
 {
 	tf_pq(pixel, &pq_eotf);
diff --git a/lib/igt_color.h b/lib/igt_color.h
index a97383fabaf3..813bd19ba439 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -25,6 +25,7 @@ struct igt_color_tf_pq {
 
 
 const struct igt_color_tf srgb_eotf = {2.4f, (float)(1/1.055), (float)(0.055/1.055), (float)(1/12.92), 0.04045f, 0, 0};
+const struct igt_color_tf bt2020_inv_oetf = {(float)(1/0.45f), (float)(1/1.0993f), (float)(0.0993f/1.0993f), (float)(1/4.5f), (float)(0.081), 0, 0};
 
 const struct igt_color_tf_pq pq_eotf = {-107/128.0f, 1.0f, 32/2523.0f, 2413/128.0f, -2392/128.0f, 8192/1305.0f };
 
@@ -117,6 +118,9 @@ void igt_color_pq_eotf(igt_pixel_t *pixel);
 void igt_color_pq_125_inv_eotf(igt_pixel_t *pixel);
 void igt_color_pq_125_eotf(igt_pixel_t *pixel);
 
+void igt_color_bt2020_inv_oetf(igt_pixel_t *pixel);
+void igt_color_bt2020_oetf(igt_pixel_t *pixel);
+
 void igt_color_ctm_3x4_50_desat(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_overdrive(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_oversaturate(igt_pixel_t *pixel);
-- 
2.46.0

