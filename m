Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B9E606A323
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 07:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zvem2+K6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9508610E35F;
	Mon, 16 Nov 2026 07:06:13 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011030.outbound.protection.outlook.com [52.101.62.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB8710E850
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 07:05:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xx+ugyo8Cjt+2rOQb1diR0h9YPb8OeMEahccW4ag13cHDuFnKANGNdXYRjUNq3QRaHBLHP+7thF0dCA07MHEQZeyOiNL6QAmTDE0D5BKo3XgWLy49sVzlj9wL7ML3Du+YN1LaFf5hcGvD3sjoC3zybUXDDxO+eeP/XVk7SVDgbUs/OrGa80YZQQLFVtyOfNXNXh7mjqTttiEva+rEnpO+knEknZEcRDFIHs2+5+BzQ09u9Azuv5ok3ri+Fr6u/M88JAnE7pif//CYf8e//d898G9OoujsKsLfG4Xe/x72oHF4wmAdz8K6sG3JRQPd07YdF6EcCEPBSWGR7jEhcy9kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vx1tXNNzYsACCzieW5hgnrQIwIVvuMgVqhzV4mr0smE=;
 b=xMwjmJmy0vOw6WSru+RjJolqrU3Kniqtdzn192KIL4ZhoWu8ZTUOFtLt0aZTNVoc5jAwMUt/1bXzJmF687Fpu0mYq0EmD9sgsgM8QfC4slg/cfORTvxE+L15ckeKKpCI9C608fznrI77GQ4N3A7Nl1lKxsNcSCbn/9iX2j1IQNhZVgUQOl2YRoRnlEEAa3cHUB4KIGQjo93bGxGa2K3uoB3I2HHcbbcmJsE318tEMWCzEFfHw1NxZy+hkcthA+v6ScHv4bdU0vZALEy0LJu7u7nv8/djiJODKfECoJ2xup1wf7BVku/Sv1Bb22C8DGtFEf0Yr6SYUmht7WFp4735xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vx1tXNNzYsACCzieW5hgnrQIwIVvuMgVqhzV4mr0smE=;
 b=zvem2+K6kX+gIOmCRFBB1tqiIO1FNkqdXAknhMvz/FbHrfw9Cm+wEDALacqQppfe7cfa2sVMye/hjptuY8adeuDPNKpXsxP7KWZwZK1OZXAdo6bH+95YPwdn0/feXHjyk10ZBO80nUwvEWMwPqKI3rtgvmGSEPsYkkr1RJnIero=
Received: from SJ0PR03CA0342.namprd03.prod.outlook.com (2603:10b6:a03:39c::17)
 by IA1PR12MB6091.namprd12.prod.outlook.com (2603:10b6:208:3ed::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Mon, 16 Nov
 2026 07:02:54 +0000
Received: from MW1PEPF00018892.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::2d) by SJ0PR03CA0342.outlook.office365.com
 (2603:10b6:a03:39c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Mon, 16
 Nov 2026 07:02:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF00018892.mail.protection.outlook.com (10.167.249.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 07:02:53 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 01:02:52 -0600
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 01:02:51 -0600
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <jani.nikula@linux.intel.com>, <kamil.konieczny@linux.intel.com>,
 <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>, Ray Wu
 <ray.wu@amd.com>
Subject: [PATCH i-g-t v3 3/5] tests/amdgpu/amd_replay: Fix inverted Replay
 state range checks
Date: Mon, 16 Nov 2026 15:02:46 +0800
Message-ID: <20261116070248.4103604-4-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116070248.4103604-1-ray.wu@amd.com>
References: <20261116070248.4103604-1-ray.wu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00018892:EE_|IA1PR12MB6091:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a66360-209f-49ea-a964-08df43afa27a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|22082099003|18002099003|3023799007|10067099003|56012099006|261102123227099003|261026140227099003|11063799006|261022105027099003|261028144727099003|261021123027099003|261009223027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: 4bN6g6NAmjtfgY2FAiu0AtV1p7xSKd+JL7k2L5vRMfMnZWFsiGU4oC0lUxQmJmyEHHLzNe+ULPYc/z+idBV62qOEtzn5QpeNb3VbtHYqqSGRn362f2+T/MQhvyk/RZFrLw/QmoI4GS+NzHNhWs0HxTMTdVdOOSTmMEsCGri80yvQD3f1wn//OPUttjFwg6J+ra3TWemkRa1wXFoazx0TbppSKKTvoHo+tqb7c5elUzlVOrlekCC4wrg+Ismek309/ldvmK2AUeFPwgesP86+vo2aoS6m3gc2iwNtNu9gc/8xRNT7fyLb7FjrL1BvwdwBpM8GGzBC82y7jlAhjRZdl3Tw71Oa2twwhS4L3mzigY0nKZCFe7qF5952PuM2LNaMmO9DreCuxZaUEa15IhKrmbC0Dy3gezBEIFAb9RlYPe89fZIbWLWMHWn+/sAKTfWs80Sr0lyNPux8fblDR2cBN9q/84D7tSXeyhWXwd2ojrCngSIKHZS0O2iUdM5EynyYPKOed7dwxYsBVKQyNGV5s319AlqvqZcukl5o23F1j54ymMl2CK+YGS2wYD4i5qm0YyfU0U7fsMOg284V5Yn5IJdikBOYr9gjZlMldSa+iZM//hWQ1WdTSxD1U4h1MnUlwre+tkoVTb+YcM+SCGZ9ggZ77nTcrxXIuKmt92mRT/fV3ybYCefXidTJft4mqAgA+650FIDAAUUcNW1K73VOww==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006)(261102123227099003)(261026140227099003)(11063799006)(261022105027099003)(261028144727099003)(261021123027099003)(261009223027099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9G/3a/GyrFlE9Fq1p/JZFYywHpNflOrYpBvqB2z9Ydi3mTh4Qx5UacoCrzEh8vtUSWLlBfTE80JE8QvvzYuGauQZ+TWXerKCnxJ7xsV2mvrHE2R9bCHO7CCu1l+4Ny3iTDj/dggGJKaQNnkoh8HTpmG6UGtAOms8Qmzo5ulrYmweRnGzeMGQDGQiSrDP4o0QZVB5JWa2Cy4e+qkUdrxZZjpT4jO00PLS9ni1onxMzrvmJXFUVD76/1kyYoB4PgOzmx85SmHYzN+4sWkllUA8T5QDvvG0KCzz/d67XowNnNmdDJEfH+Ou0UV0GT0F+TWRcqIaoKkwV3R6wZgENMWk5h1GCQpK8dY58F1zM1mhAPUd+9ZYENV/6QzgLaCbANMn/cklx7a5+MzgcOJQkaQalg+5uKfCjj3hsAFJc3UUAwdLY27vl43N8BdOygTsyppa
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 07:02:53.3453 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a66360-209f-49ea-a964-08df43afa27a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF00018892.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6091
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

