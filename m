Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC50606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 19:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tQL+Y7ev
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF9410E440;
	Mon, 16 Nov 2026 19:54:35 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010035.outbound.protection.outlook.com [52.101.85.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F73A10E440
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 19:53:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4Pqv2jBes0Vb8G8f7Q9qTWLPBIN7/T3qbVxRqDXHB7ndWY83wXHyXaQzRCnS6ZiK5mFtIxLGslQmF4XkKGxrPMAnr1iX5b/s688aJvlZc80KCIyYkR1Sk7v6fCm6VYk330yBEs0ZeNnIP9dtZQ66n/rQSDI1ewT9k+WgHcEuAveUxFuxK6Yo9xowmVYwZ+y+xypSvMi+zQuMuWYCg4j3FUBNVDN0L7sVLJFSOTK2wo6Sf6Uq7asD3vBjVWyJPRx6xG2WGXM2fin/tiQ/SdFD67vgTZhbca+6KPEBZNQkEE+ihOfp8GackxU2cV/UYISGUHxY/3KTUCZLHN+zd+NPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrpdOxhsosUKGYH2ZFtjW1MRfK6XZhVS8JqKGQFeacw=;
 b=lBYeJrpF8rLNslNXJIJa2TSTbW6q+M9qCQAcDkY+WV8kIIEB+1DWhstLCbZD9dPFmd169QTg36Oyvvq3CbICSewoOqXfGKVbvKWnZoIWdzQxoV9LsvVkjcK6mF/fNzF6tWb3YJPoWWYvtRm/79K3ygFs3B8rtL0/41tBmXpBHGLI59kEL9WqcXSXCYUpw5XEDXuabapLArKMc7d0IzAPKbEIrHQ1dgd0wbHsWE0/K1+TvWYEyx6ULxfvgOPDZ53p4X3VHSvIifpAmWgbD1tlBw0/KqmkLway0AAtqmwy/fTbWl+tICIqdvVD8/mDdnqf1cusMeXots2XKXD8wiFyZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UrpdOxhsosUKGYH2ZFtjW1MRfK6XZhVS8JqKGQFeacw=;
 b=tQL+Y7evu2DZVvgwL3SsC7y3v4e2+tCZd96nxyZokTeY7lawQ/m/gYRcD+Qd2LTpUm8AzEqj1NS7aonraCspD8fbMxXXPt1fpuVFK18XB5mKA8iU75FNiYtzrwdvp/Ey64v+Y9itvq1uYCO3WmpHa/9iY4msCmvz9AF3GGUGLpQ=
Received: from CYZPR20CA0007.namprd20.prod.outlook.com (2603:10b6:930:a2::7)
 by CH2PR12MB4197.namprd12.prod.outlook.com (2603:10b6:610:ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 19:53:14 +0000
Received: from EA8PEPF00000005.namprd05.prod.outlook.com
 (2603:10b6:930:a2:cafe::74) by CYZPR20CA0007.outlook.office365.com
 (2603:10b6:930:a2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Mon, 16
 Nov 2026 19:53:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 EA8PEPF00000005.mail.protection.outlook.com (10.167.249.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 19:53:13 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 13:53:03 -0600
From: David Francis <David.Francis@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: David Francis <David.Francis@amd.com>
Subject: [PATCH v3] tests/amdgpu: Tests for amdgpu userq list and change
Date: Mon, 16 Nov 2026 14:52:50 -0500
Message-ID: <20261116195250.1455010-1-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EA8PEPF00000005:EE_|CH2PR12MB4197:EE_
X-MS-Office365-Filtering-Correlation-Id: 601d468d-fd4d-45d4-1862-08df441b4023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|18002099003|6133799003|261009221227099003|261009223027099003|3023799007|11063799006|56012099006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261021123027099003|261022075727099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info: 9HigkPwMf1G63Y2whShhcQSUu6tzceDdbt8Wh+WbaY4F2a8xCBOdBHIMfUDdSyzg7aEuRg3M47p/ixDe04MPaxFKDIjLoQu46EaPtJrC9l+X8SWTuKw9IJhQzHNC8e/h2L/5YUVz0sI0oPz168G5YtVqyTjGTTu9D+PpgR/STPB23Az+tJkgVHn7N4i7rIXy8kBGKvHMe0P2ncdz1kqoLm9SnLTmkMtUCQceS/gmizxyyCG+/klCruUeeQ5yNJAzx741kiFccjHvqtzUPJfO8ZG1Q4/rGpIjkGe55CdlntSQ+iILkp6fNRRI9D8n/Mx691xsqYuX9RxQTIMCRYa3GzRXaIjT0VMGh00rqmgU1GJG216yKcQN8mQUOQwb/hCz+GN8rCfRhVRH4otxce8FiSCBXvItAtxRNXRfuU2/EbKkrnSyby7eOdZTCKxJz/B7BA1ecie+ddNZ2dFXDbytkmFQ1NoXeMsNrszuY3uduDzdNjZP+SGeL80N6ja5Ym8kvcl/vcuaNyp1WWASd39ORmEKZaen8AccqiPtILgX5Ycz3BI3f2+pj+iPKIfOXj5sWfqN67T1gfpS0QHC8xe+AHTg1YvWZTJL9IQDBnp4G/1SVAZzrHx6lmSIUQmV/jNMVf94Fa2X0NWkNu+lzWND/RDLRZhayP/WPnFn+rBUZyeq4CqGoB5hOPlATxV8/0d5LrXY8LzoYxf4V6uwg9wZvQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(18002099003)(6133799003)(261009221227099003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6a3+Ms52bD5G9yOEmL/w3JmIqnGCBiEW5m4tgLxJqwhzfrgjM+gjgfhwYkQmWnQp36lOazkD988xbBjheHWk5X2BK2tkgUgsgbQrEEyLgcF/w6g7TDja2IdEpueCcSDhDNVOqcujwUU+h5yFiaKFg3t867R9+1Sf+VK5Poij8WQzNnVhOuXqoH40UP9RB3skl0iaU/OOfKrDWpGndefB+1Jisz5mjHOLV5SaFBdrjEvr30zFqxL6LemW8y5Iu34v/xgNaTQEmG/4bOqpkOnJqBGb+4ni4521aRRqzYc+KuHgXZ0/vMfsurx3ji6bPf/fg6v0ebDmc7Y2s0lvWYlNofylN0F1mzIUd5R1zOvFHXChkdMB9pYW3lMv+JAHhLLkVvazPiJ7Gql1EVB5EXWASQxveLq6i1gEjWV2VSc6sxbcGe2Ujats1CZy6MPLnLwt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 19:53:13.9653 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 601d468d-fd4d-45d4-1862-08df441b4023
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: EA8PEPF00000005.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4197
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Two new amdgpu userq interfaces are being added -
AMDGPU_USERQ_OP_LIST and AMDGPU_USERQ_OP_CHANGE_ID.

Add tests for edge cases and race conditions

v2: Various fixes and clarifications
v3: Use random for race thread; add tests for listing mixed queues

Signed-off-by: David Francis <David.Francis@amd.com>
---
 include/drm-uapi/amdgpu_drm.h |  58 ++-
 tests/amdgpu/amd_userq.c      | 691 ++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build      |   1 +
 3 files changed, 748 insertions(+), 2 deletions(-)
 create mode 100644 tests/amdgpu/amd_userq.c

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index ca24519c7..fdbd4d39b 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -326,10 +326,13 @@ union drm_amdgpu_ctx {
 };
 
 /* user queue IOCTL operations */
-#define AMDGPU_USERQ_OP_CREATE	1
-#define AMDGPU_USERQ_OP_FREE	2
+#define AMDGPU_USERQ_OP_CREATE		1
+#define AMDGPU_USERQ_OP_FREE		2
+#define AMDGPU_USERQ_OP_LIST		3
+#define AMDGPU_USERQ_OP_CHANGE_ID	4
 
 /* queue priority levels */
+/* low < normal low < normal high < high */
 #define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_MASK  0x3
 #define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_SHIFT 0
 #define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_NORMAL_LOW 0
@@ -365,6 +368,9 @@ struct drm_amdgpu_userq_in {
 	 * and doorbell_offset in the doorbell bo.
 	 */
 	__u32   doorbell_offset;
+	/**
+	 * @flags: flags used for queue parameters
+	 */
 	__u32 flags;
 	/**
 	 * @queue_va: Virtual address of the GPU memory which holds the queue
@@ -406,6 +412,15 @@ struct drm_amdgpu_userq_in {
 	__u64 mqd_size;
 };
 
+struct drm_amdgpu_userq_change_id_in {
+	/** AMDGPU_USERQ_OP_CHANGE_ID */
+	__u32	op;
+	/** Queue id of some queue */
+	__u32	queue_id;
+	/** Queue id to change that queue to */
+	__u32	new_queue_id;
+};
+
 /* The structure to carry output of userqueue ops */
 struct drm_amdgpu_userq_out {
 	/**
@@ -417,9 +432,48 @@ struct drm_amdgpu_userq_out {
 	__u32 _pad;
 };
 
+struct drm_amdgpu_userq_list_entry {
+	/** Userspace pointer to buffer holding mqd */
+	__u64	mqd_data;
+	/**
+	 *  In: Size of mqd_data user-allocated buffer.
+	 *  Out: If mqd_data was insufficiently large, the
+	 * size it needs to be.
+	 */
+	__u32	mqd_size;
+
+	/** Definitions same as drm_amdgpu_userq_in */
+	__u32	queue_id;
+	__u32   ip_type;
+	__u32   doorbell_handle;
+	__u32   doorbell_offset;
+	__u32   flags;
+	__u64   queue_va;
+	__u64   queue_size;
+	__u64   rptr_va;
+	__u64   wptr_va;
+};
+
+struct drm_amdgpu_userq_list_in_out {
+	/**
+	 * For operation AMDGPU_USERQ_OP_LIST: User will provide a buffer, which the
+	 * driver will fill with information about all of that process's queues on this device.
+	 */
+	/** AMDGPU_USERQ_OP_LIST */
+	__u32	op;
+	/** Size of entries buffer / Number of handles in process
+	 * (if larger than size of buffer, must retry)
+	 */
+	__u32   num_entries;
+	/* User pointer to array of drm_amdgpu_userq_list_entry */
+	__u64   entries;
+};
+
 union drm_amdgpu_userq {
 	struct drm_amdgpu_userq_in in;
 	struct drm_amdgpu_userq_out out;
+	struct drm_amdgpu_userq_change_id_in change_in;
+	struct drm_amdgpu_userq_list_in_out list_in_out;
 };
 
 /* GFX V11 IP specific MQD parameters */
diff --git a/tests/amdgpu/amd_userq.c b/tests/amdgpu/amd_userq.c
new file mode 100644
index 000000000..e781d64bd
--- /dev/null
+++ b/tests/amdgpu/amd_userq.c
@@ -0,0 +1,691 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ */
+
+#include "igt.h"
+#include <amdgpu_drm.h>
+#include <amdgpu.h>
+#include <time.h>
+#include <sys/ioctl.h>
+#include "lib/amdgpu/amd_ip_blocks.h"
+#include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_PM4.h"
+#include "lib/amdgpu/compute_utils/amd_dispatch.h"
+#include "lib/amdgpu/compute_utils/amd_dispatch_helpers.h"
+#include "lib/amdgpu/shaders/amd_shaders.h"
+#include "lib/amdgpu/compute_utils/amd_shared_dispatch.h"
+
+#define RACE_DURATION_SEC 1
+
+static int amd_userq_change(int fd, uint32_t queue_id, uint32_t new_queue_id)
+{
+	union drm_amdgpu_userq userq = {0};
+
+	userq.change_in.op = AMDGPU_USERQ_OP_CHANGE_ID;
+	userq.change_in.queue_id = queue_id;
+	userq.change_in.new_queue_id = new_queue_id;
+
+	return ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+}
+
+static int amd_userq_free(int fd, uint32_t queue_id)
+{
+	union drm_amdgpu_userq userq = {0};
+
+	userq.in.op = AMDGPU_USERQ_OP_FREE;
+	userq.in.queue_id = queue_id;
+
+	return ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+}
+
+static void
+test_list_handles(amdgpu_device_handle device, int fd, const struct amdgpu_gpu_info *gpu_info, int *ip_types, int num_qs)
+{
+	const struct amdgpu_ip_block_version *compute_ip_block = get_ip_block(device, AMD_IP_COMPUTE);
+	const struct amdgpu_ip_block_version *gfx_ip_block = get_ip_block(device, AMD_IP_GFX);
+	const struct amdgpu_ip_block_version *sdma_ip_block = get_ip_block(device, AMD_IP_DMA);
+	struct drm_amdgpu_userq_mqd_compute_gfx11 *compute_mqds;
+	struct drm_amdgpu_userq_mqd_gfx11 *gfx_mqds;
+	struct drm_amdgpu_userq_mqd_sdma_gfx11 *sdma_mqds;
+	struct drm_amdgpu_userq_list_entry *entries;
+	struct amdgpu_ring_context *ring_contexts;
+	union drm_amdgpu_userq userq;
+	int ret, i;
+
+	igt_assert(num_qs > 0);
+
+	ring_contexts = calloc(num_qs, sizeof(struct amdgpu_ring_context));
+	igt_assert(ring_contexts);
+
+	entries = calloc(num_qs, sizeof(struct drm_amdgpu_userq_list_entry));
+	igt_assert(entries);
+
+	/* Only a third of these will be used */
+	compute_mqds = calloc(num_qs, sizeof(struct drm_amdgpu_userq_mqd_compute_gfx11));
+	igt_assert(compute_mqds);
+	gfx_mqds = calloc(num_qs, sizeof(struct drm_amdgpu_userq_mqd_gfx11));
+	igt_assert(gfx_mqds);
+	sdma_mqds = calloc(num_qs, sizeof(struct drm_amdgpu_userq_mqd_sdma_gfx11));
+	igt_assert(sdma_mqds);
+
+	/* Create queues */
+	for (i = 0; i < num_qs; i++) {
+		igt_assert(ip_types[i] == AMD_IP_COMPUTE || ip_types[i] == AMD_IP_GFX || ip_types[i] == AMD_IP_DMA);
+
+		if (ip_types[i] == AMD_IP_COMPUTE)
+			compute_ip_block->funcs->userq_create(device, &ring_contexts[i], compute_ip_block->type);
+		else if (ip_types[i] == AMD_IP_GFX)
+			gfx_ip_block->funcs->userq_create(device, &ring_contexts[i], gfx_ip_block->type);
+		else if (ip_types[i] == AMD_IP_DMA)
+			sdma_ip_block->funcs->userq_create(device, &ring_contexts[i], sdma_ip_block->type);
+	}
+
+	/* List with num_entries less than number of queues, gives number of queues */
+	userq.list_in_out.op = AMDGPU_USERQ_OP_LIST;
+	userq.list_in_out.num_entries = 0;
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+	igt_assert_eq(ret, 0);
+	igt_assert_eq(userq.list_in_out.num_entries, num_qs);
+
+	/* List with correct number of entries but mqd size 0, gives mqd size */
+	userq.list_in_out.op = AMDGPU_USERQ_OP_LIST;
+	userq.list_in_out.num_entries = num_qs;
+	userq.list_in_out.entries = (uint64_t)entries;
+	for (i = 0; i < num_qs; i++)
+		entries[i].mqd_size = 0;
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+	igt_assert_eq(ret, 0);
+	igt_assert_eq(userq.list_in_out.num_entries, num_qs);
+	for (i = 0; i < num_qs; i++) {
+		if (ip_types[i] == AMD_IP_COMPUTE)
+			igt_assert_eq(entries[i].mqd_size, sizeof(struct drm_amdgpu_userq_mqd_compute_gfx11));
+		else if (ip_types[i] == AMD_IP_GFX)
+			igt_assert_eq(entries[i].mqd_size, sizeof(struct drm_amdgpu_userq_mqd_gfx11));
+		else if (ip_types[i] == AMD_IP_DMA)
+			igt_assert_eq(entries[i].mqd_size, sizeof(struct drm_amdgpu_userq_mqd_sdma_gfx11));
+	}
+
+	/* List with correct number of entries and mqd size, gives queue information */
+	userq.list_in_out.op = AMDGPU_USERQ_OP_LIST;
+	userq.list_in_out.num_entries = num_qs;
+	userq.list_in_out.entries = (uint64_t)entries;
+	for (i = 0; i < num_qs; i++) {
+		if (ip_types[i] == AMD_IP_COMPUTE) {
+			entries[i].mqd_size = sizeof(struct drm_amdgpu_userq_mqd_compute_gfx11);
+			entries[i].mqd_data = (uint64_t)&compute_mqds[i];
+		} else if (ip_types[i] == AMD_IP_GFX) {
+			entries[i].mqd_size = sizeof(struct drm_amdgpu_userq_mqd_gfx11);
+			entries[i].mqd_data = (uint64_t)&gfx_mqds[i];
+		} else if (ip_types[i] == AMD_IP_DMA) {
+			entries[i].mqd_size = sizeof(struct drm_amdgpu_userq_mqd_sdma_gfx11);
+			entries[i].mqd_data = (uint64_t)&sdma_mqds[i];
+		}
+	}
+
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+	igt_assert_eq(ret, 0);
+
+	for (i = 0; i < num_qs; i++) {
+		igt_assert(entries[i].queue_id > 0);
+		igt_assert_eq(entries[i].ip_type, ip_types[i]);
+		igt_assert(entries[i].doorbell_handle > 0);
+		igt_assert_eq(entries[i].flags, 0);
+
+		igt_assert(entries[i].queue_va > 0);
+		igt_assert_eq(entries[i].queue_size, 0x100000);
+		igt_assert(entries[i].rptr_va > 0);
+		igt_assert(entries[i].wptr_va > 0);
+
+		if (ip_types[i] == AMD_IP_COMPUTE) {
+			igt_assert(compute_mqds[i].eop_va > 0);
+			compute_ip_block->funcs->userq_destroy(device, &ring_contexts[i], compute_ip_block->type);
+		} else if (ip_types[i] == AMD_IP_GFX) {
+			igt_assert(gfx_mqds[i].shadow_va > 0);
+			igt_assert(gfx_mqds[i].csa_va > 0);
+			gfx_ip_block->funcs->userq_destroy(device, &ring_contexts[i], gfx_ip_block->type);
+		} else if (ip_types[i] == AMD_IP_DMA) {
+			igt_assert(sdma_mqds[i].csa_va > 0);
+			sdma_ip_block->funcs->userq_destroy(device, &ring_contexts[i], sdma_ip_block->type);
+		}
+	}
+
+	free(ring_contexts);
+	free(entries);
+	free(compute_mqds);
+	free(gfx_mqds);
+	free(sdma_mqds);
+}
+
+static void
+test_list_zero(amdgpu_device_handle device, int fd, const struct amdgpu_gpu_info *gpu_info)
+{
+	union drm_amdgpu_userq userq;
+	int ret;
+
+	userq.list_in_out.op = AMDGPU_USERQ_OP_LIST;
+	userq.list_in_out.num_entries = 0;
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+	igt_assert_eq(ret, 0);
+	igt_assert_eq(userq.list_in_out.num_entries, 0);
+}
+
+static void
+test_list_bad_entries(amdgpu_device_handle device, int fd, const struct amdgpu_gpu_info *gpu_info, int ip_type)
+{
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device, ip_type);
+	struct amdgpu_ring_context ring_context = {0};
+	union drm_amdgpu_userq userq;
+	int ret;
+
+	ip_block->funcs->userq_create(device, &ring_context, ip_block->type);
+
+	userq.list_in_out.op = AMDGPU_USERQ_OP_LIST;
+	userq.list_in_out.num_entries = 0;
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+	igt_assert_eq(ret, 0);
+	igt_assert_eq(userq.list_in_out.num_entries, 1);
+
+	userq.list_in_out.op = AMDGPU_USERQ_OP_LIST;
+	userq.list_in_out.num_entries = 1;
+	/* entries pointer is NULL, should EFAULT */
+	userq.list_in_out.entries = 0;
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+	igt_assert(ret != 0);
+	igt_assert(errno == EFAULT);
+
+	ip_block->funcs->userq_destroy(device, &ring_context, ip_block->type);
+}
+
+static void
+test_list_bad_mqd(amdgpu_device_handle device, int fd, const struct amdgpu_gpu_info *gpu_info, int ip_type)
+{
+
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device, ip_type);
+	struct drm_amdgpu_userq_list_entry entry = {0};
+	struct amdgpu_ring_context ring_context = {0};
+	union drm_amdgpu_userq userq;
+	int ret;
+
+	ip_block->funcs->userq_create(device, &ring_context, ip_block->type);
+
+	userq.list_in_out.op = AMDGPU_USERQ_OP_LIST;
+	userq.list_in_out.num_entries = 0;
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+	igt_assert_eq(ret, 0);
+	igt_assert_eq(userq.list_in_out.num_entries, 1);
+
+	userq.list_in_out.op = AMDGPU_USERQ_OP_LIST;
+	userq.list_in_out.num_entries = 1;
+	userq.list_in_out.entries = (uint64_t)&entry;
+	entry.mqd_size = 0;
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+	igt_assert_eq(ret, 0);
+	igt_assert_eq(userq.list_in_out.num_entries, 1);
+	if (ip_type == AMD_IP_COMPUTE)
+		igt_assert_eq(entry.mqd_size, sizeof(struct drm_amdgpu_userq_mqd_compute_gfx11));
+	else if (ip_type == AMD_IP_GFX)
+		igt_assert_eq(entry.mqd_size, sizeof(struct drm_amdgpu_userq_mqd_gfx11));
+	else if (ip_type == AMD_IP_DMA)
+		igt_assert_eq(entry.mqd_size, sizeof(struct drm_amdgpu_userq_mqd_sdma_gfx11));
+
+	userq.list_in_out.op = AMDGPU_USERQ_OP_LIST;
+	userq.list_in_out.num_entries = 1;
+	userq.list_in_out.entries = (uint64_t)&entry;
+	/* mqd pointer is NULL, should EFAULT */
+	entry.mqd_data = 0;
+
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+	igt_assert(ret != 0);
+	igt_assert(errno == EFAULT);
+
+	ip_block->funcs->userq_destroy(device, &ring_context, ip_block->type);
+}
+
+static void
+test_change_handle(amdgpu_device_handle device, int fd, const struct amdgpu_gpu_info *gpu_info, int ip_type)
+{
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device, ip_type);
+	struct amdgpu_ring_context ring_context = {0};
+	int queue_id, new_queue_id, ret;
+
+	/* create a queue */
+	ip_block->funcs->userq_create(device, &ring_context, ip_block->type);
+
+	/* change its queue id */
+	queue_id = ring_context.queue_id;
+	new_queue_id = queue_id + 1;
+
+	ret = amd_userq_change(fd, queue_id, new_queue_id);
+	igt_assert_eq(ret, 0);
+
+	/* try to free with old queue id (should fail) */
+	ret = amd_userq_free(fd, queue_id);
+	igt_assert_neq(ret, 0);
+	igt_assert_eq(errno, ENOENT);
+
+	/* free with new queue id (should succeed) */
+	ret = amd_userq_free(fd, new_queue_id);
+	igt_assert_eq(ret, 0);
+}
+
+static void
+test_change_invalid_old(amdgpu_device_handle device, int fd, const struct amdgpu_gpu_info *gpu_info)
+{
+	int ret;
+
+	/* Attempt to change a queue that doesn't exist */
+	ret = amd_userq_change(fd, 0xDEAD, 0xBEEF);
+	igt_assert(ret != 0);
+	igt_assert(errno == EINVAL);
+}
+
+static void
+test_change_new_handle_occupied(amdgpu_device_handle device, int fd, const struct amdgpu_gpu_info *gpu_info, int ip_type)
+{
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device, ip_type);
+	struct amdgpu_ring_context ring_context_1 = {0}, ring_context_2 = {0};
+	int queue_id_1, queue_id_2, ret;
+
+	ip_block->funcs->userq_create(device, &ring_context_1, ip_block->type);
+
+	queue_id_1 = ring_context_1.queue_id;
+
+	ip_block->funcs->userq_create(device, &ring_context_2, ip_block->type);
+
+	queue_id_2 = ring_context_2.queue_id;
+
+	/* Changing a queue to an id already in use gives EBUSY; both queues should be unaffected */
+	ret = amd_userq_change(fd, queue_id_1, queue_id_2);
+	igt_assert(ret != 0);
+	igt_assert(errno == EBUSY);
+
+	ret = amd_userq_free(fd, queue_id_1);
+	igt_assert_eq(ret, 0);
+
+	ret = amd_userq_free(fd, queue_id_2);
+	igt_assert_eq(ret, 0);
+}
+
+static void
+test_change_new_handle_zero(amdgpu_device_handle device, int fd, const struct amdgpu_gpu_info *gpu_info, int ip_type)
+{
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device, ip_type);
+	struct amdgpu_ring_context ring_context = {0};
+	int queue_id, ret;
+
+	ip_block->funcs->userq_create(device, &ring_context, ip_block->type);
+
+	queue_id = ring_context.queue_id;
+
+	/* 0 is not a valid queue id */
+	ret = amd_userq_change(fd, queue_id, 0);
+	igt_assert(ret != 0);
+	igt_assert(errno == EINVAL);
+
+	ret = amd_userq_free(fd, queue_id);
+	igt_assert_eq(ret, 0);
+}
+
+static void
+test_change_new_handle_too_big(amdgpu_device_handle device, int fd, const struct amdgpu_gpu_info *gpu_info, int ip_type)
+{
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device, ip_type);
+	struct amdgpu_ring_context ring_context = {0};
+	int queue_id, ret;
+
+	ip_block->funcs->userq_create(device, &ring_context, ip_block->type);
+
+	queue_id = ring_context.queue_id;
+
+	/* The maximum queue ID is 512 */
+	ret = amd_userq_change(fd, queue_id, 10000);
+	igt_assert(ret != 0);
+	igt_assert(errno == EINVAL);
+
+	ret = amd_userq_free(fd, queue_id);
+	igt_assert_eq(ret, 0);
+}
+
+struct change_id_thread_data {
+	int fd;
+	uint32_t ids[4];
+	bool running;
+	int ip_type;
+	int unexpected_errno;
+	amdgpu_device_handle device;
+	pthread_barrier_t barrier;
+};
+
+static void set_up_context(struct change_id_thread_data *data, amdgpu_device_handle device, int fd, int ip_type)
+{
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device, ip_type);
+	struct amdgpu_ring_context *ring_context_1, *ring_context_2;
+
+	ring_context_1 = calloc(1, sizeof(*ring_context_1));
+	igt_assert(ring_context_1);
+
+	ip_block->funcs->userq_create(device, ring_context_1, ip_block->type);
+
+	data->ids[0] = ring_context_1->queue_id;
+
+	ring_context_2 = calloc(1, sizeof(*ring_context_2));
+	igt_assert(ring_context_2);
+
+	ip_block->funcs->userq_create(device, ring_context_2, ip_block->type);
+
+	data->ids[1] = ring_context_2->queue_id;
+
+	igt_assert(data->ids[0] != 0);
+	igt_assert(data->ids[1] != 0);
+
+	data->fd = fd;
+	data->ip_type = ip_type;
+	data->device = device;
+	data->ids[2] = max(data->ids[0], data->ids[1]) + 0x10;
+	data->ids[3] = max(data->ids[0], data->ids[1]) + 0x20;
+	data->unexpected_errno = 0;
+	__atomic_store_n(&data->running, true, __ATOMIC_RELEASE);
+
+	pthread_barrier_init(&data->barrier, NULL, 2);
+}
+
+static void *change_id_thread(void *arg)
+{
+	struct change_id_thread_data *data = arg;
+	uint32_t *h = data->ids;
+	int ret;
+
+	pthread_barrier_wait(&data->barrier);
+
+	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
+		int from = h[rand() % 4];
+		int to = h[rand() % 4];
+
+		ret = amd_userq_change(data->fd, from, to);
+		/*
+		 * Expected errors:
+		 * - EINVAL: old id invalid
+		 * - EBUSY: target id occupied
+		 */
+		if (ret != 0 && errno != EINVAL && errno != EBUSY && from != to)
+			data->unexpected_errno = errno;
+
+		sched_yield();
+	}
+
+	return NULL;
+}
+
+static void *close_recreate_thread(void *arg)
+{
+	struct change_id_thread_data *data = arg;
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(data->device, data->ip_type);
+	struct amdgpu_ring_context ring_context;
+	union drm_amdgpu_userq userq;
+	uint32_t *h = data->ids;
+	int id, ret, i = 0;
+
+	pthread_barrier_wait(&data->barrier);
+
+	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
+		/* Close a queue; keep trying until success */
+		while (true) {
+			memset(&userq, 0, sizeof(userq));
+			ret = amd_userq_free(data->fd, h[i]);
+			if (ret == 0)
+				break;
+
+			i = (i + 1) % 4;
+
+			if (!__atomic_load_n(&data->running, __ATOMIC_ACQUIRE))
+				return NULL;
+		}
+
+		/* Create a queue */
+		memset(&ring_context, 0, sizeof(ring_context));
+
+		ip_block->funcs->userq_create(data->device, &ring_context, ip_block->type);
+
+		id = ring_context.queue_id;
+
+		/* If the opened id isn't one of the four ones being
+		 * shuffled, change it in. Keep trying until success.
+		 */
+		if (id != h[0] && id != h[1] && id != h[2] && id != h[3]) {
+			while (true) {
+				memset(&userq, 0, sizeof(userq));
+
+				ret = amd_userq_change(data->fd, id, h[i]);
+				if (ret == 0)
+					break;
+
+				if (ret != 0 && errno != EINVAL && errno != EBUSY)
+					data->unexpected_errno = errno;
+
+				i = (i + 1) % 4;
+
+				if (!__atomic_load_n(&data->running, __ATOMIC_ACQUIRE))
+					return NULL;
+			}
+		}
+
+		sched_yield();
+	}
+
+	return NULL;
+}
+
+static void test_race_change_change(amdgpu_device_handle device, int fd, int ip_type)
+{
+	pthread_t thread_change_1, thread_change_2;
+	struct change_id_thread_data data = {0};
+	int num_ids, ret;
+
+	set_up_context(&data, device, fd, ip_type);
+
+	/* Start both threads simultaneously */
+	igt_assert_eq(pthread_create(&thread_change_1, NULL, change_id_thread, &data), 0);
+	igt_assert_eq(pthread_create(&thread_change_2, NULL, change_id_thread, &data), 0);
+
+	/* Let them race */
+	sleep(RACE_DURATION_SEC);
+
+	__atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
+	pthread_join(thread_change_1, NULL);
+	pthread_join(thread_change_2, NULL);
+
+	pthread_barrier_destroy(&data.barrier);
+
+	igt_assert_eq(data.unexpected_errno, 0);
+
+	/* Exactly two queues should still exist */
+	num_ids = 0;
+	for (int i = 0; i < 4; i++) {
+		ret = amd_userq_free(fd, data.ids[i]);
+
+		if (ret == 0) {
+			num_ids += 1;
+		} else {
+			igt_assert_eq(errno, ENOENT);
+		}
+	}
+	igt_assert_eq(num_ids, 2);
+}
+
+static void test_race_change_create_free(amdgpu_device_handle device, int fd, int ip_type)
+{
+	pthread_t thread_change, thread_close_create;
+	struct change_id_thread_data data = {0};
+	int num_ids, ret;
+
+	set_up_context(&data, device, fd, ip_type);
+
+	/* Start both threads simultaneously */
+	igt_assert_eq(pthread_create(&thread_change, NULL, change_id_thread, &data), 0);
+	igt_assert_eq(pthread_create(&thread_close_create, NULL, close_recreate_thread, &data), 0);
+
+	/* Let them race */
+	sleep(RACE_DURATION_SEC);
+
+	__atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
+	pthread_join(thread_change, NULL);
+	pthread_join(thread_close_create, NULL);
+
+	pthread_barrier_destroy(&data.barrier);
+
+	igt_assert_eq(data.unexpected_errno, 0);
+
+	/* Depending on where the close - open thread was when it exited, one or two queues may exist */
+	num_ids = 0;
+	for (int i = 0; i < 4; i++) {
+		ret = amd_userq_free(fd, data.ids[i]);
+
+		if (ret == 0) {
+			num_ids += 1;
+		} else {
+			igt_assert_eq(errno, ENOENT);
+		}
+	}
+	igt_assert(num_ids >= 1 && num_ids <= 2);
+}
+
+int igt_main()
+{
+	const char *env = getenv("AMDGPU_ENABLE_USERQTEST");
+	struct amdgpu_gpu_info gpu_info = {0};
+	bool userq_arr_cap[AMD_IP_MAX] = {0};
+	amdgpu_device_handle device;
+	int fd, r;
+
+	igt_fixture() {
+		uint32_t major, minor;
+		int err;
+
+		fd = drm_open_driver(DRIVER_AMDGPU);
+		err = amdgpu_device_initialize(fd, &major, &minor, &device);
+		igt_require(err == 0);
+
+		r = amdgpu_query_gpu_info(device, &gpu_info);
+		igt_assert_eq(r, 0);
+
+		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
+		igt_assert_eq(r, 0);
+
+		asic_userq_readiness(device, userq_arr_cap);
+
+		igt_require(env && atoi(env));
+	}
+
+	igt_describe("Test AMDGPU_USERQ_LIST success case for a single compute queue");
+	igt_subtest("userq-list-compute") {
+		int ip_types[] = {AMD_IP_COMPUTE};
+		igt_require(userq_arr_cap[AMD_IP_COMPUTE]);
+		test_list_handles(device, fd, &gpu_info, ip_types, 1);
+	}
+
+	igt_describe("Test AMDGPU_USERQ_LIST success case for a single dma queue");
+	igt_subtest("userq-list-dma") {
+		int ip_types[] = {AMD_IP_DMA};
+		igt_require(userq_arr_cap[AMD_IP_DMA]);
+		test_list_handles(device, fd, &gpu_info, ip_types, 1);
+	}
+
+	igt_describe("Test AMDGPU_USERQ_LIST success case for a single gfx queue");
+	igt_subtest("userq-list-gfx") {
+		int ip_types[] = {AMD_IP_GFX};
+		igt_require(userq_arr_cap[AMD_IP_GFX]);
+		test_list_handles(device, fd, &gpu_info, ip_types, 1);
+	}
+
+	igt_describe("Test AMDGPU_USERQ_LIST success case for four compute queues");
+	igt_subtest("userq-list-compute-multiple") {
+		int ip_types[] = {AMD_IP_COMPUTE, AMD_IP_COMPUTE, AMD_IP_COMPUTE, AMD_IP_COMPUTE};
+		igt_require(userq_arr_cap[AMD_IP_COMPUTE]);
+		test_list_handles(device, fd, &gpu_info, ip_types, 4);
+	}
+
+	igt_describe("Test AMDGPU_USERQ_LIST success case for four dma queues");
+	igt_subtest("userq-list-dma-multiple") {
+		int ip_types[] = {AMD_IP_DMA, AMD_IP_DMA, AMD_IP_DMA, AMD_IP_DMA};
+		igt_require(userq_arr_cap[AMD_IP_DMA]);
+		test_list_handles(device, fd, &gpu_info, ip_types, 4);
+	}
+
+	igt_describe("Test AMDGPU_USERQ_LIST success case for four gfx queues");
+	igt_subtest("userq-list-gfx-multiple") {
+		int ip_types[] = {AMD_IP_GFX, AMD_IP_GFX, AMD_IP_GFX, AMD_IP_GFX};
+		igt_require(userq_arr_cap[AMD_IP_GFX]);
+		test_list_handles(device, fd, &gpu_info, ip_types, 4);
+	}
+
+	igt_describe("Test AMDGPU_USERQ_LIST success case for three queues of different types");
+	igt_subtest("userq-list-mixed-multiple") {
+		int ip_types[] = {AMD_IP_GFX, AMD_IP_DMA, AMD_IP_COMPUTE};
+		igt_require(userq_arr_cap[AMD_IP_COMPUTE]);
+		igt_require(userq_arr_cap[AMD_IP_DMA]);
+		igt_require(userq_arr_cap[AMD_IP_GFX]);
+		test_list_handles(device, fd, &gpu_info, ip_types, 3);
+	}
+
+	igt_describe("Test AMDGPU_USERQ_LIST success case for no queues at all");
+	igt_subtest("userq-list-zero")
+		test_list_zero(device, fd, &gpu_info);
+
+	igt_describe("Test AMDGPU_USERQ_LIST fail case where user entries allocation is invalid");
+	igt_subtest("userq-list-bad-entries") {
+		igt_require(userq_arr_cap[AMD_IP_COMPUTE]);
+		test_list_bad_entries(device, fd, &gpu_info, AMD_IP_COMPUTE);
+	}
+
+	igt_describe("Test AMDGPU_USERQ_LIST fail case where user mqd allocation is invalid");
+	igt_subtest("userq-list-bad-mqd") {
+		igt_require(userq_arr_cap[AMD_IP_COMPUTE]);
+		test_list_bad_mqd(device, fd, &gpu_info, AMD_IP_COMPUTE);
+	}
+
+	igt_describe("Test AMDGPU_USERQ_CHANGE_ID for a single compute queue");
+	igt_subtest("userq-change-compute") {
+		igt_require(userq_arr_cap[AMD_IP_COMPUTE]);
+		test_change_handle(device, fd, &gpu_info, AMD_IP_COMPUTE);
+	}
+
+	igt_describe("Test AMDGPU_USERQ_CHANGE_ID fail case for changing a nonexistent queue");
+	igt_subtest("userq-change-invalid-old")
+		test_change_invalid_old(device, fd, &gpu_info);
+
+	igt_describe("Test AMDGPU_USERQ_CHANGE_ID failure changing to a new handle in use");
+	igt_subtest("userq-change-new-handle-occupied") {
+		igt_require(userq_arr_cap[AMD_IP_COMPUTE]);
+		test_change_new_handle_occupied(device, fd, &gpu_info, AMD_IP_COMPUTE);
+	}
+
+	igt_describe("Test AMDGPU_USERQ_CHANGE_ID changing a handle to zero");
+	igt_subtest("userq-change-new-handle-zero") {
+		igt_require(userq_arr_cap[AMD_IP_COMPUTE]);
+		test_change_new_handle_zero(device, fd, &gpu_info, AMD_IP_COMPUTE);
+	}
+
+	igt_describe("Test AMDGPU_USERQ_CHANGE_ID changing a handle to a value greater than the maximum queue id");
+	igt_subtest("userq-change-new-handle-too-big") {
+		igt_require(userq_arr_cap[AMD_IP_COMPUTE]);
+		test_change_new_handle_too_big(device, fd, &gpu_info, AMD_IP_COMPUTE);
+	}
+
+	igt_describe("Race condition test: AMDGPU_USERQ_CHANGE_ID vs itself");
+	igt_subtest("userq-race-change-change") {
+		igt_require(userq_arr_cap[AMD_IP_COMPUTE]);
+		test_race_change_change(device, fd, AMD_IP_COMPUTE);
+	}
+
+	igt_describe("Race condition test: AMDGPU_USERQ_CHANGE_ID vs create / free queues");
+	igt_subtest("userq-race-change-create-free") {
+		igt_require(userq_arr_cap[AMD_IP_COMPUTE]);
+		test_race_change_create_free(device, fd, AMD_IP_COMPUTE);
+	}
+
+	igt_fixture() {
+		amdgpu_device_deinitialize(device);
+		drm_close_driver(fd);
+	}
+}
\ No newline at end of file
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 08206f8c8..24f7a3ba0 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -41,6 +41,7 @@ if libdrm_amdgpu.found()
 			  'amd_ras',
 			  'amd_replay',
 			  'amd_security',
+			  'amd_userq',
 			  'amd_uvd_dec',
 			  'amd_uvd_enc',
 			  'amd_vce_enc',
-- 
2.34.1

