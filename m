Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C89C43458
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 03:25:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045D110E126;
	Fri, 10 Jul 2026 03:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ljao7Qvo";
	dkim-atps=neutral
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012015.outbound.protection.outlook.com [52.101.53.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878F510E126
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 03:25:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dTv4zB6j2+xIBWJei5y1lKhn2JfSkPdI0gp79wQFWFn9HpBlzJXCZacRouRU4qJegacyMjQEHe0V/8JB7qnYVVFkpEULgFGnXh+4pXzN5RimEH4h1HGfRl7aFy8OyXC/aOqjCzz4Ug4GIqL+j0Rnk0DjdaXI5MlzACPbATZvS6ZtRI912jk9kBwhYeyqr1YLekucs+wfQWKBZV9JKwst5tOy4EmwWnBRzyP7S13eYmTPiforMtp+2b2UisTb6HsTpLbfA5IpW8Tu5gxr7JvDQSFItbGDpXNyUh9Q/QyeWgKs54NtocuvDgrfgzq4kn762U7qTLLGC+lm3qEghIhh0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=it1g5c5EcQo1yRwTp98/4sM1DiQQNPcEA8OLkDPgb9Q=;
 b=rtTwMkJAT5XswsGeAAZjoHGtutqqwFvd8U/etqoRUWGYtGaZqtA5Yp6QqSRR997O+ZWNmQbjP6zxZDcj7HaPHL5Np1881QwJqzOTze1KZvfvAzlwlKfpTa3FIk3eE/9qy7zxAczJob0Ajn5xU8lHF/ajKuzaqIy1L1Zzc/03AuTN5MMBjduRGsf+oQ6G6zeO0syS+54G6yhJE6f59A23qF++vSgIklPsvq0ZuM7vhG1D4AIKwl/5Jc9pLRRpEaq8aWOvB4oXun5rBvh12CAWFa9mnEYc1XIftNoDwCIRahaqnmJe8M7VA9eLhwMMbN07+5znlkuaq36O2C5Z58NLwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=it1g5c5EcQo1yRwTp98/4sM1DiQQNPcEA8OLkDPgb9Q=;
 b=ljao7QvoQVEfgcdU2xhhpWhWJK9TuYV1U8sITmdHQwJJEL+iWxzu/qLRK4JF/n5o1Z5+/n2Z+tr3IGXzgnwB5xdPWXrg1+SS6e1PacnspvOzDCdwMyfcAFJGnW0mC70rr7/oJS+mzyiikncWaHUVWiqW/yXSxDAobeYbSJdXKa8=
Received: from SJ0PR03CA0368.namprd03.prod.outlook.com (2603:10b6:a03:3a1::13)
 by SA1PR12MB8143.namprd12.prod.outlook.com (2603:10b6:806:333::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Fri, 10 Jul
 2026 03:25:13 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::a4) by SJ0PR03CA0368.outlook.office365.com
 (2603:10b6:a03:3a1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.12 via Frontend Transport; Fri,
 10 Jul 2026 03:25:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 03:25:12 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 22:25:12 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 22:25:11 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Michael Gavrilov
 <mikhail.v.gavrilov@gmail.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>
Subject: [PATCH] tests/amdgpu: Add lockdep false positive reproducer test
Date: Thu, 9 Jul 2026 23:24:54 -0400
Message-ID: <20260710032510.215808-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|SA1PR12MB8143:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c2aa9d9-ae1f-48a7-f80e-08dede32da9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|11063799006|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: t46caX4hi4Vato+RnC4JejgFmRna9DdLXVPZTViHyd3hC/s4PdrRlJxzMP0VMyiUUlXamtQXNBxduAPLRl89OfE0Gys10TIIMjwwDe4FEj4WoYdT/PeXFAGd5m/OlNn4/IaolPKDttig8TfvMvjYdbkIVFkbFwiuMEddrSdcx9n/9OSOpKcRgBm84q2Fz12kCCyipsfPCCaa9GhQK3oFj3JX94kReWTMw2ws7EbI/FVkeTFs+t1ZQYb5Z9H86/3ncJKaC/z18hOJc9xvHQJrkd2POHchRo5JZhV6Xw9TRoI5/CQdJAWdxN7KpLFrhZUduEt50H/EN0wIhHAz08YDl5vQm7zigJTHhbDYKF6YIf5JRg5D66kCUR24zF7+10CdHOmV2oeZJplBrRfJX4B1+UPMqVab6FPJDbPr8EA0SJ/ESu0tdNiEGK7vSsFseJRezewEk2rcQgjm/FCm7AdjJBPiPBdFOb2tthTolm0cdo+pKXRLBoH9kwvEUG5EuveIYc70Bq2ZBGYFaBp1aoeEzW00Z7ftwy/eu8pkhy2J8vb/yZfqyNW/gAdGkiDZ5WUp/j5ASDRti5voZGtJAXqlPbH1UmgTYQVUPwVt32Fzq6g9X6aeWuowGcDdbRel9Ontnz3+tMg25kYD61TNcLpLmIUcGGtcBqFQgcFKjbpqC/w+3iCwgBCfy42+aBCQKniLDvKi5cDumhXCTmCcrQie9A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(11063799006)(56012099006)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bD49n9YjVJt13EzkCKSdk4Y4eGvdSq3f9gbd8vA4E06flsITddA3pJDm+ssgcaWg0psVCXQUUvVmIvcFpL+MHD81EvP9yz+xnAx5Zyf52B8TnmgfLfHwgcmzWT09Xc+Kw4yUCgbW6u+1fDHO2mQXg8TbmYSvclsfMCKOS5o0iFoqWSMcDUEUVgscevVim08Lpwz+wzxRAIOFjo0q/VgzzTqDveU7TRE5iDFyxO8pKdCMzNqyNas6SWQM/9Ej4wlYFDCuHdnha4GzXwV0uF7BGRkktUebAtxBnKVP5op7TmdQm9yq9uNoNyYY16Tl1Gtm3YzOvIquewcMaE11bwNESqB+J5qhTEhZLFW1+miv/q5fCId71uvZF1yL2b9IB/N1BzGqOcvNfQbypT2aPjxOZB4Veo+F3ph5qcLALaXBFULBk8EIzQbp4L2IeoSanxUI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 03:25:12.9955 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c2aa9d9-ae1f-48a7-f80e-08dede32da9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8143
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
Michael Gavrilov.

The test is based on Michael Gavrilov's standalone reproducer code.
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

Based-on-patch-by: Michael Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
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

