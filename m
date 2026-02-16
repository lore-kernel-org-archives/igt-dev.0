Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B54E63F3F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Feb 2026 09:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBE510E10B;
	Mon, 16 Feb 2026 09:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IxBtObFz";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011068.outbound.protection.outlook.com [40.107.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F7810E10B
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Feb 2026 09:45:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9AMI23TnChfXLqek7lh6QVr4DHbuNNd19jK5aY9n+tocXKBmr59PypQ+LhkBqjYJALo0jvdD7wKHUaz/b+qbPSh7OXWoxJgEiZ80azuKQGvbsOzsjp79bTFNDZ55dBXfHYFlFNl9D8e354zofM2sNu1p8U5HfALTW2sRRepLEzqT0AHIE9zYOgAT0Z/EMHUxVnmrjfnuaEz1jZC8mDRMHZDkjXofiXAgmuiuvRvVD49SwiHPTecJNpUbx8UL/ooaPsAFzpF3wLsoqwVNNtXz9ye7qeXHwvz/k7jDXCqJrzrvfgIovrZz9VWZHRwE53JCCjQphIaj+p6HGKEFl4AoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXygS5fbwH2QRF8Ec8pGa6p3o+q0nfvIqJuHMuClM5Q=;
 b=oXbBvOmI46WPu/9txDLZ2yCu6xi/Ip9Ft3jv1aXAYXhig848tfaDX/T3YETPea1qQB3XQ5UHpA+OB1LdxlKNrCeL59MyBwY5U72bSeR6+X0utJLXkQcb56M55QsqMZucB5JRw9zwXeANknES+IOvMyYwdh5u0nSLObFqZfVFjJP6VX1g13q7RSw1le2k//HWgk1Ux5QtcvztapkOKJOxHvnPetTJXEjPqDnWyeCiImVDj2WEHSozx3zEQnZTusdhVLn3TBGjye18fBiWx36bP7XHg7QZjRyJi/Xwqa2HdnoB8jr8QBeOGXWgoBIynWAdmuujD281Zm5hCFaxiXKStQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXygS5fbwH2QRF8Ec8pGa6p3o+q0nfvIqJuHMuClM5Q=;
 b=IxBtObFzOxX6NJfdGuUEnyNL38fo5ZPkBSLZ2Lgdx9H/Tm8beHsfVLwTCaN38/GvaCT3OIQ9qwMgTShfyhug4Dwrc2JqgJ8R8NrJ5xG64XjIPV93oFgl7NuE3PUSS+ylJICD6EeVMMnrxAL+bow2/RuEKvbsKI59zQje/Rmg5zo=
Received: from BL1PR13CA0310.namprd13.prod.outlook.com (2603:10b6:208:2c1::15)
 by IA1PR12MB7591.namprd12.prod.outlook.com (2603:10b6:208:429::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 09:45:25 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:2c1:cafe::d4) by BL1PR13CA0310.outlook.office365.com
 (2603:10b6:208:2c1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Mon,
 16 Feb 2026 09:45:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 16 Feb 2026 09:45:25 +0000
Received: from amd-X570.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Feb
 2026 03:45:23 -0600
From: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <vitaly.prosyak@amd.com>, Yogesh Mohan Marimuthu
 <yogesh.mohanmarimuthu@amd.com>
Subject: [PATCH i-g-t v2 2/2] tests/amdgpu: add fence wait multi packet test
Date: Mon, 16 Feb 2026 15:15:06 +0530
Message-ID: <20260216094506.36506-2-yogesh.mohanmarimuthu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216094506.36506-1-yogesh.mohanmarimuthu@amd.com>
References: <20260216094506.36506-1-yogesh.mohanmarimuthu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|IA1PR12MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c96b51-ee47-4e6b-fe90-08de6d401c5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CoCwBsU43O6G4tdD35mieHc1mtH8S289vYXEgG/y+ZJVhNJ3/5LMPmzEaL0D?=
 =?us-ascii?Q?5Ql1U2OAsrf2Z7y/4S2oD92E8jdPLBuQYIPFOmvxIMrXmDK8N18L3GMHZt3d?=
 =?us-ascii?Q?LMcxaYj7BRAV+bA6Ek1+SyPnKNWnEgBKHaqWhCQmTuRhtx5LUr2fxmnRbwHl?=
 =?us-ascii?Q?HNF1EKQ09Q77MU21RDWv1U0P/5ciU/RlwTarHkNc2+AVJRzMjU53wtBHjkDV?=
 =?us-ascii?Q?LQzfmITUD+uNMRf5V6VFCYH5rKItvziwluqbniBSxqSaNh7auF4lDfpf/uUC?=
 =?us-ascii?Q?X/OjRVFpIRkrlAIgCT0UUvL5l+VM6roeoee/0NQW78QhZp23rGBJFVrU4M75?=
 =?us-ascii?Q?Fbm9FdHGEAH/oRgfvNJgi0y03LoivsdcRhhi3fwTJcHMr+a+NyVQvw13V+oL?=
 =?us-ascii?Q?PFoGzX5FoFh08+YJx90iXiGK4EaXIG2YfS2aqW8OHEEdC3r9+LOrMqxdb4sW?=
 =?us-ascii?Q?vlY8z1Zgw4AjEzISB34ZFFthL0UD8sopfqL0nv4bee3WiXJ3/nRGo86ljIju?=
 =?us-ascii?Q?swyLnXF9D5xwsLdnEN478klkRFRyoaOemiVbmRb1mZyyHdftfbWohoxZNVI8?=
 =?us-ascii?Q?pmCcT3phWp16GFCYEClhlT9v8l9rWuD1JjCuXDT+Jq884Zeaxu2qcYyfWgHD?=
 =?us-ascii?Q?t1829pnL75moD0brlCXJB/W66KIwC96llMCrKFGsACd6kdpau2yuJUflwZ9i?=
 =?us-ascii?Q?p0RMXGJ9VpZ692P50iN7W+Xjl6VSMziK1ztsZOZi5wwvKOd91YkDloACMSd0?=
 =?us-ascii?Q?+ZGrXrgJMxUH+bHKFrgfLyeZ5p3mb5JeoIun59ZPkRAALmfOANp/99RXIOQi?=
 =?us-ascii?Q?QeizW4RnV4N1j/JFHX8JSZWADMqK1O1hpw8DzFgAwh2yKjLsVGl/dPWiZHJG?=
 =?us-ascii?Q?KK3ZamFKVMKkIp8waoio09WTdOsKiq4iiuLhNOX3b5wW00F+rGxAE3u9+gTc?=
 =?us-ascii?Q?pR5vf8qqXybh/6T4Jrlu1Yo9w35EmTDDUY1IIvbbuWJNMKBEGcpyOXvCxYPt?=
 =?us-ascii?Q?DivpB3NM4VqsWseArozLN3+8CLVhO9soZQgj8x7xQkKLOlXEMdpQEtu30Kls?=
 =?us-ascii?Q?ULHGhVvjsfzTjB8ObI2ywPkhY8U3dTdigTB3MbEeKz8cTO92Y/Jben0dHQzO?=
 =?us-ascii?Q?msp2qfvl+E/J8YbOa88ZRkCkesLlGJrkLVAQ3JIBPQKoSnejxrwfC/I76aJK?=
 =?us-ascii?Q?hu+KnDHOy6h8/MneBXVQ53chNfluLz9451C4XKw4ihwJmqv4IEmVq+29AnZS?=
 =?us-ascii?Q?/xzhiqEwGGYPcQyTwL4N/78rWm6d5vptr56X8DxSBF2S+TKNGDhSCEZvW0pt?=
 =?us-ascii?Q?xbAtrvEpzLRa3MlAS7SdB1Q1S+X/Ky3Oa6EBlI65GcPgvwKUM8FOSX7F81B8?=
 =?us-ascii?Q?AHb7cfQWZbIAlek2KVVvhuPGmCq9ZQ5xJG9kQgIETfzHBL6TYlaFVoqH9BGL?=
 =?us-ascii?Q?ASTmL2ep0wlPbVda2v+mm8qcZIiwYSk5mhY0J0wExz7+CmekAY0g2lTk51Uy?=
 =?us-ascii?Q?R7BoqFRiqQTD1GF/yPg9cQyw5HevQW/xR24R8bSwsJbcvfE1rF0v9n9FVxd6?=
 =?us-ascii?Q?ch1nwM63hhKExW1c9281fCUiRCiuzJzH0UzvqeqEf9TsXP5uGTsf+qqBXOw0?=
 =?us-ascii?Q?JsxUtfe0hbOVrs23X/sQIA/1cNvmML9DXAZLu35TJffJN8UjngPP27+MHpWe?=
 =?us-ascii?Q?ZmyReQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1mor/8G3PjHoWPCDFK1orY1xuvL7NWnKZUpD1mo1KxU5NklPStb5bBHRw4fWF5hYqt8BbAEngEwFBWw4GcyMvCE41clETaStJLA7BqjMmdeRTMCAF1ZWsAgy05A1YlBedkQkEuMu6w0hmM82Q7ohgVRIXe2Pgw9EEDp1N1TPK3r7SdIBRb5WyqKj8Zz8Y6apJKOduqk0HFPIR2iG+wmCL7RCqEi2bniRMvl+6YEL2l7gRJC8IWnTkzDvkKVw+zrQ9HkWHBUFdHC033we8fCAtQWC6WZECz5/uHepLCH3R48/imgAdUPBPVfuSxuNIevNHy4s7VGEpSL9qz+9gTofh4FI60meP0b+vIqlhj2VMtPYWZxjH6949XKJCKXBdZNU2U3MxhIaAV/ldKlJPUJ17xiarQp9Kay2oV1w6vK7HKShqtZs9uri32cDGpPHk6+R
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 09:45:25.4133 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c96b51-ee47-4e6b-fe90-08de6d401c5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7591
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

Signed-off-by: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
---
 tests/amdgpu/amd_basic.c | 191 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 191 insertions(+)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index e57eb7969..e4ef72a06 100644
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
 
@@ -662,6 +665,178 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle, bool user_queue)
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
+	for (i = 0; i < 32; i++) {
+		ring_context->fence_info[i].va = ring_context->bo_mc3 + 8 + (i * 8);
+		ring_context->fence_info[i].value = i + 1;
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
@@ -811,6 +986,22 @@ int igt_main()
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

