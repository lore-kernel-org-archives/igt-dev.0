Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B97606A33F
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 08:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0lyynktL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A414210F321;
	Tue, 24 Nov 2026 08:34:21 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010000.outbound.protection.outlook.com [52.101.85.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB6410F2FC
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 08:28:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSzpMRUmTR2bcaqrK0+RUdFvipcQTg6rp7QV4psO3oFmhqgxg8yd8QpCPLHOEFqVpaJmSYlKCO50Sc+P5QSQ8IcQlIKK6oyBmnRb7hBApAgMEbERMZrDw4unrQv2zDJzjW/zxCam6ONuv+VZa6I+apccTdcOwfkJCCOMuXaClNlQLj/1rQfWN20eoCLlB+52LPG3cvnNJCw+VOJCVsRjyQvf5duuKpxsv4uJaW4f/v2Te1ajAeK1E0phpj4XWlju2uaq/I5Y1fvBer9Xi+Q8WoHbYi+5qXKVCu2+WmYVB/GO8JVQY0GOEKM3FffU+7r7hhlxx745+5te3dxH/fYOiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9EfDYMomFxJymR8Ri1Fpvey8sf92DNoZZV6e0EKYXU=;
 b=dX73H6D6Q6wxfEF+FfMBywgCakAN2JKWAUiEE16xTv/JqXYF39uHQL7RJMIiJvyl7fwzGxMGSouku0klvNcsUozs2uFpeFX2S/OKxHNMA+EDowrdBYxe8gphd7hgUZN0IvZkLrLZ1re1uC4s2qYA1+tlKo58QM4utU/tUaxMdOCX9yaK6bnlAgtGY3yrUAuJbCFaiW17jrcl8MZwmorCNM5dTx230FiBuSNHh+tsvtkU9w2YICJ1hfEcdl31vJx7xKfMu5USHBCcWDGzcB44SIMtF+MlPOVf7fw5d9mvi1dl0OH0+VKsopor7NcX0TtTFFbiYYaNiTuruCIyh41OFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9EfDYMomFxJymR8Ri1Fpvey8sf92DNoZZV6e0EKYXU=;
 b=0lyynktLaHJubVQOP0cyHQOaS9zvgjV7JK7uWALgRjQ7bdenS4laJ2VT9t/oOcrkUbhBmlGiKPp1wxbwHuJrsIq2ncTHeP0B/AprlKraakuC3WauQJ0lAx1P7mUd1X6p20HBOM8u22TgQUtZjlC1XNRGGuoGS+axVytF2MU6IvI=
Received: from BL1PR13CA0424.namprd13.prod.outlook.com (2603:10b6:208:2c3::9)
 by MW5PR12MB5600.namprd12.prod.outlook.com (2603:10b6:303:195::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 24 Nov
 2026 08:28:50 +0000
Received: from BL4PEPF000003F0.namprd04.prod.outlook.com
 (2603:10b6:208:2c3:cafe::10) by BL1PR13CA0424.outlook.office365.com
 (2603:10b6:208:2c3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 08:28:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL4PEPF000003F0.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:28:49 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:28:49 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 02:28:47 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, <pierre-eric.pelloux-prayer@amd.com>,
 <timur.kristof@gmail.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v4 11/12] tests/amdgpu: enable the compute shader in the
 SLTH GFX dispatches
Date: Tue, 24 Nov 2026 16:27:41 +0800
Message-ID: <20261124082819.2089694-11-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261124082819.2089694-1-Jesse.Zhang@amd.com>
References: <20261124082819.2089694-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PEPF000003F0:EE_|MW5PR12MB5600:EE_
X-MS-Office365-Filtering-Correlation-Id: 94976414-17f9-4956-4a02-08df4a04f749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|18002099003|22082099003|6133799003|261009223027099003|3023799007|261028144727099003|261102123227099003|11063799006|56012099006|261021121427099003|261022105027099003|261026140227099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info: nO0rlfes8vzgKd8WAcNIBmAzTjRrzOoOCtcDzRNj183EM/A85ZL6nnFlXiAI3V0fgrjKeqmdD6ScC9eqOpLD6pC144a8OUIEKh961runs5M6fN/Jxd4IjJEAmoNBs9l1liSD17X13wDtP5+OQjOkcudWopUZqIiCGyno/ERlkPWV5NHX4BtkXiba3GDyT+tdH2hLnrwJHHLPL7CIa2/Dmh0Qy5ue7qDsfXKWPFgLjZ3vsVsocX5YDoGngLgXzXjROjKbrXm5KBhEHcBmpBYOU1cEXBR/vRWO2pW8X5lQAbQdkpXXuYWRJdrYsnxYHxU8xtDEIDIx+XUBDDDLq6jWmAP5zo0HRGwXdpjuVruR+XYtZLu+ConOk7Yo3bqS3+I1nXM3N8FPvwTphe06oyjLawiwVQRZxcsreuqS65+PIusDHf6UWL/QYnf0X5q705QqoxJPbVpO5Tj6ZXMUSfS1wf5qR8WQJvv/t40/Ixv7vSbw5fKDPLEslWCO3ebR55jTs8BCsNvcANIEWanf3SfcOSIQUt7OdGnk6WRqKM8fc1OnxC0VMQ5UCqjzW64gRz4d3iCqOIVhr4ZmDoM2f3Ktb1Lt7fOd68/hvV42V4BV7c3WPPRlBS2rV7UkA2xD9N5oIZwUgyu7vok22Vb4EKauKxIflWurMHMeULGA1mSHZ10hRI4CEYHqBFKtVF+bOBKEk16qzQZx+/jZsPL6ehTpEg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(261009223027099003)(3023799007)(261028144727099003)(261102123227099003)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261026140227099003)(261021123027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QNSCLGpMGFy9IWUYSEePWXz4l/zE/QpegooHGRDZ9rUi1va30stopb4EtiE9dX32YuqzS8xMzX8AoHQO2MmyH3OPEEdBqkIUSG2x8FEc7IEnWcy6DLJqUizQ1a568acKxsyF3H6NLOB4jcQz7lsyLf1gELe/CN+bywO6u/t5TLGh1DTeqHrP3kVvcj+6KRwKwGXrjYPPGR8VertqU2oJEbXINvanur/ZZIXwhofAdBY+7ge2kJ+eWrgClTsZCNuhmrcJ/PAK7XYOsmHwrM0tVLXQKPz9GNm899+uV+IR3CVPbqFjbu3gAAEoVAvi6BlPrLBzg9UVM5KuWOhAmFpDWWFL2bp1Eo8TPKEKUZPBk3ltrOVtOjndOdcli06Cg6hTkn7rW5QSIaNQhUooriZyWRubXMIUNOr+utjOJhZgCCwh79l79JSZEzJBQVS4rZ5E
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:28:49.8574 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94976414-17f9-4956-4a02-08df4a04f749
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL4PEPF000003F0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5600
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

gfx_dispatch_direct() writes a DISPATCH_INITIATOR of 0 on the RV and NV
families, i.e. on all of GFX 10.1 and the GFX 10.3 dGPUs. Without
COMPUTE_SHADER_EN the ME of a GFX queue launches no waves, so the GFX
kernel queue SLTH tests read back the initial 0 and fail on those GPUs,
while the same shaders pass on the compute queues.

Emit the DISPATCH_DIRECT in the SLTH tests with COMPUTE_SHADER_EN,
FORCE_START_AT_000 and ORDER_MODE set, the initiator the GFX 11 and 12
hooks use, instead of touching the shared hook the other tests rely on.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_slth.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/tests/amdgpu/amd_slth.c b/tests/amdgpu/amd_slth.c
index a0677fc5e..4e4d72855 100644
--- a/tests/amdgpu/amd_slth.c
+++ b/tests/amdgpu/amd_slth.c
@@ -247,6 +247,22 @@ static uint32_t slth_cu_mask(void)
 	return slth_sa0_wa ? 0x0000ffff : 0xffffffff;
 }
 
+/*
+ * Dispatch one wave group on a GFX queue. gfx_dispatch_direct() leaves
+ * DISPATCH_INITIATOR.COMPUTE_SHADER_EN clear on the RV/NV families, and the ME
+ * of a GFX queue then launches no waves at all, so set the initiator here:
+ * COMPUTE_SHADER_EN, FORCE_START_AT_000 and ORDER_MODE, as on GFX 11.
+ */
+static void slth_gfx_dispatch(struct amdgpu_cmd_base *base_cmd)
+{
+	base_cmd->emit(base_cmd, PACKET3(PACKET3_DISPATCH_DIRECT, 3));
+	base_cmd->emit(base_cmd, 1);
+	base_cmd->emit(base_cmd, 1);
+	base_cmd->emit(base_cmd, 1);
+	base_cmd->emit(base_cmd, 0x00000045);
+	base_cmd->emit_aligned(base_cmd, 7, GFX_COMPUTE_NOP);
+}
+
 static uint32_t execute_slth_dispatch(
 		amdgpu_device_handle device,
 		uint32_t ip_type,
@@ -353,7 +369,6 @@ static uint32_t execute_slth_dispatch(
 	igt_assert(gfx_ip);
 	igt_assert(gfx_ip->funcs);
 	igt_assert(gfx_ip->funcs->gfx_program_compute);
-	igt_assert(gfx_ip->funcs->gfx_dispatch_direct);
 
 	igt_info("========================================\n");
 	igt_info("NATIVE GFX PROGRAMMING\n");
@@ -381,13 +396,7 @@ static uint32_t execute_slth_dispatch(
 
 	amdgpu_dispatch_write_cumask_mask(base_cmd, gfx_ip->major, slth_cu_mask());
 
-	gfx_ip->funcs->gfx_dispatch_direct(
-			gfx_ip->funcs,
-			base_cmd,
-			1,
-			1,
-			1,
-			0);
+	slth_gfx_dispatch(base_cmd);
 
 	base_cmd->emit_aligned(base_cmd,
 			7,
@@ -650,7 +659,7 @@ slth_umq_run(amdgpu_device_handle device, int fd, unsigned int ip_type,
 					       shader_mc_addr, output_mc_addr,
 					       0x002c0040, 0x00000010, 1, 1, 1);
 		amdgpu_dispatch_write_cumask_mask(base_cmd, ip->major, slth_cu_mask());
-		ip->funcs->gfx_dispatch_direct(ip->funcs, base_cmd, 1, 1, 1, 0);
+		slth_gfx_dispatch(base_cmd);
 	} else {
 		/*
 		 * gfx_program_compute() starts with CONTEXT_CONTROL, a GFX only
-- 
2.50.1

