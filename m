Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49639C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 18:24:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0536A10E18B;
	Mon, 19 Aug 2024 18:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G1HRVUNA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE2010E18B
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 18:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724091896; x=1755627896;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zC3Fc2qokWrPGZbfO+BdoMhPcGmoeDZC5pxN82jzxyQ=;
 b=G1HRVUNA1QX++1HLXdb4bIGfE8aCKalGm/uRiafYLb53k/BxSHr834eq
 ud3lyj7NbwFe0G38EoEHcC8e3l4pqgtRtpxxC0GdZNs7qFNWXFTcbry8k
 XVjSsRAyXKUEvKhgeDVjMiyU2CqpJg9GWpR+JJoUk/4UTh51Q7iJ42rVP
 o5HoQztDtJJ7vV0CjdRkrUCDVBBabNRHO3F2jNEaOHZg1b6cdpp5mpxir
 ASpOHwQfJOoNv6no0UsCwBXKXQ7fMliw1b5gYcUPdAteraWwIQEBpzjcG
 C02jeIjDsbXXYwe4zTidW0lG2qpvz+5GHtaBjGW0VQxeDYm3oztewuUTf g==;
X-CSE-ConnectionGUID: AU9hDyWBSQipsRAqiFkTAQ==
X-CSE-MsgGUID: +StG+RHwRpCviWk1P3D2Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26155662"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="26155662"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 11:24:56 -0700
X-CSE-ConnectionGUID: ATavUYHdSPaHAFlWo/SrVw==
X-CSE-MsgGUID: HKlAJlCHTliAkbQxh+CdSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="97935909"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 11:24:54 -0700
Date: Mon, 19 Aug 2024 20:24:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 2/2] tests/kms_plane_scaling: msm get_num_scalars() support
Message-ID: <20240819182451.toxzr2tji4sd3wfq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Rob Clark <robdclark@chromium.org>
References: <20240814185339.70097-1-robdclark@gmail.com>
 <20240814185339.70097-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240814185339.70097-2-robdclark@gmail.com>
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

Hi Rob,
On 2024-08-14 at 11:53:39 -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 

Could you improve subject? Was:

[PATCH 2/2] tests/kms_plane_scaling: msm get_num_scalars() support

imho better:

[PATCH 2/2] tests/kms_plane_scaling: Improve msm support

or some other re-wording, no need here for mentioning
'get_num_scalars()' function

> This may undercount # of scalars on hw with rgb pipes, but the scaling
--------------------- ^

Please use word here, 'number'.

With these nits addressed
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> on yuv and rgb pipes is functionally equivalent, so for test coverage
> this is a good enough approximation.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  lib/igt_kms.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 99cdeeb76033..dd530dbabf89 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6682,6 +6682,25 @@ int get_num_scalers(igt_display_t *display, enum pipe pipe)
>  			igt_assert(start_loc2 = strstr(start_loc1, "num_scalers="));
>  			igt_assert_eq(sscanf(start_loc2, "num_scalers=%d", &num_scalers), 1);
>  		}
> +	} else if (is_msm_device(drm_fd)) {
> +		igt_plane_t *plane;
> +
> +		/*
> +		 * msm devices have dma pipes (no csc, no scaling), rgb
> +		 * pipes (no csc, has scaling), and vid pipes (has csc,
> +		 * has scaling), but not all devices have rgb pipes.
> +		 * We can use the # of pipes that support YUV formats
> +		 * as a rough approximation of the # of scalars.. it may
> +		 * undercount on some hw, but it will not overcount
> +		 */
> +		for_each_plane_on_pipe(display, pipe, plane) {
> +			for (unsigned i = 0; i < plane->format_mod_count; i++) {
> +				if (igt_format_is_yuv(plane->formats[i])) {
> +					num_scalers++;
> +					break;
> +				}
> +			}
> +		}
>  	}
>  
>  	return num_scalers;
> -- 
> 2.46.0
> 
