Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22666C5DF81
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 08:23:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4DF10E355;
	Mon, 24 Aug 2026 08:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fb5GloAw";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010037.outbound.protection.outlook.com [52.101.201.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18DA10E2A9
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 12:58:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FcNYEIOmZ+sVD+LgELHQBAcw6aRsenYiGyZl0K9OLa6E+rXL9sVzGfn1jVzjMldy3dP0b8CqIKmJ16l0o0z8502fbOwFwFZN/I2Q5I+BcLNx0AQY5ghPcBFYW3RAyjoz6XMXBLkQeglCnr9rSkdsACSBRpgDY7BGsLwIHps4c/KLj0/W3vXr5rj3RMz3sFRi8SH6WiTkByyBmu7PkFPJXcExfnJccnCbtLNdQr3isT4mDiNKoSxF2HHY52CZoLAuMA8ITuqKmi7UUU88CSU/LQ7tbghWSpLhozSV5Z63zWjjNgEO+pJvnRdH/98QFmKQMXpdqDzlZHgTBO6q2mIG0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hm8mgOyriKWOga00lCKaLXOJ3blk1/n55wcAlaCqg6g=;
 b=sBsx3xGg7qUT4epclG/Ht2jnUes4c93XsdPjp6pqVDA032SbkwAxR+OjtgcbNltfy1iQjbBYWbT9apI7eBA4/4gIzde2Vjc4kbCWgq1RjAbUes3DECVueyMhN+GtvjaR4Da23kdQewESzxO3SAmu9/lJPuHCre83GlvIjCir874FPIXFW6SMTteNuA4hXsMfaRNdze0nqhpCQREt127IG4JSk8yXjTNRBLQlC26quPXSxY539YuT4+4OXLsDJCwgsXo1P09orlom+pd/S8XFBCpRjoZYxCIjoblwqP179ZC7CHwZcFffpWR1l58tEzB2ZrlkHGjwtOgDGFSkibyfjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hm8mgOyriKWOga00lCKaLXOJ3blk1/n55wcAlaCqg6g=;
 b=fb5GloAwj17UWVP1QBnbhPXeMcOzMKm+HkMXyzk5Xyd1I/DtgXKTZp/YZ61bMZHW9Jb9+oKUu/cNHAtgVAO5cipmYglYIKVB8rv50Yos7VsjUH8S2fLAsCazznTgRrTAJC5T+m/m6OJA8UVe+rzABsFPmVTDCv4RIIQIzWRvcPw=
Received: from BY1P220CA0048.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::6)
 by DM6PR12MB4435.namprd12.prod.outlook.com (2603:10b6:5:2a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 12:41:57 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:59e:cafe::99) by BY1P220CA0048.outlook.office365.com
 (2603:10b6:a03:59e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 12:41:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 12:41:55 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 21 Aug
 2026 07:41:55 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 21 Aug
 2026 07:41:54 -0500
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 21 Aug 2026 07:41:52 -0500
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, Honglei Huang
 <honglei1.huang@amd.com>, Huang Rui <ray.huang@amd.com>, Yiru Ma
 <yiru.ma@amd.com>, Junhua Shen <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v1 0/4] lib/amdgpu: refactor cmd_context ownership and
 packet operands
Date: Fri, 21 Aug 2026 20:41:48 +0800
Message-ID: <20260821124152.19670-1-Junhua.Shen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|DM6PR12MB4435:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eca0342-d07b-4534-6801-08deff819595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|23010399003|1800799024|36860700016|18002099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: hzAjbdegikJLgv8dZpvh6yZ+9i9bEBPa6X1ZVphphr4lC6ImExlUQB/jwxpAsfnRAGcEI3Tz7HX/S7c6VEQeRgqf8gxPs4DggXQDtP2AsqzWjA5QZ8uDR6uG1tYTLivRfs9gfuV/xr0/szvk+JgMmubWWaXpmSm2eJNXaggF3afeSADHl2m0a9k233/Q5oL4hmGiABg7u2pEA8Mc2jPunT/N2TYhPjNtDDKo7Ke40jgSFdbcov2zS/Ix4zARt76w4RKm5RwlxRJYi8CJkvXrAiHB7GGLSyuY8Kri0fReAatBg7DgU/xezMExIVp+7pqI06b0cvTE6i9pyE+pgd2hF0Tz6lpK/zJsztZNH6OMOjPPN6mz+27FlOWOAdADnhA5OEM/xN7viSbzGyBfULd3HgQYdZNFZ83+2JjWiUG+Y7XBDjnhZojkCZE54cICBIBt/vUGkHaPs2CHP/8mgjalXvaGhCahqY0UMQnmVdrTiTxEboptfgiA85uBZ7HLNXhJ8tXBOIC+fDjPl9bKhocdt6ggCy7MHSDz+qXD9bu6++VqJY3hMwQLEcv6R4xvxIwAhBqFjW9UHwXwmGD2xOCjtICsfQMqRDtXU4UIsT1hus538VDtbFk9ej2rK9USKl3G+xXBtJxWm/+rfxE5DFU8tZ/fiq7w3T81IZ3zZ78uG/cgTg5w3Di8HGJMy9Q1/2KjWrRirQtUM/4b328KYpPWPw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(23010399003)(1800799024)(36860700016)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: f+fEw1Vf6+4Acjb9guvMQjy3yd5aVQYk3UfB60sHFbYOjDAaxyr97n2XnzBTpDBiuXF/HJHZrWtSpfKNhqOm0sYP3LWRfhE9J1MWnHNyxM8eow22cJQnqFY5dE4N0ry7S79pg4rLDsQVIYZuKD1p7LWY1b6r8Ebm4VCeBJH+sjS0XA5I7oY3yWBG2PC99vAmh6hAd+nRt/AMXOygvyenMDioXfdd0De6PIoLgGWPULZff/t4x/H5Q3tvB7FSY1Olyf8bqNzxlT2TkNu5uFvCW4rV+f2vwbyUoBbbVpqkMzv+XGQ7XsUsGRtRkojv+g+klSoJkfCmc3Ohchkx7h1YLPTLo3DITJJwMV3A2+Ar+pbVWeS+Z0gf6HUHy4d9wcbI//A0WOzedsz5KdmyAjHpzbrey6FkPfqTedABTjsSiOSIyVqD29K3rSgbEFIKZV4m
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 12:41:55.7365 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eca0342-d07b-4534-6801-08deff819595
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4435
X-Mailman-Approved-At: Mon, 24 Aug 2026 08:18:13 +0000
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
an internal data BO, and several IB and packet sizes are derived from the
data transfer size (write_length) rather than from the command-stream
capacity (pm4_size). This couples unrelated concerns, hides residency
management from callers, and leaves the IB size ambiguous. The series
separates these concerns incrementally while keeping every existing
caller compiling and functional.

Scope: cmd_context is a convenience wrapper for SDMA data operations
(linear write/copy/const-fill/atomic). Only three tests currently use it
(amd_mem, amd_dmabuf_unload, amd_kfd_dmabuf_unload); the rest of the
amdgpu tests deliberately drive libdrm_amdgpu directly to validate the
kernel submission UAPI (cs_submit, bo_list, syncobj, gang, compute
dispatch), and are intentionally left untouched. The ring_context field
usage in those low-level callers is already consistent with the contract
documented here, so no changes are required on their side.

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

Junhua Shen (4):
  lib/amdgpu: document amdgpu_ring_context field contract
  lib/amdgpu: drop external BO from cmd_context
  lib/amdgpu: source packet operands from params and size the IB from
    pm4_size
  lib/amdgpu: add CONST_FILL packet type and pass caller fill value
    through

 lib/amdgpu/amd_command_submission.c  | 385 ++++++++++++++-------------
 lib/amdgpu/amd_command_submission.h  | 102 ++++++-
 lib/amdgpu/amd_ip_blocks.c           |  20 +-
 lib/amdgpu/amd_ip_blocks.h           |  59 +++-
 tests/amdgpu/amd_dmabuf_unload.c     |  15 +-
 tests/amdgpu/amd_kfd_dmabuf_unload.c |  15 +-
 tests/amdgpu/amd_mem.c               |  22 +-
 7 files changed, 378 insertions(+), 240 deletions(-)

-- 
2.34.1

