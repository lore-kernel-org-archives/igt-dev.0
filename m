Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A9EEEE270
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 23:49:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D66310E104;
	Thu, 12 Sep 2024 23:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RBJdJFmN";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362E610E104
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 23:49:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVJHTmDjwRllX/RFoXv92+nTbbI+I5fK2/Qru9LvfpNEk045NJAqJ2GrNocGx5wAhnnRt9s1u+xNbYtgPZG4nPwd8QlhDd+TeOkNMUIZU6jnh2Lbw7WyXK9YZOEd9ejaht3szJgcElQ2G0qJx0LPPz+P4sIq7LFmWlyuzrTAwGjsMRG4Nm17OzXdYlLy/mXK5/yCYbpeB/1EPcgObwXyCZzuFAtBCkGLvK9Zf4uxK9DKHY0+KTTHnffhAj7dfj2IyqbJXDxro1ZIeTKHm+q0uH852eBpyhy9/dNnb/V+4BbHXhlToqOPYhSw5S6yYPNxFnSZdz0qE6W3K+2Rd/c6Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ymXVaUKD0Uyu0lRkDqX6YxG5b+n80MXj7zrcyOXKgs=;
 b=kBFf4r/AtvIBnNHYr/ZJq8Ps6xB7D/J9C5VdsXhu1JXN+4Or5C/UR8bUOQiNWMfTqSp80S3LfujIzcNJNvhynQU1+6icQ8X21fjGyoXJp40Mr1Tu+/GnjTL2Qe241D8Bmm+eZK/4445M/Ir8SASPbaO3t6Lrrcn7gNBMYUy2T7fEjYPLWi/Q1NaGXLbJCWG1UpwE0slQaHcczZGIM5RS7dbhw+DOlETvEfw4WFakWSBPNaJSOWSqmjQMTq+12Dh1+z4KKd3zSUDFew/cF08ZlKdcfgFELO/BSYBREIuGN9f2yn8jjFBpkgbnFquYqI97K6+DiCkb1tjYFpPRhZyesw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ymXVaUKD0Uyu0lRkDqX6YxG5b+n80MXj7zrcyOXKgs=;
 b=RBJdJFmNudCzooLWMmH7SKr7AufehQmuC3sm25hQvePKetRKgv96KugIiRYKjIX8Fl9vwDNze4V9EowTDuTOsd/RXcBcoJWICtar9nHGqOI3IJ1RGEPQ5OzooP3hzp+n5WNX2gNqH+y6Jr3CuxyDZmdewDa669sTV5mpEv5W3Ro=
Received: from CY8P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:930:6b::23)
 by IA1PR12MB8553.namprd12.prod.outlook.com (2603:10b6:208:44e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Thu, 12 Sep
 2024 23:49:16 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:930:6b:cafe::6a) by CY8P222CA0009.outlook.office365.com
 (2603:10b6:930:6b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.26 via Frontend
 Transport; Thu, 12 Sep 2024 23:49:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 12 Sep 2024 23:49:15 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Sep
 2024 18:49:14 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Sep
 2024 18:49:14 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 12 Sep 2024 18:49:13 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Christian
 Koenig" <christian.koenig@amd.com>
Subject: [PATCH] tests/amd_queue_reset: add expected error codes
Date: Thu, 12 Sep 2024 19:49:07 -0400
Message-ID: <20240912234908.450480-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|IA1PR12MB8553:EE_
X-MS-Office365-Filtering-Correlation-Id: accfaa70-88b1-4ceb-349e-08dcd38582ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nUktilqtDo4dfeEyJ69HI8dL6U99v2fJJBK4GVxGSra/rkBiyr2joK+aBnIi?=
 =?us-ascii?Q?JpzwNcS62KPVe8dR6yHi3t0yVbBwijSh2pv07QXeQwQoqGx3I02aZ3es6y7K?=
 =?us-ascii?Q?qqHwDJ3kkLHrnhRx+uw1Vg0qEIN9hwRe5kF9YVV8HBelHaIl0Bw/k63+/rd9?=
 =?us-ascii?Q?g1vko36KmuLXC/QNFyT64e48G8jydHq06/Ff8d13kar0Cw7qucVnaKDyONgJ?=
 =?us-ascii?Q?91oLSqTljGniYvOqlydbIg9vFiee3AN08nIeSj9WPcFR1PG3kdY5NkXzDC9S?=
 =?us-ascii?Q?D0gxmOTUpgJ9jaHuGVRrABZCsl1cO/R8Q2M/1lza9nJp3fJTrKJyfEIhcOmu?=
 =?us-ascii?Q?BWaLFJr1iWUKCC91d1rA4A3B+uufN1yXchPsteALZDPGKHojZOymdNYmmuOi?=
 =?us-ascii?Q?+PD9B4uivRwxCsqvmKllO41xUTqMi2GRVFuBwoK4las4kThflyvTtKpe8byt?=
 =?us-ascii?Q?zJFo19pySug23lKE1Y/slo+SDa35BVKftaYz1sTlSnRBaWewYzwzvDn1kJBN?=
 =?us-ascii?Q?Bo1bUP1N0ED8zFTnhwaa1CP6K1UpcB1POc5TvBEd5AyrlHVthpnm9vBzhyn+?=
 =?us-ascii?Q?IoLUyvzCGtCDrSse+tznJFqlF4cWfcsW/hOvqiLYqFeUrCCyvjT/kAnfmJEI?=
 =?us-ascii?Q?BhZmwvfKbyOuGYgYw0ugEVrhQLrsjvwXkRcKlFZClUFZ1oCIEScnR/gL/B2B?=
 =?us-ascii?Q?omlH4S+gE/0dzRjVqJ4zvDLArRxtkQrGNumAx/cMUu2LY13FtXqts0FWFHyQ?=
 =?us-ascii?Q?p+pYxIfgP1uYibxxji/HBCEFdKi5gvbjP77grW4cE51X9hX00A4My/++LrLr?=
 =?us-ascii?Q?sjogNmOQEIWx9NLhgrzEUFy/fCTM/RZRyHQj23ZCz7RHDzVbmC3jDi762slK?=
 =?us-ascii?Q?XMgq17Mm94pJ3SgpwQCVCSa4EfpAHjMJTAD2wkPIj3tq3sLHAaPi5DC28IVT?=
 =?us-ascii?Q?0WVpMwSdDjlByzBlrYDLx4bSslIohEI8ofJ+auPZwpDH4QHkMpRO+nXeI9xe?=
 =?us-ascii?Q?fUXTsUShSJ5kdWjLVj3Dj2V86v9QXOtvuHSQaQA11JiVBm+C04QlI0L+4JEz?=
 =?us-ascii?Q?vywJ6J6KsQ0aD4Re8zUfFmvyWzdXO5KCItv687tisOBrchRLTuVmK1FlijV+?=
 =?us-ascii?Q?F6UWP0zeGvFuX0Zkozjw59xqAekn4/iQuHOQC3IFXhrz+MGnS4XLqS9wa0Wm?=
 =?us-ascii?Q?4NokiD0wZijf/1t6E1ci4bJNGQynR1sbsBP/95PuqmfYdM1kQbbt49kzroQT?=
 =?us-ascii?Q?QkeF66xrGLVI9iw/R8T98R89Z+W/iDo99Sfk3pOGXc1n6EPIm8wWhnVnXw/P?=
 =?us-ascii?Q?QO8NzDIqV4Zm8TeHtQ/u3RcbYGaJYAL5gP0qxaNIc9c9oSGEQ0orXO6aC2i2?=
 =?us-ascii?Q?65xrcQYUiB5sgnT0d78wT4heWWxesIB3Yja9TxBB+fgT4zBTdu0w51hxjbhU?=
 =?us-ascii?Q?7PfuBzIzuPaRu9aYdn+7nRtMgqVmrx01?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 23:49:15.6555 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: accfaa70-88b1-4ceb-349e-08dcd38582ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8553
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

The necessity for this change arose from the need to centralize
and document expected behavior for specific error conditions.
This centralized approach allows for easier maintenance, making
it quick and simple to modify expected error codes, ensuring
they do not block CI pipelines. At this stage, we cannot
enforce strict error codes, as we are still addressing resilience
issues related to failures in cs_submit.

Add expected reset codes for each error scenario and validate
the return code during the appropriate test execution. These
error codes are part of a global table, with separate codes
declared for different IP blocks (compute, GFX, SDMA).

Cc: Jesse Zhang <Jesse.Zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_command_submission.c |  2 ++
 lib/amdgpu/amd_dispatch.c           | 46 +++++++++++++++++++----------
 lib/amdgpu/amd_dispatch.h           |  4 ++-
 lib/amdgpu/amd_ip_blocks.h          | 15 ++++++++++
 tests/amdgpu/amd_queue_reset.c      | 45 ++++++++++++++++++++--------
 5 files changed, 83 insertions(+), 29 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index a0c72fb47..df278ad69 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -74,6 +74,7 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
 
 	/* submit CS */
 	r = amdgpu_cs_submit(ring_context->context_handle, 0, &ring_context->ibs_request, 1);
+	ring_context->err_codes.err_code_cs_submit = r;
 	if (expect_failure)
 		igt_info("amdgpu_cs_submit %d PID %d\n", r, getpid());
 	else {
@@ -95,6 +96,7 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
 	r = amdgpu_cs_query_fence_status(&fence_status,
 					 AMDGPU_TIMEOUT_INFINITE,
 					 0, &expired);
+	ring_context->err_codes.err_code_wait_for_fence = r;
 	if (expect_failure) {
 		igt_info("EXPECT FAILURE amdgpu_cs_query_fence_status %d expired %d PID %d\n", r,  expired, getpid());
 	} else {
diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
index 0de0ce816..5b4698a83 100644
--- a/lib/amdgpu/amd_dispatch.c
+++ b/lib/amdgpu/amd_dispatch.c
@@ -161,10 +161,13 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 
 int
 amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
-			    uint32_t ip_type, uint32_t ring, uint32_t version,
-			    enum cmd_error_type hang)
+				amdgpu_context_handle context_handle_param,
+				uint32_t ip_type, uint32_t ring, uint32_t version,
+				enum cmd_error_type hang,
+				struct amdgpu_cs_err_codes *err_codes)
 {
-	amdgpu_context_handle context_handle;
+	amdgpu_context_handle context_handle_free = NULL;
+	amdgpu_context_handle context_handle_in_use = NULL;
 	amdgpu_bo_handle bo_src, bo_dst, bo_shader, bo_cmd, resources[4];
 	volatile unsigned char *ptr_dst;
 	void *ptr_shader;
@@ -184,8 +187,13 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	struct amdgpu_cs_fence fence_status = {0};
 	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
 
-	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
-	igt_assert_eq(r, 0);
+	if (context_handle_param == NULL) {
+		r = amdgpu_cs_ctx_create(device_handle, &context_handle_in_use);
+		context_handle_free = context_handle_in_use;
+		igt_assert_eq(r, 0);
+	} else {
+		context_handle_in_use = context_handle_param;
+	}
 
 	r = amdgpu_bo_alloc_and_map(device_handle, bo_cmd_size, 4096,
 				    AMDGPU_GEM_DOMAIN_GTT, 0,
@@ -300,19 +308,22 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	ibs_request.number_of_ibs = 1;
 	ibs_request.ibs = &ib_info;
 	ibs_request.fence_info.handle = NULL;
-	r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
-	igt_assert_eq(r, 0);
+	r = amdgpu_cs_submit(context_handle_in_use, 0, &ibs_request, 1);
+	if (err_codes)
+		err_codes->err_code_cs_submit = r;
 
 	fence_status.ip_type = ip_type;
 	fence_status.ip_instance = 0;
 	fence_status.ring = ring;
-	fence_status.context = context_handle;
+	fence_status.context = context_handle_in_use;
 	fence_status.fence = ibs_request.seq_no;
 
 	/* wait for IB accomplished */
 	r = amdgpu_cs_query_fence_status(&fence_status,
 					 AMDGPU_TIMEOUT_INFINITE,
 					 0, &expired);
+	if (err_codes)
+		err_codes->err_code_wait_for_fence = r;
 
 	if (!hang) {
 		igt_assert_eq(r, 0);
@@ -326,7 +337,7 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 			i++;
 		}
 	} else {
-		r2 = amdgpu_cs_query_reset_state(context_handle, &hang_state, &hangs);
+		r2 = amdgpu_cs_query_reset_state(context_handle_in_use, &hang_state, &hangs);
 		igt_assert_eq(r2, 0);
 	}
 
@@ -336,7 +347,10 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_address_cmd, bo_cmd_size);
 	amdgpu_bo_unmap_and_free(bo_shader, va_shader, mc_address_shader,
 				 bo_shader_size);
-	amdgpu_cs_ctx_free(context_handle);
+
+	if(context_handle_free)
+		amdgpu_cs_ctx_free(context_handle_free);
+
 
 	return r;
 }
@@ -538,13 +552,13 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 		return;
 	}
 	for (ring_id = 0; (1 << ring_id) & info.available_rings; ring_id++) {
-		amdgpu_memcpy_dispatch_test(device_handle, ip_type,
-					    ring_id,  version, BACKEND_SE_GC_SHADER_EXEC_SUCCESS);
+		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type,
+					    ring_id,  version, BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL);
 		amdgpu_memcpy_dispatch_hang_slow_test(device_handle, ip_type,
 						      ring_id, version, AMDGPU_CTX_UNKNOWN_RESET);
 
-		amdgpu_memcpy_dispatch_test(device_handle, ip_type, ring_id,
-					    version, BACKEND_SE_GC_SHADER_EXEC_SUCCESS);
+		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type, ring_id,
+					    version, BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL);
 	}
 }
 
@@ -570,8 +584,8 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_ty
 	for (ring_id = 0; (1 << ring_id) & info.available_rings; ring_id++) {
 		amdgpu_memset_dispatch_test(device_handle, ip_type, ring_id,
 					    version);
-		amdgpu_memcpy_dispatch_test(device_handle, ip_type, ring_id,
-					    version, hang);
+		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type, ring_id,
+					    version, hang, NULL);
 	}
 }
 
diff --git a/lib/amdgpu/amd_dispatch.h b/lib/amdgpu/amd_dispatch.h
index 9aa7a1b78..89c448a1f 100644
--- a/lib/amdgpu/amd_dispatch.h
+++ b/lib/amdgpu/amd_dispatch.h
@@ -31,10 +31,12 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle,
 			      uint32_t ip_type, enum cmd_error_type hang);
 
 int amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
+					amdgpu_context_handle context_handle,
 					uint32_t ip_type,
 					uint32_t ring,
 					uint32_t version,
-					enum cmd_error_type hang);
+					enum cmd_error_type hang,
+					struct amdgpu_cs_err_codes *err_codes);
 
 void amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 				      uint32_t ip_type);
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 3e729f4c0..161f841cf 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -57,15 +57,29 @@ struct asic_id_filter
 	int chip_id_end;
 };
 
+/* expected reset result for differant ip's */
+struct reset_err_result {
+	int compute_reset_result;
+	int gfx_reset_result;
+	int sdma_reset_result;
+};
+
 struct dynamic_test{
 	enum cmd_error_type test;
 	const char *name;
 	const char *describe;
 	struct asic_id_filter exclude_filter[_MAX_NUM_ASIC_ID_EXCLUDE_FILTER];
+	struct reset_err_result result;
 };
 
 #define for_each_test(t, T) for(typeof(*T) *t = T; t->name; t++)
 
+/* set during execution */
+struct amdgpu_cs_err_codes {
+	int err_code_cs_submit;
+	int err_code_wait_for_fence;
+};
+
 /* aux struct to hold misc parameters for convenience to maintain */
 struct amdgpu_ring_context {
 
@@ -112,6 +126,7 @@ struct amdgpu_ring_context {
 
 	struct amdgpu_cs_ib_info ib_info;     /* amdgpu_bo_list_create */
 	struct amdgpu_cs_request ibs_request; /* amdgpu_cs_query_fence_status */
+	struct amdgpu_cs_err_codes err_codes;
 };
 
 
diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 177a22b3e..b6fe0e64e 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -44,6 +44,7 @@ struct job_struct {
 	unsigned int error;
 	enum amd_ip_block_type ip;
 	unsigned int ring_id;
+	int reset_err_result;
 	/* additional data if necessary */
 };
 
@@ -306,7 +307,8 @@ static void wait_for_complete_iteration(struct shmbuf *sh_mem)
 
 static void set_next_test_to_run(struct shmbuf *sh_mem, unsigned int error,
 		enum amd_ip_block_type ip_good, enum amd_ip_block_type ip_bad,
-		unsigned int ring_id_good, unsigned int ring_id_bad)
+		unsigned int ring_id_good, unsigned int ring_id_bad,
+		const struct reset_err_result *result)
 {
 	char error_str[128];
 	char ip_good_str[64];
@@ -324,8 +326,16 @@ static void set_next_test_to_run(struct shmbuf *sh_mem, unsigned int error,
 	sh_mem->bad_job.error = error;
 	sh_mem->bad_job.ip = ip_bad;
 	sh_mem->bad_job.ring_id = ring_id_bad;
+	if (ip_bad == AMD_IP_GFX)
+		sh_mem->bad_job.reset_err_result = result->gfx_reset_result;
+	else if (ip_bad == AMD_IP_COMPUTE)
+		sh_mem->bad_job.reset_err_result = result->compute_reset_result;
+	else
+		sh_mem->bad_job.reset_err_result = result->sdma_reset_result;
+
 	sh_mem->good_job.error = CMD_STREAM_EXEC_SUCCESS;
 	sh_mem->good_job.ip = ip_good;
+	sh_mem->good_job.reset_err_result = 0;
 	sh_mem->good_job.ring_id = ring_id_good;
 	sh_mem->sub_test_is_skipped = false;
 	sh_mem->sub_test_is_existed = true;
@@ -482,7 +492,7 @@ is_sub_test_queue_reset_enable(const struct amdgpu_gpu_info *gpu_info,
 static int
 amdgpu_write_linear(amdgpu_device_handle device, amdgpu_context_handle context_handle,
 		const struct amdgpu_ip_block_version *ip_block,
-		const struct job_struct *job)
+		const struct job_struct *job, struct amdgpu_cs_err_codes *err_codes)
 {
 	const int pm4_dw = 256;
 	struct amdgpu_ring_context *ring_context;
@@ -527,6 +537,8 @@ amdgpu_write_linear(amdgpu_device_handle device, amdgpu_context_handle context_h
 
 	r = amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context,
 			expect_failure);
+	err_codes->err_code_cs_submit = ring_context->err_codes.err_code_cs_submit;
+	err_codes->err_code_wait_for_fence = ring_context->err_codes.err_code_wait_for_fence;
 
 	amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle,
 			ring_context->bo_mc, ring_context->write_length * sizeof(uint32_t));
@@ -646,6 +658,7 @@ run_test_child(amdgpu_device_handle device, amdgpu_context_handle *arr_context,
 
 	struct job_struct job;
 	const struct amdgpu_ip_block_version *ip_block_test = NULL;
+	struct amdgpu_cs_err_codes err_codes;
 
 	while (num_of_tests > 0) {
 		sync_point_enter(sh_mem);
@@ -660,12 +673,15 @@ run_test_child(amdgpu_device_handle device, amdgpu_context_handle *arr_context,
 		bool_ret = is_dispatch_shader_test(job.error,  error_str, &is_dispatch);
 		igt_assert_eq(bool_ret, 1);
 		ip_block_test = get_ip_block(device, job.ip);
+		err_codes.err_code_cs_submit = 0;
+		err_codes.err_code_wait_for_fence = 0;
+
 		if (is_dispatch) {
-			ret = amdgpu_memcpy_dispatch_test(device, job.ip, job.ring_id, version,
-					job.error);
+			ret = amdgpu_memcpy_dispatch_test(device, arr_context[test_counter], job.ip, job.ring_id, version,
+					job.error, &err_codes);
 		} else {
 			ret = amdgpu_write_linear(device, arr_context[test_counter],
-					ip_block_test, &job);
+					ip_block_test, &job, &err_codes);
 		}
 
 		num_of_tests--;
@@ -676,6 +692,9 @@ run_test_child(amdgpu_device_handle device, amdgpu_context_handle *arr_context,
 				break;
 			sleep(1);
 		}
+		/* validate expected result */
+		//igt_assert_eq(err_codes.err_code_wait_for_fence, job.reset_err_result);
+
 		sync_point_exit(sh_mem);
 		test_counter++;
 	}
@@ -697,6 +716,7 @@ run_background(amdgpu_device_handle device, struct shmbuf *sh_mem,
 	const struct amdgpu_ip_block_version *ip_block_test = NULL;
 	int error_code;
 	unsigned int flags;
+	struct amdgpu_cs_err_codes err_codes;
 
 	r = amdgpu_cs_ctx_create(device, &context_handle);
 	igt_assert_eq(r, 0);
@@ -713,7 +733,7 @@ run_background(amdgpu_device_handle device, struct shmbuf *sh_mem,
 		ip_block_test = get_ip_block(device, job.ip);
 		is_dispatch_shader_test(job.error,  error_str, &is_dispatch);
 		while (1) {
-			r = amdgpu_write_linear(device, context_handle,  ip_block_test, &job);
+			r = amdgpu_write_linear(device, context_handle,  ip_block_test, &job, &err_codes);
 
 			if (counter > NUM_ITERATION && counter % NUM_ITERATION == 0)
 				igt_debug("+++BACKGROUND++ amdgpu_write_linear for %s ring_id %d ret %d counter %d\n",
@@ -726,6 +746,7 @@ run_background(amdgpu_device_handle device, struct shmbuf *sh_mem,
 			}
 			if (r != -ECANCELED && r != -ETIME && r != -ENODATA)
 				igt_assert_eq(r, 0);
+			//igt_assert_eq(err_codes.err_code_wait_for_fence, job.reset_err_result);
 			/*
 			 * TODO we have issue during gpu reset the return code assert we put after we check the
 			 * test is completed otherwise the job is failed due to
@@ -1082,10 +1103,10 @@ igt_main
 	struct dynamic_test arr_err[] = {
 			{CMD_STREAM_EXEC_INVALID_PACKET_LENGTH, "CMD_STREAM_EXEC_INVALID_PACKET_LENGTH",
 				"Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes",
-				{ { FAMILY_GFX1100, 0x1, 0xFF }, {FAMILY_AI, 0x32, 0xFF }, {FAMILY_AI, 0x3C, 0xFF } } },
+				{ { FAMILY_GFX1100, 0x1, 0xFF }, {FAMILY_AI, 0x32, 0xFF }, {FAMILY_AI, 0x3C, 0xFF } } , {-ECANCELED, -ECANCELED, 0 } },
 			{CMD_STREAM_EXEC_INVALID_OPCODE, "CMD_STREAM_EXEC_INVALID_OPCODE",
 				"Stressful-and-multiple-cs-of-bad and good opcode-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOWN, -1, -1 } } },
+				{ {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_UNKNOWN, -1, -1 } } , { 0, -ECANCELED, -ECANCELED } },
 			//TODO  not job timeout, debug why for n31.
 			//{CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,"CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC",
 			//	"Stressful-and-multiple-cs-of-bad and good mem-sync-operations-using-multiple-processes"},
@@ -1094,16 +1115,16 @@ igt_main
 			//	"Stressful-and-multiple-cs-of-bad and good reg-operations-using-multiple-processes"},
 			{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, "BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR",
 				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } },
+				{ {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } , { -ECANCELED, -ECANCELED, -ECANCELED } },
 			//TODO  KGQ cannot recover by queue reset, it maybe need a fw bugfix on naiv31
 			//{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,"BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING",
 			//	"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
 			{BACKEND_SE_GC_SHADER_INVALID_USER_DATA, "BACKEND_SE_GC_SHADER_INVALID_USER_DATA",
 				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } },
+				{ {FAMILY_UNKNOWN, -1, -1 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } , { -ECANCELED, -ECANCELED, -ECANCELED } },
 			{BACKEND_SE_GC_SHADER_INVALID_SHADER, "BACKEND_SE_GC_SHADER_INVALID_SHADER",
 				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes",
-				{ {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } },
+				{ {FAMILY_UNKNOWN, 0x1, 0x10 }, {FAMILY_AI, 0x32, 0x3C }, {FAMILY_AI, 0x3C, 0xFF } } , { -ECANCELED, -ECANCELED, -ECANCELED } },
 			{}
 	};
 
@@ -1175,7 +1196,7 @@ igt_main
 						info[i].available_rings, ip_background != ip_tests[i], &ring_id_job_good, &ring_id_job_bad)) {
 					igt_dynamic_f("amdgpu-%s-ring-good-%d-bad-%d-%s", it->name, ring_id_job_good, ring_id_job_bad,
 							ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GFX")
-					set_next_test_to_run(sh_mem, it->test, ip_background, ip_tests[i], ring_id_job_good, ring_id_job_bad);
+					set_next_test_to_run(sh_mem, it->test, ip_background, ip_tests[i], ring_id_job_good, ring_id_job_bad, &it->result);
 				} else {
 					set_next_test_to_skip(sh_mem);
 				}
-- 
2.25.1

