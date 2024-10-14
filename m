Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FC5CF259D
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 05:06:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E57710E0BD;
	Mon, 14 Oct 2024 05:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Gcg82z9X";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CCC10E0BD
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 05:06:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOwWJmsS7jQRt3tPSyNbEhfPV9lU8GquGgtDlaZy+tdHNGt35J3lCbQ+HaE53NkFcJPTVJR4Jp5MckYncbvJeQDGVisXSS5EONllZQjMIlriQjxUAlIcesWr+a17xhPD0R2VPuGH5v4q3RebhiYpLPsvCRK2E0XAfUK/jhKpWW/ikua81kTPCBORHML65OLEiWk7R5gV10CQMGyPviJw7gSjNoyg4WM2BjX3IEw9Si+VDI41L8//2qC+OnRB2FGrgf2CcMmgHPmKCl65na0QEhASvLQG87EJVuDnteYTVT9CajxlajcqPCFSMOb1O5J07wnyvRcikxMr6DBIQIFdow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uj2pB0EoRYxjV07lc6qtU5iot+sbS1WklbEqSkgSAI=;
 b=ElcNKKryfIlJCvioX4YQk0vYhVa2C6iI4JTwemrnhOjWUaggDnKd3wsLD53oGqiYy3ZNAoWWI/8AWMxYUr8IdNzNOZIpTGeJQH+xMyrSaFRnOUGhOUqjxh75vpsQhgJNitWBWFR3qV5HRubP2t57qokvZjKRS06Z74xenpUy7GLdWy4/PBzkYiAoS/WoEs4FmqXAG3NQVf5flH8PHdXzzSIy/ER0dbdUdkr4XkFZ24yxjLIFyOg47Y3+7WC424vbPkf044ow0dFHoAgyl1gB9EKGNtpkeVrdfJ98tmvy8iZgY+APtixUXgvtUgoRtYB7NhSF9r5h+NKLj5fj6Djztw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/uj2pB0EoRYxjV07lc6qtU5iot+sbS1WklbEqSkgSAI=;
 b=Gcg82z9XbXGg3IY8I32QoJ9UOiV2+J04b72kgfZIpGpiSvFD42N7AKFlvdhG8uh8gb1WwpHjzhn3zLVjUKYDiSLDadXl7WMI/fPZpFhxer89Fy9ZUKqQbHT0q1pdCH9KuSWY7xrYHuFAWY0KsFn2RsKXvwmz9Ghy9xVfycMcc2c=
Received: from BN0PR04CA0095.namprd04.prod.outlook.com (2603:10b6:408:ec::10)
 by DS0PR12MB8502.namprd12.prod.outlook.com (2603:10b6:8:15b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.22; Mon, 14 Oct
 2024 05:06:07 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:408:ec:cafe::a9) by BN0PR04CA0095.outlook.office365.com
 (2603:10b6:408:ec::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26 via Frontend
 Transport; Mon, 14 Oct 2024 05:06:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 14 Oct 2024 05:06:06 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Oct
 2024 00:06:06 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Oct
 2024 00:06:06 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 14 Oct 2024 00:05:59 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t] lib/amdgpu: change sdma limit check
Date: Mon, 14 Oct 2024 13:05:58 +0800
Message-ID: <20241014050558.1163562-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|DS0PR12MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: d98a8188-8d3d-4aec-d655-08dcec0de910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5gRm1wMhmTn6DCQ1VVi1q3SjIw0uTaqYmj/6bIXvFQ2LbWizNfaOoB5hNhK7?=
 =?us-ascii?Q?+qjGS7wbmS1EW7W6bqOWlw3zzLAdCI1ul6NQ/93Nb+MgYP6rOx3efWOBPcOT?=
 =?us-ascii?Q?w8+Kpc0rZDCF14kCPcGcTtCmUS76ypcD51jSVgk3mFSx/RSNfWYL45PTdkqK?=
 =?us-ascii?Q?wQ616aJtC9TJQmdoAZOj7Ch/bh6BzMV3gxakyIswN/Jzmr/Ecnp2rDMWmMg2?=
 =?us-ascii?Q?pVONhKXqHUurzuZAHEtRAxiBgnX37fWQq7DbT5hEKa0hp5Gk0rZSUhns7Kcv?=
 =?us-ascii?Q?SYKVQCMrLQ5x0kCak0mAH/6nD9PLvK66vc0a8OVBKePjUKlpXVlfGUCrw3e1?=
 =?us-ascii?Q?DY/mWGDD+2Bm9fWLLJR+JCWvWsRNe2qzsjcHF9WZPm7B/1JpbsjeloVq0tk8?=
 =?us-ascii?Q?vEdP1HYb6C57AyWv3hdiDKzfMshgFkP3WKqAptoB80TJwA5/5Jq1bLbmaFNU?=
 =?us-ascii?Q?RPpqzsQ8es4VudpNFmTCt+Rb7eGrCk9vVGnDCe0XM7CQKRw/WLlGugFe3vBh?=
 =?us-ascii?Q?uQckzueD6JcVgeWPbYun9QZE3bkxBAIBv9R2NVOYxUO5L1q44ksfGgBp2NUY?=
 =?us-ascii?Q?BLnA8ufAIbqs46WMD43+Z0cDCowiP4EK+YKtuuKhUKDDlAz/Hn98a6ZYTB+i?=
 =?us-ascii?Q?yyd6NWRcw+Pt5qisPFSqp9/+E0SaU9cuRruxobIAMS2iepf39q8sHQhB2Ucp?=
 =?us-ascii?Q?jeBjDiBdIewz9zaoFRXOcl4NaTm7grXw366wX/EaDoKx/7QaI+5j6L9sqslp?=
 =?us-ascii?Q?mKHThgxY3QaYabvc4/5pneo6eD2iZ0y6wA1RhELchOh/H2OqZunoeisMu3tS?=
 =?us-ascii?Q?xldIcRDDqBd8KOIRmUR7qjbpQyMi0n+N6v2RDKj7oBrOB+ZqOt7lRtW+zCPQ?=
 =?us-ascii?Q?YewgGsBVP5b2ePLggrNwL9UrBQkfEq2G/Y7d1KmsGaAGHJDZrnGNpMl98NDv?=
 =?us-ascii?Q?ieF3wBWGgDdjPTNFxrIUmpUDPcsiNpkZ82+pEEts3UGUp8nA4UUV9tmPwY1q?=
 =?us-ascii?Q?BNSaU4dswm3qHEUI/IND92Sv+43DxjhJidI+Kbpxa94h/rdW0lxOCY+2euHF?=
 =?us-ascii?Q?gaRPe1ZpqYu2el9lL0CIZYHqEupdwpWHwChQYlk+HNnuv4Q+t4ZLLmeCtLzH?=
 =?us-ascii?Q?zjqw5F3UbM5y752n3PAr07ebIcyFunC8MCFT7kST/FAx74Gze0hUDiXgIvO/?=
 =?us-ascii?Q?nOqtzT9ZD0GgpPhdqmlbhGoBBmTHADMgqV4a7WwCS+KsUiT6RuSSeRBiNls4?=
 =?us-ascii?Q?UUZfYPWW+Zu/ItVMSL9dDwSXmI3Rs+79q0eSZdtWWSvQauqAqdpUNRYkJIh8?=
 =?us-ascii?Q?d8qx71BQfhQY1vcd1V1o9dvDIlzePujEKtLCwl25NdWr1qEiZZQSJWbbLBRQ?=
 =?us-ascii?Q?pPKwav2KXfaPkymPPOd9Ts/qUys1?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 05:06:06.8067 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d98a8188-8d3d-4aec-d655-08dcec0de910
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A8.namprd04.prod.outlook.com
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

This sdma limit is only for mi100.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 11 +++++++----
 lib/amdgpu/amd_ip_blocks.h |  2 ++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index f22a322e5..df603618b 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -190,8 +190,9 @@ sdma_ring_copy_linear(const struct amdgpu_ip_funcs *func,
 				       SDMA_COPY_SUB_OPCODE_LINEAR,
 					context->secure ? 0x4 : 0);
 		if (func->family_id >= AMDGPU_FAMILY_AI) {
-			/* For FAMILY AI, the maximum copy range supported by sdma is 4MB */
-			if (func->family_id >= AMDGPU_FAMILY_AI && context->write_length > 0x3fffff) {
+			/* For mi100, the maximum copy range supported by sdma is 4MB */
+			if (func->family_id == AMDGPU_FAMILY_AI && func->chip_external_rev == 0x33
+				&& context->write_length > 0x3fffff) {
 				context->pm4[i++] = 0x3fffff;
 				igt_warn("sdma copy count exceeds the maximum limit of 4MB\n");
 			} else {
@@ -855,9 +856,11 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 		 * TO DO: move family id as a parameter into IP functions and
 		 * remove it as a field
 		 */
-		for (int i = 0; i <  amdgpu_ips.num_ip_blocks; i++)
+		for (int i = 0; i <  amdgpu_ips.num_ip_blocks; i++) {
 			amdgpu_ips.ip_blocks[i]->funcs->family_id = amdinfo->family_id;
-
+			amdgpu_ips.ip_blocks[i]->funcs->chip_external_rev = amdinfo->chip_external_rev;
+			amdgpu_ips.ip_blocks[i]->funcs->chip_rev = amdinfo->chip_rev;
+		}
 		/* extra precaution if re-factor again */
 		igt_assert_eq(gfx_v8_x_ip_block.major, 8);
 		igt_assert_eq(compute_v8_x_ip_block.major, 8);
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 679e2ea46..109d36602 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -133,6 +133,8 @@ struct amdgpu_ring_context {
 
 struct amdgpu_ip_funcs {
 	uint32_t	family_id;
+	uint32_t	chip_external_rev;
+	uint32_t	chip_rev;
 	uint32_t	align_mask;
 	uint32_t	nop;
 	uint32_t	deadbeaf;
-- 
2.25.1

