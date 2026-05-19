Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFF4CD4F52
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 08:37:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B421110EB14;
	Tue, 19 May 2026 08:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="S/ixLaLS";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011053.outbound.protection.outlook.com [52.101.57.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDBA10EB5E
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 08:37:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmwnpOVNtxUWWwYXRhF0PQgcYSaYFiqKhxE/W69FjaQKLKUdEqwyuGDZr26XiQPnY5hshpupo6DaceeQUm8u59yT1LEKEaJj12iVV+DJRyWunPTN2V62DC6IziA/Sv/9Ic3ZgWa+8gVubN/F2TjFg0b3umEEXNRf7suoQbC2w3nl7FrYG5H/Uwrae8Yiw6Vq3tr8ja74d1fDZ8jGLBdqwV4zq7zG0adqyLhEHsZYH7K+2W1nWijfZzri9TnpqC/yoWVLqpw2qFAYT7ygh5T5z0ezy7BVGip8wjo2/1wdDjcZYdlmVMJGUcaEsD0XZu+d63RxVRgKyVCxmBBYoYmZ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oTospj7P9Cf+DcD9gZ9+ViJsFwIFtJmAGVDg2AYXfDQ=;
 b=S0XNsqcl+bqroXTgRlCuFAPSzDE8BFwx+RWO3uTQE0KPBQKK+qj9uiIS0CJII0dtq/irI6BLBVruK3qNb+w/ZuawyXGeuEs/jShk3NvmDrpfx71Pp9YZFICVAP/L3qh2TrarFFA4jzdoqvMMtCcrLygUjvEQpRV0YMomkv+B9m4G2ZY5glqPpdXLt1GNiI8uTT5S43E6X+EECOuynOfUEQk+it1GObukpbVHArPvNpDbqGLR6NW5Zx/r7es2C3sF0iiL2tLea7gdRueiM/wxASuIeF49MpO+nBeYUB6s9sJhh37F1iu4SpANieFc+I6DdRaDxAscUyIjryU2AkGweA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTospj7P9Cf+DcD9gZ9+ViJsFwIFtJmAGVDg2AYXfDQ=;
 b=S/ixLaLS9NYi7QU8XNR3SjKuBl52gDmAzAD6dUJOYfawiC8cZeKvBBfcPJUCYenE7F4pXEh+9oWN2+ynD5SIv5ppKy9jbomLTmC/6LkXxUxJOm4f7CqyxSkv+Fyc8xE7DcIYLfj56S7AcsxVwm2U7l4T7OCdtQqRqo5fTF3U1zs=
Received: from DS7P220CA0032.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::26) by
 MW4PR12MB6973.namprd12.prod.outlook.com (2603:10b6:303:20a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 08:37:03 +0000
Received: from DS2PEPF000061C4.namprd02.prod.outlook.com
 (2603:10b6:8:223:cafe::48) by DS7P220CA0032.outlook.office365.com
 (2603:10b6:8:223::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 08:37:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF000061C4.mail.protection.outlook.com (10.167.23.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 08:37:02 +0000
Received: from caden-arch.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 03:37:00 -0500
From: Caden Chien <chih-wei.chien@amd.com>
To: <igt-dev@lists.freedesktop.org>, <vitaly.prosyak@amd.com>,
 <jesse.zhang@amd.com>
CC: <Solomon.Chiu@amd.com>, <Peyton.Lee@amd.com>, <HaoPing.Liu@amd.com>,
 <Yu.Wang4@amd.com>, Caden Chien <chih-wei.chien@amd.com>
Subject: [PATCH i-g-t 1/3] tests/amdgpu/vpe: add VPE2 blit test
Date: Tue, 19 May 2026 16:29:03 +0800
Message-ID: <20260519082905.4077423-2-chih-wei.chien@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519082905.4077423-1-chih-wei.chien@amd.com>
References: <20260519082905.4077423-1-chih-wei.chien@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C4:EE_|MW4PR12MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: 846e96c8-6e80-42a2-17b0-08deb581ccef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700016|376014|20052099010|11063799006|22082099003|56012099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info: msF7m7hyubWg0SyKWYIhqmXs7RWO0FgPvlkLBsii7WzWLdjjwsi8j+8FsmjxQk2oBgYtSVVxHGxjKWpOpZnQ9r+nvEO4kL1Ql4psDutqD/WOVKpEan+7uyUoUFThcsJmDAlj1ufZtY5MfoLoC2E5qvlndQfz5zpc8/jdciogJfsAiBmsr73zlhZsn1voaf7mrrgrxs9lZNBSyJ1HHDBbD6z5LiLMwUKbxF3U3NkvqVVxPPjk5Te2xUkewzIX6WKm27BAnmzNlEvUyMhzXiWwQYSN1ELvuiTnzkhIIrivMD8i497P9sfN3tBC5kwV7G7ODRu0zsPCvy88OBwvJftli2+cQPdQnE9fPZHoGXJFRpQToDfprwXbZ0zFKp8lNyatUwTDBsRs8xSGYCO4v83kbCUMzCzxiDuyyhx8S+FYW3CQbjb94P/H26gNLPdK5QZQoqm1nBar6/Ru/g84QrCsHFTsUhQBu/s/Lp5tRA9nt4s3vCd3dM5iJoNdYqaMeYkxlbph+bRlJSxFNgWnnVgOFWUk2HCO80elQjoYlI7YelsSVdkB52wSWgKAWp1vuRAv+RjMYWq9vV8xe3QW/8I2csNUHwEdzuxmM2u4US9/ZCMPBqH90OKVc1FOZcBx7AAgs/N9bfp7MZcCc1eWsFxoPmyN6wwAyk5hjYLT5vFQy6V4duZH0UfDjFyx74BgszCkRyoIABBydhQUzEAfLKDXqtpJoIoZI1YyaFsQVaLBWKg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(20052099010)(11063799006)(22082099003)(56012099003)(18002099003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hWT0b4tjakX1iXz6zAm2r4YtJ14N1PHdpUsXa3KLo32zMHb5WGvqvDVw0OaDELpD6dKlNzV3CzKQy0OYJn3uO46NhYA1OwvogT9owIZLvOYYt2XAoWr2h1umWYLTfxt2KfYM6SFpi8nt6Ucc6jqOozv3nfpR6HuAP6xJETNnAybFOUglxsVKzsUbiGzpYZbn0LfClqmll29kY4SS+H5oS2R83du8y9l41V/2ppiGqaYACDVlXodMtUbcuPTipeL61RBnSm3hJ20wAj/i4vvWXOgdO72y1d/fpe2zs8V64RROj3PExlpJmFrhsdhQoD0RmMsMEJF/mxxB4y28v6WI4DXuweGeOI/3/DeIYo5rfFFLUCrC5Kdiu5k4G10FI436auVMPaKAom86MUPKKPbOjlooT7Tyeh6/ggIO77p2slISRuzbRbzfiSPRYOhyuoTF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 08:37:02.6066 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 846e96c8-6e80-42a2-17b0-08deb581ccef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6973
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

A new test case for horizontal mirroring feature on VPE2 is added as
blit test for VPE2.

Signed-off-by: Caden Chien <chih-wei.chien@amd.com>
Signed-off-by: Peyton Lee <Peyton.Lee@amd.com>
---
 tests/amdgpu/amd_vpe.c | 122 ++++++++++++++++++++-
 tests/amdgpu/amd_vpe.h | 236 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 357 insertions(+), 1 deletion(-)
 create mode 100644 tests/amdgpu/amd_vpe.h

diff --git a/tests/amdgpu/amd_vpe.c b/tests/amdgpu/amd_vpe.c
index 072e521c9..3c7501f47 100644
--- a/tests/amdgpu/amd_vpe.c
+++ b/tests/amdgpu/amd_vpe.c
@@ -3,8 +3,8 @@
  * Copyright 2023 Advanced Micro Devices, Inc.
  */
 
-#include <amdgpu.h>
 #include "amdgpu_drm.h"
+#include "amd_vpe.h"
 
 #include "igt.h"
 
@@ -125,6 +125,22 @@ static void create_rgba8888(void *addr, uint32_t width, uint32_t height)
 		ptr += width;
 	}
 }
+
+// a in byte 0, b in byte 1, g in byte 2, r in byte 3
+static void create_rgba8888_hmirror(void *addr, uint32_t width, uint32_t height)
+{
+	uint32_t *ptr = (uint32_t *)addr;
+
+	for (int i = 0; i < height; i++) {
+		for (int j = 0; j < width / 2; j++)
+			ptr[j] = LEFT_PLANE_PATTERN;
+		for (int j = width / 2; j < width; j++)
+			ptr[j] = RIGHT_PLANE_PATTERN;
+
+		ptr += width;
+	}
+}
+
 // b in byte 0, g in byte 1, r in byte 2, a in byte 3
 static int check_argb8888(void *addr, uint32_t width, uint32_t height)
 {
@@ -140,6 +156,26 @@ static int check_argb8888(void *addr, uint32_t width, uint32_t height)
 	return 0;
 }
 
+// a in byte 0, b in byte 1, g in byte 2, r in byte 3
+static int check_rgba8888_hmirror(void *addr, uint32_t width, uint32_t height)
+{
+	uint32_t *ptr = (uint32_t *)addr;
+
+	ptr += width * (height / 2);
+
+	if (ptr[width / 4] != RIGHT_PLANE_PATTERN) {
+		igt_info("Unexpected left pattern: 0x%x", ptr[width / 4]);
+		return 1;
+	}
+
+	if (ptr[width * 3 / 4] != LEFT_PLANE_PATTERN) {
+		igt_info("Unexpected right pattern: 0x%x", ptr[width * 3 / 4]);
+		return 1;
+	}
+
+	return 0;
+}
+
 static void amdgpu_cs_vpe_blit(amdgpu_device_handle device_handle,
 				struct mmd_context *context)
 {
@@ -214,6 +250,90 @@ static void amdgpu_cs_vpe_blit(amdgpu_device_handle device_handle,
 	free_resource(&dst_plane_bo);
 }
 
+
+static void amdgpu_cs_vpe2_hmirror(amdgpu_device_handle device_handle, struct mmd_context *context)
+{
+	int i, r;
+	uint32_t frame_size;
+	struct amdgpu_mmd_bo vpep_cmd_bo, src_plane_bo, dst_plane_bo;
+	/* same height and pitch for input and output */
+	const uint32_t height = 256;
+	const uint32_t pitch = 1024;
+
+	const uint32_t patch_vpec_index[18] = {
+	 1,  4,  6,  8, 10, 12, 14, 16,
+	18, 20, 22, 24, 26, 28, 30, 32,
+	34, 36, };
+	const uint32_t patch_vpec_offset[18] = {
+	0x0000, 0x0080, 0x00c0, 0x0100, 0x0140, 0x01c0, 0x0740, 0x0b80,
+	0x0c40, 0x0cc0, 0x0d40, 0x1280, 0x16c0, 0x1780, 0x1800, 0x18c0,
+	0x1900, 0x19c0, };
+	const uint32_t patch_src_luma[2] = { 2, 8, };
+	const uint32_t patch_dst_luma[2] = { 14, 20, };
+
+	frame_size = pitch * height * 4;
+	context->num_resources = 0;
+
+	/* prepare source image buffer and data */
+	alloc_resource(device_handle, &src_plane_bo, frame_size, AMDGPU_GEM_DOMAIN_GTT);
+	r = amdgpu_bo_cpu_map(src_plane_bo.handle, (void **)&src_plane_bo.ptr);
+	igt_assert_eq(r, 0);
+	create_rgba8888_hmirror(src_plane_bo.ptr, pitch, height);
+	r = amdgpu_bo_cpu_unmap(src_plane_bo.handle);
+	igt_assert_eq(r, 0);
+
+	/* prepare destination image buffer */
+	alloc_resource(device_handle, &dst_plane_bo, frame_size, AMDGPU_GEM_DOMAIN_GTT);
+	r = amdgpu_bo_cpu_map(dst_plane_bo.handle, (void **)&dst_plane_bo.ptr);
+	igt_assert_eq(r, 0);
+	memset(dst_plane_bo.ptr, 0, frame_size);
+	r = amdgpu_bo_cpu_unmap(dst_plane_bo.handle);
+	igt_assert_eq(r, 0);
+
+	/* prepare VPEP command buffer and setup command buffer data */
+	alloc_resource(device_handle, &vpep_cmd_bo, sizeof(vpep_hmirror_cmd), AMDGPU_GEM_DOMAIN_GTT);
+	/* patch gpu addr of vpep cmd */
+	for (i = 0; i < sizeof(patch_vpec_index) / sizeof(uint32_t); i++) {
+		vpec_hmirror_cmd[patch_vpec_index[i] + 0] = (uint32_t)(vpep_cmd_bo.addr & 0xffffffff) + patch_vpec_offset[i];
+		vpec_hmirror_cmd[patch_vpec_index[i] + 1] = (uint32_t)((vpep_cmd_bo.addr & 0xffffffff00000000) >> 32);
+	}
+	/* patch gpu addr of src/dst plane */
+	for (i = 0; i < sizeof(patch_dst_luma) / sizeof(uint32_t); i++) {
+		vpep_hmirror_cmd[patch_src_luma[i] + 0] =  (uint32_t)(src_plane_bo.addr & 0xffffffff);
+		vpep_hmirror_cmd[patch_src_luma[i] + 1] = (uint32_t)((src_plane_bo.addr & 0xffffffff00000000) >> 32);
+
+		vpep_hmirror_cmd[patch_dst_luma[i] + 0] =  (uint32_t)(dst_plane_bo.addr & 0xffffffff);
+		vpep_hmirror_cmd[patch_dst_luma[i] + 1] = (uint32_t)((dst_plane_bo.addr & 0xffffffff00000000) >> 32);
+	}
+	r = amdgpu_bo_cpu_map(vpep_cmd_bo.handle, (void **)&vpep_cmd_bo.ptr);
+	igt_assert_eq(r, 0);
+	memset(vpep_cmd_bo.ptr, 0, sizeof(vpep_hmirror_cmd));
+	memcpy(vpep_cmd_bo.ptr, vpep_hmirror_cmd, sizeof(vpep_hmirror_cmd));
+	r = amdgpu_bo_cpu_unmap(vpep_cmd_bo.handle);
+	igt_assert_eq(r, 0);
+
+	context->resources[context->num_resources++] = context->ib_handle;
+	context->resources[context->num_resources++] = vpep_cmd_bo.handle;
+	context->resources[context->num_resources++] = src_plane_bo.handle;
+	context->resources[context->num_resources++] = dst_plane_bo.handle;
+
+	memset(context->ib_cpu, 0, IB_SIZE);
+	memcpy(context->ib_cpu, vpec_hmirror_cmd, sizeof(vpec_hmirror_cmd));
+	r = submit(device_handle, context, sizeof(vpec_hmirror_cmd) / 4, AMDGPU_HW_IP_VPE);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_cpu_map(dst_plane_bo.handle, (void **)&dst_plane_bo.ptr);
+	igt_assert_eq(r, 0);
+	r = check_rgba8888_hmirror(dst_plane_bo.ptr, pitch, height);
+	igt_assert_eq(r, 0);
+	r = amdgpu_bo_cpu_unmap(dst_plane_bo.handle);
+	igt_assert_eq(r, 0);
+
+	free_resource(&vpep_cmd_bo);
+	free_resource(&src_plane_bo);
+	free_resource(&dst_plane_bo);
+}
+
 int igt_main()
 {
 	struct mmd_context context = {};
diff --git a/tests/amdgpu/amd_vpe.h b/tests/amdgpu/amd_vpe.h
new file mode 100644
index 000000000..86ad57d14
--- /dev/null
+++ b/tests/amdgpu/amd_vpe.h
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ */
+
+#ifndef AMD_VPE_H
+#define AMD_VPE_H
+
+#include <amdgpu.h>
+
+/* horizontal mirror commands
+ * source:      1024(pitch 1024) x 256 RGBA
+ * destination: 1024(pitch 1024) x 256 RGBA
+ */
+
+#define LEFT_PLANE_PATTERN	0xff123456
+#define RIGHT_PLANE_PATTERN	0xff654321
+
+static uint32_t vpec_hmirror_cmd[38] = {
+0x00000001, 0x00800000, 0xffff8001, 0x00000010, 0x00800080, 0xffff8001, 0x008000c0, 0xffff8001,
+0x00800100, 0xffff8001, 0x00800140, 0xffff8001, 0x008001c0, 0xffff8001, 0x00800740, 0xffff8001,
+0x00800b80, 0xffff8001, 0x00800c40, 0xffff8001, 0x00800cc0, 0xffff8001, 0x00800d40, 0xffff8001,
+0x00801280, 0xffff8001, 0x008016c0, 0xffff8001, 0x00801780, 0xffff8001, 0x00801800, 0xffff8001,
+0x008018c0, 0xffff8001, 0x00801900, 0xffff8001, 0x008019c0, 0xffff8001, };
+
+static uint32_t vpep_hmirror_cmd[1661] = {
+0x00000202, 0x00000004, 0x00400000, 0xffff8001, 0x400003ff, 0x00000200, 0x00ff01ff, 0x00000004,
+0x00400000, 0xffff8001, 0x400003ff, 0x00000000, 0x00ff01ff, 0x00000000, 0x00500000, 0xffff8001,
+0x400003ff, 0x00000000, 0x00ff01ff, 0x00000000, 0x00500000, 0xffff8001, 0x400003ff, 0x00000200,
+0x00ff01ff, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
+0x00070003, 0x0004ab64, 0x00000000, 0x0004ab68, 0x00000000, 0x0004ab6c, 0x00000000, 0x0004ab70,
+0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
+0x00070003, 0x0004ac70, 0x00000000, 0x0004ac74, 0x00000000, 0x0004ac78, 0x00000000, 0x0004ac7c,
+0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
+0x00010003, 0x00049c88, 0x0000000f, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
+0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
+0x001e0003, 0x00047808, 0x00003008, 0x0004780c, 0x000000b4, 0x00047d10, 0x00000008, 0x00047d14,
+0x00000101, 0x00047d30, 0x00000000, 0x00047d18, 0x00000000, 0x00047d1c, 0x00000000, 0x00047d20,
+0x00000000, 0x00047d24, 0x0001f010, 0x00047d28, 0x0001f010, 0x00047d2c, 0x0001f010, 0x00548079,
+0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x00002000, 0x00048074, 0x00000001,
+0x01510003, 0x00048070, 0x00000000, 0x00048138, 0x00000004, 0x000480a4, 0x00000007, 0x0004809c,
+0x00000000, 0x00048098, 0x00000002, 0x000480a8, 0x00016000, 0x000480ac, 0x00016000, 0x000480b0,
+0x00016000, 0x000480c8, 0x00000000, 0x000480c4, 0x00000000, 0x000480c0, 0x00000000, 0x000480ec,
+0x00000000, 0x000480e8, 0x00000000, 0x000480e4, 0x00000000, 0x000480b4, 0x0001b3d0, 0x000480b8,
+0x0001b3d0, 0x000480bc, 0x0001b3d0, 0x000480cc, 0x0001f000, 0x000480d4, 0x0001f000, 0x000480dc,
+0x0001f000, 0x000480d0, 0x00007c00, 0x000480d8, 0x00007c00, 0x000480e0, 0x00007c00, 0x010480f1,
+0x00010000, 0x20041002, 0x40103008, 0x60405020, 0x00007080, 0x00000000, 0x00000000, 0x00000000,
+0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
+0x00000000, 0x100480a0, 0x000123d0, 0x000133d0, 0x000143d0, 0x00014db8, 0x000153d0, 0x000158c4,
+0x00015db8, 0x00016156, 0x000163d0, 0x0001664a, 0x000168c4, 0x00016b4d, 0x00016dfc, 0x00017069,
+0x000171e7, 0x00017378, 0x0001751e, 0x000176d7, 0x000178a5, 0x00017a87, 0x00017c7e, 0x00017e8b,
+0x00018056, 0x00018172, 0x00018298, 0x000183ca, 0x00018506, 0x0001864e, 0x000187a2, 0x00018901,
+0x00018a6b, 0x00018be1, 0x00018d63, 0x00018ef1, 0x00019045, 0x00019118, 0x000191f1, 0x000192d0,
+0x000193b6, 0x000194a1, 0x00019593, 0x0001968c, 0x0001978a, 0x00019890, 0x0001999b, 0x00019aad,
+0x00019bc6, 0x00019ce6, 0x00019e0c, 0x00019f38, 0x0001a036, 0x0001a0d3, 0x0001a173, 0x0001a217,
+0x0001a2bf, 0x0001a36a, 0x0001a418, 0x0001a4ca, 0x0001a580, 0x0001a639, 0x0001a6f5, 0x0001a7b5,
+0x0001a879, 0x0001a941, 0x0001aa0c, 0x0001aadb, 0x0001abad, 0x0001ac83, 0x0001ad5d, 0x0001ae3b,
+0x0001af1d, 0x0001b001, 0x0001b075, 0x0001b0ec, 0x0001b164, 0x0001b1de, 0x0001b25b, 0x0001b2d9,
+0x0001b359, 0x0001b3db, 0x0001b45f, 0x0001b4e5, 0x0001b56d, 0x0001b5f7, 0x0001b683, 0x0001b711,
+0x0001b7a1, 0x0001b833, 0x0001b8c7, 0x0001b95e, 0x0001b9f6, 0x0001ba90, 0x0001bb2c, 0x0001bbcb,
+0x0001bc6b, 0x0001bd0e, 0x0001bdb3, 0x0001be5a, 0x0001bf02, 0x0001bfae, 0x0001c02d, 0x0001c085,
+0x0001c0de, 0x0001c137, 0x0001c192, 0x0001c1ee, 0x0001c24b, 0x0001c2a9, 0x0001c309, 0x0001c369,
+0x0001c3cb, 0x0001c42d, 0x0001c491, 0x0001c4f6, 0x0001c55b, 0x0001c5c2, 0x0001c62b, 0x0001c694,
+0x0001c6fe, 0x0001c76a, 0x0001c7d6, 0x0001c844, 0x0001c8b3, 0x0001c923, 0x0001c995, 0x0001ca07,
+0x0001ca7b, 0x0001caef, 0x0001cb65, 0x0001cbdc, 0x0001cc54, 0x0001ccce, 0x0001cd48, 0x0001cdc4,
+0x0001ce41, 0x0001cebf, 0x0001cf3f, 0x0001cfbf, 0x0001d020, 0x0001d062, 0x0001d0a4, 0x0001d0e6,
+0x0001d12a, 0x0001d16d, 0x0001d1b2, 0x0001d1f7, 0x0001d23d, 0x0001d283, 0x0001d2ca, 0x0001d312,
+0x0001d35a, 0x0001d3a2, 0x0001d3ec, 0x0001d436, 0x0001d481, 0x0001d4cc, 0x0001d518, 0x0001d564,
+0x0001d5b1, 0x0001d5ff, 0x0001d64d, 0x0001d69d, 0x0001d6ec, 0x0001d73d, 0x0001d78d, 0x0001d7df,
+0x0001d831, 0x0001d884, 0x0001d8d8, 0x0001d92c, 0x0001d981, 0x0001d9d6, 0x0001da2c, 0x0001da83,
+0x0001dada, 0x0001db32, 0x0001db8b, 0x0001dbe4, 0x0001dc3e, 0x0001dc99, 0x0001dcf4, 0x0001dd50,
+0x0001ddad, 0x0001de0a, 0x0001de68, 0x0001dec7, 0x0001df26, 0x0001df86, 0x0001dfe7, 0x0001e024,
+0x0001e055, 0x0001e086, 0x0001e0b8, 0x0001e0ea, 0x0001e11c, 0x0001e14f, 0x0001e182, 0x0001e1b5,
+0x0001e1e9, 0x0001e21d, 0x0001e252, 0x0001e286, 0x0001e2bc, 0x0001e2f1, 0x0001e327, 0x0001e35d,
+0x0001e393, 0x0001e3ca, 0x0001e401, 0x0001e439, 0x0001e471, 0x0001e4a9, 0x0001e4e2, 0x0001e51b,
+0x0001e554, 0x0001e58d, 0x0001e5c7, 0x0001e602, 0x0001e63c, 0x0001e678, 0x0001e6b3, 0x0001e6ef,
+0x0001e72b, 0x0001e767, 0x0001e7a4, 0x0001e7e1, 0x0001e81f, 0x0001e85d, 0x0001e89b, 0x0001e8da,
+0x0001e919, 0x0001e958, 0x0001e998, 0x0001e9d8, 0x0001ea18, 0x0001ea59, 0x0001ea9a, 0x0001eadc,
+0x0001eb1e, 0x0001eb60, 0x0001eba3, 0x0001ebe6, 0x0001ec29, 0x0001ec6d, 0x0001ecb1, 0x0001ecf5,
+0x0001ed3a, 0x0001ed80, 0x0001edc5, 0x0001ee0b, 0x0001ee51, 0x0001ee98, 0x0001eedf, 0x0001ef27,
+0x0001ef6f, 0x0001efb7, 0x0001f000, 0x00049c90, 0x00000000, 0x00049700, 0x00000000, 0x00049704,
+0x0000000f, 0x00049e24, 0x00000000, 0x00049708, 0x00000000, 0x0004970c, 0x00000062, 0x00049c68,
+0x00000000, 0x00049bc0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
+0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
+0x01030003, 0x0004a2e4, 0x00050001, 0x0004a214, 0x00000007, 0x0004a20c, 0x00000000, 0x0004a218,
+0x00013000, 0x0004a21c, 0x00013000, 0x0004a220, 0x00013000, 0x0004a238, 0x00000000, 0x0004a234,
+0x00000000, 0x0004a230, 0x00000000, 0x0004a25c, 0x00000000, 0x0004a258, 0x00000000, 0x0004a254,
+0x00000000, 0x0004a224, 0x000229d7, 0x0004a228, 0x000229d7, 0x0004a22c, 0x000229d7, 0x0004a23c,
+0x0001f000, 0x0004a244, 0x0001f000, 0x0004a24c, 0x0001f000, 0x0004a240, 0x00008000, 0x0004a248,
+0x00008000, 0x0004a250, 0x00008000, 0x0104a261, 0x40083000, 0x40284018, 0x40484038, 0x40684058,
+0x40884078, 0x40a84098, 0x00ba10b8, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
+0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0ba4a210, 0x000169d7, 0x00016d11,
+0x00017026, 0x000171c3, 0x00017361, 0x000174fe, 0x0001769c, 0x00017839, 0x000179d7, 0x00017b74,
+0x00017d11, 0x00017eaf, 0x00018026, 0x000180f5, 0x000181c3, 0x00018292, 0x00018361, 0x00018430,
+0x000184fe, 0x000185cd, 0x0001869c, 0x0001876a, 0x00018839, 0x00018908, 0x000189d7, 0x00018b74,
+0x00018d11, 0x00018eaf, 0x00019026, 0x000190f5, 0x000191c3, 0x00019292, 0x00019361, 0x00019430,
+0x000194fe, 0x000195cd, 0x0001969c, 0x0001976a, 0x00019839, 0x00019908, 0x000199d7, 0x00019b74,
+0x00019d11, 0x00019eaf, 0x0001a026, 0x0001a0f5, 0x0001a1c3, 0x0001a292, 0x0001a361, 0x0001a430,
+0x0001a4fd, 0x0001a5c4, 0x0001a687, 0x0001a746, 0x0001a802, 0x0001a8b9, 0x0001a96e, 0x0001aacd,
+0x0001ac20, 0x0001ad68, 0x0001aea6, 0x0001afdc, 0x0001b084, 0x0001b116, 0x0001b1a5, 0x0001b230,
+0x0001b2b9, 0x0001b33e, 0x0001b3c0, 0x0001b440, 0x0001b4bd, 0x0001b537, 0x0001b5af, 0x0001b69a,
+0x0001b77c, 0x0001b857, 0x0001b92c, 0x0001b9fa, 0x0001bac3, 0x0001bb86, 0x0001bc45, 0x0001bcff,
+0x0001bdb4, 0x0001be66, 0x0001bf14, 0x0001bfbe, 0x0001c032, 0x0001c084, 0x0001c0d4, 0x0001c171,
+0x0001c208, 0x0001c29a, 0x0001c328, 0x0001c3b2, 0x0001c438, 0x0001c4ba, 0x0001c539, 0x0001c5b5,
+0x0001c62f, 0x0001c6a5, 0x0001c719, 0x0001c78b, 0x0001c7fa, 0x0001c868, 0x0001c8d3, 0x0001c9a3,
+0x0001ca6d, 0x0001cb30, 0x0001cbee, 0x0001cca5, 0x0001cd58, 0x0001ce06, 0x0001ceb0, 0x0001cf56,
+0x0001cff8, 0x0001d04b, 0x0001d098, 0x0001d0e4, 0x0001d12e, 0x0001d177, 0x0001d1bf, 0x0001d24a,
+0x0001d2d1, 0x0001d353, 0x0001d3d1, 0x0001d44c, 0x0001d4c3, 0x0001d538, 0x0001d5a9, 0x0001d618,
+0x0001d684, 0x0001d6ed, 0x0001d755, 0x0001d7ba, 0x0001d81d, 0x0001d87e, 0x0001d8de, 0x0001d998,
+0x0001da4b, 0x0001daf9, 0x0001dba2, 0x0001dc46, 0x0001dce5, 0x0001dd80, 0x0001de17, 0x0001deab,
+0x0001df3b, 0x0001dfc8, 0x0001e029, 0x0001e06c, 0x0001e0af, 0x0001e0f0, 0x0001e12f, 0x0001e1ab,
+0x0001e223, 0x0001e297, 0x0001e308, 0x0001e375, 0x0001e3e0, 0x0001e447, 0x0001e4ac, 0x0001e50f,
+0x0001e56f, 0x0001e5cd, 0x0001e629, 0x0001e683, 0x0001e6dc, 0x0001e732, 0x0001e788, 0x0001e82d,
+0x0001e8cd, 0x0001e968, 0x0001e9fe, 0x0001ea90, 0x0001eb1e, 0x0001eba8, 0x0001ec2f, 0x0001ecb3,
+0x0001ed33, 0x0001edb1, 0x0001ee2c, 0x0001eea4, 0x0001ef1a, 0x0001ef8e, 0x0001f000, 0x0001f000,
+0x0001f000, 0x0004a208, 0x00000002, 0x00049720, 0x00000000, 0x0004a2a8, 0x00000000, 0x0004a2c8,
+0x00000000, 0x000498f0, 0x00000000, 0x00048134, 0x0001f000, 0x00000000, 0x00000000, 0x00000000,
+0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
+0x002d0003, 0x00047da8, 0x00000000, 0x00047e18, 0x00000004, 0x00047e0c, 0x00000010, 0x00047e10,
+0x00000c00, 0x00047dbc, 0x01000000, 0x00047dcc, 0x01000000, 0x00047dc4, 0x01000000, 0x00047dd8,
+0x01000000, 0x00047dac, 0x00000000, 0x00047da8, 0x00000000, 0x00047e24, 0x00000100, 0x00047e20,
+0x00000100, 0x00047e28, 0x00000000, 0x00047e2c, 0x396d3434, 0x00047e30, 0x00002b97, 0x0004970c,
+0x00000022, 0x00049710, 0x0fff0fff, 0x00049714, 0x0001f000, 0x00049718, 0x0001f000, 0x0004971c,
+0x0001f000, 0x00049724, 0x00000000, 0x00049728, 0x00000000, 0x0004972c, 0x00000000, 0x00000000,
+0x001b0003, 0x00047810, 0x00000200, 0x00047814, 0x01000200, 0x00047818, 0x00000200, 0x0004781c,
+0x01000200, 0x00047e00, 0x00000000, 0x00047e04, 0x01000200, 0x00047e08, 0x01000200, 0x00047dc0,
+0x01800000, 0x00047dc8, 0x01800000, 0x00047dd0, 0x01800000, 0x00047dd4, 0x02800000, 0x00047ddc,
+0x01800000, 0x00047de0, 0x02800000, 0x00048350, 0x70000100, 0x00000000, 0x00000000, 0x00000000,
+0x001e0003, 0x00047820, 0x00003008, 0x00047824, 0x000000b4, 0x00048380, 0x00000008, 0x00048384,
+0x00000101, 0x000483a0, 0x00000000, 0x00048388, 0x00000000, 0x0004838c, 0x00000000, 0x00048390,
+0x00000000, 0x00048394, 0x0001f010, 0x00048398, 0x0001f010, 0x0004839c, 0x0001f010, 0x005486e9,
+0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x00002000, 0x000486e4, 0x00000001,
+0x014b0003, 0x000486e0, 0x00000000, 0x000487a8, 0x00000004, 0x00048714, 0x00000007, 0x0004870c,
+0x00000000, 0x00048708, 0x00000002, 0x00048718, 0x00016000, 0x0004871c, 0x00016000, 0x00048720,
+0x00016000, 0x00048738, 0x00000000, 0x00048734, 0x00000000, 0x00048730, 0x00000000, 0x0004875c,
+0x00000000, 0x00048758, 0x00000000, 0x00048754, 0x00000000, 0x00048724, 0x0001b3d0, 0x00048728,
+0x0001b3d0, 0x0004872c, 0x0001b3d0, 0x0004873c, 0x0001f000, 0x00048744, 0x0001f000, 0x0004874c,
+0x0001f000, 0x00048740, 0x00007c00, 0x00048748, 0x00007c00, 0x00048750, 0x00007c00, 0x01048761,
+0x00010000, 0x20041002, 0x40103008, 0x60405020, 0x00007080, 0x00000000, 0x00000000, 0x00000000,
+0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
+0x00000000, 0x10048710, 0x000123d0, 0x000133d0, 0x000143d0, 0x00014db8, 0x000153d0, 0x000158c4,
+0x00015db8, 0x00016156, 0x000163d0, 0x0001664a, 0x000168c4, 0x00016b4d, 0x00016dfc, 0x00017069,
+0x000171e7, 0x00017378, 0x0001751e, 0x000176d7, 0x000178a5, 0x00017a87, 0x00017c7e, 0x00017e8b,
+0x00018056, 0x00018172, 0x00018298, 0x000183ca, 0x00018506, 0x0001864e, 0x000187a2, 0x00018901,
+0x00018a6b, 0x00018be1, 0x00018d63, 0x00018ef1, 0x00019045, 0x00019118, 0x000191f1, 0x000192d0,
+0x000193b6, 0x000194a1, 0x00019593, 0x0001968c, 0x0001978a, 0x00019890, 0x0001999b, 0x00019aad,
+0x00019bc6, 0x00019ce6, 0x00019e0c, 0x00019f38, 0x0001a036, 0x0001a0d3, 0x0001a173, 0x0001a217,
+0x0001a2bf, 0x0001a36a, 0x0001a418, 0x0001a4ca, 0x0001a580, 0x0001a639, 0x0001a6f5, 0x0001a7b5,
+0x0001a879, 0x0001a941, 0x0001aa0c, 0x0001aadb, 0x0001abad, 0x0001ac83, 0x0001ad5d, 0x0001ae3b,
+0x0001af1d, 0x0001b001, 0x0001b075, 0x0001b0ec, 0x0001b164, 0x0001b1de, 0x0001b25b, 0x0001b2d9,
+0x0001b359, 0x0001b3db, 0x0001b45f, 0x0001b4e5, 0x0001b56d, 0x0001b5f7, 0x0001b683, 0x0001b711,
+0x0001b7a1, 0x0001b833, 0x0001b8c7, 0x0001b95e, 0x0001b9f6, 0x0001ba90, 0x0001bb2c, 0x0001bbcb,
+0x0001bc6b, 0x0001bd0e, 0x0001bdb3, 0x0001be5a, 0x0001bf02, 0x0001bfae, 0x0001c02d, 0x0001c085,
+0x0001c0de, 0x0001c137, 0x0001c192, 0x0001c1ee, 0x0001c24b, 0x0001c2a9, 0x0001c309, 0x0001c369,
+0x0001c3cb, 0x0001c42d, 0x0001c491, 0x0001c4f6, 0x0001c55b, 0x0001c5c2, 0x0001c62b, 0x0001c694,
+0x0001c6fe, 0x0001c76a, 0x0001c7d6, 0x0001c844, 0x0001c8b3, 0x0001c923, 0x0001c995, 0x0001ca07,
+0x0001ca7b, 0x0001caef, 0x0001cb65, 0x0001cbdc, 0x0001cc54, 0x0001ccce, 0x0001cd48, 0x0001cdc4,
+0x0001ce41, 0x0001cebf, 0x0001cf3f, 0x0001cfbf, 0x0001d020, 0x0001d062, 0x0001d0a4, 0x0001d0e6,
+0x0001d12a, 0x0001d16d, 0x0001d1b2, 0x0001d1f7, 0x0001d23d, 0x0001d283, 0x0001d2ca, 0x0001d312,
+0x0001d35a, 0x0001d3a2, 0x0001d3ec, 0x0001d436, 0x0001d481, 0x0001d4cc, 0x0001d518, 0x0001d564,
+0x0001d5b1, 0x0001d5ff, 0x0001d64d, 0x0001d69d, 0x0001d6ec, 0x0001d73d, 0x0001d78d, 0x0001d7df,
+0x0001d831, 0x0001d884, 0x0001d8d8, 0x0001d92c, 0x0001d981, 0x0001d9d6, 0x0001da2c, 0x0001da83,
+0x0001dada, 0x0001db32, 0x0001db8b, 0x0001dbe4, 0x0001dc3e, 0x0001dc99, 0x0001dcf4, 0x0001dd50,
+0x0001ddad, 0x0001de0a, 0x0001de68, 0x0001dec7, 0x0001df26, 0x0001df86, 0x0001dfe7, 0x0001e024,
+0x0001e055, 0x0001e086, 0x0001e0b8, 0x0001e0ea, 0x0001e11c, 0x0001e14f, 0x0001e182, 0x0001e1b5,
+0x0001e1e9, 0x0001e21d, 0x0001e252, 0x0001e286, 0x0001e2bc, 0x0001e2f1, 0x0001e327, 0x0001e35d,
+0x0001e393, 0x0001e3ca, 0x0001e401, 0x0001e439, 0x0001e471, 0x0001e4a9, 0x0001e4e2, 0x0001e51b,
+0x0001e554, 0x0001e58d, 0x0001e5c7, 0x0001e602, 0x0001e63c, 0x0001e678, 0x0001e6b3, 0x0001e6ef,
+0x0001e72b, 0x0001e767, 0x0001e7a4, 0x0001e7e1, 0x0001e81f, 0x0001e85d, 0x0001e89b, 0x0001e8da,
+0x0001e919, 0x0001e958, 0x0001e998, 0x0001e9d8, 0x0001ea18, 0x0001ea59, 0x0001ea9a, 0x0001eadc,
+0x0001eb1e, 0x0001eb60, 0x0001eba3, 0x0001ebe6, 0x0001ec29, 0x0001ec6d, 0x0001ecb1, 0x0001ecf5,
+0x0001ed3a, 0x0001ed80, 0x0001edc5, 0x0001ee0b, 0x0001ee51, 0x0001ee98, 0x0001eedf, 0x0001ef27,
+0x0001ef6f, 0x0001efb7, 0x0001f000, 0x00049754, 0x00000001, 0x00049758, 0x0000000f, 0x00049e38,
+0x00000001, 0x0004975c, 0x00000001, 0x00049760, 0x00000062, 0x00000000, 0x00000000, 0x00000000,
+0x01030003, 0x0004a524, 0x00050001, 0x0004a454, 0x00000007, 0x0004a44c, 0x00000000, 0x0004a458,
+0x00013000, 0x0004a45c, 0x00013000, 0x0004a460, 0x00013000, 0x0004a478, 0x00000000, 0x0004a474,
+0x00000000, 0x0004a470, 0x00000000, 0x0004a49c, 0x00000000, 0x0004a498, 0x00000000, 0x0004a494,
+0x00000000, 0x0004a464, 0x000229d7, 0x0004a468, 0x000229d7, 0x0004a46c, 0x000229d7, 0x0004a47c,
+0x0001f000, 0x0004a484, 0x0001f000, 0x0004a48c, 0x0001f000, 0x0004a480, 0x00008000, 0x0004a488,
+0x00008000, 0x0004a490, 0x00008000, 0x0104a4a1, 0x40083000, 0x40284018, 0x40484038, 0x40684058,
+0x40884078, 0x40a84098, 0x00ba10b8, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
+0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x0ba4a450, 0x000169d7, 0x00016d11,
+0x00017026, 0x000171c3, 0x00017361, 0x000174fe, 0x0001769c, 0x00017839, 0x000179d7, 0x00017b74,
+0x00017d11, 0x00017eaf, 0x00018026, 0x000180f5, 0x000181c3, 0x00018292, 0x00018361, 0x00018430,
+0x000184fe, 0x000185cd, 0x0001869c, 0x0001876a, 0x00018839, 0x00018908, 0x000189d7, 0x00018b74,
+0x00018d11, 0x00018eaf, 0x00019026, 0x000190f5, 0x000191c3, 0x00019292, 0x00019361, 0x00019430,
+0x000194fe, 0x000195cd, 0x0001969c, 0x0001976a, 0x00019839, 0x00019908, 0x000199d7, 0x00019b74,
+0x00019d11, 0x00019eaf, 0x0001a026, 0x0001a0f5, 0x0001a1c3, 0x0001a292, 0x0001a361, 0x0001a430,
+0x0001a4fd, 0x0001a5c4, 0x0001a687, 0x0001a746, 0x0001a802, 0x0001a8b9, 0x0001a96e, 0x0001aacd,
+0x0001ac20, 0x0001ad68, 0x0001aea6, 0x0001afdc, 0x0001b084, 0x0001b116, 0x0001b1a5, 0x0001b230,
+0x0001b2b9, 0x0001b33e, 0x0001b3c0, 0x0001b440, 0x0001b4bd, 0x0001b537, 0x0001b5af, 0x0001b69a,
+0x0001b77c, 0x0001b857, 0x0001b92c, 0x0001b9fa, 0x0001bac3, 0x0001bb86, 0x0001bc45, 0x0001bcff,
+0x0001bdb4, 0x0001be66, 0x0001bf14, 0x0001bfbe, 0x0001c032, 0x0001c084, 0x0001c0d4, 0x0001c171,
+0x0001c208, 0x0001c29a, 0x0001c328, 0x0001c3b2, 0x0001c438, 0x0001c4ba, 0x0001c539, 0x0001c5b5,
+0x0001c62f, 0x0001c6a5, 0x0001c719, 0x0001c78b, 0x0001c7fa, 0x0001c868, 0x0001c8d3, 0x0001c9a3,
+0x0001ca6d, 0x0001cb30, 0x0001cbee, 0x0001cca5, 0x0001cd58, 0x0001ce06, 0x0001ceb0, 0x0001cf56,
+0x0001cff8, 0x0001d04b, 0x0001d098, 0x0001d0e4, 0x0001d12e, 0x0001d177, 0x0001d1bf, 0x0001d24a,
+0x0001d2d1, 0x0001d353, 0x0001d3d1, 0x0001d44c, 0x0001d4c3, 0x0001d538, 0x0001d5a9, 0x0001d618,
+0x0001d684, 0x0001d6ed, 0x0001d755, 0x0001d7ba, 0x0001d81d, 0x0001d87e, 0x0001d8de, 0x0001d998,
+0x0001da4b, 0x0001daf9, 0x0001dba2, 0x0001dc46, 0x0001dce5, 0x0001dd80, 0x0001de17, 0x0001deab,
+0x0001df3b, 0x0001dfc8, 0x0001e029, 0x0001e06c, 0x0001e0af, 0x0001e0f0, 0x0001e12f, 0x0001e1ab,
+0x0001e223, 0x0001e297, 0x0001e308, 0x0001e375, 0x0001e3e0, 0x0001e447, 0x0001e4ac, 0x0001e50f,
+0x0001e56f, 0x0001e5cd, 0x0001e629, 0x0001e683, 0x0001e6dc, 0x0001e732, 0x0001e788, 0x0001e82d,
+0x0001e8cd, 0x0001e968, 0x0001e9fe, 0x0001ea90, 0x0001eb1e, 0x0001eba8, 0x0001ec2f, 0x0001ecb3,
+0x0001ed33, 0x0001edb1, 0x0001ee2c, 0x0001eea4, 0x0001ef1a, 0x0001ef8e, 0x0001f000, 0x0001f000,
+0x0001f000, 0x0004a448, 0x00000002, 0x00049774, 0x00000000, 0x0004a4e8, 0x00000000, 0x0004a508,
+0x00000000, 0x000499cc, 0x00000000, 0x000487a4, 0x0001f000, 0x00000000, 0x00000000, 0x00000000,
+0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
+0x002d0003, 0x00048418, 0x00000000, 0x00048488, 0x00000004, 0x0004847c, 0x00000010, 0x00048480,
+0x00000c00, 0x0004842c, 0x01000000, 0x0004843c, 0x01000000, 0x00048434, 0x01000000, 0x00048448,
+0x01000000, 0x0004841c, 0x00000000, 0x00048418, 0x00000000, 0x00048494, 0x00000100, 0x00048490,
+0x00000100, 0x00048498, 0x00000000, 0x0004849c, 0x396d3434, 0x000484a0, 0x00002b97, 0x00049760,
+0x00000022, 0x00049764, 0x0fff0fff, 0x00049768, 0x0001f000, 0x0004976c, 0x0001f000, 0x00049770,
+0x0001f000, 0x00049778, 0x00000000, 0x0004977c, 0x00000000, 0x00049780, 0x00000000, 0x00000000,
+0x001b0003, 0x00047828, 0x00000000, 0x0004782c, 0x01000200, 0x00047830, 0x00000000, 0x00047834,
+0x01000200, 0x00048470, 0x00000000, 0x00048474, 0x01000200, 0x00048478, 0x01000200, 0x00048430,
+0x01800000, 0x00048438, 0x01800000, 0x00048440, 0x01800000, 0x00048444, 0x02800000, 0x0004844c,
+0x01800000, 0x00048450, 0x02800000, 0x00048350, 0x70000000, 0x00000000, 0x00000000, 0x00000000,
+0x002e0003, 0x0004783c, 0x0960f014, 0x0004789c, 0x00000000, 0x0004af1c, 0x00000000, 0x00049850,
+0x00000000, 0x00049e28, 0x00000000, 0x00049e2c, 0x02fff000, 0x00049e30, 0x00fff000, 0x00049e34,
+0x00fff000, 0x00049730, 0x00000014, 0x00049730, 0x00000014, 0x00049730, 0x00000014, 0x00049e74,
+0x00000000, 0x00049e78, 0x00000001, 0x00549e7d, 0x00002000, 0x00000000, 0x20000000, 0x00000000,
+0x00000000, 0x00002000, 0x0004ab60, 0xffff0000, 0x0004ab60, 0xffff0000, 0x0004ab60, 0xffff0000,
+0x0004aacc, 0x00000000, 0x0004aad4, 0x00000013, 0x0004aad4, 0x00000013, 0x0004aae4, 0x00000000,
+0x000b0003, 0x0004ab64, 0x00000000, 0x0004ab68, 0x00000000, 0x0004ab6c, 0x00000000, 0x0004ab70,
+0x00000000, 0x0004aad0, 0x00000000, 0x00047838, 0x00000827, 0x00000000, 0x00000000, 0x00000000,
+0x002a0003, 0x00047844, 0x0960f014, 0x0004992c, 0x00000000, 0x00049e3c, 0x00000000, 0x00049e40,
+0x02fff000, 0x00049e44, 0x00fff000, 0x00049e48, 0x00fff000, 0x00049784, 0x00000014, 0x00049784,
+0x00000014, 0x00049784, 0x00000014, 0x00049e74, 0x00000000, 0x00049e94, 0x00000001, 0x00549e99,
+0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x00002000, 0x0004ac6c, 0xffff0000,
+0x0004ac6c, 0xffff0000, 0x0004ac6c, 0xffff0000, 0x0004abd8, 0x00000000, 0x0004abe0, 0x00000013,
+0x0004abe0, 0x00000013, 0x0004abf0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
+0x000b0003, 0x0004ac70, 0x00000000, 0x0004ac74, 0x00000000, 0x0004ac78, 0x00000000, 0x0004ac7c,
+0x00000000, 0x0004abdc, 0x00000000, 0x00047840, 0x00000827, };
+
+#endif
-- 
2.53.0

