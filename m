Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE180C0218A
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 12:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAC910E95A;
	Thu, 30 Jan 2025 12:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y7r2iVVD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2C510E22E
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 12:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738241470; x=1769777470;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7qk+idPE66lRu95GLNtjNhFxjzEVakwZKvv1xZw1Aas=;
 b=Y7r2iVVD+4ohKAvWNMZVxjP2I+Ga8i4bp+b3YSJebM6USI4I0jypvyTV
 0uX8ODV/Gp7VyK5iH5uFqe5xliEtqTTfwRfg3RfBAJejS/XNlAQ+x15W6
 YyhFLUT1BrSEWF+gdc8oJID4dUdGZtFwZYq9rJ/fat6ExDCSYgQHtWqrU
 HHPxjurcY0FFT9lxLvyxR5t9Zf+JU7CUdmfEwMKxedFerTR9Y6lU0hZq9
 dHJf8VdDjF09T38Zr1/yV1vcK5fzcKYFe1hNwD0gaHy0SOFpgaTLlPxcg
 3ZzHBX0L7RWShJ0m7JvPPdockTdVRO+mkikNzk5etvtGTW4RaBUGRLqKd Q==;
X-CSE-ConnectionGUID: jMgdTHj4RqGdlAyKjijxmQ==
X-CSE-MsgGUID: b7T8wvxMTRuARMAgsCLDhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="56320940"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="56320940"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 04:51:09 -0800
X-CSE-ConnectionGUID: b/lKHQdcRharbyhCjpfY4A==
X-CSE-MsgGUID: 7A67wBr9RD6oSLqqVkwR9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="109123784"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 04:51:07 -0800
Date: Thu, 30 Jan 2025 13:51:04 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 quic_abhinavk@quicinc.com, igt-dev@lists.freedesktop.org,
 Alex Hung <alex.hung@amd.com>, Esha Bharadwaj <quic_ebharadw@quicinc.com>
Subject: Re: [PATCH i-g-t v5 1/3] lib/igt_kms: Add helper to get encoder index
Message-ID: <20250130125104.gcgyyfd5yex525ti@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 quic_abhinavk@quicinc.com, igt-dev@lists.freedesktop.org,
 Alex Hung <alex.hung@amd.com>,
 Esha Bharadwaj <quic_ebharadw@quicinc.com>
References: <20250128-igt-cwb-v5-0-82652cec29a3@quicinc.com>
 <20250128-igt-cwb-v5-1-82652cec29a3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250128-igt-cwb-v5-1-82652cec29a3@quicinc.com>
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

Hi Jessica,
On 2025-01-28 at 19:29:47 -0800, Jessica Zhang wrote:
> From: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> 
> Move the get_encoder_idx() helper within the kms_setmode test to
> lib/igt_kms

please correct Bhanu address to:
	Bhanuprakash Modem <bhanuprakash.modem@gmail.com>


> 
> Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  lib/igt_kms.c       | 15 +++++++++++++++
>  lib/igt_kms.h       |  1 +
>  tests/kms_setmode.c | 14 ++------------
>  3 files changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 90f44b4d3a8607d1caedccf50691fae7aaf2d079..4b14c94e226a9a103bc3a3bc26099566a6eb274b 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3324,6 +3324,21 @@ void igt_display_fini(igt_display_t *display)
>  	display->planes = NULL;
>  }
>  
> +/**
> + * kmstest_get_encoder_idx:
> + * @resources: libdrm resources pointer
> + * @encoder: libdrm encoder pointer
> + *
> + * Get encoder index from encoder_id
> + */
> +int kmstest_get_encoder_idx(drmModeRes *resources, drmModeEncoder *encoder)
> +{
> +	for (int i = 0; i < resources->count_encoders; i++)
> +		if (resources->encoders[i] == encoder->encoder_id)
> +			return i;

Add newline here.

> +	igt_assert(0);

imho it is better to print more info here, like:
	igt_assert_f(0, "Error: cannot find encoder id %d in range of 0...%d\n",
		     encoder->encoder_id, resources->count_encoders - 1);

This should improve debugging a little. With this

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> +}
> +
>  static void igt_display_refresh(igt_display_t *display)
>  {
>  	igt_output_t *output;
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 8810123fbebeb68f5c549c434d6ca69a123cfb90..e4f7b6c62fd536aa4ea3eb3153d8e1935cf560fd 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -314,6 +314,7 @@ void kmstest_dumb_destroy(int fd, uint32_t handle);
>  void kmstest_wait_for_pageflip(int fd);
>  void kmstest_wait_for_pageflip_timeout(int fd, uint64_t timeout_us);
>  unsigned int kmstest_get_vblank(int fd, int pipe, unsigned int flags);
> +int kmstest_get_encoder_idx(drmModeRes *resources, drmModeEncoder *encoder);
>  
>  bool kms_has_vblank(int fd);
>  
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index d61cfeb9af22c12ae1f5aad5d06ccb9e01fc52d3..600524d98359fbf713be99de931e53b8ecf167b0 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -268,16 +268,6 @@ found:
>  	*mode_ret = *mode;
>  }
>  
> -static int get_encoder_idx(drmModeRes *resources, drmModeEncoder *encoder)
> -{
> -	int i;
> -
> -	for (i = 0; i < resources->count_encoders; i++)
> -		if (resources->encoders[i] == encoder->encoder_id)
> -			return i;
> -	igt_assert(0);
> -}
> -
>  static void get_crtc_config_str(struct crtc_config *crtc, char *buf,
>  				size_t buf_size)
>  {
> @@ -370,7 +360,7 @@ static void setup_crtcs(const struct test_config *tconf,
>  			config_valid &= !!(encoder->possible_crtcs &
>  					  (1 << crtc->crtc_idx));
>  
> -			encoder_mask |= 1 << get_encoder_idx(resources,
> +			encoder_mask |= 1 << kmstest_get_encoder_idx(resources,
>  							     encoder);
>  			config_valid &= !(encoder_mask &
>  					  ~encoder->possible_clones);
> @@ -396,7 +386,7 @@ static void setup_crtcs(const struct test_config *tconf,
>  			idx = cconf[i].crtc_idx;
>  
>  		encoder = drmModeGetEncoder(drm_fd, connector->encoders[idx]);
> -		encoder_usage_count[get_encoder_idx(resources, encoder)]++;
> +		encoder_usage_count[kmstest_get_encoder_idx(resources, encoder)]++;
>  		drmModeFreeEncoder(encoder);
>  	}
>  	for (i = 0; i < resources->count_encoders; i++)
> 
> -- 
> 2.34.1
> 
