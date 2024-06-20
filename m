Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC536C27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 06:15:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B05E10E2D7;
	Thu, 20 Jun 2024 06:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2PPTj0Gm";
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2045.outbound.protection.outlook.com [40.107.102.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D7510E2E0
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 06:15:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oz03OoojCpPeuWU8Ot4kDFglaNd0Cp6xiUN52jCH3d6eWV/+s8M1pC+IvLP1952RGQfkwaqefnTKwRBFlx8gphp7I78FrBXN+1Y6FEC9CGIRxpPYwv0KwLweFB1GYhw1f7CcBS1wNh8NwIdgOROwNgJqNnBksvms2VH71blldqZNfIovisautL7K0CtBbq+WfdmqyHW4O3WAPif6OlVtOqcLWJde/MbfFg6AfKsSZqUhffhX4BanAQyfKCbb/FacaM4S6CncgHsmhnW3sZQIMit6tTxXXZkxM2QDxJ47cCpCjq7iTusa+mNq7nSAYjLoBpTx5OBnjWrEB4TLdufSUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHaF38A4FuC6rSDgRQdLALaRFcdNvoJiUEdiYYITjWE=;
 b=ihUT/E7PJj6JSPf4zS19PYgVbvUSWFd4pj1rXliXhYj1Fbwzco8nEJLyt5lLITEJ3OErkHPgwifeKgZztSg6B2YIaweQMugz8t5y0LXbs1TZ8ATAYIUzBxJj04F8c4lomhuLNBUmpv15RczpJwGEewz1yn0ouQ+XhxtQ6f+IYw+ouAmBLoJ3pAFvhMD0FB2dgrdJZMBhsTaHJDrimK+dZ15zf+/nENaKAnhZnNjKlN0S4al9YjBB9FWPB7LNdze0vXKbqTgPKi02ZI6Scg89eGK794Gcwk+AEsM3wO/d4Ib6BpTI3croC+mo4koc6G1c9EBNtPTXuihD72by/NosLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHaF38A4FuC6rSDgRQdLALaRFcdNvoJiUEdiYYITjWE=;
 b=2PPTj0Gm7wo9sIn0/3p1xAAj15WiRBNgsvz3MesErOiXa+/acEBOEq74EXN3xBQkrMbkiu7F7z+e5a0X9nZN27v45991G/dEnDOEJc+ahXs16HY18hzIFQxprKd/uol6hcwIwgNFrhxZWb/dkrAUSn5ApMey9jv4raOFQVEnzCc=
Received: from BYAPR01CA0048.prod.exchangelabs.com (2603:10b6:a03:94::25) by
 PH0PR12MB7862.namprd12.prod.outlook.com (2603:10b6:510:26d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.31; Thu, 20 Jun 2024 06:15:22 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:94:cafe::bd) by BYAPR01CA0048.outlook.office365.com
 (2603:10b6:a03:94::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.33 via Frontend
 Transport; Thu, 20 Jun 2024 06:15:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 20 Jun 2024 06:15:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Jun
 2024 01:15:21 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 20 Jun 2024 01:15:14 -0500
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH 2/3] lib/amdgpu: add gfx12 to amd_dispatch test
Date: Thu, 20 Jun 2024 14:15:13 +0800
Message-ID: <20240620061513.2218555-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|PH0PR12MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: 1efcd5b7-adf6-4f39-3970-08dc90f05e0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|36860700010|376011|1800799021|82310400023; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nU0a17/LyZV0tqp7QJbU855ec61LTLG2K4PiUSNMPZxnzK3Xp6+YN+LK6Czq?=
 =?us-ascii?Q?oRZr7RkedlD3WqUaCzOEraZeYoyuMXh2Z/2HTnmTIBpH+xfjuUbIPB/MKR3H?=
 =?us-ascii?Q?YaPYt+Hzzu4nwsrG+3xkk6MYX0DyTBcEMT0iubQ9MPrxJk+TkBXGjdsh2API?=
 =?us-ascii?Q?XPQPNz5JXQLhMT/VTHnLw7i0pSDEInHZ4KoRBbBMuJ5RXKaNXOe8z4RCnJPz?=
 =?us-ascii?Q?M2AFOpvLDfIWk5KHKpkkngi2BcMf3tDOb7LR1gmZnSRHNx3fzlTfw8Z8ehlB?=
 =?us-ascii?Q?Hz93wuNtgJE2NekmWEexirPFYthboi64iv4qqG2xbACUwwR0v2GH3VdbtW70?=
 =?us-ascii?Q?Fp3js1BaVwV5DE/fz/WJz21ymhnZ+fHMZEUl9WoAB9BHWeqT+3ct5umu7UTe?=
 =?us-ascii?Q?2PMBkaRWRwWXVQ4TAC3G/u8oiewKqSfzPrzOTyYu0r4n/d0neTiyi786zhJn?=
 =?us-ascii?Q?mw23RIDJB3yL9iAQZezJ47ay1WkUmyQROR8RKQKti5ZmZTiqZPvNEyqftBGd?=
 =?us-ascii?Q?2QUCrecOMIM0ZqTpA4seB4ijQsu9JQfl4sOWYlFpMV/QQq2QotrWgNZmvIr5?=
 =?us-ascii?Q?/hz2w07LY9qNQLlTPJE1u+MCqdOgJdm/3omSGpA/bmJLbdY1CTWymrAZrOfF?=
 =?us-ascii?Q?8Yg17kgZsxWXWmp5C5DozBAXMlRHBzrc+oT7ogcx3VWjtb8k52iDuv3mhd/F?=
 =?us-ascii?Q?mLdKQNs/mp+GGJb+sltCLfC1j1/dqipC6+d2rMrl576a05sVWqxNR2JTdCC3?=
 =?us-ascii?Q?Ymiogg7d3IWSdqC/PsW87kNHFPR2mMjies3V4OHDvDjG1EsafAgPh0DLddjQ?=
 =?us-ascii?Q?cl0ni8D9QCwFASUP8DLPlH/7CEt0+vKM9PVOPjuVsbjMHuBbDAOCAIV6Delh?=
 =?us-ascii?Q?PKxyNTCLkm+HeskeMNVEAoFGdAYD6mKfKxCeD1L+iSLcdHX/sloLr58P1CVW?=
 =?us-ascii?Q?kPkAv9cREpAOI1tdgNG1ztx0oQjpeKhkkSpIJfr5tY7tRFSx32ufNAlgrzxk?=
 =?us-ascii?Q?BK4+ZC7wEpx9ruwd87svpx4ouDgtdK2XOtNv3GYKmUITfdXOQOmsYbHVF3l+?=
 =?us-ascii?Q?d6CiRG2+dZsVpEwW2PEvmAaRtiWQzZTtge5Kh06UBgV/6tDIkK910alXyvPp?=
 =?us-ascii?Q?IDJXyaoWiqnXqW2pnO24B7kHGVGN2Y0zw9df3nNeE0rB3aKEl8L463Wnb2X2?=
 =?us-ascii?Q?xDiqcX66wvpiJR3FzAVdMAaCHAKq7NrOl9HOXa22itu5nuYV9NrxYGxpKY8L?=
 =?us-ascii?Q?BKy5JFj4qA7oE5tPfOp3tbTrq3doyM0o+uFQUzaBDIZnRJjkLZA6vrw9klEH?=
 =?us-ascii?Q?ITuFieEp/2u1dh93KjJTu/Kvwzayb4sfp3UqQo3d4pw7chdKYMw2yVmE85Ni?=
 =?us-ascii?Q?eNji1p4B5ZvsNAbaH44AdMJUyNA6B/luVp0uRD+sea4FK82jtQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(36860700010)(376011)(1800799021)(82310400023); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 06:15:22.2968 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1efcd5b7-adf6-4f39-3970-08dc90f05e0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7862
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

Enable gfx12 amd_dispatch test

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_dispatch.c         | 16 ++++++++--
 lib/amdgpu/amd_dispatch_helpers.c |  2 +-
 lib/amdgpu/amd_shaders.c          | 52 +++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+), 3 deletions(-)

diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
index 040381a11..b739ce64d 100644
--- a/lib/amdgpu/amd_dispatch.c
+++ b/lib/amdgpu/amd_dispatch.c
@@ -87,6 +87,8 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 		base_cmd->emit(base_cmd, 0x1104bfac);
 	else if (version == 11)
 		base_cmd->emit(base_cmd, 0x1003dfac);
+	else if (version == 12)
+		base_cmd->emit(base_cmd, 0x1203dfac);
 
 	/* Sets a range of pixel shader constants */
 	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
@@ -239,6 +241,8 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 		base_cmd->emit(base_cmd, 0x1104bfac);
 	else if (version == 11)
 		base_cmd->emit(base_cmd, 0x1003dfac);
+	else if (version == 12)
+		base_cmd->emit(base_cmd, 0x1203dfac);
 
 	/* Writes the UAV constant data to the SGPRs. */
 	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
@@ -252,6 +256,8 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 		base_cmd->emit(base_cmd, 0x1104bfac);
 	else if (version == 11)
 		base_cmd->emit(base_cmd, 0x1003dfac);
+	else if (version == 12)
+		base_cmd->emit(base_cmd, 0x1203dfac);
 
 	/* clear mmCOMPUTE_RESOURCE_LIMITS */
 	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
@@ -410,6 +416,8 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 		base_cmd->emit(base_cmd, 0x1104bfac);
 	else if (version == 11)
 		base_cmd->emit(base_cmd, 0x1003dfac);
+	else if (version == 12)
+		base_cmd->emit(base_cmd, 0x1203dfac);
 
 
 	/* Writes the UAV constant data to the SGPRs. */
@@ -422,6 +430,10 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 		base_cmd->emit(base_cmd, 0x74fac);
 	else if (version == 10)
 		base_cmd->emit(base_cmd, 0x1104bfac);
+	else if (version == 11)
+		base_cmd->emit(base_cmd, 0x1003dfac);
+	else if (version == 12)
+		base_cmd->emit(base_cmd, 0x1203dfac);
 
 
 	/* clear mmCOMPUTE_RESOURCE_LIMITS */
@@ -509,7 +521,7 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
 
 	version = info.hw_ip_version_major;
-	if (version != 9 && version != 10 && version != 11) {
+	if (version != 9 && version != 10 && version != 11 && version != 12) {
 		igt_info("SKIP ... unsupported gfx version %d\n", version);
 		return;
 	}
@@ -536,7 +548,7 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_ty
 		igt_info("SKIP ... as there's no graphics ring\n");
 
 	version = info.hw_ip_version_major;
-	if (version != 9 && version != 10 && version != 11) {
+	if (version != 9 && version != 10 && version != 11 && version != 12) {
 		igt_info("SKIP ... unsupported gfx version %d\n", version);
 		return;
 	}
diff --git a/lib/amdgpu/amd_dispatch_helpers.c b/lib/amdgpu/amd_dispatch_helpers.c
index 11ce8284a..1c7413922 100644
--- a/lib/amdgpu/amd_dispatch_helpers.c
+++ b/lib/amdgpu/amd_dispatch_helpers.c
@@ -138,7 +138,7 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr
 	base->emit(base, shader_addr >> 8);
 	base->emit(base, shader_addr >> 40);
 	/* write sh regs */
-	if (version == 11) {
+	if ((version == 11) || (version == 12)) {
 		for (j = 0; j < bufferclear_cs_shader_registers_num_gfx11; j++) {
 			base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
 			/* - Gfx11ShRegBase */
diff --git a/lib/amdgpu/amd_shaders.c b/lib/amdgpu/amd_shaders.c
index cbea12827..fad6dbced 100644
--- a/lib/amdgpu/amd_shaders.c
+++ b/lib/amdgpu/amd_shaders.c
@@ -314,6 +314,29 @@ int  amdgpu_dispatch_load_cs_shader(uint8_t *ptr, int cs_type, uint32_t version)
 		0xBF9F0000, 0xBF9F0000, 0xBF9F0000
 	};
 
+	static const uint32_t bufferclear_cs_shader_gfx12[] =
+	{
+		0xB0802009, 0xBF930006, 0x360000FF, 0x000003FF,
+		0x7E020205, 0x7E040206, 0x7E060207, 0xBF870004,
+		0xD6460004, 0x04010C75, 0x7E000204, 0xC401C07C,
+		0x80000000, 0x00000004, 0xBFB60003, 0xBFB00000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000
+	};
 	/**
 	 * shader main
 	 * asic(GFX11)
@@ -352,6 +375,29 @@ int  amdgpu_dispatch_load_cs_shader(uint8_t *ptr, int cs_type, uint32_t version)
 		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
 		0xBF9F0000, 0xBF9F0000
 	};
+	static const uint32_t buffercopy_cs_shader_gfx12[] =
+	{
+		0xB0802009, 0xBF930011, 0x360000FF, 0x000003FF,
+		0xBF870001, 0xD6460002, 0x04010C75, 0xC400C07C,
+		0x80000003, 0x00000002, 0xBFC00000, 0xC401C07C,
+		0x80000803, 0x00000002, 0xBFB60003, 0xBFB00000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000
+	};
 
 	uint32_t shader_size;
 	const uint32_t *shader;
@@ -367,6 +413,9 @@ int  amdgpu_dispatch_load_cs_shader(uint8_t *ptr, int cs_type, uint32_t version)
 			} else if (version == 11) {
 				shader = bufferclear_cs_shader_gfx11;
 				shader_size = sizeof(bufferclear_cs_shader_gfx11);
+			} else if (version == 12) {
+				shader = bufferclear_cs_shader_gfx12;
+				shader_size = sizeof(bufferclear_cs_shader_gfx12);
 			}
 			break;
 		case CS_BUFFERCOPY:
@@ -379,6 +428,9 @@ int  amdgpu_dispatch_load_cs_shader(uint8_t *ptr, int cs_type, uint32_t version)
 			} else if (version == 11) {
 				shader = buffercopy_cs_shader_gfx11;
 				shader_size = sizeof(buffercopy_cs_shader_gfx11);
+			} else if (version == 12) {
+				shader = buffercopy_cs_shader_gfx12;
+				shader_size = sizeof(buffercopy_cs_shader_gfx12);
 			}
 			break;
 		case CS_HANG:
-- 
2.25.1

