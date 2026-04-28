Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7754FF886F
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 07:12:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4981610E081;
	Tue, 28 Apr 2026 07:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ibUTSZap";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767B510E081
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 07:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777360323; x=1808896323;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=l9XvphHgE1VI4lJr1Q8tMTgan/adcebEwKfRQFD1pkY=;
 b=ibUTSZapDkkIQID3YLlj40w5knzsQmVu2GCPeSTJ9XilJOSkhm6sngJR
 O3lJuvDz1gwCRIesfAzCg77LhZ5tjha/4ipWL5aMum7yz/bJFyNcWe6QF
 P1advDuMwal401wA7UZ4pZZWtzy6vIrBfKAWjw7i6vJ95x1GHIDthruIE
 EkSMB7Ys0sSwemkrpZiPOKiRsaSbGkqWjIYfWJKznwV0gEUkOXvYH65OA
 HNBcHtDr2JsL8e1rkuUGIAi2Jh8Q0dmHA5dPlKfV+eJ6Q35hH7N1sCAAe
 TXV3XNfe0wAl62H2qpewohb+R8fTaaczYDiml9O3pA+770f9YhmDIa1bM Q==;
X-CSE-ConnectionGUID: juKhDGMiTtGX0BjsXTpjtw==
X-CSE-MsgGUID: 6AyCGRoTRaCSN1oHqKdemA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="88572266"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="88572266"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 00:12:03 -0700
X-CSE-ConnectionGUID: gYcwH7AsQ6OtWvvACRXFzw==
X-CSE-MsgGUID: A3O8z3VYQPK4FIPbr6ob4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="227352384"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.208])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 00:12:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>, igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>, Kory
 Maincent <kory.maincent@bootlin.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH i-g-t v1 01/25] lib/igt_kms: Add a detect timeout value
In-Reply-To: <20260428044644.257001-2-mohammed.bilal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260428044644.257001-1-mohammed.bilal@intel.com>
 <20260428044644.257001-2-mohammed.bilal@intel.com>
Date: Tue, 28 Apr 2026 10:11:58 +0300
Message-ID: <0eac068737083fa01b3ff2c90b3bf13fd4eae029@intel.com>
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

On Tue, 28 Apr 2026, Mohammed Bilal <mohammed.bilal@intel.com> wrote:
> From: Louis Chauvet <louis.chauvet@bootlin.com>
>
> Some tests need to wait for a specific connector status. In order to make
> the timeout customisable for each target, add an option in the
> configuration file.
>
> Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_core.c |   4 ++
>  lib/igt_kms.c  | 123 +++++++++++++++++++++++++++++++------------------
>  lib/igt_kms.h  |  10 ++++
>  3 files changed, 92 insertions(+), 45 deletions(-)
>
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 4f79c0294..cc835ea4c 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -271,6 +271,10 @@
>   *	&num; It is not mandatory and allows overriding default values.
>   *	[DUT]
>   *	SuspendResumeDelay=10
> + *
> + *	&num; The following option define the timeout for detection feature
> + *	&num; (waiting for a connector status)
> + *	DisplayDetectTimeout=10.0
>   * ]|
>   *
>   * Some specific configuration options may be used by specific parts of IGT,
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 38c28f45f..ece888d1a 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -60,6 +60,7 @@
>  #include "igt_debugfs.h"
>  #include "igt_device.h"
>  #include "igt_pipe_crc.h"
> +#include "igt_rc.h"
>  #include "igt_sysfs.h"
>  #include "sw_sync.h"
>  #ifdef HAVE_CHAMELIUM
> @@ -8066,38 +8067,38 @@ bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output)
>  
>  igt_crtc_t *igt_crtc_for_crtc_id(igt_display_t *display, uint32_t crtc_id)
>  {
> -	igt_crtc_t *crtc;
> +        igt_crtc_t *crtc;
>  
> -	for_each_crtc(display, crtc) {
> -		if (crtc->crtc_id == crtc_id)
> -			return crtc;
> -	}
> +        for_each_crtc(display, crtc) {
> +                if (crtc->crtc_id == crtc_id)
> +                        return crtc;
> +        }
>  
> -	return NULL;
> +        return NULL;

Please check your patches before sending. There's a bunch of tabs to
spaces changes all over the place.

BR,
Jani.

>  }
>  
>  igt_crtc_t *igt_crtc_for_crtc_index(igt_display_t *display, int crtc_index)
>  {
> -	igt_crtc_t *crtc;
> +        igt_crtc_t *crtc;
>  
> -	for_each_crtc(display, crtc) {
> -		if (crtc->crtc_index == crtc_index)
> -			return crtc;
> -	}
> +        for_each_crtc(display, crtc) {
> +                if (crtc->crtc_index == crtc_index)
> +                        return crtc;
> +        }
>  
> -	return NULL;
> +        return NULL;
>  }
>  
>  igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pipe)
>  {
> -	igt_crtc_t *crtc;
> +        igt_crtc_t *crtc;
>  
> -	for_each_crtc(display, crtc) {
> -		if (crtc->pipe == pipe)
> -			return crtc;
> -	}
> +        for_each_crtc(display, crtc) {
> +                if (crtc->pipe == pipe)
> +                        return crtc;
> +        }
>  
> -	return NULL;
> +        return NULL;
>  }
>  
>  /*
> @@ -8108,14 +8109,14 @@ igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pipe)
>   */
>  igt_crtc_t *igt_first_crtc(igt_display_t *display)
>  {
> -	igt_crtc_t *crtc;
> +        igt_crtc_t *crtc;
>  
> -	for_each_crtc(display, crtc)
> -		return crtc;
> +        for_each_crtc(display, crtc)
> +                return crtc;
>  
> -	igt_skip("No CRTCs on device\n");
> +        igt_skip("No CRTCs on device\n");
>  
> -	return NULL;
> +        return NULL;
>  }
>  
>  /**
> @@ -8128,19 +8129,19 @@ igt_crtc_t *igt_first_crtc(igt_display_t *display)
>   */
>  igt_crtc_t *igt_first_crtc_with_single_output(igt_display_t *display, igt_output_t **ret_output)
>  {
> -	igt_output_t *output;
> -	igt_crtc_t *crtc;
> +        igt_output_t *output;
> +        igt_crtc_t *crtc;
>  
> -	for_each_crtc_with_single_output(display, crtc, output) {
> -		*ret_output = output;
> -		return crtc;
> -	}
> +        for_each_crtc_with_single_output(display, crtc, output) {
> +                *ret_output = output;
> +                return crtc;
> +        }
>  
> -	igt_skip("No valid CRTC/output combinations\n");
> +        igt_skip("No valid CRTC/output combinations\n");
>  
> -	*ret_output = NULL;
> +        *ret_output = NULL;
>  
> -	return NULL;
> +        return NULL;
>  }
>  
>  /*
> @@ -8152,14 +8153,14 @@ igt_crtc_t *igt_first_crtc_with_single_output(igt_display_t *display, igt_output
>   */
>  igt_crtc_t *igt_next_crtc(igt_display_t *display, igt_crtc_t *crtc)
>  {
> -	igt_crtc_t *next;
> +        igt_crtc_t *next;
>  
> -	for_each_crtc(display, next) {
> -		if (!crtc || next->pipe > crtc->pipe)
> -			return next;
> -	}
> +        for_each_crtc(display, next) {
> +                if (!crtc || next->pipe > crtc->pipe)
> +                        return next;
> +        }
>  
> -	return NULL;
> +        return NULL;
>  }
>  
>  /*
> @@ -8170,14 +8171,46 @@ igt_crtc_t *igt_next_crtc(igt_display_t *display, igt_crtc_t *crtc)
>   */
>  igt_crtc_t *igt_random_crtc(igt_display_t *display)
>  {
> -	igt_crtc_t *crtcs[IGT_MAX_PIPES];
> -	igt_crtc_t *crtc;
> -	int n = 0;
> +        igt_crtc_t *crtcs[IGT_MAX_PIPES];
> +        igt_crtc_t *crtc;
> +        int n = 0;
>  
> -	for_each_crtc(display, crtc)
> -		crtcs[n++] = crtc;
> +        for_each_crtc(display, crtc)
> +                crtcs[n++] = crtc;
> +
> +        igt_skip_on_f(!n, "No CRTCs on device\n");
> +
> +        return crtcs[rand() % n];
> +}
> +
> +/**
> + * igt_default_display_detect_timeout:
> + *
> + * Get the default timeout value for detection feature
> + *
> + * Some tests requires to wait for a specific connector status. This value will determine the
> + * timeout value for this waiting.
> + */
> +double igt_default_display_detect_timeout(void)
> +{
> +        static double timeout = 0.0;
> +        static bool first_call = true;
> +        GError *error = NULL;
> +
> +        if (first_call) {
> +                if (igt_key_file) {
> +                        timeout = g_key_file_get_double(igt_key_file, "DUT", "DisplayDetectTimeout",&error);
> +                        if (error) {
> +                                igt_debug("Failed to read DisplayDetectTimeout, defaulting to %f\n",DEFAULT_DETECT_TIMEOUT);
> +                                g_clear_error(&error);
> +                                timeout = DEFAULT_DETECT_TIMEOUT;
> +                        }
> +                } else {
> +                        timeout = DEFAULT_DETECT_TIMEOUT;
> +                }
>  
> -	igt_skip_on_f(!n, "No CRTCs on device\n");
> +                first_call = false;
> +        }
>  
> -	return crtcs[rand() % n];
> +        return timeout;
>  }
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index fcbb6a5ad..b10df1d8d 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -40,6 +40,14 @@
>  #include "igt_fb.h"
>  #include "ioctl_wrappers.h"
>  
> +/**
> + * define DEFAULT_DETECT_TIMEOUT - Default timeout in second used for some screen detection
> + * functions
> + *
> + * It can be overiden by option DetectTimeout in the .igtrc file.
> + */
> +#define DEFAULT_DETECT_TIMEOUT 10.0
> +
>  /* Low-level helpers with kmstest_ prefix */
>  
>  /**
> @@ -1289,4 +1297,6 @@ void igt_get_and_wait_out_fence(igt_output_t *output);
>  
>  igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
>  
> +double igt_default_display_detect_timeout(void);
> +
>  #endif /* __IGT_KMS_H__ */

-- 
Jani Nikula, Intel
