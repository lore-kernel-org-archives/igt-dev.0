Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEEEC982FE
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 14:43:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6696110E3FA;
	Tue, 22 Sep 2026 14:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YcqQuqrK";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012057.outbound.protection.outlook.com [40.107.209.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2CA10E3FA
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 14:43:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0yzx3KWqG9GdqoPtcqIG3zmnGSVmnQx66v2NG08QRViHLfjcuFhxtUcNZXx/e7xDEfAZ2Umq7KZ/PEUCEKS3Ciu9g1kJOxiRYzlYJkg3eSp09AhIzdcwahLxRAQ8tZRLlOLjsoIOiMOfwzMkBMRFewrNnq59ZELTIJ/5DBqk4DOdHNK0vfwymAqNAubhT4EasN28+ivGinfPBHRMLbL2bnCCDzFX8BErYAeoIa0MFZ2dDaPtAeP0zsG59N9yP73h6IpdTPbYMw6M/1NxGFseMF8xUePa3vECPocSgeekdCHQjZ/tN2n5IgKITGNgll+HxUH6hbv6WV5GP97F/ixLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mi90ORgJxsSzVYulPP4DgtqTm8zgD98YNE6VhkBHWFA=;
 b=jXn/FhKGQ4hfgR8xnzIMN8eBCZmYn6ODPTZX68IyNjgJ2NSKAbLbmAewDW2nCOvprZndlbucbz2ef+9qfJuWE94xZEs5a8idTtQ9wvRrKRoJOMtJ0Z+4AuDrQhHJr2ZzXr9PlxulxN/4KmBhqgqWmKZUQbkW3otJsP1CY47Ftlt++8F2ADJHp2r+vTliRL4gg/43yT6ZLRXMxRyFutTIMV4a8fSczjXjzfHw9w3iptoeKP/swmM8N+F1ruLCHIsX3kVviWhtVPSa0XzC/jDv7jNv9VvUt2fInZQB1nr1cezdXx3zp3TqVyRnrcP2TIL55927oD00LnuN6TW4J35Nlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mi90ORgJxsSzVYulPP4DgtqTm8zgD98YNE6VhkBHWFA=;
 b=YcqQuqrK5NoU/uywanOUXURDqxhWoW015bUHwd1sxoViwZhj8EzANeyv3KhJjmON5YGEWRGeDVUKh0bPU8M3rESslb9YgMwGFdDREPIJXdWPlIFyhm273ziQ6Wr1KDAM/nYNWzEhqN731o8oxVwK+FHScXjfaRQWPKMBg6FebWE=
Received: from YT2PR01CA0019.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::24)
 by LV5PR12MB9755.namprd12.prod.outlook.com (2603:10b6:408:307::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 14:43:03 +0000
Received: from CO1PEPF00012E7E.namprd03.prod.outlook.com
 (2603:10b6:b01:38:cafe::93) by YT2PR01CA0019.outlook.office365.com
 (2603:10b6:b01:38::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 14:43:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E7E.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 14:43:02 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 09:42:58 -0500
Received: from aaurabin-tumbleweed.king-squeaker.ts.net (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49
 via Frontend Transport; Tue, 22 Sep 2026 09:42:58 -0500
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <ivan.lipski@amd.com>
Subject: [PATCH] tests/amdgpu/amd_hotplug: use SUSPEND_STATE_FREEZE for
 basic-suspend
Date: Tue, 22 Sep 2026 10:42:58 -0400
Message-ID: <20260922144258.1618587-1-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7E:EE_|LV5PR12MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: b2757d00-7df9-4d86-86c8-08df18b7cdf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|18002099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 9k5hyFuX4zdYLM+UXzKiUpLmcRPG4fAIGYcWBm1RJG/6mD9OwB6/OWjQlURuwjuCiqtOO65gm5eSpO47pNB0Rys4F5I8dQhono+EhfOn/jlBxNB9Xw3Av9TDVEppqCeejvdPjI7QLfd5M1tsayje90soeF74bQt8WLmzRWT1T0VMBKuuwBJEkRWRsYmOfM9bpjZT6A44CnEA0Q1fW7QDDjshE/YZ+YnIjNAQK25Gf385NYDokYCyH7wjf7yFNhFXRoqRe8tPWlX2FzcCF/UrLYqBqF+YOqUgsAHdiERrtoHCAhIKUJwTNz8ahVTslxRb3wR5sTAJYQx9rRK3WNYoA7rpVnqu/uM7QHtZI0jvDBxRe0UtbQSX0TRBUhGDM2K9BkMrZdlxmOQkB+pqLdWOm2TpdUrpPBccYNf5j4YCGr0AstoX6tEGiRmLIQYWfPnWoKkxyVePcBJB9JLJmlOrIFKJxKcDlJp4ABjoz/rWeqgNf4jdsAO/eGctKikf3onzvpmJDn2eCuv9ZwpwtsyD6LRDnemSd6H5M3DWtoqSqPnoC0kInJD+SZUrYq1wDb9S3grOxlrRtzhOXzqrpXEceO10NbmROZ0RtJh6tE9Z8GZRKbKpydxGMUoB5gA3BfJUPTCgT+QOz2Pl65XTTy6ZG6HZNygFO7cyPJcP20XEa0Lo4XEawGLmbWOkcl35SYJpIdGrcD9/IYT3RxWxZuGnyw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(18002099003)(11063799006)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BQBPirxuBzD69QSzcEmD8Dno/HXLHhDGs+v7KklbMdM6g5mcr1jzh7Uz4utGy73jiiW6M3OF+V7AoroMXWOhDbmU3E0aiOVjdwYbAptflNavevTcXrIvLbIejPobwXwl1Wd11xHMd5brfcWxtz9013G84IqTnEdYgs0P8j5p/oIL0WxvHdxze3/e1RzRHuZ/mZpWy4ryL67N9ThlN5FPyjXc4hYDI73Jlt6FWC3xKDb8Jz2EAw2gXQtA1t8Kv4edq8wGalXIFD4mbkp6RqaLdEDZfm2I3xIiU/rAecWyWvDQXpjbb760mlGcvCXTwoBnFIoBPfVrDJV/3grGVLfh3g0JULPd9nPuiP5lI/9ufFWdqoFvcXlWzSER9Go9LXZs4DuePnfKcagKuiy6uFLKcWPkNhZ4gFJsva0LNp/tnZ3bnAqSJM1oBXeqsOHoyRf6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 14:43:02.1859 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2757d00-7df9-4d86-86c8-08df18b7cdf2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E7E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9755
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

basic-suspend previously skipped unless s2idle was the currently selected
mem_sleep variant, even when s2idle was still supported. Switch to
SUSPEND_STATE_FREEZE so the test enters s2idle regardless of the system
default, matching other IGT s2idle tests.

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 tests/amdgpu/amd_hotplug.c | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
index c54288e90..509d828e6 100644
--- a/tests/amdgpu/amd_hotplug.c
+++ b/tests/amdgpu/amd_hotplug.c
@@ -30,7 +30,6 @@ IGT_TEST_DESCRIPTION("Test simulated hotplugging on connectors");
 /* Maximum pipes on any AMD ASIC. */
 #define MAX_PIPES 6
 #define LAST_HW_SLEEP_PATH "/sys/power/suspend_stats/last_hw_sleep"
-#define MEM_SLEEP_PATH "/sys/power/mem_sleep"
 
 /* Common test data. */
 typedef struct data {
@@ -102,26 +101,6 @@ static void test_fini(data_t *data)
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 }
 
-/* Check if mem_sleep is s2idle */
-static bool is_system_s2idle(void)
-{
-	int fd;
-	char dst[64];
-	int read_byte;
-
-	fd = open(MEM_SLEEP_PATH, O_RDONLY);
-	if (fd == -1)
-		igt_skip("Open %s file error\n", MEM_SLEEP_PATH);
-
-	read_byte = read(fd, dst, sizeof(dst));
-	close(fd);
-
-	if (read_byte <= 0)
-		igt_skip("Read %s file error\n", MEM_SLEEP_PATH);
-
-	return strstr(dst, "[s2idle]");
-}
-
 /* Return the last hw_sleep duration time */
 static int get_last_hw_sleep_time(void)
 {
@@ -180,10 +159,7 @@ static void test_hotplug_basic(data_t *data, bool suspend)
 	}
 
 	if (suspend) {
-		if (!is_system_s2idle())
-			igt_skip("System is not configured for s2idle\n");
-
-		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE,
 					      SUSPEND_TEST_NONE);
 		igt_assert_f(get_last_hw_sleep_time() > 0,
 					  "Suspend did not reach hardware sleep state\n");
-- 
2.55.0

