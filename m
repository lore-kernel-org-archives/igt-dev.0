Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356F5CE8D60
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 08:59:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D0E10E6A2;
	Thu, 19 Sep 2024 08:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qsZoGAyk";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7908210E6A2
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 08:59:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxmNG1Rbe5L/v4ULaKznuv0JHx3fT1Keg0pL70Zj6flBWruuhtpYAQEHmBnSYzj/O5p6rrAJ33ATiQrCacjN9+Qp/ipyfpHzfFkucrVG1UCQHNuOYTKNXraxjsx7hVy+cgslQlZuX66k3mpqEc/j07+i7Le2HmcXKSc0mefFqzM+FbzzqBsWd7xnq3nb04wWpfrZFduQufoKUBXHiMWZHxDmlJfKpPZWV9gre8TdFDYFV2y6CeVugMKD8dfdhdvVc49TJRIYyxy36b1/LytOzZ/YiKVh9IgamFr9xdpBxEVCBXlvvrETt1JvEfbLrvXNQiXmyoEP/ur7dhqWjGjJBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmSZVibMGnldstCX4AxRYOycMfUktU3NmLAyHp+yEdw=;
 b=osa7GxnxhxpSLwVZJUCpnvpQ8HAXHB/Xt9/mK9f2wLspO0wlwSMKbcg7lBOIgA/UUSUgDuMVPbrRFbzDCRaGNAXImntMQOilZQUvuhtpyj0p3omiIYdnkUj2a3Ki6tYINOojT/hslWWfAhZbJrp2JUvpKbqlPu7hInh0iF6ER2JvNTNS9GO9M/rFKjV263aIUSo3wmDQRjrWhWHe9sWgrUoTXu6t2ftAONuk/qydAO0SWM5DrMGe7S07IINZyKWF+uzlihiI8OpoZJ+W0Pjp+XcLkjmprdkB3OUS+dXxTTgee1JzI+fUUmHvdSkQWKmo8CGJLoWCqR7+sxmbSAvlZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmSZVibMGnldstCX4AxRYOycMfUktU3NmLAyHp+yEdw=;
 b=qsZoGAyk8l/ddm4WfomVwwE8Qq3JYxkR4OCRfEoHuoRqmYiS3SSu8PL7dPw9sjCnm9lQD6Ih6ESKo+04gbEHF5Nw18mBy2Ocbzx4Vggtb+90j3C3efk1YZFOqzdNhdKtltQH5gIq5rCWXIJqLSifTYfkKmE3GlvG41waSM4qrvo=
Received: from BYAPR07CA0023.namprd07.prod.outlook.com (2603:10b6:a02:bc::36)
 by PH8PR12MB8608.namprd12.prod.outlook.com (2603:10b6:510:1bc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Thu, 19 Sep
 2024 08:59:09 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a02:bc:cafe::7d) by BYAPR07CA0023.outlook.office365.com
 (2603:10b6:a02:bc::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29 via Frontend
 Transport; Thu, 19 Sep 2024 08:59:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 19 Sep 2024 08:59:09 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Sep
 2024 03:59:08 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 19 Sep 2024 03:59:06 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Jesse.zhang@amd.com"
 <jesse.zhang@amd.com>
Subject: [PATCH 2/2] tests/amd_queue_reset: add sdma test in queue reset
Date: Thu, 19 Sep 2024 16:59:06 +0800
Message-ID: <20240919085906.2544464-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|PH8PR12MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fd05a30-6e8e-485b-c1ec-08dcd8895316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+vLJRm9cTr2FKrkMcMbAgf9DLtdl3t3jds948buDE5/cN8SXR21XiTBJRAoh?=
 =?us-ascii?Q?Bodx572CMHHS+F6Iazv07iUaNicrQxdl40YV7Tq3bXwyM7DAMC11nm/7lBGc?=
 =?us-ascii?Q?CJM1BSyIPvWKPYJc+3gAdhGXVH0/RR9cKv6Ox3UtiBk86Wd6ehw0CepnfNzQ?=
 =?us-ascii?Q?YXGSYHLVEKgiAgPKemZJ6Tl0rRIIxIK7Q+pJiYSpM1a3deeJE8DvSjeAxcfi?=
 =?us-ascii?Q?M+0JJ+T5axfMxnuIgdZgJAMh+Tz+kDDQ8s5x7SGPKzyg2sFEJ1oNRO9tWQUW?=
 =?us-ascii?Q?yTkEyYEPLzRyg1Z7zx0PMe4pHK9QYVRG0k58n+LM+kkixRNK9FySzOACu9V+?=
 =?us-ascii?Q?9Xwlj0eksp5xsNUOO4za3WHj+2GY7YBuh2ZMwKFvaAYvw3ivUogSwUHDTwWW?=
 =?us-ascii?Q?f74sFKtdDeE0JkpCM0ATP3LNVNoueoOQalKf+3o6ZPhkf4w5WnOVpWgpxuGV?=
 =?us-ascii?Q?9bb/J6LUzLerMVZrYvist+69xv5sSD4lKqIDVJG+JwR7OrhIQrIiXxe7MKFN?=
 =?us-ascii?Q?F4AgtDRxDlbzbHzHRLEYGmVBJYmkcoRfx9zaxJTGqXA1bbaXJa7NFchufyyi?=
 =?us-ascii?Q?x71tapXJYlbfgnRfQP0RgDPXGB6qVmkddgxCZFYxCM/WfevJlk5ra7gnHXNy?=
 =?us-ascii?Q?kbnWDlA1Ioe3PV1/V6zxIseTJByTo9uwFdzq4/Y3gmeBvv7OwhKGCoSEAxC0?=
 =?us-ascii?Q?uTd7Jyx3DYKsg6yovtI+qMeUGjjtqwjgvw+K892mW/mhtnq5SViNdUjv6xbd?=
 =?us-ascii?Q?bBV3m/TtQEA+bhzitsbJUjrD3mQRGiSLNB/RPBrwrDKe/xNRoJ85s1RszoQx?=
 =?us-ascii?Q?qwCHEXckKqz2Jkg97uTbHFVLURuE42HsYogTX8t/swblSk/btjIukIw1v1hM?=
 =?us-ascii?Q?XiD0vCfJvm21jV56iGPYXV2106yBNeENgwHXqULIJ2hxCo4UeIzRiQ6J0G18?=
 =?us-ascii?Q?o+yM8k9XInmTfIPXBqLfo510txS1mDw5oneLink4l990Mr/J0E8p0eoXm96n?=
 =?us-ascii?Q?0Oi4sQBcRBA2GevDeOaJmXPwiZxMYA2gc8EqdpyW3zOHq31kRBWbXYW90s+H?=
 =?us-ascii?Q?kkjaUj6Y+UH5mJwR+tfemddiCO3Jq4Uuji+RL5ifGd6JRqlS+//fkZbIOpib?=
 =?us-ascii?Q?G5eUdXg0Z4AmHmgPnjNAS/sCigTVvwyyEhlYYkM6UMfaDA1oRsFHzb/1YqBF?=
 =?us-ascii?Q?oBrlT3n6/WdqXpH3CtjdQGfd5dW00EA38VOgAX8jtGLRc69/0MjdO7DNBVWi?=
 =?us-ascii?Q?w5+hU/29cNzCEBwK0QCp1F7vnCSakqA16diBL+kpaIjFAdDmgODRsDeQCFmG?=
 =?us-ascii?Q?VY/IOuWJrCQywkp/kZuut8gtfydvQ6FakjjoN6WXvGRQ8VpOY/o7iAlB+vxP?=
 =?us-ascii?Q?LfmlMxOaTZT6IBWGxI8ktEybqrffnak61RzctWiZb4xxtzqf6f8O+IpTGaV+?=
 =?us-ascii?Q?m2KIgZ+CSTk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 08:59:09.4481 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd05a30-6e8e-485b-c1ec-08dcd8895316
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8608
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
Change-Id: Iaecd4634b23545fec1c6bc1a133c26469662ca19
---
 lib/amdgpu/amd_command_submission.c |  2 +-
 lib/amdgpu/amd_ip_blocks.h          |  1 +
 tests/amdgpu/amd_queue_reset.c      | 41 ++++++++++++++++++++++-------
 3 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index df278ad69..cd7240058 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -78,7 +78,7 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
 	if (expect_failure)
 		igt_info("amdgpu_cs_submit %d PID %d\n", r, getpid());
 	else {
-		if (r != -ECANCELED && r != -ENODATA) /* we allow ECANCELED or ENODATA for good jobs temporally */
+		if (r != -ECANCELED && r != -ENODATA && r != -EHWPOISON) /* we allow ECANCELED, ENODATA or -EHWPOISON for good jobs temporally */
 			igt_assert_eq(r, 0);
 	}
 
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 161f841cf..679e2ea46 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -70,6 +70,7 @@ struct dynamic_test{
 	const char *describe;
 	struct asic_id_filter exclude_filter[_MAX_NUM_ASIC_ID_EXCLUDE_FILTER];
 	struct reset_err_result result;
+	bool support_sdma;
 };
 
 #define for_each_test(t, T) for(typeof(*T) *t = T; t->name; t++)
diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 7526b1c0a..33d798a64 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -1123,6 +1123,23 @@ reset_rings_numbers(unsigned int *ring_id_good, unsigned int *ring_id_bad,
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
@@ -1136,7 +1153,6 @@ igt_main
 	posix_spawn_file_actions_t action;
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {0};
-	struct drm_amdgpu_info_hw_ip info[2] = {0};
 	int fd = -1;
 	int fd_shm = -1;
 	struct shmbuf *sh_mem = NULL;
@@ -1150,16 +1166,17 @@ igt_main
 	unsigned int ring_id_job_bad;
 	int expect_error;
 
-	enum amd_ip_block_type ip_tests[2] = {AMD_IP_COMPUTE/*keep first*/, AMD_IP_GFX};
+	enum amd_ip_block_type ip_tests[3] = {AMD_IP_COMPUTE/*keep first*/, AMD_IP_GFX, AMD_IP_DMA};
 	enum amd_ip_block_type ip_background = AMD_IP_COMPUTE;
+	struct drm_amdgpu_info_hw_ip info[ARRAY_SIZE(ip_tests)] = {0};
 
 	struct dynamic_test arr_err[] = {
 			{CMD_STREAM_EXEC_INVALID_PACKET_LENGTH, "CMD_STREAM_EXEC_INVALID_PACKET_LENGTH",
 				"Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, 0x10, 0x20 }, {FAMILY_AI, 0x32, 0xFF }, {FAMILY_AI, 0x3C, 0xFF } }, {-ECANCELED, -ECANCELED, -ECANCELED } },
+				{ {FAMILY_UNKNOWN, 0x10, 0x20 }, {FAMILY_AI, 0x32, 0xFF }, {FAMILY_AI, 0x3C, 0xFF } }, {-ECANCELED, -ECANCELED, -ECANCELED }, true},
 			{CMD_STREAM_EXEC_INVALID_OPCODE, "CMD_STREAM_EXEC_INVALID_OPCODE",
 				"Stressful-and-multiple-cs-of-bad and good opcode-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, 0x10, 0x20 }, {FAMILY_AI, 0x32, 0xFF }, {FAMILY_AI, 0x3C, 0xFF } }, {-ECANCELED, -ECANCELED, -ECANCELED } },
+				{ {FAMILY_UNKNOWN, 0x10, 0x20 }, {FAMILY_AI, 0x32, 0xFF }, {FAMILY_AI, 0x3C, 0xFF } }, {-ECANCELED, -ECANCELED, -ECANCELED }, true },
 			//TODO  not job timeout, debug why for n31.
 			//{CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,"CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC",
 			//	"Stressful-and-multiple-cs-of-bad and good mem-sync-operations-using-multiple-processes"},
@@ -1168,16 +1185,16 @@ igt_main
 			//	"Stressful-and-multiple-cs-of-bad and good reg-operations-using-multiple-processes"},
 			{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, "BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR",
 				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, 0x10, 0x20 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } }, {-ENODATA, -ENODATA, -ENODATA } },
+				{ {FAMILY_UNKNOWN, 0x10, 0x20 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } }, {-ENODATA, -ENODATA, -ENODATA }, false },
 			//TODO  KGQ cannot recover by queue reset, it maybe need a fw bugfix on naiv31
 			//{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,"BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING",
 			//	"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
 			{BACKEND_SE_GC_SHADER_INVALID_USER_DATA, "BACKEND_SE_GC_SHADER_INVALID_USER_DATA",
 				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, 0x10, 0x20 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } }, {-ENODATA, -ENODATA, -ENODATA } },
+				{ {FAMILY_UNKNOWN, 0x10, 0x20 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } }, {-ENODATA, -ENODATA, -ENODATA }, false },
 			{BACKEND_SE_GC_SHADER_INVALID_SHADER, "BACKEND_SE_GC_SHADER_INVALID_SHADER",
 				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, 0x10, 0x20 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } }, {-ENODATA, -ENODATA, -ENODATA } },
+				{ {FAMILY_UNKNOWN, 0x10, 0x20 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } }, {-ENODATA, -ENODATA, -ENODATA }, false },
 			{}
 	};
 
@@ -1195,7 +1212,7 @@ igt_main
 		if (is_run_subtest_parameter_found(argc, argv))
 			const_num_of_tests = 1;
 		else
-			const_num_of_tests = (sizeof(arr_err)/sizeof(struct dynamic_test) - 1) * ARRAY_SIZE(ip_tests);
+			const_num_of_tests = get_num_of_tests(&arr_err[0], &ip_tests[0], ARRAY_SIZE(ip_tests));
 
 		r = is_run_device_parameter_found(argc, argv);
 		snprintf(shm_name, sizeof(shm_name), "/queue_reset_shm_%d", r);
@@ -1250,13 +1267,17 @@ igt_main
 	for (int i = 0; i < ARRAY_SIZE(ip_tests); i++) {
 		reset_rings_numbers(&ring_id_good, &ring_id_bad, &ring_id_job_good, &ring_id_job_bad);
 		for (struct dynamic_test *it = &arr_err[0]; it->name; it++) {
+			if(ip_tests[i] == AMD_IP_DMA && (!it->support_sdma))
+				continue;
 			igt_describe("Stressful-and-multiple-cs-of-bad-and-good-length-operations-using-multiple-processes");
-			igt_subtest_with_dynamic_f("amdgpu-%s-%s", ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GFX", it->name) {
+			igt_subtest_with_dynamic_f("amdgpu-%s-%s", ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":
+					ip_tests[i] == AMD_IP_GFX ? "GFX" : "SDMA", it->name) {
 				if (arr_cap[ip_tests[i]] && is_sub_test_queue_reset_enable(&gpu_info, it->exclude_filter, it) &&
 						get_next_rings(&ring_id_good, &ring_id_bad, info[0].available_rings,
 						info[i].available_rings, ip_background != ip_tests[i], &ring_id_job_good, &ring_id_job_bad)) {
 					igt_dynamic_f("amdgpu-%s-ring-good-%d-bad-%d-%s", it->name, ring_id_job_good, ring_id_job_bad,
-							ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GFX")
+							ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":
+							ip_tests[i] == AMD_IP_GFX ? "GFX" : "SDMA")
 					set_next_test_to_run(sh_mem, it->test, ip_background, ip_tests[i], ring_id_job_good, ring_id_job_bad, &it->result);
 				} else {
 					set_next_test_to_skip(sh_mem);
-- 
2.25.1

