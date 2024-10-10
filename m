Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1C5CF07A0
	for <igt-dev@archiver.kernel.org>; Thu, 10 Oct 2024 04:58:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E037E10E857;
	Thu, 10 Oct 2024 04:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KyUNgVVc";
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2044.outbound.protection.outlook.com [40.107.212.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB4E10E857
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Oct 2024 04:58:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6NvRaZJ56fkNTODjqlIEEK8M7Hr8OMg2hTYyetu3CLy98nRIHDHL92M5e1AoaCqy8VZTbL3h+o8tuCXsL5ni7+hY05FkW7i+121BNq+SsR6986s/F2HD7BOWsZucrB+khI1z9xT7l2kAXPBaIbfISPd2C8jHVly+bMHy14uuPGLp0GerHupqsWmh6eacKPY08JnwmTCA5bGtfIoBdPOGVXC8dDp0fNsBS0WQMWQ9bRk6ysY/iuciuXR9WpvzD/X8DHudY1nq+1ULa+pKq6iDj6KRdz9ifkbglm0pKXKycqLqvPkSBMp42cPVhiaN7DYCWYJXrIzG8Yfeu7mvPFSjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3LB3SM1QUCp/lU7n2555K+qelIeAkpV8X1Bg3/BdOo=;
 b=iYedl3h2Vqtz25EizUGr0gu99Kbnpii4lPTK+9UPu7klj+CDLpu9jPn1FQeLdr/d+RviF3JMuWz1TrLTBTqQgaZNuy/WG/H6JQoYmXeCuDzzeuNJ0GhlcF0dOWbltT5rTxtQtNgrLwzs8CoX2JkF18y0crnDGBH7SP00yr+vkpU9ZApq01PmYgCoJhdzQKXO+EmIrsb0IC+snwm3P/uRSrOOlvXsEtG9AgxSyecECK7BEYuWROztvglzS+p0VbIvrSFhLeJ3a64N/m/mVSEJZ3hZajFIV5vqPQfbUzzWT9/EnUYG0lGuAjnLF3ZsYY81ccBiffnKSKP2qsu9N5ZiBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3LB3SM1QUCp/lU7n2555K+qelIeAkpV8X1Bg3/BdOo=;
 b=KyUNgVVc0x7VWmTTR4z9ZcWdslphCtnkSGgQkYbomCPdgJlDjWkAwSemeDlZFEcfKxkKD8NW1haojjJqwfJLuMEJ4SAc9vnIPDlIODjU0/EBNQxjZS7KwabTk5+aIfKuCaKzuaZMPGszxGJV+88PB0VtLzikwr6CLFORG6Bff3Q=
Received: from CH2PR18CA0011.namprd18.prod.outlook.com (2603:10b6:610:4f::21)
 by IA0PR12MB8862.namprd12.prod.outlook.com (2603:10b6:208:48e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.19; Thu, 10 Oct
 2024 04:58:19 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:610:4f:cafe::32) by CH2PR18CA0011.outlook.office365.com
 (2603:10b6:610:4f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Thu, 10 Oct 2024 04:58:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Thu, 10 Oct 2024 04:58:19 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Oct
 2024 23:58:17 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 9 Oct 2024 23:58:11 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Jesse.zhang@amd.com"
 <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 1/2] lib/amdgpu: add sdma ring id paramter for deadlock
 helper
Date: Thu, 10 Oct 2024 12:58:09 +0800
Message-ID: <20241010045810.491920-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|IA0PR12MB8862:EE_
X-MS-Office365-Filtering-Correlation-Id: b8055e23-96d1-47c0-633a-08dce8e828bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yF6ciGix6OAK1UCQwijG3EU0vupBblP4/Ev+hUofcMBXkS6hGTYlm6NQKxjq?=
 =?us-ascii?Q?g7Tw1OeF4IK7COI5l6qCJUKSSMkw/Vo7khTbnVlHGah/r8+41csAIsUFgUvh?=
 =?us-ascii?Q?36zv3M7AIE4BYl0WBXynh/wP7SiFQ5Uq0ZZhVjeoaEH4n+AA0rJZzkuc5cR6?=
 =?us-ascii?Q?WB20oYzjPCHIWt6wmRazFORBvx79OjcWxkWn5EmbkGxEfRO/wMhpgOKxnL0s?=
 =?us-ascii?Q?hsXQ0rowSN5DHgHKGlvPUZcRNr+4gyAHeu6YQU9Zf3LK281TbmAyhwwdsLtU?=
 =?us-ascii?Q?20ga2Dwmjy1jAKk4Cwjr0yU0CpzFuZiMtsXNKkvAFI4lW+IiHyvEmmwShZKx?=
 =?us-ascii?Q?i3oQRa8t/+CgZ3a3l4k1+SSHU3UxyLDloFSSpb7wiwz/8+bmf3/B9q3fZ8xK?=
 =?us-ascii?Q?gzQrn7J5qGBJ6VU2sKMsccgG1ZIxuVu4w0CFUnNj6Nc/khTR1FtEBnkMP0PH?=
 =?us-ascii?Q?qAK7l5cHWOp4+c6Wtjo42vIR68XaPQDhhKwgPkxjyim/yIsdbbee+GnyL/0s?=
 =?us-ascii?Q?FPj335zMeZO4/DEn2oGMKy0LtiiMYrPUfXhcIf+73FOwFz2TZOHqMA0CFnNx?=
 =?us-ascii?Q?5p1KSgqkUE7r4ZUstjfdB/N0xkh/9l8bUjKvFHSonniiIa1NVa6xSVy8Lq1K?=
 =?us-ascii?Q?EqEc48cRMORxlQ6irfK9gT4kB0b6mEYd135yEm9ztAZn/vzryp+Y6LNpm2VF?=
 =?us-ascii?Q?ygIeUSIdJDQnMT+PiyuAxYKOvUK6Tmwz4SrpLRaCJFHVUfGPqq2IeierNZ0X?=
 =?us-ascii?Q?fkay454Cwee3Cx77JZAWV9Lz71iU9FQJk6+bSkJiPU1uM7DERi8grgMu22ui?=
 =?us-ascii?Q?tsPxwXuhRAi0PMDYs0haMsJ2gy9cYGrRpRltNKtNG4EUSyCBrUk2xojvGaFE?=
 =?us-ascii?Q?Z7pHKH3C3Qlw8+5PNphM9xg+M9J/SfKVDsxxwIZ6SHP0tdwtrY8UB+MjVudb?=
 =?us-ascii?Q?tKvaGlRQsPtH4vL66140NiHWKMyXjnfWZJRrDY5EE1iFKrYMqvYGovZ6t8+D?=
 =?us-ascii?Q?oIFH4KDlxGW7Te6fP5/DdI/PXN02iAF8YalDwWmx4sknElI2od/pftAHXMSn?=
 =?us-ascii?Q?WWfnSD11G7cPeOwgXcv+iUm131CYR1dyxSfJyXLXe/SbyruOOt3ZvH2cAupu?=
 =?us-ascii?Q?1ZKyGCfZxP+DWR8Rf+1SHGy0+dShVS8S9S4+hwOaCQkH675JC1ijObcWLZol?=
 =?us-ascii?Q?XTZN1NhVx+Y7r0kU2xFDMPm7kyTDzhbZWsOXb8Ub58E7wz3q09t/BHsQGbjA?=
 =?us-ascii?Q?GN2n9YA69/lBVFzOvHv/GxOESyjPC5jIBbeNJxp4uPDwPsgVEGSsvAJSBFEF?=
 =?us-ascii?Q?C7PRWDBIO3VzjkJNpan0s9v+KY8XMlcXgEURYPoDJWwCW/u5cSCH1kM3Vuqo?=
 =?us-ascii?Q?HR3T0nhuSTRjo2zlSTnNRVrMNr1j?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 04:58:19.2100 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8055e23-96d1-47c0-633a-08dce8e828bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8862
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

Since sdma may have multiple rings on different chip,
deadlock testing should cover all sdma ring tests.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 43 +++++++++++++++++++++++++++----
 lib/amdgpu/amd_deadlock_helpers.h |  5 ++--
 2 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index c71272e58..39641ce23 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -169,8 +169,8 @@ amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_ty
 	free_cmd_base(base_cmd);
 }
 
-void
-bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type)
+static void
+bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type, unsigned int ring_id)
 {
 
 	const struct amdgpu_ip_block_version *ip_block = NULL;
@@ -190,7 +190,7 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, un
 	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
 	ring_context->pm4_size = pm4_dw;
 	ring_context->res_cnt = 1;
-	ring_context->ring_id = 0;
+	ring_context->ring_id = ring_id;
 	igt_assert(ring_context->pm4);
 	ip_block = get_ip_block(device_handle, ip_type);
 	r = amdgpu_bo_alloc_and_map(device_handle,
@@ -216,11 +216,27 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, un
 	free(ring_context);
 }
 
+void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type)
+{
+	int r;
+	struct drm_amdgpu_info_hw_ip info;
+	uint32_t ring_id;
+
+	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
+	igt_assert_eq(r, 0);
+	if (!info.available_rings)
+		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
+
+	for (ring_id = 0; (1 << ring_id) & info.available_rings; ring_id++) {
+		bad_access_helper(device_handle, cmd_error, ip_type, ring_id);
+	}
+}
+
 #define MAX_DMABUF_COUNT 0x20000
 #define MAX_DWORD_COUNT 256
 
-void
-amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
+static void
+amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type, unsigned int ring_id)
 {
 	int j, r;
 	uint32_t *ptr, offset;
@@ -240,6 +256,7 @@ amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
 	}
 	ring_context->secure = false;
 	ring_context->res_cnt = 2;
+	ring_context->ring_id = ring_id;
 	igt_assert(ring_context->pm4);
 
 	r = amdgpu_cs_ctx_create(device_handle, &ring_context->context_handle);
@@ -309,3 +326,19 @@ amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
 	igt_assert_eq(r, 0);
 	free_cmd_base(base_cmd);
 }
+
+void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
+{
+	int r;
+	struct drm_amdgpu_info_hw_ip info;
+	uint32_t ring_id;
+
+	r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_DMA, 0, &info);
+	igt_assert_eq(r, 0);
+	if (!info.available_rings)
+		igt_info("SKIP ... as there's no ring for the sdma\n");
+
+	for (ring_id = 0; (1 << ring_id) & info.available_rings; ring_id++)
+		amdgpu_hang_sdma_helper(device_handle, hang_type, ring_id);
+}
+
diff --git a/lib/amdgpu/amd_deadlock_helpers.h b/lib/amdgpu/amd_deadlock_helpers.h
index 165ffb98d..7f8419280 100644
--- a/lib/amdgpu/amd_deadlock_helpers.h
+++ b/lib/amdgpu/amd_deadlock_helpers.h
@@ -26,11 +26,10 @@
 
 void
 amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type);
-
 void
-bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type);
+bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type);
 
 void
-amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type);
+amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t hang_type);
 #endif
 
-- 
2.25.1

