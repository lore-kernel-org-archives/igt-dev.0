Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0052ACD13CF
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 09:49:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B8E10E252;
	Mon,  2 Sep 2024 09:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sG9LQTNH";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059AE10E252
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 09:49:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTH3tO+PEQEeWqoARFrbf3m/kpoqwQpSxSbsU13OF9yg4dKapeKTW+gsmyR7Oz/XWt5nENNWyh9vKpIOjIKqHM3teiKoVDOjvJM8bXws6AcAls6gKvCvOxyFweon4BF+U1kCIV+yCvXxxcDLUuuekbzNYTsDQW5gMmvYsogPAo+TtB2nk1vXU5z0yXaIy8Vbrtkd63wVMy6N6dbeXIwUk4uXoVq5Lvh6OcdV3F1FQ6Fdq2L0HU8maAAm1DAP4T2ISEu3nAv+TVZuIZdno78+SNn75VwQTTcK0ovarRGeoX33/eY/kidoQml0rMYrKQ7lGpcLyIProrFcx8VN+hBO9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpaAYPi2ruaAJr8Fez6/5naDLuC2VimN9wGDlMupAlE=;
 b=JaB4fZYiXmuB1SXOkmecPLFv4GdzUkF1tpc/IbDm580uc0ibJcDlOW+jaOftilkEJISgpz0qsqlRtsEvMrv983J0rwU9Ov+E1taCEawdFhGIi1hJaSZLEr3FkM960iY/n5Tz6PAqXIB8xsId9+xfv+YhzjeYN/hcD3kOnKd6nEko8U7PTINcCzL1gNsH5q0ECPPRBpsMZAiDLwEVEOHljJszYUDcdf+p3p+U0aISgOLGLHqF/UZ0xDrKZOe+h13zGx2wgmUVNk7gNLz0PDXiv5Y4PGpsrpjhk+iA258v5Ksr65DV3+gvq7os9beab/YvVawQJjrW/3N7Ut8FUh0WhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpaAYPi2ruaAJr8Fez6/5naDLuC2VimN9wGDlMupAlE=;
 b=sG9LQTNHFG4c/p1LRaIeXtDC8jRWDXEde31RklwpWMgv4sCwxQn3UOO4kgsXv+YapH1yZM17/Z+go0szuQ0JtYzbcsQRCd7IkC9KqhRGZxdpBPfTENjdk8Yxxvbpz1xLg6hm3NcfFy+9MyfnhZ7cz0rX+4R+OkNi94g1PcYFiWk=
Received: from BL0PR01CA0009.prod.exchangelabs.com (2603:10b6:208:71::22) by
 MW6PR12MB8662.namprd12.prod.outlook.com (2603:10b6:303:243::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.20; Mon, 2 Sep 2024 09:49:00 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:208:71:cafe::d6) by BL0PR01CA0009.outlook.office365.com
 (2603:10b6:208:71::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24 via Frontend
 Transport; Mon, 2 Sep 2024 09:48:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 2 Sep 2024 09:48:59 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Sep
 2024 04:48:58 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 2 Sep 2024 04:48:57 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Subject: [PATCH i-g-t v4] tests/amd_queue_reset: add sdma test in queue reset
Date: Mon, 2 Sep 2024 17:48:55 +0800
Message-ID: <20240902094855.502050-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|MW6PR12MB8662:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b34882f-fe60-48e1-9a8b-08dccb34782c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FMuvpfk5c7EXv+wDDo03YwA6OT/EPpWD9jZcWUbzPYiSVtSIYFFLbWJnsKZk?=
 =?us-ascii?Q?DJBL9Lkd/Uvm3m/Dt01KKZS8wvMVfW2gMsie7Rz+annUBwEWOd2ugXV8CSyq?=
 =?us-ascii?Q?Et5dfBi0Ytlox+HibkGEjadhbhoypIb7g7Hyw0GJ0BUojQGzKeUYOhCcviz9?=
 =?us-ascii?Q?jYE3OS62KME9jx/2OHEab+xftmOnm3j1e7YaWaFz2Mw/I4tIbsxI5m2ZQP0B?=
 =?us-ascii?Q?soA/N82ggJzKdOdgCbL+Xl3T97joJdaiwJ/t5nfX368SXrgjn7gre21jfNP0?=
 =?us-ascii?Q?g0pMeXtYp7M4KhjZCpxkqJ3xi2k9T6mtSPqTwK4FcNe1Sc4OASelz0b//BOg?=
 =?us-ascii?Q?sSlW5ohRhFDdr39Jh/of3ZKHVlvlJmwA/OvlOxKdsk0qy1hv3Ar3D9MXMTei?=
 =?us-ascii?Q?4M9wMj5C3yD5rVinZQahAE1Ax7V2mpkL+cZfsAe5awe5d55XvylBSGfh9B0C?=
 =?us-ascii?Q?tt6wyfOEOIp8kfAg4VlKrJAjjBYHMj7bqRzB8FdBvo1LU7ryn7rMXn4GCnJD?=
 =?us-ascii?Q?M3Ky3Tc8bSetNZW/7mhPNm5/GqNQppJw0a6lRZXluxt+f0/DFix+cbIKk00l?=
 =?us-ascii?Q?g0ziT8FwFMqwdqof82TyzlVLy6dSVESc9hiPoI4AsVpGHy080AN8iCUQwcaC?=
 =?us-ascii?Q?N9IhoJOYi7PCqKnCIaAiziGEqki/Wu2zdPaj7U3u7rWqUe3E2ipm/gmM5Cu1?=
 =?us-ascii?Q?PJFMsXe5EyCLyjTaRyyYd6FPnoPiOurj084bvZUo48J7nxy8Z/cqK89eDxIA?=
 =?us-ascii?Q?P3M64KU8FsneTteHd0FfaV+D64J/9AEKixVt/djZBqoqL9L7bvCa5yKQXmIW?=
 =?us-ascii?Q?rebov70LlWWvqO0xDUrC0EcyvTH1gRNvf4TYUGonuD+UO91SflIDzKrWvUUj?=
 =?us-ascii?Q?zAhNvZdJ1Y9qVbMZDVW7AJfVIyAMVZwKmcdirX5OHHGAY3RAJ6xm7Cs2JxJ7?=
 =?us-ascii?Q?x483I7CCteMbUaiFedl2/jElq20F8mx6NKySBiI1pkbnCL+zl3kJaVO69Vkv?=
 =?us-ascii?Q?LKLt7VuC54JRyCydYwbQ4rp5zq7A/4M4a25pBQrxFmlbhQtUIfjMGpJflkFR?=
 =?us-ascii?Q?98sObCH0dfpcEPPLG4+sL8njB2KVmbm3DLOfPWtvfYFxXd8dPhRi5RmrF7JU?=
 =?us-ascii?Q?VDEP/ryMWcCa86uGYD6IdMtDFVBlM1jL9r7vJMcdELJx2mj8IxJVj7NofnGw?=
 =?us-ascii?Q?b8n0o3/w0tPFjSO4E61eA1bvtkVFnLzHIUSQzGN3xVAWwLBXxTlrMUoKZSj6?=
 =?us-ascii?Q?eDHU5/h9MCRrJnKpxXSwf5v93Akji6/hZsCOyDoK4fi8BXrZfSserCbc2n5R?=
 =?us-ascii?Q?ySacWXgyhXn59Mz4VASY/ekoEXNxbVAkqP/kil5jv1hW2w170kFy1gL9FseX?=
 =?us-ascii?Q?sr5l3PBE8XJEhFeyJoZHpZsLrMdQnElPQWv8E/dMOesDvVibBbtXpvkiYo27?=
 =?us-ascii?Q?ygRDA3qASK8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 09:48:59.4069 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b34882f-fe60-48e1-9a8b-08dccb34782c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8662
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

v4: 1.add sdma support flag,
    2.add a function about calcuating num of tests,
    3.remove !strstr(it->name, "CMD").(Vitaly)
    4.temporarily ignore memory page has hardware error (EHWPOISON)

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_command_submission.c |  2 +-
 lib/amdgpu/amd_ip_blocks.h          |  1 +
 tests/amdgpu/amd_queue_reset.c      | 43 +++++++++++++++++++++--------
 3 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index a0c72fb47..025e8bb7a 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -77,7 +77,7 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
 	if (expect_failure)
 		igt_info("amdgpu_cs_submit %d PID %d\n", r, getpid());
 	else {
-		if (r != -ECANCELED && r != -ENODATA) /* we allow ECANCELED or ENODATA for good jobs temporally */
+		if (r != -ECANCELED && r != -ENODATA && r != -EHWPOISON) /* we allow ECANCELED, ENODATA or -EHWPOISON for good jobs temporally */
 			igt_assert_eq(r, 0);
 	}
 
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 3e729f4c0..6a8f97d24 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -62,6 +62,7 @@ struct dynamic_test{
 	const char *name;
 	const char *describe;
 	struct asic_id_filter exclude_filter[_MAX_NUM_ASIC_ID_EXCLUDE_FILTER];
+	bool support_sdma;
 };
 
 #define for_each_test(t, T) for(typeof(*T) *t = T; t->name; t++)
diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 537f653f9..b257ec3c0 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -1022,6 +1022,23 @@ reset_rings_numbers(unsigned int *ring_id_good, unsigned int *ring_id_bad,
 	*ring_id_job_bad = 0;
 }
 
+static int
+get_num_of_tests(struct dynamic_test *arr_err, enum amd_ip_block_type *ip_tests, int num_ip)
+{
+	int i, cnt=0;
+
+	for (i = 0; i < num_ip; i++) {
+		for (struct dynamic_test *it = arr_err; it->name; it++) {
+			if(*ip_tests == AMD_IP_DMA && (!it->support_sdma))
+				continue;
+			cnt++;
+		}
+		ip_tests++;
+	}
+
+	return cnt;
+}
+
 igt_main
 {
 	char cmdline[2048];
@@ -1035,7 +1052,6 @@ igt_main
 	posix_spawn_file_actions_t action;
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {0};
-	struct drm_amdgpu_info_hw_ip info[2] = {0};
 	int fd = -1;
 	int fd_shm = -1;
 	struct shmbuf *sh_mem = NULL;
@@ -1047,8 +1063,9 @@ igt_main
 	unsigned int ring_id_job_good;
 	unsigned int ring_id_job_bad;
 
-	enum amd_ip_block_type ip_tests[2] = {AMD_IP_COMPUTE/*keep first*/, AMD_IP_GFX};
+	enum amd_ip_block_type ip_tests[] = {AMD_IP_COMPUTE/*keep first*/, AMD_IP_GFX, AMD_IP_DMA};
 	enum amd_ip_block_type ip_background = AMD_IP_COMPUTE;
+	struct drm_amdgpu_info_hw_ip info[ARRAY_SIZE(ip_tests)] = {0};
 
 	amdgpu_context_handle *arr_context_handle = NULL;
 
@@ -1059,10 +1076,10 @@ igt_main
 	struct dynamic_test arr_err[] = {
 			{CMD_STREAM_EXEC_INVALID_PACKET_LENGTH, "CMD_STREAM_EXEC_INVALID_PACKET_LENGTH",
 				"Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } },
+				{ {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } }, true },
 			{CMD_STREAM_EXEC_INVALID_OPCODE, "CMD_STREAM_EXEC_INVALID_OPCODE",
 				"Stressful-and-multiple-cs-of-bad and good opcode-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOWN, -1, -1 } } },
+				{ {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOWN, -1, -1 } }, true },
 			//TODO  not job timeout, debug why for n31.
 			//{CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,"CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC",
 			//	"Stressful-and-multiple-cs-of-bad and good mem-sync-operations-using-multiple-processes"},
@@ -1071,16 +1088,16 @@ igt_main
 			//	"Stressful-and-multiple-cs-of-bad and good reg-operations-using-multiple-processes"},
 			{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, "BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR",
 				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } },
+				{ {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } }, false },
 			//TODO  KGQ cannot recover by queue reset, it maybe need a fw bugfix on naiv31
 			//{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,"BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING",
 			//	"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
 			{BACKEND_SE_GC_SHADER_INVALID_USER_DATA, "BACKEND_SE_GC_SHADER_INVALID_USER_DATA",
 				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } },
+				{ {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } }, false },
 			{BACKEND_SE_GC_SHADER_INVALID_SHADER, "BACKEND_SE_GC_SHADER_INVALID_SHADER",
 				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } },
+				{ {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } }, false },
 			{}
 	};
 
@@ -1098,8 +1115,7 @@ igt_main
 		if (is_run_subtest_parameter_found(argc, argv))
 			const_num_of_tests = 1;
 		else
-			const_num_of_tests = (sizeof(arr_err)/sizeof(struct dynamic_test) - 1) * ARRAY_SIZE(ip_tests);
-
+			const_num_of_tests =  get_num_of_tests(&arr_err[0], &ip_tests[0], ARRAY_SIZE(ip_tests));
 		fd = drm_open_driver(DRIVER_AMDGPU);
 
 		err = amdgpu_device_initialize(fd, &major, &minor, &device);
@@ -1139,16 +1155,21 @@ igt_main
 			process, sh_mem, const_num_of_tests, info[0].hw_ip_version_major,
 			&monitor_child, &test_child);
 	}
+
 	for (int i = 0; i < ARRAY_SIZE(ip_tests); i++) {
 		reset_rings_numbers(&ring_id_good, &ring_id_bad, &ring_id_job_good, &ring_id_job_bad);
 		for (struct dynamic_test *it = &arr_err[0]; it->name; it++) {
+			if(ip_tests[i] == AMD_IP_DMA && (!it->support_sdma))
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

