Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630A7606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 06:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dO20ustK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1908510E342;
	Wed, 18 Nov 2026 06:12:17 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011044.outbound.protection.outlook.com [52.101.57.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1F010E52C
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 06:11:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlEGHwkhxlis/4vBAJgSDC6P/wXh24nzVPsu5iBfWMbUDCS28lt7mvXPDK9dFdwUI3kPYF/b3h1TToVzIb3XNdTkswM62LyIbPfvuBGmFxE3E8J4fOwSa4gX0oCuKLozuBybyHTX8vzmY4o4/1CRuzDHfLSnQcl8GQ4NkmOnHaW957/OJ/NAxVlTK5ApZEcgrKbivr0InB7fZz1YU3TD+5AU0XnzA4BgffB8sMkcaEWw/DSiJUtwm3+WHkxc9Zn95n/YuGCc3zBFBFXYlKKjfnxOJQeznq+qtjzqP8Szh4FhgIt6BrbF0JxhHCW8ofupnGgpIlADGSPZwozpZ4gLjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8MaNR6niqJfVjKzWKjay5gydY78GOPKX1MGLrgMfsg=;
 b=tjNwIM42EstZe9YnUZe6n5SqnIaBWhBfD1nJiO7ZGOMXBCRj9lNxoVPudNSUfk405YjVrcrFLIr+sKhHQCYnaaii//9KWk7/4bxfMecuW0oNMPWLB7MvoT3WSPPpyYa9BZHRksvz0551A8DH41IC3K+bxkl1+xKkIT2E40kSqcl6MSBuaq3F0TXK6/VY70Xv0r9cznE2nqDHcygUdWE6HFW8XovPT1+TCB27RK65y5NdcKxTt0jd42WHCnbEGBm8jd6vjATtPYqM6JqJ66LeJyEiomPwJgK2HEUrOUK1efw6Jqr8pGFUgngEva6sdPoeLJM/RPVLbRSmm2Yz2LmegA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8MaNR6niqJfVjKzWKjay5gydY78GOPKX1MGLrgMfsg=;
 b=dO20ustKB9OggB07ndy1p0kp5SST1wblVSzBMHwGP9r2kYCW/wTki63GWp9bkjrDBgay/CdB954mkE5MyQ+ZLRE1zoGgvoAgC5NaSdkVp/n7DvvwPp0KW+yte/zjocu71kjtb6SS7o/K8+EDpyOqrzD9LoL/PS/dNnbrUMbspvc=
Received: from MN0PR03CA0002.namprd03.prod.outlook.com (2603:10b6:208:52f::31)
 by DS6PR12MB777192.namprd12.prod.outlook.com (2603:10b6:8:411::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 06:11:08 +0000
Received: from IA0PEPF00000037.namprd03.prod.outlook.com
 (2603:10b6:208:52f:cafe::73) by MN0PR03CA0002.outlook.office365.com
 (2603:10b6:208:52f::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 06:11:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 IA0PEPF00000037.mail.protection.outlook.com (10.167.249.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 06:11:07 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 00:11:07 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 00:11:07 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 00:11:05 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t V2 3/8] lib/amdgpu: give compute user queues a CWSR save
 area
Date: Wed, 18 Nov 2026 14:10:44 +0800
Message-ID: <20261118061059.3012530-3-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261118061059.3012530-1-Jesse.Zhang@amd.com>
References: <20261118061059.3012530-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000037:EE_|DS6PR12MB777192:EE_
X-MS-Office365-Filtering-Correlation-Id: 12fe3f8a-6519-4e1c-b806-08df453abc33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|261021123027099003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: usGuaAvPNdLiqD2SEaK4OzQAdVgjODieblEghgYUEyc8yU15p7KOKlg7LmqakONaATLuKElsBbUnzqgxxOQt5vihP7g5TS5dIGvvEBY7vTdMR1sEavMfgTYyzvnrIrjAhClSY6RYU0gxGstygRk66+rrNuzFv+E0Xgck9zHEYh3Q7Xl4GNNufV3xuzDn6BH57zJe0fBM1vuP3m85T1suigm/nrDv1j5MwB3Q+E5+9sOzTNzn59pR7SCxrheAz4wNyfAPi+j3M48JwiKyIJpfC62xYirS6JSf17Fvyfrnel0DHFqVhlnZgblRYpxV+4WVSsjCKGcEsO9jRAcfM/hsKh5z1I+7l8tvNvJ6ZFHor2V0Bd75kRY7/2BiX9vHNevibjw+A98Bf0JySTmtCcSQqtnSpX3A3HGs/nkzvEXUnl7ISHADH+WVEKOMCLxLX4M1IbUkY6qzQMqs2Rycf/uB1Pi5nIHdtaIzTQXK/YxAD26fyG5yCPGRjjKVvT4Y/KL+xGWES0f6jvP06Ojh3GuZD0L4ifEEG/Bh9Y8iaKnXLxWwLU/3SW2v0iJB6jCAByPvSWQQgynxwte2vQDaNubGRRw/atkOL2WKZiGfCxg5iVwJ6uG0wjz2WlNOhivIJ4hMsoRfNdyDlkjWMjb6XnO6dyiJwWZ+I9S3VUJ+rywz9snp3YoI2Z7OuwDnnjO160LTsReXAi0EvmphwLvLLm4r5A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(261021123027099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fyC0taqBeWopRKyraidAI7hbiK5rGHp7sSbpqw5t9h0T4k2AqnI+J22HDvn6sv/4XvpNdqgoV7+3nGnjVka7aeP0aII/e6iDAPVEqKlZhiulB+E4SCMPbxByNt8J4YYIQBcZAVZOvDya7VTV3oENmVlTjpkwbASsnFxQfGVO1mQRvIl5GQrnRuRoLsqG2KQySMIai/n8jj9NXeNvEE+gKNXezTU7pErTFyDYafebIZsEyJiMm9JUZiNYLV2pDwRiwRpoB64+S0b9YXkTK/idIkZXIWnIO3dXT3hL/B8VHZCNOKP4vMxNBfdZJ8nK0pZcf/k8r3IvF0yPiBQKG8NyMx7U2UWsxXOB9JPzJp2RELveVCT9bWZCED3yM2T4JXg6XDaBm9xW9XaE933EqRywOymtL1kRlO5WULx9BdVcTFG8hxBgVE/M/5jMjlPvC9AX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 06:11:07.7480 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12fe3f8a-6519-4e1c-b806-08df453abc33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF00000037.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB777192
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

