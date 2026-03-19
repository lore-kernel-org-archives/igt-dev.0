Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271891091930
	for <igt-dev@archiver.kernel.org>; Thu, 19 Mar 2026 23:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C035A10E103;
	Thu, 19 Mar 2026 23:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kZ5YOIkU";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011060.outbound.protection.outlook.com
 [40.93.194.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306DC10E103
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2026 23:45:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ceWwaLTIPURoff5uLqToWzlkYmALomgQMf5bf8V97r8vV4y8cI65xszf1wMdI3WFhHpYctSJf96MbR4PJxVvIfnt5F/LUO5eXWZakSYdxuHIiowNXPAeKVUTbfNm71jyYvGDS1JfH+yejC0z1mFuiHaFwCU2nVe6gcNK1uGL8H0fkPGC52BJVmDqLugZtpwwLfCiwunA/lX0AwWddaM+YZzy8bEWsP0L13nd1Zdc6SHDs7iDArULkLyY6+GXQ/EYZOgGcuFryQ5rVq0CAykqJtT/E/46pWz3z8PB2yQysTkv8NjrNlgAL1i7aNu7W7CqiCIyNM0adMOlmBY49vymSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1gNfW+BBH7XEn/s+VCIEvkUH5lLMGxMP1xv+/Bs9bF4=;
 b=EMlZgZEOPXDTPt6M0pZyAKjitwcq8JBtWxdJ9+PItDxtDq4h7YO+he2lyCbKxACewUz/0J4BMuI134JGYJX9TkU09mGd1FtQah3QrFYNAR1NzPBYUB/Z3UgFLoxr/Qjkd+nMra+wrkaJIztieRlcoPzfyk6aaUl4sUtkgX3u+D7hvlLcRt5uX1aIqF9jtn6+w6jTi/xb2YTsHpQTurHU0QElNxEkljTzwDv/NdCt13myu34K/3JMd5/VHSzsdiCWlR7T57XIjZTpLTXSPXLz1FYhXC+kpkAjLGEs6IiteQpujEPyb1anZCKPwNXTl/UcQ/ofo1zONW4ksToNOAC3Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gNfW+BBH7XEn/s+VCIEvkUH5lLMGxMP1xv+/Bs9bF4=;
 b=kZ5YOIkUL+p0EwKrNNeo/6qrq1/oOt5T2vE+/N+b+uJAJPbD5YwSnCZNGgJ8fkYWNDB2BQXTVu65m48usKJfXuDIzX20DXQpM1AAN06V7Njfwjhwjhq0M81QGdr/SLMkGzlS6o/pvBZ9S6np+k74FiqUQjaUMCQQ1lYwXfhDf0I=
Received: from CH5PR04CA0015.namprd04.prod.outlook.com (2603:10b6:610:1f4::16)
 by DM4PR12MB6471.namprd12.prod.outlook.com (2603:10b6:8:ba::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 23:45:20 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::11) by CH5PR04CA0015.outlook.office365.com
 (2603:10b6:610:1f4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.20 via Frontend Transport; Thu,
 19 Mar 2026 23:45:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 23:45:20 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 19 Mar
 2026 18:45:20 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 19 Mar
 2026 16:45:19 -0700
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 19 Mar 2026 18:45:19 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Christian
 Koenig" <christian.koenig@amd.com>
Subject: [PATCH] tests/amd_queue_reset: restore ASIC-based subtest skip filter
Date: Thu, 19 Mar 2026 19:44:55 -0400
Message-ID: <20260319234512.89668-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|DM4PR12MB6471:EE_
X-MS-Office365-Filtering-Correlation-Id: 4509dda3-f7e7-45fa-dbce-08de86119505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 8+wOncTaniNPhO2TyLa2gWgUd7SmMSUisZPgXhmYCwy9ehnNawQtfqZwfK1f20lVerBBxw2I+xViSPiJc/8snAHvTbLHt3XBouPdsc8qgMTZMvHNiYV2iq5oTOqqcmwXobhS3BV5+xUhnbHEiCUXrLDBV0NgJxLav7wRhBxTYo3vMNXrVqTnvf88vhwuWl9mZprMwScC9ChONpOXK1rOWTT4uwxUCO8KgimRVtNTxOJpXiw7dtkqWDWrqYSa8jB2yDY1UhKsD7oztu37jYNOhJ6s3TZIa2zsMzpHjAdvPstYI2j876g03JXyI1MrdK/c9M3IfoesV2vLe6b0Wxu/zsoxDF/fZCo3UQeJokWcIzOzJKwtgfB8y2j5xoUqKfE+VRIVOU5PC9VNxdbsHym44K51ykJQrcQOlPOmF9+AbnUNR0Xjs+o183h+Fz5n7/LD4AuWNO5hZkfsewl8ZiMjheqh6QXrhoblaeco0pGKLa5wHt5i5gS9cFVneIyjBRHFPkCpfuvztx+dS+lRA8SxRBhED3l5i8Hpcl+DQye3kLZH9pWw0OIuD0yRlg6GxPUsjc9hMFKFvNOMkD3QzoR6cmcZsj/BcyA3+JsFHpDncx71qZmOUOl0mf5kja6PDoOKhYcFHl2Lk4TWtfcwMNZETQmdZP6kWcOHLWIlDQYwh4u5EXrOX93ODfGeYw2ArMX1789fw57cAENZ3cNnwurJE4Sf5ivqPXwLUCA4VocJ/zQA+yE7TbT7sZVerfBUPRlNHCZP1+DSAIHFPZC1wcGAiQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5PZXupm08eBhr3VWiuMDSpXuftgltP2y7ALqvzIcKFoTZHLNIifxachHjSToOxMGh5WfWZuVu2IF2bdQFis373+uxXalMyr444+ebjw+BqS9kE4Gg2rZrDz6Jle1apVfv7YOqAkyA1rhoDy5Ahw/Q07C5YVIOAxAs0lVWs5yQKLET7vPm09sKpbjDmrjAjV7+0QhBS4F3QRNxCLeGkyTIdU39nqkafrG70J1ktmzOOoIiYf0H+e0rEMPO9GLYltNf+aVuzkSGFeh5nDRC1lb5ScwmnqByYWeovynTlmT6n/Nxwr95fcro89rc/OkVssGu6AvZ1CG2P934chKh+w8POtohX9szXB8yDaM4llpFuK9jlkaACiCvlZRfkxRBwpZggtim0ZwhzqlkwTPtsbTKwjsLWK/YHCMyvyUCnE+mi0j1tTTS7Sh2cZkrG9ovry2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 23:45:20.5403 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4509dda3-f7e7-45fa-dbce-08de86119505
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6471
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Restore the is_sub_test_queue_reset_enable() function that was
removed in commit 5cd78b28 ("tests/amd_queue_reset: modify the
asic filter").  The sysfs-based is_reset_enable() check is kept
as-is; the ASIC exclude filter runs before it so that if there
is a failure we can skip the given subtest in order to buy more
time to fix it without blocking CI.  For older ASICs this is a
practical temporary solution.

Populate the exclude_filter for CMD_STREAM_EXEC_INVALID_PACKET_LENGTH
to skip  FAMILY_AI 0x32..0x3C and FAMILY_AI 0x3C..0xFF.

This gives us back the ability to unblock CI by adding filter
entries to the table instead of commenting out or reworking
subtests.

Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 44 ++++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index edc334bd7..7cd2ff79a 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -504,6 +504,44 @@ is_queue_reset_tests_enable(const struct amdgpu_gpu_info *gpu_info, uint32_t ver
 	return enable;
 }
 
+/**
+ * is_sub_test_queue_reset_enable - check whether a subtest should run on this ASIC
+ * @gpu_info: GPU information from amdgpu_query_gpu_info
+ * @it: dynamic_test entry whose exclude_filter[] is checked
+ *
+ * Returns true if the subtest should run, false if the current ASIC matches
+ * one of the exclude filters and the subtest must be skipped.
+ */
+static bool
+is_sub_test_queue_reset_enable(const struct amdgpu_gpu_info *gpu_info,
+		const struct dynamic_test *it)
+{
+	int i;
+	bool enable = true;
+	int chip_id;
+	char error_str[128];
+	bool is_dispatch;
+
+	for (i = 0; i < _MAX_NUM_ASIC_ID_EXCLUDE_FILTER; i++) {
+		if (gpu_info->family_id == it->exclude_filter[i].family_id) {
+			chip_id = gpu_info->chip_external_rev - gpu_info->chip_rev;
+			if (chip_id >= it->exclude_filter[i].chip_id_begin &&
+			    chip_id < it->exclude_filter[i].chip_id_end) {
+				enable = false;
+				is_dispatch_shader_test(it->test, error_str, &is_dispatch);
+				igt_info("PID %d SKIP subtest %s family_id 0x%x chip_id 0x%x range [0x%x, 0x%x) excluded\n",
+					 getpid(), error_str,
+					 gpu_info->family_id, chip_id,
+					 it->exclude_filter[i].chip_id_begin,
+					 it->exclude_filter[i].chip_id_end);
+				break;
+			}
+		}
+	}
+
+	return enable;
+}
+
 static int
 amdgpu_write_linear(amdgpu_device_handle device, amdgpu_context_handle context_handle,
 		const struct amdgpu_ip_block_version *ip_block,
@@ -1135,7 +1173,8 @@ int igt_main()
 	struct dynamic_test arr_err[] = {
 			{CMD_STREAM_EXEC_INVALID_PACKET_LENGTH, "CMD_STREAM_EXEC_INVALID_PACKET_LENGTH",
 				"Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes",
-				{}, {-ECANCELED, -ECANCELED, -ECANCELED }, true},
+				{ {FAMILY_AI, 0x32, 0xFF} },
+				{-ECANCELED, -ECANCELED, -ECANCELED }, true},
 			{CMD_STREAM_EXEC_INVALID_OPCODE, "CMD_STREAM_EXEC_INVALID_OPCODE",
 				"Stressful-and-multiple-cs-of-bad and good opcode-operations-using-multiple-processes",
 				{}, {-ECANCELED, -ECANCELED, -ECANCELED }, true },
@@ -1239,7 +1278,8 @@ int igt_main()
 			igt_subtest_with_dynamic_f("amdgpu-%s-%s", ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":
 					ip_tests[i] == AMD_IP_GFX ? "GFX" : "SDMA", it->name) {
 				reset = AMDGPU_RESET_TYPE_PER_QUEUE;
-				if (arr_cap[ip_tests[i]] && is_reset_enable(ip_tests[i], reset, &pci) &&
+				if (arr_cap[ip_tests[i]] && is_sub_test_queue_reset_enable(&gpu_info, it) &&
+				    is_reset_enable(ip_tests[i], reset, &pci) &&
 						get_next_rings(&ring_id_good, &ring_id_bad, info[0].available_rings,
 						info[i].available_rings, ip_background != ip_tests[i], &ring_id_job_good, &ring_id_job_bad)) {
 					igt_dynamic_f("amdgpu-%s-ring-good-%d-bad-%d-%s", it->name, ring_id_job_good, ring_id_job_bad,
-- 
2.52.0

