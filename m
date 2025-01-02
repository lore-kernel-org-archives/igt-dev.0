Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38BBE77188
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jan 2025 03:53:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816B510E078;
	Thu,  2 Jan 2025 03:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cjETUc0q";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8142A10E078
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jan 2025 03:53:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmBee5PZd/4vwHZdADKCLL4x2ojNwS7dClDo7XrfFupUhSv9kNoQCY+CLc3CH1k5QR++yF1bjguAIolnBuMeX4hPURALZoKSJoaOf3sx6Trqhl7AcHQrg8dlaCrdIiT55CawPtM6XgJlyWhXlpZFu/2ztX7GWj3MUHtzyuvwlBGXR67Kinu7TxhVZlSmt8wkQ2A646yRtBi4dBb1LchcaeAwb/2wciQCB67txgZlZYxmDQyFoH2DLQMjQ0XacftYgSYo8QGl128yPZLpoH9jFlovVTwFT3q1wPbEYs9YfEDFzSgG33oYpyR2CeCKOP1josWcMfmcBuKXn52T3Knf7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZO0f/3cKofxFH+dSaNMF8q4zBIQfBXHqGOhJVIo0/Tw=;
 b=GqX7j2jkFVNG7/FsR7LUb325vj7QfAzSnax22NqhXzs4W+msnrDWiKjzdwXTkD+zndg51M/SdepVdQPJ/Ls/bJ+Se0GZyUvEE6JdK7NRqwMeegtastY29qn/v8BE5KrLAVt3req7okc034ad+W99qUNvl4BYdptHMrEKz8x9ylvOOse9qocvafhldo2eAY3eUqKWnheEJzxay8kXtyNytf4czSRToVNYnUvPR7+z2kVEsdxa1B66sVFgFO1eLnewSvSxuXXmaq9lazysOr6d9qsK7dgZ/ugC6xBIfQR7rg3gs7v5FTIr89cfF8tjdRz2N7RC/kwvLLqklMeLg5v0ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZO0f/3cKofxFH+dSaNMF8q4zBIQfBXHqGOhJVIo0/Tw=;
 b=cjETUc0qSY38UVxvAl0eY40ocMR2ltdgFTy+1kNmkM+LNgCLvagfUbpYCUdlveJM26ej1rDOrGMFPcAc4tjPb44pnI7QiFhQvtRDWwhxEP5Qn8bZlTdcC7GyCR9aM3gaOMtRZeLw2gnFc8R3MgKS7spA3Syj/cssAwsIr0vg+tM=
Received: from DM6PR03CA0096.namprd03.prod.outlook.com (2603:10b6:5:333::29)
 by DM4PR12MB7502.namprd12.prod.outlook.com (2603:10b6:8:112::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.20; Thu, 2 Jan
 2025 03:53:11 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com
 (2603:10b6:5:333:cafe::6e) by DM6PR03CA0096.outlook.office365.com
 (2603:10b6:5:333::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.13 via Frontend Transport; Thu,
 2 Jan 2025 03:53:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Thu, 2 Jan 2025 03:53:11 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 1 Jan
 2025 21:53:10 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 1 Jan 2025 21:53:08 -0600
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Subject: [PATCH i-g-t] lib/amdgpu: enhance wait memory helper
Date: Thu, 2 Jan 2025 11:53:08 +0800
Message-ID: <20250102035308.1997205-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|DM4PR12MB7502:EE_
X-MS-Office365-Filtering-Correlation-Id: c7f51920-e113-4634-e114-08dd2ae0fa3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w5Mi3q5/u1p+42vNjDPgUyC+BxtDk5xX2shZ+k3UD25gorks+aSNDdAhcOka?=
 =?us-ascii?Q?jchm3afQWtxv6GsF/Bbfw10v479cY0isDHPBOZKIiDFurS/sf0u6dDEEYsUH?=
 =?us-ascii?Q?KOVKolR1Dh8nQ0hP6mQm9BUDlwA2eqqw5d+4vCqfacg7bU7w1UnQiJFSq/hi?=
 =?us-ascii?Q?QOPtfESRMlgeEsx1drO7NeewLOU+DL1d23i8pQd+fr8GrQPZRBvmoZgTZYt6?=
 =?us-ascii?Q?MC+QKBzGsj5O0XMY4wFXYvMAMndYWsGIamDxxBpyNpFj9x+RqzB60gecbGtl?=
 =?us-ascii?Q?otNs3TgQ7q1hggOWG3oOkFVzGLOLDNax1P0urzh4nX4d+r7pxb7KzxikkqOh?=
 =?us-ascii?Q?1QgzdlX++qTVKgyyCqhtIJy73PzCF8MQrVZU+GIzOb/uWVQGOc4OYRcR2PJp?=
 =?us-ascii?Q?gt45Dvo3iAaUuIMiMIONmVbSLVoTXdpR/GKgxRR6xR5ORlNNQk8AL8H+Qycy?=
 =?us-ascii?Q?TWGeoILbYZ97Nckc+l9qQ6T9YbKXeaJ9ZFidb8tx055dhqTq2kqDfMrphKGe?=
 =?us-ascii?Q?kMfxejosJVjDC/m9Jz43UeslMfHMnC2S4/IuExbbCi7cngbaDVc0Ifn6zd7r?=
 =?us-ascii?Q?zNPZzei3izGe23OXPsFKVxHLci3TWIBbx2VA7IbNQRX4YmJET7Gj4XkfMncL?=
 =?us-ascii?Q?IZUyxYIqO6rhOpBY+fEX2kcqpWXdA5cvN2954ceBjxY572O3oCWzxeU2Ek1R?=
 =?us-ascii?Q?2z6tbVjyT6K0/0pIAc29SXTKCU7PG8MqkBg8MILC2yXGQySX6dodRXONX/+b?=
 =?us-ascii?Q?aWaI6JymJrY88bGU9gKnn6w1lFOv/3G5x6Y3KDfkRvfmAL+oFSNzIcDTbooj?=
 =?us-ascii?Q?6xKU2eZgVQ47EX0Azh95aL3385dBaML+IaZNGUaw8YKhlKCfCj99DDNdTLcs?=
 =?us-ascii?Q?NHPB1MHQApU9yYpmcHZN0gNxvYYiIoWJMbKEF09Vi5UyQ5OZvlLHzhoY/Tho?=
 =?us-ascii?Q?xwuMHpb4jZgU1DZdYGcctuvB/eoBzVfacvHEnruUwedFSD2AEPYBbwf2G/Co?=
 =?us-ascii?Q?FS7Jt+FkWpI03HfCPNvrOIRj3cWsFWRc834B8DFZY4mxoPX8CpuNe4Lo8AA6?=
 =?us-ascii?Q?HU4wSAgvF2j38uEj2/7AjnIpinsrTtkQtcLBwH+YQy0qkraEmxD3T7uXI4B8?=
 =?us-ascii?Q?jYLTqbW0Y68Pvvuje5lS2+91ng1ZGs88JZnvgFCSodweg2Kzp4U+sdFERjtk?=
 =?us-ascii?Q?FTnBkWm4I1qmNcOkbcDijmT/FbRO7r2CdoYU3TA+lTb26d3g61m40Mc+UhGJ?=
 =?us-ascii?Q?kyUftvZbA+6zjY/fb7w00jbbEfTKUYo9B0glMSYfRDpAVjEKUuMD34s+fmWt?=
 =?us-ascii?Q?B2372F3IrPDigGR5JHfxXUiPjs90FCEVQDJm6NOREyQ5bXnfDUXTnuMOQVTQ?=
 =?us-ascii?Q?C2k8ns+2W7UH7FUhGa4UOCqcKOsM2feoviMC8bQzdbytMXFjmgYdDaS7xfb2?=
 =?us-ascii?Q?SS30sXJl0zO/lJB6TGyZ/+Vz47E6lnHOdGsO1goi/tCU1AGlVISgCnON3HMa?=
 =?us-ascii?Q?3pUjhgZ/f5uGq5o=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 03:53:11.4094 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f51920-e113-4634-e114-08dd2ae0fa3c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7502
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

Test all sdma rings and ensure
that all rings can be recovered.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>

Signed-off-by: Jesse Zhang  <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 91 ++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 3 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 87078548c..dabd7ae76 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -43,8 +43,8 @@ write_mem_address(void *data)
 	return 0;
 }
 
-void
-amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type)
+static void
+amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type, uint32_t priority)
 {
 	amdgpu_context_handle context_handle;
 	amdgpu_bo_handle ib_result_handle;
@@ -65,7 +65,11 @@ amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_ty
 	int job_count = 0;
 	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
 
-	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+	if( priority == AMDGPU_CTX_PRIORITY_HIGH)
+		r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &context_handle);
+	else
+		r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+
 	igt_assert_eq(r, 0);
 
 	r = amdgpu_bo_alloc_and_map_raw(device_handle, bo_cmd_size, bo_cmd_size,
@@ -169,6 +173,87 @@ amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_ty
 	free_cmd_base(base_cmd);
 }
 
+void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type)
+{
+	int r;
+	FILE *fp;
+	char cmd[1024];
+	char buffer[128];
+	long sched_mask = 0;
+	struct drm_amdgpu_info_hw_ip info;
+	uint32_t ring_id, prio;
+	char sysfs[125];
+
+	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
+	igt_assert_eq(r, 0);
+	if (!info.available_rings)
+		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
+
+	if (ip_type == AMD_IP_GFX)
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_gfx_sched_mask");
+	else if (ip_type == AMD_IP_COMPUTE)
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_compute_sched_mask");
+	else if (ip_type == AMD_IP_DMA)
+		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_sdma_sched_mask");
+
+	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
+	r = access(sysfs, R_OK);
+	if (!r) {
+		fp = popen(cmd, "r");
+		if (fp == NULL)
+			igt_skip("read the sysfs failed: %s \n",sysfs);
+
+		if (fgets(buffer, 128, fp) != NULL)
+			sched_mask = strtol(buffer, NULL, 16);
+
+		pclose(fp);
+	} else {
+		sched_mask = 1;
+		igt_info("The scheduling ring only enables one for ip %d\n", ip_type);
+	}
+
+	for (ring_id = 0; (0x1 << ring_id) <= sched_mask; ring_id++) {
+		/* check sched is ready is on the ring. */
+		if (!((1 << ring_id) & sched_mask))
+			continue;
+
+		if (sched_mask > 1 && ring_id == 0 &&
+			ip_type == AMD_IP_COMPUTE) {
+			/* for the compute multiple rings, the first queue
+			 * as high priority compute queue.
+			 * Need to create a high priority ctx.
+			 */
+			prio = AMDGPU_CTX_PRIORITY_HIGH;
+		} else if (sched_mask > 1 && ring_id == 1 &&
+			 ip_type == AMD_IP_GFX) {
+			/* for the gfx multiple rings, pipe1 queue0 as
+			 * high priority graphics queue.
+			 * Need to create a high priority ctx.
+			 */
+			prio = AMDGPU_CTX_PRIORITY_HIGH;
+		} else {
+			prio = AMDGPU_CTX_PRIORITY_NORMAL;
+		}
+
+		if (sched_mask > 1) {
+			snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
+						0x1 << ring_id, sysfs);
+			r = system(cmd);
+			igt_assert_eq(r, 0);
+		}
+
+		amdgpu_wait_memory(device_handle, ip_type, prio);
+	}
+
+	/* recover the sched mask */
+	if (sched_mask > 1) {
+		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s",sched_mask, sysfs);
+		r = system(cmd);
+		igt_assert_eq(r, 0);
+	}
+
+}
+
 static void
 bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
 			unsigned int ip_type, uint32_t priority)
-- 
2.25.1

