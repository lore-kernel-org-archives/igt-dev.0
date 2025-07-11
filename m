Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCA8C8303C
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 11:40:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E7C10E278;
	Fri, 11 Jul 2025 11:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WiHCKQ3k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776C810E278
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 11:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752234056; x=1783770056;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZxTIFCDd/pHTNo55Lc4YM8T5BdEuv1ZUBMaEJ5xy4Xw=;
 b=WiHCKQ3kzmn2hv+MTkRiyaAHxtMLSD0cXqpFvP4sNd7cAdrQXEZLgc1w
 fSXGRlDj+WIK4O87WtltSgvRXsVEcLh2TE+23FNAUznkl9MStZy7Chg4A
 0r8RdVAsWSY+vrxChbeuVQVA7rh8bC67eIxlvj0zTATLIbhYQJ+dAlyMH
 zH208Pm8fN+7bW4sIm2Q0p2rZzk/WnBVCzndHjEEFzyj2mskltxkvui+U
 Izm93IaCs0d2qsU7uxRl4Ddj2WvgRF8JhTPlwcWbinwjSjWvTZ/FfmVKa
 arlhFH/RvceiJ5c7cKxBmdEP2he7bGPdfxYA0hMRw/+JQDSHTwRKnqal9 A==;
X-CSE-ConnectionGUID: ueSp4XB6RXiGQifk5WRDag==
X-CSE-MsgGUID: 4LlyiLhxTdC3jVmyoWCu5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="65593995"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="65593995"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 04:40:56 -0700
X-CSE-ConnectionGUID: Z5ZU92xYQeKYRO60iOPU0w==
X-CSE-MsgGUID: 7Envwz3oTLKXWzJV3aLa6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="156844403"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 04:40:54 -0700
Date: Fri, 11 Jul 2025 13:40:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Hajda, Andrzej" <andrzej.hajda@intel.com>, zlice555@gmail.com,
 Zack Rusin <zack.rusin@broadcom.com>,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
 Martin Krastev <martin.krastev@broadcom.com>
Subject: Re: [PATCH i-g-t 3/3] lib/svga/vm_basic_types: fix musl libs
 compilation
Message-ID: <20250711114052.qw3r37xlfp27efb2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, zlice555@gmail.com,
 Zack Rusin <zack.rusin@broadcom.com>,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
 Martin Krastev <martin.krastev@broadcom.com>
References: <20250710190017.167735-1-kamil.konieczny@linux.intel.com>
 <20250710190017.167735-3-kamil.konieczny@linux.intel.com>
 <16279ed4-ada4-4e65-b4f6-db074ec73b8c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16279ed4-ada4-4e65-b4f6-db074ec73b8c@intel.com>
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

Hi Andrzej,
On 2025-07-11 at 10:18:02 +0200, Hajda, Andrzej wrote:
> 
> W dniu 10.07.2025 o 21:00, Kamil Konieczny pisze:
> > Fix gcc compilation on Void Linux with musl C libs, where
> > PAGE_SIZE is already defined.
> > 
> > Reported-by: zlice <zlice555@gmail.com>
> > Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/179
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >   lib/svga/vm_basic_types.h | 10 +++++++++-
> 
> 
> lib/svga contains generated headers, ie if, for some reason, it will be regenerated this will need to be re-applied.
> 
> Maybe it would be better to create some top-level libc-compat.h containing
> fixes for different variants of libc, like in Linux kernel, then include it
> either from headers, either from command line, whatever suits better.
> 
> Morever almost the same code is in lib/svga/vm_basic_types.h
> 
> 
> Regards
> 
> Andrzej

Having libc-compat.h seems good, I will add few more devs found
with git blame for discussion:

Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Cc: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Kamil

> >   1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/lib/svga/vm_basic_types.h b/lib/svga/vm_basic_types.h
> > index 8fec5b665..ea10a683c 100644
> > --- a/lib/svga/vm_basic_types.h
> > +++ b/lib/svga/vm_basic_types.h
> > @@ -27,7 +27,15 @@
> >   #define VM_BASIC_TYPES_H
> >   #define PAGE_SHIFT 12
> > -#define PAGE_SIZE (1 << PAGE_SHIFT)
> > +
> > +#ifndef PAGE_SIZE
> > +# define PAGE_SIZE (1 << PAGE_SHIFT)
> > +#else
> > +# if PAGE_SIZE != 4096
> > +#  error "Unexpected PAGE_SIZE"
> > +# endif
> > +#endif
> > +
> >   #define PAGE_MASK (~(PAGE_SIZE - 1))
> >   #define PAGE_ALIGN(addr) (((addr) + PAGE_SIZE - 1) & PAGE_MASK)
