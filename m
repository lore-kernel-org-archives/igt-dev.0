Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17207CA0EE0
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 03:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9490510E1FF;
	Thu, 14 Aug 2025 03:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QbvOdASH";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6B610E0E5
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 03:18:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gknXoUtvP3bJi9K77Y2NrJzbs0tkndX4V0A/G7SZn6FihvmCMkgq72mXsljmIX79vbmm5yvlhMaVqHxv5rV1mWD012Vtx3VVYhjr1LT8E784lvqdDaBFkoY2wlk6Tvz4Ni+r7SW8XXkTJuafwO5dGb8BDviXmHKZlwv/1cfIa4kiR4/oQXdi1TQOhvKorlO/p8fBkQ9MH7CYNLfr3h91JexORr8Z+x5edF2PFScm8QlD7fdF+qtl1hOxSYb6eOQo/hcPcxH7BEe/e5SKntk30Np5WUe3eyevgaUgDEYf9auhteymcixARf6MMl0GnAMcbz/FYGrmGB8j2Ii5j0yaSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/u3pSiZD/7pSieXEnaC2XlYthp8+xOsbpEscLL9GKo=;
 b=omWEDq7kOF1P+MwGh8224hjATg0ZVGZz8b+vZqfAkwzjZB/lNAN5gFSZYFHhSzczuZSIJK00BapILStnrS2a3pW9Bj5BD9gCcts/dD+hfn4IPSWyIq4uLoMkvS+z7wYuusMSVJlqGHpTsfOE6FIuQVYZ45paZRKkI+m6TZRNpBA4oN2G2VtE5YQXstTmD5IaLQBRuCJ1IkGMHPdHnaPeGTcVrNvP0uypC+p5jFH9ULS3I5GnV/rcNwQNlFXb2dPMsITbgRe4QK8Er7UJHMXAAs/cqanxio32NfF8iH5ulCz88SUIxsK3Wa7iG+KJCsysGSMv+Hv9sKTW/BYpC0E1zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/u3pSiZD/7pSieXEnaC2XlYthp8+xOsbpEscLL9GKo=;
 b=QbvOdASH3zqC4XtWiAOCVSbIJURGOWU2w5M+Z0iZIapnDCOBhzsPPSplgJZ4sxaW7mrdijiyyBppddOLv6qVCLf6NU95akYMH20he6v/I/EnkAg4uivfWKKhqdnPwe9SIlu6Jh8xydYAqfL9Ye2NXRe+5IX2YJwyiIVVsN3x1x0=
Received: from DS7PR03CA0293.namprd03.prod.outlook.com (2603:10b6:5:3ad::28)
 by DM4PR12MB5722.namprd12.prod.outlook.com (2603:10b6:8:5d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 14 Aug
 2025 03:18:14 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:5:3ad:cafe::5e) by DS7PR03CA0293.outlook.office365.com
 (2603:10b6:5:3ad::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.16 via Frontend Transport; Thu,
 14 Aug 2025 03:18:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Thu, 14 Aug 2025 03:18:14 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Aug
 2025 22:18:13 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Aug
 2025 22:18:13 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Aug 2025 22:18:12 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 2/2] amdgpu/tests: Refactor amdgpu_sync_dependency_test
Date: Wed, 13 Aug 2025 23:18:07 -0400
Message-ID: <20250814031807.109119-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814031807.109119-1-vitaly.prosyak@amd.com>
References: <20250814031807.109119-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|DM4PR12MB5722:EE_
X-MS-Office365-Filtering-Correlation-Id: 4137ae37-9955-40b8-e805-08dddae134c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0VRU2VVano2TmZ1RWFCTXczMzBlR0U2eDFQRFlxdHdOSFRvS1BhNEl2QnRB?=
 =?utf-8?B?K21hQTQvbGRsMjNsSDFhMkJpZ1pZa29PbjI5cGYzN0pWZXlReXlqMUpteEdl?=
 =?utf-8?B?ajFvK2ZtNnUwdXFNeFlNS1lBdkZkd1NrVTBPdTY5SXMyT0tVUXdFdDQyK2Jr?=
 =?utf-8?B?T1c2ejBrck9OQW9FRWV0dkM4cEpBRTcxVUNGQWdtdjRCM2ZVd3VaZ2RNQi9L?=
 =?utf-8?B?by9DTmowbjVBTWZFVXR1ZVl5ZGRlTWNNNVg4eEVtOFNJemptbzdZS1Z2cmI5?=
 =?utf-8?B?M3hFMEJCSlBWMHV6THFtSXNGTURjUUhKczNPNEJPMjZOZXkzUWdoZWdTYjEw?=
 =?utf-8?B?K3k2bG43ckFxMGpJM1RXNWVTU0w3RmxTVGJzd0FPaC9tSGg5Um93K2tjamU0?=
 =?utf-8?B?TXVucjFINlUwam0yNUJmZEtQVVMvVW5OdVd4d1dnUjhtMTFlOUxhQWRuZFVG?=
 =?utf-8?B?MGpFRCtXQmtJM2tUb2c0UHRvaHdTZW5yaytrdzBtWXJRUG1kdFlpUXRCL0dY?=
 =?utf-8?B?eCtqN21Gc0sxV1hNRDVCak9MV3VzSU54RW5YMkVFRG1TUzZzN1BJZ01aY3Ev?=
 =?utf-8?B?Qlk5UW8xRmlnMUhZVmJuZHZxcHJ0ZWluYXFpdm01bmlScVZSRFRJMnJPMk81?=
 =?utf-8?B?OG1yenViTWtNZ3FSMms1c3g3WkZRTmU2NFNvTVc2MVlOMXhISXJyUytOazdX?=
 =?utf-8?B?ZGpqdkJYTzVBbDlGVkw0U3oySE85czJhNnJ6Z3dPMHFXQnU5U3ZvK0dFRGhn?=
 =?utf-8?B?c05KYURzT2Frbzd2WmFVa3Q5Q3NybUxyWFk5bERVYnJ6OFVLcmZISnNJOGVy?=
 =?utf-8?B?d1FHRXdRMHFjU0FPRXo0WVNNbHpsY0xVanYwRGx6Q2M2Y0lSZ1h0RGJFTzly?=
 =?utf-8?B?S1lZckVnOGNEbWlYdzdzTGQzMGU5VG04RmRkeVBkTEtLQnlOUDlSRDZwejZl?=
 =?utf-8?B?V3R5b1Vja2QxZEdmNGlvSVd6cUkwb0p2V0JLMXZ3OVpZZzVIOXpwTXp0ZFVC?=
 =?utf-8?B?NmJKWE43TmNaWjJnWHpRQVJhNGNNM2NUamZKTjFld294c1J5amlKVDhka3hj?=
 =?utf-8?B?T3ArRjZ2QkhyZmQwVzVuWGtvVkFRK25OMTVNcEoxNTZkUDN2ZDFwaWI1WW1W?=
 =?utf-8?B?bWJxOXVNREZCY1NPMkJqZkE2OFdyVEU3WnpyRUtpWUhxNTlVTFhCT1FLcVpC?=
 =?utf-8?B?UHNaNkZhczI1dVUzU2tXVEFJZHcwM0RsbVVQS1AwUWdpVVpHMkZFdnkzeThR?=
 =?utf-8?B?YkZuYkFHbjJPMVdNVlpSeTh4T1c4OGdOYzlUVVgyZHozRXF4Nk5GN2E1T0gz?=
 =?utf-8?B?UWw1VmR2bk9HdUVEVHNNeTlOSTRPdHQ1RUM5eHgvMlJ3dU5DeUd1bkhPaW5T?=
 =?utf-8?B?UGI4RjBIenNFaTdhMjY4ZE5xV2oyUERKc1RBVThPMmdmWUxMaHp4RTJyeUZG?=
 =?utf-8?B?Mmd1eFlKd3VpVmZjckFlL2lrTFZZN2o4cnFqT29nMUc3UFY1eUZDQUJxRjIx?=
 =?utf-8?B?a3NhK1hXb0VhckhqWlpSNVRXUVdWbmFBeU0wdjNYV25WNkFmUjZRVjhUOUN0?=
 =?utf-8?B?VUhDd3V2emFNSHRnTFZXSEMvdmlCWlZCZ1pKK3FLcXJiZWtmYmhMVXBCdG4z?=
 =?utf-8?B?UFYzeGt2VE5mbjJNaklDK0NDblJjd0hSUlljSTc4TFpFVFpEQ1hMcWJTQTIy?=
 =?utf-8?B?SE05UFBLM3hOY1QzRFNlV0NzNDNqME0rUFRlOHZ2UzlpUjV5WkpTQVFpSHdC?=
 =?utf-8?B?TzNURjVxWVBvTnA1TGJuYTk2dElEMTJST0IxUXZoRjgvQnNhNWo0MjRWd2gz?=
 =?utf-8?B?OXF0djg5dFoybzJtdTVkRS9MR0JnRXVyMHZKNlNoUitzc2FhV2pUdWVlalhs?=
 =?utf-8?B?MC9sQW5mSENvcVpNMVlqUUVjUFRYa2xiQVNqQWJtZjd2elhxL3o0Z2JTNXlE?=
 =?utf-8?B?dzh2WXJ4NitzTExjN3VReVVGcC9lUW9ZUzYrSS9EcVVkN2ZTVkR4czRXZy9Z?=
 =?utf-8?B?dldhRVlINTZyZ0lPRmZwK0VpTVRBaDlmNThYSDVnSWpDTFREaHM3SzdhTi9Z?=
 =?utf-8?Q?hEjpx8?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 03:18:14.3291 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4137ae37-9955-40b8-e805-08dddae134c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5722
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

Refactor amdgpu_sync_dependency_test() to call the new
amdgpu_ip_funcs hooks instead of inlining PACKET3 sequences.
The test now:
Uses f->gfx_program_compute(...) to program the minimal compute state.
Uses f->gfx_dispatch_direct(...) for a 1×1×1 grid (flags resolved per family).
Uses f->gfx_write_confirm(...)   to write the sentinel value (99) after the dispatch.
All buffer allocation, dependency wiring, and fence logic are unchanged.
This keeps the test focused on intent while delegating ASIC differences
(e.g., DISPATCH flags on gfx9/gfx10/gfx11, optional TMPRING programming)
to the per-family implementations added in the previous commit.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_basic.c | 68 ++++++++++------------------------------
 1 file changed, 16 insertions(+), 52 deletions(-)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 45cf64251..9bb84221e 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -551,53 +551,19 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle, bool user_queue)
 	/* assign cmd buffer */
 	base->attach_buf(base, ib_result_cpu, const_size);
 
+	/* program compute */
+	ip_block->funcs->gfx_program_compute(
+		ip_block->funcs,
+		base,
+		ib_result_mc_address + (uint64_t)code_offset * 4,
+		ib_result_mc_address + (uint64_t)data_offset * 4,
+		0x002c0040,
+		0x00000010,
+		1, 1, 1);
+
+	/* dispatch (flags chosen per-family in overrides) */
+	ip_block->funcs->gfx_dispatch_direct( ip_block->funcs, base, 1, 1, 1, 0);
 
-	base->emit(base, PACKET3(PKT3_CONTEXT_CONTROL, 1));
-	base->emit(base, 0x80000000);
-	base->emit(base, 0x80000000);
-
-	base->emit(base, PACKET3(PKT3_CLEAR_STATE, 0));
-	base->emit(base, 0x80000000);
-
-	/* Program compute regs */
-	/* TODO ASIC registers do based on predefined offsets */
-	base->emit(base, PACKET3(PKT3_SET_SH_REG, 2));
-	base->emit(base, ip_block->funcs->get_reg_offset(COMPUTE_PGM_LO));
-	base->emit(base, (ib_result_mc_address + code_offset * 4) >> 8);
-	base->emit(base, (ib_result_mc_address + code_offset * 4) >> 40);
-
-	base->emit(base, PACKET3(PKT3_SET_SH_REG, 2));
-	base->emit(base, ip_block->funcs->get_reg_offset(COMPUTE_PGM_RSRC1));
-
-	base->emit(base, 0x002c0040);
-	base->emit(base, 0x00000010);
-
-	base->emit(base, PACKET3(PKT3_SET_SH_REG, 1));
-	base->emit(base, ip_block->funcs->get_reg_offset(COMPUTE_TMPRING_SIZE));
-	base->emit(base, 0x00000100);
-
-	base->emit(base, PACKET3(PKT3_SET_SH_REG, 2));
-	base->emit(base, ip_block->funcs->get_reg_offset(COMPUTE_USER_DATA_0));
-	base->emit(base, 0xffffffff & (ib_result_mc_address + data_offset * 4));
-	base->emit(base, (0xffffffff00000000 & (ib_result_mc_address + data_offset * 4)) >> 32);
-
-	base->emit(base, PACKET3(PKT3_SET_SH_REG, 1));
-	base->emit(base, ip_block->funcs->get_reg_offset(COMPUTE_RESOURCE_LIMITS));
-	base->emit(base, 0);
-
-	base->emit(base, PACKET3(PKT3_SET_SH_REG, 3));
-	base->emit(base, ip_block->funcs->get_reg_offset(COMPUTE_NUM_THREAD_X));
-	base->emit(base, 1);
-	base->emit(base, 1);
-	base->emit(base, 1);
-
-	/* Dispatch */
-	base->emit(base, PACKET3(PACKET3_DISPATCH_DIRECT, 3));
-	base->emit(base, 1);
-	base->emit(base, 1);
-	base->emit(base, 1);
-	base->emit(base, 0x00000045);
-	base->emit_aligned(base, 7, GFX_COMPUTE_NOP);
 
 	memcpy(base->buf + code_offset, shader, size_bytes);
 
@@ -626,12 +592,10 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle, bool user_queue)
 
 	cdw_old = base->cdw;
 
-	base->emit(base, PACKET3(PACKET3_WRITE_DATA, 3));
-	base->emit(base, WRITE_DATA_DST_SEL(5) | WR_CONFIRM);
-	base->emit(base,  0xfffffffc & (ib_result_mc_address + data_offset * 4));
-	base->emit(base,  (0xffffffff00000000 & (ib_result_mc_address + data_offset * 4)) >> 32);
-	base->emit(base,  99);
-	base->emit_aligned(base, 7, GFX_COMPUTE_NOP);
+	/* confirmed write */
+	ip_block->funcs->gfx_write_confirm(
+		ip_block->funcs, base, ib_result_mc_address + (uint64_t)data_offset * 4,
+		99);
 
 	memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
 	ib_info.ib_mc_address = ib_result_mc_address + cdw_old * 4;
-- 
2.34.1

