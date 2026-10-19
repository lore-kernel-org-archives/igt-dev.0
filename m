Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907B2CCA490
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 02:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35AB510E74F;
	Mon, 19 Oct 2026 02:49:10 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012017.outbound.protection.outlook.com [40.107.209.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F1410E76F
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2026 02:46:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kesKqgG9KQhSp06HQTQcNImYxgTzEHrWMJvqYf1EcvSrRfs/YMww/jqeU451igj6jyW9//6HvDwMhxJzzlqF0p39VW3uNr6xzlDIPUvGz8LQGBWdlmpjpT0Q9Bau23KF2bjBiFbYW+qV44aOs9jxalEVi4Xi8nuDgIo10xb4FDYpc4GOOjeZGI70u6Nvlmn2uBqtVX+z9N7PBSw4VtyrEOv/oWJYU1pkMtyIyw2xfTIckfx25gBUtbu1YMaKA2IsvEFijMnEGAhbEHoGNkHRxUyei9dAr2DzfCE3DarsEd23YDzsQ2MWjhhBgia4oZj4gTUhn+XCA0MRNTTBH4jl5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEurrj5EWoedORrNJ6cQh3btSxCQeWOs+IptTBEDRNk=;
 b=AUaGhJMO1q6yTTrco6tugNj7yXG9+NYJTrJRK9C+oBMezLcKmo+PvbPSIHeGCR7xkqdYAitEICP6Im+edXYFKKCSyJUhEYVKZMZOOsoapCLbYU72wbnujVRMU9M/e61492Yn8GeAjItL3rmQd/9LkFHX/ifJ9uZWzoEK2wzVaff8auG+Xf2+Y+NafWQ2tx5DFZ7HiU4ZivYNAshlY+XgzlYwAUHgUnfrO+PPMXxgOOYVL50+h4tME7xpCLDlFWn/EKODPkoME0ScX5VDNCzFGKfrSsqNw7z1KnDTNKNcUdNjZDfnsjlX6GQ7RhfTw0RR4bz7uXy671dzYLtn63VGrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEurrj5EWoedORrNJ6cQh3btSxCQeWOs+IptTBEDRNk=;
 b=S6Gw/3pxO/dLQ3p3nTWFGxWfd5d+qF648vO1q6ZBvmCAt6XAuOEN+g8ZeW/0VWor4Rk0cPLMeJksH5Ka2vGWoJ7o/GlrdeKBDzrqdz2pRch8vDKLMupbaLaKba+ndhLrTbcEPxQ2AQSrH03V0tkYDNEnfc837eJdB+aw0al9UDs=
Received: from MW4PR03CA0357.namprd03.prod.outlook.com (2603:10b6:303:dc::32)
 by MW4PR12MB6921.namprd12.prod.outlook.com (2603:10b6:303:208::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 02:46:37 +0000
Received: from MWH0EPF000D8953.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::26) by MW4PR03CA0357.outlook.office365.com
 (2603:10b6:303:dc::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 02:46:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000D8953.mail.protection.outlook.com (10.167.249.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 02:46:36 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 18 Oct
 2026 21:46:27 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sun, 18 Oct 2026 21:46:27 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 3/3] tests/amdgpu: add native MES reset subtests
Date: Sun, 18 Oct 2026 22:45:49 -0400
Message-ID: <20261019024626.17647-3-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019024626.17647-1-vitaly.prosyak@amd.com>
References: <20261019024626.17647-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000D8953:EE_|MW4PR12MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: a594d850-9ec2-44c9-931c-08df2d8b31ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|6133799003|18002099003|22082099003|11063799006|10067099003|261009223027099003|261009221227099003|56012099006;
X-Microsoft-Antispam-Message-Info: VNSjGRtsVLpWd4p85QtWkznPD29AYx2ix7x7qrGfnclUX4b6Hc1necpA0HS6mBLa8LA+IDp8u1H1AD7xxPJct23x7CzPFnSNq70bQMQWLlYkbAu9PsrX69xRFbMyiSGSpVvmn+eMkxRZDRT5jLSm/CRhkbJq9XytmC875Jf9fENhsGPamDx5KPyzJT6akUAdE/tyJnu642EOeRySA91FnHcl3ydWrPvb0LeRCr8IQVDC6dQQHFtkTNvJNQUf0rIXTkQlHgGm5ZdLg00iFpbmipynC8XolAk1opROhb1RbHKjMlCwfPgUDyHiUbU5OutanIh0LAAg/9rJSCAUjS6RauFLE2isszYlwH9Y3wqaAtnPQ6r/5YjTP81/lTVQHiP6CCgOGOWlZ/J9mLQ8ZtZhvFC618B7XN8XO2ioCPm7dONth8jiAf3nYakTK/psmWBLD7Fl8NqsBO6ByS/Mmgt1hxCYueqdflhupNpBMRIDQe3CNPV2Iacc41Wu7n8kmpWRnWqokksX3S/6FVsI8YCXdqmnYSOuEHcuC8ARwflfd4Tj9tzCaSS4J6JuR3fdgaAwLTxvc/YDE+FuyU7B8r75cvzFejUlfT7AU4xCrHdoRnaYbMJFj6spLZ565J+hAjl8S9d9BhWf50juuwhEhYUDhworaPGhfhqZvsxmusGfupH8WjyYao9NLnuytwKrBWNFLM9iczidn2NTLaFRx/BjaQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(6133799003)(18002099003)(22082099003)(11063799006)(10067099003)(261009223027099003)(261009221227099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: b2UWEGVROqi3DB1sFFcKLikxPV+BMI1OYUK+K1/WNEkULbw/5bqE+IU/1wt+3acQCZcSJPw2GM9tTF73ZjGxMft+8Cd7MIet5QvvfYC83cHwdE2/Rtrkp+HZdbnN7dsRxuJuWzp02YW25jIF+SNdNFGlts3EkjoVZKUXoUsQTSNFY7t0MF5tOMMR4XKPKE0IWtoDap7Nq8PRGLeb5pSBp5SXfM7sZxrYrU6fg3wWxWylK+DixfAF/gAsojzdtlj/WzbvGGKrvShX08+DyDkqBsTI/19Z5Q5kyPVG47VPDaYYL6ECU/L68/h60siKoY7eU5Lta0XGz/kLoK6v7Fr1umIjeQVtSROhfUQg8Hbo0NqUEoFbTPNtKshtWafI00VSmrPQghM6gMldtbtBX0yFExyC4fEYiryUka5xO/l8biPeCNjH+DDbe+ve3goxHvjn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 02:46:36.5779 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a594d850-9ec2-44c9-931c-08df2d8b31ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000D8953.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6921
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

Add amd_mes_reset as a native IGT test with one subtest per MES/GFX teardown
scenario: chained IB teardown, multi-context WRITE_DATA, self-looping IB,
WAIT_REG_MEM followed by VA unmap, released WAIT_REG_MEM, WRITE_DATA-chain
teardown, mixed GFX/compute tenants, and multi-tenant WRITE_DATA.

Use the MES resource/submission helpers and amdgpu_cmd_base IB builders so
each subtest focuses on workload setup, teardown ordering, and the fault
window. Run the scenarios under IGT fixtures and report each case independently.

For continuous submitters, stop children with SIGTERM and reap them before
freeing contexts and BOs. In the wait-chain case, unmap the second IB BO
mapping while retaining its VA reservation until the fault window has been
released, then clean up all BOs.

Split the WRITE_DATA-chain teardown workload across two 2 MiB IBs. The
original 4 MiB IB requires 0x100000 DWORDs, which exceeds the 20-bit IB
length field. Fill each IB with WRITE_DATA traffic to one half of the 4
MiB destination and chain them cyclically. Submit both IB BOs with the
destination BO; each chained length is 0x80000 DWORDs and is within the
field limit while preserving the full write workload.

Register amd_mes_reset directly in tests/amdgpu/meson.build.

Originally designed by Jatin Kataria <jkataria@netflix.com>; ported to
IGT and redesigned to fit IGT architecture.

V2: Split the over-limit WRITE_DATA IB into two legal 2 MiB IBs and chain them
    to preserve the 4 MiB stress workload. Jesse Zhang identified the length-field
    overflow and recommended chaining legal-sized IBs.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c   |  20 +-
 lib/amdgpu/amd_ip_blocks.h   |   4 +
 tests/amdgpu/amd_mes_reset.c | 453 +++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build     |   1 +
 4 files changed, 477 insertions(+), 1 deletion(-)
 create mode 100644 tests/amdgpu/amd_mes_reset.c

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 2a438202b..8abde9228 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -46,7 +46,7 @@ static void amdgpu_ib_fill_nop(struct amdgpu_cmd_base *base, uint32_t *ib, uint3
 }
 
 static void amdgpu_ib_fill_chain(struct amdgpu_cmd_base *base, uint32_t *ib, uint32_t ib_dwords,
-				 uint64_t next_va, uint32_t next_size_dw)
+				uint64_t next_va, uint32_t next_size_dw)
 {
 	uint32_t last;
 	(void)base;
@@ -85,6 +85,23 @@ static void amdgpu_ib_fill_writedata(struct amdgpu_cmd_base *base, uint32_t *ib,
 	amdgpu_ib_fill_nop_range(ib, off, ib_dwords);
 }
 
+static void amdgpu_ib_fill_writedata_chain(struct amdgpu_cmd_base *base, uint32_t *ib,
+					   uint32_t ib_dwords, uint64_t dst_va,
+					   uint32_t dst_size, uint64_t next_va,
+					   uint32_t next_size_dw)
+{
+	uint32_t chain_dw;
+
+	igt_assert(ib_dwords >= 12);
+	chain_dw = ib_dwords - 4;
+	amdgpu_ib_fill_writedata(base, ib, chain_dw, dst_va, dst_size);
+	ib[chain_dw] = PACKET3(PACKET3_INDIRECT_BUFFER, 2);
+	ib[chain_dw + 1] = lower_32_bits(next_va);
+	ib[chain_dw + 2] = upper_32_bits(next_va);
+	ib[chain_dw + 3] = (next_size_dw & INDIRECT_BUFFER_SIZE_MASK) |
+			   INDIRECT_BUFFER_VALID | INDIRECT_BUFFER_CHAIN;
+}
+
 static void amdgpu_ib_fill_wait(struct amdgpu_cmd_base *base, uint32_t *ib, uint32_t ib_dwords,
 				uint64_t signal_va, uint64_t next_ib_va, uint32_t next_ib_size_dw)
 {
@@ -1399,6 +1416,7 @@ get_cmd_base(void)
 	base->ib_fill_nop = amdgpu_ib_fill_nop;
 	base->ib_fill_chain = amdgpu_ib_fill_chain;
 	base->ib_fill_writedata = amdgpu_ib_fill_writedata;
+	base->ib_fill_writedata_chain = amdgpu_ib_fill_writedata_chain;
 	base->ib_fill_wait = amdgpu_ib_fill_wait;
 
 	return base;
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index aaf8a409b..3c694ddc5 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -543,6 +543,10 @@ struct amdgpu_cmd_base {
 				uint64_t next_va, uint32_t next_size_dw);
 	void (*ib_fill_writedata)(struct amdgpu_cmd_base *base, uint32_t *ib, uint32_t ib_dwords,
 				uint64_t dst_va, uint32_t dst_size);
+	void (*ib_fill_writedata_chain)(struct amdgpu_cmd_base *base,
+				uint32_t *ib, uint32_t ib_dwords,
+					uint64_t dst_va, uint32_t dst_size,
+					uint64_t next_va, uint32_t next_size_dw);
 	void (*ib_fill_wait)(struct amdgpu_cmd_base *base, uint32_t *ib, uint32_t ib_dwords,
 			     uint64_t signal_va, uint64_t next_ib_va,
 			     uint32_t next_ib_size_dw);
diff --git a/tests/amdgpu/amd_mes_reset.c b/tests/amdgpu/amd_mes_reset.c
new file mode 100644
index 000000000..9906698eb
--- /dev/null
+++ b/tests/amdgpu/amd_mes_reset.c
@@ -0,0 +1,453 @@
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
+	mes_reset_cmd->ib_fill_wait(mes_reset_cmd, ib0.cpu_ptr, ib0.size_bytes / 4,
+			signal.va, ib1.va, ib1.size_bytes / 4);
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
+	mes_reset_cmd->ib_fill_wait(mes_reset_cmd, ib_node.cpu_ptr, ib_node.size_bytes / 4,
+			signal.va, 0, 0);
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
+	uint32_t ib_size = 2 * 1024 * 1024;
+	struct mes_ib_node ib_nodes[2], dst_node;
+	amdgpu_context_handle context;
+	amdgpu_bo_handle bo_handles[3];
+	int r;
+
+	r = amdgpu_cs_ctx_create(device, &context);
+	igt_assert_eq(r, 0);
+
+	r = mes_create_ib_bo(device, ib_size, MES_VA_BASE, &ib_nodes[0]);
+	igt_assert_eq(r, 0);
+	r = mes_create_ib_bo(device, ib_size, MES_VA_BASE + 0x400000, &ib_nodes[1]);
+	igt_assert_eq(r, 0);
+	r = mes_create_dst_bo(device, MES_DST_BO_SIZE, MES_VA_BASE + 0x1000000,
+			      AMDGPU_VM_PAGE_READABLE | AMDGPU_VM_PAGE_WRITEABLE, &dst_node);
+	igt_assert_eq(r, 0);
+
+	mes_reset_cmd->ib_fill_writedata_chain(mes_reset_cmd, ib_nodes[0].cpu_ptr,
+					      ib_nodes[0].size_bytes / 4,
+					      dst_node.va + ib_size, MES_DST_BO_SIZE - ib_size,
+					      ib_nodes[1].va, ib_nodes[1].size_bytes / 4);
+	mes_reset_cmd->ib_fill_writedata_chain(mes_reset_cmd, ib_nodes[1].cpu_ptr,
+					      ib_nodes[1].size_bytes / 4,
+					      dst_node.va, ib_size,
+					      ib_nodes[0].va, ib_nodes[0].size_bytes / 4);
+
+	bo_handles[0] = ib_nodes[0].bo_handle;
+	bo_handles[1] = ib_nodes[1].bo_handle;
+	bo_handles[2] = dst_node.bo_handle;
+
+	igt_fork(child, 1) {
+		mes_submit_ib(device, context, bo_handles, 3,
+			      ib_nodes[0].va, ib_nodes[0].size_bytes, MES_HW_IP_GFX);
+	}
+
+	igt_waitchildren();
+	usleep(MES_WRITEDATA_TEARDOWN_DELAY_MS * 1000);
+
+	mes_free_bo(&ib_nodes[0]);
+	mes_free_bo(&ib_nodes[1]);
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

