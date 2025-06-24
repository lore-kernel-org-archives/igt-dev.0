Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87CDC77B7C
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 08:05:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C67810E04D;
	Tue, 24 Jun 2025 08:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EB8V/E5f";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B871210E04D
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 08:05:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYTayplIPVR0QwrJDuqwBPf36sAOQ9VoTX3BDFX6HkQCkiFRwGxRrQPYpsveAGZTmokME25Of/7EKDD24dRtYpKAniABC5aFcfkIwSfxo/3EgxPYc3wiTFKPFmA4cbRJG5oPpttIkN3gC5HgbpS4fLEUhxesWP4oCXmy4Vml4NnDJRYeD3ZANoLZUcNfBBr+Om0buosD1mit0qsvuPy4csvyar1e4zXv2tDEwfJH4LjUr4nPTwZRcn0S3AQ2bXN+/3SPK4AwYK2JuwGP2WYSYUNrmfKhoHlMGSq8rs+d3B98yE2TjQpwwHiyjGi062iYpDKxoFEeEONZjaK2Jiw4+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYh1QW/gnlecntJvSUW9QChkCRu1DvCgj/JGMvMm7P8=;
 b=eTedGJX3ImbHvY/nSJAHj9xVieWnxoS3Ijvt+ZVISBPjd0/AHq3MZVbb5C+1jTwgAnaal8XPrR+gr62aX9+Vn9ZKwC0L0WtIeXWYJyEklynnz8nqriFWnT4JWHi+wzOpDRufI9ZoeV5V72nsTqc84dn5PpLSdF9SzfQTHZqkImvsjclPyZI1ySlS6aarjmjohtTDSNXN50tyeRW/VIRzriB5y810wHkEGALp856DxlH4OpvL2cpp8PsZR06YlqQ0h62Hc8GGArlmyZQ52RVU364aSxOGhuUX1BQ0MySVDjkHazIDGLZvxV9P5fd4ZGICMsbNo9q6l5oO6bCqddzxdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYh1QW/gnlecntJvSUW9QChkCRu1DvCgj/JGMvMm7P8=;
 b=EB8V/E5fNz5b89UCtKNbRZLo6/NmAUmOInnEqRmx1MjwbH8DAnLFO+eLl836qOUuy2Jeraph0vWJTVgUuqcOFtKBE1gwoKuiCK+dxsj3y6g9ByjBrtIjyRwRRmFS2lXgBCOK5ju03YUhX7qTlF7w0GZwrFYCA790c+5JBeU71iw=
Received: from CH3P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::11)
 by PH7PR12MB7307.namprd12.prod.outlook.com (2603:10b6:510:20b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Tue, 24 Jun
 2025 08:05:43 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::c) by CH3P221CA0001.outlook.office365.com
 (2603:10b6:610:1e7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Tue,
 24 Jun 2025 08:05:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 08:05:42 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 03:05:42 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 03:05:41 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 24 Jun 2025 03:05:39 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v2 1/2] lib/amdgpu: Generalize command submission NOP
 function
Date: Tue, 24 Jun 2025 16:05:29 +0800
Message-ID: <20250624080539.3548500-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|PH7PR12MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: bb6a58d8-f3be-418a-b0de-08ddb2f5ea60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3aMqem8zYdr5z796qaDWgzbNT1irsCx1gU0AlvaewS+rUjO4E9HUNIZdhsfd?=
 =?us-ascii?Q?IO8PqYQXIYR54EgJlWNgZImUYnbckrRDdzJaJuV5ltSkTSKM8zRbruZehIBG?=
 =?us-ascii?Q?4fACPgHMzqH1o92uEJafRjj3zJRuhZUf+Xx8WAL8yB/mEDCpQoxNOWYX7nzy?=
 =?us-ascii?Q?/4g9MOAaH9uwj78YN9xpNHsS4i6axlY1UHGyffxSLKsABG4POk5ynKCjblGN?=
 =?us-ascii?Q?qmIkGZ3+euSbrzL4izVou5N5o8+blNyvbsJFmYd8oL68qs1qwtHQhd+nCWbo?=
 =?us-ascii?Q?+RPirf8NgCM+6s2wzDDsLt5jR1jb24eZnClI9V85PaFQZaBftR3tBUCdMo0E?=
 =?us-ascii?Q?dpOzj0bPjjJYSjS2/65pCB7aviNIsEoaTI/+K0jDKA67MWhLSmkBxMDV9wCB?=
 =?us-ascii?Q?VKhuGW4I+ySU3MrJEfJI5g5iQQreUgepsaI0hEmMI/umnR6nNJs0mm5k8Igm?=
 =?us-ascii?Q?K8hkRJIp/l1ZfFngl/L+LxO1pR3QA63du2GqRZmfADwRvH/H4vGMvMxPakP/?=
 =?us-ascii?Q?Qfsl74gZFViUAcDt4I+Pot4Ekxe9fCxCTI6yGaMT/oWR9GkugOn+ZfKzohB9?=
 =?us-ascii?Q?eWUyJKSc4rt3CrUuVRUC7opwC7xs6KWRJMucU/TIf18PZQuDpMTp5jBJA2dY?=
 =?us-ascii?Q?LBL7lM8wfdGRokVwyPOyva9dyh3TQZiYCqYI9+H7eQZIttb/2jBwWlRYD5Av?=
 =?us-ascii?Q?CVHA+xhMT7p0edw56OctFwBABq3GPDJifQkCuiA3Fxzd/lL+f3C4eqrkIJhd?=
 =?us-ascii?Q?RIzde4rRFB9CgT5afxuwGFWPsiCNwh/lzrOEPpTHmztyO96BoeiAYr/pUn7N?=
 =?us-ascii?Q?r07nWtqxYrENEsp7tRlSCRkiZf7Q6TGdADkfP+9Z76HQYFt1sH9gpj1hfCd5?=
 =?us-ascii?Q?wcXlBmfGKLMVpltNgp+zyar3fQusEOJ6Rhej1OXXTUd1OW6wbMx0Yt87Kxab?=
 =?us-ascii?Q?hUVTH6vhUVbkOaxB0WmvGl6Exla7b5H5AvAGrTyh6ygi2B3DNsUBHeLLYpia?=
 =?us-ascii?Q?1TaW4oN38alFZXzW8tVNocVYVbxr9TvpF2MboKcR7QpNUt09+vMlPzmigY1Q?=
 =?us-ascii?Q?VRcHofUi/lpYzW52ru2XpPSxSPGepcngguZXNVkfSeSp9VWY5ivy5cd/22x6?=
 =?us-ascii?Q?Y49nFv/QpyR8Al4SJtEe9ej3Uataq/cgbMW260wVAW/PUR4LsuKMPTx0vj+7?=
 =?us-ascii?Q?vfj+b52ql8a7cvtBEu/7USzCf6QpOjlOykROIDF0Yywhb3xCQFWrI3uWjZrq?=
 =?us-ascii?Q?QkqRSCMopyKxtz3uL/X0cHWLVb5//FoKJ3R1D46HiB29BtoK2LI6wKzBbFNq?=
 =?us-ascii?Q?/698jBsBALrlNlJk+hPgcs3Ru0n9ZC6Z8HeHinmbz/LR/Yd4To8gjMMTQn4A?=
 =?us-ascii?Q?ol/EnDDdo389/xJLo312b2fPVuNj3isl5KWDjfPDM9BttZiEFB3miU4pRjEk?=
 =?us-ascii?Q?cNxu0N4BI19fQmGrsxgU1rs16KjoXlRbZchKZZHsCCrNEMVfSowPqH1IHKld?=
 =?us-ascii?Q?J0dsCVIWM4/bfAK1iMrJZ2cSb3bTGcXLuiJ+?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 08:05:42.4876 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb6a58d8-f3be-418a-b0de-08ddb2f5ea60
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7307
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

Rename and refactor amdgpu_command_submission_compute_nop() to be more
generic:
- Renamed to amdgpu_command_submission_nop()
- Added type parameter to specify IP block type (COMPUTE/DMA/etc)
- Updated all related queue create/submit/destroy calls to use the type
- Added include for amd_ip_blocks.h in header
- Updated function prototype in header file

This change makes the NOP submission function reusable across different
IP blocks rather than being compute-specific. The function now takes
the IP block type as a parameter and uses it for queue operations.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_compute.c | 8 ++++----
 lib/amdgpu/amd_compute.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/amdgpu/amd_compute.c b/lib/amdgpu/amd_compute.c
index 95bfa53aa..29159af4c 100644
--- a/lib/amdgpu/amd_compute.c
+++ b/lib/amdgpu/amd_compute.c
@@ -32,7 +32,7 @@
  * @param device
  * @param user_queue
  */
-void amdgpu_command_submission_compute_nop(amdgpu_device_handle device, bool user_queue)
+void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_block_type type, bool user_queue)
 {
 	amdgpu_context_handle context_handle;
 	amdgpu_bo_handle ib_result_handle;
@@ -57,7 +57,7 @@ void amdgpu_command_submission_compute_nop(amdgpu_device_handle device, bool use
 	igt_assert_eq(r, 0);
 
 	if (user_queue) {
-		amdgpu_user_queue_create(device, ring_context, AMD_IP_COMPUTE);
+		amdgpu_user_queue_create(device, ring_context, type);
 	} else {
 		r = amdgpu_cs_ctx_create(device, &context_handle);
 		igt_assert_eq(r, 0);
@@ -90,7 +90,7 @@ void amdgpu_command_submission_compute_nop(amdgpu_device_handle device, bool use
 		ring_context->pm4_dw = 16;
 
 		if (user_queue) {
-			amdgpu_user_queue_submit(device, ring_context, AMD_IP_COMPUTE,
+			amdgpu_user_queue_submit(device, ring_context, type,
 						 ib_result_mc_address);
 		} else {
 			memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
@@ -128,7 +128,7 @@ void amdgpu_command_submission_compute_nop(amdgpu_device_handle device, bool use
 	}
 
 	if (user_queue) {
-		amdgpu_user_queue_destroy(device, ring_context, AMD_IP_COMPUTE);
+		amdgpu_user_queue_destroy(device, ring_context, type);
 	} else {
 		r = amdgpu_cs_ctx_free(context_handle);
 		igt_assert_eq(r, 0);
diff --git a/lib/amdgpu/amd_compute.h b/lib/amdgpu/amd_compute.h
index 41ed225b8..d998e9251 100644
--- a/lib/amdgpu/amd_compute.h
+++ b/lib/amdgpu/amd_compute.h
@@ -24,8 +24,8 @@
  */
 #ifndef AMD_COMPUTE_H
 #define AMD_COMPUTE_H
+#include "amd_ip_blocks.h"
 
-
-void amdgpu_command_submission_compute_nop(amdgpu_device_handle device, bool user_queue);
+void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_block_type type,  bool user_queue);
 
 #endif
-- 
2.49.0

