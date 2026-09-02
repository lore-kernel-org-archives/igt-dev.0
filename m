Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA393C61DD3
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 01:07:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A8810E32A;
	Wed,  2 Sep 2026 01:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SMQyw13V";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011050.outbound.protection.outlook.com [52.101.62.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83D210E41B
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2026 01:05:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MyBsVBRE98Y+yFic3O+AfmagQPYOx8IdP8CvHnAoHPBgjIlrwng1G61dKR9JvsII7Soy72pM+vcNw+61saSxcdp0eaO+blwB1CLe5hNSqwfOuCBhv6kEBWjop30iyPwYeoyZmOEhJ3nD714A1mI2tpsNFQ+W6oo2iUdPLv3cm6sR4a4Ncp/2bA/GjmLStkJN9EqTPEoUzTpL2brGdySryF/s2Z/8WCcCQ2b++Xe/SXP0KaE1XkcE3/9WJiIdNPRPTQrhnJVmRtK+xZzNdcz9ZuFzuCmOmPT9zETLpQeWFwz/wiTkoYooIHoeCJqr1qfAPPzz5i+id0KDh2K74XynYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXtn7DdPova+alIN/SmUqC4wTB5gDJ6m58lQPhXeM5I=;
 b=vqH73uzyy0JTwbkMQYsaF+wzaZRrnwcm/Ib2a7GOswtXMYdhdi1YhpZf7Qy3cCTzVkfOMRDlAhvsd70BNDEVAuKrMP8HRgi2GtJ9cA+6BIZac0rpLkZhZ9IHM4OT4teJK/S752SDO/nUzh7PJgILHs+2yuUZzAisjbgIHTFG12MiGhhKo4viPLoedB3UXPNgoMf0yPXnFQkehObJsll4XYohDuCI9vt6ZMierW9bdSKfu5fq2Gvd7MVYRizMOPmfQpRLnyTY+jawoao3hYhshKNbJQpSrEA+plJNBj1wiwEHd2No0SJTWdJ5ohw5IyCpuOHnbh4sa2bzRgck2ynHow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXtn7DdPova+alIN/SmUqC4wTB5gDJ6m58lQPhXeM5I=;
 b=SMQyw13VBpsQt/TslD3qdskqRa9/3HQdURAVYFmAbypnUCw4i5RaGf6D0Cmlfy1vtgyyuYGDa7wt89G4nniWax3YfLv0J9EH1Hs3+rAwxsAUXCaZQPOToqzLbxm8YVF66zDxIg7JwmULorGVpedhag7xcEqRvrryXs0ucrLZtV8=
Received: from BL1PR13CA0189.namprd13.prod.outlook.com (2603:10b6:208:2be::14)
 by SJ5PPFD5E8DE351.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 01:05:10 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::6d) by BL1PR13CA0189.outlook.office365.com
 (2603:10b6:208:2be::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.8 via Frontend Transport; Wed, 2
 Sep 2026 01:05:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 01:05:09 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 1 Sep
 2026 20:05:05 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 1 Sep
 2026 20:05:06 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 1 Sep 2026 20:05:05 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <simona@ffwll.ch>, <kamil.konieczny@linux.intel.com>,
 <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <sebastian.brzezinka@intel.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH v6 2/2] tests/intel/gem_change_handle_race: Add edge-case and
 functional subtests
Date: Tue, 1 Sep 2026 21:03:17 -0400
Message-ID: <1b12c46c4beddf3ce80dce1a6fa4e061c8ddf27b.1788309579.git.vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788309579.git.vitaly.prosyak@amd.com>
References: <cover.1788309579.git.vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|SJ5PPFD5E8DE351:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ed40055-781b-414a-1f6c-08df088e3c1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: yXMFa8WVaXEhRA1jQbybOdj1HAjTDYWrv5ZnzmrDZBIxSorndjjixEBv747YIgLqqJx7bF0d9ilniYhbgh0P37r+06bfQfQqS5zXsWE4XggVp0FkW9WNPlk9/R1r9NRoxKlvoM1kIaWEIFpaLWGjmhunfFuvlaCYUxh8jPcJQT1Phd7ZstKYDsYqc+Wps+xsT0gls09Mb1ny9JdYWRe+B9dQy9MGP4dQEp5z7WdvETltjWX/Ce+YPq8VZmzfpoDjijp450oT3RuUNYaiOhv+qh3YhPUU6zuwRDMdsTBVDGUvzqG4Gm5eAgE9a0Qy+GZ9dA73LM0Fk24BMSeqOrwuMv6lNgNQVh+ddasfzsplYKLccPvvRf0lPsrOddtQhMVQh8xtqCo6tT+INMxXtreD/UiG4xH9lX5SynuwBD7Uu8/63fbJZOE8lTdjTrsKhCkm6vdm0AAPxaPl7Pl5Cmjo26l6pFuV681VnZYFDZmDW5c/M2f/PYs8gGnRzlybSIC009ZYKmF1huvf/gDN07GErP4QmwmrCaCkuKT/SYN3tnLRuoyR9RUyOddstWnAq1aCBGFcGbtSp72A3OtTirZiipCtPEfjZr3MgkSPkmOPhWfnnB1w0KkfqNM6ZOV/pTMF2AZ9NkuiC4Qda25e4ybVuGUCO4hBD5Hxkil9+C+dBAtXzhYamz8nf5xD6QUcLQ8kCeEDLmbtwlIQk37S/hjmjQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pSMeUeL4IAiWAf7FZwO3Zdhd8kgWiUmwGxgXa3PAM+J95CZIOSpnDGwc6VyADQmLjWG8ADk7lN5K4xRkS2cDa9wKlN1SLpCyOZ4N8Zwuaf1nuVvUnvW38OMs4C7XN7EkYey7aDDy4Y4PKf8Qo4q4yv6PFcZG3pIdqBVHYNAPGwflWjA1e0lAZlAT0B3AXTqYBstjAs6ELx6PuwvGCa2bk2fww+KxJnkeNvUja3ut8EKSkAn1c7POkfhJH2MJ3E5ckkb6OyJ7Mic2F+kufMy8w/S2xIlyt8pnz1Sbf/w0Gz2Jr+D3fSgULFVf4OteXYYDBG7X6gj8uWYnaYGvhSzNi2lg9dGXA2ncJUy4Dc/+HE9YktuEE2OlkDC7VgrbqCYIvsP880ZME9j0vYKVeL7rRPU8MNMsz7zx6AzL1fkqDJvi9hEouIcpVIzDz7XHIM8V
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 01:05:09.6182 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed40055-781b-414a-1f6c-08df088e3c1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD5E8DE351
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

Add edge-case and functional subtests for invalid objects, same-handle
set/get races, randomized offsets across VMAs, PPGTTs, and objects, along
with no-op and functional handle-change paths.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Simona Vetter <simona@ffwll.ch>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/intel/gem_change_handle_race.c | 188 +++++++++++++++++++++++++++
 1 file changed, 188 insertions(+)

diff --git a/tests/intel/gem_change_handle_race.c b/tests/intel/gem_change_handle_race.c
index 6aff590b8..4cd187c2e 100644
--- a/tests/intel/gem_change_handle_race.c
+++ b/tests/intel/gem_change_handle_race.c
@@ -171,6 +171,21 @@ struct drm_gem_change_handle {
  * Description: Validate subtest behavior and race handling for this scenario.
  *
 
+ * SUBTEST: noop-same-handle
+ * Description: Validate subtest behavior and race handling for this scenario.
+ *
+ * SUBTEST: invalid-new-handle-exceeds-int-max
+ * Description: Validate subtest behavior and race handling for this scenario.
+ *
+ * SUBTEST: invalid-handle-nonexistent
+ * Description: Validate subtest behavior and race handling for this scenario.
+ *
+ * SUBTEST: edge-new-handle-zero
+ * Description: Validate subtest behavior and race handling for this scenario.
+ *
+ * SUBTEST: functional-rename-verification
+ * Description: Validate subtest behavior and race handling for this scenario.
+ *
  */
 
 IGT_TEST_DESCRIPTION("Multi-threaded race condition tests for GEM_CHANGE_HANDLE");
@@ -1779,6 +1794,159 @@ static void test_race_close_before_lock(struct gpu_ctx *ctx)
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
@@ -1840,6 +2008,26 @@ int igt_main()
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

