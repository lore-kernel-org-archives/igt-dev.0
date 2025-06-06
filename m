Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE50C5B543
	for <igt-dev@archiver.kernel.org>; Fri,  6 Jun 2025 01:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289A410EAEA;
	Fri,  6 Jun 2025 01:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3ZvWMI9s";
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2049.outbound.protection.outlook.com [40.107.101.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F312110EACB
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Jun 2025 01:20:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfM9UR98AKpJEHHqTg5DSKjFUIjykCccUMzb91CBEmD0vx/zj9AO7Zi5OiZOHR2R29uwgT8A4V74fYOozGfoohxUjve0ZzxkQFqyPWgN5TDIaKIVU4F1ivspnmcCSoe16U1a6nZ7eAYCyVXNLX61Kv3dD5DB7cOm6r7hcMLQdQTa3Xgr/7MCRuvDX9EoHPuPvuRgEEAWdtHEg0dNbEVtFtC/dyu8eVY7OV7uOJaHRX62VfNBNFAZ3m78eaPfEIVCkyDe6kFtwARM66i0WHHcu+pjzVQCWi/koi3Msm13fDslN8n05P2ViRxM95ibHqf3J+DVhZrDv9WMhxWr9BQDZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05fBbxBgLK5UnHguFjzRs9KpYpd3+8XDDXJFV4DbcGk=;
 b=OYPl/NyNo1fX1icpGKmns6KpChBcoXY/XqrwVPos+xTb7C5cQuehtpj9LNOQz08h/VCh6pWqxCvzB7vpMzz/FRkwQ2yCDxxSl6bH+mpaXPlJWxdBk8lnRbu/iX4lT6ue25qkIgnrPjdSjzSS5ac006047duFFo2o+3kbRNG/gbcMa8Wc/9feORE3vfy02O24tiDXSOtCzofRcTu99iQ0gaoY7AOtxJn9B9dkc/x2cYYyWDSUH2U4sKCAhoTQXrQM5sO8NgAMcAwQnUQ4h/fpEiSC2AV4UDq5ykHQQLQca1pAn+Rnxs32p09ZATCPfanYQ6ARY2TU+v/qYUrd45URYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05fBbxBgLK5UnHguFjzRs9KpYpd3+8XDDXJFV4DbcGk=;
 b=3ZvWMI9s8IUtR/V4Q+ZdgTD7WWBsFm+m7YwVz6FgwqscL6KKgalUMvJQwTyragoIa2bNSGd5w1H3B3DtYDeGLf8dCn2dMVJscLRGkNGmDeZgQ4RY492DBP4gx2k1alENaym14qLBPWfD1tZDWdKtEFkl9g1EXhGMo9B+LG20ZZk=
Received: from CYXPR03CA0090.namprd03.prod.outlook.com (2603:10b6:930:d3::26)
 by DS4PR12MB9562.namprd12.prod.outlook.com (2603:10b6:8:27e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Fri, 6 Jun
 2025 01:20:01 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:930:d3:cafe::7) by CYXPR03CA0090.outlook.office365.com
 (2603:10b6:930:d3::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.33 via Frontend Transport; Fri,
 6 Jun 2025 01:20:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Fri, 6 Jun 2025 01:20:00 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 20:20:00 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 20:20:00 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 5 Jun 2025 20:19:59 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Ruili Ji <ruiliji2@amd.com>, Ruijing Dong <ruijing.dong@amd.com>, "Vitaly
 Prosyak" <vitaly.prosyak@amd.com>
Subject: [PATCH 4/4] test/amdgpu: implement jpeg queue tests
Date: Thu, 5 Jun 2025 21:19:50 -0400
Message-ID: <20250606011950.151078-4-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606011950.151078-1-vitaly.prosyak@amd.com>
References: <20250606011950.151078-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|DS4PR12MB9562:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e9da582-4125-4da2-cb24-08dda4984240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kz0Dg1MMY82rChxyy/ANfu1aZRL32A4ijs3Sxr/F8E83I1oV+ZkK3MC5UwL/?=
 =?us-ascii?Q?evjse5tGhIdO8rumnA6hawpezEroIXwtWg/EbYJfSLbLuEd6udpGGYQp1WxC?=
 =?us-ascii?Q?Lz2PXqLKXGXjTrzT+Wauwd12wdjZ4s1E3ydff57zN6RCDd+c/5XfEyUU/6Q/?=
 =?us-ascii?Q?z9iRYge40fCQ75TG45pZcrFEcmax8GAp2TEybMQRw1TBfu91PsDN7ZrgvY9a?=
 =?us-ascii?Q?JUMFzGSi9QZtQ54Y1/n86gmdqMRwEgUrdSO8sYKsIEL5UtwcH4gfjuE1M4Jr?=
 =?us-ascii?Q?Go7aXDj04Mm9YLhFIQqB1Metr/wENW6aJhOvdFACc+AwhQnQUTibz6i72UeU?=
 =?us-ascii?Q?H0XFMn7Y33y3fHocDijN3zbkWXT+cZeShR3/P8IvoHMRHb7nlqJyS0Jjb4sA?=
 =?us-ascii?Q?626oLqtIubJVZfF88Bg7/ydp68BzBQ5gJ/Nxo70b63dR7BQewG3cIvdU9VVm?=
 =?us-ascii?Q?GHxmnWO8Wrq1OD7r+su/Kgr/Uhatm80eTGma/Dx8qRaS+7JkOCDWa+9c1F2x?=
 =?us-ascii?Q?RxJhkrKFoTpAqNn0Div8EAQ2TjGXYCGUXk8PBtNdKUPEYYf2p/7jBlH/sQfY?=
 =?us-ascii?Q?YNQr1ERcAsyk6bXJ4oD3PpFqIIb2NTGQJRy+0zcJTrsGqwgIa/Hxw5MxT5ia?=
 =?us-ascii?Q?yupng4RtHIgcVfzCCOWmDATV9WqR7PHs006FWh7NRGbq+jJoT5E5q5bFNp4C?=
 =?us-ascii?Q?eNvBAOy9l2lb798C/OV7RRtUco4CyT3lIB7OPzQbPZIYtY1cA0E9PjaWEhmj?=
 =?us-ascii?Q?jGwTHTLAhTM052mFdzgyGpLIw3oI3sGW65FXTZsoIM/BTOTJN7yEa37BqTbF?=
 =?us-ascii?Q?le1GSjkB0oWb6LrI2rXiJ8FrfaXE/yiFqWlovuEIBtD5L0UIM3f3O8W7yn1W?=
 =?us-ascii?Q?dZgk32FDxyEDVZ70RkJFvRr8iO1oFq6lsu7EljGhQh/9jzjBpVTUYkYswCPI?=
 =?us-ascii?Q?6oywZqoLfNnbm8UfYNYE6Eg0S80hxmDkoz06UZeBGPpeczSN8r1yfZXDC0xl?=
 =?us-ascii?Q?XBsU+VJtW8N0RnsT571jAx1iWYQH5tO/8IKc9CTdb8Tb3m2/k16lQK0wpquN?=
 =?us-ascii?Q?azlZbqvNB/dmk2bPXTYm8M8VNi13ktV1LTaldD0BAfaPE0mV9gjuCLlp4wUh?=
 =?us-ascii?Q?8Uj/Y64bV9kufQlndHKiLq85NBZjxqqqEs5Cr+CapmR6FKlKUC3Z1lDVx+/7?=
 =?us-ascii?Q?s0t5WovT4VVOiUj+9Bz6ZtQT2RGqQEebycafjStyWzHVLtWRGsL0ZQQdR0KP?=
 =?us-ascii?Q?wyPxMIs3xGcvgtJJfy65mFuz9FQDYoWZXnzru3wi18ySp7BGP8nNYWNiYlon?=
 =?us-ascii?Q?xQgxidB4q3Z7lTqMEw0QMolEOCapqSuw1En2S8dE+i+SUWQdak6APn9WDjUN?=
 =?us-ascii?Q?3p0kZxaWFJL7k3MEbpd60XxwxqGtd4w6qcsX8UsaHQoRmKmcu5j69OhhZ5hX?=
 =?us-ascii?Q?ST+pgZXltQeRg67VkRd0Oh0I0bYAGCeKdznXRxKxXliRA6DkLw8VnpCM8mmj?=
 =?us-ascii?Q?yjZ8tpX4uU4eBdkaxEtEEj52qI9+Kmr7O/xy?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 01:20:00.9003 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9da582-4125-4da2-cb24-08dda4984240
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9562
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

From: Ruili Ji <ruiliji2@amd.com>

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

