Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF490CAC5B0
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 21:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5209910E2DC;
	Thu, 25 Sep 2025 21:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kpqmNjah";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013002.outbound.protection.outlook.com
 [40.93.201.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A83610E2DC
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 21:00:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nPJrXLEq6FP+zOCcMtrDYrqJGA4GzsOpPurNnb/Ig9VdHl8VGRipBAO35ld4bfjSxZDRyCJRdWe8ac9X3i11D1XmVZzibut6DoROq2yMFYlCh7gxWd6AkcnqSlcvtWoG+gIMTPnY5omobgv3fJ7ioLkmZQQv3i7TO4LAyPqTAyANfuNk77TeqTyVsorCp52x/8XSl/sls7DbhFsoYyevJAPFL9slP5Qd8GbRBCMpJ2AO8ZY1ughuJW2Q8iIPJv8i4FqP4fXsoYr0S6TMT/E51yociqC+Z9miocsGbQu71RkiG1qT5j8JggFgXOznnnG/n3WQ4MTEjdKigjEVXGW0Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTQFfstiSBSJUjgc50I+9qsRuHYWsVhlyNGJYRoN2Xs=;
 b=OZrqCiFXZG9Pfddb3Es3NQ+Dv9yGJsK5HAFT/v4SyLaQs75gRKm4xsfRkzy2tEcFPBgUTawTzRf74q+eP3jclhfXUa/fmPFUSkBw++gIv4C5JujNVSeUUaIXTOXfxqlaYoK0oSba0qZo5gnFxV6j7aEMcpLEsh3XdVV6zywrQZuPGdfE6xqEM+UBTsBimrBEwXSBPB4C2krkgxhRCxExZSIiVehQolI4YmEdjrMBEYGM2+gxM7nxnBanTNQ90JDwQG2LeCZasMI/IMYyl9iWBkpvrtR8eoqh8cZnhj2b/DdV0nqLGFzVKfV5TekOGpMEqOF+l/RDuFeGi34g8v1/mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTQFfstiSBSJUjgc50I+9qsRuHYWsVhlyNGJYRoN2Xs=;
 b=kpqmNjahiRp0wldPvySuT5PXPxonJ3Hah9jlV9ztKxAHutIkJVRqxyACwEa9bnJP3JVZOVYPz1eZCWRFdxu5AJrwMW1mPLPyhO4tVUro1wHBhlVDuIC0HHJ45GYuiPBlCvfRAZbbyYDWB27/mFCiAq2uxUw2ghQSjbF3PSRAT4c=
Received: from SJ0PR13CA0047.namprd13.prod.outlook.com (2603:10b6:a03:2c2::22)
 by PH0PR12MB7981.namprd12.prod.outlook.com (2603:10b6:510:26c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 21:00:43 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::be) by SJ0PR13CA0047.outlook.office365.com
 (2603:10b6:a03:2c2::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9 via Frontend Transport; Thu,
 25 Sep 2025 21:00:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002326.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Thu, 25 Sep 2025 21:00:42 +0000
Received: from yinjiyao-dev24.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 25 Sep
 2025 14:00:42 -0700
From: Yinjie Yao <yinjie.yao@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Yinjie Yao <yinjie.yao@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH 1/3] lib/amdgpu: increase IB_SIZE for VCN
Date: Thu, 25 Sep 2025 16:59:00 -0400
Message-ID: <20250925205946.324277-2-yinjie.yao@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|PH0PR12MB7981:EE_
X-MS-Office365-Filtering-Correlation-Id: 77d40bb0-5e20-47be-582e-08ddfc769722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GYTAZWTqlrEK/r9Ygz0C6+VhtwRe+E9FGynlYwdkcfV9wJNVedjKUnGeQKur?=
 =?us-ascii?Q?SiTlH1in6suri920vOJEehM8kmlpjh7nWhCExxv7vnRzSJx9aHzqZqjLW3UV?=
 =?us-ascii?Q?aUF9a5bNJ1mQx9UDAFGiwKhbBuTqAbfaX8Wy1YC04rTX3twgfPyWy1Iju/nZ?=
 =?us-ascii?Q?nQu4+q+5hiwGVcTBZeQ69EqOpMi37tW6AvTShqdq0Supq2vOTCPPQb9BtH0K?=
 =?us-ascii?Q?Jqd1ZUMrGp8l58tNpZsndSGz229DQumi9EoZXpobbI8fnPdmPZVNiGJSdjTS?=
 =?us-ascii?Q?nMKyE+h2SxGtmhWpPRqass582wxcyHL9CS1kuBZPdSDtCKCoiIFcVLj8lKAV?=
 =?us-ascii?Q?iXZw758J6nCrjvlC76xSf9aiLRidp7p8TG7jbKo1wH2QjoaLVtHqiyq8uZIr?=
 =?us-ascii?Q?2nj2oUTXHvnkYFk60/3NF5QOjSuT1Vd31xGXRiCziv2DrUQz8bJ+6DNHtjMA?=
 =?us-ascii?Q?2gE4DLdPVrZvQbm7FGgkN4VNmw7S6XHfHTXo+HlFT993KvbTtc6NVNKhXUxr?=
 =?us-ascii?Q?0z5IbPAgb7hbogFVFbtyW2YSBN5vpR1SFPsjPk9McG5NbN4jrWuEKNhPXfU3?=
 =?us-ascii?Q?NFFoRzkZGiZTdPCTvdCienFB4ywERbYDPMJEGSK8fx7lBwSWZ9poT+WUdz8i?=
 =?us-ascii?Q?Fdlx5eq+ej4lVFzkGVXrwABiIyPGN1enjuqn/cFXEXPQh5ld7GPV7cdnmTbJ?=
 =?us-ascii?Q?b6sGUZGkq3nZQ387CX7TEg3KmdSSM3B5/wYloNaEpn/zhBCLr4boeN5Ui9AU?=
 =?us-ascii?Q?yfAqOdWHfyV+72brrAJDrWdw24/QILCkHJ6LgJAaW0JUHI7VFIliRNpkCl4o?=
 =?us-ascii?Q?PUG2ZfwaZMsV4SWFEyYhMlmOz19opsP2ohppT7zhC5uPDkAKT45CPSSa7Xdr?=
 =?us-ascii?Q?JLFE1mD/7GwvVSvIzSP+k51sqS3HyxBllA8VrHUGTGbIeznnZZujdU9Swaef?=
 =?us-ascii?Q?ycRjtmRVVfAHjYmnt212cEixrrsYkjqr/oDbw2toiMdlXg17buc5hTQHdj90?=
 =?us-ascii?Q?Yh69QE5N6rZLr84uC9g16z2KNTLUoZEoeiAq0Zs0IL0CWLTebUiqgwXLkuU7?=
 =?us-ascii?Q?qtjc6f5i1WpjHdDvFaQNmiuUCisQIwMFmlEilTNqxks96lck3CG5e7+m17K7?=
 =?us-ascii?Q?FB7/PW9rK6AoAW+7RGASazN4FSzfQjogDt7ezXYTZKTwR1OixavpNAzpwkwx?=
 =?us-ascii?Q?En4Kqxz0EDeMIky+cwvPTY+Bs1t1G/dhLVC6uo/o4Cjjha2UYpHr2bedZwmA?=
 =?us-ascii?Q?VgWmd+3YJwGCissuFSn/Y2RX/gSHTMeuyi98rpzqdRqHf6x2geIAhWzsdJUs?=
 =?us-ascii?Q?5QRb7JBUyDjGlliz6zqMdFj6kKmuc5+wjMEWBNvaifhaj++DLjEpDC13Vr4w?=
 =?us-ascii?Q?rjuVC2Ec/mNB/tQMtfu7kRmRW+XrTfXCI0EKgXxJN7AGCPG2Om+adrwgm+U7?=
 =?us-ascii?Q?RUgcobq9xMv7xj93feMa6MK368Uwe/GzQrup+5M6t4iWPw3PO6TOIG5BeIbW?=
 =?us-ascii?Q?GJz5o4qcrAGzjKRDzgghVTlLJAYVEyLjCxGlaWthjxIVS99CCSgkWI3yTAfx?=
 =?us-ascii?Q?s/iKf+j91ekj65A5ni8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 21:00:42.7053 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d40bb0-5e20-47be-582e-08ddfc769722
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7981
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

Double the IB_SIZE to fit the new IB size required for VCN5
Also remove IB_SIZE defined twice after having included amd_mmd_shared.h

v2: UVD still use 4096 as ib size

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Yinjie Yao <yinjie.yao@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_jpeg_shared.h | 1 -
 lib/amdgpu/amd_mmd_shared.h  | 2 +-
 tests/amdgpu/amd_uvd_dec.c   | 8 ++++----
 tests/amdgpu/amd_vpe.c       | 1 -
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/lib/amdgpu/amd_jpeg_shared.h b/lib/amdgpu/amd_jpeg_shared.h
index 09e76b005..abc13009f 100644
--- a/lib/amdgpu/amd_jpeg_shared.h
+++ b/lib/amdgpu/amd_jpeg_shared.h
@@ -122,7 +122,6 @@ uint32_t jpeg_chroma_base0_0;
 #define JPEG_DEC_LUMA_OFFSET    0
 #define JPEG_DEC_CHROMA_OFFSET  0x4000
 #define JPEG_DEC_SUM            262144
-#define IB_SIZE                 4096
 #define MAX_RESOURCES           16

 bool
diff --git a/lib/amdgpu/amd_mmd_shared.h b/lib/amdgpu/amd_mmd_shared.h
index 65857d16a..b494afcd5 100644
--- a/lib/amdgpu/amd_mmd_shared.h
+++ b/lib/amdgpu/amd_mmd_shared.h
@@ -25,7 +25,7 @@
 #define VEGA_20_GPCOM_VCPU_DATA1 0x81C5
 #define VEGA_20_UVD_ENGINE_CNTL 0x81C6

-#define IB_SIZE		4096
+#define IB_SIZE		8192
 #define MAX_RESOURCES	16

 enum decoder_error_type {
diff --git a/tests/amdgpu/amd_uvd_dec.c b/tests/amdgpu/amd_uvd_dec.c
index 3ec411aac..559092768 100644
--- a/tests/amdgpu/amd_uvd_dec.c
+++ b/tests/amdgpu/amd_uvd_dec.c
@@ -40,11 +40,11 @@ amdgpu_uvd_dec_create(amdgpu_device_handle device_handle,

 	r = amdgpu_va_range_alloc(device_handle,
 				  amdgpu_gpu_va_range_general,
-				  IB_SIZE, 1, 0, &va,
+				  req.alloc_size, 1, 0, &va,
 				  &va_handle, 0);
 	igt_assert_eq(r, 0);

-	r = amdgpu_bo_va_op(buf_handle, 0, IB_SIZE, va, 0, AMDGPU_VA_OP_MAP);
+	r = amdgpu_bo_va_op(buf_handle, 0, req.alloc_size, va, 0, AMDGPU_VA_OP_MAP);
 	igt_assert_eq(r, 0);

 	r = amdgpu_bo_cpu_map(buf_handle, &msg);
@@ -80,7 +80,7 @@ amdgpu_uvd_dec_create(amdgpu_device_handle device_handle,
 	r = submit(device_handle, context, i, AMDGPU_HW_IP_UVD);
 	igt_assert_eq(r, 0);

-	r = amdgpu_bo_va_op(buf_handle, 0, IB_SIZE, va, 0, AMDGPU_VA_OP_UNMAP);
+	r = amdgpu_bo_va_op(buf_handle, 0, req.alloc_size, va, 0, AMDGPU_VA_OP_UNMAP);
 	igt_assert_eq(r, 0);

 	r = amdgpu_va_range_free(va_handle);
@@ -108,7 +108,7 @@ amdgpu_uvd_decode(amdgpu_device_handle device_handle,
 	req.alloc_size = 4 * 1024; /* msg */
 	req.alloc_size += 4 * 1024; /* fb */
 	if (shared_context->family_id >= AMDGPU_FAMILY_VI)
-		req.alloc_size += IB_SIZE; /*it_scaling_table*/
+		req.alloc_size += req.alloc_size; /*it_scaling_table*/
 	req.alloc_size += ALIGN(sizeof(uvd_bitstream), 4 * 1024);
 	req.alloc_size += ALIGN(dpb_size, 4*1024);
 	req.alloc_size += ALIGN(dt_size, 4*1024);
diff --git a/tests/amdgpu/amd_vpe.c b/tests/amdgpu/amd_vpe.c
index 5c58c0dd8..e79ea1331 100644
--- a/tests/amdgpu/amd_vpe.c
+++ b/tests/amdgpu/amd_vpe.c
@@ -12,7 +12,6 @@

 IGT_TEST_DESCRIPTION("Test VPE functionality");

-#define IB_SIZE			4096
 #define MAX_RESOURCES		16

 #define PLANE_WIDTH		1024
--
2.43.0

