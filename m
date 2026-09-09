Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36690C79F8C
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 10:47:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC3810E147;
	Wed,  9 Sep 2026 10:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ddT3r6R1";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010015.outbound.protection.outlook.com [52.101.46.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C045810E147
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 10:46:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KeM9gGI3xtDSFF7LmY2WWlN4Qu+a1/Gov46kyiABuUSaxFlVPDvrsDeua1H8WlH8ziIP0EVQeu3Gvyf48n+mLcgIfdvtGD4xc39fNgkzWlf05/6NEzKp1Dt9SlojtSUdHiWKuQLakBWkqQXiAuqi8noqFDILScFm7qEONCLrwRaGeqBw41HYmOoY+742LOFA/+wqk7gx1w3Va9A5537wq9f6zjwxw95eLwEZ/tawkKubQ7bMxT4+uQ8B//1mSQc9k3l+/yVfeKCLXWeBxWXU78+s6FX7AT6CeGlmmPQCGV9GOtXaGQRhyXtwiMW/1+AthWnV4J9ozh0hTfX7pKQxuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERvrXbCwTtZUx/+fs3t+yPKbQuQi426Zes/Jc3XVjfI=;
 b=XmSu3seb39c7XqVJ7TDZTkakA0u0iBQrFV62qh3sInzcqq7Ku26kdburfoE4+K1wR3uXertiUwa+olPPYYEGE31iiRJeyu7mFDlfdVSSV5ANOsyHgIbPg01VUR2visQ4Due/dtNJ8OKP4O9Xfr7cRssDpqt/72ofXruGsGeHidmfQM44VOtFrtZHV9tYuZarquJt3+FTJJq2PZJyYgQ+mCbWhM4XkYsT2eECBZmX8k2Dxnbmv8TCu/9Mpdnsp3e1lo5DpbuUN8B3MDi1Zs0y/xjK6FAbf4c8JjxbH/kQoXCjCBHHqjD96y8I+jgRkfvvNvAjhv6miR4rUGnuCd09dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERvrXbCwTtZUx/+fs3t+yPKbQuQi426Zes/Jc3XVjfI=;
 b=ddT3r6R17D2AwCNRikLa3bbDC0o8pSb52CKj+Ul47UPcJDfukFaZCBxRytPmYSYiP8NnbjhfZ/K3CFI0xEhRev+tjCVuzjQSjvQmGNkQoED6afHBec47dw9Vjsuh8v5HS/H3zBBoMHzq6IzjK+qyYYR+bCdVbsmZNB6oaDQ/mA8=
Received: from MW4PR04CA0079.namprd04.prod.outlook.com (2603:10b6:303:6b::24)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 10:46:14 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::2f) by MW4PR04CA0079.outlook.office365.com
 (2603:10b6:303:6b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Wed, 9
 Sep 2026 10:46:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 10:46:12 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 05:46:12 -0500
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 9 Sep 2026 05:46:10 -0500
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, Honglei Huang
 <honglei1.huang@amd.com>, Huang Rui <ray.huang@amd.com>, Yiru Ma
 <yiru.ma@amd.com>, Junhua Shen <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v2 1/6] lib/amdgpu: document amdgpu_ring_context field
 contract
Date: Wed, 9 Sep 2026 18:45:57 +0800
Message-ID: <20260909104602.13807-2-Junhua.Shen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909104602.13807-1-Junhua.Shen@amd.com>
References: <20260909104602.13807-1-Junhua.Shen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|MN2PR12MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: 4404112e-1c6e-456a-1481-08df0e5f90ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|3023799007|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: bQlKM60hV6QIKt2kfRc8uUzXsYPRi1Dm1Dt5QYJrVicDZOQJgq6Drc3fDL71xzKjYoLiS4bWPe96/FSrkuQpDghtwMuE0FM1IOoY2JCqNzLcs/cFaQ/c6lilhbiz/a46SfjH1n7CTYdPXHQx/ZFVkC9YbwZDs83kW05tVqkYw4ja7kAfOvkpT5WLOKeqpbQRpW6x1kkadtn733kEt1vKw4+XQv528aFkValwSeWpUxAZCHsJMToQXk9DXcQg9g9AlDlYjxoFojQN1JmD2oBH0hTprlqcmXyGFAiVm75x3yhE2sN3oTpgfhdKC0ILYd4NK++7HmIm2zXy19DEuz44zRuyESa0SblXqs0yt/XX9hp21QRFvZuKLLXUnBZlKx9u17HHn2yl4jYgI0gugzc+FH67b2wkDG2xdiVn59ZC+RsuJuSuqDuwivoN/N01OY0pR6m9C4kJFi4Lla4SH6w/SMLoEgzQ8DxmAq68d6r1cP8zq/9f9xXOe8z4dRHqKFMPXOBoXhaCuALR1+/tfrreFGlEFIeCvWwN3st5KZX956fYKRY1hKBI/XFVOgwS74clvmyF4U5U5bcNhfPaLOxJjsWqkq4aSvZhDoxsUEvp3y5HCxh4Yxi4g/nbPVO44pXdJKGvHs5HjXeXGbS9Fs9hs/OQ9CX7WzcDdfBBUex31IfKUA71suRSxvU8chH+BPxhQvGuI+WN69wfWFURaTYEFw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rD5DU7c7s1OYYClPm6KuEP9mTGaZ58uI01wVCoXHUAmQswh7Ct7CybIRJovbj1w9MFRUvVDWuej9OPC4thZsBLqtXajFN736hxMQu+AiLaeo9uPEqU/P4x76nH5/Srhl/4zykYFiYMdcAE+T/PzLOFE8VgBjwUcgyq/wrJEPp+4q1ZtdrWv3nodLESVPUsxP6sRsggYkl69ZXqxepgDhm1SMatRPHWdhyn6O/6bGM/kBqrWkKrSK+pWiTQXr4R3K5VrSuIzrxd0TnIfXBuF1j4XYvEYUD6IXyYOACSXkE6BwRd4DvXHUAVHrOPwA1SNliLxyBOpF8Oqzh7/6BuggLCXThoX4lh4lQ4cNs5Zx116t1YLA3MYYMh1nrZwoi7zF+o1CtGeatqNzL/8iyKIFfcXNRLOULga4WgBr2QeCPHvWgBS38I5mNJH2WvzwTQj6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 10:46:12.5084 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4404112e-1c6e-456a-1481-08df0e5f90ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287
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

amdgpu_ring_context is the hand-off between the PM4 packet builders
(ip_block->funcs callbacks) and the submitter that drives them.

Make the contract explicit: document the builder/submitter roles and
annotate each field with its direction: IN (submitter sets, builder
reads), OUT (builder produces, e.g. pm4_dw) and INTERNAL (submitter-owned
pm4[] the builder fills). Also clarify the per-packet-type meaning of
write_length and bo_mc/bo_mc2.

Documentation only; no functional change.

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

