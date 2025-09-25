Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDCCCAC5B1
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 17:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E8310E94E;
	Thu, 25 Sep 2025 17:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ap108GIp";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012061.outbound.protection.outlook.com
 [40.107.200.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0272310E94E
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 17:04:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FHXHwCwc1MgPKI5MLT+EujC3NBeA1qnkd9oDuxhWGNYLXrAXxDpyhIl1PC8QiRbvrEwPYulL9qPI9aSYmrUBm6Wx1pAcg50QUjW9SP9PpnNYKMzO/d+3JWQ9/N/myFIJExwqcsHEQkeHgDUmHCFrNA1fYeVeLI3jvOdoRrGjRMqtL5rfd2LovcZY/RxKzyBWNAzaljhrOSOcFccZ2Lg+otVzo0siLmvKysSlkajlaWeqhh+j2tbw4SCGb+2Sb2+IJg003QO1KtvIJM3uhPaljsw4mvz51Z1eqx2bvedLRUX8UUZCKLiWLb2a6B+ImQOivrgnWaD/xqvk5C9wvBVE+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBYxkj/EjnrDckw+qPOoOEpInVDwBE4OVqhNRrJxbCM=;
 b=I995tDl+SoQr4CpH/5GIO1GqywoUcXuQbD+IjN+kaiFwGI/DYgC1qXlg4fhZzLuxX6bSMJenLbIK2FgCFhvjhaAdZhQRu7UQmWtsUKeA/CDHzq2jm6a/dNTLfnjln2OR//+RKxsQ/Bi1t0RR41sgti7Kr+pnu/V/vRELH1V4a3BjC8FoyiXcqb2MZB2YI871xF2zupf245Y5VLQ9eVwZhwgv/soC92g4uc+kGLy37CzSLqTBiU0N39tXOBIMcQKo717+V21/U97NpHufnbJ4xCPgRQ90WjapZkjZMvjOFe2yifs64quAmmVClUBLi1aQeeDw2QNu/0NkkefDHy1Kag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBYxkj/EjnrDckw+qPOoOEpInVDwBE4OVqhNRrJxbCM=;
 b=ap108GIpjqHw1vuhxGeq/GjWcVF0zq2kzgk0Ee4SY3FKU7TdlVaV7dDl+G5+HX/NKH0zCy6anoeXj3K5BUN/YPi8Q+iHBNA2HDhc35vEHvH6oJcN3PKgfXW4eV8x4X63AHoynLtiBp78YF5X/mYXtkmpCK6Z+ke2xxNgHb6rl4c=
Received: from BN9PR03CA0667.namprd03.prod.outlook.com (2603:10b6:408:10e::12)
 by SA1PR12MB9469.namprd12.prod.outlook.com (2603:10b6:806:45a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 17:04:39 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:408:10e:cafe::a6) by BN9PR03CA0667.outlook.office365.com
 (2603:10b6:408:10e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.21 via Frontend Transport; Thu,
 25 Sep 2025 17:04:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Thu, 25 Sep 2025 17:04:38 +0000
Received: from yinjiyao-dev24.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 25 Sep
 2025 10:04:38 -0700
From: Yinjie Yao <yinjie.yao@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Yinjie Yao <yinjie.yao@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH 1/2] lib/amdgpu: increase IB_SIZE for VCN
Date: Thu, 25 Sep 2025 13:02:59 -0400
Message-ID: <20250925170405.145614-1-yinjie.yao@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|SA1PR12MB9469:EE_
X-MS-Office365-Filtering-Correlation-Id: 42e93a30-65d4-497f-8da0-08ddfc559c9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VT0JHx9frgxWokO9A3nGqLvjsfeAbTw4Q58tF9rZ1Bzw/PHKtJEJNfWrPZIi?=
 =?us-ascii?Q?R4ZgidZolMXiX6rz12FADEY1Z1uelm1eBgHUjPK2t5CADQtA2LDHR4sn6OQK?=
 =?us-ascii?Q?Kl3K1q3Z60SFYkFN45clLF+FqsryBmvgsJS5E1Y7YUauEITMO9FUTeiIVI78?=
 =?us-ascii?Q?+dXMBaHJvZWdUpMwZTVxbYYH9BscUid5ZMyHdmPjvdofIAe0Y0UNdDdBIlS2?=
 =?us-ascii?Q?DUmeNjrF2l56V2i9HcP6jNwxtshfU3JrUe8xbqOyh+P9cGef43UtLVpxC34z?=
 =?us-ascii?Q?/OD4+nhtKEzIB0h6Ws5nnVmrLQbSanJ/kl9fBwXEC06wXGt314kaj2lloe7o?=
 =?us-ascii?Q?bqqUPjeJ8QlWdOrIyNUO9Tf+zrIxvinZYdwReAUxevFkWx6wP3faW0dY6UeE?=
 =?us-ascii?Q?NUCkxTyEE845fUBgur1pD4+QUoMxiu/rCqdd3RUkK7GsclR1ggzMh20okxjs?=
 =?us-ascii?Q?c4BVnhsNouujQTzHJXN9jqgZJ+nnGTFwR6mQWS6Yy4uYaRuf/1oiiqXyWBjf?=
 =?us-ascii?Q?JaEDcME59FNdNMUn0WeYQWNq94BGvXKL1V6cAVFioP+TIPaXnO4X+eWxNW2h?=
 =?us-ascii?Q?InThIdF19M0j2Js3vBEeT3E1YYztCaxBY1nHrHOKZ9iK/71umY4pu8Q9EOSb?=
 =?us-ascii?Q?j1d5dZr0LEVv816gE+QthpNmFh9nFo2MNr3X6KZdnfJn8zeJBvgz/DMCqPDY?=
 =?us-ascii?Q?qOrdUW+vhU8D4nMA1GyE6W9e2xgJbDUsJ+FLkA6CXw3bAqUioZCCesP2eVn+?=
 =?us-ascii?Q?3FVgX/qGWvZSDtzpFiOnDM3+QTQ73mIVXombdrQyLYCrJa2KYLQVN5nkZrS/?=
 =?us-ascii?Q?PmxgyYw28uzTHRMgz/bFF6s1HmywI8WoPzZFpQLZ1sEpdToNmKmS9W49QpSj?=
 =?us-ascii?Q?6n/ozh26vTG8irhugC9KbKdka+I/z5TGavl8v2ArVt7Fl68+xlmEgoySWn5Z?=
 =?us-ascii?Q?clQaDV+Tqui4u5dhOgR3EcX9+cOonvI2i8ZR6iZrJ0V6o+GOzTTfSNxx6NTX?=
 =?us-ascii?Q?+TN9CZW5BXLavTRI7hC8+o8IaSI+CMjkQsi1b+mfUAcapfQMNbbiS9ENLcnM?=
 =?us-ascii?Q?Sgpl9bYH6ZehHbb8yLo6aKlLJRn58QMGdJABek/rj5+g7a19uV5ENOCtlgsb?=
 =?us-ascii?Q?BuYww5pmlOxTsLz2bfpRUreImaPuO5OCy42qCkXza0iCwGgG+kzdIMETp5Zf?=
 =?us-ascii?Q?IKTNUcqZj4PCpM5re0WiNHdtn3WL4wArDTCbdlojsRlanaru/ykRu1QSI5Xe?=
 =?us-ascii?Q?ZdmLuStNdiseKdkAvPQF8xRpdVOvkvJDDEWQZlqaTDJDjvttfSmCbsQOjs+O?=
 =?us-ascii?Q?VhdybPwWS0Q5ondyn6gcyQLqT2q9PRSoMmbHwa9Rc70Iepg6JxwSpE+Oe6rc?=
 =?us-ascii?Q?FfHcd74HTlWnd1f/si1sKJ3Q4/Eejj6f4+Xa25IfuywdEe2GVZBhIIB6l5mK?=
 =?us-ascii?Q?q0bSWdUvLzmzNMsH5RvsQ6ZHNBNIrxYPFcJfVl+bZWeidu5PrHDezhD72szP?=
 =?us-ascii?Q?97mqLs7asTZD5fPfVCUqk1yzB8rMuSRScsjh8EHqi9vlsc/oEWyJQ9pYTdpz?=
 =?us-ascii?Q?ZiSv8iF5FVertyjdDy8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 17:04:38.5981 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e93a30-65d4-497f-8da0-08ddfc559c9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9469
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

