Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FE5C28B2E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12A110E536;
	Tue, 11 Mar 2025 08:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nRePunuF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B817410E536
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 08:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741683328; x=1773219328;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4Ug5Hc1Lol2wDXYYljRFXvpVMvlNY8q1D9o1VGIsTgY=;
 b=nRePunuFtrGCCa3N/d3kDvjbrLNPWF9+jk2FbUMjDg8m8LE9IBWm4uVy
 DisLpIege8SGyHZP0DAThEgpsn92gCY3Ao1WViOTUrVbFAbzaYQ3JFjJo
 Nh5VO9qkoMPt/h3Vc3ewYaH3GiED/lECD7w48+fSHZDDeZy6wgqaOJgGh
 /kzM2Ut24AG1SHXFAeYgPbXb3xjp42u6DWaJeWsyGzCt70kH8xtuTIEUr
 pUMkovZbkb096SJWQtl6Y1VO9KRtaw/aCtUQm1k7tJu0+bOsSdZ9OC4Np
 JuM/xkXIeC008ot8ssVyO8m+e/lve6IzV7am35v6Rd9ahFguOgHpWwiRi g==;
X-CSE-ConnectionGUID: QBw0HWLfQiKM0kgS7O+G4A==
X-CSE-MsgGUID: ojUl39zmT3CHXi1vhJ/mew==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="46494100"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="46494100"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 01:55:28 -0700
X-CSE-ConnectionGUID: M9OZIq8nSk6c1aFtDwzGXA==
X-CSE-MsgGUID: hb4TepGqRfe8/PezgksfRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="120482210"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 01:55:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Pranay Samala <pranay.samala@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: Re: [PATCH i-g-t 2/2] tests/kms: Simplify DRM debug severity update
In-Reply-To: <20250310171539.273699-3-pranay.samala@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250310171539.273699-1-pranay.samala@intel.com>
 <20250310171539.273699-3-pranay.samala@intel.com>
Date: Tue, 11 Mar 2025 10:55:22 +0200
Message-ID: <87frjkgd51.fsf@intel.com>
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

On Mon, 10 Mar 2025, Pranay Samala <pranay.samala@intel.com> wrote:
> This fixes directly sends the bits to be include in the
> DRM debug mask using "igt_drm_debug_severity_update(DRM_UT_KMS)".

That category alone is not enough for the test. In general, we ask bug
reporters to use something like 0x1e mask for drm.debug. Maybe we can
reduce from that for specific tests, but KMS alone is not enough.

> If any other verbosity is needed then it can also be
> included doing bitwise OR in the parametes.

Perhaps, but the interface becomes cumbersome to use. And the function's
parameter indicates a single enum, not a mask of enumerators.

And the interface doesn't support a test using different sets of
categories for different parts of the test, if so desired.

BR,
Jani.

> Fixes: a2ab0ec12ef4 ("tests/kms_atomic_transition: Reducing debug loglevel dynamically")
> Fixes: 4baeb7397d71 ("tests/intel/kms_dp_linktrain_fallback: Reduce debug loglevel dynamically")
> Fixes: 7a8a3744466f ("tests/kms_cursor_legacy: Reduce debug loglevel dynamically")
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/intel/kms_dp_linktrain_fallback.c | 12 +++---------
>  tests/kms_atomic_transition.c           | 11 +----------
>  tests/kms_cursor_legacy.c               | 10 +---------
>  3 files changed, 5 insertions(+), 28 deletions(-)
>
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index 6a872efd2..66687a3d2 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -613,7 +613,6 @@ igt_main
>  	data_t data = {};
>  
>  	igt_fixture {
> -		int dir, current_log_level;
>  		data.drm_fd = drm_open_driver_master(DRIVER_INTEL |
>  						     DRIVER_XE);
>  		kmstest_set_vt_graphics_mode();
> @@ -621,18 +620,13 @@ igt_main
>  		igt_display_require_output(&data.display);
>  		for_each_pipe(&data.display, data.pipe)
>  			data.n_pipes++;
> -		dir = igt_sysfs_drm_module_params_open();
> -		if (dir >= 0) {
> -			current_log_level = igt_drm_debug_level_get(dir);
> -			close(dir);
> -
> -			if (current_log_level > 10)
> -				igt_drm_debug_level_update(10);
> -		}
>  		/*
>  		 * Some environments may have environment
>  		 * variable set to ignore long hpd, disable it for this test
>  		 */
> +
> +		igt_drm_debug_severity_update(DRM_UT_KMS);
> +
>  		igt_assert_f(igt_ignore_long_hpd(data.drm_fd, false),
>  			     "Unable to disable ignore long hpd\n");
>  	}
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 0342af206..6c5bfa188 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -1171,8 +1171,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  	int pipe_count = 0;
>  
>  	igt_fixture {
> -		int dir, current_log_level;
> -
>  		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>  
>  		kmstest_set_vt_graphics_mode();
> @@ -1185,14 +1183,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  		for_each_connected_output(&data.display, output)
>  			count++;
>  
> -		dir = igt_sysfs_drm_module_params_open();
> -		if (dir >= 0) {
> -			current_log_level = igt_drm_debug_level_get(dir);
> -			close(dir);
> -
> -			if (current_log_level > 10)
> -				igt_drm_debug_level_update(10);
> -		}
> +		igt_drm_debug_severity_update(DRM_UT_KMS);
>  	}
>  
>  	igt_describe("Check toggling of primary plane with vblank");
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 44f031e7b..e317fbf30 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1839,7 +1839,6 @@ igt_main
>  	};
>  
>  	igt_fixture {
> -		int dir, current_log_level;
>  		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
>  		kmstest_set_vt_graphics_mode();
>  
> @@ -1851,14 +1850,7 @@ igt_main
>  		 */
>  		intel_psr2_restore = i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
>  
> -		dir = igt_sysfs_drm_module_params_open();
> -		if (dir >= 0) {
> -			current_log_level = igt_drm_debug_level_get(dir);
> -			close(dir);
> -
> -			if (current_log_level > 10)
> -				igt_drm_debug_level_update(10);
> -		}
> +		igt_drm_debug_severity_update(DRM_UT_KMS);
>  	}
>  
>  	igt_describe("Test checks how many cursor updates we can fit between vblanks "

-- 
Jani Nikula, Intel
