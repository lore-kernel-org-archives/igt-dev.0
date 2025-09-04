Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A82CA1012
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 00:20:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8814F10E220;
	Thu,  4 Sep 2025 00:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nY31KOxR";
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2082.outbound.protection.outlook.com [40.107.96.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C5E10E21F
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 00:20:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IrB9GMoFTK2g8mU5TeqKXW3X3oKITyrBxAooj0qDCd4pZU9KIcRzE58LZQn8LUOX56LD75Ka1dr3bDm+B3mU2Y7MtWeAZKPo1rUSdXbrlS/pzGRxkhSWXsLOMyFCzTHj4XBT98sO6btikvVv3w6EII47QUXtJcaKwFWnpu8eHDrNSWBfvDSMrMP4MiFZbw7v3XpBv3BGLPeJNBEtvkSSOmlEcJ9FpPaRCeggY2T0KO3J2aE8M3eGdtDgdMtd/xoTsHQjEmRP9bK9ISM0zGr+GalOJhSsF1IUQ43dSj0M1flNqpO23ahatzhQt1IKfyW4TRiekhgXP2wL60MPOxz7HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecZd5pqkA5EcCSh7AOnduTyZjiXlhvgjsvKVyCUblMA=;
 b=lDxNbjT1dJBWqsg5HJejFILGdmcRrdRslzM4MuKYkKruEgF1l/TzSDMtaP6K0TOy0ZbdbCtny0dYOz3uHC36rxuIqfr9wIbK3wnwsT6N9x4YlBLTqh2CCjoUU8+J4R/OqpaGWnvlWn47AxyxXyb7hBr7nTrw5JCr0mRwYGe7ytwMRz2kKODqEd96QlrxMKrK1IcHh62QswhIkKn9HM1zzKOXZobygtBxxbxV7nJgnMOAjbSji37JK5m7indXKkTCkbOAv4Zr5g/Eg5symmh7UuqBb8AHtWlkp3K/U5ZKSm34zrOFJxNKGMl+U3A+L0tsbUIf1xYOYMic+FnHN/bq2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecZd5pqkA5EcCSh7AOnduTyZjiXlhvgjsvKVyCUblMA=;
 b=nY31KOxRxrc613UKOYfDYHjYnSejifZbxGAyqaeYuHVtY25sogzusXhSXY3tRSjk7IIjqizOzHJS1qma6LCSA+o+VvaYOMDYG3Zp9MTFuAOzB87EKP4Ry7Ty4nA4JwyMniifcd3mVymmDp0thwbObO2P0reHwemuhX0DNbhSbFE=
Received: from BY5PR17CA0020.namprd17.prod.outlook.com (2603:10b6:a03:1b8::33)
 by CH3PR12MB7618.namprd12.prod.outlook.com (2603:10b6:610:14c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Thu, 4 Sep
 2025 00:20:20 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::f9) by BY5PR17CA0020.outlook.office365.com
 (2603:10b6:a03:1b8::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Thu,
 4 Sep 2025 00:20:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 00:20:20 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 3 Sep
 2025 19:20:19 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 3 Sep
 2025 17:20:19 -0700
Received: from AB350-desktop.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 3 Sep 2025 19:20:19 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 1/2] lib/amdgpu: add hooks to hide PM4 packet creation for
 NOPs and WRITE_DATA
Date: Wed, 3 Sep 2025 20:20:11 -0400
Message-ID: <20250904002012.123970-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|CH3PR12MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: 21969a7e-9c11-4465-9d81-08ddeb48d515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXA1MHd0cFJ6bkgvWlJJUmNkTjh3QXFtalp5SXl0b3hLSFFaSktNZVFWVHpr?=
 =?utf-8?B?VHMvdmFXdTFRUFJBMVBCdFJkTWxmRUpBTUlwMnFOMVFGWHlHanFTa2RjWG1p?=
 =?utf-8?B?STlraE9maTROUGQ3eHZuTWxJUnhJRnBXU3I1c2RwajNTbTBOYk9TdnBGSU8x?=
 =?utf-8?B?MXdIVDFCek1jY1BPRyt2Q3UzTmYrQzFYSTNDWGlaZmlMc3pwMjcwNW40Rlll?=
 =?utf-8?B?WG5ySWlpSEdpKyt4S3MwNDhtZFpNMDMzeTVBbTBxUXBNRFh5Nzl6a1RhMGc0?=
 =?utf-8?B?V2l4ZGdQbzVDaWdlUE5SeEVaSlgwczBJVUhPZDNKckZ2ZEJLVzdjNkNwMlBy?=
 =?utf-8?B?OUxqTGNIRFZKZXloTE9Yb3NwSCtLVDNBZEh2YVk5V1AzUk1VdHFZbFM3dTZY?=
 =?utf-8?B?eWtUNi9janNQMU9zV3o3dU9ZVE1ObXhxVnVUTWFDV0EreWdCakU1WitMNDkr?=
 =?utf-8?B?aUV2YjlKaStIUXNSZXZFRmtzZDVxY1ZzOUtMYnAwaEFBdEdZa2xxZWEwMFN2?=
 =?utf-8?B?MUd1RmhuUHNDR1NRWUVaVlZFWFpmNS9tZC9rNGI2UVVjMGIza1FmSEp6UUc2?=
 =?utf-8?B?MkxYZlNScjI0Y2NmRVh5REZNU0xPcFI5OGx6VWZKUlQvVUhNMWVTc2wybzMw?=
 =?utf-8?B?eHFZem4ycFNqd3VUSHFFbjFtaGROWlNCWEFDVE8zNTU0RHhUS3d1czFKZTZQ?=
 =?utf-8?B?QnZkak5ON251Kzlsc3F4bENyaU9vdU1rSjVTeEYzSm45b1lJVHNrWEdxazAx?=
 =?utf-8?B?MXNCOTAzUjhURzRZdjlqQ2VEdVRkanV3TFAxUGFsNmdMdHNBRGtqUjhiU3F5?=
 =?utf-8?B?dWhYN242OHFVK2VqMUxoUkRlNW10amNIWjhOM3VMdDJqeVVWTS81ejR1YWxt?=
 =?utf-8?B?dUJPWSt0dURmVjFnRzNlU05ydWViZDJXZy93VUhnTG5hbmd0RnlFaFJ6WndU?=
 =?utf-8?B?bENINW1Gbmc1UzVObUM1YWdlZGc0TVJ5RE9DNGt4NG0zeWN0RktsNDJVTmRS?=
 =?utf-8?B?ME1hSitia21SNm9LQVJsL2taRzZrd1lQUHc1cWFBbjF5U0dMSTRqSC9Sc1l3?=
 =?utf-8?B?RkY0WHd0K0JkOW04L09ocGlrYnVFZTcyZ1BTajc1dUFlS0JnSzYwSnpOOVFZ?=
 =?utf-8?B?S0ZlVFVWdHdxcExtOXpFSWF4ekZmaitMKzAxWXMyOVFMN1k5WHk2bUxQTWJG?=
 =?utf-8?B?aVVnZHhsRjBXUitJZjlPSHpuQkJ4ZnpEWXoxQWs1cWgyYmUySU1uTmRrY1RQ?=
 =?utf-8?B?YmIyanQ0c1BZWWdiUCtRdUxDYUE4TWplT05sUTZvMFFTTmRQdm5hN096OFZo?=
 =?utf-8?B?dnJHM0ZkeDAveHQyRlc3V2N6Wm9UalVrcTZtdkRsZFJUbUhhMkhrbUNRejIv?=
 =?utf-8?B?eE9IaGx4TlVBQVdpTkN6ZEdITWNKVnJwb0FnUXRSeXpkd3hXMkNYMVB4Znlw?=
 =?utf-8?B?ekZSOGtLTzdkWlRjTEpDN3lZM290Sm82TnBKemZ3M0pqZFkwd3lKUUdMUGIv?=
 =?utf-8?B?VDFFRzU3ZVMraGEzOFQwMG5FbzhTbldBRkk2Z3JLRHppTlNaeVhzcXpOS2VR?=
 =?utf-8?B?cTRMdDZ0WWRYc3FORVJFdDdlczBRYWNHYytpeEpUaGxzU09zL1Z6QUQzVi9B?=
 =?utf-8?B?TVZKN0tqLzhIS0k2UUZOUE1QemtEcitkKzA3RDFvazV6dFlrcFZ5d1E5MHlT?=
 =?utf-8?B?K0lUeDU3dzhtT2NwOFFjaUw1dDRhMWlLTHJaMEpnV2t1SGhUTEV6WWp4MWtP?=
 =?utf-8?B?NGFldXBhdkt3ODRua1U3WnYybWF4Yis4V05mUnZaZXlDeThKeHhna3dvMndM?=
 =?utf-8?B?UURWUkQzR1lDN2g2NStiZHord2g3dWVIMk9WN0E3ZFpkK0wzMXo2aG43b0c4?=
 =?utf-8?B?MzJPUkZIV004NzJraFdZZklkTXhFbE9Sa1ppbEdpK1ZJWUNndDRSOXE5eUZG?=
 =?utf-8?B?blZ6RGdzK3d5N3YvUThPRHRDenpTMnpmTW5YQjEvbElUVFNyaEk5UVU3MU1L?=
 =?utf-8?B?ZzFpMGJobEtMS1RjbFpYTkRvcFphZVpBMzE3Ty9Id1J1aklIMjhRbEJzdFBC?=
 =?utf-8?Q?EKVtIV?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 00:20:20.0268 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21969a7e-9c11-4465-9d81-08ddeb48d515
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7618
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

Introduce two new ASIC-aware hooks on the amdgpu_ip_funcs layer so tests
can avoid hard-coding PM4 encodings:

  - gfx_emit_nops(base, count)
      Emits 'count' PACKET3 NOPs on the GFX ring. Useful for creating
      latency or spacing without exposing packet details to tests.

  - gfx_write_data_mem(funcs, base, engine_sel, dst_addr, value, wr_confirm)
      Emits a PACKET3 WRITE_DATA that targets a memory address, with an
      explicit engine selector (e.g., CE=2). This keeps engine/path
      selection and WR_CONFIRM handling in one place, ready for ASIC-
      specific overrides if encodings diverge in future families.

Default implementations are provided in amd_ip_blocks_ex.c and wired into
amd_ip_blocks_ex_init(). Families can override either hook if needed.

This aligns with prior refactors that moved register offsets and dispatch
programming behind amdgpu_ip_funcs, keeping the test code portable and
focused on intent rather than PM4 bitfields.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_command_submission.c | 144 ++++++++++++++++++++++++++++
 lib/amdgpu/amd_command_submission.h |   3 +
 lib/amdgpu/amd_ip_blocks.h          |  25 +++++
 lib/amdgpu/amd_ip_blocks_ex.c       |  33 +++++++
 4 files changed, 205 insertions(+)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 8b7236383..b5f20e929 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -690,3 +690,147 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 
 	free(ring_context);
 }
+
+/*
+ * Weak wrapper: use amdgpu_bo_cpu_cache_flush() if present (newer libdrm),
+ * otherwise act as a no-op to keep older libdrm builds working.
+ */
+extern int amdgpu_bo_cpu_cache_flush(amdgpu_bo_handle bo)
+	__attribute__((weak));
+
+static int local_bo_cpu_cache_flush(amdgpu_bo_handle bo)
+{
+	if (amdgpu_bo_cpu_cache_flush)
+		return amdgpu_bo_cpu_cache_flush(bo);
+	return 0;
+}
+
+void
+amdgpu_command_ce_write_fence(amdgpu_device_handle dev,
+					  amdgpu_context_handle ctx)
+{
+	int r;
+	const unsigned nop_dw = 256 * 1024;
+	const unsigned total_dw = nop_dw + 5;	/* NOPs + WRITE_DATA(5 DW) */
+	amdgpu_bo_handle dst_bo;
+	amdgpu_va_handle dst_va_handle;
+	uint64_t dst_mc_address;
+	uint32_t *dst_cpu;
+	amdgpu_bo_handle ib_bo;
+	amdgpu_va_handle ib_va_handle;
+	uint64_t ib_mc_address;
+	uint32_t *ib_cpu;
+	unsigned ib_size_bytes = total_dw * sizeof(uint32_t);
+	unsigned dw = 0;
+	bool do_cache_flush = true;
+	bool do_timing = true;
+	struct timespec ts_start;
+	uint64_t fence_delta_usec = 0, visible_delta_usec = 0;
+	struct amdgpu_cs_ib_info ib_info;
+	struct amdgpu_cs_request req;
+	struct amdgpu_cs_fence fence;
+	uint32_t expired = 0;
+	struct amdgpu_cmd_base *base = get_cmd_base();
+	const struct amdgpu_ip_block_version *ip_block =
+		get_ip_block(dev, AMD_IP_GFX);
+
+	/* destination buffer */
+	r = amdgpu_bo_alloc_and_map(dev, 4096, 4096,
+				    AMDGPU_GEM_DOMAIN_GTT, 0,
+				    &dst_bo, (void **)&dst_cpu,
+				    &dst_mc_address, &dst_va_handle);
+	igt_assert_eq(r, 0);
+	dst_cpu[0] = 0;
+	if (do_cache_flush) {
+		r = local_bo_cpu_cache_flush(dst_bo);
+		igt_assert_eq(r, 0);
+	}
+
+	/* command buffer (IB) */
+	r = amdgpu_bo_alloc_and_map(dev, ib_size_bytes, 4096,
+				    AMDGPU_GEM_DOMAIN_GTT, 0,
+				    &ib_bo, (void **)&ib_cpu,
+				    &ib_mc_address, &ib_va_handle);
+	igt_assert_eq(r, 0);
+
+	/* attach PM4 builder */
+	base->attach_buf(base, ib_cpu, ib_size_bytes);
+
+	/* large NOP train via hook */
+	ip_block->funcs->gfx_emit_nops(base, nop_dw);
+
+	/* CE WRITE_DATA (mem dst) via hook, write 0xdeadbeef to dst */
+	ip_block->funcs->gfx_write_data_mem(ip_block->funcs, base,
+					    2,			/* CE engine sel */
+					    dst_mc_address,
+					    0xdeadbeef,
+					    true);		/* WR_CONFIRM */
+
+	dw = base->cdw;
+	igt_assert_eq(dw, total_dw);
+
+	/* flush IB CPU caches if supported */
+	r = local_bo_cpu_cache_flush(ib_bo);
+	igt_assert_eq(r, 0);
+
+	/* submit CE IB */
+	memset(&ib_info, 0, sizeof(ib_info));
+	ib_info.ib_mc_address = ib_mc_address;
+	ib_info.size = dw;
+	ib_info.flags = AMDGPU_IB_FLAG_CE;
+
+	memset(&req, 0, sizeof(req));
+	req.ip_type = AMDGPU_HW_IP_GFX;
+	req.ring = 0;
+	req.number_of_ibs = 1;
+	req.ibs = &ib_info;
+	req.resources = NULL;
+	req.fence_info.handle = NULL;
+
+	if (do_timing)
+		igt_gettime(&ts_start);
+
+	r = amdgpu_cs_submit(ctx, 0, &req, 1);
+	igt_assert_eq(r, 0);
+
+	/* wait fence */
+	memset(&fence, 0, sizeof(fence));
+	fence.context = ctx;
+	fence.ip_type = req.ip_type;
+	fence.ip_instance = 0;
+	fence.ring = req.ring;
+	fence.fence = req.seq_no;
+	r = amdgpu_cs_query_fence_status(&fence,
+					 AMDGPU_TIMEOUT_INFINITE, 0, &expired);
+	igt_assert_eq(r, 0);
+	igt_assert(expired);
+	if (do_timing)
+		fence_delta_usec = igt_nsec_elapsed(&ts_start) / 1000;
+
+	/* poll until visible */
+	for (;;) {
+		if (do_cache_flush) {
+			r = local_bo_cpu_cache_flush(dst_bo);
+			igt_assert_eq(r, 0);
+		}
+		if (dst_cpu[0] == 0xdeadbeef) {
+			if (do_timing)
+				visible_delta_usec = igt_nsec_elapsed(&ts_start) / 1000;
+			break;
+		}
+		usleep(1000);
+	}
+
+	if (do_timing) {
+		igt_info("ce-write-fence: visible after %llu us (fence) and %llu us total\n",
+			 (unsigned long long)fence_delta_usec,
+			 (unsigned long long)visible_delta_usec);
+	}
+
+	igt_assert_eq(dst_cpu[0], 0xdeadbeef);
+
+	amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address, ib_size_bytes);
+	amdgpu_bo_unmap_and_free(dst_bo, dst_va_handle, dst_mc_address, 4096);
+	free_cmd_base(base);
+}
+
diff --git a/lib/amdgpu/amd_command_submission.h b/lib/amdgpu/amd_command_submission.h
index abbae2ff3..8b090359a 100644
--- a/lib/amdgpu/amd_command_submission.h
+++ b/lib/amdgpu/amd_command_submission.h
@@ -46,4 +46,7 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 						 const struct amdgpu_ip_block_version *ip_block,
 						 bool user_queue);
+
+void  amdgpu_command_ce_write_fence(amdgpu_device_handle dev,
+					  amdgpu_context_handle ctx);
 #endif
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 7154b45ba..d9775fda0 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -258,6 +258,31 @@ struct amdgpu_ip_funcs {
 		struct amdgpu_cmd_base *base,
 		uint64_t dst_addr, uint32_t value
 	);
+
+	/* Emit 'count' PACKET3 NOPs on the GFX ring. */
+	void (*gfx_emit_nops)(
+		struct amdgpu_cmd_base *base,
+		uint32_t count
+	);
+
+	/*
+	 * Emit a PACKET3 WRITE_DATA targeting a memory address.
+	 *
+	 * @engine_sel: engine selection per packet encoding
+	 *              (e.g., ME=0, PFP=1, CE=2, MEC=3 when applicable)
+	 * @dst_addr:   destination GPU address (64-bit)
+	 * @value:      32-bit value to write
+	 * @wr_confirm: whether to set WR_CONFIRM in the packet
+	 */
+	void (*gfx_write_data_mem)(
+		const struct amdgpu_ip_funcs *funcs,
+		struct amdgpu_cmd_base *base,
+		uint32_t engine_sel,
+		uint64_t dst_addr,
+		uint32_t value,
+		bool wr_confirm
+	);
+
 };
 
 extern const struct amdgpu_ip_block_version gfx_v6_0_ip_block;
diff --git a/lib/amdgpu/amd_ip_blocks_ex.c b/lib/amdgpu/amd_ip_blocks_ex.c
index aab9a2a4a..b3b708507 100644
--- a/lib/amdgpu/amd_ip_blocks_ex.c
+++ b/lib/amdgpu/amd_ip_blocks_ex.c
@@ -4,6 +4,7 @@
  */
 
 #include <stdint.h>
+#include "ioctl_wrappers.h"
 #include "amd_ip_blocks.h"
 #include "amd_PM4.h"
 #include "amdgpu_asic_addr.h"
@@ -186,11 +187,43 @@ static void gfx_dispatch_direct_gfx11(
 	gfx_dispatch_direct_default(f, base, gx, gy, gz, 0x00000045);
 }
 
+static void gfx_emit_nops_default(struct amdgpu_cmd_base *base, uint32_t count)
+{
+	uint32_t i;
+
+	for (i = 0; i < count; i++)
+		base->emit(base, PACKET3(PACKET3_NOP, 0));
+}
+
+static void gfx_write_data_mem_default(
+	const struct amdgpu_ip_funcs *funcs,
+	struct amdgpu_cmd_base *base,
+	uint32_t engine_sel,
+	uint64_t dst_addr,
+	uint32_t value,
+	bool wr_confirm)
+{
+	uint32_t flags = WRITE_DATA_DST_SEL(5);	/* memory address */
+
+	flags |= WRITE_DATA_ENGINE_SEL(engine_sel);
+	if (wr_confirm)
+		flags |= WR_CONFIRM;
+
+	base->emit(base, PACKET3(PACKET3_WRITE_DATA, 3));
+	base->emit(base, flags);
+	base->emit(base, lower_32_bits(dst_addr));
+	base->emit(base, upper_32_bits(dst_addr));
+	base->emit(base, value);
+}
+
+
 void amd_ip_blocks_ex_init(struct amdgpu_ip_funcs *funcs)
 {
 	funcs->gfx_program_compute = gfx_program_compute_default;
 	funcs->gfx_dispatch_direct = gfx_dispatch_direct_default;
 	funcs->gfx_write_confirm = gfx_write_confirm_default;
+	funcs->gfx_emit_nops = gfx_emit_nops_default;
+	funcs->gfx_write_data_mem = gfx_write_data_mem_default;
 
 	switch (funcs->family_id) {
 	case AMDGPU_FAMILY_RV:
-- 
2.34.1

