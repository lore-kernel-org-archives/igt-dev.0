Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0840CD5BC9
	for <igt-dev@archiver.kernel.org>; Thu, 28 May 2026 01:42:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420BC10EB3E;
	Thu, 28 May 2026 01:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2k/1IdcB";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010053.outbound.protection.outlook.com
 [40.93.198.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F016910EB3E
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2026 01:41:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ogv6edjgS7/Wsw7PWvwYSpxUBuAtZO8bBFmxxixTZKy1Oy4vPU40Vzrr0Vs5w4TdVkYD872zwQ5c4Uqbqw0JLYpok6MAJTols2u2N09/tUUt58j5UF5C8AkVExIdPOqK4zB/JA9yuErVuYScm/LVEjc2alAou7qVKWxMqlyOlmetz8nfn4AooIDZrgykgLgw4xNxtzILU2h6dPFh0a5kw1Xwgvy2mXVqR8F8kTMbD2UoI5MxzYxiyJkcbYzpfLqnlz5SFl+unJVyNPuP8CcWpi9Od+1iC1hK/9ffplUwf7q6LVldgaNbGqIZsR7/Ijrb6Qd13Hx9bzGf94kg1ggscw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGNWx3tBC9UpOMY+fGYtWVOh8ITENrZS5WNdPo20n7M=;
 b=Lj44MWI6FT000uIgG+l2m/eTeAvfetXFLgcpuxGVamaSFXP2WSYlWR74yrXvZd47m+Utfw+tQuNQz6+gbUfcUHMAladvNpw8WyF2gPD9JB/TgkpYYwUWkhMwCpq0oZGyd3WerCHcowYh7fzgdTZL2GxANz9rseWZbols0p4i6cvCITzIW0M9hEy5mecRKmf0G0jkn/8oyVEKltdp+LWeZ3k9iYrDeXv3UbJ/SQ3ofKX12WZyrWVTNW1fD52Ea6RCOBxtOEQxudbnujxv6yvq9V1Ao4kGwUWwjRNzntVUFLYgD5QNktRR2uP3FGGMsVAsRy8QOstuAhGrOjnACrasVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGNWx3tBC9UpOMY+fGYtWVOh8ITENrZS5WNdPo20n7M=;
 b=2k/1IdcBUYCf+AIxFBlQFSLTZORwDjbNd3yuuy/X1sJE9rRM0xlmsvTz3l9VzvPo6VcBek+1gfeFy8qlvJUVyjArrhXpk+nJSjzR7IrGFwnN2CGrAF5iavT8keC4WZG9af8bEd5+hb+8vjv1BRQeht/jQ8hTli4kwz2R+zrDvK0=
Received: from MW4PR03CA0349.namprd03.prod.outlook.com (2603:10b6:303:dc::24)
 by DS0PR12MB8245.namprd12.prod.outlook.com (2603:10b6:8:f2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 01:41:40 +0000
Received: from CO1PEPF00012E65.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::1) by MW4PR03CA0349.outlook.office365.com
 (2603:10b6:303:dc::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Thu, 28
 May 2026 01:41:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E65.mail.protection.outlook.com (10.167.249.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 01:41:39 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 20:41:37 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 20:41:37 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 27 May 2026 20:41:36 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] tests/amdgpu/amd_close_race: set VM_PAGE_EXECUTABLE
 unconditionally
Date: Wed, 27 May 2026 21:41:07 -0400
Message-ID: <20260528014129.114452-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E65:EE_|DS0PR12MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: 793d3bd3-c4cf-4a90-2741-08debc5a4381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700016|11063799006|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: I5skPBp1fzcw5S0tPEgcz2KYOvXwXRaXzk/5Sm4Fbqf8i1E41JxoI4QUr/eZzcNAlMNeknrpYaOIeF4JaBs8JCPUULyiTJYgGph76ptwtdb64FwiizIgX2+TCyTPb+ap1ApFGInPXXuOxENtWc1G+qqq9zeYVKMv6+6y9dAhf8js0KK5OjDlQ1zD6EsY3EE5OapUjrXM0rnLfXkYwWbiuSjT44VGBbiM9mzkU+hjadsBQNw/d7lWUf8sRoTZfmfN7UDAJqWclj/0TOgNW/3fcxh/OcFy5XPyyXktQ6fNxHUBcmG119V2RgKufcW730wSOLrTKOwdNnMZscZQYnaB7FBhVZRqi6Qcrwn6+6yZbNE3IpABXU96XA2WPLdkG86JVSVHCdINT59WUj8A7yhhHvEov7IeSdWu0qe20avNqG38aU85aLUcrYNd62xt4AoIzNjyrVQ1VFZbaEAmhuE8ClIQmzvdBencsgjmPWz0Ho6EdGRk1wiuTTfq/uFfPgNvgyU4/Z6n9jjnliUb5HsorySMR3IF/32LF7jcnkrB3loHhmbVtaDBztdqG4NBJrftqTUsa8yjih2cu62WW0XebjtTqbPfq6iGIVaQ0dTz893Og2s0DHV0C4fSSKMot1w9O8S9rB2f3TASP4c4gpexBdyxTQ/wySU6iayddkcTnqAj48MZQJ1LZCaPPasOLACjEPFNZv8VQ8gZjHeEmuP2/aKV7Vly8tqIWrzUk6eZPIk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(11063799006)(18002099003)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tuhQzk5JnPiQmtMUNmooC0qkbKxV+wqviUVlur7xXbHs9BZTy+olD9NOaDzwyJNsH2OqwnlYAeg1FgAtxMzygJPT5kIW/3/DDwz5mYNuYeAij+2zm2VAThy9q8GGP38s7//wpbIBRYmX9/esar7T7BHCzBB5pXyjRSzm9EyTYPYYAPlWHgCw8zD+5GHxx8fOKF4nGSVGztaEQ110eKsMLLECfB4COX7VSp0bjnA44KKD3oIbY0JHMUgfPUyUdqU1da2l4bn09DgRbM+g8MdZsa0bBYZkwD7xKccvVfXlbCOuL/U4aS8UUyE+3VfJedECMUDlpg9YLTit2Hj3JYNmaBUnpNdB6+q3l+8fFojzcik8yokZ1DhjV8jWdeyU/CjmUkPJqXOp+9Z9IXmFmoul7DRgmLfM4vpiDwN9i8aGbiNNTA93UPuuF95wOvzQLO6j
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 01:41:39.8021 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 793d3bd3-c4cf-4a90-2741-08debc5a4381
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E65.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8245
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

IB buffers must be mapped with READABLE | WRITEABLE | EXECUTABLE,
matching libdrm amdgpu_bo_va_op() which always sets all three flags.

Without EXECUTABLE the behavior differs by GPU generation:
  GFX10: after TLB eviction (~32 submissions), re-walk finds valid PTE
         without execute permission causing a silent CP stall.  Protection
         violation does not generate a fault interrupt.  DRM scheduler
         times out after 2s, ring reset flushes TLB, GPU resumes.
         Cycle repeats every ~32 submissions.
  GFX12: close race tears down page tables while GPU executes.  PTEs
         become invalid, VM page fault interrupt fires.  GPU reset
         recovers, no hard hang.

Replace hardcoded flags with IB_MAP_FLAGS macro that sets R|W|X for
all VA mappings on all generations.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_close_race.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_close_race.c b/tests/amdgpu/amd_close_race.c
index 84c2edea3..b76b62b55 100644
--- a/tests/amdgpu/amd_close_race.c
+++ b/tests/amdgpu/amd_close_race.c
@@ -90,6 +90,31 @@ union bo_list {
 #define GTT_DOMAIN    0x4
 #define VRAM_DOMAIN   0x2
 
+/*
+ * VM page mapping flags (AMDGPU_VM_PAGE_*).
+ *
+ * IB buffers must be mapped with READABLE | WRITEABLE | EXECUTABLE,
+ * matching libdrm's amdgpu_bo_va_op() behavior.
+ *
+ * EXECUTABLE is required on all generations.  Without it:
+ *   GFX10: after TLB eviction (~32 submissions), re-walk finds valid PTE
+ *          without execute permission -> silent CP stall.  Protection
+ *          violation does not generate a fault interrupt (unlike invalid
+ *          PTE).  DRM scheduler times out after 2s -> ring reset flushes
+ *          TLB -> GPU resumes.  Cycle repeats every ~32 submissions.
+ *   GFX12: close race tears down page tables while GPU executes.  PTEs
+ *          become invalid -> VM page fault interrupt -> dmesg  VM fault.
+ *          GPU reset recovers, no hard hang.
+ *
+ * Key difference: valid PTE + missing execute = silent stall (no interrupt).
+ * Invalid PTE = fault interrupt.  Reset helps because TLB flush forces a
+ * fresh translation fetch; since pages are still mapped, GPU resumes.
+ */
+#define VM_PAGE_READABLE   (1 << 1)
+#define VM_PAGE_WRITEABLE  (1 << 2)
+#define VM_PAGE_EXECUTABLE (1 << 3)
+#define IB_MAP_FLAGS       (VM_PAGE_READABLE | VM_PAGE_WRITEABLE | VM_PAGE_EXECUTABLE)
+
 struct racer {
         int fd;
         int id;
@@ -252,7 +277,7 @@ static int setup_racer(struct racer *r, int id, int n_ctx,
         memset(&gv, 0, sizeof(gv));
         gv.handle = gc.out.handle;
         gv.operation = 1; /* MAP */
-        gv.flags = 6;     /* readable | writeable */
+        gv.flags = IB_MAP_FLAGS;
         gv.va_address = va;
         gv.map_size = IB_SIZE;
         ioctl(r->fd, IOCTL_GEM_VA, &gv);
@@ -288,7 +313,7 @@ static int setup_racer(struct racer *r, int id, int n_ctx,
                 memset(&v, 0, sizeof(v));
                 v.handle = bo.out.handle;
                 v.operation = 1;
-                v.flags = 6;
+                v.flags = IB_MAP_FLAGS;
                 v.va_address = va;
                 v.map_size = VRAM_BO_SIZE;
                 ioctl(r->fd, IOCTL_GEM_VA, &v);
@@ -445,7 +470,7 @@ sigkill_child(int child_id, int n_ctx, int pipe_wr)
         memset(&gv, 0, sizeof(gv));
         gv.handle = ib_h;
         gv.operation = 1;
-        gv.flags = 6;
+        gv.flags = IB_MAP_FLAGS;
         gv.va_address = va;
         gv.map_size = IB_SIZE;
         ioctl(fd, IOCTL_GEM_VA, &gv);
@@ -489,7 +514,7 @@ sigkill_child(int child_id, int n_ctx, int pipe_wr)
                         memset(&v, 0, sizeof(v));
                         v.handle = bo.out.handle;
                         v.operation = 1;
-                        v.flags = 6;
+                        v.flags = IB_MAP_FLAGS;
                         v.va_address = vram_va;
                         v.map_size = VRAM_BO_SIZE;
                         ioctl(fd, IOCTL_GEM_VA, &v);
-- 
2.54.0

