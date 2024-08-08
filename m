Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68014C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  8 Aug 2024 06:38:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BDD10E65C;
	Thu,  8 Aug 2024 06:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tu0vluTm";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC4310E65C
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Aug 2024 06:38:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2rIDBC8Naiu6X7xKMYdEoomhyK+6PtO/Chf+fmgl4pADYwqZzZiSneT+s3a24TXpMVmBjCMuIoOvceBX4+WmyDWl01aQ8SCORdt2Kivih9rXmi7YAlfMFu4ziXgTXpXIqPuuwrGB5YPRifKr1fHbni21a8qD5WEjALxEBQyjIb7b+ucW2BgBmtoOcpjgSIc5t2/D8Hc7D3fQC8iaGX1FsRzDlu3RUEtxDQ3ywARHo5gHRqDEsE09SeI6Dy335xUPgmGX9GfVMWgYM5rsDCeZauSR43nuta8q3Pw5y2Th9T9cu6lLumRb0imiJKPbbKZrqrR11NLXt29j2DIYUJfKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQ0KktbCl5z2zTFRLOmWPd1n282l9rcD5RXRtk1KSDo=;
 b=hmmdkj/EDta13nwcH4Bw+g/qEYGRTmTH38PXHY72lFy38W5pBchflMBa5M/i+I+powsuKahdnul6n/y24J4X7K9Lup+nU6V6XTRjNYSVBNjJveW/d8+CPpuS3ovdd12Bp5vgzOEMkfeLG2yfld34Sirt+PrTGJD00pCEMswkvCURhSLJR3YtgnUR8u4obHCyj5P9z6JcuNvXzxzbr+WbJfg7h3A6kUjrgbY/fV1ktwt+SNKEwJwvET7zoAB2Wvmc0JxPZiiNL9h6Wd1uB8nhr2bGj1+laAXnZhoVlfMwRne/RiynpYBZotSr1mU3weKgTqBzekXVXxVORfFI44902w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQ0KktbCl5z2zTFRLOmWPd1n282l9rcD5RXRtk1KSDo=;
 b=tu0vluTmiYNeyZ8CUYD+jUZNc3p8X+MhTxa5UUfd7utW/6SEExXHPhtaCd/pwZ+Xrp4C5iqdhCzDEDsDsKAgJv+3x3ftBsnAMYuUOKDc+wqUDcET+SBekDWaCPQLabLO48nfU8INlCjDgdh9XK5g3ti07tE20MfwE/5DPnm96Dk=
Received: from SN6PR08CA0018.namprd08.prod.outlook.com (2603:10b6:805:66::31)
 by PH8PR12MB7109.namprd12.prod.outlook.com (2603:10b6:510:22f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Thu, 8 Aug
 2024 06:38:11 +0000
Received: from SA2PEPF00003AE8.namprd02.prod.outlook.com
 (2603:10b6:805:66:cafe::ee) by SN6PR08CA0018.outlook.office365.com
 (2603:10b6:805:66::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.35 via Frontend
 Transport; Thu, 8 Aug 2024 06:38:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE8.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Thu, 8 Aug 2024 06:38:11 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 Aug
 2024 01:38:10 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 8 Aug 2024 01:38:09 -0500
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tests/amdgpu: add KGQ test in queue reset
Date: Thu, 8 Aug 2024 14:38:08 +0800
Message-ID: <20240808063808.2655385-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE8:EE_|PH8PR12MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: 32b0f8a6-5259-404b-a64b-08dcb774ac65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bWtx23nADYZgI4p5hmJl6dB7pBnkZg0ngspjv0dZ9nsDpepjugTOv1Bw3itj?=
 =?us-ascii?Q?95ulgOCj9yyZ/034W0OKVqcKFfY/7cYaYoXuUjPndhpccKG0r0oMfSExGcoq?=
 =?us-ascii?Q?l0PxvR9FCrVAKAKoLpuGfXPy9qG/wvcZ8z/Z3gZnKrQHEhwkcOoiHhE/S0vL?=
 =?us-ascii?Q?ckCKTmA/+2oh521xfovdydOsoG6hnNacf/LqmXnjgkJyXhnR7fiV9ntRUBMV?=
 =?us-ascii?Q?zAZU6dRBT4BIPtByID3c2+wBdKpR/TBF3MFlwMWy38WfvESAB7tMiwOpKVf4?=
 =?us-ascii?Q?LQTizvv+z7tYUZJLJa+DpkFCWHMs0jyRZ0MhpFvoD7/JTEqT5A0movvJRQLP?=
 =?us-ascii?Q?wWdg6vKfrubhlgbtnuxvfCTCPGbleXWbCd8RHcIu6DyqeAkZ7zVuNmlw8KCB?=
 =?us-ascii?Q?7PGPOWoiIg6HyV6qup1zgUQNdB2VrxMxTjDXIs+4yAcoip7gQMbXILrZuLZj?=
 =?us-ascii?Q?kaVnsopQ0BjX6vmlEo6x17U8elrO4EU1r6DcT13E46gaz0PTBRgxZ8oa9lR6?=
 =?us-ascii?Q?t98S9rNOSkg9gWVZcDdj8IBC0EaQzDGQOqLyDKsi7cXOEZw7MarPb90HhU0H?=
 =?us-ascii?Q?KpmCJ9ZY/fpSF+sjRc5LuHZgR2wl+Cx4+S6VpfeTdmoP/XQL5GTnySxta/FD?=
 =?us-ascii?Q?8qehndiPPuRebQhY6/dRJJ5o5mzG517gRib7uVW5+WNw1lgR5el5DZyr9m/A?=
 =?us-ascii?Q?nkQWlIuX63pgTOxfjnBXqRjdd+8OWVk3pIt/luIDJAt05zf7bggfo+Ql8VAm?=
 =?us-ascii?Q?UfIOyopUq2HH7S/7PmoJCAX29ckZ2/ToHpR6HqbQKNT0IkAoHbEuu490xb2q?=
 =?us-ascii?Q?Ga7xpI+Sou0Zx9iuXqVJ+9kL8bLtdM3fQlkeiKgvmMhMGqHuZ3Fo9IGR2B18?=
 =?us-ascii?Q?I7kUXS+cVUp51P8zz5ib4JD3Yttpb51KJzDqXF6w/ALkY/1rOUqs5xKnwiH6?=
 =?us-ascii?Q?jp+7P2upoJ/re8Yh4uOz3kX6vS81lKlMtfxG+El/hv0Vlj5CLFDCccZ3wxrZ?=
 =?us-ascii?Q?3lxubp7V6nbUyVaTyb44/bjOzvfHsY4vraqOLoMiBpXE+Ef8cBy6jGSzj2Re?=
 =?us-ascii?Q?crnLbZUrVrio9Q8KTAULpPt/l19RSHGKntJQRDDjoE6WfRqiamVjS30IJPPr?=
 =?us-ascii?Q?lPZ3zU9FAelSkI2bDnAAvBZ8DJYUzDVCLV5pVcjAYiXqke08Lb116j1FRWSM?=
 =?us-ascii?Q?0eqpR6ji7IladvKPhoqmAXJzGFVW05wbPd5Dp35uNi3sqo+v23x+Cx9EpuIE?=
 =?us-ascii?Q?2m+lQ2PaQ1/N19nHYuHq0Gbjkj+qmRGSUgiBWXlC6AMswWyV4IpR8xqLAglS?=
 =?us-ascii?Q?UZOH19GQ1yv9ZEihR47+l2yufUfEiZLvg6YrkAVdSKdHo/eOZnrw6CL7Mjso?=
 =?us-ascii?Q?Td9199QaV+Z52M5bvcM07pl4jfl/ZOQmpEZopwUHWkPPRKjo26YxMWwoU0O5?=
 =?us-ascii?Q?r+Z3H1NsY54LF+GkeXnSttc5hNLH6mMv?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 06:38:11.5262 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b0f8a6-5259-404b-a64b-08dcb774ac65
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7109
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

Ehance the queue reset, add KGQ test.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.h     |   7 ++
 tests/amdgpu/amd_queue_reset.c | 145 ++++++++++++++-------------------
 2 files changed, 70 insertions(+), 82 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 7fd883608..1b39d9945 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -45,6 +45,13 @@ enum  cmd_error_type {
 	BACKEND_SE_GC_SHADER_INVALID_USER_DATA /* COMPUTE_USER_DATA */
 };
 
+struct dynamic_test{
+	enum cmd_error_type test;
+	const char *name;
+	const char *describe;
+};
+#define for_each_test(t, T) for(typeof(*T) *t = T; t->name; t++)
+
 /* aux struct to hold misc parameters for convenience to maintain */
 struct amdgpu_ring_context {
 
diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 9ea0a1f24..f953dcdfa 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -848,23 +848,36 @@ free_contexts(amdgpu_device_handle device, amdgpu_context_handle *p_contexts,
 
 /* TODO add logic to iterate for all */
 static bool
-get_next_rings(unsigned int ring_begin, unsigned int available_rings,
-		unsigned int *next_ring, unsigned int *next_next_ring)
+get_next_rings(unsigned int ring_begin, struct drm_amdgpu_info_hw_ip info[],
+		unsigned int *good_job_ring, unsigned int *bad_job_ring,  unsigned int order)
 {
-	bool ret = false;
+	bool ret1 = false, ret2 = false;
 	unsigned int ring_id;
 
-	for (ring_id = ring_begin; (1 << ring_id) & available_rings; ring_id++) {
-		*next_ring = ring_id;
-		*next_next_ring = ring_id + 1;
-
-		if ((*next_ring  & available_rings) && (*next_next_ring & available_rings)) {
-			ret = true;
+	/* check good job ring is available. */
+	for (ring_id = ring_begin; (1 << ring_id) & info[0].available_rings; ring_id++) {
+		*good_job_ring = ring_id;
+		if((1 << *good_job_ring) & info[0].available_rings) {
+			ret1 = true;
 			break;
 		}
 	}
-	return ret;
+	/* check bad job ring is available */
+	for (ring_id = ring_begin; (1 << ring_id) & info[order].available_rings; ring_id++) {
+		/*if bad job on compute ring, ring_id + 1 */
+		if(!order)
+			*bad_job_ring = ring_id + 1;
+		else
+			*bad_job_ring = ring_id;
+		if((1 << *bad_job_ring) & info[order].available_rings) {
+			ret2 = true;
+			break;
+		}
+	}
+
+	return ret1 && ret2;
 }
+
 igt_main
 {
 	char cmdline[2048];
@@ -878,7 +891,7 @@ igt_main
 	posix_spawn_file_actions_t action;
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {0};
-	struct drm_amdgpu_info_hw_ip info = {0};
+	struct drm_amdgpu_info_hw_ip info[2] = {0};
 	int fd = -1;
 	int fd_shm = -1;
 	struct shmbuf *sh_mem = NULL;
@@ -888,7 +901,7 @@ igt_main
 	unsigned int ring_id_good = 0;
 	unsigned int ring_id_bad = 1;
 
-	enum amd_ip_block_type ip_test = AMD_IP_COMPUTE;
+	enum amd_ip_block_type ip_tests[2] = {AMD_IP_COMPUTE/*keep first*/, AMD_IP_GFX};
 	enum amd_ip_block_type ip_background = AMD_IP_COMPUTE;
 
 	amdgpu_context_handle *arr_context_handle = NULL;
@@ -897,14 +910,27 @@ igt_main
 	 * which are shared between child processes ( test/monitor/main and
 	 *  separate for background
 	 */
-	unsigned int arr_err[] = {
-			CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
-			CMD_STREAM_EXEC_INVALID_OPCODE,
-			//CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,TODO  not job timeout, debug why for n31
-			//CMD_STREAM_TRANS_BAD_REG_ADDRESS, TODO  amdgpu: device lost from bus! for n31
-			BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR,
-			BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,
-			BACKEND_SE_GC_SHADER_INVALID_USER_DATA
+	struct dynamic_test arr_err[] = {
+			{CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,"CMD_STREAM_EXEC_INVALID_PACKET_LENGTH",
+				"Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes"},
+			{CMD_STREAM_EXEC_INVALID_OPCODE,"CMD_STREAM_EXEC_INVALID_OPCODE",
+				"Stressful-and-multiple-cs-of-bad and good opcode-operations-using-multiple-processes"},
+			//TODO  not job timeout, debug why for n31.
+			//{CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,"CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC",
+			//	"Stressful-and-multiple-cs-of-bad and good mem-sync-operations-using-multiple-processes"},
+			//TODO amdgpu: device lost from bus! for n31
+			//{CMD_STREAM_TRANS_BAD_REG_ADDRESS,"CMD_STREAM_TRANS_BAD_REG_ADDRESS",
+			//	"Stressful-and-multiple-cs-of-bad and good reg-operations-using-multiple-processes"},
+			{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR,"BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR",
+				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
+			//TODO  KGQ cannot revocer by queue reset, it maybe need a fw bugfix on naiv31
+			//{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,"BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING",
+			//	"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
+			{BACKEND_SE_GC_SHADER_INVALID_USER_DATA,"BACKEND_SE_GC_SHADER_INVALID_USER_DATA",
+				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
+			{BACKEND_SE_GC_SHADER_INVALID_SHADER,"BACKEND_SE_GC_SHADER_INVALID_SHADER",
+				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
+			{}
 	};
 
 	int const_num_of_tests;
@@ -921,7 +947,7 @@ igt_main
 		if (is_run_subtest_parameter_found(argc, argv))
 			const_num_of_tests = 1;
 		else
-			const_num_of_tests = ARRAY_SIZE(arr_err);
+			const_num_of_tests = sizeof(arr_err)/sizeof(struct dynamic_test) * ARRAY_SIZE(ip_tests);
 
 		if (!is_background_parameter_found(argc, argv)) {
 			add_background_parameter(&argc, argv);
@@ -943,8 +969,11 @@ igt_main
 
 		r = amdgpu_query_gpu_info(device, &gpu_info);
 		igt_assert_eq(r, 0);
-		 r = amdgpu_query_hw_ip_info(device, ip_test, 0, &info);
-		igt_assert_eq(r, 0);
+		for(int i = 0; i < ARRAY_SIZE(ip_tests); i++) {
+			r = amdgpu_query_hw_ip_info(device, ip_tests[i], 0, &info[i]);
+			igt_assert_eq(r, 0);
+		}
+
 		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
 		igt_assert_eq(r, 0);
 
@@ -959,68 +988,20 @@ igt_main
 		igt_require(sh_mem != NULL);
 
 		run_all(device, arr_context_handle,
-			process, sh_mem, const_num_of_tests, info.hw_ip_version_major,
+			process, sh_mem, const_num_of_tests, info[0].hw_ip_version_major,
 			&monitor_child, &test_child);
 	}
 
-	igt_describe("Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes");
-	igt_subtest("amdgpu-compute-CMD_STREAM_EXEC_INVALID_PACKET_LENGTH") {
-		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
-			set_next_test_to_run(sh_mem, CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
-						ip_background, ip_test, ring_id_good, ring_id_bad);
-		}
-	}
-
-	igt_describe("Stressful-and-multiple-cs-of-bad and good opcode-operations-using-multiple-processes");
-	igt_subtest("amdgpu-compute-CMD_STREAM_EXEC_INVALID_OPCODE") {
-		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
-			set_next_test_to_run(sh_mem, CMD_STREAM_EXEC_INVALID_OPCODE,
-						ip_background, ip_test, ring_id_good, ring_id_bad);
-		}
-	}
-
-	/* TODO  not job timeout, debug why for nv32
-	 *igt_describe("Stressful-and-multiple-cs-of-bad and good mem-sync-operations-using-multiple-processes");
-	 *igt_subtest_with_dynamic("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC") {
-	 *	if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
-	 *		igt_dynamic_f("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC")
-	 *			set_next_test_to_run(sh_mem, CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,
-	 *					ip_background, ip_test, ring_id_good, ring_id_bad);
-	 *	}
-	 */
-
-	/* TODO  amdgpu: device lost from bus! for nv32
-	 *igt_describe("Stressful-and-multiple-cs-of-bad and good reg-operations-using-multiple-processes");
-	 *igt_subtest_with_dynamic("amdgpu-compute-CMD_STREAM_TRANS_BAD_REG_ADDRESS") {
-	 *	if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
-	 *		igt_dynamic_f("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS")
-	 *			set_next_test_to_run(sh_mem, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
-	 *					ip_background, ip_test, ring_id_good, ring_id_bad);
-	 *	}
-	 */
-
-	//amdgpu_ring_soft_recovery
-	igt_describe("Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes");
-	igt_subtest("Handful-by-soft-recovery-amdgpu-compute-BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR") {
-		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
-			set_next_test_to_run(sh_mem, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR,
-						ip_background, ip_test, ring_id_good, ring_id_bad);
-		}
-	}
-
-	igt_describe("Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes");
-	igt_subtest("amdgpu-compute-BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING") {
-		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
-			set_next_test_to_run(sh_mem, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,
-						ip_background, ip_test, ring_id_good, ring_id_bad);
-		}
-	}
-
-	igt_describe("Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes");
-	igt_subtest("amdgpu-compute-BACKEND_SE_GC_SHADER_INVALID_USER_DATA") {
-		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
-			set_next_test_to_run(sh_mem, BACKEND_SE_GC_SHADER_INVALID_USER_DATA,
-						ip_background, ip_test, ring_id_good, ring_id_bad);
+	for(int i = 0; i < ARRAY_SIZE(ip_tests); i++) {
+		for(struct dynamic_test *it = &arr_err[0]; it->name; it++) {
+			igt_describe("Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes");
+			igt_subtest_with_dynamic_f("amdgpu-%s-%s",ip_tests[i] == AMD_IP_COMPUTE ? "compute":"gfx", it->name) {
+				if (arr_cap[ip_tests[i]] && get_next_rings(ring_id_good, info, &ring_id_good, &ring_id_bad, i)) {
+					igt_dynamic_f("amdgpu-%s",it->name);
+					set_next_test_to_run(sh_mem, it->test,
+							ip_background, ip_tests[i], ring_id_good, ring_id_bad);
+				}
+			}
 		}
 	}
 
-- 
2.25.1


