Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7157CC624A4
	for <igt-dev@archiver.kernel.org>; Sun, 22 Feb 2026 02:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A7B10E0E7;
	Sun, 22 Feb 2026 02:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yUmgPVpA";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010064.outbound.protection.outlook.com [52.101.201.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8547910E0E7
 for <igt-dev@lists.freedesktop.org>; Sun, 22 Feb 2026 02:26:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RWY3NEjQfq/ryLkMV58fpeJKTAK39MIg9lUQuXOeBOep+Irp5aElRfPGIYlJGX7+YqQPAfr40AVvBZSS7f508P74H025mGx000oC63B7wBArk+wtMNOwAYogRLzAjHTIVfoW9GweytdrAZe779iS3W5KteLwFlVk3Pbi+7mdAndxUZumLNuq4HCsGCsrAscstTi9ji+JiUzGxjzhfp3Ps6NsgIx9d6JFLv6DfLmX3WSK8CrgOfF/3w7OlQVvPNRCmcaoPfhOgPWOqPdXTto5bz9R2mmKIqnQWqT4YlRuvLmGrP37+RxxenAEDCEEU749n5MLSOKjJLtFDW3bUWSmVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQZT2advqPQ5lmBJXoqSoZpBxfgYfwRoNCx0OEQAAiE=;
 b=TBwHjSQoyyR3IWblmJpHFwOyCJgRxDFTY5SVJXcawcWBrXYNki1NOPre+CJUNSCXiojkeTSkJ64ToajB9mUTluVuNzv4gVNNQPkKbm6uJWHfXJCDdPhc/lmuHUSVuIdsy3aPp1l/zKO2vgeDa84679ogyZ2Ju9yhSHc+z2a/aljUanYWwSITWQwOasJI4s0vuqCxtSIgJKUn2HZtRK8Vo4RwlaTcNmwOSrh3fJAwgwdv4YGX1J/jxUWYkQjcBPkOhmS+5RUDvJ9bAg1AQnDCpZQyWd8FVQWJmuc1SNOGq8/QdbnSHxP9Go8m/Na3KWNG462+biuqvmhD4sAM1+obtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQZT2advqPQ5lmBJXoqSoZpBxfgYfwRoNCx0OEQAAiE=;
 b=yUmgPVpAc537MwcAU/djrkEa6AsbmY4p3Wh8lZMoMsvIB/4/IhIl4yJlwzLyB6flO/9vwme7UxVBK58Zg8scyyFrsVybUFK8+f8HEq5NfwMhSnPDIaU11r/CgCECd0bgCqrEPYOb3o5+qo3qlSMt24aibLI70wQIy5BE2PZsPaU=
Received: from BL1PR13CA0306.namprd13.prod.outlook.com (2603:10b6:208:2c1::11)
 by DS0PR12MB6558.namprd12.prod.outlook.com (2603:10b6:8:d2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Sun, 22 Feb
 2026 02:26:10 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::5b) by BL1PR13CA0306.outlook.office365.com
 (2603:10b6:208:2c1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.19 via Frontend Transport; Sun,
 22 Feb 2026 02:26:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Sun, 22 Feb 2026 02:26:10 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Sat, 21 Feb
 2026 20:26:09 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 21 Feb
 2026 20:26:09 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sat, 21 Feb 2026 20:26:09 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 2/4] lib/amdgpu: normalize write_length to bytes and use DMA
 limits API
Date: Sat, 21 Feb 2026 21:23:53 -0500
Message-ID: <20260222022606.160188-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260222022606.160188-1-vitaly.prosyak@amd.com>
References: <20260222022606.160188-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|DS0PR12MB6558:EE_
X-MS-Office365-Filtering-Correlation-Id: 04cc6607-c394-4f7c-28e5-08de71b9bde7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUlqWTZyNHFlcEFnOFFiMlA0bkU3T2JRM3VPY0h3WkRseE5qd1JMbnVKWi9V?=
 =?utf-8?B?TEtSOE5YTU5IZEdYK3R4bWlYWnlBYXBWc0kwbXhaYS9FeEd6b3gvMTR6aVF4?=
 =?utf-8?B?aU1KWWJWK1Q0RXNHenZDRUhTd00yZU9oRUlmelVsa3U2Mm5nbUNNeE1JRERn?=
 =?utf-8?B?bTBOVVk0d3BUZ1RrRmV3L2FscDMvT2tTT0Y0cFB6RzZCblZuQlNJaU4vSzZm?=
 =?utf-8?B?czBYeFYxRmlTQmRRV1Q3TFlRZm43WkthQUFQc2NMa2x2SHZZa3hTQ3RkQW5L?=
 =?utf-8?B?TzlmalE1T09CdENjeDlKeE1nZ2tZNE5VRklCaFBha0YxQkg1cThqUHZENmJG?=
 =?utf-8?B?cndHUGlNdXRoL1J6bHRMdG5LUGpjakQ4YnY5TVZWU09tL01WckhYblFob3hN?=
 =?utf-8?B?dGVaRmU2RG9KSVI0TnBsMUQ1blpEQnBzOW1SMmpYSUlqdmlIOWJhRCt6eEU0?=
 =?utf-8?B?ektPWGZ0dTYzOWViUyt1ajlHbENrSHlMMUEvNkxvdU1aVEpuK1hNdjQ4b1lm?=
 =?utf-8?B?eWh4WVhtUWswNXQrTFV3ZTJualoyQitBRHNiNXVUQUt6Y2VkQ3c0RnNZTmhw?=
 =?utf-8?B?UW5IdkpydURVTnRkZUlQR3M4K0E2VzBQc1cxUnVQMW5sRzdCL2dBOXVNbmky?=
 =?utf-8?B?MW80SFZEVy80UmQzazVTbHpLNkhGQUMzajI1cGl6ZmFpcUdDTWxNTnVHTUhY?=
 =?utf-8?B?Mk93TnRWNjRYN3N3RHZuaEpXRVhQbkxvKzk3SXRBWC9xaW8rUS9mbmRscS9w?=
 =?utf-8?B?ek9xa3kzVFFKZG8yblZjNXNscVRteXpRL0JvZ2Z6a3hVZlJvclpVazV1WCs4?=
 =?utf-8?B?SU9sUkdHUWRpZEIwemQwb3RCK0puekRSRjlNcGFOMEFvTzFDQVV2YzJaVHRJ?=
 =?utf-8?B?akh2WjdYK3BkSkJxQ0d5M281bDA0T1ZDTTFQeEtTaHh2T0RJeU4wK1NoY1FE?=
 =?utf-8?B?QVFKcnoyV3lDZTBjUWVlc3hjUHhuaXpjRWRrb1d4eGEzd1pZcWRUaFgvSVhk?=
 =?utf-8?B?alprVzhVTnZnY1B2V3FrenJXYTA2Z3RwZC9jdSt2bFhLL3g2SVRJZGo3eHE4?=
 =?utf-8?B?RlRad1pIV1RtUnZneHJ6UTlKcUZwUXAyV2E5SUpub1RqNW1NSlU1bm1saXBm?=
 =?utf-8?B?bU5mdWZaWHRjSTF5RU1HUlhTcTY4dDBDZCszR0ViOEF6RDg0VWx1NW9BR0N3?=
 =?utf-8?B?bzM2QmZUOWRTcVpHV1N0bmdDMmFMZ3FiUmtrdGJPaCt2cUFxdloxNDRNSk5l?=
 =?utf-8?B?TEdXYk1oOWJrMWU3ZEJUb2RwRERmcXVrR1EvR1ZMWXFGUDNxVWsrVzlrajBU?=
 =?utf-8?B?UW5oNUhLNUZLYnFtTGZiRThUZFlmR3RGWjZkMVQvZ3JlYzA2L1d0WE5KWVBP?=
 =?utf-8?B?NG9HZVhPYTYrTHh2b0JEdHpsQTdILzI4S2pIYXcrNVNtYm0vMzNuZUlJMWZQ?=
 =?utf-8?B?Z3VnSGpvRVNNZmNERjdEd2VDSmdGd3JTeTlFbGRINFNOQUREUi9naGdWZzk0?=
 =?utf-8?B?TmtiRGZvdVU2VkF0QzIzZmwwVFVLdko4R3luSzY5Ym82U092eWFEdE1rMzZx?=
 =?utf-8?B?SHllS0dyRG9YL3VvbHhyVnBSeDRqNCtsT3VuVFZYT1hub2IzMFZzQjBFaGdl?=
 =?utf-8?B?MTRkWXRaajRqTzZhQk9Ib0RMR2x0ZzBEQml5TmcyNDFuY0RqQmp6QXZpMFN5?=
 =?utf-8?B?SHNkM2sxVGlhTFNDTkZGZTYrdkd0NmlLTlFBV1NSbEFIUlNoQ1ZJQVhMKzZT?=
 =?utf-8?B?U3VZRTRVc0Zwc241UUJ0VE1qcmErdzlhVWdhT3FiMTI2dXhuSGx6ZGdZU1Ir?=
 =?utf-8?B?UEpEamV2ejdPcnVNeXIxN2J3Um1qNXFVbTR6ZHdEeklIMUZOYkZ3aGU1UTNF?=
 =?utf-8?B?c28xZEQ5NTFpSUMvNVZQMTJoNU1FMmJMZEIvQWFxeEkxcXAzWHBHdG1CK2ZK?=
 =?utf-8?B?NG9WZFFLV3I4SDh4dXZweDJUSy9aTElJSnlhSVhSKzZ1RTlSYXdiYkQrN3A1?=
 =?utf-8?B?S1BSakJZWUxBYncrbm5YNmFGc2wwL1doNEVWZUtyR3dXYkhPbVZDZEsrQ0Jv?=
 =?utf-8?B?bGRHbER5bXk3aC9vOGtZY1F3SUpoOUJUVVFTVDMxYlF2S1NMaFMxZTd6dEU0?=
 =?utf-8?B?c0xINit5WlpRTENwcjVaa2p6K3lHQW9pTXpyNzhsdkhNVW91YzlTRVZkUWpP?=
 =?utf-8?B?dlJZdkFLcXdxbFdxWUlWVTZqS3UwZmgwUGM3UUZhUk55d0Y3aXhhQzFNNXdq?=
 =?utf-8?B?NlhUUHY3U0tCcnpuMkw3YXZLaDN3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0/GlUB7ijdAzYjidf+RmtPmr1o6LblHM886cjUmuR9t11FaJjiorXtBV8A69mBOsVineAiWPVRddP46GTalzv1ZyyC0OXwE8by6IgExhELwCpbOTVhNZqoXMvF5ltnz1BJQmUfIWRE40nPDSEseyEEJSdP5QiVmTXmFe9k/9DfK2rKZO+kI5GcmWQ1OUxXOtPXbWvUmV7JdmnlbczG9JIW2ZWTDaXABavyle4x9f9Ags9L/v4Vhw9seE3muHFyw6D9MZ2gl+dftSszq7uq/Mh//s1Y46wpBXa48DNwO94L6ihQGoyuKOsEKhN0H0BDucUKkv/JNQvmXbghzPozyk2qHlJ096a6ZlIeU+DuE7mQuLqFeNANHD6usf6z813e4mEa9UFvBdEe2o1Kwde1ML2gs1ZwbM62xXwcSBnNjDPq1lyyscSuMbyYno/G4NRjcm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2026 02:26:10.1688 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04cc6607-c394-4f7c-28e5-08de71b9bde7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6558
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Replace all hardcoded transfer sizes with dynamic queries via
amdgpu_dma_limits_query(). Each helper now calls this internally:

 - const_fill_helper / copy_linear_helper: ring_id == 0 uses
   amdgpu_dma_max_bytes() (HW maximum), ring_id > 0 uses
   amdgpu_dma_default_bytes() for fast iteration.
 - write_linear_helper: uses amdgpu_dma_default_bytes() for all
   rings (inline PM4 data limits the practical transfer size).
 - create_ip_queues (helper2 path): same default_bytes per ring.

Change write_length/write_length2 from uint32_t to uint64_t with
byte semantics everywhere:

Packet builders (amd_ip_blocks.c):
 - sdma_ring_write_linear: inline data = write_length/4 DWORDs
 - gfx_ring_write_linear: PACKET3 n = 2 + write_length/4, data /4

Helpers (amd_command_submission.c):
 - Remove all write_length * sizeof(uint32_t) conversions
 - Compare with div=4 (write_length is bytes, bo_cpu is uint32_t*)
 - Extended API: params->size stored directly (no /sizeof conversion)

No helper signature changes - test callers unchanged.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_command_submission.c | 80 +++++++++++++++++------------
 lib/amdgpu/amd_ip_blocks.c          | 31 +++++++++--
 lib/amdgpu/amd_ip_blocks.h          |  4 +-
 tests/amdgpu/amd_basic.c            |  5 +-
 4 files changed, 81 insertions(+), 39 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index e8266173d..079670d49 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -146,11 +146,10 @@ static void amdgpu_create_ip_queues(amdgpu_device_handle device,
                          struct amdgpu_ring_context **ring_context_out,
                          int *available_rings_out)
 {
-	const int sdma_write_length = 128;
-	const int pm4_dw = 256;
+	struct amdgpu_dma_limits limits;
 	struct amdgpu_ring_context *ring_context = NULL;
 	int available_rings = 0;
-	int r, ring_id;
+	int r, ring_id, pm4_dw;
 
 	/* Get number of available queues */
 	struct drm_amdgpu_info_hw_ip hw_ip_info;
@@ -160,6 +159,9 @@ static void amdgpu_create_ip_queues(amdgpu_device_handle device,
 	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &hw_ip_info);
 	igt_assert_eq(r, 0);
 
+
+	amdgpu_dma_limits_query(device, &limits);
+
 	if (user_queue)
 		available_rings = ring_context->hw_ip_info.num_userq_slots ?
 			((1 << ring_context->hw_ip_info.num_userq_slots) -1) : 1;
@@ -179,7 +181,8 @@ static void amdgpu_create_ip_queues(amdgpu_device_handle device,
 
 	for (ring_id = 0; (1 << ring_id) & available_rings; ring_id++) {
 		memset(&ring_context[ring_id], 0, sizeof(ring_context[ring_id]));
-		ring_context[ring_id].write_length = sdma_write_length;
+		ring_context[ring_id].write_length = amdgpu_dma_default_bytes(&limits, ip_block->type);
+		pm4_dw = ring_context[ring_id].write_length / 4 + 16;
 		ring_context[ring_id].pm4 = calloc(pm4_dw, sizeof(*ring_context[ring_id].pm4));
 		ring_context[ring_id].secure = secure;
 		ring_context[ring_id].pm4_size = pm4_dw;
@@ -222,7 +225,7 @@ static void amdgpu_command_submission_write_linear(amdgpu_device_handle device,
 	for (ring_id = 0; (1 << ring_id) & available_rings; ring_id++) {
 		/* Allocate buffer for this ring_id */
 		r = amdgpu_bo_alloc_and_map_sync(device,
-			ring_context[ring_id].write_length * sizeof(uint32_t),
+			ring_context[ring_id].write_length,
 			4096, AMDGPU_GEM_DOMAIN_GTT,
 			gtt_flags[0],
 			AMDGPU_VM_MTYPE_UC,
@@ -243,7 +246,7 @@ static void amdgpu_command_submission_write_linear(amdgpu_device_handle device,
 
 		/* Clear buffer */
 		memset((void *)ring_context[ring_id].bo_cpu, 0,
-		       ring_context[ring_id].write_length * sizeof(uint32_t));
+		       ring_context[ring_id].write_length);
 
 		ring_context[ring_id].resources[0] = ring_context[ring_id].bo;
 
@@ -255,7 +258,7 @@ static void amdgpu_command_submission_write_linear(amdgpu_device_handle device,
 
 		/* Verification */
 		if (!secure) {
-			r = ip_block->funcs->compare(ip_block->funcs, &ring_context[ring_id], 1);
+			r = ip_block->funcs->compare(ip_block->funcs, &ring_context[ring_id], 4);
 			igt_assert_eq(r, 0);
 		} else if (ip_block->type == AMDGPU_HW_IP_GFX) {
 			ip_block->funcs->write_linear_atomic(ip_block->funcs, &ring_context[ring_id], &ring_context[ring_id].pm4_dw);
@@ -275,7 +278,7 @@ static void amdgpu_command_submission_write_linear(amdgpu_device_handle device,
 		/* Clean up buffer */
 		amdgpu_bo_unmap_and_free(ring_context[ring_id].bo, ring_context[ring_id].va_handle,
 		ring_context[ring_id].bo_mc,
-		ring_context[ring_id].write_length * sizeof(uint32_t));
+		ring_context[ring_id].write_length);
 	}
 }
 
@@ -356,19 +359,22 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 						   bool secure, bool user_queue)
 
 {
-	const int sdma_write_length = 128;
-	const int pm4_dw = 256;
-
+	struct amdgpu_dma_limits limits;
 	struct amdgpu_ring_context *ring_context;
-	int i, r, loop, ring_id;
+	int i, r, loop, ring_id, pm4_dw;
 
 	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
 	uint32_t available_rings = 0;
 
+	amdgpu_dma_limits_query(device, &limits);
+
 	ring_context = calloc(1, sizeof(*ring_context));
 	igt_assert(ring_context);
-	/* setup parameters */
-	ring_context->write_length =  sdma_write_length;
+	/* setup parameters — write_linear embeds inline data in PM4,
+	 * so pm4 buffer must hold header (max 10 DWORDs) + write_length/4 DWORDs.
+	 */
+	ring_context->write_length = amdgpu_dma_default_bytes(&limits, ip_block->type);
+	pm4_dw = ring_context->write_length / 4 + 16;
 	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
 	ring_context->secure = secure;
 	ring_context->pm4_size = pm4_dw;
@@ -403,8 +409,7 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 		while (loop < 2) {
 			/* allocate UC bo for sDMA use */
 			r = amdgpu_bo_alloc_and_map_sync(device,
-							 ring_context->write_length *
-							 sizeof(uint32_t),
+							 ring_context->write_length,
 							 4096, AMDGPU_GEM_DOMAIN_GTT,
 							 gtt_flags[loop],
 							 AMDGPU_VM_MTYPE_UC,
@@ -426,7 +431,7 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 
 			/* clear bo */
 			memset((void *)ring_context->bo_cpu, 0,
-			       ring_context->write_length * sizeof(uint32_t));
+			       ring_context->write_length);
 
 			ring_context->resources[0] = ring_context->bo;
 
@@ -440,7 +445,7 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 			/* verify if SDMA test result meets with expected */
 			i = 0;
 			if (!secure) {
-				r = ip_block->funcs->compare(ip_block->funcs, ring_context, 1);
+				r = ip_block->funcs->compare(ip_block->funcs, ring_context, 4);
 				igt_assert_eq(r, 0);
 			} else if (ip_block->type == AMDGPU_HW_IP_GFX) {
 				ip_block->funcs->write_linear_atomic(ip_block->funcs, ring_context, &ring_context->pm4_dw);
@@ -463,7 +468,7 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 			}
 
 			amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle, ring_context->bo_mc,
-						 ring_context->write_length * sizeof(uint32_t));
+						 ring_context->write_length);
 			loop++;
 		}
 	}
@@ -491,16 +496,19 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 						 const struct amdgpu_ip_block_version *ip_block,
 						 bool user_queue)
 {
-	const int sdma_write_length = 1024 * 1024;
 	const int pm4_dw = 256;
+	struct amdgpu_dma_limits limits;
 
 	struct amdgpu_ring_context *ring_context;
 	int r, loop, ring_id;
 	uint32_t available_rings = 0;
 	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
 
+	amdgpu_dma_limits_query(device, &limits);
+
 	ring_context = calloc(1, sizeof(*ring_context));
-	ring_context->write_length =  sdma_write_length;
+	/* const_fill/copy packets have no inline data — pm4_dw=256 is ample */
+	ring_context->write_length = amdgpu_dma_default_bytes(&limits, ip_block->type);
 	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
 	ring_context->secure = false;
 	ring_context->pm4_size = pm4_dw;
@@ -527,9 +535,12 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 		/* prepare resource */
 		loop = 0;
 		ring_context->ring_id = ring_id;
-		while (loop < 2) {
-			/* allocate UC bo for sDMA use */
-			r = amdgpu_bo_alloc_and_map_sync(device, ring_context->write_length,
+			ring_context->write_length = (ring_id == 0) ?
+				amdgpu_dma_max_bytes(&limits, ip_block->type) :
+				amdgpu_dma_default_bytes(&limits, ip_block->type);
+			while (loop < 2) {
+				/* allocate UC bo for sDMA use */
+				r = amdgpu_bo_alloc_and_map_sync(device, ring_context->write_length,
 							 4096, AMDGPU_GEM_DOMAIN_GTT,
 							 gtt_flags[loop],
 							 AMDGPU_VM_MTYPE_UC,
@@ -590,17 +601,19 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 						  const struct amdgpu_ip_block_version *ip_block,
 						  bool user_queue)
 {
-	const int sdma_write_length = 1024;
 	const int pm4_dw = 256;
+	struct amdgpu_dma_limits limits;
 
 	struct amdgpu_ring_context *ring_context;
 	int r, loop1, loop2, ring_id;
 	uint32_t available_rings = 0;
 	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
 
+	amdgpu_dma_limits_query(device, &limits);
 
 	ring_context = calloc(1, sizeof(*ring_context));
-	ring_context->write_length =  sdma_write_length;
+	/* copy_linear packets have no inline data — pm4_dw=256 is ample */
+	ring_context->write_length = amdgpu_dma_default_bytes(&limits, ip_block->type);
 	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
 	ring_context->secure = false;
 	ring_context->pm4_size = pm4_dw;
@@ -625,7 +638,10 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 
 	for (ring_id = 0; (1 << ring_id) & available_rings; ring_id++) {
 		loop1 = loop2 = 0;
-		ring_context->ring_id = ring_id;
+			ring_context->ring_id = ring_id;
+			ring_context->write_length = (ring_id == 0) ?
+				amdgpu_dma_max_bytes(&limits, ip_block->type) :
+				amdgpu_dma_default_bytes(&limits, ip_block->type);
 	/* run 9 circle to test all mapping combination */
 		while (loop1 < 2) {
 			while (loop2 < 2) {
@@ -972,7 +988,7 @@ cmd_context_t* cmd_context_create(amdgpu_device_handle device,
 	} else {
 		/* Allocate internal BO for command operations */
 		r = amdgpu_bo_alloc_and_map(device,
-				   ctx->ring_ctx->write_length * sizeof(uint32_t),
+				   ctx->ring_ctx->write_length,
 				   4096,
 				   AMDGPU_GEM_DOMAIN_GTT,
 				   0,
@@ -1036,7 +1052,7 @@ void cmd_context_destroy(cmd_context_t *ctx, bool destroy_external_bo)
 				    /* Internal BO with VA handle - full cleanup */
 				    amdgpu_bo_unmap_and_free(ctx->ring_ctx->bo, ctx->ring_ctx->va_handle,
 							   ctx->ring_ctx->bo_mc,
-							   ctx->ring_ctx->write_length * sizeof(uint32_t));
+							   ctx->ring_ctx->write_length);
 				} else if (destroy_external_bo) {
 				    /* External BO without VA handle - just free the BO */
 				    amdgpu_bo_free(ctx->ring_ctx->bo);
@@ -1211,7 +1227,7 @@ int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
 
 	/* Clear the buffer before operation */
 	memset((void *)ctx->ring_ctx->bo_cpu, 0,
-	ctx->ring_ctx->write_length * sizeof(uint32_t));
+	ctx->ring_ctx->write_length);
 
 
 	/* Build the command packet based on type */
@@ -1222,7 +1238,7 @@ int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
 
 		/* TODO: allow user set the dst and data */
 		//ctx->ring_ctx->bo_mc = params->dst_addr;
-		ctx->ring_ctx->write_length = params->size / sizeof(uint32_t);
+		ctx->ring_ctx->write_length = params->size;
 
 		/* Build PM4 packet */
 		result = ctx->ip_block->funcs->write_linear(ctx->ip_block->funcs,
@@ -1264,7 +1280,7 @@ int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
 	    /* For copy operations, we need both source and destination addresses */
 	    /* This would require extending the API to pass both addresses */
 	    /* For now, use the internal buffer as source */
-	    ctx->ring_ctx->write_length = params->size / sizeof(uint32_t);
+	    ctx->ring_ctx->write_length = params->size;
 
 	    result = ctx->ip_block->funcs->copy_linear(ctx->ip_block->funcs,
 						      ctx->ring_ctx,
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 12f92a1d5..1282154fd 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -35,6 +35,11 @@ sdma_ring_write_linear(const struct amdgpu_ip_funcs *func,
 
 	i = 0;
 	j = 0;
+
+	/* Guard: write_length must be DWORD-aligned (bytes) */
+	igt_assert_f(ring_context->write_length % 4 == 0,
+		     "SDMA write_linear: write_length %lu not DWORD-aligned\n",
+		     (unsigned long)ring_context->write_length);
 	if (func->family_id == AMDGPU_FAMILY_SI)
 		ring_context->pm4[i++] = SDMA_PACKET_SI(SDMA_OPCODE_WRITE, 0, 0, 0,
 					 ring_context->write_length);
@@ -50,11 +55,17 @@ sdma_ring_write_linear(const struct amdgpu_ip_funcs *func,
 	else
 		ring_context->pm4[i++] = ring_context->write_length;
 
-	while (j++ < ring_context->write_length)
+	while (j++ < ring_context->write_length / 4)
 		ring_context->pm4[i++] = func->deadbeaf;
 
 	*pm4_dw = i;
 
+	/* Guard: ensure PM4 packet fits in allocated buffer */
+	if (ring_context->pm4_size > 0)
+		igt_assert_f(*pm4_dw <= ring_context->pm4_size,
+			     "SDMA write_linear: pm4_dw %u exceeds buffer %u\n",
+			     *pm4_dw, ring_context->pm4_size);
+
 	return 0;
 }
 
@@ -232,14 +243,28 @@ gfx_ring_write_linear(const struct amdgpu_ip_funcs *func,
 	i = 0;
 	j = 0;
 
-	ring_context->pm4[i++] = PACKET3(PACKET3_WRITE_DATA, 2 +  ring_context->write_length);
+	/* Guard: write_length must be DWORD-aligned (bytes) */
+	igt_assert_f(ring_context->write_length % 4 == 0,
+		     "GFX write_linear: write_length %lu not DWORD-aligned\n",
+		     (unsigned long)ring_context->write_length);
+	if (ring_context->pm4_size > 0)
+		igt_assert_f(ring_context->write_length / 4 + 4 <= ring_context->pm4_size,
+			     "GFX write_linear: %lu DWORDs + 4 header > pm4 buffer %u\n",
+			     (unsigned long)(ring_context->write_length / 4),
+			     ring_context->pm4_size);
+
+	ring_context->pm4[i++] = PACKET3(PACKET3_WRITE_DATA, 2 + ring_context->write_length / 4);
 	ring_context->pm4[i++] = WRITE_DATA_DST_SEL(5) | WR_CONFIRM;
 	ring_context->pm4[i++] = lower_32_bits(ring_context->bo_mc);
 	ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
-	while (j++ < ring_context->write_length)
+	while (j++ < ring_context->write_length / 4)
 		ring_context->pm4[i++] = func->deadbeaf;
 
 	*pm4_dw = i;
+	if (ring_context->pm4_size > 0)
+		igt_assert_f(*pm4_dw <= ring_context->pm4_size,
+			     "GFX write_linear: pm4_dw %u exceeds buffer %u\n",
+			     *pm4_dw, ring_context->pm4_size);
 	return 0;
 }
 
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index bb10a9a0e..66c88b85f 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -263,8 +263,8 @@ struct amdgpu_ring_context {
 	int ring_id; /* ring_id from amdgpu_query_hw_ip_info */
 	int res_cnt; /* num of bo in amdgpu_bo_handle resources[2] */
 
-	uint32_t write_length;  /* length of data */
-	uint32_t write_length2; /* length of data for second packet */
+	uint64_t write_length;  /* transfer size in bytes */
+	uint64_t write_length2; /* transfer size in bytes, second packet */
 	uint32_t *pm4;		/* data of the packet */
 	uint32_t pm4_size;	/* max allocated packet size */
 	bool secure;		/* secure or not */
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index e57eb7969..d524b41f0 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -294,7 +294,7 @@ static void amdgpu_command_submission_multi_fence(amdgpu_device_handle device)
 static void amdgpu_userptr_test(amdgpu_device_handle device)
 {
 	const int pm4_dw = 256;
-	const int sdma_write_length = 4;
+	const int sdma_write_length = 16;	/* 4 DWORDs in bytes */
 
 	struct amdgpu_ring_context *ring_context;
 	int r;
@@ -344,7 +344,8 @@ static void amdgpu_userptr_test(amdgpu_device_handle device)
 
 	 amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
 
-	r = ip_block->funcs->compare(ip_block->funcs, ring_context, 1);
+	/* div=4: write_length is bytes, bo_cpu is uint32_t* */
+	r = ip_block->funcs->compare(ip_block->funcs, ring_context, 4);
 	igt_assert_eq(r, 0);
 
 	r = amdgpu_bo_va_op(ring_context->bo, 0, BUFFER_SIZE, ring_context->bo_mc, 0, AMDGPU_VA_OP_UNMAP);
-- 
2.52.0

