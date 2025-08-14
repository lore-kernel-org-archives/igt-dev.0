Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3971CC87FCF
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 03:18:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1A510E0E5;
	Thu, 14 Aug 2025 03:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a1R37wGd";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF2010E0E5
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 03:18:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fnmN961kjzOIwIGFrzA/YvjN+Z3LsJ+xGsxvejjZS39ThapVV8weKfBlR4W1pxwu7bYDfEB5djjmh7OAp3/eWZzMaWBQgTMO5NFYFLDrrNN4VHmJnp6+hNUDZbhKznCVTDE6Af9HWjmqhVTDskcX+CvAkOnRv1Q/WCMsbPHftj0EBU6nWzm79XCj+jyGyFv5fAvbL8679VRqTVkn395yLGOiC0zKWHEB2Au6jKswwBKCzpcAHe7lDlhAWydJjri+uEWW1cXotaYHgUTThmZrYgHl+/JuxtRgtoLi9faAU1JDOQYR9mEYthOYPsQ6sLJiuQro6R67UnTV0zbiryfTsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLXq1aS0f+i3Z8kjfqicjhChTHU+DxTgaIEpd+v5Mm0=;
 b=QJUKYcMHlAptZwyrZj9ZZTVoJZ/pZZJ+MO6VPFAy63tAvfJF8nyUigtMPd9MA+4+v0H6ktTeBAuI1xHtHxFLHXlPlQM6cI09FgCv1XpS/QkcXpyciHz43bairrhje7PMJTa4m22n7NDx2BVIYmOHXU+ULguPhkKHWl9+0jLMxwdhvYg1sXD0MPyZ3VKJmDdmqDe41WBvqWXV572WVznlBxrmL6efHHfjmPQzp7qr69nG/S8PTEsewpmgcWQHMdLLEtJSm3S5FeErjzIxBufkXTP9+Q1zum74qB/MwlSTAJ5Uttba8sOfQcsW1NkDjAExBw/Ii8Q0FP/iBNbcagGgXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLXq1aS0f+i3Z8kjfqicjhChTHU+DxTgaIEpd+v5Mm0=;
 b=a1R37wGd2W2jOiWJ/eTZpcwPeCgbn9asbXgc6s2fcxu3SKRJ4J4t2sApVkwYQwEIOH60QkTlgI6Icc18IjFLw6uao8e45vMriK3UPnU4zl4eKabb1OoasfYJFsfCyaJQWJEgCHorT/Qy0LZfXO1AcmueYqK/4SZuXgIzwnN+RQc=
Received: from DS7PR03CA0278.namprd03.prod.outlook.com (2603:10b6:5:3ad::13)
 by IA1PR12MB6627.namprd12.prod.outlook.com (2603:10b6:208:3a1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 14 Aug
 2025 03:18:14 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:5:3ad:cafe::2f) by DS7PR03CA0278.outlook.office365.com
 (2603:10b6:5:3ad::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.16 via Frontend Transport; Thu,
 14 Aug 2025 03:18:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Thu, 14 Aug 2025 03:18:13 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Aug
 2025 22:18:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 13 Aug
 2025 20:18:12 -0700
Received: from AB350-desktop.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Aug 2025 22:18:12 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 1/2] lib/amdgpu: add ASIC-aware gfx hooks and introduce
 amd_ip_blocks_ex
Date: Wed, 13 Aug 2025 23:18:06 -0400
Message-ID: <20250814031807.109119-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|IA1PR12MB6627:EE_
X-MS-Office365-Filtering-Correlation-Id: 851155b3-d041-49d3-806c-08dddae1341f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K29LeWFHNFlXcElHNUUzbzdJdEw3YzZHWVJ2eGNqVWFJQTZwaFJYc2hKZ2JR?=
 =?utf-8?B?WDdHWis2MlU0V2dMTTdCRnU0ZGxQdUgzb0lFYS9uTWFkSytqS2cvUEdCaFdQ?=
 =?utf-8?B?TmxQdDB0ckIxaHp0UXpWdmtnS3B3MlllNlNhSE83UVV0aWJvNlU4UWZGN0Uy?=
 =?utf-8?B?MHoycFJWK3dHZ0thM0c5WmxaRmpURU9uUEpVQ2FMcHNudWlnVmVZYnV4bGlk?=
 =?utf-8?B?ZkdDUmtZZmpXM1d3R3gwZ1dELzU2d0JFOUFvcERiL0d4clFRSzBnWnB5R3Mx?=
 =?utf-8?B?YWtjRVR0c0k1MXVlbTROMzUrczVYWlZYRmpKTGhtRFo1bDJ3eVNLY3dSUWlt?=
 =?utf-8?B?ck5hZk5SZExZZlpVYkJyelB3TlVKUTVHTlpsRmJIemVjcmRsbGkyMUJaOHR3?=
 =?utf-8?B?Ty9JclBTZXlUKzhqNytVRnhtMk80WDRNdXk2NUc1bkJDZUFxKzNMSWhJbFBJ?=
 =?utf-8?B?dmRkSm1JUyt2ZXZtenNsdDRFb29TU2pFa1o2UlVRWUdKaEgxOHUwWHFxc2xJ?=
 =?utf-8?B?Q2s3Y3VBOTVnK1FwR1B6Mkp5WGJPdzZXY00rZnhpWHpIR2hNUm1JTGNaeEw2?=
 =?utf-8?B?bnJrS0dHS2J0YXF5ajRucWtpcVRkVTBXS254bUxVL1ZiQVlrb3ZzKzlUcjhp?=
 =?utf-8?B?VWliYkhoQkZBM1N0eFZTUTFneHhkcmEvWlB5UEdaTFJCSmJSR21uWTJWY3lK?=
 =?utf-8?B?cVc4V1FvNm9lREs0Vm5UOUwxalFnZ0JlY0lzMzM5am5JSEMwbFRZSWRMaXlu?=
 =?utf-8?B?SzZldDFESy85d1prbVV1VUF5L0s3a1FFNzl0SUxHOVJqZGRNMk4wdC8vMy8z?=
 =?utf-8?B?YS9FNUU1c3FFenJtVjl5bVlmU1hDTnpSNVoyUXJrYnlxREZqcjRtdnU5eVZU?=
 =?utf-8?B?MDRpTGRiTjhNb1ZGb3JSTStDRVVsWS9MNWp4YUlVUU1JMHRxUDlRVHhaZUZL?=
 =?utf-8?B?dGRBT1lkN1BJajA0eDB4LzVDU0ttU1hqbVJJc3MyclppZE9DVDF3NjFuMmJp?=
 =?utf-8?B?YVF1cS9nL1ZISlhHVDdvMVF6VlRray94VWp3d3pBQWlsWm5oSzhydDIxTXlV?=
 =?utf-8?B?aVJkcFl0WWs0VmRLWDdKeWVqbGxZek5IdkNLME9iamJCMzNpOU45bEJIRlFj?=
 =?utf-8?B?QlUza3hxWmRlbUo0cnYvYkhFdnd3V1JPNXlWRXgyTytEYWcxSjJrY29QR3Fv?=
 =?utf-8?B?N0pEQk9XQjNHMkx1cGNSNWNaTmdpUHpZbkx6bHNvQmhsUjB4bkptRHNTVmFW?=
 =?utf-8?B?VFJOUkd3cERDbytUVGVvMjgzdTJRSFd6WDRndGg4VTNIVlQxTEczSGdwTEJL?=
 =?utf-8?B?ZXVrS0E4VFhvck80NmNyOXRKWXY0b1I4cWFiQkJwNktvQS9hY3ZKMkNUOTcx?=
 =?utf-8?B?WmdvN0dqNkJ3aHQvQlI4MUpsUCtpeGRuUDJkZWdVU1VtZ25pSVliVFVjR1NY?=
 =?utf-8?B?dXRMaVBoRkh2TXcrdi9RRGJiMUxQbk9TcDZqTTFiNDRNR2JONEFTUkd2RW5H?=
 =?utf-8?B?Q3ZIWi8vaXJ1NXpUT3h2TjlzenpZcVZsbFFmSCtjY2FGQm9ZN2tDYWJPOXh2?=
 =?utf-8?B?bmVNeC9YQ00yd1lGZTY2OXA5clBQaVI3T0hwdEdsbzhHYjBZVmREcFBSMjVY?=
 =?utf-8?B?QUxZZ3ZGbzJib2drUlFuVEg3eEVKS3RHODRmcDJkV3pMbFF0OWVVdFZHSDI1?=
 =?utf-8?B?dWNlMzRMc2Nvc0J5YWU4dkRicDkyYVRuUnA5U0J5OGQyUURFNnlObGFLQ1JF?=
 =?utf-8?B?dm9FWEtLTTRBcU55SnlWUW5xQzUrSWNBdUxJR0x6NjIzMFBwRlpIWUU2VGw4?=
 =?utf-8?B?TlJOUUR0a212aTJpMmt3UHlpTGZLZzE2K3RMekVUb1VNNDFVSjlYTm9EdUh1?=
 =?utf-8?B?bzNmTHJEMDZLREZZcmozWkFseGU1Vm0waHpVYnIvRk5xT3I5RmVMeHRLRGxU?=
 =?utf-8?B?WFJJVWhDcVlucHorYVRkVVNKSktHektLYldNSE1WTkxXYlViZit1UHNNMW5Y?=
 =?utf-8?B?WXJOZ2s0cU5XNi9zeThOTUh2cDBwRkExWWF2TmFaUWFNK2V1QXNnNkxpbE4v?=
 =?utf-8?Q?BR/ar6?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 03:18:13.2578 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 851155b3-d041-49d3-806c-08dddae1341f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6627
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

add ASIC-aware gfx hooks; introduce amd_ip_blocks_ex.c and initialize
from amd_ip_blocks.c The amdgpu IGT test suite currently hard-codes
PACKET3 programming for basic compute bring-up (state setup,
DISPATCH_DIRECT, and WR_CONFIRM write). Those sequences vary by GFX
family (e.g., dispatch flags, TMPRING handling), so baking them into
tests makes the code brittle and difficult to extend to new ASICs.

This change introduces three small, ASIC-aware helpers on
the amdgpu_ip_funcs table:
gfx_program_compute(...) – programs a minimal compute pipeline (PGM pointers,
                           resources, user data, thread dims).
gfx_dispatch_direct(...) – emits a direct compute dispatch (family-specific
                           tail flags handled inside).
gfx_write_confirm(...)   – emits a confirmed WRITE_DATA to memory for simple
                            dependency validation.

Implementations live in a lib/amdgpu/amd_ip_blocks_ex.c, which provides
safe defaults  and light per-family overrides (gfx9/gfx10/gfx11). We
keep all ASIC knowledge in  the ASIC layer (amdgpu_ip_funcs) rather
than polluting the generic PM4 builder (amdgpu_cmd_base), which remains
a packet emitter (attach/emit helpers only).

amd_ip_blocks.c now calls amd_ip_blocks_ex_init() after populating the
device’s amdgpu_ip_funcs, so callers get the correct per-family
hooks without changing their code paths.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c    |   7 ++
 lib/amdgpu/amd_ip_blocks.h    |  31 ++++++
 lib/amdgpu/amd_ip_blocks_ex.c | 181 ++++++++++++++++++++++++++++++++++
 lib/meson.build               |   1 +
 4 files changed, 220 insertions(+)
 create mode 100644 lib/amdgpu/amd_ip_blocks_ex.c

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 80cd89f7c..d8d7efbef 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -1031,6 +1031,13 @@ amdgpu_device_ip_block_add(struct amdgpu_ip_block_version *ip_block_version)
 
 	amdgpu_ips.ip_blocks[amdgpu_ips.num_ip_blocks++] = ip_block_version;
 
+	if (ip_block_version->funcs &&
+		(!ip_block_version->funcs->gfx_program_compute ||
+		 !ip_block_version->funcs->gfx_dispatch_direct ||
+		 !ip_block_version->funcs->gfx_write_confirm )) {
+		amd_ip_blocks_ex_init(ip_block_version->funcs);
+	}
+
 	return 0;
 }
 
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index b5731e13b..7154b45ba 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -206,6 +206,7 @@ struct amdgpu_ring_context {
 	struct drm_amdgpu_info_uq_fw_areas info;
 };
 
+struct amdgpu_cmd_base;
 
 struct amdgpu_ip_funcs {
 	uint32_t	family_id;
@@ -231,6 +232,32 @@ struct amdgpu_ip_funcs {
 	void (*userq_create)(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt, unsigned int type);
 	void (*userq_submit)(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context, unsigned int ip_type, uint64_t mc_address);
 	void (*userq_destroy)(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt, unsigned int type);
+
+	/* program minimal compute pipeline for a raw PM4 launch */
+	void (*gfx_program_compute)(
+		const struct amdgpu_ip_funcs *funcs,
+		struct amdgpu_cmd_base *base,
+		uint64_t code_addr,
+		uint64_t user_data0_addr,
+		uint32_t rsrc1_dw,
+		uint32_t rsrc2_or_tmp,
+		uint32_t thr_x, uint32_t thr_y, uint32_t thr_z
+	);
+
+	/* launch a direct dispatch (grid + family flags) */
+	void (*gfx_dispatch_direct)(
+		const struct amdgpu_ip_funcs *funcs,
+		struct amdgpu_cmd_base *base,
+		uint32_t grid_x, uint32_t grid_y, uint32_t grid_z,
+		uint32_t flags
+	);
+
+	/* WRITE_DATA with WR_CONFIRM (or family equivalent) */
+	void (*gfx_write_confirm)(
+		const struct amdgpu_ip_funcs *funcs,
+		struct amdgpu_cmd_base *base,
+		uint64_t dst_addr, uint32_t value
+	);
 };
 
 extern const struct amdgpu_ip_block_version gfx_v6_0_ip_block;
@@ -320,4 +347,8 @@ amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle device_handle, unsigned int size
 int
 amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
 				 uint32_t timeline_syncobj_handle, uint64_t point);
+
+void
+amd_ip_blocks_ex_init(struct amdgpu_ip_funcs *funcs);
+
 #endif
diff --git a/lib/amdgpu/amd_ip_blocks_ex.c b/lib/amdgpu/amd_ip_blocks_ex.c
new file mode 100644
index 000000000..21c4d952c
--- /dev/null
+++ b/lib/amdgpu/amd_ip_blocks_ex.c
@@ -0,0 +1,181 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2025 Advanced Micro Devices, Inc.
+ */
+
+#include <stdint.h>
+#include "amd_ip_blocks.h"
+#include "amd_PM4.h"
+#include "amdgpu_asic_addr.h"
+
+static void gfx_program_compute_default(
+	const struct amdgpu_ip_funcs *f,
+	struct amdgpu_cmd_base *base,
+	uint64_t code_addr,
+	uint64_t user_data0_addr,
+	uint32_t rsrc1_dw,
+	uint32_t rsrc2_or_tmp,
+	uint32_t thr_x, uint32_t thr_y, uint32_t thr_z)
+{
+	base->emit(base, PACKET3(PKT3_CONTEXT_CONTROL, 1));
+	base->emit(base, 0x80000000);
+	base->emit(base, 0x80000000);
+
+	base->emit(base, PACKET3(PKT3_CLEAR_STATE, 0));
+	base->emit(base, 0x80000000);
+
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 2));
+	base->emit(base, f->get_reg_offset(COMPUTE_PGM_LO));
+	base->emit(base, (uint32_t)(code_addr >> 8));
+	base->emit(base, (uint32_t)(code_addr >> 40));
+
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 2));
+	base->emit(base, f->get_reg_offset(COMPUTE_PGM_RSRC1));
+	base->emit(base, rsrc1_dw);
+	base->emit(base, rsrc2_or_tmp);
+
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 1));
+	base->emit(base, f->get_reg_offset(COMPUTE_TMPRING_SIZE));
+	base->emit(base, 0x00000100);
+
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 2));
+	base->emit(base, f->get_reg_offset(COMPUTE_USER_DATA_0));
+	base->emit(base, (uint32_t)user_data0_addr);
+	base->emit(base, (uint32_t)(user_data0_addr >> 32));
+
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 1));
+	base->emit(base, f->get_reg_offset(COMPUTE_RESOURCE_LIMITS));
+	base->emit(base, 0);
+
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 3));
+	base->emit(base, f->get_reg_offset(COMPUTE_NUM_THREAD_X));
+	base->emit(base, thr_x);
+	base->emit(base, thr_y);
+	base->emit(base, thr_z);
+}
+
+static void gfx_dispatch_direct_default(
+	const struct amdgpu_ip_funcs *f,
+	struct amdgpu_cmd_base *base,
+	uint32_t gx, uint32_t gy, uint32_t gz,
+	uint32_t flags)
+{
+	base->emit(base, PACKET3(PACKET3_DISPATCH_DIRECT, 3));
+	base->emit(base, gx);
+	base->emit(base, gy);
+	base->emit(base, gz);
+	base->emit(base, flags);
+	base->emit_aligned(base, 7, GFX_COMPUTE_NOP);
+}
+
+static void gfx_write_confirm_default(
+	const struct amdgpu_ip_funcs *f,
+	struct amdgpu_cmd_base *base,
+	uint64_t dst, uint32_t val)
+{
+	base->emit(base, PACKET3(PACKET3_WRITE_DATA, 3));
+	base->emit(base, WRITE_DATA_DST_SEL(5) | WR_CONFIRM);
+	base->emit(base, (uint32_t)dst);
+	base->emit(base, (uint32_t)(dst >> 32));
+	base->emit(base, val);
+	base->emit_aligned(base, 7, GFX_COMPUTE_NOP);
+}
+
+static void gfx_dispatch_direct_gfx9(
+	const struct amdgpu_ip_funcs *f,
+	struct amdgpu_cmd_base *base,
+	uint32_t gx, uint32_t gy, uint32_t gz,
+	uint32_t flags_unused)
+{
+	gfx_dispatch_direct_default(f, base, gx, gy, gz, 0x00000000);
+}
+
+static void gfx_dispatch_direct_gfx10(
+	const struct amdgpu_ip_funcs *f,
+	struct amdgpu_cmd_base *base,
+	uint32_t gx, uint32_t gy, uint32_t gz,
+	uint32_t flags_unused)
+{
+	gfx_dispatch_direct_default(f, base, gx, gy, gz, 0x00000045);
+}
+
+static void gfx_program_compute_gfx11(
+	const struct amdgpu_ip_funcs *f,
+	struct amdgpu_cmd_base *base,
+	uint64_t code, uint64_t udata0,
+	uint32_t rsrc1, uint32_t rsrc2,
+	uint32_t tx, uint32_t ty, uint32_t tz)
+{
+	base->emit(base, PACKET3(PKT3_CONTEXT_CONTROL, 1));
+	base->emit(base, 0x80000000);
+	base->emit(base, 0x80000000);
+
+	base->emit(base, PACKET3(PKT3_CLEAR_STATE, 0));
+	base->emit(base, 0x80000000);
+
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 2));
+	base->emit(base, f->get_reg_offset(COMPUTE_PGM_LO));
+	base->emit(base, (uint32_t)(code >> 8));
+	base->emit(base, (uint32_t)(code >> 40));
+
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 2));
+	base->emit(base, f->get_reg_offset(COMPUTE_PGM_RSRC1));
+	base->emit(base, rsrc1);
+	base->emit(base, rsrc2);
+
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 2));
+	base->emit(base, f->get_reg_offset(COMPUTE_USER_DATA_0));
+	base->emit(base, (uint32_t)udata0);
+	base->emit(base, (uint32_t)(udata0 >> 32));
+
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 1));
+	base->emit(base, f->get_reg_offset(COMPUTE_RESOURCE_LIMITS));
+	base->emit(base, 0);
+
+	base->emit(base, PACKET3(PKT3_SET_SH_REG, 3));
+	base->emit(base, f->get_reg_offset(COMPUTE_NUM_THREAD_X));
+	base->emit(base, tx);
+	base->emit(base, ty);
+	base->emit(base, tz);
+}
+
+static void gfx_dispatch_direct_gfx11(
+	const struct amdgpu_ip_funcs *f,
+	struct amdgpu_cmd_base *base,
+	uint32_t gx, uint32_t gy, uint32_t gz,
+	uint32_t flags_unused)
+{
+	gfx_dispatch_direct_default(f, base, gx, gy, gz, 0x00000045);
+}
+
+void amd_ip_blocks_ex_init(struct amdgpu_ip_funcs *funcs)
+{
+	funcs->gfx_program_compute = gfx_program_compute_default;
+	funcs->gfx_dispatch_direct = gfx_dispatch_direct_default;
+	funcs->gfx_write_confirm = gfx_write_confirm_default;
+
+	switch (funcs->family_id) {
+	case AMDGPU_FAMILY_RV:
+	case AMDGPU_FAMILY_NV:
+	case AMDGPU_FAMILY_VGH:
+		funcs->gfx_dispatch_direct = gfx_dispatch_direct_gfx9;
+		break;
+	case AMDGPU_FAMILY_YC:
+	case AMDGPU_FAMILY_GC_10_3_6:
+	case AMDGPU_FAMILY_GC_10_3_7:
+		funcs->gfx_dispatch_direct = gfx_dispatch_direct_gfx10;
+		break;
+	case AMDGPU_FAMILY_GC_11_0_0:
+	case AMDGPU_FAMILY_GC_11_0_1:
+	case AMDGPU_FAMILY_GC_11_5_0:
+		funcs->gfx_program_compute = gfx_program_compute_gfx11;
+		funcs->gfx_dispatch_direct = gfx_dispatch_direct_gfx11;
+		break;
+	case AMDGPU_FAMILY_GC_12_0_0:
+		/*TODO*/
+		break;
+	default:
+		break;
+	}
+}
+
diff --git a/lib/meson.build b/lib/meson.build
index 2eaca42a4..f078dad4e 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -160,6 +160,7 @@ if libdrm_amdgpu.found()
 		'amdgpu/amd_cs_radv.c',
 		'amdgpu/amd_gfx.c',
 		'amdgpu/amd_ip_blocks.c',
+		'amdgpu/amd_ip_blocks_ex.c',
 		'amdgpu/amd_shaders.c',
 		'amdgpu/amd_gfx_v8_0.c',
 		'amdgpu/amd_gfx_v9_0.c',
-- 
2.34.1

