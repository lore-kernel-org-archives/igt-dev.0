Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560EF606A31E
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 03:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=cHCfhbg6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB39F10E307;
	Thu, 26 Nov 2026 03:26:34 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012046.outbound.protection.outlook.com [52.101.53.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B473A10E307
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 03:24:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPB0ySyvfNqG3nugQ/T9EZjDRR8tC92Vwxy8geq6XumUrce1bhPkVZFYgK6Q+9YQYqgYRRaSNiR3Lnczt3GjRZ8d9zZNRJIEW/HNf1hUQ5SePqEU+V+MAkoMNPd2N51O0q/NwKu57qZASkkYF7wzfTIVP+O19bx3tKOtH695HCA8vPMB3ozbOQgvaAuX70MfVfPCBZHdihrk3ZvnS9R+QHdsBUhC47u3OlFi029YJfSHhR4neH+feAU+HP+Q3LoEJELcP2/6u+i0ZBqjL8CG/xjOwC2Q/dTejPBjoI9VWKJGPCK63fODAMmo+5odxLFJvRuWF2TZVfwSXHmm/sVIuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0DGO1npeDVcygB0+WCoGZWb172620VQXH1+nP0fqD0=;
 b=gnmLgU8HCQ2qdh5yT9rGKHuV4bnAhVHTI4jFn0enRJ+vm/93FpZx2E8NuZQ8SXj1Qz49n2JDva7Z0NctR+m51VpG8wO+Im/+kwsVDF7lXxGcExsy8DrT7WfypHM+e+u3IwGq9A/apU2bDZuX2oCuFmevnVYWL1rRM2WMZeaAtkfT9uDguw5NyPFNJtNYzpXOyKjp7zYwbHjOOeYoK5b3IYll806l0eR5mt2CFVju9tAiwKECNlMLJPfAlv+XXg8mKIXLN/VeDBBrYGLCAhAppWxdqbHh3AWAhw1zhv3Go8p9pSlTyTq4agU0i42M8qiZP9rcyLNwc1y/986JbOo3EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0DGO1npeDVcygB0+WCoGZWb172620VQXH1+nP0fqD0=;
 b=cHCfhbg66z7mDQ3H28InixIdsoFj2qADWqxAKySnfBFuVWiUJflD+jgOKPDWLGgfB6u26fYUy5cXsIPwwXbl5eLmuDy2U3tu0J4HIbefRcdUdQpAfIiYlW8YywkJpjVtFLWImMKxfU9hqwnTUoh+FyeuOp/CeGGltDhRKfE3CNs=
Received: from MN2PR06CA0027.namprd06.prod.outlook.com (2603:10b6:208:23d::32)
 by CY5PR12MB6036.namprd12.prod.outlook.com (2603:10b6:930:2c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 26 Nov
 2026 03:24:09 +0000
Received: from BL4PEPF000003EE.namprd04.prod.outlook.com
 (2603:10b6:208:23d:cafe::2) by MN2PR06CA0027.outlook.office365.com
 (2603:10b6:208:23d::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 03:24:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL4PEPF000003EE.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Thu, 26 Nov 2026 03:24:09 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 21:24:08 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 25 Nov 2026 21:24:07 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>, "Claude
 Sonnet 5" <noreply@anthropic.com>
Subject: [PATCH 3/5] lib/amdgpu/amd_spm: add GFX10/GFX11 cache-benchmark
 shader and descriptor hooks
Date: Wed, 25 Nov 2026 22:22:07 -0500
Message-ID: <20261126032404.172848-3-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126032404.172848-1-vitaly.prosyak@amd.com>
References: <20261126032404.172848-1-vitaly.prosyak@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PEPF000003EE:EE_|CY5PR12MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: 6640bda4-8cd4-48ca-2756-08df4b6cbbe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|18002099003|22082099003|6133799003|261009221227099003|261009223027099003|3023799007|261021121427099003|261021133027099003|261021130227099003|261021123027099003|261021135927099003|261022105027099003|261026135527099003|261026140227099003|261022075727099003|261102123227099003|261026121527099003|261022113327099003|261026130827099003|261022115727099003|261028144727099003|6123799006|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: Lcbou3xU9IdqC7scBxZurS772H5NTB9HlFd9ASB1P6yCd3M5k7PLfB8bVteS227ostTe4OVPS/YUkKGvQmh0XEgcGg/1aGRtVQkm2ILJNIsM5r+Z+Ju1hpOPNB0jOAGUxcwMPIfRiqRLZBLDNZxweniZsmO1cU/3g7Nv/n7Cs9kUyaF3qTIWpkH4wAmWR8Jw6h5g0SIZUYQ4Pu8Hq3Vb7/c91km3XJDQhfRxHUbIG2yTteOibODXyjDa5KAkdQVRx6S2Z36913bBd6qyixH5bWARy9yvSJ7EHPHT0mj2+axH5xEsYAuT3TiJiwJ8XTn4e/Oet12iKT5s5JRLiTQOLg/OEsiXkLDbflf5xJlZPYLi6ZhBEuGo2MF/ChtgMl1fP8Cd/JLd9PBoiHV57a4nvSfVieNpz4lH+UQgnsmTc1SYOhAWFOUE5M2dHIfLgtUg3INxgqlLLbL0vuRtVyrC83EhdJq53f7+rvIgebNNfn1u5vpwLiURSNb6O2aaxNpFoMdSP9r2TSScYzKzpcorkVsD/2wnDO8THttScwF7J3UB/S3/I/gYFTVRu7nW+CmYEC69CBItN4dSQomMYsrKz5ivEd5U/SW2M/Hi3KK0u5xux+yT8LfRkGkNJi3hnU2VPfBBqjIJYD+vEySsVaI4tUn+Ac5B9P6vWwaQSIIKsHKI2W3a46g23sZkaawK6bCWglMKO+jj7H4zecphUPXhow==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(18002099003)(22082099003)(6133799003)(261009221227099003)(261009223027099003)(3023799007)(261021121427099003)(261021133027099003)(261021130227099003)(261021123027099003)(261021135927099003)(261022105027099003)(261026135527099003)(261026140227099003)(261022075727099003)(261102123227099003)(261026121527099003)(261022113327099003)(261026130827099003)(261022115727099003)(261028144727099003)(6123799006)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FmrylaHpgGcZ21nupJoc+q2//J4k6fJrOPX0bFg88QzYRHLJYkpO3Lw0NgBrMD3hOxsfm35CvNf6TniT7oVmZ1kkmgkrt/gWSeW7ABNtnh+QYbfSafRwZYhpyf5K3p6xdHmB2N9MBVtJzWm6ECmMhloMqLyUHy5/nSvPPu2Ush7eLiQJ0nd0l5U3gyUuvfWnjbn17VweYuWjoEwvCt36a0er2uN37u09EBiMf/ATLlLdB2wjY+Cyg4BcK+gCY1clNxJ4FpGQMie1lW2yW794KFV2WUb6H/c7sFgLasEOt24R42Gv3PaMJe64pDS+DyKfiy/ff0GHUFiE73LwSq9O8qWc1TANXV5EUAjXsHvZ9FJdAdn/3pXDwNElC9GJClVbhdoBmEZBEaIV/br1d5d0jGDURVwobwoF/d5XPv7V08SSy6CzBdQjvze37GVWgu47
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 03:24:09.0336 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6640bda4-8cd4-48ca-2756-08df4b6cbbe3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL4PEPF000003EE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6036
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

Extend amd_spm_ops with two more per-generation hooks,
build_cache_bench_shader() and emit_cache_bench_descriptors(), so the
cache working-set/access-pattern/scalar/instruction benchmark workload
(used by tests/amdgpu/amd_spm.c's spm-cache-benchmark dynamic subtest)
follows the same rule as the rest of this library: ASIC-specific code
and PM4 packet construction live behind capture->ops.*, never in the
test itself.

- build_gfx11_cache_bench_shader(): hand-encoded RDNA3 machine code
  (vector/scalar/instruction variants), patched with each case's
  working-set/step/iteration parameters at build time.
- build_gfx10_cache_bench_shader(): portable AMDGCN assembly text,
  assembled at run time via llvm-mc for the exact detected ASIC.
- emit_gfx11_cache_bench_descriptors(): GFX11 buffer-descriptor ("V#")
  setup. The descriptor format word is now a set of named, documented
  bit-shift macros (CACHE_BENCH_VBUF_DST_SEL/FORMAT/...) instead of a
  bare 0x1003dfac literal -- decoded bit-by-bit in the comment above
  them: identity channel swizzle, and a FORMAT field whose value is
  each generation's enum code for 32_32_32_32_UINT (the same meaning,
  renumbered between GFX10 and GFX11, which is why
  lib/amdgpu/compute_utils/amd_dispatch.c's own per-generation
  0x74fac/0x1104bfac/0x1003dfac/0x1203dfac constants differ the same
  way).
- emit_gfx10_cache_bench_descriptors(): GFX10 has no buffer descriptors
  here -- the kernels address source/destination directly by raw VA
  (flat/SMEM), so this just writes those VAs into the shader's user
  SGPRs.

amd_spm_capture_build_cache_bench_shader()/
amd_spm_capture_emit_cache_bench_descriptors() are the public wrappers
tests/amdgpu/amd_spm.c calls through; both return a clean "unsupported"
result (0 / -EOPNOTSUPP) on generations with no benchmark shader
(gfx12) instead of requiring every caller to NULL-check capture->ops.*
itself.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_spm.c | 590 +++++++++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_spm.h |  49 ++++
 2 files changed, 639 insertions(+)

diff --git a/lib/amdgpu/amd_spm.c b/lib/amdgpu/amd_spm.c
index f58c6cc09..c070decc9 100644
--- a/lib/amdgpu/amd_spm.c
+++ b/lib/amdgpu/amd_spm.c
@@ -11,8 +11,10 @@
 #include "amd_memory.h"
 #include "amd_ip_blocks.h"
 #include "amdgpu_asic_addr.h"
+#include "shaders/amd_llvm_asm.h"
 
 #include <errno.h>
+#include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
 
@@ -561,6 +563,569 @@ emit_windowed_stop_reset(struct amdgpu_cmd_base *ib,
 	return emit_legacy_stop_reset(ib, capture);
 }
 
+/*
+ * GFX11/GFX10 cache working-set/access-pattern/scalar/instruction benchmark
+ * workload: per-generation shader bytes (build_cache_bench_shader hook) and
+ * the PM4 that binds the source/destination buffers to it
+ * (emit_cache_bench_descriptors hook). Used by
+ * amd_spm_capture_build_cache_bench_shader() /
+ * amd_spm_capture_emit_cache_bench_descriptors() below, which
+ * tests/amdgpu/amd_spm.c's spm-cache-benchmark dynamic subtest calls instead
+ * of ever branching on gfx_major/gfx_minor or building PM4 packets itself.
+ */
+
+/*
+ * Hand-encoded RDNA3 (gfx1100) machine code, decoded below via
+ * `llvm-mc --disassemble --triple=amdgcn--amdhsa --mcpu=gfx1100`. All three
+ * shaders share the same prologue/epilogue and ABI (see the big comment
+ * above gfx10_vector_isa_fmt further down for the full register ABI); only
+ * the inner loop body differs. Index numbers are array/word indices (0-based)
+ * into cache_vector_shader[], matching the [N] annotations
+ * build_gfx11_cache_bench_shader() uses to patch literals in at runtime.
+ *
+ * [0]      s_version UC_VERSION_GFX11|UC_VERSION_W64_BIT   -- mandatory header word
+ * [1]      v_and_b32_e32  v0, 0x3ff, v0       -- v0 = tid.x & 0x3ff (clamp/sanitize thread ID)
+ * [2]        (0x3ff literal operand for [1])
+ * [3,4]    v_lshl_add_u32 v7, s8, 6, v0       -- v7 = (wg.x << 6) + tid.x = global work-item index
+ * [5]      v_mov_b32_e32  v6, 0              -- v6 = running sum (this work-item's result)
+ * [6]      s_mov_b32      s9, <iterations>   -- s9 = loop trip count           [patched: shader[7]]
+ * [7]        (iterations literal for [6])
+ * LOOP:
+ * [8]      v_and_b32_e32  v1, <mask>, v7     -- v1 = v7 & mask: wraps the work-item
+ *                                                index into the configured working set
+ *                                                (mask = working_set/16 - 1, so working_set
+ *                                                must be a power of two) [patched: shader[9]]
+ * [9]        (mask literal for [8])
+ * [10,11]  buffer_load_format_xyzw v[2:5], v1, s[0:3], 0 idxen
+ *                                            -- load one dwordx4 "cache line" from the
+ *                                                source buffer at index v1 -- this is the
+ *                                                actual vector-cache access under measurement
+ * [12]     s_waitcnt      vmcnt(0)           -- wait for the load to complete
+ * [13]     v_add_nc_u32_e32 v6, v6, v2       -- v6 += loaded value (keeps the load live,
+ *                                                not dead code)
+ * [14]     v_add_nc_u32_e32 v1, <step>, v1   -- v1 += step: stride to the next address
+ *                                                                    [patched: shader[15]]
+ * [15]       (step literal for [14])
+ * [16]     v_and_b32_e32  v1, <mask>, v1     -- re-wrap the strided address back into
+ *                                                the working set
+ *                                                            [patched: shader[17] == shader[9]]
+ * [17]       (mask literal for [16], same value as [9])
+ * [18]     s_sub_u32      s9, s9, 1          -- s9 -= 1
+ * [19]     s_cmp_lg_u32   s9, 0              -- s9 != 0 ?
+ * [20]     s_cbranch_scc1 LOOP               -- loop while s9 != 0 (fixed -11 dword
+ *                                                offset, valid because this loop body
+ *                                                is always 11 words long)
+ * [21-24]  v_mov_b32_e32  v2/v3/v4/v5, v6    -- replicate the accumulated sum across a dwordx4
+ * [25,26]  buffer_store_format_xyzw v[2:5], v7, s[4:7], 0 idxen
+ *                                            -- store it to dst[work-item index]
+ * [27]     s_waitcnt      vmcnt(0)
+ * [28]     s_endpgm
+ *
+ * Net effect: each work-item repeatedly re-reads (iterations times) from a
+ * power-of-two-sized, address-wrapped window of the source buffer -- a
+ * vector L0/L1/L2 cache working-set/stride benchmark.
+ *
+ * Equivalent C, one work-item (one lane):
+ *
+ *   uint32_t tid = get_local_id(0) & 0x3ff;
+ *   uint32_t gid = get_group_id(0) * 64 + tid;       // v7, also the dst index
+ *   uint32_t mask = working_set / 16 - 1;            // working_set must be a power of two
+ *   uint32_t addr = gid & mask;                      // v1
+ *   uint32_t sum = 0;                                // v6
+ *
+ *   for (uint32_t i = 0; i < iterations; i++) {
+ *       uint4 line = src_buffer[addr];                // the vector-cache load under measurement
+ *       sum += line.x;
+ *       addr = (addr + step) & mask;
+ *   }
+ *   dst_buffer[gid] = (uint4){ sum, sum, sum, sum };
+ */
+static const uint32_t cache_vector_shader[] = {
+	0xb0802006, 0x360000ff, 0x000003ff, 0xd6460007, 0x04010c08,
+	0x7e0c0280, 0xbe8900ff, 0x13572468, 0x36020eff, 0x24681357,
+	0xe00c0000, 0x80800201, 0xbf8903f7, 0x4a0c0506, 0x4a0202ff,
+	0x35792468, 0x360202ff, 0x24681357, 0x80898109, 0xbf078009,
+	0xbfa2fff5, 0x7e040306, 0x7e060306, 0x7e080306, 0x7e0a0306,
+	0xe01c0000, 0x80810207, 0xbf8903f7, 0xbfb00000,
+};
+
+/*
+ * Same shape as cache_vector_shader above, but the per-iteration address is
+ * computed and loaded in SCALAR registers (uniform across the whole wave)
+ * instead of per-thread VGPRs, which routes the load through the
+ * scalar-data cache instead of the vector L0/L1/L2 caches:
+ *
+ * [0]      s_version UC_VERSION_GFX11|UC_VERSION_W64_BIT
+ * [1,2]    v_and_b32_e32  v0, 0x3ff, v0
+ * [3,4]    v_lshl_add_u32 v7, s8, 6, v0       -- still needed for the final dst store index
+ * [5]      s_lshl_b32     s10, s8, 4          -- s10 = wg.x << 4 (uniform per-wave
+ *                                                address seed; deliberately ignores tid.x --
+ *                                                same scalar load for every lane in the wave,
+ *                                                which is what makes it "scalar")
+ * [6,7]    s_mov_b32      s9, <iterations>                           [patched: shader[7]]
+ * [8]      s_mov_b32      s11, 0              -- s11 = running sum
+ * LOOP:
+ * [9,10]   s_and_b32      s10, s10, <mask>    -- mask = working_set - 1 (byte-granular,
+ *                                                no /16 here since this is a direct scalar
+ *                                                dword address, not a dwordx4 buffer-format
+ *                                                index)                [patched: shader[10]]
+ * [11,12]  s_buffer_load_b32 s12, s[0:3], s10 -- the scalar-cache load under measurement
+ * [13]     s_waitcnt      lgkmcnt(0)
+ * [14]     s_add_u32      s11, s11, s12       -- accumulate the loaded value
+ * [15,16]  s_add_u32      s10, s10, <step>                           [patched: shader[16]]
+ * [17,18]  s_and_b32      s10, s10, <mask>    -- re-wrap, same mask as [9,10]
+ *                                                       [patched: shader[18] == shader[10]]
+ * [19]     s_sub_u32      s9, s9, 1
+ * [20]     s_cmp_lg_u32   s9, 0
+ * [21]     s_cbranch_scc1 LOOP                -- fixed -11 dword offset, same reasoning
+ *                                                as the vector shader
+ * [22-25]  v_mov_b32_e32  v2/v3/v4/v5, s11    -- broadcast the scalar sum into the
+ *                                                vector dst payload
+ * [26,27]  buffer_store_format_xyzw v[2:5], v7, s[4:7], 0 idxen
+ * [28]     s_waitcnt      vmcnt(0)
+ * [29]     s_endpgm
+ *
+ * Equivalent C, one wave (addr/sum are computed ONCE per wave, not per lane --
+ * every lane in the wave reads the exact same address, which is what makes
+ * this a scalar- instead of vector-cache test):
+ *
+ *   uint32_t tid = get_local_id(0) & 0x3ff;
+ *   uint32_t gid = get_group_id(0) * 64 + tid;       // only used for the dst index
+ *   uint32_t mask = working_set - 1;                 // byte-granular, must be power of two
+ *   uint32_t addr = (get_group_id(0) << 4) & mask;   // wave-uniform, ignores tid entirely
+ *   uint32_t sum = 0;
+ *
+ *   for (uint32_t i = 0; i < iterations; i++) {
+ *       uint32_t value = *(const uint32_t *)((const char *)src_buffer + addr);
+ *       // ^ the scalar-cache load
+ *       sum += value;
+ *       addr = (addr + step) & mask;
+ *   }
+ *   dst_buffer[gid] = (uint4){ sum, sum, sum, sum };
+ */
+static const uint32_t cache_scalar_shader[] = {
+	0xb0802006, 0x360000ff, 0x000003ff, 0xd6460007, 0x04010c08,
+	0x840a8408, 0xbe8900ff, 0x13572468, 0xbe8b0080, 0x8b0aff0a,
+	0x24681357, 0xf4200300, 0x14000000, 0xbf89fc07, 0x800b0c0b,
+	0x800aff0a, 0x35792468, 0x8b0aff0a, 0x24681357, 0x80898109,
+	0xbf078009, 0xbfa2fff5, 0x7e04020b, 0x7e06020b, 0x7e08020b,
+	0x7e0a020b, 0xe01c0000, 0x80810207, 0xbf8903f7, 0xbfb00000,
+};
+
+/*
+ * Unlike the other two shaders, this array is only a *template*: it does no
+ * memory access at all, and its inner loop body is exactly one filler
+ * instruction long (word [8]). build_gfx11_cache_bench_shader() builds the
+ * real shader by repeating word [8] test->instructions times -- stressing
+ * the SQ instruction cache in proportion to code size, which is the whole
+ * point of this benchmark -- then re-appending the loop-control tail
+ * ([9],[10]) and a freshly computed branch-back offset (word [11]'s -4 only
+ * happens to be correct for exactly one filler instruction; see below).
+ *
+ * [0]      s_version UC_VERSION_GFX11|UC_VERSION_W64_BIT
+ * [1,2]    v_and_b32_e32  v0, 0x3ff, v0
+ * [3,4]    v_lshl_add_u32 v7, s8, 6, v0
+ * [5]      v_mov_b32_e32  v6, 0               -- v6 = running sum
+ * [6,7]    s_mov_b32      s9, <iterations>                                    [patched: shader[7]]
+ * LOOP (this word repeated test->instructions times at runtime):
+ * [8]      v_add_nc_u32_e32 v6, 1, v6         -- the "filler": one cheap instruction
+ *                                                per repetition, purely to occupy
+ *                                                instruction-cache lines; v6's value doesn't
+ *                                                matter beyond matching the iterations *
+ *                                                instructions check in run_cache_benchmark()
+ * [9]      s_sub_u32      s9, s9, 1           -- appended once after the repeated fillers
+ * [10]     s_cmp_lg_u32   s9, 0               -- appended once after
+ * [11]     s_cbranch_scc1 65532 (-4)          -- static placeholder only valid when
+ *                                                instructions == 1; build_gfx11_cache_bench_shader()
+ *                                                never copies this word -- it always
+ *                                                recomputes 0xbfa20000 |
+ *                                                (uint16_t)-(instructions+3) instead, so the
+ *                                                branch correctly skips back over however many
+ *                                                filler instructions were actually emitted
+ * [12-15]  v_mov_b32_e32  v2/v3/v4/v5, v6
+ * [16,17]  buffer_store_format_xyzw v[2:5], v7, s[4:7], 0 idxen
+ * [18]     s_waitcnt      vmcnt(0)
+ * [19]     s_endpgm
+ *
+ * Equivalent C, one work-item. The inner "instructions" loop is NOT a real
+ * loop in the actual shader -- build_gfx11_cache_bench_shader() fully
+ * unrolls it by emitting word [8] "instructions" times back to back, so code
+ * size (and hence instruction-cache footprint) scales directly with
+ * "instructions":
+ *
+ *   uint32_t tid = get_local_id(0) & 0x3ff;
+ *   uint32_t gid = get_group_id(0) * 64 + tid;
+ *   uint32_t sum = 0;
+ *
+ *   for (uint32_t i = 0; i < iterations; i++) {
+ *       for (uint32_t j = 0; j < instructions; j++)  // unrolled at build time, not a real loop
+ *           sum += 1;                                 // one v_add_nc_u32 per "instructions"
+ *   }
+ *   dst_buffer[gid] = (uint4){ sum, sum, sum, sum };  // expected = iterations * instructions
+ */
+static const uint32_t cache_instruction_shader[] = {
+	0xb0802006, 0x360000ff, 0x000003ff, 0xd6460007, 0x04010c08,
+	0x7e0c0280, 0xbe8900ff, 0x13572468, 0x4a0c0c81, 0x80898109,
+	0xbf078009, 0xbfa2fffc, 0x7e040306, 0x7e060306, 0x7e080306,
+	0x7e0a0306, 0xe01c0000, 0x80810207, 0xbf8903f7, 0xbfb00000,
+};
+
+/*
+ * Select the hand-coded GFX11 machine code matching @test->kind (see the
+ * three shader arrays and their decode comments above), patch the
+ * case-specific literals (iterations/mask/step, or the unrolled filler-
+ * instruction count) into the documented [N] word offsets, then pad past
+ * s_endpgm with s_code_end so the instruction prefetcher never reads past
+ * the allocated shader buffer. @dst_size/@gfx_minor are unused here -- GFX11
+ * hand-codes one fixed binary per case regardless of minor version or buffer
+ * size (the caller is trusted to have sized the buffer; see
+ * cache_benchmark_shader()'s original caller for why).
+ */
+static uint32_t
+build_gfx11_cache_bench_shader(void *dst, size_t dst_size,
+			       const struct amd_spm_cache_bench_case *test,
+			       uint32_t gfx_minor)
+{
+	uint32_t *shader = dst;
+	uint32_t words;
+
+	(void)dst_size;
+	(void)gfx_minor;
+
+	if (test->kind == AMD_SPM_CACHE_BENCH_VECTOR) {
+		memcpy(shader, cache_vector_shader, sizeof(cache_vector_shader));
+		shader[7] = test->iterations;
+		shader[9] = test->working_set / 16 - 1;
+		shader[15] = test->step;
+		shader[17] = shader[9];
+		words = ARRAY_SIZE(cache_vector_shader);
+	} else if (test->kind == AMD_SPM_CACHE_BENCH_SCALAR) {
+		memcpy(shader, cache_scalar_shader, sizeof(cache_scalar_shader));
+		shader[7] = test->iterations;
+		shader[10] = test->working_set - 1;
+		shader[16] = test->step;
+		shader[18] = shader[10];
+		words = ARRAY_SIZE(cache_scalar_shader);
+	} else {
+		memcpy(shader, cache_instruction_shader, 8 * sizeof(*shader));
+		shader[7] = test->iterations;
+		words = 8;
+		for (uint32_t index = 0; index < test->instructions; index++)
+			shader[words++] = cache_instruction_shader[8];
+		shader[words++] = cache_instruction_shader[9];
+		shader[words++] = cache_instruction_shader[10];
+		shader[words++] = 0xbfa20000 | ((uint16_t)(-(int32_t)(test->instructions + 3)));
+		memcpy(&shader[words], &cache_instruction_shader[12], 8 * sizeof(*shader));
+		words += 8;
+	}
+	/*
+	 * 0xbf9f0000 = s_code_end. Pads past s_endpgm so the instruction
+	 * prefetcher never walks off the end of the allocated shader buffer.
+	 */
+	for (uint32_t padding = 0; padding < 64; padding++)
+		shader[words++] = 0xbf9f0000;
+	return words * sizeof(*shader);
+}
+
+/*
+ * GFX10.1 (Navi10) equivalents of cache_vector_shader/cache_scalar_shader/
+ * cache_instruction_shader above. The GFX11 shaders are hand-encoded RDNA3
+ * machine code and will not run correctly (or safely) on GFX10 hardware.
+ * Rather than hand-encoding RDNA1 machine code the same fragile way, these
+ * are portable AMDGCN assembly *text*, assembled at test run time for the
+ * exact detected ASIC via llvm-mc (lib/amdgpu/shaders/amd_llvm_asm.c), the
+ * same mechanism lib/amdgpu/compute_utils/amd_dispatch_helpers.c already
+ * uses for CopyDwordIsa/amdgpu_compute_copy_dword().
+ *
+ * Unlike the GFX11 shaders, these use flat addressing (vector test) and an
+ * SMEM s_load_dword (scalar test) instead of buffer-descriptor (V#)
+ * addressing -- SPM's L0/L1/L2 counters measure the cache hardware itself
+ * regardless of which instruction family issued the request, so there is no
+ * correctness reason to replicate the GFX11 shaders' descriptor setup, and
+ * skipping it avoids a whole class of GFX-version-specific buffer-descriptor
+ * format-tag risk.
+ *
+ * Register ABI (deliberately mirrors amdgpu_dispatch_write2hw()'s existing
+ * gfx9/gfx10 resource table -- RSRC1=0x000C0041, RSRC2=0x00000090, which
+ * declares 8 user SGPRs, so TGID_X lands in s8, not s4):
+ *   s[0:1] = source buffer VA (filled with 1u32 by the test)
+ *   s[2:3] = destination buffer VA (one 16-byte slot per work-item)
+ *   s8     = workgroup ID X (hardware-provided, since 8 user SGPRs declared)
+ *   v0     = local thread ID X (hardware-provided)
+ * Every kernel accumulates a per-work-item iteration counter and stores it
+ * (replicated across a dwordx4) to dst[(wg.x*64+tid.x)*16], matching the
+ * expected = iterations * (instructions, for the instruction kind)
+ * correctness check tests/amdgpu/amd_spm.c's run_cache_benchmark() performs.
+ */
+static const char gfx10_vector_isa_fmt[] =
+	".text\n"
+	"\tv_lshlrev_b32 v1, 4, v0\n"
+	"\tv_and_b32 v1, %#x, v1\n"
+	"\tv_mov_b32 v2, 0\n"
+	"\ts_mov_b32 s6, %u\n"
+	"LOOP_VEC:\n"
+	"\tv_add_co_u32 v4, vcc_lo, s0, v1\n"
+	"\tv_mov_b32 v5, s1\n"
+	"\tv_add_co_ci_u32 v5, vcc_lo, v5, 0, vcc_lo\n"
+	"\tflat_load_dword v6, v[4:5] glc slc\n"
+	"\ts_waitcnt 0\n"
+	"\tv_add_nc_u32 v2, v2, 1\n"
+	"\tv_add_nc_u32 v1, v1, %u\n"
+	"\tv_and_b32 v1, %#x, v1\n"
+	"\ts_sub_u32 s6, s6, 1\n"
+	"\ts_cmp_lg_u32 s6, 0\n"
+	"\ts_cbranch_scc1 LOOP_VEC\n"
+	"\tv_mov_b32 v1, s8\n"
+	"\tv_lshlrev_b32 v1, 6, v1\n"
+	"\tv_add_nc_u32 v1, v1, v0\n"
+	"\tv_lshlrev_b32 v1, 4, v1\n"
+	"\tv_add_co_u32 v6, vcc_lo, s2, v1\n"
+	"\tv_mov_b32 v7, s3\n"
+	"\tv_add_co_ci_u32 v7, vcc_lo, v7, 0, vcc_lo\n"
+	"\tv_mov_b32 v3, v2\n"
+	"\tv_mov_b32 v4, v2\n"
+	"\tv_mov_b32 v5, v2\n"
+	"\tflat_store_dwordx4 v[6:7], v[2:5] glc slc\n"
+	"\ts_endpgm\n";
+
+static const char gfx10_scalar_isa_fmt[] =
+	".text\n"
+	"\ts_mov_b32 s6, 0\n"
+	"\ts_mov_b32 s7, 0\n"
+	"\ts_mov_b32 s11, %u\n"
+	"LOOP_SCALAR:\n"
+	"\ts_load_dword s9, s[0:1], s6 glc\n"
+	"\ts_waitcnt lgkmcnt(0)\n"
+	"\ts_add_i32 s7, s7, 1\n"
+	"\ts_add_i32 s6, s6, %u\n"
+	"\ts_and_b32 s6, s6, %#x\n"
+	"\ts_sub_u32 s11, s11, 1\n"
+	"\ts_cmp_lg_u32 s11, 0\n"
+	"\ts_cbranch_scc1 LOOP_SCALAR\n"
+	"\tv_mov_b32 v1, s8\n"
+	"\tv_lshlrev_b32 v1, 6, v1\n"
+	"\tv_add_nc_u32 v1, v1, v0\n"
+	"\tv_lshlrev_b32 v1, 4, v1\n"
+	"\tv_add_co_u32 v6, vcc_lo, s2, v1\n"
+	"\tv_mov_b32 v7, s3\n"
+	"\tv_add_co_ci_u32 v7, vcc_lo, v7, 0, vcc_lo\n"
+	"\tv_mov_b32 v2, s7\n"
+	"\tv_mov_b32 v3, s7\n"
+	"\tv_mov_b32 v4, s7\n"
+	"\tv_mov_b32 v5, s7\n"
+	"\tflat_store_dwordx4 v[6:7], v[2:5] glc slc\n"
+	"\ts_endpgm\n";
+
+/*
+ * instruction-large inflates this to 16384 repeated body instructions, which
+ * exceeds s_cbranch's +/-simm16 relative-branch range (confirmed empirically:
+ * llvm-mc rejects it with "branch size exceeds simm16"). Loop back via an
+ * absolute jump instead (s_getpc_b64 once to capture the body's address,
+ * s_setpc_b64 to return to it each iteration), which has no range limit. The
+ * body instruction uses a register operand (v2, preloaded with 1) rather
+ * than an immediate: v_add_nc_u32 with an immediate forces the 8-byte VOP3
+ * encoding, which would double the code footprint and overflow the
+ * 131072-byte shader buffer at 16384 repeats (confirmed: 16384 x 8 = 131072
+ * body bytes alone, before prologue/epilogue); the register-operand form is
+ * the compact 4-byte VOP2 encoding, halving it back to a safe size.
+ */
+static const char gfx10_instruction_isa_prologue_fmt[] =
+	".text\n"
+	"\tv_mov_b32 v1, 0\n"
+	"\tv_mov_b32 v2, 1\n"
+	"\ts_mov_b32 s6, %u\n"
+	"LOOP_START:\n"
+	"\ts_getpc_b64 s[10:11]\n"
+	"LOOP_INSTR:\n";
+
+static const char gfx10_instruction_isa_body[] =
+	"\tv_add_nc_u32 v1, v1, v2\n";
+
+static const char gfx10_instruction_isa_epilogue[] =
+	"\ts_sub_u32 s6, s6, 1\n"
+	"\ts_cmp_lg_u32 s6, 0\n"
+	"\ts_cbranch_scc0 LOOP_END\n"
+	"\ts_setpc_b64 s[10:11]\n"
+	"LOOP_END:\n"
+	"\tv_mov_b32 v5, s8\n"
+	"\tv_lshlrev_b32 v5, 6, v5\n"
+	"\tv_add_nc_u32 v5, v5, v0\n"
+	"\tv_lshlrev_b32 v5, 4, v5\n"
+	"\tv_add_co_u32 v6, vcc_lo, s2, v5\n"
+	"\tv_mov_b32 v7, s3\n"
+	"\tv_add_co_ci_u32 v7, vcc_lo, v7, 0, vcc_lo\n"
+	"\tv_mov_b32 v2, v1\n"
+	"\tv_mov_b32 v3, v1\n"
+	"\tv_mov_b32 v4, v1\n"
+	"\tflat_store_dwordx4 v[6:7], v[1:4] glc slc\n"
+	"\ts_endpgm\n";
+
+/*
+ * Build the GFX10 ISA text for @test into a freshly malloc'd buffer (caller
+ * frees with free()). Returns NULL on allocation failure.
+ */
+static char *
+build_gfx10_cache_bench_isa_text(const struct amd_spm_cache_bench_case *test)
+{
+	uint32_t mask;
+	char *text;
+
+	if (test->kind == AMD_SPM_CACHE_BENCH_VECTOR) {
+		mask = test->working_set / 16 - 1;
+		text = malloc(sizeof(gfx10_vector_isa_fmt) + 64);
+		if (!text)
+			return NULL;
+		sprintf(text, gfx10_vector_isa_fmt, mask, test->iterations,
+			test->step, mask);
+		return text;
+	}
+	if (test->kind == AMD_SPM_CACHE_BENCH_SCALAR) {
+		mask = test->working_set - 1;
+		text = malloc(sizeof(gfx10_scalar_isa_fmt) + 64);
+		if (!text)
+			return NULL;
+		sprintf(text, gfx10_scalar_isa_fmt, test->iterations,
+			test->step, mask);
+		return text;
+	}
+
+	/* AMD_SPM_CACHE_BENCH_INSTRUCTION: prologue + test->instructions repeated
+	 * add instructions (code-size inflation to stress the icache) +
+	 * epilogue.
+	 */
+	{
+		size_t prologue_len, body_len, epilogue_len, total;
+
+		text = malloc(sizeof(gfx10_instruction_isa_prologue_fmt) + 32);
+		if (!text)
+			return NULL;
+		sprintf(text, gfx10_instruction_isa_prologue_fmt, test->iterations);
+		prologue_len = strlen(text);
+		free(text);
+
+		body_len = strlen(gfx10_instruction_isa_body);
+		epilogue_len = strlen(gfx10_instruction_isa_epilogue);
+		total = prologue_len + (size_t)test->instructions * body_len + epilogue_len + 1;
+		text = malloc(total);
+		if (!text)
+			return NULL;
+		sprintf(text, gfx10_instruction_isa_prologue_fmt, test->iterations);
+		for (uint32_t index = 0; index < test->instructions; index++)
+			memcpy(text + prologue_len + (size_t)index * body_len,
+			       gfx10_instruction_isa_body, body_len);
+		memcpy(text + prologue_len + (size_t)test->instructions * body_len,
+		       gfx10_instruction_isa_epilogue, epilogue_len + 1);
+		return text;
+	}
+}
+
+static uint32_t
+build_gfx10_cache_bench_shader(void *dst, size_t dst_size,
+			       const struct amd_spm_cache_bench_case *test,
+			       uint32_t gfx_minor)
+{
+	char mcpu[32];
+	char *text;
+	size_t isa_sz = 0;
+	int r;
+
+	text = build_gfx10_cache_bench_isa_text(test);
+	if (!text)
+		return 0;
+	amdgpu_format_mcpu(10, gfx_minor, 0, mcpu, sizeof(mcpu));
+	if (amdgpu_llvm_asm_init() != 0) {
+		free(text);
+		return 0;
+	}
+	r = amdgpu_llvm_assemble(mcpu, text, dst, dst_size, &isa_sz);
+	free(text);
+	amdgpu_llvm_asm_shutdown();
+	return (r == 0) ? (uint32_t)isa_sz : 0;
+}
+
+/*
+ * DWORD3 of a GCN/RDNA 4-DWORD raw-buffer resource descriptor ("V#"), used by
+ * the GFX11 cache-benchmark shaders' buffer_load/store_format_xyzw
+ * instructions. lib/amdgpu/compute_utils/amd_dispatch.c's shader-UAV setup
+ * programs the identical word for the same generation (its own GFX9/10/11/12
+ * constants 0x74fac/0x1104bfac/0x1003dfac/0x1203dfac), decoded here once:
+ *
+ *   DST_SEL_X/Y/Z/W   bits [2:0]/[5:3]/[8:6]/[11:9], value 4/5/6/7 ->
+ *                     identity channel swizzle (X<-X, Y<-Y, Z<-Z, W<-W).
+ *   FORMAT            bits [18:12] (7 bits; GFX10+ unified format
+ *                     enum that replaces the separate NUM_FORMAT[14:12] +
+ *                     DATA_FORMAT[20:15] fields pre-GFX10 hardware uses):
+ *                     this generation's enum value for 32_32_32_32_UINT --
+ *                     four 32-bit components, i.e. 16 bytes/record, matching
+ *                     the dwordx4 buffer_load/store_format_xyzw instructions
+ *                     and the "records = size / 16" byte accounting around
+ *                     every caller of this descriptor. GFX10's enum value
+ *                     (0x4b) differs from GFX11/GFX12's (0x3d) because the
+ *                     format enum was renumbered between those generations,
+ *                     not because the format itself differs.
+ *
+ * The remaining high bits are generation-specific OOB-select/resource-level
+ * control; reused verbatim from amd_dispatch.c's already-working descriptor
+ * word for GFX11 (0x10000000) rather than re-derived here, since their exact
+ * names aren't load-bearing for this benchmark.
+ */
+#define CACHE_BENCH_VBUF_DST_SEL(x, y, z, w) \
+	(((x) & 0x7) | (((y) & 0x7) << 3) | (((z) & 0x7) << 6) | (((w) & 0x7) << 9))
+#define CACHE_BENCH_VBUF_IDENTITY_SWIZZLE CACHE_BENCH_VBUF_DST_SEL(4, 5, 6, 7)
+#define CACHE_BENCH_VBUF_FORMAT(fmt) (((fmt) & 0x7f) << 12)
+#define CACHE_BENCH_VBUF_FORMAT_32_32_32_32_UINT_GFX11 0x3d
+#define CACHE_BENCH_VBUF_RESOURCE_CTRL_GFX11 0x10000000
+#define CACHE_BENCH_VBUF_WORD3_GFX11 \
+	(CACHE_BENCH_VBUF_IDENTITY_SWIZZLE | \
+	 CACHE_BENCH_VBUF_FORMAT(CACHE_BENCH_VBUF_FORMAT_32_32_32_32_UINT_GFX11) | \
+	 CACHE_BENCH_VBUF_RESOURCE_CTRL_GFX11)
+
+static int
+emit_gfx11_cache_bench_descriptors(struct amdgpu_cmd_base *ib,
+				   uint64_t source_va, uint64_t destination_va,
+				   uint32_t records)
+{
+	ib->emit(ib, PACKET3_COMPUTE(PKT3_SET_SH_REG, 8));
+	ib->emit(ib, 0x240);
+	ib->emit(ib, source_va);
+	ib->emit(ib, (source_va >> 32) | 0x100000);
+	ib->emit(ib, records);
+	ib->emit(ib, CACHE_BENCH_VBUF_WORD3_GFX11);
+	ib->emit(ib, destination_va);
+	ib->emit(ib, (destination_va >> 32) | 0x100000);
+	ib->emit(ib, 4096);
+	ib->emit(ib, CACHE_BENCH_VBUF_WORD3_GFX11);
+	return 0;
+}
+
+static int
+emit_gfx10_cache_bench_descriptors(struct amdgpu_cmd_base *ib,
+				   uint64_t source_va, uint64_t destination_va,
+				   uint32_t records)
+{
+	/*
+	 * No buffer descriptors: the GFX10 kernels use flat/SMEM addressing
+	 * directly from raw VAs (see the ABI comment above
+	 * build_gfx10_cache_bench_isa_text()). 8 user SGPRs declared
+	 * (matching write2hw's RSRC2=0x90) so TGID_X lands in s8; the extra 4
+	 * dwords beyond the two VAs are unused padding. @records is unused
+	 * on this generation -- there is no NUM_RECORDS field without a
+	 * buffer descriptor.
+	 */
+	(void)records;
+	ib->emit(ib, PACKET3_COMPUTE(PKT3_SET_SH_REG, 8));
+	ib->emit(ib, 0x240);
+	ib->emit(ib, (uint32_t)source_va);
+	ib->emit(ib, (uint32_t)(source_va >> 32));
+	ib->emit(ib, (uint32_t)destination_va);
+	ib->emit(ib, (uint32_t)(destination_va >> 32));
+	ib->emit(ib, 0);
+	ib->emit(ib, 0);
+	ib->emit(ib, 0);
+	ib->emit(ib, 0);
+	return 0;
+}
+
 /*
  * Per-generation hook tables, mirroring amd_ip_blocks.c's registration-table
  * design: each GFX generation gets one named, static amd_spm_ops table plus a
@@ -574,6 +1139,8 @@ static const struct amd_spm_ops gfx10_ops = {
 	.emit_setup = emit_gfx10_setup,
 	.emit_start = emit_windowed_start,
 	.emit_stop_reset = emit_windowed_stop_reset,
+	.build_cache_bench_shader = build_gfx10_cache_bench_shader,
+	.emit_cache_bench_descriptors = emit_gfx10_cache_bench_descriptors,
 };
 
 static const struct amd_spm_ops gfx11_ops = {
@@ -581,6 +1148,8 @@ static const struct amd_spm_ops gfx11_ops = {
 	.emit_setup = emit_gfx11_setup,
 	.emit_start = emit_windowed_start,
 	.emit_stop_reset = emit_windowed_stop_reset,
+	.build_cache_bench_shader = build_gfx11_cache_bench_shader,
+	.emit_cache_bench_descriptors = emit_gfx11_cache_bench_descriptors,
 };
 
 static const struct amd_spm_ops gfx12_ops = {
@@ -1328,6 +1897,27 @@ amd_spm_capture_read_caches(struct amd_spm_capture *capture,
 	return 0;
 }
 
+uint32_t
+amd_spm_capture_build_cache_bench_shader(struct amd_spm_capture *capture,
+					 void *dst, size_t dst_size,
+					 const struct amd_spm_cache_bench_case *test)
+{
+	if (!capture->ops.build_cache_bench_shader)
+		return 0;
+	return capture->ops.build_cache_bench_shader(dst, dst_size, test, capture->gfx_minor);
+}
+
+int
+amd_spm_capture_emit_cache_bench_descriptors(struct amd_spm_capture *capture,
+					     struct amdgpu_cmd_base *ib,
+					     uint64_t source_va, uint64_t destination_va,
+					     uint32_t records)
+{
+	if (!capture->ops.emit_cache_bench_descriptors)
+		return -EOPNOTSUPP;
+	return capture->ops.emit_cache_bench_descriptors(ib, source_va, destination_va, records);
+}
+
 void
 amd_spm_capture_fini(struct amd_spm_capture *capture)
 {
diff --git a/lib/amdgpu/amd_spm.h b/lib/amdgpu/amd_spm.h
index 0b40c3dd2..54cc6a774 100644
--- a/lib/amdgpu/amd_spm.h
+++ b/lib/amdgpu/amd_spm.h
@@ -5,6 +5,7 @@
 #include <amdgpu.h>
 
 #include <stdbool.h>
+#include <stddef.h>
 #include <stdint.h>
 
 struct amd_spm_capture;
@@ -12,6 +13,20 @@ struct amd_spm_cache_profile;
 struct amdgpu_cmd_base;
 struct drm_amdgpu_info_hw_ip;
 
+enum amd_spm_cache_bench_kind {
+	AMD_SPM_CACHE_BENCH_VECTOR,
+	AMD_SPM_CACHE_BENCH_SCALAR,
+	AMD_SPM_CACHE_BENCH_INSTRUCTION,
+};
+
+struct amd_spm_cache_bench_case {
+	enum amd_spm_cache_bench_kind kind;
+	uint32_t working_set;
+	uint32_t step;
+	uint32_t iterations;
+	uint32_t instructions;
+};
+
 struct amd_spm_ops {
 	int (*build_layout)(struct amd_spm_capture *capture);
 	int (*emit_setup)(struct amdgpu_cmd_base *ib,
@@ -20,6 +35,18 @@ struct amd_spm_ops {
 			  const struct amd_spm_capture *capture);
 	int (*emit_stop_reset)(struct amdgpu_cmd_base *ib,
 			       const struct amd_spm_capture *capture);
+	/*
+	 * Cache working-set/access-pattern/scalar/instruction benchmark
+	 * workload (lib/amdgpu/amd_spm.c, used by tests/amdgpu/amd_spm.c's
+	 * spm-cache-benchmark dynamic subtest). NULL on generations with no
+	 * benchmark shader (e.g. gfx12).
+	 */
+	uint32_t (*build_cache_bench_shader)(void *dst, size_t dst_size,
+					     const struct amd_spm_cache_bench_case *test,
+					     uint32_t gfx_minor);
+	int (*emit_cache_bench_descriptors)(struct amdgpu_cmd_base *ib,
+					    uint64_t source_va, uint64_t destination_va,
+					    uint32_t records);
 };
 
 struct amd_spm_profile {
@@ -92,4 +119,26 @@ int amd_spm_capture_read_caches(struct amd_spm_capture *capture,
 				uint32_t *num_samples, uint64_t *counter_sum,
 				struct amd_spm_cache_stats stats[AMD_SPM_CACHE_COUNT]);
 
+/*
+ * Build the cache-benchmark shader for @capture's detected generation into
+ * @dst (a mapped BO of at least @dst_size bytes). Returns the shader size in
+ * bytes, or 0 if this generation has no benchmark shader, or (GFX10 only)
+ * assembling it failed (no llvm-mc, bad mcpu, assembly error).
+ */
+uint32_t amd_spm_capture_build_cache_bench_shader(struct amd_spm_capture *capture,
+						  void *dst, size_t dst_size,
+						  const struct amd_spm_cache_bench_case *test);
+
+/*
+ * Emit the PM4 packets that bind @source_va/@destination_va (a @records-entry
+ * source buffer and a fixed-size destination buffer) as the cache-benchmark
+ * shader's inputs, in whatever form @capture's detected generation needs
+ * (buffer descriptors, raw VAs, ...). Returns 0 on success, -EOPNOTSUPP if
+ * this generation has no benchmark shader.
+ */
+int amd_spm_capture_emit_cache_bench_descriptors(struct amd_spm_capture *capture,
+						 struct amdgpu_cmd_base *ib,
+						 uint64_t source_va, uint64_t destination_va,
+						 uint32_t records);
+
 #endif /* AMD_SPM_H */
-- 
2.56.1

