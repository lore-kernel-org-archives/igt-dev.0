Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C72AC02182
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 04:41:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2037E10E4B5;
	Tue, 21 Jan 2025 04:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LwpX/PLM";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16A610E4B5
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 04:41:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fjH+3pqv6sVwuxM3gnras4ZhRO0kkPxVJkDnfWFqZHWv/rE7Q5CXClR9USZCIF/4rT2lThTcfJzefVPFaDRlnXBwSQN2hEgdNWgkjanu6A8aI7g1J2NSELzBduzUbumiQRe3h9njEXAaco8/D1HKWehjMh8GqbPs0qoP7swkqctqb8k+gJ2GQ+T7d0AAGMDD5KTT/SRN5RmqenfLOAhsQzmcfNbG5HfsR7ikrxJ2Z8XS+qwC9y1eTImY8N48qlXOKUSZTtI60Nd1uZjw+x3yXejptpgrgbO/dnT9xcNbWqROnqEGvJxKavdnVvZo1xf0X8sCJm5sXL1ytbRosVrY1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0Tew0UBrXbh09mDxmEMkn4JFHCpflRzfJkJIbHOx3U=;
 b=L01tMKNvCRajtKxrV4VmdDL5fCvg3fBWm5mij3yRsuaWkgqgAZTINiT4YDKQ1FUxU6PmakBmJsHvk7huql7fREyf/6fginzxJ03Qb82IvvEU26phqONmZ1PsvzL1sCzkbmGq0Fsf20X1P94ucyUzcVOQ+GgEyIyQrXUQWHCcC19LNgsYJcTgLb+1phOQ+XTso7fyILzfsHO/yYLHjcE0EU6l85bPSPZZmnNuq0pGkY0M9vvaJiqn7BsyNih6b+JV/DpuvRM6YmhB+/rpJmf3j0HuWt4HdyEcGBN38WDjV1D9qhbPTYh1GMw668tjTstVoUw6W4h0eQqillgC00u8Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0Tew0UBrXbh09mDxmEMkn4JFHCpflRzfJkJIbHOx3U=;
 b=LwpX/PLMzeKZHvPEImLoDGguOd/OoQkzYyEJNf0zl4SsHvTPpBPVDDW37gntekcxSJmUz0g5ONUYGYb9VRcAb/tQY53vTCBxIXvJRw148cOzwnuIECHEMIM93LFR2948l4rC4uPwwTzeVoNV0F9bTjaFX/TMDPdfkDccAEsJ9+A=
Received: from MN2PR18CA0024.namprd18.prod.outlook.com (2603:10b6:208:23c::29)
 by CYXPR12MB9444.namprd12.prod.outlook.com (2603:10b6:930:d6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 04:41:31 +0000
Received: from BL6PEPF00020E63.namprd04.prod.outlook.com
 (2603:10b6:208:23c:cafe::b8) by MN2PR18CA0024.outlook.office365.com
 (2603:10b6:208:23c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Tue,
 21 Jan 2025 04:41:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E63.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Tue, 21 Jan 2025 04:41:30 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 20 Jan
 2025 22:41:28 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 20 Jan
 2025 22:40:33 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 20 Jan 2025 22:40:33 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Christian Koenig
 <christian.koenig@amd.com>, Alexander Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] tests/amdgpu: find PCI bus, device and function and use it
Date: Mon, 20 Jan 2025 23:40:25 -0500
Message-ID: <20250121044025.167761-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E63:EE_|CYXPR12MB9444:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a64f789-8b4e-479e-8dcf-08dd39d5e014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wAFzV8BUHA1eQTsvjzi+fsnQC0LdU95Slu4DYO/xD+N2iMA7+h3ltMxFFbkU?=
 =?us-ascii?Q?hNYks++8MTtk7NamIUXQ3+/V+t7u+TAJQjpAfh2EbudTdOQPLBybCiX7q9Vw?=
 =?us-ascii?Q?/Upia056y+zn2ZealQ3s9gs/CCJNTFexojKyyBf49boIkLU/+I82E03Z15Os?=
 =?us-ascii?Q?41E01ZRetyGv0suurPK7VhqPN5nE3hQmtsSaj3h0ly2Bc2sLGie1tYAWAG5d?=
 =?us-ascii?Q?Ja6Cej+q3cKV6adIMPPnz2WcEvBFa71TIx6mLalhjvOkI+U2/kb5USkFhal1?=
 =?us-ascii?Q?3CUQuSXNR1Dlr4jtfZ+Ssh7RR3Dd9x48UHQ3Fobb662f4BzOmPiye5A+aCsJ?=
 =?us-ascii?Q?ZUi4Cas77kx/NTl1qdT7A9SzZzrZWGApSHcuTaWLCrc1l2aC5saOoqLckGly?=
 =?us-ascii?Q?0O+vra9F5MX5P4+0b1DYVsmxOQjvoSDZ+unoOeLaQswNwF/+kA5pbpsYV6Aw?=
 =?us-ascii?Q?t4L/jrJrm6Z+keeHkVLE1eJ+VhiorvaWAP/0utTlFxv1+i0qVm+M9kQqVcPY?=
 =?us-ascii?Q?a/rR8LQJePV4DkF2LYefBT4AM6lrfAWgRzgNQYRPczRjnncZU28XpjdA+qnw?=
 =?us-ascii?Q?YdhWRXy3mXz1fCH27gEmjStyayOUy8AS6EceNSpwUmnyOSx+l8Gt8TM3JJbO?=
 =?us-ascii?Q?FjbJ3Yu1PUOtVAp4wl9eDrpXILWeEgcb3B97g8hbWgK7a91RNJo+pl8Gin47?=
 =?us-ascii?Q?peTYL8/Q8uzuMxmscQqaZHmahIus2E4C1CPPSLSVDoRs7vOU93mu/iAkqgjn?=
 =?us-ascii?Q?r7242mSP3nmzijQqLirqkhXkF+UK78ET5WE9MXfQSN7DxsRnnPDwylxn4Xfr?=
 =?us-ascii?Q?0vb5LJzuuH2dz4c3UhqgRCWaMySXWp/OZRD5oOSBVKsf8mRqUCpJMjJ4zwrP?=
 =?us-ascii?Q?tG28S7yVOnYyrzBhWQqriAaBdr36fAWphLRGYUfor2sPWTwNhxa2sHvXnckR?=
 =?us-ascii?Q?NNLpItRcXl4PX/E1j/iwBthv/B7I97YmE/z9mBik65aEec6175BVfvDVVK7m?=
 =?us-ascii?Q?k22NnvXGYQ4/bGpI1Pqz47pChBtlYgsT3ctLjH0tEFn1MOF1agIYANkv4/Iw?=
 =?us-ascii?Q?62VF0+3ZlikMse2VpC1TsiuqLGqLdIIp5sy05/YSgMe3+t9xwlwj5SFFXL4i?=
 =?us-ascii?Q?9GW5Ta/oAdqqoDFg1eV8L+hmEuBdh/J7sbfFDdXwymgWlNJ1xdMvo263+lvv?=
 =?us-ascii?Q?sbKryNpSOUII//owe3cgY9mjWBSuR1qDo1mj4bPoMD1Gltah0xGhPvZkNITi?=
 =?us-ascii?Q?chRXtMp629rEMuglyabidddKpyH3VpKjcgpOaKyHrKpqW5IOQNbzWV72ZZa6?=
 =?us-ascii?Q?oUMd0IN7GMHQbLfMtPyQffFvNMBCiKHM5jRdhS8/ANKYgu68HxeBHEYGQUfu?=
 =?us-ascii?Q?8tHoXt6rupVMLxHru58kI35+SRS4cWWFfo5ZcsI2T5IP5GM1lMqgPXDzUPWk?=
 =?us-ascii?Q?MAEVRuMl17Km6g8spNec38+6L51mgPpCGgF08LHWMD4pMCJhrKHfCHc/f10Z?=
 =?us-ascii?Q?jufKGl9L0nNVBRc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 04:41:30.5957 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a64f789-8b4e-479e-8dcf-08dd39d5e014
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9444
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

Use the PCI domain, bus, device, and function ID to determine the
required path from the file descriptor. This is utilized to check
whether the GPU reset mask is enabled for GFX, compute, or SDMA rings.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c     |  9 +++++++--
 lib/amdgpu/amd_ip_blocks.h     |  2 +-
 tests/amdgpu/amd_deadlock.c    | 18 +++++++++---------
 tests/amdgpu/amd_dispatch.c    | 15 +++++++++------
 tests/amdgpu/amd_pci_unplug.c  |  1 -
 tests/amdgpu/amd_queue_reset.c |  6 +++++-
 6 files changed, 31 insertions(+), 20 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 9749e2072..2b1b84414 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -1004,7 +1004,7 @@ asic_rings_readness(amdgpu_device_handle device_handle, uint32_t mask,
  */
 
 bool
-is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type)
+is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type, const struct pci_addr *pci)
 {
 	char cmd[256];
 	FILE *fp, *fp2;
@@ -1019,7 +1019,12 @@ is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type)
 	else
 		snprintf(reset_mask, sizeof(reset_mask) - 1, "sdma_reset_mask");
 
-	snprintf(cmd, sizeof(cmd) - 1, "sudo cat /sys/kernel/debug/dri/0/name |grep -oP '(?<=dev=)[0-9:.]+'");
+	if( pci)
+		snprintf(cmd, sizeof(cmd) - 1, "sudo cat /sys/kernel/debug/dri/%04x:%02x:%02x.%01x/name |grep -oP '(?<=dev=)[0-9:.]+'",
+			pci->domain, pci->bus, pci->device, pci->function);
+	else
+		snprintf(cmd, sizeof(cmd) - 1, "sudo cat /sys/kernel/debug/dri/0/name |grep -oP '(?<=dev=)[0-9:.]+'");
+
 	fp = popen(cmd, "r");
 	if (fp == NULL)
 		return false;
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index dc4d87151..595b2b16b 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -233,7 +233,7 @@ void
 asic_rings_readness(amdgpu_device_handle device_handle, uint32_t mask, bool arr[AMD_IP_MAX]);
 
 bool
-is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type);
+is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type, const struct pci_addr *pci);
 
 int
 get_pci_addr_from_fd(int fd, struct pci_addr *pci);
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 29b7ae509..472f28e68 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -76,7 +76,7 @@ igt_main
 	igt_describe("Test-GPU-reset-by-access-gfx-illegal-reg");
 	igt_subtest_with_dynamic("amdgpu-gfx-illegal-reg-access") {
 		if (arr_cap[AMD_IP_GFX] &&
-			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-illegal-reg-access")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
 					AMDGPU_HW_IP_GFX, &pci);
@@ -86,7 +86,7 @@ igt_main
 	igt_describe("Test-GPU-reset-by-access-gfx-illegal-mem-addr");
 	igt_subtest_with_dynamic("amdgpu-gfx-illegal-mem-access") {
 		if (arr_cap[AMD_IP_GFX] &&
-			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-illegal-mem-access")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
 					AMDGPU_HW_IP_GFX, &pci);
@@ -105,7 +105,7 @@ igt_main
 	igt_describe("Test-GPU-reset-by-access-compute-illegal-mem-addr");
 	igt_subtest("amdgpu-compute-illegal-mem-access") {
 		if (arr_cap[AMD_IP_COMPUTE] &&
-			 is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			 is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 		bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
 				AMDGPU_HW_IP_COMPUTE, &pci);
 		}
@@ -122,7 +122,7 @@ igt_main
 	igt_describe("Test-GPU-reset-by-sdma-corrupted-header-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-corrupted-header-test") {
 		if (arr_cap[AMD_IP_DMA] &&
-			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-corrupted-header-test")
 			amdgpu_hang_sdma_ring_helper(device, DMA_CORRUPTED_HEADER_HANG, &pci);
 		}
@@ -131,7 +131,7 @@ igt_main
 	igt_describe("Test-GPU-reset-by-sdma-slow-linear-copy-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-slow-linear-copy") {
 		if (arr_cap[AMD_IP_DMA] &&
-			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-slow-linear-copy")
 			amdgpu_hang_sdma_ring_helper(device, DMA_SLOW_LINEARCOPY_HANG, &pci);
 		}
@@ -140,7 +140,7 @@ igt_main
 	igt_describe("Test-GPU-reset-by-sdma-badop-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-badop-test") {
 		if (arr_cap[AMD_IP_DMA] &&
-			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-badop-test")
 			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_OPCODE,
 					AMDGPU_HW_IP_DMA, &pci);
@@ -150,7 +150,7 @@ igt_main
 	igt_describe("Test-GPU-reset-by-sdma-bad-mem-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-mem-test") {
 		if (arr_cap[AMD_IP_DMA] &&
-			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-mem-test")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
 					AMDGPU_HW_IP_DMA, &pci);
@@ -160,7 +160,7 @@ igt_main
 	igt_describe("Test-GPU-reset-by-sdma-bad-reg-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-reg-test") {
 		if (arr_cap[AMD_IP_DMA] &&
-			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-reg-test")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
 					AMDGPU_HW_IP_DMA, &pci);
@@ -170,7 +170,7 @@ igt_main
 	igt_describe("Test-GPU-reset-by-sdma-bad-length-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-length-test") {
 		if (arr_cap[AMD_IP_DMA] &&
-			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-length-test")
 			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
 					AMDGPU_HW_IP_DMA, &pci);
diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
index 23d07561c..26b179f35 100644
--- a/tests/amdgpu/amd_dispatch.c
+++ b/tests/amdgpu/amd_dispatch.c
@@ -78,6 +78,7 @@ igt_main
 	int fd = -1;
 	int r;
 	bool arr_cap[AMD_IP_MAX] = {0};
+	struct pci_addr pci;
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -90,7 +91,9 @@ igt_main
 
 		igt_info("Initialized amdgpu, driver version %d.%d\n",
 			 major, minor);
-
+		igt_skip_on(get_pci_addr_from_fd(fd, &pci));
+		igt_info("PCI Address: domain %04x, bus %02x, device %02x, function %02x\n",
+				pci.domain, pci.bus, pci.device, pci.function);
 		r = amdgpu_query_gpu_info(device, &gpu_info);
 		igt_assert_eq(r, 0);
 		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
@@ -117,7 +120,7 @@ igt_main
 	igt_describe("Test GPU reset using a binary shader to hang the job on gfx ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-gfx-with-IP-GFX") {
 		if (arr_cap[AMD_IP_GFX] &&
-			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-dispatch-hang-test-gfx")
 			amdgpu_dispatch_hang_gfx(device, BACKEND_SE_GC_SHADER_INVALID_SHADER);
 		}
@@ -126,7 +129,7 @@ igt_main
 	igt_describe("Test GPU reset using a binary shader to hang the job on compute ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-compute-with-IP-COMPUTE") {
 		if (arr_cap[AMD_IP_COMPUTE] &&
-			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-dispatch-hang-test-compute")
 			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_SHADER);
 		}
@@ -135,7 +138,7 @@ igt_main
 	igt_describe("Test GPU reset using a invalid shader program address to hang the job on compute ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-program-addr-test-compute-with-IP-COMPUTE") {
 		if (arr_cap[AMD_IP_COMPUTE] &&
-			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-dispatch-invalid-program-addr-test-compute")
 			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR);
 		}
@@ -144,7 +147,7 @@ igt_main
 	igt_describe("Test GPU reset using a invalid shader program setting to hang the job on compute ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-setting-test-compute-with-IP-COMPUTE") {
 		if (arr_cap[AMD_IP_COMPUTE] &&
-			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-dispatch-invalid-setting-test-compute")
 			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING);
 		}
@@ -153,7 +156,7 @@ igt_main
 	igt_describe("Test GPU reset using a invalid shader user data to hang the job on compute ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-user-data-test-compute-with-IP-COMPUTE") {
 		if (arr_cap[AMD_IP_COMPUTE] &&
-			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
+			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-dispatch-invalid-user-data-test-compute")
 			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_USER_DATA);
 		}
diff --git a/tests/amdgpu/amd_pci_unplug.c b/tests/amdgpu/amd_pci_unplug.c
index 4c055b99f..cb88185a0 100644
--- a/tests/amdgpu/amd_pci_unplug.c
+++ b/tests/amdgpu/amd_pci_unplug.c
@@ -47,7 +47,6 @@ igt_main
 	igt_subtest("amdgpu_hotunplug_with_cs")
 		amdgpu_hotunplug_with_cs(&setup, &unplug);
 
-		/*TODO about second GPU*/
 	igt_subtest("amdgpu_hotunplug_with_exported_bo")
 		amdgpu_hotunplug_with_exported_bo(&setup, &unplug);
 
diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 87cf665f3..a7aca4171 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -1126,6 +1126,7 @@ igt_main
 	unsigned int ring_id_job_good;
 	unsigned int ring_id_job_bad;
 	int expect_error;
+	struct pci_addr pci ;
 
 	enum amd_ip_block_type ip_tests[3] = {AMD_IP_COMPUTE/*keep first*/, AMD_IP_GFX, AMD_IP_DMA};
 	enum amd_ip_block_type ip_background = AMD_IP_COMPUTE;
@@ -1202,6 +1203,9 @@ igt_main
 			igt_require(fd_shm != -1);
 			launch_background_process(argc, argv, path, &pid_background, fd_shm);
 			process = PROCESS_TEST;
+			igt_skip_on(get_pci_addr_from_fd(fd, &pci));
+			igt_info("PCI Address: domain %04x, bus %02x, device %02x, function %02x\n",
+							pci.domain, pci.bus, pci.device, pci.function);
 		} else {
 			process = PROCESS_BACKGROUND;
 		}
@@ -1236,7 +1240,7 @@ igt_main
 				reset = (ip_tests[i] != AMD_IP_DMA) && (it->test == CMD_STREAM_EXEC_INVALID_PACKET_LENGTH) ?
 					AMDGPU_RESET_TYPE_PER_QUEUE : AMDGPU_RESET_TYPE_PER_PIPE;
 
-				if (arr_cap[ip_tests[i]] && is_reset_enable(ip_tests[i], reset) &&
+				if (arr_cap[ip_tests[i]] && is_reset_enable(ip_tests[i], reset, &pci) &&
 						get_next_rings(&ring_id_good, &ring_id_bad, info[0].available_rings,
 						info[i].available_rings, ip_background != ip_tests[i], &ring_id_job_good, &ring_id_job_bad)) {
 					igt_dynamic_f("amdgpu-%s-ring-good-%d-bad-%d-%s", it->name, ring_id_job_good, ring_id_job_bad,
-- 
2.34.1

