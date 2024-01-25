Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF18CC47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 03:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2DA10EB6C;
	Thu, 25 Jan 2024 03:44:26 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBD810EECC
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 03:44:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ht51AouunWPRtenZJ/rKlmZq6Xd+7RzsWdzFskRMXvMhiid62vEWuXD2fRZ9m9CEayD6Qv4cHBv6asLUqGklAskFvUbrJm2ak59tPiS7ONCW96Rfl7Fzhqz1M4GKUwqY01KYKYVbWOmZfMyWr4wzaC6SeL2luSayDaOZUMsUm3EsMxXS03iZnL90nOn4ThE0LQ1/zPYXNZ9BvYjL6cgdv1QESEbXK/JqIPQ6wEKvggcWICUiXs4VE4WD9wLOPpxqWHGUDpkHeF4xjIwsnceStGs///QuOiWObY2RNrnxV+5clJNvE9z+DBPzbUiAZiox8R6QZ5DSMXHBj3EmDLvREg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJNsCFofJo2ZNvQuBjdTF4wo5GIsxkzWf1kpULe/wSs=;
 b=kmRSaZI08zMxKvEA148x7SXyPQ3dO0RN3xSinTEfdl2gK7tHapsWxb7aeH7zAr5uF2o4W4Ff/AbJgFtOnQoMswIVTljQ8RLK8084BOwx5GEX0+DV9bCLD3mArr2Ba2sIL4QOU0l5MmgWXYb0gFa63W0tCc7ou+Edvz0/rf5t6RUIYOSr5oWNSFOy96iwBDPQaM6sgbHRfrcUghUupIbyaIIxkYuy0kO9+9WsWgwczUVTMgjn2LVzWNQXoS8FlV4BkCrcRvTloUwDPUx1BPz0vBcw7LjmSRBr617q/A4UHE2ICsYPY1ux6WMJmMJP48GSlEqnfC/twDO5BxLbzJHP5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJNsCFofJo2ZNvQuBjdTF4wo5GIsxkzWf1kpULe/wSs=;
 b=i1Pja5HCj7WIhtLALweudFlydzqlbvbt9QoXEn9sZ3/WtJTttv9GyReFnO4tyNl7p83sIMfuqsD94SiPUTEj+8oEthmYyfE2OTnkG9tB3RT4kT5JxtP1zKR5pJ7BK+rmfqbBhI8gL5jdS3YYqh6tp5H32AD3X2hgQ25nNKiRCc8=
Received: from CY5P221CA0048.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:4::14) by
 DS0PR12MB9447.namprd12.prod.outlook.com (2603:10b6:8:1b4::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.37; Thu, 25 Jan 2024 03:44:22 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:930:4:cafe::90) by CY5P221CA0048.outlook.office365.com
 (2603:10b6:930:4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22 via Frontend
 Transport; Thu, 25 Jan 2024 03:44:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Thu, 25 Jan 2024 03:44:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 24 Jan
 2024 21:44:18 -0600
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 24 Jan 2024 21:44:18 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH 3/3] tests/amdgpu: add gang cs test
Date: Wed, 24 Jan 2024 22:44:13 -0500
Message-ID: <20240125034413.232349-3-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240125034413.232349-1-vitaly.prosyak@amd.com>
References: <20240125034413.232349-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|DS0PR12MB9447:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bd8e0af-7a33-49cb-b109-08dc1d57eaeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q3yBhFtoLiCvvnl4Wlk2ay52fzuHt5/Jk5VSamU0qV03vs4LTNFOL17l2zkmB3mhyzb60Jxzqfc/GnB4PAEvllfcEXfGAFLommMwO5hpV71fe1dAb0EzSWQ9ChR8KqmyRH3cV+29yBlX0w04NzcctRk9EQ6ZrJBQFFM9XpQ6BeMNwrs4ob7eG8kDUhP/Xokre5WH7dH3EDAOR1Jj3tpP/EX56nYXG+WlFJUKo7m0VGP9C0YjdQ2Tc3ZyHkvB3dvheapZRAhNVqLni062pqMPJAVhuReVa++Jx2IMVzecUP8cdnPAYPoSHtAeYdNjY0h88oFg9jWaWfbaDrHvIib2U5dvKHIW3VS6KPyeMSxBIuAk6fw0h0Y9gKoKNhRc7q8UerQgeXShwqoxp5h3jkK2XcPPHYEFsx0iaxsBn+Iev0i9K9iJui5QDRYX0PLBQ8Tv315i7oEkF6nHgnVa7wNsS/rBHTiXbaUfj2ZHaA/UBh1r+OjG3jp1WiTTpAVC4ggH45QNyG5Lc1G59PNITN3ysA6nAWhlafrijNySH28eGCgXy23dtnMaoLaSGZWjPnFl+1LYhGqaebHMDciyvZbFFVtEt1kUPC2p8jncm3MjdRqvwOKCchJ20UpYoFd40G5wRxTeMi/Tee8ARZ6pky8qcvu5Yd1u3m8BsN0GSMI35vTiZAQ4c5oK8rpDj9pCZ0T9X5cM9aZ+RGmn3QA/DxVtpi+XZVoMhEUJ/G2TXTfEYGbRYaGQ/SAldvazREHN5JPlfuv3zYQ+9H05g5Rj7TY7nUx5gfpXiEcoD0uiWKVf10RquF18BlfxgeTid0ibukVj
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(230173577357003)(230273577357003)(230922051799003)(82310400011)(64100799003)(186009)(451199024)(1800799012)(36840700001)(46966006)(40470700004)(8936002)(2876002)(83380400001)(4326008)(8676002)(82740400003)(81166007)(2906002)(356005)(36756003)(41300700001)(86362001)(36860700001)(47076005)(316002)(5660300002)(70586007)(70206006)(6916009)(54906003)(2616005)(1076003)(7696005)(6666004)(478600001)(40460700003)(40480700001)(336012)(426003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 03:44:21.9505 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd8e0af-7a33-49cb-b109-08dc1d57eaeb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9447
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>, Christian
 Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Add gang command submission test.
We submit ibs from different HW IP as a single command.
The test submits the copy command to the gfx ring and then
waits for the completion of another copy command to the compute
ring which takes longer due to its much bigger copy size.
So the copy commands are executed on COMPUTE and GFX ring as a
single command from the user.

Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Acked-by: Christian Koenig <christian.koenig@amd.com>
---
 tests/amdgpu/amd_gang_cs.c | 225 +++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build   |   2 +-
 2 files changed, 226 insertions(+), 1 deletion(-)
 create mode 100644 tests/amdgpu/amd_gang_cs.c

diff --git a/tests/amdgpu/amd_gang_cs.c b/tests/amdgpu/amd_gang_cs.c
new file mode 100644
index 000000000..f01074e30
--- /dev/null
+++ b/tests/amdgpu/amd_gang_cs.c
@@ -0,0 +1,225 @@
+// SPDX-License-Identifier: MIT
+// Copyright 2023 Advanced Micro Devices, Inc.
+
+#include "igt.h"
+#include "drmtest.h"
+#include <amdgpu.h>
+#include <amdgpu_drm.h>
+#include "lib/amdgpu/amd_PM4.h"
+#include "lib/amdgpu/amd_ip_blocks.h"
+#include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_cs_radv.h"
+
+#define IB_SIZE	4096
+
+static void
+prepare_compute_cp_packet(amdgpu_device_handle device,
+		struct amdgpu_ring_context *ring_context,
+		const struct amdgpu_ip_block_version *ip_block)
+{
+	int r;
+
+	/* allocate buffer for compute  ring*/
+	r = amdgpu_bo_alloc_and_map(device,
+					ring_context->write_length * sizeof(uint32_t),
+					IB_SIZE, AMDGPU_GEM_DOMAIN_GTT, 0,
+					&ring_context->bo, (void **)&ring_context->bo_cpu,
+					&ring_context->bo_mc, &ring_context->va_handle);
+	igt_assert_eq(r, 0);
+	memset((void *)ring_context->bo_cpu, 0,
+			ring_context->write_length * sizeof(uint32_t));
+
+	/* allocate buffer for pm4 packet for compute ring*/
+	r = amdgpu_bo_alloc_and_map(device, IB_SIZE + ring_context->write_length *
+					sizeof(uint32_t),
+					IB_SIZE, AMDGPU_GEM_DOMAIN_GTT, 0,
+					&ring_context->bo2, (void **)&ring_context->bo2_cpu,
+					&ring_context->bo_mc2, &ring_context->va_handle2);
+	igt_assert_eq(r, 0);
+
+	memset((void *)ring_context->bo2_cpu, 0,
+				ring_context->write_length * sizeof(uint32_t));
+	/* assign fields used by ASIC dependent function */
+	ring_context->pm4 = (uint32_t *)ring_context->bo2_cpu;
+	ip_block->funcs->write_linear(ip_block->funcs, ring_context,
+				&ring_context->pm4_dw);
+}
+
+static void
+prepare_gfx_cp_mem_packet(amdgpu_device_handle device,
+		struct amdgpu_ring_context *ring_context,
+		const struct amdgpu_ip_block_version *ip_block)
+{
+	int r;
+	uint32_t write_length;
+	uint64_t bo_mc;
+
+	/* allocate buffer for gfx  */
+	r = amdgpu_bo_alloc_and_map(device,
+					ring_context->write_length2 * sizeof(uint32_t),
+					IB_SIZE, AMDGPU_GEM_DOMAIN_GTT, 0,
+					&ring_context->bo3, (void **)&ring_context->bo3_cpu,
+					&ring_context->bo_mc3, &ring_context->va_handle3);
+	igt_assert_eq(r, 0);
+	memset((void *)ring_context->bo3_cpu, 0,
+			ring_context->write_length2 * sizeof(uint32_t));
+
+	/* allocate buffer for pm4 packet gfx*/
+	r = amdgpu_bo_alloc_and_map(device,  IB_SIZE + ring_context->write_length2 *
+					sizeof(uint32_t),
+					IB_SIZE, AMDGPU_GEM_DOMAIN_GTT, 0,
+					&ring_context->bo4, (void **)&ring_context->bo4_cpu,
+					&ring_context->bo_mc4, &ring_context->va_handle4);
+	igt_assert_eq(r, 0);
+	memset((void *)ring_context->bo4_cpu, 0,
+			ring_context->write_length2 * sizeof(uint32_t));
+	/* assign fields used by ASIC dependent functions */
+	ring_context->pm4 = (uint32_t *)ring_context->bo4_cpu;
+	bo_mc = ring_context->bo_mc;
+	ring_context->bo_mc = ring_context->bo_mc3;
+	write_length = ring_context->write_length;
+	ring_context->write_length = ring_context->write_length2;
+
+	ip_block->funcs->write_linear(ip_block->funcs, ring_context,
+				&ring_context->pm4_dw2);
+	/* addr -1 of compute buf*/
+	ring_context->bo_mc = bo_mc + (write_length - 1) * 4;
+	ip_block->funcs->wait_reg_mem(ip_block->funcs, ring_context,
+				&ring_context->pm4_dw2);
+	ring_context->bo_mc = bo_mc;
+}
+
+static void
+amdgpu_cs_gang(amdgpu_device_handle device)
+{
+	/* keep as big as ib can hold for compute write data packet so that even
+	 * for powerful gpu, wait_data packet in gfx queue will have need to wait.
+	 */
+	const int sdma_write_length_compute = IB_SIZE * 3;
+	/* keep it small for gfx write data packet so that gfx need to wait for compute */
+	const int sdma_write_length_gfx = 4;
+
+	struct amdgpu_cs_request_radv request;
+	struct drm_amdgpu_bo_list_entry bo_handles[2] = {0};
+	struct amdgpu_ring_context *ring_context = NULL;
+
+	int r;
+
+	const struct amdgpu_ip_block_version *gfx_ip_block =
+			get_ip_block(device, AMD_IP_GFX);
+	const struct amdgpu_ip_block_version *compute_ip_block =
+			get_ip_block(device, AMD_IP_COMPUTE);
+
+	struct amdgpu_cs_fence fence_status = {0};
+	uint32_t expired;
+
+	memset(&request, 0, sizeof(request));
+	ring_context = malloc(sizeof(*ring_context));
+	memset(ring_context, 0, sizeof(*ring_context));
+	ring_context->write_length = sdma_write_length_compute;
+	ring_context->write_length2 = sdma_write_length_gfx;
+
+	r = amdgpu_cs_ctx_create(device, &ring_context->context_handle);
+	igt_assert_eq(r, 0);
+
+	prepare_compute_cp_packet(device, ring_context, compute_ip_block);
+	prepare_gfx_cp_mem_packet(device, ring_context, gfx_ip_block);
+
+	request.number_of_ibs = 2;
+
+	request.ibs[0].ib_mc_address = ring_context->bo_mc2; /* pm4 packet addr compute */
+	request.ibs[0].size = ring_context->pm4_dw; /* size p4 compute */
+	request.ibs[0].ip_type = AMDGPU_HW_IP_COMPUTE;
+
+	request.ibs[1].ib_mc_address =  ring_context->bo_mc4; /* p4 packet addr gfx */
+	request.ibs[1].size = ring_context->pm4_dw2;	/* size p4 gfx */
+	request.ibs[1].ip_type = AMDGPU_HW_IP_GFX;
+
+	bo_handles[0].bo_handle = amdgpu_get_bo_handle(ring_context->bo4);
+	bo_handles[0].bo_priority = 0;
+	bo_handles[1].bo_handle = amdgpu_get_bo_handle(ring_context->bo2);
+	bo_handles[1].bo_priority = 0;
+	request.handles = bo_handles;
+	request.num_handles = 2;
+
+	/* submit pm4 packets for gfx and compute as gang */
+	r = amdgpu_cs_submit_radv(device, ring_context, &request);
+
+	igt_assert_eq(r, 0);
+
+	/* wait for fence */
+	fence_status.context = ring_context->context_handle;
+	fence_status.ip_type = AMDGPU_HW_IP_GFX;
+	fence_status.fence = request.seq_no;
+	r = amdgpu_cs_wait_fences(&fence_status, 1, 1,
+				  AMDGPU_TIMEOUT_INFINITE,
+				  &expired, NULL);
+	igt_assert_eq(r, 0);
+
+	/* verify compute test result meets with expected */
+	ring_context->bo_cpu = ring_context->bo_cpu;
+	ring_context->write_length = sdma_write_length_gfx;
+	gfx_ip_block->funcs->compare(gfx_ip_block->funcs, ring_context, 1);
+
+	ring_context->bo_cpu = ring_context->bo3_cpu;
+	ring_context->write_length = sdma_write_length_compute;
+	compute_ip_block->funcs->compare(compute_ip_block->funcs, ring_context, 1);
+
+	amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle,
+			ring_context->bo_mc, sdma_write_length_gfx * sizeof(uint32_t));
+
+	amdgpu_bo_unmap_and_free(ring_context->bo2, ring_context->va_handle2,
+			ring_context->bo_mc2, IB_SIZE);
+
+	amdgpu_bo_unmap_and_free(ring_context->bo3, ring_context->va_handle3,
+			ring_context->bo_mc3, sdma_write_length_compute * sizeof(uint32_t));
+
+	amdgpu_bo_unmap_and_free(ring_context->bo4, ring_context->va_handle4,
+			ring_context->bo_mc4, IB_SIZE);
+
+	r = amdgpu_cs_ctx_free(ring_context->context_handle);
+	igt_assert_eq(r, 0);
+	free(ring_context);
+}
+
+igt_main
+{
+	amdgpu_device_handle device;
+	struct amdgpu_gpu_info gpu_info = {0};
+	int fd = -1;
+	int r;
+	bool arr_cap[AMD_IP_MAX] = {0};
+
+	igt_fixture {
+		uint32_t major, minor;
+		int err;
+
+		fd = drm_open_driver(DRIVER_AMDGPU);
+
+		err = amdgpu_device_initialize(fd, &major, &minor, &device);
+		igt_require(err == 0);
+
+		igt_info("Initialized amdgpu, driver version %d.%d\n",
+			 major, minor);
+
+		r = amdgpu_query_gpu_info(device, &gpu_info);
+		igt_assert_eq(r, 0);
+		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
+		igt_assert_eq(r, 0);
+		asic_rings_readness(device, 1, arr_cap);
+
+	}
+
+	igt_describe("Test GPU gang cs for gfx and compute rings");
+	igt_subtest_with_dynamic("amdgpu-cs-gang") {
+		if (arr_cap[AMD_IP_GFX] && arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f("amdgpu-cs-gang-AMD_IP_GFX-AMD_IP_COMPUTE")
+				amdgpu_cs_gang(device);
+		}
+	}
+
+	igt_fixture {
+		amdgpu_device_deinitialize(device);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index bbb8edc93..5bd502496 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -14,6 +14,7 @@ if libdrm_amdgpu.found()
 			  'amd_dp_dsc',
 			  'amd_freesync_video_mode',
 			  'amd_hotplug',
+			  'amd_gang_cs' ,
 			  'amd_ilr',
 			  'amd_info',
 			  'amd_jpeg_dec',
@@ -54,7 +55,6 @@ if libdrm_amdgpu.found()
 	else
 		warning('libdrm <= 2.4.109 found, amd_pstate test not applicable')
 	endif
-
 	amdgpu_deps += libdrm_amdgpu
 endif
 
-- 
2.25.1

