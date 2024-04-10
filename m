Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F228ACD1296
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 08:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7D010E119;
	Wed, 10 Apr 2024 08:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Maiit4rJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD6310E2CE
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 08:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712738278; x=1744274278;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WlOcacGzdKpxe4OR4iwXdUL0y8WZTW0PF50JZetzJ6Y=;
 b=Maiit4rJ4KvQGvWDdHc1ByBLkdrU4VGq8dC8HX5zAzr5Ykqd8BGIK4m1
 tcQ/nY81Hb0rS7tMf5jSYdhhanwL9saD8AwzlNGyBE1UgLCysPfp7EhTX
 dQqK7eNuW+4HwdxIRiAH4raFDTd0//DEJAXYIeoj7D1oxWoZLUtVwrtQq
 rv9jGapvjnKkQQkNyHMxA+E/cdkysBjGwjxTEG+Svr3GE6VG+reVQUgwc
 3pp4/BxbYbUieSfhRm/0mLiE8EgeVQvIldF6e03UzegU0UxEV7Qg8vScs
 WoNaNaqWGsUNrYF4erjwiL54FlPlXtMJwUbh6/Akq0WKCktOegynpFG3T w==;
X-CSE-ConnectionGUID: 3hKhyaEXRjeXjsLTR54czQ==
X-CSE-MsgGUID: ITyXTqQ3TrqBEYtMFtja/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19474993"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="19474993"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 01:37:58 -0700
X-CSE-ConnectionGUID: yN+cTDFmRDG2uGS61/hokQ==
X-CSE-MsgGUID: Bsdv6yH3QeqhzFK/tBVrhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20511119"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.142])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 01:37:56 -0700
Date: Wed, 10 Apr 2024 10:37:54 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/gem|xe_ccs: Check surface ccs data
 instead of naive comparison
Message-ID: <20240410083754.jameb4cfwtg65kdd@zkempczy-mobl2>
References: <20240329091655.1347862-1-zbigniew.kempczynski@intel.com>
 <20240329091655.1347862-3-zbigniew.kempczynski@intel.com>
 <8e2ab6f9-7619-43ef-8cab-29c3a7e8bbd9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e2ab6f9-7619-43ef-8cab-29c3a7e8bbd9@intel.com>
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

On Fri, Mar 29, 2024 at 02:40:50PM +0100, Karolina Stolarek wrote:
> On 29.03.2024 10:16, Zbigniew Kempczyński wrote:
> > Start using function which extracts ccs data from the surface and
> > determines its compression.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Karolina Stolarek <karolina.stolarek@intel.com>
> > Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> > ---
> >   tests/intel/gem_ccs.c | 15 ++++++++++++---
> >   tests/intel/xe_ccs.c  |  9 +++------
> >   2 files changed, 15 insertions(+), 9 deletions(-)
> > 
> > diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
> > index e4126bcaa8..c59fc69fb7 100644
> > --- a/tests/intel/gem_ccs.c
> > +++ b/tests/intel/gem_ccs.c
> > @@ -305,6 +305,10 @@ static int blt_block_copy3(int i915,
> >   	return ret;
> >   }
> > +#define CHECK_FROM_WIDTH 256
> > +#define CHECK_FROM_HEIGHT 256
> 
> I'm not a fan of adding another magic number to the mix. I know it's hardly
> magic, you found it by testing, but could we at least define it as a half of
> default dimensions (512x512)?

But this might stop being true if someone will decrease width/height
to 256/256. So defining as a half will decrease to 128/128 what is not
my intention.

> 
> > +#define FROM_EXP_WH(w, h) ((w) >= CHECK_FROM_WIDTH && (h) >= CHECK_FROM_HEIGHT)
> > +
> >   static void block_copy(int i915,
> >   		       const intel_ctx_t *ctx,
> >   		       const struct intel_execution_engine2 *e,
> > @@ -359,9 +363,14 @@ static void block_copy(int i915,
> >   	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
> >   	gem_sync(i915, mid->handle);
> > -	/* We expect mid != src if there's compression */
> > -	if (mid->compression)
> > -		igt_assert(memcmp(src->ptr, mid->ptr, src->size) != 0);
> > +	/*
> > +	 * We expect mid != src if there's compression. Ignore this for small
> > +	 * width x height for linear as compression for gradient occurs in the
> > +	 * middle for bigger sizes.
> > +	 */
> 
> You mention we ignore this check for small surfaces with no tiling, but
> there's no check for mid_tiling. Is that on purpose? This comment applies to
> comments both in gem_ccs and xe_ccs.

Agree, with the proposed code above comment is inadequate. I'll rephrase
it.

Thank you very much for the review.

--
Zbigniew

> 
> Many thanks,
> Karolina
> 
> > +	if (mid->compression && FROM_EXP_WH(width, height))
> > +		igt_assert(blt_surface_is_compressed(i915, (intel_ctx_t *)ctx, e,
> > +						     ahnd, mid));
> >   	WRITE_PNG(i915, run_id, "mid", &blt.dst, width, height, bpp);
> > diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> > index 7d0f2f2a11..5525aaed65 100644
> > --- a/tests/intel/xe_ccs.c
> > +++ b/tests/intel/xe_ccs.c
> > @@ -361,13 +361,10 @@ static void block_copy(int xe,
> >   	/*
> >   	 * We expect mid != src if there's compression. Ignore this for small
> >   	 * width x height for linear as compression for gradient occurs in the
> > -	 * middle for bigger sizes. We also ignore 1x1 as this looks same for
> > -	 * xmajor.
> > +	 * middle for bigger sizes.
> >   	 */
> > -	if (mid->compression && MIN_EXP_WH(width, height)) {
> > -		if (mid_tiling != T_LINEAR || FROM_EXP_WH(width, height))
> > -			igt_assert(memcmp(src->ptr, mid->ptr, src->size) != 0);
> > -	}
> > +	if (mid->compression && FROM_EXP_WH(width, height))
> > +		igt_assert(blt_surface_is_compressed(xe, ctx, NULL, ahnd, mid));
> >   	WRITE_PNG(xe, run_id, "mid", &blt.dst, width, height, bpp);
