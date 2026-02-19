Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672CFE9A055
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 17:12:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C1510E71F;
	Thu, 19 Feb 2026 17:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1RcwjMbc";
	dkim-atps=neutral
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012015.outbound.protection.outlook.com [52.101.53.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F56910E71E
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 17:12:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwVEFaY7Q11RuF984eM5kDSN7U5eNMNLSwYEAIbSuHtBfSsZTzRKmkQLlGPnsmKpw912bWeCxxP+TLz1aBsmHqN/ho97Dpek06LNDhkpHZsHQ8o6Mb9eOz9wg8w9Fvrwg9ky7VrBy3Qaz8xaUQyoEUSIjbMYFo28XTCE0mK/6/+ExmQyKLadCXJyeOu/PUa9lqXE3jiyUjxt2K4Dy5Vq30cY9pRPkHHvd7Sihv4rS8x4LLl6/t/WfgZwWP3bNO5a1zhjkrsMyCc7ZRvgyOH+JNY3eW+7aG3A38lEpPwfs4b2I1RdzuHp93Ew0jeCrsAnsf3aooWMdPwTxrb8QG3B7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQe1VVfo+AJIdmrKN7aiRuZE7uWD6ofwtbDrCsnLsoE=;
 b=uQd5NkC/Y+qEnXsEW5r9IeB1gLtp1Vpw5R7v9TGx2l7bxc8HR4C5mMgwKCryns6MNBuayFlsLhddkE8Z0BfrnjRxDccYAv0UX+1OmJ+N4ke+97+rP6qDZ0mPn3E9M3BzTHCQE47rv9aY+oTM1h9T2O8omXxwBpB1uP8fOEkONIyV2iCbz+p4P8OZZLiXT3HQ4DrkPVkcYI3RYOeXSWEqjB5oG74e0yWhjySztpVx36SzSzD3VjKOd1nBRaNbpMDID8nqZQLqcmO0rsljzRRVkqyssdRkxOtIGF3ihBV7TeBfD/xPi6/NNjw127Ti4dyJFab21fOfQXkF+hQ/nDguOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQe1VVfo+AJIdmrKN7aiRuZE7uWD6ofwtbDrCsnLsoE=;
 b=1RcwjMbcr0HHatG+h/3fWa5zX64N+VWNKLK+oa3Pqsvxn4IK0Xo7sxfo02RevODauAmdZupq16P/uXX+Eq3x+kpK9MTwez6tUtO6QqeH4ebTtatJUgYxaBss4rT/hRkYGaGuU719aOkzmgaUSZnIWv4JH2XwMOMpOl5Te129AZ0=
Received: from BN9PR03CA0758.namprd03.prod.outlook.com (2603:10b6:408:13a::13)
 by CYXPR12MB9277.namprd12.prod.outlook.com (2603:10b6:930:d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 17:12:29 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:13a:cafe::5f) by BN9PR03CA0758.outlook.office365.com
 (2603:10b6:408:13a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Thu,
 19 Feb 2026 17:12:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 17:12:28 +0000
Received: from amd-X570.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 19 Feb
 2026 11:12:26 -0600
From: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <vitaly.prosyak@amd.com>, Yogesh Mohan Marimuthu
 <yogesh.mohanmarimuthu@amd.com>
Subject: [PATCH i-g-t v3 2/2] tests/amdgpu: add fence wait multi packet test
Date: Thu, 19 Feb 2026 22:42:09 +0530
Message-ID: <20260219171209.2296-2-yogesh.mohanmarimuthu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219171209.2296-1-yogesh.mohanmarimuthu@amd.com>
References: <20260219171209.2296-1-yogesh.mohanmarimuthu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|CYXPR12MB9277:EE_
X-MS-Office365-Filtering-Correlation-Id: 64b38bae-7f8f-4a5f-8ce8-08de6fda0f7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4IRZccVww8JHe0SpS5guOOYMonGYO2utFX3PzJBCM/BZyquzGCux4YHfy/a0?=
 =?us-ascii?Q?z0QFSjDxz69ZP4sChoSv0VQPGnCja8iwTx4hxRBJjIo8f50KXJVAaJ6ztZv3?=
 =?us-ascii?Q?GC2zU9VeEN/lDU9XBC9qAYz1m4kW9/IUGnX29Rw2JZ5/OznRMZzHhBiWmUPV?=
 =?us-ascii?Q?JnHPBgMAqZHWVMwIsypAlYw9lH1aeX0dJhmsbYVbAFlDKn6vjorTizHqyQf1?=
 =?us-ascii?Q?/dbs7Fanv8SMNjWawEmlNpk1rAJ1hLKcfmNiD8EUculjIpOKiIDKJNr4yrkr?=
 =?us-ascii?Q?FpkaWjOB7LuFEv2VQvV+K5jEpdMllLwrcQ7Nmd87G360v1xpIjtk1FdIWcV9?=
 =?us-ascii?Q?NV91ppQxplMKoHjrgt0uDEYWzEyH1tWGbYyyYMTK0w8PFmWOGpLaMlVOHtri?=
 =?us-ascii?Q?PCb+EU+yN6+QsYMmKHyR3eDVQE9FxE2kM3wgnEGeTVum67xy8SrMoAxJ1arl?=
 =?us-ascii?Q?fVOZCs5tFuZZtX7tWHHipwI/118Urr/wXs92OEs6kWwN1z7jsMwHobwQchQR?=
 =?us-ascii?Q?Nmr1dnToHnsfVC7wYsyt+0oBUgDz6Seel29U9aHv5zxnNeix4RbbXvemPR6R?=
 =?us-ascii?Q?uWFteMZ6ecA5tZz/D6lz0U2Ckz0XIWkGA0FvoOfYIA7fttfZWcPXwyAP/uJn?=
 =?us-ascii?Q?CTnb95DC3Vzk39DZA+DlNLXTIpugKiLlQ8Oy02WwqCB9Ut5xHpc30DeM7Y3V?=
 =?us-ascii?Q?N4LWHJrIlPbBAplra8gdFTdb/Sv5yCtNkvI/QstMykTPVPgiNp4No4EVd0tL?=
 =?us-ascii?Q?SQSVybwPYik0PAUowE/SAmv63tfG9VhfVXEX41L0JLjkIPUVrDc//JFRbhqY?=
 =?us-ascii?Q?MNzELKVeIgtSTY8Pu4DHy/dnV7mb7/8JxzIInhwfyuL3WAUBpujkKplP+qeV?=
 =?us-ascii?Q?ZYl6Q/YON62JvfaG5/zOJUitAqraR/mOvF3atWpmoqyxshCdUvmVwwEFc5zn?=
 =?us-ascii?Q?lpWxIPreb4NA+fLdGh39DWOF0slW0JaCi1UGUMEe8ka5rHIJFn7bJsH7aikf?=
 =?us-ascii?Q?R08Iw0lcBfu2HoafRbSJkRiUv1+CM6g3vWJvGwBulnR5XrYgq+WI1y2bj7ZJ?=
 =?us-ascii?Q?FwX8GNc0rlRtTL3AQ1RZJbqxccFbZvmRD7I96Kh+Z2NR4N7ncjPaLKAILehX?=
 =?us-ascii?Q?X5Vi50kw4pMs/qIw6cIcM7SN/JvGhSJDy59UPLtnIyAzd6f8cwItTSd/siXP?=
 =?us-ascii?Q?1suBVAZ+3THW9TiWzqOk28/xHAdr6dfLTF6TNH+TpXjwLgn3Ii1hWwYMmyT6?=
 =?us-ascii?Q?2LFuuqMspJz5dwGwCqnE7oJ2E6IRTI8BCXZneTECwuxkVZ9qlOdapmBk54Vn?=
 =?us-ascii?Q?wg7oCRdNovCKJgHgi02hP/Q5v0J0vxLDTwFWKO9tz0WprZ1sFfx1fbzXGlTG?=
 =?us-ascii?Q?38yMb8npnon8PDjNvVxZ+BGIs+0LSCoVdpwxp6XYvrOqH76dRY1j0mb8Xoqe?=
 =?us-ascii?Q?59+uP2Ya/gYcVC9anV5dXUmh7/kUk6FdtoatDFo+a/UqrtWvgEf06bJS1I+o?=
 =?us-ascii?Q?Grqu4fGXgoA3DotmQJnseCcvrL94oGgPktmQFH2impvJOUDVpNPQ9vTv3mDb?=
 =?us-ascii?Q?ah694pMw30pnO6m8jeGJrJlcqbLhHOq/OdbvydxA+0L5ygUSSQHEgM90aAl+?=
 =?us-ascii?Q?0rfDLMXpyAiZIAosWVD3zxmTQyVcXBub9edhNC+f+Klrg5eYsDYYTXrlVed4?=
 =?us-ascii?Q?nDWNXQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ln12ZhYO/KEwDV5jjd5+8xb9OB6o23yCjOI5HjGihBZrqi++BO6ACcdjqEAHdMTHY76+izBNUyYtaqZTQlxoS/o1Wh+JVdFVOBTC3t/Ar0DO0S03g++0rnGq1Vz1R2sPmBOBBScWdhAO8lKq/6nfb2ex1fZsGFIO9pYo+x7WbyUMTLvqEwPRHZBfxd88XmZInUWNJ+jGtT0BE0P8zohU+ca/OOaGBW5/Q7E21vho7BJfJsyDDaec6q5iC6QwhlFgpXKT0+SwOobwyJmo9J0KzPelnPHCqVLZO38wBYYLKvZXm+fMhAq6ivXI6kDxrkSZLz+7Mwbu0QzWFv28iQK7OvINbIRQc/rezBdGVlE/um4U/CaT7hzJKPJMGMyFKNLO6hU7gD7unGevuiCKniBAjaZb59GhIBH1+Lg75qTRdPD6VxixA/7RjIFLnpI28/4R
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 17:12:28.5953 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b38bae-7f8f-4a5f-8ce8-08de6fda0f7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9277
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

The test submits a job with FENCE_WAIT_MULTI packet that has 32 fences.
The test passes if the WRITE_DATA packet after FENCE_WAIT_MULTI packet
is executed and desired value is observed in result buffer.

To check if FENCE_WAIT_MULTI packet is passing without checking any fence,
a negative testing is done. This is done by having the 32 fences in
FENCE_WAIT_MULTI packet not satisifed during initialization. Then check
in a separate thread if desire value is observed in result buffer even if
fences are not satisifed.

v2: Declare all variables in begining of function (Vitaly)
    use upper_32_bits lower_32_bits (Vitaly)
v3: keep struct amdgpu_ring_context small.  (Vitaly)

Signed-off-by: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
---
 tests/amdgpu/amd_basic.c | 196 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 196 insertions(+)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index e57eb7969..d78a4f2c9 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -5,6 +5,7 @@
  * Copyright 2023 Advanced Micro Devices, Inc.
  */
 
+#include <pthread.h>
 #include "lib/amdgpu/amd_memory.h"
 #include "lib/amdgpu/amd_sdma.h"
 #include "lib/amdgpu/amd_PM4.h"
@@ -13,6 +14,8 @@
 #include "lib/amdgpu/amd_gfx.h"
 #include "lib/amdgpu/shaders/amd_shaders.h"
 #include "lib/amdgpu/compute_utils/amd_dispatch.h"
+#include "lib/amdgpu/amdgpu_asic_addr.h"
+#include "ioctl_wrappers.h"
 
 #define BUFFER_SIZE (8 * 1024)
 
@@ -662,6 +665,183 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle, bool user_queue)
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
+				     (now.tv_nsec - start.tv_nsec);
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
+/**
+ * FWM PACKET TEST
+ * @param device_handle
+ * @param ip_type
+ */
+static void amdgpu_fwm_test(amdgpu_device_handle device_handle, unsigned ip_type)
+{
+	struct amdgpu_ring_context *ring_context;
+	struct amdgpu_cmd_base *cmd_base = get_cmd_base();
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device_handle, ip_type);
+	int r;
+	unsigned int i;
+	struct amdgpu_userq_params *userq_params;
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
+	userq_params = (struct amdgpu_userq_params*)alloca(sizeof(struct amdgpu_userq_params) +
+							   sizeof(struct drm_amdgpu_userq_fence_info) * 32);
+	userq_params->fence_info = (struct drm_amdgpu_userq_fence_info*)(userq_params + 1);
+
+	ring_context->userq_params = userq_params;
+	userq_params->job_start_write_data_va_addr = ring_context->bo_mc3;
+	userq_params->job_start_write_data_val = 0x1;
+	userq_params->num_fences = 32;
+	for (i = 0; i < 32; i++) {
+		userq_params->fence_info[i].va = ring_context->bo_mc3 + 8 + (i * 8);
+		userq_params->fence_info[i].value = i + 1;
+	}
+
+	cmd_base->emit(cmd_base, PACKET3(PACKET3_WRITE_DATA, 3));
+	cmd_base->emit(cmd_base, WRITE_DATA_DST_SEL(5) | WR_CONFIRM |
+		       WRITE_DATA_CACHE_POLICY(3));
+	cmd_base->emit(cmd_base, lower_32_bits(ring_context->bo_mc));
+	cmd_base->emit(cmd_base, upper_32_bits(ring_context->bo_mc));
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
@@ -811,6 +991,22 @@ int igt_main()
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

