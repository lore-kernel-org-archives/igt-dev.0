Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDF2C5B572
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 08:05:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E3310E0D2;
	Thu, 13 Aug 2026 08:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CHC+QMEd";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011044.outbound.protection.outlook.com [40.107.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC7010E0D2
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 08:04:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDxx2ZIRXmZcog5yrkYniLw07db4c1MXGFpeHdQhjgGvp3i3kYtrn1AJHGBecfTgfWtzQQ655EVgr/1BheK9L610TGhTuDhEoowUp8qLvbHqBN83FxX41MzsH4SHGmZQsBg9LsnfCQhMMSRXBpBAIzApKmH3hFl4ecj4gfAqb5hOCIouVZ3JC8Ms0H3WMrKlqwx2/1RYvk6YF+YmstDnFL22p9wapW9wl3belPkqbdz+T9pz/MTrie5kimnokhgm+TNOupXbH9/PVkXZiTxJEi+/wurnXin+dbUD2cljGuSgRBAaWGlyaGZMh2FoZzorqzxmhqpTl0/5csBy9th3JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BN4UdafGKZbyRPeTDqqTdKTMSPqi9/dKD6kaWM49230=;
 b=EDn2OuABHNEPWRJWCYks02eXNQPBQgBNAPDX7Bam5Y05inz/yHyHOOwNK1fAml6LNxE9MlUasL4py+04y4ZtsiyJLHaFQ789oQbNv32ruJvfenJzE5oqv/VBOcLHqRhLhkgkVKVJCq/X6tbyOpIXwWXYal3LjFUwfw9uosnYoP1rBLbV6Ra1CURxhu6LEJ6jWttI1KYLd7HJwJi1HcF+ArlUODhlPE9sMIhEb/vUe7GQbPInR5eNvJNrYqTj94pUUWsB4u1Hw7ig0EhnmWiLZK+gxg4OxLlVnbsvf2OYQNsPW4qedUqW1RysTwUUA6ZxeLy1Z/dpGWOmxk6FoCU0xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BN4UdafGKZbyRPeTDqqTdKTMSPqi9/dKD6kaWM49230=;
 b=CHC+QMEd5vA5BSGrkwYsc3yP8PB5Cmj1wKjZgBHaBHzEiRuL4OopkkWWlYh/nEwK1dHmwZkqCRw/QrwEka6NaMOzvuiSeHb6I8IVKQAgStck7XekWzrMEyQ5PA04CftJO+T5CGiAKeffaZ/ZU3RhsABAt4Ad5C9LoAv5sxFQY+A=
Received: from CY8P220CA0037.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:47::7) by
 CH1PPF189669351.namprd12.prod.outlook.com (2603:10b6:61f:fc00::608)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Thu, 13 Aug
 2026 08:03:40 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:930:47:cafe::9e) by CY8P220CA0037.outlook.office365.com
 (2603:10b6:930:47::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Thu,
 13 Aug 2026 08:03:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 08:03:39 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 03:03:39 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 03:03:39 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 03:03:38 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 1/2] lib/amdgpu: fix NULL deref computing
 available_rings in amdgpu_create_ip_queues
Date: Thu, 13 Aug 2026 16:03:22 +0800
Message-ID: <20260813080337.3327962-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|CH1PPF189669351:EE_
X-MS-Office365-Filtering-Correlation-Id: f97b69ab-088f-4408-4337-08def91162ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: WUemPPOpKSrK9p6H35sQdwKvefDtsGusSmF6ml6FIGDGXWxndBaIQvFbKRNHy32XvxiosNmmbaKC83YaBx7+sj9HUQAWZy/nM1lzRVnosPuf4bDrZMSjDolHW0x7gD1y/HeUawdqcjsJeLZ4jpZLhf/3sLEADagcM4As5o50ABtO/+9RQFPbDjNuTykqAO5133pjB6JmnM2g2bTeKtudcETpvE/MHGS4/qY8/oyiptOoYh5IqoDaqFdRyQHcMEBTdcGtBORfO9MQCfm9x9P26KD93Q32ll6KdMvrRZgznUM6/obhtQtOObzqAKJi8Qzf1SZMqkq+B0ae7ZqV52faUq9wyHOj8Ad8EEUG1i+dIbX86KrOlWQbfD/D6QsJsha216iDq/nX5iSaQTFayU04cV2W3a4x/TnA53OdTqM+Pzyx/yBuPkQVa7nBtj1t6pEqyeMHqxgMLNjNyNMXc/6y/D0cmW7hTZ8V+8Vje2yMzYnQ1TgG6F8pLrEvlorTCqPMwto/CXbHgSBFLQsEnaTZgln/gN617D/wvTrrvOQyVq7w3I9LT99/Hu9Zlsl3QIrkp5xUBjAS8rEvuGxX3hAwBLMBLdWO92cvnK43OltfDY+tL4ysKe4crX+0aZ/bOXZUX4X8zxJ2mGUwj8DHXT1FHa/kQ335CQyTCdytynHwBh8wEIKaJQIg1FtgyLmHIoDgXC59mBtIJJO73e19Vvnd2Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(18002099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tuir4AFAdWHQIQpcjx1iimsNdoBm3/uCm1E3eZ/eS3mfS1AWdAZ3R8wH8znrwhFl7OVhYzbLfkQ1Ah1j56Fpwf4FipTwI4j750TyoJhtreG8GMwh+co6msoFkQNyVfvO3KeWSzPODg9AR1XQqIP/767AzNyS/rBLDCarKle3dOJVUV8vGPfxnOzbjtruu9Wt9a8/iD41tlwuQEXel9kCZ6a5calbP+ZWqwPJldaq1DR9e4wez5UxxT5KJ7eeeGRfdxmZyqDmvpdF5OAXnAn+0LWIZkNY9/lH55U2082UZPuLWp37DuCCrcoPypXDZe8QgsuKc6zGK4w0FPL1+rMOKD2qFN0NCHTvzQw2FnIbIp0PhCXPXXZ/ZVIO6tyqM2R+mhMGBdGDH/QY8Jrml5FD6ETokeuEWeBz14zG2Ps7YOOxt64JEVuNzx18fbhRK61/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 08:03:39.9532 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f97b69ab-088f-4408-4337-08def91162ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF189669351
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

amdgpu_create_ip_queues() dereferenced ring_context->hw_ip_info to compute
available_rings while ring_context was still NULL - it is only allocated later
via calloc(). This crashed the all-queues-with-umq subtest with a SIGSEGV in
amdgpu_create_ip_queues() before any queue was created.

The HW IP info is already queried into the local hw_ip_info at the top of the
function, so read available_rings from that instead of the not-yet-allocated
ring_context.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_command_submission.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 0334c2ded..7210cffb9 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -181,10 +181,10 @@ static void amdgpu_create_ip_queues(amdgpu_device_handle device,
 	amdgpu_dma_limits_query(device, &limits);
 
 	if (user_queue)
-		available_rings = ring_context->hw_ip_info.num_userq_slots ?
-			((1 << ring_context->hw_ip_info.num_userq_slots) -1) : 1;
+		available_rings = hw_ip_info.num_userq_slots ?
+			((1 << hw_ip_info.num_userq_slots) - 1) : 1;
 	else
-		available_rings = ring_context->hw_ip_info.available_rings;
+		available_rings = hw_ip_info.available_rings;
 
 	if (available_rings <= 0) {
 		*ring_context_out = NULL;
-- 
2.49.0

