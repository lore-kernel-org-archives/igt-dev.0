Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EAFC52D7B
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 10:11:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68F910E20C;
	Wed, 14 Aug 2024 10:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KN3Qk5g+";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301F710E20C
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 10:11:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7DvLYw10h0M8rrW+fc/uDprdwI9V4HqY35vHFXJtu08z209AOh4jKk8wjejOlSllT1Akmsjw2NjZfwa6nZzipFIX8ValtS4DOtw0LWR6nDfFuRhTixdDrgZ4t1Q9DKZ1yrbUgwP6vI/tnmP9bU1R+Uf6KnovguAalDDJLz9rbfEjrcxSgYHhOGmuDfi7yvcWfo2vPlS6+zXyxYMlqwsEZ4rpwxQeB2fKGXprWI8o7CJSMAaM8YksJaASWaIBp7D/RY0CyAPzvN2y30LQ+G/FoSuufIk1DQyGJ2l6mvZqCY21cFJE2cj/PlSEg2gMc9Q4JaVLDngtef9S4D9aS9aWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyupf3obfIUWRhXuENujurWD7XZJ/L00UNVFsrhNHmk=;
 b=R9MknQXm67x3grZla2kkKJsf0nhnksrmsFLqPfEFvjbDNJYb4u+yKBBBVJfv+tN/1z76cI+p5aGQezIeZ713hhgu8Wsr1Ngm39f77fqnuI6WEP2Q+/KTp2LRtLr0bvm3cOwlpETDKgS01Dvso1c6+Nnf5nAFtHz0JsNTo0FOYPIlKf8B6DjGofvTc7GG6VR4Mz369UDU+KNKaYA+1G0tUVvD0/3TzvPotYBsQ6j8KiiHrU/wkx/UO9YuH5LFjaER3hJ2CWzsRu/RBws2X42IiswnTyS79JCMPVq04s/K+wh74svdrGSPepphWoY7jTOMBdIsEjnxyQkLYIsJGqW9qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyupf3obfIUWRhXuENujurWD7XZJ/L00UNVFsrhNHmk=;
 b=KN3Qk5g+7/K31TEOamUzWKMU/Mvlrd84E3fIQMNgE5UH9yYf9v1HgFj4YLxH1TwgQBBDD2gIzVlmmSN/QeFaJalbaGG1jGJhVM75Dm98cYQPeN6qBcFxasmJxb6poWRnv2jWl7W6s1sh30kMMuQdg6BhkldZMpRopP8QaniiDro=
Received: from CH0P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::26)
 by BL3PR12MB9052.namprd12.prod.outlook.com (2603:10b6:208:3bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Wed, 14 Aug
 2024 10:11:43 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::dc) by CH0P220CA0019.outlook.office365.com
 (2603:10b6:610:ef::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.30 via Frontend
 Transport; Wed, 14 Aug 2024 10:11:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 14 Aug 2024 10:11:42 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 05:11:42 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 14 Aug 2024 05:11:40 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Jesse.zhang@amd.com"
 <jesse.zhang@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu: add timeout for queue reset
Date: Wed, 14 Aug 2024 18:11:40 +0800
Message-ID: <20240814101140.3165345-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|BL3PR12MB9052:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d45e0f4-6103-406d-f426-08dcbc497f15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2SlR3YkitGNg/qaOlEV7pi7rH8SMBDKbMeNtwBrB7XvqWS0wB1GR7rNVggDp?=
 =?us-ascii?Q?1R8ioCMsnlj6K0FC1GrvWZKE2wKbb8kj+sAk2wDcI2EiPxowt8umb/XdbnS5?=
 =?us-ascii?Q?tBRHYo580hPeBPdzCB7nimn9/sHIMxoT+Z6VKdUXSzP8GYXOASjlfvq0VweG?=
 =?us-ascii?Q?Gi+zCRtan7SjzlDuL4Jm35KY9xGcHDsc1SCdsXEAjMlJVll7wiFO8JumCzeX?=
 =?us-ascii?Q?3jrPPJtXFtl4ClW44N2EBfWE3FgjBuT9xp9VIOQRoyZHrbWqX3DV1bOdvBaV?=
 =?us-ascii?Q?rUANofqme152abB3XkSe64hSdn9RdbePm1alWSSRVeVqHh7ReuHohOD5tS8y?=
 =?us-ascii?Q?RAF/NBazlY/GRzsfg+q7/TsAjtHMXRnakSuL7xz6m9wUhnBOQOoTO/lvl+eg?=
 =?us-ascii?Q?hf0W8wMtqAk4gs8avcW4OJ7stULzphuy20HwDdseI8NrVxBkIlktLuNExu6Z?=
 =?us-ascii?Q?J3pqXl4oLiHjjUrfQdrqjSRh65psDvtSc6h4JOVUXTIRGY7AG6/EHvocv6ie?=
 =?us-ascii?Q?4j2kXXYYajpKvZ6IW2Di7ehEFOkB6amRfKEwRLXICuAngFj2WO7Ii7vG7wvN?=
 =?us-ascii?Q?jmzWED1oc11rSeMZSZzYYPLAUhoLVmfcG5YkTsLv5Ex759diX/uLn9ZPNo1A?=
 =?us-ascii?Q?rNFUA5Zq0FeaKpZcH65L+jzrK8egTCgE4o2Gdk5aKW3geIX6J1WMKgPkgYBa?=
 =?us-ascii?Q?+rVVIDFbaBl6FEeRQn2ydDSGlrIqumtByISKu6lNP3eghAasFGQDDriEsHxB?=
 =?us-ascii?Q?jWOcoJly9HeTR5twAIT3hI91UJgF/S1qEtrFEU/njxHy1hqqBr0vr2ggc5UX?=
 =?us-ascii?Q?ElIdW3D2fcwX1vr8XaWS/P5F+PhSq0FcOKIxYSRnqTlahbqxbm0hF4siZdQl?=
 =?us-ascii?Q?2/0NoAJrMkgdtlzRsTXWCpzTHU/+/OJ0OvS50qML5F4tzztHVVFrIqDGpFfL?=
 =?us-ascii?Q?9ybAcK2pTvonQfaiMqBbevFw++rS0VhnAaus1z1aFlGvmFTZqMt9kXenk440?=
 =?us-ascii?Q?RTptnzC6HMtjjJ4KFCCy16R6U9zw9xTbusRHmoLKQMBJqRMzRsBfjmdT7UJa?=
 =?us-ascii?Q?0sJyZ81nNL92UEEgpxTNE7kbBEtKJy6mvGg+kSLTw/cpyBidpVeVqPjdStaV?=
 =?us-ascii?Q?N2lxyjTeJsw2511lHgSueQuRb3Ao7FtRVgmIIVV/KkwO5JUjJlHKRBjr2GSn?=
 =?us-ascii?Q?YKy3hz+SVHOco6LnnacnYTePtJ4HBvtu2dY34Qhn0rdR4hHkNk8AUa1S6b+L?=
 =?us-ascii?Q?Q8h3zrtYqcTdfPINznuXJr9UaKkW/BKnjQ9KrMofg8yC++bdyY5NoUy/nOdU?=
 =?us-ascii?Q?rAk+GuEnxdkdVOHt8DDYQ/Ims3xnz+ScF1Z/JhSu95LulbswyFn5MUn3uowJ?=
 =?us-ascii?Q?L23xy2NIMfa9RdNoF1PmHiMXrDEVwQof+g3JsTYiQdSQfEa7AKwdDydcdymT?=
 =?us-ascii?Q?qfn96xKautv41I/Id9E1pFTwj5wv2aJe?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 10:11:42.9767 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d45e0f4-6103-406d-f426-08dcbc497f15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9052
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

1.If the test case cannot trigger any reset on some ASIC,
It should be considered a failure.

2. Fix code style

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 6819892e0..249676407 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -30,6 +30,7 @@
 #define SHARED_CHILD_DESCRIPTOR 3
 
 #define SHARED_MEM_NAME  "/queue_reset_shm"
+#define TEST_TIMEOUT 100 //100 seconds
 
 enum  process_type {
 	PROCESS_UNKNOWN,
@@ -49,6 +50,7 @@ enum error_code_bits {
 };
 
 enum reset_code_bits {
+	NO_RESET_SET_BIT,
 	QUEUE_RESET_SET_BIT,
 	GPU_RESET_BEGIN_SET_BIT,
 	GPU_RESET_END_SUCCESS_SET_BIT,
@@ -307,6 +309,7 @@ static void set_next_test_to_run(struct shmbuf *sh_mem, unsigned int error,
 	sync_point_enter(sh_mem);
 	wait_for_complete_iteration(sh_mem);
 	sync_point_exit(sh_mem);
+	igt_assert_neq(sh_mem->reset_flags, 1U << NO_RESET_SET_BIT);
 }
 
 static int
@@ -473,6 +476,9 @@ run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_contex
 	int state_machine = 0;
 	int error_code;
 	unsigned int flags;
+	int64_t cnt = 0;
+	time_t start, end;
+	double elapsed = 0;
 
 	after_reset_state = after_reset_hangs = 0;
 	init_flags = in_process_flags = 0;
@@ -487,7 +493,8 @@ run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_contex
 		error_code = 0;
 		flags = 0;
 		set_reset_state(sh_mem, false, ALL_RESET_BITS);
-		while (1) {
+		time(&start);
+		while (elapsed < TEST_TIMEOUT) {
 			if (state_machine == 0) {
 				amdgpu_cs_query_reset_state2(arr_context[test_counter], &init_flags);
 
@@ -533,7 +540,15 @@ run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_contex
 					break;
 				}
 			}
+			cnt++;
+			if (cnt % 1000000 == 0) {
+				time(&end);
+				elapsed = difftime(end, start);
+			}
 		}
+		elapsed = 0;
+		if (sh_mem->reset_flags == 0)
+			set_reset_state(sh_mem, true, NO_RESET_SET_BIT);
 		sync_point_exit(sh_mem);
 		num_of_tests--;
 		test_counter++;
@@ -1000,7 +1015,7 @@ igt_main
 			igt_describe("Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes");
 			igt_subtest_with_dynamic_f("amdgpu-%s-%s", ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GRAFIX", it->name) {
 				if (arr_cap[ip_tests[i]] && get_next_rings(ring_id_good, info, &ring_id_good, &ring_id_bad, i)) {
-					igt_dynamic_f("amdgpu-%s-ring-good-%d-bad-%d-%s", it->name,ring_id_good, ring_id_bad, ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GRAFIX")
+					igt_dynamic_f("amdgpu-%s-ring-good-%d-bad-%d-%s", it->name, ring_id_good, ring_id_bad, ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GRAFIX")
 					set_next_test_to_run(sh_mem, it->test, ip_background, ip_tests[i], ring_id_good, ring_id_bad);
 				}
 			}
-- 
2.25.1

