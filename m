Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80338C79FAA
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 08:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1987910EF9C;
	Wed,  9 Sep 2026 08:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RFoMK6kV";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013048.outbound.protection.outlook.com
 [40.107.201.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771AD10EF9A
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 07:59:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnRhO8FO52dTmt7B98yO9mrCfRxNE4JigIsdjOJlA4284LHW13AGpI0LzlqlXCiboX2Bm/buvRQQHYm7wyZkua6TcT5GrVH357rFSZQAQ8dpTDyPYpmwuYG1SioqNpq8S4v/KZWk2AUvvJxDVhn8TloMwsgEob111+lQFCyNGxYTTBTYKZ/dlb28ikw34k4997YMk70+NhsFr8+5MiXv6jcOJnqqQTwmgIoUX01WLM+tI+uXsGRzLzoTe5NCUoNvxF3XJQjy8c4uEyWQat9F8y0Keg/FPD5TogUjo1mkgQGoG2XA48Bv4rTNncOJCG/50s4KZrdb6lEMdzKskxU2eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmkBS2cVyXj1PIrIUg+1dKrJuYNc61khbL6fsjV2C2k=;
 b=dQc34mKmtBSARnWUbNPAsant922Atd9BAj8JD9t32RZ0h4YJWd0VC4GbV5KXDjD1IWIDSvG+TGBvvjd0UJ8CAphe0gbG6TTgs+tja0O1WQ860P7Y9EwjQhHZA0yHNA06TY7q44EliinCKp0swCugzn8X92rmqDk+c5OuNyKgeFwfhD/wtE2E6HdMC5a9mGQMZPOLzmsUXiirNiEs/rhU+zHB1Oyh/g9nNVKx7Uu+IU+nXij31B6ockCPb/jO5XFwaSPN1OcyAyXjHjrzkPOwoCbwZKp/Av8yzhTrpmk35DDuZOHXzB1B6k6dXuwakTgzEZjm+FSi9ZfcIhNfOrs/5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmkBS2cVyXj1PIrIUg+1dKrJuYNc61khbL6fsjV2C2k=;
 b=RFoMK6kVF3ZJc8L48Mzd04PU+Zjp1yKsIDs1xMTsi3jSYY03M7iHfBaH5iOiuUYdJVCh4GA96Hq/SWJr02+fc28Xht/dR+Jo9qERPEskU/feAq+SmcaNCPYV17yYXXQyOJbzbhouFu4IoM0jIJlSpErAfVB37jt9FXDSQaNay5w=
Received: from SJ0PR03CA0123.namprd03.prod.outlook.com (2603:10b6:a03:33c::8)
 by PH8PR12MB6865.namprd12.prod.outlook.com (2603:10b6:510:1c8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 07:59:13 +0000
Received: from BY1PEPF00026957.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::7e) by SJ0PR03CA0123.outlook.office365.com
 (2603:10b6:a03:33c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Wed, 9
 Sep 2026 07:59:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026957.mail.protection.outlook.com (10.167.244.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 07:59:12 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 02:59:11 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 02:59:10 -0500
Received: from junhua-PC (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 9 Sep 2026 02:59:09 -0500
Date: Wed, 9 Sep 2026 15:59:08 +0800
From: Junhua Shen <Junhua.Shen@amd.com>
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Prosyak, 
 Vitaly" <Vitaly.Prosyak@amd.com>, "Khatri, Sunil" <Sunil.Khatri@amd.com>, 
 "Huang, Honglei1" <Honglei1.Huang@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Ma, Yiru" <Yiru.Ma@amd.com>
Subject: Re: [PATCH i-g-t v1 2/4] lib/amdgpu: drop external BO from cmd_context
Message-ID: <20260909075908.m26wksq2u5hf6gak@junhua-PC>
References: <20260821124152.19670-1-Junhua.Shen@amd.com>
 <20260821124152.19670-3-Junhua.Shen@amd.com>
 <DM4PR12MB51529B1E321951DE0E622461E3AF2@DM4PR12MB5152.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR12MB51529B1E321951DE0E622461E3AF2@DM4PR12MB5152.namprd12.prod.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026957:EE_|PH8PR12MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: 04cec6f6-6a7e-4191-777c-08df0e483c8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|6133799003|10067099003|4143699003|56012099006|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: KOgZhaw1WCHHOdp6ii1mO6M/S35vpWvRPNRfaf2l0fDmMlpV0UvQJY+oz3i6gJi8ZECp4ypu44o5kcxBvipqgMFRLJdOcjfzk0qvD1wsiZQGb1yLldO9TOEbshGeQafuKPXBHgH62Qch01rhsQUV14e7MyinImznEx1w7yEWJ3yA5vd9q2LtdQWZ3/jf1nspDTmna0tUijSWtqjC2Hh6hMJ0m7cy8eFK666M536Q9xXGrPkQmOnF7MiR9AgiOSiX88ENFSFcQrZUJi2tjMDS3fCYJLfYTypDFVxYTnL4rY9BSkXCF21RebnHz0FPTxs21P2VWX+28vPEjCFLh4hYY5m93juljA/sWGNgLKuSWSpNwHPCpycQZ8LiGKzUkMncgC99rBys0ysrSLnXlO0GIFJz5SKmQyT26l6LE9kAk6rf6plUEpvF5N1GkF4W96cfd6AAXLkE+STZCD5ig9kDFSPh+SawCkLCplMPexMu+gK7qOdtSvWie8Xqp8HnMzyXW//tDkl29VN57Qwsjc+/53VSRRBfisuCfN7063sxEdRVBw7C/zMAz0CnfIxQgChhGx7wYLSScXPg33zw74lSbOZtXmrUGQu1aJWA4liRw46nphSrXfr14pqxkHZLR713fEDDcPFHJGDiDBejFhEXhj6jFkOWhq1k6tNxwp96vT/QGd1XMG5WihIB7m+FKVrrrCR8/MkPxP3o6wGZ4fYttg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: d8w9Z75Wto0Td+47g6gbwwxNNT4zc2/mUGVEHaA+pufFuvahNgKijKtg+W05J95JvplVas8m7vOWxyA8luKeAkCnuxkd1xGRhcoonzTZ9nOkcjbmH86hoKsGB+fi1+8/sf+oq6fHBq1LLELnt/5DcVoAPaa+W9SLCifUJ8bmpP6H7nCG31sYN4A3v7bIhVucD8q7e3KwFXciyJt2aa++FFF0SOC93tb1zhCZdxXGzAyaqYHxUCTdXWQZmpweULilnD9vEAIAXcsDf2HWaBVgoBSub7DM8ykuQi45mnHy78fA2gMsVg001z3itR2U6bjPAp1gktdcR0Q47tiWHsyaEPuyH/P27bjx9LwVfz4NC6/kXzMzFH6YXhqNoarJd2PxS/On4ySYOEa3aW9yPiKWvDQtCwoe3DSH9eY71m5nJ1WORFN1dztdcYTpZ+b8VuDR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 07:59:12.4765 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04cec6f6-6a7e-4191-777c-08df0e483c8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF00026957.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6865
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

On Tue, Aug 25, 2026 at 10:18:32AM +0000, Zhang, Jesse(Jie) wrote:
> AMD General
> 
> > -----Original Message-----
> > From: Junhua Shen <Junhua.Shen@amd.com>
> > Sent: Friday, August 21, 2026 8:42 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Zhang, Jesse(Jie)
> > <Jesse.Zhang@amd.com>; Khatri, Sunil <Sunil.Khatri@amd.com>; Huang,
> > Honglei1 <Honglei1.Huang@amd.com>; Huang, Ray <Ray.Huang@amd.com>;
> > Ma, Yiru <Yiru.Ma@amd.com>; Shen, Junhua <Junhua.Shen@amd.com>
> > Subject: [PATCH i-g-t v1 2/4] lib/amdgpu: drop external BO from cmd_context
> >
> > Rework cmd_context so it no longer owns or clears a caller-visible data buffer.
> > Operand residency is registered explicitly, and the leftover internal-BO plumbing is
> > removed.
> >
> > - cmd_context_create()/destroy(): remove the external-BO plumbing; the
> >   context no longer allocates or tracks a data BO.
> > - Add cmd_context_add_resource(): so callers register BO-backed operand
> >   addresses in the per-submit bo_list residency set explicitly.
> > - Drop the write_length parameter from cmd_context_create(): the IB/PM4
> >   buffer is sized solely from pm4_size.
> > - Update all cmd_context_create() call sites to the new signature:
> >   tests/amdgpu/amd_dmabuf_unload.c, amd_kfd_dmabuf_unload.c, and
> >   amd_mem.c (three sites).
> >
> > Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
> > ---
> >  lib/amdgpu/amd_command_submission.c  | 283 ++++++++++-----------------
> > lib/amdgpu/amd_command_submission.h  |  99 +++++++++-
> >  tests/amdgpu/amd_dmabuf_unload.c     |  15 +-
> >  tests/amdgpu/amd_kfd_dmabuf_unload.c |  15 +-
> >  tests/amdgpu/amd_mem.c               |  22 ++-
> >  5 files changed, 220 insertions(+), 214 deletions(-)
> >
> > diff --git a/lib/amdgpu/amd_command_submission.c
> > b/lib/amdgpu/amd_command_submission.c
> > index 0334c2ded..26f36256a 100644
> > --- a/lib/amdgpu/amd_command_submission.c
> > +++ b/lib/amdgpu/amd_command_submission.c
> > @@ -906,31 +906,22 @@
> > amdgpu_command_ce_write_fence(amdgpu_device_handle dev,  }
> >
> >  /**
> > - * command context creation with optional external BO
> > + * command context creation
> >   *
> >   * @param device AMDGPU device handle
> >   * @param ip_type IP block type (GFX, DMA, etc.)
> >   * @param ring_id Ring index to use
> >   * @param user_queue Whether to use user queue mode
> > - * @param write_length Size of write operations in DWORDs
> > - * @param external_bo Optional external buffer object (NULL for internal allocation)
> > - * @param external_bo_mc GPU MC address of external BO (required if
> > external_bo provided)
> > - * @param external_bo_cpu CPU mapping of external BO (required if external_bo
> > provided)
> > + * @param write_length Default per-packet transfer size in bytes (overridden per
> > + *                     packet by cmd_packet_params_t::size)
> >   * @return New command context, or NULL on failure
> >   */
> >  cmd_context_t* cmd_context_create(amdgpu_device_handle device,
> >                                      enum amd_ip_block_type ip_type,
> >                                      uint32_t ring_id,
> > -                                    bool user_queue,
> > -                                    uint32_t write_length,
> > -                                    amdgpu_bo_handle external_bo,
> > -                                    uint64_t external_bo_mc,
> > -                                    volatile uint32_t *external_bo_cpu)
> > +                                    bool user_queue)
> >  {
> >       cmd_context_t *ctx;
> > -     void *cpu_ptr = NULL;
> > -     uint64_t bo_mc = 0;
> > -     amdgpu_va_handle va_handle = NULL;
> >       int r;
> >
> >       if (!device)
> > @@ -949,7 +940,6 @@ cmd_context_t*
> > cmd_context_create(amdgpu_device_handle device,
> >       ctx->ip_type = ip_type;
> >       ctx->user_queue = user_queue;
> >       ctx->last_submit_seq = 0;
> > -     ctx->uses_external_bo = (external_bo != NULL);  // Now this member exists
> >       ctx->initialized = false;
> >
> >       /* Get IP block for the specified IP type */ @@ -967,7 +957,6 @@
> > cmd_context_t* cmd_context_create(amdgpu_device_handle device,
> >       }
> >
> >       /* Setup ring context parameters */
> > -     ctx->ring_ctx->write_length = write_length ? write_length : 128;
> >       ctx->ring_ctx->pm4_size = 256;
> >       ctx->ring_ctx->pm4 = calloc(ctx->ring_ctx->pm4_size, sizeof(uint32_t));
> >       if (!ctx->ring_ctx->pm4) {
> > @@ -976,7 +965,7 @@ cmd_context_t*
> > cmd_context_create(amdgpu_device_handle device,
> >               return NULL;
> >       }
> >
> > -     ctx->ring_ctx->res_cnt = 1;
> > +     ctx->ring_ctx->res_cnt = 0;
> >       ctx->ring_ctx->ring_id = ring_id;
> >       ctx->ring_ctx->secure = false;
> >       ctx->ring_ctx->user_queue = user_queue; @@ -990,7 +979,7 @@
> > cmd_context_t* cmd_context_create(amdgpu_device_handle device,
> >                       return NULL;
> >               }
> >               ctx->ip_block->funcs->userq_create(device, ctx->ring_ctx,
> > (unsigned int)ip_type);
> > -     }else {
> > +     } else {
> >               /* Create regular command submission context */
> >               r = amdgpu_cs_ctx_create(device, &ctx->ring_ctx-
> > >context_handle);
> >               if (r) {
> > @@ -1001,115 +990,60 @@ cmd_context_t*
> > cmd_context_create(amdgpu_device_handle device,
> >               }
> >       }
> >
> > -     /* BO allocation strategy: use external BO if provided, otherwise allocate
> > internally */
> > -     if (external_bo) {
> > -             /* Validate external BO arguments */
> > -             if (!external_bo_cpu || !external_bo_mc) {
> > -                     igt_debug("Invalid external BO arguments (mc=0x%llx,
> > cpu=%p)\n",
> > -                                       (unsigned long long)external_bo_mc,
> > external_bo_cpu);
> > -                     free(ctx->ring_ctx->pm4);
> > -                     free(ctx->ring_ctx);
> > -                     free(ctx);
> > -                     return NULL;
> > -             }
> > -
> > -             /* Use caller-provided external BO */
> > -             ctx->ring_ctx->bo = external_bo;
> > -             ctx->ring_ctx->bo_mc = external_bo_mc;
> > -             ctx->ring_ctx->bo_cpu = external_bo_cpu;
> > -             ctx->ring_ctx->va_handle = NULL;  // VA management is caller's
> > responsibility
> > -
> > -             igt_info("Using external BO: GPU=0x%llx, CPU=%p\n",
> > -                              (unsigned long long)external_bo_mc,
> > external_bo_cpu);
> > -     } else {
> > -             /* Allocate internal BO for command operations */
> > -             r = amdgpu_bo_alloc_and_map(device,
> > -                                ctx->ring_ctx->write_length,
> > -                                4096,
> > -                                AMDGPU_GEM_DOMAIN_GTT,
> > -                                0,
> > -                                &ctx->ring_ctx->bo,
> > -                                &cpu_ptr,
> > -                                &bo_mc,
> > -                                &va_handle);
> > -             if (r) {
> > -                     goto cleanup_error;
> > +     /* Allocate a single per-context IB sized to the PM4 buffer capacity. */
> > +     r = amdgpu_bo_alloc_and_map(device,
> > +                                 ctx->ring_ctx->pm4_size * sizeof(uint32_t), 4096,
> > +                                 AMDGPU_GEM_DOMAIN_GTT, 0,
> > +                                 &ctx->ib_bo, &ctx->ib_cpu, &ctx->ib_mc,
> > +                                 &ctx->ib_va);
> > +     if (r) {
> > +             if (user_queue) {
> > +                     if (ctx->ip_block->funcs->userq_destroy)
> > +                             ctx->ip_block->funcs->userq_destroy(device, ctx-
> > >ring_ctx,
> > +                                                                 (unsigned
> > int)ip_type);
> > +             } else {
> > +                     amdgpu_cs_ctx_free(ctx->ring_ctx->context_handle);
> >               }
> > -
> > -             ctx->ring_ctx->bo_mc = bo_mc;
> > -             ctx->ring_ctx->bo_cpu = (volatile uint32_t *)cpu_ptr;
> > -             ctx->ring_ctx->va_handle = va_handle;
> > -
> > -             igt_info("Allocated internal BO: GPU=0x%llx, CPU=%p\n",
> > -                      (unsigned long long)bo_mc, cpu_ptr);
> > -     }
> > -
> > -     /* Initialize resources array */
> > -     ctx->ring_ctx->resources[0] = ctx->ring_ctx->bo;
> > -     for (int i = 1; i < 4; i++) {
> > -             ctx->ring_ctx->resources[i] = NULL;
> > +             free(ctx->ring_ctx->pm4);
> > +             free(ctx->ring_ctx);
> > +             free(ctx);
> > +             return NULL;
> >       }
> >
> >       ctx->initialized = true;
> >       return ctx;
> > -
> > -cleanup_error:
> > -     /* Cleanup resources in case of allocation failure */
> > -     if (user_queue) {
> > -             ctx->ip_block->funcs->userq_destroy(device, ctx->ring_ctx,
> > (unsigned int)ip_type);
> > -     } else {
> > -             if (ctx->ring_ctx->context_handle)
> > -                 amdgpu_cs_ctx_free(ctx->ring_ctx->context_handle);
> > -     }
> > -
> > -     free(ctx->ring_ctx->pm4);
> > -     free(ctx->ring_ctx);
> > -     free(ctx);
> > -     return NULL;
> >  }
> >
> >  /**
> > - * context destruction function with external BO control
> > + * context destruction function
> >   *
> >   * @param ctx Command context to destroy
> > - * @param destroy_external_bo Whether to destroy external BO (if used)
> >   */
> > -void cmd_context_destroy(cmd_context_t *ctx, bool destroy_external_bo)
> > +void cmd_context_destroy(cmd_context_t *ctx)
> >  {
> >       if (!ctx || !ctx->initialized)
> >               return;
> >
> > -     if (ctx->ring_ctx) {
> > -             /* Handle BO cleanup based on allocation type */
> > -             if (ctx->ring_ctx->bo) {
> > -                     if (!ctx->uses_external_bo || destroy_external_bo) {
> > -                             /* Clean up internal BO or external BO if explicitly
> > requested */
> > -                             if (ctx->ring_ctx->va_handle) {
> > -                                 /* Internal BO with VA handle - full cleanup */
> > -                                 amdgpu_bo_unmap_and_free(ctx->ring_ctx->bo,
> > ctx->ring_ctx->va_handle,
> > -                                                        ctx->ring_ctx->bo_mc,
> > -                                                        ctx->ring_ctx->write_length);
> > -                             } else if (destroy_external_bo) {
> > -                                 /* External BO without VA handle - just free the BO
> > */
> > -                                 amdgpu_bo_free(ctx->ring_ctx->bo);
> > -                             }
> > -                     } else {
> > -                             /* External BO, preserve it as requested by caller */
> > -                             igt_info("Preserving external BO (GPU=0x%llx)\n",
> > -                                              (unsigned long long)ctx->ring_ctx-
> > >bo_mc);
> > -                     }
> > -             }
> > +     /* Free the per-context IB. */
> > +     if (ctx->ib_bo) {
> > +             if (ctx->submit_pending)
> > +                     cmd_wait_completion(ctx);
> > +             amdgpu_bo_unmap_and_free(ctx->ib_bo, ctx->ib_va, ctx->ib_mc,
> > +                                      ctx->ring_ctx->pm4_size * sizeof(uint32_t));
> > +             ctx->ib_bo = NULL;
> > +     }
> >
> > +     if (ctx->ring_ctx) {
> >               /* Clean up command submission context */
> >               if (ctx->user_queue) {
> >                       if (ctx->ip_block && ctx->ip_block->funcs->userq_destroy) {
> >                               ctx->ip_block->funcs->userq_destroy(ctx->device,
> > ctx->ring_ctx,
> >                                                         (unsigned int)ctx->ip_type);
> > -                 }
> > +                     }
> >               } else {
> >                       if (ctx->ring_ctx->context_handle) {
> >                               amdgpu_cs_ctx_free(ctx->ring_ctx->context_handle);
> > -                 }
> > +                     }
> >               }
> >
> >               /* Free PM4 command buffer */
> > @@ -1123,6 +1057,42 @@ void cmd_context_destroy(cmd_context_t *ctx, bool
> > destroy_external_bo)
> >       free(ctx);
> >  }
> >
> > +int cmd_context_add_resource(cmd_context_t *ctx, amdgpu_bo_handle bo) {
> > +     struct amdgpu_ring_context *rc;
> > +     int i;
> > +
> > +     if (!ctx || !ctx->initialized || !ctx->ring_ctx || !bo)
> > +             return -EINVAL;
> > +
> > +     rc = ctx->ring_ctx;
> > +
> > +     /* Deduplicate: an already-registered BO needs no second slot. */
> > +     for (i = 0; i < rc->res_cnt; i++) {
> > +             if (rc->resources[i] == bo)
> > +                     return 0;
> > +     }
> > +
> > +     if (rc->res_cnt >= (int)ARRAY_SIZE(rc->resources))
> > +             return -ENOSPC;
> > +
> > +     rc->resources[rc->res_cnt++] = bo;
> > +     return 0;
> > +}
> > +
> > +static void cmd_reset_packet_operands(cmd_context_t *ctx) {
> > +     struct amdgpu_ring_context *rc = ctx->ring_ctx;
> > +
> > +     rc->bo_mc = 0;
> > +     rc->bo_mc2 = 0;
> > +     rc->write_length = 0;
> > +
> > +     /* Drop the per-submit residency set. */
> > +     memset(rc->resources, 0, sizeof(rc->resources));
> > +     rc->res_cnt = 0;
> > +}
> > +
> >  /**
> >   * Submit command packet without waiting - Fixed submission logic
> >   */
> > @@ -1132,10 +1102,6 @@ int cmd_submit_packet(cmd_context_t *ctx)
> >       int r;
> >       struct amdgpu_cs_request ibs_request;
> >       struct amdgpu_cs_ib_info ib_info;
> > -     amdgpu_bo_handle ib_bo;
> > -     void *ib_cpu;
> > -     uint64_t ib_mc_address;
> > -     amdgpu_va_handle ib_va_handle;
> >       amdgpu_bo_handle all_res[5] = {0};
> >       uint32_t res_count = 0;
> >       uint32_t i;
> > @@ -1145,12 +1111,27 @@ int cmd_submit_packet(cmd_context_t *ctx)
> >               return -EINVAL;
> >       }
> >
> > -     /* Check required parameters */
> > -     if (ctx->ring_ctx->pm4_dw == 0 || ctx->ring_ctx->pm4_dw > 1024) {
> > -             igt_debug("Invalid PM4 size: %u (must be 1-1024)\n", ctx->ring_ctx-
> > >pm4_dw);
> > +     /* Check required parameters: the PM4 stream must be non-empty and fit
> > +      * in the per-context IB allocated by cmd_context_create().
> > +      */
> > +     if (ctx->ring_ctx->pm4_dw == 0 || ctx->ring_ctx->pm4_dw > ctx->ring_ctx-
> > >pm4_size) {
> > +             igt_debug("Invalid PM4 size: %u (must be 1-%u)\n",
> > +                       ctx->ring_ctx->pm4_dw, ctx->ring_ctx->pm4_size);
> >               return -EINVAL;
> >       }
> >
> > +     igt_assert_f(ctx->ib_bo && ctx->ring_ctx->pm4_dw <= ctx->ring_ctx-
> > >pm4_size,
> > +                  "PM4 stream (%u dw) exceeds IB capacity (%u dw)\n",
> > +                  ctx->ring_ctx->pm4_dw, ctx->ring_ctx->pm4_size);
> > +
> > +     if (ctx->submit_pending) {
> > +             cmd_wait_completion(ctx);
> > +             ctx->submit_pending = false;
> > +     }
> cmd_submit_packet() should propagate cmd_wait_completion() errors instead of unconditionally clearing submit_pending and reusing the IB. Also consider clearing submit_pending inside cmd_wait_completion() on success to avoid redundant waits.
>
Agreed. Will propagate `cmd_wait_completion()` errors in
`cmd_submit_packet()`, and move `submit_pending` clearing to successful
`cmd_wait_completion()` to avoid redundant waits.

> > +
> > +     memcpy(ctx->ib_cpu, ctx->ring_ctx->pm4,
> > +            ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> > +
> >       /* For user queues, use userq_submit */
> >       if (ctx->user_queue) {
> >               if (!ctx->ip_block || !ctx->ip_block->funcs->userq_submit) { @@ -
> > 1158,16 +1139,14 @@ int cmd_submit_packet(cmd_context_t *ctx)
> >                       return -ENOTSUP;
> >               }
> >
> > -             if (!ctx->ring_ctx->bo_mc) {
> > -             igt_debug("Invalid BO MC address for user queue\n");
> > -             return -EINVAL;
> > -             }
> > -
> >               ctx->ip_block->funcs->userq_submit(ctx->device, ctx->ring_ctx,
> >                     (unsigned int)ctx->ip_type,
> > -                   ctx->ring_ctx->bo_mc);
> > +                   ctx->ib_mc);
> >               ctx->last_submit_seq = ctx->ring_ctx->point;
> > +             ctx->submit_pending = true;
> >               igt_info("User queue submission successful, point=%lu\n", ctx-
> > >last_submit_seq);
> > +
> > +             cmd_reset_packet_operands(ctx);
> >               return 0;
> >       }
> >
> > @@ -1175,26 +1154,8 @@ int cmd_submit_packet(cmd_context_t *ctx)
> >       memset(&ibs_request, 0, sizeof(ibs_request));
> >       memset(&ib_info, 0, sizeof(ib_info));
> >
> > -     /* Allocate separate IB buffer instead of reusing command buffer */
> > -     r = amdgpu_bo_alloc_and_map(ctx->device,
> > -                            ctx->ring_ctx->pm4_dw * sizeof(uint32_t),
> > -                            4096,
> > -                            AMDGPU_GEM_DOMAIN_GTT,
> > -                            0,
> > -                            &ib_bo,
> > -                            &ib_cpu,
> > -                            &ib_mc_address,
> > -                            &ib_va_handle);
> > -     if (r) {
> > -             igt_debug("Failed to allocate IB: %d\n", r);
> > -             return r;
> > -     }
> > -
> > -     /* Copy PM4 commands to IB */
> > -     memcpy(ib_cpu, ctx->ring_ctx->pm4, ctx->ring_ctx->pm4_dw *
> > sizeof(uint32_t));
> > -
> > -     /* Setup IB information */
> > -     ib_info.ib_mc_address = ib_mc_address;
> > +     /* Point the IB info at the per-context IB */
> > +     ib_info.ib_mc_address = ctx->ib_mc;
> >       ib_info.size = ctx->ring_ctx->pm4_dw;
> >       if (ctx->ring_ctx->secure)
> >               ib_info.flags |= AMDGPU_IB_FLAGS_SECURE; @@ -1215,14
> > +1176,12 @@ int cmd_submit_packet(cmd_context_t *ctx)
> >       }
> >
> >       /* Add IB as the last resource */
> > -     all_res[res_count++] = ib_bo;
> > +     all_res[res_count++] = ctx->ib_bo;
> >
> >       /* Create BO list */
> >       r = amdgpu_bo_list_create(ctx->device, res_count, all_res, NULL, &bo_list);
> >       if (r) {
> >               igt_debug("amdgpu_bo_list_create failed: %d\n", r);
> > -             amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address,
> > -                                    ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> >               return r;
> >       }
> >
> > @@ -1234,8 +1193,6 @@ int cmd_submit_packet(cmd_context_t *ctx)
> >       if (r != 0) {
> >               igt_debug("amdgpu_cs_submit failed: %d\n", r);
> >               amdgpu_bo_list_destroy(bo_list);
> > -             amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address,
> > -                                    ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> >               return r;
> >       }
> >
> > @@ -1243,10 +1200,11 @@ int cmd_submit_packet(cmd_context_t *ctx)
> >       ctx->last_submit_seq = ibs_request.seq_no;
> >       igt_debug("Command submitted successfully, seq_no=%lu\n", ctx-
> > >last_submit_seq);
> >
> > -     /* Cleanup resources */
> > +     /* The kernel has snapshotted the bo_list; it can be released now. */
> >       amdgpu_bo_list_destroy(bo_list);
> > -     amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address,
> > -                        ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> > +
> > +     ctx->submit_pending = true;
> > +     cmd_reset_packet_operands(ctx);
> >
> >       return 0;
> >  }
> > @@ -1258,14 +1216,9 @@ int cmd_place_packet(cmd_context_t *ctx, const
> > cmd_packet_params_t *params)
> >       if (!ctx || !ctx->initialized || !ctx->ip_block || !params)
> >               return -EINVAL;
> >
> > -     if (!ctx->ring_ctx || !ctx->ring_ctx->bo_cpu)
> > +     if (!ctx->ring_ctx)
> >               return -EINVAL;
> >
> > -     /* Clear the buffer before operation */
> > -     memset((void *)ctx->ring_ctx->bo_cpu, 0,
> > -     ctx->ring_ctx->write_length);
> > -
> > -
> >       /* Build the command packet based on type */
> >       switch (params->type) {
> >       case CMD_PACKET_WRITE_LINEAR:
> > @@ -1280,13 +1233,6 @@ int cmd_place_packet(cmd_context_t *ctx, const
> > cmd_packet_params_t *params)
> >               result = ctx->ip_block->funcs->write_linear(ctx->ip_block->funcs,
> >                                                      ctx->ring_ctx,
> >                                                      &ctx->ring_ctx->pm4_dw);
> > -
> > -             /*  Copy PM4 packet to ring buffer */
> > -             if (result == 0 && ctx->ring_ctx->pm4_dw > 0) {
> > -                     memcpy((void *)ctx->ring_ctx->bo_cpu,
> > -                            ctx->ring_ctx->pm4,
> > -                            ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> > -             }
> >               return result;
> >
> >       case CMD_PACKET_WRITE_ATOMIC:
> > @@ -1300,13 +1246,6 @@ int cmd_place_packet(cmd_context_t *ctx, const
> > cmd_packet_params_t *params)
> >               result = ctx->ip_block->funcs->write_linear_atomic(ctx->ip_block-
> > >funcs,
> >                                                     ctx->ring_ctx,
> >                                                     &ctx->ring_ctx->pm4_dw);
> > -
> > -             /*  Copy PM4 packet to ring buffer */
> > -             if (result == 0 && ctx->ring_ctx->pm4_dw > 0) {
> > -             memcpy((void *)ctx->ring_ctx->bo_cpu,
> > -             ctx->ring_ctx->pm4,
> > -             ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> > -             }
> >               return result;
> >
> >       case CMD_PACKET_COPY_LINEAR:
> > @@ -1321,16 +1260,6 @@ int cmd_place_packet(cmd_context_t *ctx, const
> > cmd_packet_params_t *params)
> >           result = ctx->ip_block->funcs->copy_linear(ctx->ip_block->funcs,
> >                                                     ctx->ring_ctx,
> >                                                     &ctx->ring_ctx->pm4_dw);
> > -
> > -         /* Copy PM4 packet to ring buffer */
> > -         if (result == 0 && ctx->ring_ctx->pm4_dw > 0) {
> > -             memcpy((void *)ctx->ring_ctx->bo_cpu,
> > -                    ctx->ring_ctx->pm4,
> > -                    ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> > -
> > -             //igt_info("cmd_place_packet: Copied %u DWORDs to ring buffer
> > (copy)\n",
> > -               //       ctx->ring_ctx->pm4_dw);
> > -         }
> >           return result;
> >
> >       case CMD_PACKET_COPY_ATOMIC:
> > @@ -1429,8 +1358,8 @@ int cmd_wait_completion(cmd_context_t *ctx)
> >                       return -EINVAL;
> >
> >               return amdgpu_timeline_syncobj_wait(ctx->device,
> > -                                                ctx->ring_ctx-
> > >timeline_syncobj_handle,
> > -                                                ctx->ring_ctx->point);
> > +                                                 ctx->ring_ctx-
> > >timeline_syncobj_handle,
> > +                                                 ctx->ring_ctx->point);
> >       }
> >
> >       /* For regular queues, wait on fence */ @@ -1441,8 +1370,8 @@ int
> > cmd_wait_completion(cmd_context_t *ctx)
> >       fence_status.fence = ctx->last_submit_seq;
> >
> >       return amdgpu_cs_query_fence_status(&fence_status,
> > -                                    AMDGPU_TIMEOUT_INFINITE,
> > -                                    0, &expired);
> > +                                         AMDGPU_TIMEOUT_INFINITE,
> > +                                         0, &expired);
> >  }
> >
> >  /**
> > diff --git a/lib/amdgpu/amd_command_submission.h
> > b/lib/amdgpu/amd_command_submission.h
> > index 331889161..8644f25ed 100644
> > --- a/lib/amdgpu/amd_command_submission.h
> > +++ b/lib/amdgpu/amd_command_submission.h
> > @@ -50,8 +50,16 @@ typedef struct {
> >      enum amd_ip_block_type ip_type;
> >      bool initialized;
> >      bool user_queue;
> > -    bool uses_external_bo;
> >      uint64_t last_submit_seq; /* Last submission sequence number */
> > +
> > +    /* IB shared by the user-queue and CS paths; created in cmd_context_create,
> > +     * freed in cmd_context_destroy, reusable across multiple submits.
> > +     */
> > +    amdgpu_bo_handle ib_bo;
> > +    void *ib_cpu;
> > +    uint64_t ib_mc;
> > +    amdgpu_va_handle ib_va;
> > +    bool submit_pending;   /* a submit is in flight; wait before reuse/free */
> >  } cmd_context_t;
> >
> >  /**
> > @@ -89,15 +97,92 @@ void
> > amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle
> > device,  void  amdgpu_command_ce_write_fence(amdgpu_device_handle dev,
> >                                         amdgpu_context_handle ctx);
> >
> > +/*
> > + * cmd_* command-submission API
> > + * ============================
> > + *
> > + * A small wrapper around raw amdgpu command submission that hides the
> > + * context / IB / bo_list / fence plumbing and lets a test issue
> > +DMA-style
> > + * operations (write, copy, const-fill, atomic) on an IP ring (SDMA,
> > +GFX or
> > + * Compute) by GPU virtual address.
> > + *
> > + * Lifecycle
> > + * ---------
> > + *   1. cmd_context_create()  - create a context bound to one IP ring. It
> > + *      allocates a reusable IB/PM4 buffer for the emitted packets.
> > + *   2. issue one or more operations (see the two API layers below).
> > + *   3. cmd_context_destroy()  - waits for any in-flight submission, then frees
> > + *      the IB and the context.
> > + *
> > + * Two API layers
> > + * --------------
> > + *   High-level convenience helpers build one packet and submit it in a single
> > + *   call:
> > + *       cmd_submit_write_linear(ctx, dst_va, size, data)
> > + *       cmd_submit_copy_linear (ctx, src_va, dst_va, size)
> > + *       cmd_submit_const_fill  (ctx, dst_va, size, data)
> > + *       cmd_submit_atomic      (ctx, dst_va, data)
> > + *
> > + *   Low-level path, for full control over cmd_packet_params_t (custom_data,
> > + *   fence/timestamp packets, etc.):
> > + *       cmd_place_packet(ctx, &params)          - build the PM4 stream
> > + *       cmd_submit_packet(ctx)                  - submit it
> > + *       cmd_place_and_submit_packet(ctx, &p)    - both of the above
> > + *
> > + * Semantics
> > + * ---------
> > + *   - Submission is asynchronous: cmd_submit_* returns after the CS is queued.
> > + *     The next submit on the same ctx, or cmd_context_destroy(), transparently
> > + *     waits for the previous one. Call cmd_wait_completion(ctx) to block
> > + *     explicitly (e.g. before reading back the destination).
> > + *   - Operands are plain GPU virtual addresses, not BOs. For every BO-backed
> > + *     address you pass (source, destination, fence/timestamp target, ...) call
> > + *     cmd_context_add_resource(ctx, bo) to add the owning BO to the residency
> > + *     set. The residency set is per-submit: it is cleared automatically once
> > + *     the packet has been captured for submission, so you must (re-)register
> > + *     every required BO immediately before each submit.
> > + *   - One call emits exactly one hardware packet and does NOT chunk. A transfer
> > + *     larger than the per-packet maximum (see amdgpu_dma_limits_query) will be
> > + *     rejected; the caller must split it. Return values are 0 on success or a
> > + *     negative errno (e.g. -ENOTSUP if the IP lacks the requested op).
> > + *
> > + * Example: fill then copy 4 KiB over the SDMA ring
> > + * ------------------------------------------------
> > + *   cmd_context_t *ctx;
> > + *   int r;
> > + *
> > + *   ctx = cmd_context_create(device, AMD_IP_DMA, 0, false);
> > + *   if (!ctx)
> > + *           return -ENODEV;
> > + *
> > + *   // Residency is per-submit, so register before every submit.
> > + *   cmd_context_add_resource(ctx, dst_bo);  // owns dst_va
> > + *   r = cmd_submit_const_fill(ctx, dst_va, 4096, 0xdeadbeef);
> > + *   if (!r) {
> > + *           cmd_context_add_resource(ctx, dst_bo);    // owns dst_va
> > + *           cmd_context_add_resource(ctx, dst2_bo);   // owns dst2_va
> > + *           r = cmd_submit_copy_linear(ctx, dst_va, dst2_va, 4096);
> > + *   }
> > + *
> > + *   cmd_wait_completion(ctx);   // ensure the copy has landed
> > + *   cmd_context_destroy(ctx);   // (would also wait) release resources
> > + *   return r;
> > + */
> >  cmd_context_t* cmd_context_create(amdgpu_device_handle device,
> >                                      enum amd_ip_block_type ip_type,
> >                                      uint32_t ring_id,
> > -                                    bool user_queue,
> > -                                    uint32_t write_length,
> > -                                    amdgpu_bo_handle external_bo,
> > -                                    uint64_t external_bo_mc,
> > -                                    volatile uint32_t *external_bo_cpu);
> > -void cmd_context_destroy(cmd_context_t *ctx, bool destroy_external_bo);
> > +                                    bool user_queue); void
> > +cmd_context_destroy(cmd_context_t *ctx);
> > +
> > +/*
> > + * Register a buffer object in the context's bo_list residency set so
> > +it is
> > + * resident when the next submission executes. See the cmd_* API
> > +overview above
> > + * cmd_context_create() for how this fits into the submission flow.
> > + *
> > + * Returns 0 on success, -EINVAL on bad arguments,
> > + * or -ENOSPC when the residency set (resources[]) is full.
> > + */
> > +int cmd_context_add_resource(cmd_context_t *ctx, amdgpu_bo_handle bo);
> >
> >  int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params);
> >
> > diff --git a/tests/amdgpu/amd_dmabuf_unload.c
> > b/tests/amdgpu/amd_dmabuf_unload.c
> > index 05ca3cf2c..0e43de0e6 100644
> > --- a/tests/amdgpu/amd_dmabuf_unload.c
> > +++ b/tests/amdgpu/amd_dmabuf_unload.c
> > @@ -121,9 +121,7 @@ static void test_fence_outlives_module(int vgem, int
> > amd_fd,
> >       igt_assert_eq(r, 0);
> >
> >       /* Create SDMA command context */
> > -     cmd_ctx = cmd_context_create(dev, AMD_IP_DMA, 0, false,
> > -                                  copy_size, src_bo, src_mc,
> > -                                  (volatile uint32_t *)src_cpu);
> > +     cmd_ctx = cmd_context_create(dev, AMD_IP_DMA, 0, false);
> >       igt_assert(cmd_ctx != NULL);
> >
> >       /*
> > @@ -138,17 +136,14 @@ static void test_fence_outlives_module(int vgem, int
> > amd_fd,
> >                            AMDGPU_VA_OP_MAP);
> >       igt_assert_eq(r, 0);
> >
> > -     /* Set up bo_list: IB (src), dst, imported VGEM BO */
> > -     cmd_ctx->ring_ctx->bo2 = dst_bo;
> > -     cmd_ctx->ring_ctx->bo_mc2 = dst_mc;
> > -     cmd_ctx->ring_ctx->resources[1] = dst_bo;
> > -     cmd_ctx->ring_ctx->resources[2] = import.buf_handle;
> > -     cmd_ctx->ring_ctx->res_cnt = 3;
> > -
> >       igt_info("Submitting %d x %llu-byte SDMA copies (no wait)...\n",
> >                NUM_SDMA_COPIES, (unsigned long long)copy_size);
> >
> >       for (i = 0; i < NUM_SDMA_COPIES; i++) {
> > +             igt_assert_eq(cmd_context_add_resource(cmd_ctx, src_bo), 0);
> > +             igt_assert_eq(cmd_context_add_resource(cmd_ctx, dst_bo), 0);
> > +             igt_assert_eq(cmd_context_add_resource(cmd_ctx,
> > import.buf_handle),
> > +0);
> > +
> >               r = cmd_submit_copy_linear(cmd_ctx,
> >                                          src_mc, dst_mc,
> >                                          (uint32_t)copy_size);
> > diff --git a/tests/amdgpu/amd_kfd_dmabuf_unload.c
> > b/tests/amdgpu/amd_kfd_dmabuf_unload.c
> > index 24260b560..28caf8982 100644
> > --- a/tests/amdgpu/amd_kfd_dmabuf_unload.c
> > +++ b/tests/amdgpu/amd_kfd_dmabuf_unload.c
> > @@ -309,23 +309,18 @@ static void test_kfd_fence_outlives_module(int vgem, int
> > amd_fd,
> >       igt_assert_eq(r, 0);
> >
> >       /* Create SDMA command context */
> > -     cmd_ctx = cmd_context_create(dev, AMD_IP_DMA, 0, false,
> > -                                  copy_size, src_bo, src_mc,
> > -                                  (volatile uint32_t *)src_cpu);
> > +     cmd_ctx = cmd_context_create(dev, AMD_IP_DMA, 0, false);
> >       igt_assert(cmd_ctx != NULL);
> >
> > -     /* Set up bo_list: IB (src), dst, imported VGEM BO */
> > -     cmd_ctx->ring_ctx->bo2 = dst_bo;
> > -     cmd_ctx->ring_ctx->bo_mc2 = dst_mc;
> > -     cmd_ctx->ring_ctx->resources[1] = dst_bo;
> > -     cmd_ctx->ring_ctx->resources[2] = import.buf_handle;
> > -     cmd_ctx->ring_ctx->res_cnt = 3;
> > -
> >       igt_info("Submitting %d SDMA copies "
> >                "(KFD amdgpu fences on dma_resv, no wait)...",
> >                NUM_SDMA_COPIES);
> >
> >       for (i = 0; i < NUM_SDMA_COPIES; i++) {
> > +             igt_assert_eq(cmd_context_add_resource(cmd_ctx, src_bo), 0);
> > +             igt_assert_eq(cmd_context_add_resource(cmd_ctx, dst_bo), 0);
> > +             igt_assert_eq(cmd_context_add_resource(cmd_ctx,
> > import.buf_handle),
> > +0);
> > +
> >               r = cmd_submit_copy_linear(cmd_ctx,
> >                                          src_mc, dst_mc,
> >                                          (uint32_t)copy_size);
> > diff --git a/tests/amdgpu/amd_mem.c b/tests/amdgpu/amd_mem.c index
> > 7c6855d3f..eef869b41 100644
> > --- a/tests/amdgpu/amd_mem.c
> > +++ b/tests/amdgpu/amd_mem.c
> only updates create/destroy signatures in three places,  only updates create/destroy signatures in three places, but two submit paths still omit residency registration:
> 
> test_cache_invalidate_on_sdma_write_asm (~line 855):
> 
> r = cmd_submit_write_linear(dma_ctx, vram_mc, sizeof(uint32_t), kPattern);
> Needs cmd_context_add_resource(dma_ctx, bo_vram) before submit. Without it, the CS bo_list may not include the destination BO → potential fault or undefined behavior.
> 
> submit_dma_write_operation (~lines 1961-1963) - broken after refactor:
> 
> r = cmd_submit_write_linear(ctx->dma_ctx,
>             ctx->dma_ctx->ring_ctx->bo_mc,  /* internal data BO - removed */
>             64, 0x12345678);
> 
>
Agreed. These two cases were missed. Fix coming in the next version.

Thanks,
Junhua

> Regards
> Jesse
> 
> > @@ -850,7 +850,7 @@ static void
> > test_cache_invalidate_on_sdma_write_asm(amdgpu_device_handle device,
> >
> >       /* 5. Issue SDMA write to buffer[0] while shader is polling */
> >       if (cmd_ring_available(device, AMD_IP_DMA, 0, false))
> > -             dma_ctx = cmd_context_create(device, AMD_IP_DMA, 0, false, 64,
> > NULL, 0, NULL);
> > +             dma_ctx = cmd_context_create(device, AMD_IP_DMA, 0, false);
> >       igt_assert(dma_ctx);
> >       r = cmd_submit_write_linear(dma_ctx, vram_mc, sizeof(uint32_t), kPattern);
> >       igt_assert_eq(r, 0);
> > @@ -875,7 +875,7 @@ static void
> > test_cache_invalidate_on_sdma_write_asm(amdgpu_device_handle device,
> >       igt_info("cache-invalidate-sdma-write: PASSED (dst[100]=0x%x)\n",
> > buf[dwLocation]);
> >
> >       /* Cleanup */
> > -     cmd_context_destroy(dma_ctx, false);
> > +     cmd_context_destroy(dma_ctx);
> >       amdgpu_bo_list_destroy(bo_list);
> >       amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_cmd, 4096);
> >       amdgpu_cs_ctx_free(compute_ctx);
> > @@ -1919,7 +1919,7 @@ static int init_dma_context(mm_bench_context_t *ctx,
> > amdgpu_device_handle device
> >       }
> >
> >       /* Create DMA context for ring 0 */
> > -     ctx->dma_ctx = cmd_context_create(device, AMD_IP_DMA, 0, false, 128,
> > NULL, 0, NULL);
> > +     ctx->dma_ctx = cmd_context_create(device, AMD_IP_DMA, 0, false);
> >       if (!ctx->dma_ctx) {
> >               igt_debug("Failed to create DMA context for ring 0\n");
> >               return -ENODEV;
> > @@ -1935,7 +1935,7 @@ static int init_dma_context(mm_bench_context_t *ctx,
> > amdgpu_device_handle device  static void
> > cleanup_dma_context(mm_bench_context_t *ctx)  {
> >       if (ctx->dma_ctx) {
> > -             cmd_context_destroy(ctx->dma_ctx, false);
> > +             cmd_context_destroy(ctx->dma_ctx);
> >               ctx->dma_ctx = NULL;
> >       }
> >  }
> > @@ -3164,10 +3164,11 @@ static void
> > test_signal_handling(amdgpu_device_handle device)
> >               /* Parent process - perform memory operations with signal handling
> > */
> >               igt_info("Parent process starting memory mapping operations...\n");
> >
> > -             /* FIX: Use cmd_context_create_ex with the same BO for both
> > internal buffer and target */
> > -             /* This ensures SDMA writes to the correct memory address */
> > -             dma_ctx = cmd_context_create(device, AMD_IP_DMA, 0, false,
> > 128,
> > -                                  sys_bo, sys_mc_address, (volatile uint32_t
> > *)sys_cpu_ptr);
> > +             /*
> > +              * Create a DMA context; sys_bo is registered in its residency set
> > +              * immediately before the submit below (residency is per-submit).
> > +              */
> > +             dma_ctx = cmd_context_create(device, AMD_IP_DMA, 0, false);
> >               igt_assert_f(dma_ctx, "Failed to create DMA command submission
> > context");
> >
> >               /* Wait for child process to complete with proper signal handling */
> > @@ -3215,6 +3216,7 @@ static void test_signal_handling(amdgpu_device_handle
> > device)
> >               igt_info("Writing 0xdeadbeaf to address 0x%" PRIx64 "\n",
> > sys_mc_address);
> >
> >               /* Now SDMA should write to the correct address since we're using
> > the same BO */
> > +             igt_assert_eq(cmd_context_add_resource(dma_ctx, sys_bo), 0);
> >               r = cmd_submit_write_linear(dma_ctx, sys_mc_address,
> > sizeof(uint32_t), 0xdeadbeaf);
> >               igt_info("cmd_submit_write_linear returned: %d\n", r);
> >               igt_assert_eq(r, 0);
> > @@ -3244,8 +3246,8 @@ static void test_signal_handling(amdgpu_device_handle
> > device)
> >
> >               igt_info("Memory successfully updated to: 0x%08x\n", sys_mem[0]);
> >
> > -             /* Cleanup command context - don't destroy the external BO */
> > -             cmd_context_destroy(dma_ctx, false);
> > +             /* Cleanup command context; sys_bo is owned by the caller. */
> > +             cmd_context_destroy(dma_ctx);
> >               dma_ctx = NULL;
> >       }
> >
> > --
> > 2.34.1
> 
