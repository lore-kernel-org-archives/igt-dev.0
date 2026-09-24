Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0FBC98310
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 07:59:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894DD10F38C;
	Thu, 24 Sep 2026 07:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Vz0mV3PS";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011067.outbound.protection.outlook.com
 [40.93.194.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD8C10F38D
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2026 07:53:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RbnwV1s3izeRpJZqhLILCm2GuOGvLCiDjPc8WFRPSd28mimxbXB/5Qfr9+lkNZnbTD797Y4n316iON7OBwtVbVq/6HCUcbgt/xKtmvGPeC2SOHV+BEhxc9f53mchBZByWTNBQGbzzFBNumnmmJiMLJXc7V3iiX2uLHPNuelAJFONhqAmxwVfyrPyeRhDKvuE1e2b/pZ+xtGXH7pbbZPSiteDPYbliD0LOjvPkXWyh7ipugAzhHxSVfmz9lyBC+xEYlPONBuB/tMQB5xM2yrgHMI89xPlKwm2jhn4iUs/2DEOB28/EzLOz3gcJScJJ4REdPFnBiDkejA4lpLcc8vvOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6Zvy6j5Rl8ASIPA0zaOu6DPucSItLZR58ZTc/aCxV4=;
 b=tVJYTm2Jxz1tRDkMZrs/LF4GEs/H6jRpGT6qD12IN9j/tR371uqV0AsIGG5NREfSzpc5Hciq2B7aMNzdXgwhHAN+jw3WSy1j5sDMN/5qibZmoni7ehWlrlCn7ZEPnjo0RSp4NEh6D1xr+9B4ePwE5Z+mgjQIe9Tqyvr1/LZRcUl7dHYtqMvzdX2G+CDST2rAgNFSMH3PK88RDffpKjZt0beCVxu+NLelc77WiJZ3IYnNX+dRhZvLx9ijU5XVCBVDXtXliuE0lL4PBjANxq35IX2jPWftTOrctSvGGD+aTFYODIDIx6fR5Qs7wRAH53ellZixNOpebQSnDiNBgcn4XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6Zvy6j5Rl8ASIPA0zaOu6DPucSItLZR58ZTc/aCxV4=;
 b=Vz0mV3PS/HZyC/iWJfalAEq0nydMa1TTQ33O0SQhNr69Kryjl49qv1ALqBdrqWMPpjcRY7jln+PJtaLZnDmNvQjT6hVXdZVGyQ3aQc8CGb+jlxm0YHXYSXty/1f8QjCt5lLh08MtIfIJcRpXYBZJC8QfAJhbCACSU47ix78gwLA=
Received: from CH2PR16CA0018.namprd16.prod.outlook.com (2603:10b6:610:50::28)
 by MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 07:53:16 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::33) by CH2PR16CA0018.outlook.office365.com
 (2603:10b6:610:50::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 07:53:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 07:53:15 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 02:53:15 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 24 Sep 2026 02:53:08 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>, Claude
 <noreply@anthropic.com>
Subject: [PATCH i-g-t v2 2/3] lib/amdgpu: support a non-zero wptr offset in
 user_queue_create
Date: Thu, 24 Sep 2026 15:51:57 +0800
Message-ID: <20260924075300.172142-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260924075300.172142-1-Jesse.Zhang@amd.com>
References: <20260924075300.172142-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|MN2PR12MB4206:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b773004-ff06-4c29-c3bc-08df1a10e42d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|10067099003|18002099003|22082099003|56012099006|11063799006|6123799006;
X-Microsoft-Antispam-Message-Info: 8vPUZeUNnxo8v3XRFDXuGfz/GqQg/AWf8F+cpVYptOJllfeeuSWL9acmZI4eepYN2iSkZv6G5BCi9r/GQOHRqxrH02jyIn/3oKMbJchgmDFaPu3wmH1lNUu8KMzvLDLeUyBFLaMHQf/eBW0V0BJFUgtiP38bjOd8fARMg+l0XqtoeFAV1ytpkAMFMX05Z3iRKfAeiq1fby5kBPaFcERIMPk3JaZpMC8EzEFgw1rhLdmw960FGEpsmPjweBFaXb0VKAi+GTjYM2Gi6tuBa0j/cJlIwF6Pw9DVusNtdxJDMYSKt7lKA3DKmbkWbtdgSZLF+GdzdwWuhFSnTnmE90EVb913Qi6pabyPhcDSSkDjsOTQICKALbUWz081QzhmkeuanB5k9bQq//J4oWnH4gGIMV5o9CNxKuhUBuiVHv2uZTKfaf09cuE4jfDYDtGi9mGeIOAhZvOpySeewBebcqBAQ75rp/ia3As9DB3fgOXoHix9op92cugDdpyuCDMImDnkkipwzqL2l2DIu4NcYII0yzeZHzvDXLT86Tzh/g6bqjbrhKdcVNKa/AYPeB0DknuU7cOHINIZHVW4UtCzUESSyvzhL4bUzZFyjAs9wReyaGilj2Gnwtga04vJH1yYwNgwE03kIEOpZavWiVMFohSJoPqVcXnKFqbcNVkeu0PUP8Y+ekXnSdmnhkY8f6VIS5b2ZBjQ8+lJoxVH0TnCn1a01w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(6123799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BhEXwHwBx5XwlEX0bOr6P8Ux8LSLeltwiz1cN6e5gGD/1h+kp1VHFgfMt//eMGzZviBzJelUg0riuSrHRpyJhZ3bXoWLrnbDdTAqUgoGLbJPOdtqhOLFxrO/fw60DKu5QpN08nDm/n8S14rV6QFWP/LET6j3jxoskRRK4YvmBUCSo2VQI5R8PnRuoJeJmb1h/DIub8PuPnnR0We0PtrRF9rJSJ0oTb4etSbek4P3PGcGQv89oQxJ1dNuPqyGBS3TOBuoNu78smoIPy9vxxT2W8DNTMn2mFV262CLrsnb0A20blopTvUUHuMw8c0uPsdsXendTN0wR5pFVA0az6jKRU0ZLsxU9QZX2hAp1f3029GV+tekb0I85n41WdCxhclbWHNqFuzXyM7X3AwJbVotpxklf7CTDakHFsMG7WiefYOT6SVJHvxWeHhYv9qD942N
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 07:53:15.9341 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b773004-ff06-4c29-c3bc-08df1a10e42d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206
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

v2: delete change-id

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
Co-Authored-By: Claude <noreply@anthropic.com>
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

