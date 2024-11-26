Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CB4D65531
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 17:29:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FC610E96E;
	Tue, 26 Nov 2024 17:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FURtZWP0";
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2087.outbound.protection.outlook.com [40.107.96.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AD310E1E4
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 17:29:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2CuZGP7pN7l8OTXDGOk9s2369myM0VbwPdzT2MNX7rIuB2YXE0T6HBweIsZTx/ylyMBy0SLrpVaJPRy91vDio7E8a6SsFkrs6FsVq/7pI1GuyUtCwtv8dmgHmHzVJenuTVRV8F+0XF9cOTtjYxq7bnndSEiU7OR1nagCDKyOTj8GFd/FVE3mLqLelN3E4wB5EHSZAVHDOJT4DBZ/XAn79hK1S8nzYVEbufJ/drNFB3F9fgggV1kT1cJuo2i0ZxI1JSs+va/JhymHzSJd1eF7ih5LQ60mvSvgNvkJ+B3OoQGPixjridAXHgB3As7JaFo3bf5NUlQb3WFTNSIit+YcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQG6Spm+NDIxZX77zNTbxpbFOXEh3uZdSRzYxp1xwCU=;
 b=K8mVBNMJslw86yw58QInMCDAOGBnVgapEZAhdfKN426hIJ/ppdZMOD6g3uSISUOFNPFkpFq6CDnhP8KE9vk4zvStCLK0i7l2KFCvqhGEXVSoPVZ59Z8gwuWMaeyA913lwzkw8zUraX2llszPn+2q7RsOXgMH29rokR1uW9XDj9TJU8fmd1hoCSl+/Icr8GupLaRJWgqkaXgm/WfG6JZ1ouIReCd2n96Pmmvlxz9Gw4sNxMLbl6LFI0aNUea83aLWKGumH5qvCB0qq5b2dDzsppZzz5ZUb19quzrf/dnnf2ZY4TaFu6wIotPM9vsRxdPValZstzYQSyqZbZWVohdgWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQG6Spm+NDIxZX77zNTbxpbFOXEh3uZdSRzYxp1xwCU=;
 b=FURtZWP0O2UMqkdydSme4Yp7DN8VAkuYq/vaIsrMQgMiIcfSCJSbqGVU0pqKWy42r5PAMSNWLnOnnLeOrbME76nvX3ka6zeAmxbbylpiayIWAXx0PXd01etFTMeybZIJsUMCgJ0HdWBNglefdTtzExOzl65IexKvd26c1dJWsi0=
Received: from CH3P221CA0014.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::34)
 by SN7PR12MB8147.namprd12.prod.outlook.com (2603:10b6:806:32e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Tue, 26 Nov
 2024 17:29:37 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::79) by CH3P221CA0014.outlook.office365.com
 (2603:10b6:610:1e7::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.21 via Frontend Transport; Tue,
 26 Nov 2024 17:29:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Tue, 26 Nov 2024 17:29:36 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Nov
 2024 11:29:36 -0600
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Nov 2024 11:29:35 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 "Alexander Deucher" <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>,
 Boyuan Zhang <boyuan.zhang@amd.com>
Subject: [PATCH 3/3] tests/amd_uvd: Introduce additional test instance for UVD
 dec.& enc.
Date: Tue, 26 Nov 2024 12:29:23 -0500
Message-ID: <20241126172923.206952-3-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241126172923.206952-1-vitaly.prosyak@amd.com>
References: <20241126172923.206952-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|SN7PR12MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: 10445038-a8c2-46da-5974-08dd0e3fe647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1hw8jRXJPaW7ZX0Dptr0po5e1DD6ezYpZ1svvaDynRGtrwae2UmCihU2zlWI?=
 =?us-ascii?Q?eqb27+FGker+NNg+BtpfnhLGWFijbh3Ew8MGqCoV46K5J3y06ewf01EQQdSR?=
 =?us-ascii?Q?0EDnLYNf74U7nuF61wdZLa+VZ7qp3zujKJwHDTn50q8z59I+WQraLdiHdqOt?=
 =?us-ascii?Q?HSyIT2XhFPjYjsINsIA/FQnsh/F/DL4QZypsdapYyIO3hbuzNr9y0YClYn5a?=
 =?us-ascii?Q?le9K8aPskhwf1cTTfMTYy8CpIEcmOiy0tdcA1qfrW1JroZUpvnIKn0GqxZAz?=
 =?us-ascii?Q?xFe6mUnZl5ai4EI1juv9y1EAT2TimgR8MaPME1RW50PbzQnBuCEiScJPDQQ+?=
 =?us-ascii?Q?h77S+FoJbz0I5EjlOwi9HYvierJjCaMCn3B1dNXlFMR/UxeXGQJ78IpG01Fj?=
 =?us-ascii?Q?0H5N/6WczZ/k+/MhHA1Wi8uPyaCQ8HlZN3ED3YBVynckhbp4PnskQU9+faVb?=
 =?us-ascii?Q?aTk9gZWoo5ylU4ecJH0Sfx3ykkvTE2qAzmrl7MRVlNqucUvwa4K0zhWPAtOm?=
 =?us-ascii?Q?JXaPK83WluhH1IBiPapRRRZme+HWTeXpxpxsMted8LyIzuubMXtOdByVnKeb?=
 =?us-ascii?Q?zw4a2sY7dUB6Nmggp1/RQpdKdjmsiVQW76y0FLPHOqdpMcMnmCR8dRtyOq7j?=
 =?us-ascii?Q?iyRFI/9KZA1cxFraz3ZoxQK4FvFq45MYhPLoylcUU6Q0MUDURiuZHY2x/fM/?=
 =?us-ascii?Q?B1ZzhOEDx1UzKfU+GVOhGG+/D83UHvoJNViQicPbRbY8k7DA0azRNhLrLFaR?=
 =?us-ascii?Q?AiRN48B7LIKmt/7OgZKctqqey+lI+LUZLB7DW8WrwPO/+0iQIcCtXPhRvHIa?=
 =?us-ascii?Q?0iu7MIeOlz9hQGA77qF8IIsWCYgYjyl9QHn6HXLt20VqEiRJLg5hbCzhefTu?=
 =?us-ascii?Q?Tj5Nll2C/HksG5Rt+Pii8zj9KPPUbhNtSZ8vR45tuuzsomXVs4NGx6U/V1y/?=
 =?us-ascii?Q?ENCc4O77C3j3cLDMOa6e8MpMnbBZBaoxtZIoN6YqcOZb3dgGY6cxRyYG37QI?=
 =?us-ascii?Q?XZRuc5CF2rhAKxcAy15A5zj6tpX7BI2TYlfTBW1N1GX2+7JCtoCWDI8k8/Cx?=
 =?us-ascii?Q?xiXAPerjeq6dv8CPqBx9dIHaAWQRCfNZebxcmNG0FfiOrLWUqW0Wj9wTmOzo?=
 =?us-ascii?Q?FqwVfGFILYz3uG0OPZHPRD3X5fT/GjJMp0t4OG75Cuuxmw6C88L8n07OtCH/?=
 =?us-ascii?Q?acQwpb+eMVKUFPeUXvCvYRZaiDkBL0ZhgRSso7/nPru0sYIKSxi58DaOpQdM?=
 =?us-ascii?Q?4kVdVNGuV7gjCk/I6iq8+vGLxFU4uw9PUdauGpMt9kgyTl+Q/4hBxX7tTrcz?=
 =?us-ascii?Q?fZf5QUB1xfeNfRT0LnFJfyCzLBKMV8fpm3viWpeg0WMOioAqQLWj8Lcvk0Tf?=
 =?us-ascii?Q?KONL70mSQ4ll1sDlDUUj6U+KtdO+6yr4SZJyrbmfChNaJ82e8R6Oxo2ailzT?=
 =?us-ascii?Q?LKE7GaIPP0ANJysCDXK83ywz+5BdI5Qs?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 17:29:36.4705 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10445038-a8c2-46da-5974-08dd0e3fe647
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8147
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

Added another process instance to simulate stressful conditions for
UVD decoding and encoding tests, increasing test coverage and
robustness.

Cc: Jesse Zhang  <jesse.zhang@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>
Cc: Leo Liu <leo.liu@amd.com>
Cc: Boyuan Zhang <boyuan.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_uvd_dec.c | 82 +++++++++++++++++++++++++++++++++-----
 tests/amdgpu/amd_uvd_enc.c | 60 ++++++++++++++++++++++++----
 2 files changed, 124 insertions(+), 18 deletions(-)

diff --git a/tests/amdgpu/amd_uvd_dec.c b/tests/amdgpu/amd_uvd_dec.c
index 3ec411aac..4b82549cc 100644
--- a/tests/amdgpu/amd_uvd_dec.c
+++ b/tests/amdgpu/amd_uvd_dec.c
@@ -2,7 +2,11 @@
 // Copyright 2023 Advanced Micro Devices, Inc.
 // Copyright 2014 Advanced Micro Devices, Inc.
 
+#include <spawn.h>
+#include <sys/wait.h>
+
 #include "lib/amdgpu/amd_mmd_shared.h"
+#include "lib/amdgpu/amd_shared_process.h"
 
 static void
 uvd_cmd(uint32_t family_id, uint64_t addr, uint32_t cmd, uint32_t *idx,
@@ -21,6 +25,7 @@ uvd_cmd(uint32_t family_id, uint64_t addr, uint32_t cmd, uint32_t *idx,
 
 static void
 amdgpu_uvd_dec_create(amdgpu_device_handle device_handle,
+		struct shmbuf *sh_mem,
 		struct mmd_shared_context *shared_context,
 		struct mmd_context *context)
 {
@@ -35,6 +40,8 @@ amdgpu_uvd_dec_create(amdgpu_device_handle device_handle,
 	req.alloc_size = 4*1024;
 	req.preferred_heap = AMDGPU_GEM_DOMAIN_GTT;
 
+	sync_point_enter(sh_mem);
+
 	r = amdgpu_bo_alloc(device_handle, &req, &buf_handle);
 	igt_assert_eq(r, 0);
 
@@ -88,11 +95,16 @@ amdgpu_uvd_dec_create(amdgpu_device_handle device_handle,
 
 	r = amdgpu_bo_free(buf_handle);
 	igt_assert_eq(r, 0);
+
+	sync_point_exit(sh_mem);
+
 }
 
 static void
 amdgpu_uvd_decode(amdgpu_device_handle device_handle,
-		struct mmd_context *context, struct mmd_shared_context *shared_context)
+		struct shmbuf *sh_mem,
+		struct mmd_shared_context *shared_context,
+		struct mmd_context *context)
 {
 	const unsigned int dpb_size = 15923584, dt_size = 737280;
 	uint64_t msg_addr, fb_addr, bs_addr, dpb_addr, ctx_addr, dt_addr, it_addr;
@@ -115,6 +127,8 @@ amdgpu_uvd_decode(amdgpu_device_handle device_handle,
 
 	req.preferred_heap = AMDGPU_GEM_DOMAIN_GTT;
 
+	sync_point_enter(sh_mem);
+
 	r = amdgpu_bo_alloc(device_handle, &req, &buf_handle);
 	igt_assert_eq(r, 0);
 
@@ -232,11 +246,15 @@ amdgpu_uvd_decode(amdgpu_device_handle device_handle,
 
 	r = amdgpu_bo_free(buf_handle);
 	igt_assert_eq(r, 0);
+
+	sync_point_exit(sh_mem);
 }
 
 static void
-amdgpu_uvd_dec_destroy(amdgpu_device_handle device_handle, struct mmd_context *context,
-		 struct mmd_shared_context *shared_context)
+amdgpu_uvd_dec_destroy(amdgpu_device_handle device_handle,
+		struct shmbuf *sh_mem,
+		struct mmd_shared_context *shared_context,
+		struct mmd_context *context)
 {
 	struct amdgpu_bo_alloc_request req = {0};
 	amdgpu_bo_handle buf_handle;
@@ -249,6 +267,8 @@ amdgpu_uvd_dec_destroy(amdgpu_device_handle device_handle, struct mmd_context *c
 	req.alloc_size = 4 * 1024;
 	req.preferred_heap = AMDGPU_GEM_DOMAIN_GTT;
 
+	sync_point_enter(sh_mem);
+
 	r = amdgpu_bo_alloc(device_handle, &req, &buf_handle);
 	igt_assert_eq(r, 0);
 
@@ -292,6 +312,8 @@ amdgpu_uvd_dec_destroy(amdgpu_device_handle device_handle, struct mmd_context *c
 
 	r = amdgpu_bo_free(buf_handle);
 	igt_assert_eq(r, 0);
+
+	sync_point_exit(sh_mem);
 }
 
 igt_main
@@ -301,37 +323,77 @@ igt_main
 	struct mmd_shared_context shared_context = {};
 	int fd = -1;
 
+	int r;
+	char cmdline[2048];
+	char shm_name[256] = {};
+	int argc = 0;
+	char **argv = NULL;
+	char *path = NULL;
+	enum  process_type process = PROCESS_UNKNOWN;
+	int fd_shm = -1;
+	struct shmbuf *sh_mem = NULL;
+	posix_spawn_file_actions_t action;
+
+	pid_t pid_brother;
+	uint32_t major, minor;
+	int err;
+
 	igt_fixture {
-		uint32_t major, minor;
-		int err;
+
+		posix_spawn_file_actions_init(&action);
+
+		if (get_command_line(cmdline, &argc, &argv, &path) != 0)
+			igt_fail(IGT_EXIT_FAILURE);
+
+		r = is_run_device_parameter_found(argc, argv, ONDEVICE);
+		snprintf(shm_name, sizeof(shm_name), "/uvd_dec_shm_%d", r);
 
 		fd = drm_open_driver(DRIVER_AMDGPU);
 		err = amdgpu_device_initialize(fd, &major, &minor, &device);
 		igt_require(err == 0);
-		igt_info("Initialized amdgpu, driver version %d.%d\n",
-			 major, minor);
 		err = mmd_shared_context_init(device, &shared_context);
 		igt_require(err == 0);
 		err = mmd_context_init(device, &context);
 		igt_require(err == 0);
 		igt_skip_on(!is_uvd_tests_enable(shared_context.family_id, shared_context.chip_id,
 				shared_context.chip_rev));
+
+		if (is_brother_parameter_found(argc, argv, BROTHER) == 0) {
+			add_brother_parameter(&argc, argv, BROTHER);
+			fd_shm = shared_mem_create(&sh_mem, shm_name);
+			igt_require(fd_shm != -1);
+			launch_brother_process(argc, argv, path, &pid_brother, fd_shm);
+			process = PROCESS_TEST;
+
+		} else {
+			process = PROCESS_BROTHER;
+			pid_brother = getpid();
+		}
+		if (process == PROCESS_BROTHER)
+			fd_shm = shared_mem_open(&sh_mem);
+
 	}
 	igt_describe("Test whether uvd dec is created");
 	igt_subtest("amdgpu_uvd_dec_create")
-	amdgpu_uvd_dec_create(device, &shared_context, &context);
+	amdgpu_uvd_dec_create(device, sh_mem, &shared_context, &context);
 
 	igt_describe("Test whether uvd dec can decode");
 	igt_subtest("amdgpu_uvd_decode")
-	amdgpu_uvd_decode(device, &context, &shared_context);
+	amdgpu_uvd_decode(device, sh_mem, &shared_context, &context);
 
 	igt_describe("Test whether uvd dec is destroyed");
 	igt_subtest("amdgpu_uvd_dec_destroy")
-	amdgpu_uvd_dec_destroy(device, &context, &shared_context);
+	amdgpu_uvd_dec_destroy(device, sh_mem, &shared_context, &context);
 
 	igt_fixture {
 		mmd_context_clean(device, &context);
+		if (process == PROCESS_TEST)
+			waitpid(pid_brother, NULL, 0);
+
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
+		shared_mem_destroy(sh_mem, fd_shm, true, shm_name);
+		posix_spawn_file_actions_destroy(&action);
+		free_command_line(argc, argv, path);
 	}
 }
diff --git a/tests/amdgpu/amd_uvd_enc.c b/tests/amdgpu/amd_uvd_enc.c
index 15fb11fa3..fecda249a 100644
--- a/tests/amdgpu/amd_uvd_enc.c
+++ b/tests/amdgpu/amd_uvd_enc.c
@@ -1,8 +1,11 @@
 // SPDX-License-Identifier: MIT
 // Copyright 2023 Advanced Micro Devices, Inc.
 // Copyright 2017 Advanced Micro Devices, Inc.
+#include <spawn.h>
+#include <sys/wait.h>
 
 #include "lib/amdgpu/amd_mmd_shared.h"
+#include "lib/amdgpu/amd_shared_process.h"
 
 static bool
 is_uvd_enc_enable(amdgpu_device_handle device_handle)
@@ -293,20 +296,24 @@ amdgpu_uvd_enc_destroy(amdgpu_device_handle device_handle,
 }
 
 static void
-amdgpu_uvd_enc_test(amdgpu_device_handle device, struct mmd_shared_context *shared_context)
+amdgpu_uvd_enc_test(amdgpu_device_handle device,
+		struct shmbuf *sh_mem,
+		struct mmd_shared_context *shared_context)
 {
 	struct uvd_enc_context context = {0};
 	int r;
 
+	sync_point_enter(sh_mem);
+
 	r = mmd_context_init(device, &context.uvd);
-	igt_require(r == 0);
+	igt_require(r);
 	amdgpu_uvd_enc_create(device, &context);
 	amdgpu_uvd_enc_session_init(device, &context);
 	amdgpu_uvd_enc_encode(device, &context, shared_context);
 	amdgpu_uvd_enc_destroy(device, &context);
-
 	mmd_context_clean(device, &context.uvd);
 
+	sync_point_exit(sh_mem);
 }
 
 igt_main
@@ -315,28 +322,65 @@ igt_main
 	struct mmd_shared_context shared_context = {};
 	int fd = -1;
 
+	int r;
+	char cmdline[2048];
+	char shm_name[256] = {};
+	int argc = 0;
+	char **argv = NULL;
+	char *path = NULL;
+	enum  process_type process = PROCESS_UNKNOWN;
+	int fd_shm = -1;
+	struct shmbuf *sh_mem = NULL;
+	posix_spawn_file_actions_t action;
+
+	pid_t pid_brother;
+	uint32_t major, minor;
+	int err;
 	igt_fixture {
-		uint32_t major, minor;
-		int err;
+
+		posix_spawn_file_actions_init(&action);
+
+		if (get_command_line(cmdline, &argc, &argv, &path) != 0)
+			igt_fail(IGT_EXIT_FAILURE);
+
+		r = is_run_device_parameter_found(argc, argv, ONDEVICE);
+		snprintf(shm_name, sizeof(shm_name), "/uvd_enc_shm_%d", r);
 
 		fd = drm_open_driver(DRIVER_AMDGPU);
 		err = amdgpu_device_initialize(fd, &major, &minor, &device);
 		igt_require(err == 0);
-		igt_info("Initialized amdgpu, driver version %d.%d\n",
-			 major, minor);
 		memset(&shared_context, 0, sizeof(shared_context));
 		err = mmd_shared_context_init(device, &shared_context);
 		igt_require(err == 0);
 
 		igt_skip_on(!is_uvd_enc_enable(device));
+		if (is_brother_parameter_found(argc, argv, BROTHER) == 0) {
+			add_brother_parameter(&argc, argv, BROTHER);
+			fd_shm = shared_mem_create(&sh_mem, shm_name);
+			igt_require(fd_shm != -1);
+			launch_brother_process(argc, argv, path, &pid_brother, fd_shm);
+			process = PROCESS_TEST;
+
+		} else {
+			process = PROCESS_BROTHER;
+			pid_brother = getpid();
+		}
+		if (process == PROCESS_BROTHER)
+			fd_shm = shared_mem_open(&sh_mem);
 	}
 
 	igt_describe("Test uvd session, encode, destroy");
 	igt_subtest("uvd_encoder")
-		amdgpu_uvd_enc_test(device, &shared_context);
+		amdgpu_uvd_enc_test(device, sh_mem, &shared_context);
 
 	igt_fixture {
+		if (process == PROCESS_TEST)
+			waitpid(pid_brother, NULL, 0);
+
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
+		shared_mem_destroy(sh_mem, fd_shm, true, shm_name);
+		posix_spawn_file_actions_destroy(&action);
+		free_command_line(argc, argv, path);
 	}
 }
-- 
2.25.1

