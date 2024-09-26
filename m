Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2295CCFA13
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 07:36:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5009F10E050;
	Thu, 26 Sep 2024 07:36:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KsGMah4U";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6987A10E050
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 07:36:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKV7BvpVIOnI1Kp5G7TI87NjniqAnT1JdcppeL4jJHwt8ZuCFs0922lZU8By1l1y5lyXj7z04frbBV2G/TNIYJ3Ruvfagz+oC1ABDIP/T8Bq1mwsMnZ2U1QLpo933E14pYnv3n1YfcXVz61ZVGWwZbHGMs5hnoqDS4EFPKIvdgZxeJJzIxIuURbMPljXbkVT4DGw/d3OlRehnk9XNm1RQrT9EczVHgXZW4ojF4gYQG8JAWjvNU6w6v1SCoPfLbzE3GiPjZG2UlRrmffirj+52U5p22GcFXAY/As7pYs6+eV9ythoIgjVawk8CYJASx1c+0luwG8PTDA+4/TxgG+7Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXMOYSqO6v+qo49KcRMgKKKsoffb1kTSh2N9t3AYSeY=;
 b=CZTrRfyIxO9OKN+wX/o8+SLf/Te2SXY5QnrJij/r8eVWUQ+cm5glJ2Wy7HddI+kisbzdJIy15CffUX7Wq3LQkn+65VG3YA/1LLo5kYFrrmBAfswkihqC2jJaudYwz8OMrwLDVeUCSoyoAmm1IFrGTYbDs6+iPFUEudEwbWVIg2V+4Out50MfJFX/MckMwvl+7z6HCc7ewurpiNiWxvjQW5yw+dJiK4kjxd+mt4xyxKOfJNd00Ws75tcQU2y6K8i0rylRZxHnyOh3KGqs+6IiEBzfdHx1wmnY2ZpmnWX0iZFVmhmBevYbgOD3THiG0bQprm0AkT8VMeKXDDajRpBSoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXMOYSqO6v+qo49KcRMgKKKsoffb1kTSh2N9t3AYSeY=;
 b=KsGMah4UdjX7sIOa9tuJ4Q7E0l1tD2jbLNXeHGNM7nL8TMWHTvMT5VtLzUo14Vp0IZsowemXfVbgDp9BmKQThLYrXSR9x+77EsOSglw5z97znJn6TZfGqUlkcvjFeBPMgJe5tvo9+sLf7lqv+LHx61Tvl4UIgZqMuOozk78d+sM=
Received: from CH5P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::10)
 by IA1PR12MB7663.namprd12.prod.outlook.com (2603:10b6:208:424::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.31; Thu, 26 Sep
 2024 07:36:17 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:1ef:cafe::72) by CH5P220CA0002.outlook.office365.com
 (2603:10b6:610:1ef::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21 via Frontend
 Transport; Thu, 26 Sep 2024 07:36:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Thu, 26 Sep 2024 07:36:16 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Sep
 2024 02:35:41 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 26 Sep 2024 02:35:34 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t] lib/amdgpu: fix sdma linear copy command
Date: Thu, 26 Sep 2024 15:35:33 +0800
Message-ID: <20240926073533.3583336-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|IA1PR12MB7663:EE_
X-MS-Office365-Filtering-Correlation-Id: 556f3fdc-fd95-4b22-f61b-08dcddfde80a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zvfBMvFwhhTIICYXF3c6RFj8BVUaf7JzfmaEgvw58Q3DErB3V7jFUYKO8zQb?=
 =?us-ascii?Q?PXejSAfG0Vu7rXsbVKQ7aIVb4gTsoArmKmHqH7AhVKMXC9P+pbpW9epcvg4N?=
 =?us-ascii?Q?jjClcNbvAb2Y7G8qhP7/S5UEqVWi5WjfCt2PhzXTrGSdG0Mf0dU2cXNdvc6h?=
 =?us-ascii?Q?EEbQShrE2wYmsRAGPEn5wXlqFQkZUijHR+F8g0ap2dsb0kY5QBWIIKwjdGKg?=
 =?us-ascii?Q?F6dbxvMUMavdN4K4aHpArFoTPyaHwnhb2Vq182akSPcWj+PH16/YiDVCJZBi?=
 =?us-ascii?Q?JKmPG22upGDx7DQuB95wLSE2bhdbnkzs4js4y63Lrw8JVjT7jZJrKLJo1F2y?=
 =?us-ascii?Q?WMyflR2gAnD5/D8ybhCJFuqTwRYpMdAyh6VtcdGXXVlgzuP9RjZgosi9bPWy?=
 =?us-ascii?Q?HIhiwfS8Oe7xCTcmHVcghK1Y7vjK/3FMrDprBSqyWacSIlM4cdPpUe6A9B4z?=
 =?us-ascii?Q?sAqpmSrmnE5hTCl1dvoPIhgEIJ813WSZyTtuf9hm3qE5+0OvdN/4Z87tH6Pv?=
 =?us-ascii?Q?87/37DVqG44BdRo+d0VWUxj8S464kMGVAQFB665P56ROqPZdkhjZVJPly+FO?=
 =?us-ascii?Q?0dBBTAzo6afpQ5Vy3cXDogGX2In0SZnb+yK6oyI//Q7JVKxupUF5yprkc/qz?=
 =?us-ascii?Q?IkyhEPVkbksRY7grXfvFkI5cZjxaaAPxbpc6bs4HnhKSRR0yH3dXGE8zK15m?=
 =?us-ascii?Q?3mETgPOaIlo5eO1ckegpqZHPmU2yW17eR9iJzL9+/aLq7FUIneo54LfyZM2a?=
 =?us-ascii?Q?MrJAxRzwGRFg0kDpdfJszuLBKdn9EQKu1rftlO+4mEvTrlXzTgWNyVwXi/fk?=
 =?us-ascii?Q?stB2HMNBRPPE6E1tdJVFt910ZX284ILo5i5B+zOS17ZaEEuTqdzetocwY1O4?=
 =?us-ascii?Q?FTy9u1ScELQ69acP6+hCbnB8u7vP9oHXqUonVYSfdJy6NT2l6CGaueP2z4Gx?=
 =?us-ascii?Q?BG0hCxR0vYmR6gB1uLxS0Ok8sQENWbKU1LM8nl7ITFGYXi58YiHvjBcQtofB?=
 =?us-ascii?Q?bCqCxvtWXUEyBJjnDS5gBtuiUAqOfquniZZzDdYrGLA65/Wsr9GhAtW64YqW?=
 =?us-ascii?Q?bQFOZD1i21ZMFcC3Ww63jzUJHjfKgymEF48VdL0EMcjYRbudo3iNrHmtzOGx?=
 =?us-ascii?Q?i9Qn4RxTSOEHUT5sAJT675+HHlYYngUxFfGcT3FW+HzWxI7Z0r6TzM1cGncQ?=
 =?us-ascii?Q?JrNUjsDhE5ONbD4Fb2jdd8RK0+xdZi0bKmPYL1AseI4V8tx9Rc0zoFE88M47?=
 =?us-ascii?Q?+tLTYtvR47Mgfu3UkcA9Mv8k8dvSUGMwERHZguTiKyMlHejpZZMchiix3+4N?=
 =?us-ascii?Q?ZjaIhiRoEM8YRl6Ag94Z4JLo0/sYbb/oOU8d8ZcSoFnFqA3xGPUXpsWYMz3m?=
 =?us-ascii?Q?yCI7MzQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 07:36:16.7389 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 556f3fdc-fd95-4b22-f61b-08dcddfde80a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7663
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

Fix page fault when using sdma linear copy:
[ 4606.313448] amdgpu 0000:1a:00.0: amdgpu: [mmhub0] no-retry page fault (src_id:0 ring:24 vmid:1 pasid:32772)
[ 4606.313463] amdgpu 0000:1a:00.0: amdgpu:  for process amd_deadlock pid 4440 thread amd_deadlock pid 4440)
[ 4606.313475] amdgpu 0000:1a:00.0: amdgpu:   in page starting at address 0x0000000000001000 from IH client 0x12 (VMC)
[ 4606.313490] amdgpu 0000:1a:00.0: amdgpu: VM_L2_PROTECTION_FAULT_STATUS:0x00120231
[ 4606.313501] amdgpu 0000:1a:00.0: amdgpu:      Faulty UTCL2 client ID: SDMA1 (0x101)
[ 4606.313511] amdgpu 0000:1a:00.0: amdgpu:      MORE_FAULTS: 0x1
[ 4606.313519] amdgpu 0000:1a:00.0: amdgpu:      WALKER_ERROR: 0x0
[ 4606.313527] amdgpu 0000:1a:00.0: amdgpu:      PERMISSION_FAULTS: 0x3
[ 4606.313535] amdgpu 0000:1a:00.0: amdgpu:      MAPPING_ERROR: 0x0
[ 4606.313543] amdgpu 0000:1a:00.0: amdgpu:      RW: 0x0

For old AI asics, the sdma copy count is shorter than newer ones.
So add count check in case the max range is exceeded.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 3f8f28483..f22a322e5 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -189,10 +189,17 @@ sdma_ring_copy_linear(const struct amdgpu_ip_funcs *func,
 		context->pm4[i++] = SDMA_PACKET(SDMA_OPCODE_COPY,
 				       SDMA_COPY_SUB_OPCODE_LINEAR,
 					context->secure ? 0x4 : 0);
-		if (func->family_id >= AMDGPU_FAMILY_AI)
-			context->pm4[i++] = context->write_length - 1;
-		else
+		if (func->family_id >= AMDGPU_FAMILY_AI) {
+			/* For FAMILY AI, the maximum copy range supported by sdma is 4MB */
+			if (func->family_id >= AMDGPU_FAMILY_AI && context->write_length > 0x3fffff) {
+				context->pm4[i++] = 0x3fffff;
+				igt_warn("sdma copy count exceeds the maximum limit of 4MB\n");
+			} else {
+				context->pm4[i++] = context->write_length - 1;
+			}
+		} else {
 			context->pm4[i++] = context->write_length;
+		}
 		context->pm4[i++] = 0;
 		context->pm4[i++] = lower_32_bits(context->bo_mc);
 		context->pm4[i++] = upper_32_bits(context->bo_mc);
-- 
2.25.1

