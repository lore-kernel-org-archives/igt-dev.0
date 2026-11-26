Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE91606A69A
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 03:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=JmlOh8EK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13EBA10E309;
	Thu, 26 Nov 2026 03:29:54 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011033.outbound.protection.outlook.com
 [40.93.194.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4ED110E2E8
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 03:24:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHIGbimLxjngn7o5P1hpi+Z0fTPMU+TGx40fnGmOTZbHkPPT07xqR1lf0ORAeCGsXdYyAIneupWKakEqzzLvPcrrMOzCW79GLzHcD3zGmXH1Rou+0a4YoIBL98LAS13MUH1RLxNtON6UR0NYEgoFg3zL9QeXkHtZoM+6oidqKFPC5NX61tahGzMfkK5o5sGs8iz4YTXJ1p10Byu4A5PNtbBiQTVzGNtqP1iovRQMTXbswSVKFTJR7Vsww8dEvILKnVvshac9ZcIZoHR8OAEHUH2s78N1wq/SFsu8iiNYEtDe53JJcWSqyAfxh/XcQ85rA/EhoMAFib9KVWWv0MTpqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t806STgFZ0dNOzLVLKeqDT30WQtydW3tS8F7Yqccs1M=;
 b=pOMfmQ3cJt4RRRRNPebqz+yKXYjfFvQzD+lRsqpOEfOnJSOJTnoDUseB2eRDsYPV0ShDtqv7FcjLccnX0tuPtou6z009wOO1yr9481odEmx1tssrbVd51BpWoikULK6PjtxYIEdDD58yvBAMWb91B4k9321JL0WczyE3qIlQfBP4pwMdEqAf+hcpx+yfoCyyhEwlKEeR08PStTdp+SKiWNNbnm5o4Bz4cMKTikXie5+cqbWWiTNX8xK7hfCAXVgCet0yySKtir9yk6Re6DeW4LVWYheNeXM+tk/RurRDRXTeCxxddOWtGxmS7yxxgKOtlXWQuMoJ8lIfxX5AlVTdzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t806STgFZ0dNOzLVLKeqDT30WQtydW3tS8F7Yqccs1M=;
 b=JmlOh8EK8R8EhWyymeovQRcYDmtPpQBT3A9Os24LNafpV+rib8d8Of1mlOTmGZuIvZLHW7wIwb5jbuZ7lWE2oZYgYO1zY1kVhV2itc8dQ0SyI8M7NeYEbxMBPKOeMaKfqT8sWKKVV8N7xTnd6u0HoiBZrbAbv3QbfORSGzT0H28=
Received: from SJ0PR03CA0240.namprd03.prod.outlook.com (2603:10b6:a03:39f::35)
 by SN7PR12MB8058.namprd12.prod.outlook.com (2603:10b6:806:348::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 03:24:11 +0000
Received: from SJ1PEPF000037A9.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::84) by SJ0PR03CA0240.outlook.office365.com
 (2603:10b6:a03:39f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 03:24:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000037A9.mail.protection.outlook.com (10.167.244.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Thu, 26 Nov 2026 03:24:10 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 21:24:09 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 21:24:08 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 25 Nov 2026 21:24:08 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>, "Claude
 Sonnet 5" <noreply@anthropic.com>
Subject: [PATCH 4/5] tests/amdgpu/amd_spm: add SPM capture test (CPF-busy,
 cache-hit, cache-benchmark)
Date: Wed, 25 Nov 2026 22:22:08 -0500
Message-ID: <20261126032404.172848-4-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126032404.172848-1-vitaly.prosyak@amd.com>
References: <20261126032404.172848-1-vitaly.prosyak@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A9:EE_|SN7PR12MB8058:EE_
X-MS-Office365-Filtering-Correlation-Id: b7ef3679-e740-46a1-b2ff-08df4b6cbd05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|10067099003|6123799006|5023799004|11063799006|260925021311599003|260925021911599003|260925022911599003|56012099006|261102123227099003|261021133027099003|261021123027099003|261022075727099003|261021135927099003|261021130227099003|261021121427099003|261026140227099003|261022113327099003|261026130827099003|261026121527099003|261022115727099003|261009223027099003|261026135527099003|261022105027099003|261028144727099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: oiJMA7RLO5DvJVRZiB8d7tUKxUaXkXaFqtDu5fR1hMMWm9TcAnAucyc+/M/qRFghXVJXyzv2snAVFvzkoSiXR3cu9KS7rF60wOKRK/BEXfnln7MgxpAqoUIhg3m1lNLXjGuBdinTBN2V/wzxbtx6FxFhXSNlv9o8Ac8zKGHwSDRAOjARpmh3KPicvj4+e9EBjEwEUlO/zNjKcTFRrm/ubsiWFs6dB6CFGfpCHlca73CQg9FdbMWnZIPZGArtiavD6CTMgxVLy1kDKI/zVG1tMKcTiGtOPpduEBdpDXbnYKTEUwTrWMlEUuR5rsUh+8LKgYKwujZNNVBMQXkuRLvsGai81cCwd98m0FfUKs0gtrCQeW5CmfOFGugIH6+JzXE3xFlhtnlUtPpVV1fu2p6EYJj2WD9lv4vCP0aSs5EYtED94LekOTIxcgH5njPxXyyciKp9JbwjPlQ4ysFlxGNAJYw+9v97IP5GkiZRDVl8180DW/dJFun2CziKC8hE9a8XctSE2CLibUpSkbED+KSdhAf4I3gd/p45l747yJIaEnNFAQMrPgf+2BETt/W9t4djQugf11I19nqryJZe3kAzKMFh2xYLGgU/fjYoOx0j+AdlU1gt4al+VER9uh8jMYTMpeY475EILhnqRZBL0dNv8/1h0+ZXht1O+ehbImn6wQh2rud3bb/ouhl9gayFzkT1GY0gh8zlprhELnr98oe5jQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(10067099003)(6123799006)(5023799004)(11063799006)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006)(261102123227099003)(261021133027099003)(261021123027099003)(261022075727099003)(261021135927099003)(261021130227099003)(261021121427099003)(261026140227099003)(261022113327099003)(261026130827099003)(261026121527099003)(261022115727099003)(261009223027099003)(261026135527099003)(261022105027099003)(261028144727099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RKLFvAi/oKqTBQP/IEpTXQShxMuDbOT4CV3H7+/UA9ZeRk9e3N0n/ie4X0GOJbtzmHHc0964nBLTiq8cSJqpPerF1/gYCKfy/5uLat1srSeUcwygbwwI5SexeOzxGJQHf+rZfIQOsUEdb+K3wUtLGQ39ZwwVUIRdTMiHbtQ/6MTfjjOhNK7QKTV9q2PSSn9Y6gQ95TVR+gNLvBXTh346uVEYGrrBgaDqMtT3QLWKL7lMDmkNCJVJIXfHeEMmSi7OIjJaQnukym8mCvf2f1ale1k3RVNnKWkJTsPjh4sp7tOiGM+YCRKAu8AJ9KuirzRQ4fwWX7ZOnLKajU5POOb25eAFREnUSOxfT/x6QaXgH8mYvftgzFst9l56+eqAfm4ryiXmer6o71X51fwE7csQ4yEjf6oS8VKXTn3rZ3I5/LZ/qm9EMU3O7FEsz4Xa3onT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 03:24:10.8449 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ef3679-e740-46a1-b2ff-08df4b6cbd05
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000037A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8058
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

Add tests/amdgpu/amd_spm.c, covering the direct SPM capture library:

- spm-cpf-busy: single CPF-busy counter sampled across one compute
  dispatch.
- spm-cache-hit: per-cache-block (L0/L1/L2/instruction/scalar)
  hit-rate counters sampled across 64 compute dispatches.
- spm-cache-benchmark: a dynamic subtest per cache working-set/access-
  pattern/scalar/instruction case (see cache_benchmarks[]), each
  running its own warm-up + measured dispatches and reporting both
  wall-clock throughput and the hardware's own hit-rate counters.

Which ASIC is plugged in is determined entirely at runtime inside
amd_spm_capture_init() -> select_ops() (lib/amdgpu/amd_spm.c); this
file never branches on gfx_major/gfx_minor itself, and -- now that the
shader/descriptor hooks exist -- never builds a PM4 packet directly
either: run_cache_benchmark() only calls
amd_spm_capture_build_cache_bench_shader()/
amd_spm_capture_emit_cache_bench_descriptors()/
amdgpu_dispatch_write_direct(), all ASIC-specific or packet-level work
happens behind those calls.

Register 'amd_spm' as a test binary in tests/amdgpu/meson.build.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_spm.c   | 439 +++++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build |   1 +
 2 files changed, 440 insertions(+)
 create mode 100644 tests/amdgpu/amd_spm.c

diff --git a/tests/amdgpu/amd_spm.c b/tests/amdgpu/amd_spm.c
new file mode 100644
index 000000000..eda5c929e
--- /dev/null
+++ b/tests/amdgpu/amd_spm.c
@@ -0,0 +1,439 @@
+// SPDX-License-Identifier: MIT
+/* Copyright 2026 Advanced Micro Devices, Inc. */
+
+#include "igt.h"
+#include "lib/amdgpu/amd_ip_blocks.h"
+#include "lib/amdgpu/amd_spm.h"
+#include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/compute_utils/amd_dispatch.h"
+#include "lib/amdgpu/compute_utils/amd_dispatch_helpers.h"
+
+#include <time.h>
+
+static void
+print_cache_stats(const struct amd_spm_cache_stats stats[AMD_SPM_CACHE_COUNT],
+		  uint32_t gfx_major)
+{
+	static const char *const names[AMD_SPM_CACHE_COUNT] = {
+		"L0 vector cache", "L1 vector cache", "L2 cache",
+		"Instruction cache", "Scalar-data cache",
+	};
+	static const char *const blocks_gfx10[AMD_SPM_CACHE_COUNT] = {
+		"TCP", "GL1C", "GL2C", "SQ", "SQ",
+	};
+	static const char *const events_gfx10[AMD_SPM_CACHE_COUNT] = {
+		"0x09/0x12", "0x0e/0x12", "0x03/0x23",
+		"0x12c/0x12d", "0x14f/0x150",
+	};
+	static const char *const blocks_gfx11[AMD_SPM_CACHE_COUNT] = {
+		"TCP", "GL1C", "GL2C", "SQ_WGP", "SQ_WGP",
+	};
+	static const char *const events_gfx11[AMD_SPM_CACHE_COUNT] = {
+		"0x09/0x11", "0x0e/0x12", "0x03/0x2b",
+		"0x10e/0x10f", "0x126/0x127",
+	};
+	const char *const *blocks = gfx_major == 10 ? blocks_gfx10 : blocks_gfx11;
+	const char *const *events = gfx_major == 10 ? events_gfx10 : events_gfx11;
+	uint64_t requests = 0;
+
+	igt_info("%-20s %-7s %-12s %10s %12s %12s %12s %9s %s\n",
+		 "Counter", "Block", "Events", "Hit %", "Requests", "Hits",
+		 "Misses", "Instances", "Status");
+	for (unsigned int cache = 0; cache < AMD_SPM_CACHE_COUNT; cache++) {
+		const struct amd_spm_cache_stats *result = &stats[cache];
+		char percentage[24] = "N/A";
+		char hits[24] = "N/A";
+		const char *status = result->saturated ? "clamped" :
+			!result->consistent ? "inconsistent" :
+			!result->requests ? "no requests" : "sampled";
+
+		igt_assert(result->instances > 0);
+		requests += result->requests;
+		if (result->consistent)
+			snprintf(hits, sizeof(hits), "%llu",
+				 (unsigned long long)result->hits);
+		if (result->requests && result->consistent && !result->saturated)
+			snprintf(percentage, sizeof(percentage), "%.2f%%",
+				 100.0 * result->hits / result->requests);
+		igt_info("%-20s %-7s %-12s %10s %12llu %12s %12llu %9u %s\n",
+			 names[cache], blocks[cache], events[cache], percentage,
+			 (unsigned long long)result->requests, hits,
+			 (unsigned long long)result->misses, result->instances,
+			 status);
+	}
+	igt_assert(requests > 0);
+}
+
+/*
+ * GFX11/GFX10 cache working-set/access-pattern/scalar/instruction benchmarks.
+ * enum amd_spm_cache_bench_kind / struct amd_spm_cache_bench_case
+ * (lib/amdgpu/amd_spm.h) describe a case; the shader bytes and the PM4 that
+ * binds buffers to it are entirely generation-specific and live behind
+ * amd_spm_capture_build_cache_bench_shader() /
+ * amd_spm_capture_emit_cache_bench_descriptors() in lib/amdgpu/amd_spm.c --
+ * this file never branches on gfx_major/gfx_minor or builds PM4 itself.
+ */
+struct cache_benchmark_case {
+	const char *name;
+	struct amd_spm_cache_bench_case params;
+};
+
+static const struct cache_benchmark_case cache_benchmarks[] = {
+	{ "vector-reuse-4k", { AMD_SPM_CACHE_BENCH_VECTOR, 4096, 0, 256, 0 } },
+	{ "vector-reuse-64k", { AMD_SPM_CACHE_BENCH_VECTOR, 65536, 0, 256, 0 } },
+	{ "vector-reuse-1m", { AMD_SPM_CACHE_BENCH_VECTOR, 1048576, 4096, 256, 0 } },
+	{ "vector-stream-64m", { AMD_SPM_CACHE_BENCH_VECTOR, 67108864, 4096, 1024, 0 } },
+	{ "vector-stride-64m", { AMD_SPM_CACHE_BENCH_VECTOR, 67108864, 16384, 256, 0 } },
+	{ "scalar-reuse-4k", { AMD_SPM_CACHE_BENCH_SCALAR, 4096, 0, 256, 0 } },
+	{ "scalar-stream-1m", { AMD_SPM_CACHE_BENCH_SCALAR, 1048576, 1024, 1024, 0 } },
+	{ "instruction-small", { AMD_SPM_CACHE_BENCH_INSTRUCTION, 4096, 0, 256, 16 } },
+	{ "instruction-large", { AMD_SPM_CACHE_BENCH_INSTRUCTION, 4096, 0, 32, 16384 } },
+};
+
+static void
+cache_benchmark_submit(amdgpu_device_handle device, struct amd_spm_capture *spm,
+		       amdgpu_bo_list_handle resources, uint64_t command_va,
+		       uint32_t dwords)
+{
+	struct amdgpu_cs_ib_info ib = {
+		.ib_mc_address = command_va,
+		.size = dwords,
+	};
+	struct amdgpu_cs_request request = {
+		.ip_type = AMDGPU_HW_IP_GFX,
+		.resources = resources,
+		.number_of_ibs = 1,
+		.ibs = &ib,
+	};
+	struct amdgpu_cs_fence fence = {
+		.context = spm->context,
+		.ip_type = AMDGPU_HW_IP_GFX,
+	};
+	uint32_t expired = 0;
+	int ret;
+
+	ret = amdgpu_cs_submit(spm->context, 0, &request, 1);
+	igt_assert_eq(ret, 0);
+	fence.fence = request.seq_no;
+	ret = amdgpu_cs_query_fence_status(&fence, 10000000000ULL, 0, &expired);
+	igt_assert_eq(ret, 0);
+	igt_assert_f(expired, "Cache benchmark did not complete within 10 seconds\n");
+}
+
+static bool
+profile_name_matches(const char *name, const char *const *names, unsigned int count)
+{
+	for (unsigned int index = 0; index < count; index++)
+		if (!strcmp(name, names[index]))
+			return true;
+	return false;
+}
+
+static const char *const gfx10_or_gfx11_cache_profiles[] = { "gfx10", "gfx11" };
+
+static void
+run_cache_benchmark(amdgpu_device_handle device, const struct cache_benchmark_case *test)
+{
+	struct amd_spm_capture capture = {};
+	struct amd_spm_cache_stats stats[AMD_SPM_CACHE_COUNT];
+	struct amdgpu_cmd_base *base = get_cmd_base();
+	amdgpu_bo_handle buffers[4] = {};
+	amdgpu_bo_handle resources[5];
+	amdgpu_va_handle mappings[4] = {};
+	amdgpu_bo_list_handle resource_list = NULL;
+	uint64_t addresses[4] = {};
+	void *cpu[4] = {};
+	uint32_t sizes[4] = { test->params.working_set, 65536, 131072, 4096 };
+	struct timespec start, end;
+	uint32_t num_samples, shader_bytes, expected;
+	uint32_t stride_bytes = test->params.kind == AMD_SPM_CACHE_BENCH_VECTOR ?
+		test->params.step * 16 : test->params.step;
+	uint64_t counter_sum, payload;
+	double elapsed;
+	int ret;
+
+	bool matches;
+	char profile_name[32];
+
+	/* Phase 1: detect the SPM profile and bail out early on unsupported ASICs. */
+	ret = amd_spm_capture_init(&capture, device);
+	igt_assert_eq(ret, 0);
+	snprintf(profile_name, sizeof(profile_name), "%s", capture.profile.name);
+	matches = profile_name_matches(capture.profile.name, gfx10_or_gfx11_cache_profiles,
+				       ARRAY_SIZE(gfx10_or_gfx11_cache_profiles));
+	if (!matches)
+		amd_spm_capture_fini(&capture);
+	igt_require_f(matches,
+		      "Detected SPM profile '%s': this cache benchmark has no shader for that ASIC\n",
+		      profile_name);
+	ret = amd_spm_capture_enable_caches(&capture);
+	igt_require_f(ret == 0, "SPM cache counters unavailable: %d\n", ret);
+
+	/*
+	 * Phase 2: allocate the four persistent buffers this case reuses across
+	 * every dispatch (warm-up and measured alike): [0] source data (filled
+	 * with 1u32 below so a correct run sums to a known value), [1]
+	 * destination (one 16-byte slot per work-item), [2] shader code, [3] the
+	 * PM4 command buffer itself.
+	 */
+	for (uint32_t index = 0; index < ARRAY_SIZE(buffers); index++) {
+		ret = amdgpu_bo_alloc_and_map(device, sizes[index], 4096,
+					      AMDGPU_GEM_DOMAIN_VRAM, 0,
+					     &buffers[index], &cpu[index], &addresses[index],
+					     &mappings[index]);
+		igt_assert_eq(ret, 0);
+		memset(cpu[index], 0, sizes[index]);
+		resources[index] = buffers[index];
+	}
+	for (uint32_t index = 0; index < sizes[0] / sizeof(uint32_t); index++)
+		((uint32_t *)cpu[0])[index] = 1;
+	base->attach_buf(base, cpu[3], sizes[3]);
+	/*
+	 * Phase 3: build this generation's shader and bind the source/
+	 * destination buffers to it -- entirely through the library's hooks
+	 * (amd_spm_capture_build_cache_bench_shader()/
+	 * amd_spm_capture_emit_cache_bench_descriptors()), never branching on
+	 * gfx_major/gfx_minor or emitting PM4 here.
+	 */
+	shader_bytes = amd_spm_capture_build_cache_bench_shader(&capture, cpu[2], sizes[2],
+								&test->params);
+	igt_require_f(shader_bytes > 0,
+		      "Cache-benchmark shader unavailable for SPM profile '%s' "
+		      "(no llvm-mc, assembly failed, or unsupported generation)\n",
+		      profile_name);
+	amdgpu_dispatch_init(AMDGPU_HW_IP_GFX, base, capture.gfx_major);
+	amdgpu_dispatch_write_cumask(base, capture.gfx_major);
+	amdgpu_dispatch_write2hw(base, addresses[2], capture.gfx_major, BACKEND_SE_GC_SHADER_EXEC_SUCCESS);
+	ret = amd_spm_capture_emit_cache_bench_descriptors(&capture, base, addresses[0],
+							   addresses[1], sizes[0] / 16);
+	igt_assert_eq(ret, 0);
+	amdgpu_dispatch_write_direct(base, 64, 1, 1);
+	resources[4] = capture.ring_bo;
+	ret = amdgpu_bo_list_create(device, ARRAY_SIZE(resources), resources, NULL, &resource_list);
+	igt_assert_eq(ret, 0);
+	igt_info("Cache benchmark %s: address span=%u bytes, stride=%u bytes, iterations=%u, shader=%u bytes\n",
+		 test->name, test->params.working_set, stride_bytes, test->params.iterations, shader_bytes);
+	igt_info("64 workgroups x 64 threads, 2 warm-up and 8 measured dispatches on persistent buffers\n");
+	/*
+	 * Phase 4: 2 warm-up dispatches (outside the SPM capture window) to get
+	 * the shader resident and caches into steady state before measuring.
+	 */
+	for (uint32_t dispatch = 0; dispatch < 2; dispatch++)
+		cache_benchmark_submit(device, &capture, resource_list, addresses[3], base->cdw);
+	memset(cpu[1], 0, sizes[1]);
+	/* Phase 5: the 8 measured dispatches, bracketed by the SPM capture window. */
+	ret = amd_spm_capture_start(&capture);
+	igt_assert_eq(ret, 0);
+	igt_assert_eq(clock_gettime(CLOCK_MONOTONIC, &start), 0);
+	for (uint32_t dispatch = 0; dispatch < 8; dispatch++)
+		cache_benchmark_submit(device, &capture, resource_list, addresses[3], base->cdw);
+	igt_assert_eq(clock_gettime(CLOCK_MONOTONIC, &end), 0);
+	ret = amd_spm_capture_stop(&capture);
+	igt_assert_eq(ret, 0);
+	/*
+	 * Phase 6: correctness check -- every work-item's accumulated counter
+	 * must equal iterations * instructions (instructions == 1 for the
+	 * vector/scalar kinds, which only run their inner loop body once per
+	 * iteration). A mismatch here means the shader ran the wrong number of
+	 * times or read/wrote the wrong addresses, independent of anything SPM
+	 * measured.
+	 */
+	expected = test->params.iterations *
+		(test->params.kind == AMD_SPM_CACHE_BENCH_INSTRUCTION ? test->params.instructions : 1);
+	for (uint32_t index = 0; index < sizes[1] / sizeof(uint32_t); index++)
+		igt_assert_eq(((uint32_t *)cpu[1])[index], expected);
+	/*
+	 * Phase 7: read the SPM samples and report both the wall-clock benchmark
+	 * numbers (submission + fence-wait time, logical payload throughput) and
+	 * the hardware's own per-cache hit-rate counters side by side.
+	 */
+	ret = amd_spm_capture_read_caches(&capture, &num_samples, &counter_sum, stats);
+	igt_assert_eq(ret, 0);
+	elapsed = end.tv_sec - start.tv_sec + (end.tv_nsec - start.tv_nsec) / 1e9;
+	igt_assert(elapsed > 0);
+	payload = test->params.kind == AMD_SPM_CACHE_BENCH_VECTOR ?
+			4096ULL * 16 * test->params.iterations * 8 :
+		test->params.kind == AMD_SPM_CACHE_BENCH_SCALAR ?
+			64ULL * 4 * test->params.iterations * 8 : 0;
+	igt_info("Benchmark wall time (submission + fence waits): %.3f ms, %.3f us/dispatch\n",
+		 elapsed * 1000, elapsed * 1e6 / 8);
+	if (payload)
+		igt_info("Logical shader read payload=%llu bytes, wall-time throughput=%.3f GiB/s\n",
+			 (unsigned long long)payload, payload / elapsed / (1024.0 * 1024 * 1024));
+	else
+		igt_info("Instruction work=%llu vector adds (not a memory-bandwidth measurement)\n",
+			 4096ULL * test->params.iterations * test->params.instructions * 8);
+	igt_info("SPM results: %u samples, CPF busy=%llu; counts cover the capture window\n",
+		 num_samples, (unsigned long long)counter_sum);
+	print_cache_stats(stats, capture.gfx_major);
+	igt_assert(num_samples > 0);
+	igt_assert(counter_sum > 0);
+	if (test->params.kind == AMD_SPM_CACHE_BENCH_SCALAR)
+		igt_assert_f(stats[AMD_SPM_CACHE_SCALAR].requests > 0,
+			     "Scalar-load workload produced no sampled scalar-cache activity\n");
+	/* Phase 8: release everything this case allocated. */
+	amdgpu_bo_list_destroy(resource_list);
+	for (uint32_t index = 0; index < ARRAY_SIZE(buffers); index++)
+		amdgpu_bo_unmap_and_free(buffers[index], mappings[index],
+					 addresses[index], sizes[index]);
+	free_cmd_base(base);
+	amd_spm_capture_fini(&capture);
+}
+
+/*
+ * Called exactly once, from exactly one subtest. Which ASIC is plugged in is
+ * determined entirely at runtime inside amd_spm_capture_init() -> select_ops()
+ * in lib/amdgpu/amd_spm.c, which looks the detected generation up in its
+ * spm_generations[] table and installs that generation's hooks into
+ * capture->ops. This function never branches on gfx_major/gfx_minor itself --
+ * it just calls amd_spm_capture_init() and, whichever generation got
+ * selected, the rest of the capture lifecycle (start/stop/read) always goes
+ * through capture->ops.* indirectly via the library's own public API.
+ */
+static void
+run_cpf_busy(amdgpu_device_handle device, struct amd_spm_capture *capture)
+{
+	uint32_t num_samples = 0;
+	uint64_t counter_sum = 0;
+	int ret;
+
+	ret = amd_spm_capture_init(capture, device);
+	igt_require_f(ret == 0, "SPM CPF-busy capture unavailable: %d\n", ret);
+
+	igt_info("SPM profile %s: pointer unit %u bytes, data offset %u bytes\n",
+		 capture->profile.name, capture->profile.pointer_granularity,
+		 capture->profile.data_offset);
+
+	ret = amd_spm_capture_start(capture);
+	igt_assert_eq(ret, 0);
+	ret = amdgpu_memcpy_dispatch_test_with_bo(capture->ring_bo,
+						  device, capture->context,
+						  AMDGPU_HW_IP_GFX, 0, 0,
+						  capture->gfx_major,
+						  BACKEND_SE_GC_SHADER_EXEC_SUCCESS,
+						  NULL, false);
+	igt_assert_eq(ret, 0);
+	ret = amd_spm_capture_stop(capture);
+	igt_assert_eq(ret, 0);
+	ret = amd_spm_capture_read(capture, &num_samples, &counter_sum);
+	igt_assert_eq(ret, 0);
+	igt_assert(num_samples > 0);
+	igt_assert(counter_sum > 0);
+	igt_info("SPM samples %u, CPF busy sum %llu\n",
+		 num_samples, (unsigned long long)counter_sum);
+
+	amd_spm_capture_fini(capture);
+}
+
+int igt_main()
+{
+	amdgpu_device_handle device = NULL;
+	struct amd_spm_capture capture = {};
+	struct amdgpu_gpu_info gpu_info = {};
+	uint32_t major, minor;
+	int fd = -1;
+	int ret;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_AMDGPU);
+		ret = amdgpu_device_initialize(fd, &major, &minor, &device);
+		igt_require(ret == 0);
+		ret = amdgpu_query_gpu_info(device, &gpu_info);
+		igt_assert_eq(ret, 0);
+		ret = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
+		igt_assert_eq(ret, 0);
+	}
+
+	igt_describe("Direct SPM CPF busy capture during compute dispatch");
+	igt_subtest("spm-cpf-busy")
+		run_cpf_busy(device, &capture);
+
+	igt_describe("SPM per-cache-block hit-rate capture during compute dispatch");
+	igt_subtest("spm-cache-hit") {
+		struct amd_spm_cache_stats stats[AMD_SPM_CACHE_COUNT];
+		uint32_t num_samples = 0;
+		uint64_t counter_sum = 0;
+
+		ret = amd_spm_capture_init(&capture, device);
+		igt_require_f(ret == 0, "SPM capture unavailable: %d\n", ret);
+		ret = amd_spm_capture_enable_caches(&capture);
+		if (ret)
+			amd_spm_capture_fini(&capture);
+		igt_require_f(ret == 0, "SPM cache counters unavailable: %d\n", ret);
+
+		ret = amd_spm_capture_start(&capture);
+		igt_assert_eq(ret, 0);
+		igt_info("SPM cache workload: run 64 compute dispatches\n");
+		for (unsigned int dispatch = 0; dispatch < 64; dispatch++) {
+			ret = amdgpu_memcpy_dispatch_test_with_bo(capture.ring_bo,
+								  device, capture.context,
+								  AMDGPU_HW_IP_GFX, 0, 0,
+								  capture.gfx_major,
+								  BACKEND_SE_GC_SHADER_EXEC_SUCCESS,
+								  NULL, false);
+			igt_assert_eq(ret, 0);
+		}
+		ret = amd_spm_capture_stop(&capture);
+		igt_assert_eq(ret, 0);
+		ret = amd_spm_capture_read_caches(&capture, &num_samples,
+						  &counter_sum, stats);
+		igt_assert_eq(ret, 0);
+		igt_info("SPM cache results: %u samples, %u bytes/sample, CPF busy sum=%llu\n",
+			 num_samples, capture.sample_size, (unsigned long long)counter_sum);
+		igt_assert(num_samples > 0);
+		igt_assert(counter_sum > 0);
+		print_cache_stats(stats, capture.gfx_major);
+
+		amd_spm_capture_fini(&capture);
+	}
+
+	/*
+	 * GFX11 uses hand-assembled RDNA3 machine code; GFX10 uses portable
+	 * AMDGCN assembly text assembled at run time via llvm-mc (see
+	 * build_gfx10_cache_bench_shader() in lib/amdgpu/amd_spm.c). Dispatching
+	 * the wrong generation's workload at an ASIC does not just fail cleanly -- it hangs real
+	 * hardware (verified: every dynamic case timed out waiting on its
+	 * fence the one time the GFX11 shaders ran against a Navi10/GFX10
+	 * GPU before this check existed). The safety check lives in
+	 * run_cache_benchmark() itself (profile_name_matches against
+	 * gfx10_or_gfx11_cache_profiles) so every dynamic case skips before
+	 * touching any GPU resource, not just this outer gate.
+	 */
+	igt_describe("GFX10/GFX11 cache working-set, access-pattern, scalar and instruction benchmarks");
+	igt_subtest_with_dynamic("spm-cache-benchmark") {
+		struct amd_spm_capture probe = {};
+		char probe_name[32];
+		bool matches;
+		int probe_ret;
+
+		/*
+		 * Check once, before creating any dynamic subtest, instead of
+		 * letting each of the 9 cases independently discover "wrong
+		 * ASIC" via run_cache_benchmark()'s own check. Same safety
+		 * property (nothing touches the GPU on an unsupported part),
+		 * one SKIP line instead of nine.
+		 */
+		probe_ret = amd_spm_capture_init(&probe, device);
+		igt_require_f(probe_ret == 0, "SPM capture unavailable: %d\n", probe_ret);
+		snprintf(probe_name, sizeof(probe_name), "%s", probe.profile.name);
+		matches = profile_name_matches(probe.profile.name, gfx10_or_gfx11_cache_profiles,
+					       ARRAY_SIZE(gfx10_or_gfx11_cache_profiles));
+		amd_spm_capture_fini(&probe);
+		igt_require_f(matches,
+			      "Detected SPM profile '%s': this cache benchmark has no shader for that ASIC\n",
+			      probe_name);
+
+		for (uint32_t index = 0; index < ARRAY_SIZE(cache_benchmarks); index++) {
+			igt_dynamic_f("%s", cache_benchmarks[index].name)
+				run_cache_benchmark(device, &cache_benchmarks[index]);
+		}
+	}
+
+	igt_fixture() {
+		amd_spm_capture_fini(&capture);
+		if (device)
+			amdgpu_device_deinitialize(device);
+		if (fd >= 0)
+			close(fd);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 11e5c00da..e78a39c43 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -57,6 +57,7 @@ if libdrm_amdgpu.found()
 			  'amd_userptr_invalidation',
 			  'amd_close_race',
 			  'amd_mes_reset',
+			  'amd_spm',
 			]
 	if libdrm_amdgpu.version().version_compare('> 2.4.97')
 		amdgpu_progs +=[ 'amd_syncobj', ]
-- 
2.56.1

