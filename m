Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D71F606A33D
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VMH+/+VP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C018D1121CC;
	Thu, 19 Nov 2026 09:15:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D191121D6
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 09:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795079642; x=1826615642;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=acbNgbBKhROihoJlGi02ggBofq4Bp2yVUpKNGoBSeDM=;
 b=VMH+/+VPyn2OeXFb9byh8MRDU1tWtGX3bBqKYXhivAzFqLX+OtQxedpS
 L4i+97vLLoTaMGYfJGhQmmfDNDaiC4uYTNg64YqMv5jzAAmRafo9H4Vub
 DPGjeTPpUtNc5AiFhIUw/USCr43Z6U+FZNtqr5vF5/Jn3ECiTtjZjoFoH
 kNNrqv8qXBJMo7NT5KvCs5UG7Rq9IqW23FjVdbIiR9ksenOJL9fpYNbfo
 fbl+bTH86ov3z44l96P89HHXSgl4f1w0a+gkMPlo+20vJsq3rNG6+WJjR
 htLqRzFsADy+0LMe0ymfPnJVF73KUDyimP7qd+16mPv2/PL8flR4v8MsH w==;
X-CSE-ConnectionGUID: jgoIuJQgQ3a+ckhThJjl9w==
X-CSE-MsgGUID: tJjJuNzdSfuBy+hqAhrrnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3804515"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3804515"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 01:14:01 -0800
X-CSE-ConnectionGUID: PhUgO7L7QNSfsFrqZAnXoQ==
X-CSE-MsgGUID: /m5EmIdXTCi66s5UppKmhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10656108"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 01:13:58 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, karthik.b.s@intel.com, Jeevan B
 <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t 2/8] tests/kms_panel_fitting: Find fastboot param
 with a dedicated display module
In-Reply-To: <20261118154426.345883-3-jeevan.b@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261118154426.345883-1-jeevan.b@intel.com>
 <20261118154426.345883-3-jeevan.b@intel.com>
Date: Thu, 19 Nov 2026 11:13:56 +0200
Message-ID: <aad093d91c79284b812dfb3968d1b374d6e0f998@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026, Jeevan B <jeevan.b@intel.com> wrote:
> The test checked for /sys/module/{i915,xe}/parameters/fastboot before
> forcing fastboot. With display split into intel_display.ko the parameter
> lives in /sys/module/intel_display/parameters, so the check failed and
> fastboot was silently not forced.
>
> Look the parameter up through igt_params, which searches the GPU driver
> module and then intel_display.

The module parameter has been removed by commit 58883680a841 ("drm/i915:
Remove the module parameter 'fastboot'") in kernel v6.7.

BR,
Jani.

>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_panel_fitting.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
> index 478e8b5d7..64b992bea 100644
> --- a/tests/kms_panel_fitting.c
> +++ b/tests/kms_panel_fitting.c
> @@ -254,19 +254,22 @@ static void test_panel_fitting(data_t *data, enum test_type type)
>  	igt_display_t *display = &data->display;
>  	igt_output_t *output;
>  	igt_crtc_t *crtc;
> -	struct stat sb;
>  
>  	if (type == TEST_ATOMIC) {
> -		char path[PATH_MAX];
> +		char *fastboot;
>  
>  		igt_require_f(is_intel_device(display->drm_fd), "not valid for non-intel devices\n");
>  
> -		/* Until this is force enabled, force modeset evasion. */
> -		snprintf(path, PATH_MAX, "/sys/module/%s/parameters/fastboot",
> -					 is_i915_device(data->drm_fd) ? "i915" : "xe");
> -
> -		if (stat(path, &sb) == 0)
> +		/*
> +		 * Until this is force enabled, force modeset evasion. The parameter
> +		 * lives in the GPU driver or, with a dedicated display module, in
> +		 * intel_display; igt_params looks in both.
> +		 */
> +		fastboot = __igt_params_get(data->drm_fd, "fastboot");
> +		if (fastboot) {
> +			free(fastboot);
>  			igt_set_module_param_int(data->drm_fd, "fastboot", 1);
> +		}
>  
>  		igt_require(intel_display_ver(intel_get_drm_devid(display->drm_fd)) >= 5);

-- 
Jani Nikula, Intel
