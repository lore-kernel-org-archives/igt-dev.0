Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4EDCF07A2
	for <igt-dev@archiver.kernel.org>; Thu, 10 Oct 2024 04:58:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915D810E859;
	Thu, 10 Oct 2024 04:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fwWGM2+L";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C5A10E859
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Oct 2024 04:58:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQcEXYSUjV/U9ohP+RkdkU/kD8zfoTP5c4tybdsWTZ0ZV1XldRUaxvcB9qJ48uY/SE1hjkVUacuS9XjChMsoCgn4cqWcE5hvo4TA98qM9fFzrQLTH3+syXQBxM6pzBjkkGCQKlJww6CcNH6ZTzR0wRmzmgrYVkKGEuv1QB8gOa8etVdWVQxcK4pmN4aEPWPIyMzdS/GHRSO0kohmP+0ygzedTQS0b+umNDcqr9qz4eT4A10W/qvJOM9djJ4IXJLWvsyY8zVFfXsIqS3NOYReHegCNW/i5TfmF/APcedoeTnLDNs8hOxIFU9TAr7iWRmnemTeydpFelnw9nf4CY/W7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzqieM+MaD1TvbAEXEcH9w9ULwk8fTNXNbyceurB4vk=;
 b=ZlOAhmdi45mtBR0Tz0e+Ol75/ZHEMBtieToDmSBZAJHqQxF+9SIBxSshhCV/DgKq/vzdE97L2rVa4TMuyyCKcRBOw/RDX11y16gwaz1pNDSwzfhzSmUv6kYeTeof4hg/mdLBXHgjltQy06iMIaeafXf6vqGazOoKzuBbAtMR+LQSn3bScJcsIxkJA3ylNRNFEWlMbp1At9GqquN8aHB/F/PMOOyG7oWu9kT2TeYRusBijNpWW6TAeWsxx586ucb/cJVm37aeVgeo0wk7saRmxcoozYRCJK0XdxzsF3ha0M1KgBJOF/UC+cNAsehLjMzsHUY2bQQtfnWe1bChwzYPZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzqieM+MaD1TvbAEXEcH9w9ULwk8fTNXNbyceurB4vk=;
 b=fwWGM2+L7CqwltcKQjcyvBJrblJKG0MUJxTj+xw9LZK6Be/QkfnKEH74BVGkmGWNXMxURBkJzWfOs3a+cZR1L036lhcAqnZlLFOvHJk93r1Y7tFxM11TQhYYEL74FRTRuBMsBcWzj0u2TirSwsGRBwM4ptfa5D72tE6bvvaa0ww=
Received: from DM6PR06CA0102.namprd06.prod.outlook.com (2603:10b6:5:336::35)
 by DM4PR12MB6158.namprd12.prod.outlook.com (2603:10b6:8:a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 04:58:26 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:5:336:cafe::b0) by DM6PR06CA0102.outlook.office365.com
 (2603:10b6:5:336::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18 via Frontend
 Transport; Thu, 10 Oct 2024 04:58:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Thu, 10 Oct 2024 04:58:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Oct
 2024 23:58:25 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 9 Oct 2024 23:58:18 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Jesse.zhang@amd.com"
 <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 2/2] tests/amdgpu: enhance sdma test for deadlock
Date: Thu, 10 Oct 2024 12:58:10 +0800
Message-ID: <20241010045810.491920-2-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241010045810.491920-1-jesse.zhang@amd.com>
References: <20241010045810.491920-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|DM4PR12MB6158:EE_
X-MS-Office365-Filtering-Correlation-Id: e0d87fa3-f813-4254-2a57-08dce8e82cc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4YLkA+WAwUeHjtQv4W5b+5igvfDJaeR5SfgqOa/vyRJ0yz9v5i/ngy1fMpXU?=
 =?us-ascii?Q?chq+OMFG0aQlbdwMBFBOPRPaw+uy5/9rt1gBRyj5uE4bEPzNYEOLpMvjiR/p?=
 =?us-ascii?Q?iO1MMIyqbBtlPRxEEZ8Nhb+gxB4pjlna8LlT7ie66Q9041AIBh/CdqO4y9aq?=
 =?us-ascii?Q?fVGP56EEpaRMdgaj4lNnVm2bPlKiDEDdvJ/ir9iZuIqxBBbKzEDap/PcOBzl?=
 =?us-ascii?Q?E8Op5wtW76Y8GYxgGpagdInGmP8zkhDUpA/oiDwpMVuUOofq50TfC7Vd7/3g?=
 =?us-ascii?Q?p2ZljVmqIfmQQSjUwlu/rwr083UmGJ8cCM8ZCHYiEmCeH9L/4XKT60Vetmu4?=
 =?us-ascii?Q?CKSjZ8RomygDm/FvT4BizdH2c6D/KVxF/tSGL0QESbofVzqIhwgFDhf8yRCz?=
 =?us-ascii?Q?p0wCD8nYrcBEpt2t14tX45BVsnuS5AlAV9rAP8eCZVPXcWQpr/dck13V0wiI?=
 =?us-ascii?Q?Yh7TLUqSKmJ1XIgOC8zCUk2Q7/cxwC72HEKAxS2JgHFS0CXwZggUf3MWCoaI?=
 =?us-ascii?Q?8ofb/QebcDM6IM1lXCSm/9SJ/bB109R67XZIEF5xIr/r6Q1c9tPiViORh/Z+?=
 =?us-ascii?Q?DXvi0IYObfDDk9SSb9YpRog7xtBt3mgUbEPLoE2T52eUY6A5gsDeZtSU7I2C?=
 =?us-ascii?Q?BpJf/+gZq9uiB1KxrzIaIJRSLPlcc56YsOgoo8XojiUkTW3yu0HR8ltUZeBS?=
 =?us-ascii?Q?V5u750aiDz6bAb3dTw/y4ZyTZZjfqJhRBjVXgxcebAlsJeTrTqHvqF/K/g6c?=
 =?us-ascii?Q?YgRrTSTEF5+sJz9FA2ZdinKgGLFNVSfL9Jsv8gii8zS2/iDAFNgQI8HTF6zi?=
 =?us-ascii?Q?SWxF59nw7d1EDQ5d37/dfjtFUo6w4Zs1Kb/E1DSxY3yp986QZ1MrO46ITf5k?=
 =?us-ascii?Q?C7VbhUCKvRGyuDPVvq4iqfYfJfxV8MFbF8mvE0m4u7uED2yjCeUAunHTBCUg?=
 =?us-ascii?Q?vbmdqX2wfKV82hsGaOIY0ri2nz73WC/rX2le1+WQOlqMs0UE4eO1f7V8QQZp?=
 =?us-ascii?Q?fkkXzRf09SdEJl/F4HvP1HP+fFUpnwSKDacTpgbHi/GaCljNOwz1b3pJoQjB?=
 =?us-ascii?Q?a36zjQQVbUPWt0RZAtzss2okpLIHOPwVdhlSYnw9pldc3ONMQ/D1nNOdON/4?=
 =?us-ascii?Q?sD43LpU5j20cjt3b4jo6DJFEIm1yqHWuuW6Fd5UOpjIrSM3hTKnQiEzXR13w?=
 =?us-ascii?Q?8BwnpO8RTNOPTpCZ+UN3zUt18QGai59UZqsBU2MHGktae31Q2rL5ZHbgNjLe?=
 =?us-ascii?Q?pfHb3+htY+QTBOq9iX/dsgc+WTfZVF+HYHLsDYqi3KqXWN3FN1QGo4dtWrGX?=
 =?us-ascii?Q?BrKRKOh1wfQ3N8CLsyHXpYXCOiqRjlEbxd4XUUUf8utiErcO5CiiuJR7ppq/?=
 =?us-ascii?Q?/5O7C3TcLqLRw8nBtv/rJPJlOHrm?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 04:58:25.9915 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d87fa3-f813-4254-2a57-08dce8e82cc6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6158
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

Test all sdma rings and ensure
all rings can be recovered by sdma queue reset.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_deadlock.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 696fac2eb..b5d053663 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -73,7 +73,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-gfx-illegal-reg-access") {
 		if (arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("amdgpu-illegal-reg-access")
-			bad_access_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
+			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
 					AMDGPU_HW_IP_GFX);
 		}
 	}
@@ -82,7 +82,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-gfx-illegal-mem-access") {
 		if (arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("amdgpu-illegal-mem-access")
-			bad_access_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
+			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
 					AMDGPU_HW_IP_GFX);
 		}
 	}
@@ -99,7 +99,7 @@ igt_main
 	igt_describe("Test-GPU-reset-by-access-compute-illegal-mem-addr");
 	igt_subtest("amdgpu-compute-illegal-mem-access") {
 		igt_skip_on_f(!arr_cap[AMD_IP_COMPUTE], "SKIP, compute ring don't support\n");
-		bad_access_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
+		bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
 				AMDGPU_HW_IP_COMPUTE);
 	}
 
@@ -115,7 +115,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-corrupted-header-test") {
 		if (arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-corrupted-header-test")
-			amdgpu_hang_sdma_helper(device, DMA_CORRUPTED_HEADER_HANG);
+			amdgpu_hang_sdma_ring_helper(device, DMA_CORRUPTED_HEADER_HANG);
 		}
 	}
 
@@ -123,7 +123,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-slow-linear-copy") {
 		if (arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-slow-linear-copy")
-			amdgpu_hang_sdma_helper(device, DMA_SLOW_LINEARCOPY_HANG);
+			amdgpu_hang_sdma_ring_helper(device, DMA_SLOW_LINEARCOPY_HANG);
 		}
 	}
 
@@ -131,7 +131,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-badop-test") {
 		if (arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-badop-test")
-			bad_access_helper(device, CMD_STREAM_EXEC_INVALID_OPCODE,
+			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_OPCODE,
 					AMDGPU_HW_IP_DMA);
 		}
 	}
@@ -140,7 +140,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-mem-test") {
 		if (arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-mem-test")
-			bad_access_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
+			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
 					AMDGPU_HW_IP_DMA);
 		}
 	}
@@ -149,7 +149,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-reg-test") {
 		if (arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-reg-test")
-			bad_access_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
+			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
 					AMDGPU_HW_IP_DMA);
 		}
 	}
@@ -158,7 +158,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-length-test") {
 		if (arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-length-test")
-			bad_access_helper(device, CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
+			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
 					AMDGPU_HW_IP_DMA);
 		}
 	}
-- 
2.25.1

