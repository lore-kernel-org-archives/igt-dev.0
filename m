Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EC8C531DF
	for <igt-dev@archiver.kernel.org>; Fri, 23 Aug 2024 00:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E301410E131;
	Fri, 23 Aug 2024 00:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="M1RDX01h";
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2048.outbound.protection.outlook.com [40.107.212.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1A710E131
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Aug 2024 00:04:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upOy/GBpLU1hCeT47Zg0Mn/FB4B2OkfFOLl8QtP9uhPTX/zBZGvHhWWsAhnkT1aGn1ACPJdlCSxJbloenCf12NUdFOSCGdJpmzGyBABYLAMwBcHYJBFQMM0STH62cLJJ2gV0w8mMdLH850lgFp3GYnEW78USSJnHzA8AU2RfOKraPbOmLtJaQhO2f6CeWuLObXkhXncsBdTY0Te2ObDMzmENhXbM62KtsWNJt81nN1MGtd9jNiy0mLM5sqzVabUP9nbiefLL/TveNe1qY+X/btz4Rv1VMrQcKY4jjaLOKSbstJ/xDPbBflQlifyOO8+IaauwTMG/2QbdNNhDJzJfRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwNJGkpeFLVmfIP3RaJhqy2BY1YxAyzVW9s2dafyYDs=;
 b=JEbTzX2tJqwpP8LZ4jpcHZ8W+wa8v8zuYQHDJXhOGU041dJa3BkoHZpMT1WSEdlDyfyLjxpahfz/Z0XzGGktMzTct2vU/dRExpGBEQILgHTTGSOiQqmDxU4xYBE/0Kry7NfIrrnev3CpK7xgjWW2mjguCuXHJBIg2ylrrzPjJji144OioMtdwo1FvEJ5rIbCRwCNdaRFUsEOAxZi0TBjvJjSZmIRVOp/N9itbb3PSf+5xLsvu9TZZrVov1dXZu+uPXDaP++znCFwImBru5s6OD9cicrfPcCJ2QgYwqevJwvzmdaHuua7IGklZVE+WS+8Vjk/Gln44Z+gM9bgGo+FPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwNJGkpeFLVmfIP3RaJhqy2BY1YxAyzVW9s2dafyYDs=;
 b=M1RDX01h4Dap3eEID0kYtMqSOf0262q6muiK9q4dH7jdy4KtztFl3BZlK65I4IItmpauUh3TyWVMlzzAWn5mXqFCvEoam08X06fM5nhDpwpNsNkgw5+HGeToRHMYqSL/++kCWjOlN7znGTNGn5A5TU2jBXQ8lx+M2YbLoKC/Q88=
Received: from SN4PR0501CA0004.namprd05.prod.outlook.com
 (2603:10b6:803:40::17) by LV8PR12MB9357.namprd12.prod.outlook.com
 (2603:10b6:408:1ff::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 00:04:18 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:803:40:cafe::d3) by SN4PR0501CA0004.outlook.office365.com
 (2603:10b6:803:40::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13 via Frontend
 Transport; Fri, 23 Aug 2024 00:04:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 00:04:18 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 Aug
 2024 19:04:17 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 Aug
 2024 19:04:17 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 22 Aug 2024 19:04:16 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Christian
 Koenig" <christian.koenig@amd.com>
Subject: [PATCH] tests/amd_queue_reset: add ability to skip subtest
Date: Thu, 22 Aug 2024 20:04:14 -0400
Message-ID: <20240823000414.470277-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|LV8PR12MB9357:EE_
X-MS-Office365-Filtering-Correlation-Id: d9974568-e3fb-4dc3-4a6e-08dcc307222c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1UzSlJGemNMVk5kT0NObGRULzFGSFFxakM0SG5oVDI4YVFTY0tMVjNYSlRL?=
 =?utf-8?B?VGZNbnJpQU85TFUwZlI0cTJYQytzai8xTlg2RUQ5RXYzUzlJUWI4NzBTaDR1?=
 =?utf-8?B?RlBqbnZNTkpOU3FXdzlzVjRIZmxPY3B6L2dyVHpmQW9NOW5NV0kzdkNDNEdU?=
 =?utf-8?B?UkZoYmV3UHFaR2hXbXhEZ0E4RFprOVhlbmxhbTNsUTZyY2k4RVBDZ3hpMDlH?=
 =?utf-8?B?MmVKNkVYRmYrSCtMemgwalYxdURvWEdHeFltMC9vM1doS3pNV2hHenpoV1pv?=
 =?utf-8?B?MndDQWpaaXU2UFBBQmRxNVQzSUFTdXpmUnFORzdSRlhaMi8vcnk0S3Nqb1lY?=
 =?utf-8?B?aW42RW1ldTZud0RVRi9uWG1DTHB0ZnpFRktUWSthdS9oV08wbVVnS2ZFM08w?=
 =?utf-8?B?K1NiYnF3SmtEajBCbzBwMWUvTm1UMW9Gb3BGMXpUWHVRM0FmZkFmQnpkbHYv?=
 =?utf-8?B?OTB4KzVqL2YzSmpmOS9SOUFjbWFJOGVza0R3aldqWFdRUDNtZ0xUNGhtb2Z0?=
 =?utf-8?B?dGVtV1dGODNLV2g5RGpiOWtsZ0ZKbVBzb2tNWXhaU0IxazZlWHlLQTR6aGxP?=
 =?utf-8?B?UnR3OVo2M3V5UTQ3L2pOVkgvS3hzUUY1dm90VXVDbFBUL1dNUDZUbysyTDBT?=
 =?utf-8?B?MDhxN1ZvdTFCRHh3TEVZUTFwV05jUXlFUE5Cb1FaU09UOHE0VGlxTGVUa01M?=
 =?utf-8?B?UWxKeVFuZm5ua0s0TzVSd0hmNTFOZ0Q4WGtTalVVUDBYcEJNMEtEOUhta0dF?=
 =?utf-8?B?N3BpaFZrQjJrRDA5RmVaQmMrNnRPU1RaR0dTK1Bxb2s0aUpOeUhLbEpiOStW?=
 =?utf-8?B?K3h0M3RLc3psWmxHSmQ4d1BCUzNpcVd3MUlyVmJhYW5yREdJMXZnZGsxNXp0?=
 =?utf-8?B?SytPSTV3cE5KSTFwYnYvdHdvMG5rU0VTT0JIUHhWV1pNelJ6endINTdSRGox?=
 =?utf-8?B?TDN4RHdKSGpVTmpIRzhMd25leWNtNVI2MHB2MWhxOUY5ZnVQOUJYWGY1UHNC?=
 =?utf-8?B?VlVkZU15SXo2NmYrUXJWQTZXa2p6Nk9PTVBhNTNuUTVPblBWSjlzWWYrcTFW?=
 =?utf-8?B?bkFjRXp6MHNUdUFEQzFNdzhqclAzWktlRE5YdXN3WlNWL3NPUXkveGhlc3Fs?=
 =?utf-8?B?RVZLS2VRR2hJVm40aVdyWVdJTjlPQWZsVjVuVUp4dzhDTU9IckRKVXRPZWJa?=
 =?utf-8?B?MXJ3c2JsQU5UTjkrakxsWG4yMTRyUFpRTDRTQjUrVmIxSFhKUFNraTdtNWhC?=
 =?utf-8?B?WG8zc3pvMzcrbXc2cTBkUUQveEpaNFFSSHhla09mZE80R1lyN3ZiTkt6NnNn?=
 =?utf-8?B?VnhNUVpOUzFhekpTcFh6dlZLZHJyV1VkMWl6aUF4L1kwTVVPZytRWTN1S083?=
 =?utf-8?B?L1RuUkg3NStTQkUxT0g2N0ZDUmlydmpweUp2cDVwWGlkSENIVHo2NE1USm9X?=
 =?utf-8?B?WTM0SC9POWpyUmYwcGIycGNkWjR4NjZ4dithUkR2Rm9vdSsvYm56QWdmT3dp?=
 =?utf-8?B?NHEvV0Mzd2YwTENYS2cxQ3B0MmdhMWZ2ZmZrL1UxcFRLWm5DQTNZbWo0eE5Q?=
 =?utf-8?B?MGsxVEEwV0tmVnZYNnJmdVVrcWNNWEFDWHFhcGlRNEowcGhFU1daano0SnNl?=
 =?utf-8?B?VC9hL1g0dWE1SmJxMG5UaStMclluN1ZGM3dTWkxmV0pMbCtIYU1TcFBXVE85?=
 =?utf-8?B?QVBXdW83Z3puelh1Y3BHc0lrMGtyclk5Z1B6N3VzOFN5eDNJY28yYk9KeDF3?=
 =?utf-8?B?VnF6Q2RjdXJzektBUEQweGUvRDBWc3dxbnhSVlhQSnJJZE5tRitaUUI0dTdK?=
 =?utf-8?B?VGRIckRMaFpqOUJhVHlibWhGcDYzSGJldTRIcWZyaWpsdEw2aCtWTFFVV2hD?=
 =?utf-8?B?d2RQZjJhRlJ0Rm1lanpsN3BKWUQrL09JS0FXUlNjQmVYM1B5RXZJdWhoclI5?=
 =?utf-8?Q?KwJW2DxQahifjZr61h4T+/KsL0JNXqpQ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 00:04:18.4345 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9974568-e3fb-4dc3-4a6e-08dcc307222c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9357
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

Some ASICs may lack functionality for specific error types, such as
CMD_STREAM_EXEC_INVALID_PACKET_LENGTH, etc. To effectively test the
entire table of queue/pipe reset errors, we’ve added an exclude
filter that allows us to skip certain subtests based on family and
chip ID.

The complexity lies in ensuring that the three other processes
(test, background, and monitoring) remain synchronized. This ensures
that each subtest can be skipped when necessary, while the next
subtest is properly executed.

Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_ip_blocks.h     |  11 ++++
 tests/amdgpu/amd_queue_reset.c | 115 +++++++++++++++++++++++++++------
 2 files changed, 108 insertions(+), 18 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 1b39d9945..86b82c40c 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -45,11 +45,22 @@ enum  cmd_error_type {
 	BACKEND_SE_GC_SHADER_INVALID_USER_DATA /* COMPUTE_USER_DATA */
 };
 
+#define _MAX_NUM_ASIC_ID_EXCLUDE_FILTER 3
+
+struct asic_id_filter
+{
+	int family_id;
+	int chip_id_begin;
+	int chip_id_end;
+};
+
 struct dynamic_test{
 	enum cmd_error_type test;
 	const char *name;
 	const char *describe;
+	struct asic_id_filter exclude_filter[_MAX_NUM_ASIC_ID_EXCLUDE_FILTER];
 };
+
 #define for_each_test(t, T) for(typeof(*T) *t = T; t->name; t++)
 
 /* aux struct to hold misc parameters for convenience to maintain */
diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 6a094d812..a3bc37018 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -25,6 +25,7 @@
 #include "lib/amdgpu/amd_command_submission.h"
 #include "lib/amdgpu/amd_deadlock_helpers.h"
 #include "lib/amdgpu/amd_dispatch.h"
+#include "lib/amdgpu/amdgpu_asic_addr.h"
 
 
 #define NUM_CHILD_PROCESSES 4
@@ -67,7 +68,8 @@ struct shmbuf {
 	sem_t sync_sem_enter;
 	sem_t sync_sem_exit;
 	int count;
-	bool test_completed;
+	bool sub_test_completed;
+	bool sub_test_is_skipped;
 	unsigned int test_flags;
 	int test_error_code;
 	bool reset_completed;
@@ -123,18 +125,38 @@ get_reset_state(struct shmbuf *sh_mem, unsigned int *flags)
 	bool reset_state;
 
 	sem_wait(&sh_mem->sem_state_mutex);
-	reset_state = sh_mem->reset_completed;
+	reset_state = sh_mem->reset_completed || sh_mem->sub_test_is_skipped;
 	*flags = sh_mem->reset_flags;
 	sem_post(&sh_mem->sem_state_mutex);
 	return reset_state;
 }
 
+static bool
+is_subtest_skipped(struct shmbuf *sh_mem)
+{
+	bool skipped;
+
+	sem_wait(&sh_mem->sem_state_mutex);
+	skipped = sh_mem->sub_test_is_skipped;
+	sem_post(&sh_mem->sem_state_mutex);
+
+	return skipped;
+}
+
+static void
+skip_sub_test(struct shmbuf *sh_mem)
+{
+	sem_wait(&sh_mem->sem_state_mutex);
+	sh_mem->sub_test_is_skipped = true;
+	sem_post(&sh_mem->sem_state_mutex);
+}
+
 static void
 set_test_state(struct shmbuf *sh_mem, bool test_state,
 		int error_code, enum error_code_bits bit)
 {
 	sem_wait(&sh_mem->sem_state_mutex);
-	sh_mem->test_completed = test_state;
+	sh_mem->sub_test_completed = test_state;
 	sh_mem->test_error_code = error_code;
 	if (test_state)
 		set_bit(bit, &sh_mem->test_flags);
@@ -143,15 +165,13 @@ set_test_state(struct shmbuf *sh_mem, bool test_state,
 	sem_post(&sh_mem->sem_state_mutex);
 }
 
-
-
 static bool
 get_test_state(struct shmbuf *sh_mem, int *error_code, unsigned int *flags)
 {
 	bool test_state;
 
 	sem_wait(&sh_mem->sem_state_mutex);
-	test_state = sh_mem->test_completed;
+	test_state = sh_mem->sub_test_completed || sh_mem->sub_test_is_skipped;
 	*error_code = sh_mem->test_error_code;
 	*flags = sh_mem->test_flags;
 	sem_post(&sh_mem->sem_state_mutex);
@@ -306,6 +326,7 @@ static void set_next_test_to_run(struct shmbuf *sh_mem, unsigned int error,
 	sh_mem->good_job.error = CMD_STREAM_EXEC_SUCCESS;
 	sh_mem->good_job.ip = ip_good;
 	sh_mem->good_job.ring_id = ring_id_good;
+	sh_mem->sub_test_is_skipped = false;
 	sem_post(&sh_mem->sem_state_mutex);
 
 	//sync and wait for complete
@@ -316,6 +337,14 @@ static void set_next_test_to_run(struct shmbuf *sh_mem, unsigned int error,
 		"Testing does not trigger reset \n");
 }
 
+static void set_next_test_to_skip(struct shmbuf *sh_mem)
+{
+	skip_sub_test(sh_mem);
+	sync_point_enter(sh_mem);
+	wait_for_complete_iteration(sh_mem);
+	sync_point_exit(sh_mem);
+}
+
 static int
 shared_mem_destroy(struct shmbuf *shmp, int shm_fd, bool unmap)
 {
@@ -373,8 +402,9 @@ shared_mem_create(struct shmbuf **ppbuf)
 		goto error;
 
 	shmp->count = 0;
-	shmp->test_completed = false;
+	shmp->sub_test_completed = false;
 	shmp->reset_completed = false;
+	shmp->sub_test_is_skipped = false;
 
 	*ppbuf = shmp;
 	return shm_fd;
@@ -415,6 +445,37 @@ is_queue_reset_tests_enable(const struct amdgpu_gpu_info *gpu_info, uint32_t ver
 	return enable;
 }
 
+static bool
+is_sub_test_queue_reset_enable(const struct amdgpu_gpu_info *gpu_info,
+		struct asic_id_filter exclude_filter[_MAX_NUM_ASIC_ID_EXCLUDE_FILTER],
+		const struct dynamic_test *it)
+{
+	int i;
+	bool enable = true;
+	int chip_id;
+	char error_str[128];
+	bool is_dispatch;
+
+	for (i = 0; i < _MAX_NUM_ASIC_ID_EXCLUDE_FILTER; i++) {
+		if (gpu_info->family_id == exclude_filter[i].family_id) {
+			chip_id = gpu_info->chip_external_rev - gpu_info->chip_rev;
+			if (chip_id >= exclude_filter[i].chip_id_begin &&
+				chip_id < exclude_filter[i].chip_id_end) {
+				enable = false;
+				is_dispatch_shader_test(it->test, error_str, &is_dispatch);
+				igt_info("PID %d SKIP subtest %s CHIP family (%s) %d chip %d, begin end [%d %d] excluded\n",
+						getpid(), error_str, g_pChip->name,
+						gpu_info->family_id, chip_id,
+						exclude_filter[i].chip_id_begin,
+						exclude_filter[i].chip_id_end);
+				break;
+			}
+		}
+	}
+
+	return enable;
+}
+
 static int
 amdgpu_write_linear(amdgpu_device_handle device, amdgpu_context_handle context_handle,
 		const struct amdgpu_ip_block_version *ip_block,
@@ -501,6 +562,9 @@ run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_contex
 		set_reset_state(sh_mem, false, ALL_RESET_BITS);
 		time(&start);
 		while (1) {
+			if (is_subtest_skipped(sh_mem))
+				break;
+
 			if (state_machine == 0) {
 				amdgpu_cs_query_reset_state2(arr_context[test_counter], &init_flags);
 
@@ -550,7 +614,7 @@ run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_contex
 			if (cnt % 1000000 == 0) {
 				time(&end);
 				elapsed = difftime(end, start);
-				if ( elapsed >= TEST_TIMEOUT) {
+				if (elapsed >= TEST_TIMEOUT) {
 					set_reset_state(sh_mem, true, NO_RESET_SET_BIT);
 					break;
 				}
@@ -582,6 +646,12 @@ run_test_child(amdgpu_device_handle device, amdgpu_context_handle *arr_context,
 
 	while (num_of_tests > 0) {
 		sync_point_enter(sh_mem);
+		if (is_subtest_skipped(sh_mem)) {
+			sync_point_exit(sh_mem);
+			num_of_tests--;
+			test_counter++;
+			continue;
+		}
 		set_test_state(sh_mem, false, 0, ERROR_CODE_SET_BIT);
 		read_next_job(sh_mem, &job, false);
 		bool_ret = is_dispatch_shader_test(job.error,  error_str, &is_dispatch);
@@ -631,6 +701,11 @@ run_background(amdgpu_device_handle device, struct shmbuf *sh_mem,
 
 	while (num_of_tests > 0) {
 		sync_point_enter(sh_mem);
+		if (is_subtest_skipped(sh_mem)) {
+			sync_point_exit(sh_mem);
+			num_of_tests--;
+			continue;
+		}
 		read_next_job(sh_mem, &job, true);
 		ip_block_test = get_ip_block(device, job.ip);
 		is_dispatch_shader_test(job.error,  error_str, &is_dispatch);
@@ -979,9 +1054,11 @@ igt_main
 	 */
 	struct dynamic_test arr_err[] = {
 			{CMD_STREAM_EXEC_INVALID_PACKET_LENGTH, "CMD_STREAM_EXEC_INVALID_PACKET_LENGTH",
-				"Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes"},
+				"Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes",
+				{ {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } },
 			{CMD_STREAM_EXEC_INVALID_OPCODE, "CMD_STREAM_EXEC_INVALID_OPCODE",
-				"Stressful-and-multiple-cs-of-bad and good opcode-operations-using-multiple-processes"},
+				"Stressful-and-multiple-cs-of-bad and good opcode-operations-using-multiple-processes",
+				{ {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOWN, -1, -1 } } },
 			//TODO  not job timeout, debug why for n31.
 			//{CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,"CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC",
 			//	"Stressful-and-multiple-cs-of-bad and good mem-sync-operations-using-multiple-processes"},
@@ -989,14 +1066,17 @@ igt_main
 			//{CMD_STREAM_TRANS_BAD_REG_ADDRESS,"CMD_STREAM_TRANS_BAD_REG_ADDRESS",
 			//	"Stressful-and-multiple-cs-of-bad and good reg-operations-using-multiple-processes"},
 			{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, "BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR",
-				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
+				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes",
+				{ {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } },
 			//TODO  KGQ cannot recover by queue reset, it maybe need a fw bugfix on naiv31
 			//{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,"BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING",
 			//	"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
 			{BACKEND_SE_GC_SHADER_INVALID_USER_DATA, "BACKEND_SE_GC_SHADER_INVALID_USER_DATA",
-				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
+				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes",
+				{ {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOWN, -1, -1 } } },
 			{BACKEND_SE_GC_SHADER_INVALID_SHADER, "BACKEND_SE_GC_SHADER_INVALID_SHADER",
-				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
+				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes",
+				{ {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } },
 			{}
 	};
 
@@ -1021,9 +1101,6 @@ igt_main
 		err = amdgpu_device_initialize(fd, &major, &minor, &device);
 		igt_require(err == 0);
 
-		igt_info("Initialized amdgpu, driver version %d.%d\n",
-			 major, minor);
-
 		r = amdgpu_query_gpu_info(device, &gpu_info);
 		igt_assert_eq(r, 0);
 
@@ -1065,16 +1142,18 @@ igt_main
 		for (struct dynamic_test *it = &arr_err[0]; it->name; it++) {
 			igt_describe("Stressful-and-multiple-cs-of-bad-and-good-length-operations-using-multiple-processes");
 			igt_subtest_with_dynamic_f("amdgpu-%s-%s", ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GFX", it->name) {
-				if (arr_cap[ip_tests[i]] && get_next_rings(&ring_id_good, &ring_id_bad, info[0].available_rings,
+				if (arr_cap[ip_tests[i]] && is_sub_test_queue_reset_enable(&gpu_info, it->exclude_filter, it) &&
+						get_next_rings(&ring_id_good, &ring_id_bad, info[0].available_rings,
 						info[i].available_rings, ip_background != ip_tests[i], &ring_id_job_good, &ring_id_job_bad)) {
 					igt_dynamic_f("amdgpu-%s-ring-good-%d-bad-%d-%s", it->name, ring_id_job_good, ring_id_job_bad,
 							ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GFX")
 					set_next_test_to_run(sh_mem, it->test, ip_background, ip_tests[i], ring_id_job_good, ring_id_job_bad);
+				} else {
+					set_next_test_to_skip(sh_mem);
 				}
 			}
 		}
 	}
-
 	igt_fixture {
 		if (process == PROCESS_TEST) {
 			waitpid(monitor_child, &monitorExitMethod, 0);
-- 
2.25.1

