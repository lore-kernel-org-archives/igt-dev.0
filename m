Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C6FCD13CF
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 06:51:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4203910E1FA;
	Mon,  2 Sep 2024 06:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Yx39a6yG";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2089.outbound.protection.outlook.com [40.107.100.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F56D10E1FA
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 06:51:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLg6CNREmgyDiGsYyrXBirmAbEYyg/jIkAHiiVASL2j22pQyuZ6sSoGcSRsDPIgmj27VYXcKJROFahDLYFN1Kryl7u0b4JeLr4NKigGUdx/EZajB/VAUd5/FS72x7liE5qtXQ9yHrk+eEdswoIRtPJUcevqDnXPNjsFsNT2PAVfnIQvEPVW32xqStcOZz0I22a2B15wZIXAIZ2RjYbEvH8qxRn5yV6HZlq1FCPokoybcYAMUJrPBgHS5AQwtbl+aevefRdKa4uDzwXIGy/UGI9ku7IG9MpDEXpbZXeIGTv0jGA9bzqqGOaKUKYz2KktljXZbzLmqR2NQ5PfE64z3+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0sFGAZn164jFtijADAUfz5ke+SmMVEJwBo/NUOAflk=;
 b=NQ7gB3T898tqqjKWIjNGaQ0M1bgskoTlxWnRCYJ9SVoOGHyJR1/NW7S4c2+a6M/nAwbgJl12+u2SluOCRBKJjF1jz2D9/7DwYchYAlO1O7yZVAKPtFHqbfXaI7ADYFvRRQrNV3sKRryMzIYRaOEUUJQ/OGYF0qBOoDjsxJTptlqJY2uWuJCUzRo/z9RiIH9CRknO1Aw5lB5A3Mo/M8F/05ec65WuEyIeArimhpv8IBnP3bCq602/EPseFCXtXdVAbpno+MhmTcvHKPKXdtLcJptzA3oXPMq2zx4kGEB3ypeys7n+vNQ0BD0LqynTeiXboBP3PyH8pMHOT8zI2k6GVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0sFGAZn164jFtijADAUfz5ke+SmMVEJwBo/NUOAflk=;
 b=Yx39a6yGxym4GRs9x/e24+CLW+TfuzvmZ7PQ2BLWDoKYKcG7F4baZOcApJhJgTWUdaODYKHJGRqWWlFDxzECza74bwmJvBOJxA2Q4uARjQY2YJtC8ifsNZaFo3OWNVhU68qiOiFb1t1RAFxrlIKc7DcVVhLEzImhJR+54oRXvT4=
Received: from CH2PR07CA0030.namprd07.prod.outlook.com (2603:10b6:610:20::43)
 by SN7PR12MB7131.namprd12.prod.outlook.com (2603:10b6:806:2a3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Mon, 2 Sep
 2024 06:51:16 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::1c) by CH2PR07CA0030.outlook.office365.com
 (2603:10b6:610:20::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25 via Frontend
 Transport; Mon, 2 Sep 2024 06:51:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 2 Sep 2024 06:51:16 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Sep
 2024 01:51:15 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Sep
 2024 01:51:15 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 2 Sep 2024 01:51:13 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Subject: [PATCH i-g-t] tests/amd_deadlock: fix sdma error type
Date: Mon, 2 Sep 2024 14:51:08 +0800
Message-ID: <20240902065108.487239-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|SN7PR12MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: 3680cb5f-32ff-43de-eccc-08dccb1ba485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?746FW1PW7Bo7b97efksoc994G9DdYmUjGm41KvfB1XMBo3y0j/OAlGRrY3LJ?=
 =?us-ascii?Q?5FmqPzOo616caP6/DiS2y986DXU99+yIpytcEJj9a46IGHUeE55+TG1XsOwa?=
 =?us-ascii?Q?BtdJmg570cfBWaWEOQMnOR2+5MgoYPRfoqRJUDhB+dOgRtRdwIqKVEjMF+jE?=
 =?us-ascii?Q?L+QqdAqw9goiTpP9J94v0QlyTq92CGlFn2mnB2cl9POYXI6a0eKoQWu6FLAq?=
 =?us-ascii?Q?Xw4j+FOVRjtn52/uOP3/p08N3ng2WzUyjawDiysRmFVBIm82W4b+gLLZwoK+?=
 =?us-ascii?Q?NwSEysUE3oXdJG2uh3OO3ykbr5MQGvNGMnLjpn2fOC8Cl9/cyR0SvvoeyHl4?=
 =?us-ascii?Q?GUL2qrywEIrcu6KjEysp8f8hrgJXlabo6BfUIHn0DVddLhAvJVlIAdGb0j7Y?=
 =?us-ascii?Q?fbvQ6hx34A+eQacdxdqNvfUkP+A/tLcy9p7OLQmuYa6XRcgq8jx5bJkB/GNc?=
 =?us-ascii?Q?tIGj8bbXDHxJuscKjiDd7GUZ7Wf5fVjLzo3r7NMiVrXYJz/k/xcSFwrxqCgW?=
 =?us-ascii?Q?iV2BCLhzl/3mmcVpO6VbupCKVjVAlWWKr0yuKB9e3ZwUJsLod++8Dve7R8TG?=
 =?us-ascii?Q?LZ4G+jNclkmanYyA3NSIX8/8iWOtPKQfmmPG0tpPO66DRliY5q+/3NhAA0FS?=
 =?us-ascii?Q?dPFjIsDvHgxeB23gNOFjbbDetFzsl9Zi8p0Hi2TpkA13uF+BMHVYPETVQVmg?=
 =?us-ascii?Q?2YpkmskAdBLkohYrqOX7+qavnPUg0wUwWZNQrbhPkSnZ5JAawECl9VC5ScOm?=
 =?us-ascii?Q?f4S+X6j7naTipNKhFAp3dXgx9f3zBX28BI8v0BJ6jGBDwtCGeo8kbmziZpzu?=
 =?us-ascii?Q?atDMRFIvQhSkqbEuncrAUZdK4c4UAr3LXR0XAvUq83TsedoRbEHHyqDcxbU3?=
 =?us-ascii?Q?8wCnPxHQKXt95xSq1a/KsgwOAUIPrIJC7nG6moGiruW6tCLyFGh7OsfhqAkX?=
 =?us-ascii?Q?9IASjPEbCwt4k3I/clVaOhYJaTodhKvx/0sdho1SYL7r0w9pGQvl3yVVtykD?=
 =?us-ascii?Q?eWEXZkhVkm4tTfLga0RjTDhII8TA4qVJ8ndvNRVWRK6pXa0k3TNdUmvfXtSt?=
 =?us-ascii?Q?FR1xyRF0zP+Yh0vRtrlty/Z2LYGAbwVepVegGSlZ7dIHmYWVsddjhktOfyd0?=
 =?us-ascii?Q?A3lzkiyhX6pfH0jNU95Gzv1jSwRgQFnR0hn3Gpn//chy7hignGCgvhcLX7Bp?=
 =?us-ascii?Q?YR9OololXB2Kxu3R9OjLDN+XpzQqPy5hOpBU4Tu8w3W5w0JwK54X+2sydV03?=
 =?us-ascii?Q?FyNjfLgUFZ5Bq4RScHnOU3e02PI6XBkd4XJ/XV3hHtXQwaWOIAy7L63adSRe?=
 =?us-ascii?Q?5tAgt2dw88OpyuB5FAyelPLjLSJBlxiJt5BF6rUJN0229KThTyhLkTjy83fR?=
 =?us-ascii?Q?GsKweLlNBGiTGgC+txR1GzKmwEqmBLVRtmx/poHIB/oDMB282aiKpCjuwVpJ?=
 =?us-ascii?Q?XiCz7Tx9zY8kE/Ey45mbpO7hX4kfSAxl?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 06:51:16.3782 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3680cb5f-32ff-43de-eccc-08dccb1ba485
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7131
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

Correct the bad error type for sdma bad length test.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 tests/amdgpu/amd_deadlock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 5635d0982..696fac2eb 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -158,7 +158,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-length-test") {
 		if (arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-length-test")
-			bad_access_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
+			bad_access_helper(device, CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
 					AMDGPU_HW_IP_DMA);
 		}
 	}
-- 
2.25.1

