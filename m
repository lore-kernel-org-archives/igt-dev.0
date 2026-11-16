Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C37606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 02:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qM87h26E
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E2F10E113;
	Mon, 16 Nov 2026 02:31:46 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012010.outbound.protection.outlook.com [52.101.48.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CD210E94B
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 02:28:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TaQ9RD4n/SG8hSIM4Iy84AS4yhKNsWAECitbcix8qO8aCIwrGRm7YmIUhRXk549CxhfJL2gTFfcEjzDT4RtJGcPZnwE+cqTlgDR867e/xcVT2PpuvtkvJbYQH2F9U7V/KNssarq9dMv+6m7fU/wQ0a7lfyVVN///PJ+S4sDQ8AdHFbBXvIq4k3DYVPSYwe1/Jye0BtGUNVdmR2w5z2aOr2m1dGFHLNHHlYHvSvCH8ue8oTJ++PX08ORK2P3Og6Ju9ujM7wOHmG4zBYxiutT3gkTJDijz4FaQM3KCYOWshO+1LVazIsjeFFJOT3QBjxYABWESERVkP2KJo69EX/Dmzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MwakYZJFutMHxpRa4onZoTaKPK/v8Pa9ZCqhEqo09Yc=;
 b=bxLPz1JN3wneHbikPjigSXzCWUV8emFyuUeeptzgkMrn7Qfv86hD2DPRv8GeG+lbByPyCOdH5tENROaUYnX1bYOCTvp69mBJd45nEa9ma9GIZiv8kV7m/83rIEW+SiJPWe35IoYlEcZcmMHOfa8200aIH6BGQE5j/xANignfUZed1a5daBXjctyC/QmMSVCa5BQmUif4k1HkVIXOPTEclTpT94qdIETE2//VHyO31YeSC/ZhsPkF0xcTHFTOfjgPm5FGFr1FFvuTUyunC78V3pKamTmQNBMac1e5VggTRXnGla+JqUpGkpf0MNkgEVZthqkcyO1FEQwCzIu/Gby6cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MwakYZJFutMHxpRa4onZoTaKPK/v8Pa9ZCqhEqo09Yc=;
 b=qM87h26E+3y5bOWhu1yln6FbGTa3AGNHanslPtvIbbOTpalJRqCUWqBKvxVg5fBRL0z7Bpzto/jO989TNGTCRDIJojBIihDze6re8oWEy6vLFCOwWoLlokyGSOQGcWEQ+XdvBrXve++pxT7zq8IywK8DbVNx7nK3wJRSc3EvS3s=
Received: from BN9PR03CA0515.namprd03.prod.outlook.com (2603:10b6:408:131::10)
 by DS0PR12MB9058.namprd12.prod.outlook.com (2603:10b6:8:c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 02:25:24 +0000
Received: from BN7PEPF000000A1.namprd04.prod.outlook.com
 (2603:10b6:408:131:cafe::8d) by BN9PR03CA0515.outlook.office365.com
 (2603:10b6:408:131::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Mon, 16
 Nov 2026 02:25:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF000000A1.mail.protection.outlook.com (10.167.248.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 02:25:23 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 20:25:22 -0600
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Sun, 15 Nov 2026 20:25:20 -0600
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <jani.nikula@linux.intel.com>, <kamil.konieczny@linux.intel.com>,
 <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>, Ray Wu
 <ray.wu@amd.com>
Subject: [PATCH i-g-t v2 6/6] tests/amdgpu/amd_replay: Check sink Replay error
 status
Date: Mon, 16 Nov 2026 10:24:47 +0800
Message-ID: <20261116022447.3981877-7-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116022447.3981877-1-ray.wu@amd.com>
References: <20261116022447.3981877-1-ray.wu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A1:EE_|DS0PR12MB9058:EE_
X-MS-Office365-Filtering-Correlation-Id: a01158ae-0e43-4432-2586-08df4388de3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: AA6rMUTqV8ih8XSieQlWJSA8zKVPTikPP/canrgI5RQ+N7ZGLDcqDZLZFl9t2QM8OfJjau2lJvnum7+fzFD1qBKWGH4OAkBool5TQbFft/XPwB2pTc3xn65aw4ReGQGiep5jirmSHG/wjH9nISiBmVRz9AdDVoTBdYYM+w4jaKK8gdirFDCpZg9Tg3ElqxV3dEQICx8pEx91JmGBhaLe/2AByqo09dMtxoCXmHAO21cRuHu7/oQMOYqwh/GEGpgNh0JavJ+IkEnaI38fasTb4cnu9esoUXDRRoGXAHUYsrPt3ZAWpi9tbRRzQ8BAfXt0qPPKG29zofg8PWcA3u6yfP8101RgyBmEshZiayL2WWK4CiFf1Gq22QjvgzAabALVxoZnB1PgJUca5pJf0tNeFcQlmHOddpMJZnoBMsHDXUwpQv8GVVC7XdQHxwZGvg0gLZy+VsoVhHkKNaY2HzEFkrJidQph/cDAl0HWABMnn+95BMSP/gqn7ucJBT8vdo48Km9BBtc6DkzGT3z8KeL3bjVHoyKh/U+/N8JAY2ta0tg4HaCrjy8MXzWupe/zAP3RjDUu+/IyIU7hG3hLERcNrJsRXXToksqqhAxS5CYCY7SRmQ9A3mmzrE91JVuts0WYo3FgX43+ou/OisOG/4BQb/MqNvPlSuBd4X0kq2jU30LOYxErH6hmTBjVylTYK9cqsW6vnVDgkFoot8sq4/yv0g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: P8LQ/MHMdXAArfh+GSNTVAaL6F5eoV5QEdXwZKZrOFtH48M09Q8py4akxJTvVMyaOAffxp7Gg7PBfQAMjW67/j4XqWVsCDLZiPD0/Ec12oJO2fTxHNyMeEJN6TqaQNWayknuoCiCmLx9XV2tUzlW6A7d4qD4oP180jH9nbwHY77ZbkyTkZ65yq3GwqxpOzyz69XWdvSiWdL4kukRRIbRVUNH3PgnGAP4jQrbpQic8TE96G6ZefWSZJSSYENHDRChBeC/5rCQSztk309IN0OElPQsCv5HyCtUyo6hKWutZYGA6grlQjNq/NXl905iPB2C0H0ekkO/ibg0mR37A7eJU5Gu7ChS1PNZa8QhmuQsw8wqytOvMMGD4EmkZ4oKrEprojBUBtN8ZzZSil/sDiwRwjhqD1LDEhDknZg035PO0SQuIJUcorKuDe2BGnyXQm8R
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 02:25:23.2771 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a01158ae-0e43-4432-2586-08df4388de3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7PEPF000000A1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9058
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

DPCD 0x378 is only checked for non-zero. Also fail on the state
transition error, the desync error when enabled in 0x37B, and sink
device status 0x7, following the amdgpu DC bit layout.

Signed-off-by: Ray Wu <ray.wu@amd.com>
---
 tests/amdgpu/amd_replay.c | 53 +++++++++++++++++++++++++++++++--------
 1 file changed, 42 insertions(+), 11 deletions(-)

diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index d97efbf1a..c2eb8ec04 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -16,6 +16,19 @@ IGT_TEST_DESCRIPTION("Basic test for enabling Panel Replay for eDP displays");
 #define REPLAY_SETTLE_DELAY 10
 #define FLIP_FRAME_BEFORE_TEST 60
 
+/*
+ * FreeSync Replay sink DPCDs, aligned with amdgpu kernel
+ * 'union dpcd_replay_configuration' and
+ * 'union replay_enable_and_configuration' in dc_dp_types.h
+ */
+#define DP_SINK_PR_REPLAY_STATUS		0x378
+#define DP_SINK_PR_ENABLE_AND_CONFIGURATION	0x37B
+#define REPLAY_STATUS_STATE_TRANSITION_ERROR	(1 << 0)
+#define REPLAY_STATUS_DESYNC_ERROR		(1 << 1)
+#define REPLAY_STATUS_SINK_DEVICE_STATUS(x)	(((x) >> 2) & 0x7)
+#define REPLAY_SINK_DEVICE_STATUS_ERROR		0x7
+#define REPLAY_CONFIG_DESYNC_ERROR_VERIFY	(1 << 1)
+
 /* Common test data. */
 struct test_data {
 	igt_display_t display;
@@ -201,12 +214,36 @@ static bool dpcd_read_byte(int drm_fd,
 	return false;
 }
 
+/* Check sink Replay status (DPCD 0x378) reports no error */
+static void check_sink_status(struct test_data *data, igt_output_t *output)
+{
+	uint8_t status = 0, config = 0, error_mask;
+
+	igt_assert_f(dpcd_read_byte(data->fd, output->config.connector,
+		     DP_SINK_PR_ENABLE_AND_CONFIGURATION, &config),
+		     "Failed to read DPCD 0x37B\n");
+	igt_assert_f(dpcd_read_byte(data->fd, output->config.connector,
+		     DP_SINK_PR_REPLAY_STATUS, &status),
+		     "Failed to read DPCD 0x378\n");
+	igt_debug("DPCD 0x378 = 0x%02X, 0x37B = 0x%02X\n", status, config);
+
+	/* Desync error is only reported when desync verification is enabled */
+	error_mask = REPLAY_STATUS_STATE_TRANSITION_ERROR;
+	if (config & REPLAY_CONFIG_DESYNC_ERROR_VERIFY)
+		error_mask |= REPLAY_STATUS_DESYNC_ERROR;
+
+	igt_fail_on_f(status & error_mask,
+		      "Sink reported Replay error, DPCD 0x378 = 0x%02X\n", status);
+	igt_fail_on_f(REPLAY_STATUS_SINK_DEVICE_STATUS(status) == REPLAY_SINK_DEVICE_STATUS_ERROR,
+		      "Sink reported device error, DPCD 0x378 = 0x%02X\n", status);
+	igt_fail_on_f(status == 0, "Panel is not in replay mode\n");
+}
+
 static void page_flip_test(struct test_data *data, igt_output_t *output,
 						 enum test_mode test_mode, uint32_t frame_num)
 {
 	int ret, frame_count;
 	enum replay_state replay_state;
-	uint8_t panel_dpcd = 0;
 
 	if (!data || data->ref_fb.fb_id == 0 || data->ref_fb2.fb_id == 0
 	    || frame_num <= 5) {
@@ -225,11 +262,10 @@ static void page_flip_test(struct test_data *data, igt_output_t *output,
 				&& frame_count > 5) {
 			/* Panel Replay state needs few frame to enter the live mode */
 			replay_state = igt_amd_read_replay_state(data->fd, output->name);
-			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
 			igt_debug("replay_state live mode = 0x%X\n", replay_state);
 			igt_fail_on_f(replay_state < REPLAY_STATE_4 || replay_state >= REPLAY_STATE_5,
 					"State should be REPLAY_STATE_4 (Active with single frame update)\n");
-			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
+			check_sink_status(data, output);
 		}
 
 		if (frame_count % 2 == 0)
@@ -244,7 +280,6 @@ static void run_check_replay(struct test_data *data, enum test_mode test_mode)
 	int edp_idx;
 	enum replay_state replay_state;
 	igt_output_t *output;
-	uint8_t panel_dpcd = 0;
 
 	test_init(data);
 
@@ -292,11 +327,10 @@ static void run_check_replay(struct test_data *data, enum test_mode test_mode)
 			sleep(1);
 
 			replay_state = igt_amd_read_replay_state(data->fd, output->name);
-			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
 			igt_debug("replay_state static mode = 0x%X\n", replay_state);
 			igt_fail_on_f(replay_state < REPLAY_STATE_3 || replay_state >= REPLAY_STATE_4,
 				 "State should be REPLAY_STATE_3 (Active)\n");
-			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
+			check_sink_status(data, output);
 		}
 
 		/* Do another page flip if we do the replay_intermittent_live test */
@@ -307,12 +341,11 @@ static void run_check_replay(struct test_data *data, enum test_mode test_mode)
 			sleep(1);
 
 			replay_state = igt_amd_read_replay_state(data->fd, output->name);
-			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
 			igt_debug("replay_state TEST_MODE_INTERMITTENT_LIVE after flip = 0x%X\n",
 				 replay_state);
 			igt_fail_on_f(replay_state < REPLAY_STATE_3 || replay_state >= REPLAY_STATE_4,
 				 "State should be REPLAY_STATE_3 (Active)\n");
-			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
+			check_sink_status(data, output);
 		}
 
 		igt_remove_fb(data->fd, &data->ref_fb);
@@ -327,7 +360,6 @@ static void run_check_replay_suspend(struct test_data *data)
 	int edp_idx;
 	enum replay_state replay_state;
 	igt_output_t *output;
-	uint8_t panel_dpcd = 0;
 
 	test_init(data);
 
@@ -363,11 +395,10 @@ static void run_check_replay_suspend(struct test_data *data)
 		sleep(REPLAY_SETTLE_DELAY);
 
 		replay_state = igt_amd_read_replay_state(data->fd, output->name);
-		dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
 		igt_debug("replay_state static mode = 0x%X\n", replay_state);
 		igt_fail_on_f(replay_state < REPLAY_STATE_3 || replay_state >= REPLAY_STATE_4,
 			 "State should be REPLAY_STATE_3 (Active)\n");
-		igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
+		check_sink_status(data, output);
 
 		igt_remove_fb(data->fd, &data->ref_fb);
 		igt_remove_fb(data->fd, &data->ref_fb2);
-- 
2.43.0

