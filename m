Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED76CD4F52
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 08:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9710E10EB6A;
	Tue, 19 May 2026 08:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="w5PYvAu/";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010068.outbound.protection.outlook.com [52.101.56.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756EB10EB62
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 08:37:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rg4dfQCRNrDz20gG8crd/IR/QK9B3HPs+vyQB8JHJ7y7WTO19rVmpIjZ7atufOidvyljL8KU/kuix/CmoRpkgCeX+qOztBa/5/n7UmeIeA36eKj6uJf6D8YkiwaOndNF0TGRKUSGEjTdDRRRNHEQ0aD+/bVkJ6w39CEvwW1/0rtdN3cAQ9Rc8hWu3p+Xq27ZKVpuPGY/ylG2Xa1qIf7rCLqDH/ZR0QHkE4v45T9GpZgxaJCS6l4jwZKpRK9o12dcZ+NCPhzg8uZ9Jhuh8od1g5G1bdB74aGfxVYDO+cH7gs3I7IeB1U67GJJtPHzBJZX3msSxdJd203a9FXWtU5ecA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9JFp/PCYbLTWvdE5ttJHpStIjH6v6fx9IvulBlCFoo=;
 b=jnXlonwOE7Lfr6tZBuWz0a4naKxjZE3ht0yHLi+WibsZfTbyX6Y64sbB4V9Wcsxe4u+R4bGk7n0OhD4k50aBFlnfnxTZIyLQdZiKVe1ycuRBjKD+Z/rjWH4uhF17I/HHviOuKkNFF1DRh2Czbl5RCT8kbZ1cFMogKWWBDBKh69q6p60TKQ3VHMOVoA4o3HcvjnwtsxkdxGRcXfAHDXHxmrIe/8sQgYEt6dlsHxK+WYpbmCjoMx3n0LqMlC+vBfgiGV32QokM+uT4XFs1r1qGB2Ozr+NY0R8ivV2vNc+CWvmX52OJfHVX5qtXtmZ4O125HS5AW3wk8kpBfTpctmDjng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9JFp/PCYbLTWvdE5ttJHpStIjH6v6fx9IvulBlCFoo=;
 b=w5PYvAu//EIcaFW7C0+r+1HeNd1qjVr+2gxfsjPXQfS+1bYCxw11n+81K/h5NuDsqWWSHxFxaEcqWdL9J9YKU4XQGYBT3OZsS+nP2sPiobinefZwvZM6EYG+u7Umhd/+cnVp3vi49LjgciRQgjKXS7Z+CLXUSfNedHzfrLnFCcw=
Received: from DS7PR03CA0239.namprd03.prod.outlook.com (2603:10b6:5:3ba::34)
 by SJ2PR12MB9192.namprd12.prod.outlook.com (2603:10b6:a03:55d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.20; Tue, 19 May
 2026 08:37:43 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:5:3ba:cafe::3d) by DS7PR03CA0239.outlook.office365.com
 (2603:10b6:5:3ba::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 08:37:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 08:37:42 +0000
Received: from caden-arch.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 03:37:40 -0500
From: Caden Chien <chih-wei.chien@amd.com>
To: <igt-dev@lists.freedesktop.org>, <vitaly.prosyak@amd.com>,
 <jesse.zhang@amd.com>
CC: <Solomon.Chiu@amd.com>, <Peyton.Lee@amd.com>, <HaoPing.Liu@amd.com>,
 <Yu.Wang4@amd.com>, Caden Chien <chih-wei.chien@amd.com>
Subject: [PATCH i-g-t 3/3] tests/amdgpu/vpe: refactor VPE1 blit test
Date: Tue, 19 May 2026 16:29:05 +0800
Message-ID: <20260519082905.4077423-4-chih-wei.chien@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|SJ2PR12MB9192:EE_
X-MS-Office365-Filtering-Correlation-Id: 19547a3a-fc23-492a-a8e7-08deb581e4fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700016|82310400026|20052099010|3023799003|11063799006|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: kG0GUegbuzQ9kSzlAFAjfTe8LrwdLueWQVo3ogzIiI3KlFhqdKjKC37p30PGf7dS0wfRtYQIhYcQ8/8qqOyh1Fc2yBadupLgEk6hKKs0pQ4DqJ7RHAak/6ppRteFnM7+sZ1YNJm71Xd4+UTcAMeMU+mtu9g7wdYj6Oo+Zvi3fCRdQeK5Pb3jj8ELF79POHYlGvl7lgLBcRTjsQeJD/spe+9Z6AKiXJHR4e+SVp34lFalKfENuxeP2o8xLrjj7uVzH7CekO9/H/znbd1sP1DpmaoRGSpZHA3vb0hXAyr7JmJ9XkrvksZr55gBV2D6MI9Zr+aUEBTkjA8cSOGy4RXvCjwcWQkk4BDkinZjGMMATHRtAS5mxHTcU2MS2xV56K988dSJVTVdxuYuakDypO+/Hpq7jKbm4YNkyOS49v/jpYhZjofT2vSxlv/XlNpYyTFFEStjab2P/jxxSkAYdoV5ve4hmmO7rJ6/PNOurs96KMZPJtbtmQCGwMnB1p8UzN5IJ6VunqW8YiBiQhOYo9gbNocSyA7DWfLHq0tZOxMTvinceOHlLhQkJ9TxUH6XeHIrUJ01S1LqnXaKXlS8OyURVUpfjRf8ox61WIUCiYh+WxGY1XFNX1sLUzwHDOUBXo9mFsbu7Oryds0uBuIsYnpy0mmtliOyP/NDCEeRDMZPzH7bMmkhZDSCXwTXLouTE6UwlYr/r86yWo2GUTvgWYEtVCIT4/IVHOOl2JpifXsGRW0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(20052099010)(3023799003)(11063799006)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CCUCzVMpbdzb+4Iaw4CzC8rQLNZHvACv7NQMC9s+T1tZfeMb8yDu8o96KfXjizPh/+6wMfAoBu5bN12+HU4CeyrjWd99SePmRJg26KS/VbuGBQyX6rXvsXlrvpWAwiFY5csDUu3l97aNaUJ2XGfn9TazCdBfIwPi6zgNymPLR0ZPc57swQfZq7DK964xkYOn6gC4HWE8ntQ/m+JcLsvTyLLRiy8UdJBzC8INT3xMk55KedunVSwDlfu/wwIpit3uEosmlnk4hxB2AmSAXHwb7ahxufb5QaxKQMaUuEOg6kLCzIhqIbEfAM+BKySmJV7fiRCtrz/8um6FTnkJm0nnWNX7uccQnrhsTkqfC+A/QfZ0K8skdcTOdMRKQP2td4lb5zknhPwglOsLqjZ8TPvDBIKErYLIVtgZyvENg75BaGsi1ZluWj3dnaSp76YpLNgG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 08:37:42.9566 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19547a3a-fc23-492a-a8e7-08deb581e4fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9192
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

Commands are moved to new header file to clean up source file. New
commands added in the future will follow the same way, so source file
won't be flooded with commands.

Frame size setup is moved into test case to be per test case, instead of
global, as more tests will be added in the future. Variable naming are
revised to align with coding style guide and be consistent with VPE2 blit
test.

Signed-off-by: Caden Chien <chih-wei.chien@amd.com>
---
 tests/amdgpu/amd_vpe.c | 88 ++++++++++++++----------------------------
 tests/amdgpu/amd_vpe.h | 36 +++++++++++++++++
 2 files changed, 65 insertions(+), 59 deletions(-)

diff --git a/tests/amdgpu/amd_vpe.c b/tests/amdgpu/amd_vpe.c
index d5b9f403e..3a1eab9fc 100644
--- a/tests/amdgpu/amd_vpe.c
+++ b/tests/amdgpu/amd_vpe.c
@@ -14,41 +14,6 @@ IGT_TEST_DESCRIPTION("Test VPE functionality");
 
 #define MAX_RESOURCES		16
 
-#define PLANE_WIDTH		1024
-#define PLANE_HEIGHT		256
-#define PLANE_SIZE		(PLANE_WIDTH*PLANE_HEIGHT*4)
-
-#define SRC_PLANE_PATTERN	0x12345678
-#define DST_PLANE_PATTERN	0xff123456
-
-static uint32_t vpe_descriptor[] = {
-0x00000001, 0x33002200, 0xff000021, 0x00000003, 0x33002234, 0xff000021, 0x33002328, 0xff000021,
-0x33002384, 0xff000021, 0x330023c0, 0xff000021,
-};
-
-static uint32_t vpe_config[] = {
-0x00000002, 0x00000000, 0xbeefbe00, 0xff005678, 0x000003ff, 0x00000000, 0x00ff43ff, 0x00000000,
-0xbeefbe00, 0xff005679, 0x000003ff, 0x00000000, 0x00ff43ff, 0x003b0003, 0x00047808, 0x00000809,
-0x0004780c, 0x000000e4, 0x00047d10, 0x00000009, 0x00047d14, 0x00000101, 0x00047d18, 0x00000000,
-0x00047d1c, 0x00000000, 0x00047d20, 0x00000000, 0x00047d24, 0x0001f010, 0x00047d28, 0x0001f010,
-0x00047d2c, 0x0001f010, 0x00547ee9, 0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000,
-0x00002000, 0x00047ee4, 0x00000001, 0x00047ee0, 0x00000000, 0x00047f24, 0x00000000, 0x00047fc4,
-0x00000000, 0x00547f05, 0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x00002000,
-0x00047f00, 0x00000001, 0x00049700, 0x00000000, 0x00049704, 0x0000000f, 0x00049f30, 0x00000000,
-0x00049708, 0x00000000, 0x0004970c, 0xffff0462, 0x0004a208, 0x00000000, 0x0004971c, 0x00000000,
-0x00047fc0, 0x0001f000, 0x00150003, 0x00047df8, 0x00000001, 0x00047dfc, 0x00000001, 0x00047da8,
-0x00000006, 0x00047e18, 0x00000000, 0x0004970c, 0xffff0422, 0x00049710, 0x0001f000, 0x00049714,
-0x0001f000, 0x00049718, 0x0001f000, 0x00049720, 0x00000000, 0x00049724, 0x00000000, 0x00049728,
-0x00000000, 0x000d0003, 0x00047810, 0x00000000, 0x00047814, 0x01000400, 0x00047818, 0x00000000,
-0x0004781c, 0x01000400, 0x00047e00, 0x00000000, 0x00047e04, 0x01000400, 0x00047e08, 0x01000400,
-0x00280003, 0x00047820, 0x00000036, 0x00047824, 0x0960f015, 0x0004972c, 0x00000014, 0x0004972c,
-0x00000014, 0x0004972c, 0x00000014, 0x00049f90, 0x00000000, 0x00049f94, 0x00000001, 0x00549f99,
-0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x00002000, 0x00049850, 0x00000000,
-0x00049f34, 0x00000000, 0x00049f38, 0x02fff000, 0x00049f3c, 0x00fff000, 0x00049f40, 0x00fff000,
-0x0004aba0, 0xffff0000, 0x0004aba0, 0xffff0000, 0x0004aacc, 0x00000000, 0x0004aad4, 0x00000013,
-0x0004aad4, 0x00000013,
-};
-
 static bool is_vpe_tests_enabled(amdgpu_device_handle device_handle,
 		struct mmd_shared_context *shared_context)
 {
@@ -179,17 +144,22 @@ static int check_rgba8888_hmirror(void *addr, uint32_t width, uint32_t height)
 static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
 				struct mmd_context *context)
 {
-	const uint32_t vpep_config_offsets[] = {0x34, 0x128, 0x184, 0x1c0};
-	struct amdgpu_mmd_bo vpe_config_bo, src_plane_bo, dst_plane_bo;
 	int r;
+	uint32_t frame_size;
+	struct amdgpu_mmd_bo vpep_cmd_bo, src_plane_bo, dst_plane_bo;
+	/* same height and pitch for input and output */
+	const uint32_t height = 256;
+	const uint32_t pitch = 1024;
+	const uint32_t vpep_config_offsets[] = { 0x34, 0x128, 0x184, 0x1c0, };
 
+	frame_size = pitch * height * 4;
 	context->num_resources = 0;
 
-	alloc_resource(device_handle, &vpe_config_bo, sizeof(vpe_config), AMDGPU_GEM_DOMAIN_GTT);
-	alloc_resource(device_handle, &src_plane_bo, PLANE_SIZE, AMDGPU_GEM_DOMAIN_GTT);
-	alloc_resource(device_handle, &dst_plane_bo, PLANE_SIZE, AMDGPU_GEM_DOMAIN_GTT);
+	alloc_resource(device_handle, &vpep_cmd_bo, sizeof(vpep_csc_cmd), AMDGPU_GEM_DOMAIN_GTT);
+	alloc_resource(device_handle, &src_plane_bo, frame_size, AMDGPU_GEM_DOMAIN_GTT);
+	alloc_resource(device_handle, &dst_plane_bo, frame_size, AMDGPU_GEM_DOMAIN_GTT);
 
-	r = amdgpu_bo_cpu_map(vpe_config_bo.handle, (void **)&vpe_config_bo.ptr);
+	r = amdgpu_bo_cpu_map(vpep_cmd_bo.handle, (void **)&vpep_cmd_bo.ptr);
 	igt_assert_eq(r, 0);
 
 	r = amdgpu_bo_cpu_map(src_plane_bo.handle, (void **)&src_plane_bo.ptr);
@@ -198,45 +168,45 @@ static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
 	r = amdgpu_bo_cpu_map(dst_plane_bo.handle, (void **)&dst_plane_bo.ptr);
 	igt_assert_eq(r, 0);
 
-	context->resources[context->num_resources++] = vpe_config_bo.handle;
+	context->resources[context->num_resources++] = vpep_cmd_bo.handle;
 	context->resources[context->num_resources++] = src_plane_bo.handle;
 	context->resources[context->num_resources++] = dst_plane_bo.handle;
 
 	// plane config gpu addr
-	*(uint64_t *)(vpe_descriptor + 1) = vpe_config_bo.addr;
+	*(uint64_t *)(vpec_csc_cmd + 1) = vpep_cmd_bo.addr;
 	// vpep config0 gpu addr
-	*(uint64_t *)(vpe_descriptor + 4) = vpe_config_bo.addr + vpep_config_offsets[0];
+	*(uint64_t *)(vpec_csc_cmd + 4) = vpep_cmd_bo.addr + vpep_config_offsets[0];
 	// vpep config1 gpu addr
-	*(uint64_t *)(vpe_descriptor + 6) = vpe_config_bo.addr + vpep_config_offsets[1];
+	*(uint64_t *)(vpec_csc_cmd + 6) = vpep_cmd_bo.addr + vpep_config_offsets[1];
 	// vpep config2 gpu addr
-	*(uint64_t *)(vpe_descriptor + 8) = vpe_config_bo.addr + vpep_config_offsets[2];
+	*(uint64_t *)(vpec_csc_cmd + 8) = vpep_cmd_bo.addr + vpep_config_offsets[2];
 	// vpep config3 gpu addr
-	*(uint64_t *)(vpe_descriptor + 10) = vpe_config_bo.addr + vpep_config_offsets[3];
+	*(uint64_t *)(vpec_csc_cmd + 10) = vpep_cmd_bo.addr + vpep_config_offsets[3];
 
-	memset(src_plane_bo.ptr, 0, PLANE_SIZE);
-	memset(dst_plane_bo.ptr, 0, PLANE_SIZE);
-	create_rgba8888(src_plane_bo.ptr, PLANE_WIDTH, PLANE_HEIGHT);
+	memset(src_plane_bo.ptr, 0, frame_size);
+	memset(dst_plane_bo.ptr, 0, frame_size);
+	create_rgba8888(src_plane_bo.ptr, pitch, height);
 
 	/* gpu address of src */
-	*(uint64_t *)(vpe_config + 2) = src_plane_bo.addr;
+	*(uint64_t *)(vpep_csc_cmd + 2) = src_plane_bo.addr;
 	/* gpu address of dst */
-	*(uint64_t *)(vpe_config + 8) = dst_plane_bo.addr;
+	*(uint64_t *)(vpep_csc_cmd + 8) = dst_plane_bo.addr;
 
-	memset(vpe_config_bo.ptr, 0, sizeof(vpe_config));
-	memcpy(vpe_config_bo.ptr, vpe_config, sizeof(vpe_config));
+	memset(vpep_cmd_bo.ptr, 0, sizeof(vpep_csc_cmd));
+	memcpy(vpep_cmd_bo.ptr, vpep_csc_cmd, sizeof(vpep_csc_cmd));
 
 	memset(context->ib_cpu, 0, IB_SIZE);
-	memcpy(context->ib_cpu, vpe_descriptor, sizeof(vpe_descriptor));
+	memcpy(context->ib_cpu, vpec_csc_cmd, sizeof(vpec_csc_cmd));
 
 	context->resources[context->num_resources++] = context->ib_handle;
 
-	r = submit(device_handle, context, sizeof(vpe_descriptor)/4, AMDGPU_HW_IP_VPE);
+	r = submit(device_handle, context, sizeof(vpec_csc_cmd) / 4, AMDGPU_HW_IP_VPE);
 	igt_assert_eq(r, 0);
 
-	r = check_argb8888(dst_plane_bo.ptr, PLANE_WIDTH, PLANE_HEIGHT);
+	r = check_argb8888(dst_plane_bo.ptr, pitch, height);
 	igt_assert_eq(r, 0);
 
-	r = amdgpu_bo_cpu_unmap(vpe_config_bo.handle);
+	r = amdgpu_bo_cpu_unmap(vpep_cmd_bo.handle);
 	igt_assert_eq(r, 0);
 
 	r = amdgpu_bo_cpu_unmap(src_plane_bo.handle);
@@ -245,7 +215,7 @@ static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
 	r = amdgpu_bo_cpu_unmap(dst_plane_bo.handle);
 	igt_assert_eq(r, 0);
 
-	free_resource(&vpe_config_bo);
+	free_resource(&vpep_cmd_bo);
 	free_resource(&src_plane_bo);
 	free_resource(&dst_plane_bo);
 }
diff --git a/tests/amdgpu/amd_vpe.h b/tests/amdgpu/amd_vpe.h
index 86ad57d14..767750db0 100644
--- a/tests/amdgpu/amd_vpe.h
+++ b/tests/amdgpu/amd_vpe.h
@@ -8,6 +8,42 @@
 
 #include <amdgpu.h>
 
+/* color space conversion commands
+ * source:      1024(pitch 1024) x 256 RGBA
+ * destination: 1024(pitch 1024) x 256 ARGB
+ */
+
+#define SRC_PLANE_PATTERN	0x12345678
+#define DST_PLANE_PATTERN	0xff123456
+
+static uint32_t vpec_csc_cmd[] = {
+0x00000001, 0x33002200, 0xff000021, 0x00000003, 0x33002234, 0xff000021, 0x33002328, 0xff000021,
+0x33002384, 0xff000021, 0x330023c0, 0xff000021,
+};
+
+static uint32_t vpep_csc_cmd[] = {
+0x00000002, 0x00000000, 0xbeefbe00, 0xff005678, 0x000003ff, 0x00000000, 0x00ff43ff, 0x00000000,
+0xbeefbe00, 0xff005679, 0x000003ff, 0x00000000, 0x00ff43ff, 0x003b0003, 0x00047808, 0x00000809,
+0x0004780c, 0x000000e4, 0x00047d10, 0x00000009, 0x00047d14, 0x00000101, 0x00047d18, 0x00000000,
+0x00047d1c, 0x00000000, 0x00047d20, 0x00000000, 0x00047d24, 0x0001f010, 0x00047d28, 0x0001f010,
+0x00047d2c, 0x0001f010, 0x00547ee9, 0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000,
+0x00002000, 0x00047ee4, 0x00000001, 0x00047ee0, 0x00000000, 0x00047f24, 0x00000000, 0x00047fc4,
+0x00000000, 0x00547f05, 0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x00002000,
+0x00047f00, 0x00000001, 0x00049700, 0x00000000, 0x00049704, 0x0000000f, 0x00049f30, 0x00000000,
+0x00049708, 0x00000000, 0x0004970c, 0xffff0462, 0x0004a208, 0x00000000, 0x0004971c, 0x00000000,
+0x00047fc0, 0x0001f000, 0x00150003, 0x00047df8, 0x00000001, 0x00047dfc, 0x00000001, 0x00047da8,
+0x00000006, 0x00047e18, 0x00000000, 0x0004970c, 0xffff0422, 0x00049710, 0x0001f000, 0x00049714,
+0x0001f000, 0x00049718, 0x0001f000, 0x00049720, 0x00000000, 0x00049724, 0x00000000, 0x00049728,
+0x00000000, 0x000d0003, 0x00047810, 0x00000000, 0x00047814, 0x01000400, 0x00047818, 0x00000000,
+0x0004781c, 0x01000400, 0x00047e00, 0x00000000, 0x00047e04, 0x01000400, 0x00047e08, 0x01000400,
+0x00280003, 0x00047820, 0x00000036, 0x00047824, 0x0960f015, 0x0004972c, 0x00000014, 0x0004972c,
+0x00000014, 0x0004972c, 0x00000014, 0x00049f90, 0x00000000, 0x00049f94, 0x00000001, 0x00549f99,
+0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x00002000, 0x00049850, 0x00000000,
+0x00049f34, 0x00000000, 0x00049f38, 0x02fff000, 0x00049f3c, 0x00fff000, 0x00049f40, 0x00fff000,
+0x0004aba0, 0xffff0000, 0x0004aba0, 0xffff0000, 0x0004aacc, 0x00000000, 0x0004aad4, 0x00000013,
+0x0004aad4, 0x00000013,
+};
+
 /* horizontal mirror commands
  * source:      1024(pitch 1024) x 256 RGBA
  * destination: 1024(pitch 1024) x 256 RGBA
-- 
2.53.0

