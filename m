Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB76D5CC81
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 09:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D333A10E770;
	Wed, 30 Oct 2024 09:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aqb1EaFy";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7264410E770
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 09:53:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eN/YzCGhp/8DTSM0xPGu6S7zh5MaBPQaZ5lBX76B9E/qJj5JQCyY79ECHfWD73aVwpOikUDpDfFD3NgIaXp5NWmtXiPg0I9eLa9MfffjfGTwNSfo57IHIh69wLgf+H2e3DnWlYU5CGttCEmkcrJz3X/vomGSMKgOk4lcvJxE8LrsPt9VQGkn1VRJ1hqQphxBAc99Eoz2lnlmEnSQYhvtyOHu0/xdKE7dJs1Xt39fs/mFc8wgsQda2CbTtsd8EDhqbhRvjPoF5LWacrxPtL4+NKTMJl77YzJC5WiE96NkBeo6jk6YReQkwrlS4AI4eSfKcURMB2O4YTChR9sscXs3vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58VPh/JdIYyApCC1t2EA6djdGonrtVWlrpkIWRTSbZI=;
 b=Qh2QWVyeP0wdINmrkENeZQLVXbeRkv3KDCC/ElVkeyKjxowDiSYIvEO1YuqSGfNB/YmdY28HJEuVP7psL8RhxQ15on3cmBOMQT8N+7GPalgHVJI8vEpyRce6Td3mz3eQpJfGp1bs9+86ys1k4sfQs/J8E641qHsdJEi2GAsw1ZHi7yl+u/UFHjI0uOslXptbbhBu64YXKqieB8UEEGm4hHc+SuTtQjRh0x/hIZJIlVKV4pEIkL11wbjErb1zg2+62MtGKPdFLo4X4qpSJQoFMD4q/RoMMrskk3BWQYF3/i9Vkx5NXkpszS3k20hJkggA/Jn0WyTtYF/P2ZOUieqlGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58VPh/JdIYyApCC1t2EA6djdGonrtVWlrpkIWRTSbZI=;
 b=aqb1EaFyy9BApbD6RsUo51O5IDxwq1klJ1q0/6J+WCQFZ7CaRDIrwevD3oiNjmZrcHJM25yBCJSw8L7zlkAeEB4Hu91/T5Tipyym07yBLklr/IZVTCJY4vgVHJ01pxRbKoAz1eRyvCOcFx2PEdyeTxI+ckRQFek/gMDp6GCKTOI=
Received: from SA9PR13CA0073.namprd13.prod.outlook.com (2603:10b6:806:23::18)
 by PH0PR12MB7929.namprd12.prod.outlook.com (2603:10b6:510:284::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Wed, 30 Oct
 2024 09:53:07 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:23:cafe::67) by SA9PR13CA0073.outlook.office365.com
 (2603:10b6:806:23::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.17 via Frontend
 Transport; Wed, 30 Oct 2024 09:53:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Wed, 30 Oct 2024 09:53:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Oct
 2024 04:53:07 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Oct
 2024 04:53:06 -0500
Received: from tom-BIRMANPLUS.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 30 Oct 2024 04:53:05 -0500
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <Rodrigo.Siqueira@amd.com>, <alex.hung@amd.com>, <sunpeng.li@amd.com>,
 <chiahsuan.chung@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu/amd_replay: Add some page flips before
 test start
Date: Wed, 30 Oct 2024 17:51:17 +0800
Message-ID: <20241030095301.11671-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: chiahsuan.chung@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|PH0PR12MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: dcdca3fb-7295-4b58-7582-08dcf8c8a805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qmuCnfxdl6LPhABuUMApMKsdVwAwgBsqpI4UoKV1PSK98g0jpk7BhMZFvI0f?=
 =?us-ascii?Q?xDhY1CHg6mZTgppXxxTlcNiTgZksIuPBa4U87l72iuoLFd2Tzw3ICape7ACR?=
 =?us-ascii?Q?JxoLGS4XynGk8rUXnVPya0frC02ojZzla6Qx/ecqz3zWbtyh95iOV+CP3eQ+?=
 =?us-ascii?Q?+jP7T04+i/HU4131TU4hwHOilXbVTJQTdRsMaAXuBiRwzgI37auXNh8W1dOM?=
 =?us-ascii?Q?0xiIbchEBBAPlOnSMqm+y9IO08a+mIDYnVr7+h34tvaMpHKQh49w6QaOsdsO?=
 =?us-ascii?Q?Gt2ZXGLuliNudzPIhwZP+Y6VqJLrV835Bh+/y7MXCKi6L5EcPEK3dLclQUjK?=
 =?us-ascii?Q?E6VYfKZjqjmyFKRlnF45rNE1mvQNU0bXw4w3bb2q5ow6paj7+RnIB+3zV5lq?=
 =?us-ascii?Q?Fgqyp6bsp0RFBOZyc6hTfZ6nLVFmiSNRmMz9wxNaakMEt3BDYoUNoiOYhE/k?=
 =?us-ascii?Q?5l3epbWQPBV78vLMyfPwPMcvj9/TsKs460OHn+RdIICC3CtJ5Fp3w2JH69r5?=
 =?us-ascii?Q?JAZ0cMbcka8/mZL67AOKhsktBgq9Uvf3CflLCHIWgro/TSeA32Mr+9FSXPQl?=
 =?us-ascii?Q?Rxb45wyJnat/0EONkB00+bhOby2ZH+LrVo6E0/x7vb64yfVC5moKNAuHa98I?=
 =?us-ascii?Q?x6twYCIqaYVO7l4YT+hFdDSSxmy5AKRVt/Kyn9UM5Yd+8asnSuW6N3f+5axu?=
 =?us-ascii?Q?+oq1FaHenHe/M+aya59ILmcs5HJbI+VQurRAu5KUTmV668KRlTpvKCBo8XCY?=
 =?us-ascii?Q?4mAiyL3VPlQX/7acMQobH23u+2l7NF77IrCZIyrhcul7blVldsHUm4YkvgSo?=
 =?us-ascii?Q?AeiMc0ldfBHXYLBqkPG0xqjVHZmtV2BalPPt0Dz9xtOakeuH01rh/qxll5Mo?=
 =?us-ascii?Q?aBR/5U9GM5VIGhAEj00wU0VS8tWUIekV05FD3EcezA3pT8sDLXhxkTZPFEnQ?=
 =?us-ascii?Q?mseJT4d4Fw4X9EFDNApSCqWFzkaDJZIZn7GYgeRKEHE5slI3Poww+zkuhIUd?=
 =?us-ascii?Q?F686OoRdwaNfEXODd56TcRHgWU+EIg/EVlwFUkjiNBfdBuzUXjJCNUDGJK/C?=
 =?us-ascii?Q?1pk9blAtMukveAsbIGkGR+8Em8C9468rgj1/d3EuLfSwJJ2ZQh4mx9AlyJTS?=
 =?us-ascii?Q?5xnckcvXcPy3C/b6qZsePKtNvWMoSmvWCH9b2EB4vhnG0LDBvhK0Vw+GEPuw?=
 =?us-ascii?Q?vtng9PzOy11KcEcUw7q+Olq6jb0Q3mbhJT1LgdxmWBopGsJG5iiEzXp6iKaw?=
 =?us-ascii?Q?/OXYBZQMAp1jXia0JHhLjdwLM67QeQLfu+YZyxn5LbS1HG+Ut37skK7L/wkf?=
 =?us-ascii?Q?i/nN990/Ux/Siidr0KVYvYn6gmna3A2Gi5w0tt329pFojCQ6Kiru8XynV67T?=
 =?us-ascii?Q?N7dI0ZQIBZAVVap0UUovQWSDKWCIgUWQw+IT9lI1CfPiDwQAIw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 09:53:07.5064 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcdca3fb-7295-4b58-7582-08dcf8c8a805
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7929
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
New panel replay driver behavior skip some atomic commits before
enable the panel replay.

[How]
Add some page flips before test to let the panel replay can be
enabled first.
(This change can be backward compatible with old driver)

Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
 tests/amdgpu/amd_replay.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index b5bb10b34..db2ac2de9 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -14,6 +14,7 @@
 IGT_TEST_DESCRIPTION("Basic test for enabling Panel Replay for eDP displays");
 
 #define REPLAY_SETTLE_DELAY 10
+#define FLIP_FRAME_BEFORE_TEST 60
 
 /* Common test data. */
 struct test_data {
@@ -50,6 +51,7 @@ enum test_mode {
 	TEST_MODE_INTERMITTENT_LIVE,
 	TEST_MODE_CONSTANT_LIVE,
 	TEST_MODE_SUSPEND,
+	TEST_MODE_FLIP_ONLY,
 	TEST_MODE_COUNT
 };
 
@@ -282,6 +284,9 @@ static void run_check_replay(struct test_data *data, enum test_mode test_mode)
 			 data->flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
 		kmstest_wait_for_pageflip(data->fd);
 
+		/* Do some page flips and let the replay enable */
+		page_flip_test(data, output, TEST_MODE_FLIP_ONLY, FLIP_FRAME_BEFORE_TEST);
+
 		/* Panel Replay state takes some time to settle its value on static screen */
 		sleep(REPLAY_SETTLE_DELAY);
 
@@ -366,7 +371,7 @@ static void run_check_replay_suspend(struct test_data *data)
 		igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 
 		/* Do some page flip and let the replay go into live mode */
-		page_flip_test(data, output, TEST_MODE_SUSPEND, 10);
+		page_flip_test(data, output, TEST_MODE_SUSPEND, FLIP_FRAME_BEFORE_TEST);
 
 		/* Panel Replay state takes some time to settle its value on static screen */
 		sleep(REPLAY_SETTLE_DELAY);
-- 
2.43.0

