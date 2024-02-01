Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB06EC47DDB
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 04:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4274A10E40D;
	Thu,  1 Feb 2024 04:53:56 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47A110E3A5
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 04:53:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0RCDYcI5j+GWioXriqsWmovUL8RTxdrVR9pZ7NsJR6dwPYT2bT0gGAt9u2MchvS4nnYHuCLYfk9R45wkr4s6Sb+EtWntZdnWwnQQJLiGx98yjE5gJ1yaPnOyWe9UYI16gxd2P7J1J7lXbw14jaV6tf9OZ1fxaIkL9AaaQif+hK5gup2T5VXD5YqZ6dOn2f9IB6TMHveqdW/FZEi2WI+1eI5McaUlsG6yEOQ8Bbfb9IZNeVQHvXqlodrmWEN+owaQwNnmCUWca21pvkE6KysTMnhwPbVhhASV1a+KYgNAs1uNw1kezZ0uNo0z3TVtU3MZHGRmiR2OZVPUnKpG7TwBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0tvXp9yBxp7j6EjxwMMiZibLbrL9wiXsoiOkbyo8hk=;
 b=Nd4Sb9tIvIDmQOn5mLyLNy/8fGXPToH/vokKU8wpXsYnFfB+0OVcyfM5reeqbbD3CXmcXwVmlIYi/Bb+rRyKrh9DwwTq68lZ41jmyvScO3gIT1EvZnLfVMwcVDZYNwjP8ny8a0hBsv8vHpfUzcCefHLS3zU/lzVYIJmZ061AsZxxkK38+QTP+srgqR22sx9ypMr6vukiPBignDywoO4Bo5xJJ8Mf8xZ0gdOB7e3AjbEinpkna5OSrYYznF1yOQq8WXOJAXUusIdJBw+v/NspJjUfmZCXp9sZsEXXCaqODFUGNXBNfmlGFdotfuTJ9XgczY2BCQBawalCbzSS5gm9lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0tvXp9yBxp7j6EjxwMMiZibLbrL9wiXsoiOkbyo8hk=;
 b=5VkO3cy/NY2EY6NGtPm0qe1+FRcbRuIFb4GdOcvasajMzAv0z/+8mNbw0znJd//Bz/jAjbxhgDSFWl4EHvqcnAOeLMReeQFUBlz6Bj/PwtmC4NegNlmLmIRbmt5RoYBYTK2gK1ojsNQcfemVjXjUciXYUDTdxE4lhjEvADbvJ08=
Received: from SJ0PR05CA0139.namprd05.prod.outlook.com (2603:10b6:a03:33d::24)
 by DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Thu, 1 Feb
 2024 04:53:50 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::50) by SJ0PR05CA0139.outlook.office365.com
 (2603:10b6:a03:33d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Thu, 1 Feb 2024 04:53:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7228.16 via Frontend Transport; Thu, 1 Feb 2024 04:53:50 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 22:53:46 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 31 Jan
 2024 20:53:34 -0800
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 31 Jan 2024 22:53:33 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH 1/3] lib/amdgpu: add support for gang cs
Date: Wed, 31 Jan 2024 23:53:28 -0500
Message-ID: <20240201045330.610006-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: 22309b70-9309-4136-ae4f-08dc22e1c83e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PTvJrydvPQ1ulomYUyWiYxjJXgoIexsUzCF/X2O2ez5h0F5ywgIgGwrcbFsCcfjgbp0IwVK3EL40WexvtOQi6GRbPy5X+MVSp8wo8+mnwe6Hdb4ZnDRUPEJSB/tk4LeAQhzaBLj3gdulSdcGUL81TEauwd8pxZ5MDX/byOAirqSKlZNI1IM2L+5qtJTKrY3ykcyBV6GfNEv7iJUFZlN3KOSKnH2q6fg69renrlFRrnsrxIyjRsffbu6AM2xt+NkHkX2g21INHCjRSzxhxW3gslSMZVXC5w6vRHc/6OfTSdHsRPhaULZN4UNHwK3mw4skXD56m1KV81hhGuZTrPfumCFxssPFWL6Gq2XyVa+rYNfeH4UL30/RtMaYZ2mT4R/aTK2PyRpXZwjlfKYH30va1KSjIiKH+xx5f8mWJUX1GnGAx19lab4XXb1Na/0oRsyv1kdmFiFPHdCwKuFcD4cHh028W02ECErEfZ5z79ZlTl9e73mJX9bGJuLEJh2+yUAoRYBR+EIRfLHXvjDF+c7iD/MWx7X/ZWNQhoJPvMa5yLMrg21NFCT1kzSaHT1rLJQF42HbsRzG8pPJBQnMjwl9sqzTcHmnqXGO5pnp1o9HQIyn+1sLzbbLEZ1oFwx83gsKCKji7RnG/7BkYcHlJS5eWBQBRC5Fri53ntuIz9lmSwj2F6/d2xk7ULI1j8SLsR5EBYBFwzyPBW8nqUw1/qwHRvQVvtJoruGxICCWtelwE6fhSCkw47wV0MwIQhPlBLDUByx7d2KioGybWArFj+79Kw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(82310400011)(186009)(36840700001)(46966006)(40470700004)(316002)(6916009)(356005)(2906002)(40480700001)(54906003)(40460700003)(8936002)(8676002)(36756003)(4326008)(36860700001)(47076005)(86362001)(70206006)(5660300002)(2876002)(70586007)(81166007)(82740400003)(83380400001)(26005)(336012)(426003)(1076003)(2616005)(6666004)(7696005)(41300700001)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 04:53:50.0898 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22309b70-9309-4136-ae4f-08dc22e1c83e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>, Christian
 Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

When gang command submission is used we need to add fields
for the second buf and second pm4 packet.

Add ASIC-dependent implementation of WAIT_REG_MEM used to poll on
location in the register or memory space until a reference value
is satisfied.

Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 35 +++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_ip_blocks.h | 20 ++++++++++++++++----
 2 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index a7ccfa38b..79ce7b5a8 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -288,6 +288,39 @@ gfx_ring_copy_linear(const struct amdgpu_ip_funcs *func,
 	return 0;
 }
 
+static int
+gfx_ring_wait_reg_mem(const struct amdgpu_ip_funcs *func,
+			const struct amdgpu_ring_context *ring_context,
+			uint32_t *pm4_dw)
+{
+	uint32_t i;
+
+	i = *pm4_dw;
+	ring_context->pm4[i++] = PACKET3(PACKET3_WAIT_REG_MEM, 5);
+	ring_context->pm4[i++] = (WAIT_REG_MEM_MEM_SPACE(1) | /* memory */
+							WAIT_REG_MEM_FUNCTION(3) | /* == */
+							WAIT_REG_MEM_ENGINE(0));  /* me */
+	ring_context->pm4[i++] = lower_32_bits(ring_context->bo_mc);
+	ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
+	ring_context->pm4[i++] = func->deadbeaf; /* reference value */
+	ring_context->pm4[i++] = 0xffffffff; /* and mask */
+	ring_context->pm4[i++] = 0x00000004; /* poll interval */
+	*pm4_dw = i;
+
+	return 0;
+}
+
+static int
+sdma_ring_wait_reg_mem(const struct amdgpu_ip_funcs *func,
+			const struct amdgpu_ring_context *ring_context,
+			uint32_t *pm4_dw)
+{
+	int r;
+
+	r = gfx_ring_wait_reg_mem(func, ring_context, pm4_dw);
+	return r;
+}
+
 /* we may cobine these two functions later */
 static int
 x_compare(const struct amdgpu_ip_funcs *func,
@@ -336,6 +369,7 @@ static struct amdgpu_ip_funcs gfx_v8_x_ip_funcs = {
 	.compare = x_compare,
 	.compare_pattern = x_compare_pattern,
 	.get_reg_offset = gfx_v8_0_get_reg_offset,
+	.wait_reg_mem = gfx_ring_wait_reg_mem,
 };
 
 static struct amdgpu_ip_funcs sdma_v3_x_ip_funcs = {
@@ -351,6 +385,7 @@ static struct amdgpu_ip_funcs sdma_v3_x_ip_funcs = {
 	.compare = x_compare,
 	.compare_pattern = x_compare_pattern,
 	.get_reg_offset = gfx_v8_0_get_reg_offset,
+	.wait_reg_mem = sdma_ring_wait_reg_mem,
 };
 
 struct amdgpu_ip_block_version gfx_v8_x_ip_block = {
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index aef433e7f..4cad30d1e 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -31,22 +31,31 @@ struct amdgpu_ring_context {
 	int res_cnt; /* num of bo in amdgpu_bo_handle resources[2] */
 
 	uint32_t write_length;  /* length of data */
+	uint32_t write_length2; /* length of data for second packet */
 	uint32_t *pm4;		/* data of the packet */
 	uint32_t pm4_size;	/* max allocated packet size */
 	bool secure;		/* secure or not */
 
-	uint64_t bo_mc;		/* result from amdgpu_bo_alloc_and_map */
-	uint64_t bo_mc2;	/* result from amdgpu_bo_alloc_and_map */
+	uint64_t bo_mc;		/* GPU address of first buffer */
+	uint64_t bo_mc2;	/* GPU address for p4 packet */
+	uint64_t bo_mc3;	/* GPU address of second buffer */
+	uint64_t bo_mc4;	/* GPU address of second p4 packet */
 
 	uint32_t pm4_dw;	/* actual size of pm4 */
+	uint32_t pm4_dw2;	/* actual size of second pm4 */
 
-	volatile uint32_t *bo_cpu;
-	volatile uint32_t *bo2_cpu;
+	volatile uint32_t *bo_cpu;	/* cpu adddress of mapped GPU buf */
+	volatile uint32_t *bo2_cpu;	/* cpu adddress of mapped pm4 */
+	volatile uint32_t *bo3_cpu;	/* cpu adddress of mapped GPU second buf */
+	volatile uint32_t *bo4_cpu;	/* cpu adddress of mapped second pm4 */
 
 	uint32_t bo_cpu_origin;
 
 	amdgpu_bo_handle bo;
 	amdgpu_bo_handle bo2;
+	amdgpu_bo_handle bo3;
+	amdgpu_bo_handle bo4;
+
 	amdgpu_bo_handle boa_vram[2];
 	amdgpu_bo_handle boa_gtt[2];
 
@@ -56,6 +65,8 @@ struct amdgpu_ring_context {
 	amdgpu_bo_handle resources[4]; /* amdgpu_bo_alloc_and_map */
 	amdgpu_va_handle va_handle;    /* amdgpu_bo_alloc_and_map */
 	amdgpu_va_handle va_handle2;   /* amdgpu_bo_alloc_and_map */
+	amdgpu_va_handle va_handle3;   /* amdgpu_bo_alloc_and_map */
+	amdgpu_va_handle va_handle4;   /* amdgpu_bo_alloc_and_map */
 
 	struct amdgpu_cs_ib_info ib_info;     /* amdgpu_bo_list_create */
 	struct amdgpu_cs_request ibs_request; /* amdgpu_cs_query_fence_status */
@@ -76,6 +87,7 @@ struct amdgpu_ip_funcs {
 	int (*compare)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, int div);
 	int (*compare_pattern)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, int div);
 	int (*get_reg_offset)(enum general_reg reg);
+	int (*wait_reg_mem)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
 
 };
 
-- 
2.25.1

