Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A06C54E5D
	for <igt-dev@archiver.kernel.org>; Tue, 19 Mar 2024 13:24:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1F110F00F;
	Tue, 19 Mar 2024 13:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="czUnRiG1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437E210FAB7
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Mar 2024 13:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710854687; x=1742390687;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=q8XZlUts+3QjXAB13ktIHlpAZjKROk2WM46Eq/Ej6oE=;
 b=czUnRiG1sMTU/pUMslvZckf1HerFRckykXBBSn8CE9Jo9ajzVz/K4sTV
 FnyKolqevFiy92l7TKr1esdYXdmLYzBEHx/SA0o37muG5XqE8iuorPhwi
 3gDte39tBmTKaDrMrcTzAihHluW5VDa7F6Mk0ZNw0Khb9X+OunIow7qst
 uiNxC7hqS7SRkLsBbOFa6TKSBpct6SY5firfY3Ri5VhUofVLW6xlNpwXz
 D/nOGRqYLPc5k6U2HkQXXvA0qafPHLPXLM33yeKiYpQESFF/EUMGOvYNk
 rInICSrFyWFhnUPYDIp1M/t94XA9309J8UieAF+1byarW5WQvJKDKonl+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="9490329"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="9490329"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 06:24:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="51250970"
Received: from unknown (HELO localhost) ([10.245.246.227])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 06:24:45 -0700
Date: Tue, 19 Mar 2024 14:24:42 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Vandita Kulkarni <vandita.kulkarni@intel.com>
Cc: igt-dev@lists.freedesktop.org, bhanuprakash.modem@intel.com
Subject: Re: [PATCH i-g-t 2/3] tests/kms_async_flips: Reuse the already
 mmapped buffer
Message-ID: <20240319132442.4ovwwrb6s6sxmfap@zkempczy-mobl2>
References: <20240315061142.6591-1-vandita.kulkarni@intel.com>
 <20240315061142.6591-3-vandita.kulkarni@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240315061142.6591-3-vandita.kulkarni@intel.com>
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

On Fri, Mar 15, 2024 at 11:41:41AM +0530, Vandita Kulkarni wrote:
> In crc test case where we are trying to update the fb
> dont mmap it agian. On some platforms it was found that
> updating a newly mmapped buffer takes longer time.
> 
> Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> ---
>  tests/kms_async_flips.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 2895168f7..4658ca4c0 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -221,12 +221,19 @@ static void test_init_fbs(data_t *data)
>  		prev_modifier = data->modifier;
>  
>  		if (data->bufs[0].fb_id) {
> -			for (i = 0; i < NUM_FBS; i++)
> +			for (i = 0; i < NUM_FBS; i++) {
> +				if (is_intel_device(data->drm_fd))
> +					igt_fb_unmap_buffer(&data->bufs[i], data->bufs[i].driver_priv);

Ok, you're smuggling mmaped fb via driver_priv field. It's fine for me,
I see only nouveau is using this field on their need but this won't
interfere. From me:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  				igt_remove_fb(data->drm_fd, &data->bufs[i]);
> +			}
>  		}
>  
> -		for (i = 0; i < NUM_FBS; i++)
> +		for (i = 0; i < NUM_FBS; i++) {
>  			make_fb(data, &data->bufs[i], width, height, i);
> +			if (is_intel_device(data->drm_fd))
> +				data->bufs[i].driver_priv = igt_fb_map_buffer(data->drm_fd,
> +									      &data->bufs[i]);
> +		}
>  	}
>  
>  	igt_plane_set_fb(data->plane, &data->bufs[0]);
> @@ -730,8 +737,11 @@ igt_main
>  	}
>  
>  	igt_fixture {
> -		for (i = 0; i < NUM_FBS; i++)
> +		for (i = 0; i < NUM_FBS; i++) {
> +			if (is_intel_device(data.drm_fd))
> +				igt_fb_unmap_buffer(&data.bufs[i], data.bufs[i].driver_priv);
>  			igt_remove_fb(data.drm_fd, &data.bufs[i]);
> +		}
>  
>  		if (is_intel_device(data.drm_fd))
>  			buf_ops_destroy(data.bops);
> -- 
> 2.34.1
> 
