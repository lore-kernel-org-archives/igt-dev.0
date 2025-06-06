Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEC1C5B543
	for <igt-dev@archiver.kernel.org>; Fri,  6 Jun 2025 01:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229BB10EAAE;
	Fri,  6 Jun 2025 01:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QDwh31d3";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B9210EADB
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Jun 2025 01:20:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKE8fp8Tq7dgouoIneOq/6WH+UpfqBpCEDHxjVT+pL4GjZ8KNWbPY9m0ayvvdr1BxslyIJGjYJe4sZEicVW3gl1GOlSh4fQM1kKOKY308q/v+qXVi1HLbkSErm5ct2jV6WRrjU9F+hKLLFL7O0afqftiNlmyYnAwijviRehjqGOfMhbBl5m8EAK8x9UWOXpy5yZHZAEJorACz80GrWXKfXY75C1BLeg/4sBJIq2rYKeTafXrntiwsbhJSuwhWzrtgkDcC0DU4xfVtJDkn3H3mtooYVDv/hAY9SQ+eyFZTUXE34qiaVQfeN8qSV4j7xmdkViin1RG/x4OdCsJeeUxng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wD5vuDP7obs9M2RQFf5+Mz/Iv1qVasAbWzqwar+R15c=;
 b=mViHFzAqzQUy6E8k4CX+fSpYwA7dHZNHl+1VolCVfIp7rpPUJ526W9G4oKto2HlU8iGBshJwHnjgs8hqkmb6cCU8qdcgGUOB7ohMNIVwecJWIXxVGApjj8+ZX2xbDg5hxHnQNJ+SQvnkFaQScKzjL5J2rReiw3wk9v8M7+hsptcrSbDp+B7T49KH+cvJawdPfW6VYHZ0Up9AqRouf3Kd9YCnVUYeOE3i9CZl8CLdrWdQy2qqctrNLafCYzv1F4mg/tS2J7Dz7EBeEpO+8UpEuffMCWnuL4Cfk2FPTYHE1LPY2YyWcLMenkePIj5G5Q7ay78CYbFQ42cpOK8L0JrEgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wD5vuDP7obs9M2RQFf5+Mz/Iv1qVasAbWzqwar+R15c=;
 b=QDwh31d39dZ6Rr7gxIeUlsbcSgrE6rW+eFDArFoiy3CHMN+pMhxyceMXzDa8g7G4iGW+vHn1yrEkqxhYylGT0TZhog405oQbgy9QURR3BsjJTKfadeTTZviWHnbPoucWvcZY4/syxq5HgpkxLxbIgRYAF5TPnkenWCJNhmXzrJw=
Received: from CY5P221CA0099.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:9::44) by
 CY5PR12MB6479.namprd12.prod.outlook.com (2603:10b6:930:34::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.34; Fri, 6 Jun 2025 01:20:04 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:930:9:cafe::29) by CY5P221CA0099.outlook.office365.com
 (2603:10b6:930:9::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Fri,
 6 Jun 2025 01:20:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Fri, 6 Jun 2025 01:20:03 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 20:19:59 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 5 Jun 2025 20:19:59 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Ruili Ji <ruiliji2@amd.com>, Ruijing Dong <ruijing.dong@amd.com>, "Vitaly
 Prosyak" <vitaly.prosyak@amd.com>
Subject: [PATCH 3/4] test/amdgpu: implement vcn queue tests
Date: Thu, 5 Jun 2025 21:19:49 -0400
Message-ID: <20250606011950.151078-3-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606011950.151078-1-vitaly.prosyak@amd.com>
References: <20250606011950.151078-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|CY5PR12MB6479:EE_
X-MS-Office365-Filtering-Correlation-Id: 333398c5-25df-4125-94bd-08dda4984412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Vujrpz3PkQJUXA+/qu6II1JbscemWNZPerVJSzYRn81jcSQpxzMb4yOOKjUU?=
 =?us-ascii?Q?+KjhXF9maMZNYT4GHA/GxJ4gQvXVlqfkUOOnO8W+6sSX6JlE5IVpwUYRPyeb?=
 =?us-ascii?Q?5Aar2BoMjdOtYbeOVK+OXN3/PhvKpz0fCMiW8uCG2azU3xx6+M09QldyFoEL?=
 =?us-ascii?Q?akGtYegyeoutGK+Ret6Eu2FD6BGO148NyYdOJYno6SFPZ4o2tdSTmVyNRqd3?=
 =?us-ascii?Q?bfKz+HC/SxvlJN8kJdswbWvl8hHfmwBahT5P2BTswvuwbnz0DIqhVOliWD43?=
 =?us-ascii?Q?RSO/1zaiJMzjx+31hVDbWx7MEAwenhCgLWbfGRaKrdyGPCVw2e1LiHyjoCMF?=
 =?us-ascii?Q?jWFRHGIaiChI49BwFpD/J60/rG5rQzJVSe/pWH8GGXKrDWlKXSLPtIyrNlX1?=
 =?us-ascii?Q?WlOxhmkpOhbptN+396SVVxNqclGg5MtaQWbRXSapSaEeG75IPBgfTKbTr6Ws?=
 =?us-ascii?Q?3L8tg+dNL0dhL8AEvOqiHOZ/Qs2Jza/yObld4CXEzTVng1/daRRmAY9ZKLb3?=
 =?us-ascii?Q?zxJWsAtoi2kKEpRL7rniDe3Mjn2AWG3lgXiyewqR2kYpNCE4+GEH5CAZtDMV?=
 =?us-ascii?Q?eK9/k+D6n5JJwQYe3kSZMFtqbZ4fyQSzSuyADhBSEEJHM38vvys2nX8p9/SC?=
 =?us-ascii?Q?JA7iT/Zo34ABa/QMCA5z6twZpiRkI5cG5Yk8uwQO4QCs+XiBrl001igFI0Z6?=
 =?us-ascii?Q?kTSl7bnlIIvkYnFxd1jnole7AJ1yrt3IdDU7s1qxepNZYsYSd8yQ0ZYQ/Qfc?=
 =?us-ascii?Q?0dFyoS/FyD/AbObvyd4ly704BW/N+uXu1J8TAUkjPPIC+3WXA+PAvj7WjUWc?=
 =?us-ascii?Q?e2eO4At50WVIV0wILc0/Gp3PT0HSMo7s7ScvQ0497emlK/UObVF7gAarM4H9?=
 =?us-ascii?Q?kI5IXRJ6RptzTpRStIrjSkKSdUBXlgCueJQ6nGsq829c8keorSpMR/4JAhIZ?=
 =?us-ascii?Q?Aun6XayFDzdVj3c+AEExJ2oEgZpv3ly7W7Xm2MEeNT8pi5BcnLRs8r/bqk7D?=
 =?us-ascii?Q?tg/c01OOxaaraXPr3+h1jyyFpjD5FvnhKlFPxjy8Uwq2ePzj94HIyyPbnO4d?=
 =?us-ascii?Q?9j9/JL2maDZm5umkO2sxXMjqrIYqypUe1q3mCYR2ot/5TloADHXNr8p90RwZ?=
 =?us-ascii?Q?TtogsW5SAB/0059a8jEjxcHltVSV5XJCMzjC4xJN1uB7Uosl8Of3sK0qK6d7?=
 =?us-ascii?Q?t9Ln60S3UgSqxcJRysdNufLLv53skC/Hwi4ZEmb/eKMziqMQNB9l7blnh2GS?=
 =?us-ascii?Q?MNKC9FM9pvk0Rep9GcUcYiqcI7eVno+Jtac5OZgiWAedMygy5MALBTGgak9Q?=
 =?us-ascii?Q?9DRSx5GvJ/rtPk+BAAxfNRMc4ywjCJU2UmEYDc3DiPlu5bU6Noh4DgNbLf3e?=
 =?us-ascii?Q?kKPTkLKLl5BCVdgD6Zf0bLRLFnFiIW47n/zo5si7YMqyrN2TiHHGJzUh1JTK?=
 =?us-ascii?Q?doTYmNrMzZ3CeSzvnztmaYc7m+1ha4jq/Xh5nca79H27/zwArE2oQ+WDOffh?=
 =?us-ascii?Q?JyLiDk6CqCMESjCCqZ9MRYA7+VDDnQfDCh6i?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 01:20:03.9519 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 333398c5-25df-4125-94bd-08dda4984412
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6479
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

