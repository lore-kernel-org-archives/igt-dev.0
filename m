Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47254CA5FFC
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 13:37:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BD910E5FE;
	Wed,  7 Oct 2026 13:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K4Kv+RBH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189BE10F5C9
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 13:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791380184; x=1822916184;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=EbLlGWop21Hwvdy44hV9JRQ7QfZccAo/BRrh2r91h7Y=;
 b=K4Kv+RBHYibafrMbm63QLZttL+ONmySo2f2lbeiJqq4+Vpy+PD2ruzp3
 cpCsl0HC71p7HByl2ajaXqG1GIJR8APvL8obj2n/aFcIESdzwFpyM6f1Z
 aeO1ZgIIslnE29a8QM5ruEhTAY6BmhyZENzXFIbs1OVyMUe464DqDkggH
 61rNtnsl89XmAbrzhSpmGH7dimUUjz717nthWM5EofUa8qVHJmTD63uuc
 Sn9EAd0247cgSuR9+VdOqPI3Q8UACbEuq++d+dcUBy3M4y99+Hyj8akzb
 0YPqa8Ucrw6heLEn3cvLvUHbJvsem9lRIszfmdNjOVyr8gwRGB5PnML0s Q==;
X-CSE-ConnectionGUID: 1+TycxnGQSWHNpWNLhRT5A==
X-CSE-MsgGUID: 50lldlGwRlS4gRuWO0pPLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="249464"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="249464"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 06:36:24 -0700
X-CSE-ConnectionGUID: IfyPNW5UR9iX1weVaraMIQ==
X-CSE-MsgGUID: jSSLYR1GT2mBIrjJzM+EsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="285538688"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.231])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 06:36:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, Arun R Murthy
 <arun.r.murthy@intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/kms_joiner_helper: Add
 igt_get_free_pipes_mask()
In-Reply-To: <20261007-joiner-v1-1-b40826411fa8@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261007-joiner-v1-0-b40826411fa8@intel.com>
 <20261007-joiner-v1-1-b40826411fa8@intel.com>
Date: Wed, 07 Oct 2026 16:36:19 +0300
Message-ID: <45b38494fa17817bbcbae211010c3161706f364a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 07 Oct 2026, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> The joiner tests derive the set of usable pipes from the pipe count
> alone, which assumes every pipe is free. A pipe already driven by
> another client is then handed to a modeset, making the commit fail.
>
> Add igt_get_free_pipes_mask(), which gets the current CRTC usage via
> drmModeGetCrtcList() and translates it into a bitmask of hardware
> pipes.
>
> drmModeGetCrtcList() is a recent libdrm addition, so probe for it in
> meson and fall back to plain CRTC enumeration when it is missing.
>
> Assisted-by: LLM
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  meson.build                     |  7 +++++
>  tests/intel/kms_joiner_helper.c | 66 +++++++++++++++++++++++++++++++++++++++++
>  tests/intel/kms_joiner_helper.h |  1 +
>  3 files changed, 74 insertions(+)
>
> diff --git a/meson.build b/meson.build
> index d7bbfd9698e5616ab777ac58128192ba1e0bec23..f41588c9d73361dbfd405de5ea8f764c6768a9c9 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -129,6 +129,13 @@ endif
>  
>  build_info += 'With libdrm: ' + ','.join(libdrm_info)
>  
> +# drmModeGetCrtcList() is a recent libdrm addition; keep building against
> +# older libdrm by falling back to plain resource enumeration.
> +if cc.has_function('drmModeGetCrtcList', dependencies : libdrm,
> +		   prefix : '#include <xf86drmMode.h>')
> +	config.set('HAVE_DRMMODEGETCRTCLIST', 1)
> +endif
> +
>  pciaccess = dependency('pciaccess', version : '>=0.10')
>  libkmod = dependency('libkmod')
>  # igt_procps.c reads /proc directly; libprocps and libproc2 are not needed.
> diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
> index 36168030475c2725130e6c8ad924dcfb971a07f6..235e227fe9d82f598d0bd7df57ff65d73d717ad0 100644
> --- a/tests/intel/kms_joiner_helper.c
> +++ b/tests/intel/kms_joiner_helper.c
> @@ -113,6 +113,72 @@ void igt_set_all_master_pipes_for_platform(igt_display_t *display, uint32_t *mas
>  	}
>  }
>  
> +/**
> + * igt_get_free_pipes_mask:
> + * @display: The display structure containing pipe information.
> + *
> + * Get the CRTCs that are currently usable and translate that into a
> + * bitmask of hardware pipes. A CRTC is reported free only when it is neither
> + * enabled through KMS nor active in hardware, so pipes claimed by another
> + * client (fbcon, a compositor, joiner) are never handed out to a modeset.
> + *
> + * The returned mask reflects the state at call time, so query it right before
> + * a modeset and after releasing the pipes a previous commit was using.
> + *
> + * Returns: bitmask of hardware pipes whose CRTC is free to be assigned. When
> + * libdrm lacks drmModeGetCrtcList() every pipe of @display is reported free.
> + */
> +uint32_t igt_get_free_pipes_mask(igt_display_t *display)
> +{
> +	uint32_t free_mask = 0;
> +#ifdef HAVE_DRMMODEGETCRTCLIST

#ifdefs belong outside of functions, not inside.

> +	drmModeCrtcListPtr list;
> +	int i;
> +
> +	list = drmModeGetCrtcList(display->drm_fd);
> +	igt_assert_f(list, "drmModeGetCrtcList() failed\n");
> +
> +	for (i = 0; i < list->count; i++) {
> +		drmModeCrtcInfoPtr info = &list->crtcs[i];
> +		igt_crtc_t *crtc = igt_crtc_for_crtc_id(display, info->crtc_id);
> +
> +		/* A CRTC the display never enumerated is not ours to use. */
> +		if (!crtc)
> +			continue;
> +
> +		if (info->in_use) {
> +			igt_debug("CRTC %s in use: %ux%u, fb %u\n",
> +				  igt_crtc_name(crtc), info->width,
> +				  info->height, info->buffer_id);
> +			continue;
> +		}
> +
> +		if (info->driver_active) {
> +			igt_debug("CRTC %s active in hardware, not enabled via KMS\n",
> +				  igt_crtc_name(crtc));
> +			continue;
> +		}
> +
> +		free_mask |= BIT(crtc->hardware_pipe);
> +	}
> +
> +	igt_info("%d of %d CRTCs free, free pipe mask 0x%x\n",
> +		 list->count_available, list->count, free_mask);
> +
> +	drmModeFreeCrtcList(list);
> +#else
> +	igt_crtc_t *crtc;
> +
> +	for_each_crtc(display, crtc)
> +		free_mask |= BIT(crtc->hardware_pipe);
> +
> +	igt_debug("libdrm has no drmModeGetCrtcList(), assuming pipe mask 0x%x free\n",
> +		  free_mask);
> +#endif
> +
> +	return free_mask;
> +}
> +
>  /*
>   * @drm_fd: DRM file descriptor
>   * @outputs: array of pointers to igt_output_t
> diff --git a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_helper.h
> index a0ab75b2c165084b643ead3f3ffc05cf5364e90b..14083d25c6f09e0577f123130697c34c2b6a15e4 100644
> --- a/tests/intel/kms_joiner_helper.h
> +++ b/tests/intel/kms_joiner_helper.h
> @@ -11,6 +11,7 @@
>  
>  void igt_set_all_master_pipes_for_platform(igt_display_t *display,
>  					   uint32_t *master_pipes);
> +uint32_t igt_get_free_pipes_mask(igt_display_t *display);
>  bool igt_assign_pipes_for_outputs(int drm_fd,
>  				  igt_output_t **outputs,
>  				  int num_outputs,

-- 
Jani Nikula, Intel
