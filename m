Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE3EC54E66
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 08:43:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 281A810FAAB;
	Fri, 15 Mar 2024 08:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="inRPY5ls";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3552510FAAB
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 08:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710492186; x=1742028186;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LuuyVkLhXWJ+rXi3r1q7FcSF3qVho6G4F1c2vPKNFgU=;
 b=inRPY5ls5uTww3V2FS1kT2Ut33tU/g9fObba4eFazQnfHjD0dd8AlOoQ
 sVOqcbCToDnAA+1s8eP7+W7YMANwgRBK2ISxX3vUF6qIsMFQgFlnMfqHz
 xKfc7IvMv7YQj5Gbbd/zEj/fN0l0txUIATUgTKobH8/rJ6VtuaAff7Evs
 u8Z+vmSXydu7tQhrSUTLVEtvGNpn5S7plzCbryPPZ+aghxSZu+Ujhzi61
 R7+6ViYZRKDHRWAov+p+2AM7Fz9+DlCnKEbnW3PBbJMJz+VQMV2D+RYuX
 kDByJroiVYFt8M06qO/NO1KxAb0D07nWHVtKNtEfHc/WmomEWX7Bc4b3S w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5536796"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5536796"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 01:42:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="827780545"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="827780545"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 15 Mar 2024 01:42:53 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Mar 2024 10:42:52 +0200
Date: Fri, 15 Mar 2024 10:42:52 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_async_flips: Re-calculate min flips per
 frame
Message-ID: <ZfQKDNg8PUgAlahN@intel.com>
References: <20240314055437.3942648-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240314055437.3942648-1-bhanuprakash.modem@intel.com>
X-Patchwork-Hint: comment
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

On Thu, Mar 14, 2024 at 11:24:37AM +0530, Bhanuprakash Modem wrote:
> As XE driver taking longer time for pinning, re-calculate to
> reduce the expected min flips per frame (by assuming the min
> pinning time as 1.2 ms). Otherwise test will fail, since we
> can't achieve those many flips per frame.

MIN_FLIPS_PER_FRAME==5. If xe can't even achieve that low number
then it's very broken.

> 
> Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_async_flips.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 2895168f7..ec2d86f4e 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -238,6 +238,19 @@ static void test_async_flip(data_t *data)
>  	int ret, frame;
>  	long long int fps;
>  	struct timeval start, end, diff;
> +	int min_flips_per_frame;
> +
> +	/*
> +	 * FIXME: As pinning is taking moretime in XE, recalculate min frames
> +	 * per frame (by considering the pinning time as 1.2 ms)
> +	 */
> +	min_flips_per_frame = 1000 / (data->refresh_rate * 1.2);
> +	igt_require(min_flips_per_frame);
> +
> +	if (min_flips_per_frame > MIN_FLIPS_PER_FRAME)
> +		min_flips_per_frame = MIN_FLIPS_PER_FRAME;
> +
> +	igt_info("Expected min flips per frame: %d\n", min_flips_per_frame);
>  
>  	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>  
> @@ -296,10 +309,10 @@ static void test_async_flip(data_t *data)
>  		timersub(&end, &start, &diff);
>  
>  		if (data->alternate_sync_async) {
> -			igt_assert_f(data->flip_interval < 1000.0 / (data->refresh_rate * MIN_FLIPS_PER_FRAME),
> +			igt_assert_f(data->flip_interval < 1000.0 / (data->refresh_rate * min_flips_per_frame),
>  				     "Flip interval not significantly smaller than vblank interval\n"
>  				     "Flip interval: %lfms, Refresh Rate = %dHz, Threshold = %d\n",
> -				     data->flip_interval, data->refresh_rate, MIN_FLIPS_PER_FRAME);
> +				     data->flip_interval, data->refresh_rate, min_flips_per_frame);
>  		}
>  
>  		frame++;
> @@ -307,7 +320,7 @@ static void test_async_flip(data_t *data)
>  
>  	if (!data->alternate_sync_async) {
>  		fps = frame * 1000 / RUN_TIME;
> -		igt_assert_f((fps / 1000) > (data->refresh_rate * MIN_FLIPS_PER_FRAME),
> +		igt_assert_f((fps / 1000) > (data->refresh_rate * min_flips_per_frame),
>  			     "FPS should be significantly higher than the refresh rate\n");
>  	}
>  }
> -- 
> 2.43.2

-- 
Ville Syrjälä
Intel
