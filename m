Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD951C5B543
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 23:47:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A949A10E0A2;
	Wed,  4 Jun 2025 23:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PzriieRZ";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E759910E0A2
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 23:47:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCjJn+f4J+tIx18izW7DL7zxJZjXcfj1O7R0WadlJ2szaE/RHW4FREPxzcNkAPXIu7/c7UAcr65FkLzpA6NJmKvvsJUXxv3o2/eesRaSVNEvlMPQXqsyph8K2JC7CXKs5fPBDf8qhbS9ywwTt9FF45ql+1VRf/p7KrPOJW6vpMPuRfEb/Yvsp5eop+0glPkOyNrSDxrREQ3oP6n8qWNlDfENZshPK0I2r1KYHw8bkreUwtSDIRsHd/0IpnLnLYgrYhwhqXcvUes/Csqx0U3ZdpdiXm4lL1cpgix9NeoIK+t8JHIb4amxwHd2wZrpQZEsyZD60PYE3mHWnSbdXxo8GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zU0+d8Dl73OOWv831ygdSLWKtkF0qwahrcAIYI7TDMw=;
 b=jCv6jGehCOWienqDFdekHlj+dc5KJY7pnsmRCZfGL5H3Mzxy6creEnua5Erk92BaVvog6u3fjJDsZYeBDQ4Yxtde0gN6NJKpx846YVNmexjv+yCsEFSozvWlNiFY0iLQVxXMNOqrM/UAdFgPOOFJsVdI9y/tNN6gCKrNADsg+RfEbDSUpKc1X7ATEKRGR3wCVqe8IAg7a71bI3Fo1bMFVgprs+WbwhwyThENhkKFvTjydHDf5i6ecJhktdBT1QVgXh/9+QB9AkIeTY4WeFU2gUjvXfUAc5RJWVgNEY9pqyRJ2/t/4qnY94rOCT79a+hR5ik+I3UliKGH/XWzgULgyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zU0+d8Dl73OOWv831ygdSLWKtkF0qwahrcAIYI7TDMw=;
 b=PzriieRZpPwSrpL0wN1ruOSNONWw0bcgPM7dx9JgLph0GPCfZp+s9FNy9+83BbJbnXhrGN8TyfhFOeDmuTd5nkbXcmd7YXDXmAvqGvSp/dfgXjo0ZJt/0/PgDZhoB32SY/JVb0bpJ1fFDg56r28+FykG9GoxblD26c2opEdz1co=
Received: from BYAPR04CA0014.namprd04.prod.outlook.com (2603:10b6:a03:40::27)
 by SA0PR12MB4446.namprd12.prod.outlook.com (2603:10b6:806:71::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 23:47:11 +0000
Received: from CO1PEPF000044F6.namprd21.prod.outlook.com
 (2603:10b6:a03:40:cafe::84) by BYAPR04CA0014.outlook.office365.com
 (2603:10b6:a03:40::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Wed,
 4 Jun 2025 23:47:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Wed, 4 Jun 2025 23:47:10 +0000
Received: from ruiliji-ubuntu2204.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Jun 2025 18:47:08 -0500
From: Ruili Ji <ruiliji2@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Ruili Ji <ruiliji2@amd.com>, Ruijing Dong <ruijing.dong@amd.com>, "Vitaly
 Prosyak" <vitaly.prosyak@amd.com>
Subject: [PATCH 3/4] test/amdgpu: implement vcn queue tests
Date: Thu, 5 Jun 2025 07:46:50 +0800
Message-ID: <20250604234652.2715698-2-ruiliji2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604234652.2715698-1-ruiliji2@amd.com>
References: <20250604234652.2715698-1-ruiliji2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F6:EE_|SA0PR12MB4446:EE_
X-MS-Office365-Filtering-Correlation-Id: b10f4217-8f2c-45e4-82cc-08dda3c21fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vVaeGAwNr+5Ll2//vNLlmGBbqijzx+zyZ4AP02A0clCzcZOQW8VyriDMr68g?=
 =?us-ascii?Q?FNd2pWXeKTUzoRILOpTza4GeyhsPWuOfFmqqLcheUP8MuqJeAiw0D0u+3SXg?=
 =?us-ascii?Q?od0wtG2o/4TjJqXFeBarYu/epvmotCI2QuPkCKHj8WxKmzlKZwBa2BYjbXs5?=
 =?us-ascii?Q?kgXwtuTQtsUltEMhN6g7Q3q0sYTsvIy4I+3T9PxZQhXzKeIOHhFogDP5Vfoh?=
 =?us-ascii?Q?VbrfDc52eT+JUyvAMVqR2cgtrSWZtCqpff/iN8WYgqxWhBHzio8NFfgJfdMe?=
 =?us-ascii?Q?WCWsj8ndQsrgD7CT+Zeson7zd+tVIP3InpHjU87yCmNebVG9dHLCXBQ4Ll8m?=
 =?us-ascii?Q?4R2G9kNsDJcS5O3zIhm4NgT14ZJ56m68D8+SqsYWzqhlp6iPVweOKHCvs8S8?=
 =?us-ascii?Q?QnKc9M8z4lMyz8awgsdFGv6ffuCF+MxsbhZrfCaGGu2NZnKRGCCd6gSPQJzN?=
 =?us-ascii?Q?TWDSkadhDW9b/X+UUz9xenpLSYoPSlXJzImlH/pjLdfSmTFZtrPdkPo1dxNx?=
 =?us-ascii?Q?6nF+cSJNS1t0Ep7IjlAGtUCg8G5IEiXr6SiJhKju0MoJ+dSiV9HsjcHpSk/R?=
 =?us-ascii?Q?QiOK2IA33/zfwDFk+yq2wk8WxVMnKDYeiuVbHHtXVxZaNG7oRWR42psFSbDL?=
 =?us-ascii?Q?qkE4+Gi/ozdUMVBoIZk7I/iqpVbhUHjQrv1k3lIrO4GOyfTtX4NQGsEZnM8/?=
 =?us-ascii?Q?f9E1XWEdQUvmnFZ7d7MpcIGBqGDNV3FkmjNtrl6oj0SYCKI1HKof+ExN9xlZ?=
 =?us-ascii?Q?y7ff1zU19EduJfsVJCdJADUwkZeysxrKiR7V/j/IoynPTFBPu1vbWn0pP+Bz?=
 =?us-ascii?Q?GoOLnZk0dhxh4oL7suc2qg3gagMCyI+wv5L86EyGlfDVe4+yB3lA45XsxgIk?=
 =?us-ascii?Q?LO81ZSDR8qcWwh/bf2GbJaBop57wvSA1vP78uwsUyy7ZTGo+orXoqZXAKmTB?=
 =?us-ascii?Q?4Jk1J3YyM4Y8BizOX3Wh2H3GO3lhfD2QDqUEkDeFpf3nE0ZEBqiPx8fbFt6w?=
 =?us-ascii?Q?TL4oPrysajNmnvSUO8yAFN7qnN10c9hCbCcIDF5LIaCz4Nb/N03NKwsgnuBR?=
 =?us-ascii?Q?QoH1X6axaGKt36O64X0XhgZj0qS7nlBC+L51/ZJQ7hvKPhIOoSNTcqpXh0yB?=
 =?us-ascii?Q?evGAVvqt+Sdw7s9f4v4jlacpSxfxDWKx9MgWgxwRLeKLmfy/kGWpvKMpd9QX?=
 =?us-ascii?Q?DboPKVoq2xbfrg3XQr5IiT//uz0OBq42cJxV7i1xUhSaXVrkPCt9tXX5pQ9S?=
 =?us-ascii?Q?udJp5kBhkW6E3mJHViyEDkJS19GUnQbv4GupzjtU968DXuAF4spVGBGrLdYQ?=
 =?us-ascii?Q?/RKv2tTkbz8NknLxS6FH+lkVVu8DNgfcKH49lC8ZFrXoFbuqQmBVNSXK067e?=
 =?us-ascii?Q?OZDCvCgOAv7KTZ431XXeEhNmxZSTjgy4mmVJg5bsS3jZsd3JNaPZbGroiycj?=
 =?us-ascii?Q?ZJVe6RUbrk3en/WhihcU0TFF/MyQRhe0/d5R52OC643YFWChbsLQJBCaiZ2U?=
 =?us-ascii?Q?Py7d34qMPZwHWz+FBlaCxVBHREQZp9HfftXL?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 23:47:10.6837 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b10f4217-8f2c-45e4-82cc-08dda3c21fc2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4446
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

The vcn queue tests are used to verify the resiliency
of GPU. If there is job timeout on a vcn queue, driver
could only reset this vcn queue with other queues (like
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
 tests/amdgpu/amd_vcn_queue.c | 100 +++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build     |   1 +
 2 files changed, 101 insertions(+)
 create mode 100644 tests/amdgpu/amd_vcn_queue.c

diff --git a/tests/amdgpu/amd_vcn_queue.c b/tests/amdgpu/amd_vcn_queue.c
new file mode 100644
index 000000000..7d95567a2
--- /dev/null
+++ b/tests/amdgpu/amd_vcn_queue.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: MIT
+// Copyright 2025 Advanced Micro Devices, Inc.
+
+#include "lib/amdgpu/amd_vcn_shared.h"
+#include "lib/amdgpu/amd_ip_blocks.h"
+
+static bool
+is_queue_tests_enable(amdgpu_device_handle device_handle,
+	struct mmd_shared_context *context, struct pci_addr *pci)
+{
+	bool ret = is_vcn_tests_enable(device_handle, context);
+
+	if (!ret)
+		return false;
+
+	if (!is_reset_enable(AMD_IP_VCN_UNIFIED, AMDGPU_RESET_TYPE_PER_QUEUE, pci)) {
+		igt_info("The ASIC does NOT support vcn queue reset\n");
+		return false;
+	} else if (context->vcn_ip_version_major < 4) {
+		igt_info("The vcn ip does NOT support vcn queue reset\n");
+		return false;
+	}
+
+	return ret;
+}
+
+static int
+vcn_queue_test(amdgpu_device_handle device_handle,
+	struct mmd_shared_context *shared_context, int err)
+{
+	struct mmd_context context = {};
+	struct vcn_context v_context = {};
+	signed int ip;
+	int len, ret;
+
+	ret = mmd_context_init(device_handle, &context);
+	igt_require(ret == 0);
+
+	context.num_resources  = 0;
+	alloc_resource(device_handle, &v_context.session_ctx_buf, 32 * 4096, AMDGPU_GEM_DOMAIN_GTT);
+	context.resources[context.num_resources++] = v_context.session_ctx_buf.handle;
+	context.resources[context.num_resources++] = context.ib_handle;
+	len = 0;
+	vcn_dec_cmd(shared_context, &context, &v_context, v_context.session_ctx_buf.addr,
+			DECODE_CMD_SESSION_CONTEXT_BUFFER, &len, err);
+
+	amdgpu_cs_sq_ib_tail(&v_context, context.ib_cpu + len);
+	ip = AMDGPU_HW_IP_VCN_ENC;
+	submit(device_handle, &context, len, ip);
+
+	/*
+	 * For job timeout test case, submit job will return error,
+	 * here needn't return error.
+	 */
+
+	mmd_context_clean(device_handle, &context);
+	return 0;
+}
+
+igt_main
+{
+	amdgpu_device_handle device;
+	struct mmd_context context = {};
+	struct mmd_shared_context shared_context = {};
+	int fd = -1;
+	uint32_t major, minor;
+	struct pci_addr pci;
+	int err;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_AMDGPU);
+		err = amdgpu_device_initialize(fd, &major, &minor, &device);
+		igt_require(err == 0);
+		igt_info("Initialized amdgpu, driver version %d.%d\n",
+			 major, minor);
+		err = mmd_shared_context_init(device, &shared_context);
+		igt_require(err == 0);
+		err = mmd_context_init(device, &context);
+		igt_require(err == 0);
+		igt_skip_on(!is_vcn_tests_enable(device, &shared_context));
+		igt_skip_on_f(!shared_context.dec_ring && !shared_context.enc_ring, "vcn no decorder and encoder rings\n");
+		igt_skip_on(get_pci_addr_from_fd(fd, &pci));
+		igt_info("PCI Address: domain %04x, bus %02x, device %02x, function %02x\n",
+				pci.domain, pci.bus, pci.device, pci.function);
+		igt_skip_on(!is_queue_tests_enable(device, &shared_context, &pci));
+		shared_context.ip_type = AMD_IP_VCN_UNIFIED;
+	}
+
+	igt_describe("Test whether vcn queue");
+	igt_subtest("vcn-decoder-queue-reset-test") {
+		err = (int)INVALID_DECODER_IB_SIZE;
+		mm_queue_test_helper(device, &shared_context, vcn_queue_test, err, &pci);
+	}
+
+	igt_fixture {
+		mmd_context_clean(device, &context);
+		amdgpu_device_deinitialize(device);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 7d40f788b..d3f301e9c 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -36,6 +36,7 @@ if libdrm_amdgpu.found()
 			  'amd_uvd_enc',
 			  'amd_vce_enc',
 			  'amd_vcn',
+			  'amd_vcn_queue',
 			  'amd_vm',
 			  'amd_vrr_range',
 			  'amd_mall',
-- 
2.34.1

