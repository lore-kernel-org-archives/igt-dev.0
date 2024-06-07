Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF33C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 11:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E557210EBE8;
	Fri,  7 Jun 2024 11:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LHwkt46x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A388A10EBE8
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717758928; x=1749294928;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=s5dQD1VDso4maoYPFYjOgIW6iIzm6By8nsQQj1brk1Q=;
 b=LHwkt46xD6YiZV6ugqee2TXnZUQQnR1447c/I2TMvnYBtX8rcvHMvcvB
 cRBGiVjpEvYxw58f+ooHNgmGlG4SZrxW7k4GdNa2w1KSw/C3NPbov4eE5
 c3WjePcHu2VD4iwCXKRGSXnlQpLzp25ldVqXH2wf4AUHyde9kKLKvzx88
 twWEwiICBXtNA1CyNpXBgtDi1pyqq+h81HRrOk0BVmY3jdx83FmHI5QsP
 wX1Ot8tuYZP0uUQeGKCYAsfI4f39gPphDQlWXtYXY5qAB6F6wXH4BLsHK
 NGhxiV68jKBFmUvs82JeVuknmOMOwXhGORqUupNWoVVZHnrcWw6YKZrVg A==;
X-CSE-ConnectionGUID: uCkCwO8gS0yOtORwh0cUrg==
X-CSE-MsgGUID: ypdssQgSR6K1FJpGCH2mFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14217328"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="14217328"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 04:15:27 -0700
X-CSE-ConnectionGUID: ZdtY2RUKTBmtphukIFuBDg==
X-CSE-MsgGUID: QXlXH8rXRKmzSPQVFc0ptQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="38963506"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.72])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 04:15:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com, Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/kms_pm_backlight: Brightness test
 during DPMS on and off
In-Reply-To: <20240607103329.16841-1-mohammed.thasleem@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220424005737.228759-1-mohammed.thasleem@intel.com>
 <20240607103329.16841-1-mohammed.thasleem@intel.com>
Date: Fri, 07 Jun 2024 14:15:22 +0300
Message-ID: <87zfrxknqt.fsf@intel.com>
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

On Fri, 07 Jun 2024, Mohammed Thasleem <mohammed.thasleem@intel.com> wrote:
> Set brightness by deviding max brightness, store and read it back.
> The actual brightness should be same during DPMS on and off cycle.

Not strictly related to the patch at hand, but please find some some
observations about the whole test inline.

>
> v2: Update test path and testplan documentation.
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_backlight.c | 41 ++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
> index 2e691dab0..107b7d668 100644
> --- a/tests/intel/kms_pm_backlight.c
> +++ b/tests/intel/kms_pm_backlight.c
> @@ -64,6 +64,10 @@
>   * SUBTEST: fade-with-suspend
>   * Description: Test the fade with suspend.
>   * Functionality: backlight, suspend
> + *
> + * SUBTEST: brightness-with-dpms
> + * Description: test brightness with dpms on and off cycle.
> + * Functionality: backlight, backlight
>   */
>  
>  struct context {
> @@ -217,6 +221,32 @@ check_suspend(igt_output_t *output)
>  	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
>  }
>  
> +static void check_dpms_cycle(igt_display_t *display, igt_output_t *output, struct context *context)
> +{
> +	int max, val_1, val_2;
> +
> +	backlight_read(&max, "max_brightness", context);
> +	igt_assert(max);
> +
> +	backlight_write(max / 2, "brightness", context);
> +	backlight_read(&val_1, "actual_brightness", context);
> +
> +	igt_require(igt_setup_runtime_pm(output->display->drm_fd));
> +
> +	kmstest_set_connector_dpms(output->display->drm_fd,
> +				   output->config.connector,
> +				   DRM_MODE_DPMS_OFF);
> +	igt_require(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +
> +	kmstest_set_connector_dpms(output->display->drm_fd,
> +				   output->config.connector,
> +				   DRM_MODE_DPMS_ON);
> +	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
> +
> +	backlight_read(&val_2, "actual_brightness", context);
> +	igt_assert_eq(val_1, val_2);
> +}
> +
>  static void test_cleanup(igt_display_t *display, igt_output_t *output)
>  {
>  	igt_output_set_pipe(output, PIPE_NONE);
> @@ -354,6 +384,17 @@ igt_main
>  		}
>  	}
>  
> +	igt_describe("test brightness with dpms on and off cycle");
> +	igt_subtest_with_dynamic("brightness-with-dpms") {
> +		for (int j = 0; j < (dual_edp ? 2 : 1); j++) {

The "dual_edp ? 2 : 1" is what caught my eyes here.

First I thought, why don't you have "num_edp" or something here.

Next I thought, backlight is not limited to eDP. Why aren't we testing
backlight with LVDS or DSI? "num_edp" would be wrong too.

Then I realized the whole dual_edp thing and backlight <-> output
mapping is a bit fragile, and depends on things that aren't necessarily
guaranteed to be stable. It assumes the "first" eDP connector is named
intel_backlight and the rest card%i-%s-backlight. It probably works in
the limited environment and systems we have, but something to keep in
mind.


BR,
Jani.


> +			test_setup(display, &contexts->output[j]);
> +			igt_dynamic_f("%s", igt_output_name(contexts[j].output)) {
> +				check_dpms_cycle(&display, &contexts->output[j], &contexts[j]);
> +				test_cleanup(&display, &contexts->output[j]);
> +			}
> +		}
> +	}
> +
>  	igt_fixture {
>  		/* Restore old brightness */
>  		for (i = 0; i < (dual_edp ? 2 : 1); i++)

-- 
Jani Nikula, Intel
