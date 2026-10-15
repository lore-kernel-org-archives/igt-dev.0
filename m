Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588C0CA9EDE
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 04:04:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E75310EB63;
	Thu, 15 Oct 2026 04:04:38 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011071.outbound.protection.outlook.com [52.101.52.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D90510EB69
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 04:02:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgCqVJ+WlwwyQ4vQ3wM9kfbyHLINZyVKgQwn4sjwYgboZ5SVPpAMxHI/RIcSnctYC+dC1vVMiU81C53i5UfyqL8QVBgvM3zjRxnlRLbH3mpRChJPELDJ25CE96P4VUhQUon6sqlN2kY+B6yw4UKDAV5p6h9+i9RpRQ+lscft3i41Q+a0IjIAVjyEJEqg4sFVDk/YrX38RgkJUQNS5x252Ypr+CVowk43xdfnqR1pY5LhBCHUoe5LIvqQT1eFT0oJeLZKJ7jwKSq2wmVTpH04cY+nfGFAzyWB8Qtm+W123qBLDmPqI7LKm2nyaezzI4ehkAYE0Szcje8Qe6lx7Q3DgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ic0JNjd/pjQUvTv/bnkiyx92hk3fe42RQRd6Tplr2jQ=;
 b=ERbfZKuxwXcWs3+ra9mbmw7dV/9BpLCL8Rc031W+g4pAJEhWvpNjURg46FevuAo+YQYGEYjcjs+8Z0hcjOWRLh+ZiCHfEW4v46BKchD4zKwG8JD0oiqB2HdZmPq3y2+wv2ybvRKUVhhYa9rg7g3LsHx6qhY65aE7pMeQergNhmPfZKUIoyt6O7Jx1shOIF6Cx/+pw+ooNVMngkVURS7M6c8L0Ehh0PDYiAJsxudcYjRhH5wJlIeK5KIcrkFqdi/H2lzlwboPrxTw/dn7cPQ6UGTE8rtnEn/PObOOliews1nn28+Hgd9m8nkWU10NkSi7kIFUOMSOB4Z1tW9KBP839g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ic0JNjd/pjQUvTv/bnkiyx92hk3fe42RQRd6Tplr2jQ=;
 b=LRpW1gkLc1XGGcniPdaUieV99wqxNAnvjUksQL4KpzP/2tvfkejUWgSMKa9F/mU4SG4ddvq1hbccRQN81mV9sqSkCjOO2dcsRmSqIOgFu3BWpvJJl/3PNt6HYywVAt4jSqQq+fvlH5finWHpPyAsAe0ok8BK2j2MUHfY9tiu39k=
Received: from SJ0PR13CA0173.namprd13.prod.outlook.com (2603:10b6:a03:2c7::28)
 by PH8PR12MB6772.namprd12.prod.outlook.com (2603:10b6:510:1c7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Thu, 15 Oct
 2026 04:02:47 +0000
Received: from SJ1PEPF000037A2.namprd04.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::79) by SJ0PR13CA0173.outlook.office365.com
 (2603:10b6:a03:2c7::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Thu, 15
 Oct 2026 04:02:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A2.mail.protection.outlook.com (10.167.244.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Thu, 15 Oct 2026 04:02:45 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 23:02:38 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 14 Oct 2026 23:02:38 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jatin Kataria
 <jkataria@netflix.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>
Subject: [PATCH 2/3] lib/amdgpu: add indirect buffer builders to command base
Date: Thu, 15 Oct 2026 00:00:50 -0400
Message-ID: <20261015040236.112017-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015040236.112017-1-vitaly.prosyak@amd.com>
References: <20261015040236.112017-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A2:EE_|PH8PR12MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a37ee39-6d01-4fdd-82b0-08df2a712b27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|11063799006|56012099006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: /H3THZlbVo5rUI5py+b8fcI1Pr/+AC2xtEsLBNFzBxqdHLs0eq/GbhmHm8y2mpIr/YLFazsVH0R6nxb2CNxUMk/cWQeqF8D2+rOUw4MbSE2VRb+RSgkSF8/Z8EMNd0q0notmeIucVhK/KKxCnb2XPfWJ3HOjzB93EpPa9unSyLECMzLd5gQ+8yD0Fe1y2ebXGDOm8BYvrrjHjCFeFNmfkmFheMeK4oTAE+y5jGBKsJWQp/CyUhmYTxI4p08ptA6DcewOVNaExkBzimH1+3d4qeQG/PuWvd7tfUpJFVSzWgTFGILJc2Ag26Gycz9g3bwuwDIOBdInJTQ2Yv0Duw5rdCLFxfHdbjUkq+CLtKBh99vT55wZ3gZ2HbDRteB6S9pEacO/sgM/tCobar3P5RZ5kbEGhePI3yvDs7NwU8guKS3amDLxlOuMFcFr/JNB5og927L0lb/OEN+9yci+VcMV3HtP9Xo808MJMUsvyMD8Oj552ZsX9tz+DFVZDLIE4EhFQ+WRonzyYQS0szbGrBMW/a3Mowk5ihstg9UZWkeUdhTUc+vxwM6feq0uTMkgYP5sR8D5OjOTfPj6ANGRfhIYSKzyEtqitdxuBvp2voO0DvkPpWd0XlKKyO+uHlk5GEG3fK1Pnk4Rx9VmTwvOAJ+svyupvhYBZLE8GZoub+CPbj2TF2Uep0LTsEDjmV+Ddhgp
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: x8sUQ944GfnInvDmGRX17sqneIdNDzPincLhjUMJu/KoUsVVqlXnXoMcHPFLhhPlnT7a7PXWaudrkSKAF2G6PP2EmRCr1aUJhjUGeFgrCrL43MoO2qR6n5B6ZAYqLBRt+bm7aMevyBMp7MejvKy9GK/4F0JAkbE+V2ts7h07gJvUW/1irC02ZBMbCu2K7/xTMo0JYI6TEPHwaW7/dcjE4Q6kN83cdkkYbPX6T3IRaq8BAzVh7jotWtEz/7cugPq2aJagh04Z0IZZD9p/Ozq1CdFJCfXmyD+GZJlZqIIBLrae4bWuRBR4fUbgwCaH4mzBmfhUMm+KkwRDUPPqsL17gYBaMBtEwdnPnCFMPoh4oVsjjwA8os6XpyjNySkb4gxJPbZfKFRIXkPeTMtNFDYiIosck73ZcDdJ3A2e8LbaV6KH9dNlX5hEgfALnJtmFPwp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 04:02:45.2879 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a37ee39-6d01-4fdd-82b0-08df2a712b27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000037A2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6772
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

Expose generic helpers for filling caller-owned indirect buffers with NOP
packets, chained indirect-buffer packets, WRITE_DATA traffic, and
WAIT_REG_MEM sequences.

Install these builders as amdgpu_cmd_base callbacks alongside the existing
command-buffer operations. Keep the PM4 encodings in the shared AMD PM4
definitions; these packet formats are generic and do not require
ASIC-specific IP-block hooks.

The MES reset tests use the callbacks to prepare teardown workloads while
keeping packet construction out of the test source.

Originally designed by Jatin Kataria <jkataria@netflix.com>; ported to
IGT and redesigned to fit IGT architecture.


Cc: Jatin Kataria <jkataria@netflix.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_PM4.h       |  3 ++
 lib/amdgpu/amd_ip_blocks.c | 86 ++++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_ip_blocks.h |  9 ++++
 3 files changed, 98 insertions(+)

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
index 3e3adafac..831f688c2 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -20,6 +20,88 @@
 #include "amd_gfx_v8_0.h"
 #include "ioctl_wrappers.h"
 
+static void amdgpu_ib_fill_nop(struct amdgpu_cmd_base *base, uint32_t *ib, uint32_t ib_dwords)
+{
+        uint32_t i;
+
+        (void)base;
+
+        for (i = 0; i < ib_dwords; i++)
+                ib[i] = PACKET3(PACKET3_NOP, 0);
+}
+
+static void amdgpu_ib_fill_chain(struct amdgpu_cmd_base *base, uint32_t *ib, uint32_t ib_dwords,
+                          uint64_t next_va, uint32_t next_size_dw)
+{
+        uint32_t last = ib_dwords - 4;
+        uint32_t i;
+
+        (void)base;
+
+        for (i = 0; i < last; i++)
+                ib[i] = PACKET3(PACKET3_NOP, 0);
+
+        ib[last] = PACKET3(PACKET3_INDIRECT_BUFFER, 2);
+        ib[last + 1] = lower_32_bits(next_va);
+        ib[last + 2] = upper_32_bits(next_va);
+        ib[last + 3] = (next_size_dw & INDIRECT_BUFFER_SIZE_MASK) |
+                       INDIRECT_BUFFER_VALID | INDIRECT_BUFFER_CHAIN;
+}
+
+static void amdgpu_ib_fill_writedata(struct amdgpu_cmd_base *base, uint32_t *ib, uint32_t ib_dwords,
+                              uint64_t dst_va, uint32_t dst_size)
+{
+        uint32_t off = 0;
+        uint32_t dst_off = 0;
+        const uint32_t packet_dwords = 8;
+
+        (void)base;
+
+        while (off + packet_dwords <= ib_dwords) {
+                uint64_t addr = dst_va + (dst_off % dst_size);
+
+                ib[off] = PACKET3(PACKET3_WRITE_DATA, 5);
+                ib[off + 1] = WRITE_DATA_DST_SEL(5);
+                ib[off + 2] = lower_32_bits(addr & ~0x3ULL);
+                ib[off + 3] = upper_32_bits(addr);
+                ib[off + 4] = 0xDEADBEEF;
+                ib[off + 5] = 0xCAFEBABE;
+                ib[off + 6] = 0x12345678;
+                ib[off + 7] = 0xABCD0000 | (off & 0xFFFF);
+
+                off += packet_dwords;
+                dst_off += 16;
+        }
+
+        while (off < ib_dwords)
+                ib[off++] = PACKET3(PACKET3_NOP, 0);
+}
+
+static void amdgpu_ib_fill_wait(struct amdgpu_cmd_base *base, uint32_t *ib, uint64_t signal_va, uint64_t next_ib_va)
+{
+        uint32_t i;
+
+        (void)base;
+
+        ib[0] = PACKET3(PACKET3_WAIT_REG_MEM, 5);
+        ib[1] = WAIT_REG_MEM_FUNCTION(3) | WAIT_REG_MEM_MEM_SPACE(1) |
+                WAIT_REG_MEM_ENGINE(0);
+        ib[2] = lower_32_bits(signal_va);
+        ib[3] = upper_32_bits(signal_va);
+        ib[4] = 1;
+        ib[5] = 0xFFFFFFFF;
+        ib[6] = 0x00000004;
+
+        for (i = 7; i < 16380; i++)
+                ib[i] = PACKET3(PACKET3_NOP, 0);
+
+        ib[16380] = PACKET3(PACKET3_INDIRECT_BUFFER, 2);
+        ib[16381] = lower_32_bits(next_ib_va);
+        ib[16382] = upper_32_bits(next_ib_va);
+        ib[16383] = 0x10000 | INDIRECT_BUFFER_VALID | INDIRECT_BUFFER_CHAIN;
+}
+
+
 /*
  * SDMA functions:
  * - write_linear
@@ -1307,6 +1389,10 @@ get_cmd_base(void)
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
index 4f731bf04..423960004 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -20,6 +20,7 @@
 
 #include "amd_registers.h"
 #include "amd_family.h"
+#include "amd_PM4.h"
 
 #ifndef MIN
 #define MIN(a, b) ((a) < (b) ? (a) : (b))
@@ -514,6 +515,7 @@ struct pci_addr {
     unsigned int function;
 };
 
+
 extern  struct amdgpu_ip_blocks_device amdgpu_ips;
 extern const struct chip_info  *g_pChip;
 int
@@ -537,6 +539,13 @@ struct amdgpu_cmd_base {
 	void (*emit_repeat)(struct amdgpu_cmd_base  *base, uint32_t value, uint32_t number_of_times);
 	void (*emit_at_offset)(struct amdgpu_cmd_base  *base, uint32_t value, uint32_t offset_dwords);
 	void (*emit_buf)(struct amdgpu_cmd_base  *base, const void *ptr, uint32_t offset_bytes, uint32_t size_bytes);
+	void (*ib_fill_nop)(struct amdgpu_cmd_base *base, uint32_t *ib, uint32_t ib_dwords);
+	void (*ib_fill_chain)(struct amdgpu_cmd_base *base, uint32_t *ib, uint32_t ib_dwords,
+	                      uint64_t next_va, uint32_t next_size_dw);
+	void (*ib_fill_writedata)(struct amdgpu_cmd_base *base, uint32_t *ib, uint32_t ib_dwords,
+	                          uint64_t dst_va, uint32_t dst_size);
+	void (*ib_fill_wait)(struct amdgpu_cmd_base *base, uint32_t *ib, uint64_t signal_va, uint64_t next_ib_va);
+
 };
 
 struct amdgpu_cmd_base *get_cmd_base(void);
-- 
2.55.0
