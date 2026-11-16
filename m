Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C8F606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 02:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2I/18eW2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC39210E94B;
	Mon, 16 Nov 2026 02:28:06 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011025.outbound.protection.outlook.com [52.101.62.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4D510E94B
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 02:26:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9jhu5By/DSmXwbPAveIlpUHpY+qRzuz71qKnQAVBlWVqMSpNIcyKZ4jon9t8W77IgI/0qq7vZxeeXhgSCM8aTF4I6CzmLNmO1jWTIKxM0Rid8vYBZNlaZTOW0xaRM//smgCI3gGRu/dKMZWL+yF0WrYnrB022iseNJgE5OOXA0Em/xqJ6n30D2tuyuh+W1MbJXwzyUn91gt7dHRoFO1bUgIQAZvahrmSKk4e14z0RFyH+R0+ZrU3zreyLnrnAe5dRrHVvuhVDJI1KRsBU/gn2gKcRsCLHCy/bbonVKH3EsHEAv3rVVGyoVJFVvMDQensBUZGEhS7c0QOHIL28Mn5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0CNbK7UquaTkt8g9y7aJEW85b+riwTdaJNSsk3Y4ro=;
 b=wBm6Bhkaq8L9FZgD7rpl49OV3ivF2fHbyjZpZpsQeFOYdM5M0I1R+/R2UvziHWWoHkRVrv+xi1l0M5cBSELinyerSjWgOrd8Ww7qZeLtgVsjpmB4+fYY4IQ7IVUE2utgQCmdD3ailzPHC8/lz24QrmRnop6nZcpOVDnGgUc2r1aqZOkU+Y+k5ZESs1cp84Cz2SZj1NpuYkApFlyQ3y9Q0VLCwnnRX2jTX2JUocw4unIIC0rKKQ5yjmbkaJ1AoJPIKePFkgJsSpSeLPhxk+iXqNwJ0r38eSHaqtR/yfHOgtEAFAPNF/a/nL23Unqf4bb+4+izIRmcerN3UbSvY6iHmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0CNbK7UquaTkt8g9y7aJEW85b+riwTdaJNSsk3Y4ro=;
 b=2I/18eW2YJ5d5k6POxu3VKF24FF45ejRoFr+8/kpQR7bcwByDPrSVWF6O/DxXLB//5y0Kto4BCSrefDEvvtxHtssPcUm0vs8Je4n5Q/rAi9jDYdB01GjYSKQNMPuUmgrROxz5oKB/VTCywcO04Uk3wAH6mKJ8js3hdel12MP+gc=
Received: from PH8PR20CA0004.namprd20.prod.outlook.com (2603:10b6:510:23c::12)
 by PH7PR12MB8594.namprd12.prod.outlook.com (2603:10b6:510:1b3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 02:25:31 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:510:23c:cafe::62) by PH8PR20CA0004.outlook.office365.com
 (2603:10b6:510:23c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Mon,
 16 Nov 2026 02:25:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 02:25:31 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 20:25:20 -0600
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Sun, 15 Nov 2026 20:25:18 -0600
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <jani.nikula@linux.intel.com>, <kamil.konieczny@linux.intel.com>,
 <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>, Ray Wu
 <ray.wu@amd.com>
Subject: [PATCH i-g-t v2 5/6] tests/amdgpu/amd_replay: Fail on page flip errors
Date: Mon, 16 Nov 2026 10:24:46 +0800
Message-ID: <20261116022447.3981877-6-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116022447.3981877-1-ray.wu@amd.com>
References: <20261116022447.3981877-1-ray.wu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|PH7PR12MB8594:EE_
X-MS-Office365-Filtering-Correlation-Id: bbe77d47-1e45-4fca-8570-08df4388e333
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|10067099003|11063799006|56012099006|261022105027099003|261021121427099003|261021123027099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: Sl68biXl1b+2YXo4qb8YQCHsy0Qogg3Z1cI/N1alqA5/VUwHgAV1w21m5R9k7SJBL0ETvipJEYbfxcwJhFxqHXHMDgLpsixpQ4qWN1NydjIAvYRYMVrzZNf80T2VRrjmwIhtuxMkLF2JxjzyKLejs9G+9DiOtKyK2FhbI4TwiG8I5CFFZ4Zby+o0IEJIK+ISi1aVOu6UWWpW0FS8g3HGiUa5B3mQskSPzHVeqk+jKfDeiTSo5xkAIMAyNWPIdOnHgPKpP2Jrk7OVOPZf7dQymceO+dBj44qTcUCTC0ixptEmL+X5EcMbfW51XdHtP8aDk9ATm9e6S/9/Rdki13U93Gh0fQHAFjUlL6ilIQ5QaJBvQA1l8EHciooCnvu+2pcwBllEGJO4Qu2Jh43nJYFuyJZx1z9Rd2btVRo8K6OKAdB89U98oMYfJmYeeFfxQZEFbF1sx/IfyRpmQ1tRSV0Fbba91oOFp7J+PkTcYNYKRI0wCiDjwKOR+sGsEdHC9pxod7QPQtNL2EWk/RT5WgA5xYUWgDr46vEvr+IqvJDkvdl7TQfsq8RzGOg863iw3VwSZJs2+EO1MaqzII9d/NzbXToWA2uv2Q7M4+EFNO7Idm363sF0YzzSwvZ+p6zn2Uy7B1k967rC1/DAWbSafzlBZecbWw0OXGew+BP+Rhwdh8l6Cdp/qSclXtEBnN81bT90GptudoA4tOxsI41ZoQFtow==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261022105027099003)(261021121427099003)(261021123027099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: R566rCElWVHqJJJ3/LhTA0mJP2gbXV8Cfdh96gAZdR+PrUP0fGwRRgQW3RWAT8iZhy++Qnkx5k+OK9SnN49xUP9TdI70JgtIbZO7ZDP2h41pz4D8kOUrJS7b+g5z/kIHHT8mUv9BObbQe+1rg/8vmqke9B6Pjkx0soBz3djHjH2GrJkTx/4KhxT98+4xxSUS3RFeX2I3J5gN5lF74bRKEk0RPBGAnbki4yKauzznmEge9yfsOohMQ3y0WpbwVR/ARAlQ3/zRG/vlbeZ83Lqp2M538Pf8kI8heHFgC/wUM3eaHS1bxQHTBd4FvkoQU90Kw9DlyOXmKCr7fUk+dLwRPDbry/9D1I71h7m76RYlvRqaL+DsP3vl3llSOtFgMoB8Yqi/caDpzxPxuXPpBG8GZn17oLB69fGTXBSQajizI5GP+lLckWtBagiKZNWltqOy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 02:25:31.5647 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe77d47-1e45-4fca-8570-08df4388e333
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8594
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

igt_require() turns a page flip failure into a SKIP.

Signed-off-by: Ray Wu <ray.wu@amd.com>
---
 tests/amdgpu/amd_replay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index e73d2abf3..d97efbf1a 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -218,7 +218,7 @@ static void page_flip_test(struct test_data *data, igt_output_t *output,
 	for (frame_count = 0; frame_count <= frame_num; frame_count++) {
 		ret = drmModePageFlip(data->fd, output->config.crtc->crtc_id,
 				data->flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
-		igt_require(ret == 0);
+		igt_assert_eq(ret, 0);
 		kmstest_wait_for_pageflip(data->fd);
 
 		if ((test_mode == TEST_MODE_CONSTANT_LIVE || test_mode == TEST_MODE_INTERMITTENT_LIVE)
-- 
2.43.0

