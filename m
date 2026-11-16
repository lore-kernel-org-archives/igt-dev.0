Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A609606A32C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 02:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wjerbbXF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2183910E94B;
	Mon, 16 Nov 2026 02:29:55 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010039.outbound.protection.outlook.com
 [40.93.198.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6367810E94B
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 02:28:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDr9xNN20hXRg7lTkumIUuYcNkNeoVwP8GqFHIXyNjodtL441XeD5lfoyFj8x3rVEgN/lTE3LmCD2LhQl/R+MFkXsAxDRf7oPPhLQ2wZY/Z2Gkx/V/v7a3lda3MSGR0TYUpsYRO/f/6RNlVH04WW7it2LBs3/XhUMDHojvsCD6IFPyzDWao5JjQnoFo+Bn19AFDSu6kVJfjblAhEPU+wRCcq0DeFVe6qSspSDzv+mHHPIK6hWDuFR/5yvpvAI6Y8EZGaaEpIWK1OOMxFwHRpHDy3SmqBGwQDmgE+b8OsR6Mm+3k7o2NUMV9SDsiPFUkMFd9Xdf4I35aKz1adcAX8tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vx1tXNNzYsACCzieW5hgnrQIwIVvuMgVqhzV4mr0smE=;
 b=XlWwmvoksSdMl+tzOkF+peSdwgZsb28e7tMlSSnklCTXV0niBt72GH2DOExLU7tEY7J1VTjY/v2DztG+iz9AGwzX/z99whDPio0oKse7IedGuW9bCBfwnNa97UiVGDCfbxoej2h2UwksifvH3P2cfxw/qijqiOt58IxZRFG4vKQ4hdD5nT16H3g81aSiXdAArfsgp50ZvCoMUhJnwlHvSS3ICbbHGH21PZL63MuyJGOpCWlZZMotk0STZsHpooMavIDO41pfvPq8Q7RS8o1zglLZJK6ESneIgn6k3G5MQ36CSWcoj7UrqAjz4/tc4KpFqjWpN2ZZuH5tPjM1ZCJAcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vx1tXNNzYsACCzieW5hgnrQIwIVvuMgVqhzV4mr0smE=;
 b=wjerbbXFw5XtU7Uvy3yvZoW8IkqJnC79acC1Aip2D4kz22JhXRhCw3NDP+7FotETOOqsjk3FuM3G2ITguRIbx8GxQ1LLk0Lve1qxy71NjkcWOkmTCR8Moh/uyIca7uyAoJLkm+fMCUyw/kiw8SZc6NxAqLE7/sliTxDpllrVOaE=
Received: from SA1P222CA0083.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::21)
 by BY5PR12MB4324.namprd12.prod.outlook.com (2603:10b6:a03:209::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 02:25:16 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:806:35e:cafe::24) by SA1P222CA0083.outlook.office365.com
 (2603:10b6:806:35e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Mon,
 16 Nov 2026 02:25:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 02:25:16 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 20:25:16 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 20:25:15 -0600
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Sun, 15 Nov 2026 20:25:14 -0600
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <jani.nikula@linux.intel.com>, <kamil.konieczny@linux.intel.com>,
 <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>, Ray Wu
 <ray.wu@amd.com>
Subject: [PATCH i-g-t v2 3/6] tests/amdgpu/amd_replay: Fix inverted Replay
 state range checks
Date: Mon, 16 Nov 2026 10:24:44 +0800
Message-ID: <20261116022447.3981877-4-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116022447.3981877-1-ray.wu@amd.com>
References: <20261116022447.3981877-1-ray.wu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|BY5PR12MB4324:EE_
X-MS-Office365-Filtering-Correlation-Id: e537e43f-0f94-4c26-d062-08df4388da24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261102123227099003|11063799006|56012099006|10067099003|22082099003|18002099003|261009223027099003|3023799007;
X-Microsoft-Antispam-Message-Info: yyYogmmBFj7ZJjzPsG43A8tp4H/EOPxd9uKDxjCyWNONty0UmZtJwrvFCUX6P16UgtCIPHhxzcMwSY7Yd4tdcnAYEO9uAb4XiHPtrY/H8fxjdZLQG0tY2t6KAFWPIOQNuDTNDtxahlFn+c7RUUsenuf1qzHT7T4DJej0yAtGzbCVyDLS7GFEkI2mw8bMmolUeq0HvvoTXL5aPLQ+v1iZTwWlN4EKEEmV9DGbhHv+63TuvXepLqn14UT494+izaulqKWcEe0LecK3IeDI2caJQS94ETxNZwhWlliFJXJ7dWv/ov5HbalXzHgOWDxyONooXRQ/MyRdO1Vrbqx85vaS/T4Sn/jKzGVBrpre3g22M07AyRALjRVhmCm5wjh5GXfdyDPB4oekvUvLJM+enbF7Vn2irhv4B3k64hYNDqL6J34vcmOgv0fxykt918UpDffTpV+D3xLMa6AM+vo4F+cf+CRVTQ/eRd3pM0g+mrecNY24/INZajwJXeBXjftZ5fLcYMNfEQoIBtFaz/d3vgtX6XYEtICmSxQvdFhr4fV0FaUJXlgOvxkpJLaqB2NQhwFgGzK7dTULjwZEIm4VYhWwJtXs4D2m29a9xd4Sw5rxCavJxd0D5skQ95MC3STSRc5G2tk13wGJDQ4O+pqsB350nFZoDq2fEJD0fcxCjcWKqmW+Q0WRY4zGKZsmYQkaDK8sGJBoCMRvVNreeyUrQUQa1w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(261009223027099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HVd/Yw+27UmIGth5dpPOvyLAVBAn0xf4PdaQ8yY+yHELMidI6yBeOG4Nk8+4EZwuRCbuy/+0hoouyV93TuftT7gvHlO2rFLgUd11L3wNd0CU1o89ZezG6e/a4cfQUi1gokdKw5DK9JhNloqx2NcRifBN878xsujoAeD6BtjfxIKJRXma77D1zmONKSKVAz1/mhGZ363gUWJH2gC8NnkxvYkWeZ2X0yNtWKTwZaXv/EBSRPWaBG3CFOcNY5lwEnCM+zgFFUinhIw0sRI/rNHDM3TEHHnSZpAdtZZEdr3VIJXphCF9WAhbh6xiQf1jJX+MzAnVlWdO/b5TVsi9atUfpymOz1vJ6vbGzWf0oCIBzhLakhWzoHMprw1E9Wci2Tq3HwB8oTtJPimXroAVT6GjVIxzXzxMZi2CSryP7vEOUQZmepCH/1En8BF3DKiRKxoI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 02:25:16.3730 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e537e43f-0f94-4c26-d062-08df4388da24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4324
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"state < A && state >= B" is never true, so a wrong state is never
reported. Use "||".

Signed-off-by: Ray Wu <ray.wu@amd.com>
---
 tests/amdgpu/amd_replay.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index f4dcf0d21..7082df706 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -227,7 +227,7 @@ static void page_flip_test(struct test_data *data, igt_output_t *output,
 			replay_state = igt_amd_read_replay_state(data->fd, output->name);
 			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
 			igt_debug("replay_state live mode = 0x%X\n", replay_state);
-			igt_fail_on_f(replay_state < REPLAY_STATE_4 && replay_state >= REPLAY_STATE_5,
+			igt_fail_on_f(replay_state < REPLAY_STATE_4 || replay_state >= REPLAY_STATE_5,
 					"State should be REPLAY_STATE_4 (Active with single frame update)\n");
 			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
 		}
@@ -294,7 +294,7 @@ static void run_check_replay(struct test_data *data, enum test_mode test_mode)
 			replay_state = igt_amd_read_replay_state(data->fd, output->name);
 			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
 			igt_debug("replay_state static mode = 0x%X\n", replay_state);
-			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
+			igt_fail_on_f(replay_state < REPLAY_STATE_3 || replay_state >= REPLAY_STATE_4,
 				 "State should be REPLAY_STATE_3 (Active)\n");
 			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
 		}
@@ -310,7 +310,7 @@ static void run_check_replay(struct test_data *data, enum test_mode test_mode)
 			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
 			igt_debug("replay_state TEST_MODE_INTERMITTENT_LIVE after flip = 0x%X\n",
 				 replay_state);
-			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
+			igt_fail_on_f(replay_state < REPLAY_STATE_3 || replay_state >= REPLAY_STATE_4,
 				 "State should be REPLAY_STATE_3 (Active)\n");
 			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
 		}
@@ -365,7 +365,7 @@ static void run_check_replay_suspend(struct test_data *data)
 		replay_state = igt_amd_read_replay_state(data->fd, output->name);
 		dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
 		igt_debug("replay_state static mode = 0x%X\n", replay_state);
-		igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
+		igt_fail_on_f(replay_state < REPLAY_STATE_3 || replay_state >= REPLAY_STATE_4,
 			 "State should be REPLAY_STATE_3 (Active)\n");
 		igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
 
-- 
2.43.0

