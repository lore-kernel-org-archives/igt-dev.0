Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C1EC3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jul 2024 10:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C656710E553;
	Tue, 23 Jul 2024 10:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E2TTFQsZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7608210E553
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jul 2024 10:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721730992; x=1753266992;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UaNxb4ZswmzhfS8g1MF5Yrg4uNF46JZYtcpAGKcRHHc=;
 b=E2TTFQsZCwFib7hjS4hMXyXqAa8MM2RrYtdyvmSzIcDj7XFnZqJJlPUd
 hOHaEU+iizdgisxVFLt7ob2nMRYtYnpXJUhicwOfDSY2Yxf5ZPDOr1P9t
 7OnDih76mKaF/zUtxDpYKjNbHLTLRqKYEaRfOl+fJk0Vxolgshp5uo4Qc
 qyymznHj+ziIFk0D8sVl/FGhiHP7PSjrSsNelru/9QgzpTNUiwuCXHt0i
 vjs76GwLClplOJsn7fUyEPKR/ABrelDkjxg7pfeUhYnhpdcGUNHYQcqQX
 UVbatKoEW+fWATKrB0OH83Ei45/3vEX/pEdXPQEqsBjf/7pDCtV1RpXsq A==;
X-CSE-ConnectionGUID: WaCoP77ZRmGJl8dEkZT74A==
X-CSE-MsgGUID: eJWPXH6zSBGHQSWzzw82tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="36869816"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="36869816"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 03:36:32 -0700
X-CSE-ConnectionGUID: jQHnMgBGRk2mNegyEPXFow==
X-CSE-MsgGUID: OnDnc+jBRgy6TLSSspKdAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="57028651"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 03:36:29 -0700
Date: Tue, 23 Jul 2024 12:36:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 zbigniew.kempczynski@intel.com, lukasz.laguna@intel.com
Subject: Re: [PATCH v2 i-g-t 2/2] benchmarks/gem_wsim: Fix mmap for discrete
 graphics cards
Message-ID: <20240723103626.tyo27oxjyjnjtyr7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 zbigniew.kempczynski@intel.com, lukasz.laguna@intel.com
References: <20231214201302.29844-1-marcin.bernatowicz@linux.intel.com>
 <20231214201302.29844-3-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231214201302.29844-3-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2023-12-14 at 21:13:02 +0100, Marcin Bernatowicz wrote:
> It appears that 'gem_mmap__wc' doesn't work for discrete graphics cards
> and 'I915_MMAP_OFFSET_FIXED' is needed instead.
> Adopt the mapping approach from 'lib/igt_dummyload'.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>  benchmarks/gem_wsim.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index a1db37d4e..eafd9cab8 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -1502,7 +1502,16 @@ static unsigned int create_bb(struct w_step *w, int self)
>  	gem_set_domain(fd, w->bb_handle,
>  		       I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
>  
> -	cs = ptr = gem_mmap__wc(fd, w->bb_handle, 0, w->bb_size, PROT_WRITE);
> +	if (__gem_set_caching(fd, w->bb_handle,
> +			      I915_CACHING_CACHED) == 0) {
> +		cs = ptr = gem_mmap__cpu(fd, w->bb_handle,
> +					   0, w->bb_size,
> +					   PROT_READ | PROT_WRITE);
> +	} else

Be consistent, use brace after 'else':
	} else {

> +		cs = ptr = gem_mmap__device_coherent(fd,
> +						       w->bb_handle,
> +						       0, w->bb_size,
> +						       PROT_READ | PROT_WRITE);

so it will look like:
	} else {
		cs = ptr = gem_mmap__device_coherent(fd, w->bb_handle, 0,
						     w->bb_size,
						     PROT_READ | PROT_WRITE);
	}

Please use checkpatch.pl script from Linux kernel, it could spot
such problems, see also CONTRIBUTE.md for some helpful options.

With above fixed
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  
>  	/* Store initial 64b timestamp: start */
>  	*cs++ = MI_LOAD_REGISTER_IMM(1) | MI_CS_MMIO_DST;
> -- 
> 2.31.1
> 
