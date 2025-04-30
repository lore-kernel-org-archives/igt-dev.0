Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3608BC369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:39:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D769610E682;
	Wed, 30 Apr 2025 01:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CmlzxaUo";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3501910E682
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:39:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TkkjuNVyH98HRhvBjM5iIAiSY27S4rPw39h/LqxSWyd2iFQQ5NcoSCAk/KmcP3gw1OTmb5mrcVlcylhQ5J2Xh79Do2AvJ0xE3orXCqKkr7sgiJRVjKglsFZ0+lld/kz4mKhm3cHBEGX5Gb6SPb6v7p6kr4t2UIX3YqcTzu5WupdaMMjrFQWWXPYn/w3IkGpITawhwD09tn8p9SGLgtWnow2DHUgUBV1R5JkaWdZc6HJGGMqLJsbCmpDRriMGyW/FmA6mMsV83+sSbeEGysyhvjXAfG6GV1kxHZs+vw7tI3NJsge6UKWi48nySkIHHtpq2Sh/lNRfyu4YVKojunyEfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IWPwWjHGv8rg9W5O389FIE3EYF5kbIf8SQ6JFAYKBY=;
 b=urcWYICljDpC8W847oWoNIVCxuzT3Sh81lbcMF0DsSpRTRUc9+tzl/ec8xMyE11T8hrqMUzQRVWxxrh5s2vdVmbX81Sz6cd4VH9rfoCkqW5a+6aqvt+PgVGcyc7HBhHApwynW5zUNvOj5b6B+UG2br59XbNbu1GaYAiHyj8TSaOVde3ZJGpWJWFK0ST0nE0jHhEEMCH+SEW0yjc7Xa5VXGZ/Yjy3osMqvefFARROQE+rVGmbQO1FvtP4n7/SVTNDYQLVjrXmJwvhB9Hr9CIqfPuvUGpJVtamneqxk7yk4CeqqgV1ij3ZvP9xW8SeVwsA9v6ynfldG+s8PxFIXdGEuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IWPwWjHGv8rg9W5O389FIE3EYF5kbIf8SQ6JFAYKBY=;
 b=CmlzxaUoSIvKETteluZoS/QXZNzE860yhkIpzlVJvxTNbBCGEjTmgBGj/V+dfqQNUSPpv+eMFmxFp01ycsBOasa/VQTmwKrRSpQRPZCG3aH4qxnKIDV0xU0pEU+krivLmj7EXMIKcr4iloyW1xupHemZG8HcgWIbuJKxI1iNvcA=
Received: from SJ0PR13CA0096.namprd13.prod.outlook.com (2603:10b6:a03:2c5::11)
 by LV3PR12MB9267.namprd12.prod.outlook.com (2603:10b6:408:211::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 01:39:13 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::fb) by SJ0PR13CA0096.outlook.office365.com
 (2603:10b6:a03:2c5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.13 via Frontend Transport; Wed,
 30 Apr 2025 01:39:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:39:12 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:39:11 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 19/36] tests/kms_colorop: Skip if writeback does not
 support fourcc
Date: Tue, 29 Apr 2025 19:34:37 -0600
Message-ID: <20250430013454.226910-20-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|LV3PR12MB9267:EE_
X-MS-Office365-Filtering-Correlation-Id: da33ac09-83c3-4cdc-2dde-08dd8787cf7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bQ9GWDCThuaJv9/3SWJotc4HCZRnLsjCKHjRU/vUR9U6atfnJdhWVOw+ZlDz?=
 =?us-ascii?Q?YUlq2LDhGudg+mWo+AKx/DyYzIJQNZp1MBIHRiCVfnAMDw7ysgRRlNAnMr5/?=
 =?us-ascii?Q?c29S71kl0f32kRiGK76k1SBzTIMnwqjd9omN3n8Sl6U1HkXuMy7C9OuOQVJH?=
 =?us-ascii?Q?HSO1+5VnTzxS/TeJYQ+nce/P12YTMNAYk3/JQTwZ5R7QgrD+yZVZKdfjfkEK?=
 =?us-ascii?Q?+QfnIY34qe4Mi37rEgTshkMbToMhVzBlUGvY3+UokPYdEevIwxQ1cAvhoGtQ?=
 =?us-ascii?Q?eu/fUArYbFIJ4H/GTVMC84xVpNsgyhzFC1SnKgPj2R0u/VBHczRquc/oGlJW?=
 =?us-ascii?Q?0BnR5E9oLevjsbRxlIXaQHdnjYaxYK9IfRX0rbP6PadrGwYkgxjCQAUo2zFa?=
 =?us-ascii?Q?66Q5KbN5Znb9x4C3XGVYj6wB9bb5aa3vu7jcogZAX/hPXU4iejhX0fndXxnL?=
 =?us-ascii?Q?T7w5HVhOnL/aQnNjDTDJUDcb8wbmDyhH3sy/93k5ahL0n7RVaylX4zSNw3VL?=
 =?us-ascii?Q?5wD1bnIOXC9b3vrn+6eSZwtGerW4xeuxNXLfijTrpOyICL5VbtLB9AZIOyYn?=
 =?us-ascii?Q?/7SoZB9csnBkKqhOZsLt++9ppX3LRuXcuk/zdDdiD9zOpoU71ovDOpqDEPIE?=
 =?us-ascii?Q?4/tFc3NORrDP24At6KLNE/ktIoUyZU6ZzODOO6e+jk5vkmZGpCUqbh0De98Q?=
 =?us-ascii?Q?k+SDRpeKAsYQiEouGedTWi1y5ubc3FEyeSC4mpBoA4vmYcwQjzZPwPP0qFkI?=
 =?us-ascii?Q?8X3e6VX43sI1yvUSgmtrERKL1lkxLva6wRLBVzG/nxFeyTF57mEUvQAKQrNl?=
 =?us-ascii?Q?EuUsfnlTX9l3gwFNh4piPqgCbfFQTbkBMa/9ODs6QLaTjPW6wLYdj88vyiAK?=
 =?us-ascii?Q?BSTaXmC17ah9FYlRVxfKpm8jjGO1G3My1B2hTkF6UHwgpNuw4ZdCFgRahgMS?=
 =?us-ascii?Q?hK3irTYU2XMWAzfdpo0nC5RCcggkmQl/AR3+DBGHMbb3jkje8jUxagpt4B0s?=
 =?us-ascii?Q?KqctloKpYqxdNvEDT39gsGXlVnkOf2o0lbdmmwW1CZM1JS/Yfqx+N5ET/2wT?=
 =?us-ascii?Q?cZ660xds+xhza3/YZ25FhsD1xCsmRBTfildl4+lk4UVsXLfrN8LNezhwrHDt?=
 =?us-ascii?Q?/0vNZOk+K5zLzXsAlfkKcdnIrGEGgKarOUfYGSXzJYHF3gbpFghQeQaJ2THA?=
 =?us-ascii?Q?3LAHaD8EQu/thSnS17o/o0md2oBS9p4xe8pIeAWv8oMElRbas/jh4VB/Ptxe?=
 =?us-ascii?Q?5awKgjsLvPmEBNu9wA4jSwl9pZaVNRisygsvCqOtN5YC5LRd4DHbJvSUHYNv?=
 =?us-ascii?Q?btRJKP+HMnC+NpAVhMAxUGlTTio+YsMiEJu+/NzgGeIWYGWl0G1mQsQ5Fz6Q?=
 =?us-ascii?Q?KmJO+akeka21pp2cI3RnB9/w5R4wdLTko0V4kaNN9q3fdu9aLj/JhWaytVos?=
 =?us-ascii?Q?WDD0uemDiqZLuwfRxMRA8n6x71lvvU1xtAnQdMfwzx9SpEXF6D27o4IXLniR?=
 =?us-ascii?Q?pXhvJCOkhWApA6nTYhVuPJE78N2qsrl9T1Cu?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:39:12.6296 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da33ac09-83c3-4cdc-2dde-08dd8787cf7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9267
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
 tests/kms_colorop.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index f99d0da7b..cc260618e 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -68,6 +68,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	uint32_t writeback_format = fourcc_out;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	int width, height, ret;
+	drmModePropertyBlobRes *wb_formats_blob;
+	int i;
+	__u32 *format;
+	bool found_format = false;
 
 	igt_output_override_mode(output, &override_mode);
 
@@ -82,6 +86,17 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 			    fourcc_in, modifier, &input_fb);
 	igt_assert(ret >= 0);
 
+	/* check writeback formats */
+	wb_formats_blob = get_writeback_formats_blob(output);
+	format = wb_formats_blob->data;
+
+	for (i = 0; i < wb_formats_blob->length / 4; i++)
+		if (fourcc_out == format[i])
+			found_format = true;
+
+	igt_skip_on_f(!found_format,
+		      "writeback doesn't support fourcc format %x\n", fourcc_out);
+
 	ret = igt_create_fb(display->drm_fd, width, height,
 			    writeback_format, modifier, &output_fb);
 	igt_assert(ret >= 0);
-- 
2.43.0

