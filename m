Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39D8C282C5
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 09:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F50510E3B8;
	Mon,  3 Mar 2025 09:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gLgdNgvD";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2051.outbound.protection.outlook.com [40.107.100.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439F510E3B5
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 09:56:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPoO16jz0ycUoEZfSc9x0awAwzpmsyAjsKYlF7zGGSkGZV2MnGlLZtVcGZJ3DinU2K0LrONPAOPZxgtLJC9WEQ5HUuC+FoPwb4G8N5LEhjvvqGyI16Xr+/6Svvo/7mW0/HbQ0KuQPIoIhiO2r1KroUMJ9DAzZlZnXBtH8/+g27C11nqlyqyCTnf6S/K1F20FDf35vwV1k0dfl7obLa3+wQVR4othh42tGtBDdYb+IIX12pnRvdqllshMJ0sf6kP1VkifBZNM30nKy72zpFyAGFiAl0tPvVx3uKY3NEhcHX52JN5nbOv3h/Qvi9SPZ3CZL/RjCBBUMl6MEbUD+zc6Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AtOtgwGDYbcDod5/dG6md9i+wSwBP2zA+KIdQC4TM0=;
 b=E7uUo1iMSnzFvnRy05/nbHut9CSKMCPNh4kBetmVszb/CcCVWePiq5mgrgQeY2D/9tIDROFBM0w8VmA5WRaOTlEGIhiTsWBWx6uG1wlvYDw1a/b2J+3vD3DeBGI+Vvx2NpZgcCwqKn17Ka0Y4nvxL11ichFMOPf9+oNI006ZEZzQ//jhQNt/LPmI3Kbh0zeeh9BbirB75SO1oR3afWHuxYJa5nocpwFlV7kmbD3IoNCGFDHF4tLFM8AM8HS5qLStbdKluOO0a5kxrR6WsJ7/gT8kjIwPiGBPkso6Ydcc+Au24fnpBZTj3JkNntUUj93SiZk+cGQ7megVGa9NWTLbTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AtOtgwGDYbcDod5/dG6md9i+wSwBP2zA+KIdQC4TM0=;
 b=gLgdNgvDBJIYDtMNdqnWvEJ3bX3xaAqzL6GZKbrHjgd2gtMnlUDovUDfxhcT/dwWv15QDDaCrbxa4XYx4faRDVxOa6w7J0CFUXo+1uFjNh0erhWk1MaxPxzuRSgRKX4NO3KLi/vYt9pT1U2sC3XkC9M3kNPtwpfijdBXzLg16Lo=
Received: from BN0PR04CA0210.namprd04.prod.outlook.com (2603:10b6:408:e9::35)
 by DS7PR12MB5840.namprd12.prod.outlook.com (2603:10b6:8:7b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Mon, 3 Mar
 2025 09:56:41 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:e9:cafe::42) by BN0PR04CA0210.outlook.office365.com
 (2603:10b6:408:e9::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.28 via Frontend Transport; Mon,
 3 Mar 2025 09:56:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Mon, 3 Mar 2025 09:56:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Mar
 2025 03:56:39 -0600
Received: from tom-BIRMANPLUS.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 3 Mar 2025 03:56:38 -0600
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu/amd_replay: Skip test if no DRM DP AUX
 Interface
Date: Mon, 3 Mar 2025 17:56:21 +0800
Message-ID: <20250303095635.2874-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: chiahsuan.chung@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|DS7PR12MB5840:EE_
X-MS-Office365-Filtering-Correlation-Id: 78befb76-8eec-4f23-8e6f-08dd5a39b1c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?US8wMlQwM3NzQWh1QTI1dWNnM3V1Z1h5MDZ6U3A2R2kvbTRxWGhlVjF4d1FD?=
 =?utf-8?B?VUEyMUpjMllIWUluR0MyNUZvYm5JeVc1cmFZTFUwQngwVnhvRkx6dENXNk9R?=
 =?utf-8?B?VXdYUVUvYVJtclp2c1FCbjhwc2tBTlRlc2NPRzl0Uk52alYxMDloM3dWUFI2?=
 =?utf-8?B?MGl4M0kvV0VIbldrZFBoM3VTSFVrc1dBK2RPYWJGbDhXWlJFb2orcy9sS3p4?=
 =?utf-8?B?Z1lWZFhIeUFjbWpEN2NGbitaVEQwVXlvaitSSmZZZWhiejljZU9pSlUxZXVQ?=
 =?utf-8?B?Rkd0bEN5cG9TRDZYN3B1ZDE4ZWM3enV1empQbmRwTThsSGJqV0JIRWh2WVUz?=
 =?utf-8?B?ZHowKzFxc2JsRFA4clNWNnFoWXBaU01XY05iY0p3NDAwU3lPUVdnRkF5bXEy?=
 =?utf-8?B?R0NKVnI4Y0xLN0JKb0taMDdsSTBKU0cwMjVnbjA4SEtsRHZLVC9NMlA1NU5X?=
 =?utf-8?B?OGhOTkowSHkxMDlibzlMWndZZHp5bVBZUFNVeHQ0aDRVZExHNXVDVlhCVjdD?=
 =?utf-8?B?UWR3ZVhtamsvZDg2S1ZGcGhpS1VESUgrczM3dlVPZlRVNURab0VOMDB4OHQv?=
 =?utf-8?B?UmhtSkx0UjVqMkF5eHdRYTQyRzlGQ2hXRWNvUU1aZUVudkIrWGhTV0pFWEJN?=
 =?utf-8?B?dmFvczBHWUhycjhRQ1FET282VEIvV2lYSTE1K25NM2N5UUVMNUpIbysvUXRu?=
 =?utf-8?B?dC9scHNWRnBMZkRoQ3BCdVU5N2NwM1p2Rldlc3pZbnM0MmVTM0MwVnAwVUtO?=
 =?utf-8?B?UlBqQU5kMm40Zkx5eDZkYk1YSlpHMU1LV3ZsRjZDRk9vanlqTEhibWJVbjkw?=
 =?utf-8?B?bElvN0RRM2NSYVVNTExSaWdtMmtlSElSamp0WEZSWmM3a1QyUTdLZW5GMy9X?=
 =?utf-8?B?OUl5Y29ObVpMcndKbnRYV1l4RFVjdmNwRXBRQ05WY0ptbUJVeUpwOU9qZHEv?=
 =?utf-8?B?K0s2dndZdXY1UUVjVVBYdi8wb2VnS1ZiTm4yd0RoSFM3eG5BalBORldZQnIx?=
 =?utf-8?B?S29QNm1LSi9mVDMva0JRcnBUTWZiR1pKYllOaXIrOUtGemRqRHlqZnMwUUFu?=
 =?utf-8?B?Z1VCcjBKNENCRGFDQ3ZybVFOMWNkZjlCT0E3TDlYT09JREs1VWRabVo0VkdU?=
 =?utf-8?B?R3kzOUxLMUZ6dW1rVkpKWlBOWk5xTVJRejFEaG9iWjVGT1pyeFdoc1JJV3ls?=
 =?utf-8?B?K2QzTmgxMkdyTjJ3NThvZFNKS1d0aDkwQnpUZEZKQy94SVVNZXQybHRxZnNY?=
 =?utf-8?B?R2NSbFJ6VUc3UkdZL2VvcG5iaXFxTmZ1VVlpV0lGU0Q0RXBSNkFLSDhqazR3?=
 =?utf-8?B?dTJrY1Y4b2djakF2cFhuZHFWa1FtSGNaYmJTZnQ5bkQ4akpaMWxHRGJqTGt5?=
 =?utf-8?B?VzdZN3JCNHpRWlZGb0N1eVd6UTJtdWI4WjFjMm13Sm9KbG1rL1MwektpQkJH?=
 =?utf-8?B?Vk85ZjF5R2g4M3o0TGlsWWhoRzBzcEVVbGJTUHBaRGJjYWl0T2tpRHY5bjZu?=
 =?utf-8?B?eDRyZGgxbmZieTVlRGdrczQ5LzNncVpCdElxK2xNVThqemhDdk12cDdqa3ZE?=
 =?utf-8?B?YUhubTJXR0VVbG9VMW1NNCs3c1R6S2FIRFRBZkc4eHZaWTY0RFJmckUweUxO?=
 =?utf-8?B?VGRUd1orZFNibUFFakJrS3dWSWJIaHNna0JzRGRTMGVVSGZKQWtUTEdRNWlv?=
 =?utf-8?B?SVNicFVoT0JRbmVTWVlHWWNqbGlnMzQ5d3Ewd2pBRzBYLzB5bjg2Rnd1TzFy?=
 =?utf-8?B?bXJXVDBNRXpkNmo3c1EvMUx6SyswZy9PaGl3S2lZTFNMekFyVVdQUkxxQ0Va?=
 =?utf-8?B?S0FSNEsvNWQ3OGdpRTM0ZHJzK2x4UkdhK0VobkkzanBybllzUkVEckllUnJN?=
 =?utf-8?B?RlFLblN4WkJrVHBYNTRzMGc5eVJFWHErL1JsWGZPdzBURHFZcldRdjRPM2Jx?=
 =?utf-8?B?WlhIS3UycklmZFRTTi9Qbk1zdlRQbEErbUJZc0VPRTVNYUZieHNmQUZsTDcy?=
 =?utf-8?Q?rB5Srnx9QNvKzexZ4LUYwlhxVWJHI4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 09:56:39.8421 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78befb76-8eec-4f23-8e6f-08dd5a39b1c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5840
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
The Replay IGT test need to communicate with eDP via drm_dp_aux*
Currently the test will report FAIL if no DRM DP AUX Interface
found on the system.

[How]
Skip the test if no DRM DP AUX Interface on the system and info
the tester the DRM DP AUX Interface need to be enabled in kernel
config to run the test.

The following setting in kernel config needs to be enabled for
amd_replay test.

Linux Kernel Configuration
└─>Device Drivers
└─>Graphics support
└─>Direct Rendering Manager
└─>DRM DP AUX Interface

Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
 tests/amdgpu/amd_replay.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index db2ac2de9..500e8253e 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -212,6 +212,8 @@ static bool dpcd_read_byte(int drm_fd,
 	closedir(dir);
 	close(dir_fd);
 
+	igt_skip("Missing /dev/drm_dp_aux*, check DRM_DISPLAY_DP_AUX_CHARDEV in kernel config\n");
+
 	return false;
 }
 
-- 
2.43.0

