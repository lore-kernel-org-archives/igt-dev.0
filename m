Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C22C25B74
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 12:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A110F10EBD5;
	Tue, 21 May 2024 12:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h6N5Rrfn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A6310EBD5
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 12:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716295279; x=1747831279;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VKf7gxahHAyFvLixKXb+VRAUyVg3sw8phNTnSzc8I/c=;
 b=h6N5RrfnlMifpYJvva/lxorbylZdPiltt/1xv8IoDz/E9leV1aFoXkIq
 IyBtoayUuInhWvmt8P3Ae717t11D7SaYTgIhKsk6QI6+bvaFloW1AO7Lu
 JITTHn6MtUxidK2LJi7HDSwsWURgMEzaHZrCquXWH8dVH5cLn145lNM3w
 Pj9CSylqfSGICrTcGBgxkkz4tO6ijnIC632ZEtZjUTZpsI1QdfPL6ep24
 ODTvwNOp6wg0JWY7KW1ja8LLRcbSTmsDAGNtjj7YtIvWKIGolsrsnW0Zh
 o4nK10k4laEb+wD04Torkohhv6lAtyXsxr6kLorCJPLpt8avDx1BG2JMw g==;
X-CSE-ConnectionGUID: mSUZ8ph7TuSMkZXET8LxoA==
X-CSE-MsgGUID: 7VLjTOAiS5GW5Mtl+35yuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="16272146"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="16272146"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 05:41:18 -0700
X-CSE-ConnectionGUID: mfkt782uSmaywk/2ewJo4g==
X-CSE-MsgGUID: Rj1scCTpT1yw7It21mGxVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="37752319"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 05:41:17 -0700
Date: Tue, 21 May 2024 14:40:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>
Subject: Re: [PATCH v2 i-g-t] lib/igt_kms: add retry loop in
 igt_enable_connectors()
Message-ID: <20240521124057.sqteznnoep6oavny@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Luca Coelho <luciano.coelho@intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>
References: <20240520092216.150083-1-luciano.coelho@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240520092216.150083-1-luciano.coelho@intel.com>
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

Hi Luca,
On 2024-05-20 at 12:22:16 +0300, Luca Coelho wrote:
> Sometimes the connector is not fully initialized yet when we try to
> read it in igt_enable_connectors() and this causes a warning to be
> issued and the test to fail.  This can happen in normal situations,
> because there's no synchronization between the driver and IGT.  In
> some tests we load the module and immediately start reading the
> information, but the driver may not be fully initialized at that
> point, causing the problem.
> 
> To prevent this, add a retry loop in igt_enable_connectors() so we
> retry a few times, after a small delay, to wait for the initialization
> to complete.
> 
> The number of retries and the delay between retries were chose after
> running lots of tests, but these values may have to be adjusted after
> running more tests on different machines.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10436
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
> 
> In v2:
>    * Changed igt_info() to igt_debug() in the retry loop (Kamil)
>    * Changed the retry logs to start from 1 instead of 0 to avoid
>      confusion.
> 
>  lib/igt_kms.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index f82102144ea1..af63d13b1da3 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5386,7 +5386,10 @@ void igt_wait_for_vblank(int drm_fd, int crtc_offset)
>   */
>  void igt_enable_connectors(int drm_fd)
>  {
> +#define MAX_TRIES	10
> +#define SLEEP_DURATION	50000
>  	drmModeRes *res;
> +	int tries;
>  
>  	res = drmModeGetResources(drm_fd);
>  	if (!res)
> @@ -5395,10 +5398,28 @@ void igt_enable_connectors(int drm_fd)
>  	for (int i = 0; i < res->count_connectors; i++) {
>  		drmModeConnector *c;
>  
> -		/* Do a probe. This may be the first action after booting */
> -		c = drmModeGetConnector(drm_fd, res->connectors[i]);
> -		if (!c) {
> -			igt_warn("Could not read connector %u: %m\n", res->connectors[i]);
> +		/*
> +		 * The kernel returns the count of connectors before
> +		 * they're all fully set up, so we can have a race
> +		 * condition where we try to get the connector when
> +		 * it's not fully set up yet.  To avoid failing here
> +		 * in these cases, retry a few times.
> +		 */
> +		for (tries = 0; tries < MAX_TRIES; tries++) {
> +			/* Do a probe. This may be the first action after booting */
> +			c = drmModeGetConnector(drm_fd, res->connectors[i]);
> +			if (c)
> +				break;
> +
> +			igt_debug("Could not read connector %u: %m (try %d of %d)\n",
> +				  res->connectors[i], tries + 1, MAX_TRIES);
> +
> +			usleep(SLEEP_DURATION);
> +		}
> +
> +		if (tries == MAX_TRIES) {
> +			igt_warn("Could not read connector %u after %d tries, skipping\n",
> +				 res->connectors[i], MAX_TRIES);
>  			continue;
>  		}
>  
> -- 
> 2.39.2
> 
