Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF3CC48286
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 04:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24F010E3A5;
	Thu,  1 Feb 2024 04:53:55 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FBE10E3A5
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 04:53:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YitAOkECdQOnTXy5A8NEgd0xEclN+IMWQPIKm60yb4tbipeUCDYt2RbzJWucIXSEKLDYDt0UZKv+M8wW4sPBI6CVl04MRN2X4pRjsDN0QU4W/hsgOkaGTe5Sr3NcbTDCl1E8AFoR9SlrmIx5B+pa0UannQmpU9WmnNvJB4ZmiHTUQNF8ULZkW3MGo2VLD5gUi3cEF7CarIuzEELu0TNUg6M8YIY6lDNFU12UYBppcBKjCKoEO8dQ/j2Z8ymiiLerYjnkwUwrSSkvmC0XhWStqONgN9B354yOlwkZ7IQMadYqtH+sTt0fHi1Mf7k5i/auiuDqYBb13Ca2dpaLBarAvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5RcesryyQBQtI3eKm+wKHsIYzrbncWq8vzMnGSfz7s=;
 b=A5pGhhFDu27cJS64njNS6dZ+mVu4XlU0ppcVXGVZXgMsa03HnoNjMO07G2Tsaj//LFhQi0W+jf3qZLryVprlhAaAihyueCVmL20+JQUvGVXY+Eq7CeZbv0HDVIP2zoZ7hnmu+Y/y6LLurenpsj8ZOcGrE/JUyxSdLVpR3VJVkZ4Ol7C+poOkPX1ynBZoShNgjVeazsCUP4dEnXdwTzibENhh0JsMgvR/S/7ZqjjY6h2eHc8zoDNVldJTIQ+iRNDaNCrbB5VpgSaC0iLG0YHybK1UPTjav8ZSpco5W4rue6rXCCDU2zSRjKWfrNMtlBXPUrKLYDtIRGlfiFw8MfnbPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5RcesryyQBQtI3eKm+wKHsIYzrbncWq8vzMnGSfz7s=;
 b=Pf2u7jtaN4bRAJIKdKu2ph411AtKvV+us520W/AwHh7Uj8YplYzEwgGKYoRs0dAn06LWMKwvXb7IWeRkl2EVt7ZigX3nWOUAxYzZmiP+xaEOXFhSRm/2VweOs0SPXmiN4TtE9FYpVU8nqgeXukQ4Wu4B+ZXUh7WSG3GvuUMnkZ8=
Received: from SJ0PR05CA0147.namprd05.prod.outlook.com (2603:10b6:a03:33d::32)
 by SJ2PR12MB8134.namprd12.prod.outlook.com (2603:10b6:a03:4fa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Thu, 1 Feb
 2024 04:53:49 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::40) by SJ0PR05CA0147.outlook.office365.com
 (2603:10b6:a03:33d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23 via Frontend
 Transport; Thu, 1 Feb 2024 04:53:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7228.16 via Frontend Transport; Thu, 1 Feb 2024 04:53:49 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 22:53:46 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 22:53:34 -0600
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 31 Jan 2024 22:53:34 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH 2/3] lib/amdgpu: add a CS helper function
Date: Wed, 31 Jan 2024 23:53:29 -0500
Message-ID: <20240201045330.610006-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240201045330.610006-1-vitaly.prosyak@amd.com>
References: <20240201045330.610006-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|SJ2PR12MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 690380d7-aa74-471a-9e02-08dc22e1c7ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gI0ZKXV8KaXyK5TQljSMRZo0qXMdMb30PuDIfXcmmggFmsBp0l9ekbnXfNTJOhKZdLc4/ISNiDRCs4D15Nt0qmfSgpQTc5lcbbXEUK1/NlmRbicQIYKjTdlMgxBGYNWZp+E+9Q1EKFA+yOAGOX3wvope9ihtAjJo5mld66KV76NqEdiYZwBfgMQ2x9q1wX2tpOSS7kIlVbPTRYgWKL8r149hnFhvE9H5D5V9Bs+oZ6ZU1ErOPJK0lrgRP+AXmHD2zlTMpOVyrwMMusocKvWPo6UhfTYSp3elVkjRNufX9WfxFD1dLlrneC38kfJx1tX9IMFjbf4DoblArlfBxMToZvDIifSfq0B4eAwIHR+RRmDvRNe5E2QjHiq+7etqNpri91KwgRpx35abjcu7nuwz76lWMTmIJFl4OrPSRxTY/qlYrVX1Pw1Q68IfnQTQeePCV9QODQ4UJ7cWWwUzg6Bxbm3b/1tuvvbAB8Xl8ga64pXUE+oIbcZxdf9d+3di/SO64i/wOu47zzWqWN8YOQJ5fcokKy6K0YNnIA8wI/MNe9nh3b8KKuO9ncfYmxFL28T7yTGRxDn7Opg8v8kGFG4mIan8EP3hjiJKeaFVKW33+hU0jB42wHfkWmMAXMI0yWdUm0lyhjKsebnbcqBhgCV/GGL4jYbSKC/WWm2/Qs+PiMzFjNKpkL4ED3BlZuLBgfZCzVvwPwmdauA0Qv5twlwdwTIn0mSD67TxnDMOawLV42lJjcWVlCq50Uu69oNWP2w3ekvDyzoLZXXT/pBAb/i5Xw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(346002)(39860400002)(376002)(230922051799003)(451199024)(186009)(82310400011)(1800799012)(64100799003)(46966006)(40470700004)(36840700001)(316002)(4326008)(54906003)(6916009)(70586007)(8936002)(70206006)(8676002)(36756003)(478600001)(86362001)(5660300002)(2906002)(41300700001)(2876002)(30864003)(40460700003)(336012)(83380400001)(40480700001)(47076005)(1076003)(2616005)(426003)(82740400003)(81166007)(356005)(36860700001)(26005)(7696005)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 04:53:49.5586 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 690380d7-aa74-471a-9e02-08dc22e1c7ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8134
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
Cc: Pierre-eric Pelloux <pierre-eric.pelloux-prayer@amd.com>, Christian
 Koenig <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Marek Olsak <marek.olsak@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Add a cs helper function.
CS helper function works as RADV
radv_amdgpu_cs_submit. We want to validate
and ensure the integrity of the following
functionalities when  the following method
is called 'amdgpu_cs_submit_raw2':

1. Gang submission when several different IPs are into
   a single command, but those IPs are shared the
   instance and ring numbers(ip_instance, ring).
2. Use 'AMDGPU_CHUNK_ID_BO_HANDLES' vs explicit parameter into 'amdgpu_cs_submit_raw2'.
3. Not use  'AMDGPU_CHUNK_ID_DEPENDENCIES'.
4. User fence always present except for multimedia ring commands.

RADV uses those scenarios.

Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Marek Olsak <marek.olsak@amd.com>
Cc: Pierre-eric Pelloux <pierre-eric.pelloux-prayer@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_cs_radv.c   | 241 +++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_cs_radv.h   | 112 +++++++++++++++++
 lib/amdgpu/amd_ip_blocks.h |   2 +
 lib/meson.build            |   1 +
 4 files changed, 356 insertions(+)
 create mode 100644 lib/amdgpu/amd_cs_radv.c
 create mode 100644 lib/amdgpu/amd_cs_radv.h

diff --git a/lib/amdgpu/amd_cs_radv.c b/lib/amdgpu/amd_cs_radv.c
new file mode 100644
index 000000000..97fda195a
--- /dev/null
+++ b/lib/amdgpu/amd_cs_radv.c
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ */
+#include <time.h>
+#include <sys/time.h>
+#include <amdgpu_drm.h>
+
+#include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_sdma.h"
+#include "lib/amdgpu/amd_PM4.h"
+#include "lib/amdgpu/amd_cs_radv.h"
+
+#define TIME_MONOTONIC 2
+#define OS_TIMEOUT_INFINITE 0xffffffffffffffffull
+
+static bool
+amdgpu_cs_has_user_fence(struct amdgpu_cs_request_radv *request)
+{
+	return request->ip_type != AMDGPU_HW_IP_UVD && request->ip_type != AMDGPU_HW_IP_VCE &&
+			request->ip_type != AMDGPU_HW_IP_UVD_ENC && request->ip_type != AMDGPU_HW_IP_VCN_DEC &&
+			request->ip_type != AMDGPU_HW_IP_VCN_ENC && request->ip_type != AMDGPU_HW_IP_VCN_JPEG;
+}
+
+static int64_t
+os_time_get_nano(void)
+{
+	struct timespec ts;
+
+	timespec_get(&ts, TIME_MONOTONIC);
+	return ts.tv_nsec + ts.tv_sec*INT64_C(1000000000);
+}
+
+static int64_t
+os_time_get_absolute_timeout(uint64_t timeout)
+{
+	int64_t time, abs_timeout;
+
+	/* Also check for the type upper bound. */
+	if (timeout == OS_TIMEOUT_INFINITE || timeout > INT64_MAX)
+		return OS_TIMEOUT_INFINITE;
+
+	time = os_time_get_nano();
+	abs_timeout = time + (int64_t)timeout;
+
+	/* Check for overflow. */
+	if (abs_timeout < time)
+		return OS_TIMEOUT_INFINITE;
+
+	return abs_timeout;
+}
+
+static void
+os_time_sleep(int64_t usecs)
+{
+	struct timespec time;
+
+	time.tv_sec = usecs / 1000000;
+	time.tv_nsec = (usecs % 1000000) * 1000;
+	while (clock_nanosleep(CLOCK_MONOTONIC, 0, &time, &time) == EINTR)
+		;
+}
+
+uint32_t
+amdgpu_get_bo_handle(struct amdgpu_bo *bo)
+{
+	uint32_t handle;
+	int r;
+
+	r = amdgpu_bo_export(bo, amdgpu_bo_handle_type_kms, &handle);
+	igt_assert_eq(r, 0);
+	return handle;
+}
+
+static uint32_t
+radv_to_amdgpu_priority(enum amdgpu_ctx_priority_radv radv_priority)
+{
+	switch (radv_priority) {
+	case AMDGPU_IGT_CTX_PRIORITY_REALTIME:
+		return AMDGPU_CTX_PRIORITY_VERY_HIGH;
+	case AMDGPU_IGT_CTX_PRIORITY_HIGH:
+		return AMDGPU_CTX_PRIORITY_HIGH;
+	case AMDGPU_IGT_CTX_PRIORITY_MEDIUM:
+		return AMDGPU_CTX_PRIORITY_NORMAL;
+	case AMDGPU_IGT_CTX_PRIORITY_LOW:
+		return AMDGPU_CTX_PRIORITY_LOW;
+	default:
+		return AMDGPU_CTX_PRIORITY_NORMAL;
+	}
+}
+
+uint32_t
+amdgpu_ctx_radv_create(amdgpu_device_handle device,
+		enum amdgpu_ctx_priority_radv priority, struct amdgpu_ctx_radv **rctx)
+{
+	struct amdgpu_ctx_radv *ctx;
+	uint32_t amdgpu_priority, r;
+
+	ctx = calloc(1, sizeof(*ctx));
+	igt_assert(ctx);
+	ctx->fence_bo = calloc(1, sizeof(*ctx->fence_bo));
+	igt_assert(ctx->fence_bo);
+
+	amdgpu_priority = radv_to_amdgpu_priority(priority);
+	r = amdgpu_cs_ctx_create2(device, amdgpu_priority, &ctx->ctx);
+
+	assert(AMDGPU_HW_IP_NUM * MAX_RINGS_PER_TYPE * 4 * sizeof(uint64_t) <= 4096);
+	ctx->fence_bo->size = 4096;
+
+	ctx->fence_bo->bo = gpu_mem_alloc(device, ctx->fence_bo->size, 8, AMDGPU_GEM_DOMAIN_GTT,
+			AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED, &ctx->fence_bo->vmc_addr,
+			&ctx->fence_bo->va_handle);
+
+	*rctx = ctx;
+	return r;
+
+}
+
+void
+amdgpu_ctx_radv_destroy(amdgpu_device_handle device, struct amdgpu_ctx_radv *rwctx)
+{
+	unsigned int ip, ring;
+
+	for (ip = 0; ip <= AMDGPU_HW_IP_NUM; ++ip) {
+		for (ring = 0; ring < MAX_RINGS_PER_TYPE; ++ring) {
+			if (rwctx->queue_syncobj[ip][ring])
+				amdgpu_cs_destroy_syncobj(device, rwctx->queue_syncobj[ip][ring]);
+		}
+	}
+	gpu_mem_free(rwctx->fence_bo->bo,
+				rwctx->fence_bo->va_handle,
+				rwctx->fence_bo->vmc_addr,
+				rwctx->fence_bo->size);
+	free(rwctx->fence_bo);
+	amdgpu_cs_ctx_free(rwctx->ctx);
+	free(rwctx);
+}
+
+uint32_t
+amdgpu_cs_submit_radv(amdgpu_device_handle dev, struct amdgpu_ring_context *ring_context,
+		struct amdgpu_cs_request_radv *request, struct amdgpu_ctx_radv *ctx)
+{
+	int r, num_chunks,  size, i;
+	struct drm_amdgpu_cs_chunk *chunks;
+	struct drm_amdgpu_cs_chunk_data *chunk_data;
+	struct drm_amdgpu_bo_list_in bo_list_in;
+	struct amdgpu_cs_fence_info fence_info;
+	uint32_t result = 0;
+	uint64_t abs_timeout_ns;
+	bool has_user_fence;
+
+	has_user_fence = amdgpu_cs_has_user_fence(request);
+	size = request->number_of_ibs + 1 + (has_user_fence ? 1 : 0) + 1 /* bo list */ + 3;
+	chunks = malloc(sizeof(chunks[0]) * size);
+	size = request->number_of_ibs + (has_user_fence ? 1 : 0);
+	chunk_data = malloc(sizeof(chunk_data[0]) * size);
+
+	num_chunks = request->number_of_ibs;
+	for (i = 0; i < request->number_of_ibs; i++) {
+
+		struct amdgpu_cs_ib_info_radv *ib;
+
+		chunks[i].chunk_id = AMDGPU_CHUNK_ID_IB;
+		chunks[i].length_dw = sizeof(struct drm_amdgpu_cs_chunk_ib) / 4;
+		chunks[i].chunk_data = (uint64_t)(uintptr_t)&chunk_data[i];
+
+		ib = &request->ibs[i];
+		assert(ib->size);
+
+		chunk_data[i].ib_data._pad = 0;
+		chunk_data[i].ib_data.va_start = ib->ib_mc_address;
+		chunk_data[i].ib_data.ib_bytes = ib->size * 4;
+		chunk_data[i].ib_data.ip_type = ib->ip_type;
+		chunk_data[i].ib_data.flags = ib->flags;
+
+		chunk_data[i].ib_data.ip_instance = request->ip_instance;
+		chunk_data[i].ib_data.ring = request->ring;
+	}
+
+	assert(chunk_data[request->number_of_ibs - 1].ib_data.ip_type == request->ip_type);
+
+	if (has_user_fence) {
+		i = num_chunks++;
+		chunks[i].chunk_id = AMDGPU_CHUNK_ID_FENCE;
+		chunks[i].length_dw = sizeof(struct drm_amdgpu_cs_chunk_fence) / 4;
+		chunks[i].chunk_data = (uint64_t)(uintptr_t)&chunk_data[i];
+
+		fence_info.handle = ctx->fence_bo->bo;
+		/* Need to reserve 4 QWORD for user fence:
+		 * QWORD[0]: completed fence
+		 * QWORD[1]: preempted fence
+		 * QWORD[2]: reset fence
+		 * QWORD[3]: preempted then reset
+		 */
+		fence_info.offset = (request->ip_type * MAX_RINGS_PER_TYPE + request->ring) * 4;
+		amdgpu_cs_chunk_fence_info_to_data(&fence_info, &chunk_data[i]);
+	}
+
+	bo_list_in.operation = ~0;
+	bo_list_in.list_handle = ~0;
+	bo_list_in.bo_number = request->num_handles;
+	bo_list_in.bo_info_size = sizeof(struct drm_amdgpu_bo_list_entry);
+	bo_list_in.bo_info_ptr = (uint64_t)(uintptr_t)request->handles;
+
+	chunks[num_chunks].chunk_id = AMDGPU_CHUNK_ID_BO_HANDLES;
+	chunks[num_chunks].length_dw = sizeof(struct drm_amdgpu_bo_list_in) / 4;
+	chunks[num_chunks].chunk_data = (uintptr_t)&bo_list_in;
+	num_chunks++;
+
+	/* The kernel returns -ENOMEM with many parallel processes using GDS such as test suites quite
+	 * often, but it eventually succeeds after enough attempts. This happens frequently with dEQP
+	 * using NGG streamout.
+	 */
+	 abs_timeout_ns = os_time_get_absolute_timeout(1000000000ull); /* 1s */
+
+	r = 0;
+	do {
+		/* Wait 1 ms and try again. */
+		if (r == -ENOMEM)
+			os_time_sleep(1000);
+
+		r = amdgpu_cs_submit_raw2(dev, ctx->ctx, 0,
+				num_chunks, chunks, &request->seq_no);
+	} while (r == -ENOMEM && os_time_get_nano() < abs_timeout_ns);
+
+	if (r) {
+		if (r == -ENOMEM) {
+			igt_info("igt/amdgpu: Not enough memory for command submission.\n");
+			result = ENOMEM;
+		} else if (r == -ECANCELED) {
+			igt_info("igt/amdgpu: The CS has been cancelled because the context is lost.\n");
+			result = ECANCELED;
+		} else {
+			igt_info("igt/amdgpu: The CS has been rejected, see dmesg for more information (%i).\n", r);
+			result = EINVAL;
+		}
+	}
+	free(chunks);
+	free(chunk_data);
+	return result;
+}
diff --git a/lib/amdgpu/amd_cs_radv.h b/lib/amdgpu/amd_cs_radv.h
new file mode 100644
index 000000000..044f49f7b
--- /dev/null
+++ b/lib/amdgpu/amd_cs_radv.h
@@ -0,0 +1,112 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ */
+
+#ifndef AMD_CS_RADV
+#define AMD_CS_RADV
+
+#include "amd_ip_blocks.h"
+#define AMDGPU_CS_GANG_SIZE	4
+
+enum amdgpu_ctx_priority_radv {
+	AMDGPU_IGT_CTX_PRIORITY_LOW = 0,
+	AMDGPU_IGT_CTX_PRIORITY_MEDIUM,
+	AMDGPU_IGT_CTX_PRIORITY_HIGH,
+	AMDGPU_IGT_CTX_PRIORITY_REALTIME,
+};
+
+struct amdgpu_cs_ib_info_radv {
+	int64_t flags;
+	uint64_t ib_mc_address;
+	uint32_t size;
+	enum amd_ip_block_type ip_type;
+};
+
+enum { MAX_RINGS_PER_TYPE = 8 };
+
+struct amdgpu_fence_radv {
+	struct amdgpu_cs_fence fence;
+};
+
+struct amdgpu_winsys_bo_radv {
+	amdgpu_va_handle va_handle;
+	uint64_t vmc_addr;
+	uint64_t size;
+	bool is_virtual;
+	uint8_t priority;
+
+	union {
+		/* physical bo */
+		struct {
+			amdgpu_bo_handle bo;
+			uint32_t bo_handle;
+		};
+		/* virtual bo */
+		struct {
+			uint32_t range_count;
+			uint32_t range_capacity;
+			struct amdgpu_winsys_bo_radv **bos;
+			uint32_t bo_count;
+			uint32_t bo_capacity;
+		};
+	};
+};
+
+
+struct amdgpu_ctx_radv {
+	amdgpu_context_handle ctx;
+	struct amdgpu_fence_radv last_submission[AMDGPU_HW_IP_NUM + 1][MAX_RINGS_PER_TYPE];
+	struct amdgpu_winsys_bo_radv *fence_bo;
+
+	uint32_t queue_syncobj[AMDGPU_HW_IP_NUM + 1][MAX_RINGS_PER_TYPE];
+	bool queue_syncobj_wait[AMDGPU_HW_IP_NUM + 1][MAX_RINGS_PER_TYPE];
+};
+
+
+
+struct amdgpu_cs_request_radv {
+	/** Specify HW IP block type to which to send the IB. */
+	uint32_t ip_type;
+
+	/** IP instance index if there are several IPs of the same type. */
+	uint32_t ip_instance;
+
+	/**
+	 * Specify ring index of the IP. We could have several rings
+	 * in the same IP. E.g. 0 for SDMA0 and 1 for SDMA1.
+	 */
+	uint32_t ring;
+
+	/**
+	 * BO list handles used by this request.
+	 */
+	struct drm_amdgpu_bo_list_entry *handles;
+	uint32_t num_handles;
+
+	/** Number of IBs to submit in the field ibs. */
+	uint32_t number_of_ibs;
+
+	/**
+	 * IBs to submit. Those IBs will be submitted together as single entity
+	 */
+	struct amdgpu_cs_ib_info_radv ibs[AMDGPU_CS_GANG_SIZE];
+	/**
+	 * The returned sequence number for the command submission
+	 */
+	uint64_t seq_no;
+};
+
+uint32_t
+amdgpu_get_bo_handle(struct amdgpu_bo *bo);
+
+uint32_t
+amdgpu_ctx_radv_create(amdgpu_device_handle device,
+		enum amdgpu_ctx_priority_radv priority, struct amdgpu_ctx_radv **rctx);
+void
+amdgpu_ctx_radv_destroy(amdgpu_device_handle device, struct amdgpu_ctx_radv *rwctx);
+
+uint32_t
+amdgpu_cs_submit_radv(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
+		struct amdgpu_cs_request_radv *request,  struct amdgpu_ctx_radv *ctx);
+
+#endif
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 4cad30d1e..97a9ad489 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -20,7 +20,9 @@ enum amd_ip_block_type {
 	AMD_IP_UVD_ENC,
 	AMD_IP_VCN_DEC,
 	AMD_IP_VCN_ENC,
+	AMD_IP_VCN_UNIFIED = AMD_IP_VCN_ENC,
 	AMD_IP_VCN_JPEG,
+	AMD_IP_VPE,
 	AMD_IP_MAX,
 };
 
diff --git a/lib/meson.build b/lib/meson.build
index 0fc11b26c..6122861d8 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -144,6 +144,7 @@ if libdrm_amdgpu.found()
 		'amdgpu/amd_memory.c',
 		'amdgpu/amd_command_submission.c',
 		'amdgpu/amd_compute.c',
+		'amdgpu/amd_cs_radv.c',
 		'amdgpu/amd_gfx.c',
 		'amdgpu/amd_ip_blocks.c',
 		'amdgpu/amd_shaders.c',
-- 
2.25.1

