Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AD010F2870
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 21:06:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B15910E045;
	Fri, 27 Mar 2026 21:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qQ5RNJyr";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010029.outbound.protection.outlook.com [52.101.85.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443D910E045
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 21:06:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SKu6jIZVWYKI82Y6ZdIGvpKMGfwZHRLo54ISqUrdnxpesSRvtjlWABsdy+IOXFTycTFpX4NEgSb8Nu2bguygJlwYd9W273BVKMsItF6aA106aX6sYOXU+x6/bo4mz8XaiMow21utwU/MJrmsEYJ8WhYMtFFHwxil9h/zrDnfEVgPhnkMaY21rx4E0pTP5krccRGsouEDyd2gSnDxB5uLN0mIeZskDVxyTtMPZwAgiZizNIIc7hjUFZ7JuAA6KTMDs/zZ0VUi98wnutWrJOZX1XRaE0JVUlHyN5tGrZ9bR+opgLaKIq2mvO6wQbs/W53CUV/z4hX7yI/B7nH1tDiOZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnzeorRhrLJCovvRttUZbN05c2r3v4MVXowYCNUXWXg=;
 b=hLI5Wf7f7f4GE/YttkDH9zXMh+90yo1FkbJn0U9Q/0Y5giWPA0QqOY9dUP/nNE8F80itatoWUI9wI5jdoGzjih7gQdKa2VSjpko6TTJQttpTUpM18OupcuwjqG5jhvpEb1QZehtIiMFJTcv+A8FC0CpeZRymXL3u8MjP5bIobVUi0HTY9oCjn5Db25dMNlMynFEEjy+oZTRaFu64AV6+npddmE9YOAkGpLLGS7bj/aum5xvVCP3Ue13MRTjuOrSbYTzz/PujAjNPrFTyATXgOIwKZpebGEqfUM7MeDINDkROxo2VZbmIVp6QPLW5YkG+gWjMCFfMSjpSov5q70f46Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnzeorRhrLJCovvRttUZbN05c2r3v4MVXowYCNUXWXg=;
 b=qQ5RNJyrn0EJYMxdIZIX2qAUt44W6j5sJ9XnF3rQDvmmDclWtkEZqsHmDXYMBdiVwjQTmBIIWeCg4v4YCxkFLUFctpxniOSpud/eJJ8f0ifZZAD5hWGPsV1OittUwKQ6eU49ZyP1XE++kiBegwb5K/iuormyKCyHxZYenH7LyBw=
Received: from PH7P221CA0042.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::10)
 by DM6PR12MB4188.namprd12.prod.outlook.com (2603:10b6:5:215::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Fri, 27 Mar
 2026 21:06:08 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:510:33c:cafe::7a) by PH7P221CA0042.outlook.office365.com
 (2603:10b6:510:33c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.22 via Frontend Transport; Fri,
 27 Mar 2026 21:06:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 21:06:08 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 27 Mar
 2026 16:06:08 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 27 Mar
 2026 14:06:08 -0700
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 27 Mar 2026 16:06:07 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jesse Zhang <Jesse.Zhang@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH 4/4] tests/amdgpu: add concurrent user queue fuzzing tests
Date: Fri, 27 Mar 2026 17:04:45 -0400
Message-ID: <20260327210546.67038-4-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260327210546.67038-1-vitaly.prosyak@amd.com>
References: <20260327210546.67038-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|DM6PR12MB4188:EE_
X-MS-Office365-Filtering-Correlation-Id: c6922ac4-27c9-47bc-7f91-08de8c44aae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700016|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Akm6/F+HjkfE7Z2ZF0YSSl44YGeoVnI/hgcdEDMt9ca+hKDsgblbQl4JJrzX/y0xpQLinrY5zOo1KoYlgZaJBTYR8zywQSMxwMJS2GTC/Nb4Cd5D6HXDVL3aSO3ZuWCVdfflOLk0F5NWb6bQuNVsgMVzoE+nRc+R+cnUILjGBot9UR5TJe/d1xmAJdgA6tsR/T0a0nUyCJQsdkTpW7+OIx+EEq4ElagiIuzptb/GtRKiJAMyrQ6NGKsJ+DU1QMeUWgvQ12kFLEiC9+mwKodg2ftq9dLUSaIMydxlJnCbRnNc/dVwk9YpujPLcHxvS01a/Cf3UzEswymZXFt+o7QhvGGkfxY8SySGYX73znSL2Lu6HOCVH106VcS9BuOHii6OZdPsC8ub5aXyww9EgNhtEtW9sgYO31iUO6+yeb6Ghxeyht87LFa2pXeEHbhkrWK0q77CCvU5Hw9Pw13iNxbwN2hJSYIUR2h75BNNGiv6BCDazL9YNoF5pn3rkJMOfWsacdOIEkjqOg/YZ0qOU+M5tDNL1CYHjiMVhGwT8q9o1nZyPaXEkk/3jER3JXJSbLh+FAEwzMja64AtW4ZwUw8ktDkXcEsfztpspu0D2hLJxnnisvEkXoMyyY/VxAtdYaf6wVnZKgFhJ/3eujpUvnxTDa5HZRJPNkE2sgQPPgXBgYA217ar4zsEWS3250G2MyY1PiS86IZ4/WPfTFBWd1rCoIw/71X9gEaEeeWQ2kEXPfH71TkdrJPHy22ICTMsrrifGWBvt5e5uX563mMUbFKYwg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VIvfOmKEShhsSJIbWJMQA1jwMEXDY6DV5ijDqggDBHDvboWfy8+o+Mtlt8vwgyh0c8hYD2IekmD62LPBffkQgDs+gozpf9xoZCQyzMsPPmxcXqObd7J0IjqzqlBSz7XKzS5g2+Qen6wEEawc/2pp+g3oD+Hbio2arW+B8NcbA/yMfbBqgKsMr55fyqUXYdFcuqRmMINOFp7VSIx6qRv3TPXsFAZWU51aFCZc+dURAvD4ywfWRE5JvtJcYeokl/PJwF4bBICKrqSlPeDAbhKji3DSK06pwcnx/CMu1Mxwzj7dpyXSNHy+WqoOGDH8/jHM+Nft1BYbjuLVmTS2bckXqQORjdlave4pFGk2R4zeG/LAe1hr++EZ8jVut9j+1AqY7fyv2lGwLItWNmeREnFq6P1FPYpDP79j/EkYkvSqE83LCCSLefdH8d21sW7vSQH8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 21:06:08.5678 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6922ac4-27c9-47bc-7f91-08de8c44aae6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4188
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

From: Jesse Zhang <Jesse.Zhang@amd.com>

Introduce fuzzing tests for user queue operations to exercise race
conditions in the AMDGPU user queue handling. The new tests cover:

- Concurrent USERQ_CREATE and USERQ_DESTROY across multiple threads
- USERQ_SIGNAL racing USERQ_DESTROY
- Concurrent double USERQ_DESTROY on the same queue
- USERQ_WAIT racing USERQ_DESTROY

These tests help validate the driver's XArray lookup, doorbell management,
and MQD teardown paths under parallel execution. The tests are guarded
by AMDGPU_USERQ_ENABLED and run only when the kernel supports user queues.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_fuzzing.c | 721 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 720 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
index d7bf12f14..21dab4afe 100644
--- a/tests/amdgpu/amd_fuzzing.c
+++ b/tests/amdgpu/amd_fuzzing.c
@@ -5,6 +5,9 @@
 
 #include "lib/amdgpu/amd_memory.h"
 #include "lib/amdgpu/amd_gfx.h"
+#include "lib/amdgpu/amd_ip_blocks.h"
+#include "lib/amdgpu/amd_PM4.h"
+#include "lib/amdgpu/amd_sdma.h"
 #include "lib/ioctl_wrappers.h"
 
 #include <errno.h>
@@ -15,6 +18,18 @@
 #include <string.h>
 #include <sys/ioctl.h>
 #include <unistd.h>
+#include <pthread.h>
+
+#define AMD_CONC_THREADS 4
+#define AMD_CONC_ITERS   128
+
+#ifdef AMDGPU_USERQ_ENABLED
+struct amd_test_userq_ctx;
+
+static bool
+amd_test_try_create_userq(int fd, amdgpu_device_handle amdgpu_dev, uint32_t ip_type,
+			 struct amd_test_userq_ctx *userq);
+#endif
 
 /* GEM_LIST_HANDLES ioctl — may not be present in older installed libdrm headers */
 #ifndef DRM_AMDGPU_GEM_LIST_HANDLES
@@ -856,6 +871,7 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
 		struct drm_amdgpu_userq_fence_info out_fences[1];
 		/* This block targets early validation; real queue behavior is in userq-fuzzing. */
 		static const struct amd_ioctl_field_case cases[] = {
+			/* After updating the struct, uncomment it. */
 			//{ "userq_wait.waitq_id.invalid", offsetof(struct drm_amdgpu_userq_wait, waitq_id), sizeof(uint32_t), UINT32_MAX },
 			{ "userq_wait.syncobj_handles.invalid", offsetof(struct drm_amdgpu_userq_wait, syncobj_handles), sizeof(uint64_t), 0x1 },
 			{ "userq_wait.timeline_handles.invalid", offsetof(struct drm_amdgpu_userq_wait, syncobj_timeline_handles), sizeof(uint64_t), 0x1 },
@@ -2015,11 +2031,698 @@ amd_lifecycle_fuzzing(int fd)
 	}
 }
 
+#ifdef AMDGPU_USERQ_ENABLED
+struct amd_test_userq_ctx {
+	uint32_t ip_type;
+	struct amdgpu_ring_context *ring_context;
+	uint32_t queue_id;
+	bool created;
+};
+
+static bool
+amd_test_map_hw_to_ip_block_type(uint32_t hw_ip_type,
+				 enum amd_ip_block_type *block_type)
+{
+	if (!block_type)
+		return false;
+
+	switch (hw_ip_type) {
+	case AMDGPU_HW_IP_GFX:
+		*block_type = AMD_IP_GFX;
+		return true;
+	case AMDGPU_HW_IP_COMPUTE:
+		*block_type = AMD_IP_COMPUTE;
+		return true;
+	case AMDGPU_HW_IP_DMA:
+		*block_type = AMD_IP_DMA;
+		return true;
+	default:
+		return false;
+	}
+}
+
+static void
+amd_test_userq_cleanup(int fd, amdgpu_device_handle amdgpu_dev,
+		      struct amd_test_userq_ctx *userq)
+{
+	const struct amdgpu_ip_block_version *ip_block = NULL;
+	enum amd_ip_block_type block_type;
+	int r;
+	bool need_wait = false;
+
+	(void)fd;
+
+	if (!userq)
+		return;
+	if (!userq->ring_context)
+		return;
+
+	if (amdgpu_dev && amd_test_map_hw_to_ip_block_type(userq->ip_type, &block_type))
+		ip_block = get_ip_block(amdgpu_dev, block_type);
+
+	if (userq->created && ip_block && ip_block->funcs && ip_block->funcs->userq_destroy) {
+		ip_block->funcs->userq_destroy(amdgpu_dev, userq->ring_context,
+					      ip_block->type);
+		userq->created = false;
+	} else {
+		/* Queue may already be destroyed by a race thread; free remaining BOs only. */
+		switch (userq->ip_type) {
+		case AMDGPU_HW_IP_GFX:
+			if (userq->ring_context->csa.handle) {
+				amdgpu_bo_unmap_and_free(userq->ring_context->csa.handle,
+						 userq->ring_context->csa.va_handle,
+						 userq->ring_context->csa.mc_addr,
+						 userq->ring_context->info.gfx.csa_size);
+				userq->ring_context->csa.handle = NULL;
+				need_wait = true;
+			}
+
+			if (userq->ring_context->shadow.handle) {
+				amdgpu_bo_unmap_and_free(userq->ring_context->shadow.handle,
+						 userq->ring_context->shadow.va_handle,
+						 userq->ring_context->shadow.mc_addr,
+						 userq->ring_context->info.gfx.shadow_size);
+				userq->ring_context->shadow.handle = NULL;
+				need_wait = true;
+			}
+			break;
+
+		case AMDGPU_HW_IP_COMPUTE:
+			if (userq->ring_context->eop.handle) {
+				amdgpu_bo_unmap_and_free(userq->ring_context->eop.handle,
+						 userq->ring_context->eop.va_handle,
+						 userq->ring_context->eop.mc_addr,
+						 256);
+				userq->ring_context->eop.handle = NULL;
+				need_wait = true;
+			}
+			break;
+
+		case AMDGPU_HW_IP_DMA:
+			if (userq->ring_context->csa.handle) {
+				amdgpu_bo_unmap_and_free(userq->ring_context->csa.handle,
+						 userq->ring_context->csa.va_handle,
+						 userq->ring_context->csa.mc_addr,
+						 userq->ring_context->info.gfx.csa_size);
+				userq->ring_context->csa.handle = NULL;
+				need_wait = true;
+			}
+			break;
+
+		default:
+			break;
+		}
+
+		if (need_wait && userq->ring_context->timeline_syncobj_handle) {
+			r = amdgpu_timeline_syncobj_wait(amdgpu_dev,
+							 userq->ring_context->timeline_syncobj_handle,
+							 userq->ring_context->point);
+			if (r)
+				igt_info("userq cleanup wait failed: ip=%u ret=%d\n", userq->ip_type, r);
+		}
+
+		if (userq->ring_context->timeline_syncobj_handle) {
+			r = amdgpu_cs_destroy_syncobj(amdgpu_dev,
+						     userq->ring_context->timeline_syncobj_handle);
+			if (r)
+				igt_info("userq cleanup destroy syncobj failed: ip=%u ret=%d\n", userq->ip_type, r);
+			userq->ring_context->timeline_syncobj_handle = 0;
+		}
+
+		if (userq->ring_context->doorbell.handle) {
+			r = amdgpu_bo_cpu_unmap(userq->ring_context->doorbell.handle);
+			if (r)
+				igt_info("userq cleanup doorbell unmap failed: ip=%u ret=%d\n", userq->ip_type, r);
+
+			r = amdgpu_bo_free(userq->ring_context->doorbell.handle);
+			if (r)
+				igt_info("userq cleanup doorbell free failed: ip=%u ret=%d\n", userq->ip_type, r);
+
+			userq->ring_context->doorbell.handle = NULL;
+		}
+
+		if (userq->ring_context->rptr.handle) {
+			amdgpu_bo_unmap_and_free(userq->ring_context->rptr.handle,
+						 userq->ring_context->rptr.va_handle,
+						 userq->ring_context->rptr.mc_addr, 8);
+			userq->ring_context->rptr.handle = NULL;
+		}
+
+		if (userq->ring_context->wptr.handle) {
+			amdgpu_bo_unmap_and_free(userq->ring_context->wptr.handle,
+						 userq->ring_context->wptr.va_handle,
+						 userq->ring_context->wptr.mc_addr, 8);
+			userq->ring_context->wptr.handle = NULL;
+		}
+
+		if (userq->ring_context->queue.handle) {
+			amdgpu_bo_unmap_and_free(userq->ring_context->queue.handle,
+						 userq->ring_context->queue.va_handle,
+						 userq->ring_context->queue.mc_addr,
+						 USERMODE_QUEUE_SIZE);
+			userq->ring_context->queue.handle = NULL;
+		}
+	}
+
+	free(userq->ring_context);
+	userq->ring_context = NULL;
+	userq->queue_id = 0;
+}
+
+static bool
+amd_test_try_create_userq(int fd, amdgpu_device_handle amdgpu_dev, uint32_t ip_type,
+			 struct amd_test_userq_ctx *userq)
+{
+	const struct amdgpu_ip_block_version *ip_block;
+	enum amd_ip_block_type block_type;
+
+	(void)fd;
+
+	if (!amdgpu_dev || !userq)
+	{
+		igt_info("userq create failed: invalid args dev=%p userq=%p ip=%u\n",
+			 amdgpu_dev, userq, ip_type);
+		return false;
+	}
+
+	memset(userq, 0, sizeof(*userq));
+	userq->ip_type = ip_type;
+	if (!amd_test_map_hw_to_ip_block_type(ip_type, &block_type)) {
+		igt_info("userq create failed: unsupported hw ip_type=%u\n", ip_type);
+		return false;
+	}
+
+	ip_block = get_ip_block(amdgpu_dev, block_type);
+	if (!ip_block || !ip_block->funcs || !ip_block->funcs->userq_create) {
+		igt_info("userq create unavailable: ip=%u block=%p funcs=%p create=%p\n",
+			 ip_type,
+			 ip_block,
+			 ip_block ? ip_block->funcs : NULL,
+			 (ip_block && ip_block->funcs) ? ip_block->funcs->userq_create : NULL);
+		return false;
+	}
+
+	userq->ring_context = calloc(1, sizeof(*userq->ring_context));
+	if (!userq->ring_context) {
+		igt_info("userq create failed: ring_context alloc failed ip=%u\n", ip_type);
+		return false;
+	}
+
+	ip_block->funcs->userq_create(amdgpu_dev, userq->ring_context, ip_block->type);
+	if (!userq->ring_context->queue.handle) {
+		igt_info("userq create failed: queue.handle is NULL ip=%u\n", ip_type);
+		free(userq->ring_context);
+		userq->ring_context = NULL;
+		return false;
+	}
+
+	userq->queue_id = userq->ring_context->queue_id;
+	userq->created = true;
+	return true;
+}
+
+
+/*
+ * ------------------------------------------------------------------
+ * USERQ concurrency / race-condition fuzzing
+ *
+ * Runs on GFX / COMPUTE / DMA queues when supported by the ASIC.
+ *
+ * Race D – Concurrent USERQ_CREATE + USERQ_DESTROY:
+ *   N threads simultaneously create/destroy queues of the same ip_type.
+ *
+ * Race E – USERQ_SIGNAL racing USERQ_DESTROY (2 threads, 1 queue).
+ *
+ * Race F – Concurrent USERQ_DESTROY on the same queue_id (2 threads).
+ *
+ * Race G – USERQ_WAIT racing USERQ_DESTROY (2 threads, 1 queue).
+ *
+ * Race H – USERQ queue writes racing negative ioctls + DESTROY:
+ *   Writer thread submits tiny packets to the queue while another thread
+ *   injects invalid ioctls and then destroys the queue.
+ *
+ * No specific errno is asserted – the real signal is clean dmesg.
+ * ------------------------------------------------------------------
+ */
+
+static const char *
+amd_userq_ip_name(uint32_t ip_type)
+{
+	switch (ip_type) {
+	case AMDGPU_HW_IP_GFX:
+		return "GFX";
+	case AMDGPU_HW_IP_COMPUTE:
+		return "COMPUTE";
+	case AMDGPU_HW_IP_DMA:
+		return "DMA";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+/* Race D: per-thread args for concurrent create/destroy. */
+struct amd_conc_userq_args {
+	int                  fd;
+	amdgpu_device_handle dev;
+	pthread_barrier_t   *barrier;
+	int                  iters;
+	uint32_t             ip_type;
+};
+
+/* Races E / G: state shared between the op-thread and the destroyer. */
+struct amd_conc_userq_op_state {
+	int                  fd;
+	amdgpu_device_handle dev;
+	pthread_barrier_t    barrier;
+	uint32_t             ip_type;
+	uint32_t             queue_id;
+	volatile int         destroyed;
+};
+
+/* Race H: writer + negative ops + destroy on one live queue. */
+struct amd_conc_userq_write_state {
+	int                          fd;
+	amdgpu_device_handle         dev;
+	pthread_barrier_t            barrier;
+	uint32_t                     ip_type;
+	uint32_t                     queue_id;
+	struct amdgpu_ring_context  *ring_context;
+	volatile int                 destroyed;
+};
+
+/* Race F: per-thread args for concurrent double-destroy. */
+struct amd_conc_userq_destroy_args {
+	int               fd;
+	uint32_t          queue_id;
+	pthread_barrier_t *barrier;
+};
+
+/* Race D thread: create own queue, immediately destroy it, N times. */
+static void *
+thread_userq_create_destroy(void *arg)
+{
+	struct amd_conc_userq_args *a = arg;
+	struct amd_test_userq_ctx local_ctx;
+	int i;
+
+	pthread_barrier_wait(a->barrier);
+	for (i = 0; i < a->iters; i++) {
+		memset(&local_ctx, 0, sizeof(local_ctx));
+		if (amd_test_try_create_userq(a->fd, a->dev,
+					      a->ip_type, &local_ctx))
+			amd_test_userq_cleanup(a->fd, a->dev, &local_ctx);
+	}
+	return NULL;
+}
+
+/*
+ * Queue write helper for Race H.
+ * Writes a tiny NOP packet and rings doorbell to exercise queue write path.
+ */
+static void
+amd_test_userq_write_once(struct amdgpu_ring_context *ctx, uint32_t ip_type,
+			 uint32_t tag)
+{
+	struct amdgpu_ring_context *ring_context = ctx;
+
+	if (!ring_context || !ring_context->queue_cpu || !ring_context->wptr_cpu ||
+	    !ring_context->doorbell_cpu)
+		return;
+
+	if (ip_type == AMDGPU_HW_IP_DMA) {
+		amdgpu_sdma_pkt_begin();
+		amdgpu_pkt_add_dw(SDMA_PKT_HEADER_OP(SDMA_NOP));
+		amdgpu_pkt_add_dw(tag);
+		amdgpu_sdma_pkt_end();
+	} else {
+		amdgpu_pkt_begin();
+		amdgpu_pkt_add_dw(PACKET3(PACKET3_NOP, 0));
+		amdgpu_pkt_add_dw(tag);
+		amdgpu_pkt_end();
+	}
+
+	ring_context->doorbell_cpu[DOORBELL_INDEX] = *ring_context->wptr_cpu;
+}
+
+/* Race H writer: keep writing tiny packets until queue is destroyed. */
+static void *
+thread_userq_writer(void *arg)
+{
+	struct amd_conc_userq_write_state *s = arg;
+	int iter;
+
+	pthread_barrier_wait(&s->barrier);
+	for (iter = 0; iter < AMD_CONC_ITERS; iter++) {
+		amd_test_userq_write_once(s->ring_context, s->ip_type,
+					  0xabc00000u | (uint32_t)iter);
+		if (s->destroyed)
+			break;
+		usleep(100);
+	}
+
+	return NULL;
+}
+
+/* Race H negative thread: inject invalid ioctls while writer is active, then destroy. */
+static void *
+thread_userq_negative_destroyer(void *arg)
+{
+	struct amd_conc_userq_write_state *s = arg;
+	int iter;
+
+	pthread_barrier_wait(&s->barrier);
+
+	for (iter = 0; iter < 8; iter++) {
+		struct drm_amdgpu_userq_signal sig;
+		struct drm_amdgpu_userq_wait wait;
+		union drm_amdgpu_userq free_arg;
+
+		memset(&sig, 0, sizeof(sig));
+		sig.queue_id = UINT32_MAX;
+		drmIoctl(s->fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &sig);
+
+		memset(&wait, 0, sizeof(wait));
+		/* After updating the struct, uncomment it. */
+		//wait.waitq_id = UINT32_MAX;
+		drmIoctl(s->fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &wait);
+
+		/* Invalid free should fail gracefully. */
+		memset(&free_arg, 0, sizeof(free_arg));
+		free_arg.in.op = AMDGPU_USERQ_OP_FREE;
+		free_arg.in.queue_id = UINT32_MAX;
+		drmIoctl(s->fd, DRM_IOCTL_AMDGPU_USERQ, &free_arg);
+
+		usleep(150);
+	}
+
+	/* destroy while writer may still be updating queue + doorbell */
+	s->destroyed = 1;
+	amdgpu_free_userqueue(s->dev, s->queue_id);
+
+	return NULL;
+}
+
+/*
+ * Race E thread: repeatedly SIGNAL the queue.
+ * Return value is not asserted – calls will fail once the queue is gone.
+ */
+static void *
+thread_userq_signaler(void *arg)
+{
+	struct amd_conc_userq_op_state *s = arg;
+	int iter;
+
+	pthread_barrier_wait(&s->barrier);
+	for (iter = 0; iter < AMD_CONC_ITERS; iter++) {
+		struct drm_amdgpu_userq_signal sig;
+
+		memset(&sig, 0, sizeof(sig));
+		sig.queue_id = s->queue_id;
+		/* empty payload: exercises queue_id XArray lookup vs teardown */
+		drmIoctl(s->fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &sig);
+		if (s->destroyed)
+			break;
+	}
+	return NULL;
+}
+
+/*
+ * Race G thread: repeatedly WAIT on the queue.
+ * Return value is not asserted – calls will fail once the queue is gone.
+ */
+static void *
+thread_userq_waiter(void *arg)
+{
+	struct amd_conc_userq_op_state *s = arg;
+	int iter;
+
+	pthread_barrier_wait(&s->barrier);
+	for (iter = 0; iter < AMD_CONC_ITERS; iter++) {
+		struct drm_amdgpu_userq_wait wait;
+
+		memset(&wait, 0, sizeof(wait));
+		/* After updating the struct, uncomment it. */
+		//wait.waitq_id = s->queue_id;
+		/* empty payload: exercises waitq_id lookup vs teardown */
+		drmIoctl(s->fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &wait);
+		if (s->destroyed)
+			break;
+	}
+	return NULL;
+}
+
+/* Shared destroyer for Races E and G. */
+static void *
+thread_userq_op_destroyer(void *arg)
+{
+	struct amd_conc_userq_op_state *s = arg;
+
+	pthread_barrier_wait(&s->barrier);
+	/*
+	 * Brief delay increases the probability that the op-thread is
+	 * inside a SIGNAL/WAIT ioctl when teardown fires.
+	 */
+	usleep(1000);
+	s->destroyed = 1;
+	amdgpu_free_userqueue(s->dev, s->queue_id);
+	return NULL;
+}
+
+/* Race F thread: attempt AMDGPU_USERQ_OP_FREE on a shared queue_id. */
+static void *
+thread_userq_double_destroy(void *arg)
+{
+	struct amd_conc_userq_destroy_args *a = arg;
+	union drm_amdgpu_userq userq_arg;
+
+	pthread_barrier_wait(a->barrier);
+	memset(&userq_arg, 0, sizeof(userq_arg));
+	userq_arg.in.op       = AMDGPU_USERQ_OP_FREE;
+	userq_arg.in.queue_id = a->queue_id;
+	/*
+	 * Return value intentionally unchecked: exactly one thread should
+	 * succeed; the driver must not crash on either outcome.
+	 */
+	drmIoctl(a->fd, DRM_IOCTL_AMDGPU_USERQ, &userq_arg);
+	return NULL;
+}
+
+static void
+amd_userq_run_create_destroy_race(int fd, amdgpu_device_handle dev,
+				 uint32_t ip_type)
+{
+	pthread_t threads[AMD_CONC_THREADS];
+	struct amd_conc_userq_args args[AMD_CONC_THREADS];
+	pthread_barrier_t barrier;
+	int i;
+
+	igt_info("concurrent-userq-fuzzing[%s]: concurrent-create-destroy "
+		 "(%d threads x 4 iters)\n",
+		 amd_userq_ip_name(ip_type), AMD_CONC_THREADS);
+	igt_assert(pthread_barrier_init(&barrier, NULL, AMD_CONC_THREADS) == 0);
+	for (i = 0; i < AMD_CONC_THREADS; i++) {
+		args[i].fd      = fd;
+		args[i].dev     = dev;
+		args[i].barrier = &barrier;
+		args[i].iters   = 4;
+		args[i].ip_type = ip_type;
+		igt_assert(pthread_create(&threads[i], NULL,
+					  thread_userq_create_destroy,
+					  &args[i]) == 0);
+	}
+	for (i = 0; i < AMD_CONC_THREADS; i++)
+		pthread_join(threads[i], NULL);
+	pthread_barrier_destroy(&barrier);
+}
+
+static void
+amd_userq_run_signal_destroy_race(int fd, amdgpu_device_handle dev,
+				 uint32_t ip_type)
+{
+	struct amd_conc_userq_op_state s;
+	struct amd_test_userq_ctx userq;
+	pthread_t signaler, destroyer;
+
+	memset(&userq, 0, sizeof(userq));
+	if (!amd_test_try_create_userq(fd, dev, ip_type, &userq)) {
+		igt_info("concurrent-userq-fuzzing[%s]: queue unavailable, "
+			 "skip signal-vs-destroy\n", amd_userq_ip_name(ip_type));
+		return;
+	}
+
+	memset(&s, 0, sizeof(s));
+	s.fd       = fd;
+	s.dev      = dev;
+	s.ip_type  = ip_type;
+	s.queue_id = userq.queue_id;
+	userq.created = false;
+	igt_assert(pthread_barrier_init(&s.barrier, NULL, 2) == 0);
+	igt_info("concurrent-userq-fuzzing[%s]: signal-vs-destroy start "
+		 "(queue_id=%u)\n", amd_userq_ip_name(ip_type), s.queue_id);
+	igt_assert(pthread_create(&signaler, NULL, thread_userq_signaler, &s) == 0);
+	igt_assert(pthread_create(&destroyer, NULL, thread_userq_op_destroyer, &s) == 0);
+	pthread_join(signaler, NULL);
+	pthread_join(destroyer, NULL);
+	pthread_barrier_destroy(&s.barrier);
+	amd_test_userq_cleanup(fd, dev, &userq);
+}
+
+static void
+amd_userq_run_double_destroy_race(int fd, amdgpu_device_handle dev,
+				 uint32_t ip_type)
+{
+	struct amd_conc_userq_destroy_args dargs[2];
+	struct amd_test_userq_ctx userq;
+	pthread_barrier_t barrier;
+	pthread_t threads[2];
+	int i;
+
+	memset(&userq, 0, sizeof(userq));
+	if (!amd_test_try_create_userq(fd, dev, ip_type, &userq)) {
+		igt_info("concurrent-userq-fuzzing[%s]: queue unavailable, "
+			 "skip double-destroy\n", amd_userq_ip_name(ip_type));
+		return;
+	}
+
+	igt_assert(pthread_barrier_init(&barrier, NULL, 2) == 0);
+	igt_info("concurrent-userq-fuzzing[%s]: double-destroy start "
+		 "(queue_id=%u)\n", amd_userq_ip_name(ip_type), userq.queue_id);
+	for (i = 0; i < 2; i++) {
+		dargs[i].fd       = fd;
+		dargs[i].queue_id = userq.queue_id;
+		dargs[i].barrier  = &barrier;
+		igt_assert(pthread_create(&threads[i], NULL,
+					  thread_userq_double_destroy,
+					  &dargs[i]) == 0);
+	}
+	pthread_join(threads[0], NULL);
+	pthread_join(threads[1], NULL);
+	pthread_barrier_destroy(&barrier);
+	userq.created = false;
+	amd_test_userq_cleanup(fd, dev, &userq);
+}
+
+static void
+amd_userq_run_wait_destroy_race(int fd, amdgpu_device_handle dev,
+				 uint32_t ip_type)
+{
+	struct amd_conc_userq_op_state s;
+	struct amd_test_userq_ctx userq;
+	pthread_t waiter, destroyer;
+
+	memset(&userq, 0, sizeof(userq));
+	if (!amd_test_try_create_userq(fd, dev, ip_type, &userq)) {
+		igt_info("concurrent-userq-fuzzing[%s]: queue unavailable, "
+			 "skip wait-vs-destroy\n", amd_userq_ip_name(ip_type));
+		return;
+	}
+
+	memset(&s, 0, sizeof(s));
+	s.fd       = fd;
+	s.dev      = dev;
+	s.ip_type  = ip_type;
+	s.queue_id = userq.queue_id;
+	userq.created = false;
+	igt_assert(pthread_barrier_init(&s.barrier, NULL, 2) == 0);
+	igt_info("concurrent-userq-fuzzing[%s]: wait-vs-destroy start "
+		 "(queue_id=%u)\n", amd_userq_ip_name(ip_type), s.queue_id);
+	igt_assert(pthread_create(&waiter, NULL, thread_userq_waiter, &s) == 0);
+	igt_assert(pthread_create(&destroyer, NULL, thread_userq_op_destroyer, &s) == 0);
+	pthread_join(waiter, NULL);
+	pthread_join(destroyer, NULL);
+	pthread_barrier_destroy(&s.barrier);
+	amd_test_userq_cleanup(fd, dev, &userq);
+}
+
+static void
+amd_userq_run_write_negative_destroy_race(int fd, amdgpu_device_handle dev,
+					 uint32_t ip_type)
+{
+	struct amd_conc_userq_write_state s;
+	struct amd_test_userq_ctx userq;
+	pthread_t writer, neg_destroyer;
+
+	memset(&userq, 0, sizeof(userq));
+	if (!amd_test_try_create_userq(fd, dev, ip_type, &userq)) {
+		igt_info("concurrent-userq-fuzzing[%s]: queue unavailable, "
+			 "skip write-vs-negative-vs-destroy\n",
+			 amd_userq_ip_name(ip_type));
+		return;
+	}
+
+	memset(&s, 0, sizeof(s));
+	s.fd = fd;
+	s.dev = dev;
+	s.ip_type = ip_type;
+	s.queue_id = userq.queue_id;
+	s.ring_context = userq.ring_context;
+	userq.created = false;
+
+	igt_assert(pthread_barrier_init(&s.barrier, NULL, 2) == 0);
+	igt_info("concurrent-userq-fuzzing[%s]: write-vs-negative-vs-destroy "
+		 "start (queue_id=%u)\n", amd_userq_ip_name(ip_type), s.queue_id);
+	igt_assert(pthread_create(&writer, NULL, thread_userq_writer, &s) == 0);
+	igt_assert(pthread_create(&neg_destroyer, NULL,
+				  thread_userq_negative_destroyer, &s) == 0);
+	pthread_join(writer, NULL);
+	pthread_join(neg_destroyer, NULL);
+	pthread_barrier_destroy(&s.barrier);
+	amd_test_userq_cleanup(fd, dev, &userq);
+}
+
+static void
+amd_userq_concurrent_fuzzing(int fd, amdgpu_device_handle dev,
+				    const bool userq_arr_cap[AMD_IP_MAX])
+{
+	static const uint32_t ip_types[] = {
+		AMDGPU_HW_IP_GFX,
+		AMDGPU_HW_IP_COMPUTE,
+		AMDGPU_HW_IP_DMA,
+	};
+	unsigned int i;
+
+	if (!dev) {
+		igt_info("concurrent-userq-fuzzing: no amdgpu device, skip\n");
+		return;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(ip_types); i++) {
+		uint32_t ip_type = ip_types[i];
+		enum amd_ip_block_type block_type;
+
+		if (!amd_test_map_hw_to_ip_block_type(ip_type, &block_type)) {
+			igt_info("concurrent-userq-fuzzing[%s]: unsupported hw ip, skip all races\n",
+				 amd_userq_ip_name(ip_type));
+			continue;
+		}
+
+		if (!userq_arr_cap[block_type]) {
+			igt_info("concurrent-userq-fuzzing[%s]: userq capability not present, skip all races\n",
+				 amd_userq_ip_name(ip_type));
+			continue;
+		}
+
+		igt_info("concurrent-userq-fuzzing[%s]: start\n",
+			 amd_userq_ip_name(ip_type));
+		amd_userq_run_create_destroy_race(fd, dev, ip_type);
+		amd_userq_run_signal_destroy_race(fd, dev, ip_type);
+		amd_userq_run_double_destroy_race(fd, dev, ip_type);
+		amd_userq_run_wait_destroy_race(fd, dev, ip_type);
+		amd_userq_run_write_negative_destroy_race(fd, dev, ip_type);
+		igt_info("concurrent-userq-fuzzing[%s]: done\n",
+			 amd_userq_ip_name(ip_type));
+	}
+}
+#endif /* AMDGPU_USERQ_ENABLED */
+
 int igt_main()
 {
 	int fd = -1;
 	amdgpu_device_handle amdgpu_dev = NULL;
 	uint32_t major_version = 0, minor_version = 0;
+	struct amdgpu_gpu_info gpu_info = {0};
+	bool userq_arr_cap[AMD_IP_MAX] = {0};
+	int r;
 	const enum amd_ip_block_type arr_types[] = {
 			AMD_IP_GFX, AMD_IP_COMPUTE, AMD_IP_DMA, AMD_IP_UVD,
 			AMD_IP_VCE, AMD_IP_UVD_ENC, AMD_IP_VCN_DEC, AMD_IP_VCN_ENC,
@@ -2029,7 +2732,17 @@ int igt_main()
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_AMDGPU);
 		igt_require(fd != -1);
-		amdgpu_device_initialize(fd, &major_version, &minor_version, &amdgpu_dev);
+		r = amdgpu_device_initialize(fd, &major_version, &minor_version, &amdgpu_dev);
+		igt_require(r == 0);
+
+		r = amdgpu_query_gpu_info(amdgpu_dev, &gpu_info);
+		igt_require(r == 0);
+
+		r = setup_amdgpu_ip_blocks(major_version, minor_version,
+					    &gpu_info, amdgpu_dev);
+		igt_require(r == 0);
+
+		asic_userq_readiness(amdgpu_dev, userq_arr_cap);
 	}
 
 	igt_describe("Check user ptr fuzzing with huge size and not valid address");
@@ -2056,6 +2769,12 @@ int igt_main()
 	igt_subtest("lifecycle-fuzzing")
 		amd_lifecycle_fuzzing(fd);
 
+#ifdef AMDGPU_USERQ_ENABLED
+	igt_describe("USERQ concurrency fuzzing: concurrent CREATE/DESTROY, SIGNAL/WAIT racing DESTROY, double-DESTROY");
+	igt_subtest("concurrent-userq-fuzzing")
+		amd_userq_concurrent_fuzzing(fd, amdgpu_dev, userq_arr_cap);
+#endif
+
 	igt_fixture() {
 		drm_close_driver(fd);
 	}
-- 
2.52.0

