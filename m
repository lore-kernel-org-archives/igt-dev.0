Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73A9C021A4
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 06:28:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697BE10E31A;
	Mon, 17 Feb 2025 06:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yC3WUdoS";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2068.outbound.protection.outlook.com [40.107.236.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111AD10E336
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 06:28:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5V6EQ1GtZzM3MdDUbYq0iMLBb3xc+De2nG2K+6U8wrVv0lrjxC1zgVKSITZe/x4FSU1xbNAvmJhc8N3s/GXVwsDtRdjHATJOxN7GhaI2Z8ULmQfr/oK/rT/PL9fNMFt8tMGrIYdehhoIVSRGfOntKIxQlqQL2HDqlJqqmTCOu1kVc4c+oJZohgvfRwio/oeU5qeuzvQq59HVWPpOK1uk77/97fI9JCewEaLc3CYM9wMzEq0iXWFCYmuCcBk89zTR5CwDHsqF4jRBezN3EIiKdfIx6CjbDJKGE81hEhlmopnAKCZLlb6KMYqxPJvEjVn0C2bJ0gs+mSCAqtJG8X/8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=seYXgVOqc/RKL8umu1412cqr+qcV5pVbXF6t3xF308w=;
 b=La9miJH0J2MGTh3Pa6I7kJ+P+7WvthRMmOVz1B7g5nF3Mu+IAzIiN/Vv4Y7Be84JXL5VapTDqdpFjVUITAa/HnhtRJSMffaGWN+tFCscCRw9Yk86eAtBG1u9bYQF3uWcnqSj4frsv3vtwzZvWgB7JLH2NRl8vm9tXIXqKtgxKXdASc4xwWQhz6kPOGgboXrYUWolc++8Sp+3cU9jlY6rgaNgEZQ+CVTx8l7gtl3KvDb8e6paMmmTpJRYIhb/1y4ksxBBX9T3kcw7tPcd8uAQFM9gB/LY9gfdxzBWyTYkRoAf1IcRaqnfMKkYpt7DPDbjXuWj4BTf6bzV2oMzTNANpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=seYXgVOqc/RKL8umu1412cqr+qcV5pVbXF6t3xF308w=;
 b=yC3WUdoSbvqvOxzly6WgfA60ZqfvRt+Et8BKnoNCruX1qQ/Hd4H+QiN0G/N+ryKn6yuUd5/ABk6Wy1qF+Oyv2QtGfsJJntwPNJfdZd6TXk24j8V8UfSAc2MiORq3RoSZvMyEXsFujh8xFLVB+KvDU5T6XpUxWBqi9t61TyW4Emo=
Received: from MN2PR17CA0002.namprd17.prod.outlook.com (2603:10b6:208:15e::15)
 by DS7PR12MB6286.namprd12.prod.outlook.com (2603:10b6:8:95::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 06:28:53 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::e9) by MN2PR17CA0002.outlook.office365.com
 (2603:10b6:208:15e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.27 via Frontend Transport; Mon,
 17 Feb 2025 06:28:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Mon, 17 Feb 2025 06:28:53 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 00:28:52 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 00:28:36 -0600
Received: from tom-maple-halo.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 17 Feb 2025 00:28:35 -0600
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu/amd_abm: Disable the ABM after test
Date: Mon, 17 Feb 2025 14:25:07 +0800
Message-ID: <20250217062840.31806-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|DS7PR12MB6286:EE_
X-MS-Office365-Filtering-Correlation-Id: 52aade76-2a8c-4578-8fc6-08dd4f1c599f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sC83UEfjKV6eLMiQM4U1qOh4OhmOgdp5lFV8qje3KYg3nwj3vyXU5eucXNLo?=
 =?us-ascii?Q?VcY94OgcnNqgmRjWfx7E7+SgeuOI9wxwgyM6g+BJUxIJasWCqea90dAHEd/S?=
 =?us-ascii?Q?QElifCuJ0AXADcfZEo5dzceClBcLxbslGyUvSShJ0LsjZqYi5yfFYM92Dupr?=
 =?us-ascii?Q?44NCw7DZOK0gF2PEQ/d41osWtLwdtcP7MOteSn3/rxXrlt7NRy0H1oI/9szP?=
 =?us-ascii?Q?QcBaFsy2avBjC1CrOnGY9fms1mHc2NW00grGNzJ1MYW8lvJ6SiCLco4Nu1Et?=
 =?us-ascii?Q?Tzn9wViSW3fTtT8eQg2Lve07Q/qwtswTuYu9oxfxKT4VBAZq9JJqBEpk3nn2?=
 =?us-ascii?Q?sqYZLLu7O8xo5DtEg1m1U8zmJlMMU1Fd+9jlqt2rViqJQXCvQsitO3PEvOQz?=
 =?us-ascii?Q?5Voj67MaElpbxsNQY5r3m8dxSi1BRND74ynCIsbFa7w8dbLFHHsji2mcEJdB?=
 =?us-ascii?Q?BZE08KSvuxNFYrUVHEht3t5rTXotG+3N4D85z6zT/AvjuvCQ4a5/me0pp+wj?=
 =?us-ascii?Q?CyMXGOi9lE3Lif46j01NXeFxFWsx1VPqSdKqC0na0tfQddSmTwG3AxGbQZPV?=
 =?us-ascii?Q?v5SYVEqRE0lLV/whC6aIgJk1lk/7tZhh8U2GxtknaKOqPUqjUHwvBauObevN?=
 =?us-ascii?Q?qRjYhnRlV7fmuujyPHCSsKt/HGjj76+1NGLo4lJVaQ58vVO+4PXYxngTnXxO?=
 =?us-ascii?Q?MbKHK+EO65n5dE5qhXcsgK8eDZKs0JW+ajzfrNzFeMuRFeJtEzX36Dsi9T/5?=
 =?us-ascii?Q?qCjHVEIYdALDqbPN05pss2MXhe5426HtEQK1IcmbHsjiHMsJjw2y534iYhMO?=
 =?us-ascii?Q?l1mXrBYyqlmKVzObtSAo2ZwnGL9AyNAJf10dFs+d/6ppZGTzpEtFiUCM305/?=
 =?us-ascii?Q?jyValU2QufbLgJad3Wd8kqAjooHIWjgvUZG/b10WrF/HVQa8pidD2FYQlVGa?=
 =?us-ascii?Q?gT7BiyyB5JJe7AijFcvYBMIpzpG8/z8kOSLzZAIWBR7MZ9Wh7LXUZWuQCV2F?=
 =?us-ascii?Q?GnMsBQaDmmBp2jRM7ojVzc0IRK1uaBVNjYAJxlDc0j/rBZcMfFwmXvX7w+FC?=
 =?us-ascii?Q?gdSYjFN37DgnRDmCVUbupgNaJeGiSXUpYFUIwy/4VK0I2I6TRgM9xzA+aHGc?=
 =?us-ascii?Q?wF75dD+1qOnGijHln5fEO7//K+LA/bu+AGdSNJBxkf0tQu/nbyaeoC/sCmo9?=
 =?us-ascii?Q?CTYQZVpTYbKIsaJTIJKHE2ZGtRpDe8f/XJ23W4+1xTSmkBnuKLl2qMz7vyhj?=
 =?us-ascii?Q?wApQmXH2un2a/YJWD7FZn0yHkuk0FFkY70Nu9g7LQh+mqhZefhcgE9CZTqnA?=
 =?us-ascii?Q?ARjM7INIha+yqKGtIVY2LCFKigQDqz0jgmyI4zcyJdKo6v3NB3pQE1xuHzrx?=
 =?us-ascii?Q?QVDAqKo/zcG5El9lLPjc6n6pHN88DhuuG6uEo9B3PFH8RkxFcCuuV39qmPTD?=
 =?us-ascii?Q?tc4YCfHRCSS6pzgxKefG4eY62v4XX0inz8whWL4GwpVgLCD7HrSU6Pb/O/Ec?=
 =?us-ascii?Q?QQEZMO2RqL/YjZc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 06:28:53.7005 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52aade76-2a8c-4578-8fc6-08dd4f1c599f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6286
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

[Why]
After running the ABM IGT test, It may cause some other IGT test
failed because of the ABM is still enabled.

[How]
Disable the ABM after running the test.

Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
 tests/amdgpu/amd_abm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index a1dee4488..97813d80f 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -52,6 +52,8 @@ typedef struct data {
 	uint32_t *fb_mem;
 } data_t;
 
+static void set_abm_level(data_t *data, igt_output_t *output, int level);
+
 static void fbmem_draw_smpte_pattern(uint32_t *fbmem, int width, int height)
 {
 	uint32_t x, y;
@@ -166,6 +168,15 @@ static void test_init(data_t *data)
 static void test_fini(data_t *data)
 {
 	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	enum pipe pipe;
+
+	/* Disable ABM before exit test */
+	for_each_valid_output_on_pipe(&data->display, pipe, output) {
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+			continue;
+		set_abm_level(data, output, 0);
+	}
 
 	igt_display_reset(display);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
-- 
2.43.0

