Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC738C55ABA
	for <igt-dev@archiver.kernel.org>; Thu,  6 Aug 2026 02:14:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7364C10E167;
	Thu,  6 Aug 2026 02:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AyquMPLc";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013054.outbound.protection.outlook.com
 [40.93.201.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BAB10E167
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2026 02:12:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKHMUHSVlHD0MMDZn50Lea+AvGO0jLa5OuUJNEzaO3awQ5ddjVUSZy1NSmtWnK9++UiA2oGG61wdx4yv3QnAvY0BoViPNdAMDp3TBZBm3kJyarZJSbgSCnI7tTevLA6uXGsMAvB1Su77Wf4s1hkU7yh3BoHQ5VVeKJ3/CdTdG293keZW4MGfFGvQpkA0OsP7rlaoc9/SPbRLOoWFzkPjPUE3xcprLm6p9pT073KXReFRzo4zmngev1AjDZjgOzJIyx0O122gANoGSJEQ11cwVosTD6AfiqVmO0qD3Wjn1QM3fgzdrKGsTblOB8c6v8SHXwzx1Nws5oOqTjUlJpXmZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVpU6uZfitAH4KArBZCkURkVgFaNY1J402qBmsEpPp8=;
 b=rt2gpMfQ1jcpdtKBBWwMbtwjGjAEL+Yu/oRSk8wDvJbb6dop2iVAtkVHzuy0377/AdwVHGoJ40mwnsEnomM3YSlRrkPBezAWUspvpzt5bAX8Kfeik9TwGXd3nEiuIgQYVtQ3MvTDUfl21BNsv2z/cE080IjzlRPYymNvwY1tpJZRh5ghjKBEL/vtY9XzFtuEhY2E8S6UZ4jfpA1gruwPbnIdeihhIg5wm0cfwr5ro24Ax23P8DRQmBkvzzdPXbbKY48PKDjnSxjUviHRb2PEeZpBzTVABXlSZTvxdQVPlqq0PG3qvbcdC6car48+oR6nmJVBDEk17mhdpw/bWNAN0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVpU6uZfitAH4KArBZCkURkVgFaNY1J402qBmsEpPp8=;
 b=AyquMPLcDGF0Q2IhjJzR/S5LtHv8Mf5SbaNE2tJqP0pGAr+LpUVgvsxjNIpQX1eUvZpuPNHPDtId+1Qd1uf+spWZ+l0QHBQdEss7+nSfRnKL3vBOPxfmy/k2ZQJrZ0qIwuYqBIqOLvR4H6/Vp3ZeJVYDLCAye0sd9EDOSinjXLM=
Received: from BN1PR10CA0019.namprd10.prod.outlook.com (2603:10b6:408:e0::24)
 by SJ1PR12MB6290.namprd12.prod.outlook.com (2603:10b6:a03:457::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 02:12:37 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:e0:cafe::41) by BN1PR10CA0019.outlook.office365.com
 (2603:10b6:408:e0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Thu, 6
 Aug 2026 02:12:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 02:12:37 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 5 Aug
 2026 21:12:36 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 5 Aug 2026 21:12:35 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <simona@ffwll.ch>,
 <jesse.zhang@amd.com>, <christian.koenig@amd.com>,
 <alexander.deucher@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH v5 2/2] tests/intel/gem_change_handle_race: Add edge-case and
 functional subtests
Date: Wed, 5 Aug 2026 22:12:11 -0400
Message-ID: <20260806021232.200317-3-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260806021232.200317-1-vitaly.prosyak@amd.com>
References: <20260806021232.200317-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|SJ1PR12MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: f4274d9f-703c-4aa7-8ae6-08def3602f85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|23010399003|1800799024|376014|36860700016|56012099006|6133799003|22082099003|18002099003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: gRTzASoylaJCTMrPok3DbbiUPEXGn9UKYc5OpfPW33/BDwBE2YFi6uPa1Ib6hwTadzw6BjLL7sW0AQTIpXl2fucEed8Pd5WlxO2/h1GDSXk4kUK5lP9e2RMuJcdMa1Ico7XcxIBiWS4Tzt8p4pT6+NPqZ3uY/YmKknD/YgtVhbh7hDZ9Rr5/emXl5Xp8fl5u/n2k8qsD+b+Tb25/q+M2UjxWNIRHoT+StMqN+XfylU9z1up8pG70J3CrXCsEZrqRI+w7Z4LegKsI+6mx6kFwC2C2ophFd1sKaeA++sIEN5gowhM6FDDY4/fdjay4Tcm3IBpI+co4QfYts51xL04lOZ9QgtAJ7UPRlx49U7zv9U897PQ4jc6VROV63fM5km5sH6Xm1ZQpIMf62HvwMx0wh+i/j36qQ5DikM7NtZGia1eSPbbLgSsRbhpZeNVWAOyA/DJj1L8vbbCQOnmJTqVYdK900TZf5U978TkPmPRoOAe1mcEwuKwyI9ErAXIvPJDMdSSszMFHVvsyVeNpp7cpOtC3yYf2Ubosl7lhBw+iPdjquiBE4VA9wStzcSUH/1wALgQgUEMfd5vlEz+tpdCXBaGehDJwh8fdi1HzqYEx+BrQvCUc9MGSaUrk3bFTzQpPI6Kg2FLtW6FjphOj5i0h4I7QX5mbHRCliMjC1v90FHwRAfxrplVD8hQagLJaw5jFVZqZDinWIUGrMaVY7YYTRg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(36860700016)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XKrtXNHS36mM1u/7c80golAu4keoGOqBgqAttB/FzlQjUT/NLgiExN9V5aq3T5FUP4+DTJylih3HpDcgnAcqI5GRi3cjcW6bClhv2zneruKYQ9g4L0wKs2knQAKCxyMOZ+vY61opaaTnS4JyYB2J+7T23NDGPPqkEAx/JE7TOCldY+41F0lHJbXwOG7Jgl5Xu4w1nrvQ8YcMlW+zNNtIy7nYQko+0kE4NSatMEA6+4f6J2TAdZk7K5ad/uvK80HHYQdn/snHb3ANA8fJSzCjtRI9zMtP8ibQcrWM6KzxadBmYrmFzBOnIGxcxgGEVhzgfW2kKrzLcx02a2fBn97qLWxqHLzStfga+MKS8vLQUXx7r8H5Yak6t+1hqgfxHsFjV83wbgErtc64EoNd61nmeoaRkcuAAqsFLDFQyuRMqdtT/a0wPkRcLLnpSLkPJCtO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 02:12:37.2460 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4274d9f-703c-4aa7-8ae6-08def3602f85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6290
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

Extends gem_change_handle_race test suite with 5 additional subtests
covering edge cases and functional verification of the
DRM_IOCTL_GEM_CHANGE_HANDLE ioctl.

New subtests:
 - noop-same-handle: Verifies handle == new_handle is a noop
 - invalid-new-handle-exceeds-int-max: new_handle > INT_MAX returns -EINVAL
 - invalid-handle-nonexistent: Non-existent handle returns -ENOENT
 - edge-new-handle-zero: Documents kernel behavior for new_handle == 0
 - functional-rename-verification: Verifies actual rename operation works

These tests complement the race condition testing from the first patch
by validating error handling and functional correctness.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Simona Vetter <simona@ffwll.ch>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
v5 changes (addressing Kamil Konieczny's review feedback):
 - Moved version changelog to after --- (not in git log)

v4 changes:
 - This patch is now completely clean: only adds 5 new test functions
 - No modifications to patch 1 code (all fixes moved to patch 1)

v3 changes:
 - Sanitized test names and comments per Kamil's feedback
 - Added comprehensive edge-case coverage

v2 changes:
 - Added these 5 subtests to complement v1's race tests

v1:
 - Not present (only 7 race tests in v1)

 tests/intel/gem_change_handle_race.c | 173 +++++++++++++++++++++++++++
 1 file changed, 173 insertions(+)

diff --git a/tests/intel/gem_change_handle_race.c b/tests/intel/gem_change_handle_race.c
index f4b00c65e..3d85009ee 100644
--- a/tests/intel/gem_change_handle_race.c
+++ b/tests/intel/gem_change_handle_race.c
@@ -1729,6 +1729,159 @@ static void test_race_close_before_lock(struct gpu_ctx *ctx)
 		     race_wins, iterations);
 }
 
+/**
+ * test_noop_same_handle - handle == new_handle should be a noop
+ *
+ * When old handle equals new handle, the ioctl should return success
+ * without modifying anything.
+ */
+static void test_noop_same_handle(struct gpu_ctx *ctx)
+{
+	uint32_t handle;
+
+	handle = gem_create_bo(ctx, 4096);
+
+	/* Renaming to the same handle should succeed (noop) */
+	igt_assert_eq(gem_change_handle(ctx, handle, handle), 0);
+
+	/* Handle should still be valid */
+	igt_assert_eq(gem_close_bo(ctx, handle), 0);
+
+	igt_info("  PASS: handle == new_handle is a noop\n");
+}
+
+/**
+ * test_new_handle_exceeds_int_max - new_handle > INT_MAX should fail
+ *
+ * The kernel enforces idr_alloc() limitation: new_handle must be <= INT_MAX.
+ */
+static void test_new_handle_exceeds_int_max(struct gpu_ctx *ctx)
+{
+	uint32_t handle;
+	int ret;
+
+	handle = gem_create_bo(ctx, 4096);
+
+	/* new_handle > INT_MAX must fail with -EINVAL */
+	ret = gem_change_handle(ctx, handle, (uint32_t)INT_MAX + 1);
+	igt_assert(ret < 0);
+	igt_assert_eq(errno, EINVAL);
+
+	/* Also test 0xFFFFFFFF */
+	ret = gem_change_handle(ctx, handle, 0xFFFFFFFF);
+	igt_assert(ret < 0);
+	igt_assert_eq(errno, EINVAL);
+
+	/* Original handle should still be valid */
+	igt_assert_eq(gem_close_bo(ctx, handle), 0);
+
+	igt_info("  PASS: new_handle > INT_MAX returns -EINVAL\n");
+}
+
+/**
+ * test_invalid_handle - non-existent handle should fail
+ *
+ * Using a handle that doesn't exist should return -ENOENT.
+ */
+static void test_invalid_handle(struct gpu_ctx *ctx)
+{
+	int ret;
+
+	/* Use a handle that was never allocated */
+	ret = gem_change_handle(ctx, 0xDEAD, 0xBEEF);
+	igt_assert(ret < 0);
+	igt_assert_eq(errno, ENOENT);
+
+	/* Handle 0 is also invalid */
+	ret = gem_change_handle(ctx, 0, 100);
+	igt_assert(ret < 0);
+	igt_assert_eq(errno, ENOENT);
+
+	igt_info("  PASS: invalid/non-existent handle returns -ENOENT\n");
+}
+
+/**
+ * test_new_handle_zero - new_handle == 0 (unhandled case)
+ *
+ * Dave got a report that new_handle == 0 is not properly handled.
+ * Document the current kernel behavior.
+ */
+static void test_new_handle_zero(struct gpu_ctx *ctx)
+{
+	uint32_t handle;
+	int ret;
+
+	handle = gem_create_bo(ctx, 4096);
+
+	/*
+	 * new_handle == 0: This is an unhandled edge case.
+	 * Handle 0 is typically reserved/invalid in DRM.
+	 * The kernel should reject this with -EINVAL.
+	 */
+	ret = gem_change_handle(ctx, handle, 0);
+	if (ret < 0) {
+		igt_info("  new_handle=0 rejected with errno=%d (%s)\n",
+			 errno, strerror(errno));
+		/* Expected: kernel rejects handle 0 */
+		igt_assert(errno == EINVAL || errno == ENOENT || errno == ENOSPC);
+		/* Original handle still valid */
+		igt_assert_eq(gem_close_bo(ctx, handle), 0);
+	} else {
+		/*
+		 * If kernel allowed it, the object moved to handle 0.
+		 * This is arguably a bug - document it.
+		 */
+		igt_warn("  WARNING: kernel allowed new_handle=0 (may be a bug)\n");
+		/* Old handle should be gone */
+		igt_assert(gem_close_bo(ctx, handle) < 0);
+		/* New handle 0 should exist */
+		igt_assert_eq(gem_close_bo(ctx, 0), 0);
+	}
+
+	igt_info("  PASS: new_handle=0 edge case handled\n");
+}
+
+/**
+ * test_functional_rename - verify rename actually works
+ *
+ * After a successful rename:
+ * - GEM_CLOSE(old_handle) must FAIL (handle no longer exists)
+ * - GEM_CLOSE(new_handle) must SUCCEED (object is there)
+ *
+ * Simona suspects the merged version of Francis' patch may have broken
+ * this fundamental behavior.
+ */
+static void test_functional_rename(struct gpu_ctx *ctx)
+{
+	uint32_t handle, new_h;
+	int ret;
+
+	handle = gem_create_bo(ctx, 4096);
+	new_h = handle + 1000; /* Pick a handle far away to avoid collisions */
+
+	/* Perform the rename */
+	ret = gem_change_handle(ctx, handle, new_h);
+	igt_assert_f(ret == 0,
+		     "gem_change_handle(%u -> %u) failed: %s\n",
+		     handle, new_h, strerror(errno));
+
+	/* Old handle must be invalid now */
+	ret = gem_close_bo(ctx, handle);
+	igt_assert_f(ret < 0 && errno == EINVAL,
+		     "GEM_CLOSE(old_handle=%u) should fail with EINVAL, "
+		     "got ret=%d errno=%d (%s)\n",
+		     handle, ret, errno, strerror(errno));
+
+	/* New handle must be valid */
+	ret = gem_close_bo(ctx, new_h);
+	igt_assert_f(ret == 0,
+		     "GEM_CLOSE(new_handle=%u) should succeed, "
+		     "got ret=%d errno=%d (%s)\n",
+		     new_h, ret, errno, strerror(errno));
+
+	igt_info("  PASS: rename works - old handle invalid, new handle valid\n");
+}
+
 int igt_main()
 {
 	struct gpu_ctx ctx = { .fd = -1 };
@@ -1788,6 +1941,26 @@ int igt_main()
 	igt_subtest("race-close-before-lock")
 		test_race_close_before_lock(&ctx);
 
+	igt_describe("Edge case: handle == new_handle should be a noop");
+	igt_subtest("noop-same-handle")
+		test_noop_same_handle(&ctx);
+
+	igt_describe("Edge case: new_handle > INT_MAX must return -EINVAL");
+	igt_subtest("invalid-new-handle-exceeds-int-max")
+		test_new_handle_exceeds_int_max(&ctx);
+
+	igt_describe("Edge case: non-existent handle must return -ENOENT");
+	igt_subtest("invalid-handle-nonexistent")
+		test_invalid_handle(&ctx);
+
+	igt_describe("Edge case: new_handle == 0 (unhandled case reported to Dave)");
+	igt_subtest("edge-new-handle-zero")
+		test_new_handle_zero(&ctx);
+
+	igt_describe("Functional: verify rename moves object from old to new handle");
+	igt_subtest("functional-rename-verification")
+		test_functional_rename(&ctx);
+
 	igt_fixture() {
 #if HAS_AMDGPU
 		if (ctx.driver == DRIVER_TYPE_AMDGPU && ctx.amdgpu_device)
-- 
2.54.0

