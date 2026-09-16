Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B23C982C9
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 23:00:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94E910E325;
	Wed, 16 Sep 2026 23:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ha12l0en";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013038.outbound.protection.outlook.com
 [40.107.201.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3FBE10E2DD
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 22:59:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwPiR5Kz+pNpYHtxtyvlxRNH2JqHGsrUB1SP0Lvp7dZQqIEpnK7kDbwR8vGvGeo4fFhpX1dsWHCaJ5HcBWUvq8G0oU6ikFi/lfUsl74BrJz57dWz/Drw4Fpn4AgTo0jyCN0zR1hftxWMiOfa23rxgQAufa24av8CAAmvrJXX2MECfyzBLzydeY7e+glGa+1hd43745BLmfUsF3PWGnpipeQihDKHwqCR6QVJewCLtPfrCZawdcl1HrK9tHLCSDCqTasLnaOjwPkc7oCnTLdQZDpQUOAh6jMraYfuKn+JwK0bnhQxmqDzqyUcy+wkiK0D4vbjimSsJuBVvOtzS8JFxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sda5x5rDSDSGNEuAXmjQwTTlkmJk7dRnyMIUKTSfS9U=;
 b=kKXMrmfeFn4K0vmroMuH6UBhgr8/n5T4pRDWRZLWJwqsLwtbtXhhTcx8rXq/KCfMrWytbml6Uh9vekuKPeHDLPU5CBcnRYzOx8hVYEBY0fJYkJKnEI1m1L40pugtDGASmD6+swltshNfuQtoIVv9cPG41+rHBKQdH/vGiaAXcEAgV618VkvdzcGNkuo2w/mKJvlaVDAFUg2Zn/uR+aV7oYy9mbaOYVVuZk3Ov1MNLFuv6kD7LwVoM6bju+Zn454RvxC1r9WLTGQS7MZLFDzqbSToyRElbKGiTQOe35Ua40JcPx0kobLreuaYDg9i1Mw5aZXXKikQkoHYLsxWGZYRzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sda5x5rDSDSGNEuAXmjQwTTlkmJk7dRnyMIUKTSfS9U=;
 b=ha12l0ennviJ5TTys7in3AyRM/BHcypXe49Y9xJdfvOvVQt4qdlv7SLLkomdEFRRyY3CB3T5uHa6F+abY57yF0s+Jb6NQUWsGutAatcRmV2HPk/gHOqXQkNe/nid6JpjVHTKeHUYqvOef4/aOGSgrD5VXSj9WNOM+nDV0/6HwoI=
Received: from BLAPR03CA0140.namprd03.prod.outlook.com (2603:10b6:208:32e::25)
 by SJ2PR12MB7989.namprd12.prod.outlook.com (2603:10b6:a03:4c3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Wed, 16 Sep
 2026 22:59:11 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:208:32e:cafe::9f) by BLAPR03CA0140.outlook.office365.com
 (2603:10b6:208:32e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 22:59:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Wed, 16 Sep 2026 22:59:11 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 16 Sep
 2026 17:59:09 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 16 Sep 2026 17:59:08 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH v1 2/2] tests/amdgpu: Check lockdep violations in reset tests
Date: Wed, 16 Sep 2026 18:58:47 -0400
Message-ID: <ef424c4b22f73c03d154bb2d90719415d4c76ff0.1789597588.git.vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1789597588.git.vitaly.prosyak@amd.com>
References: <cover.1789597588.git.vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|SJ2PR12MB7989:EE_
X-MS-Office365-Filtering-Correlation-Id: 905303a8-4db1-4163-aefb-08df14461f0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|56012099006|10067099003|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: jo0oHJEJR4L6ETh6qHc6CrAHx8A/CuTFSwylZ9HDCRYLeRBlnJKpPZNWrAmpXSkQ0KhtLDCVgWFoDHcXqP37N7FFiB/WxwPAFUvpFKDpubo77vk3zPDg1QYcuhGpCVvjPTmm+omljkx/BMNSkgVqyjep3NQklUmWNuv6jixkx54jGqpz6BShfxCSpjjPT+ftF6C6zWXukpzZ9c2OUdvXuXlGlSZnPj+DJawab1gsUWZMH488FylACVp4T+u2Ia4jbcbFt3MRJdLuRwdEq0i+SYjz36wq0phpcWQOz6HUkWFVnnILUw1X6EPQQQB/1fSslRNLWPgauD+SWBk/TyN/nSzb0dc/MJqMHoVoQnpElFiE1Zx0z7R52i3kkcKtMbJTcutUU8d3ddToianvXdXxa1jnY+dCh3Fm6DEyheu9NZphH8SvEs7uFa7K7yRzrbHA8NoZV6lh+YXakiVCrLu6OYPYttFsOh6Nm4/QOcdqXLPB5Lrfs42B+2JcvAWydXrPqpRFZ6LWllvbpJFHEJtwB9hvtOJXq7OL48x2GUbqj/dE5EElT65SUt5eeJ2pTy0l/SgHgoJ8k8Gpcprr+7RMBGPoZn4pLhg5OF2E1xEtpDPXjbByA4HMg902FunsvYpn4zzZpVABz2UocjyEDuebWRdJ6v7Q8UlguCge5rkns8c9O6EBeVU+x8looxKeQWHCdp4sd+5IOOuQtuTBIAVQRg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(56012099006)(10067099003)(11063799006)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ptFn54whXeerTWd6fKAWknrj9lYE/qt2UT5vmjE3DWNW0lRIUucbIqCtb/8XmTgmyuoNhnrA9cuRZg1hHX/qSBOvJ/7LZYBEzPDS3nGCeaPU79DPN+SVGEVac1bF2XiS2OQieMEurdQ7efFtpH/PRxZ8c0KVJv9cYPT66MPReCaSF3yykO3/COhGckb+BNqoZVlrDeF91/W09wZEA1DY1Zp0gD4SsOwnO49Gv5dCj7IiHpJUaovnZ9Bv8eGQiUvyD3nvjbtw2clS/bM43GN96uYCsP8kLYA1r7VBr/EEX4xHU0SbZCq7wP6MosB0lozflMLYkzWw8rYNMJBaWQrJKcWCMrhBimO+KTzKKiBti72hKDJKZptIRwsu6vfKSWDruMUJcuohWPhA/sPdgXXJWyI/7tgx8ksPHAe9n8AENYJcRV735QPp84LUmPIWh4Z8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 22:59:11.0900 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 905303a8-4db1-4163-aefb-08df14461f0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7989
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Use the shared amdgpu lockdep helpers in amd_dispatch,
amd_deadlock, and amd_queue_reset.

These tests exercise queue reset and GPU reset paths,
including user queue coverage, so they are useful places
to validate that the kernel lock ordering annotations do
not produce lockdep splats while reset and recovery paths
are stressed.

Unlike amd_lockdep, these tests are not dedicated lockdep
tests and must continue to run on kernels built without
CONFIG_LOCKDEP. The new begin/end helper checks
/proc/lockdep_stats first; when lockdep is unavailable
the helper is a no-op, and when lockdep is available
each subtest fails if new lockdep traces or TAINT_WARN
are observed.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_deadlock.c    | 45 ++++++++++++++++++++++++++++++++++
 tests/amdgpu/amd_dispatch.c    | 25 +++++++++++++++++++
 tests/amdgpu/amd_queue_reset.c |  3 +++
 3 files changed, 73 insertions(+)

diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index b8356af74..1b8986cc0 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -43,6 +43,7 @@ int igt_main()
 	int r;
 	bool arr_cap[AMD_IP_MAX] = {0};
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
+	struct amd_lockdep_state lockdep;
 	struct pci_addr pci;
 
 #ifdef AMDGPU_USERQ_ENABLED
@@ -78,209 +79,253 @@ int igt_main()
 	}
 	igt_describe("Test-GPU-reset-by-flooding-sdma-ring-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma") {
+		amd_lockdep_begin(&lockdep);
 		if (arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("amdgpu-deadlock-sdma")
 			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_DMA, &pci, false);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test-GPU-reset-by-access-gfx-illegal-reg");
 	igt_subtest_with_dynamic("amdgpu-gfx-illegal-reg-access") {
+		amd_lockdep_begin(&lockdep);
 		if (arr_cap[AMD_IP_GFX] &&
 			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-illegal-reg-access")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
 					AMDGPU_HW_IP_GFX, &pci, false);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test-GPU-reset-by-access-gfx-illegal-mem-addr");
 	igt_subtest_with_dynamic("amdgpu-gfx-illegal-mem-access") {
+		amd_lockdep_begin(&lockdep);
 		if (arr_cap[AMD_IP_GFX] &&
 			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-illegal-mem-access")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
 					AMDGPU_HW_IP_GFX, &pci, false);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 
 	igt_describe("Test-GPU-reset-by-flooding-gfx-ring-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-gfx") {
+		amd_lockdep_begin(&lockdep);
 		if (arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("amdgpu-deadlock-gfx")
 			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_GFX, &pci, false);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test-GPU-reset-by-access-compute-illegal-mem-addr");
 	igt_subtest("amdgpu-compute-illegal-mem-access") {
+		amd_lockdep_begin(&lockdep);
 		if (arr_cap[AMD_IP_COMPUTE] &&
 			 is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 		bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
 				AMDGPU_HW_IP_COMPUTE, &pci, false);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test-GPU-reset-by-flooding-compute-ring-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-compute") {
+		amd_lockdep_begin(&lockdep);
 		if (arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f("amdgpu-deadlock-compute")
 			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_COMPUTE, &pci, false);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test-GPU-reset-by-sdma-corrupted-header-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-corrupted-header-test") {
+		amd_lockdep_begin(&lockdep);
 		if (arr_cap[AMD_IP_DMA] &&
 			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-corrupted-header-test")
 			amdgpu_hang_sdma_ring_helper(device, DMA_CORRUPTED_HEADER_HANG, &pci);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test-GPU-reset-by-sdma-slow-linear-copy-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-slow-linear-copy") {
+		amd_lockdep_begin(&lockdep);
 		if (arr_cap[AMD_IP_DMA] &&
 			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-slow-linear-copy")
 			amdgpu_hang_sdma_ring_helper(device, DMA_SLOW_LINEARCOPY_HANG, &pci);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test-GPU-reset-by-sdma-badop-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-badop-test") {
+		amd_lockdep_begin(&lockdep);
 		if (arr_cap[AMD_IP_DMA] &&
 			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-badop-test")
 			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_OPCODE,
 					AMDGPU_HW_IP_DMA, &pci, false);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test-GPU-reset-by-sdma-bad-mem-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-mem-test") {
+		amd_lockdep_begin(&lockdep);
 		if (arr_cap[AMD_IP_DMA] &&
 			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-mem-test")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
 					AMDGPU_HW_IP_DMA, &pci, false);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test-GPU-reset-by-sdma-bad-reg-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-reg-test") {
+		amd_lockdep_begin(&lockdep);
 		if (arr_cap[AMD_IP_DMA] &&
 			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-reg-test")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
 					AMDGPU_HW_IP_DMA, &pci, false);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test-GPU-reset-by-sdma-bad-length-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-length-test") {
+		amd_lockdep_begin(&lockdep);
 		if (arr_cap[AMD_IP_DMA] &&
 			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-length-test")
 			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
 					AMDGPU_HW_IP_DMA, &pci, false);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 #ifdef AMDGPU_USERQ_ENABLED
 	igt_describe("Test-GPU-reset-by-access-gfx-illegal-reg-umq");
 	igt_subtest_with_dynamic("amdgpu-gfx-illegal-reg-access-umq") {
+		amd_lockdep_begin(&lockdep);
 		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
 		    is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-illegal-reg-access-umq")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
 					       AMDGPU_HW_IP_GFX, &pci, true);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test-GPU-reset-by-sdma-badop-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-badop-test-umq") {
+		amd_lockdep_begin(&lockdep);
 		if (enable_test && userq_arr_cap[AMD_IP_DMA] &&
 			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-badop-test-umq")
 			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_OPCODE,
 					AMDGPU_HW_IP_DMA, &pci, true);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test-GPU-reset-by-sdma-bad-mem-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-mem-test-umq") {
+		amd_lockdep_begin(&lockdep);
 		if (enable_test && userq_arr_cap[AMD_IP_DMA] &&
 			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-mem-test-umq")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
 					AMDGPU_HW_IP_DMA, &pci, true);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test-GPU-reset-by-sdma-bad-reg-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-reg-test-umq") {
+		amd_lockdep_begin(&lockdep);
 		if (enable_test && userq_arr_cap[AMD_IP_DMA] &&
 			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-reg-test-umq")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
 					AMDGPU_HW_IP_DMA, &pci, true);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test-GPU-reset-by-sdma-bad-length-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-length-test-umq") {
+		amd_lockdep_begin(&lockdep);
 		if (enable_test && userq_arr_cap[AMD_IP_DMA] &&
 			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-length-test-umq")
 			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
 					AMDGPU_HW_IP_DMA, &pci, true);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test-GPU-reset-by-flooding-sdma-ring-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-umq") {
+		amd_lockdep_begin(&lockdep);
 		if (enable_test && userq_arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-umq")
 			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_DMA, &pci, true);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test-per-queue-reset-of-a-cleanly-hung-gfx-user-queue");
 	igt_subtest_with_dynamic("amdgpu-deadlock-gfx-umq") {
+		amd_lockdep_begin(&lockdep);
 		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
 			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-gfx-umq")
 			amdgpu_hang_ring_helper(device, AMDGPU_HW_IP_GFX, &pci, true);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test-per-queue-reset-recovery-of-a-gfx-user-queue-priv-fault");
 	igt_subtest_with_dynamic("amdgpu-gfx-priv-fault-umq") {
+		amd_lockdep_begin(&lockdep);
 		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
 			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-gfx-priv-fault-umq")
 			amdgpu_priv_fault_ring_helper(device, AMDGPU_HW_IP_GFX, &pci, true);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test-gfx-user-queue-bad-opcode-with-nonzero-count-recovers-via-gfx-pipe-reset");
 	igt_subtest_with_dynamic("amdgpu-gfx-priv-fault-badcount-umq") {
+		amd_lockdep_begin(&lockdep);
 		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
 			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-gfx-priv-fault-badcount-umq")
 			amdgpu_priv_fault_badcount_ring_helper(device, AMDGPU_HW_IP_GFX, &pci, true);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test-per-queue-reset-recovery-of-a-gfx-user-queue-privileged-instruction-fault");
 	igt_subtest_with_dynamic("amdgpu-gfx-priv-inst-umq") {
+		amd_lockdep_begin(&lockdep);
 		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
 			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-gfx-priv-inst-umq")
 			amdgpu_priv_inst_ring_helper(device, AMDGPU_HW_IP_GFX, &pci, true);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 #endif
 
diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
index 5267a742a..0590a960b 100644
--- a/tests/amdgpu/amd_dispatch.c
+++ b/tests/amdgpu/amd_dispatch.c
@@ -88,6 +88,7 @@ int igt_main()
 	struct pci_addr pci;
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
 	bool enable_test = false;
+	struct amd_lockdep_state lockdep;
 #ifdef AMDGPU_USERQ_ENABLED
 	enable_test = true;
 #endif
@@ -117,103 +118,127 @@ int igt_main()
 	}
 	igt_describe("Test GPU reset using a binary shader to slow hang the job on compute ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-test-compute-with-IP-COMPUTE") {
+		amd_lockdep_begin(&lockdep);
 		if (arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f("amdgpu-dispatch-test-compute")
 			amdgpu_dispatch_hang_slow_compute(device, &pci, false);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test GPU reset using a binary shader to slow hang the job on gfx ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-test-gfx-with-IP-GFX") {
+		amd_lockdep_begin(&lockdep);
 		if (arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("amdgpu-dispatch-test-gfx")
 			 amdgpu_dispatch_hang_slow_gfx(device, &pci, false);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test GPU reset using a binary shader to hang the job on gfx ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-gfx-with-IP-GFX") {
+		amd_lockdep_begin(&lockdep);
 		if (arr_cap[AMD_IP_GFX] &&
 			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-dispatch-hang-test-gfx")
 			amdgpu_dispatch_hang_gfx(device, BACKEND_SE_GC_SHADER_INVALID_SHADER, &pci, false);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test GPU reset using a binary shader to hang the job on compute ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-compute-with-IP-COMPUTE") {
+		amd_lockdep_begin(&lockdep);
 		if (arr_cap[AMD_IP_COMPUTE] &&
 			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-dispatch-hang-test-compute")
 			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_SHADER, &pci, false);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test GPU reset using a invalid shader program address to hang the job on compute ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-program-addr-test-compute-with-IP-COMPUTE") {
+		amd_lockdep_begin(&lockdep);
 		if (arr_cap[AMD_IP_COMPUTE] &&
 			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-dispatch-invalid-program-addr-test-compute")
 			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, &pci, false);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test GPU reset using a invalid shader program setting to hang the job on compute ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-setting-test-compute-with-IP-COMPUTE") {
+		amd_lockdep_begin(&lockdep);
 		if (arr_cap[AMD_IP_COMPUTE] &&
 			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-dispatch-invalid-setting-test-compute")
 			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING, &pci, false);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test GPU reset using a invalid shader user data to hang the job on compute ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-user-data-test-compute-with-IP-COMPUTE") {
+		amd_lockdep_begin(&lockdep);
 		if (arr_cap[AMD_IP_COMPUTE] &&
 			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-dispatch-invalid-user-data-test-compute")
 			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_USER_DATA, &pci, false);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test GPU reset using amdgpu debugfs to hang the job on gfx ring");
 	igt_subtest_with_dynamic("amdgpu-reset-test-gfx-with-IP-GFX-and-COMPUTE") {
+		amd_lockdep_begin(&lockdep);
 		if (arr_cap[AMD_IP_GFX] && arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f("amdgpu-reset-gfx-compute")
 			amdgpu_gpu_reset_test(device, fd, &pci);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test GPU reset using a binary shader to hang the job on compute ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-compute-with-IP-COMPUTE-UQM") {
+		amd_lockdep_begin(&lockdep);
 		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f("amdgpu-dispatch-hang-test-compute-umq")
 			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_SHADER, &pci, true);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test GPU reset using a invalid shader program address to hang the job on compute ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-program-addr-test-compute-with-IP-COMPUTE-UQM") {
+		amd_lockdep_begin(&lockdep);
 		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f("amdgpu-dispatch-invalid-program-addr-test-compute-uqm")
 			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, &pci, true);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test GPU reset using a invalid shader program setting to hang the job on compute ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-setting-test-compute-with-IP-COMPUTE-UQM") {
+		amd_lockdep_begin(&lockdep);
 		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f("amdgpu-dispatch-invalid-setting-test-compute-uqm")
 			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING, &pci, true);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_describe("Test GPU reset using a invalid shader user data to hang the job on compute ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-user-data-test-compute-with-IP-COMPUTE-UQM") {
+		amd_lockdep_begin(&lockdep);
 		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f("amdgpu-dispatch-invalid-user-data-test-compute-uqm")
 			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_USER_DATA, &pci, true);
 		}
+		amd_lockdep_end(&lockdep);
 	}
 
 	igt_fixture() {
diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index ebd7c8682..7f445eb8d 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -1170,6 +1170,7 @@ int igt_main()
 	int r;
 	char shm_name[256] = {0};
 	bool arr_cap[AMD_IP_MAX] = {0};
+	struct amd_lockdep_state lockdep;
 	uint32_t reset;
 	unsigned int ring_id_good;
 	unsigned int ring_id_bad;
@@ -1293,6 +1294,7 @@ int igt_main()
 			igt_describe("Stressful-and-multiple-cs-of-bad-and-good-length-operations-using-multiple-processes");
 			igt_subtest_with_dynamic_f("amdgpu-%s-%s", ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":
 					ip_tests[i] == AMD_IP_GFX ? "GFX" : "SDMA", it->name) {
+				amd_lockdep_begin(&lockdep);
 				reset = AMDGPU_RESET_TYPE_PER_QUEUE;
 				if (arr_cap[ip_tests[i]] && is_sub_test_queue_reset_enable(&gpu_info, it) &&
 				    is_reset_enable(ip_tests[i], reset, &pci) &&
@@ -1305,6 +1307,7 @@ int igt_main()
 				} else {
 					set_next_test_to_skip(sh_mem);
 				}
+				amd_lockdep_end(&lockdep);
 			}
 		}
 	}
-- 
2.55.0

