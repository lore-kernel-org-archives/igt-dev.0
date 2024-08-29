Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1D6C8300F
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 08:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C4110E63E;
	Thu, 29 Aug 2024 08:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="T+91QfuO";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1854410E63E
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 08:40:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FsAMHWyihnah/vYtg51DjX+i+pWszUneh3+aFtI1so1Lfj1Ryw5pCb/pmi5oAT0R6xavTj3nb5fSdMmWz99jHVdHtu3Ux+Rtq6sDLf4XvrfCBD7TKaihYmNDu/yOq2gNZLIPmojyBYK+gPaO936amMKFoc6/vF2F+Nnd4y2TpAZ5e72ts/rp48NStzao7fAQoYWiE+67CEWyR6NSvW9jFtEwX/eZ4iksenNMfk5ebGbdgxUGjAape+wX3N14Kob16bDN8JZ9kM7yZHVBPJj41l5Q3NF47tq4a6BBKBSBUx9ONDIdH+hcI8tsi1R8DRc9x0Kr+j+JRLvwrUyhqoAyjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuQxflx4BjTKX1elw4+02hKcEYOMoSfAwGtq6idTDDI=;
 b=lVdwwWV22RbwY4eG6Ahim0TOjDlPfgC4HJTcJN5zHwx1kUPBD+6BTn8sICNQ3nOVmqlFLzI/nAf6o8wI/z34ZpRoB8ybvQGZmFvuhaPOB0fY33qKtj6didmn3ba3w/icsnqhwG3+kdpzpdlTU8/I7cuwMmSZxBGOor5hHGLoCBcbyf/Nko0+56jnulvbIeEvHXdAuBgt0eA2SmXAVbrkJVPbeaY9+DZLVHi0X+eTNyz8BChOQW0KZ4i0EuV70qdMgmgmzn1gtrRLMRF64PzGXXtCWSQbzeEDnVzTriPhjAD20jxZpHWSnTDUZyCGYrstSk24LgLR3x7Abbe0sRYARg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuQxflx4BjTKX1elw4+02hKcEYOMoSfAwGtq6idTDDI=;
 b=T+91QfuOu9L/KFPUHYx8sq2rFBFNKyzPAbJNHgRNINyyoTVEVOBgXII1vJgCAXMvf3nkw4/ciGLgNzzi5NTMvg4Xh+qWxa4P0td8wQ6odr8tO70eKdnDlyEL2oy5MKQNMdXsNx2jHJq9Vk554PUNuSN4DKbKkaUNBtg12LRFlcM=
Received: from SA1P222CA0164.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::29)
 by SA1PR12MB8162.namprd12.prod.outlook.com (2603:10b6:806:33a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 29 Aug
 2024 08:40:39 +0000
Received: from SA2PEPF00003AE8.namprd02.prod.outlook.com
 (2603:10b6:806:3c3:cafe::bc) by SA1P222CA0164.outlook.office365.com
 (2603:10b6:806:3c3::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27 via Frontend
 Transport; Thu, 29 Aug 2024 08:40:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003AE8.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 08:40:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 03:40:37 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 29 Aug 2024 03:40:36 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Subject: [PATCH i-g-t V2] tests/amd_queue_reset: add sdma test in queue reset
Date: Thu, 29 Aug 2024 16:40:35 +0800
Message-ID: <20240829084035.191312-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE8:EE_|SA1PR12MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ce937ca-dd46-41c3-8fae-08dcc80642a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K1mD8jtzZREgLqupnPU//DEfmNRshGlJpVqGuBNxSdZmM/x2noljUtUIYiNM?=
 =?us-ascii?Q?eg9aM0fOVbq9lJevCOvBx4GeXsbfQkVh/Kw+0JLpZ7AG6XCoL8/eNPAgo3qf?=
 =?us-ascii?Q?y3OhBSAloG/pHDhRgO4SIbM0FebW9NqQyiU09HXWp/H8yhbN1pko1SVAVR3P?=
 =?us-ascii?Q?TqQCuBTz5/gAFZuBNyMhG02Uu3aL6oIs4PopZjBUEXH3Lm5840hYkhCVQSYA?=
 =?us-ascii?Q?YZn+lsNviNgEKRmGwTf33NyNpnzOFZd0KTULLCKjbxiBM1MagiJZSXaJ1Q1a?=
 =?us-ascii?Q?l3rBkTSHHP+5ndAhRWlDBwh/y4gYl2ERW6vBlpGkfiPzZpCX7aEMoRcmjgBz?=
 =?us-ascii?Q?gtzT/oph/0h488buR5/DkNe7aNxCZhn6GpCVtVThUKqMFSijuaONhCqTzrcO?=
 =?us-ascii?Q?vVp+POJCn+sTkC7cm2nvnd6I0uIFW9Qes8scz7fn8eVF5uUl4bD5yb+VBF6A?=
 =?us-ascii?Q?2kMmhHcFNhGfnil1v1UknP9Ro2kTNv/50XHx+peV1fofpOBI1BV86ilpADs2?=
 =?us-ascii?Q?KZEwygxkWHCuMgQR9uOUe8jAWLMjDeEljDYSSBALLuA9aayvBOwgSdsPmmxj?=
 =?us-ascii?Q?qFifL8ey4WpPYPq4WwSGjJlqTHigJdcJUJzY6nQtPZf2JPxkYfm1/HWjA9SN?=
 =?us-ascii?Q?SO7rCGOj/HggVzAtsZuALXTpevJJw1onXyFXdopAIajXK76XCBOWwpw9BVjE?=
 =?us-ascii?Q?okt7k+1fQEAm6wBa1tTySbO6jVIqLfA5ECSBx9+gZUpfTG+oxS7ABJwuMlmR?=
 =?us-ascii?Q?nMce6/3dc7tG7yHkwMAFarKNEAiuUT/e2ew+U2/O04aTyjcKS0lJ/PpU3GHM?=
 =?us-ascii?Q?L3/FbXrNzcjsNqGbg4ODdUDudd25UcAGPnCdYBTwGwmUnBoazrdpEP1qxxVK?=
 =?us-ascii?Q?hp+0wszZ82hUDRS449wazVrzer62f8wgghOGGpYAqnyR6Oz65saQx8emR5Zq?=
 =?us-ascii?Q?7D4/fWOpydxUL0+frNp+C9ZfnnoXdzuK3xLQr+px4cKkAY41ZY3J8CNAr2Q5?=
 =?us-ascii?Q?xxaR+zL8DKu3GJHICNgtY38JUS8L7XmnGStyCKeWMCQ7IGiUgwBAQrFuerVX?=
 =?us-ascii?Q?G870y8j++mM9lWsJTBuSfKzJa6ey/WSBavqIQyTwhaBMaX8MNA7Q2VPBYUDI?=
 =?us-ascii?Q?pZaOJ1wKfnbVs2VfchSE7mHv86LeIFWYIsYLXYWHLNcXne5bndn75XlskJ+7?=
 =?us-ascii?Q?ykd/KUxIwY/yPAKfBDmRQc6ohK7bTYOwTTdMuh5IIX2zgXZxMOoh6sP/q5Me?=
 =?us-ascii?Q?Ot7/RrICXchSQZZoFDLtC+mcuY40xbT1xgM5l5/DL8epgn216HZrZeVZo3Br?=
 =?us-ascii?Q?nkSwcYK8OvxWtRPMXJyQ6us4kmXRasnEHMkFskX2fdFk2WQ6+rHLnMcLUVWA?=
 =?us-ascii?Q?JQXZfRJ7EIVccBUN6tkE9n+x48Ts0JAg87u5QSLxNCVHnvf6N4NID4UmbuzD?=
 =?us-ascii?Q?t/sD1gUj/B5zo2pjDQPfDdRgeXzOniD5?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 08:40:39.0879 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ce937ca-dd46-41c3-8fae-08dcc80642a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8162
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

To enhance queue reset, add sdma ip test.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 537f653f9..8482a371d 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -1035,7 +1035,6 @@ igt_main
 	posix_spawn_file_actions_t action;
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {0};
-	struct drm_amdgpu_info_hw_ip info[2] = {0};
 	int fd = -1;
 	int fd_shm = -1;
 	struct shmbuf *sh_mem = NULL;
@@ -1047,8 +1046,9 @@ igt_main
 	unsigned int ring_id_job_good;
 	unsigned int ring_id_job_bad;
 
-	enum amd_ip_block_type ip_tests[2] = {AMD_IP_COMPUTE/*keep first*/, AMD_IP_GFX};
+	enum amd_ip_block_type ip_tests[] = {AMD_IP_COMPUTE/*keep first*/, AMD_IP_GFX, AMD_IP_DMA};
 	enum amd_ip_block_type ip_background = AMD_IP_COMPUTE;
+	struct drm_amdgpu_info_hw_ip info[ARRAY_SIZE(ip_tests)] = {0};
 
 	amdgpu_context_handle *arr_context_handle = NULL;
 
@@ -1098,7 +1098,8 @@ igt_main
 		if (is_run_subtest_parameter_found(argc, argv))
 			const_num_of_tests = 1;
 		else
-			const_num_of_tests = (sizeof(arr_err)/sizeof(struct dynamic_test) - 1) * ARRAY_SIZE(ip_tests);
+			/* -3 because sdma don't support shader test*/
+			const_num_of_tests = (sizeof(arr_err)/sizeof(struct dynamic_test) - 1) * ARRAY_SIZE(ip_tests) - 3 ;
 
 		fd = drm_open_driver(DRIVER_AMDGPU);
 
@@ -1142,13 +1143,17 @@ igt_main
 	for (int i = 0; i < ARRAY_SIZE(ip_tests); i++) {
 		reset_rings_numbers(&ring_id_good, &ring_id_bad, &ring_id_job_good, &ring_id_job_bad);
 		for (struct dynamic_test *it = &arr_err[0]; it->name; it++) {
+			if(ip_tests[i] == AMD_IP_DMA && !strstr(it->name,"CMD"))
+					continue;
 			igt_describe("Stressful-and-multiple-cs-of-bad-and-good-length-operations-using-multiple-processes");
-			igt_subtest_with_dynamic_f("amdgpu-%s-%s", ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GFX", it->name) {
+			igt_subtest_with_dynamic_f("amdgpu-%s-%s", ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":
+						ip_tests[i] == AMD_IP_GFX ? "GFX":"SDMA", it->name) {
 				if (arr_cap[ip_tests[i]] && is_sub_test_queue_reset_enable(&gpu_info, it->exclude_filter, it) &&
 						get_next_rings(&ring_id_good, &ring_id_bad, info[0].available_rings,
 						info[i].available_rings, ip_background != ip_tests[i], &ring_id_job_good, &ring_id_job_bad)) {
 					igt_dynamic_f("amdgpu-%s-ring-good-%d-bad-%d-%s", it->name, ring_id_job_good, ring_id_job_bad,
-							ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GFX")
+							ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":
+							ip_tests[i] == AMD_IP_GFX? "GFX":"SDMA")
 					set_next_test_to_run(sh_mem, it->test, ip_background, ip_tests[i], ring_id_job_good, ring_id_job_bad);
 				} else {
 					set_next_test_to_skip(sh_mem);
-- 
2.25.1

