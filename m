Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF7AC8302D
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 09:24:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7A610E224;
	Mon, 30 Jun 2025 09:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DRnUN1pI";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8287A10E21A
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 09:24:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xi+15UK1KakzO8AbliA5nvXMP2BKRE2m8JFbqsYNNOF+/a2cHGjCZiP0Z+Ll4KHLtq+MvdMfFU8ABgy9DDmw8AXDBHgb0eKM/LgXLnupZPNY7Qy2NKCIf9PUcmFFAdPF8aGdepXLEHLrjVNyT+HxrFpS5oUNDu7RBftrOX9KE9BZsrURkAeFWmHYS9ppzVhxSE5UN5LjZPY6uA/BA19tLWPQKYCotT2lOwEh3DfOTbuPI3FBGqqTmd7AJvOHJL4vd8DBWNbJI5co5gCttl1LPIToCMZNS5zsOFChEz4Tz9YEaYmQ1DYU2lmPBE8iAtqcZkdwrXzaMtwPHlgpgK8/eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MN2Gvx5iYAsAPMdxWrVjIQrJBPdtEfifkDqeASN2oQ=;
 b=DCAyjtWurzH0PnNpseo8S5PY+chu4f8NbZlv/msbddANirQvr7WsMMbaiFfj9q6MYO/FnYszCFncvf8zddQ6/JYaq/DqGvqHwiorKlUdg+mYc6vVOiF1Hxm7c3ZHngAZvOJyW1/cum1hOT2XFgt3/Z0dJ90j2Yd+JICfd+DRFVEHsSGKAYr5JHXqL+W2zJJSHNUpwOUhBSfzax9hOPm/8CGkQXg2+tT1tR6YDTGuQN3/YQHjWTCKzUVt0jDLFPc8CjN4X7t4IN9gpyM12Txi4HjADCOiZIjDCk6PpEw9PVaXb41SFM8iPfBPdyirAwGfLDyjvY+f/0GWywgeixuPZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MN2Gvx5iYAsAPMdxWrVjIQrJBPdtEfifkDqeASN2oQ=;
 b=DRnUN1pIYdiqiR5Doeh2bUwczXsPlp+KoEkESaqkCN74w56IJokAsjkrHEYA4BehWEY7iBOoNPKDS+/zp09Kzg1vwi/qTngaAHYttPGEFUVt58m2NayH92VX2gLYfTFFzYwwP0GlwXk/uWIOcYcGOC8Gz/F+qVZkyrICpyqg8As=
Received: from MN0P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::33)
 by MN0PR12MB6125.namprd12.prod.outlook.com (2603:10b6:208:3c7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Mon, 30 Jun
 2025 09:23:55 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:52e:cafe::3d) by MN0P220CA0025.outlook.office365.com
 (2603:10b6:208:52e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.32 via Frontend Transport; Mon,
 30 Jun 2025 09:23:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Mon, 30 Jun 2025 09:23:55 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 04:23:54 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 30 Jun 2025 04:23:52 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 1/2] lib/amdgpu: Add SDMA support for user queues
Date: Mon, 30 Jun 2025 17:23:41 +0800
Message-ID: <20250630092352.172135-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|MN0PR12MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: d8fc995c-6c6a-42ad-5f99-08ddb7b7d5de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vK5rbLAbB3bT1/bAercNui4tbdcV5093ONy+ssmZSZ/7r1XVeOb1lc93zetX?=
 =?us-ascii?Q?4f3RsCi3tklqa7uTehDDXlRzeUPHbPRnXfla7AydJa16OvDG5ZDwqPlaFkGT?=
 =?us-ascii?Q?9Y6v8YujvQANhoSO1Q61/VHa2Vnw4W9P/GL4a9KmhyKZXxaO5DKZgb503SG8?=
 =?us-ascii?Q?Tu6JDdXsm47B5lZc9botgMVFiSOupmIqdfDRrvBxWUVQVbJ8trpkXDLYwP72?=
 =?us-ascii?Q?EGQao/ZO2WwTS33W83uNljwNDcbSmXBSacKY4cUQLN5oZYqWyr3csXez9Mq3?=
 =?us-ascii?Q?OoY7p6noAk8fy4VmDY9KkDQB9hB3b3HJvq+4OF/QDT5QrqSlVZbQSIMFDTIA?=
 =?us-ascii?Q?Hppj9OsjnjS+TUqur/7tNxS7nyhZ4LKkpkOM5yP/8dPiyB5A3/fwLAVlCdJa?=
 =?us-ascii?Q?n7iXu6sXrkOrh3oo33FLzmp8vWbcQCqf/otDxDnbWby5DADsm6CZ0QCrnDDJ?=
 =?us-ascii?Q?WjuEATn2HNF/SJPM1DO6fF+kkhkIonvkGU0+b/GNCW9623sFQKo1z9EFct8I?=
 =?us-ascii?Q?oYqsM0OA8VWxejRDep3/XmnL+jAjOjsm6SIZ7r2TB+QNW0arceY08W2X9842?=
 =?us-ascii?Q?wpkeyiKY5sTQB67CwVUUk6+3zNqmnyLKL9Cx5h3wdGjUSGnUMFgHRPz4PmJ6?=
 =?us-ascii?Q?7QSthG3snmScJ6CU4mHSnuqwMWX7TXDtuERh5Zx+jfKdEcQFwwKkOrNKCoUZ?=
 =?us-ascii?Q?Ik5AJA2Fe8CtgEZ2uSH0vko8/+wOKkfSsyTICCHf1ZugFCi2CW8Ku5fMnBP1?=
 =?us-ascii?Q?ktF+z/0am3fbiJrGHhmcgDnz4HM3zMyb0C5gRVaIAR7bnarH6BWWznHa/HWw?=
 =?us-ascii?Q?MgqBp1qAPcrumiF9F7xWyq27kgcrAdT0wBt/LSut+2DJYhfuNc/Z1urUOOYN?=
 =?us-ascii?Q?GnDSSN8O99Gw9rDvYwUBmdvogW7HxaNvfUUgmEWnl/tn/cXbQSM/4zOhwrrI?=
 =?us-ascii?Q?y8M+n8eK5+yafi0HRn6W2phBM0ao8IgL00Dkix1EnsY3EDMcnl1G8024/iNT?=
 =?us-ascii?Q?tpBJ7gCwSJXIM+kjhl5yodzZMP4ejOGSarNztlPpb3J89kGJZOV0sQu6C2Dj?=
 =?us-ascii?Q?zG7zHcXF0cBxK1ho/bfEfEoy/D6Mg8Y78+/a1LXlurQQTRgw4tJgKd5x01ju?=
 =?us-ascii?Q?4gyFc1JpRTO8/jxMBQ0tNAdTMfnOr0qD8Cva6r3Q6Fn9TChMspOMM6xH6PYr?=
 =?us-ascii?Q?Y2FphpmUuEnQcVDQlgQEdwVe6TGg47Y6XZQITEq9q2D8AQQdLnRsVj4qUWf9?=
 =?us-ascii?Q?DjRU3HA/a8Jp/pU7S4N3NdHfrGET+NWJcbudNGvnjqk0zjYK5+ahBrxxq4bZ?=
 =?us-ascii?Q?UOs+xNBne03i8rVlX0zJZ+hHqvoOcK8Kiel0q8zKgSGb6ZzChuLoB8ygGFOf?=
 =?us-ascii?Q?XsysqskK7fRLTTYRnVqiI37OI6KzobJkMKn6lo0eYMfl85/IAAKgJwKb4T1t?=
 =?us-ascii?Q?mf6Kn5KU+mUfMNLwGoNEEVwvEsGwXFCjI8uXhTA8WaJtE5bF0xxgjnB4+WQi?=
 =?us-ascii?Q?MruR4bkRPgUeLWtMdMydlrSJ6kcmXGJOd5Y4?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 09:23:55.1069 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8fc995c-6c6a-42ad-5f99-08ddb7b7d5de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6125
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

 This commit adds support for submitting SDMA work to user queues.
    The changes include:

    1. Added SDMA-specific packet definitions in amd_sdma.h for indirect buffer
       operations and protected fence signaling.

    2. Modified amdgpu_user_queue_submit() to handle SDMA-specific requirements:
       - Added alignment padding with NOP packets to ensure 8-DWORD alignment
       - Implemented SDMA-specific indirect buffer submission format
       - Added proper handling of CSA (Context Save Area) addresses
       - Included SDMA-specific fence signaling
       - Adjusted wptr handling for SDMA queues

    The changes ensure proper synchronization and alignment requirements are met
    for SDMA operations while maintaining backward compatibility with existing
    queue types.

    Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_sdma.h  |  4 ++++
 lib/amdgpu/amd_userq.c | 50 +++++++++++++++++++++++++++++-------------
 2 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/lib/amdgpu/amd_sdma.h b/lib/amdgpu/amd_sdma.h
index 3e568e47a..2a9339cfb 100644
--- a/lib/amdgpu/amd_sdma.h
+++ b/lib/amdgpu/amd_sdma.h
@@ -103,5 +103,9 @@
 #              define PACKET3_DMA_DATA_SI_CP_SYNC     (1 << 31)
 
 #define SDMA_NOP  0x0
+#define SDMA_OP_INDIRECT                                0x4
+#define SDMA_OP_PROTECTED_FENCE             0x5
+#define SDMA6_SUB_OP_PROTECTED_FENCE             0x1
+#define SDMA7_SUB_OP_PROTECTED_FENCE             0x3
 
 #endif
diff --git a/lib/amdgpu/amd_userq.c b/lib/amdgpu/amd_userq.c
index f8e1a4b45..10e82a5a4 100644
--- a/lib/amdgpu/amd_userq.c
+++ b/lib/amdgpu/amd_userq.c
@@ -6,6 +6,7 @@
 #include "amd_userq.h"
 #include "amd_memory.h"
 #include "amd_PM4.h"
+#include "amd_sdma.h"
 #include "ioctl_wrappers.h"
 
 #ifdef AMDGPU_USERQ_ENABLED
@@ -136,22 +137,39 @@ void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_co
 	uint64_t timeout = ring_context->time_out ? ring_context->time_out : INT64_MAX;
 
 	amdgpu_pkt_begin();
-	/* Prepare the Indirect IB to submit the IB to user queue */
-	amdgpu_pkt_add_dw(PACKET3(PACKET3_INDIRECT_BUFFER, 2));
-	amdgpu_pkt_add_dw(lower_32_bits(mc_address));
-	amdgpu_pkt_add_dw(upper_32_bits(mc_address));
-
-	if (ip_type == AMD_IP_GFX)
-		amdgpu_pkt_add_dw(control | S_3F3_INHERIT_VMID_MQD_GFX(1));
-	else
-		amdgpu_pkt_add_dw(control | S_3F3_VALID_COMPUTE(1)
-					       | S_3F3_INHERIT_VMID_MQD_COMPUTE(1));
-
-	amdgpu_pkt_add_dw(PACKET3(PACKET3_PROTECTED_FENCE_SIGNAL, 0));
-
-	/* empty dword is needed for fence signal pm4 */
-	amdgpu_pkt_add_dw(0);
 
+	if (ip_type == AMD_IP_DMA) {
+		/* For SDMA, we need to align the IB to 8 DW boundary */
+		unsigned int nop_count = (2 - lower_32_bits(*ring_context->wptr_cpu)) & 7;
+		for (unsigned int i = 0; i < nop_count; i++)
+			amdgpu_pkt_add_dw(SDMA_PKT_HEADER_OP(SDMA_NOP));
+		amdgpu_pkt_add_dw(SDMA_PKT_HEADER_OP(SDMA_OP_INDIRECT));
+		amdgpu_pkt_add_dw(lower_32_bits(mc_address) & 0xffffffe0); // 32-byte aligned
+		amdgpu_pkt_add_dw(upper_32_bits(mc_address));
+		amdgpu_pkt_add_dw(control); // IB length in DWORDS
+		amdgpu_pkt_add_dw(lower_32_bits(ring_context->csa.mc_addr)); // CSA MC address low
+		amdgpu_pkt_add_dw(upper_32_bits(ring_context->csa.mc_addr)); // CSA MC address high
+		if (ring_context->hw_ip_info.hw_ip_version_major <= 6)
+			amdgpu_pkt_add_dw(SDMA_PACKET(SDMA_OP_PROTECTED_FENCE, SDMA6_SUB_OP_PROTECTED_FENCE, 0));
+		else
+			amdgpu_pkt_add_dw(SDMA_PACKET(SDMA_OP_PROTECTED_FENCE, SDMA7_SUB_OP_PROTECTED_FENCE, 0));
+	} else {
+		/* Prepare the Indirect IB to submit the IB to user queue */
+		amdgpu_pkt_add_dw(PACKET3(PACKET3_INDIRECT_BUFFER, 2));
+		amdgpu_pkt_add_dw(lower_32_bits(mc_address));
+		amdgpu_pkt_add_dw(upper_32_bits(mc_address));
+
+		if (ip_type == AMD_IP_GFX)
+			amdgpu_pkt_add_dw(control | S_3F3_INHERIT_VMID_MQD_GFX(1));
+		else
+			amdgpu_pkt_add_dw(control | S_3F3_VALID_COMPUTE(1)
+						| S_3F3_INHERIT_VMID_MQD_COMPUTE(1));
+
+		amdgpu_pkt_add_dw(PACKET3(PACKET3_PROTECTED_FENCE_SIGNAL, 0));
+
+		/* empty dword is needed for fence signal pm4 */
+		amdgpu_pkt_add_dw(0);
+	}
 #if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
 	asm volatile ("mfence" : : : "memory");
 #endif
@@ -163,6 +181,8 @@ void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_co
 	asm volatile ("mfence" : : : "memory");
 #endif
 
+	if (ip_type == AMD_IP_DMA)
+		*ring_context->wptr_cpu = *ring_context->wptr_cpu <<2;
 	/* Update the door bell */
 	ring_context->doorbell_cpu[DOORBELL_INDEX] = *ring_context->wptr_cpu;
 
-- 
2.49.0

