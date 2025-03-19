Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0E6C35FFA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 19:21:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B76AF10E35D;
	Wed, 19 Mar 2025 19:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DuajdLQ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6725510E35D
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 19:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742412114; x=1773948114;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Re49mjle6o08Qk+i1tXdRvodMN337z/E5IzRjhvhdL8=;
 b=DuajdLQ5CvVMz5bLykScudKO17aNLwRYgGuenXXpVTW4e/ciwutWRcJi
 8c0vA47wl4T/fOKU+JQCZ8lQTS2tZhi6wSPt0SN2PwCb2qnTWYuHuPvzW
 HU4uBWIFDgTd7VLOpKJBAy+lPX4TVGdJlzXkZ/un82dsTRCebYxCJplDQ
 9TzExR6afyd76SSNfEaZnYPJuDR35TAbdKNqnsVGI/tpbj74Z/lWUbMyE
 u9sBbwWkyZTyOMYBlMgXIecK5Ml/TGOt3oAlsc3Y0Domzkn6CG9BBAPrB
 35u3wxzBbeVPr16iXfaHK0yaVUKY/grJqFECRzzSrgS6Ej7vO0l2YdnJf A==;
X-CSE-ConnectionGUID: UAtTT4flSRqTex/hmb5Pxg==
X-CSE-MsgGUID: teC3WSL9RiuSwOS1REX/YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="46379085"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="46379085"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 12:21:51 -0700
X-CSE-ConnectionGUID: bfTYCbwlTuGRMVzrDNv99g==
X-CSE-MsgGUID: hOwaamB5QjGgn7PdbmoN+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="159957899"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.29])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 12:21:49 -0700
Date: Wed, 19 Mar 2025 20:21:45 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/5] lib/intel_blt: Use blt_mem_copy() to stress
 copy functions
Message-ID: <20250319192145.kdwk2jxsbmvdyusa@zkempczy-mobl2>
References: <20250305090743.16894-1-francois.dugast@intel.com>
 <20250305090743.16894-4-francois.dugast@intel.com>
 <64ae230cc3358e1c750bc5749aa3f3bbeaba6092.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64ae230cc3358e1c750bc5749aa3f3bbeaba6092.camel@linux.intel.com>
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

On Wed, Mar 19, 2025 at 01:46:32PM +0100, Thomas Hellström wrote:
> On Wed, 2025-03-05 at 10:06 +0100, Francois Dugast wrote:
> > The new blt_mem_copy() argument ncopies is handed over to the
> > underlying function blt_bo_copy() which actually runs the copy,
> 
> Hmm. I'm confused by this commit message. Isn't it blt_mem_copy() that
> actually performs the copy?

Please check my answer at 6th March. I think 1/5 and 2/5 shouldn't
be merged in shape as they are now.

--
Zbigniew

> 
> >  so
> > that the caller of blt_mem_copy() can use a higher level function
> > to stress the hardware copy function.
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Otherwise LGTM.
> /Thomas
> 
> > ---
> >  lib/intel_blt.c             | 5 +++--
> >  lib/intel_blt.h             | 2 +-
> >  tests/intel/xe_copy_basic.c | 2 +-
> >  3 files changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> > index 315a2e145..5cdf1ea8d 100644
> > --- a/lib/intel_blt.c
> > +++ b/lib/intel_blt.c
> > @@ -1917,11 +1917,12 @@ int blt_mem_copy(int fd, const intel_ctx_t
> > *ctx,
> >   * @width: width
> >   * @height: height
> >   * @region: memory region
> > + * @ncopies: how many times copy is run, > 1 can be used to stress
> > the copy function
> >   *
> >   * Copy BO with mem blit from @src_handle into @dst_handle.
> >   */
> >  void blt_bo_copy(int fd, uint32_t src_handle, uint32_t dst_handle,
> > const intel_ctx_t *ctx,
> > -		 uint32_t size, uint32_t width, uint32_t height,
> > uint32_t region)
> > +		 uint32_t size, uint32_t width, uint32_t height,
> > uint32_t region, int ncopies)
> >  {
> >  	struct blt_mem_data mem = {};
> >  	uint64_t bb_size = xe_bb_size(fd, SZ_4K);
> > @@ -1948,7 +1949,7 @@ void blt_bo_copy(int fd, uint32_t src_handle,
> > uint32_t dst_handle, const intel_c
> >  	blt_set_batch(&mem.bb, bb, bb_size, region);
> >  	igt_assert(mem.src.width == mem.dst.width);
> >  
> > -	blt_mem_copy(fd, ctx, NULL, ahnd, &mem, 1);
> > +	blt_mem_copy(fd, ctx, NULL, ahnd, &mem, ncopies);
> >  	result = memcmp(mem.src.ptr, mem.dst.ptr, mem.src.size);
> >  
> >  	intel_allocator_bind(ahnd, 0, 0);
> > diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> > index 217cade02..86681f1dd 100644
> > --- a/lib/intel_blt.h
> > +++ b/lib/intel_blt.h
> > @@ -273,7 +273,7 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
> >  			 int ncopies);
> >  
> >  void blt_bo_copy(int fd, uint32_t src_handle, uint32_t dst_handle,
> > const intel_ctx_t *ctx,
> > -		 uint32_t size, uint32_t width, uint32_t height,
> > uint32_t region);
> > +		 uint32_t size, uint32_t width, uint32_t height,
> > uint32_t region, int ncopies);
> >  
> >  int blt_mem_set(int fd, const intel_ctx_t *ctx,
> >  			const struct intel_execution_engine2 *e,
> > uint64_t ahnd,
> > diff --git a/tests/intel/xe_copy_basic.c
> > b/tests/intel/xe_copy_basic.c
> > index 458106b0b..20926cbb7 100644
> > --- a/tests/intel/xe_copy_basic.c
> > +++ b/tests/intel/xe_copy_basic.c
> > @@ -44,7 +44,7 @@ static void
> >  mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const
> > intel_ctx_t *ctx,
> >  	 uint32_t size, uint32_t width, uint32_t height, uint32_t
> > region)
> >  {
> > -	blt_bo_copy(fd, src_handle, dst_handle, ctx, size, width,
> > height, region);
> > +	blt_bo_copy(fd, src_handle, dst_handle, ctx, size, width,
> > height, region, 1);
> >  }
> >  
> >  /**
> 
