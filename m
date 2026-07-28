Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2347CC53219
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 03:31:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B471E10E509;
	Tue, 28 Jul 2026 03:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="n8jB59IZ";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010003.outbound.protection.outlook.com [52.101.201.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B35D10E509
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 03:30:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fsz7VTJvpdfpx1h2LtNnMBy43Gd3nr4Bci+wgfIIrHmDsosGUjNZD6XSdqZB1vycv6wTaQsdjheJ43Q01jLZ0Rwb9Zdiq5vA7hdfyfkboTWhKy0YzU8b7JwVmToSHPblqxBHya3LI4+8l63urb3uCnGuU1eLDYp5SVHpGmZmCfc59/vq3C2IqXMhtXMxHTHwzA+WMBKqf1J74uKCv9hA4g+smpHZMCOp6cRdFSaItJwmahXo6yJaWCBNLRyuV2F1h3E7njPubP6S8GkhkVwMrshfuffudlBwefmfJI6xFTfcMzitNY2Ta8m0Ea3bovIqXigFnkXZ5Zovdl3mBraDJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLmVhOEGcPImVTdTqo0vog/esZWaR+vkAutCMZCDYRY=;
 b=WRC8U8Ve7UVwnWg+I2VgtILZzZHw1WIU0r8/6YyZWpZFA3jOvxMz9y47vm/N/md1b1zmqXxl8GWDtJqTRdkcxk5hmt2pLCdg2Vll1OL9Kt8BUVapjYYstZS4Z2fDkGyV6Nl347sLLBgdjISywMIj/I/+UlixzZjtVo3aYOMExMMyAXj/C5X0j8D+YGhN1ZNWOcE4nQcrtdeLanCvlgMGuJsUghLrlqSk5sOP//9+aSjGEUINEuYqu+anRhFVYwgUdTOyYxHej+giHNNeh020rAO8Xi/vdtyT3GWiRbdVuRClNmGa7H5FqlRn49t5TyNWoG4VaU5P8ko83ULJLogd7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLmVhOEGcPImVTdTqo0vog/esZWaR+vkAutCMZCDYRY=;
 b=n8jB59IZRU6YMHGo6622ygJApLI4/KqBUXqKM/MdDP2Mi2L9NJJzq0krhv10eT4CaEbsn61+sdAn4qy+CUT4AEKcKk/9JFxc++hvxhtikxuhZn4USmbTRJBMtDcrelOYhg5fCqNTxHFOlMqLkuN3RYIEGZplzAw4YMC9U3Tih+Y=
Received: from BN9PR03CA0478.namprd03.prod.outlook.com (2603:10b6:408:139::33)
 by PH8PR12MB7112.namprd12.prod.outlook.com (2603:10b6:510:22c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 28 Jul
 2026 03:30:09 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:139::4) by BN9PR03CA0478.outlook.office365.com
 (2603:10b6:408:139::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 03:30:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 03:30:08 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 27 Jul
 2026 22:30:06 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 27 Jul 2026 22:30:05 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Simona Vetter <simona@ffwll.ch>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang functional subtests
 <jesse.zhang@amd.com>
Subject: [PATCH v4 2/2] tests/intel/gem_change_handle_race: Add edge-case and
Date: Mon, 27 Jul 2026 23:29:24 -0400
Message-ID: <20260728032949.171432-3-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728032949.171432-1-vitaly.prosyak@amd.com>
References: <20260728032949.171432-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|PH8PR12MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e414ce8-241e-49d9-3517-08deec58866c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|36860700016|376014|82310400026|11063799006|56012099006|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Zs+qpzt+2ttLSYFaBYYKS71M2b678v1oGS30od2bnCCqd1KKwHKSJ/kN6rKrSIRTjpkgoOjEWafH+px6V5hjwGLA8YYqFPhqsquPVA7wdw2XaJolff+cPKQ3k6IWEocEjk1voF/qAWNwMclYiEigyGhMaYrRmR/yjZTmk8jJwgjqLGfW9DcbJgC4RIt1IS6NOhaRc0SEqg8LZj70TM+NCqdjVoQz6WO7Z3Ge6/UxGMZu2G02Vm/6NegNbt2rhwEY7gkCYcObpkHjkP4sFGSELDcQLstzPFbqbYZ2LHg5ZxQdY6BJteqpVEAtKJdpdWBnwDEabcq5cx8xwWTz/nb1B9Hpq5HP7p5GkM8BG2gY2F2cgqhfMdGT3QX5j41G7/PiI194lGcT7D9/zcmuYEUqf2dTJUsNYvpTZveWF8VuSYA+LpT0hJBXlQs1FKtw8MddqbwIdapCh4+QPhyRx3rCcG1cGICra5pCdFH60TnRhIPuG8vjZOaUqGp2YM+IlJHwnNJ9KtlHKOL3U/tasfI8+PYXxhb23A1Vto2W06/0TY+bWjVRVy1heo1LmEYAF/EvjMTrzQb5NhjzqMQ9LWVZBBuvg8D/8yPD/UxWhqjZ4KnzpbnTAH4WTXUCkjlKwbOXW+BVylTLbPUrfZiB2bmZEpyk6pOCoZzUWzMl/FPcs0P/vpw9kfj1CjcpkSJxeRbxqJyRrjeX2oCEgjdbOVo8Ig==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(36860700016)(376014)(82310400026)(11063799006)(56012099006)(6133799003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 29vjAWO41YjIne9sEgmu+D/LiVt5H4UWD/wuWmd9qkCpEEiOGRnDv5QJloYyPHUGVvKX0+IkiaIQGM1siHPoqwbpogaINysxc6rieK6HN27U7//XrPYUOc95YDmah/M72qnjSmBxhzX/oG9qEms8lVjYX8AXPpV0fdUpDbIYHkYttAQy9P3LqtUk2bw57FZ7g5ukGvcKb2Zz6pm4MY26/XGT2L6pkIjH/A7zCov+w2A8Qj+WJMK1YCnIXo+hx1H+Vuik/eTwg3i9aWrxGXAl1+S8RSq8rz0pSQv2kQQMG+IOVOUIm4O8+iCzVtgTRGBFUG5qVU4ZAtPt7MiwUapcjFD8s7YoFHDd6+wBJfOivaFqqGRGnorLgrQu0U0/vmbij46lmFscLpVWJ4MZWpn+0HcqU0fhCzn0/j9iYUFFniGhsfA10wCVWjlGqB+CsWMo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 03:30:08.9289 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e414ce8-241e-49d9-3517-08deec58866c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7112
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

v4 changes:
 - This patch is now completely clean: only adds 5 new test functions
 - No modifications to patch 1 code (all fixes moved to patch 1)
 - Stats: 234 insertions, 0 deletions (vs 252 insertions, 20 deletions in v3)

v3 changes:
 - Sanitized test names and comments per Kamil's feedback
 - Added comprehensive edge-case coverage

v2 changes:
 - Added these 5 subtests to complement v1's race tests

v1:
 - Not present (only 7 race tests in v1)

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Change-Id: Icf676f626e353e0a11ba80e1a88e28627231b3ba
---
 tests/intel/gem_change_handle_race.c | 234 +++++++++++++++++++++++++++
 1 file changed, 234 insertions(+)

diff --git a/tests/intel/gem_change_handle_race.c b/tests/intel/gem_change_handle_race.c
index 5fde7b1aa..55a799bdc 100644
--- a/tests/intel/gem_change_handle_race.c
+++ b/tests/intel/gem_change_handle_race.c
@@ -1741,3 +1741,237 @@ static void test_race_close_before_lock(struct gpu_ctx *ctx)
  * When old handle equals new handle, the ioctl should return success
  * without modifying anything.
  */
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
+int igt_main()
+{
+	struct gpu_ctx ctx = { .fd = -1 };
+
+	igt_fixture() {
+		ctx.fd = drm_open_driver_render(DRIVER_ANY);
+		igt_require(ctx.fd >= 0);
+
+		ctx.driver = detect_driver(ctx.fd);
+		igt_require_f(ctx.driver != DRIVER_TYPE_UNKNOWN,
+			      "Unsupported GPU driver\n");
+
+		igt_info("═══════════════════════════════════════════════\n");
+		igt_info("  GPU-Agnostic Race Condition Tests\n");
+		igt_info("  Running on: %s\n", gpu_name(ctx.driver));
+		igt_info("═══════════════════════════════════════════════\n");
+
+#if HAS_AMDGPU
+		if (ctx.driver == DRIVER_TYPE_AMDGPU) {
+			uint32_t major, minor;
+			int err = amdgpu_device_initialize(ctx.fd, &major, &minor,
+							   &ctx.amdgpu_device);
+			igt_require(err == 0);
+			igt_info("  AMDGPU version: %d.%d\n", major, minor);
+		}
+#endif
+
+		if (ctx.driver == DRIVER_TYPE_I915) {
+			igt_require_gem(ctx.fd);
+			igt_info("  i915 GEM verified\n");
+		}
+
+		igt_info("═══════════════════════════════════════════════\n\n");
+	}
+
+	igt_describe("Race Condition #1: CHANGE_HANDLE vs GEM_CLOSE (concurrent access issues)");
+	igt_subtest("race-change-vs-close")
+		test_race_change_vs_close(&ctx);
+
+	igt_describe("Race Condition #2: Concurrent CHANGE_HANDLE (handle corruption)");
+	igt_subtest("race-change-vs-change")
+		test_race_change_vs_change(&ctx);
+
+	igt_describe("Race Condition #3: CHANGE_HANDLE vs Prime (stale references)");
+	igt_subtest("race-change-vs-prime")
+		test_race_change_vs_prime(&ctx);
+	igt_describe("Aggressive concurrent access race: CHANGE_HANDLE vs CLOSE with KASAN detection");
+	igt_subtest("race-aggressive-change-vs-close")
+		test_race_aggressive(&ctx);
+	igt_describe("Single-thread: One BO swapped H<->H+1 with periodic FD close");
+	igt_subtest("race-exploit-single-thread")
+		test_race_single_thread(&ctx);
+	igt_describe("Random handle probing: Try random new_handle values to find free slots");
+	igt_subtest("race-exploit-random-handles")
+		test_race_random_handles(&ctx);
+	igt_describe(" GEM_CLOSE races CHANGE_HANDLE lookup ");
+	igt_subtest("race-close-before-lock")
+		test_race_close_before_lock(&ctx);
+
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
+	igt_fixture() {
+#if HAS_AMDGPU
+		if (ctx.driver == DRIVER_TYPE_AMDGPU && ctx.amdgpu_device)
+			amdgpu_device_deinitialize(ctx.amdgpu_device);
+#endif
+		drm_close_driver(ctx.fd);
+	}
+}
-- 
2.54.0

