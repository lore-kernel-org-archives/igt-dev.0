Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CA9606A32A
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 11:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=s5pUWJ2I
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724C210E2E7;
	Mon, 16 Nov 2026 11:34:13 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012029.outbound.protection.outlook.com
 [40.93.195.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CB310EF82
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 11:28:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6OhQUJ2/7nmX73FPEQi+5726h2EhVG0okv0tqpMauIpnydi93Qw5/QpI1ddfUsQMWVen6kp4AYB5n3wyN2rDtBMPkb/wgoHkIMGdkbtznqnPrj5hI/kQV+ish3601I1ZOFN8YFzn/wzPI3Jwi6XYjov0WZQ9OSv3alG2GhG6F9pt3U2cQJ3L7aJgCc9gddDTNIgXHrazsrGWkln91Zo6v9XYCNnDMXhv43ffM9JhG9NKmW3KyU3STB8oH/3smJjrCCTjT5RG469GVGbf5t+ChEQYzskUCVW3c1Aw+LTBH0EAYHZT0ulSMn3AM/QNyeXBq/mVXERgENnr4C8TlGb7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8MaNR6niqJfVjKzWKjay5gydY78GOPKX1MGLrgMfsg=;
 b=ITFpvHFUxVTEv4qlIpozHISBPP1hG73Farndkzxif2KkFllSuQvFQvcux1sfFJKcf9Jz/x2JMs3E8hO5M8j/CSLfBvCf49u2xo7Q/hCa+wJL1471hi/o6aOOWbB40zYbx1b6lQV+2fKY3qKAn0lr0HWB6Ph124eenXtaJrsPPmy2rA+dUpknSw+/Ynyz638K1y0ArDXRXhrh+Wyfwv7HfnxEhanGs6+zPD2QN4DOFahQJYokO/9z8lCioQ1gmI8k5oZUbcM+bdj9oGkBdwUJXzSYs/uSpzNaTvkD7Kkru1lKHXHkiLKKfUXoOEG39DFKYDuWiMDWQVaEZuny0zFR/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8MaNR6niqJfVjKzWKjay5gydY78GOPKX1MGLrgMfsg=;
 b=s5pUWJ2Iclwp5w7huxSHe79XwXLxDClaqbD5RCGaJTcT+Psrzo29ENgvV1OeuANqAPwirhvqMIsXVCKs9N9Vh6JI/GfA6L3IB7zUDnVY5QphBbxd7vbcncHY9+HU50itd/Oa5wvOb0MdpxfodQOQL7fGB6tsOLZg3C8bdJKdbh8=
Received: from CH0PR13CA0003.namprd13.prod.outlook.com (2603:10b6:610:b1::8)
 by SJ5PPFDDE56F72B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 11:25:37 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:b1:cafe::84) by CH0PR13CA0003.outlook.office365.com
 (2603:10b6:610:b1::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.4 via Frontend Transport; Mon, 16
 Nov 2026 11:25:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 16 Nov 2026 11:25:36 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 02:19:24 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 02:19:23 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 02:19:22 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 3/6] lib/amdgpu: give compute user queues a CWSR save
 area
Date: Mon, 16 Nov 2026 16:18:56 +0800
Message-ID: <20261116081916.2142984-3-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261116081916.2142984-1-Jesse.Zhang@amd.com>
References: <20261116081916.2142984-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|SJ5PPFDDE56F72B:EE_
X-MS-Office365-Filtering-Correlation-Id: ab3e3d45-e47e-4281-2024-08df43d45631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|18002099003|22082099003|261009223027099003|11063799006|56012099006|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261021123027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: j8FEGhkRxVALC4li2yCM9EoWiyrzgw5W/RDiyQm26ZEz69XwxEj913dRL6wQFRFYirEySF4aOVYxEIMn2lpk97FJkvXAzvRLGkPYfnvtgsnmTi9aTzmFoW0LWSQYXy9KTOZ0uGFh0IneUvPl+baD+9X25ulvc9Cj78nuTHYx0YJuyiS6+7Q5qwbegEFTH7GFl+QTs4gnkingQutnB3AACT+iX94r9db3JF/8Ok8mk1WS734VLQ/l8J4/uyeUyxrsKeBM5Cz+/qPUrIOC2vKNMnVwE/YRXY1/Zzs8A1PtpwIedKygpi2Pi2o/k05X0CD+eczhfZ6QF2Ms01EXoZvsQU4iiyM4cE28BEyIox+nenaNCg3OlXtjSVe6KkAFZUtdHcXFfcNalxkkBzIpAMwdA9WVYAEbdrVWUrZsHGxM7ML7PQ8+Jzbz1X6XK1aird+ABrxsCqI9bl4aX3QNe38mtfk28E0WYfNZgJAQIBYPFqPMcDgr097IRPYEDT6fEgIG6L9d5hG3k4XKvOkfPvq8rTMeAlGRG2ALKeJsqsPwvfLKHyWT+wqOj3y5brEbYaojY97P4pif3UFa2Teuah/sRAUHEnuSvDojpPfBeNBLQu32QqEffPnuBToc1gBRTHx6ZVwrlD5vEJwsuuuxKjYbC7Kx4nUGMshxVsP+svS9E6t/evq3nyi19Y8Y8MxV8tXxm+zV04tlh3XjsuIGeECKyA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021123027099003)(261021121427099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DqfysqvJebqSW8HBU0AcDgGXl8fhEX/D0LOf1MajKlQvcCanYhrpDq9aN/Kaqna2MBM9fLNMlG4XjFXXpaOZ7zyr1qOvM9/v6UHLe2aBvN0CXvVptY+vVLzRvrXFf/QmY9LVZ6JOKD/F/1S/itaRizHHtt+FahUqttbGocVx83P0BrW+eARgzPKbub1YfnjSg9N4QT+wVqBje/qznPy1H2CE+AemG5fg95aENMTWvAts4fRGj4ffZCY203f8sLo0uovL4gS5AWlSwwW55kEFobNPlI98wvrWSF41Bf7L6/4jHOwCEsRcT6Jt670ODDlqUW9t5HmmvqKe5L9YOTyCadeni2ey0Kh9ukgnwH4ImDAxMF3z6AUfwg3znnVBOcUzyTo+ZNQ08nX8AzWMEjlI8xbSsc62vBQRmmH1yqIvaxX7BIUBtoNhbnAm09ZPRery
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:25:36.7769 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3e3d45-e47e-4281-2024-08df43d45631
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFDDE56F72B
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

