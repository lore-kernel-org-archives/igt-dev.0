Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56A7C25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 21:30:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7939A10E9B7;
	Mon, 13 May 2024 21:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ay1vLdLI";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F59610E9C0
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 21:30:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4rWUVojiV1t0MspWrc8AGXWrsOJDHAyCY9LfIUFtWeIeHjTRbtqO7NHgfcTXldKj1KI7qAqUK+SXTvj60r20vM3zWk+Fnf4MmpamI2nKg8IF6gv3iDQf//GwH5K6uHe8NTIIBtlnMeK6zPrBD8kRN/1+Q5D8f6tmKOiJhxsbglArcdxLbTbTFKPamyfDhnbvxpF8JVUK8U0YZaSJLfTBPh2gmHR7Xxj1STu84h0rPMeauQbh8xe/HmgjmgmKFRNhGz1W+AX5qAKKu9pOg6f4tDUbDkRq7x5ZhFn/2meic6+B2tdwRHDLnB2Z15+wsZuQNJSqb2Ciw5qGHKX/Xidkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByROA8W+iZZwDIao9XltVzF7Y4CgjOoymRRl3D+bpH0=;
 b=WpSSQKjtYdkIFfAh18RJ2x2iLoC+kMKmgSY5/zAGwJRPtb4+x0lJZZcRMcVtPNFPN9/loCLHezRcLPu3qEwmr72sXFjT30T6YFswsWNcXolkQ45SFq/Ifey3j9AsxSmBPY6xqJxcjAigapScW9Ug7oKGPINjncpqsiXD0P7iy3oW7E7qqXH9Q1uBk8hCFW5f9+GxI/DJ1DVOPQClZUDMKM9FII0ywSXVCQwFeL2obVABKdiaKf+onQBGScUToydMz/dKHCA1kMYvfm6RSTSP8a6BTlk2bMZzHYLzatdwuM4Fu8AoFdySNEudSpIS156JmfEhT7H8E+JuYphK+epb3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByROA8W+iZZwDIao9XltVzF7Y4CgjOoymRRl3D+bpH0=;
 b=Ay1vLdLIzaDMlAW14nFPU+ikfeuEATZBNR0u3ZKvdlRBmFauR2ANnBIHkUmKUPH/Lcc4dboHgD3iG898wuJ2PrFd+CEs5twj+AweUvHgK+rhB/N5wzosjpJVLiQLT7WdstY4cGejNOEHLmkxtYKnwWvtNwm5S9zhqp6hMwnjxtg=
Received: from BL1PR13CA0109.namprd13.prod.outlook.com (2603:10b6:208:2b9::24)
 by SJ2PR12MB8160.namprd12.prod.outlook.com (2603:10b6:a03:4af::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.51; Mon, 13 May
 2024 21:30:55 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:2b9:cafe::79) by BL1PR13CA0109.outlook.office365.com
 (2603:10b6:208:2b9::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.24 via Frontend
 Transport; Mon, 13 May 2024 21:30:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Mon, 13 May 2024 21:30:55 +0000
Received: from moon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 13 May
 2024 16:30:53 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <hersenxs.wu@amd.com>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH] tests/kms_writeback: refresh to expose writeback output
Date: Mon, 13 May 2024 15:30:41 -0600
Message-ID: <20240513213041.583437-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|SJ2PR12MB8160:EE_
X-MS-Office365-Filtering-Correlation-Id: 44168745-a725-4707-e573-08dc7393f8c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|1800799015|36860700004|376005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lmZ0tDegATl3TDjdQ3umMaL8rgqN6t1uatTgzl+do2SyJjNIm+QJT8v57K2e?=
 =?us-ascii?Q?0wqrTDtkjnDLmjDMFk+La7/OnDUdmwUfdgpK08iPYnw7SNMg3PaEpbalDZ84?=
 =?us-ascii?Q?EaUPjX8OmidPiWlRiRBdE3VQJHC92doadvqZTR++Ym0JBXi6VZeZZ0/WikIF?=
 =?us-ascii?Q?8zGJHLL0uf6R+l7HKVWu3/+hs+wgY0v92VoJVG6DvbUXsTapuL5fMR9VUw3S?=
 =?us-ascii?Q?fbCKb5C8WT6lKAIW75v14OH5e5diDdffcYCmMUKyPz/rWtcvxpAWaStFxS3c?=
 =?us-ascii?Q?VLkj50kN7YvhZNcqC8Km8MkfjbqAGVwLSF9/+qD7X3Y/QdAtX3M9FUMvXtI5?=
 =?us-ascii?Q?VUajoWi1yS1CSTd8rX8WDtuHNVxMpYte1vZgKp4zAfXAxdTbDkDUCbnyEpI8?=
 =?us-ascii?Q?A3JaXXlKKioFMrPm0o5RCfuS2CxbLyNjOoX4WgwCMyG2P3LRZmmvisvTBYp8?=
 =?us-ascii?Q?sUQ4UlQcVvG7kUShnRHvoKxfieaHmIK6L8WtmUeKDNXKnF7UuUzmsk9ue60z?=
 =?us-ascii?Q?xc002cQI8jKtfM/SM77UvtXqcWdvKMMAry0/1dBQj9OAn6ZAntHpmDGlEgfU?=
 =?us-ascii?Q?cz0KEesHDkmuM5o3N8SnqBmy7h6cslPDbgSValty7Q+czWO7KZRpbMIQl6z6?=
 =?us-ascii?Q?Jkr6JxDDrxXzXwj3wthMJDdouF/7++KBPp4v9neZ6bBXZP8D6l2L/RAxy3Mg?=
 =?us-ascii?Q?VFFem5LWj++6qHOM8g9lh23xwa7h0FUIsoITPL/SzLZiUKGI14x1TNoge5lD?=
 =?us-ascii?Q?6GePhFUCFU0sd+48B98znY6+aTZ6Kkv1oLx8N2lnGEQi9e7Ky7mz94c56TPW?=
 =?us-ascii?Q?kAWets8wtnymmnB8mdHeZDsTLlri2nwuTyT7rkXn3dWD2C4c6SQqE4eJYqUn?=
 =?us-ascii?Q?iGe5JQtpkk/BZjyaF9IUWvTN6UB7rCc+L2zVGTWfz5X1fpTTcb1cx4XSu2Vh?=
 =?us-ascii?Q?XurguivKrYpnXEnYzqCkXZL6fb/U3Dsjsyl6spGyquI2CGe6c37Mbt+JQMTi?=
 =?us-ascii?Q?N9HmaEV+hv13R7EfDQqijAaSeJm7U87qiphAokOVmdz0RvmkLZ7cQ2i17Mvv?=
 =?us-ascii?Q?sbId+VYNHjnRy95i16YzVx0WLYAatc9tV3gWl/07LdBTycQSxGIQlhwCz5ZO?=
 =?us-ascii?Q?SEqWi58elOvM5eg50kujB7GiQxnzaT+J33yOaym7FKGxS1BuMb1k4shUIi3e?=
 =?us-ascii?Q?j1YsMlLgO1BA6Sr66jwfJuBUbwAHL8gupAH60GWHDRUqQ1o75hcXB/m80sHh?=
 =?us-ascii?Q?13PMZWOqG6msFf1bkQfEjwB5Em+Fe5PSLh2QQ17oIJqjjHXssno4FI7tuIuZ?=
 =?us-ascii?Q?PmgapBhICMyEP0H4xcvDNZ5ZfFI2mgFmHYhOHrTzlI601sI0rvxGNJdLA47T?=
 =?us-ascii?Q?IAdSAnHqifEs015ULlkZfMOHvAMb?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 21:30:55.0067 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44168745-a725-4707-e573-08dc7393f8c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8160
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

With dc2d7fb4f978, all kms_writeback subtests are skipped.

Refresh the outputs to grab all supported connectors,
the writeback output that is just enabled.

Fixes: dc2d7fb4f978 ("lib/igt_kms: move setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback")
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_writeback.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index f89b2d62f..4c54f3b89 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -572,9 +572,11 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		igt_require(display.is_atomic);
 
 		ret = drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
-
 		igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
 
+		/* Refresh the outputs to grab all supported connectors.*/
+		igt_display_reset_outputs(&display);
+
 		output = kms_writeback_get_output(&display);
 		igt_require(output);
 
-- 
2.34.1

