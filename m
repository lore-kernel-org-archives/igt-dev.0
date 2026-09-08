Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D229EC79F99
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 05:11:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665C410E9E7;
	Tue,  8 Sep 2026 05:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="j+coN1z9";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011007.outbound.protection.outlook.com [52.101.52.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E55A10E9E9
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 05:09:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AB+u/z9tSudpdhp7hBt7wsr7arKgSGaDTkwKvYKw9fUoMbq31yrsE/4NzxcJ7M55/bp1BW2ErVNR3UenHZR0I1gJIJZnAfTWlQa7zRakfgWBLFoZITqpXx+licgxItbqz1zqK77GekjT0VF2I6cB+/j/IOAFGAFpshpXqryXcNjSOJsHMBzMbsJCeg/s10E4t+ly57cCE+IEYxmlNcIBKoN2+KZwzbhVDRwz+xS5VnUx43HY9tWzuq6Ha+cG3bGrO6OxRv6PDFfkhfwRy2VXXRiKc2BjxDtEVNhmCY3Dk5vufC8vjpXltzX0vsAYCd2xqYDLvSjBO1CidltTyf9Uag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHHtNaeLkaM3s9Eq/CwosrMvRDNOKNHHkAjrAfP+bR4=;
 b=smYxzfH0muNdyC5Kqnia2Fxa2yGlnZtZSOtJdIGdDKTMTGDRKpUxk1u09i20Rwpt42im4UIqghu3KkR43tpkhgGxcGPtP/kqONMfJ1uerfgwq4jFMHrS4VPvpl7K6iwRLUDUB/ZTTLGgLQZf2lkCkmTQnaVtzOxpjxXqJN3h25SVzGYbDxS54wWyBAdsYx5lJYweXTRgrr/2xEDc6NNtQp14cPqQ6/TgJfwggUH796Nd84Tiickdt6Uy0EzhZYvEsvz3DaCZG0NsKQhu06FL2RG3M3Cq2v58p34kR6wMNRPiYFa1q6V9k7bmp8TYZcGmoxsKPdKO8rM3PA00NqYlFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHHtNaeLkaM3s9Eq/CwosrMvRDNOKNHHkAjrAfP+bR4=;
 b=j+coN1z9biq+5gfBXqotOwYvsfq/NTogOMkl1ZHFDcEh20dcgeXFTRnAeMbs4gJj0xEZgxhRsU6L9c2L0Ldtz97A9ElZGx8mDYm3ArraKOhqh11UI9BoCDIyzBnwUIhK0GIq63AHjvHvyDYqfPIyGFHheci62IBMIyfaFS5kRR8=
Received: from BN0PR04CA0092.namprd04.prod.outlook.com (2603:10b6:408:ec::7)
 by DS0PR12MB7770.namprd12.prod.outlook.com (2603:10b6:8:138::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 05:09:29 +0000
Received: from BN6PEPF00000073.namprd03.prod.outlook.com
 (2603:10b6:408:ec:cafe::4) by BN0PR04CA0092.outlook.office365.com
 (2603:10b6:408:ec::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 05:09:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN6PEPF00000073.mail.protection.outlook.com (10.167.248.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 05:09:28 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 00:09:28 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 00:09:28 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 8 Sep 2026 00:09:26 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 1/3] tests/amdgpu: add sdma clean-hang user queue reset
 subtest
Date: Tue, 8 Sep 2026 13:09:03 +0800
Message-ID: <20260908050926.3042193-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000073:EE_|DS0PR12MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: b812c2a0-6e6d-4627-2459-08df0d675c29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: mJXbpsRphq7+oLYR0F1vlAM5qi3blNcttTkmmGF5TOiWxpPaO/r/3AOOXHA2YFWECdbNySjbLoe0rsrotrkmL0iidpCq1YlzJTlT2fmypy+Y5oWFYFTmAzZTbbYB5QT29ZWKhUDSeCD1WLHU7MapG4YelQwKl12NLvEwnwUasHB/IAJkPKW/mSsSoGoknx5pkNDXTdN8CArAD0+jgQF/0bCg5+UIdwddzzxYk9F9KEBmMLCCTd6/9awMdOwGQ9sOUOU9cQPAn50YbJ5CFmlw6todGWihR3TdJxsv02rwu81zfQRJHnkgot4E/Nvrvo4GkZjeH7aN3SCTK1hoOeW5cZHkrJAtSITFfSUnD9GcE6cj3eCIwllesYeVbyiHA/+UKtdYq1YNROx3X5+omMsf1pagkEol8TxN9+uuHzVgCcT1Qn2FdR4aXje02UK4eSGtw8XkyF7jnji+JveH1MU/n9gJi7jfo8ZUKNyMTQThpaUeDkulfb8n/M/1IOicRSY0tr1Vj0e/LUuBXI0TtdHIqptmtK5+qFKiA48fO6d+vyJafwUyXMbpUTVWcZ8DKPXL6BbYhOvSKGTYStl/3NTZPgUXTzDgP6ancQffF+IUqF7SK9AW7lsjep0aSZGQbuzoB95H9G+UPrg/vYR7/B203K8GqCYjIvJ9gVI8jkj8TkD8L2y5GwtlzhBuRGgaNKusnrMiyw2wcqPmLpC61KIXuw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(18002099003)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7MCTW3ggN9WaP5cghcVxA+vcNumNmEvSPtPNVbJR9DPxhYMz+SlF6iL0LFImOmeIChQl2H1G/Uvcq+C7Xdtu/h+HbA45vYmMfm1/ZwFJOoLnsCEofud/b27V3sUIBGy7qvpq5GyVDNSqNhzNLePyinfDpPAGfJPmYsSM7ljs1gVZXyJ+76fyJW1i874thdkvQs8GlHD7igYTpQcqHIHFIBcNkJL3ycdoW040L6WbJ1SbyZ+5pFe1GLbx7pvFcmZFekkA+nDL9UYHRC+hisjvi7A5k7vtc32Yg2zxnTSwIFWYqWZmau4ZBh8NIw0SF3XEmLIVg7TpwTmraYQk5F2RgD939I8Ul6JFGFrBIm8rqQmsSMdRpOj18AayGoBn/TVvUqiupYYkCLvauqlV7m3N/skYdfgX7bX38GkVX7qVGeeFDn4SQMOLKkq4MuzUMP8k
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 05:09:28.8503 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b812c2a0-6e6d-4627-2459-08df0d675c29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN6PEPF00000073.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7770
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

Add amdgpu-deadlock-sdma-clean-hang-umq: hang a single SDMA user queue
with one never-satisfied WAIT_REG_MEM and let the driver recover it with
a per-queue reset. Unlike amdgpu-deadlock-sdma-umq, which floods the ring
with jobs, this submits exactly one job, exercising the clean single-hang
reset path (mirrors amdgpu-deadlock-gfx-umq for SDMA).

Parameterize amdgpu_wait_memory() with a job count so it can submit one
job for the clean-hang helper while the flood path keeps MAX_JOB_COUNT.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 29 +++++++++++++++++++++++++----
 lib/amdgpu/amd_deadlock_helpers.h |  2 ++
 tests/amdgpu/amd_deadlock.c       |  9 +++++++++
 3 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 1ce46422f..7574e8cc6 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -90,7 +90,8 @@ write_mem_address(void *data)
 }
 
 static void
-amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type, uint32_t priority, bool userq)
+amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type,
+		   uint32_t priority, bool userq, int max_jobs)
 {
 	amdgpu_context_handle context_handle;
 	amdgpu_bo_handle ib_result_handle;
@@ -208,7 +209,7 @@ amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type, uin
 			r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
 		}
 		job_count++;
-	} while (r == 0 && job_count < MAX_JOB_COUNT);
+	} while (r == 0 && job_count < max_jobs);
 
 	if (r != 0 && r != -ECANCELED && r != -ENODATA)
 		igt_assert(0);
@@ -271,7 +272,7 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
 		prio = AMDGPU_CTX_PRIORITY_NORMAL;
 
 		/* Skip the scheduler mask manipulation for user queues */
-		amdgpu_wait_memory(device_handle, ip_type, prio, true);
+		amdgpu_wait_memory(device_handle, ip_type, prio, true, MAX_JOB_COUNT);
 		return;
 	}
 
@@ -329,7 +330,7 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
 			igt_assert_eq(r, 0);
 		}
 
-		amdgpu_wait_memory(device_handle, ip_type, prio, false);
+		amdgpu_wait_memory(device_handle, ip_type, prio, false, MAX_JOB_COUNT);
 	}
 
 	/* recover the sched mask */
@@ -342,6 +343,26 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
 
 }
 
+/*
+ * Hang a single SDMA user queue with one never-satisfied WAIT_REG_MEM and let
+ * the driver recover it with a per-queue reset. Unlike amdgpu_wait_memory_helper
+ * (which floods the ring with jobs), this submits exactly one job, exercising the
+ * clean single-hang reset path.
+ */
+void amdgpu_hang_sdma_userq_single_helper(amdgpu_device_handle device_handle,
+					  unsigned int ip_type, struct pci_addr *pci)
+{
+	struct drm_amdgpu_info_hw_ip info;
+	int r;
+
+	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
+	igt_assert_eq(r, 0);
+	if (!info.available_rings)
+		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
+
+	amdgpu_wait_memory(device_handle, ip_type, AMDGPU_CTX_PRIORITY_NORMAL, true, 1);
+}
+
 static void
 bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
 			unsigned int ip_type, uint32_t priority, bool user_queue)
diff --git a/lib/amdgpu/amd_deadlock_helpers.h b/lib/amdgpu/amd_deadlock_helpers.h
index 0fd5eb59a..1f2de61d5 100644
--- a/lib/amdgpu/amd_deadlock_helpers.h
+++ b/lib/amdgpu/amd_deadlock_helpers.h
@@ -29,6 +29,8 @@
 void
 amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type, struct pci_addr *pci, bool userq);
 void
+amdgpu_hang_sdma_userq_single_helper(amdgpu_device_handle device_handle, unsigned int ip_type, struct pci_addr *pci);
+void
 bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type, struct pci_addr *pci, bool user_queue);
 
 void
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index b8356af74..6822617e5 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -247,6 +247,15 @@ int igt_main()
 		}
 	}
 
+	igt_describe("Test-per-queue-reset-of-a-cleanly-hung-sdma-user-queue");
+	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-clean-hang-umq") {
+		if (enable_test && userq_arr_cap[AMD_IP_DMA] &&
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
+			igt_dynamic_f("amdgpu-deadlock-sdma-clean-hang-umq")
+			amdgpu_hang_sdma_userq_single_helper(device, AMDGPU_HW_IP_DMA, &pci);
+		}
+	}
+
 	igt_describe("Test-per-queue-reset-of-a-cleanly-hung-gfx-user-queue");
 	igt_subtest_with_dynamic("amdgpu-deadlock-gfx-umq") {
 		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
-- 
2.49.0

