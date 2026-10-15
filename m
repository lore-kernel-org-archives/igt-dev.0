Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68B4CA9EDE
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 04:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA6710EB63;
	Thu, 15 Oct 2026 04:05:24 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011033.outbound.protection.outlook.com [52.101.57.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A094210EB6B
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 04:02:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7k3uijDjPCRQj3y1bAEduetp1h51RtgGTa009pou9ACNxdBS85uzzrO/P5rvrmN/2w7tZ05/qqN8ff3aq9qq33YnnRYNpB/e680Adh9k7uCkXp1iZe7jBWlElnJMnRZhFKnN/HU0j414GGRuqDuNM8qK9VxPCM3VxsW8DU7OApAkGJXhVeFlxbkkbkkzhkcuHvMJ6+lqJn6kjhaXPNrDBaDzKLanmX05sMqQN8XcD+ljK/bb8cdfJz7X2NFc8UOcFNzDVz0cWvtZD+EatZGhFnCiFef/AvwBkd3FUKu+kYyNO/Z5biYMmRgi+iz60VSu2/l7xi6lxCqcJcyF6BnCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoeC0zurBEkl7896HWfwE2/DybTu8oNc2RzYStC5QwA=;
 b=dYAdMJBEHDpKeFtyyh6V/0NUFgWUqxmINEEbVnEbRa7OffEDdOoa+EBxeNcnuxv7lJvkVninS0OYb2uNEr6CGyefogtDlj8WN6npZMHQTzHPj3DyrHIXtbCLacJ0iFfH34ycqzEvTJWZwsBZYrMEWdYIP0t4OXdDipN8cQm2UC8oCt+Xnv9xKFOVbznXcGzIfpL4m7USufme0bWtPIFey63FcMXRPeWsKC/jsMyhTndIF+LYCJ5e0HqF8iInR3viiG4fBXaPEf/4nt1Fo2WbOHOpWtuXQSFC8RRSPopA7G2MYnpNFNVbVdodUjTinD+vfAFLSCnTaiX5fDfXwhnTFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoeC0zurBEkl7896HWfwE2/DybTu8oNc2RzYStC5QwA=;
 b=N/0HTzIEsK5Z68W9GIZ4BTRhDWhkvUTA4IQ1yL+wTIzmQYfXVsgxn4eOWnEwRYJBz9x81ELoVbvsUkyGqs5MaZfLZtoALzaw73mr/sIr3KOY8EP7opf2Ly1DLGObg6e5NlOJivswYJU3Ya6JJbreEr334/P8zsqwBWu3u72j3Tw=
Received: from CH0P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::13)
 by DS4PR12MB9634.namprd12.prod.outlook.com (2603:10b6:8:280::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 04:02:47 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::7f) by CH0P221CA0005.outlook.office365.com
 (2603:10b6:610:11c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Thu,
 15 Oct 2026 04:02:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Thu, 15 Oct 2026 04:02:47 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 23:02:39 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 14 Oct 2026 23:02:39 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jatin Kataria
 <jkataria@netflix.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>
Subject: [PATCH 3/3] tests/amdgpu: add native MES reset subtests
Date: Thu, 15 Oct 2026 00:00:51 -0400
Message-ID: <20261015040236.112017-3-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015040236.112017-1-vitaly.prosyak@amd.com>
References: <20261015040236.112017-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|DS4PR12MB9634:EE_
X-MS-Office365-Filtering-Correlation-Id: bdda0b9a-c0af-47f4-4f54-08df2a712c60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|56012099006|261009221227099003|261009223027099003|11063799006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: gHkr42RJiGGCNwXysaGy9mLXeLvyXi65YTpRq2ST5Nbuc2OlebREAp9uABHgW+CJT8SyACTpbqcV2xIDQUZhmvsBnPOr/QnGOSvMSxUKxQY2t8pAgkTlbQ9RlWLwa1QEpu7rdldMk3PAlIt1Lz5DqWfZwQWEOT63D09laBl0tzTJaG7XSgvQMutryfEVVI2KkBQwKMv1EUMIERtB0L1Rwcu1eZmNhXLobgoknBpTR2lG8n1CeJ+JI92YPZ96Ii/gt0WVyJi9Ot82eURJCdjTLXrG7FZm6BSDNVuVdV681mMMBjMbOoVeBkx50+yNTCb82XTIzpMQqKq6KAKqnsnc+m3iqrDBe/ZNTLtpX2IYcieLbe/RZBFFhFeLxSa8ViDsGJFmGck/zQpvS5QI2Z9CcZ+G/cDTZ2eNSJL9uSzRngNSJNV2qlxrLU3kTUnLokSFrnO74gfSYoa3/OnEewwjeUofGcJGyioSKQIjfGQyKg9Dxtjsj7lGRq/+P+eLegvZzsHPEHwXtDl4bQBiJEhn2K096OjyOYCgoqJaoc3lddlTI36+uHZeB05hKI8SZT8+XtSyqYMqSbjz3TXqsX6teZEpiQbsF6WdBzlh34OwEa176EA5g8+beo2xzmVdEiLuiXcqIsicx/uQQ20fCGbi+HZRhyUFqyxxLDfzRBYj29J1di69m0IWSzzc5nJtsCfHci168Cr5KFkShZRD8Yahqg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(56012099006)(261009221227099003)(261009223027099003)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iPar/bpYo8ytk6VQ0LwtA4EANctK0DYdBUbyqWhkDcUaBW+uVZ/YcNo8FFJ7jHUSgNBVtqp4oFLpXWhd3xTUufWINCOJbjzN36y19RwQBIhUtj00ewRjf1d825hQ9IPd48d4jj3zHMB2l6xzHIiE/mXmfXOTOhQ9vKd5PcbIu4JZzIO77yfL7YZ54vrrwGVRe+RvxGPJ9lmOsjCg61xKa49LuCYUQboOnsebvUX+2MEJ3ZNAgmZulPX4x72Ksd1NeIGo6IieNklrTbLpA7Abq5RYAgnfQnvKEm0uZFois8W6dfc/+r6Nj7w1akpdfVJAn8M9kP45zAJw2unV1uTbr6vQx7CAYsFXd6RF3yJx1+riEDer01XbNQkYwi5wed/cvO/UReStgLbB+RT2uuXPKc+1JkCKJS3Oy6pUXbmVLvSaz2pn3/uBZwkOl5mK+tam
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 04:02:47.3541 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdda0b9a-c0af-47f4-4f54-08df2a712c60
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9634
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Add amd_mes_reset as a native IGT test with one subtest per MES/GFX
teardown scenario: chained IB teardown, multi-context WRITE_DATA,
self-looping IB, WAIT_REG_MEM followed by VA unmap, released WAIT_REG_MEM,
WRITE_DATA-chain teardown, mixed GFX/compute tenants, and multi-tenant
WRITE_DATA.

Use the MES resource/submission helpers and amdgpu_cmd_base IB builders so
each subtest focuses on workload setup, teardown ordering, and the fault
window. Run the scenarios under IGT fixtures and report each case
independently.

For continuous submitters, stop children with SIGTERM and reap them before
freeing contexts and BOs. This keeps the intended work-in-flight teardown
stress while allowing IGT to report successful child completion. In the
wait-chain case, unmap the second IB BO mapping while retaining its VA
reservation until the fault window has been released, then clean up all BOs.

Register amd_mes_reset directly in tests/amdgpu/meson.build.

Originally designed by Jatin Kataria <jkataria@netflix.com>; ported to IGT
and redesigned to fit IGT architecture.

Cc: Jatin Kataria <jkataria@netflix.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_mes_reset.c | 440 +++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build     |   1 +
 2 files changed, 441 insertions(+)
 create mode 100644 tests/amdgpu/amd_mes_reset.c

diff --git a/tests/amdgpu/amd_mes_reset.c b/tests/amdgpu/amd_mes_reset.c
new file mode 100644
index 000000000..802f98e08
--- /dev/null
+++ b/tests/amdgpu/amd_mes_reset.c
@@ -0,0 +1,440 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Originally developed by Jatin Kataria at Netflix.
+ * Copyright (c) 2026 Netflix, Inc.
+ *
+ * Adapted for IGT by Advanced Micro Devices, Inc., 2026.
+ */
+
+#include "igt.h"
+#include "lib/amdgpu/amd_mes_reset.h"
+#include "lib/amdgpu/amd_ip_blocks.h"
+#include <signal.h>
+#include <amdgpu_drm.h>
+#include <pthread.h>
+#include <time.h>
+
+#define MES_CHAIN_WARMUP_MS 2000
+#define MES_WRITEDATA_WARMUP_MS 500
+#define MES_SELF_CHAIN_WARMUP_MS 500
+#define MES_WAIT_CHAIN_DELAY_MS 1000
+#define MES_SIGNAL_RELEASE_DELAY_MS 100
+#define MES_WRITEDATA_TEARDOWN_DELAY_MS 2000
+#define MES_MULTITENANT_TEARDOWN_DELAY_MS 500
+
+static volatile sig_atomic_t mes_reset_stop;
+static struct amdgpu_cmd_base *mes_reset_cmd;
+
+static void mes_reset_stop_child(int signal_number)
+{
+	(void)signal_number;
+	mes_reset_stop = 1;
+}
+
+/* All test functions defined before igt_main() */
+
+static void test_mes_ib_chain_teardown(amdgpu_device_handle device)
+{
+	uint32_t chain_len = MES_DEFAULT_CHAIN_LEN;
+	uint32_t ib_size = MES_DEFAULT_IB_SIZE;
+	struct mes_ib_node *nodes;
+	amdgpu_context_handle context;
+	amdgpu_bo_handle *bo_handles;
+	uint32_t ib_dwords;
+	int i, r;
+
+	igt_info("Chain: %u x %uKiB IBs, warmup %dms\n",
+		 chain_len, ib_size / 1024, MES_CHAIN_WARMUP_MS);
+
+	r = amdgpu_cs_ctx_create(device, &context);
+	igt_assert_eq(r, 0);
+
+	nodes = calloc(chain_len, sizeof(*nodes));
+	bo_handles = calloc(chain_len, sizeof(*bo_handles));
+	igt_assert(nodes && bo_handles);
+
+	ib_dwords = ib_size / 4;
+
+	for (i = 0; i < (int)chain_len; i++) {
+		uint64_t va = MES_VA_BASE + (uint64_t)i * (ib_size + MES_VA_GAP);
+
+		r = mes_create_ib_bo(device, ib_size, va, &nodes[i]);
+		igt_assert_eq(r, 0);
+		bo_handles[i] = nodes[i].bo_handle;
+	}
+
+	for (i = 0; i < (int)chain_len - 1; i++)
+		mes_reset_cmd->ib_fill_chain(mes_reset_cmd, nodes[i].cpu_ptr, ib_dwords, nodes[i + 1].va, ib_dwords);
+	mes_reset_cmd->ib_fill_nop(mes_reset_cmd, nodes[chain_len - 1].cpu_ptr, ib_dwords);
+
+	igt_info("Chain built: IB[0]=0x%lx\n", (unsigned long)nodes[0].va);
+
+	igt_fork(child, 1) {
+		mes_reset_stop = 0;
+		signal(SIGTERM, mes_reset_stop_child);
+		while (!mes_reset_stop) {
+			mes_submit_ib(device, context, bo_handles, chain_len,
+				      nodes[0].va, ib_size, MES_HW_IP_GFX);
+		}
+	}
+
+	usleep(MES_CHAIN_WARMUP_MS * 1000);
+	igt_kill_children(SIGTERM);
+	igt_waitchildren();
+
+	for (i = 0; i < (int)chain_len; i++)
+		mes_free_bo(&nodes[i]);
+
+	amdgpu_cs_ctx_free(context);
+	free(nodes);
+	free(bo_handles);
+}
+
+static void test_mes_writedata_teardown(amdgpu_device_handle device)
+{
+	int num_children = 4;
+	uint32_t ib_size = 1024 * 1024;
+	struct mes_ib_node ib_node, dst_node;
+	amdgpu_context_handle contexts[4];
+	amdgpu_bo_handle bo_handles[2];
+	int i, r;
+
+	r = mes_create_ib_bo(device, ib_size, MES_VA_BASE, &ib_node);
+	igt_assert_eq(r, 0);
+
+	r = mes_create_dst_bo(device, MES_DST_BO_SIZE, MES_VA_BASE + 0x800000,
+			      AMDGPU_VM_PAGE_READABLE | AMDGPU_VM_PAGE_WRITEABLE,
+			      &dst_node);
+	igt_assert_eq(r, 0);
+
+	mes_reset_cmd->ib_fill_writedata(mes_reset_cmd, ib_node.cpu_ptr, ib_size / 4, dst_node.va, MES_DST_BO_SIZE);
+
+	bo_handles[0] = ib_node.bo_handle;
+	bo_handles[1] = dst_node.bo_handle;
+
+	for (i = 0; i < 4; i++) {
+		r = amdgpu_cs_ctx_create(device, &contexts[i]);
+		igt_assert_eq(r, 0);
+	}
+
+	igt_fork(child, num_children) {
+		int c = 0;
+
+		mes_reset_stop = 0;
+		signal(SIGTERM, mes_reset_stop_child);
+		while (!mes_reset_stop) {
+			mes_submit_ib(device, contexts[c % 4], bo_handles, 2,
+				      ib_node.va, ib_size, MES_HW_IP_GFX);
+			c++;
+		}
+	}
+
+	usleep(MES_WRITEDATA_WARMUP_MS * 1000);
+	igt_kill_children(SIGTERM);
+	igt_waitchildren();
+
+	for (i = 0; i < 4; i++)
+		amdgpu_cs_ctx_free(contexts[i]);
+
+	mes_free_bo(&ib_node);
+	mes_free_bo(&dst_node);
+}
+
+static void test_gfx_chain_close_fault(amdgpu_device_handle device)
+{
+	uint32_t ib_size = 64 * 1024;
+	struct mes_ib_node ib_node;
+	amdgpu_context_handle context;
+	amdgpu_bo_handle bo_handles[1];
+	int r;
+
+	r = amdgpu_cs_ctx_create(device, &context);
+	igt_assert_eq(r, 0);
+
+	r = mes_create_ib_bo(device, ib_size, MES_VA_BASE, &ib_node);
+	igt_assert_eq(r, 0);
+
+	mes_reset_cmd->ib_fill_chain(mes_reset_cmd, ib_node.cpu_ptr, ib_size / 4, ib_node.va, ib_size / 4);
+	bo_handles[0] = ib_node.bo_handle;
+
+	igt_fork(child, 1) {
+		mes_reset_stop = 0;
+		signal(SIGTERM, mes_reset_stop_child);
+		while (!mes_reset_stop) {
+			mes_submit_ib(device, context, bo_handles, 1,
+				      ib_node.va, ib_size, MES_HW_IP_GFX);
+		}
+	}
+
+	usleep(MES_SELF_CHAIN_WARMUP_MS * 1000);
+	igt_kill_children(SIGTERM);
+	igt_waitchildren();
+
+	mes_free_bo(&ib_node);
+	amdgpu_cs_ctx_free(context);
+}
+
+static void test_gfx_wait_chain_fault(amdgpu_device_handle device)
+{
+	struct mes_ib_node ib0, ib1, signal;
+	amdgpu_context_handle context;
+	amdgpu_bo_handle bo_handles[3];
+	int r;
+
+	r = amdgpu_cs_ctx_create(device, &context);
+	igt_assert_eq(r, 0);
+
+	r = mes_create_ib_bo(device, 64 * 1024, MES_VA_BASE, &ib0);
+	igt_assert_eq(r, 0);
+	r = mes_create_ib_bo(device, 64 * 1024, MES_VA_BASE + 0x30000, &ib1);
+	igt_assert_eq(r, 0);
+	r = mes_create_dst_bo(device, 4096, MES_VA_BASE + 0x10000000,
+			      AMDGPU_VM_PAGE_READABLE | AMDGPU_VM_PAGE_WRITEABLE, &signal);
+	igt_assert_eq(r, 0);
+
+	*signal.cpu_ptr = 0;
+	mes_reset_cmd->ib_fill_wait(mes_reset_cmd, ib0.cpu_ptr, signal.va, ib1.va);
+	mes_reset_cmd->ib_fill_nop(mes_reset_cmd, ib1.cpu_ptr, 16384);
+
+	bo_handles[0] = ib0.bo_handle;
+	bo_handles[1] = ib1.bo_handle;
+	bo_handles[2] = signal.bo_handle;
+
+	mes_submit_ib(device, context, bo_handles, 3, ib0.va, 64 * 1024, MES_HW_IP_GFX);
+	r = mes_unmap_bo_va(&ib1);
+	igt_assert_eq(r, 0);
+
+	usleep(MES_WAIT_CHAIN_DELAY_MS * 1000);
+	*signal.cpu_ptr = 1;
+	usleep(MES_SIGNAL_RELEASE_DELAY_MS * 1000);
+
+	mes_free_bo(&ib0);
+	mes_free_bo(&ib1);
+	mes_free_bo(&signal);
+	amdgpu_cs_ctx_free(context);
+}
+
+static void test_gfx_waitmem_timeout(amdgpu_device_handle device)
+{
+	struct mes_ib_node ib_node, signal;
+	amdgpu_context_handle context;
+	amdgpu_bo_handle bo_handles[2];
+	int r;
+
+	r = amdgpu_cs_ctx_create(device, &context);
+	igt_assert_eq(r, 0);
+
+	r = mes_create_ib_bo(device, 64 * 1024, MES_VA_BASE, &ib_node);
+	igt_assert_eq(r, 0);
+	r = mes_create_dst_bo(device, 4096, MES_VA_BASE + 0x10000000,
+			      AMDGPU_VM_PAGE_READABLE | AMDGPU_VM_PAGE_WRITEABLE, &signal);
+	igt_assert_eq(r, 0);
+
+	*signal.cpu_ptr = 0;
+	mes_reset_cmd->ib_fill_wait(mes_reset_cmd, ib_node.cpu_ptr, signal.va, 0);
+
+	bo_handles[0] = ib_node.bo_handle;
+	bo_handles[1] = signal.bo_handle;
+
+	igt_fork(child, 1) {
+		mes_submit_ib(device, context, bo_handles, 2,
+			      ib_node.va, 64 * 1024, MES_HW_IP_GFX);
+	}
+
+	usleep(MES_SIGNAL_RELEASE_DELAY_MS * 1000);
+	*signal.cpu_ptr = 1;
+	igt_waitchildren();
+
+	mes_free_bo(&ib_node);
+	mes_free_bo(&signal);
+	amdgpu_cs_ctx_free(context);
+}
+
+static void test_gfx_writedata_chain_close_fault(amdgpu_device_handle device)
+{
+	uint32_t ib_size = 4096 * 1024;
+	struct mes_ib_node ib_node, dst_node;
+	amdgpu_context_handle context;
+	amdgpu_bo_handle bo_handles[2];
+	int r;
+
+	r = amdgpu_cs_ctx_create(device, &context);
+	igt_assert_eq(r, 0);
+
+	r = mes_create_ib_bo(device, ib_size, MES_VA_BASE, &ib_node);
+	igt_assert_eq(r, 0);
+	r = mes_create_dst_bo(device, MES_DST_BO_SIZE, MES_VA_BASE + 0x1000000,
+			      AMDGPU_VM_PAGE_READABLE | AMDGPU_VM_PAGE_WRITEABLE, &dst_node);
+	igt_assert_eq(r, 0);
+
+	mes_reset_cmd->ib_fill_writedata(mes_reset_cmd, ib_node.cpu_ptr, ib_size / 4, dst_node.va, MES_DST_BO_SIZE);
+
+	bo_handles[0] = ib_node.bo_handle;
+	bo_handles[1] = dst_node.bo_handle;
+
+	igt_fork(child, 1) {
+		mes_submit_ib(device, context, bo_handles, 2,
+			      ib_node.va, ib_size, MES_HW_IP_GFX);
+	}
+
+	igt_waitchildren();
+	usleep(MES_WRITEDATA_TEARDOWN_DELAY_MS * 1000);
+
+	mes_free_bo(&ib_node);
+	mes_free_bo(&dst_node);
+	amdgpu_cs_ctx_free(context);
+}
+
+static void test_gsl_frame_teardown(amdgpu_device_handle device)
+{
+	int num_tenants = 2;
+	struct mes_ib_node gfx_ib, comp_ib, dst;
+	amdgpu_context_handle gfx_ctx, comp_ctx;
+	amdgpu_bo_handle bo_handles[3];
+	int r;
+
+	r = amdgpu_cs_ctx_create(device, &gfx_ctx);
+	igt_assert_eq(r, 0);
+	r = amdgpu_cs_ctx_create(device, &comp_ctx);
+	igt_assert_eq(r, 0);
+
+	r = mes_create_ib_bo(device, 64 * 1024, MES_VA_BASE, &gfx_ib);
+	igt_assert_eq(r, 0);
+	r = mes_create_ib_bo(device, 64 * 1024, MES_VA_BASE + 0x100000, &comp_ib);
+	igt_assert_eq(r, 0);
+	r = mes_create_dst_bo(device, MES_DST_BO_SIZE, MES_VA_BASE + 0x800000,
+			      AMDGPU_VM_PAGE_READABLE | AMDGPU_VM_PAGE_WRITEABLE, &dst);
+	igt_assert_eq(r, 0);
+
+	mes_reset_cmd->ib_fill_writedata(mes_reset_cmd, gfx_ib.cpu_ptr, 16384, dst.va, MES_DST_BO_SIZE);
+	mes_reset_cmd->ib_fill_writedata(mes_reset_cmd, comp_ib.cpu_ptr, 16384, dst.va, MES_DST_BO_SIZE);
+
+	bo_handles[0] = gfx_ib.bo_handle;
+	bo_handles[1] = comp_ib.bo_handle;
+	bo_handles[2] = dst.bo_handle;
+
+	igt_fork(tenant, num_tenants) {
+		int i;
+
+		for (i = 0; i < 50; i++) {
+			mes_submit_ib(device, gfx_ctx, bo_handles, 3,
+				      gfx_ib.va, 64 * 1024, MES_HW_IP_GFX);
+			mes_submit_ib(device, comp_ctx, bo_handles, 3,
+				      comp_ib.va, 64 * 1024, MES_HW_IP_COMPUTE);
+		}
+	}
+
+	igt_waitchildren();
+	usleep(MES_MULTITENANT_TEARDOWN_DELAY_MS * 1000);
+
+	mes_free_bo(&gfx_ib);
+	mes_free_bo(&comp_ib);
+	mes_free_bo(&dst);
+	amdgpu_cs_ctx_free(gfx_ctx);
+	amdgpu_cs_ctx_free(comp_ctx);
+}
+
+static void test_multitenant_writedata_close(amdgpu_device_handle device)
+{
+	int num_tenants = 2;
+	struct mes_ib_node ib_nodes[2], dst_nodes[2];
+	amdgpu_context_handle contexts[2];
+	amdgpu_bo_handle bo_handles[2][2];
+	int i, r;
+
+	for (i = 0; i < num_tenants; i++) {
+		uint64_t ib_va = MES_VA_BASE + i * 0x10000000ULL;
+
+		r = amdgpu_cs_ctx_create(device, &contexts[i]);
+		igt_assert_eq(r, 0);
+
+		r = mes_create_ib_bo(device, 1024 * 1024, ib_va, &ib_nodes[i]);
+		igt_assert_eq(r, 0);
+
+		r = mes_create_dst_bo(device, MES_DST_BO_SIZE, ib_va + 0x800000,
+				      AMDGPU_VM_PAGE_READABLE | AMDGPU_VM_PAGE_WRITEABLE,
+				      &dst_nodes[i]);
+		igt_assert_eq(r, 0);
+
+		mes_reset_cmd->ib_fill_writedata(mes_reset_cmd, ib_nodes[i].cpu_ptr, 256 * 1024,
+				      dst_nodes[i].va, MES_DST_BO_SIZE);
+
+		bo_handles[i][0] = ib_nodes[i].bo_handle;
+		bo_handles[i][1] = dst_nodes[i].bo_handle;
+	}
+
+	igt_fork(tenant, num_tenants) {
+		int j;
+
+		for (j = 0; j < 100; j++) {
+			mes_submit_ib(device, contexts[tenant], bo_handles[tenant], 2,
+				      ib_nodes[tenant].va, 1024 * 1024, MES_HW_IP_GFX);
+		}
+	}
+
+	igt_waitchildren();
+	usleep(MES_MULTITENANT_TEARDOWN_DELAY_MS * 1000);
+
+	for (i = 0; i < num_tenants; i++) {
+		mes_free_bo(&ib_nodes[i]);
+		mes_free_bo(&dst_nodes[i]);
+		amdgpu_cs_ctx_free(contexts[i]);
+	}
+}
+
+int igt_main()
+{
+	amdgpu_device_handle device;
+	int fd = -1;
+
+	igt_fixture() {
+		uint32_t major, minor;
+		int err;
+
+		mes_reset_cmd = get_cmd_base();
+		igt_assert(mes_reset_cmd);
+		fd = drm_open_driver(DRIVER_AMDGPU);
+		err = amdgpu_device_initialize(fd, &major, &minor, &device);
+		igt_require(err == 0);
+	}
+
+	igt_describe("IB chain teardown race");
+	igt_subtest("mes-ib-chain-teardown")
+		test_mes_ib_chain_teardown(device);
+
+	igt_describe("Multi-context WRITE_DATA teardown");
+	igt_subtest("mes-writedata-teardown")
+		test_mes_writedata_teardown(device);
+
+	igt_describe("Self-looping IB teardown");
+	igt_subtest("gfx-chain-close-fault")
+		test_gfx_chain_close_fault(device);
+
+	igt_describe("WAIT_REG_MEM + unmap fault");
+	igt_subtest("gfx-wait-chain-fault")
+		test_gfx_wait_chain_fault(device);
+
+	igt_describe("WAIT_REG_MEM timeout");
+	igt_subtest("gfx-waitmem-timeout")
+		test_gfx_waitmem_timeout(device);
+
+	igt_describe("WRITE_DATA chain close");
+	igt_subtest("gfx-writedata-chain-close-fault")
+		test_gfx_writedata_chain_close_fault(device);
+
+	igt_describe("Multi-tenant GFX+compute");
+	igt_subtest("gsl-frame-teardown")
+		test_gsl_frame_teardown(device);
+
+	igt_describe("Multi-tenant WRITE_DATA");
+	igt_subtest("multitenant-writedata-close")
+		test_multitenant_writedata_close(device);
+
+
+	igt_fixture() {
+		free_cmd_base(mes_reset_cmd);
+		mes_reset_cmd = NULL;
+		amdgpu_device_deinitialize(device);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 08206f8c8..61b81c814 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -55,6 +55,7 @@ if libdrm_amdgpu.found()
 			  'amd_remote_mem',
                           'amd_userptr_invalidation',
                           'amd_close_race',
+                          'amd_mes_reset',
 			]
 	if libdrm_amdgpu.version().version_compare('> 2.4.97')
 		amdgpu_progs +=[ 'amd_syncobj', ]
-- 
2.55.0

