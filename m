Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08762C25B75
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 17:23:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817EA10E447;
	Wed, 15 May 2024 17:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FSEq1aBI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DD810E1BE
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 17:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715793778; x=1747329778;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5jRrZlGuwSP9h7HtwTwdsvyUwpZVUBMEO7JvTK+GG8c=;
 b=FSEq1aBI8nrXZVNZ8bQI0aTKoS8H8dxGZ8yg7J2GSeg2W/qXWEbYeXM7
 v4mGp5+tEgtlUsO0bW+GedlY1PDN4RhXqLQxiePOuEf8TH5is3t20D/g9
 yx5enF03XQmtVQzvP6/cspS7CTBdpGxmPSf8e1qV+kqKFQa3znLKFPAKW
 1Fh3135vUNCwt6TjfsB1ky2Af/jHAVryulqSfCms9p1cRliug9x7/vr4X
 jVw0UyZsGE+CaFDEuzUuc5aRs6dG4fI9RxevPMxFouwi2DFskaN4k+Tfz
 OwoNPepVLL2LYhxa2/KuIlnr4xDf82DJxbaEc++zyAy1tBcoKE2w1yeKT w==;
X-CSE-ConnectionGUID: v1UhrCq9T4qvk60pq4NPow==
X-CSE-MsgGUID: /baTEJzpQ5+GtOGec0TgpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="15686728"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="15686728"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 10:22:57 -0700
X-CSE-ConnectionGUID: yCTNuC2zTVCoJz23X6Whvw==
X-CSE-MsgGUID: E8+RsePzRqWzflSgNTzdZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="31258089"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 10:22:57 -0700
Date: Wed, 15 May 2024 19:22:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_kms: add retry loop in
 igt_enable_connectors()
Message-ID: <20240515172253.lavtpwd7sj2maauj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Luca Coelho <luciano.coelho@intel.com>
References: <20240514094957.862770-1-luciano.coelho@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240514094957.862770-1-luciano.coelho@intel.com>
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
On 2024-05-14 at 12:49:57 +0300, Luca Coelho wrote:
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
> ---
>  lib/igt_kms.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index f82102144ea1..3832bf54a2fc 100644
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
> +			igt_info("Could not read connector %u: %m (try %d of %d)\n",
----------- ^
Use igt_debug or print summary after for(tries < MAX_TRIES) loop.

> +				  res->connectors[i], tries, MAX_TRIES);
> +
> +			usleep(SLEEP_DURATION);
> +		}
> +
> +		if (tries == MAX_TRIES) {
> +			igt_warn("Could not read connector %u after %d tries, skipping\n",
> +				 res->connectors[i], MAX_TRIES);
>  			continue;

How long could it take in worst case?

Regards,
Kamil

>  		}
>  
> -- 
> 2.39.2
> 
