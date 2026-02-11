Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A30E9E2E4
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 11:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701EC10E3AD;
	Wed, 11 Feb 2026 11:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5m5MPRd9";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011025.outbound.protection.outlook.com [52.101.52.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A423D10E3AD
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 11:41:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbsNyZ+di8uxPNAbjHv7g3sSM92OaOg5YsXHU82PZp+lxgdAo9VrDWjxY18oAV/dec+9Z2oSQj1oj6cb8L9B92x2/F0iP9af7oBnlDzAqRQVdijRfh8E7c4CFv80efYJ6qvcBK5onBiST4/dMcRK9Vu/7bhFiKAnuTeVyl9YOLQjYOtwA4VQ0EKh8tZ7zfhTajZJvAY+T2d/6vVkXd7/R6OLBJyozi95polbqLwySpP8xyeopYke7tDTfrMObjqsUYD+igri9UM3aXtm8lntzcOFJEhsuzIMkY9i+BhvSO4fsjoUkv8UOkOzQ26WX13zpAhwlMN/V7IuM7J+RlkxVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ru4605HIB+tBOgd9EZFdkXaYF3eGuSDhzOk+L/P3WEQ=;
 b=RkgTpoWamXKPLNPEkveLFr4f7CN67jpUHdLb6vcGQ9v1PwcEa69W5qc9GPA3b7EjuQtfdUBCzuQFt0zmBSEnrSv5Zt83tdw6IEQj8pwUsxl2ytkYSPbeXVHClYpLVET1dMrC9lB4J0CrY0dJ02zUSB0v9OIzmMjapLTvJlPhLkMIaIefuhqEBOMe3rR7/fZ9TMv3gl1yeh5cHPP1J/CKpaOQBGEH3Fg3VKTegVbXEQWhso9+JFUPjsk2JC01HdDQxyfLSWeAgtA6FIUjcJIsZajBmuo4jIsEF5KKbIRCJ99b7MP49R06DdIpih1yLU++ies2YdwrhhIYM5MfYy13tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ru4605HIB+tBOgd9EZFdkXaYF3eGuSDhzOk+L/P3WEQ=;
 b=5m5MPRd9eZv6KnmXPHNyTHdjEuw8YlVYO6BJwkW/YMAuH9Z3ijxDY1964EfiCaMwV6BQPrDwJrk6JBvpVXNZr93q13umD8yHdYsRDRpe0DH4JD0IR955BvN0iXKVj0+mZ3PtuaLZBjqf6M3CSLhoe2wb7hKyCHS/lNcgirB8PSg=
Received: from CH2PR03CA0003.namprd03.prod.outlook.com (2603:10b6:610:59::13)
 by SA5PPFD911547FB.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 11:41:05 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::c) by CH2PR03CA0003.outlook.office365.com
 (2603:10b6:610:59::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend
 Transport; Wed, 11 Feb 2026 11:41:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 11:41:05 +0000
Received: from amd-X570.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Feb
 2026 05:41:02 -0600
From: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <vitaly.prosyak@amd.com>, Yogesh Mohan Marimuthu
 <yogesh.mohanmarimuthu@amd.com>
Subject: [PATCH i-g-t 2/2] tests/amdgpu: add fence wait multi packet test
Date: Wed, 11 Feb 2026 17:09:22 +0530
Message-ID: <20260211113922.11211-2-yogesh.mohanmarimuthu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211113922.11211-1-yogesh.mohanmarimuthu@amd.com>
References: <20260211113922.11211-1-yogesh.mohanmarimuthu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|SA5PPFD911547FB:EE_
X-MS-Office365-Filtering-Correlation-Id: 23f5f071-b5a3-46cb-e81f-08de696270c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YM7Y0PxlFveXaJX/TfKbbc+0JDwiaPFvoFG5eOnQOIF3JaV4o5r03H6+ZH0H?=
 =?us-ascii?Q?Fo/IgqlosCjt0i6N+WlgvOM3MgstRRrnRsZQEF0QYMrjYkd1VcNv76tezD+p?=
 =?us-ascii?Q?1mAOuv+vZFPvIrmlblVpb6jA4avFt2mskYJae2QMVT2KrPasQqkQJB+1rr/t?=
 =?us-ascii?Q?wZKS97t0Q3814vIN8eHeGJ6qtyW51wNlvZ+n3qHMRn+LIMkp9wx7iUcrnM/d?=
 =?us-ascii?Q?QTgymVPDrvM6nlQmjxp0jy1Fb3ZjtOsgUjskSmcwjABmxI61czV5nioVTG7x?=
 =?us-ascii?Q?4CLQ8qw29U5z1MlLCpN6jo1uV3w7XyyM8j+E9N3TPRN2It6CHVl9N/B7gvBA?=
 =?us-ascii?Q?eF1tA8EyGrBiUIJr11sIHvhDcKm67PAHit+JKfYKo8Evedc1VLgS6jCFrCmG?=
 =?us-ascii?Q?ifu1KpzVgQpDNJTwTusHoJP9STThND/8xRFF9zEViKPFjE25igHHXm+d5+Rv?=
 =?us-ascii?Q?AUGQcxNfrlZOUzAG/EMwu8F5ssKm2pIVZA5rJ2N1sKxucYobfBLoq9QQ0bgb?=
 =?us-ascii?Q?JKNJIzogbyg5EpxPfoBWRwQACkI5dl/hbzDoEnJFWZhIPDvWda/BVc4ftpeb?=
 =?us-ascii?Q?0fFamLFN4G7O4NOjEfV86eUwxxCkDrHL3jRFBYvcAY9Jn1hXU4tdAoSmX68L?=
 =?us-ascii?Q?odwdF6hHw4GoEicDIuq/xEWyf7jeTReJiZXTEqZfJiT8pOUPbkYQOvGWG3EI?=
 =?us-ascii?Q?Hr3J7D59uZwQaWkoS/RtpuQ2RsqCurGIOtIpr1LOZk8gdtOfcXQM1ZLuaiCx?=
 =?us-ascii?Q?0N1kwxs6PREDFW9GuDo82hqmj3UA4u9k9f1HkyqhX1m/JhJn4CMsF2BLHoj4?=
 =?us-ascii?Q?XvXww3tNp2Y873YqISnhcUUH94F+Jb/q72v6InhIWqyAZl5EyfBX+5T1U2By?=
 =?us-ascii?Q?RXZKGRtBc3WismUIxETebcEUDe6vpLwMz7BPqFuiEzvgL7Dv5eBUXBCeth1J?=
 =?us-ascii?Q?VF88lu0rAM7HqLdTW2XZ5qAaZR4ah0DnmIVsxzct4b5klWGeZc2fEjXVusD0?=
 =?us-ascii?Q?1Nl0LokPK4efgfrvOdoRCwEB8oYiRgSys/kCsIHDD6x8SrM4DF5/dge3svpq?=
 =?us-ascii?Q?lr/dlZND1LgPtqc0lhld0D1sE+cBYYV9cqSmPjS9rGu8FohgFCAFoQ2NWGhM?=
 =?us-ascii?Q?GxJ8H6c1wxL0fc2TLQqIjE8xSrkeqWufsULUDSKbkMQf0Fu9HlYN2yit0hCv?=
 =?us-ascii?Q?BBO7OZ47vdXPHVwd+qhhEwbfz0+pt+Kt5z9sQZf/OIQlOs48GaAMmRCIAk7M?=
 =?us-ascii?Q?qjs1QV3g5pjwpCK1pVKC+H1V8CpnB4e0AhYcsLG4YfKtIvbxuK8saXCXr0xx?=
 =?us-ascii?Q?ls/Vr4uJYV3jV+lgBE2K6+ouPX54n4RtesK8x9sSo6AbHzdE8AqT4ORXim+7?=
 =?us-ascii?Q?mlY5RT2LJp3AhKtGB67Soyqm1QoeV0AtiUNXavCR/jQGuChQFBAcZdPPOCQK?=
 =?us-ascii?Q?3w/yg2F449XfxGYxd0nyjGuTg12CGqbotR8hIoVbrdHMGqMkYvmAvb2TUILp?=
 =?us-ascii?Q?jtH6byQrWicnQQm0Ivs2APk/ap+VRst88njsfgzjoSNd+//EqJFN11iNWRFF?=
 =?us-ascii?Q?MVO8dow1mUEHgdtcZGz+PaOjj3KMXcfImCxJQ/CQRu3X7QJzPvrUVbqEyJgQ?=
 =?us-ascii?Q?S1zKb+uXL1UbdzykZQ0/bNQWXs5qm+KaBM11LEU29O9ub+SpUNhV+MlkFfJ2?=
 =?us-ascii?Q?D3JGoA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: B/NJdUnQ2n7NPgA3sJrquqH50NGlt5Rto5oTk4trpL6WZyUhXXrhtJ2PmCmduIGqESQNVIwyKzhksXkckVFSwmiyz+4Qtk53ljmG/rdTPYD4MtRZGplbc4dhjHeLno8b2PIH31iHzEiFG7WK416LWgU+Rozy++CkAVw780mRnLO5ZGax6Auzyo3rQFL/AnyxEVoQZVSZ4e8FVoOso6DiEuxr18wXO7Q+Syg3J60oF1B6im9Tzsm2x0bWdhWrx7L/QQTsfv7jl1qoR9bfOsA3uHxThEZKXulfC67lkfhDtnuaeNVH8fTEOfWQwUCbNBLBtP6Gz9BllAYVbfKZda12FBIzYHxM1reaxQBC5kJ7WxPffCMXLBI/ix6I/llUdCOdPiKHi89lkMPUEBAdSOqFcOTrG+FIo1eT7w4o9wVUOCgva1pp8+oBjJHXMGtp3fO+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 11:41:05.2195 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f5f071-b5a3-46cb-e81f-08de696270c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFD911547FB
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

Signed-off-by: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
---
 tests/amdgpu/amd_basic.c | 184 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 184 insertions(+)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index e57eb7969..0ef940bbe 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -5,6 +5,7 @@
  * Copyright 2023 Advanced Micro Devices, Inc.
  */
 
+#include <pthread.h>
 #include "lib/amdgpu/amd_memory.h"
 #include "lib/amdgpu/amd_sdma.h"
 #include "lib/amdgpu/amd_PM4.h"
@@ -13,6 +14,7 @@
 #include "lib/amdgpu/amd_gfx.h"
 #include "lib/amdgpu/shaders/amd_shaders.h"
 #include "lib/amdgpu/compute_utils/amd_dispatch.h"
+#include "lib/amdgpu/amdgpu_asic_addr.h"
 
 #define BUFFER_SIZE (8 * 1024)
 
@@ -662,6 +664,172 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle, bool user_queue)
 	free(ring_context);
 }
 
+static int wait_for_value64(volatile uint64_t *ptr, uint64_t expected,
+			    uint64_t timeout_ns, uint64_t check_interval_ns)
+{
+	struct timespec start, now, sleep_time;
+	uint64_t elapsed_ns;
+
+	if (!ptr)
+		return -EINVAL;
+
+	clock_gettime(CLOCK_MONOTONIC, &start);
+
+	if (check_interval_ns > 0) {
+		sleep_time.tv_sec = check_interval_ns / 1000000000ULL;
+		sleep_time.tv_nsec = check_interval_ns % 1000000000ULL;
+	}
+
+	while (1) {
+		/* Check current value */
+		if (*ptr == expected)
+			return 0;
+
+		/* Check timeout if specified */
+		if (timeout_ns > 0) {
+			clock_gettime(CLOCK_MONOTONIC, &now);
+			elapsed_ns = (now.tv_sec - start.tv_sec) * 1000000000ULL +
+				(now.tv_nsec - start.tv_nsec);
+
+			if (elapsed_ns >= timeout_ns)
+				return -ETIMEDOUT;
+		}
+
+		/* Sleep if interval specified, otherwise tight loop */
+		if (check_interval_ns > 0)
+			nanosleep(&sleep_time, NULL);
+		else
+			__asm__ __volatile__("pause" ::: "memory"); /* CPU hint for spin-wait */
+	}
+}
+
+static void* amdgpu_fwm_test_thread(void *data)
+{
+	struct amdgpu_ring_context *ring_context = data;
+	uint64_t *job_start_write_data_ptr = (uint64_t*)ring_context->bo3_cpu;
+	uint64_t *fwm_fence_ptr = (uint64_t*)ring_context->bo3_cpu + 1;
+	int *ret = calloc(1, sizeof(int));
+
+	/* Poll to confirm if job has started. This is done to have low timeout for fences
+	 * wrongly satsified check.
+	 */
+	*ret = wait_for_value64((uint64_t*)job_start_write_data_ptr, 0x1, 2 * 1000000, 1000);
+	if (*ret)
+		return ret;
+
+	/* Poll if job completed without fence satisfied */
+	*ret = wait_for_value64((uint64_t*)ring_context->bo_cpu, 0xdeadbeef, 100 * 1000, 2000);
+	if (*ret == 0) {
+		*ret = -EINVAL;
+		return ret;
+	}
+
+	for (unsigned i = 0; i < 32; i++)
+		fwm_fence_ptr[i] = i + 1;
+
+	*ret = 0;
+	return ret;
+}
+
+static void amdgpu_fwm_test(amdgpu_device_handle device_handle, unsigned ip_type)
+{
+	struct amdgpu_ring_context *ring_context;
+	struct amdgpu_cmd_base *cmd_base = get_cmd_base();
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device_handle, ip_type);
+	int r;
+	pthread_t fwm_test_thread;
+	int *thread_ret;
+
+	ring_context = calloc(1, sizeof(struct amdgpu_ring_context));
+	igt_assert(ring_context);
+	if (ip_block->funcs->family_id == FAMILY_GFX1150)
+		ring_context->max_num_fences_fwm = 4;
+	else
+		ring_context->max_num_fences_fwm = 32;
+
+	ip_block->funcs->userq_create(device_handle, ring_context, ip_block->type);
+
+	/* Allocate bo for dma */
+	ring_context->write_length = 1024;
+	r = amdgpu_bo_alloc_and_map_sync(device_handle , ring_context->write_length, 4096,
+					 AMDGPU_GEM_DOMAIN_GTT, AMDGPU_GEM_CREATE_CPU_GTT_USWC,
+					 AMDGPU_VM_MTYPE_UC, &ring_context->bo,
+					 (void **)&ring_context->bo_cpu, &ring_context->bo_mc,
+					 &ring_context->va_handle,
+					 ring_context->timeline_syncobj_handle,
+					 ++ring_context->point, true);
+	igt_assert_eq(r, 0);
+	memset((void *)ring_context->bo_cpu, 0, ring_context->write_length);
+
+	/* Allocate bo2 for ib */
+	r = amdgpu_bo_alloc_and_map_sync(device_handle, 8192, 4096, AMDGPU_GEM_DOMAIN_GTT,
+					 AMDGPU_GEM_CREATE_CPU_GTT_USWC, AMDGPU_VM_MTYPE_UC,
+					 &ring_context->bo2, (void **)&ring_context->bo2_cpu,
+					 &ring_context->bo_mc2, &ring_context->va_handle2,
+					 ring_context->timeline_syncobj_handle,
+					 ++ring_context->point, true);
+	igt_assert_eq(r, 0);
+	memset((void *)ring_context->bo2_cpu, 0, 8192);
+
+	/* Allocate bo3 for fence wait packet fences */
+	r = amdgpu_bo_alloc_and_map_sync(device_handle, 4096, 4096, AMDGPU_GEM_DOMAIN_GTT,
+					 AMDGPU_GEM_CREATE_CPU_GTT_USWC, AMDGPU_VM_MTYPE_UC,
+					 &ring_context->bo3, (void **)&ring_context->bo3_cpu,
+					 &ring_context->bo_mc3, &ring_context->va_handle3,
+					 ring_context->timeline_syncobj_handle,
+					 ++ring_context->point, true);
+	igt_assert_eq(r, 0);
+	memset((void *)ring_context->bo3_cpu, 0, 4096);
+
+	/* wait for gtt mapping to complete */
+	r = amdgpu_timeline_syncobj_wait(device_handle, ring_context->timeline_syncobj_handle,
+					 ring_context->point);
+	igt_assert_eq(r, 0);
+
+	/* assign cmd buffer for ring context */
+	cmd_base->attach_buf(cmd_base, (void *)ring_context->bo2_cpu, 8192);
+
+	ring_context->job_start_write_data_va_addr = ring_context->bo_mc3;
+	ring_context->job_start_write_data_val = 0x1;
+	ring_context->num_fences = 32;
+	ring_context->fence_info = alloca(sizeof(struct drm_amdgpu_userq_fence_info) * 32);
+	for (unsigned i = 0; i < 32; i++) {
+		ring_context->fence_info[i].va = ring_context->bo_mc3 + 8 + (i * 8);
+		ring_context->fence_info[i].value = i + 1;
+	}
+
+	cmd_base->emit(cmd_base, PACKET3(PACKET3_WRITE_DATA, 3));
+	cmd_base->emit(cmd_base, WRITE_DATA_DST_SEL(5) | WR_CONFIRM |
+		       WRITE_DATA_CACHE_POLICY(3));
+	cmd_base->emit(cmd_base, 0xfffffffc & ring_context->bo_mc);
+	cmd_base->emit(cmd_base, (0xffffffff00000000 & ring_context->bo_mc) >> 32);
+	cmd_base->emit(cmd_base, 0xdeadbeef);
+
+	/* satisfy fence wait multi packet fences in separate thread for checking if fences
+	 * gets satisifed incorrectly.
+	 */
+	pthread_create(&fwm_test_thread, NULL, amdgpu_fwm_test_thread, ring_context);
+
+	ring_context->pm4_dw = cmd_base->cdw;
+	ip_block->funcs->userq_submit(device_handle, ring_context, ip_block->type,
+				      ring_context->bo_mc2);
+
+	pthread_join(fwm_test_thread, (void **)&thread_ret);
+	igt_assert_eq(*thread_ret, 0);
+	igt_assert_eq_u32(*ring_context->bo_cpu, 0xdeadbeef);
+
+	free(thread_ret);
+	ip_block->funcs->userq_destroy(device_handle, ring_context, ip_block->type);
+	amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle,
+				 ring_context->bo_mc, ring_context->write_length);
+	amdgpu_bo_unmap_and_free(ring_context->bo2, ring_context->va_handle2,
+				 ring_context->bo_mc2, 8192);
+	amdgpu_bo_unmap_and_free(ring_context->bo3, ring_context->va_handle3,
+				 ring_context->bo_mc3, 4096);
+	free_cmd_base(cmd_base);
+	free(ring_context);
+}
+
 int igt_main()
 {
 	amdgpu_device_handle device;
@@ -811,6 +979,22 @@ int igt_main()
 		}
 	}
 
+	igt_describe("Check-GFX-CS-FENCE_WAIT_MULTI-packet");
+	igt_subtest_with_dynamic("cs-gfx-fwm-UMQ") {
+		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
+			igt_dynamic_f("cs-gfx-fwm-umq")
+				amdgpu_fwm_test(device, AMDGPU_HW_IP_GFX);
+		}
+	}
+
+	igt_describe("Check-COMPUTE-CS-FENCE_WAIT_MULTI-packet");
+	igt_subtest_with_dynamic("cs-compute-fwm-UMQ") {
+		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f("cs-compute-fwm-umq")
+				amdgpu_fwm_test(device, AMDGPU_HW_IP_COMPUTE);
+		}
+	}
+
 	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
-- 
2.43.0

