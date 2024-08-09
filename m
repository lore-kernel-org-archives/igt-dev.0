Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960B6C3DA4A
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 02:43:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BA510E843;
	Fri,  9 Aug 2024 02:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QfcLghF7";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E7510E843
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Aug 2024 02:43:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zGOvs26fo96EmGK9xD9HWrSb9TwLmXbPL2gJJe+2SLUUX5MRx4NqPqYbDJS1TUX0g45rllqDnMJntxoGQZYOXnSuUpO0QvtLyhen8J5Gx8cjad3I2M/08h3hu/sKJLXlnF9HTpRCYbuayzGn/Ir7yvSqBU+5a6JGsA7nBsALb8v7o5NKRZJ2XhNYz4DDopzu7aJC9JK5jNlQun0yx3uXSnkeJUXgQHciY1LWQz5DFRL7y84tYozS1HlIT6Sq6c8t5OeW6nysDJnGyYCEbDeU7thn9uDxrCfVlQ150hZjYqBx1DLDFmfgtK9rhqFP1hcXRYfS/fxf88uV+9055ORCDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7jOTkAPBzY6XRmcb1MvQVIZIo/Q3f1criN/uthjuV8=;
 b=vfnps1SyXkcn+HedUkJU+G8MgEV/CtlKwQxp6qK5ubkabrCqPPRzz3mFG1cyfruD7NbC6VoFoc/T7lTj9BcimNbBIBiekq2pIh0UVxwtPOAPgu6krhU9GSZyzfnMGvCw3v5yW52iixOLvpo+S+wc/PC2p3ATP5P6cvMawTkHriUmsJlI0DlDq1qcmRCpPhtcIU1IvtkrEKNardMXisCfb37HbFE3kslrRzc7Tfeoff9xx7JDNCbsA1ohFfFscBy77dF8llF1TnPHMZskqibucZIHHpmLKGjF2TRQYPsaob0CgVdnB1dU1MC81tN2PFAHmkP8vERciSJH3yAXOBq1bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7jOTkAPBzY6XRmcb1MvQVIZIo/Q3f1criN/uthjuV8=;
 b=QfcLghF7ylqz2wtT+H8433wH9y/MWVu+A+v0eLS9Yl5OoJ/7TyL7b7GEHOjs/yIa6vNggSGfudXuMIdI0g6iWtKjQj2PgNxad9FWx4gAzi3a73Nt3MEfTGeEXmX1afvW5PpCoVy8U0XWKpNB6QuIsq50NRGWWV4qgvxytPJA5l0=
Received: from SA1P222CA0155.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::25)
 by LV8PR12MB9271.namprd12.prod.outlook.com (2603:10b6:408:1ff::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.30; Fri, 9 Aug
 2024 02:43:51 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:806:3c3:cafe::b1) by SA1P222CA0155.outlook.office365.com
 (2603:10b6:806:3c3::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15 via Frontend
 Transport; Fri, 9 Aug 2024 02:43:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Fri, 9 Aug 2024 02:43:51 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 Aug
 2024 21:43:13 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 Aug
 2024 21:42:54 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 8 Aug 2024 21:42:52 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Jesse.zhang@amd.com"
 <jesse.zhang@amd.com>
Subject: [PATCH i-g-t v2] tests/amdgpu: add KGQ test in queue reset
Date: Fri, 9 Aug 2024 10:42:51 +0800
Message-ID: <20240809024251.2737835-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|LV8PR12MB9271:EE_
X-MS-Office365-Filtering-Correlation-Id: bd457deb-acc5-4b89-0187-08dcb81d1a3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8vi08769OxHuitGM79F/5lqqsAOX4ka6aVVUCi6HADu6k/wAg89hu4y+Ww1U?=
 =?us-ascii?Q?0OMWb9pxH2PJdvk1j9C2atpToqx1bQX/uc6nKSedfHIYNK+Xk4dFHeW0CKkn?=
 =?us-ascii?Q?YYrjxY50/XnyZUmxAJzSbGWHjqa0owWUx2t9pzb/Rp6NJCbt9bXRyADG2u2/?=
 =?us-ascii?Q?w2SEMfTc22kPTyFcts/Tcwa1O6waXfVT4pEnZZr4pQy4GUTmGA9oal+hA+QW?=
 =?us-ascii?Q?hRzI0VfUhTMr2adV8wdvbf2H/6w84X4eVBMxIQu1iY062jkEsZk4AXYSmquV?=
 =?us-ascii?Q?dElnGPLZXxbAINbmrRw8zy9KKWGY08Z8EDiKGqX7EfWYSN8QGNcbO/+EibjE?=
 =?us-ascii?Q?SX7sm6V0nLMxmvqLNhFQbFcL4d0u0YN/y7FeyAtaIahlYoBRwQ23yYf3klkX?=
 =?us-ascii?Q?5DesAS57lBnyhW43/5FJx5NSdK/hBBu658APjc0fP2YZ07QlJfXZDoH+o34/?=
 =?us-ascii?Q?8PW0fV2FEf6gvnmeFLszhRAWBowU9T8adtrNlrIixADWdfFTln3zS18mZUl0?=
 =?us-ascii?Q?fy5ydFSUDXt+e3lnBUITgzQz2/FxBczaJVmDyqKQ2OF7KY4CUjZEZZiAZlmq?=
 =?us-ascii?Q?K5dnfhSyQnuqevKH6Se8cGKNMKf02bvcbq+nG6McxEapV9EmcYPriDBPFs+W?=
 =?us-ascii?Q?/mHq0lEjRHIE/4R/+iPCcACSYrd01FOLYzfVj1zx4Xef9GdJaZFGOKQ0ezQ5?=
 =?us-ascii?Q?gFZr4IUXMEt68ky9AAyQ0NYFvY+dm9U9lifB2vK5K0G0bhCnHseKA0ihqDoK?=
 =?us-ascii?Q?QmsVzIapJKjPBXk6d3WdsVpjfZ95a31LwIULtqfmOWJDJ6805yIqCvTNDToR?=
 =?us-ascii?Q?n385tJqNwDGwCnqbUwdoIeyx0Ms3+HGw5hLoC1n8x1kxV+iJR2heunuMMDKz?=
 =?us-ascii?Q?utaob7AHQItbygywKhzy4f7jo1CWnXdne+H4j68iYDiM0Niy5HqGQICZ7/gP?=
 =?us-ascii?Q?P+k/7TjM9LkqzeJsnHav1Fd0KpwVYeNl0DimkBH5SOQOln7kKy6Y/BPhtlRp?=
 =?us-ascii?Q?czKC2medE1/i7UuqRQUoej0ias8jk9HY2iYpLGXSlperi5bdjbH0ydroKWMl?=
 =?us-ascii?Q?EDvKH4kngrj8I0OSvnT7n2KCfSkweb7IPClUVQRnxH7HNzWb3NYohjOjUSkW?=
 =?us-ascii?Q?Lt6BBLpn5nJH8pPasQkO8uaMeftETUgOSmhTJwnGR59cbT7wCzAYc+udfXqW?=
 =?us-ascii?Q?bB78MZdgRz59TQxoiz0ThODGSdrgSHb647OvdxQXmWg1WqDotucb19wRI16I?=
 =?us-ascii?Q?lpzBSgKpvPNZShOvhgyiWkflt+BZ2c7S4MoXovsvYSv2N450TDLmPPVSvl+Z?=
 =?us-ascii?Q?txHrKXOLCpBq6UldcL+ZaSC7bZwMi+oKQKV2lmxLHy7hgZ+h4CKs41+icw65?=
 =?us-ascii?Q?RwJT83lLKXmV0dMcJsURYJgmUEI+jj/7ByhGtbO1K6XPZg0AIPDP1c9QHyoi?=
 =?us-ascii?Q?8kHdG6FX2Z0PzD9zNEL4e1H7Smkg2zWw?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 02:43:51.2754 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd457deb-acc5-4b89-0187-08dcb81d1a3d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9271
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
index 9ea0a1f24..4ae69d6c2 100644
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
+			const_num_of_tests = sizeof(arr_err)/sizeof(struct dynamic_test) * ARRAY_SIZE(ip_tests);
 
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

