Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F06C3064D
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 10:58:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B7C10E201;
	Tue,  2 Jul 2024 10:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LIFhDlDb";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A07410E1B1
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 10:58:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSk7nMjwiOGfFtngBMeYqZObwWQs+GVAbIwjlMeeUQxtGgCDxDZRzObhZ2Ec9g2enZIbT11KpthvDRfnrn1AFZcfXrY27wVSq2+oob7oKdPtSFCifJBwqoyKiBE+cjKWHQxnb+3+agDQD4WtVV7hrBUwiSKQhKXv7OTBSEJlZLeicAkNfp9/cLkq62xv6Tq1Ev6Rx0vmtqfLq21Wx58a/p3UJxdeVUPGH/6DHXoSxvBbIRnSkiAIxXqlj/MD9ws8+Qno+kof//o/IXpuo4rxuNMbwfKEwd+GH8bq67u7Ld+DxQtKjGXcEueX5bOF2SbtA3rpMyIyc/g2g/hcO5q1SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgwEgDIzLi5Rtqlqxtb9u0+K023GOzTB7bAvWfYhecU=;
 b=Y3pnGFxkSIuiSoo0YlfHkQFj96fC1ncx3YWmFxRrB71QBVAY46hTVcX7diwSsxK7PBu+gNwsJQmyTZHqAQjOcBZ9I/KdwYGocRwuRuR0D0rvgSPOhw4UxeMrNZoH9DGTHeLV30d2jFCEWM5W+IhBSJB72dYpvtGi8gzPr6i7s5jpSkT6I/u6dYieh3iBpdEy8I1WzbIczkQNHjrpO49oPtFegov15A+b93KfNoB+6pyXEhpq9GsAk3uh3SvuktJo6Bcru4w3vFB3pP4CgpdPoZ/1vnGa7YTIYfX8rhGU3B+dwC1erPTaxyqyehg0aZIy9cOSQ2XxY/nsQb4nHvcLbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgwEgDIzLi5Rtqlqxtb9u0+K023GOzTB7bAvWfYhecU=;
 b=LIFhDlDbcDEQRcUjUvWpXM97hWbOYT9pSXzql/kvpg8FMoBulFebjLowtL+shRDNANzXttlxY8igsksJmKHEjc7HQLvdlks0qBIXgzDtxyrgH84k69JxQH2mPBcJBvvQLWGv2OZzjV3oJkAZ1gm0DT6BD7GL68xIDUAV5HsgB3w=
Received: from SJ0PR05CA0167.namprd05.prod.outlook.com (2603:10b6:a03:339::22)
 by BY5PR12MB4257.namprd12.prod.outlook.com (2603:10b6:a03:20f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Tue, 2 Jul
 2024 10:58:53 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::d6) by SJ0PR05CA0167.outlook.office365.com
 (2603:10b6:a03:339::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.21 via Frontend
 Transport; Tue, 2 Jul 2024 10:58:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7741.18 via Frontend Transport; Tue, 2 Jul 2024 10:58:53 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Jul
 2024 05:58:52 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Jul
 2024 05:58:52 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 2 Jul 2024 05:58:45 -0500
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>, Jiadong
 Zhu <Jiadong.Zhu@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu: add amd dispatch subtest
Date: Tue, 2 Jul 2024 18:58:44 +0800
Message-ID: <20240702105844.895948-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|BY5PR12MB4257:EE_
X-MS-Office365-Filtering-Correlation-Id: 95c54675-f144-46a4-4c83-08dc9a85f677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HaxmviFrRYQ9xE3bQFe1V2ZgDnzTxMqQIv1Yvth7C0u5eNHt4eTYqp5TxYRw?=
 =?us-ascii?Q?l5X/cUReTZ5G76VUPy7alZL4AuYcTLRDL3RqBy+deIPRmTJ0u/RARb6GP0Al?=
 =?us-ascii?Q?zziit74FiOqxljLL7HMSJtrclZKSZSBcTHKHmzqspA34tAC7dctDa2C0gVcO?=
 =?us-ascii?Q?XDOWy34RJ+/ShlSvtKu+a2gkhvZlVvOf17KzUC4ICGaHXLwPSKmic549CH+0?=
 =?us-ascii?Q?FFJIebO9U3rSjzbuC20/xJoXG78k1k/SeBuNjt7M1dbArK6ktr/jPn/Zy7tJ?=
 =?us-ascii?Q?OV6PU2FGOmzRn5EOu90kS1hCfxLAdG7HlmlB8+AI9BqnmEig+A0XZxq1RteT?=
 =?us-ascii?Q?J5TkflZ1nns4ERZSJnSJX9R0zRh5BlLVVqnRj+08l6rbpGAPQP16KssiTQWF?=
 =?us-ascii?Q?V/jl3kW9z8MGNhRQwAXSnQV31ORTGVqLWlAOpXFIx7TPcOrup1ssMhk774YY?=
 =?us-ascii?Q?Az0ZyQVgSn1Nc+O88b7Dlccj3LslsycEQmacI9Yv9+FlGyC3yjAtgDV91Erj?=
 =?us-ascii?Q?8IDeWme0SdLpIZb2U3Xi5RmEyTG6i9Vi5t9NezViju4XqT7tTZ4yfVZq3sw2?=
 =?us-ascii?Q?D2oflqm2QFp+zPqh04JOLLgEp5ynmEnOiu2Y9F8PZyRQhQlfqsaVmMCNZxrz?=
 =?us-ascii?Q?SsQF+tJNYNoBMSukRL0PvXkHkse4Bik6agsdAePXQuc7vyl4JMvde76C1CkC?=
 =?us-ascii?Q?K3jtxkLh8KiUkqfEyJnm+IWDarGtOMjrGgDLaqsiK309knICq/cMb15XV/XA?=
 =?us-ascii?Q?BL9gLB1QkxBggYsg7gGW2RK0l9TdqJM3W22njYKpL6EMI4j+G3bjAZ3Adxg/?=
 =?us-ascii?Q?HKngz55MPacnWDA7xeKU6d1SRl5bg8rvXT/1ohSjjuHT0HNOod04lbQln2o6?=
 =?us-ascii?Q?YUwnl5sae5NbalMe58UNkSKPhR6fmVTtLwgFiU30dN7dTTG+B8m0nQidz3ex?=
 =?us-ascii?Q?EZdJgtt4PmW3wMkVKHtIAFunEc04IQXyCKiaG4D0epuL/wsJhSZrC5wlqYYr?=
 =?us-ascii?Q?6RAHw38kh7kUzA4LRfJqSXrNe+kzukyCCCVjGY3tCkTr82tNz75gIYtRia5E?=
 =?us-ascii?Q?6eiSGnKwZS871aUL910PcvhCkDyt9l2srhiQwj2QwxGpqy6Y5KrBwwdVmn9s?=
 =?us-ascii?Q?sWIxQ99yBxQzSol+mU3BrpmbuUS4+zrWlVXBdSF17jG2A+5Vj0SC0eULCNy6?=
 =?us-ascii?Q?EU2DPtMYrUp1izgq72lBhzBQQNobci5jV7U/MJD8a4GGwtopSjLlvlvXjJtG?=
 =?us-ascii?Q?G7Hi4FUyxtNgaj0tyf+5Oa2GXqJE20NjqLF7Nof3T4M6FIB5ae34Au8V06ep?=
 =?us-ascii?Q?qrWvXOs+4Ts4H4jqteueqvOvWTi29mfs0eFiyNygJQt5rgj80jTaEifM5yGH?=
 =?us-ascii?Q?DVnbIVjl6Sp9BGVTbgzj9nXUBnWFW/5zlYD4ekHcuZPuX77pYrpUW4JhaWXL?=
 =?us-ascii?Q?d93IyTF2mJwxZTy8+jcsxlmxRI6z1OXs?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 10:58:53.4702 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c54675-f144-46a4-4c83-08dc9a85f677
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4257
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

Add more cases to trigger gpu reset.
1. Using invalid user data to trigger a gpu reset.
2. Use invalid shadow program address to trigger gpu reset.
3. Use invalid shader settings to trigger a gpu reset.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Signed-off-by: Jiadong Zhu <Jiadong.Zhu@amd.com>
---
 lib/amdgpu/amd_dispatch.c         | 35 +++++++++++++++++----------
 lib/amdgpu/amd_dispatch.h         |  5 ++--
 lib/amdgpu/amd_dispatch_helpers.c | 39 ++++++++++++++++++++++++-------
 lib/amdgpu/amd_dispatch_helpers.h |  9 ++++++-
 tests/amdgpu/amd_dispatch.c       | 31 +++++++++++++++++++++---
 5 files changed, 93 insertions(+), 26 deletions(-)

diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
index df7d56ea7..47d32dd40 100644
--- a/lib/amdgpu/amd_dispatch.c
+++ b/lib/amdgpu/amd_dispatch.c
@@ -70,7 +70,7 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 	amdgpu_dispatch_write_cumask(base_cmd, version);
 
 	/* Writes shader state to HW */
-	amdgpu_dispatch_write2hw(base_cmd, mc_address_shader, version);
+	amdgpu_dispatch_write2hw(base_cmd, mc_address_shader, version, 0);
 
 	/* Write constant data */
 	/* Writes the UAV constant data to the SGPRs. */
@@ -162,7 +162,7 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 void
 amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 			    uint32_t ip_type, uint32_t ring, uint32_t version,
-			    int hang)
+			    enum shader_error_type hang)
 {
 	amdgpu_context_handle context_handle;
 	amdgpu_bo_handle bo_src, bo_dst, bo_shader, bo_cmd, resources[4];
@@ -202,7 +202,7 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	igt_assert_eq(r, 0);
 	memset(ptr_shader, 0, bo_shader_size);
 
-	cs_type = hang ? CS_HANG : CS_BUFFERCOPY;
+	cs_type = hang == SHADER_INVALID_SHADER ? CS_HANG : CS_BUFFERCOPY;
 	r = amdgpu_dispatch_load_cs_shader(ptr_shader, cs_type, version);
 	igt_assert_eq(r, 0);
 
@@ -217,22 +217,28 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 					&bo_dst, (void **)&ptr_dst,
 					&mc_address_dst, &va_dst);
 	igt_assert_eq(r, 0);
-
 	///TODO helper function for this bloc
 	amdgpu_dispatch_init(ip_type, base_cmd,  version);
 	/*  Issue commands to set cu mask used in current dispatch */
 	amdgpu_dispatch_write_cumask(base_cmd, version);
+
+	if (hang == SHADER_INVALID_PROGRAM_ADDR)
+		mc_address_shader = 0;
 	/* Writes shader state to HW */
-	amdgpu_dispatch_write2hw(base_cmd, mc_address_shader, version);
+	amdgpu_dispatch_write2hw(base_cmd, mc_address_shader, version, hang);
 	memset(ptr_src, 0x55, bo_dst_size);
 
 	/* Write constant data */
 	/* Writes the texture resource constants data to the SGPRs */
 	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
 	base_cmd->emit(base_cmd, 0x240);
-	base_cmd->emit(base_cmd, mc_address_src);
-
-	base_cmd->emit(base_cmd, (mc_address_src >> 32) | 0x100000);
+	if (hang == SHADER_INVALID_USER_DATA) {
+		base_cmd->emit(base_cmd, mc_address_src);
+		base_cmd->emit(base_cmd, 0);
+	} else {
+		base_cmd->emit(base_cmd, mc_address_src);
+		base_cmd->emit(base_cmd, (mc_address_src >> 32) | 0x100000);
+	}
 
 	base_cmd->emit(base_cmd, 0x400);
 	if (version == 9)
@@ -247,8 +253,13 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	/* Writes the UAV constant data to the SGPRs. */
 	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
 	base_cmd->emit(base_cmd, 0x244);
-	base_cmd->emit(base_cmd, mc_address_dst);
-	base_cmd->emit(base_cmd, (mc_address_dst >> 32) | 0x100000);
+	if (hang == SHADER_INVALID_USER_DATA) {
+		base_cmd->emit(base_cmd, mc_address_src);
+		base_cmd->emit(base_cmd, 0);
+	} else {
+		base_cmd->emit(base_cmd, mc_address_src);
+		base_cmd->emit(base_cmd, (mc_address_src >> 32) | 0x100000);
+	}
 	base_cmd->emit(base_cmd, 0x400);
 	if (version == 9)
 		base_cmd->emit(base_cmd, 0x74fac);
@@ -401,7 +412,7 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 	amdgpu_dispatch_write_cumask(base_cmd, version);
 
 	/* Writes shader state to HW */
-	amdgpu_dispatch_write2hw(base_cmd, mc_address_shader, version);
+	amdgpu_dispatch_write2hw(base_cmd, mc_address_shader, version, 0);
 
 	/* Write constant data */
 	/* Writes the texture resource constants data to the SGPRs */
@@ -536,7 +547,7 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 	}
 }
 
-void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type, int hang)
+void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type, enum shader_error_type hang)
 {
 	int r;
 	struct drm_amdgpu_info_hw_ip info;
diff --git a/lib/amdgpu/amd_dispatch.h b/lib/amdgpu/amd_dispatch.h
index 4df8b1355..5f05ee693 100644
--- a/lib/amdgpu/amd_dispatch.h
+++ b/lib/amdgpu/amd_dispatch.h
@@ -25,15 +25,16 @@
 #define AMD_DISPATCH_H
 
 #include <amdgpu.h>
+#include "amd_dispatch_helpers.h"
 
 void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle,
-			      uint32_t ip_type, int hang);
+			      uint32_t ip_type, enum shader_error_type hang);
 
 void amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 					uint32_t ip_type,
 					uint32_t ring,
 					uint32_t version,
-					int hang);
+					enum shader_error_type hang);
 
 void amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 				      uint32_t ip_type);
diff --git a/lib/amdgpu/amd_dispatch_helpers.c b/lib/amdgpu/amd_dispatch_helpers.c
index b0a5f550e..e255fb2ab 100644
--- a/lib/amdgpu/amd_dispatch_helpers.c
+++ b/lib/amdgpu/amd_dispatch_helpers.c
@@ -114,7 +114,7 @@ int amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base * base, uint32_t version
  }
 
 
-int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr, uint32_t version)
+int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr, uint32_t version, enum shader_error_type hang)
 {
 	static const uint32_t bufferclear_cs_shader_registers_gfx9[][2] = {
 		{0x2e12, 0x000C0041},	//{ mmCOMPUTE_PGM_RSRC1,	0x000C0041 },
@@ -123,6 +123,7 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr
 		{0x2e08, 0x00000001},	//{ mmCOMPUTE_NUM_THREAD_Y,	0x00000001 },
 		{0x2e09, 0x00000001},	//{ mmCOMPUTE_NUM_THREAD_Z,	0x00000001 }
 	};
+
 	static uint32_t bufferclear_cs_shader_registers_gfx11[][2] = {
 		{0x2e12, 0x600C0041},	//{ mmCOMPUTE_PGM_RSRC1,	  0x600C0041 },
 		{0x2e13, 0x00000090},	//{ mmCOMPUTE_PGM_RSRC2,	  0x00000090 },
@@ -131,6 +132,14 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr
 		{0x2e09, 0x00000001},	//{ mmCOMPUTE_NUM_THREAD_Z, 0x00000001 }
 	};
 
+	static uint32_t bufferclear_cs_shader_invalid_registers[][2] = {
+		{0x2e12, 0xffffffff},	//{ mmCOMPUTE_PGM_RSRC1,	  0x600C0041 },
+		{0x2e13, 0xffffffff},	//{ mmCOMPUTE_PGM_RSRC2,	  0x00000090 },
+		{0x2e07, 0x00000040},	//{ mmCOMPUTE_NUM_THREAD_X, 0x00000040 },
+		{0x2e08, 0x00000001},	//{ mmCOMPUTE_NUM_THREAD_Y, 0x00000001 },
+		{0x2e09, 0x00000001},	//{ mmCOMPUTE_NUM_THREAD_Z, 0x00000001 }
+	};
+
 	static const uint32_t bufferclear_cs_shader_registers_num_gfx9 = ARRAY_SIZE(bufferclear_cs_shader_registers_gfx9);
 	static const uint32_t bufferclear_cs_shader_registers_num_gfx11 = ARRAY_SIZE(bufferclear_cs_shader_registers_gfx11);
 	int offset_prev = base->cdw;
@@ -146,19 +155,33 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr
 	if ((version == 11) || (version == 12)) {
 		for (j = 0; j < bufferclear_cs_shader_registers_num_gfx11; j++) {
 			base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
-			/* - Gfx11ShRegBase */
-			base->emit(base,bufferclear_cs_shader_registers_gfx11[j][0] - 0x2c00);
-			if (bufferclear_cs_shader_registers_gfx11[j][0] ==0x2E12)
-				bufferclear_cs_shader_registers_gfx11[j][1] &= ~(1<<29);
+			if (hang == SHADER_INVALID_PROGRAM_SETTING) {
+				/* - Gfx11ShRegBase */
+				base->emit(base,bufferclear_cs_shader_invalid_registers[j][0] - 0x2c00);
+				if (bufferclear_cs_shader_invalid_registers[j][0] ==0x2E12)
+					bufferclear_cs_shader_invalid_registers[j][1] &= ~(1<<29);
+
+				base->emit(base,bufferclear_cs_shader_invalid_registers[j][1]);
+			} else {
+				/* - Gfx11ShRegBase */
+				base->emit(base,bufferclear_cs_shader_registers_gfx11[j][0] - 0x2c00);
+				if (bufferclear_cs_shader_registers_gfx11[j][0] ==0x2E12)
+					bufferclear_cs_shader_registers_gfx11[j][1] &= ~(1<<29);
 
-			base->emit(base,bufferclear_cs_shader_registers_gfx11[j][1]);
+				base->emit(base,bufferclear_cs_shader_registers_gfx11[j][1]);
+			}
 		}
 	} else {
 		for (j = 0; j < bufferclear_cs_shader_registers_num_gfx9; j++) {
 			base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
 			/* - Gfx9ShRegBase */
-			base->emit(base,bufferclear_cs_shader_registers_gfx9[j][0] - 0x2c00);
-			base->emit(base,bufferclear_cs_shader_registers_gfx9[j][1]);
+			if (hang == SHADER_INVALID_PROGRAM_SETTING) {
+				base->emit(base, bufferclear_cs_shader_invalid_registers[j][0] - 0x2c00);
+				base->emit(base, bufferclear_cs_shader_invalid_registers[j][1]);
+			} else {
+				base->emit(base,bufferclear_cs_shader_registers_gfx9[j][0] - 0x2c00);
+				base->emit(base,bufferclear_cs_shader_registers_gfx9[j][1]);
+			}
 		}
 	}
 	if (version == 10) {
diff --git a/lib/amdgpu/amd_dispatch_helpers.h b/lib/amdgpu/amd_dispatch_helpers.h
index a129e8e07..e01afb6fb 100644
--- a/lib/amdgpu/amd_dispatch_helpers.h
+++ b/lib/amdgpu/amd_dispatch_helpers.h
@@ -25,6 +25,13 @@
 #define AMD_DISPATCH_HELPERS_H
 
 #include <amdgpu.h>
+enum  shader_error_type {
+	SHADER_EXECSUCESS,
+	SHADER_INVALID_SHADER,
+	SHADER_INVALID_PROGRAM_ADDR,    /* COMPUTE_PGM */
+	SHADER_INVALID_PROGRAM_SETTING, /* COMPUTE_PGM_RSRC */
+	SHADER_INVALID_USER_DATA /* COMPUTE_USER_DATA */
+};
 
 struct amdgpu_cmd_base;
 
@@ -32,6 +39,6 @@ int amdgpu_dispatch_init( uint32_t ip_type,struct amdgpu_cmd_base *base_cmd, uin
 
 int amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base *base_cmd, uint32_t version);
 
-int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base_cmd, uint64_t shader_addr, uint32_t version);
+int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base_cmd, uint64_t shader_addr, uint32_t version, enum shader_error_type);
 
 #endif
diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
index 323284306..26e11cc84 100644
--- a/tests/amdgpu/amd_dispatch.c
+++ b/tests/amdgpu/amd_dispatch.c
@@ -10,6 +10,7 @@
 #include <sys/sysmacros.h>
 #include "lib/amdgpu/amd_memory.h"
 #include "lib/amdgpu/amd_command_submission.h"
+#include "lib/amdgpu/amd_dispatch_helpers.h"
 #include "lib/amdgpu/amd_dispatch.h"
 
 static void
@@ -31,9 +32,9 @@ amdgpu_dispatch_hang_gfx(amdgpu_device_handle device_handle)
 }
 
 static void
-amdgpu_dispatch_hang_compute(amdgpu_device_handle device_handle)
+amdgpu_dispatch_hang_compute(amdgpu_device_handle device_handle, enum shader_error_type error)
 {
-	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 1);
+	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, error);
 }
 
 static void
@@ -125,7 +126,31 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-compute-with-IP-COMPUTE") {
 		if (arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f("amdgpu-dispatch-hang-test-compute")
-			amdgpu_dispatch_hang_compute(device);
+			amdgpu_dispatch_hang_compute(device, SHADER_INVALID_SHADER);
+		}
+	}
+
+	igt_describe("Test GPU reset using a invalid shader program address to hang the job on compute ring");
+	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-program-addr-test-compute-with-IP-COMPUTE") {
+		if (arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f("amdgpu-dispatch-invalid-program-addr-test-compute")
+			amdgpu_dispatch_hang_compute(device, SHADER_INVALID_PROGRAM_ADDR);
+		}
+	}
+
+	igt_describe("Test GPU reset using a invalid shader program setting to hang the job on compute ring");
+	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-setting-test-compute-with-IP-COMPUTE") {
+		if (arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f("amdgpu-dispatch-invalid-setting-test-compute")
+			amdgpu_dispatch_hang_compute(device, SHADER_INVALID_PROGRAM_SETTING);
+		}
+	}
+
+	igt_describe("Test GPU reset using a invalid shader user data to hang the job on compute ring");
+	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-user-data-test-compute-with-IP-COMPUTE") {
+		if (arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f("amdgpu-dispatch-invalid-user-data-test-compute")
+			amdgpu_dispatch_hang_compute(device, SHADER_INVALID_USER_DATA);
 		}
 	}
 
-- 
2.25.1

