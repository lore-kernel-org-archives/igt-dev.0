Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793FE606A31E
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 08:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ACNUQPGl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F8110F30B;
	Tue, 24 Nov 2026 08:31:04 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010051.outbound.protection.outlook.com [52.101.46.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C8210F2FC
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 08:28:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xAQ58QocYN8PvyzI9N4sSjZECioTLTXDij49P2OHId7CTmfhmE8LovOQz+aPwT5SQhBTf4qAAAb+8xKWqJDs1624B7ORsGDWMhS9vMvBjBeBwVqPOnFeAUZn+/h7dEMfp8v+hJPPV+MUvBeTVCKGxYYDE19Q9ei4wR5poOsbuummIL0Ql5ANBHCUcU+ogemNA0oFnuJZE0PtFfV61sZx9ZMjDzyVdVDGya4c0GG0yIn1rklu9Pye9P+trY+M+PEZTouzIPWxbPoPenKaZyNmg6j3P4KxWdA+EcHfT5nHCI6kIXaFfviDMw+k4BwV530JB3tDclIawhOr3tU+rdaBzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNWcgUXqZtkYfUPC9F1YaeIKjy3PGck9eo5vEwEpZb4=;
 b=K/hJJKvaH6ASqH0zCuEzn2mSyo8NRjwmmmRwG62NeGaVYsmapH0WvJBfxJYHudF8jy/myqK9ECq85HAqSh4pOVb/Qm1n9MMRyNEvvssC9bFK2uDuft04nO5/eZCBvN2f7Z7ZcTBZxfmlmlKhKwp6ISzlXFWUJdQTGAgDrALxVcHFO18M8nn8qY2YP51HBFJUot2sr8xGHYo+sNUofQaB/44olGSrHyd0DSEoNIV76LLnu35t9P6xe7+s75ajlppz9hDEf3v7/IyFUQZAcs69kDZiOK8lm5mcNfZYLYNSeW9D28pHiDEFyo9z6wS6EGHhfGC/HHeTPwsde+nUWRZtDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNWcgUXqZtkYfUPC9F1YaeIKjy3PGck9eo5vEwEpZb4=;
 b=ACNUQPGlrLvgxJeNU6UNn5gerT65QdyCm9CHvUNu95wjeCJue4iF+kBdIRgcrUsRKdJuTE5XQkgzA87sVktoG9RehtWTcfiiN4UX0bFgwg3yDpma2o1C2JVKtxiKbhtF/XNd1DdZTsW7ql1UxllMypMrgNlpkJD2+4frg2V9u0o=
Received: from CY5PR03CA0033.namprd03.prod.outlook.com (2603:10b6:930:b::21)
 by SN7PR12MB7936.namprd12.prod.outlook.com (2603:10b6:806:347::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 08:28:31 +0000
Received: from PH2PEPF00048915.namprd05.prod.outlook.com
 (2603:10b6:930:b:cafe::56) by CY5PR03CA0033.outlook.office365.com
 (2603:10b6:930:b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 08:28:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH2PEPF00048915.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:28:29 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:28:28 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 02:28:26 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, <pierre-eric.pelloux-prayer@amd.com>,
 <timur.kristof@gmail.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v4 03/12] lib/amdgpu: give compute user queues a CWSR
 save area
Date: Tue, 24 Nov 2026 16:27:33 +0800
Message-ID: <20261124082819.2089694-3-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261124082819.2089694-1-Jesse.Zhang@amd.com>
References: <20261124082819.2089694-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH2PEPF00048915:EE_|SN7PR12MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: b9ba193e-66a3-4c3e-78ea-08df4a04eb4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|18002099003|22082099003|261028144727099003|11063799006|56012099006|261022105027099003|261026121527099003|261026140227099003|261021121427099003|261009223027099003|261021123027099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info: v6tX8eIJLRG17/U0MS4uznYLYmM0S6Zz5Jd8ybpA9M3zwV2eGnRAmoZhlzguOoIqODoX+wtm8w9lsv7Ua1gjNzKg3f4gkdGun6MzWLqMDUh29lbZEB2spFoNZR2m53Rc7w2Vr7Ga2yCc47UtoE2z59Q3i5BJbh6Qrp0ICiAMk7AkBzezN170Yxcxpt6Ia7Hbu9ZIVJvkcgFSxKC72D48Z4isp+vtds2gaGAAfENBR95GwJSSPyoHDfeQddMsCfRtCIGViJ9TWdM+bg4mSDjCiKmRi0pqNLuVOw+3Oza7MikjTf7gzBhIUXrXhrQ2LroXGp+LgusTiEAu32oZXNMxcB95O6oTry7lfE6hSX9VeSxSjjWM3mj1BiW+EeUF9wLJiAAQFJsdZSVKI9OKVOUZf+w5GhfML5U1CiC09iKvnCyLXJ2VJ6MkoXsqoQHloTFILdBHia7EcVkW+1AbHOK5WKhowwmChOh/xrIkLfXJlKW4OoKXcnPzirrmZoNp844UlvONpTxhMqSbACmn5wHJj3N3+F3zTADGLmtcOsJknk0x/QW21bqLnYhu849QEmwWWsjS4lwnfi9cYsGQ6meDhFlrrmI458En6oF+2VzGA47bMJ5D8KVK/lHzZKOU9rSAMf9x3neFixh8sCsgqnyd7szdC7S/6cT0pM5+/D4Yf/fFTTgihgk+orErBIqfVZS0HYxLwyquXz9JY2tVECI5dQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(18002099003)(22082099003)(261028144727099003)(11063799006)(56012099006)(261022105027099003)(261026121527099003)(261026140227099003)(261021121427099003)(261009223027099003)(261021123027099003)(261102123227099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aXQTQlQedwCnjCKKijDEGdl+9WPQG/fS6RZlid7XKTjulLBPKZXvlIztQmR5Ni3dn3KgA23lo0QqWvWm15jRgG4PvpEac7ysOD1ueH8a7x2rGatnKsfSleI/a83C8aauBGuMvP/sTXQXyYS0dQMUMNXVJNDZL5NyahXzFIHJyKCU2KjnZ9z/WYSvivm8pE0/h72zsW9NhRMEGhFu8CM+hA4si5H/QuiFRY7DN2PGGyncJVjqy3fWQezTJw4LcnTK8sf3sz7tZUc7Npfw0RjWSQe8qjoIK7sVTE9WvlwrySA3SAT/L9VjegCF3DgjBTAUhoRcwsmWgp1qsIKuNFBRrOfNZ4cuy142ODmy/xjuxFa2FzN0WIYIixNBdLlLWgJTg2JtkzniwUJ4Le+YMG9DnIvvObioze70ZkNpnYhYoKKvS8/l6arLw9NqCLEZvnTU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:28:29.6770 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ba193e-66a3-4c3e-78ea-08df4a04eb4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: PH2PEPF00048915.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7936
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

