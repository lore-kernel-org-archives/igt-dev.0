Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54B0606A31A
	for <igt-dev@archiver.kernel.org>; Tue, 27 Oct 2026 14:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EZu8wCAF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657B710F58A;
	Tue, 27 Oct 2026 14:07:52 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011016.outbound.protection.outlook.com [52.101.57.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DA710F56B
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Oct 2026 14:06:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qH3luJwi+Dac/92FxPCuB/6zr7qqEtAkwSUtuCz0iuk+28Iu6Kgu1SzqZOwIzI9TpY0dqn72BYTrzdfYMZ6wYzL/8M/Gu92ZfQmskjuHCUWnemB/Fs6SZzk7iac8HVdDS5xihOeo1XqC1nsfkPWCS9CNUF1A7OHrem+TF9l49u5DtTj0H5IlXXGnaCP7pfHAGugs2mr/cMh1CYIUOpotEGKl847JbeOL17O0JLFXiAiUvdpmLhwNyxLwIYX0rVgno11wkQj1kSgksJgIeDtydm1TvXadF9/NuYiPyI3ZvlcnXLikl630hFBEbqPRcKUQ0yMVHUN4Sw7Pjcp1Rt5JiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKA+YvRiZGIbz288IUtDK2v+lBYtjO2tYX2mWJlzFWs=;
 b=YlKOYJut0UBgOL8yuoiHkLRdeE3nJZGaikea8q/dBr6Dzx/rwX+ugZG9NUKBzdZ207mksL8ski6Iwr0t8iQHVuRFkgIz+aeEC0vYOVE3cGZ5n/Qu8HgXIO0woJsiqQdGsDGUNLI+EQLOmXo6O7Y+fo//plH0jmHHKcYf5ANDDFrUP83VjXwl+7KpPr4YdyM235IIajkqXEt8G1gHdfs1ifIJSkb64+n6rakudUPqYgycWbH0k1d1GV7HS815I4e0xteKUlf54CdX5606LO93GakthhPyBuxVlzl/ldogaEfC5L3Eb2WCkv122uabyxRJ/GT0GSFFzgBcf5Ds1dOo2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKA+YvRiZGIbz288IUtDK2v+lBYtjO2tYX2mWJlzFWs=;
 b=EZu8wCAF/mBCiVnItyRUvGukV8dLouquB0d/BQDCUDRks511N0vdVyjYVYLdxIkkG/CVhYz4+O5OFCccBQCjizkB4eOMowdyIanVRQq4LpFhlZamnnaVmRqs77694ByOt5qbwZ+kZSc/osGpgsRFauUPbpuQSV/T5me2icnooZg=
Received: from PH5P222CA0003.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::17)
 by CY5PR12MB6324.namprd12.prod.outlook.com (2603:10b6:930:f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 14:06:47 +0000
Received: from CY7PEPF000000EA.namprd04.prod.outlook.com
 (2603:10b6:510:34b:cafe::a1) by PH5P222CA0003.outlook.office365.com
 (2603:10b6:510:34b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 14:06:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY7PEPF000000EA.mail.protection.outlook.com (10.167.247.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 14:06:47 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 27 Oct
 2026 09:06:46 -0500
From: David Francis <David.Francis@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <tursulin@ursulin.net>, David Francis <David.Francis@amd.com>
Subject: [PATCH v2] tests/amdgpu: Tests for amdgpu userq list and change
Date: Tue, 27 Oct 2026 10:06:33 -0400
Message-ID: <20261027140633.2184445-1-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000EA:EE_|CY5PR12MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: 31573398-3454-44c0-a0d0-08df343389db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|261026140227099003|261021123027099003|11063799006|56012099006|261009223027099003|261022075727099003|261022105027099003|261009221227099003|10067099003|261021121427099003|18002099003|261026121527099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: iyWcuqrppyFNZhmFnU8r1Wggd5xABbx4KlzG+f8htj4n/vQnAUgF/Rgks+MqWtqhOhy8Z2uEuy+wM0MFNfMUMayyCX8AgH2posD20nlgkyvKgGs4xZ6ZYCpEP1tfvgjd1omd7F4146brB6Q6AAXtsFwLPIs0gBU5Uq6VQxBVy77upzE7PoFRs2NIMl1mq/duVK+pnFspZ+eedNWIZjte6CNjou3ZFec8StlUgee2oVbxOGM7SFcYWxPtRbL11WAYibYBiUV+O4I3vuvRABhWcyT7tnYbJKMJMmTQpJ8Kk4Wjmsm4GBKuqFTs/XEKUGrmQcb+wOIgXBsAOlzIHvqcIWKulDQKOl//mu/783p3L60uFyTIlhemnsJD9D7205/sJ1J8qyK7vNZnoD9c5s9w3d7PiKfOF7irx85dpLfLpTxB1Z9W9ddmYUH+CgQkHSGxbj1tTRa+79uUn4SVFTYE1MENZn5HiyAi7TSWDdvc6UaPlEJF3KMv9iQXXDRqNNtw31nAZlupHMRrj2ICFsfylngJ51OJkbPRp7nHbnIQr3/pYeQLLRjpYvwcu2NrA5jyS55lrGfIT6JU2uHeQG2cM1xI/S/AW6IwhEg1MOUln0c34BbRGDRnSBKZozO/MHBj4qDJjPutgrLA3RojyE9JqwcPeG1k4GmPppAlSnHs/b8k8B4OS6U4PSVe2NEfYhL/4AWY/cFN93VertwiC9K9Lw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(261026140227099003)(261021123027099003)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261022105027099003)(261009221227099003)(10067099003)(261021121427099003)(18002099003)(261026121527099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: l8zvWcOsjaVtkysCowXWTMqReaENgueLg7KR8V2xNVvTqmZI0nIpdHHmqlmQ4M8q3i65s9A4SDHjMYT4+gq+L11hkNNSqyl08mqNOZbm2dCZguRDIBwgslReOUiO0MKUWeYHBK9zBnjDfCOWbEULwshbjnjJqpJWIF008IxfZNOakpQZOWNez4xQee8gt9NM0LInQkPI3dFIjSNUUcT/40/erYEi9ZZ7RTysKl9YM1mDK1S1ip//fff/KOBk4by41RTmvUDV/zh1A/LwK3fE5DerdWnk1PtSC0/dJb0yv15jgt9wSYZKPl9FxDG8WY8M9LmojYjf9qTl4aq+4Ix+wmXLxVykBmzYNZ8InbZ/CexB1GwbKTlE78FBmg4jvaxyoIzlW9nN9sgS9365DzEpmrYnSg5BycptMqB6KnL8gRo9TivF7EH/Fp2T048g4okt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 14:06:47.0112 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31573398-3454-44c0-a0d0-08df343389db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY7PEPF000000EA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6324
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Two new amdgpu userq interfaces are being added -
AMDGPU_USERQ_OP_LIST and AMDGPU_USERQ_OP_CHANGE_ID.

Add tests for edge cases and race conditions

v2: Various fixes and clarifications

Signed-off-by: David Francis <David.Francis@amd.com>
---
 include/drm-uapi/amdgpu_drm.h |  58 ++-
 tests/amdgpu/amd_userq.c      | 807 ++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build      |   1 +
 3 files changed, 864 insertions(+), 2 deletions(-)
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
index 000000000..062d1b2ca
--- /dev/null
+++ b/tests/amdgpu/amd_userq.c
@@ -0,0 +1,807 @@
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
+#include "lib/amdgpu/amd_userq.h"
+#include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_PM4.h"
+#include "lib/amdgpu/compute_utils/amd_dispatch.h"
+#include "lib/amdgpu/compute_utils/amd_dispatch_helpers.h"
+#include "lib/amdgpu/shaders/amd_shaders.h"
+#include "lib/amdgpu/compute_utils/amd_shared_dispatch.h"
+
+#define RACE_DURATION_SEC 1
+
+static void
+test_list_handles(amdgpu_device_handle device, int fd, const struct amdgpu_gpu_info *gpu_info, int ip_type)
+{
+	struct amdgpu_ring_context ring_context = {0};
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device, ip_type);
+	union drm_amdgpu_userq userq;
+	struct drm_amdgpu_userq_list_entry entry = {0};
+	struct drm_amdgpu_userq_mqd_compute_gfx11 compute_mqd = {0};
+	struct drm_amdgpu_userq_mqd_gfx11 gfx_mqd = {0};
+	struct drm_amdgpu_userq_mqd_sdma_gfx11 sdma_mqd = {0};
+	int ret;
+
+	/* Create queue */
+	ip_block->funcs->userq_create(device, &ring_context, ip_block->type);
+
+	/* List with num_entries less than number of queues, gives number of queues */
+	userq.list_in_out.op = AMDGPU_USERQ_OP_LIST;
+	userq.list_in_out.num_entries = 0;
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+	igt_assert_eq(ret, 0);
+	igt_assert_eq(userq.list_in_out.num_entries, 1);
+
+	/* List with correct number of entries but mqd size 0, gives mqd size */
+	userq.list_in_out.op = AMDGPU_USERQ_OP_LIST;
+	userq.list_in_out.num_entries = 1;
+	userq.list_in_out.entries = (uint64_t)&entry;
+	entry.mqd_size = 0;
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+	igt_assert_eq(ret, 0);
+	igt_assert_eq(userq.list_in_out.num_entries, 1);
+	if (ip_type == AMD_IP_COMPUTE) {
+		igt_assert_eq(entry.mqd_size, sizeof(struct drm_amdgpu_userq_mqd_compute_gfx11));
+	} else if (ip_type == AMD_IP_GFX) {
+		igt_assert_eq(entry.mqd_size, sizeof(struct drm_amdgpu_userq_mqd_gfx11));
+	} else if (ip_type == AMD_IP_DMA) {
+		igt_assert_eq(entry.mqd_size, sizeof(struct drm_amdgpu_userq_mqd_sdma_gfx11));
+	}
+
+	/* List with correct number of entries and mqd size, gives queue information */
+	userq.list_in_out.op = AMDGPU_USERQ_OP_LIST;
+	userq.list_in_out.num_entries = 1;
+	userq.list_in_out.entries = (uint64_t)&entry;
+	if (ip_type == AMD_IP_COMPUTE) {
+		entry.mqd_size = sizeof(struct drm_amdgpu_userq_mqd_compute_gfx11);
+		entry.mqd_data = (uint64_t)&compute_mqd;
+	} else if (ip_type == AMD_IP_GFX) {
+		entry.mqd_size = sizeof(struct drm_amdgpu_userq_mqd_gfx11);
+		entry.mqd_data = (uint64_t)&gfx_mqd;
+	} else if (ip_type == AMD_IP_DMA) {
+		entry.mqd_size = sizeof(struct drm_amdgpu_userq_mqd_sdma_gfx11);
+		entry.mqd_data = (uint64_t)&sdma_mqd;
+	}
+
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+	igt_assert_eq(ret, 0);
+
+	igt_assert(entry.queue_id > 0);
+	igt_assert_eq(entry.ip_type, ip_type);
+	igt_assert(entry.doorbell_handle > 0);
+	igt_assert_eq(entry.flags, 0);
+
+	igt_assert(entry.queue_va > 0);
+	igt_assert_eq(entry.queue_size, 0x100000);
+	igt_assert(entry.rptr_va > 0);
+	igt_assert(entry.wptr_va > 0);
+
+	if (ip_type == AMD_IP_COMPUTE) {
+		igt_assert(compute_mqd.eop_va > 0);
+	} else if (ip_type == AMD_IP_GFX) {
+		igt_assert(gfx_mqd.shadow_va > 0);
+		igt_assert(gfx_mqd.csa_va > 0);
+	} else if (ip_type == AMD_IP_DMA) {
+		igt_assert(sdma_mqd.csa_va > 0);
+	}
+
+	ip_block->funcs->userq_destroy(device, &ring_context, ip_block->type);
+}
+
+static void
+test_list_handles_multiple(amdgpu_device_handle device, int fd, const struct amdgpu_gpu_info *gpu_info, int ip_type, int num_qs)
+{
+	struct amdgpu_ring_context *ring_contexts;
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device, ip_type);
+	union drm_amdgpu_userq userq;
+	struct drm_amdgpu_userq_list_entry *entries;
+	struct drm_amdgpu_userq_mqd_compute_gfx11 *compute_mqds;
+	struct drm_amdgpu_userq_mqd_gfx11 *gfx_mqds;
+	struct drm_amdgpu_userq_mqd_sdma_gfx11 *sdma_mqds;
+	int ret, i;
+
+	ring_contexts = calloc(num_qs, sizeof(struct amdgpu_ring_context));
+	igt_assert(ring_contexts);
+
+	entries = calloc(num_qs, sizeof(struct drm_amdgpu_userq_list_entry));
+	igt_assert(entries);
+
+	if (ip_type == AMD_IP_COMPUTE) {
+		compute_mqds = calloc(num_qs, sizeof(struct drm_amdgpu_userq_mqd_compute_gfx11));
+		igt_assert(compute_mqds);
+	} else if (ip_type == AMD_IP_GFX) {
+		gfx_mqds = calloc(num_qs, sizeof(struct drm_amdgpu_userq_mqd_gfx11));
+		igt_assert(gfx_mqds);
+	} else if (ip_type == AMD_IP_DMA) {
+		sdma_mqds = calloc(num_qs, sizeof(struct drm_amdgpu_userq_mqd_sdma_gfx11));
+		igt_assert(sdma_mqds);
+	}
+
+	/* Create queues */
+	for (i = 0; i < num_qs; i++)
+		ip_block->funcs->userq_create(device, &ring_contexts[i], ip_block->type);
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
+		if (ip_type == AMD_IP_COMPUTE) {
+			igt_assert_eq(entries[i].mqd_size, sizeof(struct drm_amdgpu_userq_mqd_compute_gfx11));
+		} else if (ip_type == AMD_IP_GFX) {
+			igt_assert_eq(entries[i].mqd_size, sizeof(struct drm_amdgpu_userq_mqd_gfx11));
+		} else if (ip_type == AMD_IP_DMA) {
+			igt_assert_eq(entries[i].mqd_size, sizeof(struct drm_amdgpu_userq_mqd_sdma_gfx11));
+		}
+	}
+
+	/* List with correct number of entries and mqd size, gives queue information */
+	userq.list_in_out.op = AMDGPU_USERQ_OP_LIST;
+	userq.list_in_out.num_entries = num_qs;
+	userq.list_in_out.entries = (uint64_t)entries;
+	for (i = 0; i < num_qs; i++) {
+		if (ip_type == AMD_IP_COMPUTE) {
+			entries[i].mqd_size = sizeof(struct drm_amdgpu_userq_mqd_compute_gfx11);
+			entries[i].mqd_data = (uint64_t)&compute_mqds[i];
+			//the other compute mqd fields, and also retry for cu mask
+		} else if (ip_type == AMD_IP_GFX) {
+			entries[i].mqd_size = sizeof(struct drm_amdgpu_userq_mqd_gfx11);
+			entries[i].mqd_data = (uint64_t)&gfx_mqds[i];
+		} else if (ip_type == AMD_IP_DMA) {
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
+		igt_assert_eq(entries[i].ip_type, ip_type);
+		igt_assert(entries[i].doorbell_handle > 0);
+		igt_assert_eq(entries[i].flags, 0);
+
+		igt_assert(entries[i].queue_va > 0);
+		igt_assert_eq(entries[i].queue_size, 0x100000);
+		igt_assert(entries[i].rptr_va > 0);
+		igt_assert(entries[i].wptr_va > 0);
+
+		if (ip_type == AMD_IP_COMPUTE) {
+			igt_assert(compute_mqds[i].eop_va > 0);
+		} else if (ip_type == AMD_IP_GFX) {
+			igt_assert(gfx_mqds[i].shadow_va > 0);
+			igt_assert(gfx_mqds[i].csa_va > 0);
+		} else if (ip_type == AMD_IP_DMA) {
+			igt_assert(sdma_mqds[i].csa_va > 0);
+		}
+
+		ip_block->funcs->userq_destroy(device, &ring_contexts[i], ip_block->type);
+	}
+
+	free(ring_contexts);
+	free(entries);
+	if (ip_type == AMD_IP_COMPUTE)
+		free(compute_mqds);
+	else if (ip_type == AMD_IP_GFX)
+		free(gfx_mqds);
+	else if (ip_type == AMD_IP_DMA)
+		free(sdma_mqds);
+
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
+	struct amdgpu_ring_context ring_context = {0};
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device, ip_type);
+	union drm_amdgpu_userq userq;
+	int ret;
+
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
+	struct amdgpu_ring_context ring_context = {0};
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device, ip_type);
+	union drm_amdgpu_userq userq;
+	struct drm_amdgpu_userq_list_entry entry = {0};
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
+	if (ip_type == AMD_IP_COMPUTE) {
+		igt_assert_eq(entry.mqd_size, sizeof(struct drm_amdgpu_userq_mqd_compute_gfx11));
+	} else if (ip_type == AMD_IP_GFX) {
+		igt_assert_eq(entry.mqd_size, sizeof(struct drm_amdgpu_userq_mqd_gfx11));
+	} else if (ip_type == AMD_IP_DMA) {
+		igt_assert_eq(entry.mqd_size, sizeof(struct drm_amdgpu_userq_mqd_sdma_gfx11));
+	}
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
+	struct amdgpu_ring_context ring_context = {0};
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device, ip_type);
+	union drm_amdgpu_userq userq;
+	int queue_id, new_queue_id, ret;
+
+	/* create a queue */
+	ip_block->funcs->userq_create(device, &ring_context, ip_block->type);
+
+	/* change its queue id */
+	queue_id = ring_context->queue_id;
+	new_queue_id = queue_id + 1;
+
+	userq.change_in.op = AMDGPU_USERQ_OP_CHANGE_ID;
+	userq.change_in.queue_id = queue_id;
+	userq.change_in.new_queue_id = new_queue_id;
+
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+	igt_assert_eq(ret, 0);
+
+	/* try to free with old queue id (should fail) */
+	memset(&userq, 0, sizeof(userq));
+	userq.in.op = AMDGPU_USERQ_OP_FREE;
+	userq.in.queue_id = queue_id;
+
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+	igt_assert_neq(ret, 0);
+	igt_assert_eq(errno, ENOENT);
+
+	/* free with new queue id (should succeed) */
+	memset(&userq, 0, sizeof(userq));
+	userq.in.op = AMDGPU_USERQ_OP_FREE;
+	userq.in.queue_id = new_queue_id;
+
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+	igt_assert_eq(ret, 0);
+}
+
+static void
+test_change_invalid_old(amdgpu_device_handle device, int fd, const struct amdgpu_gpu_info *gpu_info)
+{
+	union drm_amdgpu_userq userq;
+	int ret;
+
+	/* Attempt to change a queue that doesn't exist */
+	userq.change_in.op = AMDGPU_USERQ_OP_CHANGE_ID;
+	userq.change_in.queue_id = 0xDEAD;
+	userq.change_in.new_queue_id = 0xBEEF;
+
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+	igt_assert(ret != 0);
+	igt_assert(errno == EINVAL);
+}
+
+static void
+test_change_new_handle_occupied(amdgpu_device_handle device, int fd, const struct amdgpu_gpu_info *gpu_info, int ip_type)
+{
+	struct amdgpu_ring_context ring_context_1 = {0}, ring_context_2 = {0};
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device, ip_type);
+	union drm_amdgpu_userq userq;
+	int queue_id_1, queue_id_2, ret;
+
+
+	ip_block->funcs->userq_create(device, &ring_context_1, ip_block->type);
+
+	queue_id_1 = ring_context_1.queue_id;
+
+	ip_block->funcs->userq_create(device, &ring_context_2, ip_block->type);
+
+	queue_id_2 = ring_context_2.queue_id;
+
+	userq.change_in.op = AMDGPU_USERQ_OP_CHANGE_ID;
+	userq.change_in.queue_id = queue_id_1;
+	userq.change_in.new_queue_id = queue_id_2;
+
+	/* Changing a queue to an id already in use gives EBUSY; both queues should be unaffected */
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+	igt_assert(ret != 0);
+	igt_assert(errno == EBUSY);
+
+	memset(&userq, 0, sizeof(userq));
+	userq.in.op = AMDGPU_USERQ_OP_FREE;
+	userq.in.queue_id = queue_id_1;
+
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+	igt_assert_eq(ret, 0);
+
+	memset(&userq, 0, sizeof(userq));
+	userq.in.op = AMDGPU_USERQ_OP_FREE;
+	userq.in.queue_id = queue_id_2;
+
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+	igt_assert_eq(ret, 0);
+}
+
+static void
+test_change_new_handle_zero(amdgpu_device_handle device, int fd, const struct amdgpu_gpu_info *gpu_info, int ip_type)
+{
+	struct amdgpu_ring_context ring_context = {0};
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device, ip_type);
+	union drm_amdgpu_userq userq;
+	int queue_id, ret;
+
+	ip_block->funcs->userq_create(device, &ring_context, ip_block->type);
+
+	queue_id = ring_context.queue_id;
+
+	userq.change_in.op = AMDGPU_USERQ_OP_CHANGE_ID;
+	userq.change_in.queue_id = queue_id;
+	/* 0 is not a valid queue id */
+	userq.change_in.new_queue_id = 0;
+
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+	igt_assert(ret != 0);
+	igt_assert(errno == EINVAL);
+
+	memset(&userq, 0, sizeof(userq));
+	userq.in.op = AMDGPU_USERQ_OP_FREE;
+	userq.in.queue_id = queue_id;
+
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+	igt_assert_eq(ret, 0);
+}
+
+static void
+test_change_new_handle_too_big(amdgpu_device_handle device, int fd, const struct amdgpu_gpu_info *gpu_info, int ip_type)
+{
+	struct amdgpu_ring_context ring_context = {0};
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device, ip_type);
+	union drm_amdgpu_userq userq;
+	int queue_id, ret;
+
+	ip_block->funcs->userq_create(device, &ring_context, ip_block->type);
+
+	queue_id = ring_context.queue_id;
+
+	userq.change_in.op = AMDGPU_USERQ_OP_CHANGE_ID;
+	userq.change_in.queue_id = queue_id;
+	/* The maximum queue ID is 512 */
+	userq.change_in.new_queue_id = 10000;
+
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+	igt_assert(ret != 0);
+	igt_assert(errno == EINVAL);
+
+	memset(&userq, 0, sizeof(userq));
+	userq.in.op = AMDGPU_USERQ_OP_FREE;
+	userq.in.queue_id = queue_id;
+
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
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
+	struct amdgpu_ring_context *ring_context_1, *ring_context_2;
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device, ip_type);
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
+	union drm_amdgpu_userq userq;
+	uint32_t *h = data->ids;
+	uint32_t from[] = {h[0], h[2], h[0], h[3], h[3], h[1], h[1], h[3], h[2], h[1], h[0], h[2]};
+	uint32_t to[] =   {h[1], h[3], h[2], h[1], h[0], h[2], h[0], h[2], h[0], h[3], h[3], h[1]};
+	int ret;
+
+	pthread_barrier_wait(&data->barrier);
+
+	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
+		for (int i = 0; i < 12; i++) {
+			userq.change_in.op = AMDGPU_USERQ_OP_CHANGE_ID;
+			userq.change_in.queue_id = from[i];
+			userq.change_in.new_queue_id = to[i];
+
+			ret = ioctl(data->fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+			/*
+			 * Expected errors:
+			 * - EINVAL: old id invalid
+			 * - EBUSY: target id occupied
+			 */
+			if (ret != 0 && errno != EINVAL && errno != EBUSY)
+				data->unexpected_errno = errno;
+		}
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
+	int id, i, ret;
+
+	pthread_barrier_wait(&data->barrier);
+
+	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
+		/* Close a queue; keep trying until success */
+		i = 0;
+		while (true) {
+			memset(&userq, 0, sizeof(userq));
+			userq.in.op = AMDGPU_USERQ_OP_FREE;
+			userq.in.queue_id = h[i];
+			ret = ioctl(data->fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+			if (ret == 0)
+				break;
+
+			i += 1;
+			if (i > 3)
+				i = 0;
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
+			i = 0;
+			while (true) {
+				memset(&userq, 0, sizeof(userq));
+				userq.change_in.op = AMDGPU_USERQ_OP_CHANGE_ID;
+				userq.change_in.queue_id = id;
+				userq.change_in.new_queue_id = h[i];
+
+				ret = ioctl(data->fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
+				if (ret == 0)
+					break;
+
+				if (ret != 0 && errno != EINVAL && errno != EBUSY)
+					data->unexpected_errno = errno;
+
+				i += 1;
+				if (i > 3)
+					i = 0;
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
+	union drm_amdgpu_userq userq;
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
+		memset(&userq, 0, sizeof(userq));
+		userq.in.op = AMDGPU_USERQ_OP_FREE;
+		userq.in.queue_id = data.ids[i];
+		ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
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
+	union drm_amdgpu_userq userq;
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
+		memset(&userq, 0, sizeof(userq));
+		userq.in.op = AMDGPU_USERQ_OP_FREE;
+		userq.in.queue_id = data.ids[i];
+		ret = ioctl(fd, DRM_IOCTL_AMDGPU_USERQ, &userq);
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
+	bool enable_test = false;
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
+		igt_require(env && atoi(env))
+	}
+
+	igt_describe("Test AMDGPU_USERQ_LIST success case for a single compute queue");
+	igt_subtest("userq-list-compute") {
+		igt_require(userq_arr_cap[AMD_IP_COMPUTE]);
+		test_list_handles(device, fd, &gpu_info, AMD_IP_COMPUTE);
+	}
+
+	igt_describe("Test AMDGPU_USERQ_LIST success case for a single dma queue");
+	igt_subtest("userq-list-dma") {
+		igt_require(userq_arr_cap[AMD_IP_DMA]);
+		test_list_handles(device, fd, &gpu_info, AMD_IP_DMA);
+	}
+
+	igt_describe("Test AMDGPU_USERQ_LIST success case for a single gfx queue");
+	igt_subtest("userq-list-gfx") {
+		igt_require(userq_arr_cap[AMD_IP_GFX]);
+		test_list_handles(device, fd, &gpu_info, AMD_IP_GFX);
+	}
+
+	igt_describe("Test AMDGPU_USERQ_LIST success case for ten compute queues");
+	igt_subtest("userq-list-compute-multiple") {
+		igt_require(userq_arr_cap[AMD_IP_DMA]);
+		test_list_handles_multiple(device, fd, &gpu_info, AMD_IP_COMPUTE, 10);
+	}
+
+	igt_describe("Test AMDGPU_USERQ_LIST success case for ten dma queues");
+	igt_subtest("userq-list-dma-multiple") {
+		igt_require(userq_arr_cap[AMD_IP_DMA]);
+		test_list_handles_multiple(device, fd, &gpu_info, AMD_IP_DMA, 10);
+	}
+
+	igt_describe("Test AMDGPU_USERQ_LIST success case for ten gfx queues");
+	igt_subtest("userq-list-gfx-multiple") {
+		igt_require(userq_arr_cap[AMD_IP_DMA]);
+		test_list_handles_multiple(device, fd, &gpu_info, AMD_IP_GFX, 10);
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

