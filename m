Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A876C4828D
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 04:53:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2415910E404;
	Thu,  1 Feb 2024 04:53:58 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA7D10E413
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 04:53:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nn/O17DyT5Xqix0IhmBbopkLRWqfI22LqVY466sNMnL0L+9752ZSwD4ss7jfkHxGmYP8bTXrv1Pz4L5y7TudciTqyjwgY0G/dx/JQQBWx4ySkSfR0s5KDrNLYaEb0UI4DUzoFsyGi7R/l0ghNz54fSEFJqOtO8r8NopBCDU9wKkG7/oeHp94B4eG+wYvbAxM1Zlfriq6li7fMjC3WyMxsgkPldIpxM6UeZ2FYJKJM38eci7Tc3V6rN0dvxTyx2v18hOxrTldB5ctDhYVNxpgKxSkHkkIp954joXMkalUkBWUGSu9/o056XEvYq7iR2LJOxgWNRu4neq3ZSJ+v1wxaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuBaU+yVKN7vhy//vLAyH0LkvkgDLzBIgMRahz39xhw=;
 b=oQtwUgqkffnm7WjPdkQFrfwvrfrWDgSxt9DxlEzk/5bhsczpg+MhA03ANZNKpwtCCskz1wLe9wAfT2vm4dpbxxAelcpOvt9sFTlg/fJJp6iU8RC2bQXOtTNdbH1Hkt0J5cwdeDhH6X6v6Qa+GxiYIHKUCUwcVxKUnCMQk/a1Ey6xwcBiFAN864+OId3U9xFBonCNPys9fVUKuWBwP62AsFhfQStOsg1Hi7EaZTY+CqoYF8ZhLo7xsyQtCGouWQFWXayB0bUTkistv3QDbe2KrdKIrwvBaFzzaIxwCQ59lR2CGTsBmdBL+PAyTWmiM+I+KPemsh/y0gfLzx2zZCWGeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuBaU+yVKN7vhy//vLAyH0LkvkgDLzBIgMRahz39xhw=;
 b=bGjATwGZo6ban+PUP/0Uqh+SV2kjVhv0fYEyuoIN1YCnMjCHsJWkEeSraxnjmdLdDnVGW1nyS/6Mj3RI3Lk8vbV8LlsH3oZMOmR4dR5HFfbjruYGxJvnbgh0On/51lu+qdNfHPQRRRFJIaW3lBk6m/NAkPeLx0kvt6V+5q0qIxU=
Received: from SJ0PR05CA0128.namprd05.prod.outlook.com (2603:10b6:a03:33d::13)
 by SN7PR12MB8790.namprd12.prod.outlook.com (2603:10b6:806:34b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Thu, 1 Feb
 2024 04:53:51 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::f3) by SJ0PR05CA0128.outlook.office365.com
 (2603:10b6:a03:33d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Thu, 1 Feb 2024 04:53:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7228.16 via Frontend Transport; Thu, 1 Feb 2024 04:53:51 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 22:53:47 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 22:53:35 -0600
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 31 Jan 2024 22:53:35 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH 3/3] tests/amdgpu: add gang cs test
Date: Wed, 31 Jan 2024 23:53:30 -0500
Message-ID: <20240201045330.610006-3-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240201045330.610006-1-vitaly.prosyak@amd.com>
References: <20240201045330.610006-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|SN7PR12MB8790:EE_
X-MS-Office365-Filtering-Correlation-Id: d38cc687-b062-4188-0831-08dc22e1c8fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JFLR0SHZyop0MOEZ7B3rWwINMqQzhy04VRgsiFNH6btg4RN+wpev7+sQ7RYFo/xBRlqKZzLwByTPEunuy5e+GOHlfskUVE/xsT35hKIbaFNq2tydzKKeOiOy1Jai6tuZ8C7BeojxkGZEU5wrohgB6KqoZ8nbWQLAf6wtbZLi1BnKjZXuSNKPSZd2iCGpfyA5/ZgkltTXwu5DVWx/4h5plO7KvRh2ttK/q6/epOQf1jpI5+uknI371blQbfM/qtjLrwUd1lRvab4zVV2N9cpjdYts2a4vhiC5udkBBIXdeaVn21S52exwPJgnNn3CztHzz0SFNT+Igf0fMUg8eGfaiMqsbyxarBuWdBMp7sewrv4DaeRlbEqb8LsqUQlp9WUxSzJMu4ZZvQIV3iqVUd1FW4KX/9qFNF/qZT87Exo5y1zOmiUH+CZcLu9MzOHOB/aTe3wY0dZHQVRSD8mQ1Q5A1OLeaZnedwqV48jTl9+F3pu3jlEdm7vNE4Fcmj4eyIObqcED8y7tFekTaJSik6C8v3l5h/dYx/gEIlx4kd5MP3AuLNJG1EBCjk58VGUSyq5ARnnsE5agJoyIrj0l9Nt2pZSDRuhCGmbW6RoCpbKLh8C63e0i35N8nSJRDVSfk5mj4yl6mePxEikBcMB67wYXGKDBvSF2i8A3WrdMRyY43Ag2LeMFYnu6XYMFOfZznV69yO9RjbjJLk7hwLIGXJRZHMmsm3E9gHYgzJH/tcdqlmNDdizyT9St7DNtnz7Jbu0x7KLJjKYEDDRR7TVA7vo19kYtdEH/eKBc+cjxW7wX17QpLNX2d1TGfIoUy/zi5sYX
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(376002)(136003)(39860400002)(396003)(230273577357003)(230922051799003)(230173577357003)(451199024)(64100799003)(82310400011)(1800799012)(186009)(40470700004)(46966006)(36840700001)(2876002)(316002)(8676002)(4326008)(2906002)(86362001)(8936002)(5660300002)(70206006)(54906003)(70586007)(6916009)(356005)(36756003)(47076005)(81166007)(82740400003)(6666004)(36860700001)(7696005)(478600001)(83380400001)(2616005)(426003)(26005)(1076003)(336012)(41300700001)(40460700003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 04:53:51.3242 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d38cc687-b062-4188-0831-08dc22e1c8fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8790
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
 tests/amdgpu/amd_gang_cs.c | 239 +++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build   |   2 +-
 2 files changed, 240 insertions(+), 1 deletion(-)
 create mode 100644 tests/amdgpu/amd_gang_cs.c

diff --git a/tests/amdgpu/amd_gang_cs.c b/tests/amdgpu/amd_gang_cs.c
new file mode 100644
index 000000000..4c6ade8d7
--- /dev/null
+++ b/tests/amdgpu/amd_gang_cs.c
@@ -0,0 +1,239 @@
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
+
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
+amdgpu_cs_gang(amdgpu_device_handle device, uint32_t ring, bool is_vmid)
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
+	struct amdgpu_ctx_radv *ctx_radv = NULL;
+	int r;
+	uint32_t flags;
+
+	const struct amdgpu_ip_block_version *gfx_ip_block =
+			get_ip_block(device, AMD_IP_GFX);
+	const struct amdgpu_ip_block_version *compute_ip_block =
+			get_ip_block(device, AMD_IP_COMPUTE);
+
+	memset(&request, 0, sizeof(request));
+	ring_context = malloc(sizeof(*ring_context));
+	memset(ring_context, 0, sizeof(*ring_context));
+	ring_context->write_length = sdma_write_length_compute;
+	ring_context->write_length2 = sdma_write_length_gfx;
+
+	r = amdgpu_ctx_radv_create(device, AMDGPU_IGT_CTX_PRIORITY_MEDIUM,  &ctx_radv);
+	igt_assert_eq(r, 0);
+
+	if (is_vmid) {
+		flags = 0;
+		r = amdgpu_vm_reserve_vmid(device, flags);
+		igt_assert_eq(r, 0);
+	}
+
+	prepare_compute_cp_packet(device, ring_context, compute_ip_block);
+	prepare_gfx_cp_mem_packet(device, ring_context, gfx_ip_block);
+
+	request.number_of_ibs = 2;
+	request.ring = ring;
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
+	r = amdgpu_cs_submit_radv(device, ring_context, &request, ctx_radv);
+	if (is_vmid == true)
+		igt_assert_eq(r, EINVAL);
+	else
+		igt_assert_eq(r, 0);
+
+	if (is_vmid == false) {
+		/* verify compute test result meets with expected */
+		ring_context->bo_cpu = ring_context->bo_cpu;
+		ring_context->write_length = sdma_write_length_gfx;
+		r = gfx_ip_block->funcs->compare(gfx_ip_block->funcs, ring_context, 1);
+		igt_assert_eq(r, 0);
+
+		ring_context->bo_cpu = ring_context->bo3_cpu;
+		ring_context->write_length = sdma_write_length_compute;
+		r = compute_ip_block->funcs->compare(compute_ip_block->funcs, ring_context, 1);
+		igt_assert_eq(r, 0);
+	}
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
+	amdgpu_ctx_radv_destroy(device, ctx_radv);
+
+	if (is_vmid) {
+		r = amdgpu_vm_unreserve_vmid(device, flags);
+		igt_assert_eq(r, 0);
+	}
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
+				amdgpu_cs_gang(device, 0, false);
+		}
+	}
+	igt_describe("Test GPU gang cs for gfx and compute rings vmid");
+	igt_subtest_with_dynamic("amdgpu-cs-gang-vmid") {
+		if (arr_cap[AMD_IP_GFX] && arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f("amdgpu-cs-gang-vmid-AMD_IP_GFX-AMD_IP_COMPUTE")
+				amdgpu_cs_gang(device, 0, true);
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

