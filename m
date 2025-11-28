Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB621D116EA
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 09:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D1210E04A;
	Fri, 28 Nov 2025 09:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cKMvXhff";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3ED110E04A
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 09:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764322847;
 bh=aKgaxX602FR92SIGcqzpcAA39pbHCIVMraLrbOpeW+k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cKMvXhfflAoA3gH7Frpfo5/KeavL/ngG4djXyjJ/Ztfkchv2Pfbvv/CcGjFnop3RL
 TqWwqqlAxa7VrsNPhdrkL8OLylLhIPNXdXEmAQmyEen2e0eFCL/NptwXLyQ7XwFDGI
 5vHyUUlZOnUTGKGIqLpUnY6NWngCWIw+wFWPox3AHZobUCbamZB5xpophwud4D0k6n
 bwxE5nicPvptcKr7DoCb0WPjgTuvcCvMGqVuX4NYmq7+kHsJL9UBY1CMphFuoeFy7J
 78D8piluhHBO3C8aFT1Bd+nTXqdUwbykLi95UjmiC8S8zXi3YOyO/Og2CTaPbACv3D
 vXVgFiOu8knMA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2734417E0117;
 Fri, 28 Nov 2025 10:40:47 +0100 (CET)
Date: Fri, 28 Nov 2025 10:40:43 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Steven Price <steven.price@arm.com>, Liviu
 Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH i-g-t v1 v1 3/3] tests/panthor: Add scheduler tests
Message-ID: <20251128104043.4b33976c@fedora>
In-Reply-To: <20251127150037.3s7celzcl25sv74h@kamilkon-DESK.igk.intel.com>
References: <20251126105558.3607460-1-boris.brezillon@collabora.com>
 <20251126105558.3607460-4-boris.brezillon@collabora.com>
 <20251127150037.3s7celzcl25sv74h@kamilkon-DESK.igk.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Hi Kamil,

On Thu, 27 Nov 2025 16:00:37 +0100
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi Boris,
> On 2025-11-26 at 11:55:58 +0100, Boris Brezillon wrote:
> > Tests developed while working on this set of fixes [1].
> > 
> > [1]https://lore.kernel.org/all/20251112115142.1270931-1-boris.brezillon@collabora.com/
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  lib/igt_panthor.c             |  46 +++++
> >  lib/igt_panthor.h             |  77 ++++++++
> >  tests/panthor/meson.build     |   1 +
> >  tests/panthor/panthor_sched.c | 338 ++++++++++++++++++++++++++++++++++
> >  4 files changed, 462 insertions(+)
> >  create mode 100644 tests/panthor/panthor_sched.c
> > 
> > diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
> > index 73ada9c59bfc..5ae1a26b0e44 100644
> > --- a/lib/igt_panthor.c
> > +++ b/lib/igt_panthor.c
> > @@ -2,6 +2,7 @@
> >  // SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
> >  
> >  #include "drmtest.h"
> > +#include "igt_aux.h"
> >  #include "igt_panthor.h"
> >  #include "ioctl_wrappers.h"
> >  #include "panthor_drm.h"
> > @@ -370,3 +371,48 @@ void igt_panthor_free_bo(int fd, struct panthor_bo *bo)
> >  
> >  	gem_close(fd, bo->handle);
> >  }
> > +
> > +void igt_panthor_ctx_create(int fd, struct panthor_ctx *ctx)  
> 
> Please add description to each new library function, here
> and below.

Done.

> 
> > +{
> > +	memset(ctx, 0, sizeof(*ctx));
> > +	igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO,
> > +			  &ctx->gpu_info, sizeof(ctx->gpu_info), 0);
> > +	igt_panthor_vm_create(fd, &ctx->vm, 0);
> > +}
> > +
> > +void igt_panthor_ctx_destroy(int fd, struct panthor_ctx *ctx)
> > +{
> > +	for (uint32_t i = 0; i < ctx->group_count; i++) {
> > +		struct drm_panthor_group_destroy group_destroy = {
> > +			.group_handle = ctx->groups[i],
> > +		};
> > +
> > +		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_PANTHOR_GROUP_DESTROY, &group_destroy), 0);
> > +	}
> > +
> > +	igt_panthor_vm_destroy(fd, ctx->vm, 0);
> > +}
> > +
> > +void igt_panthor_ctx_add_group(int fd, struct panthor_ctx *ctx,
> > +			       enum drm_panthor_group_priority group_prio,
> > +			       const struct drm_panthor_queue_create *queues,
> > +			       uint32_t queue_count)
> > +{
> > +	unsigned int shader_core_count = igt_hweight(ctx->gpu_info.shader_present);
> > +	struct drm_panthor_group_create group_create = {
> > +		.queues = DRM_PANTHOR_OBJ_ARRAY(queue_count, queues),
> > +		.max_compute_cores = shader_core_count,
> > +		.max_fragment_cores = shader_core_count,
> > +		.max_tiler_cores = 1,
> > +		.priority = group_prio,
> > +		.compute_core_mask = ctx->gpu_info.shader_present,
> > +		.fragment_core_mask = ctx->gpu_info.shader_present,
> > +		.tiler_core_mask = ctx->gpu_info.tiler_present,
> > +		.vm_id = ctx->vm,
> > +	};
> > +
> > +	igt_assert(ctx->group_count < ARRAY_SIZE(ctx->groups));
> > +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_PANTHOR_GROUP_CREATE, &group_create), 0);
> > +	igt_assert(group_create.group_handle > 0);
> > +	ctx->groups[ctx->group_count++] = group_create.group_handle;
> > +}
> > diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
> > index dc90033c0ad4..17b91b81cb40 100644
> > --- a/lib/igt_panthor.h
> > +++ b/lib/igt_panthor.h
> > @@ -9,6 +9,8 @@
> >  #include <stdbool.h>  
> 
> Add newline here.
> 
> >  #include "panthor_drm.h"
> >  
> > +#include "panthor_drm.h"  
> 
> You already have it.

Fixed.

Thanks,

Boris
