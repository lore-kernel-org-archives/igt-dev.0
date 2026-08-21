Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70172C5DF94
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 08:22:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0E410E355;
	Mon, 24 Aug 2026 08:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sVYhccI3";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010048.outbound.protection.outlook.com [52.101.46.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9561710E293
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 12:42:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDDbWXDKxr0/SsPCS+DTpC1OBIz0lB7YirXLjVHP4+emw9nr7hLXbPDhzqaHs4mtWTtlbXXdDobFhGWrDkCfp8QUWeRntPA2pzsDnTiJ+xFvkdLMF46yqosmHOSSZeTdCZLp5OSUi3xyqERxdO+INklcUaRIY2vYG2hl1Qbj1JVoPDXCV0AvV37s12jOk4es/S8bkgeMOO51ZEFhw8rlrPYQNa+pZqYOAXf5O3tbuuyzAxWsnBi764yw4mGJFgwfecfeAvnUGw9jNVmuHf4LdrWvQMLutKHZZpqJIThWiHwdriQMwVlBUT5lwL59UHQvnF4iw3ctzOiWieAkkBjD0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lDLAKnzPYQcQnFGG6WbD4a6oz4e2Lb5kVwhmRIUfKc=;
 b=YO/QQ8AS2nM0JF9VLQ/+8pHtcyIDwuREtbCODPK4fmYBUtrEx1aUf4eSVTvySjsySgthdqgnqEw9jh8a31RMksGhMSh8bJBoHWLTuU4HADtaPZFMoXbG0HyNyBWHQtvv3SQ7UfNDQnJPdYmqHtY7DjmQ74McOxibHdx2zJ0YWLFTP6A5HK4HMlCKqhsadr865BTpABRH3WZkPreGkrGYqB9v670olV3NW8vR5B/cDnF2Grt/wdAjlkChBKJT6KIbFXmAZZspyZXOhZnjo1gk7c7VkHQ7ZhISY6xPij6sfXcpdYFKCJPkGPPU3e4XwnP8N17RAx17VTaXChdvdV7TwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lDLAKnzPYQcQnFGG6WbD4a6oz4e2Lb5kVwhmRIUfKc=;
 b=sVYhccI3tS5Vrw3C7Sb+uij+32oJS5uuDtTfIAm/LHfXu/3vVteslCvG6IlR3q3C2TgKJ6huQJYM1O5XoNQ3KN0E3ZkAJb8CLcLiyW+QH+nfiox9iT5hdC4jX411E3ZMjoRWYD971hIc0jRBsqR0YilMofrNixvzBxJNR40VLNw=
Received: from BY1P220CA0048.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::6)
 by DS7PR12MB6285.namprd12.prod.outlook.com (2603:10b6:8:96::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.11; Fri, 21 Aug 2026 12:41:59 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:59e:cafe::95) by BY1P220CA0048.outlook.office365.com
 (2603:10b6:a03:59e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 12:41:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 12:41:57 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 21 Aug
 2026 07:41:57 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 21 Aug
 2026 07:41:57 -0500
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 21 Aug 2026 07:41:55 -0500
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, Honglei Huang
 <honglei1.huang@amd.com>, Huang Rui <ray.huang@amd.com>, Yiru Ma
 <yiru.ma@amd.com>, Junhua Shen <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v1 1/4] lib/amdgpu: document amdgpu_ring_context field
 contract
Date: Fri, 21 Aug 2026 20:41:49 +0800
Message-ID: <20260821124152.19670-2-Junhua.Shen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821124152.19670-1-Junhua.Shen@amd.com>
References: <20260821124152.19670-1-Junhua.Shen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|DS7PR12MB6285:EE_
X-MS-Office365-Filtering-Correlation-Id: e0629898-a563-49b7-14e5-08deff8196bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|82310400026|376014|36860700016|10067099003|56012099006|3023799007|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: U4aXEkBafUtrY5W8XOUvP7bNjRVAxVgo7djLxkNbwmYg6ITxsVE6Y27V+FshcEKafEvqQG8HQ7ASJBD4Plg6oynpZ4VCI4ggDJiilApJ0PWsJ3U/5ms0kBXirDY0sHGGX6lLk86pxjtfF7jkqeL21sit6XLxLsfpbi6wvJLY9PesRF4+k/r1/q2PZwALwU92ai7RAoMQjnfirkgtKNQdhxQLrnBReE7C2O4mo54jgAtEVptadycugE7aI4Sk2vhOUOn/Z4W+zqbDa/IV9rThX3UDlthuAc/FcjhjlWjyoyjyjbQ+oM3BfUI0nJbaBfUMacBpBEd6VgtbRc8F+Y3plk8PQ1fiEqxWEgqv7vJ9fUxv6Rc7sd3ZDU28GNEhz/qVr/CAZktrtXbvrVG0YxuVE7qi9xIjQvOtaRyDbSHO6OvyA3G7VxC8b+xT7qPl5j1vq4GbSmJxust+AtRlEWHaVWlc5Cfu2qh81esNhA95Fkz7dLubbBSRiDzXxdLT853QMvrpykijDy/g5j8FmrJtEeOCV+DYLCqLbYaPQGK2iEJb2d7hPXSAI9PWtdAsah/ipPFD15k7u6+ZzxeHakUdfIVmmZSPkGMf3b2jK3ViUKNnRqMPYU/GYDp1OWjwRY0QG8xsq9g9E/NuxugH5ofMvlbcKBo8trCWJknCKY12A7yqLu/tHL861Q+Zu710iHCwqf/ZGsRKG3AwJy10jd9pWQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(10067099003)(56012099006)(3023799007)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9KjQ63JgmZNtXRf7Uknkse9a7pO6XdOzv3tb7rVD1eKMtD7ZRuYLRlvwZ4NKoFmoLR1ZEH8pdtdqCEoIW16ysK9Vs21Ow2yKPaJMP/ccAMdh0I8Yc6nxRNpkmutmf3vIxTBVoj0DLfgLugiN2URugEBhhWqylprGdPIBBbqxq8nG2iBGiz2mhyE4lRuuos59DQ2i2tyAik4b7XR4vfVCMlhq98WFJq7AOSCMFC0W5gvhg81Ljv/HUXpJ5YVrf9mBK/S/7+YiEr+UCX8B39zRoT6yjT9LWrEoUwTAKDW2xkXTUmS99ZlI+jgy0+1aSAkSB3ZxzOb1738IYaj/exTjfxmIGei/1hSCA8s84Jk9+EEKqgLrhVjxjRmeAl27lIuudAo9zqohJnPD2pJ0EXmOHck7rGfNxwIuWSYyIoTFi/lZZEdWlaqo+y2v//5IFZDU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 12:41:57.6628 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0629898-a563-49b7-14e5-08deff8196bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6285
X-Mailman-Approved-At: Mon, 24 Aug 2026 08:18:13 +0000
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

Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
---
 lib/amdgpu/amd_ip_blocks.h | 57 ++++++++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 12 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 40a9735be..37f38ed44 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -272,26 +272,59 @@ amdgpu_dma_default_bytes(const struct amdgpu_dma_limits *lim,
 	}
 }
 
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
@@ -311,7 +344,7 @@ struct amdgpu_ring_context {
 	amdgpu_context_handle context_handle;
 	struct drm_amdgpu_info_hw_ip hw_ip_info;  /* result of amdgpu_query_hw_ip_info */
 
-	amdgpu_bo_handle resources[4]; /* amdgpu_bo_alloc_and_map */
+	amdgpu_bo_handle resources[4]; /* IN: bo_list residency set, maintained by the submitter */
 	amdgpu_va_handle va_handle;    /* amdgpu_bo_alloc_and_map */
 	amdgpu_va_handle va_handle2;   /* amdgpu_bo_alloc_and_map */
 	amdgpu_va_handle va_handle3;   /* amdgpu_bo_alloc_and_map */
-- 
2.34.1

