Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F73AC3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 00:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239D710E55E;
	Wed, 21 Aug 2024 00:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PTUGwzlq";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA9010E55E
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 00:06:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQiJJeFMjtPMARo1zODZjktu1M5KVzcvyaz/JRWgQvcE++ueDCbvxQn6Ec2iTlyUgzz4uX4GaFjvcIXhIKNUWdi1hwrs8IUZ59Ekc61HvdHIvKGPPnLAHevby016QVMuoOJNWIGhEs/bOo65YPQcrfDqHdnByMfF1qnnx5dEp0Kyg6lr8vMsckIfOQdtqLSn0giOF+KRh68XrQ7eXWl9cQ8IikSqW5sqA6kli+MqxoyQi2lP3942i94GVu7AjgHvkWk9YrkqHqq9vYIutLggRnaL9AITRzi1XyZl3aMrnoeXfMq92u9bq8lc4I64Fl/wkeJkFh37DcpxtRoxEDgQdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+RUiQqsx9REX7UGUv+uocpiYBflKWv0yWiZZ0Oe2VM=;
 b=U7L2m9CvFc0T9T/0QsBYhRsWwvWkzcdqAG0ie8l2cGuyqP2vPjTSMxraAR6uZSz4qUT3X+Io3/3tc5UhEw5Q8l6wM/vs6Zuu4evUxRZpEogF/a1TsTLS44UltP3i7tSeuH+U2DUHHSaftq3rS8xA2h7bItdJIPyzt6hUGYBzwUNds0N8QCUoW2JQ/kv8bfd+WLYpCsr4FSGyD5xbb/agEsDBUODQ7fp6gAR/fTOZRkQLciPzRgBuczShEfJ2fpGtYxP7KxYeTNAMVxUBVadtCseBZAmNpve93LEeDj6JAg76BHhNiVR9WnnxQJqcihSKavndFILdk7Hq3KyCyza2LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+RUiQqsx9REX7UGUv+uocpiYBflKWv0yWiZZ0Oe2VM=;
 b=PTUGwzlqHRa29YKaPKbSgC3//vr0AT7eMHl4Lirl1C3zOhs8U8iFOLHyDGxdS7c3UMNvmLYPKiRS1qodyfZbpbku0C+vZE67yGPBXFbShTm/kcaS7JhX38oA/AdUDtlb00syVCIYfBKPod4PKx3o3Q8Syl4C2C3adl50EFSq4Ig=
Received: from BN8PR04CA0057.namprd04.prod.outlook.com (2603:10b6:408:d4::31)
 by LV8PR12MB9451.namprd12.prod.outlook.com (2603:10b6:408:206::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 00:06:22 +0000
Received: from BL6PEPF0001AB4E.namprd04.prod.outlook.com
 (2603:10b6:408:d4:cafe::8d) by BN8PR04CA0057.outlook.office365.com
 (2603:10b6:408:d4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Wed, 21 Aug 2024 00:06:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4E.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024 00:06:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 19:06:21 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 20 Aug 2024 19:06:21 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Christian
 Koenig" <christian.koenig@amd.com>
Subject: [PATCH] tests/amd_queue_reset: refactor code blocks
Date: Tue, 20 Aug 2024 20:06:16 -0400
Message-ID: <20240821000616.310678-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4E:EE_|LV8PR12MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: c4559861-ba69-40ae-7d2d-08dcc175174c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ueH6ZfezAA94xLqFyfe7R+WF76XM6bquIHsfbmcxsPLA0JOoLMpmjPHVX354?=
 =?us-ascii?Q?6m11KXMnuesXBEqv+dxJ4IHIaB4hr87Nyyan3dKLUbYenIoEdJ+px0MP+Xlg?=
 =?us-ascii?Q?nvvXtRgFWSrsNnhzfgxjWBjLXfiagwPquEZODJDBZdPvk4+FvgWP61ii6O6F?=
 =?us-ascii?Q?oJBc1qy0JBdtwXA/3s4aX1XPPttrJ5GnnCJzGf8XiGFHupQJOWGGw/jgWqxi?=
 =?us-ascii?Q?UmEUbH4MLwblKt+GYdUhAFmpaT0KGnCBcQ+nmRMc8jTY/HVL1Vb7IZrxy0Ur?=
 =?us-ascii?Q?2WpXq6yqmtPZi5hFQxlgeASTVE6avh6X0y8Jv1e9yqyEYHq5+OPQru0nKwz6?=
 =?us-ascii?Q?aiO+MZUlnncVROc1FUMIinP5EMPyuGUMtlhtxMyH50ntkOxGMQsEe/jlDtND?=
 =?us-ascii?Q?VPBx+gK75e3WDfA5tzc+kyGeSiQLcU333gI599O6dB+ppfuV5CaQEethjXOz?=
 =?us-ascii?Q?+YKy/8k3qw5yiby8nsGi0ewH5pD7ePzVHQNFQ3f2av8CfJ+ox5DLJS/MpiTR?=
 =?us-ascii?Q?JjsObl0ooF8d1GddYNqJyUd5p/SOhMcCJEW0s59CC6rFuaw8VW5X6wt/egMZ?=
 =?us-ascii?Q?IV2rFATvH8dlrqR+soVQEA2pwbuSb91NIHcn6Wj98cpLCa4cOVTwnC+2cPli?=
 =?us-ascii?Q?Cs2+7WsR3zF5xfYjo//asv3x7AcIwyrCY8RgOveG875ze7ra1a8AUXTrJUur?=
 =?us-ascii?Q?CEvz3NUaqS2oVizidu6Dp6t8EGeeGKc81OetG063cDjQ4XrWEPA01pRosmTL?=
 =?us-ascii?Q?qyYGDEOk9R2DfG2Zg15tCdlLCLpXQEFBa6sv7kT8HIl7rG8VHwuRQZugslQ6?=
 =?us-ascii?Q?kvtjgHv11blid6z0XBdNs2l4YtS4FJen4R+dwfXhpy8TV5wJMoHy/f/TfRhG?=
 =?us-ascii?Q?3stXVCCWKJNMrOKFdzyimBVwccLoW+lpn0uHZVbn2mMWKrXOGJa5T9fVjL71?=
 =?us-ascii?Q?Uiq/pvuCM4JUKpXJONQ+wz/BTgAEOV9e7ymjKDXyIM9ImX9yuwKA0oGGDawz?=
 =?us-ascii?Q?UpbBau8dLSc6pGO57HfogIB8rC1RygzsZNADgqxj8EVEBn0v1v9VlnuOHIam?=
 =?us-ascii?Q?F2FGBU04VjIDhD3zUM6lcZS6vS2u3wozwQpZ5wx05yKa31POVQRxdFTdeesn?=
 =?us-ascii?Q?ity0QdTETkSV5FIMJ2L2OdH1+W70ouMs0l3rdG264UB/TfvHVvaS30t89hyQ?=
 =?us-ascii?Q?FRLk6X3VghgMgoNNdvnuy9iWP9mf8ok0MMZ1lqI/cU/E1zxLfUQV2eXGUN18?=
 =?us-ascii?Q?6Ku3bGKY4pqmqe8L34QINIf0xtbwKAA/kZyu0yssfueVxQsg80DjzWs59aCF?=
 =?us-ascii?Q?nHx/2BN5KUz6bimyoqGn/ysO8778d6XLQGUjvSOybU7tw1NFfFfnvCj4ws0P?=
 =?us-ascii?Q?Mb06V5658Y8c8R7QUAzrajPe0QAbaK98OKgh5T+2q3MpGt2/VIu39cNVH72w?=
 =?us-ascii?Q?bBvTgbOVl4ZIOEHBhLAak06NMB6z8Kf/?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 00:06:22.4115 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4559861-ba69-40ae-7d2d-08dcc175174c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9451
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

This refactoring includes the following changes:

- Initialized child process PIDs to zero.
- Moved the launch of the background process after
  validating the is_queue_reset_tests_enable condition
  for GFX > 8. This change is essential because the
  background process can hang if the test is not executed.

Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 35 +++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index fe5e0effd..6a094d812 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -26,7 +26,9 @@
 #include "lib/amdgpu/amd_deadlock_helpers.h"
 #include "lib/amdgpu/amd_dispatch.h"
 
+
 #define NUM_CHILD_PROCESSES 4
+
 #define SHARED_CHILD_DESCRIPTOR 3
 
 #define SHARED_MEM_NAME  "/queue_reset_shm"
@@ -403,10 +405,12 @@ error:
 }
 
 static bool
-is_queue_reset_tests_enable(const struct amdgpu_gpu_info *gpu_info)
+is_queue_reset_tests_enable(const struct amdgpu_gpu_info *gpu_info, uint32_t version)
 {
 	bool enable = true;
-	// TO DO
+
+	if (version < 9)
+		enable = false;
 
 	return enable;
 }
@@ -946,8 +950,8 @@ igt_main
 	char **argv = NULL;
 	char *path = NULL;
 	enum  process_type process = PROCESS_UNKNOWN;
-	pid_t pid_background;
-	pid_t monitor_child, test_child;
+	pid_t pid_background = 0;
+	pid_t monitor_child = 0, test_child = 0;
 	int testExitMethod, monitorExitMethod, backgrounExitMethod;
 	posix_spawn_file_actions_t action;
 	amdgpu_device_handle device;
@@ -1012,16 +1016,6 @@ igt_main
 		else
 			const_num_of_tests = (sizeof(arr_err)/sizeof(struct dynamic_test) - 1) * ARRAY_SIZE(ip_tests);
 
-		if (!is_background_parameter_found(argc, argv)) {
-			add_background_parameter(&argc, argv);
-			fd_shm = shared_mem_create(&sh_mem);
-			igt_require(fd_shm != -1);
-			launch_background_process(argc, argv, path, &pid_background, fd_shm);
-			process = PROCESS_TEST;
-		} else {
-			process = PROCESS_BACKGROUND;
-		}
-
 		fd = drm_open_driver(DRIVER_AMDGPU);
 
 		err = amdgpu_device_initialize(fd, &major, &minor, &device);
@@ -1032,6 +1026,7 @@ igt_main
 
 		r = amdgpu_query_gpu_info(device, &gpu_info);
 		igt_assert_eq(r, 0);
+
 		for (int i = 0; i < ARRAY_SIZE(ip_tests); i++) {
 			r = amdgpu_query_hw_ip_info(device, ip_tests[i], 0, &info[i]);
 			igt_assert_eq(r, 0);
@@ -1041,7 +1036,17 @@ igt_main
 		igt_assert_eq(r, 0);
 
 		asic_rings_readness(device, 1, arr_cap);
-		igt_skip_on(!is_queue_reset_tests_enable(&gpu_info));
+		igt_skip_on(!is_queue_reset_tests_enable(&gpu_info, info[1].hw_ip_version_major));
+
+		if (!is_background_parameter_found(argc, argv)) {
+			add_background_parameter(&argc, argv);
+			fd_shm = shared_mem_create(&sh_mem);
+			igt_require(fd_shm != -1);
+			launch_background_process(argc, argv, path, &pid_background, fd_shm);
+			process = PROCESS_TEST;
+		} else {
+			process = PROCESS_BACKGROUND;
+		}
 		if (process == PROCESS_TEST)
 			create_contexts(device, &arr_context_handle, const_num_of_tests);
 		else if (process == PROCESS_BACKGROUND)
-- 
2.25.1

