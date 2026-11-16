Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17645606A883
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 00:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fAGRkQ7v
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF74D10E56E;
	Mon, 16 Nov 2026 00:44:19 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012035.outbound.protection.outlook.com [40.107.209.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB5610E38C
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 00:40:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w06oLdAN/cWaCI+QGncH2uiP6fhfAwSmveC6je9IjLyZSAUH00hRW6Hjga0DQFQneoAKqiFRl2u6VB5Vdg0m/ckvq4QBRKBLExac2aqw0zLvbCigRYYMZ2nrguy0ppwoTVLkIxG9Yw8GQaKBt+jPDHqM/gnaCM89EScMEpuEIK/d1OyZ1lHm9LmfSP+Stu1ks4t2k436h6LT22r+b0CNSOb50aLBDgschhW2fSYJ79MDv7FSRKcKSulSThb/pDouTd4KPs/7BdU7czYts2tJ3MQxO2mrnw41aHUcosZ6pjHjCy2rIF2NL5g8LNR4V9otxQFruExpOlXGFZeOWF+NGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WpkUAP/kypZp5sMxPbRIrS7bB3Y7RDqtOZ7zj8hqopQ=;
 b=Pvsk8Mb+AOg8k4R1o8mUu1Q3M/HbC1yNZf31Ks1e9qNT6P6aP3bg0vk7oUm/9fIPW8l4257FJ8Y9cdXRKQFoWd4M1tFgxcwolsg3Hm2dhAxwQHCBvJ04QvCtqePn6MWfnnjD/fKrV/gUMXKhk8logGHydHUuN1yP09XZA54bsPJdAqSbqJ2sx3wzEK6INL0OhPhqLjN+a+kWqXnM11X2G7q8SCAKfkhawtzH1if0gTXYZj6WMonr1HU887oAh6iiDN38HmFUiesbRKfV7C0BbFEDXlLj6Ec0PhqYO40zCTtsnN+DHWKIocpf9Xm8q+r38im/jsEVc5lfFCvL4KB9dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpkUAP/kypZp5sMxPbRIrS7bB3Y7RDqtOZ7zj8hqopQ=;
 b=fAGRkQ7v+DWRrXIr9gWmzdr83/rkZWMAEL3O9DugX78iyyT1jO8dC3wvjfoGayOM8rKI7+oujCi+xu7Bew9Dn22HooaDNGMDQt9Bu6BfAp2z3yf4V4chykA6WF2SoBVDyurjocinmAUYNpOUifUp6dOiKzWSSho5zGGDHkpuTow=
Received: from BN0PR02CA0004.namprd02.prod.outlook.com (2603:10b6:408:e4::9)
 by DM4PR12MB8524.namprd12.prod.outlook.com (2603:10b6:8:18d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 00:40:22 +0000
Received: from BN1PEPF00018070.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::6e) by BN0PR02CA0004.outlook.office365.com
 (2603:10b6:408:e4::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 00:40:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00018070.mail.protection.outlook.com (10.167.245.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 00:40:21 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 18:40:19 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Sun, 15 Nov 2026 18:40:19 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Junhua Shen <Junhua.Shen@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH 1/8] lib/amdgpu: document amdgpu_ring_context field contract
Date: Sun, 15 Nov 2026 19:40:00 -0500
Message-ID: <20261116004016.121139-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116004016.121139-1-vitaly.prosyak@amd.com>
References: <20261116004016.121139-1-vitaly.prosyak@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018070:EE_|DM4PR12MB8524:EE_
X-MS-Office365-Filtering-Correlation-Id: 797f975d-aaf3-47c8-7730-08df437a322e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|261102123227099003|11063799006|56012099006|261022075727099003|261021123027099003|261028144727099003|261026140227099003|261026121527099003|261022105027099003|261021121427099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: HYYwULeIUf45j0uotuhXfs4+NtR+Cz4sotXRdzMRjDZIcqxHSPb+F4Mo+FyhszowAC6+eSXmWZrV2oFFOaxxl+W+AZYLSlHE40NgoZf9VcYvfbeoJKzoIl43tiKijfafD1slfAsEKY7bsLsyIaCnCa1IiaYcs6jzhHS/Fee5gt817BNg7IAzeXjVw4ql9zQiVB3cldphjlxQWign73IbV7nwSQ2IhygcczepuCrh4ShlpFRI2VIbF4Cd1frVhPLamdeOGwQkbYABkq3cfWD5zDmwtcmLs+7KfQ7UbBtQWbEHFG45BVrMamqAL/jRWgCuja67+oIvxdWWM8kMYXKf9OKLxVZjiaFMl6pSQ8bL2aCSwPROEwXpp66oeoUUuq/xwTOR8FWMpjxFmxKCYnp0kM07Vw3kGy0Rafegk3suhpQieMfb+Ti9rWBT6pM+88qrmX5pYFEgjzBbK2Vk9OLx6PCvI9X0i/4WxEcOm8+PCtSdI40V7HgMADgyrRflmm8MPxLKfS+qhAq9vhM2qyZoUqNaPQBf9kW1SefWi2IPX/LzWAF+gghcuEN/l9dWOpzevOyRAqDeDv6lY9+zkwHsoq433eVAEfR2+DkbrxNhlT2xfEMjkvjD559ONh1uxLROBsvCCtZKXGzZLF8LBJAhAZxbMfvh67AoibvNd8WAyxElAzuAq479QOxG0Mxj9naWzzxQ3YNy6moTnEVrXsdPOg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(261102123227099003)(11063799006)(56012099006)(261022075727099003)(261021123027099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Xoj/vvOcRhchOBU+vmD6NQfNgFlT+FqdN6LxTtMU/frFpgrAZyDh9S/msyn5z53iEpkpl3PofuWiPygqDi2lB2zfjM50hLAyu9ZlcCki9aqx8v96YLhhE3KTuO+H1d4Adcl0BlswUxyzKgO55sShAM1pSX9QIKFIHppW6ZevO5pVtPVotEjUb7q58Y0Camzqgwn3Q07ON99YyY+55XNEGX8n8GA0emae8K1q9s0l3zytEexCvPjx2TbTKS3zZ7cOgghIeTt7mnX3mpBsPeaZuyxpeJeoTZ+QwNYQIWjbQpKo4dk6nE+KtwZqLLUnYv9c7/pn6KOeNaGaqPQL9qde1ogRKNyfrULiaNQ0vEftiHLKSxp/axoeuUWl5VGRt1VGuXm0NuO/I5tzbrc1Kj6ldamEQDbXSad3ekjBAxu8Ve3BxYTkVjWgfhT10WwXKUgX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 00:40:21.6441 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 797f975d-aaf3-47c8-7730-08df437a322e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018070.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8524
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

From: Junhua Shen <Junhua.Shen@amd.com>

amdgpu_ring_context is the hand-off between the PM4 packet builders
(ip_block->funcs callbacks) and the submitter that drives them.

Make the contract explicit: document the builder/submitter roles and
annotate each field with its direction: IN (submitter sets, builder
reads), OUT (builder produces, e.g. pm4_dw) and INTERNAL (submitter-owned
pm4[] the builder fills). Also clarify the per-packet-type meaning of
write_length and bo_mc/bo_mc2.

Documentation only; no functional change.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_ip_blocks.h | 57 ++++++++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 12 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index fc123fe1a..16a9f2d4f 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -287,26 +287,59 @@ struct drm_amdgpu_info_uq_fw_areas {
 	};
 };
 
-/* aux struct to hold misc parameters for convenience to maintain */
+/*
+ * struct amdgpu_ring_context - hand-off structure shared by the packet builder
+ * and submitter roles.
+ *
+ * Builder role: the ip_block->funcs PM4 callbacks declared in struct
+ *   amdgpu_ip_funcs (write_linear, copy_linear, const_fill, ...). A builder
+ *   reads only the IN fields, populates pm4[], and reports the produced length
+ *   in pm4_dw. It does not access the device, allocate buffer objects, or
+ *   submit.
+ *
+ * Submitter role: the caller that drives a builder. It populates the IN fields
+ *   required by the target packet type prior to invocation, then consumes the
+ *   OUT fields (pm4[]/pm4_dw) to perform the command submission.
+ *
+ * This structure is the sole interface between the two roles; each field is
+ * annotated with a direction:
+ *   IN       set by the submitter before invocation; read by the builder.
+ *   OUT      set by the builder; read by the submitter.
+ *   INTERNAL owned by the submitter; the builder populates its contents only.
+ */
 struct amdgpu_ring_context {
 
 	int ring_id; /* ring_id from amdgpu_query_hw_ip_info */
-	int res_cnt; /* num of bo in amdgpu_bo_handle resources[2] */
+	int res_cnt; /* IN: number of valid entries in resources[] */
 
-	uint64_t write_length;  /* transfer size in bytes */
-	uint64_t write_length2; /* transfer size in bytes, second packet */
-	uint32_t *pm4;		/* data of the packet */
-	uint32_t pm4_size;	/* max allocated packet size */
-	bool secure;		/* secure or not */
+	/*
+	 * IN: per-packet transfer size in bytes. The builder interprets it
+	 * per packet type:
+	 *   write_linear/atomic    - inlined as write_length/4 dwords into pm4[]
+	 *                            (grows pm4_dw; pm4_size must accommodate it);
+	 *   copy_linear/const_fill - HW DMA transfer data count;
+	 *   compare/compare_pattern - verification span (num_compare = write_length/div).
+	 */
+	uint64_t write_length;
+	uint64_t write_length2; /* IN: transfer size in bytes, second packet */
+	uint32_t *pm4;		/* INTERNAL: packet buffer (submitter-owned, builder fills) */
+	uint32_t pm4_size;	/* IN: capacity of pm4[] in dwords (required, non-zero) */
+	bool secure;		/* IN: secure or not */
 	uint32_t priority;	/* user queue priority */
 
-	uint64_t bo_mc;		/* GPU address of first buffer */
-	uint64_t bo_mc2;	/* GPU address for p4 packet */
+	/*
+	 * Operand GPU virtual addresses, assigned per packet type by the
+	 * submitter prior to builder invocation:
+	 *   WRITE/ATOMIC/FILL: bo_mc = destination VA
+	 *   COPY:              bo_mc = source VA, bo_mc2 = destination VA
+	 */
+	uint64_t bo_mc;		/* IN: GPU VA, primary operand (destination, or source for copy) */
+	uint64_t bo_mc2;	/* IN: GPU VA, secondary operand (destination for copy) */
 	uint64_t bo_mc3;	/* GPU address of second buffer */
 	uint64_t bo_mc4;	/* GPU address of second p4 packet */
 
-	uint32_t pm4_dw;	/* actual size of pm4 */
-	uint32_t pm4_dw2;	/* actual size of second pm4 */
+	uint32_t pm4_dw;	/* OUT: actual packet size in dwords */
+	uint32_t pm4_dw2;	/* OUT: actual size of second pm4 in dwords */
 
 	volatile uint32_t *bo_cpu;	/* cpu adddress of mapped GPU buf */
 	volatile uint32_t *bo2_cpu;	/* cpu adddress of mapped pm4 */
@@ -326,7 +359,7 @@ struct amdgpu_ring_context {
 	amdgpu_context_handle context_handle;
 	struct drm_amdgpu_info_hw_ip hw_ip_info;  /* result of amdgpu_query_hw_ip_info */
 
-	amdgpu_bo_handle resources[4]; /* amdgpu_bo_alloc_and_map */
+	amdgpu_bo_handle resources[4]; /* IN: bo_list residency set, maintained by the submitter */
 	amdgpu_va_handle va_handle;    /* amdgpu_bo_alloc_and_map */
 	amdgpu_va_handle va_handle2;   /* amdgpu_bo_alloc_and_map */
 	amdgpu_va_handle va_handle3;   /* amdgpu_bo_alloc_and_map */
-- 
2.43.0

