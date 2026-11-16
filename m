Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEA2606A332
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 11:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=r0tDeHHO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7545810EF74;
	Mon, 16 Nov 2026 11:27:03 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012043.outbound.protection.outlook.com [52.101.48.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5F610E0A9
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 11:24:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eINs+Nj2uSAGZHAEZgr+lDecHTHNvgB5NBOYgd3HqjU2pQLSHwytSgO4ObPt9/1gf4ygxMzZgGef108rH1l4FO5bj0Svm0YMvzXniuTHacX5ce4sPNp3f2xUED/4MkIJjC0CFPzluNuVlGuwIjksh8bZ1kj9DPDFnALVcRg5bIP1RWYsfWNusaQcYTLdRqb2f4BFd2/pxtKfYx/hKn5oUJTZdo8lIrqCh7FMoe277f4tTrT/L9k+ZpqXfZA/TU2Ll4FDqdaNrlEMaryVodKv/dIcgZHSWadlxIN4bFQfBpHpnfLUR7M6SdP1A8BoBRI6YH97ScONlhP2XysdLtLGXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qDXsUcuuwwwEQ6ouGkPgOIpndRNCMGHsSahPSxjc3k=;
 b=LtL+j7cEwQhZgisP1Uca/HiXmp88Zm2HLgR336uvRN03hMMNEyr50AgtbUkVEAU6BOWw+9uewddT4oUmaS9bpVNPlRgYi5ICrx4sMBzGUVV5I1mRutTZ6/fzyx5v6Edowk/cf9G8OaI47S/bxJsALPV8tkDasvj5cfVRo69Y7wu/FLK+Pcv0TmtA8BPPeDwc/U2kapbo+/BvVNJBXpYCAZfCzdkzb/6ACdo4G05L9gcX/uVVwMSKA0MH/Y1SsC4U+GOcfeSfmMUCxiMxAQydPgrlDDED7yWk0jKoX46Um6PsA+xxGqaB2Rl+chtkNV5ZtQzVgpyaRz1wmyNCJ8+7/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qDXsUcuuwwwEQ6ouGkPgOIpndRNCMGHsSahPSxjc3k=;
 b=r0tDeHHOewbrfRWF3MGfb7qlk18jEtmVlHafZvSjrBbeamthnjN1PbkRZ5T8SbzLHySnrntELTUnTfib010ZBSmSzJ2pTASSUZtcbkNry3gE/ijvxoe0CehVWc41++a+TcRRTpvaCImJiMq9xsq+AUTlm4vEIXPdsvZH0eAM9Bc=
Received: from CH2PR10CA0003.namprd10.prod.outlook.com (2603:10b6:610:4c::13)
 by IA1PR12MB6089.namprd12.prod.outlook.com (2603:10b6:208:3ef::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 11:23:49 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::72) by CH2PR10CA0003.outlook.office365.com
 (2603:10b6:610:4c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon,
 16 Nov 2026 11:23:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 11:23:49 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 01:02:55 -0600
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 01:02:53 -0600
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <jani.nikula@linux.intel.com>, <kamil.konieczny@linux.intel.com>,
 <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>, Ray Wu
 <ray.wu@amd.com>
Subject: [PATCH i-g-t v3 4/5] tests/amdgpu/amd_replay: Require REPLAY_STATE_3
 after settle
Date: Mon, 16 Nov 2026 15:02:47 +0800
Message-ID: <20261116070248.4103604-5-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116070248.4103604-1-ray.wu@amd.com>
References: <20261116070248.4103604-1-ray.wu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|IA1PR12MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: c4313d20-c219-4e79-434a-08df43d4160d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|22082099003|18002099003|261009223027099003|3023799007|11063799006|56012099006|10067099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261021123027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: wg9Qxlcmml4/eGZSsphpe4jSl7PsHbjRXU8mtwbwMK48t04StRZTvHxwKp1nCVee/50rE+wYl5hyWUmbQ0nCY2MQfRT/BG6XP9QdlV//6M6Z5FhZ0FI8n/N2MzuwEMPQigTZRVKpsNMX8K7zgv9tOrpA9vNDL7LHd4wm6RFhhiJZQVmadXKUnMXs/OLQD+UCZ14wTAQYh/j0X/QkoDwqfX1js2KR5jkqQ8nveRGy5BcyBYB41NyQrpW1r/CmPXMk+g3e4anVyuBJKqTCC9tI4vx2E80Ib7B880r4UqKMP+w1dm113LtSZaa3WacXMoWEuZ4bf91wig0siP89rMCZPnMaxlIplbyVZWsMFGRDBklk2UF5RqNFQcOWjO9+amMxcWDVxaax/3SJIsnOZFROpH/KYQfaOe2wNFL1JND6yXXt14aYTYODcNL7xtU3rD/bD487fRDaIm8S8VbEjilxL83gIUs2/luadLuww59SQa8qPuaDdaJ/qcrYnGiAwAimUc/ffi1G79nfXF3N7rDbatEl1cULxhK6Dvj/KnscfkiQwAU5GwqG/+V9jEyT1decJxxiVDgMlw18PAwyBu49XmgNgP/1rsvtOlp7Pdh7N1UZdx5tSncDpDTV8EldK/tsazgaJ3qzYJij5MQHV8tLgoJuWPVy+wTKvNErGBDFAPgnIX19f/d67TzbaKSBjLk5hEGb94TdzwvziOvpsom8OQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(261009223027099003)(3023799007)(11063799006)(56012099006)(10067099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261021123027099003)(261022105027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qNux61JllA2s1gm9r/eD+j83FsZddde8TYaLPp/l9rKEAatVdBp6wol5FDYQu6J4xz5Tp4qcWWw05z6SDGkyal1dJj5iga8hsCA8B7r2OSEomr3x4YkdYIpUBw9S3+Sg1K0qcHEEX2gmiwPGxnaY+fpBKUwA1klvJB/IBeVOARtZlxbrRdeQB2rcBeGsE1/AnUaQJp3t0FNSnUlSxjR4XC5U/q90F6fMhfmtFoE4sIIlvN0bnC3Ae3CtqC+pxcG+jiDc1fCri++xTAZWZsjPZvRMjGKyJ7eHbg8M5q8TmdSpsYxGdRTs10zJAXS8hnAlzJSwNV0UTn4Wri0thV47wBnHKabo9UWx8scn0lTiMkPEfRqu0O1oOvu9ALdHO9B5GWJelTHyONbcAWLoCHMo3cYINQR5iVIdty1IY7U/mMie36N5FwW8L29xlz6KYLod
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:23:49.1684 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4313d20-c219-4e79-434a-08df43d4160d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6089
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
Message-ID: <20261116070247.lyoyL9eZhwJPA_CUTz_nn3MpKO6u_kuBV5lokgfsw-k@z>

REPLAY_STATE_2 only means Replay entry has started.

Signed-off-by: Ray Wu <ray.wu@amd.com>
---
 tests/amdgpu/amd_replay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index 7082df706..e73d2abf3 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -280,7 +280,7 @@ static void run_check_replay(struct test_data *data, enum test_mode test_mode)
 		replay_state = igt_amd_read_replay_state(data->fd, output->name);
 		igt_debug("replay_state static mode before flip = 0x%X\n", replay_state);
 		igt_fail_on_f(replay_state < 0, "Open Panel Replay state debugfs failed\n");
-		igt_fail_on_f(replay_state < REPLAY_STATE_2,
+		igt_fail_on_f(replay_state < REPLAY_STATE_3,
 			 "Panel Replay was not enabled for connector %s\n", output->name);
 
 		/* Do some page flip and let the replay go into live mode */
-- 
2.43.0

