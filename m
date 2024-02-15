Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C992C4829E
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 14:29:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0ACD10E8E7;
	Thu, 15 Feb 2024 14:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g7P89Z7o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3DC10E8E7
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 14:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708007363; x=1739543363;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Dvsdy81Dkl23S+X0DAbPWQ/u79i7gqExs+hV7TpC9Mg=;
 b=g7P89Z7oh7Ciu7YbdCZjLcDB09GE9ITyj3JfIxeLv+42WQch5pobmkqI
 btqYGb6cPSDFil2QoRsJNcAd7pijhVTMtToQiwasUqnHjsUcof8fz/Jhv
 8xFPfIlNxDWsXOIbHI5B1GV3F+aBr+QNU6KolGOWhQ32EwtE0wkCtFOqx
 2X1DhIPC0v1vDsTO6p7cjM5h7WOZJkkQ+C83ep+QkPKX1BsXl+XufSfT/
 XLjRM34mU3XTZBNEr46t4Dh81FbWxoSe4BdimIsFqfbDk6LjzdNOCwRwo
 07PB4H1G1CTzZ3MplAgYVEsin+5t0nPkolFBCSr5Z1b4kmJZtxHvhDrJG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="19514908"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="19514908"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 06:29:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="826420313"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="826420313"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orsmga001-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 06:29:10 -0800
Date: Thu, 15 Feb 2024 15:29:08 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Arkadiusz Hiler <arek@hiler.eu>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v2] lib/drmtest: drop legacy path from filtered opens
Message-ID: <20240215142908.7uq4fhyqox2rr4cf@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Arkadiusz Hiler <arek@hiler.eu>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240214131610.41709-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240214131610.41709-1-kamil.konieczny@linux.intel.com>
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

Hi,
On 2024-02-14 at 14:16:10 +0100, Kamil Konieczny wrote:
> For some multi-GPU tests user can check them on single-GPU board
> with the help of repeating same card in --device option or
> environment var IGT_DEVICE:
> 
> sudo IGT_DEVICE=pci:vendor=Intel,card=0\;pci:vendor=Intel,card=0 \
> 	build/tests/gem_basic --r multigpu-create-close
> 
> but is unable to use it due to current implementation of device
> opening in function __drm_open_driver_another(). It will also
> prevent restricting multiGPU test to only two cards on three or
> four card board.
> 
> To allow this separate legacy opening path from filtered one and
> do not fallback into legacy path when index for card exceeds
> number of filtered devices. Use local opened fds table only for
> legacy opens so that path is not affected.
> When filters are used for multi-GPU tests user should provide all
> of them needed for testing, this could be done with the help of
> incrementing filters or with "card=all":
> 
> sudo IGT_DEVICE=pci:vendor=Intel,card=all \
> 	build/tests/gem_basic --r multigpu-create-close
> 
> v2: improving description, using filtered_count var (Janusz)
>   changing drmtest: to lib/drmtest: (Kamil)
>   adding Lukasz Laguna to Cc: (Kamil)
> 
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/drmtest.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 52b5a2020..e718d6291 100644
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
> - *   * if there is no idx-th filter, goto 2
> + *   * if there is no idx-th filter fail with -1
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
> +	if (chipset != DRIVER_VGEM && filter_count) {
>  		struct igt_device_card card;
>  		bool found;
>  
> +		if (idx < 0 || idx >= filter_count) {
> +			igt_warn("Cannot open, index out of bounds: %d, filter_count=%d\n",

This warn is causing fails in igt@kms_prime@basic-crc-vgem on DG2
instead of skip, I will turn it into igt_debug and send v3.

Regards,
Kamil

> +				 idx, filter_count);
> +			return -1;
> +		}
> +
>  		found = __get_card_for_nth_filter(idx, &card);
>  
>  		if (!found) {
> @@ -542,19 +548,17 @@ int __drm_open_driver_another(int idx, int chipset)
>  		if (!found || !strlen(card.card))
>  			igt_warn("No card matches the filter! [%s]\n",
>  				 igt_device_filter_get(idx));
> -		else if (_is_already_opened(card.card, idx))
> -			igt_warn("card maching filter %d is already opened\n", idx);
>  		else
>  			fd = __open_driver_exact(card.card, chipset);
>  
>  	} else {
>  		/* no filter for device idx, let's open whatever is available */
>  		fd = __open_driver("/dev/dri/card", 0, chipset, idx);
> +		if (fd >= 0)
> +			_set_opened_fd(idx, fd);
>  	}
>  
>  	if (fd >= 0) {
> -		_set_opened_fd(idx, fd);
> -
>  		/* Cache xe_device struct. */
>  		if (is_xe_device(fd))
>  			xe_device_get(fd);
> -- 
> 2.42.0
> 
