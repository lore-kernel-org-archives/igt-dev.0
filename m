Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F09CD4851
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 07:07:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD1C10ECB3;
	Wed, 13 May 2026 07:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4/lMgK0w";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012004.outbound.protection.outlook.com
 [40.107.200.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B010410E1B8
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 07:06:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lw0Awiq81Q21veDgtPxxvPrs7ai1tsefpWBViomzQbwSLiMYw1FGxOFPYt/7H0KAvJXrUWEOf0Uev0c8T9uU5wlE1TLSTpafBmxWuw5hqvhmMFqqgvCamb9hrsEeqVS0l9mX2DLpdhzAZTqUZWlGftg0Ae+kTxK2MFvBXT6ubzX2+O+r6KYn9kM8IvJEfb5Igpwutv5XB31WsUQshYXXLHzGsnFuWLMNprHzdgMAy9bC4ib7wU39E31k2XUr2ip79JTFDGddMKhBtX5MT95Bn0BvAzg82mqdVRXGkF2O2nfUTlBK0q+93P+NAF2hR2O0gSKYFVWoAygAK6bWPBwMxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRi/NvXY+lq7gO5dxe8zpC5d2/tpqrv/1MW2NhR3ViA=;
 b=KQa5gQqa6AzVdnwPsxyCSx3B7eGg+s7QzMvsU69k2djLym6TJgLCW8gum3ZOnh9AjHWzZnseIq8eQDCm0RkVqqcp3Lz6P82zXBCuGTEFKP8fYbnRbwzi8wN6N6SA8SWNppmDzO6VdWxRPUp+EkuRBtZ8QURVy4zgHJ3i3R6fqwQ825Rg9TvMbWOL/wux4JDWLcT4ZybYRonG1GlO9fa/UvMjnkQ0F+hoG8zimN3TB8IfYA0lm9GXGLcGgALBzsyU7EnG0uOJDU/CfX3U2uZUTsFA2qnelT9wMwQEl71d952+CYScIjyOs0J1GGnmcRp8B4VnqHbZr4UkPqlFcMJgXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRi/NvXY+lq7gO5dxe8zpC5d2/tpqrv/1MW2NhR3ViA=;
 b=4/lMgK0wZBv3qVzq2z+vsguvpEekmK9RpG8LoRuJefjNP8qifVJAV1brkQDljU7w2pOLfRw5SYxPOk9U3OMTtP3z7BRCKLgFggxG9c+uZYt+1tmvXZahdbENSSL1HNWQ80wxku+g003s09P8ED/ynOmXqmXTEDfaDqhgC0nYpy0=
Received: from BL1P221CA0036.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::6)
 by SN7PR12MB7933.namprd12.prod.outlook.com (2603:10b6:806:342::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 13 May
 2026 07:06:38 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:208:5b5:cafe::fc) by BL1P221CA0036.outlook.office365.com
 (2603:10b6:208:5b5::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Wed, 13
 May 2026 07:06:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 07:06:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Wed, 13 May
 2026 02:06:37 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 May
 2026 02:06:37 -0500
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 13 May 2026 02:06:36 -0500
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>,
 <ray.wu@amd.com>
Subject: [PATCH i-g-t,
 v2 1/2] tests/amdgpu/amd_replay: fix operator precedence and typos
Date: Wed, 13 May 2026 15:03:21 +0800
Message-ID: <20260513070631.3723466-2-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513070631.3723466-1-ray.wu@amd.com>
References: <20260513070631.3723466-1-ray.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ray.wu@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|SN7PR12MB7933:EE_
X-MS-Office365-Filtering-Correlation-Id: 8365e08c-8c5a-494a-5269-08deb0be2d12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|1800799024|376014|3023799003|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: 4u4XA38zO+oQBZK7V7TSWhquHnXx2Wp9LclOP/cifzNVtjkrJH90XKY7xHmefBqFm4RQyW6l3gmLOvbKj428AMb9HQ2QBPHBSjkZfGbpFkfhyG6RVWzxgggY2lkWW/BwVOzgimP3ooA5srJBQhflHQ20kjOhI8PHplJC/d5oe1VIc6rnrtNyXSalwWCVwhOCOwZIJSI0RrByC28wTLG4+yQgo+oL3j1L4t8RWRcjQrRmbDegDcCb0TmMJsAk3Ci5OB3D1mR3W/gpL+c9JeAGCoGWzD3nHuJWAJAwR5JXH8tIPLU9boA40OCvlXbDxeJOW4usdceaVAAu/XTpu2jw2nzhypizqbI6QrJhsHAtPQFwqt2wyFtqyk4+yBx6axWthL84Bc3+wwEGaXBRi5YyNj3vHkEMLe/uQTPh1t2cR7Viflf6SUsdqp8yA/BINZDovTahvHRdDtgOvvbUJXzGXTyKtcUaY/V8kLif1uCIJLX8Xhhd/kSfOG3XXkx3gwclHzS+cRff68EDVAa2qxF2ejxOcGio2SdL8Vi7RIkF/ZFE2JfkA9jlVrzM5cu43WRh/z5rV63mfAvclQK/O6E7HuAmolj4NvwE0teNUL673awM1JP3SoQrNm8QpWgS8a0XSikSetKGU5bkuTw6QJ91Az7yLmeCYczLzztdART8fArSljkJ4ZS0KZ52Da1FlQIyBVZyyO6E57+RVrXH9joAqd5LNO+ZhyPGsLmoJeEa2gI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(3023799003)(56012099003)(22082099003)(18002099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bSyttKr8IFKH8XPxt3+0odwq57OtuM7iSY3ySV7O/+G9C+lEreFonnp8xqqvtBcIvUsqy8TS60fyUkcACnmmSMH7ZIQ89tsFT2+1BNNSvU6rGa77pVRSWbczYIFwmQnnBILjWxyNcQXfZC7hjjDoeagGq728ER0wlIcNW/guMth1KeTuKrX7oH6gngrI3adCp1yOh/gdy/zwWwgX2rh538meKxRIACRKs1LVUiYjkIIxxvU42tL24IZ4W3qWwa0ky486CuTdrMK0GOetsYrWJKz3WNkaCOkJxbK1iH2sDAUVs3xQ5Ked9TuS/Re6J9yBWV9itW93D5i+8VvbchP/GC+GmUTVZY5iJgLN84L2OnIbahTt6rA27Z35e7Tax2vWuYv3WKhx2xbAOBAIdIzjvwPJSMDpoTuUs2aQnhDp6MJfmWZq9p9CLSTFOtgQIumc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 07:06:37.9277 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8365e08c-8c5a-494a-5269-08deb0be2d12
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7933
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

[Why]
Several existing replay subtests had logic bugs that silently disabled
their state checks:

  - `test_mode == (A || B)` and `test_mode == A || B` do not check
    whether test_mode matches A or B; both evaluate to a constant
    truthy expression, so the guarded code always ran.
  - Three igt_fail_on_f() range checks were written as
    `state < N && state >= N+1`, which can never be true; the
    assertions never fired regardless of replay_state.

Two "mdoe" typos in igt_describe() strings were also present.

[How]
  - Rewrite the conditionals as `(test_mode == A) || (test_mode == B)`.
  - Replace `&&` with `||` in the three range assertions so they fail
    when state is outside the expected range.
  - Fix the two typos.

Signed-off-by: Ray Wu <ray.wu@amd.com>
---
 tests/amdgpu/amd_replay.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index 775bed190..4b795f5ba 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -236,14 +236,17 @@ static void page_flip_test(struct test_data *data, igt_output_t *output,
 		igt_require(ret == 0);
 		kmstest_wait_for_pageflip(data->fd);
 
-		if (test_mode == (TEST_MODE_CONSTANT_LIVE || TEST_MODE_INTERMITTENT_LIVE)
-				&& frame_count > 5) {
+		if ((test_mode == TEST_MODE_CONSTANT_LIVE ||
+		     test_mode == TEST_MODE_INTERMITTENT_LIVE) &&
+		    frame_count > 5) {
 			/* Panel Replay state needs few frame to enter the live mode */
 			replay_state = igt_amd_read_replay_state(data->fd, output->name);
 			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
 			igt_debug("replay_state live mode = 0x%X\n", replay_state);
-			igt_fail_on_f(replay_state < REPLAY_STATE_4 && replay_state >= REPLAY_STATE_5,
-					"State should be REPLAY_STATE_4 (Active with single frame update)\n");
+			igt_fail_on_f(replay_state < REPLAY_STATE_4 ||
+				      replay_state >= REPLAY_STATE_5,
+				      "State should be REPLAY_STATE_4 "
+				      "(Active with single frame update)\n");
 			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
 		}
 
@@ -302,15 +305,17 @@ static void run_check_replay(struct test_data *data, enum test_mode test_mode)
 		page_flip_test(data, output, test_mode, 20);
 
 		/* Check Panel Replay state in static screen */
-		if (test_mode == TEST_MODE_STATIC_SCREEN || TEST_MODE_INTERMITTENT_LIVE) {
+		if (test_mode == TEST_MODE_STATIC_SCREEN ||
+		    test_mode == TEST_MODE_INTERMITTENT_LIVE) {
 			/* Panel Replay state takes some time to settle its value on static screen */
 			sleep(1);
 
 			replay_state = igt_amd_read_replay_state(data->fd, output->name);
 			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
 			igt_debug("replay_state static mode = 0x%X\n", replay_state);
-			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
-				 "State should be REPLAY_STATE_3 (Active)\n");
+			igt_fail_on_f(replay_state < REPLAY_STATE_3 ||
+				      replay_state >= REPLAY_STATE_4,
+				      "State should be REPLAY_STATE_3 (Active)\n");
 			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
 		}
 
@@ -325,8 +330,9 @@ static void run_check_replay(struct test_data *data, enum test_mode test_mode)
 			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
 			igt_debug("replay_state TEST_MODE_INTERMITTENT_LIVE after flip = 0x%X\n",
 				 replay_state);
-			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
-				 "State should be REPLAY_STATE_3 (Active)\n");
+			igt_fail_on_f(replay_state < REPLAY_STATE_3 ||
+				      replay_state >= REPLAY_STATE_4,
+				      "State should be REPLAY_STATE_3 (Active)\n");
 			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
 		}
 
@@ -439,10 +445,10 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 	igt_describe("Test whether Panel Replay can be enabled with static screen");
 	igt_subtest("replay_static_screen") run_check_replay(&data, TEST_MODE_STATIC_SCREEN);
 
-	igt_describe("Test whether Panel Replay can be enabled with intermittent live mdoe");
+	igt_describe("Test whether Panel Replay can be enabled with intermittent live mode");
 	igt_subtest("replay_intermittent_live") run_check_replay(&data, TEST_MODE_INTERMITTENT_LIVE);
 
-	igt_describe("Test whether Panel Replay can be enabled with constant live mdoe");
+	igt_describe("Test whether Panel Replay can be enabled with constant live mode");
 	igt_subtest("replay_constant_live") run_check_replay(&data, TEST_MODE_CONSTANT_LIVE);
 
 	igt_describe("Test whether Panel Replay can be enabled after resume from suspend");
-- 
2.43.0

