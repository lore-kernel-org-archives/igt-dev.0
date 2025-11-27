Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49871D116E3
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 01:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A4710E6FF;
	Thu, 27 Nov 2025 01:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aGrQyynq";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012026.outbound.protection.outlook.com [40.107.209.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3282410E6FF
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 01:12:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zR1zOwipbrKRNdaIR+cbNqAZ3zN6c6tXhDMSBJaxSAmYtb2SvH7kd1UNkAdhND6mIuHY7QjIOwbdKY2uVcpmRqbDVQKNroX8NzC4MWYMndYG972asiDnVn2ejlY/yQJoFRHVI/wa6gy+YWKz9CwTyt8FV5BMSIAHTX/UY4EsppkfOmjCR50IPRC2Ul39Y6oqfln4FauPlslL/W13L6ajZZO2Ec2O3C40+8aa9DKOyBHFfQLDzA10voWD72S/EcU6GPnDuGLArIrTBJxmyy9WieooYigXD5VnBeQxdBy/XsOdQuvRtjKPwb2TfihCjXrMvaZOEnlqSpV9yqMCCi0b1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OdZ/EgLWiAz4AjRja3feLHk71lG8AnTV1yP9LjNGQs=;
 b=kxvuram6nnpribQo6wRP3Y4kpriFr4JFlOJapVdVKHVD8K9UeDd7Hk3TXqQh1eh4jaF3xUkm0rjhwzK1suILSvWBN4Zmn6mpIpHeYpoEde4oPdmeacLjV0didduZ4hpUQPqcLhUQ6WW7wo7ZKBjw32rQWoJeCXcIMhRROLwGjHmZCqsdk5fBSXYjrazgk4US0342KgleB3Zt1mlkaQ/J2h1lJucQ/bu7FUrB39M81NBanhLR1bThXeXKXHRDzs3ZoNx+nRSnsHuAYgVwJw99SmLJ7389P2r6xxFOjHqxF+NoCxZB4mgG8bCJ/4yw3BpRdbbGoPMDXIk4U3iMGdZedw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OdZ/EgLWiAz4AjRja3feLHk71lG8AnTV1yP9LjNGQs=;
 b=aGrQyynquOOWPHNO0ZhzoJcFbuFq1MQOa0ypwdHtbw7V577Cu/EN8zQmTGJUGFITf3zlXLGOnNJVe8aZWzA1lWRGUh4fbUR5cZUJfH8bY3lNMw47JXsS4+m/R97eKhHjUwbEdPC6xcVyihfcy5Z4wvPuEpJsoYzgn39mpEKZsEc=
Received: from SJ0PR03CA0145.namprd03.prod.outlook.com (2603:10b6:a03:33c::30)
 by CH3PR12MB9027.namprd12.prod.outlook.com (2603:10b6:610:120::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Thu, 27 Nov
 2025 01:12:40 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:a03:33c:cafe::9) by SJ0PR03CA0145.outlook.office365.com
 (2603:10b6:a03:33c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Thu,
 27 Nov 2025 01:12:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Thu, 27 Nov 2025 01:12:39 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 19:12:38 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 26 Nov 2025 17:12:32 -0800
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t v2 2/6] lib/amdgpu: Add compute dispatch helper for GPU
 memory verification
Date: Thu, 27 Nov 2025 09:11:23 +0800
Message-ID: <20251127011219.3119242-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251127011219.3119242-1-Jesse.Zhang@amd.com>
References: <20251127011219.3119242-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|CH3PR12MB9027:EE_
X-MS-Office365-Filtering-Correlation-Id: a4da7d7a-31cf-45ee-5fc4-08de2d520f4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6Izaamwh0iz1rFoUN/nHDxzF8k3HxbXreWh5QyYu1lbJe93RpHPJo7sa1JRU?=
 =?us-ascii?Q?OON88Dsqj+Utj166f+OIiijNoYhrNb/siuCkGc60ij02RvsMix5980TPCP5O?=
 =?us-ascii?Q?WOO5P5cWYKoWCFrP5u34p2B45AV1/AJkavxxpyAoFwrbeq4b8y8mqpO2hhhL?=
 =?us-ascii?Q?XdKYRqSFBFOk1GUrz+hpwBBAls+F/5aS1WfVLAPTzZOPMQo/mGlVeCW9tMCb?=
 =?us-ascii?Q?g5aNVkKdMt8Ha8dnxjQdbd1Q6euKxMY8YjQiQkwWLJ2Rf3CQXSngnmocZJmR?=
 =?us-ascii?Q?mL8EdEHKhYlsrk3evyoQqWvBCRJa8FgJ0cGEOHT7wofB4xyhKWQV4HiVehT6?=
 =?us-ascii?Q?wfLC9TVCN6tEpexpPbH2a6lZuETrGAdWzmnds3FrZXwMKUOIdjKWIL9y/+A+?=
 =?us-ascii?Q?pDxrTSrkCmlecRJlB7ZqKcWx2RSIYwgQ5/8T6QYGPKbQXjzPqUg0e2ZzMnIn?=
 =?us-ascii?Q?VM/3DI1zOxw40ljGHi3N/x/FmJmmGgV1ouJgPDZUO8UDtyvbzzy4qFDqWShH?=
 =?us-ascii?Q?UbWqXkLX59UTOXOegI1afiDwYlLBB5A4nTCBVi7sBHbSmzEX20tfR2vB9ObV?=
 =?us-ascii?Q?2XgCRNBWVM+TmpcfglEa48os1W0s5DTnn4qAYVEzeMokxNFsZbSFBluYcuQX?=
 =?us-ascii?Q?C2TLLNshwPN4u5otpNCm1OAuSG4w1mUXSbw7lfabxX2MKJNmUDuywxMAf7Bl?=
 =?us-ascii?Q?XOtvQZYdWUoifbqAtyGnTiNtwQYPbmQ58R8Bmxl50jSfFiLtshjIJmEI/GWQ?=
 =?us-ascii?Q?+wke3wdH6n9ggb0VV9p1BjK6rhFsup2tXfXd52UiQOwwxZ4DL/x7RSOhW+gR?=
 =?us-ascii?Q?WcvOwhh01st9esTuXrXCEK3u8z0vdT3VbHt8/MPm413YsNxRoi92wtSCy4m+?=
 =?us-ascii?Q?xdvuOZkOlqREt0N9/ZEtlY4SVts5oFBLmlhsu2eI2tYEGDjrD8mqB9zFEGQ7?=
 =?us-ascii?Q?8rEp0A3yAMp5b9GLLLQSCEEHuOjLzh9sIinp76/XqJdOrBVbKVemqYyjE/Xk?=
 =?us-ascii?Q?K2EaSO3ndJewHSa82HmtOxzzEuJR8JQniYwFUCECpOQH6WvuAw3zT6J+XPkJ?=
 =?us-ascii?Q?OOPFO4f7o9R4tu7hdYE5gKhVyEVxcvfgMM8oSGFkub3J2TtuA4DgYE2O/fSL?=
 =?us-ascii?Q?5xOsgUUagFB5oA7JUZ+ous5F42iJMsnSccVm0753G2+ZugQ1BhxBjU5Nzd6W?=
 =?us-ascii?Q?2B6vWeNZphjvDzKh+G+VFz/LBNtTLVRroG+z75KmgOnlcfZxVcrjb6pQVOAs?=
 =?us-ascii?Q?gms9AxPjWcWg3MOrRzxdE2JeJQSC4SgaGilPpy246sRU94bT3M2C6HHZ0all?=
 =?us-ascii?Q?++ZnCg64D0GdDKdZXZzEVkJTdVHjfmH6V5TLX72lUmcqUXDsj5QKarYCXJq2?=
 =?us-ascii?Q?oSKxUYhhZ/QCDmdelF6bciJwhC1Ih7f/fqhiwzm980YN/El9FoMLeREbzJm6?=
 =?us-ascii?Q?npX3ulZ1Qot2yHevAKs3M4OJGpzjxTsepGuCBxUIBiyZ28V/4y+yD8BA2Wbk?=
 =?us-ascii?Q?CTwygXiuezYLveDJo584sjrM8JyIW+yMRJRPAIbYNJ0buk7lZuB1dHf7MMYJ?=
 =?us-ascii?Q?+2FhnYZTeRtXFcXf7Go=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 01:12:39.9093 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4da7d7a-31cf-45ee-5fc4-08de2d520f4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9027
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

Implement a reusable compute dispatch helper function that executes a pre-compiled shader to copy a DWORD from a source to destination address and verifies the result.
This function is designed for GPU-side validation of memory operations (e.g., ptrace modifications to VRAM) by ensuring the GPU can read/write the modified memory.

Key features:
1. Uses independent resources (context, command buffer, shader BO, destination BO)
   for each dispatch to avoid state pollution between tests.
2. Programs user data registers to pass source/destination addresses to the shader.
3. Dispatches a 1x1x1 workgroup to execute the shader once.
4. Waits for fence completion and verifies the destination buffer contains the
   expected value.
5. Cleans up all allocated resources even if an error occurs.

Suggested-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/{ => compute_utils}/amd_dispatch.c |   8 +-
 lib/amdgpu/{ => compute_utils}/amd_dispatch.h |   0
 .../amd_dispatch_helpers.c                    | 173 +++++++++++++++-
 .../amd_dispatch_helpers.h                    |   8 +-
 lib/amdgpu/compute_utils/amd_gca.c            | 190 ++++++++++++++++++
 lib/amdgpu/compute_utils/amd_gca.h            |  51 +++++
 .../{ => compute_utils}/amd_shared_dispatch.h |   0
 7 files changed, 422 insertions(+), 8 deletions(-)
 rename lib/amdgpu/{ => compute_utils}/amd_dispatch.c (99%)
 rename lib/amdgpu/{ => compute_utils}/amd_dispatch.h (100%)
 rename lib/amdgpu/{ => compute_utils}/amd_dispatch_helpers.c (53%)
 rename lib/amdgpu/{ => compute_utils}/amd_dispatch_helpers.h (86%)
 create mode 100644 lib/amdgpu/compute_utils/amd_gca.c
 create mode 100644 lib/amdgpu/compute_utils/amd_gca.h
 rename lib/amdgpu/{ => compute_utils}/amd_shared_dispatch.h (100%)

diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/compute_utils/amd_dispatch.c
similarity index 99%
rename from lib/amdgpu/amd_dispatch.c
rename to lib/amdgpu/compute_utils/amd_dispatch.c
index b1710a9ca..ded62bbd1 100644
--- a/lib/amdgpu/amd_dispatch.c
+++ b/lib/amdgpu/compute_utils/amd_dispatch.c
@@ -4,13 +4,13 @@
 // Copyright 2023 Advanced Micro Devices, Inc.
 
 #include <amdgpu.h>
-#include "amd_memory.h"
+#include "amdgpu/amd_memory.h"
 #include "amd_dispatch.h"
 #include "amd_shared_dispatch.h"
 #include "amd_dispatch_helpers.h"
-#include "amd_PM4.h"
-#include "amd_ip_blocks.h"
-#include "amd_shaders.h"
+#include "amdgpu/amd_PM4.h"
+#include "amdgpu/amd_ip_blocks.h"
+#include "amdgpu/shaders/amd_shaders.h"
 
 static void
 amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
diff --git a/lib/amdgpu/amd_dispatch.h b/lib/amdgpu/compute_utils/amd_dispatch.h
similarity index 100%
rename from lib/amdgpu/amd_dispatch.h
rename to lib/amdgpu/compute_utils/amd_dispatch.h
diff --git a/lib/amdgpu/amd_dispatch_helpers.c b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
similarity index 53%
rename from lib/amdgpu/amd_dispatch_helpers.c
rename to lib/amdgpu/compute_utils/amd_dispatch_helpers.c
index 9c9d04e30..1081eedb0 100644
--- a/lib/amdgpu/amd_dispatch_helpers.c
+++ b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
@@ -5,10 +5,11 @@
  * Copyright 2014 Advanced Micro Devices, Inc.
  */
 
-#include "amd_dispatch_helpers.h"
+#include "amdgpu/compute_utils/amd_dispatch_helpers.h"
+#include "amdgpu/amd_memory.h"
 #include <amdgpu_drm.h>
-#include "amd_PM4.h"
-#include "amd_ip_blocks.h"
+#include "amdgpu/amd_PM4.h"
+#include "amdgpu/amd_ip_blocks.h"
 #include "igt.h"
 
 int
@@ -182,3 +183,169 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base, uint64_t shader_addr,
 	}
 	return base->cdw - offset_prev;
 }
+
+/**
+ * execute_compute_dispatch - Execute a single compute dispatch for memory copy
+ * @device: AMDGPU device handle
+ * @version: GPU version for register programming
+ * @shader_mc_addr: Shader buffer GPU address
+ * @src_mc_addr: Source memory GPU address to read from
+ * @dst_mc_addr: Destination buffer GPU address to write to
+ * @expected_value: Expected 32-bit value for verification
+ *
+ * This function sets up and executes a compute dispatch that copies a single DWORD
+ * from source to destination using a pre-compiled shader. Each dispatch uses
+ * completely independent resources to avoid state pollution.
+ *
+ * Returns: 0 on success, -1 on failure
+ */
+int execute_compute_dispatch(amdgpu_device_handle device,
+				   uint32_t version,
+				   uint64_t shader_mc_addr,
+				   uint64_t src_mc_addr,
+				   uint64_t dst_mc_addr,
+				   uint32_t expected_value)
+{
+    amdgpu_context_handle context_handle;
+    amdgpu_bo_handle bo_cmd = NULL, bo_shader = NULL, bo_dst = NULL;
+    uint32_t *ptr_cmd = NULL;
+    void *ptr_shader = NULL;
+    volatile uint32_t *ptr_dst = NULL;
+    uint64_t mc_cmd = 0, mc_shader = 0, mc_dst = 0;
+    amdgpu_va_handle va_cmd = 0, va_shader = 0, va_dst = 0;
+    struct amdgpu_cs_request ib_req = {0};
+    struct amdgpu_cs_ib_info ib_info = {0};
+    amdgpu_bo_list_handle bo_list = NULL;
+    struct amdgpu_cs_fence fence = {0};
+    uint32_t expired = 0;
+    struct amdgpu_cmd_base *base_cmd = get_cmd_base();
+    amdgpu_bo_handle bos[3];
+    int ret = 0;
+
+    /* Create fresh context for each dispatch to avoid state pollution */
+    if (amdgpu_cs_ctx_create(device, &context_handle) != 0) {
+	igt_info("Failed to create context\n");
+	return -1;
+    }
+
+    /* Command buffer for PM4 packets */
+    if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
+		AMDGPU_GEM_DOMAIN_GTT, 0,
+		&bo_cmd, (void **)&ptr_cmd, &mc_cmd, &va_cmd) != 0) {
+	igt_info("Failed to allocate command buffer\n");
+	ret = -1;
+	goto cleanup_context;
+    }
+    memset(ptr_cmd, 0, 4096);
+    base_cmd->attach_buf(base_cmd, ptr_cmd, 4096);
+
+    /* Shader buffer containing compiled ISA */
+    if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
+		AMDGPU_GEM_DOMAIN_VRAM, 0,
+		&bo_shader, &ptr_shader, &mc_shader, &va_shader) != 0) {
+	igt_info("Failed to allocate shader buffer\n");
+	ret = -1;
+	goto cleanup_cmd;
+    }
+    memset(ptr_shader, 0, 4096);
+    /* Note: shader content should be copied by caller */
+
+    /* Destination buffer for shader output (CPU-visible) */
+    if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
+		AMDGPU_GEM_DOMAIN_GTT, 0,
+		&bo_dst, (void **)&ptr_dst, &mc_dst, &va_dst) != 0) {
+	igt_info("Failed to allocate destination buffer\n");
+	ret = -1;
+	goto cleanup_shader;
+    }
+    *ptr_dst = 0; /* Initialize for verification */
+
+    /* Initialize compute dispatch state */
+    amdgpu_dispatch_init(AMDGPU_HW_IP_COMPUTE, base_cmd, version);
+    amdgpu_dispatch_write_cumask(base_cmd, version);
+    amdgpu_dispatch_write2hw(base_cmd, shader_mc_addr, version, 0);
+
+    /* Program user data registers:
+     * s[0:1] = source address (64-bit)
+     * s[2:3] = destination address (64-bit)
+     */
+    base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
+    base_cmd->emit(base_cmd, 0x240); /* SH0 register offset */
+    base_cmd->emit(base_cmd, src_mc_addr & 0xFFFFFFFF);
+    base_cmd->emit(base_cmd, src_mc_addr >> 32);
+    base_cmd->emit(base_cmd, mc_dst & 0xFFFFFFFF);
+    base_cmd->emit(base_cmd, mc_dst >> 32);
+
+    /* Dispatch compute shader with 1x1x1 workgroup */
+    base_cmd->emit(base_cmd, PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT, 3));
+    base_cmd->emit(base_cmd, 0x10); /* Dispatch initiator */
+    base_cmd->emit(base_cmd, 1);    /* dim_x */
+    base_cmd->emit(base_cmd, 1);    /* dim_y */
+    base_cmd->emit(base_cmd, 1);    /* dim_z */
+    base_cmd->emit_aligned(base_cmd, 7, GFX_COMPUTE_NOP);
+
+    /* Submit command buffer */
+    bos[0] = bo_cmd;
+    bos[1] = bo_shader;
+    bos[2] = bo_dst;
+    if (amdgpu_bo_list_create(device, 3, bos, NULL, &bo_list) != 0) {
+	igt_info("Failed to create BO list\n");
+	ret = -1;
+	goto cleanup_dst;
+    }
+
+    ib_info.ib_mc_address = mc_cmd;
+    ib_info.size = base_cmd->cdw;
+    ib_req.ip_type = AMDGPU_HW_IP_COMPUTE;
+    ib_req.ring = 0;
+    ib_req.resources = bo_list;
+    ib_req.number_of_ibs = 1;
+    ib_req.ibs = &ib_info;
+    ib_req.fence_info.handle = NULL;
+
+    if (amdgpu_cs_submit(context_handle, 0, &ib_req, 1) != 0) {
+	igt_info("Failed to submit CS\n");
+	ret = -1;
+	goto cleanup_bo_list;
+    }
+
+    /* Wait for completion */
+    fence.context = context_handle;
+    fence.ip_type = AMDGPU_HW_IP_COMPUTE;
+    fence.ip_instance = 0;
+    fence.ring = 0;
+    fence.fence = ib_req.seq_no;
+
+    if (amdgpu_cs_query_fence_status(&fence, AMDGPU_TIMEOUT_INFINITE, 0, &expired) != 0) {
+	igt_info("Fence wait failed\n");
+	ret = -1;
+	goto cleanup_bo_list;
+    }
+
+    if (!expired) {
+	igt_info("Fence not expired\n");
+	ret = -1;
+	goto cleanup_bo_list;
+    }
+
+    /* Verify result */
+    if (*ptr_dst != expected_value) {
+	igt_info("Result mismatch: got 0x%x, expected 0x%x\n", *ptr_dst, expected_value);
+	ret = -1;
+    } else {
+	igt_info("Dispatch successful: got expected value 0x%x\n", *ptr_dst);
+    }
+
+cleanup_bo_list:
+    amdgpu_bo_list_destroy(bo_list);
+cleanup_dst:
+    amdgpu_bo_unmap_and_free(bo_dst, va_dst, mc_dst, 4096);
+cleanup_shader:
+    amdgpu_bo_unmap_and_free(bo_shader, va_shader, mc_shader, 4096);
+cleanup_cmd:
+    amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_cmd, 4096);
+cleanup_context:
+    amdgpu_cs_ctx_free(context_handle);
+
+    return ret;
+}
diff --git a/lib/amdgpu/amd_dispatch_helpers.h b/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
similarity index 86%
rename from lib/amdgpu/amd_dispatch_helpers.h
rename to lib/amdgpu/compute_utils/amd_dispatch_helpers.h
index 55398377e..c0113519b 100644
--- a/lib/amdgpu/amd_dispatch_helpers.h
+++ b/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
@@ -25,7 +25,7 @@
 #define AMD_DISPATCH_HELPERS_H
 
 #include <amdgpu.h>
-#include "amd_ip_blocks.h"
+#include "lib/amdgpu/amd_ip_blocks.h"
 
 struct amdgpu_cmd_base;
 
@@ -35,4 +35,10 @@ int amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base *base_cmd, uint32_t vers
 
 int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base_cmd, uint64_t shader_addr, uint32_t version, enum cmd_error_type err);
 
+int execute_compute_dispatch(amdgpu_device_handle device,
+				   uint32_t version,
+				   uint64_t shader_mc_addr,
+				   uint64_t src_mc_addr,
+				   uint64_t dst_mc_addr,
+				   uint32_t expected_value);
 #endif
diff --git a/lib/amdgpu/compute_utils/amd_gca.c b/lib/amdgpu/compute_utils/amd_gca.c
new file mode 100644
index 000000000..7a952407a
--- /dev/null
+++ b/lib/amdgpu/compute_utils/amd_gca.c
@@ -0,0 +1,190 @@
+#include "amdgpu/amd_memory.h"
+#include "amdgpu/amd_PM4.h"
+#include "amdgpu/amd_ip_blocks.h"
+#include "amd_gca.h"
+#include <amdgpu.h>
+#include <amdgpu_drm.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <sys/mman.h>
+#include <inttypes.h>
+
+int read_gca_config_debugfs(int dri_index, uint32_t *config, size_t size)
+{
+	int fd;
+	char path[128];
+	ssize_t bytes_read;
+
+	snprintf(path, sizeof(path), GCA_CONFIG_DEBUGFS_PATH, dri_index);
+
+	fd = open(path, O_RDONLY);
+	if (fd < 0) {
+		igt_info("Failed to open debugfs file: %s\n", path);
+		return -1;
+	}
+
+	bytes_read = read(fd, config, size);
+	close(fd);
+
+	if (bytes_read < 0) {
+		igt_info("Failed to read from debugfs file: %s\n", path);
+		return -1;
+	}
+
+	return bytes_read;
+}
+
+void validate_gca_config_basic(const uint32_t *config, size_t size)
+{
+	struct gca_config *gca = (struct gca_config *)config;
+	uint64_t full_cg_flags;
+
+	igt_assert_f(size >= sizeof(uint32_t), "Config size too small: %zu\n", size);
+	igt_assert_f(size >= sizeof(struct gca_config),
+		     "Config size too small for full structure: %zu, need %zu\n",
+		     size, sizeof(struct gca_config));
+
+	/* Check version field */
+	igt_info("GCA Config version: %u\n", gca->version);
+	igt_assert_f(gca->version >= 1 && gca->version <= 5,
+		     "Invalid GCA config version: %u\n", gca->version);
+
+	/* GPU Architecture Configuration */
+	igt_info("=== GPU Architecture Configuration ===\n");
+	igt_info("Max shader engines: %u\n", gca->max_shader_engines);
+	igt_info("Max tile pipes: %u\n", gca->max_tile_pipes);
+	igt_info("Max CU per SH: %u\n", gca->max_cu_per_sh);
+	igt_info("Max SH per SE: %u\n", gca->max_sh_per_se);
+	igt_info("Max backends per SE: %u\n", gca->max_backends_per_se);
+	igt_info("Max texture channel caches: %u\n", gca->max_texture_channel_caches);
+
+	/* Shader Configuration */
+	igt_info("=== Shader Configuration ===\n");
+	igt_info("Max GPRs: %u\n", gca->max_gprs);
+	igt_info("Max GS threads: %u\n", gca->max_gs_threads);
+	igt_info("Max HW contexts: %u\n", gca->max_hw_contexts);
+
+	/* Shader Controller FIFO Sizes */
+	igt_info("=== Shader Controller FIFO Sizes ===\n");
+	igt_info("SC prim fifo size frontend: %u\n", gca->sc_prim_fifo_size_frontend);
+	igt_info("SC prim fifo size backend: %u\n", gca->sc_prim_fifo_size_backend);
+	igt_info("SC HIZ tile fifo size: %u\n", gca->sc_hiz_tile_fifo_size);
+	igt_info("SC earlyZ tile fifo size: %u\n", gca->sc_earlyz_tile_fifo_size);
+
+	/* Tile Configuration */
+	igt_info("=== Tile Configuration ===\n");
+	igt_info("Number of tile pipes: %u\n", gca->num_tile_pipes);
+	igt_info("Backend enable mask: 0x%x\n", gca->backend_enable_mask);
+	igt_info("Shader engine tile size: %u\n", gca->shader_engine_tile_size);
+
+	/* Memory Configuration */
+	igt_info("=== Memory Configuration ===\n");
+	igt_info("Memory max burst length: %u bytes\n", gca->mem_max_burst_length_bytes);
+	igt_info("Memory row size: %u KB\n", gca->mem_row_size_in_kb);
+	igt_info("GB address config: 0x%x\n", gca->gb_addr_config);
+	igt_info("MC arb ramcfg: 0x%x\n", gca->mc_arb_ramcfg);
+	igt_info("Number of RBs: %u\n", gca->num_rbs);
+
+	/* Multi-GPU Configuration */
+	igt_info("=== Multi-GPU Configuration ===\n");
+	igt_info("Number of GPUs: %u\n", gca->num_gpus);
+	igt_info("Multi-GPU tile size: %u\n", gca->multi_gpu_tile_size);
+
+	/* Version 1 Fields - Basic Device Info */
+	if (gca->version >= 1) {
+		igt_info("=== Version 1 Fields ===\n");
+		igt_info("Revision ID: %u\n", gca->rev_id);
+		igt_info("Power Gating (PG) flags: 0x%x\n", gca->pg_flags);
+		igt_info("Clock Gating (CG) flags lower: 0x%x\n", gca->cg_flags_lower);
+
+		/* Sanity checks for version 1 fields */
+		igt_assert(gca->rev_id != 0xFFFFFFFF); /* Should be valid revision */
+	}
+
+	/* Version 2 Fields - Family Info */
+	if (gca->version >= 2) {
+		igt_info("=== Version 2 Fields ===\n");
+		igt_info("GPU family: %u\n", gca->family);
+		igt_info("External revision ID: %u\n", gca->external_rev_id);
+
+		/* Sanity checks for version 2 fields */
+		igt_assert(gca->family != 0); /* Should be valid family ID */
+		igt_assert(gca->external_rev_id != 0xFFFFFFFF);
+	}
+
+	/* Version 3 Fields - PCI Info */
+	if (gca->version >= 3) {
+		igt_info("=== Version 3 Fields ===\n");
+		igt_info("PCI device: 0x%x\n", gca->pci_device);
+		igt_info("PCI revision: 0x%x\n", gca->pci_revision);
+		igt_info("PCI subsystem device: 0x%x\n", gca->pci_subsystem_device);
+		igt_info("PCI subsystem vendor: 0x%x\n", gca->pci_subsystem_vendor);
+
+		/* Sanity checks for version 3 fields */
+		igt_assert(gca->pci_device != 0); /* Should be valid PCI device ID */
+		igt_assert(gca->pci_revision < 0xFF); /* PCI revision is 8-bit */
+		igt_assert(gca->pci_subsystem_vendor < 0xFFFF); /* Valid vendor ID range */
+	}
+
+	/* Version 4 Fields - APU Flag */
+	if (gca->version >= 4) {
+		igt_info("=== Version 4 Fields ===\n");
+		igt_info("Is APU: %s\n", gca->is_apu ? "yes" : "no");
+
+		/* Sanity check for version 4 field */
+		igt_assert(gca->is_apu == 0 || gca->is_apu == 1); /* Should be boolean */
+	}
+
+	/* Version 5 Fields - Extended CG Flags */
+	if (gca->version >= 5) {
+		igt_info("=== Version 5 Fields ===\n");
+		igt_info("Reserved field: 0x%x\n", gca->reserved);
+		igt_info("Clock Gating (CG) flags upper: 0x%x\n", gca->cg_flags_upper);
+
+		/* Combined CG flags for versions >= 5 */
+		full_cg_flags = ((uint64_t)gca->cg_flags_upper << 32) | gca->cg_flags_lower;
+		igt_info("Full CG flags: 0x%016llx\n", (unsigned long long)full_cg_flags);
+	}
+
+	/* Architecture-specific validation */
+	igt_info("=== Architecture Validation ===\n");
+
+	/* Validate shader engine configuration */
+	if (gca->max_shader_engines > 0) {
+		igt_assert(gca->max_shader_engines <= 8); /* Reasonable maximum */
+		igt_assert(gca->max_sh_per_se <= gca->max_shader_engines);
+	}
+
+	/* Validate CU configuration */
+	if (gca->max_cu_per_sh > 0) {
+		igt_assert(gca->max_cu_per_sh <= 32); /* Reasonable maximum per SH */
+	}
+
+	/* Validate memory configuration */
+	if (gca->mem_row_size_in_kb > 0) {
+		igt_assert(gca->mem_row_size_in_kb <= 32768); /* 32MB maximum row size */
+	}
+
+	/* Validate backend configuration */
+	if (gca->max_backends_per_se > 0) {
+		igt_assert(gca->max_backends_per_se <= 16); /* Reasonable maximum */
+	}
+
+	/* Validate tile pipe configuration */
+	if (gca->num_tile_pipes > 0) {
+		igt_assert(gca->num_tile_pipes <= gca->max_tile_pipes);
+	}
+
+	/* Multi-GPU validation */
+	if (gca->num_gpus > 0) {
+		igt_assert(gca->num_gpus <= 8); /* Reasonable maximum for multi-GPU */
+	}
+
+	/* Print summary */
+	igt_info("=== GCA Config Summary ===\n");
+	igt_info("Total configuration size: %zu bytes\n", size);
+	igt_info("Expected structure size: %zu bytes\n", sizeof(struct gca_config));
+	igt_info("Configuration version: %u\n", gca->version);
+}
diff --git a/lib/amdgpu/compute_utils/amd_gca.h b/lib/amdgpu/compute_utils/amd_gca.h
new file mode 100644
index 000000000..ec4d9927f
--- /dev/null
+++ b/lib/amdgpu/compute_utils/amd_gca.h
@@ -0,0 +1,51 @@
+#ifndef AMD_GCA_H
+#define AMD_GCA_H
+
+#define GCA_CONFIG_DEBUGFS_PATH "/sys/kernel/debug/dri/%d/amdgpu_gca_config"
+#define MAX_CONFIG_SIZE 256
+
+struct gca_config {
+    uint32_t version;
+    uint32_t max_shader_engines;
+    uint32_t max_tile_pipes;
+    uint32_t max_cu_per_sh;
+    uint32_t max_sh_per_se;
+    uint32_t max_backends_per_se;
+    uint32_t max_texture_channel_caches;
+    uint32_t max_gprs;
+    uint32_t max_gs_threads;
+    uint32_t max_hw_contexts;
+    uint32_t sc_prim_fifo_size_frontend;
+    uint32_t sc_prim_fifo_size_backend;
+    uint32_t sc_hiz_tile_fifo_size;
+    uint32_t sc_earlyz_tile_fifo_size;
+    uint32_t num_tile_pipes;
+    uint32_t backend_enable_mask;
+    uint32_t mem_max_burst_length_bytes;
+    uint32_t mem_row_size_in_kb;
+    uint32_t shader_engine_tile_size;
+    uint32_t num_gpus;
+    uint32_t multi_gpu_tile_size;
+    uint32_t mc_arb_ramcfg;
+    uint32_t gb_addr_config;
+    uint32_t num_rbs;
+    uint32_t rev_id;
+    uint32_t pg_flags;
+    uint32_t cg_flags_lower;
+    uint32_t family;
+    uint32_t external_rev_id;
+    uint32_t pci_device;
+    uint32_t pci_revision;
+    uint32_t pci_subsystem_device;
+    uint32_t pci_subsystem_vendor;
+    uint32_t is_apu;
+    uint32_t reserved; /* was cg_flags_upper in newer versions */
+    uint32_t cg_flags_upper;
+};
+
+int
+read_gca_config_debugfs(int dri_index, uint32_t *config, size_t size);
+
+void
+validate_gca_config_basic(const uint32_t *config, size_t size);
+#endif
diff --git a/lib/amdgpu/amd_shared_dispatch.h b/lib/amdgpu/compute_utils/amd_shared_dispatch.h
similarity index 100%
rename from lib/amdgpu/amd_shared_dispatch.h
rename to lib/amdgpu/compute_utils/amd_shared_dispatch.h
-- 
2.49.0

