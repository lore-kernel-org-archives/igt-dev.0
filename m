Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC87CD4855
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 08:03:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F7A10E17F;
	Tue, 12 May 2026 08:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AhJJ1RXY";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012067.outbound.protection.outlook.com [52.101.43.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E6610E261
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 08:02:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SFoNg4fmS8Rd+UOOs0fHjR/807x+mklxFpdUTllcHyw2V44s2MfUqqaruto+Yng4AmiPlncRTdlr+/SdlAFKJOWXS+mQ3VmXL0gUkBCQcUC9cyOK4ESCxLjVUUbteq1Ab2pmKYkAnx6fn7wIS4TGFyO0VK/qf2stqLWzP3Sqgjwy8iKPETcbYE9wslmqAms2xHX7GyMHPD0mHBAaSSACyWEHe7S6MF3CVeX0Waf1Q7ZJG6EqBGQqO0KF+dt0CrM+xLGU0h1+/jaBaGrffosOErLlBiAw+KdAehfMo6iBkZEpBgoiycQKccI1YaLlWUCd63dyqX+fR6y6rqc7i06uMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRi/NvXY+lq7gO5dxe8zpC5d2/tpqrv/1MW2NhR3ViA=;
 b=LmcCuawWus0if1VfBZn3Oigd5GGLEVTPZTf/2Rat4aDZxQB7lC/epa2kxnqRwRV75kdV8e8YLNqisBEtzqd6bOuHKIEv4DrjM8TZU0jIfno/kWvWr+8mAcyEzGl7ugbeRiyoVf5xLrgPEZnA4UKLEK2TUxGe4useKXVJZKNBIHmNmZ2ZpenRuvsge2/Sg1TGaM56gJeqKUo3bDEQe7LcyQsWoTB2cRAKWWJ/ZcPV9gKSO0jJsFSa3BkXmOmqDGNJY2cLAmHcarmdrO6MttDcjKP58o+Py476hsVvYcCXj1UzhjoxS61bq6s6TUc8PggGMmUcpV0n80eZoOFPX6Eqgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRi/NvXY+lq7gO5dxe8zpC5d2/tpqrv/1MW2NhR3ViA=;
 b=AhJJ1RXYVhefsL1KVS7uHLVM3fX4uXCM8871JU/RiOlWFcaY0l7IGN2VtKbxCw7fPrjZsLPhhZO4LEc+RlYdPrD3ODzKBseKB+BLy9uj/Y9WEmhWUT3OJ2DTKX/Lbo1KQT2fPgDqS6yx1SjE7neKgqk+JiOGdNE32GXY/t/IVJQ=
Received: from PH1PEPF000132ED.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::32)
 by DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 08:02:31 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2a01:111:f403:f912::4) by PH1PEPF000132ED.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.24 via Frontend Transport; Tue,
 12 May 2026 08:02:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 08:02:30 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 12 May
 2026 03:02:29 -0500
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 12 May 2026 03:02:28 -0500
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>,
 <ray.wu@amd.com>
Subject: [PATCH i-g-t 1/2] tests/amdgpu/amd_replay: fix operator precedence
 and typos
Date: Tue, 12 May 2026 15:59:15 +0800
Message-ID: <20260512080213.3457271-2-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512080213.3457271-1-ray.wu@amd.com>
References: <20260512080213.3457271-1-ray.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|DS0PR12MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ebacc0c-0ab1-4efe-4f77-08deaffcd0e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|376014|82310400026|11063799003|3023799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: /wX8ZO1lh91iNdXVn4VXH0QByAma65+RZ2hTHrSuG4NTcueqCmHONzk/J8qoQZDipXhXiuZbLH6f+PklQ8elc0aNZzSb4vzilBID+KmhTyW3pAh/7K3R1rjivjA8vjqs23QyRRkrwQSamY33/5lyeqHugA40UpzycH0k2W2EzREzzXamvFfX0EpUynJMxrWz7P/MGg4DGiAqLg9OhPyo5k8esaRkoiPyL4tNobtHqj+MALi+nSpG2K9OPOd1/5mJEZAjMU0VfoKB6KWXNrCCmjHYfQmGucM5PofjHuHK0N2sQPpHgdQvJl6Fp6l2jWHhNh/KM+aiLoWjJoXl8HGwG8KY++28qSZQ2/5yap4YuzF49VD24OF+9TowMIS+G01lvv2Y1+/hQcTPJ8aCVqO+wWY/e6G23DI9zD9XaybKUj59UWN2REDDKPaOs3XmSg4WYN8HdMQ92IainildBsOdxUJUL1pIsLdICgQ7PLqMIDqFirvSX6sC57EnQXhS8Lq4ci2EziuMEGWb+x+ExWEWasA3DYnVxpQr2UbAh3rA9DY9EIvN6RERIdu8JQ2v5rJBUu9fqeV5KTKgaCYVQGO7lCcuOmVLCtZreUEvt34dbk8gyJKC7ixwXmMiHsBt4ka6G5uhTwo18Fqg+wBXWxAD+1L+FZeQ+bXTUo68snMX/WrIJmRPXm9S+UXyGAWTqKPf73GvB6F8GdnjieuYKN6gu0SpA4y47L88GQQHgK+7IHo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(11063799003)(3023799003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: r9+06Hhei87AyAqpu4sM2sCiJVjw/z1qhzx+WwFvSoNgpwFtacxELibX3FGuXKvSPSDmnEdM24r7pKgeiWenitetbZSl7v8WPb9HcUnlNV8sW3hcdbVZCT7KAX1SjL/Dz9Me4DgDWhz+fGVpxv1Q99QfKjQdYUC2NetEb0jSwhbG1HFxGqHMVD2ewCtLdMmVqNgs42KDWNZ37+2EbW0gAaRc1aGmo9rqFXkf+LJvGexT5wKuBu5qgYcpIzRX0gO/e1OMkl+yrOdLIDKTYn55sZCjVoa0iGhRGFBHrtQq31MZ4fmw3xJsPkmpJi+zqYwJUWRSdy1oapnPMsvAIHLnlQQRIx369MxyD9XvN2kMVWhlyquGllGQS8F0lP3E3xyBy0CrhTqrGa0sUJ6fjRwXoYPullYSDkx3bfUgGbhP04kavI8Z12nwOc+irjEsGVKO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:02:30.4167 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ebacc0c-0ab1-4efe-4f77-08deaffcd0e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7726
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

