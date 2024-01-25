Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9133BC47DDF
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 03:44:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23EF210EA2F;
	Thu, 25 Jan 2024 03:44:22 +0000 (UTC)
Received: from outbound.mail.protection.outlook.com
 (mail-mw2nam04on2071.outbound.protection.outlook.com [40.107.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECACF10EA2F
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 03:44:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nz3An2R+eU/S4IvJ0/P2kvbZIhy8L/0J557AV17RU6bLrZBZsQU2mLYVHQ2doTs+ATcALLwAFtTAPH8dEUwbxLehw57E2wYh6VySVEeZ9ZfYQeRVuMm7MxCESMACHoSX1LxQmUNtyWXf6vRs+/bn7ijD+XQQBkzcyd7IzRd/QRdCB5KGCHfie4UWEdHN8624kMEmhfso2H92pNj+uhMZI+Mpw7aligdbOR8oJurhegHPkIMWC3WF/HhptQg/UmiUU5w/hIXq5/LIZRc0Ah+sqfuI2c7bQW8CsmtRxQkQiMaNoOszxqNK9yqiid5UHFAuTB/ipILfMvGLAScGuo9T7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpDhNpoCKYjOtIZhUhTTYdwlovdvcvLzTCVQ56tTFKg=;
 b=E1KN4Aa+PpyYdsDyCuk/ZHvJAe+Fk/F9u+39B5OGa5vI2MQ7gUhNw3AGvOdbpsk0t+wm7q+VwN56cgPBMBjQJchvJFlVTAeSc++hK2SWALkctwq21YI6LoeHRH+4jp1rpFmsTCJ5777w9TVsC5tq0eh6YVMB+00OibTZcz7Ib7pL49U9bkHh7aiW+f9jhloffmtMssbZhHFhVlVDBWBPxAAWLR6EZSpHGLmkNbxUBWQG9ALmMHF77GxzaAGHUmAMpsbtLC7POOewuOK2TNYHlTQPQP/19mCT5ehxpllFs/3ZbW7AnNsd42V1YcFIdfxYNWTwAAVZtUgcTUq76VOjzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpDhNpoCKYjOtIZhUhTTYdwlovdvcvLzTCVQ56tTFKg=;
 b=MA/b4OIlmiO23i2XB1tsNJn0idurdNXenAyy4hBFcHl5gzFT71vOTny6vS+elZWkWzid0UL3iVs6ue+wzWBwX1EED4WNRMwldVgqQOzRU/+VhFO3rQmXVS4hp83t07hvP+gG1Q2PHW+cZlX3viPD7sRF0uXkqFNpLFds765yM5I=
Received: from MW3PR06CA0016.namprd06.prod.outlook.com (2603:10b6:303:2a::21)
 by SN7PR12MB6909.namprd12.prod.outlook.com (2603:10b6:806:263::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Thu, 25 Jan
 2024 03:44:18 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:303:2a:cafe::e2) by MW3PR06CA0016.outlook.office365.com
 (2603:10b6:303:2a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22 via Frontend
 Transport; Thu, 25 Jan 2024 03:44:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Thu, 25 Jan 2024 03:44:18 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 24 Jan
 2024 21:44:17 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 24 Jan
 2024 19:44:16 -0800
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 24 Jan 2024 21:44:15 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH 1/3] lib/amdgpu: add support for gang cs
Date: Wed, 24 Jan 2024 22:44:11 -0500
Message-ID: <20240125034413.232349-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|SN7PR12MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: 20ad708e-45f1-4a11-c478-08dc1d57e8a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9FuBC7xyAzt+anWMjLB1IhaS+aoEf7VcQyxlGBCkZ2i5XHzr+YkTzipt+ZIEugUBhmFJfQRC9AnR7lrBIyO4CzZ9Zcng5gS3Ox3Bqkiz1noNeBOTzlHbqYlur9ZriptrYLyXtYQPPgjdYquQCeDI3FV7W3vIsVuHlAPFCyM0bMsSFczc9oWhe6NSdnhkPrfT8M9WWF0bCXkB/YJlCl5eF+fmhQzHl/tZtCZxbMmoRaimKr3DffKu3xv0xaFpyd3sTk6CFeL9ZFy3j39YroNLlIf89lhAQjTFDOFF2w7yK8VwoWEIGkjZcas+/THDQjQFqjFTRnVIIQyw9Z9JgjZvckq7PkP7auwyWK1z5OQ1W9b356wsDPw3oPNPNQSzog453OzSARka97eJhQMBlpSHCe5PlXOs+7c0QOUciYSl26WLdrJzqc+j2NJzxYxwV9ufv420LnbFZxTeNeiNZD/+QP2S/9rFBt/+5OAAsjIBPTyf7Fk+msvLAP2n51eGH0m5pEcVupX/MQaIUqwqrnKpMiNJCKW/EiEkb5Y604fk9QGsN2UyGhmmxW9twjZaRkci+7VPwW9rm8LuOmsxccD8XLA+gULzxC69Hp6bc6++Vw2K9cuREiZFPzzdao6tDfQ8n2pTG8lonNfvFRTtw7AHBlqZKzpOWqDQYe2/ABX/Ou/PjP1NdgN779wvPA4hCKHljaJNmo8eIAKNKR1xUemkxPTLaw0xef2Pbgl0wyjZRtYPZLImX7wGgf2lOFfyEvkod+5LrOyClq2vGYZTKFi6Yw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(82310400011)(1800799012)(186009)(40470700004)(46966006)(36840700001)(36756003)(2876002)(2906002)(41300700001)(40480700001)(40460700003)(83380400001)(5660300002)(70586007)(6916009)(316002)(47076005)(70206006)(7696005)(86362001)(54906003)(6666004)(426003)(1076003)(336012)(478600001)(26005)(81166007)(356005)(82740400003)(2616005)(36860700001)(8936002)(8676002)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 03:44:18.0414 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ad708e-45f1-4a11-c478-08dc1d57e8a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6909
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
Acked-by: Christian Koenig <christian.koenig@amd.com>
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


