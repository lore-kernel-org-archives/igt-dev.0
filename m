Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9953606A323
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 12:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G48xRiIz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8A810E0CF;
	Tue, 20 Oct 2026 12:17:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9901410E0CF
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 12:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792498573; x=1824034573;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=w5QGpaR5wox+GZcK+JpUbOTiPqwGlsmZE/cuvd8kSW4=;
 b=G48xRiIzAwAj/FkW4Y9d7AfzeKSrBoq/eZD0pILxGprCjfaxwuZxlRmz
 Gz6NpzgjKQFxeodiTLIV8iv8fg/Rms4q/UJfV+RpxOymZjqVojrT4ChOf
 zqjg/AoqPZ5ygLvSMYOG3ZDzYOqU2lM4Q6plnXP9SexN5vY+RELmYhyn1
 KrPbyfRLbSKz3GBhWqwyucu5GAZ99NZ4i3is2Kly5/YXU4xhy1P604QmA
 RtFwmhscjys06EaxRtfZ8FeUfggWA0XBVIoDcZFlP8hnSxIDNkYrUmm6q
 RK8IOtjZKZI6SY+1satkeQK7Gfwepk42S6kE382WcLbRaRU/MDwq7ANEe Q==;
X-CSE-ConnectionGUID: KvMN2zxxRyKO0rD4FNpI4w==
X-CSE-MsgGUID: rKL1u4vlRAOjL1F6M/em0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1209852"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1209852"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 05:16:11 -0700
X-CSE-ConnectionGUID: IdF0ANSER8WM+/oJ5DqBdQ==
X-CSE-MsgGUID: 3vJExWGCQauNyiqJF+0uwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2704165"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 05:16:10 -0700
Date: Tue, 20 Oct 2026 14:16:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mark Yacoub <markyacoub@google.com>
Cc: igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH] tests/unigraf: Mitigate EDID cache races and zero-mode
 fallback panics
Message-ID: <20261020121607.ixdgnwfhxa5urzix@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 louis.chauvet@bootlin.com, Imre Deak <imre.deak@intel.com>
References: <20260813184227.2532503-1-markyacoub@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260813184227.2532503-1-markyacoub@google.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mark,
On 2026-08-13 at 14:42:27 -0400, Mark Yacoub wrote:
> When initializing the active output geometry directly following an external
> unigraf_hpd_pulse(), the legacy execution queried the DRM software cache for
> the current mode.
> 
> Because the kernel utilizes an asynchronous background interrupt thread to
> negotiate DP AUX EDID transactions, dynamically querying the software cache
> right as the kernel is processing the HPD pulse frequently yields 0 structural
> modes. Furthermore, since igt_output_get_mode() does not return a clean NULL
> pointer when count_modes == 0—but instead returns a pointer to an uninitialized
> geometry plane—dynamically assigning this blank pipe downstream fatally crashes
> the test execution suite when it attempts to allocate a 0x0 coordinate block.
> 
> This patch stabilizes the execution vectors fundamentally:
> 
> 1. It replaces igt_output_get_mode() with an active, polling drmModeGetConnector()
>    evaluation loop configured to block until conn->count_modes > 0. This enforces
>    strict timing synchronicity between the unigraf HPD pulse and the kernel
>    DP AUX handler.
> 2. It hoists the mode fetching logic strictly before establishing and binding
>    the software pipe to the CRTC, guaranteeing that the baseline hardware preferred
>    mode is secured before any DRM surfaces are allocated.
> 
> Signed-off-by: Mark Yacoub <markyacoub@google.com>
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

+cc Imre Deak

Regards,
Kamil

> ---
>  tests/unigraf/unigraf_lt.c | 34 ++++++++++++++++++++++++++++++----
>  1 file changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/unigraf/unigraf_lt.c b/tests/unigraf/unigraf_lt.c
> index 81e6ecd3f..0cac014e8 100644
> --- a/tests/unigraf/unigraf_lt.c
> +++ b/tests/unigraf/unigraf_lt.c
> @@ -38,19 +38,45 @@ static void init_output_and_display_pattern(igt_display_t *display, igt_output_t
>  	igt_crtc_t *crtc;
>  	struct igt_fb fb;
>  	igt_plane_t *primary;
> -	drmModeModeInfo *mode;
> +	drmModeModeInfo *mode = NULL;
>  	int fb_id;
> +	int retries = 10;
>  
>  	igt_modeset_disable_all_outputs(display);
>  	igt_display_reset(display);
>  
> +	/* Get the current mode */
> +
> +	while (retries--) {
> +		/* Force an active hardware probe instead of a cached one */
> +		drmModeConnector *conn = drmModeGetConnector(display->drm_fd, output->id);
> +
> +		if (conn && conn->count_modes > 0) {
> +			/* Found dynamically probed modes! Update the output config */
> +			drmModeFreeConnector(output->config.connector);
> +			output->config.connector = conn;
> +
> +			/* DO NOT call igt_output_refresh here! It would free our probed
> +			 * connector and replace it with drmModeGetConnectorCurrent. */
> +			mode = &conn->modes[0];
> +			if (mode && mode->hdisplay > 0)
> +				break;
> +		} else if (conn) {
> +			drmModeFreeConnector(conn);
> +		}
> +
> +		igt_info("Waiting for connector modes to repopulate after HPD pulse... (%d)\n",
> +			 retries);
> +		sleep(1);
> +	}
> +
> +	igt_assert(mode);
> +
>  	igt_output_set_crtc(output, 0);
>  	crtc = igt_get_crtc_for_output(display, output);
>  	igt_output_set_crtc(output, crtc);
>  
> -	/* Get the current mode */
> -	mode = igt_output_get_mode(output);
> -	igt_assert(mode);
> +	igt_info("Final Mode: %dx%d\n", mode->hdisplay, mode->vdisplay);
>  
>  	/* Create a framebuffer with a solid color pattern */
>  	fb_id = igt_create_color_pattern_fb(display->drm_fd, mode->hdisplay,
> -- 
> 2.55.0.691.gc56d675ccc-goog
> 
