Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8047CCF2D4
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 02:47:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434AA10E196;
	Mon, 19 Oct 2026 02:47:37 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012059.outbound.protection.outlook.com
 [40.93.195.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD8A10E769
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2026 02:46:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KlzwgDig7x6IW8eNbqLhHC4r94G+uvRoe1nZBmrEODA6Izp2JbHarybPjPzXn6+K/O4D8vfzk/UJN2b0cQSJbkJEfN+EEKbwEHYpCIxGKJxsYnFcQoAE93WWKWYY+XXiEK4K+1C646xEQbBDnxsmmm67XXp21ju4NQ4mboM97s7rAscTPdLDpoUxQ0IxApgPxw722HsMB6PRMGRFobEtPhqZcBgOtQ7qJ2x7g1D72RTVyp+SoScSy1S170wNGDMt9hfofQlMfPFMa7HXPHD9NkTEZ5ZcTRDFUCmbrQb82sxUsrXiQWz2S13TQJUT7/wTb2IzgZXmCH9YxwC2YsUtew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhZ5kldIxX2RNK6R0BSmwgRTSyAnAEBlw3QIefUAUBw=;
 b=DwtB/Eywomjw2i3CCaZrQPutes859nC/vYX4GbFZ/NsProUGXq3jJiAHhh5QEx2xAANTvzhukxSvbO3ck7/vft6ntbBzz7z4SUoBvSCYWSWEHWfphV+uwyzhI1OQf5L6yPi+vmYPw8YWeARku/0R4OIRVolocsgk6YHJ2Y6pj1rBvQaQfXdyRVSb7YEIJmIHpTlVrgLNSobNTB75rrFnZH9+pbFpnCUyVpuuSSfuvyQ3y6LyaOqcvQpJkpP6+Puu7mGuQO96tQ1Cqb4Glt+DZBvu/Ni07Pisj+gAIDDq/BXldV5QYpUUnblza4MQU1TZC8Q0M+j5y1AJ5aMhwvuIUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhZ5kldIxX2RNK6R0BSmwgRTSyAnAEBlw3QIefUAUBw=;
 b=WyBQ7tJ9o42EgfPYhyCQpOxpn1fmpU4GEJVowejk3p3JLMG6Gse4eNTN2/vz5q/UeWqmq+OuULfjtFeTXZp9szqnM8plaCySBf1VMk3oTLlCSX9bQQzhCVmYctAV8IbEcnJ6n7HAYaUvXCeCcWmS5o3qdB/Wh1LNQM1emP7c0H8=
Received: from MW4PR03CA0349.namprd03.prod.outlook.com (2603:10b6:303:dc::24)
 by FT1PR12MB623484.namprd12.prod.outlook.com (2603:10b6:170:2e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 02:46:36 +0000
Received: from MWH0EPF000D8953.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::78) by MW4PR03CA0349.outlook.office365.com
 (2603:10b6:303:dc::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 02:46:35 +0000
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
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 02:46:34 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 18 Oct
 2026 21:46:26 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sun, 18 Oct 2026 21:46:26 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 2/3] lib/amdgpu: add indirect buffer builders to command base
Date: Sun, 18 Oct 2026 22:45:48 -0400
Message-ID: <20261019024626.17647-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019024626.17647-1-vitaly.prosyak@amd.com>
References: <20261019024626.17647-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000D8953:EE_|FT1PR12MB623484:EE_
X-MS-Office365-Filtering-Correlation-Id: 66083f63-8e65-42b4-ff4c-08df2d8b3094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|6133799003|18002099003|10067099003|22082099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: cJ7tjMDv8HuZFE0zTd/91JfN5uNkGCi6iEYD8UvMfOttY46Y1J3RPlaRc/XTWmVp1kX5R65r5mtNQmx6Brk3Nu49shiv+bcyk8P/Dm5wH3wWE9FUTfNNoh6t6LgpD5Cjqrri/vf5Atiqaznpjo5SdqaiMekJbsStMa8J+JrJBxKUUsnKOx4zQsX1iPIJbxmdn5FQJyRklRyPKzQQwVgsrVZV2akMGmV1SXDZin2sJa+ApVkix68hGSSWlnwP3o23Ih/BuqTwHk78AECkSnUYa8farctLAR0A1LeKFFekJWSnxM4qA2gliTyGpgxgVmA7F1UpnYjVdUNB/TvZDFgMBnY0B75pZihdnt1hv2gpKi/pdmPPC2DnjWRnP0FGo27Re4QOaLKlNIGdpc5x9I4HlwlLI2IQ96lCQ1fryZqDj/yDWm6sqP4LkE2rcife/AUnSyAucEad4ybfF3U8cN3ZAjVvTgOH0MIMB6OC7ZFEdbuVJ5uXQSa3sQZKlku3+1ppHVC8SFwXJoqa5QJx8ybOntWmnEtlwObQAJx4rOWoHPm4/zrn0/7tO2QHPwpleLb20id0vcDR/2KTPQ77b+Dlad8ZlZflfb52W0LfhG90SaGhzaBhgZ5xQ8RJltzNkoDcf3LE2wph1tB/4sWjt3tvb5xj5MFRs08Lgpk/xzxVEeCi2LKTQQ5jIlqOJmK68w8TG6Fib/Z2sn4SAXFO+EV8Dw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(6133799003)(18002099003)(10067099003)(22082099003)(261009223027099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OXrANjj+1RuDoo4QNhNLolpM9WC4PRgFgz/Q+nhbKWzCeFVs3okZcRpaQPCQHemr+fym3Q1HfLodsUOk6sewhet02j4rE0PzQUwWlruKYRnsCXPZMYeiBb9xKX+eF1VGVqT18qnKuRClq4GzXIa3Zrjx2lVjU57P9FNYlC/8WUncE5ZTdG1MDA2CNBeX7jRGkmvZujzK78LrOggac/YuGSMKJlpE37cHVIyxCeiHclAROIgN2jlC5XHS2RVOXpZ7YishF62vzgSWOGfYROHja4X3Hn6N1UsfsaUNuEKIyeci9gkyJwu6lv92PDvX+ByWBh2i9dqbMe3SkZfzZNPcIqw0hrzfqiERQslezUp251ohe1FvXvw6jUtCL0N24Y+6m9XimPOVDRiU7u1F5GsYSGIxQCEATTuPLTul1OWcvUaqD0cU1Yc+A7JyThmFiUO+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 02:46:34.7335 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66083f63-8e65-42b4-ff4c-08df2d8b3094
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000D8953.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR12MB623484
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

Expose generic helpers for filling caller-owned indirect buffers with NOP packets,
chained indirect-buffer packets, WRITE_DATA traffic, and WAIT_REG_MEM sequences.
Install these builders as amdgpu_cmd_base callbacks alongside the existing
command-buffer operations. Keep PM4 encodings in shared AMD definitions; these
packet formats do not require ASIC-specific IP-block hooks.

The MES reset tests use the callbacks to prepare teardown workloads while keeping
packet construction out of the test source.

Originally designed by Jatin Kataria <jkataria@netflix.com>; ported to IGT and
redesigned to fit IGT architecture.

V2: Set the WRITE_DATA count to cover all four data DWORDs. Emit length-correct
    NOP padding and make the WAIT/chain builder use the allocated source and target
    IB sizes, preventing the chain packet from overlapping padding or fetching
    beyond its target. Jesse Zhang identified the malformed WRITE_DATA count,
    packet boundary, and oversized target length that prompted these fixes.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_PM4.h       |  3 ++
 lib/amdgpu/amd_ip_blocks.c | 93 ++++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_ip_blocks.h | 10 ++++
 3 files changed, 106 insertions(+)

diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h
index 923826656..ffee344ef 100644
--- a/lib/amdgpu/amd_PM4.h
+++ b/lib/amdgpu/amd_PM4.h
@@ -193,6 +193,9 @@
 		 */
 
 #define PACKET3_INDIRECT_BUFFER                         0x3F
+#define         INDIRECT_BUFFER_SIZE_MASK                0x000FFFFF
+#define         INDIRECT_BUFFER_VALID                    (1 << 23)
+#define         INDIRECT_BUFFER_CHAIN                    (1 << 20)
 #define PACKET3_PROTECTED_FENCE_SIGNAL                  0xd0
 
 #define	PACKET3_WRITE_DATA				0x37
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 3e3adafac..2a438202b 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -20,6 +20,95 @@
 #include "amd_gfx_v8_0.h"
 #include "ioctl_wrappers.h"
 
+static void amdgpu_ib_fill_nop_range(uint32_t *ib, uint32_t start_dw, uint32_t end_dw)
+{
+	uint32_t remaining = end_dw - start_dw;
+
+	while (remaining >= 2) {
+		uint32_t packet_dw = remaining > 0x4001 ? 0x4001 : remaining;
+		uint32_t payload_dw = packet_dw - 1;
+
+		ib[start_dw++] = PACKET3(PACKET3_NOP, packet_dw - 2);
+		while (payload_dw > 0) {
+			ib[start_dw++] = 0;
+			payload_dw--;
+		}
+		remaining = end_dw - start_dw;
+	}
+	if (remaining)
+		ib[start_dw] = CP_PACKET2;
+}
+
+static void amdgpu_ib_fill_nop(struct amdgpu_cmd_base *base, uint32_t *ib, uint32_t ib_dwords)
+{
+	(void)base;
+	amdgpu_ib_fill_nop_range(ib, 0, ib_dwords);
+}
+
+static void amdgpu_ib_fill_chain(struct amdgpu_cmd_base *base, uint32_t *ib, uint32_t ib_dwords,
+				 uint64_t next_va, uint32_t next_size_dw)
+{
+	uint32_t last;
+	(void)base;
+	igt_assert(ib_dwords >= 4);
+	last = ib_dwords - 4;
+	amdgpu_ib_fill_nop_range(ib, 0, last);
+	ib[last] = PACKET3(PACKET3_INDIRECT_BUFFER, 2);
+	ib[last + 1] = lower_32_bits(next_va);
+	ib[last + 2] = upper_32_bits(next_va);
+	ib[last + 3] = (next_size_dw & INDIRECT_BUFFER_SIZE_MASK) |
+		       INDIRECT_BUFFER_VALID | INDIRECT_BUFFER_CHAIN;
+}
+
+static void amdgpu_ib_fill_writedata(struct amdgpu_cmd_base *base, uint32_t *ib, uint32_t ib_dwords,
+				     uint64_t dst_va, uint32_t dst_size)
+{
+	uint32_t off = 0;
+	uint32_t dst_off = 0;
+	const uint32_t packet_dwords = 8;
+
+	(void)base;
+	while (off + packet_dwords <= ib_dwords) {
+		uint64_t addr = dst_va + (dst_off % dst_size);
+
+		ib[off] = PACKET3(PACKET3_WRITE_DATA, 6);
+		ib[off + 1] = WRITE_DATA_DST_SEL(5);
+		ib[off + 2] = lower_32_bits(addr & ~0x3ULL);
+		ib[off + 3] = upper_32_bits(addr);
+		ib[off + 4] = 0xDEADBEEF;
+		ib[off + 5] = 0xCAFEBABE;
+		ib[off + 6] = 0x12345678;
+		ib[off + 7] = 0xABCD0000 | (off & 0xFFFF);
+		off += packet_dwords;
+		dst_off += 16;
+	}
+	amdgpu_ib_fill_nop_range(ib, off, ib_dwords);
+}
+
+static void amdgpu_ib_fill_wait(struct amdgpu_cmd_base *base, uint32_t *ib, uint32_t ib_dwords,
+				uint64_t signal_va, uint64_t next_ib_va, uint32_t next_ib_size_dw)
+{
+	uint32_t chain_dw;
+
+	(void)base;
+	igt_assert(ib_dwords >= 11);
+	chain_dw = ib_dwords - 4;
+	ib[0] = PACKET3(PACKET3_WAIT_REG_MEM, 5);
+	ib[1] = WAIT_REG_MEM_FUNCTION(3) | WAIT_REG_MEM_MEM_SPACE(1) |
+		WAIT_REG_MEM_ENGINE(0);
+	ib[2] = lower_32_bits(signal_va);
+	ib[3] = upper_32_bits(signal_va);
+	ib[4] = 1;
+	ib[5] = 0xFFFFFFFF;
+	ib[6] = 0x00000004;
+	amdgpu_ib_fill_nop_range(ib, 7, chain_dw);
+	ib[chain_dw] = PACKET3(PACKET3_INDIRECT_BUFFER, 2);
+	ib[chain_dw + 1] = lower_32_bits(next_ib_va);
+	ib[chain_dw + 2] = upper_32_bits(next_ib_va);
+	ib[chain_dw + 3] = (next_ib_size_dw & INDIRECT_BUFFER_SIZE_MASK) |
+			   INDIRECT_BUFFER_VALID | INDIRECT_BUFFER_CHAIN;
+}
+
 /*
  * SDMA functions:
  * - write_linear
@@ -1307,6 +1396,10 @@ get_cmd_base(void)
 	base->emit_repeat = cmd_emit_repeat;
 	base->emit_at_offset = cmd_emit_at_offset;
 	base->emit_buf = cmd_emit_buf;
+	base->ib_fill_nop = amdgpu_ib_fill_nop;
+	base->ib_fill_chain = amdgpu_ib_fill_chain;
+	base->ib_fill_writedata = amdgpu_ib_fill_writedata;
+	base->ib_fill_wait = amdgpu_ib_fill_wait;
 
 	return base;
 }
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 4f731bf04..aaf8a409b 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -20,6 +20,7 @@
 
 #include "amd_registers.h"
 #include "amd_family.h"
+#include "amd_PM4.h"
 
 #ifndef MIN
 #define MIN(a, b) ((a) < (b) ? (a) : (b))
@@ -537,6 +538,15 @@ struct amdgpu_cmd_base {
 	void (*emit_repeat)(struct amdgpu_cmd_base  *base, uint32_t value, uint32_t number_of_times);
 	void (*emit_at_offset)(struct amdgpu_cmd_base  *base, uint32_t value, uint32_t offset_dwords);
 	void (*emit_buf)(struct amdgpu_cmd_base  *base, const void *ptr, uint32_t offset_bytes, uint32_t size_bytes);
+	void (*ib_fill_nop)(struct amdgpu_cmd_base *base, uint32_t *ib, uint32_t ib_dwords);
+	void (*ib_fill_chain)(struct amdgpu_cmd_base *base, uint32_t *ib, uint32_t ib_dwords,
+				uint64_t next_va, uint32_t next_size_dw);
+	void (*ib_fill_writedata)(struct amdgpu_cmd_base *base, uint32_t *ib, uint32_t ib_dwords,
+				uint64_t dst_va, uint32_t dst_size);
+	void (*ib_fill_wait)(struct amdgpu_cmd_base *base, uint32_t *ib, uint32_t ib_dwords,
+			     uint64_t signal_va, uint64_t next_ib_va,
+			     uint32_t next_ib_size_dw);
+
 };
 
 struct amdgpu_cmd_base *get_cmd_base(void);
-- 
2.55.0

