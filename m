Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C79D65531
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 17:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51E410E96F;
	Tue, 26 Nov 2024 17:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="b6ExKqI0";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369F110E96F
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 17:29:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lB/rEYLUF97BaX6WpIXT2NxiFeQ73ZQHCV0L7u4Eetka62Nb7Kw9O4wnb+kg/XzZEQ0yvGP3k5hFH2ELES1NyXEe5GT6/mRIOYlf8BkUt+/v63tRasQaHm0Ix2eqm9G/mKQFlxxqM8gdo1TvDqKgp8jb7llDDzvtDBOogC8RAl88vYHAXId+cJbRELVZov+jgO8ISHpT7vLbLCLGNgZEBzCca2TmdgIjz8QAXWKcDnmgn3EU0s6n7SY2E6tH6OzeKGpI39X+UnEF5gURR7iNEX9gakuuH25LCayGZeDnUlviFOMkrZCM/tAL10YWWnXg3aP0Ue57nQ9J8HtdFrKW6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LYD+EQW3b0rM8sv8ZDTR31gPZ8po8UH33WPS8HmfRE=;
 b=V+2cV/uR1miwwJNUTZF5sJXvFBhBD8SqUVfu/K2g/bKM1pX2EoA2QZFPgodoIaHS7Sv3sr05K+ID05U7n76j1pzTZdgTtyyF4hnc/xXfrZjadvZPXzRPjH8Zlms6fK0AV/ihByri3M8r41E+i27SdQhWTV/cepnpS6O0CH/OWtVD8UDTuc6y+eh1Pt+XLYhNLhHJCL5SonpQmGcr4Zhm+3EkbUW0ERBT1B5xLTAOHa/lnr3BA1iUowohRJXOtBosdgU3kKPsvV4jXayFa3wU230xy3G4DvVjeUtLOND6QrK8y+XZx9LPkatwHPm2AugLVv4FCViBhyUQLXao6JLtsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LYD+EQW3b0rM8sv8ZDTR31gPZ8po8UH33WPS8HmfRE=;
 b=b6ExKqI0sb2f+S9BEefcizy0su48ovLsbL9HobgroeRj4d9bnolZC4YHT639LXx0iJ5sZw0grEFdWJYfpNOIcgK/8vv+scUEKl//BXgCUOBT+OiMj7SHkOOXeo6WHfpGaESJa/3SCNfCgMdPLii74MZFZ6kDirhed+8dxLZg0/0=
Received: from SA0PR11CA0056.namprd11.prod.outlook.com (2603:10b6:806:d0::31)
 by LV3PR12MB9259.namprd12.prod.outlook.com (2603:10b6:408:1b0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Tue, 26 Nov
 2024 17:29:38 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:806:d0:cafe::65) by SA0PR11CA0056.outlook.office365.com
 (2603:10b6:806:d0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.20 via Frontend Transport; Tue,
 26 Nov 2024 17:29:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Tue, 26 Nov 2024 17:29:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Nov
 2024 11:29:34 -0600
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Nov 2024 11:29:33 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 "Alexander Deucher" <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>,
 Boyuan Zhang <boyuan.zhang@amd.com>
Subject: [PATCH 1/3] tests/amdgpu: refactor multimedia tests for improved
 modularity
Date: Tue, 26 Nov 2024 12:29:21 -0500
Message-ID: <20241126172923.206952-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|LV3PR12MB9259:EE_
X-MS-Office365-Filtering-Correlation-Id: b7a7fc1d-3ad1-4725-21b5-08dd0e3fe6fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NWtbQcuG1SK2g+13SfcVcvY7JTz7rS05+eziYhnUROFRs8XggjP6Iv+VXLA+?=
 =?us-ascii?Q?DNlwua6+EHQcqdw7fV01JRbMMi72NdrYjMADcS7nfgzQ1wzTsaizrMjdLkKR?=
 =?us-ascii?Q?Yza6bcQmca4ivdTijdWCOpKo4l2CwiljYCWsgmLiSypqCUccQ+m6IsNbtSrD?=
 =?us-ascii?Q?rF0wBcA9KWp4OK4lIUoKFE/kTPaHi2WaVG90hYYL7H1rbjx+AQ7b7iYcXAqz?=
 =?us-ascii?Q?HRaYGDVZZtv4axBYmVUL9Qv8QgDj77gbntkdNa27DyLUGreB1eO9Y/Ud2zzT?=
 =?us-ascii?Q?MlCZlgbFLNkC2ba2/ncBhNwjxy2To7aAmKwLdfBT3cXHM1cP3gStvE0zXcAM?=
 =?us-ascii?Q?Q8butWE32Wz+DTTx0EQW+xiamyDg1iwa/BdNgcBrwTXHybKT09YAluXVxKBU?=
 =?us-ascii?Q?0wS8/q7EXV2QgorO0e/+thvIOuHlUSbKNnvOWlaGtZLg8y3sStjsCp42aaAq?=
 =?us-ascii?Q?GQvDlM31SOF2WtKQaQ+rlcyiK8zs4+IkVx1hS8NtYuqRdhf0691gFfbmA/z/?=
 =?us-ascii?Q?NenRIJId7uwUECYdH3DieYc8YkW2xbwEp0/9+bNSlEHqy8EiqiKYXWiym7u3?=
 =?us-ascii?Q?PzDtDtWNU3Rx5lfA7u8iuxdEyMTWSFIYIBFh9TIU33w6flmJqJZwDQLho5Cy?=
 =?us-ascii?Q?LYUio5RuPu3F7y9ls5h+ghXOAWlkQktej9GsrWFHPj5mjGHUR5n6UMsLAI+1?=
 =?us-ascii?Q?vCoV5hMzfM3aNyhIlYDFtJ+kwulHcrKeKGkBxtXbni8qx5KSr9SURIa2napp?=
 =?us-ascii?Q?JNyZXi44l3WVx+L96W6jBvxevVDzzglhRvzqX08CYDNSDXnsZlxuFtRmXJmg?=
 =?us-ascii?Q?H0i0qph1+aGyrWOgdrsTRW8gRBSoc+cpNksJlHcmDpCCl+6uuKpvwbLU28Ms?=
 =?us-ascii?Q?fKBpvxqN5Y/6grPr8A9wK783bQrvdy/ppBuCIG8UlX3qnoFbcdqrd+ZuG06c?=
 =?us-ascii?Q?nUoafO8b1hyRggu8RE2zrlAmE626UbnafXRAYEKKUZ61iFTHpE3NnwAU9gi6?=
 =?us-ascii?Q?//ayEo6LTc77AL79hr4iUbXA4dqad+7VQSVes8XrD4BTEMYjuxxxP/4NF6pi?=
 =?us-ascii?Q?+qr6Dt8EKujOjCeTgsO4nYwR85POk6zoGnaMMdcNR7wOsvfY4WdQEI+ZOq/T?=
 =?us-ascii?Q?+FiQwpMkpJ/RltCs+8RTfOJmeGeMQIN9squ9b/0D+fUKzzVHWE4FOcpzk6sf?=
 =?us-ascii?Q?iLkVW6+FRMmThI5qeOqN7odHYRaXy89r2F8+HnEgtMsfeobmq6Ld21p002DJ?=
 =?us-ascii?Q?1uBOVfIzLl7ZGVDyBqWQ4PDpqrFOcFAY5XOI6bT8VMgs+hhC/KVI+4n1ylfX?=
 =?us-ascii?Q?3tIc7D6gbNURPDnxQaQNE1n76BICBp4Xky9AiGQhpPNkza5tNiY4mkvzzqmN?=
 =?us-ascii?Q?d2wMlSbPcy1PO+5cY0P7vN6ewDh2jCa2p5+G5IKCLk8VZQVxbGXOe3IDRY0S?=
 =?us-ascii?Q?USZWVzHrpDgAd/v8eeMSsxJVT6bi5xHC?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 17:29:37.6643 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7a7fc1d-3ad1-4725-21b5-08dd0e3fe6fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9259
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

Refactor MMD tests to separate MMD context structure into two distinct
structures: one for ASIC details (static) and another for resources
(dynamic). This change enables easier management of multiple test
instances running concurrently from different processes.

Cc: Jesse Zhang  <jesse.zhang@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>
Cc: Leo Liu <leo.liu@amd.com>
Cc: Boyuan Zhang <boyuan.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_mmd_shared.c |  32 ++++---
 lib/amdgpu/amd_mmd_shared.h |  25 +++---
 tests/amdgpu/amd_jpeg_dec.c |  20 +++--
 tests/amdgpu/amd_uvd_dec.c  |  73 ++++++++--------
 tests/amdgpu/amd_uvd_enc.c  |  31 ++++---
 tests/amdgpu/amd_vce_enc.c  |  83 ++++++++++--------
 tests/amdgpu/amd_vcn.c      | 168 +++++++++++++++++++-----------------
 tests/amdgpu/amd_vpe.c      |  17 ++--
 8 files changed, 255 insertions(+), 194 deletions(-)

diff --git a/lib/amdgpu/amd_mmd_shared.c b/lib/amdgpu/amd_mmd_shared.c
index 04a9a0c92..976fc61ba 100644
--- a/lib/amdgpu/amd_mmd_shared.c
+++ b/lib/amdgpu/amd_mmd_shared.c
@@ -52,7 +52,6 @@ int
 mmd_context_init(amdgpu_device_handle device_handle, struct mmd_context *context)
 {
 	int r;
-	struct amdgpu_gpu_info gpu_info = {0};
 
 	r = amdgpu_cs_ctx_create(device_handle, &context->context_handle);
 	igt_assert_eq(r, 0);
@@ -62,17 +61,6 @@ mmd_context_init(amdgpu_device_handle device_handle, struct mmd_context *context
 				    &context->ib_mc_address,
 				    &context->ib_va_handle);
 
-	r = amdgpu_query_gpu_info(device_handle, &gpu_info);
-	igt_assert_eq(r, 0);
-
-	context->family_id = gpu_info.family_id;
-	context->chip_id = gpu_info.chip_external_rev;
-	context->chip_rev = gpu_info.chip_rev;
-	context->asic_id = gpu_info.asic_id;
-
-	/*vce*/
-	context->vce_harvest_config = gpu_info.vce_harvest_config;
-
 	return r;
 }
 
@@ -88,6 +76,26 @@ mmd_context_clean(amdgpu_device_handle device_handle,
 
 }
 
+int
+mmd_shared_context_init(amdgpu_device_handle device_handle, struct mmd_shared_context *context)
+{
+	int r;
+	struct amdgpu_gpu_info gpu_info = {0};
+
+	r = amdgpu_query_gpu_info(device_handle, &gpu_info);
+	igt_assert_eq(r, 0);
+
+	context->family_id = gpu_info.family_id;
+	context->chip_id = gpu_info.chip_external_rev;
+	context->chip_rev = gpu_info.chip_rev;
+	context->asic_id = gpu_info.asic_id;
+
+	/*vce*/
+	context->vce_harvest_config = gpu_info.vce_harvest_config;
+
+	return r;
+}
+
 void
 alloc_resource(amdgpu_device_handle device_handle,
 		struct amdgpu_mmd_bo *mmd_bo, unsigned int size,
diff --git a/lib/amdgpu/amd_mmd_shared.h b/lib/amdgpu/amd_mmd_shared.h
index 14f9ecb4d..923bcc29c 100644
--- a/lib/amdgpu/amd_mmd_shared.h
+++ b/lib/amdgpu/amd_mmd_shared.h
@@ -27,19 +27,11 @@
 #define IB_SIZE		4096
 #define MAX_RESOURCES	16
 
-struct mmd_context {
+struct mmd_shared_context {
 	uint32_t family_id;
 	uint32_t chip_id;
 	uint32_t chip_rev;
 	uint32_t asic_id;
-	amdgpu_context_handle context_handle;
-	amdgpu_bo_handle ib_handle;
-	amdgpu_va_handle ib_va_handle;
-	uint64_t ib_mc_address;
-	uint32_t *ib_cpu;
-
-	amdgpu_bo_handle resources[MAX_RESOURCES];
-	unsigned int num_resources;
 
 	/* vce */
 	uint32_t vce_harvest_config;
@@ -61,6 +53,17 @@ struct mmd_context {
 	bool vpe_ring;
 };
 
+struct mmd_context {
+	amdgpu_context_handle context_handle;
+	amdgpu_bo_handle ib_handle;
+	amdgpu_va_handle ib_va_handle;
+	uint64_t ib_mc_address;
+	uint32_t *ib_cpu;
+
+	amdgpu_bo_handle resources[MAX_RESOURCES];
+	unsigned int num_resources;
+};
+
 struct amdgpu_mmd_bo {
 	amdgpu_bo_handle handle;
 	amdgpu_va_handle va_handle;
@@ -82,7 +85,6 @@ struct amdgpu_uvd_enc {
 struct uvd_enc_context {
 	struct mmd_context uvd;
 	struct amdgpu_uvd_enc enc;
-
 };
 
 bool
@@ -101,6 +103,9 @@ void
 mmd_context_clean(amdgpu_device_handle device_handle,
 		struct mmd_context *context);
 
+int
+mmd_shared_context_init(amdgpu_device_handle device_handle, struct mmd_shared_context *context);
+
 int
 submit(amdgpu_device_handle device_handle, struct mmd_context *context,
 		unsigned int ndw, unsigned int ip);
diff --git a/tests/amdgpu/amd_jpeg_dec.c b/tests/amdgpu/amd_jpeg_dec.c
index 8fcc471b8..4bbd0132e 100644
--- a/tests/amdgpu/amd_jpeg_dec.c
+++ b/tests/amdgpu/amd_jpeg_dec.c
@@ -124,7 +124,7 @@ static uint32_t jpeg_chroma_base0_0;
 
 static bool
 is_jpeg_tests_enable(amdgpu_device_handle device_handle,
-		struct mmd_context *context)
+		struct mmd_shared_context *context)
 {
 	struct drm_amdgpu_info_hw_ip info;
 	int r;
@@ -464,7 +464,7 @@ send_cmd_target_direct(struct mmd_context *context, uint64_t addr,
 
 static void
 amdgpu_cs_jpeg_decode(amdgpu_device_handle device_handle,
-		struct mmd_context *context)
+		struct mmd_shared_context *shared_context)
 {
 
 	struct amdgpu_mmd_bo dec_buf;
@@ -472,7 +472,11 @@ amdgpu_cs_jpeg_decode(amdgpu_device_handle device_handle,
 	uint8_t *dec;
 	int sum = 0, i, j;
 	uint32_t idx;
+	struct mmd_context acontext = {0};
+	struct mmd_context *context = &acontext;
 
+	r = mmd_context_init(device_handle, context);
+	igt_assert_eq(r, 0);
 	size = 32 * 1024; /* 8K bitstream + 24K output */
 
 	context->num_resources = 0;
@@ -485,7 +489,7 @@ amdgpu_cs_jpeg_decode(amdgpu_device_handle device_handle,
 
 	idx = 0;
 
-	if (context->jpeg_direct_reg == true) {
+	if (shared_context->jpeg_direct_reg == true) {
 		send_cmd_bitstream_direct(context, dec_buf.addr, &idx);
 		send_cmd_target_direct(context, dec_buf.addr + (size / 4), &idx);
 	} else {
@@ -514,12 +518,13 @@ amdgpu_cs_jpeg_decode(amdgpu_device_handle device_handle,
 	igt_assert_eq(sum, JPEG_DEC_SUM);
 
 	free_resource(&dec_buf);
+	mmd_context_clean(device_handle, context);
 }
 
 igt_main
 {
 	amdgpu_device_handle device;
-	struct mmd_context context = {};
+	struct mmd_shared_context shared_context = {};
 	int fd = -1;
 
 	igt_fixture {
@@ -531,16 +536,15 @@ igt_main
 		igt_require(err == 0);
 		igt_info("Initialized amdgpu, driver version %d.%d\n",
 			 major, minor);
-		err = mmd_context_init(device, &context);
+		err = mmd_shared_context_init(device, &shared_context);
 		igt_require(err == 0);
-		igt_skip_on(!is_jpeg_tests_enable(device, &context));
+		igt_skip_on(!is_jpeg_tests_enable(device, &shared_context));
 	}
 	igt_describe("Test whether jpeg dec decodes");
 	igt_subtest("amdgpu_cs_jpeg_decode")
-	amdgpu_cs_jpeg_decode(device, &context);
+	amdgpu_cs_jpeg_decode(device, &shared_context);
 
 	igt_fixture {
-		mmd_context_clean(device, &context);
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
 	}
diff --git a/tests/amdgpu/amd_uvd_dec.c b/tests/amdgpu/amd_uvd_dec.c
index 8cc0b5ade..3ec411aac 100644
--- a/tests/amdgpu/amd_uvd_dec.c
+++ b/tests/amdgpu/amd_uvd_dec.c
@@ -21,6 +21,7 @@ uvd_cmd(uint32_t family_id, uint64_t addr, uint32_t cmd, uint32_t *idx,
 
 static void
 amdgpu_uvd_dec_create(amdgpu_device_handle device_handle,
+		struct mmd_shared_context *shared_context,
 		struct mmd_context *context)
 {
 	struct amdgpu_bo_alloc_request req = {0};
@@ -51,10 +52,10 @@ amdgpu_uvd_dec_create(amdgpu_device_handle device_handle,
 
 	memcpy(msg, uvd_create_msg, sizeof(uvd_create_msg));
 
-	if (context->family_id >= AMDGPU_FAMILY_VI) {
+	if (shared_context->family_id >= AMDGPU_FAMILY_VI) {
 		((uint8_t *)msg)[0x10] = 7;
-		if (amdgpu_is_vega_or_polaris(context->family_id, context->chip_id,
-				context->chip_rev)) {
+		if (amdgpu_is_vega_or_polaris(shared_context->family_id, shared_context->chip_id,
+				shared_context->chip_rev)) {
 			/* dpb size */
 			((uint8_t *)msg)[0x28] = 0x00;
 			((uint8_t *)msg)[0x29] = 0x94;
@@ -71,7 +72,7 @@ amdgpu_uvd_dec_create(amdgpu_device_handle device_handle,
 	context->resources[context->num_resources++] = context->ib_handle;
 
 	i = 0;
-	uvd_cmd(context->family_id, va, 0x0, &i, context->ib_cpu);
+	uvd_cmd(shared_context->family_id, va, 0x0, &i, context->ib_cpu);
 
 	for (; i % 16; ++i)
 		context->ib_cpu[i] = 0x80000000;
@@ -91,7 +92,7 @@ amdgpu_uvd_dec_create(amdgpu_device_handle device_handle,
 
 static void
 amdgpu_uvd_decode(amdgpu_device_handle device_handle,
-		struct mmd_context *context)
+		struct mmd_context *context, struct mmd_shared_context *shared_context)
 {
 	const unsigned int dpb_size = 15923584, dt_size = 737280;
 	uint64_t msg_addr, fb_addr, bs_addr, dpb_addr, ctx_addr, dt_addr, it_addr;
@@ -106,7 +107,7 @@ amdgpu_uvd_decode(amdgpu_device_handle device_handle,
 
 	req.alloc_size = 4 * 1024; /* msg */
 	req.alloc_size += 4 * 1024; /* fb */
-	if (context->family_id >= AMDGPU_FAMILY_VI)
+	if (shared_context->family_id >= AMDGPU_FAMILY_VI)
 		req.alloc_size += IB_SIZE; /*it_scaling_table*/
 	req.alloc_size += ALIGN(sizeof(uvd_bitstream), 4 * 1024);
 	req.alloc_size += ALIGN(dpb_size, 4*1024);
@@ -133,12 +134,12 @@ amdgpu_uvd_decode(amdgpu_device_handle device_handle,
 	memcpy(ptr, uvd_decode_msg, sizeof(uvd_decode_msg));
 	memcpy(ptr + sizeof(uvd_decode_msg), avc_decode_msg, sizeof(avc_decode_msg));
 
-	if (context->family_id >= AMDGPU_FAMILY_VI) {
+	if (shared_context->family_id >= AMDGPU_FAMILY_VI) {
 		ptr[0x10] = 7;
 		ptr[0x98] = 0x00;
 		ptr[0x99] = 0x02;
-		if (amdgpu_is_vega_or_polaris(context->family_id, context->chip_id,
-				context->chip_rev)) {
+		if (amdgpu_is_vega_or_polaris(shared_context->family_id, shared_context->chip_id,
+				shared_context->chip_rev)) {
 			/* dpb size */
 			ptr[0x24] = 0x00;
 			ptr[0x25] = 0x94;
@@ -154,7 +155,7 @@ amdgpu_uvd_decode(amdgpu_device_handle device_handle,
 
 	ptr += 4 * 1024;
 	memset(ptr, 0, 4 * 1024);
-	if (context->family_id >= AMDGPU_FAMILY_VI) {
+	if (shared_context->family_id >= AMDGPU_FAMILY_VI) {
 		ptr += 4 * 1024;
 		memcpy(ptr, uvd_it_scaling_table, sizeof(uvd_it_scaling_table));
 	}
@@ -174,7 +175,7 @@ amdgpu_uvd_decode(amdgpu_device_handle device_handle,
 
 	msg_addr = va;
 	fb_addr = msg_addr + 4 * 1024;
-	if (context->family_id >= AMDGPU_FAMILY_VI) {
+	if (shared_context->family_id >= AMDGPU_FAMILY_VI) {
 		it_addr = fb_addr + 4 * 1024;
 		bs_addr = it_addr + 4 * 1024;
 	} else
@@ -182,9 +183,9 @@ amdgpu_uvd_decode(amdgpu_device_handle device_handle,
 	dpb_addr = ALIGN(bs_addr + sizeof(uvd_bitstream), 4 * 1024);
 
 	ctx_addr = 0;
-	if (context->family_id >= AMDGPU_FAMILY_VI) {
-		if (amdgpu_is_vega_or_polaris(context->family_id, context->chip_id,
-				context->chip_rev)) {
+	if (shared_context->family_id >= AMDGPU_FAMILY_VI) {
+		if (amdgpu_is_vega_or_polaris(shared_context->family_id, shared_context->chip_id,
+				shared_context->chip_rev)) {
 			ctx_addr = ALIGN(dpb_addr + 0x006B9400, 4 * 1024);
 		}
 	}
@@ -192,21 +193,21 @@ amdgpu_uvd_decode(amdgpu_device_handle device_handle,
 	dt_addr = ALIGN(dpb_addr + dpb_size, 4 * 1024);
 
 	i = 0;
-	uvd_cmd(context->family_id, msg_addr, 0x0, &i, context->ib_cpu);
-	uvd_cmd(context->family_id, dpb_addr, 0x1, &i, context->ib_cpu);
-	uvd_cmd(context->family_id, dt_addr, 0x2, &i, context->ib_cpu);
-	uvd_cmd(context->family_id, fb_addr, 0x3, &i, context->ib_cpu);
-	uvd_cmd(context->family_id, bs_addr, 0x100, &i, context->ib_cpu);
-
-	if (context->family_id >= AMDGPU_FAMILY_VI) {
-		uvd_cmd(context->family_id, it_addr, 0x204, &i, context->ib_cpu);
-		if (amdgpu_is_vega_or_polaris(context->family_id, context->chip_id,
-				context->chip_rev)) {
-			uvd_cmd(context->family_id, ctx_addr, 0x206, &i, context->ib_cpu);
+	uvd_cmd(shared_context->family_id, msg_addr, 0x0, &i, context->ib_cpu);
+	uvd_cmd(shared_context->family_id, dpb_addr, 0x1, &i, context->ib_cpu);
+	uvd_cmd(shared_context->family_id, dt_addr, 0x2, &i, context->ib_cpu);
+	uvd_cmd(shared_context->family_id, fb_addr, 0x3, &i, context->ib_cpu);
+	uvd_cmd(shared_context->family_id, bs_addr, 0x100, &i, context->ib_cpu);
+
+	if (shared_context->family_id >= AMDGPU_FAMILY_VI) {
+		uvd_cmd(shared_context->family_id, it_addr, 0x204, &i, context->ib_cpu);
+		if (amdgpu_is_vega_or_polaris(shared_context->family_id, shared_context->chip_id,
+				shared_context->chip_rev)) {
+			uvd_cmd(shared_context->family_id, ctx_addr, 0x206, &i, context->ib_cpu);
 		}
 	}
 
-	context->ib_cpu[i++] = (context->family_id < AMDGPU_FAMILY_AI) ?
+	context->ib_cpu[i++] = (shared_context->family_id < AMDGPU_FAMILY_AI) ?
 			UVD_4_0__ENGINE_CNTL : VEGA_20_UVD_ENGINE_CNTL;
 	context->ib_cpu[i++] = 0x1;
 	for (; i % 16; ++i)
@@ -234,7 +235,8 @@ amdgpu_uvd_decode(amdgpu_device_handle device_handle,
 }
 
 static void
-amdgpu_uvd_dec_destroy(amdgpu_device_handle device_handle, struct mmd_context *context)
+amdgpu_uvd_dec_destroy(amdgpu_device_handle device_handle, struct mmd_context *context,
+		 struct mmd_shared_context *shared_context)
 {
 	struct amdgpu_bo_alloc_request req = {0};
 	amdgpu_bo_handle buf_handle;
@@ -264,7 +266,7 @@ amdgpu_uvd_dec_destroy(amdgpu_device_handle device_handle, struct mmd_context *c
 	igt_assert_eq(r, 0);
 
 	memcpy(msg, uvd_destroy_msg, sizeof(uvd_destroy_msg));
-	if (context->family_id >= AMDGPU_FAMILY_VI)
+	if (shared_context->family_id >= AMDGPU_FAMILY_VI)
 		((uint8_t *)msg)[0x10] = 7;
 
 	r = amdgpu_bo_cpu_unmap(buf_handle);
@@ -275,7 +277,7 @@ amdgpu_uvd_dec_destroy(amdgpu_device_handle device_handle, struct mmd_context *c
 	context->resources[context->num_resources++] = context->ib_handle;
 
 	i = 0;
-	uvd_cmd(context->family_id, va, 0x0, &i, context->ib_cpu);
+	uvd_cmd(shared_context->family_id, va, 0x0, &i, context->ib_cpu);
 	for (; i % 16; ++i)
 		context->ib_cpu[i] = 0x80000000;
 
@@ -296,6 +298,7 @@ igt_main
 {
 	amdgpu_device_handle device;
 	struct mmd_context context = {};
+	struct mmd_shared_context shared_context = {};
 	int fd = -1;
 
 	igt_fixture {
@@ -307,22 +310,24 @@ igt_main
 		igt_require(err == 0);
 		igt_info("Initialized amdgpu, driver version %d.%d\n",
 			 major, minor);
+		err = mmd_shared_context_init(device, &shared_context);
+		igt_require(err == 0);
 		err = mmd_context_init(device, &context);
 		igt_require(err == 0);
-		igt_skip_on(!is_uvd_tests_enable(context.family_id, context.chip_id,
-				context.chip_rev));
+		igt_skip_on(!is_uvd_tests_enable(shared_context.family_id, shared_context.chip_id,
+				shared_context.chip_rev));
 	}
 	igt_describe("Test whether uvd dec is created");
 	igt_subtest("amdgpu_uvd_dec_create")
-	amdgpu_uvd_dec_create(device, &context);
+	amdgpu_uvd_dec_create(device, &shared_context, &context);
 
 	igt_describe("Test whether uvd dec can decode");
 	igt_subtest("amdgpu_uvd_decode")
-	amdgpu_uvd_decode(device, &context);
+	amdgpu_uvd_decode(device, &context, &shared_context);
 
 	igt_describe("Test whether uvd dec is destroyed");
 	igt_subtest("amdgpu_uvd_dec_destroy")
-	amdgpu_uvd_dec_destroy(device, &context);
+	amdgpu_uvd_dec_destroy(device, &context, &shared_context);
 
 	igt_fixture {
 		mmd_context_clean(device, &context);
diff --git a/tests/amdgpu/amd_uvd_enc.c b/tests/amdgpu/amd_uvd_enc.c
index 58434307a..15fb11fa3 100644
--- a/tests/amdgpu/amd_uvd_enc.c
+++ b/tests/amdgpu/amd_uvd_enc.c
@@ -114,13 +114,13 @@ amdgpu_uvd_enc_session_init(amdgpu_device_handle device_handle,
 
 static void
 amdgpu_uvd_enc_encode(amdgpu_device_handle device_handle,
-		struct uvd_enc_context *context)
+		struct uvd_enc_context *context, struct mmd_shared_context *shared_context)
 {
 	int len, r, i;
 	uint64_t luma_offset, chroma_offset;
 	unsigned int luma_size;
 	uint32_t vbuf_size, bs_size = 0x003f4800, cpb_size;
-	unsigned int align = (context->uvd.family_id >= AMDGPU_FAMILY_AI) ? 256 : 16;
+	unsigned int align = (shared_context->family_id >= AMDGPU_FAMILY_AI) ? 256 : 16;
 
 	vbuf_size = ALIGN(context->enc.width, align) *
 			ALIGN(context->enc.height, 16) * 1.5;
@@ -293,18 +293,26 @@ amdgpu_uvd_enc_destroy(amdgpu_device_handle device_handle,
 }
 
 static void
-amdgpu_uvd_enc_test(amdgpu_device_handle device, struct uvd_enc_context *context)
+amdgpu_uvd_enc_test(amdgpu_device_handle device, struct mmd_shared_context *shared_context)
 {
-	amdgpu_uvd_enc_create(device, context);
-	amdgpu_uvd_enc_session_init(device, context);
-	amdgpu_uvd_enc_encode(device, context);
-	amdgpu_uvd_enc_destroy(device, context);
+	struct uvd_enc_context context = {0};
+	int r;
+
+	r = mmd_context_init(device, &context.uvd);
+	igt_require(r == 0);
+	amdgpu_uvd_enc_create(device, &context);
+	amdgpu_uvd_enc_session_init(device, &context);
+	amdgpu_uvd_enc_encode(device, &context, shared_context);
+	amdgpu_uvd_enc_destroy(device, &context);
+
+	mmd_context_clean(device, &context.uvd);
+
 }
 
 igt_main
 {
 	amdgpu_device_handle device;
-	struct uvd_enc_context context = {};
+	struct mmd_shared_context shared_context = {};
 	int fd = -1;
 
 	igt_fixture {
@@ -316,8 +324,8 @@ igt_main
 		igt_require(err == 0);
 		igt_info("Initialized amdgpu, driver version %d.%d\n",
 			 major, minor);
-		memset(&context, 0, sizeof(context));
-		err = mmd_context_init(device, &context.uvd);
+		memset(&shared_context, 0, sizeof(shared_context));
+		err = mmd_shared_context_init(device, &shared_context);
 		igt_require(err == 0);
 
 		igt_skip_on(!is_uvd_enc_enable(device));
@@ -325,10 +333,9 @@ igt_main
 
 	igt_describe("Test uvd session, encode, destroy");
 	igt_subtest("uvd_encoder")
-		amdgpu_uvd_enc_test(device, &context);
+		amdgpu_uvd_enc_test(device, &shared_context);
 
 	igt_fixture {
-		mmd_context_clean(device, &context.uvd);
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
 	}
diff --git a/tests/amdgpu/amd_vce_enc.c b/tests/amdgpu/amd_vce_enc.c
index d2cf7e5ae..de7cb8d04 100644
--- a/tests/amdgpu/amd_vce_enc.c
+++ b/tests/amdgpu/amd_vce_enc.c
@@ -60,9 +60,10 @@ is_vce_tests_enable(amdgpu_device_handle device_handle, uint32_t family_id,
 
 static void
 amdgpu_cs_vce_create(amdgpu_device_handle device_handle,
-		struct amdgpu_vce_encode *enc, struct mmd_context *context, bool is_mv_supported)
+		struct amdgpu_vce_encode *enc, struct mmd_context *context,
+		struct mmd_shared_context *shared_context, bool is_mv_supported)
 {
-	unsigned int align = (context->family_id >= AMDGPU_FAMILY_AI) ? 256 : 16;
+	unsigned int align = (shared_context->family_id >= AMDGPU_FAMILY_AI) ? 256 : 16;
 	int len, r;
 
 	enc->width = vce_create[6];
@@ -82,7 +83,7 @@ amdgpu_cs_vce_create(amdgpu_device_handle device_handle,
 	context->ib_cpu[len + 8] = ALIGN(enc->width, align);
 	context->ib_cpu[len + 9] = ALIGN(enc->width, align);
 	if (is_mv_supported == true) {/* disableTwoInstance */
-		if (context->family_id >= AMDGPU_FAMILY_AI)
+		if (shared_context->family_id >= AMDGPU_FAMILY_AI)
 			context->ib_cpu[len + 11] = 0x01000001;
 		else
 			context->ib_cpu[len + 11] = 0x01000201;
@@ -129,11 +130,12 @@ amdgpu_cs_vce_config(amdgpu_device_handle device_handle,
 }
 
 static void amdgpu_cs_vce_encode_idr(amdgpu_device_handle device_handle,
-		struct mmd_context *context, struct amdgpu_vce_encode *enc)
+		struct mmd_shared_context *shared_context, struct mmd_context *context,
+		struct amdgpu_vce_encode *enc)
 {
 
 	uint64_t luma_offset, chroma_offset;
-	unsigned int align = (context->family_id >= AMDGPU_FAMILY_AI) ? 256 : 16;
+	unsigned int align = (shared_context->family_id >= AMDGPU_FAMILY_AI) ? 256 : 16;
 	unsigned int luma_size = ALIGN(enc->width, align) * ALIGN(enc->height, 16);
 	int len = 0, i, r;
 
@@ -180,11 +182,12 @@ static void amdgpu_cs_vce_encode_idr(amdgpu_device_handle device_handle,
 }
 
 static void amdgpu_cs_vce_encode_p(amdgpu_device_handle device_handle,
+		struct mmd_shared_context *shared_context,
 		struct mmd_context *context, struct amdgpu_vce_encode *enc)
 {
 	uint64_t luma_offset, chroma_offset;
 	int len, i, r;
-	unsigned int align = (context->family_id >= AMDGPU_FAMILY_AI) ? 256 : 16;
+	unsigned int align = (shared_context->family_id >= AMDGPU_FAMILY_AI) ? 256 : 16;
 	unsigned int luma_size = ALIGN(enc->width, align) * ALIGN(enc->height, 16);
 
 	len = (enc->two_instance) ? enc->ib_len : 0;
@@ -265,11 +268,12 @@ static void check_result(struct amdgpu_vce_encode *enc)
 }
 
 static void
-amdgpu_cs_vce_encode(amdgpu_device_handle device_handle, struct mmd_context *context,
+amdgpu_cs_vce_encode(amdgpu_device_handle device_handle,
+		struct mmd_shared_context *shared_context, struct mmd_context *context,
 		struct amdgpu_vce_encode *enc, bool is_mv_supported)
 {
 	uint32_t vbuf_size, bs_size = 0x154000, cpb_size;
-	unsigned int align = (context->family_id >= AMDGPU_FAMILY_AI) ? 256 : 16;
+	unsigned int align = (shared_context->family_id >= AMDGPU_FAMILY_AI) ? 256 : 16;
 	int i, r;
 
 	vbuf_size = ALIGN(enc->width, align) * ALIGN(enc->height, 16) * 1.5;
@@ -308,34 +312,34 @@ amdgpu_cs_vce_encode(amdgpu_device_handle device_handle, struct mmd_context *con
 
 	amdgpu_cs_vce_config(device_handle, context, is_mv_supported);
 
-	if (context->family_id >= AMDGPU_FAMILY_VI) {
+	if (shared_context->family_id >= AMDGPU_FAMILY_VI) {
 		vce_taskinfo[3] = 3;
-		amdgpu_cs_vce_encode_idr(device_handle, context, enc);
-		amdgpu_cs_vce_encode_p(device_handle, context, enc);
+		amdgpu_cs_vce_encode_idr(device_handle, shared_context, context, enc);
+		amdgpu_cs_vce_encode_p(device_handle, shared_context, context, enc);
 		check_result(enc);
 
 		/* two pipes */
 		vce_encode[16] = 0;
-		amdgpu_cs_vce_encode_idr(device_handle, context, enc);
-		amdgpu_cs_vce_encode_p(device_handle, context, enc);
+		amdgpu_cs_vce_encode_idr(device_handle, shared_context, context, enc);
+		amdgpu_cs_vce_encode_p(device_handle, shared_context, context, enc);
 		check_result(enc);
 
 		/* two instances */
-		if (context->vce_harvest_config == 0) {
+		if (shared_context->vce_harvest_config == 0) {
 			enc->two_instance = true;
 			vce_taskinfo[2] = 0x83;
 			vce_taskinfo[4] = 1;
-			amdgpu_cs_vce_encode_idr(device_handle, context, enc);
+			amdgpu_cs_vce_encode_idr(device_handle, shared_context, context, enc);
 			vce_taskinfo[2] = 0xffffffff;
 			vce_taskinfo[4] = 2;
-			amdgpu_cs_vce_encode_p(device_handle, context, enc);
+			amdgpu_cs_vce_encode_p(device_handle, shared_context, context, enc);
 			check_result(enc);
 		}
 	} else {
 		vce_taskinfo[3] = 3;
 		vce_encode[16] = 0;
-		amdgpu_cs_vce_encode_idr(device_handle, context, enc);
-		amdgpu_cs_vce_encode_p(device_handle, context, enc);
+		amdgpu_cs_vce_encode_idr(device_handle, shared_context, context, enc);
+		amdgpu_cs_vce_encode_p(device_handle, shared_context, context, enc);
 		check_result(enc);
 	}
 
@@ -348,11 +352,12 @@ amdgpu_cs_vce_encode(amdgpu_device_handle device_handle, struct mmd_context *con
 }
 
 static void amdgpu_cs_vce_mv(amdgpu_device_handle device_handle,
+		struct mmd_shared_context *shared_context,
 		struct mmd_context *context, struct amdgpu_vce_encode *enc)
 {
 	uint64_t luma_offset, chroma_offset;
 	uint64_t mv_ref_luma_offset;
-	unsigned int align = (context->family_id >= AMDGPU_FAMILY_AI) ? 256 : 16;
+	unsigned int align = (shared_context->family_id >= AMDGPU_FAMILY_AI) ? 256 : 16;
 	unsigned int luma_size = ALIGN(enc->width, align) * ALIGN(enc->height, 16);
 	int len = 0, i, r;
 
@@ -456,11 +461,13 @@ static void check_mv_result(struct amdgpu_vce_encode *enc)
 }
 
 static void
-amdgpu_cs_vce_encode_mv(amdgpu_device_handle device_handle, struct mmd_context *context,
+amdgpu_cs_vce_encode_mv(amdgpu_device_handle device_handle,
+		struct mmd_shared_context *shared_context,
+		struct mmd_context *context,
 		struct amdgpu_vce_encode *enc, bool is_mv_supported)
 {
 	uint32_t vbuf_size, bs_size = 0x154000, cpb_size;
-	unsigned int align = (context->family_id >= AMDGPU_FAMILY_AI) ? 256 : 16;
+	unsigned int align = (shared_context->family_id >= AMDGPU_FAMILY_AI) ? 256 : 16;
 	int i, r;
 
 	vbuf_size = ALIGN(enc->width, align) * ALIGN(enc->height, 16) * 1.5;
@@ -517,7 +524,7 @@ amdgpu_cs_vce_encode_mv(amdgpu_device_handle device_handle, struct mmd_context *
 	amdgpu_cs_vce_config(device_handle, context, is_mv_supported);
 
 	vce_taskinfo[3] = 3;
-	amdgpu_cs_vce_mv(device_handle, context, enc);
+	amdgpu_cs_vce_mv(device_handle, shared_context, context, enc);
 	check_mv_result(enc);
 
 	free_resource(&enc->fb[0]);
@@ -559,21 +566,30 @@ amdgpu_cs_vce_destroy(amdgpu_device_handle device_handle, struct mmd_context *co
 }
 
 static void
-amdgpu_vce_enc_test(amdgpu_device_handle device, struct mmd_context *context,
-		struct amdgpu_vce_encode *enc, bool is_mv_supported)
+amdgpu_vce_enc_test(amdgpu_device_handle device, struct mmd_shared_context *shared_context,
+		bool is_mv_supported)
 {
-	amdgpu_cs_vce_create(device, enc, context, is_mv_supported);
-	amdgpu_cs_vce_encode(device, context, enc, is_mv_supported);
+	int err;
+	struct mmd_context acontext = {};
+	struct amdgpu_vce_encode aenc = {};
+
+	struct mmd_context *context = &acontext;
+	struct amdgpu_vce_encode *enc = &aenc;
+
+	err = mmd_context_init(device, context);
+	igt_require(err == 0);
+	amdgpu_cs_vce_create(device, enc, context, shared_context, is_mv_supported);
+	amdgpu_cs_vce_encode(device, shared_context ,context, enc, is_mv_supported);
 	if (is_mv_supported)
-		amdgpu_cs_vce_encode_mv(device, context, enc, is_mv_supported);
+		amdgpu_cs_vce_encode_mv(device, shared_context, context, enc, is_mv_supported);
 	amdgpu_cs_vce_destroy(device, context, enc);
+	mmd_context_clean(device, context);
 }
 
 igt_main
 {
 	amdgpu_device_handle device;
-	struct mmd_context context = {};
-	struct amdgpu_vce_encode enc = {};
+	struct mmd_shared_context shared_context = {};
 	int fd = -1;
 	bool is_mv_supported = false;
 
@@ -586,17 +602,16 @@ igt_main
 		igt_require(err == 0);
 		igt_info("Initialized amdgpu, driver version %d.%d\n",
 			 major, minor);
-		err = mmd_context_init(device, &context);
+		err = mmd_shared_context_init(device, &shared_context);
 		igt_require(err == 0);
-		igt_skip_on(!is_vce_tests_enable(device, context.family_id, context.chip_id,
-				context.chip_rev, &is_mv_supported));
+		igt_skip_on(!is_vce_tests_enable(device, shared_context.family_id, shared_context.chip_id,
+				shared_context.chip_rev, &is_mv_supported));
 	}
 	igt_describe("Test vce enc is created, encode, destroy");
 	igt_subtest("amdgpu_vce_encoder")
-		amdgpu_vce_enc_test(device, &context, &enc, is_mv_supported);
+		amdgpu_vce_enc_test(device, &shared_context, is_mv_supported);
 
 	igt_fixture {
-		mmd_context_clean(device, &context);
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
 	}
diff --git a/tests/amdgpu/amd_vcn.c b/tests/amdgpu/amd_vcn.c
index bd8c9da23..2ffebd286 100644
--- a/tests/amdgpu/amd_vcn.c
+++ b/tests/amdgpu/amd_vcn.c
@@ -136,7 +136,7 @@ static uint32_t
 bs_read_ue(struct buffer_info *buf_info);
 
 static bool
-is_vcn_tests_enable(amdgpu_device_handle device_handle, struct mmd_context *context)
+is_vcn_tests_enable(amdgpu_device_handle device_handle, struct mmd_shared_context *context)
 {
 	struct drm_amdgpu_info_hw_ip info;
 	int r;
@@ -234,15 +234,16 @@ amdgpu_cs_sq_ib_tail(struct vcn_context *v_context, uint32_t *end)
 }
 
 static void
-vcn_dec_cmd(struct mmd_context *context, struct vcn_context *v_context,
+vcn_dec_cmd(struct mmd_shared_context *shared_context,
+		struct mmd_context *context, struct vcn_context *v_context,
 		uint64_t addr, unsigned int cmd, int *idx)
 {
-	if (context->vcn_dec_sw_ring == false) {
-		context->ib_cpu[(*idx)++] = reg[context->vcn_reg_index].data0;
+	if (shared_context->vcn_dec_sw_ring == false) {
+		context->ib_cpu[(*idx)++] = reg[shared_context->vcn_reg_index].data0;
 		context->ib_cpu[(*idx)++] = addr;
-		context->ib_cpu[(*idx)++] = reg[context->vcn_reg_index].data1;
+		context->ib_cpu[(*idx)++] = reg[shared_context->vcn_reg_index].data1;
 		context->ib_cpu[(*idx)++] = addr >> 32;
-		context->ib_cpu[(*idx)++] = reg[context->vcn_reg_index].cmd;
+		context->ib_cpu[(*idx)++] = reg[shared_context->vcn_reg_index].cmd;
 		context->ib_cpu[(*idx)++] = cmd << 1;
 		return;
 	}
@@ -251,7 +252,7 @@ vcn_dec_cmd(struct mmd_context *context, struct vcn_context *v_context,
 	if (!(*idx)) {
 		struct rvcn_decode_ib_package *ib_header;
 
-		if (context->vcn_unified_ring)
+		if (shared_context->vcn_unified_ring)
 			amdgpu_cs_sq_head(v_context, context->ib_cpu, idx, false);
 
 		ib_header = (struct rvcn_decode_ib_package *)&context->ib_cpu[*idx];
@@ -319,8 +320,9 @@ vcn_dec_cmd(struct mmd_context *context, struct vcn_context *v_context,
 }
 
 static void
-amdgpu_cs_vcn_dec_create(amdgpu_device_handle device_handle, struct mmd_context *context,
-			struct vcn_context *v_context)
+amdgpu_cs_vcn_dec_create(amdgpu_device_handle device_handle,
+		struct mmd_shared_context *shared_context,  struct mmd_context *context,
+		struct vcn_context *v_context)
 {
 	struct amdgpu_mmd_bo msg_buf;
 	unsigned int ip;
@@ -339,22 +341,22 @@ amdgpu_cs_vcn_dec_create(amdgpu_device_handle device_handle, struct mmd_context
 	memcpy(msg_buf.ptr, vcn_dec_create_msg, sizeof(vcn_dec_create_msg));
 
 	len = 0;
-	vcn_dec_cmd(context, v_context, v_context->session_ctx_buf.addr, 5, &len);
-	if (context->vcn_dec_sw_ring == true) {
-		vcn_dec_cmd(context, v_context, msg_buf.addr, 0, &len);
+	vcn_dec_cmd(shared_context, context, v_context, v_context->session_ctx_buf.addr, 5, &len);
+	if (shared_context->vcn_dec_sw_ring == true) {
+		vcn_dec_cmd(shared_context, context, v_context, msg_buf.addr, 0, &len);
 	} else {
-		context->ib_cpu[len++] = reg[context->vcn_reg_index].data0;
+		context->ib_cpu[len++] = reg[shared_context->vcn_reg_index].data0;
 		context->ib_cpu[len++] = msg_buf.addr;
-		context->ib_cpu[len++] = reg[context->vcn_reg_index].data1;
+		context->ib_cpu[len++] = reg[shared_context->vcn_reg_index].data1;
 		context->ib_cpu[len++] = msg_buf.addr >> 32;
-		context->ib_cpu[len++] = reg[context->vcn_reg_index].cmd;
+		context->ib_cpu[len++] = reg[shared_context->vcn_reg_index].cmd;
 		context->ib_cpu[len++] = 0;
 		for (; len % 16; ) {
-			context->ib_cpu[len++] = reg[context->vcn_reg_index].nop;
+			context->ib_cpu[len++] = reg[shared_context->vcn_reg_index].nop;
 			context->ib_cpu[len++] = 0;
 		}
 	}
-	if (context->vcn_unified_ring) {
+	if (shared_context->vcn_unified_ring) {
 		amdgpu_cs_sq_ib_tail(v_context, context->ib_cpu + len);
 		ip = AMDGPU_HW_IP_VCN_ENC;
 	} else
@@ -368,7 +370,9 @@ amdgpu_cs_vcn_dec_create(amdgpu_device_handle device_handle, struct mmd_context
 }
 
 static void
-amdgpu_cs_vcn_dec_decode(amdgpu_device_handle device_handle, struct mmd_context *context,
+amdgpu_cs_vcn_dec_decode(amdgpu_device_handle device_handle,
+			struct mmd_shared_context *shared_context,
+			struct mmd_context *context,
 			struct vcn_context *v_context)
 {
 	const unsigned int dpb_size = 15923584, dt_size = 737280;
@@ -422,25 +426,25 @@ amdgpu_cs_vcn_dec_decode(amdgpu_device_handle device_handle, struct mmd_context
 
 
 	len = 0;
-	vcn_dec_cmd(context, v_context, v_context->session_ctx_buf.addr, 0x5, &len);
-	vcn_dec_cmd(context, v_context, msg_addr, 0x0, &len);
-	vcn_dec_cmd(context, v_context, dpb_addr, 0x1, &len);
-	vcn_dec_cmd(context, v_context, dt_addr, 0x2, &len);
-	vcn_dec_cmd(context, v_context, fb_addr, 0x3, &len);
-	vcn_dec_cmd(context, v_context, bs_addr, 0x100, &len);
-	vcn_dec_cmd(context, v_context, it_addr, 0x204, &len);
-	vcn_dec_cmd(context, v_context, ctx_addr, 0x206, &len);
-
-	if (context->vcn_dec_sw_ring == false) {
-		context->ib_cpu[len++] = reg[context->vcn_reg_index].cntl;
+	vcn_dec_cmd(shared_context, context, v_context, v_context->session_ctx_buf.addr, 0x5, &len);
+	vcn_dec_cmd(shared_context, context, v_context, msg_addr, 0x0, &len);
+	vcn_dec_cmd(shared_context, context, v_context, dpb_addr, 0x1, &len);
+	vcn_dec_cmd(shared_context, context, v_context, dt_addr, 0x2, &len);
+	vcn_dec_cmd(shared_context, context, v_context, fb_addr, 0x3, &len);
+	vcn_dec_cmd(shared_context, context, v_context, bs_addr, 0x100, &len);
+	vcn_dec_cmd(shared_context, context, v_context, it_addr, 0x204, &len);
+	vcn_dec_cmd(shared_context, context, v_context, ctx_addr, 0x206, &len);
+
+	if (shared_context->vcn_dec_sw_ring == false) {
+		context->ib_cpu[len++] = reg[shared_context->vcn_reg_index].cntl;
 		context->ib_cpu[len++] = 0x1;
 		for (; len % 16; ) {
-			context->ib_cpu[len++] = reg[context->vcn_reg_index].nop;
+			context->ib_cpu[len++] = reg[shared_context->vcn_reg_index].nop;
 			context->ib_cpu[len++] = 0;
 		}
 	}
 
-	if (context->vcn_unified_ring) {
+	if (shared_context->vcn_unified_ring) {
 		amdgpu_cs_sq_ib_tail(v_context, context->ib_cpu + len);
 		ip = AMDGPU_HW_IP_VCN_ENC;
 	} else
@@ -459,7 +463,8 @@ amdgpu_cs_vcn_dec_decode(amdgpu_device_handle device_handle, struct mmd_context
 
 static void
 amdgpu_cs_vcn_dec_destroy(amdgpu_device_handle device_handle,
-			struct mmd_context *context, struct vcn_context *v_context)
+		struct mmd_shared_context *shared_context,
+		struct mmd_context *context, struct vcn_context *v_context)
 {
 	struct amdgpu_mmd_bo msg_buf;
 	unsigned int ip;
@@ -477,22 +482,22 @@ amdgpu_cs_vcn_dec_destroy(amdgpu_device_handle device_handle,
 	memcpy(msg_buf.ptr, vcn_dec_destroy_msg, sizeof(vcn_dec_destroy_msg));
 
 	len = 0;
-	vcn_dec_cmd(context, v_context, v_context->session_ctx_buf.addr, 5, &len);
-	if (context->vcn_dec_sw_ring == true) {
-		vcn_dec_cmd(context, v_context, msg_buf.addr, 0, &len);
+	vcn_dec_cmd(shared_context, context, v_context, v_context->session_ctx_buf.addr, 5, &len);
+	if (shared_context->vcn_dec_sw_ring == true) {
+		vcn_dec_cmd(shared_context, context, v_context, msg_buf.addr, 0, &len);
 	} else {
-		context->ib_cpu[len++] = reg[context->vcn_reg_index].data0;
+		context->ib_cpu[len++] = reg[shared_context->vcn_reg_index].data0;
 		context->ib_cpu[len++] = msg_buf.addr;
-		context->ib_cpu[len++] = reg[context->vcn_reg_index].data1;
+		context->ib_cpu[len++] = reg[shared_context->vcn_reg_index].data1;
 		context->ib_cpu[len++] = msg_buf.addr >> 32;
-		context->ib_cpu[len++] = reg[context->vcn_reg_index].cmd;
+		context->ib_cpu[len++] = reg[shared_context->vcn_reg_index].cmd;
 		context->ib_cpu[len++] = 0;
 		for (; len % 16; ) {
-			context->ib_cpu[len++] = reg[context->vcn_reg_index].nop;
+			context->ib_cpu[len++] = reg[shared_context->vcn_reg_index].nop;
 			context->ib_cpu[len++] = 0;
 		}
 	}
-	if (context->vcn_unified_ring) {
+	if (shared_context->vcn_unified_ring) {
 		amdgpu_cs_sq_ib_tail(v_context, context->ib_cpu + len);
 		ip = AMDGPU_HW_IP_VCN_ENC;
 	} else
@@ -507,6 +512,7 @@ amdgpu_cs_vcn_dec_destroy(amdgpu_device_handle device_handle,
 
 static void
 amdgpu_cs_vcn_enc_create(amdgpu_device_handle device_handle,
+			struct mmd_shared_context *shared_context,
 			struct mmd_context *context, struct vcn_context *v_context)
 {
 	int len, r;
@@ -516,10 +522,10 @@ amdgpu_cs_vcn_enc_create(amdgpu_device_handle device_handle,
 	unsigned int width = 160, height = 128, buf_size;
 	uint32_t fw_maj = 1, fw_min = 9;
 
-	if (context->vcn_ip_version_major == 2) {
+	if (shared_context->vcn_ip_version_major == 2) {
 		fw_maj = 1;
 		fw_min = 1;
-	} else if (context->vcn_ip_version_major == 3) {
+	} else if (shared_context->vcn_ip_version_major == 3) {
 		fw_maj = 1;
 		fw_min = 0;
 	}
@@ -546,7 +552,7 @@ amdgpu_cs_vcn_enc_create(amdgpu_device_handle device_handle,
 
 	len = 0;
 
-	if (context->vcn_unified_ring)
+	if (shared_context->vcn_unified_ring)
 		amdgpu_cs_sq_head(v_context, context->ib_cpu, &len, true);
 
 	/* session info */
@@ -609,7 +615,7 @@ amdgpu_cs_vcn_enc_create(amdgpu_device_handle device_handle,
 	context->ib_cpu[len++] = 1;	/* quarter pel enabled */
 	context->ib_cpu[len++] = 100;	/* BASELINE profile */
 	context->ib_cpu[len++] = 11;	/* level */
-	if (context->vcn_ip_version_major >= 3) {
+	if (shared_context->vcn_ip_version_major >= 3) {
 		context->ib_cpu[len++] = 0;	/* b_picture_enabled */
 		context->ib_cpu[len++] = 0;	/* weighted_bipred_idc */
 	}
@@ -650,7 +656,7 @@ amdgpu_cs_vcn_enc_create(amdgpu_device_handle device_handle,
 	context->ib_cpu[len++] = 0;	/* scene change sensitivity */
 	context->ib_cpu[len++] = 0;	/* scene change min idr interval */
 	context->ib_cpu[len++] = 0;
-	if (context->vcn_ip_version_major >= 3)
+	if (shared_context->vcn_ip_version_major >= 3)
 		context->ib_cpu[len++] = 0;
 	*st_size = (len - st_offset) * 4;
 
@@ -710,7 +716,7 @@ amdgpu_cs_vcn_enc_create(amdgpu_device_handle device_handle,
 
 	*p_task_size = (len - task_offset) * 4;
 
-	if (context->vcn_unified_ring)
+	if (shared_context->vcn_unified_ring)
 		amdgpu_cs_sq_ib_tail(v_context, context->ib_cpu + len);
 
 	r = submit(device_handle, context, len, AMDGPU_HW_IP_VCN_ENC);
@@ -1062,6 +1068,7 @@ check_result(struct vcn_context *v_context, struct amdgpu_mmd_bo fb_buf,
 
 static void
 amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
+			struct mmd_shared_context *shared_context,
 			struct mmd_context *context, struct vcn_context *v_context,
 			int frame_type)
 {
@@ -1073,10 +1080,10 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	uint32_t *st_size = NULL;
 	uint32_t fw_maj = 1, fw_min = 9;
 
-	if (context->vcn_ip_version_major == 2) {
+	if (shared_context->vcn_ip_version_major == 2) {
 		fw_maj = 1;
 		fw_min = 1;
-	} else if (context->vcn_ip_version_major == 3) {
+	} else if (shared_context->vcn_ip_version_major == 3) {
 		fw_maj = 1;
 		fw_min = 0;
 	}
@@ -1114,7 +1121,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 
 	len = 0;
 
-	if (context->vcn_unified_ring)
+	if (shared_context->vcn_unified_ring)
 		amdgpu_cs_sq_head(v_context, context->ib_cpu, &len, true);
 
 	/* session info */
@@ -1141,7 +1148,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 		/* sps */
 		st_offset = len;
 		st_size = &context->ib_cpu[len++];	/* size */
-		if (context->vcn_ip_version_major == 1)
+		if (shared_context->vcn_ip_version_major == 1)
 			context->ib_cpu[len++] = 0x00000020;	/* RENCODE_IB_PARAM_DIRECT_OUTPUT_NALU vcn 1 */
 		else
 			context->ib_cpu[len++] = 0x0000000a;	/* RENCODE_IB_PARAM_DIRECT_OUTPUT_NALU other vcn */
@@ -1157,7 +1164,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 		/* pps */
 		st_offset = len;
 		st_size = &context->ib_cpu[len++];	/* size */
-		if (context->vcn_ip_version_major == 1)
+		if (shared_context->vcn_ip_version_major == 1)
 			context->ib_cpu[len++] = 0x00000020;	/* RENCODE_IB_PARAM_DIRECT_OUTPUT_NALU vcn 1*/
 		else
 			context->ib_cpu[len++] = 0x0000000a;	/* RENCODE_IB_PARAM_DIRECT_OUTPUT_NALU other vcn*/
@@ -1171,7 +1178,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	/* slice header */
 	st_offset = len;
 	st_size = &context->ib_cpu[len++];	/* size */
-	if (context->vcn_ip_version_major == 1)
+	if (shared_context->vcn_ip_version_major == 1)
 		context->ib_cpu[len++] = 0x0000000a; /* RENCODE_IB_PARAM_SLICE_HEADER vcn 1 */
 	else
 		context->ib_cpu[len++] = 0x0000000b; /* RENCODE_IB_PARAM_SLICE_HEADER vcn 2,3 */
@@ -1202,7 +1209,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	/* encode params */
 	st_offset = len;
 	st_size = &context->ib_cpu[len++];	/* size */
-	if (context->vcn_ip_version_major == 1)
+	if (shared_context->vcn_ip_version_major == 1)
 		context->ib_cpu[len++] = 0x0000000b;	/* RENCODE_IB_PARAM_ENCODE_PARAMS vcn 1*/
 	else
 		context->ib_cpu[len++] = 0x0000000f;	/* RENCODE_IB_PARAM_ENCODE_PARAMS other vcn*/
@@ -1223,7 +1230,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	st_offset = len;
 	st_size = &context->ib_cpu[len++];	/* size */
 	context->ib_cpu[len++] = 0x00200003;	/* RENCODE_H264_IB_PARAM_ENCODE_PARAMS */
-	if (context->vcn_ip_version_major <= 2) {
+	if (shared_context->vcn_ip_version_major <= 2) {
 		context->ib_cpu[len++] = 0x00000000;
 		context->ib_cpu[len++] = 0x00000000;
 		context->ib_cpu[len++] = 0x00000000;
@@ -1253,7 +1260,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	/* encode context */
 	st_offset = len;
 	st_size = &context->ib_cpu[len++];	/* size */
-	if (context->vcn_ip_version_major == 1)
+	if (shared_context->vcn_ip_version_major == 1)
 		context->ib_cpu[len++] = 0x0000000d;	/* ENCODE_CONTEXT_BUFFER  vcn 1 */
 	else
 		context->ib_cpu[len++] = 0x00000011;	/* ENCODE_CONTEXT_BUFFER  other vcn*/
@@ -1265,7 +1272,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	context->ib_cpu[len++] = 0x00000002; /* no reconstructed picture */
 	context->ib_cpu[len++] = 0x00000000;	/* reconstructed pic 1 luma offset */
 	context->ib_cpu[len++] = ALIGN(width, 256) * ALIGN(height, 32);	/* pic1 chroma offset */
-	if (context->vcn_ip_version_major == 4)
+	if (shared_context->vcn_ip_version_major == 4)
 		amdgpu_cs_vcn_ib_zero_count(context, &len, 2);
 	context->ib_cpu[len++] = ALIGN(width, 256) * ALIGN(height, 32) * 3 / 2;	/* pic2 luma offset */
 	context->ib_cpu[len++] = ALIGN(width, 256) * ALIGN(height, 32) * 5 / 2;	/* pic2 chroma offset */
@@ -1276,7 +1283,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	/* bitstream buffer */
 	st_offset = len;
 	st_size = &context->ib_cpu[len++];	/* size */
-	if (context->vcn_ip_version_major == 1)
+	if (shared_context->vcn_ip_version_major == 1)
 		context->ib_cpu[len++] = 0x0000000e;	/* VIDEO_BITSTREAM_BUFFER vcn 1 */
 	else
 		context->ib_cpu[len++] = 0x00000012;	/* VIDEO_BITSTREAM_BUFFER other vcn */
@@ -1290,7 +1297,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	/* feedback */
 	st_offset = len;
 	st_size = &context->ib_cpu[len++];	/* size */
-	if (context->vcn_ip_version_major == 1)
+	if (shared_context->vcn_ip_version_major == 1)
 		context->ib_cpu[len++] = 0x00000010;	/* FEEDBACK_BUFFER vcn 1 */
 	else
 		context->ib_cpu[len++] = 0x00000015;	/* FEEDBACK_BUFFER vcn 2,3 */
@@ -1304,7 +1311,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	/* intra refresh */
 	st_offset = len;
 	st_size = &context->ib_cpu[len++];
-	if (context->vcn_ip_version_major == 1)
+	if (shared_context->vcn_ip_version_major == 1)
 		context->ib_cpu[len++] = 0x0000000c;	/* INTRA_REFRESH vcn 1 */
 	else
 		context->ib_cpu[len++] = 0x00000010;	/* INTRA_REFRESH vcn 2,3 */
@@ -1313,7 +1320,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	context->ib_cpu[len++] = 0x00000000;
 	*st_size = (len - st_offset) * 4;
 
-	if (context->vcn_ip_version_major != 1) {
+	if (shared_context->vcn_ip_version_major != 1) {
 		/* Input Format */
 		st_offset = len;
 		st_size = &context->ib_cpu[len++];
@@ -1351,7 +1358,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 
 	*p_task_size = (len - task_offset) * 4;
 
-	if (context->vcn_unified_ring)
+	if (shared_context->vcn_unified_ring)
 		amdgpu_cs_sq_ib_tail(v_context, context->ib_cpu + len);
 
 	r = submit(device_handle, context, len, AMDGPU_HW_IP_VCN_ENC);
@@ -1367,13 +1374,17 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 
 static void
 amdgpu_cs_vcn_enc_encode(amdgpu_device_handle device_handle,
+			struct mmd_shared_context *shared_context,
 			struct mmd_context *context, struct vcn_context *v_context)
 {
-	amdgpu_cs_vcn_enc_encode_frame(device_handle, context, v_context, 2);	/* IDR frame */
+	amdgpu_cs_vcn_enc_encode_frame(device_handle, shared_context,
+			context, v_context, 2);	/* IDR frame */
 }
 
 static void
-amdgpu_cs_vcn_enc_destroy(amdgpu_device_handle device_handle, struct mmd_context *context,
+amdgpu_cs_vcn_enc_destroy(amdgpu_device_handle device_handle,
+			struct mmd_shared_context *shared_context,
+			struct mmd_context *context,
 			struct vcn_context *v_context)
 {
 	int len = 0, r;
@@ -1382,10 +1393,10 @@ amdgpu_cs_vcn_enc_destroy(amdgpu_device_handle device_handle, struct mmd_context
 	uint32_t *st_size = NULL;
 	uint32_t fw_maj = 1, fw_min = 9;
 
-	if (context->vcn_ip_version_major == 2) {
+	if (shared_context->vcn_ip_version_major == 2) {
 		fw_maj = 1;
 		fw_min = 1;
-	} else if (context->vcn_ip_version_major == 3) {
+	} else if (shared_context->vcn_ip_version_major == 3) {
 		fw_maj = 1;
 		fw_min = 0;
 	}
@@ -1395,7 +1406,7 @@ amdgpu_cs_vcn_enc_destroy(amdgpu_device_handle device_handle, struct mmd_context
 	context->resources[context->num_resources++] = v_context->enc_buf.handle;
 	context->resources[context->num_resources++] = context->ib_handle;
 
-	if (context->vcn_unified_ring)
+	if (shared_context->vcn_unified_ring)
 		amdgpu_cs_sq_head(v_context, context->ib_cpu, &len, true);
 
 	/* session info */
@@ -1426,7 +1437,7 @@ amdgpu_cs_vcn_enc_destroy(amdgpu_device_handle device_handle, struct mmd_context
 
 	*p_task_size = (len - task_offset) * 4;
 
-	if (context->vcn_unified_ring)
+	if (shared_context->vcn_unified_ring)
 		amdgpu_cs_sq_ib_tail(v_context, context->ib_cpu + len);
 
 	r = submit(device_handle, context, len, AMDGPU_HW_IP_VCN_ENC);
@@ -1441,6 +1452,7 @@ igt_main
 	amdgpu_device_handle device;
 	struct mmd_context context = {};
 	struct vcn_context v_context = {};
+	struct mmd_shared_context shared_context = {};
 	int fd = -1;
 
 	igt_fixture {
@@ -1452,33 +1464,35 @@ igt_main
 		igt_require(err == 0);
 		igt_info("Initialized amdgpu, driver version %d.%d\n",
 			 major, minor);
+		err = mmd_shared_context_init(device, &shared_context);
+		igt_require(err == 0);
 		err = mmd_context_init(device, &context);
 		igt_require(err == 0);
-		igt_skip_on(!is_vcn_tests_enable(device, &context));
-		igt_skip_on_f(!context.dec_ring && !context.enc_ring, "vcn no decorder and encoder rings\n");
+		igt_skip_on(!is_vcn_tests_enable(device, &shared_context));
+		igt_skip_on_f(!shared_context.dec_ring && !shared_context.enc_ring, "vcn no decorder and encoder rings\n");
 	}
 
 	igt_describe("Test whether vcn decorder is created, decodes, destroyed");
 	igt_subtest_with_dynamic("vcn-decoder-create-decode-destroy") {
-		if (context.dec_ring) {
+		if (shared_context.dec_ring) {
 			igt_dynamic_f("vcn-decoder-create")
-			amdgpu_cs_vcn_dec_create(device, &context, &v_context);
+			amdgpu_cs_vcn_dec_create(device, &shared_context, &context, &v_context);
 			igt_dynamic_f("vcn-decoder-decode")
-			amdgpu_cs_vcn_dec_decode(device, &context, &v_context);
+			amdgpu_cs_vcn_dec_decode(device, &shared_context, &context, &v_context);
 			igt_dynamic_f("vcn-decoder-destroy")
-			amdgpu_cs_vcn_dec_destroy(device, &context, &v_context);
+			amdgpu_cs_vcn_dec_destroy(device, &shared_context, &context, &v_context);
 		}
 	}
 
 	igt_describe("Test whether vcn encoder is created, encodes, destroyed");
 	igt_subtest_with_dynamic("vcn-encoder-create-encode-destroy") {
-		if (context.enc_ring) {
+		if (shared_context.enc_ring) {
 			igt_dynamic_f("vcn-encoder-create")
-			amdgpu_cs_vcn_enc_create(device, &context, &v_context);
+			amdgpu_cs_vcn_enc_create(device, &shared_context, &context, &v_context);
 			igt_dynamic_f("vcn-encoder-encodes")
-			amdgpu_cs_vcn_enc_encode(device, &context, &v_context);
+			amdgpu_cs_vcn_enc_encode(device, &shared_context, &context, &v_context);
 			igt_dynamic_f("vcn-encoder-destroy")
-			amdgpu_cs_vcn_enc_destroy(device, &context, &v_context);
+			amdgpu_cs_vcn_enc_destroy(device, &shared_context, &context, &v_context);
 		}
 	}
 
diff --git a/tests/amdgpu/amd_vpe.c b/tests/amdgpu/amd_vpe.c
index b922af3b7..5c58c0dd8 100644
--- a/tests/amdgpu/amd_vpe.c
+++ b/tests/amdgpu/amd_vpe.c
@@ -51,7 +51,7 @@ static uint32_t vpe_config[] = {
 };
 
 static bool is_vpe_tests_enabled(amdgpu_device_handle device_handle,
-				 struct mmd_context *context)
+		struct mmd_shared_context *shared_context)
 {
 	struct drm_amdgpu_info_hw_ip info;
 	int r;
@@ -59,11 +59,11 @@ static bool is_vpe_tests_enabled(amdgpu_device_handle device_handle,
 	r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_VPE, 0, &info);
 	igt_assert_eq(r, 0);
 
-	context->vpe_ip_version_major = info.hw_ip_version_major;
-	context->vpe_ip_version_minor = info.hw_ip_version_minor;
-	context->vpe_ring = !!info.available_rings;
+	shared_context->vpe_ip_version_major = info.hw_ip_version_major;
+	shared_context->vpe_ip_version_minor = info.hw_ip_version_minor;
+	shared_context->vpe_ring = !!info.available_rings;
 
-	if (!context->vpe_ring) {
+	if (!shared_context->vpe_ring) {
 		igt_info("VPE no available rings");
 		igt_info("VPE fence test disable");
 		igt_info("VPE blit test disable");
@@ -142,7 +142,7 @@ static int check_argb8888(void *addr, uint32_t width, uint32_t height)
 }
 
 static void amdgpu_cs_vpe_blit(amdgpu_device_handle device_handle,
-			       struct mmd_context *context)
+				struct mmd_context *context)
 {
 	const uint32_t vpep_config_offsets[] = {0x34, 0x128, 0x184, 0x1c0};
 	struct amdgpu_mmd_bo vpe_config_bo, src_plane_bo, dst_plane_bo;
@@ -218,6 +218,7 @@ static void amdgpu_cs_vpe_blit(amdgpu_device_handle device_handle,
 igt_main
 {
 	struct mmd_context context = {};
+	struct mmd_shared_context shared_context = {};
 	amdgpu_device_handle device;
 	int fd = -1;
 
@@ -233,10 +234,12 @@ igt_main
 
 		igt_info("Initialized amdgpu, driver version %d.%d\n", major, minor);
 
+		r = mmd_shared_context_init(device, &shared_context);
+		igt_require(r == 0);
 		r = mmd_context_init(device, &context);
 		igt_require(r == 0);
 
-		igt_skip_on(!is_vpe_tests_enabled(device, &context));
+		igt_skip_on(!is_vpe_tests_enabled(device, &shared_context));
 	}
 
 	igt_describe("Test VPE fence");
-- 
2.25.1

