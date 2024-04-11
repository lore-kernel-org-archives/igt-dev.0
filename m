Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57F7C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 14:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE2910E076;
	Thu, 11 Apr 2024 14:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c2AVi8q7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B789E10F128
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 14:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712845980; x=1744381980;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YCXZXiXDJfarolqLdUmEoVJoy9vMlB/i9zcaS5NjiDg=;
 b=c2AVi8q7QCf2ehWhhUFBVmyQ7+7v6U35bk8rSJwySKrxW83Jzyphz7CX
 tYqk5vi2w93kxOr8x4gwV2iyJzXC6C9x1ngHEmKedV1aa/Vt3W1fIgwHC
 KtAl/PeDZzpmMGsOE6CbzLIjwGXU1o0F/tDy1AAhyzpAgdh/jz9ef0htf
 Wm84rwDqXAUTXQGDRYjbLcXX4ECSmqZJCW/jd8xmts67EEzlxb7l4w3c2
 EiLiDEzzqVBbkPn0kkvJwVLMZRHiU06m8XGx35tMfAEvXIcCslUaXofrB
 dgW9mtNWWcGut36Y23w5fwOj0uBe+nCTWgBoBKRhOd7Q595l513jmWerF g==;
X-CSE-ConnectionGUID: jdE9WjSfSrauEy0EtPKyUw==
X-CSE-MsgGUID: 5CJ+CrglQMil0J4SfFh4fg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8421130"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8421130"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:32:55 -0700
X-CSE-ConnectionGUID: gMxyUrOaQ/uTnw5kUlll6w==
X-CSE-MsgGUID: 07261g+jRiSUWKkEiwZ4dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="20922882"
Received: from unknown (HELO localhost) ([10.245.246.155])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:32:54 -0700
Date: Thu, 11 Apr 2024 16:32:52 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Vandita Kulkarni <vandita.kulkarni@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] tests/kms_async_flips: Reuse the already
 mmapped buffer
Message-ID: <20240411143252.e7vfpgfkkxbtcssu@zkempczy-mobl2>
References: <20240411114804.21206-1-vandita.kulkarni@intel.com>
 <20240411114804.21206-3-vandita.kulkarni@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240411114804.21206-3-vandita.kulkarni@intel.com>
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

On Thu, Apr 11, 2024 at 05:18:04PM +0530, Vandita Kulkarni wrote:
> In crc test case where we are trying to update the fb
> dont mmap it agian. On some platforms it was found that
> updating a newly mmapped buffer takes longer time.
> 
> Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/kms_async_flips.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 2895168f7..05f1f72cf 100644
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

With driver_priv renamed to fb_map:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +		}
>  	}
>  
>  	igt_plane_set_fb(data->plane, &data->bufs[0]);
> @@ -538,8 +545,7 @@ static void paint_fb(data_t *data, struct igt_fb *fb,
>  {
>  	if (is_intel_device(data->drm_fd)) {
>  		igt_draw_rect_fb(data->drm_fd, data->bops, 0, fb,
> -				 igt_draw_supports_method(data->drm_fd, IGT_DRAW_MMAP_GTT) ?
> -				 IGT_DRAW_MMAP_GTT : IGT_DRAW_MMAP_WC,
> +				 IGT_DRAW_MMAP_PTR,
>  				 0, 0, width, height, color);
>  	} else {
>  		cairo_t *cr;
> @@ -730,8 +736,11 @@ igt_main
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
> 2.43.2
> 
