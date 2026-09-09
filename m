Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30D5C79F8C
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 10:47:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9152010E147;
	Wed,  9 Sep 2026 10:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WEbfCNZq";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010071.outbound.protection.outlook.com [52.101.46.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E023E10E147
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 10:46:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGjVLumVxO++Wsp963Yxtc4q+UKVra/AdTBEIrWfx0OKXe9+t7n6exWJMeyoaOjmcVT22ex2X4vVeTn+vBnzbPfWWKhx1k7Vs0z0F3kc4AbUj0vSmmHtNhk58CZiBKmOWnIKe7hLes0qVdk/Q53x101VRRfjuHZ2BluCl18ThGh9jQP4de2z7a13SKmSr93+xXy9x4QaE53MOFahydJcKjXLfODPYnq2BkgSywbcK2GjqT5CtL9JDFQCCXpeIm1we4JOiRr6Ilfr9AC7GzAgebWHuTXAq7ikQM08WSJ/tq7ZhsMBP96UK5tWZaNg6yZRHqroIzZ7wJi9g2dTW9PQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2BCKoueRP8T0eqycwq64UGJqF8A3Lc3uCJNBOa4E4k=;
 b=ArRIBuOztfhPD94NexD+upbjQF3T6NGZufa4VcDxt0acRoTUfGPFs/QufZrVcZjWECxPT+xFWDPRo4mauaDkdSTZnL4NpyGmbr62f4l2hDKQyfHHjBvGye09GNPIs1PgMZQ5Fb/frWPA6c++HHLLBqw4AVWIDesKyxGEfpA2PRkUC4WY6NuUQvkoVJ6g9yLL2omCEmrGgRm+qneHnXT2Gzgww/pgJuCcU3kd02ympwUXi9XyT/XraBo4dgXkQNaFGnIc4hGEeVuMVRpafciDe1zdG5ysvHwhQ4ncZnliLCTWK8caQhK/JHTcasa/Jn3Qnd/afifpvYvTLwl4CNa/5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2BCKoueRP8T0eqycwq64UGJqF8A3Lc3uCJNBOa4E4k=;
 b=WEbfCNZq6q9/y70f5UhDzThcIap1fpKWbyI7Jqmpinkn2dnTY/zuoHcUBXSFgolra+gpb+Wdbp4K8hBG2HxL6TgCwfJMa+j26gxCEwkz/IKKLQW80oA86dC/QHyUlsWd8dxRHbakcBrRErdMyUqtaoqgWkOuqv1rLzAloz57eL8=
Received: from SA0PR11CA0167.namprd11.prod.outlook.com (2603:10b6:806:1bb::22)
 by PH7PR12MB5620.namprd12.prod.outlook.com (2603:10b6:510:137::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 10:46:10 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:806:1bb:cafe::13) by SA0PR11CA0167.outlook.office365.com
 (2603:10b6:806:1bb::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Wed, 9
 Sep 2026 10:46:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 10:46:10 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 05:46:10 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 05:46:09 -0500
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 9 Sep 2026 05:46:07 -0500
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, Honglei Huang
 <honglei1.huang@amd.com>, Huang Rui <ray.huang@amd.com>, Yiru Ma
 <yiru.ma@amd.com>, Junhua Shen <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v2 0/6] lib/amdgpu: refactor cmd_context ownership and
 packet operands
Date: Wed, 9 Sep 2026 18:45:56 +0800
Message-ID: <20260909104602.13807-1-Junhua.Shen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|PH7PR12MB5620:EE_
X-MS-Office365-Filtering-Correlation-Id: 96dd4ae5-1f0c-45a5-4f70-08df0e5f8fac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|6133799003|18002099003|56012099006|13003099007|3023799007|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: egnk2aEzrXkuGUDreIoRZZ2pA+eEQP0COepSjqEfPkiRMVNn2Piz6caJ1Kiy6UewlIU6EH+XoShT5uYgC1oY0I9rFSzSCI7l7LTGn9gayKokipnwalchZKO1hxYRQDTl8cbjbSdiNxTNO6Y+UyLQFpugnDW9dAT1RbZzSP5hHqdGVIYDtTK/VBAOAAcoZE+NiF1tETu91UdGauBCWz4AXCMW/KAuFgQXXglcMmqtSQyftrFcb9NddOVLRktNhSGpQ5mUUTnJvplJv9ZIDGOLfzjkt5GukH0WLQ1x7XkZdi3r3jw2l5O2mVtehD9QNmG6mk7WbQtGtCVcV/MVFYw76xHxjmhyep9pZMPqB/YCyvMnyI/3e6ClFDkZhchmlP2qoa8uNbaZ64Ode+b6tOIvwAZyfxtU/V9RD9MgN25EWrRd0XUKCeBJOvg+C77WfZCo3Box2U7b7u7piA4nyazzw6wC6t57tmLtDSjHWvzvmM3M9BZO4Em+eO2ky3vmzEJJ/GVU+Tik1mZdmbIUp6Ih7ni97GBfxia9WUBKvnxE6egZP4IGRt6cLhwoCfgqAi677rQarKMPK70f/0NvpTQey9jwyzMRo/DPE02mMeIZAGWW9ep+4RSnAo0O90GCR2kCXFbR+vftBw8dSvmRvWT4hg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(6133799003)(18002099003)(56012099006)(13003099007)(3023799007)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CXXvin9XZ3FhkO5xKrOujbpNXTy8/hl+q2LzX0FU2leU074hVzPfypLgs0TYusRLeXUVGozyMkcZ+WP3l7aca0usY5tYx0izeHC8nAaufS/6utY+FJgdmjkcS08tQtT0BGv+mejkvRG7pCfS9+CWBv9o6TRcLVnXlYjNPCgwh/zRGDFzcKy+7eWNDrOihykng7dMjLQw1wLg2+e13lVEiWucvzanJ2jhH2DPo796Z/ibfLIoQ/kUioy9nDv6pPaNqW6dQ1DoWBrRIMbdWpiOrQdnji/aQ+T8C0lhZHLJS33jqk/lF/9+kDy0Qbetrmza+GZTT6/E0K6jmD2qzjK1suO+nkenPYG1xepRsJu9DVqNMSXp8RhWDmowSgrvZEd6n+Isvt07Ks5G5AriAoGCdTpJqfXm0gJpvd73BOtt1zd2dgjVL4a9yZmKUJCWPq9Z
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 10:46:10.4347 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96dd4ae5-1f0c-45a5-4f70-08df0e5f8fac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5620
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

This series refactors the amdgpu command-submission helper library
(lib/amdgpu/amd_command_submission.*) around a single principle:
cmd_context should own only the PM4/IB command stream, while the buffers
those commands read and write, together with their GPU virtual addresses,
are supplied and kept resident by the caller.

Currently cmd_context both builds the PM4 stream and allocates and clears
an internal data BO, and the IB is sized from the data transfer size
(write_length) rather than from the command-stream capacity (pm4_size).
This couples unrelated concerns, hides residency management from callers,
and leaves the IB size ambiguous. The series separates these concerns
incrementally while keeping every existing caller compiling and
functional.

v2 also folds in two independent test-correctness fixes:
patch 5 derives the compute-dispatch version from
hw_ip_version_major (in amd_mem and amd_remote_mem), which surfaced while
reworking amd_mem's compute path; patch 6 fixes the KFD aperture
node-count query in amd_kfd_dmabuf_unload that the kernel rejects with
-EINVAL.

Scope: cmd_context is a convenience wrapper for SDMA data operations
(linear write/copy/const-fill/atomic). Only three tests currently use it
(amd_mem, amd_dmabuf_unload, amd_kfd_dmabuf_unload); the rest of the
amdgpu tests deliberately drive libdrm_amdgpu directly to validate the
kernel submission UAPI (cs_submit, bo_list, syncobj, gang, compute
dispatch), and are left untouched by the cmd_context refactor. The one
exception is the standalone compute-dispatch-version fix in patch 5, which
also updates amd_remote_mem; it is unrelated to the cmd_context contract.
The ring_context field usage in those low-level callers is already
consistent with the contract documented here, so no changes are required
on their side.

Overview of the changes
-----------------------
1. document amdgpu_ring_context field contract
   Add IN/OUT/INTERNAL annotations to struct amdgpu_ring_context so the
   ownership and direction of each field is unambiguous before the
   behavioural changes are introduced. Documentation only, no functional
   change.

2. drop external BO from cmd_context
   cmd_context no longer allocates, tracks, or clears a caller-visible
   data BO. Callers now register the residency of those buffers
   explicitly via the new cmd_context_add_resource(). cmd_context_create()
   loses the write_length parameter (the IB is sized from pm4_size alone)
   and all call sites are updated (amd_dmabuf_unload.c,
   amd_kfd_dmabuf_unload.c, amd_mem.c).

3. source packet operands from params and size the IB from pm4_size
   The legacy IB byte size is now derived from pm4_size (the command
   stream capacity), not write_length (the data transfer size).
   WRITE_LINEAR, WRITE_ATOMIC and COPY_LINEAR take their source and
   destination GPU virtual addresses from cmd_packet_params_t, so callers
   pass those addresses directly rather than relying on context-internal
   BOs.

4. add CONST_FILL packet type and pass caller fill value through
   Add a CMD_PACKET_CONST_FILL packet type with a per-packet size guard,
   and propagate the caller-supplied fill value
   (write_data/write_data_valid) through write_linear and const_fill in
   the IP block builders.

5. derive compute dispatch version from hw_ip_version_major
   amd_mem's ptrace VRAM verification derived the GFX generation from
   family_id; query amdgpu_query_hw_ip_info() and use
   hw_ip_version_major instead, mirroring amd_dispatch.c, so no
   wrong-generation PM4 is emitted. amd_remote_mem's build_poll_shader()
   carried the same family_id-based version table and is converted to the
   query in the same patch. The cache-invalidate tests are also gated to
   Arcturus, where the RW MTYPE cache behaviour they exercise is
   specific.

6. query KFD aperture node count before filling array
   kfd_get_gpuvm_base() passed num_of_nodes = NUM_OF_SUPPORTED_GPUS
   unconditionally, which the kernel rejects with -EINVAL. Follow the
   documented two-step protocol: an initial call with num_of_nodes == 0
   returns the actual node count, then fill up to that count.

Changes since v1
----------------
v1: https://lists.freedesktop.org/archives/igt-dev/ (cover: "[PATCH i-g-t
v1 0/4] lib/amdgpu: refactor cmd_context ownership and packet operands").

- Patch 1 (document ring_context): add the commit message body that was
  missing in v1 (builder/submitter roles and the IN/OUT/INTERNAL
  rationale). The annotations themselves are unchanged.

- Patch 2 (drop external BO): address Jesse Zhang's review of v1 2/4.
  cmd_submit_packet() now propagates cmd_wait_completion() errors instead
  of unconditionally clearing submit_pending and reusing the IB;
  submit_pending is cleared inside cmd_wait_completion() on success to
  avoid redundant waits; cmd_context_destroy() drains any pending
  submission before freeing the IB. The two amd_mem submit paths the
  reviewer flagged now register residency explicitly:
  test_cache_invalidate_on_sdma_write_asm() calls
  cmd_context_add_resource(dma_ctx, bo_vram) before the write, and
  submit_dma_write_operation() registers ctx->dma_scratch_bo and writes
  to its VA rather than the removed internal data BO. The internal helper
  cmd_reset_packet_operands() is renamed cmd_clear_packet_inputs().

- Patch 3 (source packet operands / size IB from pm4_size): unchanged
  from v1 3/4.

- Patch 4 (CONST_FILL): rebased onto the renamed helper; no functional
  change from v1 4/4.

- New patch 5 (tests/amdgpu: derive compute dispatch version from
  hw_ip_version_major): test-correctness fix uncovered while reworking
  amd_mem's compute path. The same family_id-based version derivation in
  amd_remote_mem's build_poll_shader() is switched to
  amdgpu_query_hw_ip_info() in this patch as well.

- New patch 6 (tests/amdgpu: query KFD aperture node count before filling
  array): test-correctness fix for the -EINVAL rejection from
  kfd_ioctl_get_process_apertures_new().

Testing
-------
Ran on local hardware: AMD GFX1036 (GFX10_3). The three cmd_context
callers (amd_mem, amd_dmabuf_unload, amd_kfd_dmabuf_unload) and the
low-level tests that exercise the changed shared code (amd_basic SDMA and
compute submission, amd_userptr_invalidation) all pass. There is no
regression from this series.

Known limitations / follow-up work
----------------------------------
The following items are intentionally excluded from this series to limit
its scope; they are candidates for follow-up patches:

- pm4_size is currently a hard-coded 256 dwords in cmd_context_create().
  It should become a caller-provided parameter (or be derived from the
  expected packet mix) so large PM4 streams are not silently truncated.

- The residency set (amdgpu_ring_context.resources[]) is a fixed-size
  array (4 entries). cmd_context_add_resource() returns -ENOSPC when it
  overflows; a growable set would remove that limit for callers that
  require more operands per submit.

- Some low-level callers open-code the same linear write/copy/fill
  sequences that cmd_context now wraps. Where a test only needs the data
  operation itself (and is not specifically exercising the submission
  UAPI), it could be migrated onto the high-level cmd_context API to
  remove boilerplate. Tests that deliberately drive libdrm_amdgpu to
  validate cs_submit/bo_list/syncobj/gang/compute paths should stay as
  they are.

Junhua Shen (6):
  lib/amdgpu: document amdgpu_ring_context field contract
  lib/amdgpu: drop external BO from cmd_context
  lib/amdgpu: source packet operands from params and size the IB from
    pm4_size
  lib/amdgpu: add CONST_FILL packet type and pass caller fill value
    through
  tests/amdgpu: derive compute dispatch version from hw_ip_version_major
  tests/amdgpu: query KFD aperture node count before filling array

 lib/amdgpu/amd_command_submission.c  | 424 +++++++++++++++++++----------------
 lib/amdgpu/amd_command_submission.h  | 102 ++++++++-
 lib/amdgpu/amd_ip_blocks.c           |  20 +-
 lib/amdgpu/amd_ip_blocks.h           |  59 ++++-
 tests/amdgpu/amd_dmabuf_unload.c     |  15 +-
 tests/amdgpu/amd_kfd_dmabuf_unload.c |  23 +-
 tests/amdgpu/amd_mem.c               | 171 +++++++-------
 tests/amdgpu/amd_remote_mem.c        |  20 +-
 8 files changed, 492 insertions(+), 342 deletions(-)

-- 
2.34.1

