Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2224B606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 03:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ORc9CDhl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB03610E161;
	Fri, 27 Nov 2026 03:32:09 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010028.outbound.protection.outlook.com [52.101.201.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA28710E407
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 03:30:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fs16wQ0l/IbLAnh4whgne/JR9TxS6KrNYxl8MSdmnAp8bv5imSFOJqPw8mdOtjxzuJ6w4Vg+Ze03TBuGdIuQrD9xsV5hOIOKGxgdb26TA4WZR1OGU2CWC3Xaj3yEpFS5vpu3t8sIM2+kgF7hzHHfkWNyLHiBRDCx9pO7sIzP25EwTbVxtLGcC2mWgJOkapTgWZwApebkRHm5JsIqENNNmEWQdF1uLY+XVkYHnbddhIDgjx0yM9Ha7QxmEjWKIWl9ez6ti4c8B095gR0CS6lwaVmdE+UIw8zhJGUy6FUvSADJRzwIh3+cOdAqgpXjHsLg7skjoKGmbAQgYGvD6RHFxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NI14XU54JcJ/OdYmus9MMqmNfR4E91o9GzI7hmHZX4w=;
 b=xrb/GObCUHwWaQzwNjTRTXhBGotGoNHtYSFuUCW2s0KCZmxUsJ3ZqJOXGtyVBNyl/FInCHGkC0vNnuDjJueKqNSkrRsFHHsYWstlnqUBMoDCAaXHQK3vp5Wm358H+ypBVZ1jVoIcl+RP/f8iV7SxmX+PSTOvSsy8fc79A6FhBX/5pP6AoFt5uo1tJxw3u69TruQ53J2phLMSf71YR0otG0FJk/Z+nyXnUU3a4hCyAIurcKDrw9XEq2BfwgnIeJdC6xj/AFU/qhgOF8Tdpbb13ppI707TQ2TR8vf+sSwkYPPOKBnmZstd6Kmuu/v4eJoboDnKJXUgv0pAItp4BQKIAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NI14XU54JcJ/OdYmus9MMqmNfR4E91o9GzI7hmHZX4w=;
 b=ORc9CDhlfV4RHZExbEtyqmRxMxXRX1CqBSC1aRkiAw6crxfNR0CDf/M/UHsW6as1l84xv1GUOCOhDYvGZPCOGgeaf1mIUmAbr7J/NcaxP986xPKc7DDFM+dqx6SrzEWt59HQxYifu5umjOW43AE2dWtlNdJxuLvR+mIBodQPe8U=
Received: from MW4PR03CA0152.namprd03.prod.outlook.com (2603:10b6:303:8d::7)
 by PH0PR12MB8150.namprd12.prod.outlook.com (2603:10b6:510:293::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 03:30:44 +0000
Received: from EA8PEPF00000005.namprd05.prod.outlook.com
 (2603:10b6:303:8d:cafe::91) by MW4PR03CA0152.outlook.office365.com
 (2603:10b6:303:8d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.9 via Frontend Transport; Fri, 27
 Nov 2026 03:30:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 EA8PEPF00000005.mail.protection.outlook.com (10.167.249.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 03:30:44 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 21:30:42 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 21:30:42 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Thu, 26 Nov 2026 21:30:42 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Claude Sonnet 5
 <noreply@anthropic.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>
Subject: [PATCH] tests/amdgpu: add suspend/resume test (amd_suspend)
Date: Thu, 26 Nov 2026 22:30:09 -0500
Message-ID: <20261127033032.130382-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EA8PEPF00000005:EE_|PH0PR12MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: 55f79205-a252-41e9-35d1-08df4c36d1e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|6123799006|261009223027099003|18002099003|6133799003|261026130827099003|10067099003|56012099006|11063799006|5023799004|261022113327099003|261026140227099003|261022115727099003|261028144727099003|261026121527099003|261021130227099003|261021121427099003|261021135927099003|261021123027099003|261102123227099003|261022075727099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: 3Nm1Ln0n/Rlwv2FO4lO4fQMgXx9pocpWyrFfD3l6DwGe4ToY5Dr+u/nqfHRsbnJuWb2C5NHd0X7bTZGVE2sYzLgcn3WAlj4xC0X4TNpdRWPOT6jXZL6/W1uWT5A6fvP2e9bTQTpSm+pVrZV0an7e8mSW3NT2gHAlFo3PiXilDxe99QCt5GxBA2Yc/l/oDnNQhC38v5BYKXfa3U89J4q6Uh2HChT01MDej5GIq8oLBcmGh3fNeUwbqwaXxrUzHKRialW1AKNgn2fUqzSExWBcbirIj46AUMhraRbJqOr7kF2Lpfz1UbyP53xONLOVUFGnwpe770HSv//GdxfQYPRoJAIEJ2NRZ2jA1RXG2qyUz69VEG5/Me4PWVR6Pqp+jW5VfBlh7AM3El0vUDuub3TXR+9rO0A31FpGSb+Ne5Exl0kWpDIXPLXjZW+4x65I0X93xymlDmzqRVe4VkX5s5oVegJxQUudBl53F8S3cl9ocW5pk6DtslRnjb1UY74I8dyU1mTlzF9CtUqOLjB24hDw3BQBFl9CkC/ISsPncOIgDTT4zx299jPa+vfJ40xYxWLaZF/8qMQDxDha1e3EkZMqAM+pyAcRJxIT8iK1r2To8IbewLFMHiFMxKr7PDwfdcI61cblR8Tur4oR7Mis8v1HuxIHgw2seezikjAZmc0E/6jtIDa0FVqhDis12yd/Gza3mIo3xOkG+ASZ9SUl/fgHrg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(6123799006)(261009223027099003)(18002099003)(6133799003)(261026130827099003)(10067099003)(56012099006)(11063799006)(5023799004)(261022113327099003)(261026140227099003)(261022115727099003)(261028144727099003)(261026121527099003)(261021130227099003)(261021121427099003)(261021135927099003)(261021123027099003)(261102123227099003)(261022075727099003)(261022105027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qQ8/1CZ5UuWIRpCZbmpUObWOdM+cQyEPK1bUB28ZSrSEHkjDRuiuLyLEJxiCwUhkLqvDljlLk+c8TUy3DOfpOgwtpckeZCVWic/KoGuhZa+rAYj7UH+ub2+f9gkhE7hFLJNXvf15zOvRutDlWBURIxdAsXsxzFKM0MggGzDlLDUHen91TqEwxZUDnOuSLIWHcCCYeSCxa/PzmdRVcMDSIKp9Q6Q5jCMH4uMmK9yv5br8a+Yvl0/idyqa2jjGQQsvrB2mH8C722qAXgfxNHCsBLB5uMN1M8r6D7+HTOKJGjgT2JEbIlmniPj70Gzeqdmt5sYBx3G3tROoH7b6fUPB1ESnrVCz1vxfvgueYd8LKQBz1/l+uLkaN7GifoP/GvxTmRFRgJF25wan518sGmm4Mej4LRoeKjI27HVShOJgSv8EzMOBQp2p83J61Y/4hCOR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 03:30:44.2334 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f79205-a252-41e9-35d1-08df4c36d1e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: EA8PEPF00000005.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8150
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Ported from Intel's tests/intel/gem_exec_suspend.c. Credit to Intel
for the original test design and subtest names.

Test design: submit a small GPU command buffer that writes a known
dword pattern into a buffer, wait for the fence, then do a
suspend/resume cycle (freeze, suspend-to-mem, or suspend-to-disk,
real or pm_test-only), then read the buffer back and check the
pattern is still correct. This is the same idea as Intel's
run_test()/check_bo(), using amdgpu_cs_submit() instead of i915
execbuf. igt_kmsg() logs each step to dmesg, so a hang during
suspend/resume shows which step was running.

Subtests: basic (no suspend, sanity check), basic-S0 (s2idle),
basic-S3/basic-S3-devices (suspend-to-mem, real or pm_test only),
basic-S4/basic-S4-devices (suspend-to-disk, same split), hang-S3/
hang-S4 (same as S3/S4, hang injection not ported yet - i915-only
API, no amdgpu version), power-S0/power-S3 (battery discharge while
suspended, needs a battery to run).

Also: fix build warnings, remove dead i915-only code with no amdgpu
version (gem_has_lmem, igt_allow_hang, fixed/cached/uncached
subtests built on them), fix the test table's function pointer type,
and fix hang-S3/hang-S4 where the HANG bit was not masked out of
mode so no suspend ever ran for these two subtests.

Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_suspend.c | 345 +++++++++++++++++++++++++++++++++++++
 1 file changed, 345 insertions(+)
 create mode 100644 tests/amdgpu/amd_suspend.c

diff --git a/tests/amdgpu/amd_suspend.c b/tests/amdgpu/amd_suspend.c
new file mode 100644
index 000000000..21629d656
--- /dev/null
+++ b/tests/amdgpu/amd_suspend.c
@@ -0,0 +1,345 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ */
+
+
+#include <fcntl.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "drmtest.h"
+#include "lib/igt_amd.h"
+
+#include <amdgpu.h>
+#include <amdgpu_drm.h>
+#include "igt_sysfs.h"
+#include "lib/amdgpu/amd_PM4.h"
+#include "lib/amdgpu/amd_ip_blocks.h"
+#include "lib/amdgpu/amd_memory.h"
+
+/**
+ * TEST: gem exec suspend
+ * Description: Exercise simple execbufs runs across various suspend/resume cycles.
+ * Feature: cmd_submission, suspend
+ * Run type: FULL
+ *
+ * SUBTEST: basic
+ * Description: Check basic functionality without any suspend/resume cycle.
+ *
+ * SUBTEST: basic-S0
+ * Description: Check with suspend-to-idle target state.
+ *
+ * SUBTEST: basic-S3
+ * Description: Check full cycle of suspend-to-mem.
+ *
+ * SUBTEST: basic-S3-devices
+ * Description: Check with suspend-to-mem with devices only.
+ *
+ * SUBTEST: basic-S4
+ * Description: Check full cycle of suspend-to-disk.
+ *
+ * SUBTEST: basic-S4-devices
+ * Description: Check with suspend-to-disk with devices only.
+ *
+ * SUBTEST: hang-S3
+ * Description: Check full cycle of suspend-to-mem with a pending GPU hang.
+ *
+ * SUBTEST: hang-S4
+ * Description: Check full cycle of suspend-to-disk with a pending GPU hang.
+ *
+ * SUBTEST: power-S0
+ * Description: Check power consumption during idle state.
+ *
+ * SUBTEST: power-S3
+ * Description: Check power consumption during suspend-to-mem state.
+ */
+
+IGT_TEST_DESCRIPTION("Exercise simple execbufs runs across various suspend/resume cycles.");
+
+#define NOSLEEP 0
+#define IDLE 1
+#define SUSPEND_DEVICES 2
+#define SUSPEND 3
+#define HIBERNATE_DEVICES 4
+#define HIBERNATE 5
+
+#define HANG (2<<8)
+
+#define RESULT_DWORDS 64
+
+#define suspend_kmsg(fmt, ...) \
+	igt_kmsg(KMSG_INFO "amd_suspend/%s: " fmt, \
+		 igt_subtest_name() ?: "?", ##__VA_ARGS__)
+
+static void
+run_amd_test(int fd, amdgpu_device_handle device, amdgpu_context_handle ctx,
+	     unsigned int engine, unsigned int mode, uint32_t region);
+
+static void amdgpu_cs_sync(amdgpu_context_handle context,
+			   unsigned int ip_type, int ring, unsigned int seqno)
+{
+	struct amdgpu_cs_fence fence = {
+		.context = context,
+		.ip_type = ip_type,
+		.ring = ring,
+		.fence = seqno,
+	};
+	uint32_t expired;
+	int err;
+
+	err = amdgpu_cs_query_fence_status(&fence, AMDGPU_TIMEOUT_INFINITE,
+					   0, &expired);
+	igt_assert_eq(err, 0);
+}
+
+static void
+run_amd_test(int fd, amdgpu_device_handle device, amdgpu_context_handle ctx,
+	     unsigned int engine, unsigned int mode, uint32_t region)
+{
+	amdgpu_bo_handle ib_bo, result_bo;
+	amdgpu_bo_handle resources[2];
+	amdgpu_bo_list_handle bo_list;
+	amdgpu_va_handle ib_va_handle, result_va_handle;
+	uint32_t *ib_cpu;
+	uint32_t *result_cpu;
+	uint64_t ib_mc, result_mc;
+	struct amdgpu_cs_ib_info ib_info = {};
+	struct amdgpu_cs_request request = {};
+	unsigned int i;
+	int r;
+
+	suspend_kmsg("enter mode=%u region=%u\n", mode, region);
+
+	r = amdgpu_bo_alloc_and_map(device, 4096, 4096, AMDGPU_GEM_DOMAIN_GTT,
+				   AMDGPU_GEM_CREATE_CPU_GTT_USWC, &ib_bo,
+				   (void **)&ib_cpu, &ib_mc, &ib_va_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device, RESULT_DWORDS * sizeof(uint32_t), 4096,
+				   AMDGPU_GEM_DOMAIN_GTT, AMDGPU_GEM_CREATE_CPU_GTT_USWC,
+				   &result_bo, (void **)&result_cpu, &result_mc,
+				   &result_va_handle);
+	igt_assert_eq(r, 0);
+	memset(result_cpu, 0, RESULT_DWORDS * sizeof(uint32_t));
+
+	/* PACKET3_WRITE_DATA: write a recognizable dword[i] == i pattern into
+	 * result_bo from the GPU, the direct analog of gem_exec_suspend.c's
+	 * MI_STORE_DWORD_IMM + check_bo() loop.
+	 */
+	ib_cpu[0] = PACKET3(PACKET3_WRITE_DATA, 2 + RESULT_DWORDS);
+	ib_cpu[1] = WRITE_DATA_DST_SEL(5) | WR_CONFIRM | WRITE_DATA_CACHE_POLICY(3);
+	ib_cpu[2] = lower_32_bits(result_mc);
+	ib_cpu[3] = upper_32_bits(result_mc);
+	for (i = 0; i < RESULT_DWORDS; i++)
+		ib_cpu[4 + i] = i;
+
+	resources[0] = ib_bo;
+	resources[1] = result_bo;
+	r = amdgpu_bo_list_create(device, 2, resources, NULL, &bo_list);
+	igt_assert_eq(r, 0);
+
+	ib_info.ib_mc_address = ib_mc;
+	ib_info.size = 4 + RESULT_DWORDS;
+
+	request.ip_type = AMDGPU_HW_IP_GFX;
+	request.ring = 0;
+	request.number_of_ibs = 1;
+	request.ibs = &ib_info;
+	request.resources = bo_list;
+
+	suspend_kmsg("submitting write-data command buffer\n");
+	r = amdgpu_cs_submit(ctx, 0, &request, 1);
+	igt_assert_eq(r, 0);
+
+	amdgpu_cs_sync(ctx, AMDGPU_HW_IP_GFX, 0, request.seq_no);
+	suspend_kmsg("write confirmed landed, pre-suspend\n");
+
+	/* mask off HANG (and any other high-bit flag) - hang-S3/hang-S4 pass
+	 * SUSPEND|HANG / HIBERNATE|HANG as mode, which must still select the
+	 * SUSPEND/HIBERNATE case below.
+	 */
+	switch (mode & 0xff) {
+	case NOSLEEP:
+		break;
+	case IDLE:
+		suspend_kmsg("entering suspend-to-idle (freeze)\n");
+		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE,
+					      SUSPEND_TEST_NONE);
+		break;
+	case SUSPEND_DEVICES:
+		suspend_kmsg("entering suspend-to-mem (devices only)\n");
+		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+					      SUSPEND_TEST_DEVICES);
+		break;
+	case SUSPEND:
+		suspend_kmsg("entering suspend-to-mem\n");
+		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+					      SUSPEND_TEST_NONE);
+		break;
+	case HIBERNATE_DEVICES:
+		suspend_kmsg("entering suspend-to-disk (devices only)\n");
+		igt_system_suspend_autoresume(SUSPEND_STATE_DISK,
+					      SUSPEND_TEST_DEVICES);
+		break;
+	case HIBERNATE:
+		suspend_kmsg("entering suspend-to-disk\n");
+		igt_system_suspend_autoresume(SUSPEND_STATE_DISK,
+					      SUSPEND_TEST_NONE);
+		break;
+	}
+	if ((mode & 0xff) != NOSLEEP)
+		suspend_kmsg("resumed from suspend\n");
+
+	/* TODO: HANG has no amdgpu equivalent wired up yet - intel's version
+	 * injects a hang via igt_spin_new() before suspending, and its fixture
+	 * calls igt_stop_hang_detector()/igt_allow_hang() (lib/igt_gt.h) so the
+	 * injected hang doesn't fail the test. Both of those are i915-only
+	 * APIs with no amdgpu port; hang-S3/hang-S4 currently only exercise
+	 * the plain suspend/resume cycle above, same as basic-S3/basic-S4.
+	 */
+
+	suspend_kmsg("verifying result buffer post-resume\n");
+	for (i = 0; i < RESULT_DWORDS; i++)
+		igt_assert_eq_u32(result_cpu[i], i);
+	suspend_kmsg("PASSED\n");
+
+	amdgpu_bo_list_destroy(bo_list);
+	amdgpu_bo_unmap_and_free(result_bo, result_va_handle, result_mc,
+				 RESULT_DWORDS * sizeof(uint32_t));
+	amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc, 4096);
+}
+
+struct battery_sample {
+	struct timespec tv;
+	uint64_t charge;
+};
+
+static bool get_power(int dir, struct battery_sample *s)
+{
+	return (clock_gettime(CLOCK_REALTIME, &s->tv) == 0 &&
+		igt_sysfs_scanf(dir, "charge_now", "%"PRIu64, &s->charge) == 1);
+}
+
+static double d_charge(const struct battery_sample *after,
+		       const struct battery_sample *before)
+{
+	return (before->charge - after->charge) * 1e-3; /* mWh */
+}
+
+static double d_time(const struct battery_sample *after,
+		     const struct battery_sample *before)
+{
+	return ((after->tv.tv_sec - before->tv.tv_sec) +
+		(after->tv.tv_nsec - before->tv.tv_nsec) * 1e-9); /* s */
+}
+
+static void power_test(int i915, amdgpu_device_handle device, amdgpu_context_handle ctx,
+		       unsigned int engine, unsigned int flags, uint32_t region)
+{
+	struct battery_sample before, after;
+	char *status;
+	int dir;
+
+	suspend_kmsg("power_test: enter flags=%u region=%u\n", flags, region);
+
+	dir = open("/sys/class/power_supply/BAT0", O_RDONLY);
+	igt_require_f(dir != -1, "/sys/class/power_supply/BAT0 not available\n");
+
+	igt_require_f(get_power(dir, &before),
+		      "power test needs reported energy level\n");
+
+	status = igt_sysfs_get(dir, "status");
+	igt_require_f(status && strcmp(status, "Discharging") == 0,
+		      "power test needs to be on battery, not mains, power\n");
+	free(status);
+
+	igt_set_autoresume_delay(5 * 60); /* 5 minutes; longer == more stable */
+
+	igt_assert(get_power(dir, &before));
+	suspend_kmsg("power_test: pre-suspend battery sample taken\n");
+	run_amd_test(i915, device, ctx, engine, flags, region);
+	igt_assert(get_power(dir, &after));
+	suspend_kmsg("power_test: post-resume battery sample taken\n");
+
+	igt_set_autoresume_delay(0);
+
+	igt_info("Power consumed while suspended: %.3fmWh\n",
+		 d_charge(&after, &before));
+	igt_info("Discharge rate while suspended: %.3fmW\n",
+		 d_charge(&after, &before) * 3600 / d_time(&after, &before));
+	suspend_kmsg("power_test: PASSED\n");
+}
+
+int igt_main()
+{
+	struct test {
+		const char *name;
+		unsigned int flags;
+		void (*fn)(int, amdgpu_device_handle, amdgpu_context_handle,
+			   unsigned int, unsigned int, uint32_t);
+		const char *describe;
+	} *test, tests_all_engines[] = {
+		{ "basic", NOSLEEP, run_amd_test, "Check basic functionality without any "
+					      "suspend/resume cycle." },
+		{ "basic-S0", IDLE, run_amd_test, "Check with suspend-to-idle target state." },
+		{ "basic-S3-devices", SUSPEND_DEVICES, run_amd_test, "Check with suspend-to-mem "
+								 "with devices only." },
+		{ "basic-S3", SUSPEND, run_amd_test, "Check full cycle of suspend-to-mem." },
+		{ "basic-S4-devices", HIBERNATE_DEVICES, run_amd_test, "Check with suspend-to-disk "
+								   "with devices only." },
+		{ "basic-S4", HIBERNATE, run_amd_test, "Check full cycle of suspend-to-disk." },
+		{ }
+	}, tests_power_hang[] = {
+		{ "hang-S3", SUSPEND | HANG, run_amd_test, "Check full cycle of suspend-to-mem with a "
+						       "pending GPU hang." },
+		{ "hang-S4", HIBERNATE | HANG, run_amd_test, "Check full cycle of suspend-to-disk with "
+							 "a pending GPU hang." },
+		{ "power-S0", IDLE, power_test, "Check power consumption during idle state." },
+		{ "power-S3", SUSPEND, power_test, "Check power consumption during "
+						   "suspend-to-mem state." },
+		{ }
+	};
+	amdgpu_device_handle device;
+	struct amdgpu_gpu_info gpu_info = {};
+	uint32_t major, minor;
+	int err;
+
+	amdgpu_context_handle ctx;
+	int fd;
+	uint32_t region;
+	unsigned int engine;
+
+	igt_fixture() {
+		fd = drm_open_driver_master(DRIVER_AMDGPU);
+		err = amdgpu_device_initialize(fd, &major, &minor, &device);
+		igt_require(err == 0);
+		igt_info("Initialized amdgpu, driver version %d.%d\n",
+			 major, minor);
+		err = amdgpu_query_gpu_info(device, &gpu_info);
+		igt_assert_eq(err, 0);
+		err = amdgpu_cs_ctx_create(device, &ctx);
+	}
+
+	region  = 0;
+	engine  = 0;
+
+	for (test = tests_all_engines; test->name; test++) {
+		igt_describe(test->describe);
+		igt_subtest_with_dynamic(test->name)
+		igt_dynamic_f("%s", test->name)
+			test->fn(fd, device, ctx, engine, test->flags, region);
+	}
+
+	for (test = tests_power_hang; test->name; test++) {
+		igt_describe(test->describe);
+		igt_subtest_with_dynamic(test->name)
+		igt_dynamic_f("%s", test->name)
+			test->fn(fd, device, ctx, engine, test->flags, region);
+	}
+
+	igt_fixture() {
+		amdgpu_cs_ctx_free( ctx);
+		drm_close_driver(fd);
+	}
+}
-- 
2.56.1

