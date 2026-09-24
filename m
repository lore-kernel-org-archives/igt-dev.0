Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B2AC98314
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 07:46:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D62E10F378;
	Thu, 24 Sep 2026 07:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1hZ51SVy";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012032.outbound.protection.outlook.com [52.101.43.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0451310F378
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2026 07:45:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFeEPubnv6rUiejtL0YfRP3i8Sam9lDbw/7DH+vmbkEIZiSkvnbAtdm4Mg5zIP6rE/y7WRd0b4JX3jtPWXbxoHYs7ag53NFcm3zEOlrEnu13r2x7dBfri9gsMeyo/sz2AQzJPeR8FtFjHilySrzW0JqxYmReprDuHV7nwKdLGMoeB0UJCc+WCyRrhZGs2lvL3pTwf/wC3WqyL/tLpL6z43FPlKgozBkL1pHnGsI0vovvX+YiW26ASDv5QgjxydodCCp7y2xr+nziFbo60Zyk6Y/N5olba/1+TB+zZn6Nen3Oee5MZNtkMWEqdSeOn/3UWdEYAYFvuxQRPFP3dF7H+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2chZwC4QkebNAOHeATbTEbPFqXPpFObNEmnxAjwfmE=;
 b=jO5eI+G9TIXa07mAk2yYt5ZjFdgS7r5QItvgMRwa6MQ/NVOcL85zUJbj45IH9ddoVgSGx7enUeapGkXTaJSZMh2HPprJKbL3wDmPrOloALWJR+9aIAH0LRBF7V3PAeRmYelIzWRmrfZIjt0sppDtRNtdTngPFP7F7wAzxIcQVj3kQ55wTDYBWzU/hZKrKCwSglAyXH2pWSMYEO3UUN2bq89V1xJVgH3LFfFRXQPN0xBMknnP2X2EJ5BlcbXZ41LZgQST2ctaHihx6IUSRBTI6Qt81szTmd1jwSoehTCbkydgWwe+RVlVcg8kwDq5prFuqeCEhAeVmdq6D7Kycd40NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2chZwC4QkebNAOHeATbTEbPFqXPpFObNEmnxAjwfmE=;
 b=1hZ51SVysLSmUNgiOtJAmI1P8iIKDnLWuYdefoMJD9aXAKuBqce2nf72n/xbZa+oeerQdZ1F1DT32japQQwz7XPLPw48qylixFrC+8hdgl5mPPRPqPyqBHzHqRPtD59A6gzjuOD9rrNFILBc0ZSzplZCvpQzyFtpSGALvaTIgj4=
Received: from CH0PR03CA0185.namprd03.prod.outlook.com (2603:10b6:610:e4::10)
 by LV2PR12MB5774.namprd12.prod.outlook.com (2603:10b6:408:17a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.22; Thu, 24 Sep
 2026 07:45:08 +0000
Received: from BN5PEPF0004698B.namprd02.prod.outlook.com
 (2603:10b6:610:e4:cafe::62) by CH0PR03CA0185.outlook.office365.com
 (2603:10b6:610:e4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.17 via Frontend Transport; Thu,
 24 Sep 2026 07:45:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN5PEPF0004698B.mail.protection.outlook.com (10.167.245.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 07:45:08 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 02:45:05 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 02:45:04 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 24 Sep 2026 02:45:03 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Claude <noreply@anthropic.com>
Subject: [PATCH i-g-t 2/3] lib/amdgpu: support a non-zero wptr offset in
 user_queue_create
Date: Thu, 24 Sep 2026 15:44:40 +0800
Message-ID: <20260924074500.169386-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260924074500.169386-1-Jesse.Zhang@amd.com>
References: <20260924074500.169386-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698B:EE_|LV2PR12MB5774:EE_
X-MS-Office365-Filtering-Correlation-Id: c52a8370-574c-4a4e-c439-08df1a0fc182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|82310400026|376014|1800799024|10067099003|11063799006|18002099003|22082099003|6123799006|56012099006;
X-Microsoft-Antispam-Message-Info: WOM8gW5AoAiMtHBuUOW3R6nFSS6Z6yg+VGckBauJU/ZlMLXMSZQmXC3wy5Nua2d/lSriplHqVd4m6GBeeHQDtriaFTTDVcvWNU5eNZMHBCvGnqwH0N9/yhI7RRtbyTrjFxtFKevIq5crkM6Gwf8rH0HNumlLhw3PDs86hBfAR63MHn6OSqOma5C7xF092F7I3YMzWTqOb7KTOx8EVNXEOvTkGX3bgIRTQGqSdyuOzdkDShMGhgxA3l7tAN7+54Y5M+Fp6/QZ6Ubxse8qeRz6vBwXNKgtoJr06dcAa9FnXPTAWWs8DFzHV4Js/6zw0HUbzQ3r/KcUazisH0AxwVh5OZ+8RCjtwVYIGKDK2EWLl88XB2rmXMIxv8vZzZRxsxKRZypCIiND7YONeZfU7Hs+pZwEazJRucMbdb05EYqldU1JLX912cnci7WwW8FKhQ4/CYrwdNIQ+5LboCA7e/3gl4qyEC3qLz4uzst/jOrL7TBb+Mo1/G1aL2VtGJYZlcvcYLbAb0YNjYK5rLriYmHLPY5Ly0/oQ6B0bc6T1Z9BA7DkLfYj3J7WYqFcZpngjmigBwZqYYU5ULr/lXjPXZ+moOdLLDhcrJkn7QESXFZKdSZJaqkghmod2nUoAKgg+CTW+GGs4TjfZC4iA6cZd24eUFXL4A1s0U413P0EUoTltHW80iYxK4wLBPJAXqehjS9gsO+yznBHtm0huN65zoSVvQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(1800799024)(10067099003)(11063799006)(18002099003)(22082099003)(6123799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: c3lH0cBxBASAp36oLgCXPYBBAd2HMt8oMpVD4OGxE7kdSVuP7N5jhSQ6RjZ/18bT2ufQapjYRIFR0xUIMIjDwcKNjgx+UEyBeQMtr4OdhE9/nB4Tusq4ugZFC9bLZDfUo0BKj43/AyqYqwWZb4WT7WTy72/5nhZovqeIsUx9jeBW4NLZsKUPKiJt8Zcf0HKb7dc49GRkswdAhRKqjZUfWxqYOG/12et6knLjJSNwWRydgdLD+98MYDWV39Ofr3WR5YCpb4A8qHe5sZjFanxVD0Qx2zTendvBSZmvX5odpZ9eeUFZM0f3vFf0byUrOfgArBF+kpncfikAYPaBNUK/AxI2n+w42Z38kOJ7pgTtk1oDy3oFUDDvkj5ii6e5xezGwuipYripoMxowL3a2pIKQQBW8iC3qBKGtApKyGjNEWc+nSqVyer9x2MKRAuptZmc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 07:45:08.2863 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c52a8370-574c-4a4e-c439-08df1a0fc182
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN5PEPF0004698B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5774
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

Add a wptr_offset knob to struct amdgpu_ring_context and honor it in
user_queue_create(): when set, allocate the wptr BO as a full page,
place the wptr at that (8-byte aligned, < PAGE_SIZE) offset, poison BO
offset 0, and pass the offset wptr address to amdgpu_create_userqueue()
for GFX/COMPUTE/DMA. This lets a test exercise the kernel's handling of
a wptr that is not at the start of its BO.

wptr_offset defaults to 0, which reproduces the previous behavior
exactly (8-byte wptr BO at offset 0, no poison), so existing user-queue
tests are unaffected.

Co-Authored-By: Claude <noreply@anthropic.com>
Change-Id: I0302bc6a180e5aed7d718f42b55f9f66f2e5ffeb
---
 lib/amdgpu/amd_ip_blocks.c | 38 +++++++++++++++++++++++++++++++++-----
 lib/amdgpu/amd_ip_blocks.h |  8 ++++++++
 2 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 7d31a582a..d171a2fe3 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -898,7 +898,20 @@ user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context
 				       ctxt->timeline_syncobj_handle, ++ctxt->point);
 	igt_assert_eq(r, 0);
 
-	r = amdgpu_bo_alloc_and_map_uq(device_handle, 8,
+	/*
+	 * The wptr normally sits at offset 0 of its own 8-byte BO. When
+	 * wptr_offset is set, allocate a full page and place the wptr at that
+	 * (8-byte aligned, < PAGE_SIZE) offset instead, so the kernel's wptr
+	 * read path has to account for a wptr that is not at the start of the
+	 * BO. Offset 0 is later poisoned so a kernel that wrongly reads BO
+	 * offset 0 gets a bogus wptr.
+	 */
+	igt_assert_f(ctxt->wptr_offset % sizeof(uint64_t) == 0 &&
+		     ctxt->wptr_offset + sizeof(uint64_t) <= PAGE_SIZE,
+		     "wptr_offset %lu must be 8-byte aligned and fit in a page\n",
+		     (unsigned long)ctxt->wptr_offset);
+	r = amdgpu_bo_alloc_and_map_uq(device_handle,
+				       ctxt->wptr_offset ? PAGE_SIZE : 8,
 				       ALIGNMENT,
 				       AMDGPU_GEM_DOMAIN_GTT,
 				       gtt_flags,
@@ -907,6 +920,16 @@ user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context
 				       &ctxt->wptr.mc_addr, &ctxt->wptr.va_handle,
 				       ctxt->timeline_syncobj_handle, ++ctxt->point);
 	igt_assert_eq(r, 0);
+	if (ctxt->wptr_offset) {
+		/*
+		 * The wptr BO is not zero-initialized. Clear the real wptr slot
+		 * so the queue starts from a well-defined wptr of 0, then poison
+		 * BO offset 0 so a buggy (offset-ignoring) read is fatal.
+		 */
+		*(volatile uint64_t *)((uint8_t *)ctxt->wptr.ptr +
+				       ctxt->wptr_offset) = 0;
+		*(volatile uint64_t *)ctxt->wptr.ptr = 0xdead0000dead0000ULL;
+	}
 
 	r = amdgpu_bo_alloc_and_map_uq(device_handle, 8,
 				       ALIGNMENT,
@@ -987,7 +1010,12 @@ user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context
 			      AMDGPU_GEM_DOMAIN_DOORBELL);
 
 	ctxt->doorbell_cpu = (uint64_t *)ctxt->doorbell.ptr;
-	ctxt->wptr_cpu = (uint64_t *)ctxt->wptr.ptr;
+	/*
+	 * wptr_offset shifts the wptr within its BO. The BO struct fields stay
+	 * pristine (destroy unmaps by base addr); only the queue-facing wptr
+	 * address and cpu pointer are offset.
+	 */
+	ctxt->wptr_cpu = (uint64_t *)((uint8_t *)ctxt->wptr.ptr + ctxt->wptr_offset);
 	ctxt->rptr_cpu = (uint64_t *)ctxt->rptr.ptr;
 
 	ctxt->queue_cpu = (uint32_t *)ctxt->queue.ptr;
@@ -1002,7 +1030,7 @@ user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context
 		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_GFX,
 					    ctxt->db_handle, GFX_DOORBELL_INDEX,
 					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
-					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
+					    ctxt->wptr.mc_addr + ctxt->wptr_offset, ctxt->rptr.mc_addr,
 					    mqd, queue_flags, &ctxt->queue_id);
 		igt_assert_eq(r, 0);
 		break;
@@ -1011,7 +1039,7 @@ user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context
 		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_COMPUTE,
 					    ctxt->db_handle, DOORBELL_INDEX,
 					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
-					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
+					    ctxt->wptr.mc_addr + ctxt->wptr_offset, ctxt->rptr.mc_addr,
 					    mqd, queue_flags, &ctxt->queue_id);
 		igt_assert_eq(r, 0);
 		break;
@@ -1022,7 +1050,7 @@ user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context
 		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_DMA,
 					    ctxt->db_handle, SDMA_DOORBELL_INDEX,
 					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
-					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
+					    ctxt->wptr.mc_addr + ctxt->wptr_offset, ctxt->rptr.mc_addr,
 					    mqd, queue_flags, &ctxt->queue_id);
 		igt_assert_eq(r, 0);
 		break;
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 40a9735be..813809b96 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -338,6 +338,14 @@ struct amdgpu_ring_context {
 	uint32_t db_handle;
 	uint32_t queue_id;
 
+	/*
+	 * Byte offset of the wptr within its BO. 0 (default) keeps the wptr at
+	 * BO offset 0. A non-zero value places the wptr at that offset inside a
+	 * one-page wptr BO, exercising the kernel's handling of a wptr that is
+	 * not at the start of the BO.
+	 */
+	uint64_t wptr_offset;
+
 	uint32_t timeline_syncobj_handle;
 	uint64_t point;
 	bool user_queue;
-- 
2.49.0

