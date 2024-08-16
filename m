Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28334C52D7C
	for <igt-dev@archiver.kernel.org>; Fri, 16 Aug 2024 03:23:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB6310E05D;
	Fri, 16 Aug 2024 03:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nhu4qohI";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE1510E05D
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Aug 2024 03:23:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LgQqisL6ywIi1iCFjR1d2A3RyQR0gUHMBBtrb09DdYoOdqz+FsWgW/zBQqdLolj4l8w83xjGFZ7oDHh8HD43Fsgqed93PYOEcBozFX0W2yQAHIH3k42O0ary6sg9pX/9BodYioALVo6KLQbc1wv8D1mP7lmSj5PAQM4dgDGWS+n6cq4K17gJwSaq0oEENSQZ/YgEE9L9G+DDeb9/L3f5fQDiz4T0ImPKkffJVZQT8zGCvQH/BANtrX9P7iTT91E5Y0J+z8BIReVSXVRI/q51Q1TSB5PjYDi6p7dDRoekozr0wub75102HOJHXkoxLE8bA/HFZiymMGl+oON+xTSIog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5JvWyK39rpiCyp+f/ulf1l8C8eVLXpWE+lXmeO8NeCE=;
 b=W6i85bcjhGUfuT3scVvaFuyuBcDDTCr4ttCvtReCjgJybdSYSMglD4O485I0fSI5leXRPUKlTwfQWkg4Jg7BbJNgXOo83VOiAuH5RKss6SQThlsGWB8h3Fel8/wJeN3h1NDVe3Y2YQorIbAu6b4w4CuBFOk2kXgjH545jpo0H50ggbvQxdJws8uT+tvMmUODkRn9h0IsxltNAX9em3Clx9y1PXzgDGqem7oQOg6e3bma4H397kYr41k9gea8ysyDWQjAHaQHMpSFAdw4WWp811NC2NrrQ+80lywEdZZKQrZt2qsOnyb0exaBjBMLFt9r1ZrNP9nGP+XGjVyNSJRbCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JvWyK39rpiCyp+f/ulf1l8C8eVLXpWE+lXmeO8NeCE=;
 b=nhu4qohIFkILd76U/yy66lUVtAyinY4ysh7DbAN/U0TBxZP/Fu8qxqH6Kegnujiaqx85X3ByLINd2VdnY1fBcylEmedBLViBZeU8GUmJV/zsKSUeRsRjU/3ArdLURumRLhCVA9ZKotocfEVK0jpMSxGdjXQIjVtDeGnbsILRp0A=
Received: from CH5PR03CA0012.namprd03.prod.outlook.com (2603:10b6:610:1f1::9)
 by DS0PR12MB7582.namprd12.prod.outlook.com (2603:10b6:8:13c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Fri, 16 Aug
 2024 03:23:25 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:610:1f1:cafe::3c) by CH5PR03CA0012.outlook.office365.com
 (2603:10b6:610:1f1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19 via Frontend
 Transport; Fri, 16 Aug 2024 03:23:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 03:23:25 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 Aug
 2024 22:23:17 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 Aug
 2024 22:23:02 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 15 Aug 2024 22:23:01 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Jesse.zhang@amd.com"
 <jesse.zhang@amd.com>
Subject: [PATCH i-g-t v2] tests/amdgpu: add timeout for queue reset
Date: Fri, 16 Aug 2024 11:23:00 +0800
Message-ID: <20240816032300.3288327-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|DS0PR12MB7582:EE_
X-MS-Office365-Filtering-Correlation-Id: ef394c24-6483-43f5-46db-08dcbda2ca24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8lC10Uxy19+bKFjerQ6NiX8/pbdmvP2OKgEskerIF8Ea7CmxBtkgu6NKGXCy?=
 =?us-ascii?Q?q3EntAKGZcqwfI53tViEI0T1wyhJK0pJr3PkCZuyJrWr4vcYfAjIWfDWSXFR?=
 =?us-ascii?Q?5QTcB0TbMii2aOYcNLmCYNydPHO6plRRHlnUith5CQe0KWIWBR7ARsNOtvTN?=
 =?us-ascii?Q?XI6oVPKyVpqXfigtV8qjeh8bv1wplNAlO/QjUwj0lS3VKtQrUrhYlyD9vU9q?=
 =?us-ascii?Q?zRJLt2d6wFNq6xUgIpWZuntjLF1pNgG8QQN2GJGctArbOwi3O9HJkl4HWjlO?=
 =?us-ascii?Q?gIpdPttqENH6EjSZnGWornHAs/mk8NIsaBrIb3y3qj9bSOKepm7d9QxROaNa?=
 =?us-ascii?Q?2pEtmRCKbXy0nXBRHrSaExDO9ym8LZPRUAhxLgldVZj5I/1ZFlMFV9TgPLMb?=
 =?us-ascii?Q?Ux74FsW4ZPVSd3iuZxh/oS/5K5/V3DJkDhCFXTJjxKaCEAZQcj910t8i3Pat?=
 =?us-ascii?Q?N8yzf+d8REaSnGmdoWAIahppKJYeXGm1zpiZ1sVJJZjExbLxfY1VfOG9T94u?=
 =?us-ascii?Q?mEW73OYnZ05TrcDSnrbW/FhL1yDPXIBUrYp2U0y4mo2jxfe26gASWtB/fs0x?=
 =?us-ascii?Q?pqRhz56Q6Ov23rJt7anXq8qEghluFljZXExZKPJxSyjH5D3KYmdtvuTN5oGF?=
 =?us-ascii?Q?w4YpwmNZfkHV6fJyEKPV8vgGG67uxJoSzC7eBRYpunvRpgcKGVJsPS8t5FdH?=
 =?us-ascii?Q?/iyPdPWNLevag5NFhmnTcdDU2m1k3vQ2Y1p//aXNbFQxzYkoJ9TaN+EIJwYt?=
 =?us-ascii?Q?lat6x+Ac+bF0GsPw5fyIzrtex9F6ucqQzWcQUKj74Tu0EbBpb8bG20/toU/L?=
 =?us-ascii?Q?FYNlD0a6dyCD26CLgO6NraK+aWdeUrOdubgr1O0wCxaQEXlS6oZEerU1cSkE?=
 =?us-ascii?Q?De5TXhZ7tAeiXPSZ1GDidD18jTRjD4MRB+b4JuDiOhvkd2N5qqaTJthX6l7M?=
 =?us-ascii?Q?7NrZOAczCvbdqyPvju7u56b4NuFLkGjaQ8k1HAdhuQJEKmY7rZfrjTLObpf1?=
 =?us-ascii?Q?wFqN/Dwe7jTELKQ/YYOiJ/3qLgGeqSvH+7HaEmnTjHOUeRWQXnE/TN18ctmk?=
 =?us-ascii?Q?JWoGE55SsEy70T91ej2BSTrJEWUMgmH68K21Is/jy/kmG8UhjUYQaxOb53O0?=
 =?us-ascii?Q?c6GEVLHhcTTszNmD3/e/fSPJM+xNgEPjjmdDZwF7fbG86sdSN6lGqw0Xf6an?=
 =?us-ascii?Q?mYWnKUEXVC+sF5Sm2+15BBXcAknrKVxkVSxDw3jHN1BQts0Yid62gfUDtj8+?=
 =?us-ascii?Q?+cIfW4tCIzzlxFoEjNUonmoDkfW2q7ShMY6iICjrvB2/fbyYJCHyEbEXa6rq?=
 =?us-ascii?Q?FH5IE+5zOmx3l5X5ZlYLINitXf4NZgzG2eU4PCY548zvtB+GYb2+jHNtc2U4?=
 =?us-ascii?Q?Lz1Zlqg1RZcltgFSZK618GNytZU80AwdbkBtfH4pTAQHqpmj54WH4sCbhHZH?=
 =?us-ascii?Q?SO1Tbv6UcoHl4JX5pY2wFM6SX8kC8Eui?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 03:23:25.2400 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef394c24-6483-43f5-46db-08dcbda2ca24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7582
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

1. If the test case cannot trigger any reset on some ASIC,
It should be considered a failure.

2. Fix code style

V2: Fix some comments (Vitaly)
    Replace timeout failures with warnings.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
Reviewed-by: Vitaly Prosyak vitaly.prosyak@amd.com
---
 tests/amdgpu/amd_queue_reset.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 6819892e0..918f90d6b 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -30,6 +30,7 @@
 #define SHARED_CHILD_DESCRIPTOR 3
 
 #define SHARED_MEM_NAME  "/queue_reset_shm"
+#define TEST_TIMEOUT 100 //100 seconds
 
 enum  process_type {
 	PROCESS_UNKNOWN,
@@ -49,12 +50,13 @@ enum error_code_bits {
 };
 
 enum reset_code_bits {
+	NO_RESET_SET_BIT,
 	QUEUE_RESET_SET_BIT,
 	GPU_RESET_BEGIN_SET_BIT,
 	GPU_RESET_END_SUCCESS_SET_BIT,
 	GPU_RESET_END_FAILURE_SET_BIT,
 
-	ALL_RESET_BITS = 0xf,
+	ALL_RESET_BITS = 0x1f,
 };
 
 struct shmbuf {
@@ -307,6 +309,8 @@ static void set_next_test_to_run(struct shmbuf *sh_mem, unsigned int error,
 	sync_point_enter(sh_mem);
 	wait_for_complete_iteration(sh_mem);
 	sync_point_exit(sh_mem);
+	igt_warn_on_f(sh_mem->reset_flags == 1U << NO_RESET_SET_BIT,
+		"Testing does not trigger reset \n");
 }
 
 static int
@@ -473,6 +477,9 @@ run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_contex
 	int state_machine = 0;
 	int error_code;
 	unsigned int flags;
+	int64_t cnt = 0;
+	time_t start, end;
+	double elapsed = 0;
 
 	after_reset_state = after_reset_hangs = 0;
 	init_flags = in_process_flags = 0;
@@ -487,6 +494,7 @@ run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_contex
 		error_code = 0;
 		flags = 0;
 		set_reset_state(sh_mem, false, ALL_RESET_BITS);
+		time(&start);
 		while (1) {
 			if (state_machine == 0) {
 				amdgpu_cs_query_reset_state2(arr_context[test_counter], &init_flags);
@@ -533,7 +541,17 @@ run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_contex
 					break;
 				}
 			}
+			cnt++;
+			if (cnt % 1000000 == 0) {
+				time(&end);
+				elapsed = difftime(end, start);
+				if ( elapsed >= TEST_TIMEOUT) {
+					set_reset_state(sh_mem, true, NO_RESET_SET_BIT);
+					break;
+				}
+			}
 		}
+		elapsed = 0;
 		sync_point_exit(sh_mem);
 		num_of_tests--;
 		test_counter++;
@@ -1000,7 +1018,7 @@ igt_main
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

