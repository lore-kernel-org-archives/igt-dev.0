Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D69E9DE42
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 07:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2CB10E2D1;
	Thu,  9 Apr 2026 07:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LNZI7Gve";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012046.outbound.protection.outlook.com [52.101.48.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0094E10E746
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 07:16:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnF4VDgPD6a0DYP5xIEfnIC5xnVEG7Oy0Ymxil8ROhUYWAs/ikwjCre//ZExnnPuEsj35fkT2PMjZlojzBg71xKsKqifiSMgtf/KlVaeTHfuZUEMjkNhpX8QtZ7le1nD5oe+vcCJ2fz/3+RWj6cKlVDJ3Bb+k0PPkq5x7mKj6XrrjdOdpOv63xZ47eLYfF2zjnimEPIKPo9frMhFwDOwVGC3Hw6nTtTlftoDfhp9QRLDSy3QbJBNRqvJBvPyZ5tt7aaFWtlgpQ1cN+oFK841ymc9jN8XUWoThNpUwXpVeXqjb77vzLwrZ2xyruDQgYhObp9EjDIkS2qvv+/AwebJBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWcxm4Hx4x1j04HSTGqFHaobGGtndlZEBrHZlpB4xlw=;
 b=g1dhAP4oem7R/41aeAbojSugJXRrBF1VQBTduUMGrvt/+q63SBzgZ/yDSixjWM0lNWFCLERM+K0lsZHI5SxLaX9Sp+S8AQ4Y9WCfBwTYQm5JipRqvBInbQbQwtPg8imT9EXfUyyG4i7wq13L2GIXRGUVMqZTeLmakkF1WWI0BvPr4SFW0VGWvY12rvPxAZEIxVnrE7PY/fYtdEK3cQtz5xw1GSzb0tylvlVPprtGmOVdC3qcrSZjqNly/YhiB1Vz0Gpuu/0w/AEBjHvqFZG9evh2GUe8hKeZJitRko0sAjLAj0tb+ggkmYlEsMWB010aHpdZUhe++t7Ejz8hLelZug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWcxm4Hx4x1j04HSTGqFHaobGGtndlZEBrHZlpB4xlw=;
 b=LNZI7GveV6JXVfKpOMxCbmeRlfr8G8UQZIMuylTErgDBRMW1+vxqkqZkl26Q1OnghekvDxLhbpbhdxEaByi2ACoeaU1zQ4mqSTIP5AhLHZqA/v5u73sg7swbOO33HtlDkwvje33M3a+sDYKD8qvxBAhv9uKsWGJ5y/VepdUtqgg=
Received: from BL1PR13CA0297.namprd13.prod.outlook.com (2603:10b6:208:2bc::32)
 by LV8PR12MB9334.namprd12.prod.outlook.com (2603:10b6:408:20b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 07:16:12 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:208:2bc:cafe::61) by BL1PR13CA0297.outlook.office365.com
 (2603:10b6:208:2bc::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Thu,
 9 Apr 2026 07:16:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 07:16:11 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 9 Apr
 2026 02:16:11 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 9 Apr
 2026 02:16:10 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 9 Apr 2026 02:16:03 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t 1/2] lib/amdgpu: restore sched_mask after abnormal
 subtest exits
Date: Thu, 9 Apr 2026 15:15:48 +0800
Message-ID: <20260409071558.2658707-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|LV8PR12MB9334:EE_
X-MS-Office365-Filtering-Correlation-Id: 675069ff-9e6d-4a61-7bcd-08de9607e0cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: LKpQbJzfCwpL/JDcJnnb7x0fvTRB60uQ+F8TB0oeZ82ZPurBRBiILBK4ZMIfI1CvXipKFW0pyhj65XxBFU2HtfH4FWztQn3OIUXjrriS4cbHaKHROFq0fuYLe4CE5UAd03Rf+foW/2sA9vEOZO6bdRAWCxY5YX7tM8Q0vo2Kea5sjH+8zVrp4V2J9sw61dswDipG9Z01LWyezLmV67OC7H15vvK40XlY/4spoZH3DplP4scZO/P19FlNLjp9cvuYQDdEvnzJtupXGqS37OvZLSaok0HP146iB/8IvEFTWLXjYbF2FRCCOEN+yWibbRVtvMrGN1XH8U3UMOqEqquM38CJmYYxJ6EvRef1hyg1j48o8I58ZhjKDeFEXvXyOZOj3t7ZnFl9d4BRrNXTPruAit2q7ruNOgQNklauRQsbfXpoI4RLaSKwDvAPPea6twKQF76euw8fGkMDlPkUo7TnkDa4jeEeZaVqxanznELHY4V+pPO1iFkgvj1XSRW6zzb4xnZwAQEHGbh0oZs7qsKgbUEMTBA0FbEAne5x1oApAKudQSGRJ5Si+SdWWs4D/se7+ffF4cfJg3SWtLs1eCH6K+cSR7B3RefdTX2j3thMBZw3MNykAf6b1Yx5aJ2/+jrBY/XMpjDyvkyNZ35r3EmMXc1VESeCbKi6yaAhCBqBNJYpYjt9paUyKMXqA4xF3ELPS6Zawb29u1TE/sa4Z7+inr32ulBWEWqdelfY1rmbaRaz9KosWDpkUQNihvTzhk0OrJvCMkZ0h0ChjTSGJ8HD7Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: z5k/z85W4iRvAOMRdCULsYBPrmfsXUrWZ9ruqGkWvvh1tCPiHtxvctDk8JuJ//3kB+loaYxR35K582KMqFV1ZM1aUd5pssOKKXN9LYIwYW0tRvgXiJl7NgYGArIUh+WrPaRYEIud/yxFd4XdAhokJ8E9QR64YlwwBqQPvagd1LFQ+QTKHldYD3T/k8zw8XDKDeYRktaWfZIkytxohm5qAoJdBZ+02tFrtH+/0+KFTymBFKwEtZFf2RqQ5xSgfa72Pb2rv5Er6kNyxQw9e1qnTDlpqD7l5gRy7YRZtSEpN05TSXVPK1jT8HQEkXknIEt4siqtxZ2J2g0dWmAn+r8jwuWKXpeHTj9M2F4byKtJdFTQdMcEFJIYhLNbPGEqCfXbxQqQwj+jsnavZeEkzYf/1wLaXJNSmulMXDN2TRelAbrCHh0b7sV8FGZvXDnGG6gN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 07:16:11.3126 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 675069ff-9e6d-4a61-7bcd-08de9607e0cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9334
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

amdgpu_wait_memory_helper(), bad_access_ring_helper(),
amdgpu_hang_sdma_ring_helper(), and mm_queue_test_helper()
temporarily isolate individual rings by writing a reduced mask to the
sched_mask sysfs nodes and restore the original mask only at the end of
the function.

When an igt_assert fires inside the ring iteration loop or in a helper
called from it, IGT unwinds via siglongjmp back to the subtest entry
point and bypasses the normal restore path. This leaves all-but-one ring
disabled for the rest of the test process, so later subtests can observe
disabled schedulers and run into follow-up failures.

Fix this by adding the same three-layer protection used in the dispatch
helpers:
- register a file-scoped igt exit handler that restores the saved mask
  when the process exits with a dirty sched_mask state
- restore a stale dirty mask lazily at the start of the next helper
- keep the existing happy-path restore and clear the dirty flag once the
  mask is restored successfully

This makes the deadlock and multimedia helpers resilient to abnormal
subtest exits without changing their normal ring-isolation behavior.

Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>

Suggested-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 56 +++++++++++++++++++++++++++++++
 lib/amdgpu/amd_mmd_shared.c       | 47 +++++++++++++++++++++++++-
 2 files changed, 102 insertions(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index cb37a3564..06c577085 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -27,6 +27,50 @@ struct thread_param {
 static int
 use_uc_mtype = 1;
 
+/*
+ * Static state for sched_mask cleanup on abnormal subtest exit.
+ *
+ * A failing assert in ring iteration helpers can jump over the normal
+ * sched_mask restore path, leaving non-selected rings disabled for later
+ * subtests. Keep one file-scoped backup and restore it from an exit handler.
+ */
+static char sched_mask_sysfs[256];
+static uint64_t sched_mask_saved;
+static bool sched_mask_dirty;
+static bool sched_mask_handler_installed;
+
+static void sched_mask_exit_handler(int sig)
+{
+	char cmd[1024];
+
+	(void)sig;
+
+	if (!sched_mask_dirty)
+		return;
+
+	sched_mask_dirty = false;
+	snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%" PRIx64 " > %s",
+		 sched_mask_saved, sched_mask_sysfs);
+	system(cmd);
+}
+
+static void sched_mask_arm(const char *sysfs, uint64_t mask)
+{
+	/* Restore stale state first if a prior subtest exited abnormally. */
+	if (sched_mask_dirty)
+		sched_mask_exit_handler(0);
+
+	strncpy(sched_mask_sysfs, sysfs, sizeof(sched_mask_sysfs) - 1);
+	sched_mask_sysfs[sizeof(sched_mask_sysfs) - 1] = '\0';
+	sched_mask_saved = mask;
+	sched_mask_dirty = true;
+
+	if (!sched_mask_handler_installed) {
+		igt_install_exit_handler(sched_mask_exit_handler);
+		sched_mask_handler_installed = true;
+	}
+}
+
 static void*
 write_mem_address(void *data)
 {
@@ -239,6 +283,9 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
 		igt_info("The scheduling ring only enables one for ip %d\n", ip_type);
 	}
 
+	if (sched_mask > 1)
+		sched_mask_arm(sysfs, sched_mask);
+
 	for (ring_id = 0; ((uint64_t)0x1 << ring_id) <= sched_mask; ring_id += 1) {
 		/* check sched is ready is on the ring. */
 		if (!((1 << ring_id) & sched_mask))
@@ -289,6 +336,7 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
 		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%" PRIx64 " > %s", sched_mask, sysfs);
 		r = system(cmd);
 		igt_assert_eq(r, 0);
+		sched_mask_dirty = false;
 	}
 
 }
@@ -494,6 +542,9 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
 		igt_info("The scheduling ring only enables one for ip %d\n", ip_type);
 	}
 
+	if (sched_mask > 1)
+		sched_mask_arm(sysfs, sched_mask);
+
 	for (ring_id = 0; ((uint64_t)0x1 << ring_id) <= sched_mask; ring_id++) {
 		/* check sched is ready is on the ring. */
 		if (!((1 << ring_id) & sched_mask))
@@ -544,6 +595,7 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
 		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%" PRIx64 " > %s", sched_mask, sysfs);
 		r = system(cmd);
 		igt_assert_eq(r, 0);
+		sched_mask_dirty = false;
 	}
 
 }
@@ -581,6 +633,9 @@ void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t ha
 	} else
 		sched_mask = 1;
 
+	if (sched_mask > 1)
+		sched_mask_arm(sysfs, sched_mask);
+
 	for (ring_id = 0; ((uint64_t)0x1 << ring_id) <= sched_mask; ring_id++) {
 		/* check sched is ready is on the ring. */
 		if (!((1 << ring_id) & sched_mask))
@@ -613,6 +668,7 @@ void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t ha
 		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%" PRIx64 " > %s", sched_mask, sysfs);
 		r = system(cmd);
 		igt_assert_eq(r, 0);
+		sched_mask_dirty = false;
 	}
 }
 
diff --git a/lib/amdgpu/amd_mmd_shared.c b/lib/amdgpu/amd_mmd_shared.c
index 588f2302c..39d4eea68 100644
--- a/lib/amdgpu/amd_mmd_shared.c
+++ b/lib/amdgpu/amd_mmd_shared.c
@@ -4,6 +4,47 @@
  */
 #include "amd_mmd_shared.h"
 
+/*
+ * Static state for sched_mask cleanup when subtests abort out of the
+ * per-ring loop before reaching the normal restore path.
+ */
+static char sched_mask_sysfs[256];
+static long sched_mask_saved;
+static bool sched_mask_dirty;
+static bool sched_mask_handler_installed;
+
+static void sched_mask_exit_handler(int sig)
+{
+	char cmd[1024];
+
+	(void)sig;
+
+	if (!sched_mask_dirty)
+		return;
+
+	sched_mask_dirty = false;
+	snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s",
+		 sched_mask_saved, sched_mask_sysfs);
+	system(cmd);
+}
+
+static void sched_mask_arm(const char *sysfs, long mask)
+{
+	/* Restore stale state first if a prior subtest exited abnormally. */
+	if (sched_mask_dirty)
+		sched_mask_exit_handler(0);
+
+	strncpy(sched_mask_sysfs, sysfs, sizeof(sched_mask_sysfs) - 1);
+	sched_mask_sysfs[sizeof(sched_mask_sysfs) - 1] = '\0';
+	sched_mask_saved = mask;
+	sched_mask_dirty = true;
+
+	if (!sched_mask_handler_installed) {
+		igt_install_exit_handler(sched_mask_exit_handler);
+		sched_mask_handler_installed = true;
+	}
+}
+
 bool
 is_gfx_pipe_removed(uint32_t family_id, uint32_t chip_id, uint32_t chip_rev)
 {
@@ -214,7 +255,7 @@ int
 mm_queue_test_helper(amdgpu_device_handle device_handle, struct mmd_shared_context *context,
 		mm_test_callback callback, int err_type, const struct pci_addr *pci)
 {
-	int r;
+	int r = 0;
 	char cmd[1024];
 	long sched_mask = 0;
 	long mask = 0;
@@ -230,6 +271,9 @@ mm_queue_test_helper(amdgpu_device_handle device_handle, struct mmd_shared_conte
 		sched_mask = 1;
 	}
 
+	if (sched_mask > 1)
+		sched_mask_arm(sysfs, sched_mask);
+
 	mask = sched_mask;
 	for (ring_id = 0;  mask > 0; ring_id++) {
 		/* check sched is ready is on the ring. */
@@ -251,6 +295,7 @@ mm_queue_test_helper(amdgpu_device_handle device_handle, struct mmd_shared_conte
 		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s", sched_mask, sysfs);
 		r = system(cmd);
 		igt_assert_eq(r, 0);
+		sched_mask_dirty = false;
 	}
 	return r;
 }
-- 
2.49.0

