Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDED1C53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 09:43:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A8E10EB49;
	Wed, 29 Jul 2026 09:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HWMpofWT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD6B10EB42
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 09:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785318150; x=1816854150;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=v6XdDRvtRXohwKUd5Yz96OM6T8tm0jAt83enPz+zrs0=;
 b=HWMpofWTjrFn5WBhquK3AbosTs+kZF4AfUhp/Rk4o7dTlZ8LFI6d0viK
 2Pj/ooaIdKLmjUuBiAIoN5cb6jn/Q0MelBQMMdueevLkW2I3n3kxFM8b7
 vg2HoAWmFqifzFuevYzNLchPz29hys9DEHtmBxjZ1yiqyh+8WmpQY0gQg
 jvAKC2sxx9bxv+FF9nmTfBqR8paQ3/lu+hFHaQqmldY61oGMOwVJOEc/w
 /8SRf1aQ0SDAK3hH6BvLjnzaS3Y8+gqmw6MlstLQMNAKvYjPBEWQAL4kI
 8pAoPh0NrGrx1EfUjNLu8DyzGfcRoYnt2uJ2ZzwhnSMlJPizh9G083HPm Q==;
X-CSE-ConnectionGUID: hCWSv4g9SHC3MH+qdAcpWQ==
X-CSE-MsgGUID: H/1eUW7YROWn9fYZVhSMqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89595045"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="89595045"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 02:42:29 -0700
X-CSE-ConnectionGUID: 8yGo18rVT46/3GtEXw7q6A==
X-CSE-MsgGUID: /k2OsyFmS0ScQQfLDtkKrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="255658005"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.218])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 02:42:27 -0700
Date: Wed, 29 Jul 2026 11:42:24 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, adam.miszczak@linux.intel.com, 
 kamil.konieczny@linux.intel.com, lukasz.laguna@intel.com
Subject: Re: [PATCH i-g-t 1/2] lib/xe/xe_spin: initialize ticks_delta to ~0u
Message-ID: <p5dtghxjmq72gubqeydls5spgmtlonwlb5rdhs2iaapsubxqfr@ucwnjmu3diio>
References: <20260728102659.316861-1-marcin.bernatowicz@linux.intel.com>
 <20260728102659.316861-2-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728102659.316861-2-marcin.bernatowicz@linux.intel.com>
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

On Tue, Jul 28, 2026 at 12:26:58PM +0200, Marcin Bernatowicz wrote:
> Initialize ticks_delta to ~0u instead of 0. This value does not satisfy
> the COND_BBE exit condition and prevents false batch termination.

May you elaborate? Does it mean STORE-DWORD (loop) is not visible in the memory
before COND_BBE is executed? IIUC with ~0 we could also drop this loop.

--
Zbigniew

> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  lib/xe/xe_spin.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 874310789..331bed1d2 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -60,7 +60,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>  	spin->start = 0;
>  	spin->end = 0xffffffff;
>  	spin->wait_cond = 0;
> -	spin->ticks_delta = 0;
> +	spin->ticks_delta = ~0u;
>  
>  	if (opts->ctx_ticks) {
>  		/* store start timestamp */
> -- 
> 2.43.0
> 
