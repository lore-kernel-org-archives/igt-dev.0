Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE204C54764
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 11:01:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AEE210E329;
	Mon, 19 Feb 2024 11:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cD3ycNyy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAF510E31C
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2024 11:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708340513; x=1739876513;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CHD/rUIKbqtHZfBz5jRnohJu9sE3SwBx/FeBuWL+pck=;
 b=cD3ycNyy99G0pae3m0WlNdzy6BMxP55PJ6FPVTKUWiR6wE5wEG7zVP5M
 UTGvBzRnV8i3PqONDwcfZ8AGA18EHJK5QI8wnar6P5mPwqL82CA+w9yIE
 MYR/h0rqP98O+slpEJdPot3Vmec/PpquR5GmAZJxMKoXWiMA4Cp6SG5GI
 s2mSzA9lbrM/yyJaoSkXDDz6Mdizg2tKftkC3aiVp/hZUJ6Er9fM/NAv5
 JGR0grZbw1X6nagBObh1Tw6FuEyP+ItBU2rlz//dNqLNtl4tBVhVH4Jlb
 MfcQ58M8hG73WGA5BVh79OZi4mTvqch0l+3BISI+pUw7d6xMd3Q1LeoWN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2544927"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2544927"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 03:01:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208";a="35489581"
Received: from unknown (HELO localhost) ([10.246.5.157])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 03:01:48 -0800
Date: Mon, 19 Feb 2024 12:01:45 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Arkadiusz Hiler <arek@hiler.eu>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t v4] lib/drmtest: drop legacy check from filtered
 opens
Message-ID: <20240219110145.7hrks6xlqcwksdvs@zkempczy-mobl2>
References: <20240216190534.79086-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240216190534.79086-1-kamil.konieczny@linux.intel.com>
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

On Fri, Feb 16, 2024 at 08:05:34PM +0100, Kamil Konieczny wrote:
> For some multi-GPU tests user can check them on single-GPU board
> with the help of repeating same card in --device option or
> environment var IGT_DEVICE:
> 
> sudo IGT_DEVICE=pci:vendor=Intel,card=0\;pci:vendor=Intel,card=0 \
> 	build/tests/gem_basic --r multigpu-create-close
> 
> but is unable to use it due to current implementation of device
> opening in function __drm_open_driver_another().
> 
> To allow this drop legacy check for already opened device when
> using filters.
> 
> v2: improving description, using filtered_count var (Janusz)
>   changing drmtest: to lib/drmtest: (Kamil)
>   adding Lukasz Laguna to Cc: (Kamil)
> v3: for out-of-bound index print debug, not a warning (Kamil)
> v4: restored using filters number for filtered path and restored
>   setting opened fds for legacy tests, changed description (Kamil)
> 
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> ---
>  lib/drmtest.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 52b5a2020..43e6c0158 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -481,13 +481,12 @@ static bool __get_card_for_nth_filter(int idx, struct igt_device_card *card)
>   *
>   * This function opens device in the following order:
>   *
> - * 1. when --device arguments are present:
> + * 1. when --device arguments are present or IGT_DEVICE env var is used:
>   *   * device scanning is executed,
>   *   * idx-th filter (starting with 0, filters are semicolon separated) is used
>   *   * if there is no idx-th filter, goto 2
>   *   * first device maching the filter is selected
> - *   * if it's already opened (for indexes = 0..idx-1) we fail with -1
> - *   * otherwise open the device and return the fd
> + *   * open the device and return the fd
>   *
>   * 2. compatibility mode - open the first DRM device we can find that is not
>   *    already opened for indexes 0..idx-1, searching up to 16 device nodes
> @@ -526,12 +525,19 @@ static bool __get_card_for_nth_filter(int idx, struct igt_device_card *card)
>   */
>  int __drm_open_driver_another(int idx, int chipset)
>  {
> +	int filter_count = igt_device_filter_count();
>  	int fd = -1;
>  
> -	if (chipset != DRIVER_VGEM && igt_device_filter_count() > idx) {
> +	if (chipset != DRIVER_VGEM && idx < filter_count) {
>  		struct igt_device_card card;
>  		bool found;
>  
> +		if (idx < 0) {
> +			igt_debug("Cannot open, index out of bounds: %d, filter_count=%d\n",
> +				 idx, filter_count);
> +			return -1;
> +		}
> +

Instead of above condition I think you should assert on the beginning
of the function:

igt_assert_lte(idx, 0);

Negative idx is invalid and we should catch this early.

--
Zbigniew

>  		found = __get_card_for_nth_filter(idx, &card);
>  
>  		if (!found) {
> @@ -542,8 +548,6 @@ int __drm_open_driver_another(int idx, int chipset)
>  		if (!found || !strlen(card.card))
>  			igt_warn("No card matches the filter! [%s]\n",
>  				 igt_device_filter_get(idx));
> -		else if (_is_already_opened(card.card, idx))
> -			igt_warn("card maching filter %d is already opened\n", idx);
>  		else
>  			fd = __open_driver_exact(card.card, chipset);
>  
> -- 
> 2.42.0
> 
