Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF20C369D7
	for <igt-dev@archiver.kernel.org>; Fri, 25 Apr 2025 03:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9552610E319;
	Fri, 25 Apr 2025 03:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UhOl/sG8";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CD110E281
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Apr 2025 03:31:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sItDVAn+ziH389cz+VtHTwWtPporF+w0AXKcYVXbhQNDtbX6ZJZOlcRonVodE1afHzxIa2feNdeZ/d1qxkFCYZd7CGw3OpnWqAsu3xIojxKdDg0FbRa8FIxUHe6+qWS0BaJfc9PMYe+hYA/Ni47BTSpl7DlRqzrYyxUgiMrttHRLWhEGN0FrxkAmsAQBbxiNCokDZwQR1pC1KvAr0QhI8U7ZFZnDwLLUEa8lLY19znbu3xDMjYcg5cmxy8eSRI8zSi8eplG8wL8L+Rx/ljtkbGInKzOb2XAGmAoiqYR8no+Yqz1Db7+1FTZP0mJ7DfvRbG5zBjqIs5FjcXqenjqBEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8ISRH8nRWJtLDx3EK/B+zj+8g9PFCWUUNKmOATOXNs=;
 b=WaLjBt8wAmfamDuTJzrl6Bf7miU0Ai9pzOxXBqqS50HYr3Zs+D9D4cHvClUDhjYqek1NpgyhA06NfGN9z9UktpYDzGwWvn30eqwY+77DCrM5owGSLly/+thlDpIqdgDS8f//V+bFLDBUSTRgjQwpRw7jyeL8X8+2n+xVZ/BVdFkDQjR1sII6rw2U2ZNtmbTvyvPAK/VpswvCN4//eSnzCBFDH1g9/CgfZkGmrYNG1+uDgPsVTYonrPyx9I14R9nxwLOCeQFZb1LIyzoRk37xkdTw0XWCQaqrQA71B/7ENWrX9aPgu9EnnhotN7ZQYtR8U6mIRDdBzZiLOZ6pnzdVHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8ISRH8nRWJtLDx3EK/B+zj+8g9PFCWUUNKmOATOXNs=;
 b=UhOl/sG8HUFbPApvZWHoKJyabJw/KF8pVJ+udRj+r2ciesi/o1QCuknwjTzbacQ0DfWDfCicEYLdpkstqcFxtop5s/ztlDrkZwQdVpRmvedTKTBURXy6wlPx4aGXQJUlYabzjU2l/Ze+W5t9xvL2pONWPRk78Jl/ETInBwZQeOw=
Received: from BYAPR07CA0085.namprd07.prod.outlook.com (2603:10b6:a03:12b::26)
 by PH0PR12MB7960.namprd12.prod.outlook.com (2603:10b6:510:287::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.39; Fri, 25 Apr
 2025 03:31:32 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:a03:12b:cafe::8a) by BYAPR07CA0085.outlook.office365.com
 (2603:10b6:a03:12b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Fri,
 25 Apr 2025 03:31:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 03:31:31 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 22:31:29 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 22:31:28 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 24 Apr 2025 22:31:27 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 <sukhatri@amd.com>, Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 2/3] lib/amdgpu: Implement AQL packet submission support
Date: Fri, 25 Apr 2025 11:31:13 +0800
Message-ID: <20250425033124.1185655-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425033124.1185655-1-Jesse.Zhang@amd.com>
References: <20250425033124.1185655-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|PH0PR12MB7960:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bc30541-a983-40bc-6d86-08dd83a9abf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xdhv0znp0MBWjNGapAbSyZvXBGgSyQEWKy9uagECjBaAjg5/3nPc8DM++VHy?=
 =?us-ascii?Q?y0pVeLMboydhtEHtM+0eFwVi0nTetjl20TyEZAJlezvGGq68V7KGqm4xCwFS?=
 =?us-ascii?Q?xtg7jG3IkK5EJwnNeAYP382HfnZYKZeQo8w2JKvzbVS24lQBGDELwnYq1m0l?=
 =?us-ascii?Q?wdBrZ9jJ21iqQJdMU01K1TeSICcw8koS4F1iBuS+RBO3tA3HbkojUQA/By4c?=
 =?us-ascii?Q?wKr0zkh4vYbifAZlRTFOgdwsInjRSLqUAUeQoMtXPKy3pPyYEBO8TVXojPl/?=
 =?us-ascii?Q?yrsQDZgkp8sw5RHfNRJJQyMEtIgALMnkwDO6aEM4+EvUFj5LHeDox36mWnBB?=
 =?us-ascii?Q?8klFunIRONWxX0wVvQgmuVEFd6fWqrg3Y5hTyFtLRFSxA5KgaPq7gbTlbqCi?=
 =?us-ascii?Q?flDjnr3y77v9m+QqHx6E7idQ4eXzdmOtiLEuwkfINUPqpm1ofk5D6wwRSoS/?=
 =?us-ascii?Q?v2s9sOQzaiR/yL3yd1h9ghgYNoVU/lJDRn8bHRw3XCapE21FguxXigiPga4s?=
 =?us-ascii?Q?dfe/1qO8XTK3Vq4AC8qP3S93MxLBeOddzmIN48JNUWHikciXKdTeH4qwc1xG?=
 =?us-ascii?Q?y378EJOqk/o/Y4XBCr+/xi3Efr43+lRhep0MslCWzB7S9SHrrtGWbALuIiO4?=
 =?us-ascii?Q?MLAhOyOvLoFELs1hKmbP71979kbAYSYUWqP1kdXusR7MmSeLfHDQoZFBLfAW?=
 =?us-ascii?Q?R8R+Uundo/WkCZj3nMeFkiK47Qp7VTKV3AtvS2RLgEvTMtzJtOGP5dGWfhkS?=
 =?us-ascii?Q?JQwj4/DWI3n3TzK/SFDS+8yGEGjKIGxi93gkRvKWcEvSPzx5dBJwmCAVck6H?=
 =?us-ascii?Q?YqEKzLCKSxyepZOEOfekb0KSKmjwFcRxT0t9OB1METOKtkCGMfZUvlDP6Q3D?=
 =?us-ascii?Q?2dSMJmlz5ei+E9ZMcxkAm2Bv44M3jzaXnuo0ZZmIwfeDuCjeHIYCqN3ux6lo?=
 =?us-ascii?Q?lJj1wiad4Mv6kjSjHcyxwQ8ab0ahQZYuW0Dd1oas3teRhYL6LNFPTFFxEVct?=
 =?us-ascii?Q?tTniVBDzUUzSZh/G7HmZ/c8YJy5WTgcXi+McZnUEWFBPWG8W3kopEgjW/x0N?=
 =?us-ascii?Q?ORuEobFGbF2Gvrh8szldKQUbeVyxCvrMCNrGFRE9cBEvJv5mc006ObbHFAmh?=
 =?us-ascii?Q?MYNDYnXblQ2d/ygyyFHLX2ryTisgfrJpHLGJsKhyWUCpzogfsfWanNLVDNdv?=
 =?us-ascii?Q?kWxQ/7woMrPzyNxNKRr2WleCqZzcGpyoNMHALvp1xBycgNA+YjWEnu1mKMGh?=
 =?us-ascii?Q?IO7DAmdjXxdKvRqJMTyYFkCFXGwrqkiqZ4YwvO9e3zCd1ipyUP+vIDn+uBYH?=
 =?us-ascii?Q?c5biYhYsHW/HfeoMv3ZxuN62kkqMGdB62SG+fdFXemx80d2KG/DPFgPeGtP6?=
 =?us-ascii?Q?zV7PSgNA6IytFgQe8k4/5CsMErn/A9q+fVW6Zah+nElpSkEG89AyMw1ASrHN?=
 =?us-ascii?Q?+Hna8QC0Zy8CBW9+a0Hs/A/k0vyb1uoHyKS07NanFSdZXz5I+4DqPg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 03:31:31.3618 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc30541-a983-40bc-6d86-08dd83a9abf6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7960
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

This patch adds:
1. A new `amd_hsa.h` header defining AQL packet types and structures
2. Extended `amdgpu_ring_context` to support AQL queues
3. New `amdgpu_aql_queue_submit()` for AQL packet submission
4. Memory barriers (`mfence`) for proper CPU-GPU synchronization
5. Signal handling for AQL packet completion

The implementation supports vendor-specific AQL packets initially,
with room for future expansion to other HSA packet types.

Signed-off-by: Jesse.Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_command_submission.c |  13 ++-
 lib/amdgpu/amd_command_submission.h |   2 +-
 lib/amdgpu/amd_hsa.h                | 157 ++++++++++++++++++++++++++++
 lib/amdgpu/amd_ip_blocks.h          |  11 +-
 lib/amdgpu/amd_user_queue.c         |  95 ++++++++++++++++-
 lib/amdgpu/amd_user_queue.h         |   2 +
 6 files changed, 274 insertions(+), 6 deletions(-)
 create mode 100644 lib/amdgpu/amd_hsa.h

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 7550fa8bc..54eb2b0f8 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -67,7 +67,9 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
 	ring_ptr = ib_result_cpu;
 	memcpy(ring_ptr, ring_context->pm4, ring_context->pm4_dw * sizeof(*ring_context->pm4));
 
-	if (user_queue)
+	if (ring_context->aql_queue)
+		amdgpu_aql_queue_submit(device, ring_context, ip_type, ib_result_mc_address);
+	else if (user_queue)
 		amdgpu_user_queue_submit(device, ring_context, ip_type, ib_result_mc_address);
 	else {
 		ring_context->ib_info.ib_mc_address = ib_result_mc_address;
@@ -356,7 +358,7 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
  */
 void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 						  const struct amdgpu_ip_block_version *ip_block,
-						  bool user_queue)
+						  bool user_queue, bool aql_queue)
 {
 	const int sdma_write_length = 1024;
 	const int pm4_dw = 256;
@@ -372,13 +374,18 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
 	ring_context->secure = false;
 	ring_context->pm4_size = pm4_dw;
+	ring_context->aql_size = pm4_dw;
 	ring_context->res_cnt = 2;
 	ring_context->user_queue = user_queue;
+	if (aql_queue) {
+		ring_context->aql_queue = true;
+		ring_context->aql_type = HSA_PACKET_TYPE_VENDOR_SPECIFIC;
+	}
 	igt_assert(ring_context->pm4);
+
 	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
 	igt_assert_eq(r, 0);
 
-
 	if (user_queue) {
 		amdgpu_user_queue_create(device, ring_context, ip_block->type);
 	} else {
diff --git a/lib/amdgpu/amd_command_submission.h b/lib/amdgpu/amd_command_submission.h
index d0139b364..f51b777e1 100644
--- a/lib/amdgpu/amd_command_submission.h
+++ b/lib/amdgpu/amd_command_submission.h
@@ -42,5 +42,5 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 
 void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 						 const struct amdgpu_ip_block_version *ip_block,
-						 bool user_queue);
+						 bool user_queue, bool aql_queue);
 #endif
diff --git a/lib/amdgpu/amd_hsa.h b/lib/amdgpu/amd_hsa.h
new file mode 100644
index 000000000..3a5332806
--- /dev/null
+++ b/lib/amdgpu/amd_hsa.h
@@ -0,0 +1,157 @@
+////////////////////////////////////////////////////////////////////////////////
+//
+// The University of Illinois/NCSA
+// Open Source License (NCSA)
+//
+// Copyright (c) 2014-2020, Advanced Micro Devices, Inc. All rights reserved.
+//
+// Developed by:
+//
+//                 AMD Research and AMD HSA Software Development
+//
+//                 Advanced Micro Devices, Inc.
+//
+//                 www.amd.com
+//
+// Permission is hereby granted, free of charge, to any person obtaining a copy
+// of this software and associated documentation files (the "Software"), to
+// deal with the Software without restriction, including without limitation
+// the rights to use, copy, modify, merge, publish, distribute, sublicense,
+// and/or sell copies of the Software, and to permit persons to whom the
+// Software is furnished to do so, subject to the following conditions:
+//
+//  - Redistributions of source code must retain the above copyright notice,
+//    this list of conditions and the following disclaimers.
+//  - Redistributions in binary form must reproduce the above copyright
+//    notice, this list of conditions and the following disclaimers in
+//    the documentation and/or other materials provided with the distribution.
+//  - Neither the names of Advanced Micro Devices, Inc,
+//    nor the names of its contributors may be used to endorse or promote
+//    products derived from this Software without specific prior written
+//    permission.
+//
+// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+// THE CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+// OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+// DEALINGS WITH THE SOFTWARE.
+//
+////////////////////////////////////////////////////////////////////////////////
+
+#ifndef AMD_HSA_H_
+#define AMD_HSA_H_
+
+
+/**
+ * @brief AQL Packet type.
+ */
+typedef enum {
+  /**
+   * Vendor-specific packet.
+   */
+  HSA_PACKET_TYPE_VENDOR_SPECIFIC = 0,
+  /**
+   * The packet has been processed in the past, but has not been reassigned to
+   * the packet processor. A packet processor must not process a packet of this
+   * type. All queues support this packet type.
+   */
+  HSA_PACKET_TYPE_INVALID = 1,
+  /**
+   * Packet used by agents for dispatching jobs to kernel agents. Not all
+   * queues support packets of this type (see ::hsa_queue_feature_t).
+   */
+  HSA_PACKET_TYPE_KERNEL_DISPATCH = 2,
+  /**
+   * Packet used by agents to delay processing of subsequent packets, and to
+   * express complex dependencies between multiple packets. All queues support
+   * this packet type.
+   */
+  HSA_PACKET_TYPE_BARRIER_AND = 3,
+  /**
+   * Packet used by agents for dispatching jobs to agents.  Not all
+   * queues support packets of this type (see ::hsa_queue_feature_t).
+   */
+  HSA_PACKET_TYPE_AGENT_DISPATCH = 4,
+  /**
+   * Packet used by agents to delay processing of subsequent packets, and to
+   * express complex dependencies between multiple packets. All queues support
+   * this packet type.
+   */
+  HSA_PACKET_TYPE_BARRIER_OR = 5
+} hsa_packet_type_t;
+
+/**
+ * @brief Sub-fields of the @a header field that is present in any AQL
+ * packet. The offset (with respect to the address of @a header) of a sub-field
+ * is identical to its enumeration constant. The width of each sub-field is
+ * determined by the corresponding value in ::hsa_packet_header_width_t. The
+ * offset and the width are expressed in bits.
+ */
+ typedef enum {
+  /**
+   * Packet type. The value of this sub-field must be one of
+   * ::hsa_packet_type_t. If the type is ::HSA_PACKET_TYPE_VENDOR_SPECIFIC, the
+   * packet layout is vendor-specific.
+   */
+   HSA_PACKET_HEADER_TYPE = 0,
+  /**
+   * Barrier bit. If the barrier bit is set, the processing of the current
+   * packet only launches when all preceding packets (within the same queue) are
+   * complete.
+   */
+   HSA_PACKET_HEADER_BARRIER = 8,
+  /**
+   * Acquire fence scope. The value of this sub-field determines the scope and
+   * type of the memory fence operation applied before the packet enters the
+   * active phase. An acquire fence ensures that any subsequent global segment
+   * or image loads by any unit of execution that belongs to a dispatch that has
+   * not yet entered the active phase on any queue of the same kernel agent,
+   * sees any data previously released at the scopes specified by the acquire
+   * fence. The value of this sub-field must be one of ::hsa_fence_scope_t.
+   */
+   HSA_PACKET_HEADER_SCACQUIRE_FENCE_SCOPE = 9,
+   /**
+    * @deprecated Renamed as ::HSA_PACKET_HEADER_SCACQUIRE_FENCE_SCOPE.
+    */
+   HSA_PACKET_HEADER_ACQUIRE_FENCE_SCOPE = 9,
+  /**
+   * Release fence scope, The value of this sub-field determines the scope and
+   * type of the memory fence operation applied after kernel completion but
+   * before the packet is completed. A release fence makes any global segment or
+   * image data that was stored by any unit of execution that belonged to a
+   * dispatch that has completed the active phase on any queue of the same
+   * kernel agent visible in all the scopes specified by the release fence. The
+   * value of this sub-field must be one of ::hsa_fence_scope_t.
+   */
+   HSA_PACKET_HEADER_SCRELEASE_FENCE_SCOPE = 11,
+   /**
+    * @deprecated Renamed as ::HSA_PACKET_HEADER_SCRELEASE_FENCE_SCOPE.
+    */
+   HSA_PACKET_HEADER_RELEASE_FENCE_SCOPE = 11
+ } hsa_packet_header_t;
+
+/**
+ * @brief Scope of the memory fence operation associated with a packet.
+ */
+typedef enum {
+  /**
+   * No scope (no fence is applied). The packet relies on external fences to
+   * ensure visibility of memory updates.
+   */
+  HSA_FENCE_SCOPE_NONE = 0,
+  /**
+   * The fence is applied with agent scope for the global segment.
+   */
+  HSA_FENCE_SCOPE_AGENT = 1,
+  /**
+   * The fence is applied across both agent and system scope for the global
+   * segment.
+   */
+  HSA_FENCE_SCOPE_SYSTEM = 2
+} hsa_fence_scope_t;
+
+#define AMD_AQL_FORMAT_PM4_IB 0x1
+
+#endif  // header guard
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 7d48f9107..32032402d 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -18,6 +18,7 @@
 
 #include "amd_registers.h"
 #include "amd_family.h"
+#include "amd_hsa.h"
 
 #define MAX_CARDS_SUPPORTED 4
 
@@ -164,10 +165,13 @@ struct amdgpu_ring_context {
 	struct  amdgpu_userq_bo wptr;
 	struct  amdgpu_userq_bo csa;
 	struct  amdgpu_userq_bo eop;
+	struct  amdgpu_userq_bo signal;
 
 	uint32_t *queue_cpu;
-	uint64_t *wptr_cpu;
+	volatile uint64_t *wptr_cpu;
+	volatile uint64_t *rptr_cpu;
 	uint64_t *doorbell_cpu;
+	uint64_t *signal_cpu;
 
 	uint32_t db_handle;
 	uint32_t queue_id;
@@ -176,6 +180,11 @@ struct amdgpu_ring_context {
 	uint64_t point;
 	bool user_queue;
 
+	uint32_t *aql;		/* data of the packet */
+	uint32_t aql_size;	/* max allocated packet size */
+	uint32_t aql_type;	/* aql packet type*/
+	bool aql_queue;		/* aql queue or not */
+
 	struct drm_amdgpu_info_uq_fw_areas info;
 };
 
diff --git a/lib/amdgpu/amd_user_queue.c b/lib/amdgpu/amd_user_queue.c
index 444f9c022..6e32c41fd 100644
--- a/lib/amdgpu/amd_user_queue.c
+++ b/lib/amdgpu/amd_user_queue.c
@@ -7,6 +7,8 @@
 #include "amd_memory.h"
 #include "amd_PM4.h"
 #include "ioctl_wrappers.h"
+#include <stdatomic.h>
+#include <stdio.h>
 
 #ifdef AMDGPU_USERQ_ENABLED
 static void amdgpu_alloc_doorbell(amdgpu_device_handle device_handle,
@@ -126,6 +128,79 @@ int amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
 	return r;
 }
 
+void amdgpu_aql_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
+			      unsigned int ip_type, uint64_t mc_address)
+{
+	uint32_t acquireFence = HSA_FENCE_SCOPE_NONE, releaseFence = HSA_FENCE_SCOPE_SYSTEM;
+	uint32_t control = ring_context->pm4_dw;
+	uint64_t header;
+
+	amdgpu_pkt_begin();
+	switch (ring_context->aql_type) {
+	case HSA_PACKET_TYPE_VENDOR_SPECIFIC:
+		header = HSA_PACKET_TYPE_VENDOR_SPECIFIC |
+			(acquireFence << HSA_PACKET_HEADER_SCACQUIRE_FENCE_SCOPE) |
+			(releaseFence << HSA_PACKET_HEADER_SCRELEASE_FENCE_SCOPE) |
+			(AMD_AQL_FORMAT_PM4_IB << 16);
+		amdgpu_pkt_add_dw(header);
+		amdgpu_pkt_add_dw(PACKET3(PACKET3_INDIRECT_BUFFER, 2));
+		amdgpu_pkt_add_dw(lower_32_bits(mc_address));
+		amdgpu_pkt_add_dw(upper_32_bits(mc_address));
+
+		if (ip_type == AMD_IP_GFX)
+			amdgpu_pkt_add_dw(control | S_3F3_INHERIT_VMID_MQD_GFX(1));
+		else
+			amdgpu_pkt_add_dw(control | S_3F3_VALID_COMPUTE(1)
+						       | S_3F3_INHERIT_VMID_MQD_COMPUTE(1));
+		/* remaining dws */
+		amdgpu_pkt_add_dw(0xa);
+		/* reserved */
+		amdgpu_pkt_add_dw(0x0);
+		amdgpu_pkt_add_dw(0x0);
+		amdgpu_pkt_add_dw(0x0);
+		amdgpu_pkt_add_dw(0x0);
+		amdgpu_pkt_add_dw(0x0);
+		amdgpu_pkt_add_dw(0x0);
+		amdgpu_pkt_add_dw(0x0);
+		amdgpu_pkt_add_dw(0x0);
+		/* COMPLETION_SIGNAL */
+		amdgpu_pkt_add_dw(lower_32_bits(ring_context->signal.mc_addr));
+		amdgpu_pkt_add_dw(upper_32_bits(ring_context->signal.mc_addr));
+		break;
+	case HSA_PACKET_TYPE_KERNEL_DISPATCH:
+	case HSA_PACKET_TYPE_AGENT_DISPATCH:
+	case HSA_PACKET_TYPE_BARRIER_AND:
+	case HSA_PACKET_TYPE_BARRIER_OR:
+	default:
+		break;
+	}
+
+	/* Below call update the wptr address so will wait till all writes are completed */
+	#if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
+		asm volatile ("mfence" : : : "memory");
+	#endif
+		amdgpu_pkt_end();
+	#if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
+		asm volatile ("mfence" : : : "memory");
+	#endif
+
+	/* Update the door bell */
+	ring_context->doorbell_cpu[DOORBELL_INDEX] = *ring_context->wptr_cpu;
+
+	#if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
+		asm volatile ("mfence" : : : "memory");
+	#endif
+
+	/* Waiting for the packet to be consumed.
+	  TODO: Use the check completion signal instead.
+	*/
+	while((*ring_context->wptr_cpu) != (*ring_context->rptr_cpu));
+
+	#if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
+		asm volatile ("mfence" : : : "memory");
+	#endif
+}
+
 void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
 			      unsigned int ip_type, uint64_t mc_address)
 {
@@ -134,7 +209,6 @@ void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_co
 	uint32_t syncarray[1];
 	struct drm_amdgpu_userq_signal signal_data;
 
-
 	amdgpu_pkt_begin();
 	/* Prepare the Indirect IB to submit the IB to user queue */
 	amdgpu_pkt_add_dw(PACKET3(PACKET3_INDIRECT_BUFFER, 2));
@@ -264,6 +338,9 @@ void amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, struct amdgpu
 
 	amdgpu_bo_unmap_and_free(ctxt->queue.handle, ctxt->queue.va_handle,
 				 ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE);
+
+	amdgpu_bo_unmap_and_free(ctxt->signal.handle, ctxt->signal.va_handle,
+                                 ctxt->signal.mc_addr, USERMODE_QUEUE_SIZE);
 }
 
 void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
@@ -289,6 +366,9 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_
 	if (ctxt->priority)
 		queue_flags |= ctxt->priority & AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_MASK;
 
+	if (ctxt->aql_queue)
+		queue_flags |= AMDGPU_USERQ_CREATE_FLAGS_QUEUE_AQL_COMPUTE;
+
 	r = amdgpu_query_uq_fw_area_info(device_handle, AMD_IP_GFX, 0, &ctxt->info);
 	igt_assert_eq(r, 0);
 
@@ -325,6 +405,16 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_
 				       ctxt->timeline_syncobj_handle, ++ctxt->point);
 	igt_assert_eq(r, 0);
 
+	r = amdgpu_bo_alloc_and_map_uq(device_handle, 8,
+				       ALIGNMENT,
+				       AMDGPU_GEM_DOMAIN_GTT,
+				       gtt_flags,
+				       AMDGPU_VM_MTYPE_UC,
+				       &ctxt->signal.handle, &ctxt->signal.ptr,
+				       &ctxt->signal.mc_addr, &ctxt->signal.va_handle,
+				       ctxt->timeline_syncobj_handle, ++ctxt->point);
+	igt_assert_eq(r, 0);
+
 	switch (type) {
 	case AMD_IP_GFX:
 		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->info.gfx.shadow_size,
@@ -396,6 +486,9 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_
 	ctxt->doorbell_cpu = (uint64_t *)ctxt->doorbell.ptr;
 
 	ctxt->wptr_cpu = (uint64_t *)ctxt->wptr.ptr;
+	ctxt->rptr_cpu = (uint64_t *)ctxt->rptr.ptr;
+
+	ctxt->signal_cpu = (uint64_t *)ctxt->signal.ptr;
 
 	ctxt->queue_cpu = (uint32_t *)ctxt->queue.ptr;
 	memset(ctxt->queue_cpu, 0, USERMODE_QUEUE_SIZE);
diff --git a/lib/amdgpu/amd_user_queue.h b/lib/amdgpu/amd_user_queue.h
index b29e97ccf..6bd8fb3b2 100644
--- a/lib/amdgpu/amd_user_queue.h
+++ b/lib/amdgpu/amd_user_queue.h
@@ -52,4 +52,6 @@ void amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, struct amdgpu
 void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
 			      unsigned int ip_type, uint64_t mc_address);
 
+void amdgpu_aql_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
+			      unsigned int ip_type, uint64_t mc_address);
 #endif
-- 
2.49.0

