Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD55C44515
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 01:17:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DDA10E240;
	Tue, 21 Jul 2026 01:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FKNd4DcB";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011018.outbound.protection.outlook.com [52.101.57.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F93610E240
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 01:17:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEtH+lwqGB62tHHDd4mDKgQA1KUxeMNK3Bo2U3ONPNiugYnbqteAGvLgqI49QgHefLpqXMvQiAOd+Ohmo0zXPr8Z7vzCprRUbKwNBKO2AC1evjIiG5ILtGvJouWy2AE4Zk9+JTEDzDvoMpDOj/69t4sDqUPMFhLXK39oNtFTvXAzrlngKJDT/4CXJI1+nxOmHwQtEJwoUNRE8u8lTGkkcEN812SDMzYX2Im/99VULCyIzZ83bjy09o+6LoUS1ZN8uf3K9Cp5BOztCql6q0VFQWxTx+0idRDaZqpwQC9WkndVMfEMBfOLNvvzsT8kJXNwBAjzIZ6V7k1NoDw7KNtdmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ifz3+5/QUbDW62OmgJWnu8fprGvGqkovlL222VWXb2Q=;
 b=NME1VKt1Lqv5fw62l67bJa9A+EwmQN1f0lCfEkQmK2qW1VujuUWUjPoppxN0JszekqKlMx/lDG6WrMB6ASsLkUswyqcR+ghKgPLrIO3u6hJ2dEB+aJ+qKH5xXlo0VRYPc/4B8z4sF4CcO0fRZZDqqtJofFwxzZ6Z2dW6amnQVT3bpAUiPaaVbpZ8dzZH7o6KaUCQWvLYEQ5kh8PfW23R55dOXYxjFoYlAd1oBZoAB1UMRVoTTz4KLjKBRwz/U6MD1gBwIZd6foS987zypyr6F2jHG8ynLQJG0JXf4nFEV0rtVabowNLFcXSot70w+BxloXE0V/Nryj4oKhfwjnEOog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ifz3+5/QUbDW62OmgJWnu8fprGvGqkovlL222VWXb2Q=;
 b=FKNd4DcBSAMStA6JXb4rzs2Cn9OuLTsV3vh3Gzy6ViDGqmuCnfJTqosBx3eOgfALYcbaPRTSk+4YQoLdn3UreaMwc0aIbgOgggSelo2PEtQEVRqkG0E/3+pkKolqDeqeNnd/F/piHFzEDUlG3FJ22xzRQacjkQV3z0dIE5Rl6cw=
Received: from MN0P222CA0029.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::34)
 by SN7PR12MB8770.namprd12.prod.outlook.com (2603:10b6:806:34b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:16:57 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:531:cafe::c) by MN0P222CA0029.outlook.office365.com
 (2603:10b6:208:531::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.18 via Frontend Transport; Tue,
 21 Jul 2026 01:16:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 01:16:57 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 20 Jul
 2026 20:16:57 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 20 Jul 2026 20:16:56 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Mikhail Gavrilov
 <mikhail.v.gavrilov@gmail.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>
Subject: [PATCH] tests/amdgpu: Add lockdep false positive reproducer test
Date: Mon, 20 Jul 2026 21:16:39 -0400
Message-ID: <20260721011649.123160-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|SN7PR12MB8770:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d315cfc-1b1e-4e49-2bf6-08dee6c5c242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|6133799003|11063799006|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: Zd1j6IgT4Gm4WKGFmHb6eRdoaVr+0gMBuw2MdM9gcBwzO89UjR1weoyu5oBvcU29B5Un8Y4i16WgX+Eq1IDV7ucH2RqcylZqL8NjviJxJnXKOmjO2uIrucSXgXEV4b1f3WtkHVNupmD8RPbjRl3irdwQQ+vv1sKGnr+RzwBQ7y/eMqHG2HwaTf9uW8Up9Gf1JEApl7Glvl+T5kF4q8vj5bHd2fC4SGTp4fZL+ZczuLrZBvFdt28j9S8v5KOdHttAvqgMR4cJ/e8+VBg+5w3/XOCLZ29uyu/synt6hf8wuuU56jJPcX7iGXgZuLhp+WZe/FAax3NEM1VgMDwAXc11aRiEdI6+HgaKqOniZ1FA/aS2cUFYuX80DOlwzUUa+Eg56Llj/AGDndkdz98zN0T4r+KKLPcxoASbenyfRN7Oe+PbphcMYZDnym8muukGlA7SQ7/mXnetwrxWT5LuNFHa2C5w9KkTcatvR5TET/5wf6EDmjVZooE/gNrPbD5goVqikqZ+B+6cccZGlNiunz9EZUOWyc9wNVwtivKmfHGN6cnZ7yjwkD6eHSL5cQDqJpxpg1dnc/CRrJhin5HqKBansM8y1yznPj5xEV7yR2zyeTkZgIkpTod+Q24dlH7NhFNPjkp/8jaM8HtDJrHi+VjFJwhjbFJPTYlizYT3b0sVxqXE+cZyDzVccemL17vgvRzSZHHiyJz7hL1bi1qP5319zw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(6133799003)(11063799006)(10067099003)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MOWWDuRLoPB1RDZpKUs0PH/hIidIVp9TRl/WoPGj8b+3/kDaYNcHvK7lgzQZYL4RP5NexpSRhrUbVg6rkd1e35/cdXG7cF5GKeEZsvUtsMbi/9FBk32z40emdydoSTcJ+nmnWbhLboUE+AfxMSdXk4/NuZBjY/i0GaBWUnQsT9a3c11TPZuONUjoBHJ++JxYleJHqBsVglrTUk3WdfoIW4+E27MGbePiveDD9YucEOZXaJ7Xz24pKODJR/vXSYltGAHrXOQnN1V/v63KBt5A5BGHeFTP4lgwEN9JakNRVDGbtA7EXOXHV0y+kxZrcCSvstRdsDvZ9Sh7UKIElqXtkbNMtrrxYYBuJcka3geOxZ5Aw7CtE4D5Hwqwl7bqzAFDtvt0sdO1bOgp9Eah2EmvAdOF1veYk0YuTetvcSU/SWxECCTMGrXUfK3CRloFsp0c
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:16:57.4809 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d315cfc-1b1e-4e49-2bf6-08dee6c5c242
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8770
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

Add notifier-reclaim-splat subtest to amd_lockdep that reproduces
the lockdep false positive circular dependency warning reported by
Mikhail Gavrilov.

The test is based on Mikhail Gavrilov's standalone reproducer code.
It creates a 64MB GPU userptr memory buffer, then repeatedly forces
the kernel to reclaim it by issuing madvise(MADV_PAGEOUT). This
simulates memory pressure and triggers the MMU notifier callback
path (amdgpu_hmm_invalidate_gfx) from within the reclaim context.

The test exposes the lockdep false positive where amdgpu_lockdep_init()
incorrectly taught lockdep that fs_reclaim can be acquired while holding
notifier_lock, when the runtime path actually takes notifier_lock under
fs_reclaim (the opposite direction).

Test behavior:
  Before kernel fix: Lockdep splat on first reclaim attempt (iteration 1/8)
  After kernel fix:  All 8 iterations complete without warnings

The test monitors dmesg for lockdep violations and reports them to the
user with detailed explanation of the kernel bug and required fix.

Run with:
  sudo ./build/tests/amdgpu/amd_lockdep --run-subtest notifier-reclaim-splat

Requires:
  - Kernel built with CONFIG_PROVE_LOCKING=y (lockdep enabled)
  - Fresh boot (lockdep disables itself after first splat)
  - AMD GPU with amdgpu driver

The corresponding kernel fix is:
  drm/amdgpu: Fix lockdep false positive in amdgpu_lockdep_init

v2: Credit Mikhail Gavrilov properly:
    - Fix author name: Michael -> Mikhail Gavrilov in Based-on-patch-by
    - Add note about corresponding kernel fix in commit message

Based-on-patch-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_lockdep.c | 123 +++++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/tests/amdgpu/amd_lockdep.c b/tests/amdgpu/amd_lockdep.c
index 48d7ccafa..8edae507c 100644
--- a/tests/amdgpu/amd_lockdep.c
+++ b/tests/amdgpu/amd_lockdep.c
@@ -20,6 +20,7 @@
  *   concurrent-mmap-and-evict    - mmap/munmap while VRAM eviction runs
  *   concurrent-userptr-and-reset - USERPTR invalidation during reset
  *   stress-all-paths             - Combined stress of all paths
+ *   notifier-reclaim-splat       - userptr + MADV_PAGEOUT (Michael Gavrilov)
  */
 
 #include <errno.h>
@@ -42,6 +43,10 @@
 #define STRESS_ITERATIONS 100
 #define THREAD_RUNTIME_SEC 2
 
+/* For notifier-reclaim-splat test */
+#define USERPTR_BUF_SIZE (64ull * 1024 * 1024) /* 64 MiB */
+#define PAGEOUT_ITERATIONS 8
+
 /* kmsg patterns that indicate lockdep violations */
 static const char *lockdep_violation_patterns[] = {
 	"circular locking dependency",
@@ -478,6 +483,120 @@ static void test_stress_all_paths(int fd, amdgpu_device_handle device)
 	close(kmsg_fd);
 }
 
+/* For notifier-reclaim-splat test */
+#define USERPTR_BUF_SIZE (64ull * 1024 * 1024) /* 64 MiB */
+#define PAGEOUT_ITERATIONS 8
+
+/*
+ * test_notifier_reclaim_splat - Michael Gavrilov reproducer
+ *
+ * Triggers the false positive lockdep splat by:
+ * 1. Creating anonymous memory buffer (64MB)
+ * 2. Registering it as AMDGPU userptr (installs MMU notifier)
+ * 3. Forcing memory reclaim with madvise(MADV_PAGEOUT)
+ * 4. Reclaim path calls MMU notifier which takes notifier_lock under fs_reclaim
+ * 5. Lockdep sees circular dependency with the false edge from amdgpu_lockdep_init
+ *
+ * Expected behavior:
+ * - BEFORE kernel fix: lockdep splat in dmesg (test FAILS)
+ * - AFTER kernel fix: no lockdep splat (test PASSES)
+ */
+static void test_notifier_reclaim_splat(int fd)
+{
+	void *buf;
+	struct drm_amdgpu_gem_userptr userptr = {0};
+	int ret;
+	int kmsg_fd;
+	bool violation_found = false;
+	unsigned long taints = 0;
+
+	igt_info("Creating %llu MiB anonymous buffer\n", USERPTR_BUF_SIZE / (1024 * 1024));
+
+	buf = mmap(NULL, USERPTR_BUF_SIZE, PROT_READ | PROT_WRITE,
+	           MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	igt_assert(buf != MAP_FAILED);
+
+	/* Fault all pages in */
+	igt_info("Faulting in all pages\n");
+	memset(buf, 0xa5, USERPTR_BUF_SIZE);
+
+	/* Open kmsg to monitor for lockdep violations */
+	kmsg_fd = kmsg_open();
+	igt_assert(kmsg_fd >= 0);
+
+	/* Register as userptr - this installs MMU notifier callback */
+	igt_info("Registering as userptr BO - installs MMU notifier\n");
+	userptr.addr = (uint64_t)(uintptr_t)buf;
+	userptr.size = USERPTR_BUF_SIZE;
+	userptr.flags = AMDGPU_GEM_USERPTR_ANONONLY |
+	                AMDGPU_GEM_USERPTR_REGISTER |   /* Install mmu_interval_notifier */
+	                AMDGPU_GEM_USERPTR_VALIDATE;
+
+	ret = igt_ioctl(fd, DRM_IOCTL_AMDGPU_GEM_USERPTR, &userptr);
+	igt_assert_eq(ret, 0);
+
+	igt_info("Forcing reclaim with MADV_PAGEOUT - triggers MMU notifier under fs_reclaim\n");
+
+	/* Force reclaim - this triggers the lockdep splat on vulnerable kernel */
+	for (int i = 0; i < PAGEOUT_ITERATIONS; i++) {
+		igt_info("  Iteration %d/%d: madvise MADV_PAGEOUT\n", i + 1, PAGEOUT_ITERATIONS);
+
+		ret = madvise(buf, USERPTR_BUF_SIZE, MADV_PAGEOUT);
+		igt_assert_eq(ret, 0);
+
+		usleep(50000);  /* 50ms - give kernel time to process */
+
+		/* Check for lockdep violations */
+		if (kmsg_has_lockdep_violation(kmsg_fd)) {
+			violation_found = true;
+			igt_warn("LOCKDEP VIOLATION DETECTED during iteration %d\n", i + 1);
+			break;
+		}
+
+		/* Re-fault pages for next iteration */
+		memset(buf, 0xa5, USERPTR_BUF_SIZE);
+	}
+
+	close(kmsg_fd);
+
+	if (violation_found) {
+		igt_info("\n");
+		igt_info("================================================================\n");
+		igt_info("LOCKDEP SPLAT DETECTED - This is EXPECTED before kernel fix\n");
+		igt_info("================================================================\n");
+		igt_info("\n");
+		igt_info("The kernel has a FALSE POSITIVE lockdep bug:\n");
+		igt_info("  File: drivers/gpu/drm/amd/amdgpu/amdgpu_lockdep.c\n");
+		igt_info("  Function: amdgpu_lockdep_init() around line 176\n");
+		igt_info("  Problem: fs_reclaim_acquire called while holding notifier_lock\n");
+		igt_info("\n");
+		igt_info("This teaches lockdep a FALSE edge: notifier_lock -> fs_reclaim\n");
+		igt_info("Runtime reality: fs_reclaim -> notifier_lock (opposite direction)\n");
+		igt_info("\n");
+		igt_info("FIX: Move fs_reclaim_acquire to BEFORE all mutex acquisitions\n");
+		igt_info("     in amdgpu_lockdep_init\n");
+		igt_info("\n");
+		igt_info("See: /home/vprosyak/Documents/IGT/LOCKDEP_ISSUE/\n");
+		igt_info("================================================================\n");
+		igt_info("\n");
+	} else {
+		igt_info("\n");
+		igt_info("================================================================\n");
+		igt_info("NO LOCKDEP VIOLATION - Kernel fix appears to be working!\n");
+		igt_info("================================================================\n");
+		igt_info("\n");
+	}
+
+	/* Cleanup */
+	munmap(buf, USERPTR_BUF_SIZE);
+
+	/* Check kernel taint flags */
+	igt_kernel_tainted(&taints);
+	igt_assert_f(!(taints & (1ul << TAINT_WARN)),
+	             "Kernel is tainted - lockdep violation detected\n");
+}
+
+
 int igt_main()
 {
 	amdgpu_device_handle device;
@@ -522,6 +641,10 @@ int igt_main()
 		test_stress_all_paths(fd, device);
 	}
 
+	igt_describe("Michael Gavrilov reproducer: userptr + MADV_PAGEOUT triggers fs_reclaim cycle");
+	igt_subtest("notifier-reclaim-splat") {
+		test_notifier_reclaim_splat(fd);
+	}
 	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
-- 
2.54.0

