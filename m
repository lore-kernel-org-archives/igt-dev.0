Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC6EC43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 08:44:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709FA10E055;
	Thu,  9 Jul 2026 08:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CXO37MDo";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011067.outbound.protection.outlook.com [52.101.52.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D9210E055
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 08:43:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlV/pXGB+TeaRZDuZhWLjMTw2XJH7kzoVnWLBV2joauv0Wq20LnpIfrvi8SPHOgowIvFvsGZAA6QHdU+/05dduGdtmkNbjbVOjpk52/zE5LoHfuZH+3W2KIU07bObJF3HcUcs+OrzWxedfL8MUg6B/STO/mhh1hy5yVcN3zXyqprdP7Pb7b8juKoc3RULwKIiUPj3HQ185Xef7jKOC41dwX8BqfQg2GKnujn2Dg/Du3t80ZvWLcKNRRWeIMlYqYfBx0e2NTbINtVPnKY2eSxtz/lNV6gN5dSgCG+roBdYOmr5ZKUswf9xU5SL0uCX3wX6NEsXckKc/iphKDQOOgtNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFxrgFAogOlhhYwaSqNfqOF/F/WGPTOkMaZOJk7evbA=;
 b=QpYC/+oaZouNNGTqo9cY4thztXpSr0pZtnfZiLM1CtPl5RIpELfV/bxTp8f++XdvrO8LMDzg+/bmm/ykw/NJejmyCoa4Y7gsT1zdi+3SxcWKYhBDFR1NiqWAYegKz3EE8Nqc1MKHIcwYjqLXx9Wv5HiHCb/1lSrNFm7p/Tl4yqdxStGbFXUMxGb6KmnnHwqKS+/UPLBpNE9d58Roz4+HC8GmcKL83jD6J3ZKorDYhX6GQs6vhT+kvQIl9K25wdu/2XS0Mkx5Hr0OTCyDTux9hHy/l8Exa7Kum7r5aOOGbGHvmqKjRwIe2Evr/RRBFvxyao3RtQ8h4fnKe6krS0nGAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFxrgFAogOlhhYwaSqNfqOF/F/WGPTOkMaZOJk7evbA=;
 b=CXO37MDoC+ze+6wVhuNwkVPeMstWpbqrW6Wt8M3RFBz3zZ4N78PhXq6ZNa/JgASRPHctl79G8O+H4RkmOwwew9htA47g0YJVCWtWGtf9R4bJv8nEV7sfT7GyRjB/U1lrhHnjkkNpLU0EVDOaD9x+4TncO6JCA64KoHD0gtSMMgk=
Received: from DS7PR05CA0074.namprd05.prod.outlook.com (2603:10b6:8:57::22) by
 IA4PR12MB9810.namprd12.prod.outlook.com (2603:10b6:208:551::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 08:43:38 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:8:57:cafe::1a) by DS7PR05CA0074.outlook.office365.com
 (2603:10b6:8:57::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.4 via Frontend Transport; Thu, 9
 Jul 2026 08:43:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 08:43:37 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 03:43:37 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 01:43:36 -0700
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 03:43:30 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu/amd_queue_reset: Fix random hang during
 queue reset stress
Date: Thu, 9 Jul 2026 16:43:15 +0800
Message-ID: <20260709084324.1913977-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|IA4PR12MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: 9186fb71-ee4a-479e-4534-08dedd962b7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|11063799006|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: ZQlJhCWwgDnXt0/pqEJ5JqjihIdqpOXn1TxY1froONnFasID8nSnMWqt7zgQqGDYmHuIIDI1xR4+t0ElZEKwmSVgcQYoiDCKJsk+6/DGS8WRoi9v6Belr1DMaXSFkmXxMC9a4SH/v0/Wv2k7fpCafYE4ta9Q3F5xpwAkisw7vx6npv/GWOEoHzFIsPM5zq//wfzVN6/mrSAQRvzV36ls8GTUzWNe/Xh47yBEkoP55IZUs2I/bkGv1M3gHwbAaz+65fwmttDLXO2lsPzUGJpkrn8Vqwl6bEskTKgXUhhPNasGQJWAPRgP0cIeg8APINEVf0m4+QtoSv4leJoU9fjcQ9/AcW0aKZ41sf3dzFwatySHdkWC5KwSCM8cTnjWHq2TXCAJJtcxqREV/mI8YZhspyOav4j+80MFEEFBEaOOHclcVcFSGGCFhx4TPS5bQrQKGiYkqL9syAzvr1JqXhFO5Cb/GjGtUxsVyJExrbsdPY5VNmJvRFh5k2tjCaruJwttUG6aZfs7szGstWaEyBxS7Gkexv0tOvDn5vLSxFU9jw4cwnq61/0uEVx+8izXaguhorrowGygJlNw/EJGHeZcEaVkXyzFFa2C3iQuLoWJtu6iwNxLi6noS4d5725PhsmiGLqtmXQgIPTG9m7h6B6bAA2Cp61nNiDw52PzG4oYFj+bB9ulZ2dTFmxrX6Vzn1DyIjKZkEmvgiOOORYsmDJXEw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(11063799006)(6133799003)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DPWGU7oudZpziqs7A5DpzS1etjMwhWLFx3FZ+Df3G0n4wTWi+uTKVQu9VaGzLsZ9AiGmYzr9aijE3B9vthQVhgbhzH1LJEiVTwivxtD8mfAHNUEFUDfeQhd/tb4GqHVvcAOHE+KxIvDpdqfFpZjMmfAOujRbDgrP9aCMzVZeyY1n6LqwesvTqWSXHcwvPdu4IdzDxBCYKGdeJrQVW6NXtNDbVEDfuiIAjNwQTafN38MVH5UfimQjv56ltXtl+XWz8A3AbAR37Ib2BppcUnLpQicRi5Y3bXT4k6pdfmWuhhTM9zLkzc7Bcz0217FDoJCJiDF4WoFGa63CksBs6Dey0w9Jt1GFMcAoB+oyMJOMjvBTQ1G7cWfYf/p3Kj7nPH3+ylelr0arDQLq7UiLjwcDOBWmYr6EicjWTfopn+7QtUzVcJReNAKG39uIJSo/iI6M
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 08:43:37.6924 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9186fb71-ee4a-479e-4534-08dedd962b7f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9810
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

A concurrent "good" background job can be collateral-cancelled by the queue
reset and return an error the good-job path did not tolerate, tripping
igt_assert_eq() and aborting the background process. Its death breaks the
fixed NUM_CHILD_PROCESSES barrier, so the survivors block forever in
sem_wait().

Tolerate every reset-induced error on good jobs: unify the two asymmetric
allow-lists in amdgpu_test_exec_cs_helper() and add -EHWPOISON in
run_background(), so the process never aborts and the barrier cannot deadlock.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_command_submission.c | 14 ++++++++++----
 tests/amdgpu/amd_queue_reset.c      | 10 +++++++++-
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index a0777e5ae..0334c2ded 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -119,8 +119,11 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
 		if (expect_failure)
 			igt_info("amdgpu_cs_submit %d PID %d\n", r, getpid());
 		else {
-			/* we allow ECANCELED, ENODATA or -EHWPOISON for good jobs temporally */
-			if (r != -ECANCELED && r != -ENODATA && r != -EHWPOISON)
+			/* a good job may be collateral-cancelled by a concurrent
+			 * queue reset; tolerate every reset-induced error
+			 */
+			if (r != -ECANCELED && r != -ENODATA && r != -EHWPOISON &&
+			    r != -ETIME)
 				igt_assert_eq(r, 0);
 		}
 
@@ -142,8 +145,11 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
 			igt_info("EXPECT FAILURE amdgpu_cs_query_fence_status %d\n"
 				 "expired %d PID %d\n", r, expired, getpid());
 		} else {
-			/* we allow ECANCELED or ENODATA for good jobs temporally */
-			if (r != -ECANCELED && r != -ENODATA && r != -ETIME)
+			/* a good job may be collateral-cancelled by a concurrent
+			 * queue reset; tolerate every reset-induced error
+			 */
+			if (r != -ECANCELED && r != -ENODATA && r != -ETIME &&
+			    r != -EHWPOISON)
 				igt_assert_eq(r, 0);
 		}
 	}
diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 546845d29..ebd7c8682 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -840,7 +840,15 @@ run_background(amdgpu_device_handle device, struct shmbuf *sh_mem,
 				//if entire gpu reset then stop back ground jobs
 				break;
 			}
-			if (r != -ECANCELED && r != -ETIME && r != -ENODATA)
+			/*
+			 * A "good" background job can be collateral-cancelled by
+			 * the concurrent queue reset triggered by the bad job.
+			 * Tolerate every reset-induced error so the helper never
+			 * aborts this process - its death would break the
+			 * NUM_CHILD_PROCESSES barrier and hang the whole test.
+			 */
+			if (r != -ECANCELED && r != -ETIME && r != -ENODATA &&
+			    r != -EHWPOISON)
 				igt_assert_eq(r, 0);
 			//igt_assert_eq(err_codes.err_code_wait_for_fence, job.reset_err_result);
 			counter++;
-- 
2.49.0

