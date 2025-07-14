Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA86C83F1B
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 09:34:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89B410E16F;
	Mon, 14 Jul 2025 09:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oe2uFNvR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE20A10E16F
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 09:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752485671; x=1784021671;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rDbvocD140QHr8XS9qNtSq+KX2jU/l6xe3VtveFhopQ=;
 b=Oe2uFNvR2pLUqMfLIEec/gAlJeimE6qJ/Lf8qKVskkoXq9LHp4+rBsBr
 mJHILqR2ZSFbjuoahyjbKFxVGsf9Gqh1DnoDXG5enj9liMFZzUyab9Xf8
 lq/FNNNleO1w8RJAahwofyH7XG7BytBvLQx0ta/enHMC0bkFgtfqEYGUg
 yh8RXlkJKOFLX+hRo70RBavDieItXXwMo4fyVxrR//Wp83fpBra0pL05M
 YKV5ZkM241RvMbMqnDfvRBJshqqFHBe6pEmt55p3zdT1DdO+dNEQpLU1S
 Hn6A9c7/ER+a/zkY+TGUJns/LKmzgKYbvU8jLW7MG1t/UHlhnEY9jGdLe A==;
X-CSE-ConnectionGUID: TznjpRjdRQWCAfIoSnl6zA==
X-CSE-MsgGUID: Ud++AxPtQnW1FbrPJVD4sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72249723"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="72249723"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 02:34:30 -0700
X-CSE-ConnectionGUID: h/A78sR4RIyAto303mN80Q==
X-CSE-MsgGUID: rZfnkkKzT1y1/NSuKDDYGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="162447533"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 02:34:28 -0700
Date: Mon, 14 Jul 2025 11:34:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: igt-dev@lists.freedesktop.org, zlice555@gmail.com,
 Melissa Wen <mwen@igalia.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH i-g-t v1 1/3] lib/igt_vc4: Fix musl libc compilation
Message-ID: <20250714093425.63ervdonnyzbo5db@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 igt-dev@lists.freedesktop.org, zlice555@gmail.com,
 Melissa Wen <mwen@igalia.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <20250710190017.167735-1-kamil.konieczny@linux.intel.com>
 <20250710190017.167735-5-kamil.konieczny@linux.intel.com>
 <20250711113239.uxhsil4lkvbgnnm3@kamilkon-DESK.igk.intel.com>
 <db8e01cb-058c-40e7-a272-a76ec924fef3@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db8e01cb-058c-40e7-a272-a76ec924fef3@igalia.com>
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

Hi Maíra,
On 2025-07-11 at 11:45:27 -0300, Maíra Canal wrote:
> Hi Kamil,
> 
> On 11/07/25 08:32, Kamil Konieczny wrote:
> > Hi ,
> > On 2025-07-10 at 21:00:14 +0200, Kamil Konieczny wrote:
> > > Fix gcc compilation on Void Linux with musl C libs, where
> > > PAGE_SIZE is already defined.
> > > 
> > 
> > Sorry, I forgot adding vc4 developers to Cc:
> > 
> > Cc: "Maíra Canal" <mcanal@igalia.com>
> > Cc: Melissa Wen <mwen@igalia.com>
> > Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> > Cc: Vignesh Raman <vignesh.raman@collabora.com>
> > 
> > Also +cc Andrzej Hajda <andrzej.hajda@intel.com>
> > 
> > > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > ---
> > >   lib/igt_vc4.h | 8 +++++++-
> > >   1 file changed, 7 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/lib/igt_vc4.h b/lib/igt_vc4.h
> > > index fe7173c50..165872ba2 100644
> > > --- a/lib/igt_vc4.h
> > > +++ b/lib/igt_vc4.h
> > > @@ -31,7 +31,13 @@
> > >   #include "igt_fb.h"
> > >   #include "vc4_drm.h"
> > > -#define PAGE_SIZE 4096
> > > +#ifndef PAGE_SIZE
> > > +# define PAGE_SIZE 4096
> > > +#else
> > > +# if PAGE_SIZE != 4096
> > > +#  error "Unexpected PAGE_SIZE"
> > > +# endif
> > > +#endif
> > 
> > I am not sure if vc4 needs exactly 4KB as bo, or is it good
> > to have whatever comes from compilation environment?
> 
> The GPU uses 4KB pages, so, that's the reason we define PAGE_SIZE to
> 4096. It would be ideal to keep using the size of 4096 in vc4 tests.
> Hence, I'd suggest you to just rename PAGE_SIZE to something like
> GPU_PAGE_SIZE or VC4_PAGE_SIZE.
> 
> Thanks for CCing me!
> 
> Best Regards,
> - Maíra
> 

Thank you for responding, I will use VC4_GPU_PAGE_SIZE

Regards,
Kamil

> > Other proposed change was smaller:
> > 
> > #ifndef PAGE_SIZE
> > #define PAGE_SIZE 4096
> > #endif
> > 
> > Regards,
> > Kamil
> > 
> > >   uint32_t igt_vc4_get_cleared_bo(int fd, size_t size, uint32_t clearval);
> > >   int igt_vc4_create_bo(int fd, size_t size);
> > > -- 
> > > 2.50.1
> > > 
> 
