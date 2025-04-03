Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13101C3601E
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 15:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB1610EA10;
	Thu,  3 Apr 2025 15:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SL4YuOMa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E53110EA10
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 15:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743693490; x=1775229490;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=TtK9lyDA9i4R+tHXEVZt+yfkFEOMYhdsJFMT+Y5OWNY=;
 b=SL4YuOMaEKYl9g55Om4AnYD2r+CPnJHQXYmLjEv4VdWGRIS9c6S2jZ43
 hmgMuDoISikTrIs4wh6Zb7HsPgiNBDZRStqL7f96vEIcSxFzOHW2LPdD+
 38Sc3LiNzh+dJ3hE82Bl91fD2wQ17cnr7MpJGcWWHYq04BVdb+2jAGsCx
 ja9ZLVegSUDB+qUUtB+218S1KsnRDb2WktFQU2idNOBoyWXvtSFskdVid
 5yLrUsDKRKTLFBUAafCfvlLkoYC3+y0taK63uIKr/wb9b+tpv/zIc2WaI
 az+QDnviqjbZdoNt+BH78IXo4TnTZO/wf5sDEjJuOTrvt0youLyb2D2Nl Q==;
X-CSE-ConnectionGUID: L2kM6GcDTQi5HV13L4J83g==
X-CSE-MsgGUID: ygHyJYGuT7aNEvu3achlwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55780246"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="55780246"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 08:18:09 -0700
X-CSE-ConnectionGUID: 0nSLBn2LTJWnl1pusIf3HA==
X-CSE-MsgGUID: A0RheHJ+Rs65kMnDwcwY1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="126939273"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 08:18:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Pranay Samala <pranay.samala@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: Re: [PATCH i-g-t v3 4/5] tests/kms: Add parse_bitmask support for user
In-Reply-To: <20250401092015.818465-5-pranay.samala@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250401092015.818465-1-pranay.samala@intel.com>
 <20250401092015.818465-5-pranay.samala@intel.com>
Date: Thu, 03 Apr 2025 18:18:03 +0300
Message-ID: <8734ep1dg4.fsf@intel.com>
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

On Tue, 01 Apr 2025, Pranay Samala <pranay.samala@intel.com> wrote:
> The user can dynamically provide a mask during execution, giving them
> more control over the debug mask. This is useful in scenarios where
> different masks are needed for different tests or configurations without
> modifying the code itself.

*Why* are different debug masks useful? What are you trying to
accomplish?

> If the user does not provide a mask, the system defaults to 0x04.

Why? What is this based on? You might mention it's KMS, but it lacks
e.g. DP messages which might be useful for link training fallback. And
some other masks might be useful for other tests.

> This
> ensures that the test can still run without requiring any extra input.
>
> Fixes: a2ab0ec12ef4 ("tests/kms_atomic_transition: Reducing debug loglevel dynamically")
> Fixes: 4baeb7397d71 ("tests/intel/kms_dp_linktrain_fallback: Reduce debug loglevel dynamically")
> Fixes: 7a8a3744466f ("tests/kms_cursor_legacy: Reduce debug loglevel dynamically")
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/intel/kms_dp_linktrain_fallback.c | 37 +++++++++++++++++++------
>  tests/kms_atomic_transition.c           | 24 ++++++++--------
>  tests/kms_cursor_legacy.c               | 37 ++++++++++++++++++-------
>  3 files changed, 68 insertions(+), 30 deletions(-)
>
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index 6a872efd2..a6f7b586f 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -608,12 +608,33 @@ static bool run_dsc_sst_fallaback_test(data_t *data)
>  	return ran;
>  }
>  
> -igt_main
> +static unsigned int parse_bitmask;
> +static unsigned int def_mask = 0x4;

What do you gain by having two variables for this?

Neither parse_bitmask nor def_mask describe *what* mask they represent.

> +
> +static int opt_handler(int opt, int opt_index, void *_data)
> +{
> +	switch (opt) {
> +	case 'b':
> +		parse_bitmask = strtoul(optarg, NULL, 16);
> +		break;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +static const struct option long_opts[] = {
> +	{ .name = "bitmask", .has_arg = true, .val = 'b', },
> +	{}
> +};
> +
> +static const char help_str[] =
> +	"  --bitmask\t\tSpecify a bitmask in hexadecimal\n";

How is that in any way helpful to the user? Which bitmask?

And why does it have to be in hex? Just leave the strtoul base parameter
to 0 and you can use the exact same values as you'd use for drm.debug
parameter i.e. 0x prefix for hex.

Ditto for the duplication in other files.

> +
> +igt_main_args("", long_opts, help_str, opt_handler, NULL)
>  {
>  	data_t data = {};
>  
>  	igt_fixture {
> -		int dir, current_log_level;
>  		data.drm_fd = drm_open_driver_master(DRIVER_INTEL |
>  						     DRIVER_XE);
>  		kmstest_set_vt_graphics_mode();
> @@ -621,14 +642,12 @@ igt_main
>  		igt_display_require_output(&data.display);
>  		for_each_pipe(&data.display, data.pipe)
>  			data.n_pipes++;
> -		dir = igt_sysfs_drm_module_params_open();
> -		if (dir >= 0) {
> -			current_log_level = igt_drm_debug_level_get(dir);
> -			close(dir);
>  
> -			if (current_log_level > 10)
> -				igt_drm_debug_level_update(10);
> -		}
> +		if (parse_bitmask)
> +			igt_drm_debug_mask_update(parse_bitmask);
> +		else
> +			igt_drm_debug_mask_update(def_mask);
> +
>  		/*
>  		 * Some environments may have environment
>  		 * variable set to ignore long hpd, disable it for this test
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 2b64424ce..a92edc2b1 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -1096,6 +1096,9 @@ static bool pipe_output_combo_valid(igt_display_t *display,
>  	return ret;
>  }
>  
> +static unsigned int parse_bitmask;
> +static unsigned int def_mask = 0x4;
> +
>  static int opt_handler(int opt, int opt_index, void *_data)
>  {
>  	data_t *data = _data;
> @@ -1104,6 +1107,9 @@ static int opt_handler(int opt, int opt_index, void *_data)
>  	case 'e':
>  		data->extended = true;
>  		break;
> +	case 'b':
> +		parse_bitmask = strtoul(optarg, NULL, 16);
> +		break;
>  	}
>  
>  	return IGT_OPT_HANDLER_SUCCESS;
> @@ -1111,11 +1117,13 @@ static int opt_handler(int opt, int opt_index, void *_data)
>  
>  static const struct option long_opts[] = {
>  	{ .name = "extended", .has_arg = false, .val = 'e', },
> +	{ .name = "bitmask", .has_arg = true, .val = 'b', },
>  	{}
>  };
>  
>  static const char help_str[] =
> -	"  --extended\t\tRun the extended tests\n";
> +	"  --extended\t\tRun the extended tests\n"
> +	"  --bitmask\t\tSpecify a bitmask in hexadecimal\n";
>  
>  static data_t data;
>  
> @@ -1174,8 +1182,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  	int pipe_count = 0;
>  
>  	igt_fixture {
> -		int dir, current_log_level;
> -
>  		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>  
>  		kmstest_set_vt_graphics_mode();
> @@ -1188,14 +1194,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
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
> +		if (parse_bitmask)
> +			igt_drm_debug_mask_update(parse_bitmask);
> +		else
> +			igt_drm_debug_mask_update(def_mask);
>  	}
>  
>  	igt_describe("Check toggling of primary plane with vblank");
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 44f031e7b..09d511935 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1823,7 +1823,29 @@ static void modeset_atomic_cursor_hotspot(igt_display_t *display)
>  	igt_remove_fb(display->drm_fd, &cursor_fb);
>  }
>  
> -igt_main
> +static unsigned int parse_bitmask;
> +static unsigned int def_mask = 0x4;
> +
> +static int opt_handler(int opt, int opt_index, void *_data)
> +{
> +	switch (opt) {
> +	case 'b':
> +		parse_bitmask = strtoul(optarg, NULL, 16);
> +		break;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +static const struct option long_opts[] = {
> +	{ .name = "bitmask", .has_arg = true, .val = 'b', },
> +	{}
> +};
> +
> +static const char help_str[] =
> +	"  --bitmask\t\tSpecify a bitmask in hexadecimal\n";
> +
> +igt_main_args("", long_opts, help_str, opt_handler, NULL)
>  {
>  	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
>  	igt_display_t display = { .drm_fd = -1 };
> @@ -1839,7 +1861,6 @@ igt_main
>  	};
>  
>  	igt_fixture {
> -		int dir, current_log_level;
>  		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
>  		kmstest_set_vt_graphics_mode();
>  
> @@ -1851,14 +1872,10 @@ igt_main
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
> +		if (parse_bitmask)
> +			igt_drm_debug_mask_update(parse_bitmask);
> +		else
> +			igt_drm_debug_mask_update(def_mask);
>  	}
>  
>  	igt_describe("Test checks how many cursor updates we can fit between vblanks "

-- 
Jani Nikula, Intel
