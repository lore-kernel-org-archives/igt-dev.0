Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D481F3D5E1
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 11:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2967110E32C;
	Tue,  7 Apr 2026 11:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tw9eFcgh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50CA10E32C
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 11:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775560501; x=1807096501;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=fX2IeRvsR/lJWGZv3aMj/Th4RR6+oWimqUjlf5cFk+s=;
 b=Tw9eFcghUHI9R6qmer8qk5ZbRSKTPpnolMi3Tm/FuZiiP84145ILlCfe
 4gxEhHoJM8hnCHGXFusmrhDQr6VTY+8KXSjvmv7Dc1VK3o2H3REA6XR1G
 arxfSPnY4H1DduRnBaxPF5/f/MoGDkRj4TqugqYaar1Qe7ZS5EXlF/CC4
 jNBMljFqLGOWa8TqaN4FAs/b24kx9s4Y4f1Ef6JUsTg+hBLqK4599soOM
 IesM3HeAsK1/5gJqMTZbOyY0oK8GEMUgzLPyHmChSsHP/ecuBsAuZa2tj
 2TaFB6opMxFnLKtjHw2kZMG2kP3kI01m4b+k6LeuKRsKTBVzzMq8XZPi6 w==;
X-CSE-ConnectionGUID: Fh/5LZ83T0Ol+oQwLDURUw==
X-CSE-MsgGUID: OUA/bDSqToi+WTZFJ/xm4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76532738"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76532738"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 04:15:01 -0700
X-CSE-ConnectionGUID: KEAQbvwpT3uVDzdAKAj/bA==
X-CSE-MsgGUID: IrFwftCEQXmf1OgPaSBlHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="233013714"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.244])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 04:14:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, ville.syrjala@intel.com
Subject: Re: [PATCH i-g-t v2 2/8] tests/intel/kms_frontbuffer_tracking:
 avoid multiple fbc status queries
In-Reply-To: <20260407095843.43679-3-vinod.govindapillai@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260407095843.43679-1-vinod.govindapillai@intel.com>
 <20260407095843.43679-3-vinod.govindapillai@intel.com>
Date: Tue, 07 Apr 2026 14:14:54 +0300
Message-ID: <f5f32875e51a2a2695eca87a5e924b562a38ea66@intel.com>
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

On Tue, 07 Apr 2026, Vinod Govindapillai <vinod.govindapillai@intel.com> wrote:
> While looking for "no fbc reasons" and decide whether to skip any specific
> fbc related test, read the debugfs fbc status only once and look for any
> skip reasons.
>
> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  lib/i915/intel_fbc.h                   |  8 +++++
>  tests/intel/kms_frontbuffer_tracking.c | 50 +++++++-------------------
>  2 files changed, 20 insertions(+), 38 deletions(-)
>
> diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
> index 8e2662824..b4596cca5 100644
> --- a/lib/i915/intel_fbc.h
> +++ b/lib/i915/intel_fbc.h
> @@ -10,6 +10,14 @@
>  
>  enum psr_mode;
>  
> +const char *const no_fbc_reasons[] = {
> +	"FBC disabled: not enough stolen memory",
> +	"FBC disabled: stride not supported",
> +	"FBC disabled: plane size too big",
> +	"FBC disabled: surface size too big",
> +	"FBC disabled: PSR1 enabled (Wa_14016291713)"
> +};

This being in a header, it gets duplicated to every file that includes
it. I'm somewhat surprised it builds, actually. In fact adding another
include of it anywhere in lib does break the build.

Basically my suggestion was to have a helper function for this, and the
strings should be hidden there. There should be only one place in the
whole IGT that matches and maps the strings. You change the strings in
kernel, you change that one place, and nothing else.

BR,
Jani.




> +
>  void intel_fbc_enable(igt_display_t *display);
>  void intel_fbc_disable(igt_display_t *display);
>  bool intel_fbc_supported(igt_crtc_t *crtc);
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index e764c9ce1..427cf3262 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -1651,44 +1651,21 @@ static bool fbc_wait_for_compression(void)
>  	return igt_wait(fbc_is_compressing(), 2000, 1);
>  }
>  
> -static bool fbc_not_enough_stolen(void)
> +static bool fbc_found_skip_reason(void)
>  {
> -	char buf[128];
> -
> -	debugfs_read_crtc("i915_fbc_status", buf);
> -	return strstr(buf, "FBC disabled: not enough stolen memory\n");
> -}
> -
> -static bool fbc_stride_not_supported(void)
> -{
> -	char buf[128];
> -
> -	debugfs_read_crtc("i915_fbc_status", buf);
> -	return strstr(buf, "FBC disabled: stride not supported\n");
> -}
> -
> -static bool fbc_plane_size_too_big(void)
> -{
> -	char buf[128];
> +	bool found_reason = false;
> +	char fbc_status[128];
> +	int i;
>  
> -	debugfs_read_crtc("i915_fbc_status", buf);
> -	return strstr(buf, "FBC disabled: plane size too big\n");
> -}
> +	debugfs_read_crtc("i915_fbc_status", fbc_status);
>  
> -static bool fbc_surface_size_too_big(void)
> -{
> -	char buf[128];
> -
> -	debugfs_read_crtc("i915_fbc_status", buf);
> -	return strstr(buf, "FBC disabled: surface size too big\n");
> -}
> +	if (strstr(fbc_status, "FBC Enabled\n"))
> +		return false;
>  
> -static bool fbc_psr_not_possible(void)
> -{
> -	char buf[128];
> +	for (i = 0; !found_reason && i < ARRAY_SIZE(no_fbc_reasons); i++)
> +		found_reason = strstr(fbc_status, no_fbc_reasons[i]);
>  
> -	debugfs_read_crtc("i915_fbc_status", buf);
> -	return strstr(buf, "FBC disabled: PSR1 enabled (Wa_14016291713)");
> +	return found_reason;
>  }
>  
>  static bool fbc_enable_per_plane(int plane_index, igt_crtc_t *crtc)
> @@ -2362,11 +2339,8 @@ static void do_status_assertions(int flags)
>  	}
>  
>  	if (flags & ASSERT_FBC_ENABLED) {
> -		igt_require(!fbc_not_enough_stolen());
> -		igt_require(!fbc_stride_not_supported());
> -		igt_require(!fbc_plane_size_too_big());
> -		igt_require(!fbc_surface_size_too_big());
> -		igt_require(!fbc_psr_not_possible());
> +		igt_require(!fbc_found_skip_reason());
> +
>  		if (!intel_fbc_wait_until_enabled(prim_mode_params.crtc)) {
>  			igt_assert_f(intel_fbc_is_enabled(prim_mode_params.crtc, IGT_LOG_WARN),
>  				     "FBC disabled\n");

-- 
Jani Nikula, Intel
