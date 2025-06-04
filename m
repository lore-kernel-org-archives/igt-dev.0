Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973C4C5B549
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 23:47:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A801C10E094;
	Wed,  4 Jun 2025 23:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="moNtVOHe";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F6110E094
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 23:47:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UVvI6NlHGzjvely2O2T7lYT+WgMqjPQy7u51qr5yXHOu7dGJZWo1m4ugPnpSYCSBHwmGEfRNZ2c93pgu4MnoAF9j+3LhMSOAUf7VB4NaGpsdHDGipbt9FyjlwccYguQ8Zs/lUAD98dLL0Z1ldoI8Q/HyXTg26H9V9JDgcME/JehFShdHP45OkjHjreR36aJABrkPCalDkW0UdaOghdJL5kCHC0I/wetNyBTMVcdbGfFYm8ki/AyrwBLCR19VkGTmO6eoqtUMkjIAf+q+YOCsxzbyZVxadwbkfxFzes3VzK3g7QjE6r7qx6Y4Rzi3nXAMR2HbNJSg+Qrx8OXnWSyZgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPSC/cXx2b/+FJu6EKDnaO1G3A4szbyVGIR4kPkRXVk=;
 b=vFq0jQyomFpy/9bMoJRxy3IbqqopCi2zDrfPEIgQfBYFRTDwAxXqfGxlJhIml8yAmKAeCOheY4qFr4uU1XIzC2s0EsQk+KsLvcK4cnE44yVwFWrG5E6+vGhw3WdOnMjgPBG7pGVZeyY3COHJTScVqoKM5tX8nCM48PhO0JUnFMvxnzvAth/0x+5bPY8sWDlF2Fi4KvcvY8jqUcvlW9+eCYfkBUPbwQgf4MHjd58sreEC2uBmwtIyFZVhq+ig+LZZMgnL6o8jq6gxlOjnT9qbvYniLZrfqy/ks5PD57rZ1uMURlbuYkYzVfqVOMI/VCslw3ENiPmbbBMhjzkPQtx4yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPSC/cXx2b/+FJu6EKDnaO1G3A4szbyVGIR4kPkRXVk=;
 b=moNtVOHe0c84ja36WBldp3R5pbBMjZYZtoFXVTCk//ICZ6c28TIVcTCBt8t9WJfjzm3XdmUwPoRULxcww3IX6FPhKlYmyJIKZid6mOPF6FkxbRYw6Bi7f14e7n/O2fOtARlhBIVhMfmDwLKrRFuqEpH9w1WdHRFYHPI4Rw5AT5o=
Received: from BYAPR04CA0032.namprd04.prod.outlook.com (2603:10b6:a03:40::45)
 by MN0PR12MB6221.namprd12.prod.outlook.com (2603:10b6:208:3c3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 23:47:08 +0000
Received: from CO1PEPF000044F6.namprd21.prod.outlook.com
 (2603:10b6:a03:40:cafe::fa) by BYAPR04CA0032.outlook.office365.com
 (2603:10b6:a03:40::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Wed,
 4 Jun 2025 23:47:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Wed, 4 Jun 2025 23:47:07 +0000
Received: from ruiliji-ubuntu2204.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Jun 2025 18:47:05 -0500
From: Ruili Ji <ruiliji2@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Ruili Ji <ruiliji2@amd.com>, Ruijing Dong <ruijing.dong@amd.com>, "Vitaly
 Prosyak" <vitaly.prosyak@amd.com>
Subject: [PATCH 4/4] test/amdgpu: implement jpeg queue tests
Date: Thu, 5 Jun 2025 07:46:49 +0800
Message-ID: <20250604234652.2715698-1-ruiliji2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F6:EE_|MN0PR12MB6221:EE_
X-MS-Office365-Filtering-Correlation-Id: 92958f93-666f-4a7b-ba9b-08dda3c21d9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Oq+PUaqX0Tu6VD4xH7Za5qtUusPJhs2ZHw0wgB725FJFMseVJCqkaN1cgGuy?=
 =?us-ascii?Q?3lKOSpJJ4Tpm9MwdNDq+E1o1RipxovGja4H+uwiLGKTCtrP0l5oltJddOllF?=
 =?us-ascii?Q?kOueQlkkuR4niKcfeP+fJ+rkkzApSJXYV1myah5YZlLDV2sDLJQ2WAK/hS4O?=
 =?us-ascii?Q?h7MeqH1aaF/ukKDHzF/uUfRluLHZUW5zJU1D9Ta1OQm+14xigelzqfyZEGjN?=
 =?us-ascii?Q?12I4OCVkdvX1vzIxGcgRuVewinrQdRkAMBbodAjJ5tVYRiyGmQStccp90sgj?=
 =?us-ascii?Q?snmfOORxvstlbFtwMma2UFOGinrYIfDGnlkqPGZqn3MzRnLkLaoxelyyVhgG?=
 =?us-ascii?Q?fiHVYtBmvTqBWikMouNg5Fj4V7Fp4o8V+VLFPg5frEhJ90z9c7OuUJ3zTnOA?=
 =?us-ascii?Q?7SEXhNU0C4XrEBUjAIK6/NpIu81Xp4V9oQm2amQ7+DkcWsGuUN0YeYA9rCkV?=
 =?us-ascii?Q?Fagzp26gSWftYGsQcF+52vjV+SM8oVecQKMxtJz/z5l9PVnF2HyQzl0pUmrp?=
 =?us-ascii?Q?Fozg03OazOukHM29l7WRA+m0GWsoEUUiN0WtahM8r1pesaBsOU+v8X9RDlOr?=
 =?us-ascii?Q?kCreyoV0Q1fPzWZgmU8m5NYMTADItwxVtp0PUJbjgd9RNMNPSXwlPVKPyGGy?=
 =?us-ascii?Q?XiA+Jo4CZUO6fXRYbRRl4c2Qdq7FR+P1ZmG2as5rC3f2RbKkrPM4fUoqPTY+?=
 =?us-ascii?Q?yWgknpN0yTyiwLpQTjHs3/fOBXSSAG4b+GD1Vv99OvU1N5XR2fF3uCfcvbw/?=
 =?us-ascii?Q?kbIdyVbMstQIPdEho+aaTN7o+XgYR8FXgZ8vuYwxsswyvOqgeSnP6+3RgYQg?=
 =?us-ascii?Q?qTteLQnMEai3uq8VfHym/VlWOajul9y/68FQiUvlamYXY7ykhBiKKgvXqFxl?=
 =?us-ascii?Q?be0WFScmwECzK8TgCzIyv50GjLg4lNZIRJQh6KhIx4n8IqioVOK17N1JT7CC?=
 =?us-ascii?Q?ll1pyTj/5DZG7ugngbShccHRDkqDV3gtmZn3y3kpUuv/inP1i+MOdrT/iA7y?=
 =?us-ascii?Q?RrpI0R4Ixm3auoLCBGcZYtj5QjrhcLtFic2PHtGhF/4GFXIEc9WEpFy56XOS?=
 =?us-ascii?Q?YnlJS//TipHEowdIh1h1VpmwoVwOpL85cmhQAyyK/oopLSwM5z0X/f2eAGhd?=
 =?us-ascii?Q?7R9D4BVex4mDuuJO50SuW2YATKiCuAVvREbTIGZt03FS1rsh9DpCly9pn5Hf?=
 =?us-ascii?Q?SVM8xfzNZ3g4w5CppJ+4K/LXW9BxtmPLhPo3dKnYvqm/OkFGiEa7fcDoFW9h?=
 =?us-ascii?Q?rZihHzy7wSDAnH8ndhi4BgACeMh5fnrywC8blOdQEoqiPBYthY3xS1jTPvLb?=
 =?us-ascii?Q?ZDouPz/bEL89p1E74QFeUknTRLiyctJaI+RwcV1iuGRTzXkTEGMT+uHKgrpd?=
 =?us-ascii?Q?RIOWvKwYYabBrHxAy58fx4rfwowzMlCW1zAK+Sw8sXpcVyxL58jB/b4gISIP?=
 =?us-ascii?Q?riyv9YgABqt1OhyVtOawHx9hRhZOYAOkyn33tS3wQuot599Uu+8HRmBDTNZz?=
 =?us-ascii?Q?htUoHoPO4R6MZyTClTohMuQPdWGT4qfBDyWr?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 23:47:07.0792 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92958f93-666f-4a7b-ba9b-08dda3c21d9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6221
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

The jpeg queue tests are used to verify the resiliency
of GPU. If there is job timeout on a jpeg queue, driver
could only reset this jpeg queue with other queues (like
gfx/vcn/jpeg queues) unaffected.

Brief description of queue tests:
1. Query the queue sched mask info and select one ready queue.
   If there are multiple queues, the following steps will be
   executed on per ready queue (1: ready, 0: not ready).
2. Insert invalid content into the normal decode flow
   and check the result of jobs submit.
   If submit returns without error, there is no job timeout.
   If submit returns with error, there is job timeout
   and driver will reset queue.

Signed-off-by: Ruili Ji <ruiliji2@amd.com>
Reviewed-by: Ruijing Dong <ruijing.dong@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_jpeg_queue.c | 115 ++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build      |   1 +
 2 files changed, 116 insertions(+)
 create mode 100644 tests/amdgpu/amd_jpeg_queue.c

diff --git a/tests/amdgpu/amd_jpeg_queue.c b/tests/amdgpu/amd_jpeg_queue.c
new file mode 100644
index 000000000..82d8679cc
--- /dev/null
+++ b/tests/amdgpu/amd_jpeg_queue.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: MIT
+// Copyright 2025 Advanced Micro Devices, Inc.
+
+#include "lib/amdgpu/amd_jpeg_shared.h"
+#include "lib/amdgpu/amd_ip_blocks.h"
+
+static bool
+is_queue_tests_enable(amdgpu_device_handle device_handle,
+		struct mmd_shared_context *context, struct pci_addr *pci)
+{
+	bool ret = is_jpeg_tests_enable(device_handle, context);
+
+	if (!ret)
+		return false;
+
+	if (!is_reset_enable(AMD_IP_VCN_JPEG, AMDGPU_RESET_TYPE_PER_QUEUE, pci)) {
+		igt_info("The ASIC does NOT support jpeg queue reset\n");
+		return false;
+	} else if (context->vcn_ip_version_major < 4) {
+		igt_info("The vcn ip does NOT support jpeg queue reset\n");
+		return false;
+	}
+
+	return ret;
+}
+
+static int
+jpeg_queue_decode(amdgpu_device_handle device_handle,
+		struct mmd_shared_context *shared_context, int err)
+{
+	struct amdgpu_mmd_bo dec_buf;
+	int size, ret;
+	uint32_t idx;
+	struct mmd_context acontext = {0};
+	struct mmd_context *context = &acontext;
+	int64_t dec_buf_addr;
+
+	ret = mmd_context_init(device_handle, context);
+	if (ret) {
+		igt_info("mmd_context_init fail!\n");
+		return ret;
+	}
+
+	size = 32 * 1024; /* 8K bitstream + 24K output */
+	context->num_resources = 0;
+	alloc_resource(device_handle, &dec_buf, size, AMDGPU_GEM_DOMAIN_VRAM);
+	context->resources[context->num_resources++] = dec_buf.handle;
+	context->resources[context->num_resources++] = context->ib_handle;
+	ret = amdgpu_bo_cpu_map(dec_buf.handle, (void **)&dec_buf.ptr);
+	if (ret) {
+		igt_info("amdgpu_bo_cpu_map map dec_buf fail!\n");
+		goto err_handle;
+	}
+	memcpy(dec_buf.ptr, jpeg_bitstream, sizeof(jpeg_bitstream));
+
+	idx = 0;
+	dec_buf_addr = dec_buf.addr;
+	if (err == INVALID_DECODER_BITSTREAM_BUFFER)
+		dec_buf_addr = 0xdead;
+
+	send_cmd_bitstream_direct(context, dec_buf_addr, &idx);
+	send_cmd_target_direct(context, dec_buf_addr + (size / 4), &idx);
+
+	amdgpu_bo_cpu_unmap(dec_buf.handle);
+	submit(device_handle, context, idx, AMDGPU_HW_IP_VCN_JPEG);
+
+	/*
+	 * For job timeout test case, submit job will return error,
+	 * here needn't return error.
+	 */
+	ret = 0;
+
+err_handle:
+	free_resource(&dec_buf);
+	mmd_context_clean(device_handle, context);
+	return ret;
+}
+
+igt_main
+{
+	amdgpu_device_handle device;
+	struct mmd_shared_context shared_context = {};
+	int fd = -1;
+	uint32_t major, minor;
+	int err;
+	struct pci_addr pci;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_AMDGPU);
+		err = amdgpu_device_initialize(fd, &major, &minor, &device);
+		igt_require(err == 0);
+		igt_info("Initialized amdgpu, driver version %d.%d\n",
+			 major, minor);
+		err = mmd_shared_context_init(device, &shared_context);
+		igt_require(err == 0);
+
+		igt_skip_on(get_pci_addr_from_fd(fd, &pci));
+		igt_info("PCI Address: domain %04x, bus %02x, device %02x, function %02x\n",
+				pci.domain, pci.bus, pci.device, pci.function);
+		igt_skip_on(!is_queue_tests_enable(device, &shared_context, &pci));
+		shared_context.ip_type = AMD_IP_VCN_JPEG;
+	}
+
+	igt_describe("Test whether jpeg queue");
+	igt_subtest("jpeg-decoder-queue-reset") {
+		err = (int)INVALID_DECODER_BITSTREAM_BUFFER;
+		mm_queue_test_helper(device, &shared_context, jpeg_queue_decode, err, &pci);
+	}
+
+	igt_fixture {
+		amdgpu_device_deinitialize(device);
+		drm_close_driver(fd);
+	}
+
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index d3f301e9c..421e686d3 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -19,6 +19,7 @@ if libdrm_amdgpu.found()
 			  'amd_ilr',
 			  'amd_info',
 			  'amd_jpeg_dec',
+			  'amd_jpeg_queue',
 			  'amd_link_settings',
 			  'amd_max_bpc',
 			  'amd_mem_leak',
-- 
2.34.1

