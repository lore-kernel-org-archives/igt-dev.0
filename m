Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5406EC77B7C
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 08:05:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074E889A4E;
	Tue, 24 Jun 2025 08:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="buqTJ5q7";
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2054.outbound.protection.outlook.com [40.107.95.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C39A89A4E
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 08:05:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S83pYIbzxrNbDKehi6pIELc7EmjqFuCV0VOR7b0r+QIpEOmUYkUYfEpjdCk92D9ggKLXez8GBhRgqoWhQFntLTt6xtQSSETVgcC2Sfv/v095T8N+OJsI8uSI4jCaFNwGHNOzc/6wbOTCq/RYWM+Uft9PpzCoBuCCsx/uVVX4+4AHAUWWAs93E59bTwUZcWNLheyWkfbVJAwEP2x/5EZQ8z5df0LciM9+hSqHhfiiINaFCY8LZ/OMp3hUVFvqaPyD4hIqxt5nlyDhnRQ6I3Ji8e31Wixe7KC/Nl9wskKAJL47+Rylb8myvUP99L/ww8Z4gHhKMp131MmYUeM0SBl/7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLPVYYhtaFGn/gxBVM1wkA0x20VOzf6vNrXsyb9M9UI=;
 b=LyaGZqX34dds9JDK5T2rf5H3+WsPDwPjwKPZgujrwYoK35RqNR9NPMHbqIpRIhejAgm3VLKNOxHX+OS4X6vaujfK+Pe9U9rdqAiN8Zawn0UbqWFCcrp03Re0oQltRxwt5XNeLmZwtffad3tq/qh1IcquLRHI9zDZVvIsH2AhkKJusCx4WZOa2xLCuByRUMU81VxWFYP87XkC71/GwPE58MIrhXKY/ytyOheSTojqGLWx2yCKOv5nOjyyQQNEMDWoS8RpRXoA6rDt7sISmlJlmNJNooQFL6h1MRBE+3uMTkT3rSXNGCpzYlWvKlgvHw+yjeSRyuIVvMKsh9YYiPadGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLPVYYhtaFGn/gxBVM1wkA0x20VOzf6vNrXsyb9M9UI=;
 b=buqTJ5q74L2UVX6Pl0VfwQQqU0BcGUR8kHqsE9Kykp2MnkWKraci9Yuuw2wPyZz3IlL+uLV9J2CkuD+zanmD5s79UqSnO6dAa7GyheRpwETmD/rr1FozQbg7hx0tqd3IEB0n3rrxrEFTUUWCXSLk022k9LcyUyi6JXk0NB4iy7c=
Received: from CH0PR03CA0033.namprd03.prod.outlook.com (2603:10b6:610:b3::8)
 by DS0PR12MB8502.namprd12.prod.outlook.com (2603:10b6:8:15b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 08:05:44 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::55) by CH0PR03CA0033.outlook.office365.com
 (2603:10b6:610:b3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Tue,
 24 Jun 2025 08:05:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 08:05:44 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 03:05:43 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 24 Jun 2025 03:05:41 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v2 2/2] tests/amdgpu: Add SDMA with UMQ test case to
 amd_basic
Date: Tue, 24 Jun 2025 16:05:30 +0800
Message-ID: <20250624080539.3548500-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624080539.3548500-1-Jesse.Zhang@amd.com>
References: <20250624080539.3548500-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|DS0PR12MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: 4146b458-c393-4581-4fbc-08ddb2f5eb51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UG2ocaGNsDDJNbsUWDnhXIkEYUZDtEL1tV3U6A4lvTkZ6hCXpoiklyKnmVc0?=
 =?us-ascii?Q?gJ47GEqTs2H5Uv1pxe420RrTrZa+DRRLK1Rcdo8I9Kxmd/23gwzcoBdSWMxp?=
 =?us-ascii?Q?KN5z0crckwEuR9BU/zv+8gEN0/q6pkmeDgT1CX0+S6ALrPLv+TkEkrujvXFL?=
 =?us-ascii?Q?WBUNllnuRDBhS7ZG6RMmZih50GPpvWa+aXd1vhLzSANovFteoD5MvaBxIWi3?=
 =?us-ascii?Q?BphZspR7qOBLkCBvamUoG5Ifd18USgB6qd7ixPCz8eg40cvo9ze+HWnLvjp5?=
 =?us-ascii?Q?af61YV3Ua4X/DAV5uN9kvEmMQISeAeTMfcN3yzfLi22jYUO2AB4BIbjvN3WD?=
 =?us-ascii?Q?MFxWKUqermTgSc9UfoMr+GBHRpLZNwrnun0o7sxv3zff6+Ic6sx4fW7XFVfV?=
 =?us-ascii?Q?uHhP9vFF8ZpX5rNvqvsGsEeL9aRxs1VYMvH3UPb0dOIIMD6sljywMtFyFuE0?=
 =?us-ascii?Q?QRLXdMl+fOy+rVU491RPiUjpr44Cw7hSSL6u8Yr3xleBdPYXMtcLo1t8tlqw?=
 =?us-ascii?Q?Vpw7NFbfaPxwCfjmMX6lD0pLSj+rffZLCdjGuvGp85jV1ttEsSOT6k+5vKT8?=
 =?us-ascii?Q?uQ8uxT68TiDO+fJEU/uRZcHu6TW2NPs+LzShGxFfmYwwj2xLlfqCC41+YXYD?=
 =?us-ascii?Q?oXJgRpQ73Fi1bHPXCQgE5Aw/094xxNlsae8+h/YbmCSd+1ChB1cPxCd3olCe?=
 =?us-ascii?Q?BNEug89xKY5UyiUPsF54mM4/lVvLqVfNc/rPbdIBKfO7ADlJlVPEzTZxGuwx?=
 =?us-ascii?Q?6yiBeawQ521GTfQ8xZDl7+DQRX2LfI1pyYH1EmO91fKxlX+8hGMaC4TkZURg?=
 =?us-ascii?Q?auICIpCyveYNounOlBbRJi4zmgU8sV5oI/w/p3sMCr0NGLryOYzR2SreRUWw?=
 =?us-ascii?Q?2MbqY8Y+guGQeWGX4WjZBaPKI+qzO2HkR3oScGvd0sBttBez9eL/MHK1VPPn?=
 =?us-ascii?Q?jSKbiVjpBw2WtRKieoZ8VtCd4/cH8wwd6K8HHDZh8ylyAd8LkAe3N579cwTo?=
 =?us-ascii?Q?OL38lWU+4YZjj+SrRJ0RWbOL3DrVO6gYInrR+rnGnbxv1Wwo/w+K+M2WZqKR?=
 =?us-ascii?Q?5taWer0VpKiNOvbMaD4R0e0qdkug3aipcvS7RVHtvfRmvm5wWIA8C85hKAME?=
 =?us-ascii?Q?eaTgWZi5EHK5OJwA8zAlvsA7Lkud7Hp0cIiKdWVP+WsR0U7qTpdZqfVKK2g/?=
 =?us-ascii?Q?EcPMeqI+3Nkger4xdX0f1n4r9Kwavm3bOcaVjJNGUFLkF3RRexHwU5XI4vpw?=
 =?us-ascii?Q?j6JvDOb5R2DXtP2LAHBNU9D5/RdQyDdAKje9T+s0KWsRRgyYoo7aBr4nX9Ys?=
 =?us-ascii?Q?0JgV174VrZDKddppeIC3xuEXbuFdwDHJrDXAQsJzFwTakrhEYFxoB+JbaYaE?=
 =?us-ascii?Q?qb5BDaD4HO3dc8wKxJKt31cYwfut0sBulPnqJCCGs/RDQhf8IYq+Pzne6A2c?=
 =?us-ascii?Q?G8wUXV/SDqMbYv9qn3rMVN8UnQ9A6IUjWIVsoYinKaJDzokmZmQxZ7kycF/s?=
 =?us-ascii?Q?Ei6DIZJngCqwNUFrBvdZiof6dDfVp2WOWs4O?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 08:05:44.0653 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4146b458-c393-4581-4fbc-08ddb2f5eb51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8502
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

Add a new subtest "cs-sdma-with-IP-DMA-UMQ" to verify DMA command
submission works correctly with UMQ (User Mode Queue) for write,
constant fill, and copy operations.

The test checks SDMA functionality when using UMQ by calling
amdgpu_command_submission_sdma() with the UMQ flag set to true.
The test will only run if the user queue capability is available
for the DMA IP block.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_basic.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 97a08a9a3..10af3271a 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -116,7 +116,7 @@ static void amdgpu_command_submission_compute(amdgpu_device_handle device, bool
 						     get_ip_block(device, AMDGPU_HW_IP_COMPUTE),
 						     user_queue);
 	/* nop test */
-	amdgpu_command_submission_compute_nop(device, user_queue);
+	amdgpu_command_submission_nop(device, AMDGPU_HW_IP_DMA, user_queue);
 }
 
 /**
@@ -136,6 +136,8 @@ static void amdgpu_command_submission_sdma(amdgpu_device_handle device, bool use
 	amdgpu_command_submission_copy_linear_helper(device,
 						     get_ip_block(device, AMDGPU_HW_IP_DMA),
 						     user_queue);
+	/* nop test */
+	amdgpu_command_submission_nop(device, AMDGPU_HW_IP_DMA, user_queue);
 }
 
 /**
@@ -815,6 +817,14 @@ igt_main
 			amdgpu_sync_dependency_test(device, true);
 		}
 	}
+
+	igt_describe("Check-DMA-CS-for-every-available-ring-works-for-write-const-fill-copy-operation");
+	igt_subtest_with_dynamic("cs-sdma-with-IP-DMA-UMQ") {
+		if (userq_arr_cap[AMD_IP_DMA]) {
+			igt_dynamic_f("cs-sdma-with-umq")
+			amdgpu_command_submission_sdma(device, true);
+		}
+	}
 #endif
 
 	igt_fixture {
-- 
2.49.0

