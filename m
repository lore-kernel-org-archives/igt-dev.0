Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE77AF43688
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 09:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B55A10E9A1;
	Fri, 17 Apr 2026 09:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FoLXsD3e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2506C10E9A1
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 09:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776418934; x=1807954934;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PsCC7eCSQ/Xt12HZAHE+CeiWoYdY+xGDhYJJlmYC58A=;
 b=FoLXsD3e0aVRYWvHtlSSi0W1aL/kH/LnJ5bdBZp/4mXqkV8gSpueg5hg
 WOyRXGhdCj8Ivfhb2Y751saHg7legYwWUgqf7Z195jewHopKM9h5kkLbE
 tdgrRUlYnPvVJ18Av7TZVlYW0UVUf4QSAjjyNDJVJORNGStp8FahRmUFx
 SHjQ6LXB5A4u8UTVXLDoNM1r9N0oI/wiybPlW5f5vh1Iz3xnbA7fGBqlQ
 iK/QGK/Ohrr+ExBmM68khck6ukZttwFMB3o81S77CrZNhxBrEuTDTUGn9
 YY6dDgptLYsp2cRoF3Zd87+TWRi8fWqe6nTNev759NjDyl1b6M1vPsQg7 g==;
X-CSE-ConnectionGUID: HqhStcwKRX6ievaVyBfURg==
X-CSE-MsgGUID: APsTa2uNR3Ww1A2BBTdMJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77505696"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="77505696"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 02:42:14 -0700
X-CSE-ConnectionGUID: jKfPiFrjSFK1ZLr5VNZGCw==
X-CSE-MsgGUID: Bur2bSZkR7SBaVK5gIeHcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="230132338"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 02:42:12 -0700
Date: Fri, 17 Apr 2026 11:41:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t v3] Revert "tests/kms_vrr: New subtest for CMRR"
Message-ID: <20260417094153.rx6asfzzw6nkfocx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 kamil.konieczny@intel.com
References: <20260417053620.3685837-1-ramanaidu.naladala@intel.com>
 <20260417074202.3687119-1-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260417074202.3687119-1-ramanaidu.naladala@intel.com>
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

Hi Naladala,
On 2026-04-17 at 13:12:02 +0530, Naladala Ramanaidu wrote:
> This reverts commit 7f0a262891b7888a09e4a1838eb688ad9c676324.
> 
> Remove the CMRR subtest due to a change in test approach requiring
> a complete rewrite. The subtest will be reintroduced in a future
> patch with a revised test methodology.
> 
> v2: Update the git subject and commit message. (Kamil)
> v3: Address review comments. (Swati)
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/kms_vrr.c | 132 +-----------------------------------------------
>  1 file changed, 1 insertion(+), 131 deletions(-)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index ec0692b2f..01f078d2c 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -36,10 +36,6 @@
>  #include <signal.h>
>  
>  /**
> - * SUBTEST: cmrr
> - * Description: Test to validate the content rate to exactly match with the
> - * 		requested rate without any frame drops.
> - *
>   * SUBTEST: flip-basic
>   * Description: Tests that VRR is enabled and that the difference between flip
>   *              timestamps converges to the requested rate
> @@ -90,9 +86,6 @@
>   */
>  #define TEST_DURATION_NS (5000000000ull)
>  
> -#define CMRR_PRECISION_TOLERANCE	10
> -#define VREFRESH_MODIFIER	0.1
> -
>  enum {
>  	TEST_BASIC = 1 << 0,
>  	TEST_DPMS = 1 << 1,
> @@ -103,7 +96,6 @@ enum {
>  	TEST_SEAMLESS_VIRTUAL_RR = 1 << 6,
>  	TEST_FASTSET = 1 << 7,
>  	TEST_MAXMIN = 1 << 8,
> -	TEST_CMRR = 1 << 9,
>  	TEST_LINK_OFF = 1 << 10,
>  	TEST_NEGATIVE = 1 << 11,
>  	TEST_FORCE_RR = 1 << 12,
> @@ -252,21 +244,6 @@ virtual_rr_vrr_range_mode(drmModeModeInfo *mode, float virtual_refresh_rate)
>  	mode->vrefresh = virtual_refresh_rate;
>  }
>  
> -static bool
> -is_cmrr_mode(drmModeModeInfoPtr mode)
> -{
> -	int calculated_refresh, actual_refresh, pixel_clock_per_line;
> -
> -	actual_refresh = mode->vrefresh * 100;
> -	pixel_clock_per_line = mode->clock * 1000 / mode->htotal;
> -	calculated_refresh = pixel_clock_per_line * 100 / mode->vtotal;
> -
> -	if ((actual_refresh - calculated_refresh) < CMRR_PRECISION_TOLERANCE)
> -		return false;
> -
> -	return true;
> -}
> -
>  /* Read min and max vrr range from the connector debugfs. */
>  static range_t
>  get_vrr_range(data_t *data, igt_output_t *output)
> @@ -600,57 +577,6 @@ flip_and_measure(data_t *data, igt_output_t *output,
>  	return 0;
>  }
>  
> -static uint32_t
> -flip_and_measure_cmrr(data_t *data, igt_output_t *output,
> -		      uint64_t duration_ns)
> -{
> -	uint64_t start_ns, last_event_ns, event_ns;
> -	uint32_t total_flip = 0, total_pass = 0;
> -	bool front = false;
> -	drmModeModeInfoPtr mode = igt_output_get_mode(output);
> -	uint64_t req_rate_ns = igt_kms_frame_time_from_vrefresh(mode->vrefresh + VREFRESH_MODIFIER);
> -	uint64_t exp_rate_ns = igt_kms_frame_time_from_vrefresh(mode->vrefresh);
> -	uint64_t threshold_ns = exp_rate_ns / mode->vdisplay; /* Upto 1 scan line. */
> -
> -	igt_info("CMRR on: requested rate: %"PRIu64" ns (%.2f Hz) "
> -		 "expected rate: %"PRIu64" ns - %"PRIu64" ns (%.2f-%.2f Hz)\n",
> -		 req_rate_ns, (mode->vrefresh + VREFRESH_MODIFIER),
> -		 (exp_rate_ns - threshold_ns), (exp_rate_ns + threshold_ns),
> -		 (float)NSECS_PER_SEC / (exp_rate_ns + threshold_ns),
> -		 (float)NSECS_PER_SEC / (exp_rate_ns - threshold_ns));
> -
> -	do_flip(data, &data->fb[0]);
> -	start_ns = last_event_ns = get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
> -	do {
> -		int64_t target_ns, wait_ns, diff_ns = exp_rate_ns;
> -
> -		front = !front;
> -		do_flip(data, front ? &data->fb[1] : &data->fb[0]);
> -
> -		event_ns = get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
> -		igt_debug("event_ns - last_event_ns: %"PRIu64" ns (%.2f Hz)\n",
> -			  event_ns - last_event_ns, (float)NSECS_PER_SEC / (event_ns - last_event_ns));
> -
> -		diff_ns -= event_ns - last_event_ns;
> -		if (llabs(diff_ns) <= threshold_ns)
> -			total_pass += 1;
> -
> -		last_event_ns = event_ns;
> -		total_flip += 1;
> -
> -		diff_ns = event_ns - start_ns;
> -		wait_ns = ((diff_ns + req_rate_ns - 1) / req_rate_ns) * req_rate_ns;
> -		wait_ns -= diff_ns;
> -		target_ns = event_ns + wait_ns;
> -		while (get_time_ns() < target_ns - 10);
> -	} while (event_ns - start_ns <= duration_ns);
> -
> -	igt_info("Completed %u flips, %u vblanks were in threshold for (%.2f Hz) %"PRIu64"ns.\n",
> -		 total_flip, total_pass, (mode->vrefresh + VREFRESH_MODIFIER), req_rate_ns);
> -
> -	return total_flip ? ((total_pass * 100) / total_flip) : 0;
> -}
> -
>  /* Basic VRR flip functionality test - enable, measure, disable, measure */
>  static void
>  test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
> @@ -946,54 +872,6 @@ test_lobf(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>  	igt_assert_f(lobf_enabled, "LOBF not enabled\n");
>  }
>  
> -static void
> -test_cmrr(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
> -	  uint32_t flags)
> -{
> -	uint32_t result;
> -	int i;
> -	bool found = false;
> -	drmModeConnectorPtr connector = output->config.connector;
> -	drmModeModeInfo mode = *igt_output_get_mode(output);
> -
> -	igt_info("CMRR test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
> -		 output->name, igt_crtc_name(crtc), data->range.min,
> -		 data->range.max);
> -
> -	for (i = 0; i < connector->count_modes; i++) {
> -		if (is_cmrr_mode(&connector->modes[i])) {
> -			mode = connector->modes[i];
> -
> -			found = true;
> -			break;
> -		}
> -	}
> -
> -	igt_info("Selected mode: ");
> -	kmstest_dump_mode(&mode);
> -
> -	if (!found) {
> -		igt_info("No CMRR mode found on %s, try to tweak the clock.\n", output->name);
> -
> -		mode.clock = (mode.htotal * mode.vtotal * (mode.vrefresh + VREFRESH_MODIFIER)) / 1000;
> -
> -		igt_info("Tweaked mode: ");
> -		kmstest_dump_mode(&mode);
> -	}
> -
> -	igt_output_override_mode(output, &mode);
> -
> -	if (!igt_display_try_commit2(&data->display, COMMIT_ATOMIC)) {
> -		prepare_test(data, output,
> -			     crtc);
> -		result = flip_and_measure_cmrr(data, output, TEST_DURATION_NS * 2);
> -		igt_assert_f(result > 75,
> -			     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on threshold not reached, result was %u%%\n",
> -			     mode.vrefresh, igt_kms_frame_time_from_vrefresh(mode.vrefresh),
> -			     result);
> -	}
> -}
> -
>  static void test_cleanup(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
>  {
>  	igt_crtc_set_prop_value(crtc,
> @@ -1013,7 +891,7 @@ static void test_cleanup(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
>  static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags)
>  {
>  
> -	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_CMRR)) &&
> +	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)) &&
>  	    output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP) {
>  		igt_info("%s: Connected panel is not eDP.\n", igt_output_name(output));
>  		return false;
> @@ -1226,14 +1104,6 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>  		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
>  			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
>  
> -		igt_describe("Test to validate the content rate exactly matches with the "
> -			     "requested rate without any frame drops.");
> -		igt_subtest_with_dynamic("cmrr") {
> -			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20);
> -
> -			run_vrr_test(&data, test_cmrr, TEST_CMRR);
> -		}
> -
>  		igt_describe("Test to validate the link-off between active frames in "
>  			     "non-PSR operation.");
>  		igt_subtest_with_dynamic("lobf") {
> -- 
> 2.43.0
> 
