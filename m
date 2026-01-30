Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8985BD49C7D
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 08:47:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3903810E98C;
	Fri, 30 Jan 2026 08:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kv0oZ301";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011064.outbound.protection.outlook.com [52.101.52.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1812410E992
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 08:47:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ATzXfoaUnMmZnXzXr0dXdiGup6wYYRkf0kuwaPI2UjW9ko9z2A44GYYZeGXIxEcDIS17/jQoHA2kx5fgqa3eqmJwdbqHiGLzH1rbockVs6rJrLrfSWi2uBYcwJsy0NPWFHqRxxI41K6oyeR/tkGFMA1SMwzbh4GEMnLGPTSquEjBuB4GbgL+w8AM2vQeLtbqyrOFBss164w17mQOfpSC8rJQLOAGR32PiydIpzM3lzd8MIRnCEnJAaz2Lre2OGOJ16BZpKHQBZM2yNKTsfsZFod7dU6eUh4Ck92XTul/EsodTZLnG0V4o3uGcywCEgI6l05/x9kuzGRYfxf1pd9KRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fQMXZmVMIBzLhWA9dUZuEMOXn9DEF2OluOm80SrwTA=;
 b=K2g0WhxyZflQE6eE32wjvlg3NkQpKZG9rb9gC2Dh9yK0f+XBfRXIdwVEEjfcH00B7W7TnPMAvYscEcOohnU6FzyEW2V1fDauwjF5CnS12Ug1J0Pto0kEj57haBvEQxgtSWfPcwFMYfprDGl1x02JPet3qcRVq3FkS/OpFO5qX5dTugOQ37jV/jDy+rKpQJfHinDMjDFalWZwOZWasOG8RbyT59EuSBnPmKkqcbB9CpEh5jSpb0nhEJDwuziH8s0rhSurUnXPTlUfzWirxx+KvugR9FKoaM0S/HUtC77+ocQGszH297S1oqCB94XI5MpVgKO5gTcmUiaos6RKNCmsWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fQMXZmVMIBzLhWA9dUZuEMOXn9DEF2OluOm80SrwTA=;
 b=kv0oZ301yV0QZBC+I4bWEVHKLgkDhVGJV97+ZvsFpA4dHMaQfXm/8J38XIIxvEo8dEE3wInTBGt348Aq0Eff61CnyRkxTJRiLcGHdV2WDQtjovWAkrQeOBGRI0C14LD3KNwqYWj4uddB7XKkcygfPwC6PneNH72UpvywD27RRo4=
Received: from BN9P222CA0026.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::31)
 by DS5PPFF2923D4C1.namprd12.prod.outlook.com (2603:10b6:f:fc00::669)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 08:47:07 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:10c:cafe::78) by BN9P222CA0026.outlook.office365.com
 (2603:10b6:408:10c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.10 via Frontend Transport; Fri,
 30 Jan 2026 08:46:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 08:47:06 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 30 Jan
 2026 02:47:02 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 Jan
 2026 02:47:01 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Fri, 30 Jan 2026 02:46:55 -0600
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t] lib/amdgpu: Refactor sched_mask read logic and add XCP
 partition mode support
Date: Fri, 30 Jan 2026 16:46:28 +0800
Message-ID: <20260130084654.4031554-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|DS5PPFF2923D4C1:EE_
X-MS-Office365-Filtering-Correlation-Id: babe36c8-887e-428c-08c4-08de5fdc25c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cx9TXsZyD6z4ldPUZtk9JOBjMjzhTQ71OPYaxO/5PTkbrCEH5onhqD5ryJcN?=
 =?us-ascii?Q?3LCK5A0oDjcjrNBItvr27A0NSHl5cXjP09kBRwfRFTi98bwESmZbrBh0kAa1?=
 =?us-ascii?Q?gaM0tHjjSxRcv9JQfiNNb8J8Tmn8fcYB8JTcqRq+MitXgf6Az+V6SyjCEFbH?=
 =?us-ascii?Q?B7v4eeWK4gpV4W0IunwYvngoLKyNMq7APciV4TSjplC5Wd89CPS6KCCmjuz9?=
 =?us-ascii?Q?wNdMe2tlFGeIQvDebudyU6GU/H+7Ln/OuB2vItMOfO1OUFdgryPn6bMZJrvN?=
 =?us-ascii?Q?fIHFRuEsKeRnR03NmHNOtwOZ8HJwWbnpFZ5fGL4LV7/XWzhZsQqjzHNWO/ag?=
 =?us-ascii?Q?IlGbvtgAoqjLmBH0rtpxhVZw5AAFme6m+H0z5MamUWb2dUDbYYzecv/ek3fx?=
 =?us-ascii?Q?f4L+/onAdtMEYExZGk+IY5LZFwCzg52qikmlbixeOf+dIVsw0JtxYu8fM0De?=
 =?us-ascii?Q?q0C1OZ2nBgtw2v+43nVS85DIJ47+FcXgrmbAao2qu/n1RzrCvcdJIpaCO+lz?=
 =?us-ascii?Q?FalbsRsQwCfv7EdkYy+hnQ/a/IzCeO/6NF7X+kof62MzOQb7o1YFzBwou+BX?=
 =?us-ascii?Q?eFDaI/uQOt10rCEs2r3ug/sArnFsb71vKRigXhWeRdQx5/l5g2iZxNZ68sI2?=
 =?us-ascii?Q?dakaGoRXVsOy1H6MaIa4kM8TymL3scJq1QlCyovc38i1KJTo9mjoFWtcDCi3?=
 =?us-ascii?Q?BAEOcQudJHY6UgpafDKnvi3W3smPi7lXkGfs5c5mtyuKMPG/7ZxSHTsPCEtY?=
 =?us-ascii?Q?/w3UBDmsCtwb60xhWazXP+pqTX5QDAGN3FeKSLQjVXbEu17Mj0ISdm8lzZxp?=
 =?us-ascii?Q?wANrtHLMeyNraojSEkAWCzT1CSYoTro2D6TExpauZxCG3NcR/j4ZejR7OBpb?=
 =?us-ascii?Q?qhsG0Pzpb1UTzci29rHI2Nrl0xIloEwWdx+nwzhZUUiAX+kawzMCsMK8zpVC?=
 =?us-ascii?Q?HTQWn0hfEd1qa/OQ7JtO92OvubBLENR8R7ZiEmVZUii6gmsEI1I2DfyCWDXm?=
 =?us-ascii?Q?l2YopMqG9wIIhLPcUHuK04YaTVvWlD3Z5HQOJaKJ4SfVi7K2JK4rqP1KWrDT?=
 =?us-ascii?Q?bsksAu42lW30uqfE73J1PfR6JKPlJtO8Gr3k/rid8TAQ7BaTfyN7OpoCqZcw?=
 =?us-ascii?Q?0/ZUNXbbyqOLJ/9WGcPF7nekGgfzI4qfaHffEIrRZtmu6N5pLk/6JFSJB9AO?=
 =?us-ascii?Q?fHrFm2K57IkmkWDQrkN+xjtc+IOgVLrZURm6F1rU9Pxnl4p7DwVwP5RnJw0O?=
 =?us-ascii?Q?ehfpoTIDczLsLC5JBp2wk0rpLQvTSTgZlF/AoBwTI+gJ+w5iOcxFS7bx5bSt?=
 =?us-ascii?Q?5l2WyhS7x+GlC+ZvVU3VYri+7VnKtowQMPkZ94jXC92khWbjDiH1PDQC7d0W?=
 =?us-ascii?Q?6+S7LPMw6wJK7nlbxbGqfY3gs3BpQvMHvpmALbDWwNY05MQu6cGeJBUsieo2?=
 =?us-ascii?Q?yMwEYC8yIgK0uNqTAeH632/OQDZQqY4Hwpdi6LJRkwnxVSynjMiOjcnD3ZL4?=
 =?us-ascii?Q?AWwR+PRlRoYNmp0+GXw+SFHXE3ZWVavf0XdJN7cvTvq7A3ehohO6L/I99ajY?=
 =?us-ascii?Q?JgB9h/J+GnSdhyH7AqFeIUVrrmRuIVcRur4IBJX7No7luuOMyss4EMaBVZjz?=
 =?us-ascii?Q?xVLJochc5jKKZOynH+PlHKF7qxQyTYBXlxUAUjWhpuSb2xz7kNyc7BZm7O8t?=
 =?us-ascii?Q?ripMkw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: e3gtbYkZclkgU7qRZTVnNuyE+dPCTwHGWC4QUvudxKaV+uOJf8E/furRxOKKSw6Ups5Rn7nH/p7NaqSIpt7nN4sZ7cEufHJkqVygg6GeA2q5ZLmnzlvSM38OEOzwBoDwRTvBEpLv9lpjQxA+Lr5C0JXZsgDqaxdcDIbtja4uJLPfgpkJtKflLRK9yAnpcBoeFMgaAOjT18uk900un0w7r/z2MRNGZ+zylcMxQtu1dayU4Qa/Un9GFKzwdZ5TQJV+bA+luAgxmGHFYhDAoWiU4dCbGxMbcz0WTdiAODur+RAd2qw78sdFSZaQkIKCeb36vBrMcvkq+dOoy+lRDPDfl5foB0wFtHXc5oijfJXrTkOiwKo+7FndaITvWB8H9qGujMgDPG3iFukbYjF9vk5Pl8kqa75dOVVhjza67UJUsL+ZqR0Z/LA+BUMf+fijO92F
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:47:06.3743 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: babe36c8-887e-428c-08c4-08de5fdc25c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFF2923D4C1
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

The refactoring maintains all existing functionality while creating a
centralized, more robust implementation for reading scheduler masks
across different IP blocks and GPU configurations.
Adapt IGT test logic to XCP non-SPX (CPX/DPX/TPX/QPX) partition modes, force sched_mask=1 for partitioned modes

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c       | 54 ++--------------
 lib/amdgpu/amd_ip_blocks.c              | 85 +++++++++++++++++++++++++
 lib/amdgpu/amd_ip_blocks.h              |  5 ++
 lib/amdgpu/amd_mmd_shared.c             | 42 ++----------
 lib/amdgpu/compute_utils/amd_dispatch.c | 60 +++--------------
 5 files changed, 110 insertions(+), 136 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 01c0f9928..cb37a3564 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -206,13 +206,11 @@ amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type, uin
 void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type, struct pci_addr *pci, bool userq)
 {
 	int r;
-	FILE *fp;
 	char cmd[1024];
-	char buffer[128];
 	uint64_t sched_mask = 0, ring_id;
 	struct drm_amdgpu_info_hw_ip info;
 	uint32_t  prio;
-	char sysfs[125];
+	char sysfs[256];
 	bool support_page;
 
 	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
@@ -234,27 +232,8 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
 
 	support_page = is_support_page_queue(ip_type, pci);
 
-	if (ip_type == AMD_IP_GFX)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask",
-			pci->domain, pci->bus, pci->device, pci->function);
-	else if (ip_type == AMD_IP_COMPUTE)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_compute_sched_mask",
-			pci->domain, pci->bus, pci->device, pci->function);
-	else if (ip_type == AMD_IP_DMA)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask",
-			pci->domain, pci->bus, pci->device, pci->function);
-
-	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
-	r = access(sysfs, R_OK);
-	if (!r) {
-		fp = popen(cmd, "r");
-		if (fp == NULL)
-			igt_skip("read the sysfs failed: %s\n", sysfs);
-
-		if (fgets(buffer, 128, fp) != NULL)
-			sched_mask = strtol(buffer, NULL, 16);
-
-		pclose(fp);
+	if (is_spx_mode(pci)) {
+		sched_mask = amdgpu_get_ip_schedule_mask(pci, (enum amd_ip_block_type)ip_type, sysfs);
 	} else {
 		sched_mask = 1;
 		igt_info("The scheduling ring only enables one for ip %d\n", ip_type);
@@ -483,13 +462,11 @@ amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
 void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type, struct pci_addr *pci, bool user_queue)
 {
 	int r;
-	FILE *fp;
 	char cmd[1024];
-	char buffer[128];
 	uint64_t sched_mask = 0, ring_id;
 	struct drm_amdgpu_info_hw_ip info;
 	uint32_t prio;
-	char sysfs[125];
+	char sysfs[256];
 	bool support_page;
 	uint32_t available_rings = 0;
 	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
@@ -510,27 +487,8 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
 		return;
 	}
 	support_page = is_support_page_queue(ip_type, pci);
-	if (ip_type == AMD_IP_GFX)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask",
-			pci->domain, pci->bus, pci->device, pci->function);
-	else if (ip_type == AMD_IP_COMPUTE)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_compute_sched_mask",
-			pci->domain, pci->bus, pci->device, pci->function);
-	else if (ip_type == AMD_IP_DMA)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask",
-			pci->domain, pci->bus, pci->device, pci->function);
-
-	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
-	r = access(sysfs, R_OK);
-	if (!r) {
-		fp = popen(cmd, "r");
-		if (fp == NULL)
-			igt_skip("read the sysfs failed: %s\n", sysfs);
-
-		if (fgets(buffer, 128, fp) != NULL)
-			sched_mask = strtol(buffer, NULL, 16);
-
-		pclose(fp);
+	if (is_spx_mode(pci)) {
+		sched_mask = amdgpu_get_ip_schedule_mask(pci, (enum amd_ip_block_type)ip_type, sysfs);
 	} else {
 		sched_mask = 1;
 		igt_info("The scheduling ring only enables one for ip %d\n", ip_type);
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index eb0b71728..9822662e3 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -1873,3 +1873,88 @@ const char *cmd_get_ip_name(enum amd_ip_block_type ip_type)
 		return "Unknown";
 	}
 }
+
+bool is_spx_mode(const struct pci_addr *pci)
+{
+	char path[256];
+	char buffer[16] = {0};
+	FILE *fp;
+
+	snprintf(path, sizeof(path), "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/current_compute_partition",
+		 pci->domain, pci->bus, pci->device, pci->function);
+
+	/* If file doesn't exist, assume SPX or non-partitioned capable */
+	if (access(path, R_OK) != 0)
+		return true;
+
+	fp = fopen(path, "r");
+	if (!fp)
+		return true;
+
+	if (fgets(buffer, sizeof(buffer), fp)) {
+		if (strstr(buffer, "SPX")) {
+			fclose(fp);
+			return true;
+		}
+	}
+	fclose(fp);
+	return false;
+}
+
+long amdgpu_get_ip_schedule_mask(const struct pci_addr *pci, enum amd_ip_block_type ip_type, char *sysfs_path)
+{
+	char sysfs_local[256];
+	char *sysfs = sysfs_path ? sysfs_path : sysfs_local;
+	char cmd[512];
+	char buffer[128];
+	FILE *fp;
+	long sched_mask = 0;
+	int dri_id;
+	const char *mask_name = NULL;
+
+	switch (ip_type) {
+	case AMD_IP_GFX:
+		mask_name = "amdgpu_gfx_sched_mask";
+		break;
+	case AMD_IP_COMPUTE:
+		mask_name = "amdgpu_compute_sched_mask";
+		break;
+	case AMD_IP_DMA:
+		mask_name = "amdgpu_sdma_sched_mask";
+		break;
+	case AMD_IP_VCN_UNIFIED:
+		mask_name = "amdgpu_vcn_sched_mask";
+		break;
+	case AMD_IP_VCN_JPEG:
+		mask_name = "amdgpu_jpeg_sched_mask";
+		break;
+	default:
+		return 0;
+	}
+
+	snprintf(sysfs, 256, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/%s",
+		 pci->domain, pci->bus, pci->device, pci->function, mask_name);
+
+	if (access(sysfs, F_OK) != 0) {
+		dri_id = find_dri_id_by_pci(pci);
+		if (dri_id < 0)
+			dri_id = 0;
+
+		snprintf(sysfs, 256, "/sys/kernel/debug/dri/%d/%s", dri_id, mask_name);
+	}
+
+	if (access(sysfs, R_OK) != 0)
+		return 1;
+
+	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
+
+	fp = popen(cmd, "r");
+	if (fp) {
+		if (fgets(buffer, sizeof(buffer), fp))
+			sched_mask = strtol(buffer, NULL, 16);
+		pclose(fp);
+	}
+
+	return sched_mask;
+}
+
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 8fd9fde9a..424b3210a 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -442,6 +442,11 @@ is_support_page_queue(enum amd_ip_block_type ip_type, const struct pci_addr *pci
 int
 find_dri_id_by_pci(const struct pci_addr *pci);
 
+long
+amdgpu_get_ip_schedule_mask(const struct pci_addr *pci, enum amd_ip_block_type ip_type, char *sysfs_path);
+
+bool is_spx_mode(const struct pci_addr *pci);
+
 int
 get_dri_index_from_device(amdgpu_device_handle device, int fd);
 /**
diff --git a/lib/amdgpu/amd_mmd_shared.c b/lib/amdgpu/amd_mmd_shared.c
index f504db596..261ca7205 100644
--- a/lib/amdgpu/amd_mmd_shared.c
+++ b/lib/amdgpu/amd_mmd_shared.c
@@ -196,54 +196,20 @@ mm_queue_test_helper(amdgpu_device_handle device_handle, struct mmd_shared_conte
 		mm_test_callback callback, int err_type, const struct pci_addr *pci)
 {
 	int r;
-	FILE *fp;
 	char cmd[1024];
-	char buffer[128];
 	long sched_mask = 0;
 	long mask = 0;
 	uint32_t ring_id;
-	char sysfs[125];
-	char dri_dir[128];
-	int dri_id = 0;
+	char sysfs[256];
 
 	if (!callback)
 		return -1;
 
-	snprintf(dri_dir, sizeof(dri_dir) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x",
-		pci->domain, pci->bus, pci->device, pci->function);
-
-	if (access(dri_dir, F_OK) == 0) {
-		// test is only supported on VCN version >= 4
-		if (context->ip_type == AMD_IP_VCN_UNIFIED)
-			snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_vcn_sched_mask",
-					pci->domain, pci->bus, pci->device, pci->function);
-		else if (context->ip_type == AMD_IP_VCN_JPEG)
-			snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_jpeg_sched_mask",
-					pci->domain, pci->bus, pci->device, pci->function);
+	if (is_spx_mode(pci)) {
+		sched_mask = amdgpu_get_ip_schedule_mask(pci, (enum amd_ip_block_type)context->ip_type, sysfs);
 	} else {
-		dri_id = find_dri_id_by_pci(pci);
-		if (dri_id < 0)
-			dri_id = 0;
-
-		if (context->ip_type == AMD_IP_VCN_UNIFIED)
-			snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%d/amdgpu_vcn_sched_mask", dri_id);
-		else if (context->ip_type == AMD_IP_VCN_JPEG)
-			snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%d/amdgpu_jpeg_sched_mask", dri_id);
+		sched_mask = 1; 
 	}
-	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
-	r = access(sysfs, R_OK);
-	if (!r) {
-		fp = popen(cmd, "r");
-		if (fp == NULL) {
-			igt_skip("read the sysfs failed: %s\n", sysfs);
-			return -1;
-		}
-
-		if (fgets(buffer, 128, fp) != NULL)
-			sched_mask = strtol(buffer, NULL, 16);
-		pclose(fp);
-	} else
-		sched_mask = 1;
 
 	mask = sched_mask;
 	for (ring_id = 0;  mask > 0; ring_id++) {
diff --git a/lib/amdgpu/compute_utils/amd_dispatch.c b/lib/amdgpu/compute_utils/amd_dispatch.c
index ded62bbd1..23c15ef1b 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch.c
+++ b/lib/amdgpu/compute_utils/amd_dispatch.c
@@ -664,13 +664,11 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 				 uint32_t ip_type, const struct pci_addr *pci, bool userq)
 {
 	int r;
-	FILE *fp;
 	char cmd[1024];
-	char buffer[128];
 	long sched_mask = 0;
 	struct drm_amdgpu_info_hw_ip info;
 	uint32_t ring_id, version, prio;
-	char sysfs[125];
+	char sysfs[256];
 
 	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
 	igt_assert_eq(r, 0);
@@ -683,29 +681,11 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 		return;
 	}
 
-	if (ip_type == AMD_IP_GFX)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask",
-				pci->domain, pci->bus, pci->device, pci->function);
-	else if (ip_type == AMD_IP_COMPUTE)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_compute_sched_mask",
-				pci->domain, pci->bus, pci->device, pci->function);
-	else if (ip_type == AMD_IP_DMA)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask",
-				pci->domain, pci->bus, pci->device, pci->function);
-
-	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
-	r = access(sysfs, R_OK);
-	if (!r) {
-		fp = popen(cmd, "r");
-		if (fp == NULL)
-			igt_skip("read the sysfs failed: %s \n",sysfs);
-
-		if (fgets(buffer, 128, fp) != NULL)
-			sched_mask = strtol(buffer, NULL, 16);
-
-		pclose(fp);
-	} else
+	if (is_spx_mode(pci)) {
+		sched_mask = amdgpu_get_ip_schedule_mask(pci, (enum amd_ip_block_type)ip_type, sysfs);
+	} else {
 		sched_mask = 1;
+	}
 
 	for (ring_id = 0; (0x1 << ring_id) <= sched_mask; ring_id++) {
 		/* check sched is ready is on the ring. */
@@ -760,13 +740,11 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_ty
 		enum cmd_error_type hang, const struct pci_addr *pci,  bool userq)
 {
 	int r;
-	FILE *fp;
 	char cmd[1024];
-	char buffer[128];
 	long sched_mask = 0;
 	struct drm_amdgpu_info_hw_ip info;
 	uint32_t ring_id, version, prio;
-	char sysfs[125];
+	char sysfs[256];
 
 	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
 	igt_assert_eq(r, 0);
@@ -784,29 +762,11 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_ty
 	if (userq) {
 		sched_mask = 1;
 	} else {
-		if (ip_type == AMD_IP_GFX)
-			snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask",
-					pci->domain, pci->bus, pci->device, pci->function);
-		else if (ip_type == AMD_IP_COMPUTE)
-			snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_compute_sched_mask",
-					pci->domain, pci->bus, pci->device, pci->function);
-		else if (ip_type == AMD_IP_DMA)
-			snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask",
-					pci->domain, pci->bus, pci->device, pci->function);
-
-		snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
-		r = access(sysfs, R_OK);
-		if (!r) {
-			fp = popen(cmd, "r");
-			if (fp == NULL)
-				igt_skip("read the sysfs failed: %s \n",sysfs);
-
-			if (fgets(buffer, 128, fp) != NULL)
-				sched_mask = strtol(buffer, NULL, 16);
-
-			pclose(fp);
-		} else
+		if (is_spx_mode(pci)) {
+			sched_mask = amdgpu_get_ip_schedule_mask(pci, (enum amd_ip_block_type)ip_type, sysfs);
+		} else {
 			sched_mask = 1;
+		}
 	}
 
 	for (ring_id = 0; (0x1 << ring_id) <= sched_mask; ring_id++) {
-- 
2.49.0

