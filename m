Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD09606A31E
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 03:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Pl3Fuitq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61C610E2EC;
	Thu, 26 Nov 2026 03:27:44 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010033.outbound.protection.outlook.com [52.101.201.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B74B10E309
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 03:24:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lPl1lGYdMoO/fG7Tni/Mqcs0POtShS+yFhnb4iWMY/9blgyZRHHRvdJor44uUW9YJlVaONPczzA/eZECJWhDC5DnC1CmCRlpujw0JamR3460HHAFbDShFewCpP0CcEeLlhLqh21M6AwKBbbaqV5X9B/ysWvomyvZBQhVz0JXDHaF+9ZafqyoLPrqPki43b8mq1c/kw3xx9K2h+EfIRa134BeohzAv3C4LF4n7TC63eOl0xIDbFQCTM4F8a3Xs4I2sZCXv8i1pdcBb0uBCvM5CWjzdUjzgX3KMU+a3cG0R23ck4e18Z7P/reI5QQGmhRXjLnzU4UHmaKaiswfU3fSCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaY+3DrLznjAQxoRwx5BeQjA01/1Qh6zAdRTg+FxDdw=;
 b=vp3NDhDoA1oPoQ4tzdblGB4FhQD3xR4E0CID4RYUs5lmHuMu6qvCCYbFFaA53aXJziSH11usRQMLOXYjpdBFEd5ihDlL16ovPTYEiwEI9jEJwXjuH9ls9S4Gb/KqnDU1zBV5fkPugWZtrh/dELCRxC932lec1HtR55kMgxe4ZhgSxYFWp4pLT8/B9brPBtUMtveE87BN2NDDAbs0ODW6zXo7mYCkvoEUlFDlvAiD1GK3ce5254i/b6VWlERs1Jjyhp/ozxocMpaqj5X2MUch9m25uDure//ljCaYoP2EcpjOFrOZzdPcDUoi4BRHcoNR8frDCW5gDCEGiBK3a0AzJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaY+3DrLznjAQxoRwx5BeQjA01/1Qh6zAdRTg+FxDdw=;
 b=Pl3FuitqFLAhkr+elDZP8zKbaTwSAprc31at3IdECWixNPiOgsuNPyF/fRU78iU36tEFTecELy1L0Kijqe7SrDliWoWc9nEU3xWcxukEZ8f2VgiMSE2E3e8LCBweK926N7QwbUJyttWn06K//l4IeoyfLYBYmHbevjpXvvd1NOo=
Received: from SJ0PR03CA0217.namprd03.prod.outlook.com (2603:10b6:a03:39f::12)
 by CH8PR12MB052106.namprd12.prod.outlook.com (2603:10b6:610:709::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 03:24:12 +0000
Received: from SJ1PEPF000037A9.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::69) by SJ0PR03CA0217.outlook.office365.com
 (2603:10b6:a03:39f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 03:24:12 +0000
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
 15.21.662.3 via Frontend Transport; Thu, 26 Nov 2026 03:24:12 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 21:24:09 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 25 Nov 2026 21:24:09 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>, "Claude
 Sonnet 5" <noreply@anthropic.com>
Subject: [PATCH 5/5] tests/amdgpu/amd_spm: log test steps to dmesg via igt_kmsg
Date: Wed, 25 Nov 2026 22:22:09 -0500
Message-ID: <20261126032404.172848-5-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126032404.172848-1-vitaly.prosyak@amd.com>
References: <20261126032404.172848-1-vitaly.prosyak@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A9:EE_|CH8PR12MB052106:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a4be7a3-c159-4f68-9b51-08df4b6cbdb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|261022075727099003|10067099003|56012099006|5023799004|11063799006|261022115727099003|261026130827099003|261026135527099003|261026121527099003|261026140227099003|261022105027099003|261022113327099003|261028144727099003|261021133027099003|261021135927099003|261021121427099003|261021130227099003|261021123027099003|261102123227099003|261009223027099003|18002099003|22082099003|6123799006|3023799007;
X-Microsoft-Antispam-Message-Info: wou2Lkcs5qWHFrf4xJzZVt/vBBfC9IhBYUAVTkifJMhSvRj0QYJES4Ydwf9JA5JjB6EEI7zqYn1tLFf7xiV69bPErbC5upgdfJ20FZD2fmaBtjFmQ7mAD775qfGnNh7lCdaSH/tFcdVB+8PTliDiFxwbRtEquv+8RS/zlYFfJO3SuRw5zuwyyidye3eoRMBL5ga/bMvPanIq3m13kFK0gmVxjM24mraiaij+O/s8B3ME9kNLVoqg+zRbLnhdHUS1CVs1QZhJoc5h1LO+x6qAQavxFmEzifYbMk8At4BVAZLXy8N5e8Sdyfx2v6RCq+KTMoUCE8Nx+/803ShNTKhpez+baUMEigyurcKp1QyYoBXH6SHviIYXZ7u5qrTD4705Birl0gGX+ok5/nonSYnShqJZ1Q1c4M5bZvJHLoGqlTFh7Z0C2bfR7nirs61t2gOHJP/5Oc6eQKjdMZ0bJVS5YMhSWSOMXue7+EtRO82U/R4P+Wfz0Ctqz6j6wtp1Um3dqO6cVHoBnp7MGtqXURWub+KOrYgl6bByEPfoelYDze7T9Vm1bdKNSlZwIbyJLSvodCWWZaKzHa5meJ4wHMkpiPu3487K2TMSmE2HHEWmXhzR/X3frU0PvjPIH0Rsrc9HbgHrNRZS09gp54U7S6yPhPHo+8jCmqhfV8UDswZtAerzIrJ6/lBo0Huo5gTw9Zwx7b0Hnpa/51TAyqs1nYrWRA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(261022075727099003)(10067099003)(56012099006)(5023799004)(11063799006)(261022115727099003)(261026130827099003)(261026135527099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022113327099003)(261028144727099003)(261021133027099003)(261021135927099003)(261021121427099003)(261021130227099003)(261021123027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6123799006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CitR0we9ZjDb5f3SA2Av6gf9p9BfK0fOODL5ugUqJUjsW256tU1NLWGhgm2702RUgg1zzDYt1j31Njz5imFUaC74911Vx13nFzJCLBIREONBvEhuy5una+3xg4BpNEwJWSGy8XflbUSj6yYReYcN+DtLrFtUX6w92BMBv3iCVTM3GsefVYTG4PQtdEugx6leYmfCyq4NQv56KM2oWfpav48J5IWcQqslKP+MJLzhY55fLCyhcLvImznD4CoqREQk8VY2VegH5+f9hVnH/5LbjtL59HILoyPZO5PvcDVyOe22hemTtCk+zQMaHrtxxnB4rA9kw5U7oLJPX+VcpEVb0rESo+h4EvvC4rY5yuluI5bnrZ4MlB0KjrB8bQyTtsNHB/A6gy8aGx30DHIONdE/jGc39+RpmFNBViyifaLVwa8E+81tGAwEwxac68jqhnob
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 03:24:12.0037 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4be7a3-c159-4f68-9b51-08df4b6cbdb6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000037A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB052106
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

Mirror every major step (SPM capture init/profile detection, counters
enabled, buffer allocation, shader build, warm-up/measured dispatch
phases, final sample counts) to the kernel log via igt_kmsg(), not just
stdout. The framework itself already logs subtest start/finish to
dmesg (igt_subtest()/igt_dynamic_f() in lib/igt_core.c), but that says
nothing about what a subtest is doing while it runs or why -- which
matters here since a hung/timed-out dispatch can otherwise leave
nothing in dmesg explaining what the GPU was asked to do right before
it wedged.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_spm.c | 50 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tests/amdgpu/amd_spm.c b/tests/amdgpu/amd_spm.c
index eda5c929e..911954f3a 100644
--- a/tests/amdgpu/amd_spm.c
+++ b/tests/amdgpu/amd_spm.c
@@ -10,6 +10,20 @@
 
 #include <time.h>
 
+/*
+ * Mirror every major step to the kernel log (dmesg), not just stdout: the
+ * framework itself already logs subtest start/finish via igt_kmsg() (see
+ * igt_subtest()/igt_dynamic_f() in lib/igt_core.c), but that says nothing
+ * about *what* a subtest is doing while it runs or *why* -- which matters
+ * here since a hung/timed-out dispatch can leave nothing else in dmesg to
+ * explain what the GPU was asked to do right before it wedged.
+ */
+#define SPM_STEP(fmt, ...) \
+	do { \
+		igt_info("[spm] " fmt "\n", ##__VA_ARGS__); \
+		igt_kmsg(KMSG_INFO "%s: " fmt "\n", igt_test_name(), ##__VA_ARGS__); \
+	} while (0)
+
 static void
 print_cache_stats(const struct amd_spm_cache_stats stats[AMD_SPM_CACHE_COUNT],
 		  uint32_t gfx_major)
@@ -155,6 +169,9 @@ run_cache_benchmark(amdgpu_device_handle device, const struct cache_benchmark_ca
 	bool matches;
 	char profile_name[32];
 
+	SPM_STEP("cache-benchmark %s: starting (kind=%d working_set=%u step=%u iterations=%u instructions=%u)",
+		 test->name, test->params.kind, test->params.working_set, test->params.step,
+		 test->params.iterations, test->params.instructions);
 	/* Phase 1: detect the SPM profile and bail out early on unsupported ASICs. */
 	ret = amd_spm_capture_init(&capture, device);
 	igt_assert_eq(ret, 0);
@@ -168,6 +185,10 @@ run_cache_benchmark(amdgpu_device_handle device, const struct cache_benchmark_ca
 		      profile_name);
 	ret = amd_spm_capture_enable_caches(&capture);
 	igt_require_f(ret == 0, "SPM cache counters unavailable: %d\n", ret);
+	SPM_STEP("cache-benchmark %s: profile '%s' (gfx%u.%u) supported, per-cache-block counters enabled",
+		 test->name, profile_name, capture.gfx_major, capture.gfx_minor);
+	SPM_STEP("cache-benchmark %s: allocating source/destination/shader/command buffers",
+		 test->name);
 
 	/*
 	 * Phase 2: allocate the four persistent buffers this case reuses across
@@ -201,6 +222,8 @@ run_cache_benchmark(amdgpu_device_handle device, const struct cache_benchmark_ca
 		      "Cache-benchmark shader unavailable for SPM profile '%s' "
 		      "(no llvm-mc, assembly failed, or unsupported generation)\n",
 		      profile_name);
+	SPM_STEP("cache-benchmark %s: built %u-byte shader for gfx%u.%u",
+		 test->name, shader_bytes, capture.gfx_major, capture.gfx_minor);
 	amdgpu_dispatch_init(AMDGPU_HW_IP_GFX, base, capture.gfx_major);
 	amdgpu_dispatch_write_cumask(base, capture.gfx_major);
 	amdgpu_dispatch_write2hw(base, addresses[2], capture.gfx_major, BACKEND_SE_GC_SHADER_EXEC_SUCCESS);
@@ -218,16 +241,22 @@ run_cache_benchmark(amdgpu_device_handle device, const struct cache_benchmark_ca
 	 * Phase 4: 2 warm-up dispatches (outside the SPM capture window) to get
 	 * the shader resident and caches into steady state before measuring.
 	 */
+	SPM_STEP("cache-benchmark %s: command buffer bound, running 2 warm-up dispatches",
+		 test->name);
 	for (uint32_t dispatch = 0; dispatch < 2; dispatch++)
 		cache_benchmark_submit(device, &capture, resource_list, addresses[3], base->cdw);
 	memset(cpu[1], 0, sizes[1]);
 	/* Phase 5: the 8 measured dispatches, bracketed by the SPM capture window. */
+	SPM_STEP("cache-benchmark %s: warm-up done, starting SPM capture window and 8 measured dispatches",
+		 test->name);
 	ret = amd_spm_capture_start(&capture);
 	igt_assert_eq(ret, 0);
 	igt_assert_eq(clock_gettime(CLOCK_MONOTONIC, &start), 0);
 	for (uint32_t dispatch = 0; dispatch < 8; dispatch++)
 		cache_benchmark_submit(device, &capture, resource_list, addresses[3], base->cdw);
 	igt_assert_eq(clock_gettime(CLOCK_MONOTONIC, &end), 0);
+	SPM_STEP("cache-benchmark %s: measured dispatches finished, stopping SPM capture window and reading results",
+		 test->name);
 	ret = amd_spm_capture_stop(&capture);
 	igt_assert_eq(ret, 0);
 	/*
@@ -271,6 +300,7 @@ run_cache_benchmark(amdgpu_device_handle device, const struct cache_benchmark_ca
 	if (test->params.kind == AMD_SPM_CACHE_BENCH_SCALAR)
 		igt_assert_f(stats[AMD_SPM_CACHE_SCALAR].requests > 0,
 			     "Scalar-load workload produced no sampled scalar-cache activity\n");
+	SPM_STEP("cache-benchmark %s: done, %u samples", test->name, num_samples);
 	/* Phase 8: release everything this case allocated. */
 	amdgpu_bo_list_destroy(resource_list);
 	for (uint32_t index = 0; index < ARRAY_SIZE(buffers); index++)
@@ -297,15 +327,20 @@ run_cpf_busy(amdgpu_device_handle device, struct amd_spm_capture *capture)
 	uint64_t counter_sum = 0;
 	int ret;
 
+	SPM_STEP("spm-cpf-busy: initializing SPM capture to detect the SPM generation/profile");
 	ret = amd_spm_capture_init(capture, device);
 	igt_require_f(ret == 0, "SPM CPF-busy capture unavailable: %d\n", ret);
 
 	igt_info("SPM profile %s: pointer unit %u bytes, data offset %u bytes\n",
 		 capture->profile.name, capture->profile.pointer_granularity,
 		 capture->profile.data_offset);
+	SPM_STEP("spm-cpf-busy: detected SPM profile '%s' (gfx%u.%u)",
+		 capture->profile.name, capture->gfx_major, capture->gfx_minor);
 
+	SPM_STEP("spm-cpf-busy: starting SPM capture window (sampling the CPF-busy counter)");
 	ret = amd_spm_capture_start(capture);
 	igt_assert_eq(ret, 0);
+	SPM_STEP("spm-cpf-busy: submitting a compute dispatch to generate CPF activity to sample");
 	ret = amdgpu_memcpy_dispatch_test_with_bo(capture->ring_bo,
 						  device, capture->context,
 						  AMDGPU_HW_IP_GFX, 0, 0,
@@ -313,6 +348,7 @@ run_cpf_busy(amdgpu_device_handle device, struct amd_spm_capture *capture)
 						  BACKEND_SE_GC_SHADER_EXEC_SUCCESS,
 						  NULL, false);
 	igt_assert_eq(ret, 0);
+	SPM_STEP("spm-cpf-busy: dispatch finished, stopping SPM capture window and reading samples");
 	ret = amd_spm_capture_stop(capture);
 	igt_assert_eq(ret, 0);
 	ret = amd_spm_capture_read(capture, &num_samples, &counter_sum);
@@ -321,6 +357,8 @@ run_cpf_busy(amdgpu_device_handle device, struct amd_spm_capture *capture)
 	igt_assert(counter_sum > 0);
 	igt_info("SPM samples %u, CPF busy sum %llu\n",
 		 num_samples, (unsigned long long)counter_sum);
+	SPM_STEP("spm-cpf-busy: done, %u samples, CPF busy sum=%llu",
+		 num_samples, (unsigned long long)counter_sum);
 
 	amd_spm_capture_fini(capture);
 }
@@ -334,6 +372,8 @@ int igt_main()
 	int fd = -1;
 	int ret;
 
+	igt_kmsg(KMSG_INFO "%s: SPM capture test suite starting\n", igt_test_name());
+
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_AMDGPU);
 		ret = amdgpu_device_initialize(fd, &major, &minor, &device);
@@ -354,16 +394,21 @@ int igt_main()
 		uint32_t num_samples = 0;
 		uint64_t counter_sum = 0;
 
+		SPM_STEP("spm-cache-hit: initializing SPM capture to detect the SPM generation/profile");
 		ret = amd_spm_capture_init(&capture, device);
 		igt_require_f(ret == 0, "SPM capture unavailable: %d\n", ret);
 		ret = amd_spm_capture_enable_caches(&capture);
 		if (ret)
 			amd_spm_capture_fini(&capture);
 		igt_require_f(ret == 0, "SPM cache counters unavailable: %d\n", ret);
+		SPM_STEP("spm-cache-hit: profile '%s' (gfx%u.%u), per-cache-block counters enabled",
+			 capture.profile.name, capture.gfx_major, capture.gfx_minor);
 
+		SPM_STEP("spm-cache-hit: starting SPM capture window");
 		ret = amd_spm_capture_start(&capture);
 		igt_assert_eq(ret, 0);
 		igt_info("SPM cache workload: run 64 compute dispatches\n");
+		SPM_STEP("spm-cache-hit: submitting 64 compute dispatches to generate cache activity");
 		for (unsigned int dispatch = 0; dispatch < 64; dispatch++) {
 			ret = amdgpu_memcpy_dispatch_test_with_bo(capture.ring_bo,
 								  device, capture.context,
@@ -373,6 +418,7 @@ int igt_main()
 								  NULL, false);
 			igt_assert_eq(ret, 0);
 		}
+		SPM_STEP("spm-cache-hit: dispatches finished, stopping SPM capture window and reading results");
 		ret = amd_spm_capture_stop(&capture);
 		igt_assert_eq(ret, 0);
 		ret = amd_spm_capture_read_caches(&capture, &num_samples,
@@ -383,6 +429,7 @@ int igt_main()
 		igt_assert(num_samples > 0);
 		igt_assert(counter_sum > 0);
 		print_cache_stats(stats, capture.gfx_major);
+		SPM_STEP("spm-cache-hit: done, %u samples", num_samples);
 
 		amd_spm_capture_fini(&capture);
 	}
@@ -413,6 +460,7 @@ int igt_main()
 		 * property (nothing touches the GPU on an unsupported part),
 		 * one SKIP line instead of nine.
 		 */
+		SPM_STEP("spm-cache-benchmark: probing SPM profile to check this ASIC has a cache-benchmark shader");
 		probe_ret = amd_spm_capture_init(&probe, device);
 		igt_require_f(probe_ret == 0, "SPM capture unavailable: %d\n", probe_ret);
 		snprintf(probe_name, sizeof(probe_name), "%s", probe.profile.name);
@@ -422,6 +470,8 @@ int igt_main()
 		igt_require_f(matches,
 			      "Detected SPM profile '%s': this cache benchmark has no shader for that ASIC\n",
 			      probe_name);
+		SPM_STEP("spm-cache-benchmark: profile '%s' supported, running %zu benchmark cases",
+			 probe_name, ARRAY_SIZE(cache_benchmarks));
 
 		for (uint32_t index = 0; index < ARRAY_SIZE(cache_benchmarks); index++) {
 			igt_dynamic_f("%s", cache_benchmarks[index].name)
-- 
2.56.1

