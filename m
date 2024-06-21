Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D82C2BA18
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 02:51:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20D510E913;
	Fri, 21 Jun 2024 02:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LV/mNSKd";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA2510E913
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 02:51:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajakcjeWoKrqrYr5B8giCk5wGMeTq/12E2OFhI6Rb7p+9Rq5f7SWeFjnLDXxUhII67Z23dngdsDjKgRfa5kSFvDIcWkanNL4gZNCzbdjjq/GHi5smo2eMzteooRA9dYhB+bjCvJTEYDZyWTA6MbubWGYmEEJu974mYAgRbV37ZpLwXzELoBNoHzdQgV5SPTdO3HOZ2iuO8nD+3s8uKAJ/Q4F33XexBpoUAWE9hX86tsnJLuB2J15oHIq9n9KrC3mytUJmAU9yJxjbeR7KKXhE1B0sPU/yjXIjpOdb0dV/gYlaPNucoNYnx1+TMCXh2/Qmp+liSJwh6xVseRvBETjxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0yQXhwTXT1lXa+jySSFkmJrVaRgE2zN61vq7qs3CF4=;
 b=oNgn3qFjiyhev5fbag33S3E3KVMb7gbZNLKn5LVTdO3tDEODhVCt6u2+434YOlZLOYiGqIvKHigjsT4vnvW/fLP+5Fnd/q0M65lV0YYZCMz5MFZ7IhuNH+kUrF/dAqU1v17TGiHybxVZO0Ryu2bFRUgP44cm8g9l4qM/lMdUthdHam49ezFPXIXhccjtxzeO2HloO8aVf8xS5h7i/ZOyitFuEi+S+r2qhWSnkfFkvR2mkM2+R+mQN0mL7Teo5gsxQ91QV8SELvaTrQAuHDqq79l1cDCTDb02I+2Fd7zvJAbLDbx8nIyQt/jL4vZ5dzSw8j0AwhoCibb2qBE+VFuNkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0yQXhwTXT1lXa+jySSFkmJrVaRgE2zN61vq7qs3CF4=;
 b=LV/mNSKdGo3NLx9aNs1+8sLAswbmchDnD7sQMqa2rPjTg9eoyNfH6CncmmyNPCD5cyG6a801KvahSGS/NRNNjemURVWZwoyehcR5ZQ+b9wb9R0tyVZG7y3iEdEsoNSKyxYO9AabceIKgFkLDzkoZEAhEV76IUOrqsKJ7JYX+Bo4=
Received: from PH0P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::15)
 by IA1PR12MB6281.namprd12.prod.outlook.com (2603:10b6:208:3e7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.35; Fri, 21 Jun
 2024 02:50:58 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:510:d3:cafe::c5) by PH0P220CA0006.outlook.office365.com
 (2603:10b6:510:d3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.32 via Frontend
 Transport; Fri, 21 Jun 2024 02:50:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Fri, 21 Jun 2024 02:50:57 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Jun
 2024 21:50:56 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Jun
 2024 21:50:56 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 20 Jun 2024 21:50:49 -0500
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>, Jiadong Zhu
 <Jiadong.Zhu@amd.com>
Subject: [PATCH i-g-t 3/3] lib/amdgpu: fix gfx11 issue about amd_dispatch
Date: Fri, 21 Jun 2024 10:50:43 +0800
Message-ID: <20240621025043.2294053-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|IA1PR12MB6281:EE_
X-MS-Office365-Filtering-Correlation-Id: fc764521-d4d7-4171-ccf8-08dc919cf9da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|82310400023|36860700010|376011|1800799021; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KnfdIAuWs9QWTM/E94lWNPS2xBLYb5Oa9ZhGfZ4z6dBlk/wVmyI7n519f/CD?=
 =?us-ascii?Q?6mCxPA+vaaPgE2gPyxPdkN0r94+Mg0aT9ckubAuK6n11fbaRu0UoRWagqiQu?=
 =?us-ascii?Q?K0ZhWAqV6iKOz62aM06H0AklC1ssvshXjihJM90ot3GnAfYONqyXOF5ttvqt?=
 =?us-ascii?Q?6NxvhumU8iHIF6brSHTSYTbrWgRegWRDyC93aLIeL1iwKQmoSBfcegAzPVH5?=
 =?us-ascii?Q?hQFHti6mvWU1awqXpjwVlWoi9uCtzXxXDAfHKRUXGRYwu1Y8dRFt7ufMyvc0?=
 =?us-ascii?Q?Qg48DQ5vqEHAOAYP5KLJNJG/CDqeYV39qdmGd2/sK8zIWij2HeKOEoj7nxvB?=
 =?us-ascii?Q?SWXHtGuHPHev8nWrkp4OoKX1n6NgJdQiUvEkoIO49QQE3Ld1IAVWB1yo55/r?=
 =?us-ascii?Q?+rgtIvbXJXDNPGFtojJOv6JiBWdeXYhoe5RBdejSfH4KRuup5ow+x9V0ytoR?=
 =?us-ascii?Q?jgGH28aLhJa8DnZotoXfk2SA7D1YI5WDbcS29Ia6WvBvm3GIin7vHBfG13YJ?=
 =?us-ascii?Q?Z7ecIw+WY7azGQo9qUX4y4KaSsF4oCjfTsFeqc12XFPx0RWr5wZOIrK6Kft1?=
 =?us-ascii?Q?ZOXmab4A1BH5YxDEM1CfZ5nuV++27TiuVOFZYsCLddVLDMDvgsZVrpDlIRMH?=
 =?us-ascii?Q?xqG77DY2PoD5LP1HCVPhovyI1cHuXgKj8BLT5WiZixaFK7ZFnZco8GQbrHlk?=
 =?us-ascii?Q?n5VMkOmqrjgC/ITy9kE8rLVYyWYcEJr1Jp9+34qxoyGeHBcW73CssgCNlnTK?=
 =?us-ascii?Q?BYkAnZJ8BE8xA0q9VPOYQ05EYvyYYUvqCwII0J6G4a1+HMPS24xF7toJr+Cv?=
 =?us-ascii?Q?VCmXxrE+kvYR3v5AAiTFPFbnv+ZB2YKB0rRPCxiWOCTXcTJNbnwzdbjpVh//?=
 =?us-ascii?Q?HWu5qIzLV9iOz8BKY14LXxkAwCmz9VRMTDp+gYtNjEkT1LbOCQiEZA4beXH5?=
 =?us-ascii?Q?Bfbc5qkYeggb13V+VlKlPlLyI+ebTNTyFNRzkHI+i96GTFpTvV0RsrHZD5M8?=
 =?us-ascii?Q?WL2T05r10TC28QCq0dxj3w3zHj3v/jcH5VFGfloyQ0dfWc+0nQI2wfCHP4e+?=
 =?us-ascii?Q?KHn0karu5SYt2Fz5jzVsOa24O8sy/Nt/8sHda4oQaO4FrPaBhUdA63qTRuUA?=
 =?us-ascii?Q?AxPVpzJWBK/Cyh0E4eNv5gsO0IjMybR98BYiNIhs2CpoGBwJZjd1bVzb8gZL?=
 =?us-ascii?Q?DlmvlSoFJj6wDCJChjN1pSJyAyT+4by0Xwy0+A3bEMoBH2TB2hFkaplPNQE6?=
 =?us-ascii?Q?0t33BViJ1MBLE2bSFiRKeFWZeU3NLRehV+yEtT/t+Theyg7FiOfmpZKUYzMf?=
 =?us-ascii?Q?bUK56GonAAv++RoxxLTw9Hx3HkFZHazJjjZRC75Lw5Dcf4ZkIoLglPoEa3Ob?=
 =?us-ascii?Q?LQpy4WWNaIPKXpYwguQS34XTG93ogpWOq7cS6HcTxFwF5f2/DQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(82310400023)(36860700010)(376011)(1800799021); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 02:50:57.1620 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc764521-d4d7-4171-ccf8-08dc919cf9da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6281
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

add some initialized register and fix some uncorrected register setting.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Signed-off-by: Jiadong Zhu <Jiadong.Zhu@amd.com>
---
 lib/amdgpu/amd_dispatch.c         |  2 +-
 lib/amdgpu/amd_dispatch_helpers.c | 34 ++++++++++++++++++++-----------
 lib/amdgpu/amd_shaders.c          |  3 +--
 3 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
index b739ce64d..df7d56ea7 100644
--- a/lib/amdgpu/amd_dispatch.c
+++ b/lib/amdgpu/amd_dispatch.c
@@ -345,7 +345,7 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 	int r, r2;
 
 	int bo_dst_size = 0x4000000;
-	int bo_shader_size = 0x400000;
+	int bo_shader_size = 0x4000000;
 	int bo_cmd_size = 4096;
 
 	struct amdgpu_cs_request ibs_request = {0};
diff --git a/lib/amdgpu/amd_dispatch_helpers.c b/lib/amdgpu/amd_dispatch_helpers.c
index 1c7413922..b0a5f550e 100644
--- a/lib/amdgpu/amd_dispatch_helpers.c
+++ b/lib/amdgpu/amd_dispatch_helpers.c
@@ -70,8 +70,20 @@
 		base->emit(base, PACKET3(PACKET3_SET_UCONFIG_REG, 1));
 		base->emit(base, 0x7b);
 		base->emit(base, 0x20);
+	} else if (version == 11) {
+		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+		base->emit(base, 0x222);
+		base->emit(base, 0);
+		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
+		base->emit(base, 0x224);
+		base->emit(base, 0);
+		base->emit(base, 0);
+		base->emit(base, 0);
+		base->emit(base, 0);
+		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+		base->emit(base, 0x22a);
+		base->emit(base, 0);
 	}
-
 	return base->cdw - i;
 }
 
@@ -85,27 +97,20 @@ int amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base * base, uint32_t version
  		base->emit(base, 0x216);
  		base->emit(base, 0xffffffff);
  		base->emit(base, 0xffffffff);
- 	} else if(version == 10) {
+	} else if((version == 10) || (version == 11)) {
 		/* set mmCOMPUTE_STATIC_THREAD_MGMT_SE1 - mmCOMPUTE_STATIC_THREAD_MGMT_SE0 */
  		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG_INDEX, 2));
  		base->emit(base, 0x30000216);
  		base->emit(base, 0xffffffff);
  		base->emit(base, 0xffffffff);
-		/* set mmCOMPUTE_STATIC_THREAD_MGMT_SE3 - mmCOMPUTE_STATIC_THREAD_MGMT_SE2 */
- 		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG_INDEX, 2));
- 		base->emit(base, 0x30000219);
- 		base->emit(base, 0xffffffff);
- 		base->emit(base, 0xffffffff);
 	}
-
-
- 	/* set mmCOMPUTE_STATIC_THREAD_MGMT_SE3 - mmCOMPUTE_STATIC_THREAD_MGMT_SE2 */
- 	base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 2));
+	/* set mmCOMPUTE_STATIC_THREAD_MGMT_SE3 - mmCOMPUTE_STATIC_THREAD_MGMT_SE2 */
+	base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG_INDEX, 2));
  	base->emit(base, 0x219);
  	base->emit(base, 0xffffffff);
  	base->emit(base, 0xffffffff);
 
- 	return base->cdw - offset_prev;
+	return base->cdw - offset_prev;
  }
 
 
@@ -161,6 +166,11 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr
 		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
 		base->emit(base,0x228);
 		base->emit(base, 0 );
+	} else if (version == 11) {
+		/* mmCOMPUTE_PGM_RSRC3 */
+		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+		base->emit(base,0x228);
+		base->emit(base, 0x3f0 );
 	}
 	return base->cdw - offset_prev;
 }
diff --git a/lib/amdgpu/amd_shaders.c b/lib/amdgpu/amd_shaders.c
index fad6dbced..e4931961c 100644
--- a/lib/amdgpu/amd_shaders.c
+++ b/lib/amdgpu/amd_shaders.c
@@ -132,7 +132,6 @@ int amdgpu_dispatch_load_cs_shader_hang_slow(uint32_t *ptr, uint32_t family_id)
 	    0xd7460000, 0x04010c08, 0xe00c2000, 0x80000100,
 	    0xbf8c0f70, 0xe01ca000, 0x80010100, 0xbf810000
 	};
-
 	struct amdgpu_test_shader memcpy_cs_hang_slow_nv = {
 	        memcpy_cs_hang_slow_nv_codes,
 	        4,
@@ -140,7 +139,7 @@ int amdgpu_dispatch_load_cs_shader_hang_slow(uint32_t *ptr, uint32_t family_id)
 	        1
 	};
 	struct amdgpu_test_shader *shader;
-	int i, loop = 0x10000;
+	int i, loop = 0x100000;
 
 	switch (family_id) {
 		case AMDGPU_FAMILY_AI:
-- 
2.25.1

