Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB76C7EE2E
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 07:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF3210E5AE;
	Thu, 29 Aug 2024 07:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qi1tmbfx";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D87B10E5AE
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 07:32:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KUzlpdo+CC9h+/kmTtE39gWXSkfZcI6ZoIzC44oexI7lfZARqwbQ0s1LPsm0hN2MRg7jwD1Q12OurahxLVHhb0Y7vQeLizYWoQs/onnZij6dmcDrfe/UM5EVN+uvsrm2ckNHoqwCtR/ORpjqNQvELwOMor0pRoXGfQ2dIZwxnnsH8A54nORjT5GW87QNWT1Fid7gDc3DZvfzqapsPAKjitQ+QZrUNaIdIsjnQmw7DSMGGH8LnLitUGuNeK/OeVam0iVSUjaxL3s69TiF8Ax9dfMok4TalNIwM8vk2R3VSHgRFLolZ/OL9Kuan3TWw5wH/PuE8hRuL9XVEm59Ruwnkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlh7/HWZi5KCPFMI86DG4CV+dFYGcwim7r7i/MTwEf0=;
 b=Gt6686qeNhU2vF5BO9PAER+2DRAD2LIrB/ltIfBc+Ef+TUswDVCPFhypSSfPi9/slPdio/SZiffXiisvA+Rn8A937sw/iG2TDhwY6gll7ZkWp8x+MvaRSkppMDgZUvrsM9hDrt0xtHWuPQ2kJUpL7j2/rRN/pDncPHKY8D9Z9mtZUQQdIFHgU5AhKqkBL6rw80xtcZlYg/VZlWgGHuQ50wstf26HrwCuhYHhxoIPLoqI6q/zTdzFEb1hXr40h8Wogh2mR5RdK2M0WY7rAPKiX35Xe88Ics53D8XBWTtaK3NMdPPwcfxsc8zFdYsRmHEzQdthJBqSKkyfIeRfL4zczw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlh7/HWZi5KCPFMI86DG4CV+dFYGcwim7r7i/MTwEf0=;
 b=qi1tmbfxH2T6fCn/+YrQI575Nf93+qMIMPOHd22je4oYWQecGtqUklh5quoaN+mYgP/GMKeBSsQh6pGOSVZG0Eqe01oV2KaFKs4+qutYJO2Ttl37GlX+4X4LEZ7UFcPJPwNSdhC6OhFt1MY49tRZbbpAhVdVWngyFUkFYGT20hQ=
Received: from MW4PR04CA0087.namprd04.prod.outlook.com (2603:10b6:303:6b::32)
 by SA3PR12MB9092.namprd12.prod.outlook.com (2603:10b6:806:37f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 07:31:58 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::e3) by MW4PR04CA0087.outlook.office365.com
 (2603:10b6:303:6b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27 via Frontend
 Transport; Thu, 29 Aug 2024 07:31:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 07:31:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 02:31:56 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 02:31:56 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 29 Aug 2024 02:31:55 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Subject: [PATCH i-g-t] tests/amd_queue_reset: add sdma test in queue reset
Date: Thu, 29 Aug 2024 15:31:53 +0800
Message-ID: <20240829073153.188855-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|SA3PR12MB9092:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f321b74-089b-4fbc-7180-08dcc7fcaa52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DbzTXjaqUBUKnXQgPrvMh8XR9pTZGy9OhI/dQTU5kQ/xcxG7J+8daJNwlcEo?=
 =?us-ascii?Q?+c3DpfIpdE+quLURqYvl3Ci9okQoODgmqaWySpKRtY0qgW5NAmV6ZwREhqT3?=
 =?us-ascii?Q?YwivePvSx/0ELgjlbNZqU/aZ8BemjFYb2oRzX4XIQmiSPKR1FoUMqnEQ5RVL?=
 =?us-ascii?Q?RpDhIOV4zTvYG18mVvFEIL1IY0LRulGPK38WPZ3kIq1LKH6ufr/gTpi1kmmn?=
 =?us-ascii?Q?QG7StciMzs7E2kK6t10T+iECAwYsUdiIdybfJi2gv9XMN2BBSwDIB5Fz2kt1?=
 =?us-ascii?Q?586/imeH7pqIN8QD4FxabDak1y/++UwDA1TwPdWXuWP5Bs7+TPjFqwSez376?=
 =?us-ascii?Q?nyndR2zkKWDQ8aJvwf02WsTUjJ1XsIR+/4pgQsA5Bt+NeHtBzi1uA7gPm9XI?=
 =?us-ascii?Q?pe9Jy04/3k+1uteFFnFmiqOX0GCm+5nd0xjrRBeyxCA+mKX9GeF7MNZbpmgM?=
 =?us-ascii?Q?eg5Iy13ssMCXYyyAI28a3toJUZLzcWZre9b34xC0Z7AoxL1/bOzLgfj1zljC?=
 =?us-ascii?Q?EOUEXexgYyaRisSyjruAJw1Ks8EPBR9T1eNcTTmrkxz6eg7WTdlAURJSHs6e?=
 =?us-ascii?Q?+1s7Ri7JssYjj64sytPtzoyJPc9wuFDAgrwyRCD0/NdT7xfocMwWs7C2t3rJ?=
 =?us-ascii?Q?mTmGQ0Jhiz/S7hIQCkSkz4tgPAu00tFFYz2z+Rxxz5fahqnT7WQadqxfQxm/?=
 =?us-ascii?Q?PTvz2par0bkW2WDc0lVqUygKOYdZtxamwcUvAblIT9Jnqbeniwm20voE6ghy?=
 =?us-ascii?Q?IQxl2e7R083/QoCQHTatJi1FcRgmC2IosM+FMsucS251jLYkpyIl9Gq+GCf4?=
 =?us-ascii?Q?2FZnK4bsXGdaVoSB+cAT+Rk283mDBPW2SJQB6SOaPq1tEZEqQjNxxeOkWjWa?=
 =?us-ascii?Q?un+sBzFcKneA8So+S7pKHai3BLHicNnduNNEmO31xX0HotRe8p1bwpDUekFV?=
 =?us-ascii?Q?BOObxqOLaLdb9PsdXFwvWaax0SUJ3iiYwp0Ec8xIr2iqE5CWYYH3P7b0Dlo1?=
 =?us-ascii?Q?GXPbusManh8mm1yDnHRiWxn0Loh0/tFDa5DEAmaxzZZJbJabMH4DSGcyJOnO?=
 =?us-ascii?Q?2EfDM70vGy0nMxCUMHmDkt0U40uX50atgxxbCrvSNrjv5in7P+TTDAzkkwv1?=
 =?us-ascii?Q?YVwMlJVzQSKJ/gl5f5X5yHTWJNE31alw8V1itD141l+GSMfQObcJI+OEPIpj?=
 =?us-ascii?Q?O2GVjQeODmopPals/7vlNOpPxFjCkXm6enOg0j3Vf2hpALTlrEEXcTuZR+CN?=
 =?us-ascii?Q?fCnzTQ77UfLmtRHke/E2zyREFZ0zZG6geatXRFYSinZ7Ss5TOa78yUECC3lO?=
 =?us-ascii?Q?MqPtSKOCuflCRc0mClWW8j7nDzSKKPYIvWGqhODkY4RnTniyYCvpvP3Kq2HP?=
 =?us-ascii?Q?aSYxkfyfkz4EGDkAZOj4kDh4iVNhHsbFb0flIMccHAEpYeBidH3xsXWRwtfX?=
 =?us-ascii?Q?SaTH110y+NG5i/Pmw0t0MJG8PY69TgFc?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 07:31:58.0327 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f321b74-089b-4fbc-7180-08dcc7fcaa52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9092
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

To enhance queue reset, add sdma ip test.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 537f653f9..af5a09fd7 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -1035,7 +1035,6 @@ igt_main
 	posix_spawn_file_actions_t action;
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {0};
-	struct drm_amdgpu_info_hw_ip info[2] = {0};
 	int fd = -1;
 	int fd_shm = -1;
 	struct shmbuf *sh_mem = NULL;
@@ -1047,8 +1046,9 @@ igt_main
 	unsigned int ring_id_job_good;
 	unsigned int ring_id_job_bad;
 
-	enum amd_ip_block_type ip_tests[2] = {AMD_IP_COMPUTE/*keep first*/, AMD_IP_GFX};
+	enum amd_ip_block_type ip_tests[] = {AMD_IP_COMPUTE/*keep first*/, AMD_IP_GFX, AMD_IP_DMA};
 	enum amd_ip_block_type ip_background = AMD_IP_COMPUTE;
+	struct drm_amdgpu_info_hw_ip info[ARRAY_SIZE(ip_tests)] = {0};
 
 	amdgpu_context_handle *arr_context_handle = NULL;
 
@@ -1142,13 +1142,17 @@ igt_main
 	for (int i = 0; i < ARRAY_SIZE(ip_tests); i++) {
 		reset_rings_numbers(&ring_id_good, &ring_id_bad, &ring_id_job_good, &ring_id_job_bad);
 		for (struct dynamic_test *it = &arr_err[0]; it->name; it++) {
+			if(ip_tests[i] == AMD_IP_DMA && !strstr(it->name,"CMD"))
+					continue;
 			igt_describe("Stressful-and-multiple-cs-of-bad-and-good-length-operations-using-multiple-processes");
-			igt_subtest_with_dynamic_f("amdgpu-%s-%s", ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GFX", it->name) {
+			igt_subtest_with_dynamic_f("amdgpu-%s-%s", ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":
+						ip_tests[i] == AMD_IP_GFX ? "GFX":"SDMA", it->name) {
 				if (arr_cap[ip_tests[i]] && is_sub_test_queue_reset_enable(&gpu_info, it->exclude_filter, it) &&
 						get_next_rings(&ring_id_good, &ring_id_bad, info[0].available_rings,
 						info[i].available_rings, ip_background != ip_tests[i], &ring_id_job_good, &ring_id_job_bad)) {
 					igt_dynamic_f("amdgpu-%s-ring-good-%d-bad-%d-%s", it->name, ring_id_job_good, ring_id_job_bad,
-							ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GFX")
+							ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":
+							ip_tests[i] == AMD_IP_GFX? "GFX":"SDMA")
 					set_next_test_to_run(sh_mem, it->test, ip_background, ip_tests[i], ring_id_job_good, ring_id_job_bad);
 				} else {
 					set_next_test_to_skip(sh_mem);
-- 
2.25.1

