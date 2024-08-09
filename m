Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC0AC3DA4A
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 04:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E573D10E717;
	Fri,  9 Aug 2024 04:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="D9Iot2oT";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C5910E717
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Aug 2024 04:14:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GfaPvqhjxgQFZCjrNn0l2bOx2qKjq9uBPkC93PI9LG2uE5D42vpiT0It2+m0pXBl6rQDqQCufVM5kI8FXPIaufYJO67MbXsEuxwyMniATLshO/wPPRD0UKOkEEvJB8HBRNWAAnppJIkEugRq6F6hA3YMx8SBWDm8gzKXU+0NVuSoQ1dTGmCXJA2qO6whWlRuk+r32yExGwmN1EjdirKjIVPZWlRK5IKOmhk/DOamA2VSYQIY/UcCbxcY1Qme8gTnHBCoOtp3qZ42DEFu/a3Lot9DVk70P0zr7Wqz3XoQjYiZOM30tYiOFM4pFw0OnH9N5jI1b+1eEEwqV4Lkf+EjUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWS5HhpGee/41S9pePsQaji3fU+yZziOmlAyQ1fCu3A=;
 b=NWjTV0GWTZz5B7DJNaraOKsAGKg+wn4cDQWDbkQE5C+r5RTr747Z2SCp7hy80p8o3lsiRKWsjOwpJikcJ34SpVmnh4hO2yL2zCRFycBZXr9fbNHh34rJDrsj7zYYVt59bQw/4b3GsNwsq8qn3JXfUjWXDft8NJRc/7uVn0Ej3vneUcmd0f3VYKV6lbhaUcyopI5+hk+hXF8w3+umF8hGC/dVQcdud1NIraF0lvtODT5KLMNKOfQDu+hySVKhr/cLROpHzTjW6G3/oDkihiXGYwM8Z5rnelrmodJNNsxXvG0VqQ/isS4OoD8tN4NpCNgXElTTdXW7vTmBoRBMn2ylOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWS5HhpGee/41S9pePsQaji3fU+yZziOmlAyQ1fCu3A=;
 b=D9Iot2oTHcr/4l8mK/txK/T6zqq0dZm0uth8+v7TTqCV4zoUEmuwSYQZPpHfsd9vpzIcTp9HwMT495n49g11wCUE1F5wWEoJBRv/cjhPUQc46C82TpkkbRAGLvVw/dFmVyQYpL3c5XuD8/11Jn7HN8b7W1zoIkq7LmQEvbm6mQE=
Received: from SJ0PR13CA0193.namprd13.prod.outlook.com (2603:10b6:a03:2c3::18)
 by MW4PR12MB7262.namprd12.prod.outlook.com (2603:10b6:303:228::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 9 Aug
 2024 04:14:53 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::ae) by SJ0PR13CA0193.outlook.office365.com
 (2603:10b6:a03:2c3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15 via Frontend
 Transport; Fri, 9 Aug 2024 04:14:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Fri, 9 Aug 2024 04:14:52 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 Aug
 2024 23:14:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 Aug
 2024 23:14:51 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 8 Aug 2024 23:14:49 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Jesse.zhang@amd.com"
 <jesse.zhang@amd.com>
Subject: [PATCH i-g-t v3] tests/amdgpu: add KGQ test in queue reset
Date: Fri, 9 Aug 2024 12:14:49 +0800
Message-ID: <20240809041449.2740836-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|MW4PR12MB7262:EE_
X-MS-Office365-Filtering-Correlation-Id: 08e6f082-bf6e-4743-c58c-08dcb829d184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gUMZw2pDoFoB2I6eAc1TaF9veMCaSV1ywSa0QrKrSCyWNrcNfCa8ipXK3sUG?=
 =?us-ascii?Q?y7cKdFbU8PpZqe7HtKaS1/y4aEiYdeu7YArwZcr0MdP6ob9wInS9OCibgqvM?=
 =?us-ascii?Q?rU9sU+w47saR1YhCItI4j71PcMHthvZ6aNv5+mDmDvWVRWx+UBwLFLKnov76?=
 =?us-ascii?Q?5YTAFNo4VT/PY/vwOP+aZatjjUN53leX4rF62ouKbk6L3QGFWHgUpZpXGFYQ?=
 =?us-ascii?Q?XtZJEu5r/5aVxvqOxvMfzd1bRWu6nkS47jawIc47VF2Y13O0yuTYEHIbR/gm?=
 =?us-ascii?Q?xXY+rEVdPVMyk+FK2FO0+KqpRyG+CRFhFZpTVmU83WlK4UecHu6jqsdLtUZL?=
 =?us-ascii?Q?wrwHgac68FoUbhKBGaGAxo6iW2VJURsttAjIOXKXenT6g+qmWraZ8LWBNUBs?=
 =?us-ascii?Q?WnBKwsuxIt60MGh+l9/a84mZenFMDLiVlmi94hPihxOb/GQ/Ov3VeF6bS7dL?=
 =?us-ascii?Q?B6jPNX3GTj0/vQRK1uLrGHHiG9JaUDrZ+++ZKosLwo+FR/DMohCdYeoinOGr?=
 =?us-ascii?Q?JyVvc3HgCwcIPPqi/nSMDG036tyU3+czw37UCxHPfBCmwmUEgiUG+1iyb4ll?=
 =?us-ascii?Q?8DtH8m+K8rJrHn9ccLExn3odYR6dGZeBqGsSqJrbAykscgnGN/H5hwDj6xNe?=
 =?us-ascii?Q?xemT0iY/pfF2gxZY7y66fgpLQW7/W9jUde3kwBJVHB/qfLW8oPRvX2hNOHfK?=
 =?us-ascii?Q?Psv9Aq0zalvEu3yfHrMh13HISJB/JNwz7Emf9TJDy9mn6nxtJbytrLZrMMhy?=
 =?us-ascii?Q?RoT9sqq0ka8RxAZND29HdKmJ/WYjFujVOPNHpivm9bYdapN7rNWqFZxWrAsb?=
 =?us-ascii?Q?WmHIvsdiwHqByl2cXK/a54uZzny29C5B+z6zcpW+FxYuFuBAVhefdlvcwbXs?=
 =?us-ascii?Q?UwbVhvJsSfU3kjKZ1ViO7NvspIqYcrFXFXOn8QQ+TNEHeYJYDJ5yqRIP0Hbn?=
 =?us-ascii?Q?7lQOPZFvrXw+TpZ1welC7Omrrv+8KPeEliPRGWahCmJjftg5k0vK0cEoCi/O?=
 =?us-ascii?Q?yUdUQU0QI/FlJ+GHDTgtfxd+NG4e8nrKfUukEbQ8Ws6uVQUOZvIeSc8vqWOX?=
 =?us-ascii?Q?x3rv+X8EgM0BJ4ghKdQ1z7wW/84UcGVqGVWT508O0EjborBTiz/ITbcGdH+k?=
 =?us-ascii?Q?sZ2AdgO9vdl3CYC22ey1XGGgCv6b6mNPMcFZIwTiebl1aCVa9u5hJyGaNSnR?=
 =?us-ascii?Q?zzhwCTy3j7m5vdFj6mDNrNLoOFDBUqgTVMe37tr8DzPjrxA/cnkN+CpaOG0b?=
 =?us-ascii?Q?9uDI9pFEGI1jmpPyjSmWGRjK9W1OtVyk2oBounhLauvouqeroVvt7qdi8P6n?=
 =?us-ascii?Q?ZjuVAgKMY7KhZy09c/eNnu/ig/YvTr7uh+0JfX6gEg5riGJ3lhZs2R+MAdGc?=
 =?us-ascii?Q?qWmciO7F3e6Kk9cbGP+afrCPbNw7xMBwxca6S6XSdjwWDiL3GVMd/0+hSRqD?=
 =?us-ascii?Q?X5du/zyQ/bEie+Prc4vyLQh+gyv/H4Y+?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 04:14:52.6514 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e6f082-bf6e-4743-c58c-08dcb829d184
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7262
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

Enhance the queue reset, add KGQ test.

V2:
  Some improvements regarding the selection of testing ring (Vitaly)
V3:
 Fix calculation of number of constant tests.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.h     |   7 ++
 tests/amdgpu/amd_queue_reset.c | 145 ++++++++++++++-------------------
 2 files changed, 69 insertions(+), 83 deletions(-)

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
index 9ea0a1f24..bc8414c23 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -846,25 +846,36 @@ free_contexts(amdgpu_device_handle device, amdgpu_context_handle *p_contexts,
 	}
 }
 
-/* TODO add logic to iterate for all */
 static bool
-get_next_rings(unsigned int ring_begin, unsigned int available_rings,
-		unsigned int *next_ring, unsigned int *next_next_ring)
+get_next_rings(unsigned int ring_begin, struct drm_amdgpu_info_hw_ip info[],
+		unsigned int *good_job_ring, unsigned int *bad_job_ring,  unsigned int order)
 {
-	bool ret = false;
 	unsigned int ring_id;
 
-	for (ring_id = ring_begin; (1 << ring_id) & available_rings; ring_id++) {
-		*next_ring = ring_id;
-		*next_next_ring = ring_id + 1;
+	/* Check good job ring is available. By default good job run on compute ring */
+	for (ring_id = ring_begin; (1 << ring_id) & info[0].available_rings; ring_id++) {
+		if ((1 << *good_job_ring) & info[0].available_rings) {
+			*good_job_ring = ring_id;
+			/* check bad job ring is available */
+			for (ring_id = ring_begin; (1 << ring_id) & info[order].available_rings; ring_id++) {
+				/* if order is 0, bad job run on compute ring,
+				 * It should skip good ring and find next ring to run bad job.
+				 */
+				if (!order)
+					*bad_job_ring = *good_job_ring + 1;
+				else
+					*bad_job_ring = ring_id;
+				if ((1 << *bad_job_ring) & info[order].available_rings) {
+					return true;
+				}
+			}
 
-		if ((*next_ring  & available_rings) && (*next_next_ring & available_rings)) {
-			ret = true;
-			break;
 		}
 	}
-	return ret;
+
+	return false;
 }
+
 igt_main
 {
 	char cmdline[2048];
@@ -878,7 +889,7 @@ igt_main
 	posix_spawn_file_actions_t action;
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {0};
-	struct drm_amdgpu_info_hw_ip info = {0};
+	struct drm_amdgpu_info_hw_ip info[2] = {0};
 	int fd = -1;
 	int fd_shm = -1;
 	struct shmbuf *sh_mem = NULL;
@@ -888,7 +899,7 @@ igt_main
 	unsigned int ring_id_good = 0;
 	unsigned int ring_id_bad = 1;
 
-	enum amd_ip_block_type ip_test = AMD_IP_COMPUTE;
+	enum amd_ip_block_type ip_tests[2] = {AMD_IP_COMPUTE/*keep first*/, AMD_IP_GFX};
 	enum amd_ip_block_type ip_background = AMD_IP_COMPUTE;
 
 	amdgpu_context_handle *arr_context_handle = NULL;
@@ -897,14 +908,27 @@ igt_main
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
+			{CMD_STREAM_EXEC_INVALID_PACKET_LENGTH, "CMD_STREAM_EXEC_INVALID_PACKET_LENGTH",
+				"Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes"},
+			{CMD_STREAM_EXEC_INVALID_OPCODE, "CMD_STREAM_EXEC_INVALID_OPCODE",
+				"Stressful-and-multiple-cs-of-bad and good opcode-operations-using-multiple-processes"},
+			//TODO  not job timeout, debug why for n31.
+			//{CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,"CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC",
+			//	"Stressful-and-multiple-cs-of-bad and good mem-sync-operations-using-multiple-processes"},
+			//TODO amdgpu: device lost from bus! for n31
+			//{CMD_STREAM_TRANS_BAD_REG_ADDRESS,"CMD_STREAM_TRANS_BAD_REG_ADDRESS",
+			//	"Stressful-and-multiple-cs-of-bad and good reg-operations-using-multiple-processes"},
+			{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, "BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR",
+				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
+			//TODO  KGQ cannot revocer by queue reset, it maybe need a fw bugfix on naiv31
+			//{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,"BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING",
+			//	"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
+			{BACKEND_SE_GC_SHADER_INVALID_USER_DATA, "BACKEND_SE_GC_SHADER_INVALID_USER_DATA",
+				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
+			{BACKEND_SE_GC_SHADER_INVALID_SHADER, "BACKEND_SE_GC_SHADER_INVALID_SHADER",
+				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
+			{}
 	};
 
 	int const_num_of_tests;
@@ -921,7 +945,7 @@ igt_main
 		if (is_run_subtest_parameter_found(argc, argv))
 			const_num_of_tests = 1;
 		else
-			const_num_of_tests = ARRAY_SIZE(arr_err);
+			const_num_of_tests = (sizeof(arr_err)/sizeof(struct dynamic_test) - 1) * ARRAY_SIZE(ip_tests);
 
 		if (!is_background_parameter_found(argc, argv)) {
 			add_background_parameter(&argc, argv);
@@ -943,8 +967,11 @@ igt_main
 
 		r = amdgpu_query_gpu_info(device, &gpu_info);
 		igt_assert_eq(r, 0);
-		 r = amdgpu_query_hw_ip_info(device, ip_test, 0, &info);
-		igt_assert_eq(r, 0);
+		for (int i = 0; i < ARRAY_SIZE(ip_tests); i++) {
+			r = amdgpu_query_hw_ip_info(device, ip_tests[i], 0, &info[i]);
+			igt_assert_eq(r, 0);
+		}
+
 		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
 		igt_assert_eq(r, 0);
 
@@ -959,68 +986,20 @@ igt_main
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
+	for (int i = 0; i < ARRAY_SIZE(ip_tests); i++) {
+		for (struct dynamic_test *it = &arr_err[0]; it->name; it++) {
+			igt_describe("Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes");
+			igt_subtest_with_dynamic_f("amdgpu-%s-%s", ip_tests[i] == AMD_IP_COMPUTE ? "compute":"gfx", it->name) {
+				if (arr_cap[ip_tests[i]] && get_next_rings(ring_id_good, info, &ring_id_good, &ring_id_bad, i)) {
+					igt_dynamic_f("amdgpu-%s", it->name);
+					set_next_test_to_run(sh_mem, it->test,
+							ip_background, ip_tests[i], ring_id_good, ring_id_bad);
+				}
+			}
 		}
 	}
 
-- 
2.25.1


