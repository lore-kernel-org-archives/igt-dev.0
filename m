Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48666C83F10
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 07:48:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F392810E5B2;
	Tue,  8 Jul 2025 07:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PNfwz6Gq";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5CB10E5B2
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 07:48:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NTLa6hIXVEpkxHuFUS3u3yGiMYttNOCkv94YCaL3svw48c5/gM17KHNyegdvp/N0l46cJIYwNQUcB2CuWHlm6K4fxBJbvdGx+Zae+r0ElA5rjfwQzUGONDh4EBvgJWghUwne4StnACdUDbTkraQTmqAdVeHWUl1VCPnHM5KOuUJ99VCjNmylMd2eGiWWY8ApkwuHIfvOeatm95RYe2otWDBcxIas27oDVaTS5BvMuZPeXpJT5dPoIZlrKylVHXHhZHQyV4ccPSO1Q7FCnLuGSkGZPWNkTSmaB5+C/hI46cvmeNXjyLadTQhSnOhHgMMzS7KORaryZgempxPSnVBDpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yyy+jwWvtISn/6sGbsNIJkHoLsnCs2R00qF0JMtD94U=;
 b=ll9OSMM5BfOdmwQDWRUa3hq/xRRhjKSX08GSc2qT95+9qRtox0GX3Tn39bK3ASnHxrU3BsatEWx3EVKE8VKXlXpvpkwRdMRSkaZTycAtUxvQk9HeiVAxRPmqsvfLDvwOsqIkOgsxROkqNZvVj0Nfdx7TqCekFoCovB9WSrINfS4nKLROPLFv7qOgRxX7e92sINYlrIHusfzj1jVWmDTin2y0m/WsC+k46hnNLBF8HvF/dp9cTdc6+vHbWY7VrQkyOqeUj9dOfnvXcRDyapVuBXMG3tN/YHEx37BAQ8kUNqXe4+dmOY3S+13B80YXyaSs8Avi4irNdCSvcrbxI72kag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yyy+jwWvtISn/6sGbsNIJkHoLsnCs2R00qF0JMtD94U=;
 b=PNfwz6GqssPVlL9Dj5H5hhGJKOm30PCtukKuWesdpvo6WFdE9Hueu4Vfpizdw7oXMCplXF8YFS4Oq16U+DpOYNvWfEEs3D/g2MEp6RgmUF3sEt1DACoQcpRkrSM5XnLRmaBOXYJhXoc5ISoreux+SFeCRkye4DwZjjnXDOOuIrQ=
Received: from BN9PR03CA0297.namprd03.prod.outlook.com (2603:10b6:408:f5::32)
 by SA1PR12MB9247.namprd12.prod.outlook.com (2603:10b6:806:3af::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 8 Jul
 2025 07:48:28 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:408:f5:cafe::87) by BN9PR03CA0297.outlook.office365.com
 (2603:10b6:408:f5::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Tue,
 8 Jul 2025 07:48:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 07:48:27 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 02:48:27 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 8 Jul 2025 02:48:26 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 4/4] lib/amdgpu: Use available_rings mask for user queues
Date: Tue, 8 Jul 2025 15:47:50 +0800
Message-ID: <20250708074819.624367-4-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708074819.624367-1-Jesse.Zhang@amd.com>
References: <20250708074819.624367-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|SA1PR12MB9247:EE_
X-MS-Office365-Filtering-Correlation-Id: aeaa6d86-5b37-42b2-289c-08ddbdf3d375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f2zGG/wzYfmZg4ncvxO+F6uau9Xn41pGGJ/Bk+MNYcKXBitlwH61QCKwwiRX?=
 =?us-ascii?Q?lsHTuiHgIthLOtZgg7lOoHhdWDLjgrnioGI1ZwjbDZSnFel8FGmGK8XZ5h1k?=
 =?us-ascii?Q?dHEhIgiFH84j77KaZ79VGUbUKCm6HXF7uMi8TJRphGBoQ+DgPVp2JphixPNp?=
 =?us-ascii?Q?haFNrZ6TmGOJ0TskijXE7VA1jXnowR0zA+dcAn4+3WPEu1AOx2FjilB/6flV?=
 =?us-ascii?Q?j3L8t5oZXjXSu+o8Q1FQxzR5uJNRNV6ssC73rkGVQt2gt6ZH4Yg5FaGkUy9u?=
 =?us-ascii?Q?thBqLYOtKZuT8hwJ+XjpJqmBwJABnmw38h0VwHSK6zWqL7LfpjRVfUNAPaoj?=
 =?us-ascii?Q?d1atm8TvwWg53vy3/XhajSLlOtrrQjwM7qvjnvxRZpvB7qAMo9wePpsfpRjI?=
 =?us-ascii?Q?MFNgM33Q0XrywaJBWmxnJKs5uf3YBcypC20dVOO9sQj5caCci1ifmErIzio9?=
 =?us-ascii?Q?ejRgBXv0Q7xZzMlEgFijhzn+soiDHJdhtku9qw6t2san3QoPeAbUi+QJ3Axu?=
 =?us-ascii?Q?97bbZT4Q5W5NzEBk44CMfLfv+A2XnhuvJiWYgxMeFNk4JdmUgsMHI0ei6R+S?=
 =?us-ascii?Q?omq9Fc9Isw5Yg/DWd5lSlNlF2Dl8CPwRy2nkyYWDvVyxm7LYR1xBvNUUb2YV?=
 =?us-ascii?Q?Moo4G/dKUKrNHVvSnJwsbsLK+xbd32Y2fQ4GEezaKg9D15B8vOpVVb9z5heM?=
 =?us-ascii?Q?dEiCP28fpk+lhsGaQAzxGzqXihLMQfj5klQPakYNXNH0fA0w3axeEDzgLETl?=
 =?us-ascii?Q?zXa4/+fRHlX7NiVf9s0i+Z3Um5M/SGDzhGcaQMGuZE3QV5PHv68KFaFRnAI4?=
 =?us-ascii?Q?HR4jAEoMoHTGOMlR1mVq32IzJ4kH6W30WhP7PeD0yStx6+Z6y9PzVOMk/uMi?=
 =?us-ascii?Q?hA6hwM4Qh6EfhyibQEMjpviV0noRAjeBe3s5Js6jBFMF7rooJiojf0ar0jFE?=
 =?us-ascii?Q?yWcfQMo4I3HQCBxJCplyeqttOyzIY9Xx/IWrQgt/2toi5IycCsOhT7rdmUey?=
 =?us-ascii?Q?W9s3khZ9Os94V6f22dbuclBFWfRoeCtmKyx3HnSrgsbfuzChT/pbpoBetiCy?=
 =?us-ascii?Q?AXFFYB9/qvI5LwAeYKKtEh3fB5Y4f+eCB7YzA/M4K0ouF5rRrVIb3sJ0Hxza?=
 =?us-ascii?Q?AbTONpAp5SZOXE4npAj5TE4S96Nq6q4/BteEw1WZa83IMjCRFmGlABSrau1i?=
 =?us-ascii?Q?wG3V2J83kMLpPN3pVhyR1Au9cIrL2533LaHqbnnL/SK9cH5TfBAtYFOWqAJV?=
 =?us-ascii?Q?i+G37Nd/l54stEmTOkPQC2XwOaMGcNLRgOB2BEfv/ACpUuMv+BWcK/k1ptyX?=
 =?us-ascii?Q?MqfEhvqXjsPIPPujuZJaEedm8/30uvYMNchwKh6UVAbkBbO/6NycVNarsP50?=
 =?us-ascii?Q?rsc2DaOuHaOnpx9WZUX/m8lSEW7LLFrw8W6mPWg5xnoP94OIbLFBLCRQdEq0?=
 =?us-ascii?Q?0cCPw+9gfPVqqvupNcipZQFBR/LtQQD4+RY0SciaqQ33mohBn+BBMGH3YLiO?=
 =?us-ascii?Q?kKnsJl8MYdAqWTnjZOA7iWPkTB0fyCF7xDO2?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 07:48:27.8406 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aeaa6d86-5b37-42b2-289c-08ddbdf3d375
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9247
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

This patch modifies ring selection logic to properly handle user queues by
calculating an available_rings mask based on num_userq_slots when user_queue
is true, otherwise falling back to hw_ip_info.available_rings.

Changes include:
- Added available_rings variable in all command submission helpers
- Calculated mask as ((1 << num_userq_slots) - 1) for user queues
- Used available_rings for ring iteration instead of direct hw_ip_info access
- Applied consistent logic across:
  * amd_command_submission_write_linear_helper
  * amd_command_submission_const_fill_helper
  * amd_command_submission_copy_linear_helper
  * amd_compute.c (nop submission)
  * amd_deadlock_helpers.c

This ensures correct ring selection behavior for both kernel queue and user queue cases.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_command_submission.c | 19 ++++++++++++-------
 lib/amdgpu/amd_compute.c            |  7 +++++--
 lib/amdgpu/amd_deadlock_helpers.c   |  6 ++++--
 3 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 0279b22c8..8b7236383 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -353,6 +353,7 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 	int i, r, loop, ring_id;
 
 	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
+	uint32_t available_rings = 0;
 
 	ring_context = calloc(1, sizeof(*ring_context));
 	igt_assert(ring_context);
@@ -368,7 +369,8 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 
 	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
 	igt_assert_eq(r, 0);
-
+	available_rings = user_queue ? ((1 << ring_context->hw_ip_info.num_userq_slots) -1) :
+					ring_context->hw_ip_info.available_rings;
 	for (i = 0; secure && (i < 2); i++)
 		gtt_flags[i] |= AMDGPU_GEM_CREATE_ENCRYPTED;
 
@@ -381,8 +383,7 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 
 
 
-/* Dont need but check with vitaly if for KMS also we need ring id or not */
-	for (ring_id = 0; (1 << ring_id) & ring_context->hw_ip_info.available_rings; ring_id++) {
+	for (ring_id = 0; (1 << ring_id) & available_rings; ring_id++) {
 		loop = 0;
 		ring_context->ring_id = ring_id;
 		while (loop < 2) {
@@ -481,7 +482,7 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 
 	struct amdgpu_ring_context *ring_context;
 	int r, loop, ring_id;
-
+	uint32_t available_rings = 0;
 	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
 
 	ring_context = calloc(1, sizeof(*ring_context));
@@ -495,6 +496,8 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 	igt_assert(ring_context->pm4);
 	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
 	igt_assert_eq(r, 0);
+	available_rings = user_queue ? ((1 << ring_context->hw_ip_info.num_userq_slots) -1) :
+					ring_context->hw_ip_info.available_rings;
 
 	if (user_queue) {
 		ip_block->funcs->userq_create(device, ring_context, ip_block->type);
@@ -503,7 +506,7 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 		igt_assert_eq(r, 0);
 	}
 
-	for (ring_id = 0; (1 << ring_id) & ring_context->hw_ip_info.available_rings; ring_id++) {
+	for (ring_id = 0; (1 << ring_id) & available_rings; ring_id++) {
 		/* prepare resource */
 		loop = 0;
 		ring_context->ring_id = ring_id;
@@ -575,7 +578,7 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 
 	struct amdgpu_ring_context *ring_context;
 	int r, loop1, loop2, ring_id;
-
+	uint32_t available_rings = 0;
 	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
 
 
@@ -590,6 +593,8 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 	igt_assert(ring_context->pm4);
 	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
 	igt_assert_eq(r, 0);
+	available_rings = user_queue ? ((1 << ring_context->hw_ip_info.num_userq_slots) -1) :
+					ring_context->hw_ip_info.available_rings;
 
 
 	if (user_queue) {
@@ -599,7 +604,7 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 		igt_assert_eq(r, 0);
 	}
 
-	for (ring_id = 0; (1 << ring_id) & ring_context->hw_ip_info.available_rings; ring_id++) {
+	for (ring_id = 0; (1 << ring_id) & available_rings; ring_id++) {
 		loop1 = loop2 = 0;
 		ring_context->ring_id = ring_id;
 	/* run 9 circle to test all mapping combination */
diff --git a/lib/amdgpu/amd_compute.c b/lib/amdgpu/amd_compute.c
index d92b99a76..bc9f77d34 100644
--- a/lib/amdgpu/amd_compute.c
+++ b/lib/amdgpu/amd_compute.c
@@ -47,7 +47,7 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
 	int r, instance;
 	amdgpu_bo_list_handle bo_list;
 	amdgpu_va_handle va_handle;
-
+	uint32_t available_rings = 0;
 	struct amdgpu_ring_context *ring_context;
 
 	ip_block = get_ip_block(device, type);
@@ -57,6 +57,9 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
 	r = amdgpu_query_hw_ip_info(device, type, 0, &ring_context->hw_ip_info);
 	igt_assert_eq(r, 0);
 
+	available_rings = user_queue ? ((1 << ring_context->hw_ip_info.num_userq_slots) -1) :
+						ring_context->hw_ip_info.available_rings;
+
 	if (user_queue) {
 		ip_block->funcs->userq_create(device, ring_context, type);
 	} else {
@@ -64,7 +67,7 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
 		igt_assert_eq(r, 0);
 	}
 
-	for (instance = 0; ring_context->hw_ip_info.available_rings & (1 << instance); instance++) {
+	for (instance = 0; available_rings & (1 << instance); instance++) {
 		r = amdgpu_bo_alloc_and_map_sync(device, 4096, 4096,
 						 AMDGPU_GEM_DOMAIN_GTT, 0,
 						 AMDGPU_VM_MTYPE_UC,
diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 1ed407332..49582b6c9 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -457,10 +457,12 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
 	uint32_t prio;
 	char sysfs[125];
 	bool support_page;
-
+	uint32_t available_rings = 0;
 	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
 	igt_assert_eq(r, 0);
-	if (!info.available_rings)
+
+	available_rings = user_queue ? ((1 << info.num_userq_slots) -1) : info.available_rings;
+	if (!available_rings)
 		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
 
 	if (user_queue) {
-- 
2.49.0

