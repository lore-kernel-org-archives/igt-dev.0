Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB551C30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 17:29:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A20DA10E14E;
	Tue,  2 Jul 2024 17:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SbbBLYqF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F7010E663
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 17:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719941397; x=1751477397;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=E+I7UgGEpq+zsYZMErG0fggqZCYiLPQ7ZY1KOrJYJQI=;
 b=SbbBLYqF16cQiUjYxXjoTNuRWTE83WG/WsdNz4dOddZbmPRwaA6amqja
 LZLZ8BM99DoyQK/GqGIx1hXYFUV8s3d8hX3QcEuqY0nRpIanyf9uyT2FJ
 JhXYflUGzIMUkXXtRbbTYHdcnVwKPud2Sae8MAnnwwRnBkMCvzw0Q1Xxc
 0UpZQAjKfmufoI2Io9xrX88TtEQ0u22AtIpE8cZo3oTMJDLZoI23ExCSK
 ff2/TEiZQNaaU01TbprVUGYo78C16c29YM8o/8QruMTB1JoXNWcjn3T+5
 0Tu2COMsk6pgWXvK1kf9/11XjFJxSMoqGmOfiAEbEI4Xxrz1A0zmE2XLx Q==;
X-CSE-ConnectionGUID: 1xrjvy5XStS4nMcOZ1qg/g==
X-CSE-MsgGUID: URM2KhIgR4qhagO6PRXK3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17265094"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="17265094"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 10:29:57 -0700
X-CSE-ConnectionGUID: JqaGAmzuQj6C1CofdP57YQ==
X-CSE-MsgGUID: mZq7G16jSQOCjLxMH4ywXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="46628261"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 10:29:55 -0700
Date: Tue, 2 Jul 2024 19:29:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 jouni.hogander@intel.com
Subject: Re: [PATCH i-g-t] tests/km_pm_brightness.c: check for flickers while
 adjusting the brightness.
Message-ID: <20240702172930.sat7bilrj7geanjj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 jouni.hogander@intel.com
References: <20240627030211.164110-1-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240627030211.164110-1-santhosh.reddy.guddati@intel.com>
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

Hi Santhosh,
On 2024-06-27 at 08:32:11 +0530, Santhosh Reddy Guddati wrote:

First concers is subject, please do not use '.c' from filename,
also drop dot from end of sentence:

[PATCH i-g-t] tests/km_pm_brightness: check for flickers while adjusting the brightness

Please improve description:

> The test is added to check for flickers on the panel while
> changing brightness.Though changing the brightness doesn't have impact

s/brightness.Though/brightness. Though/

> on CRC,but if there is a flicker observed , the crc will change

s/CRC,but/CRC but/
s/, the/ then/

> and this test validates the crc.

s/and this test validates the crc././

Third concern is this comment:

/* Some rounding may happen depending on hw */

Are you sure exact checks are ok?
Also I do not see any pm (power management) in the test?
But maybe I am missing something here.

> ---
>  tests/intel/kms_pm_backlight.c | 44 ++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
> index 8672afa7a..e29fd7320 100644
> --- a/tests/intel/kms_pm_backlight.c
> +++ b/tests/intel/kms_pm_backlight.c
> @@ -64,6 +64,10 @@
>   * SUBTEST: fade-with-suspend
>   * Description: Test the fade with suspend.
>   * Functionality: backlight, suspend
> + *
> + * SUBTEST: brightness-crc-change
> + * Description: Test the brightness change with CRC.
> + * Functionality: backlight, CRC
>   */
>  
>  struct context {
> @@ -255,6 +259,44 @@ static void test_setup(igt_display_t display, igt_output_t *output)
>  	}
>  }
>  
> +static void test_brightness_crc(struct context *context)
> +{
> +	int min = 0;
> +	int max = context->max;
> +	int step = (max - min) / 10;
> +	int brightness;
> +	igt_crc_t out_crc_before, out_crc_after;
> +	igt_display_t *display = context->output->display;
> +	char *crc_str;
> +	igt_pipe_crc_t *ref_crc;
> +
> +	// Get the CRC before changing brightness
> +	ref_crc = igt_pipe_crc_new(display->drm_fd, context->output->config.pipe, IGT_PIPE_CRC_SOURCE_AUTO);
> +	igt_assert(ref_crc);
> +
> +	for (brightness = min; brightness <= max; brightness += step) {
> +		igt_info("Brightness: %d\n", brightness);
> +
> +		igt_pipe_crc_collect_crc(ref_crc, &out_crc_before);
> +		crc_str = igt_crc_to_string(&out_crc_before);
> +		igt_debug("CRC before write: %s\n", crc_str);
> +
> +		igt_assert_eq(backlight_write(brightness, "brightness", context), 0);
> +		igt_debug("Brightness after write: %d\n", brightness);
> +
> +		igt_pipe_crc_collect_crc(ref_crc, &out_crc_after);
> +		crc_str = igt_crc_to_string(&out_crc_after);
> +		igt_debug("CRC after write: %s\n", crc_str);
> +

Print igt_info (or better - igt_debug) here.

> +		// Compare the CRC values
> +		if (igt_check_crc_equal(&out_crc_before, &out_crc_after)) {
> +			igt_info("CRC values are same for brightness: %d\n", brightness);
> +		} else {
> +			igt_info("CRC values are different for brightness: %d\n", brightness);

Why igt_info and not igt_assert_f here? Or drop 'if ... else ...'
and use something like:

		crc_ok = igt_check_crc_equal(&out_crc_before, &out_crc_after);
        igt_debug("brightness: %d flicker: %s\n", brightness, crc_ok ? "none" : "detected");
        igt_assert_f(crc_ok, "Flicker observed for brightness %d\n", brightness);

Regards,
Kamil

> +		}
> +	}
> +}
> +
>  igt_main
>  {
>  	int fd;
> @@ -275,6 +317,7 @@ igt_main
>  		{ "fade", "test basic fade.", test_fade, TEST_NONE },
>  		{ "fade-with-dpms", "test the fade with DPMS.", test_fade, TEST_DPMS },
>  		{ "fade-with-suspend", "test the fade with suspend.", test_fade, TEST_SUSPEND },
> +		{ "brightness-crc-change", "test the brightness change with CRC.", test_brightness_crc, TEST_NONE },
>  	};
>  
>  	igt_fixture {
> @@ -288,6 +331,7 @@ igt_main
>  		 */
>  		kmstest_set_vt_graphics_mode();
>  		igt_display_require(&display, drm_open_driver(DRIVER_INTEL | DRIVER_XE));
> +		igt_require_pipe_crc(display.drm_fd);
>  
>  		for_each_connected_output(&display, output) {
>  			if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> -- 
> 2.34.1
> 
