Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08FAC83013
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 05:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A747610E5F6;
	Wed,  2 Jul 2025 05:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tiK5pYvA";
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2048.outbound.protection.outlook.com [40.107.101.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CCD10E5F6
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 05:47:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7BguK1n8L9pbnt9qZjNbloxwN88ze/tBSdB+7hKvYcf1zFUGVTUSaUfI2BBebcP8OXdrwnB8kLaJ5tZQQOUX7P7CTuQpCqin2cJKO7rC+MG0fXOAffMHgz1kF+sco6IOoKNG+OM7c0WJboZnWC9wPZohYfpBwRW+8IZ2tVjft+Eh3hEdMgNWg1YSuTrr6KX73SNMXNcpgHN5nPJFUFqxVIEC1B/3QjiyL27B9RUU2XhqP/1E/5EvjlmaZh5NYIPW9NDrLyCqfCFMxmYe4Jw35HUa13xqqnXP5O+6Xs6EkeCp6TmiawjTCXVlaFMhhlGHeJR7ZpnU4jSMN2dGfBaUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opUbg0V9spp8FMzgR/Def5/QFTn98Cg3cURstnx3eNk=;
 b=SU7zb3P9xwYLfvQyVH06A/E+pRIOzVyQb8oh1GBjtldgcezy0LOMXHmShqundq6KGYvcrrWzt6Z3b75RBTyG0mta24jK5xE1Bq+zavJsgN2DS7qgk4C9KkyLkrTuLaSqD/rSMnN84xHBE9aMEZjw1x6fsIUAo3riwCiBOdL4LXGDGZS8VSXqPQYGUuyL7B4lXuAkOCE18RWy+NQ7OondzCL54sobNSK+RzUHYFj+MU5f4CJd6oUV3tN+b5l7VahZuXjV4iyFIL88SUa61FsUbSVAGnAVuA8FbHoIeUXups5E76sLzMxd1Y0/xxLFmLmla4B1I2yjFTnBexchIy3oeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opUbg0V9spp8FMzgR/Def5/QFTn98Cg3cURstnx3eNk=;
 b=tiK5pYvArZ8i2lhGeVhxXfi7doKHn29woio63/QhKxGarLT+17IsqhWBevKh2sCMTRgWATyThpHFl8gTZmYgK7eThJoJGnJG79mPNp/LxkLwDGKG7WavPAzc75nVwmH1AAxBfEfS59L1bmLUFl0awb5+6xsUKooS8p6RBpR6N4I=
Received: from DS7PR03CA0242.namprd03.prod.outlook.com (2603:10b6:5:3b3::7) by
 DM4PR12MB6470.namprd12.prod.outlook.com (2603:10b6:8:b8::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.29; Wed, 2 Jul 2025 05:47:43 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:5:3b3:cafe::e6) by DS7PR03CA0242.outlook.office365.com
 (2603:10b6:5:3b3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Wed,
 2 Jul 2025 05:47:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 05:47:43 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 00:47:42 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 00:47:41 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 2 Jul 2025 00:47:40 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v3 5/5] lib/amdgpu: Consolidate user queue
 implementation into amd_ip_blocks.h
Date: Wed, 2 Jul 2025 13:47:13 +0800
Message-ID: <20250702054730.366888-5-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702054730.366888-1-Jesse.Zhang@amd.com>
References: <20250702054730.366888-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|DM4PR12MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: 967688fe-c5f9-46e2-f933-08ddb92bf6d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m8OSHckMWo6D5+7jRgRn+kIZ5AN3NNdv1CJJWjzDqz1/wUHLS3zIAMiJs7O7?=
 =?us-ascii?Q?HQ9Jfon0LZMqYE+kGPbw8K9eLo8HjDqw5Zgq1zl7AIm+TXLqfhKWBovd+8Zx?=
 =?us-ascii?Q?X7/sDMx749/2S7cyTdNmitlRYs29qbsWyAPoCYDWDo7LonTNJHp7g/0s4WHj?=
 =?us-ascii?Q?jHCLznNIwBBwNYWze0PiLJD/ylJex+zQQmofX4LOFmgomXVzP3chzTi29c9D?=
 =?us-ascii?Q?go+TO2YvTnpMieU4rE5sITP8BrMkl89l3bjOzFLR5jjN0XWoCu3PLCgoB/ip?=
 =?us-ascii?Q?bRz8pUY7CZQY2ICFXEEIoO7/45K4aIjNKH0K6aME3aAsndmuiUJDB1QGpyGv?=
 =?us-ascii?Q?B8mLXOW3pXPiiEwfvHy5jXIVcvz+D+gGLmjIg346AjPm9l0pyLTguk5KNB7d?=
 =?us-ascii?Q?mGxWKqAlLLpyBHkUHH+8qs+G+hb4XpxynkBA9JsV0JgTvo2q4fVa9xjSkCyI?=
 =?us-ascii?Q?pidk95H11O0zEAXT4aJ+ZgHRtOu0neQM9GHbJsyOSH55bFjuBgcaxAY26liR?=
 =?us-ascii?Q?NZ9jFA1p/kI6pf64u/v7kKUjnIiRN4XSTgsh1k1WS4QhCqPmwPCLwVirBMXj?=
 =?us-ascii?Q?zSk1Lhr4jadCcOppkVWpbxDABrcAqxVmc9N0L9VCvqNqFHprZOOHMc/sZwli?=
 =?us-ascii?Q?1Hmshj5F94UxEsJliO+67ICOEZfusaWjC2VQKHPzp6IgwstQHcPBR0EQrOMz?=
 =?us-ascii?Q?ajbN/JwFO9yQYI9758ASgzYRRFd+v3BAnOhmY4Gq+GmttOLbArh46ebmi0/6?=
 =?us-ascii?Q?UXtdZCCfeSVbRSFw+1UIXUNfSqYBFKs4TczxKhvfCSMa1gq52vOAvdzNGpzC?=
 =?us-ascii?Q?YCTNx1tr83+OSE9ZZ+6HPnb+wdJ4g31y0ak3jSIZW3sK8+0+gXWEIrRd8HHX?=
 =?us-ascii?Q?K4RmTapnrfEZWmy1B22W5ZEd1HOHYhEbZYY6mzbMxJ8v5korrtnjanq6RJd/?=
 =?us-ascii?Q?GKq++kK4i5cWmPrNOwbYMUZQ1VhXeXqC3M1rRscXRSLG5lj7KpEKJurLunMG?=
 =?us-ascii?Q?ei2Gl6HOF9J/HPSKnJdPHWxScnKHoDPx8Cv+/0QLJu4he1uHSl54iDCqpmw0?=
 =?us-ascii?Q?Sw1Go82z+6jsWRi0A9Y0lpHmo/We1nKNLBruVOTVnH/4EjX+huHNquldkKLH?=
 =?us-ascii?Q?INOKK+6F9mcZGofTDnACoMtmbCAwyhGq8bFygmhLRr56v1WHOvSdYIp8zGs2?=
 =?us-ascii?Q?YLjA/9QBC/zSIN3osBzLuxKeesETAzJdOZV2v7S08DNktfxGEfoY2jtI6v5c?=
 =?us-ascii?Q?OaVAD8hFxQ8fe7xWlCUJfWXLtYUvZKycaZ7dLnFctF/SSMblSJ5BVZ2ieAcW?=
 =?us-ascii?Q?EwKxm4DJ/Im77Ia9lmUVsvQgWY/lF0zB2Zs3/qrOQM3MKDohmsVIiCRyR4MQ?=
 =?us-ascii?Q?lsHlvNHQztjV3ZkLf5iobgIV4tTcBHGu4qCdHslbterDTjI9lETYzZrkftjr?=
 =?us-ascii?Q?WUP7SnIKCfBEr1sLBvRJO3xjna7cQ1UtvWrs9VOw4KI8tokL9rmElyFWZjRD?=
 =?us-ascii?Q?dPRwBuDq7EitPtATchTYN2/2qOW/eIJGx3y4?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 05:47:43.1797 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 967688fe-c5f9-46e2-f933-08ddb92bf6d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6470
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

This commit refactors the user queue (UMQ) implementation by:

1. Moving all UMQ-related definitions and functions from amd_userq.[ch]
   into amd_ip_blocks.h for better code organization and to reduce
   unnecessary file separation.

2. Adding user queue operations (create/submit/destroy) directly to the
   amdgpu_ip_funcs structure, making them IP-block specific.

3. Removing the now-obsolete amd_userq.[ch] files and updating all
   references to use the new IP block interface.

Key changes include:
- Defined UMQ constants (PAGE_SIZE, queue sizes) in header
- Added packet building macros (amdgpu_pkt_begin/add_dw/end)
- Integrated UMQ functions into IP block ops structure
- Updated all tests to use IP block funcs instead of direct UMQ calls
- Removed standalone UMQ implementation files

This consolidation improves code maintainability and makes the UMQ
implementation more consistent with the rest of the driver architecture.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_command_submission.c |  17 +-
 lib/amdgpu/amd_compute.c            |   9 +-
 lib/amdgpu/amd_deadlock_helpers.c   |   7 +-
 lib/amdgpu/amd_ip_blocks.c          | 496 ++++++++++++++++++++++++++++
 lib/amdgpu/amd_ip_blocks.h          |  40 +++
 lib/amdgpu/amd_memory.c             |   3 +-
 lib/amdgpu/amd_userq.c              | 494 ---------------------------
 lib/amdgpu/amd_userq.h              |  55 ---
 lib/meson.build                     |   3 +-
 tests/amdgpu/amd_basic.c            |   9 +-
 tests/amdgpu/amd_cs_nop.c           |   9 +-
 tests/amdgpu/amd_deadlock.c         |   1 -
 12 files changed, 564 insertions(+), 579 deletions(-)
 delete mode 100644 lib/amdgpu/amd_userq.c
 delete mode 100644 lib/amdgpu/amd_userq.h

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index fcc356f8f..2b13e7a9b 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -10,7 +10,6 @@
 #include "lib/amdgpu/amd_sdma.h"
 #include "lib/amdgpu/amd_PM4.h"
 #include "lib/amdgpu/amd_command_submission.h"
-#include "lib/amdgpu/amd_userq.h"
 #include "ioctl_wrappers.h"
 
 
@@ -33,7 +32,9 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
 	struct amdgpu_cs_fence fence_status = {0};
 	amdgpu_va_handle va_handle;
 	bool user_queue = ring_context->user_queue;
+	const struct amdgpu_ip_block_version *ip_block = NULL;
 
+	ip_block = get_ip_block(device, ip_type);
 	amdgpu_bo_handle *all_res = alloca(sizeof(ring_context->resources[0]) * (ring_context->res_cnt + 1));
 
 	if (expect_failure) {
@@ -68,7 +69,7 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
 	memcpy(ring_ptr, ring_context->pm4, ring_context->pm4_dw * sizeof(*ring_context->pm4));
 
 	if (user_queue)
-		amdgpu_user_queue_submit(device, ring_context, ip_type, ib_result_mc_address);
+		ip_block->funcs->userq_submit(device, ring_context, ip_type, ib_result_mc_address);
 	else {
 		ring_context->ib_info.ib_mc_address = ib_result_mc_address;
 		ring_context->ib_info.size = ring_context->pm4_dw;
@@ -163,7 +164,7 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 		gtt_flags[i] |= AMDGPU_GEM_CREATE_ENCRYPTED;
 
 	if (user_queue) {
-		amdgpu_user_queue_create(device, ring_context, ip_block->type);
+		ip_block->funcs->userq_create(device, ring_context, ip_block->type);
 	} else {
 		r = amdgpu_cs_ctx_create(device, &ring_context->context_handle);
 		igt_assert_eq(r, 0);
@@ -246,7 +247,7 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 	free(ring_context->pm4);
 
 	if (user_queue) {
-		amdgpu_user_queue_destroy(device, ring_context, ip_block->type);
+		ip_block->funcs->userq_destroy(device, ring_context, ip_block->type);
 	} else {
 		r = amdgpu_cs_ctx_free(ring_context->context_handle);
 		igt_assert_eq(r, 0);
@@ -287,7 +288,7 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 	igt_assert_eq(r, 0);
 
 	if (user_queue) {
-		amdgpu_user_queue_create(device, ring_context, ip_block->type);
+		ip_block->funcs->userq_create(device, ring_context, ip_block->type);
 	} else {
 		r = amdgpu_cs_ctx_create(device, &ring_context->context_handle);
 		igt_assert_eq(r, 0);
@@ -341,7 +342,7 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 	free(ring_context->pm4);
 
 	if (user_queue) {
-		amdgpu_user_queue_destroy(device, ring_context, ip_block->type);
+		ip_block->funcs->userq_destroy(device, ring_context, ip_block->type);
 	} else {
 		r = amdgpu_cs_ctx_free(ring_context->context_handle);
 		igt_assert_eq(r, 0);
@@ -383,7 +384,7 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 
 
 	if (user_queue) {
-		amdgpu_user_queue_create(device, ring_context, ip_block->type);
+		ip_block->funcs->userq_create(device, ring_context, ip_block->type);
 	} else {
 		r = amdgpu_cs_ctx_create(device, &ring_context->context_handle);
 		igt_assert_eq(r, 0);
@@ -467,7 +468,7 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 	free(ring_context->pm4);
 
 	if (user_queue) {
-		amdgpu_user_queue_destroy(device, ring_context, ip_block->type);
+		ip_block->funcs->userq_destroy(device, ring_context, ip_block->type);
 	} else {
 		r = amdgpu_cs_ctx_free(ring_context->context_handle);
 		igt_assert_eq(r, 0);
diff --git a/lib/amdgpu/amd_compute.c b/lib/amdgpu/amd_compute.c
index d53df241c..d92b99a76 100644
--- a/lib/amdgpu/amd_compute.c
+++ b/lib/amdgpu/amd_compute.c
@@ -26,7 +26,6 @@
 #include "amd_memory.h"
 #include "amd_compute.h"
 #include "amd_sdma.h"
-#include "amd_userq.h"
 
 /**
  *
@@ -42,6 +41,7 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
 	struct amdgpu_cs_request ibs_request;
 	struct amdgpu_cs_ib_info ib_info;
 	struct amdgpu_cs_fence fence_status;
+	const struct amdgpu_ip_block_version *ip_block = NULL;
 	uint32_t *ptr;
 	uint32_t expired;
 	int r, instance;
@@ -50,6 +50,7 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
 
 	struct amdgpu_ring_context *ring_context;
 
+	ip_block = get_ip_block(device, type);
 	ring_context = calloc(1, sizeof(*ring_context));
 	igt_assert(ring_context);
 
@@ -57,7 +58,7 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
 	igt_assert_eq(r, 0);
 
 	if (user_queue) {
-		amdgpu_user_queue_create(device, ring_context, type);
+		ip_block->funcs->userq_create(device, ring_context, type);
 	} else {
 		r = amdgpu_cs_ctx_create(device, &context_handle);
 		igt_assert_eq(r, 0);
@@ -93,7 +94,7 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
 		ring_context->pm4_dw = 16;
 
 		if (user_queue) {
-			amdgpu_user_queue_submit(device, ring_context, type,
+			ip_block->funcs->userq_submit(device, ring_context, type,
 						 ib_result_mc_address);
 		} else {
 			memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
@@ -131,7 +132,7 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
 	}
 
 	if (user_queue) {
-		amdgpu_user_queue_destroy(device, ring_context, type);
+		ip_block->funcs->userq_destroy(device, ring_context, type);
 	} else {
 		r = amdgpu_cs_ctx_free(context_handle);
 		igt_assert_eq(r, 0);
diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index f7845edb0..1ed407332 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -13,7 +13,6 @@
 #include <signal.h>
 #include "amd_memory.h"
 #include "amd_deadlock_helpers.h"
-#include "lib/amdgpu/amd_userq.h"
 #include "lib/amdgpu/amd_command_submission.h"
 
 #define MAX_JOB_COUNT 200
@@ -292,11 +291,12 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
 	struct amdgpu_ring_context *ring_context;
 	int r = 0;
 
+	ip_block = get_ip_block(device_handle, ip_type);
 	ring_context = calloc(1, sizeof(*ring_context));
 	igt_assert(ring_context);
 
 	if (user_queue) {
-		amdgpu_user_queue_create(device_handle, ring_context, ip_type);
+		ip_block->funcs->userq_create(device_handle, ring_context, ip_type);
 	} else {
 		if (priority == AMDGPU_CTX_PRIORITY_HIGH)
 			r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &ring_context->context_handle);
@@ -314,7 +314,6 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
 	ring_context->user_queue = user_queue;
 	ring_context->time_out = 0x7ffff;
 	igt_assert(ring_context->pm4);
-	ip_block = get_ip_block(device_handle, ip_type);
 	r = amdgpu_bo_alloc_and_map_sync(device_handle,
 				    ring_context->write_length * sizeof(uint32_t),
 				    4096, AMDGPU_GEM_DOMAIN_GTT,
@@ -345,7 +344,7 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
 	amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle, ring_context->bo_mc,
 				 ring_context->write_length * sizeof(uint32_t));
 	if (user_queue) {
-		amdgpu_user_queue_destroy(device_handle, ring_context, ip_block->type);
+		ip_block->funcs->userq_destroy(device_handle, ring_context, ip_block->type);
 	} else {
 		free(ring_context->pm4);
 		free(ring_context);
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index e4913c77d..718fcc0c4 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -464,6 +464,496 @@ x_compare_pattern(const struct amdgpu_ip_funcs *func,
 	return ret;
 }
 
+#ifdef AMDGPU_USERQ_ENABLED
+static void amdgpu_alloc_doorbell(amdgpu_device_handle device_handle,
+				  struct amdgpu_userq_bo *doorbell_bo,
+				  unsigned int size, unsigned int domain)
+{
+	struct amdgpu_bo_alloc_request req = {0};
+	amdgpu_bo_handle buf_handle;
+	int r;
+
+	req.alloc_size = ALIGN(size, PAGE_SIZE);
+	req.preferred_heap = domain;
+	r = amdgpu_bo_alloc(device_handle, &req, &buf_handle);
+	igt_assert_eq(r, 0);
+
+	doorbell_bo->handle = buf_handle;
+	doorbell_bo->size = req.alloc_size;
+
+	r = amdgpu_bo_cpu_map(doorbell_bo->handle,
+			      (void **)&doorbell_bo->ptr);
+	igt_assert_eq(r, 0);
+}
+
+int
+amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle device_handle, unsigned int size,
+			   unsigned int alignment, unsigned int heap, uint64_t alloc_flags,
+			   uint64_t mapping_flags, amdgpu_bo_handle *bo, void **cpu,
+			   uint64_t *mc_address, amdgpu_va_handle *va_handle,
+			   uint32_t timeline_syncobj_handle, uint64_t point)
+{
+	struct amdgpu_bo_alloc_request request = {};
+	amdgpu_bo_handle buf_handle;
+	uint64_t vmc_addr;
+	int r;
+
+	request.alloc_size = size;
+	request.phys_alignment = alignment;
+	request.preferred_heap = heap;
+	request.flags = alloc_flags;
+
+	r = amdgpu_bo_alloc(device_handle, &request, &buf_handle);
+	if (r)
+		return r;
+
+	r = amdgpu_va_range_alloc(device_handle,
+				  amdgpu_gpu_va_range_general,
+				  size, alignment, 0, &vmc_addr,
+				  va_handle, 0);
+	if (r)
+		goto error_va_alloc;
+
+	r = amdgpu_bo_va_op_raw2(device_handle, buf_handle, 0,
+				 ALIGN(size, getpagesize()), vmc_addr,
+				 AMDGPU_VM_PAGE_READABLE |
+				 AMDGPU_VM_PAGE_WRITEABLE |
+				 AMDGPU_VM_PAGE_EXECUTABLE |
+				 mapping_flags,
+				 AMDGPU_VA_OP_MAP,
+				 timeline_syncobj_handle,
+				 point, 0, 0);
+	if (r)
+		goto error_va_map;
+
+	if (cpu) {
+		r = amdgpu_bo_cpu_map(buf_handle, cpu);
+		if (r)
+			goto error_cpu_map;
+	}
+
+	*bo = buf_handle;
+	*mc_address = vmc_addr;
+
+	return 0;
+
+error_cpu_map:
+	amdgpu_bo_va_op(buf_handle, 0, size, vmc_addr, 0, AMDGPU_VA_OP_UNMAP);
+error_va_map:
+	amdgpu_va_range_free(*va_handle);
+error_va_alloc:
+	amdgpu_bo_free(buf_handle);
+	return r;
+}
+
+static void amdgpu_bo_unmap_and_free_uq(amdgpu_device_handle device_handle,
+					amdgpu_bo_handle bo, amdgpu_va_handle va_handle,
+					uint64_t mc_addr, uint64_t size,
+					uint32_t timeline_syncobj_handle,
+					uint64_t point, uint64_t syncobj_handles_array,
+					uint32_t num_syncobj_handles)
+{
+	amdgpu_bo_cpu_unmap(bo);
+	amdgpu_bo_va_op_raw2(device_handle, bo, 0, size, mc_addr, 0, AMDGPU_VA_OP_UNMAP,
+				  timeline_syncobj_handle, point,
+				  syncobj_handles_array, num_syncobj_handles);
+	amdgpu_va_range_free(va_handle);
+	amdgpu_bo_free(bo);
+}
+
+int amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
+				 uint32_t timeline_syncobj_handle, uint64_t point)
+{
+	uint32_t flags = DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED;
+	int r;
+
+	r = amdgpu_cs_syncobj_query2(device_handle, &timeline_syncobj_handle,
+				     &point, 1, flags);
+	if (r)
+		return r;
+
+	r = amdgpu_cs_syncobj_timeline_wait(device_handle, &timeline_syncobj_handle,
+					    &point, 1, INT64_MAX,
+					    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
+					    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
+					    NULL);
+	if (r)
+		igt_warn("Timeline timed out\n");
+	return r;
+}
+
+static void
+amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
+			      unsigned int ip_type, uint64_t mc_address)
+{
+	int r;
+	uint32_t control = ring_context->pm4_dw;
+	uint32_t syncarray[1];
+	struct drm_amdgpu_userq_signal signal_data;
+	uint64_t timeout = ring_context->time_out ? ring_context->time_out : INT64_MAX;
+
+	amdgpu_pkt_begin();
+
+	if (ip_type == AMD_IP_DMA) {
+		/* For SDMA, we need to align the IB to 8 DW boundary */
+		unsigned int nop_count = (2 - lower_32_bits(*ring_context->wptr_cpu)) & 7;
+		for (unsigned int i = 0; i < nop_count; i++)
+			amdgpu_pkt_add_dw(SDMA_PKT_HEADER_OP(SDMA_NOP));
+		amdgpu_pkt_add_dw(SDMA_PKT_HEADER_OP(SDMA_OP_INDIRECT));
+		amdgpu_pkt_add_dw(lower_32_bits(mc_address) & 0xffffffe0); // 32-byte aligned
+		amdgpu_pkt_add_dw(upper_32_bits(mc_address));
+		amdgpu_pkt_add_dw(control); // IB length in DWORDS
+		amdgpu_pkt_add_dw(lower_32_bits(ring_context->csa.mc_addr)); // CSA MC address low
+		amdgpu_pkt_add_dw(upper_32_bits(ring_context->csa.mc_addr)); // CSA MC address high
+		if (ring_context->hw_ip_info.hw_ip_version_major <= 6)
+			amdgpu_pkt_add_dw(SDMA_PACKET(SDMA_OP_PROTECTED_FENCE, SDMA6_SUB_OP_PROTECTED_FENCE, 0));
+		else
+			amdgpu_pkt_add_dw(SDMA_PACKET(SDMA_OP_PROTECTED_FENCE, SDMA7_SUB_OP_PROTECTED_FENCE, 0));
+	} else {
+		/* Prepare the Indirect IB to submit the IB to user queue */
+		amdgpu_pkt_add_dw(PACKET3(PACKET3_INDIRECT_BUFFER, 2));
+		amdgpu_pkt_add_dw(lower_32_bits(mc_address));
+		amdgpu_pkt_add_dw(upper_32_bits(mc_address));
+
+		if (ip_type == AMD_IP_GFX)
+			amdgpu_pkt_add_dw(control | S_3F3_INHERIT_VMID_MQD_GFX(1));
+		else
+			amdgpu_pkt_add_dw(control | S_3F3_VALID_COMPUTE(1)
+						| S_3F3_INHERIT_VMID_MQD_COMPUTE(1));
+
+		amdgpu_pkt_add_dw(PACKET3(PACKET3_PROTECTED_FENCE_SIGNAL, 0));
+
+		/* empty dword is needed for fence signal pm4 */
+		amdgpu_pkt_add_dw(0);
+	}
+#if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
+	asm volatile ("mfence" : : : "memory");
+#endif
+
+	/* Below call update the wptr address so will wait till all writes are completed */
+	amdgpu_pkt_end();
+
+#if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
+	asm volatile ("mfence" : : : "memory");
+#endif
+
+	if (ip_type == AMD_IP_DMA)
+		*ring_context->wptr_cpu = *ring_context->wptr_cpu <<2;
+	/* Update the door bell */
+	ring_context->doorbell_cpu[DOORBELL_INDEX] = *ring_context->wptr_cpu;
+
+	/* Add a fence packet for signal */
+	syncarray[0] = ring_context->timeline_syncobj_handle;
+	signal_data.queue_id = ring_context->queue_id;
+	signal_data.syncobj_handles = (uintptr_t)syncarray;
+	signal_data.num_syncobj_handles = 1;
+	signal_data.bo_read_handles = 0;
+	signal_data.bo_write_handles = 0;
+	signal_data.num_bo_read_handles = 0;
+	signal_data.num_bo_write_handles = 0;
+
+	r = amdgpu_userq_signal(device, &signal_data);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_cs_syncobj_wait(device, &ring_context->timeline_syncobj_handle, 1, timeout,
+				   DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
+	igt_assert_eq(r, 0);
+}
+
+static void
+amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
+			       unsigned int type)
+{
+	int r;
+
+	if (type > AMD_IP_DMA) {
+		igt_info("Invalid IP not supported for UMQ Submission\n");
+		return;
+	}
+
+	/* Free the Usermode Queue */
+	r = amdgpu_free_userqueue(device_handle, ctxt->queue_id);
+	igt_assert_eq(r, 0);
+
+	switch (type) {
+	case AMD_IP_GFX:
+		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->csa.handle,
+					    ctxt->csa.va_handle,
+					    ctxt->csa.mc_addr, ctxt->info.gfx.csa_size,
+					    ctxt->timeline_syncobj_handle, ++ctxt->point,
+					    0, 0);
+
+		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->shadow.handle,
+					    ctxt->shadow.va_handle,
+					    ctxt->shadow.mc_addr, ctxt->info.gfx.shadow_size,
+					    ctxt->timeline_syncobj_handle, ++ctxt->point,
+					    0, 0);
+
+		r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
+						 ctxt->point);
+		igt_assert_eq(r, 0);
+		break;
+
+	case AMD_IP_COMPUTE:
+		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->eop.handle,
+					    ctxt->eop.va_handle,
+					    ctxt->eop.mc_addr, 256,
+					    ctxt->timeline_syncobj_handle, ++ctxt->point,
+					    0, 0);
+
+		r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
+						 ctxt->point);
+		igt_assert_eq(r, 0);
+		break;
+
+	case AMD_IP_DMA:
+		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->csa.handle,
+					    ctxt->csa.va_handle,
+					    ctxt->csa.mc_addr, ctxt->info.gfx.csa_size,
+					    ctxt->timeline_syncobj_handle, ++ctxt->point,
+					    0, 0);
+
+		r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
+						 ctxt->point);
+		igt_assert_eq(r, 0);
+		break;
+
+	default:
+		igt_info("IP invalid for cleanup\n");
+	}
+
+	r = amdgpu_cs_destroy_syncobj(device_handle, ctxt->timeline_syncobj_handle);
+	igt_assert_eq(r, 0);
+
+	/* Clean up doorbell*/
+	r = amdgpu_bo_cpu_unmap(ctxt->doorbell.handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_free(ctxt->doorbell.handle);
+	igt_assert_eq(r, 0);
+
+	/* Clean up rptr wptr queue */
+	amdgpu_bo_unmap_and_free(ctxt->rptr.handle, ctxt->rptr.va_handle,
+				 ctxt->rptr.mc_addr, 8);
+
+	amdgpu_bo_unmap_and_free(ctxt->wptr.handle, ctxt->wptr.va_handle,
+				 ctxt->wptr.mc_addr, 8);
+
+	amdgpu_bo_unmap_and_free(ctxt->queue.handle, ctxt->queue.va_handle,
+				 ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE);
+}
+
+static void
+amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
+			      unsigned int type)
+{
+	int r;
+	uint64_t gtt_flags = 0, queue_flags = 0;
+	struct drm_amdgpu_userq_mqd_gfx11 gfx_mqd;
+	struct drm_amdgpu_userq_mqd_sdma_gfx11 sdma_mqd;
+	struct drm_amdgpu_userq_mqd_compute_gfx11 compute_mqd;
+	void *mqd;
+
+	if (type > AMD_IP_DMA) {
+		igt_info("Invalid IP not supported for UMQ Submission\n");
+		return;
+	}
+
+	if (ctxt->secure) {
+		gtt_flags |= AMDGPU_GEM_CREATE_ENCRYPTED;
+		queue_flags |= AMDGPU_USERQ_CREATE_FLAGS_QUEUE_SECURE;
+	}
+
+	if (ctxt->priority)
+		queue_flags |= ctxt->priority & AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_MASK;
+
+	r = amdgpu_query_uq_fw_area_info(device_handle, AMD_IP_GFX, 0, &ctxt->info);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_cs_create_syncobj2(device_handle, 0, &ctxt->timeline_syncobj_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map_uq(device_handle, USERMODE_QUEUE_SIZE,
+				       ALIGNMENT,
+				       AMDGPU_GEM_DOMAIN_GTT,
+				       gtt_flags,
+				       AMDGPU_VM_MTYPE_UC,
+				       &ctxt->queue.handle, &ctxt->queue.ptr,
+				       &ctxt->queue.mc_addr, &ctxt->queue.va_handle,
+				       ctxt->timeline_syncobj_handle, ++ctxt->point);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map_uq(device_handle, 8,
+				       ALIGNMENT,
+				       AMDGPU_GEM_DOMAIN_GTT,
+				       gtt_flags,
+				       AMDGPU_VM_MTYPE_UC,
+				       &ctxt->wptr.handle, &ctxt->wptr.ptr,
+				       &ctxt->wptr.mc_addr, &ctxt->wptr.va_handle,
+				       ctxt->timeline_syncobj_handle, ++ctxt->point);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map_uq(device_handle, 8,
+				       ALIGNMENT,
+				       AMDGPU_GEM_DOMAIN_GTT,
+				       gtt_flags,
+				       AMDGPU_VM_MTYPE_UC,
+				       &ctxt->rptr.handle, &ctxt->rptr.ptr,
+				       &ctxt->rptr.mc_addr, &ctxt->rptr.va_handle,
+				       ctxt->timeline_syncobj_handle, ++ctxt->point);
+	igt_assert_eq(r, 0);
+
+	switch (type) {
+	case AMD_IP_GFX:
+		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->info.gfx.shadow_size,
+					       ctxt->info.gfx.shadow_alignment,
+					       AMDGPU_GEM_DOMAIN_GTT,
+					       gtt_flags,
+					       AMDGPU_VM_MTYPE_UC,
+					       &ctxt->shadow.handle, NULL,
+					       &ctxt->shadow.mc_addr, &ctxt->shadow.va_handle,
+					       ctxt->timeline_syncobj_handle, ++ctxt->point);
+		igt_assert_eq(r, 0);
+
+		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->info.gfx.csa_size,
+					       ctxt->info.gfx.csa_alignment,
+					       AMDGPU_GEM_DOMAIN_GTT,
+					       gtt_flags,
+					       AMDGPU_VM_MTYPE_UC,
+					       &ctxt->csa.handle, NULL,
+					       &ctxt->csa.mc_addr, &ctxt->csa.va_handle,
+					       ctxt->timeline_syncobj_handle, ++ctxt->point);
+		igt_assert_eq(r, 0);
+
+		gfx_mqd.shadow_va = ctxt->shadow.mc_addr;
+		gfx_mqd.csa_va = ctxt->csa.mc_addr;
+		mqd = &gfx_mqd;
+		break;
+
+	case AMD_IP_COMPUTE:
+		r = amdgpu_bo_alloc_and_map_uq(device_handle, 256,
+					       ALIGNMENT,
+					       AMDGPU_GEM_DOMAIN_GTT,
+					       gtt_flags,
+					       AMDGPU_VM_MTYPE_UC,
+					       &ctxt->eop.handle, NULL,
+					       &ctxt->eop.mc_addr, &ctxt->eop.va_handle,
+					       ctxt->timeline_syncobj_handle, ++ctxt->point);
+		igt_assert_eq(r, 0);
+		compute_mqd.eop_va = ctxt->eop.mc_addr;
+		mqd = &compute_mqd;
+		break;
+
+	case AMD_IP_DMA:
+		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->info.gfx.csa_size,
+					       ctxt->info.gfx.csa_alignment,
+					       AMDGPU_GEM_DOMAIN_GTT,
+					       gtt_flags,
+					       AMDGPU_VM_MTYPE_UC,
+					       &ctxt->csa.handle, NULL,
+					       &ctxt->csa.mc_addr, &ctxt->csa.va_handle,
+					       ctxt->timeline_syncobj_handle, ++ctxt->point);
+		igt_assert_eq(r, 0);
+		sdma_mqd.csa_va = ctxt->csa.mc_addr;
+		mqd = &sdma_mqd;
+		break;
+
+	default:
+		igt_info("Unsupported IP for UMQ submission\n");
+		return;
+
+	}
+
+	r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
+					 ctxt->point);
+	igt_assert_eq(r, 0);
+
+	amdgpu_alloc_doorbell(device_handle, &ctxt->doorbell, PAGE_SIZE,
+			      AMDGPU_GEM_DOMAIN_DOORBELL);
+
+	ctxt->doorbell_cpu = (uint64_t *)ctxt->doorbell.ptr;
+
+	ctxt->wptr_cpu = (uint64_t *)ctxt->wptr.ptr;
+	ctxt->rptr_cpu = (uint64_t *)ctxt->rptr.ptr;
+
+	ctxt->queue_cpu = (uint32_t *)ctxt->queue.ptr;
+	memset(ctxt->queue_cpu, 0, USERMODE_QUEUE_SIZE);
+
+	/* get db bo handle */
+	amdgpu_bo_export(ctxt->doorbell.handle, amdgpu_bo_handle_type_kms, &ctxt->db_handle);
+
+	/* Create the Usermode Queue */
+	switch (type) {
+	case AMD_IP_GFX:
+		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_GFX,
+					    ctxt->db_handle, DOORBELL_INDEX,
+					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
+					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
+					    mqd, queue_flags, &ctxt->queue_id);
+		igt_assert_eq(r, 0);
+		break;
+
+	case AMD_IP_COMPUTE:
+		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_COMPUTE,
+					    ctxt->db_handle, DOORBELL_INDEX,
+					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
+					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
+					    mqd, queue_flags, &ctxt->queue_id);
+		igt_assert_eq(r, 0);
+		break;
+
+	case AMD_IP_DMA:
+		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_DMA,
+					    ctxt->db_handle, DOORBELL_INDEX,
+					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
+					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
+					    mqd, queue_flags, &ctxt->queue_id);
+		igt_assert_eq(r, 0);
+		break;
+
+	default:
+		igt_info("Unsupported IP, failed to create user queue\n");
+		return;
+
+	}
+}
+#else
+int
+amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle device_handle, unsigned int size,
+			   unsigned int alignment, unsigned int heap, uint64_t alloc_flags,
+			   uint64_t mapping_flags, amdgpu_bo_handle *bo, void **cpu,
+			   uint64_t *mc_address, amdgpu_va_handle *va_handle,
+			   uint32_t timeline_syncobj_handle, uint64_t point)
+{
+	return 0;
+}
+
+int
+amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
+	uint32_t timeline_syncobj_handle, uint64_t point)
+{
+	return 0;
+}
+
+static void
+amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
+	unsigned int ip_type, uint64_t mc_address)
+{
+}
+
+static void
+amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
+	unsigned int type)
+{
+}
+
+static void
+amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
+	unsigned int type)
+{
+}
+#endif
+
 static struct amdgpu_ip_funcs gfx_v8_x_ip_funcs = {
 	.family_id = FAMILY_VI,
 	.align_mask = 0xff,
@@ -479,6 +969,9 @@ static struct amdgpu_ip_funcs gfx_v8_x_ip_funcs = {
 	.compare_pattern = x_compare_pattern,
 	.get_reg_offset = gfx_v8_0_get_reg_offset,
 	.wait_reg_mem = gfx_ring_wait_reg_mem,
+	.userq_create = amdgpu_user_queue_create,
+	.userq_submit = amdgpu_user_queue_submit,
+	.userq_destroy = amdgpu_user_queue_destroy,
 };
 
 static struct amdgpu_ip_funcs sdma_v3_x_ip_funcs = {
@@ -496,6 +989,9 @@ static struct amdgpu_ip_funcs sdma_v3_x_ip_funcs = {
 	.compare_pattern = x_compare_pattern,
 	.get_reg_offset = gfx_v8_0_get_reg_offset,
 	.wait_reg_mem = sdma_ring_wait_reg_mem,
+	.userq_create = amdgpu_user_queue_create,
+	.userq_submit = amdgpu_user_queue_submit,
+	.userq_destroy = amdgpu_user_queue_destroy,
 };
 
 struct amdgpu_ip_block_version gfx_v8_x_ip_block = {
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 2a4fa1742..b5731e13b 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -8,6 +8,8 @@
 #define AMD_IP_BLOCKS_H
 
 #include <amdgpu_drm.h>
+#include <amdgpu.h>
+#include <time.h>
 #include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
@@ -32,6 +34,29 @@
 #define   S_3F3_VALID_COMPUTE(x)		(((unsigned int)(x)&0x1) << 23)/* userqueue only */
 #define   S_3F3_INHERIT_VMID_MQD_COMPUTE(x)	(((unsigned int)(x)&0x1) << 30)/* userqueue only */
 
+#ifndef PAGE_SIZE
+#define PAGE_SIZE 4096
+#endif
+
+#define USERMODE_QUEUE_SIZE		(PAGE_SIZE * 256)   //In bytes with total size as 1 Mbyte
+#define ALIGNMENT			4096
+#define DOORBELL_INDEX			4
+#define USERMODE_QUEUE_SIZE_DW		(USERMODE_QUEUE_SIZE >> 2)
+#define USERMODE_QUEUE_SIZE_DW_MASK	(USERMODE_QUEUE_SIZE_DW - 1)
+
+#define amdgpu_pkt_begin() uint32_t __num_dw_written = 0; \
+	uint32_t __ring_start = *ring_context->wptr_cpu & USERMODE_QUEUE_SIZE_DW_MASK;
+
+#define amdgpu_pkt_add_dw(value) do { \
+	*(ring_context->queue_cpu + \
+	((__ring_start + __num_dw_written) & USERMODE_QUEUE_SIZE_DW_MASK)) \
+	= value; \
+	__num_dw_written++;\
+} while (0)
+
+#define amdgpu_pkt_end() \
+	*ring_context->wptr_cpu += __num_dw_written
+
 enum amd_ip_block_type {
 	AMD_IP_GFX = 0,
 	AMD_IP_COMPUTE,
@@ -202,6 +227,10 @@ struct amdgpu_ip_funcs {
 	int (*get_reg_offset)(enum general_reg reg);
 	int (*wait_reg_mem)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
 
+	/* userq functions */
+	void (*userq_create)(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt, unsigned int type);
+	void (*userq_submit)(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context, unsigned int ip_type, uint64_t mc_address);
+	void (*userq_destroy)(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt, unsigned int type);
 };
 
 extern const struct amdgpu_ip_block_version gfx_v6_0_ip_block;
@@ -280,4 +309,15 @@ get_pci_addr_from_fd(int fd, struct pci_addr *pci);
 
 bool
 is_support_page_queue(enum amd_ip_block_type ip_type, const struct pci_addr *pci);
+
+int
+amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle device_handle, unsigned int size,
+			       unsigned int alignment, unsigned int heap, uint64_t alloc_flags,
+			       uint64_t mapping_flags, amdgpu_bo_handle *bo, void **cpu,
+			       uint64_t *mc_address, amdgpu_va_handle *va_handle,
+			       uint32_t timeline_syncobj_handle, uint64_t point);
+
+int
+amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
+				 uint32_t timeline_syncobj_handle, uint64_t point);
 #endif
diff --git a/lib/amdgpu/amd_memory.c b/lib/amdgpu/amd_memory.c
index 882c5c18f..72ea3db6c 100644
--- a/lib/amdgpu/amd_memory.c
+++ b/lib/amdgpu/amd_memory.c
@@ -25,8 +25,7 @@
 
 #include "amd_memory.h"
 #include "amd_PM4.h"
-#include "amd_userq.h"
-
+#include "amd_ip_blocks.h"
 /**
  *
  * @param device_handle
diff --git a/lib/amdgpu/amd_userq.c b/lib/amdgpu/amd_userq.c
deleted file mode 100644
index 43a2d10c5..000000000
--- a/lib/amdgpu/amd_userq.c
+++ /dev/null
@@ -1,494 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright 2025 Advanced Micro Devices, Inc.
- */
-
-#include "amd_userq.h"
-#include "amd_memory.h"
-#include "amd_PM4.h"
-#include "amd_sdma.h"
-#include "ioctl_wrappers.h"
-
-#ifdef AMDGPU_USERQ_ENABLED
-static void amdgpu_alloc_doorbell(amdgpu_device_handle device_handle,
-				  struct amdgpu_userq_bo *doorbell_bo,
-				  unsigned int size, unsigned int domain)
-{
-	struct amdgpu_bo_alloc_request req = {0};
-	amdgpu_bo_handle buf_handle;
-	int r;
-
-	req.alloc_size = ALIGN(size, PAGE_SIZE);
-	req.preferred_heap = domain;
-	r = amdgpu_bo_alloc(device_handle, &req, &buf_handle);
-	igt_assert_eq(r, 0);
-
-	doorbell_bo->handle = buf_handle;
-	doorbell_bo->size = req.alloc_size;
-
-	r = amdgpu_bo_cpu_map(doorbell_bo->handle,
-			      (void **)&doorbell_bo->ptr);
-	igt_assert_eq(r, 0);
-}
-
-int
-amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle device_handle, unsigned int size,
-			   unsigned int alignment, unsigned int heap, uint64_t alloc_flags,
-			   uint64_t mapping_flags, amdgpu_bo_handle *bo, void **cpu,
-			   uint64_t *mc_address, amdgpu_va_handle *va_handle,
-			   uint32_t timeline_syncobj_handle, uint64_t point)
-{
-	struct amdgpu_bo_alloc_request request = {};
-	amdgpu_bo_handle buf_handle;
-	uint64_t vmc_addr;
-	int r;
-
-	request.alloc_size = size;
-	request.phys_alignment = alignment;
-	request.preferred_heap = heap;
-	request.flags = alloc_flags;
-
-	r = amdgpu_bo_alloc(device_handle, &request, &buf_handle);
-	if (r)
-		return r;
-
-	r = amdgpu_va_range_alloc(device_handle,
-				  amdgpu_gpu_va_range_general,
-				  size, alignment, 0, &vmc_addr,
-				  va_handle, 0);
-	if (r)
-		goto error_va_alloc;
-
-	r = amdgpu_bo_va_op_raw2(device_handle, buf_handle, 0,
-				 ALIGN(size, getpagesize()), vmc_addr,
-				 AMDGPU_VM_PAGE_READABLE |
-				 AMDGPU_VM_PAGE_WRITEABLE |
-				 AMDGPU_VM_PAGE_EXECUTABLE |
-				 mapping_flags,
-				 AMDGPU_VA_OP_MAP,
-				 timeline_syncobj_handle,
-				 point, 0, 0);
-	if (r)
-		goto error_va_map;
-
-	if (cpu) {
-		r = amdgpu_bo_cpu_map(buf_handle, cpu);
-		if (r)
-			goto error_cpu_map;
-	}
-
-	*bo = buf_handle;
-	*mc_address = vmc_addr;
-
-	return 0;
-
-error_cpu_map:
-	amdgpu_bo_va_op(buf_handle, 0, size, vmc_addr, 0, AMDGPU_VA_OP_UNMAP);
-error_va_map:
-	amdgpu_va_range_free(*va_handle);
-error_va_alloc:
-	amdgpu_bo_free(buf_handle);
-	return r;
-}
-
-static void amdgpu_bo_unmap_and_free_uq(amdgpu_device_handle device_handle,
-					amdgpu_bo_handle bo, amdgpu_va_handle va_handle,
-					uint64_t mc_addr, uint64_t size,
-					uint32_t timeline_syncobj_handle,
-					uint64_t point, uint64_t syncobj_handles_array,
-					uint32_t num_syncobj_handles)
-{
-	amdgpu_bo_cpu_unmap(bo);
-	amdgpu_bo_va_op_raw2(device_handle, bo, 0, size, mc_addr, 0, AMDGPU_VA_OP_UNMAP,
-				  timeline_syncobj_handle, point,
-				  syncobj_handles_array, num_syncobj_handles);
-	amdgpu_va_range_free(va_handle);
-	amdgpu_bo_free(bo);
-}
-
-int amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
-				 uint32_t timeline_syncobj_handle, uint64_t point)
-{
-	uint32_t flags = DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED;
-	int r;
-
-	r = amdgpu_cs_syncobj_query2(device_handle, &timeline_syncobj_handle,
-				     &point, 1, flags);
-	if (r)
-		return r;
-
-	r = amdgpu_cs_syncobj_timeline_wait(device_handle, &timeline_syncobj_handle,
-					    &point, 1, INT64_MAX,
-					    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
-					    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
-					    NULL);
-	if (r)
-		igt_warn("Timeline timed out\n");
-	return r;
-}
-
-void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
-			      unsigned int ip_type, uint64_t mc_address)
-{
-	int r;
-	uint32_t control = ring_context->pm4_dw;
-	uint32_t syncarray[1];
-	struct drm_amdgpu_userq_signal signal_data;
-	uint64_t timeout = ring_context->time_out ? ring_context->time_out : INT64_MAX;
-
-	amdgpu_pkt_begin();
-
-	if (ip_type == AMD_IP_DMA) {
-		/* For SDMA, we need to align the IB to 8 DW boundary */
-		unsigned int nop_count = (2 - lower_32_bits(*ring_context->wptr_cpu)) & 7;
-		for (unsigned int i = 0; i < nop_count; i++)
-			amdgpu_pkt_add_dw(SDMA_PKT_HEADER_OP(SDMA_NOP));
-		amdgpu_pkt_add_dw(SDMA_PKT_HEADER_OP(SDMA_OP_INDIRECT));
-		amdgpu_pkt_add_dw(lower_32_bits(mc_address) & 0xffffffe0); // 32-byte aligned
-		amdgpu_pkt_add_dw(upper_32_bits(mc_address));
-		amdgpu_pkt_add_dw(control); // IB length in DWORDS
-		amdgpu_pkt_add_dw(lower_32_bits(ring_context->csa.mc_addr)); // CSA MC address low
-		amdgpu_pkt_add_dw(upper_32_bits(ring_context->csa.mc_addr)); // CSA MC address high
-		if (ring_context->hw_ip_info.hw_ip_version_major <= 6)
-			amdgpu_pkt_add_dw(SDMA_PACKET(SDMA_OP_PROTECTED_FENCE, SDMA6_SUB_OP_PROTECTED_FENCE, 0));
-		else
-			amdgpu_pkt_add_dw(SDMA_PACKET(SDMA_OP_PROTECTED_FENCE, SDMA7_SUB_OP_PROTECTED_FENCE, 0));
-	} else {
-		/* Prepare the Indirect IB to submit the IB to user queue */
-		amdgpu_pkt_add_dw(PACKET3(PACKET3_INDIRECT_BUFFER, 2));
-		amdgpu_pkt_add_dw(lower_32_bits(mc_address));
-		amdgpu_pkt_add_dw(upper_32_bits(mc_address));
-
-		if (ip_type == AMD_IP_GFX)
-			amdgpu_pkt_add_dw(control | S_3F3_INHERIT_VMID_MQD_GFX(1));
-		else
-			amdgpu_pkt_add_dw(control | S_3F3_VALID_COMPUTE(1)
-						| S_3F3_INHERIT_VMID_MQD_COMPUTE(1));
-
-		amdgpu_pkt_add_dw(PACKET3(PACKET3_PROTECTED_FENCE_SIGNAL, 0));
-
-		/* empty dword is needed for fence signal pm4 */
-		amdgpu_pkt_add_dw(0);
-	}
-#if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
-	asm volatile ("mfence" : : : "memory");
-#endif
-
-	/* Below call update the wptr address so will wait till all writes are completed */
-	amdgpu_pkt_end();
-
-#if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
-	asm volatile ("mfence" : : : "memory");
-#endif
-
-	if (ip_type == AMD_IP_DMA)
-		*ring_context->wptr_cpu = *ring_context->wptr_cpu <<2;
-	/* Update the door bell */
-	ring_context->doorbell_cpu[DOORBELL_INDEX] = *ring_context->wptr_cpu;
-
-	/* Add a fence packet for signal */
-	syncarray[0] = ring_context->timeline_syncobj_handle;
-	signal_data.queue_id = ring_context->queue_id;
-	signal_data.syncobj_handles = (uintptr_t)syncarray;
-	signal_data.num_syncobj_handles = 1;
-	signal_data.bo_read_handles = 0;
-	signal_data.bo_write_handles = 0;
-	signal_data.num_bo_read_handles = 0;
-	signal_data.num_bo_write_handles = 0;
-
-	r = amdgpu_userq_signal(device, &signal_data);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_cs_syncobj_wait(device, &ring_context->timeline_syncobj_handle, 1, timeout,
-				   DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
-	igt_assert_eq(r, 0);
-}
-
-void amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
-			       unsigned int type)
-{
-	int r;
-
-	if (type > AMD_IP_DMA) {
-		igt_info("Invalid IP not supported for UMQ Submission\n");
-		return;
-	}
-
-	/* Free the Usermode Queue */
-	r = amdgpu_free_userqueue(device_handle, ctxt->queue_id);
-	igt_assert_eq(r, 0);
-
-	switch (type) {
-	case AMD_IP_GFX:
-		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->csa.handle,
-					    ctxt->csa.va_handle,
-					    ctxt->csa.mc_addr, ctxt->info.gfx.csa_size,
-					    ctxt->timeline_syncobj_handle, ++ctxt->point,
-					    0, 0);
-
-		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->shadow.handle,
-					    ctxt->shadow.va_handle,
-					    ctxt->shadow.mc_addr, ctxt->info.gfx.shadow_size,
-					    ctxt->timeline_syncobj_handle, ++ctxt->point,
-					    0, 0);
-
-		r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
-						 ctxt->point);
-		igt_assert_eq(r, 0);
-		break;
-
-	case AMD_IP_COMPUTE:
-		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->eop.handle,
-					    ctxt->eop.va_handle,
-					    ctxt->eop.mc_addr, 256,
-					    ctxt->timeline_syncobj_handle, ++ctxt->point,
-					    0, 0);
-
-		r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
-						 ctxt->point);
-		igt_assert_eq(r, 0);
-		break;
-
-	case AMD_IP_DMA:
-		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->csa.handle,
-					    ctxt->csa.va_handle,
-					    ctxt->csa.mc_addr, ctxt->info.gfx.csa_size,
-					    ctxt->timeline_syncobj_handle, ++ctxt->point,
-					    0, 0);
-
-		r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
-						 ctxt->point);
-		igt_assert_eq(r, 0);
-		break;
-
-	default:
-		igt_info("IP invalid for cleanup\n");
-	}
-
-	r = amdgpu_cs_destroy_syncobj(device_handle, ctxt->timeline_syncobj_handle);
-	igt_assert_eq(r, 0);
-
-	/* Clean up doorbell*/
-	r = amdgpu_bo_cpu_unmap(ctxt->doorbell.handle);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_bo_free(ctxt->doorbell.handle);
-	igt_assert_eq(r, 0);
-
-	/* Clean up rptr wptr queue */
-	amdgpu_bo_unmap_and_free(ctxt->rptr.handle, ctxt->rptr.va_handle,
-				 ctxt->rptr.mc_addr, 8);
-
-	amdgpu_bo_unmap_and_free(ctxt->wptr.handle, ctxt->wptr.va_handle,
-				 ctxt->wptr.mc_addr, 8);
-
-	amdgpu_bo_unmap_and_free(ctxt->queue.handle, ctxt->queue.va_handle,
-				 ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE);
-}
-
-void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
-			      unsigned int type)
-{
-	int r;
-	uint64_t gtt_flags = 0, queue_flags = 0;
-	struct drm_amdgpu_userq_mqd_gfx11 gfx_mqd;
-	struct drm_amdgpu_userq_mqd_sdma_gfx11 sdma_mqd;
-	struct drm_amdgpu_userq_mqd_compute_gfx11 compute_mqd;
-	void *mqd;
-
-	if (type > AMD_IP_DMA) {
-		igt_info("Invalid IP not supported for UMQ Submission\n");
-		return;
-	}
-
-	if (ctxt->secure) {
-		gtt_flags |= AMDGPU_GEM_CREATE_ENCRYPTED;
-		queue_flags |= AMDGPU_USERQ_CREATE_FLAGS_QUEUE_SECURE;
-	}
-
-	if (ctxt->priority)
-		queue_flags |= ctxt->priority & AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_MASK;
-
-	r = amdgpu_query_uq_fw_area_info(device_handle, AMD_IP_GFX, 0, &ctxt->info);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_cs_create_syncobj2(device_handle, 0, &ctxt->timeline_syncobj_handle);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_bo_alloc_and_map_uq(device_handle, USERMODE_QUEUE_SIZE,
-				       ALIGNMENT,
-				       AMDGPU_GEM_DOMAIN_GTT,
-				       gtt_flags,
-				       AMDGPU_VM_MTYPE_UC,
-				       &ctxt->queue.handle, &ctxt->queue.ptr,
-				       &ctxt->queue.mc_addr, &ctxt->queue.va_handle,
-				       ctxt->timeline_syncobj_handle, ++ctxt->point);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_bo_alloc_and_map_uq(device_handle, 8,
-				       ALIGNMENT,
-				       AMDGPU_GEM_DOMAIN_GTT,
-				       gtt_flags,
-				       AMDGPU_VM_MTYPE_UC,
-				       &ctxt->wptr.handle, &ctxt->wptr.ptr,
-				       &ctxt->wptr.mc_addr, &ctxt->wptr.va_handle,
-				       ctxt->timeline_syncobj_handle, ++ctxt->point);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_bo_alloc_and_map_uq(device_handle, 8,
-				       ALIGNMENT,
-				       AMDGPU_GEM_DOMAIN_GTT,
-				       gtt_flags,
-				       AMDGPU_VM_MTYPE_UC,
-				       &ctxt->rptr.handle, &ctxt->rptr.ptr,
-				       &ctxt->rptr.mc_addr, &ctxt->rptr.va_handle,
-				       ctxt->timeline_syncobj_handle, ++ctxt->point);
-	igt_assert_eq(r, 0);
-
-	switch (type) {
-	case AMD_IP_GFX:
-		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->info.gfx.shadow_size,
-					       ctxt->info.gfx.shadow_alignment,
-					       AMDGPU_GEM_DOMAIN_GTT,
-					       gtt_flags,
-					       AMDGPU_VM_MTYPE_UC,
-					       &ctxt->shadow.handle, NULL,
-					       &ctxt->shadow.mc_addr, &ctxt->shadow.va_handle,
-					       ctxt->timeline_syncobj_handle, ++ctxt->point);
-		igt_assert_eq(r, 0);
-
-		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->info.gfx.csa_size,
-					       ctxt->info.gfx.csa_alignment,
-					       AMDGPU_GEM_DOMAIN_GTT,
-					       gtt_flags,
-					       AMDGPU_VM_MTYPE_UC,
-					       &ctxt->csa.handle, NULL,
-					       &ctxt->csa.mc_addr, &ctxt->csa.va_handle,
-					       ctxt->timeline_syncobj_handle, ++ctxt->point);
-		igt_assert_eq(r, 0);
-
-		gfx_mqd.shadow_va = ctxt->shadow.mc_addr;
-		gfx_mqd.csa_va = ctxt->csa.mc_addr;
-		mqd = &gfx_mqd;
-		break;
-
-	case AMD_IP_COMPUTE:
-		r = amdgpu_bo_alloc_and_map_uq(device_handle, 256,
-					       ALIGNMENT,
-					       AMDGPU_GEM_DOMAIN_GTT,
-					       gtt_flags,
-					       AMDGPU_VM_MTYPE_UC,
-					       &ctxt->eop.handle, NULL,
-					       &ctxt->eop.mc_addr, &ctxt->eop.va_handle,
-					       ctxt->timeline_syncobj_handle, ++ctxt->point);
-		igt_assert_eq(r, 0);
-		compute_mqd.eop_va = ctxt->eop.mc_addr;
-		mqd = &compute_mqd;
-		break;
-
-	case AMD_IP_DMA:
-		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->info.gfx.csa_size,
-					       ctxt->info.gfx.csa_alignment,
-					       AMDGPU_GEM_DOMAIN_GTT,
-					       gtt_flags,
-					       AMDGPU_VM_MTYPE_UC,
-					       &ctxt->csa.handle, NULL,
-					       &ctxt->csa.mc_addr, &ctxt->csa.va_handle,
-					       ctxt->timeline_syncobj_handle, ++ctxt->point);
-		igt_assert_eq(r, 0);
-		sdma_mqd.csa_va = ctxt->csa.mc_addr;
-		mqd = &sdma_mqd;
-		break;
-
-	default:
-		igt_info("Unsupported IP for UMQ submission\n");
-		return;
-
-	}
-
-	r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
-					 ctxt->point);
-	igt_assert_eq(r, 0);
-
-	amdgpu_alloc_doorbell(device_handle, &ctxt->doorbell, PAGE_SIZE,
-			      AMDGPU_GEM_DOMAIN_DOORBELL);
-
-	ctxt->doorbell_cpu = (uint64_t *)ctxt->doorbell.ptr;
-
-	ctxt->wptr_cpu = (uint64_t *)ctxt->wptr.ptr;
-	ctxt->rptr_cpu = (uint64_t *)ctxt->rptr.ptr;
-
-	ctxt->queue_cpu = (uint32_t *)ctxt->queue.ptr;
-	memset(ctxt->queue_cpu, 0, USERMODE_QUEUE_SIZE);
-
-	/* get db bo handle */
-	amdgpu_bo_export(ctxt->doorbell.handle, amdgpu_bo_handle_type_kms, &ctxt->db_handle);
-
-	/* Create the Usermode Queue */
-	switch (type) {
-	case AMD_IP_GFX:
-		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_GFX,
-					    ctxt->db_handle, DOORBELL_INDEX,
-					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
-					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
-					    mqd, queue_flags, &ctxt->queue_id);
-		igt_assert_eq(r, 0);
-		break;
-
-	case AMD_IP_COMPUTE:
-		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_COMPUTE,
-					    ctxt->db_handle, DOORBELL_INDEX,
-					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
-					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
-					    mqd, queue_flags, &ctxt->queue_id);
-		igt_assert_eq(r, 0);
-		break;
-
-	case AMD_IP_DMA:
-		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_DMA,
-					    ctxt->db_handle, DOORBELL_INDEX,
-					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
-					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
-					    mqd, queue_flags, &ctxt->queue_id);
-		igt_assert_eq(r, 0);
-		break;
-
-	default:
-		igt_info("Unsupported IP, failed to create user queue\n");
-		return;
-
-	}
-}
-#else
-int
-amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle device_handle, unsigned int size,
-			   unsigned int alignment, unsigned int heap, uint64_t alloc_flags,
-			   uint64_t mapping_flags, amdgpu_bo_handle *bo, void **cpu,
-			   uint64_t *mc_address, amdgpu_va_handle *va_handle,
-			   uint32_t timeline_syncobj_handle, uint64_t point)
-{
-	return 0;
-}
-
-int amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
-	uint32_t timeline_syncobj_handle, uint64_t point)
-{
-	return 0;
-}
-
-void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
-	unsigned int ip_type, uint64_t mc_address)
-{
-}
-
-void amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
-	unsigned int type)
-{
-}
-
-void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
-	unsigned int type)
-{
-}
-
-#endif
diff --git a/lib/amdgpu/amd_userq.h b/lib/amdgpu/amd_userq.h
deleted file mode 100644
index b29e97ccf..000000000
--- a/lib/amdgpu/amd_userq.h
+++ /dev/null
@@ -1,55 +0,0 @@
-/* SPDX-License-Identifier: MIT
- * Copyright 2025 Advanced Micro Devices, Inc.
- */
-
-#ifndef _AMD_USER_QUEUE_
-#define _AMD_USER_QUEUE_
-
-#include <amdgpu_drm.h>
-#include <amdgpu.h>
-#include <time.h>
-#include "amd_ip_blocks.h"
-
-
-#ifndef PAGE_SIZE
-#define PAGE_SIZE 4096
-#endif
-
-#define USERMODE_QUEUE_SIZE		(PAGE_SIZE * 256)   //In bytes with total size as 1 Mbyte
-#define ALIGNMENT			4096
-#define DOORBELL_INDEX			4
-#define USERMODE_QUEUE_SIZE_DW		(USERMODE_QUEUE_SIZE >> 2)
-#define USERMODE_QUEUE_SIZE_DW_MASK	(USERMODE_QUEUE_SIZE_DW - 1)
-
-#define amdgpu_pkt_begin() uint32_t __num_dw_written = 0; \
-	uint32_t __ring_start = *ring_context->wptr_cpu & USERMODE_QUEUE_SIZE_DW_MASK;
-
-#define amdgpu_pkt_add_dw(value) do { \
-	*(ring_context->queue_cpu + \
-	((__ring_start + __num_dw_written) & USERMODE_QUEUE_SIZE_DW_MASK)) \
-	= value; \
-	__num_dw_written++;\
-} while (0)
-
-#define amdgpu_pkt_end() \
-	*ring_context->wptr_cpu += __num_dw_written
-
-int amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle device_handle, unsigned int size,
-			       unsigned int alignment, unsigned int heap, uint64_t alloc_flags,
-			       uint64_t mapping_flags, amdgpu_bo_handle *bo, void **cpu,
-			       uint64_t *mc_address, amdgpu_va_handle *va_handle,
-			       uint32_t timeline_syncobj_handle, uint64_t point);
-
-int amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
-				 uint32_t timeline_syncobj_handle, uint64_t point);
-
-void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
-			      unsigned int ip_type);
-
-void amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
-			       unsigned int ip_type);
-
-void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
-			      unsigned int ip_type, uint64_t mc_address);
-
-#endif
diff --git a/lib/meson.build b/lib/meson.build
index 5e4247aad..b0505190b 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -170,8 +170,7 @@ if libdrm_amdgpu.found()
 		'amdgpu/amd_mem_leak.c',
 		'amdgpu/amd_mmd_shared.c',
 		'amdgpu/amd_jpeg_shared.c',
-		'amdgpu/amd_vcn_shared.c',
-		'amdgpu/amd_userq.c'
+		'amdgpu/amd_vcn_shared.c'
 	]
 	if libdrm_amdgpu.version().version_compare('> 2.4.99')
 		lib_sources +=[ 'amdgpu/amd_dispatch.c',]
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 04e8d62e5..8c6b466ce 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -13,7 +13,6 @@
 #include "lib/amdgpu/amd_gfx.h"
 #include "lib/amdgpu/amd_shaders.h"
 #include "lib/amdgpu/amd_dispatch.h"
-#include "lib/amdgpu/amd_userq.h"
 
 #define BUFFER_SIZE (8 * 1024)
 
@@ -509,7 +508,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle, bool user_queue)
 	igt_assert(ring_context);
 
 	if (user_queue) {
-		amdgpu_user_queue_create(device_handle, ring_context, ip_block->type);
+		ip_block->funcs->userq_create(device_handle, ring_context, ip_block->type);
 	} else {
 		r = amdgpu_cs_ctx_create(device_handle, &context_handle[0]);
 		igt_assert_eq(r, 0);
@@ -608,7 +607,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle, bool user_queue)
 
 	if (user_queue) {
 		ring_context->pm4_dw = ib_info.size;
-		amdgpu_user_queue_submit(device_handle, ring_context, ip_block->type,
+		ip_block->funcs->userq_submit(device_handle, ring_context, ip_block->type,
 					 ib_result_mc_address);
 	} else {
 		r = amdgpu_cs_submit(context_handle[1], 0, &ibs_request, 1);
@@ -648,7 +647,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle, bool user_queue)
 
 	if (user_queue) {
 		ring_context->pm4_dw = ib_info.size;
-		amdgpu_user_queue_submit(device_handle, ring_context, ip_block->type,
+		ip_block->funcs->userq_submit(device_handle, ring_context, ip_block->type,
 					ib_info.ib_mc_address);
 	} else {
 		r = amdgpu_cs_submit(context_handle[0], 0, &ibs_request, 1);
@@ -680,7 +679,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle, bool user_queue)
 				 ib_result_mc_address, const_alignment);
 
 	if (user_queue) {
-		amdgpu_user_queue_destroy(device_handle, ring_context, ip_block->type);
+		ip_block->funcs->userq_destroy(device_handle, ring_context, ip_block->type);
 	} else {
 		amdgpu_cs_ctx_free(context_handle[0]);
 		amdgpu_cs_ctx_free(context_handle[1]);
diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index 96a385413..0f2c33168 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -12,7 +12,6 @@
 #include "lib/amdgpu/amd_PM4.h"
 #include "lib/amdgpu/amd_ip_blocks.h"
 #include "lib/amdgpu/amd_memory.h"
-#include "lib/amdgpu/amd_userq.h"
 
 static void amdgpu_cs_sync(amdgpu_context_handle context,
 			   unsigned int ip_type,
@@ -54,12 +53,14 @@ static void nop_cs(amdgpu_device_handle device,
 	amdgpu_bo_list_handle bo_list;
 	amdgpu_va_handle va_handle;
 	struct amdgpu_ring_context *ring_context;
+	const struct amdgpu_ip_block_version *ip_block = NULL;
 
+	ip_block = get_ip_block(device, ip_type);
 	ring_context = calloc(1, sizeof(*ring_context));
 	igt_assert(ring_context);
 
 	if (user_queue)
-		amdgpu_user_queue_create(device, ring_context, ip_type);
+		ip_block->funcs->userq_create(device, ring_context, ip_type);
 
 	r = amdgpu_bo_alloc_and_map_sync(device, 4096, 4096,
 					 AMDGPU_GEM_DOMAIN_GTT, 0, AMDGPU_VM_MTYPE_UC,
@@ -107,7 +108,7 @@ static void nop_cs(amdgpu_device_handle device,
 		igt_until_timeout(timeout) {
 			if (user_queue) {
 				ring_context->pm4_dw = ib_info.size;
-				amdgpu_user_queue_submit(device, ring_context, ip_type,
+				ip_block->funcs->userq_submit(device, ring_context, ip_type,
 							 ib_info.ib_mc_address);
 				igt_assert_eq(r, 0);
 			} else {
@@ -140,7 +141,7 @@ static void nop_cs(amdgpu_device_handle device,
 	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
 				 ib_result_mc_address, 4096);
 	if (user_queue)
-		amdgpu_user_queue_destroy(device, ring_context, ip_type);
+		ip_block->funcs->userq_destroy(device, ring_context, ip_type);
 
 	free(ring_context);
 }
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 19dff1dc0..3456f42c8 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -9,7 +9,6 @@
 #include "lib/amdgpu/amd_command_submission.h"
 #include "lib/amdgpu/amd_deadlock_helpers.h"
 #include "lib/amdgpu/amdgpu_asic_addr.h"
-#include "lib/amdgpu/amd_userq.h"
 
 #define AMDGPU_FAMILY_SI                        110 /* Hainan, Oland, Verde, Pitcairn, Tahiti */
 #define AMDGPU_FAMILY_CI                        120 /* Bonaire, Hawaii */
-- 
2.49.0

