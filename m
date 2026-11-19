Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD59606A320
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 06:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=H2I8AlBr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAB310EB84;
	Thu, 19 Nov 2026 06:21:13 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013041.outbound.protection.outlook.com
 [40.93.201.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEC210EC67
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 06:19:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSGWaljncBkkP+NpXSM8VjkoREtpdAdCYZlZEKu0rgjGI0W8qyuRqukM8wSwUGzVDuzorYl2CAedMBeAXliA1fFsI9RGTXHyQ4XptEpEUrtcSY2Mw2IZ42XrN9dGC8Ah3J6xBbcD+d535MQCs8FerEaS2DTUEJhvnOLKJPdwPhgq+jWTkkPjp+CFvlZO3yJ7287wgesXi8589QjPH1jOFK+V4YGyRHgCu2aHWjytmfaCInQmkY40UuHpdv3ndTSV0LC/IDlArwNGEEqdm3dREmXaRszqL35g5dqKbGd131sDEfXYyfODd2vSDAkJISYRg5dX0ssylpZo19qTqK4QfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNWcgUXqZtkYfUPC9F1YaeIKjy3PGck9eo5vEwEpZb4=;
 b=vwl3Mhh6ZWachMXfQFiHvsqMtxeGqUM7R9v5G36NCQ/dEUWxiicM7zlptmHlKJkttdMoBwqOg2MhlmiHQeFESeW50Uf1jrHSgtC0grBzOFpRy7ElZEZSKeH2F5QrTDuTGgJ8YKv+Kd8UCCrKmTAKANY1MvvhhHibKx9/9qTI2Zq28FIzFPoWl+lE6wE8j8K1cICfMokOKSM58bCpNDD3lchlXl3ijL8ST41I7pqCYwHwzo8kaQQtP181ehOKBouVTorjMlvU2ht99XY+EXcuq5arnmgVj6DLvxnewVpr7Cx0/LZicyMOu7Opt2PRG70WBgDZubGlYDr1S/Wof1aBNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNWcgUXqZtkYfUPC9F1YaeIKjy3PGck9eo5vEwEpZb4=;
 b=H2I8AlBrfTPpeDTgyme0DkL+RiQkosawAicJLiPo7ikyh3TqV3uCNee6ki8cAlWESmlbNSOuNVupDuQ2WGEjF+dmkV8hvuKQwgq5NcLQvrj/x/KQxbVI17RoZ/x4bMMBcM5XSmetoPgB6/4jKM/09W6PGl1LRS5wfeuY+WfU85w=
Received: from SJ0PR05CA0207.namprd05.prod.outlook.com (2603:10b6:a03:330::32)
 by PH0PR12MB7094.namprd12.prod.outlook.com (2603:10b6:510:21d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.17; Thu, 19 Nov
 2026 06:19:04 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::98) by SJ0PR05CA0207.outlook.office365.com
 (2603:10b6:a03:330::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Thu, 19
 Nov 2026 06:19:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 19 Nov 2026 06:19:02 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 00:19:01 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 00:19:01 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 00:18:59 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 <Pierre-eric.Pelloux-prayer@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v3 03/11] lib/amdgpu: give compute user queues a CWSR
 save area
Date: Thu, 19 Nov 2026 14:18:24 +0800
Message-ID: <20261119061847.3442210-3-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119061847.3442210-1-Jesse.Zhang@amd.com>
References: <20261119061847.3442210-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|PH0PR12MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: 9300741e-e797-41da-c292-08df460501d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|22082099003|18002099003|261009223027099003|56012099006|11063799006|261102123227099003|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261021123027099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info: 7f2cXkgJV+ijIi49m0DDkyip7hG6GDFFubxTm+GbDk6ThCpjV5790SrCX519zYHYdVhteNDn3+fCWUZpU+hysxZlPbSeRxZ5ev7M6dYWFWMD+hIrnV1mNQfAnkGvpsiY/CGW8RNGi/QELyJCrVYfZfQuj0hZ5+LdNJkxp/B9U+YZjwJr50lQ+nh6n1B0l0cgsmf2EaKXIs4sZFxFUXgqU6Z0MAWvtUge7ZviETZ5MN4Z65bM5CeXlMtclH6Ugi0n8VA+KwD0U92EoON9dG3zItBdCE1igm1bzpWhn+eHOBWp7IuS3U3vJb65YOTcN30jqaFgCwFkB9ATOGArUyht/WGYZ3zs3UsglTIYhaREKW7d2jQsla8K635xDLOPoSoFM7Yh2W0uXpJCbiq0JegwMfzfgiMhGzpaKi4F4Xjf2TkDIwNKTOQFCSZ2Mtmx+EpFcVOmA6Dy1FKVCqcxtr/wjRVn+iCHgWENo6JdIMAagmQ3sycMYbQdGyebKLzat9GDlQnv553W4g4U0FLbAFXe47BUhnQL2ztAyI9AzZKZpo5tiKU2sIIX9rmhKjAiCCTzPErsp4QPelC/Bo6Mw8wEaE53CRdKmfiLc0N71Y81yrUtiOQ9YXGaCxaushebkwBpKThzO6nbDnzcXUtBvJOKR0Zm+PBFhaBx8B/B5ue5NH2vL+v/GAoQw5zWo1hkSKikub6cBe3V8YIja/rcnAjxxw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(22082099003)(18002099003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Tlo8KNqNZMNJQKoq2DheOd017uUyr2jBWaPyaw9djuNLdHPqD24T+pv+/XINgn1Unur5Cn5EzC/C1sjmgaF9clAgwFtf0lNGUnpbr9quR6CBaNyrbEGrAQxA+JAudsuGiRoID9j8SkIDPJEIrn0GoeowLmqJ+rUd47e5vlSBxGlv13z5SvQkEeRQT2TE5cN1vw/2iZEQaIpp9DNjHsnZuwGe3WGuU3HzTk14fHf1ffy0fDzd9LpZRN0tQgzocfYzjKLRmUqCizY9USRyQprYV1s9sqJW8Qkw3ejiF6DDgd4Ssiz59OW7Xo27uuRzw/gN/xp6KJPkWIDSIgWFvrqbgLTJtm0BV50g4yVdPdHKHcj+03o0k1nA/LBU/riybxpwqbBhn5Y3upWhPCqon0+1b9bAC9OFeSwMpDJjpQeW9cArm+WRErUlJiYN+c0jekZJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 06:19:02.8188 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9300741e-e797-41da-c292-08df460501d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7094
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With CWSR enabled the kernel requires a context save area for every
compute user queue, at least AMDGPU_INFO_CWSR min_save_area_size bytes,
and rejects the queue without one.

Query the size, allocate and map the save area and pass it in the
compute MQD, and free it when the queue is destroyed. Kernels without
the query take no save area, so keep the MQD fields zero there. Also
zero-initialize the compute MQD, which now has more than one field.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Reviewed-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 35 ++++++++++++++++++++++++++++++++++-
 lib/amdgpu/amd_ip_blocks.h |  2 ++
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 9bed04f12..8cf913ac6 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -936,6 +936,13 @@ user_queue_destroy(amdgpu_device_handle device_handle, struct amdgpu_ring_contex
 					    ctxt->timeline_syncobj_handle, ++ctxt->point,
 					    0, 0);
 
+		if (ctxt->cwsr_size)
+			amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->cwsr.handle,
+						    ctxt->cwsr.va_handle,
+						    ctxt->cwsr.mc_addr, ctxt->cwsr_size,
+						    ctxt->timeline_syncobj_handle, ++ctxt->point,
+						    0, 0);
+
 		r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
 						 ctxt->point);
 		igt_assert_eq(r, 0);
@@ -986,7 +993,8 @@ user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context
 	uint64_t gtt_flags = 0, queue_flags = 0;
 	struct drm_amdgpu_userq_mqd_gfx11 gfx_mqd;
 	struct drm_amdgpu_userq_mqd_sdma_gfx11 sdma_mqd;
-	struct drm_amdgpu_userq_mqd_compute_gfx11 compute_mqd;
+	struct drm_amdgpu_userq_mqd_compute_gfx11 compute_mqd = {0};
+	struct drm_amdgpu_info_cwsr cwsr_info = {0};
 	void *mqd;
 
 	if (type > AMD_IP_DMA) {
@@ -1099,6 +1107,31 @@ user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context
 					       ctxt->timeline_syncobj_handle, ++ctxt->point);
 		igt_assert_eq(r, 0);
 		compute_mqd.eop_va = ctxt->eop.mc_addr;
+
+		/*
+		 * With CWSR enabled the kernel requires a save area of at least
+		 * min_save_area_size. Older kernels don't know the query and
+		 * don't take a save area.
+		 */
+		ctxt->cwsr_size = 0;
+		if (!amdgpu_query_info(device_handle, AMDGPU_INFO_CWSR,
+				       sizeof(cwsr_info), &cwsr_info) &&
+		    cwsr_info.min_save_area_size) {
+			ctxt->cwsr_size = ALIGN(cwsr_info.min_save_area_size, PAGE_SIZE);
+			r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->cwsr_size,
+						       PAGE_SIZE,
+						       AMDGPU_GEM_DOMAIN_GTT,
+						       gtt_flags,
+						       AMDGPU_VM_MTYPE_UC,
+						       &ctxt->cwsr.handle, NULL,
+						       &ctxt->cwsr.mc_addr,
+						       &ctxt->cwsr.va_handle,
+						       ctxt->timeline_syncobj_handle,
+						       ++ctxt->point);
+			igt_assert_eq(r, 0);
+			compute_mqd.ctx_save_area_va = ctxt->cwsr.mc_addr;
+			compute_mqd.ctx_save_area_size = ctxt->cwsr_size;
+		}
 		mqd = &compute_mqd;
 		break;
 
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index fc123fe1a..24b0f5549 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -344,6 +344,8 @@ struct amdgpu_ring_context {
 	struct  amdgpu_userq_bo wptr;
 	struct  amdgpu_userq_bo csa;
 	struct  amdgpu_userq_bo eop;
+	struct  amdgpu_userq_bo cwsr;	/* compute CWSR save area, if needed */
+	uint32_t cwsr_size;
 
 	uint32_t *queue_cpu;
 	volatile uint64_t *wptr_cpu;
-- 
2.50.1

