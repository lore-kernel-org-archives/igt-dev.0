Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37DEC54FC6
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 03:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4767F10E13D;
	Mon,  2 Sep 2024 03:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bd53iNQ5";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E2010E13D
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 03:36:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kaz4OtRJCYgH1u9gDS4tyJKwQhR3GeDFAzyCHbNYo9ms8Jvro3XdErFvHjS2Lr+AYLwwaFcRlytn1j1I+temH7A7iNXCG3hiLwbrgLUujdhZ1Wh/V0NlS5Q+5Kqsb+ajT6GKnRwCWqT5t2Ebd6EY22VsCu2tEzPEn5dZKloZnvhbDA30Ny8GcrwwKys+KlYpLdOIwGXhkKrOIM7fZXDyxkYb7mjTfQGX/hfSY4dOKNWDxN52+TVXgFDt+e6NsAdbcnARo1B2+mncaEn72EHtK/p+eEo1TbouxYFKF2Zdzn26JBaqjNeUX3XWA+ckCnzf8Tq59kUrh8QytQpnTNdiBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SeaJbTIPASZhgfux7LxtVuq0rLUgmzpapu2WTR/gmeQ=;
 b=AIsXbroevt2lPUb7Lmg3UsPwtYgTdzp062tPHgdFVc8bamMlG3/bUe29/1U07yLst+pkVeqHoDrtfAaAFw+z/KGyFKIYdKpjJIpC3hQV+WadOj32mPBcIV8kC2cER4HDB4KwFkw0hjBMUu98u6c3D91PpBHVyuX7j8Bco23tp81eWyeoh9XfhscncBNt3IaO2bZU3BICjUPEE4RofBsOWpvHS5Y1sliGbonPSwfZk8kvW1F4pQjd4ObMZtrT2x7ufOQoms7//+S3rglhbZpm2hcg3WUNtsbM2oUa/SARvutfFNBAmHR4cUFfMkfPaIrdhR9w5mmyjlTppXBGK5sCuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SeaJbTIPASZhgfux7LxtVuq0rLUgmzpapu2WTR/gmeQ=;
 b=bd53iNQ5YwfKsdPhbDb57vJTAX0yQK9GRXm1V4g0ImnpBM6sdjv1xTLPuyMzFKcPE21ENsAnnTsZ1hOdkSBhgYGgSBUKrimamsLp4TyD4C2BrLOjuQiJ037yocYsniMAp0YLQbuys6rME3YK0LJL1QHSXjamymcCp6EWE6vDDh4=
Received: from DS7PR03CA0268.namprd03.prod.outlook.com (2603:10b6:5:3b3::33)
 by SJ0PR12MB5675.namprd12.prod.outlook.com (2603:10b6:a03:42d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Mon, 2 Sep
 2024 03:36:46 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:5:3b3:cafe::f7) by DS7PR03CA0268.outlook.office365.com
 (2603:10b6:5:3b3::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24 via Frontend
 Transport; Mon, 2 Sep 2024 03:36:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 2 Sep 2024 03:36:46 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 1 Sep
 2024 22:36:43 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 1 Sep
 2024 22:35:00 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Sun, 1 Sep 2024 22:34:58 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Subject: [PATCH i-g-t V3] tests/amd_queue_reset: add sdma test in queue reset
Date: Mon, 2 Sep 2024 11:34:53 +0800
Message-ID: <20240902033453.362229-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|SJ0PR12MB5675:EE_
X-MS-Office365-Filtering-Correlation-Id: 0275c955-6b46-4dbb-1c36-08dccb0078aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YfZgUCYEPsqIwTZOmk0ypu50dnXVFKOK/nk2/312xun2J9yDqwWFqOhId93d?=
 =?us-ascii?Q?Rsxa3ZQalxQBTFXTsOZ37pr93PcFr246lctBDTyZcxUDUOhgRFM2mgrjRFXb?=
 =?us-ascii?Q?NaCFCDMOATFnesavk120hoP3WczVqk3nXvLEuF69UKpWFzdhoYW6IL1X0lBa?=
 =?us-ascii?Q?1Nf+0e5IDLd6p4F/zWq3VqavNbwogQIbcvNr46jZabXucH4ibgIL2JsGf0tz?=
 =?us-ascii?Q?1a17BucFou3ocbNc+dXG2WVVATBxRCmSCS9hkN6FpnoSb5B/UobQHlFDSLfh?=
 =?us-ascii?Q?A4kU4y4Q9x2VddeZdMlVyMtvh5A6HaoZ4Sbpc5HJzBwTkzS5Viz6iu+tyi08?=
 =?us-ascii?Q?docZgt6Dkf7nP6wrNpHsC+Rmunvhl9FpBGlv3rWGVLM//J4ipI5QB4cZnwTr?=
 =?us-ascii?Q?r7JRVoEKgLmUVORYSbi4mNOwpckCRzvYCu1OMomomO7DIpaGRh2VsHlyFB7+?=
 =?us-ascii?Q?RD0AfC4dfAMn+XqoI24ozZa+Qbt9oOSOj/Gaxyu/YyQ6WIOe5Y7/xiHPqydx?=
 =?us-ascii?Q?VcIpEx3LE9i6KixVngHUWQVFEEwxZnlSyv9aDaDTB8JtZ+jkAo/+W/j8jtQJ?=
 =?us-ascii?Q?OOpq8amxZ242TG6K52l+EoPeWassXileutOqCiegZerkrDwb58AITeV4e4+y?=
 =?us-ascii?Q?0WxnL7Vq1xHFAMj1BpYLxI5lhOxL0jo8lAAGS/QYiYgF3VmUxLtj/DS3+0e/?=
 =?us-ascii?Q?lcgYuEFAyW6F7nzV0+YLaCo2kZ2cMJv4LQXN0032c2jnkWws8rOsAgT+geau?=
 =?us-ascii?Q?lnma2OUodHwGQbNSuHmKzCiNAP8jiOZl4+35UtCmKzYqA0f1OOVNWGx/tEeE?=
 =?us-ascii?Q?nevb3L93+xc5mdV85jB0G0JG0usTrUBow35Scnx06KaUeAlr0sQMSSfpVwog?=
 =?us-ascii?Q?CtmMpwx+7IyS/7cvywCyJiQpsWG80zcRnXPMiwJHfCaJ1FQTLUAi5lM/qBPY?=
 =?us-ascii?Q?yJEvfzqY160penEBO2rYG5yQlLpiZNdsTNRUWd/NVBWHASf4cfurjZPN7z3r?=
 =?us-ascii?Q?LoJhUpus5LrkBZNjbQNjnDng5ohrkkBInTVmOc5fOWimpbaZvBxjbKhrxjS6?=
 =?us-ascii?Q?CHtoEtVrSAhE9jCPfJWnlY0c4+QBN5aUlnA7kjcfxv1rqHcVvyQbAYirtnQR?=
 =?us-ascii?Q?ZO+ahy8ZOOYENjpEUHmYo67ag/FHSJZ5VNK1WDU8gweE0U8Cg8cWFKxGKCBk?=
 =?us-ascii?Q?A08DiECOr6eYojlxWYyGX7NP3Eh/DG2liwH+zuCyl5Cx7s1KyKQ9kPwyXpT7?=
 =?us-ascii?Q?x84kv9LgMvN8Au+R/AnCpZTl/xn4axT3FW+M/jGeK5AwF9dnv+zbLSgCVQrF?=
 =?us-ascii?Q?2AVSV0vueHgtmEUOo2sZTNdZO258HROopBWMuEfEglCWgkoeXyOCug5RDnMI?=
 =?us-ascii?Q?q98BO+EMieKpOfQ7CutDRCRS3cXeOr8MO2ICSk9ivjOZqsSxc2MQDf8cgPUs?=
 =?us-ascii?Q?4OvBRNGAWTw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 03:36:46.3370 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0275c955-6b46-4dbb-1c36-08dccb0078aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5675
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

v3: 1.add sdma support flag,
    2.add a function about calcuating num of tests,
    3.Remove !strstr(it->name, "CMD").(Vitaly)

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_ip_blocks.h     |  1 +
 tests/amdgpu/amd_queue_reset.c | 43 +++++++++++++++++++++++++---------
 2 files changed, 33 insertions(+), 11 deletions(-)

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

