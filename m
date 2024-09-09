Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEA2ECE586
	for <igt-dev@archiver.kernel.org>; Mon,  9 Sep 2024 19:01:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3EC10E65E;
	Mon,  9 Sep 2024 19:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QsespQv2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527AE10E65E
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Sep 2024 19:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725908477; x=1757444477;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=jatvGoNHoN9gpbvequ4SlwgvhJTMlCR8RMh8rGkA3Ck=;
 b=QsespQv2ZWTVh2jiAzcEgRiFnx0ogHCQ8GnFbx6hdhFEa2vAdoySsIt3
 45nX6JWx8w+j9IERbpz2oeXnkTPd6E5xf31GqsIyS/5sjU1rn6s3cdnL9
 8uOJe63eGmXjOi8H7fn87zWE6NZGn9/YP87x3A9z/5bJChmA1VXtOG64F
 XzSlElgUUKTQIih9Jg4Z1TqaR1apgKdZ+Jkwq2afCJd4cOU4D16h8oNwF
 qxKAreNOZsiDZwo1ciVqgoV72BWDxhrDyullCaWKc4zJcFE9+LUZpqRvw
 8Z2oIYPSQL6bt7cSYxDYYiq638MrMec9RIeHCvCDGwpp1ATckD5gTy0j8 A==;
X-CSE-ConnectionGUID: IjNBYpCfRcm7x9+iDE7WkQ==
X-CSE-MsgGUID: 2cmQf9dFS/WXyfHmX+nxUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24170928"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="24170928"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 12:01:16 -0700
X-CSE-ConnectionGUID: qrlqBRBaTVCfngxdvCwASw==
X-CSE-MsgGUID: 0vP8TcXBTZGoPX2bgp1vOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="67031096"
Received: from swatish2-mobl2.gar.corp.intel.com (HELO [10.215.122.181])
 ([10.215.122.181])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 12:01:14 -0700
Message-ID: <8ec4acb2-a420-432b-8b72-4632d778a15d@intel.com>
Date: Tue, 10 Sep 2024 00:31:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/km_pm_brightness: Check for flickers
 with changes in brightness
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240627030211.164110-1-santhosh.reddy.guddati@intel.com>
 <20240906025423.507838-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20240906025423.507838-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Santosh,

Please find review comments below

On 06-Sep-24 8:24 AM, Santhosh Reddy Guddati wrote:
>      The test is added to check for flickers on the panel while
This can be rephrased as "New test is added..."

>      changing brightness.
> 
>      If there is any flicker observed on the panel while changing
>      the brightness then crc will change.This patch set is trying
					   ^^
Add space after full stop.

>      to address the flickers observed using crc when brightness
>      is being changed.
> 
>      v3: Addressed review feedback - Kamil , thasleem

Also, what got changed from previous patch is mentioned in commit

There is extra tab in commit message.

Apart from this, fixes are still required in subject. There is no file 
named kms_pm_brightness :/

/s/km_pm_brightness/kms_pm_backlight

Also, subject can be made more meaningful something like
"Add test to detect flickering with brightness changes"

> 
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/intel/kms_pm_backlight.c | 41 ++++++++++++++++++++++++++++++++++
>   1 file changed, 41 insertions(+)
> 
> diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
> index 140a95bcc..ae0ef8462 100644
> --- a/tests/intel/kms_pm_backlight.c
> +++ b/tests/intel/kms_pm_backlight.c
> @@ -66,6 +66,10 @@
>    * SUBTEST: fade-with-suspend
>    * Description: Test the fade with suspend.
>    * Functionality: backlight, suspend
> + *
> + * SUBTEST: brightness-with-crc
> + * Description: Test the brightness change with CRC.
> + * Functionality: backlight, CRC


This subtest can be added after "SUBTEST: basic-brightness" to club all 
brightness test together and it can be renamed as "basic-crc-brightness".
Functionality as defined in other IGTs is crc. So, /s/CRC/crc.

>    */
>   
>   struct context {
> @@ -257,6 +261,41 @@ static void test_setup(igt_display_t display, igt_output_t *output)
>   	}
>   }
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
> +	bool crc_ok;
> +
> +	/* create the pipe_crc object for this pipe */

This comment is not required

> +	ref_crc = igt_pipe_crc_new(display->drm_fd, context->output->config.pipe, IGT_PIPE_CRC_SOURCE_AUTO);
> +	igt_assert(ref_crc);
> +
> +	for (brightness = min; brightness <= max; brightness += step) {
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

IMO, all all igt_debug prints are not required.

> +
> +		/* compare the crc values before and after changing brightness */
> +		crc_ok = igt_check_crc_equal(&out_crc_before, &out_crc_after);

In igt_check_crc_equal(), we already have igt_debug to print mismatched 
CRC values.

> +		igt_debug("brightness: %d flicker: %s\n", brightness, crc_ok ? "none" : "detected");
> +		igt_assert_f(crc_ok, "Flicker observed for brightness %d\n", brightness);
> +	}
> +}
> +
>   igt_main
>   {
>   	int fd;
> @@ -277,6 +316,7 @@ igt_main
>   		{ "fade", "test basic fade.", test_fade, TEST_NONE },
>   		{ "fade-with-dpms", "test the fade with DPMS.", test_fade, TEST_DPMS },
>   		{ "fade-with-suspend", "test the fade with suspend.", test_fade, TEST_SUSPEND },
> +		{ "brightness-with-crc", "test the brightness change with CRC.", test_brightness_crc, TEST_NONE },

Move it up. Add after brightness tests.

>   	};
>   
>   	igt_fixture {
> @@ -290,6 +330,7 @@ igt_main
>   		 */
>   		kmstest_set_vt_graphics_mode();
>   		igt_display_require(&display, drm_open_driver(DRIVER_INTEL | DRIVER_XE));
> +		igt_require_pipe_crc(display.drm_fd);
>   
>   		for_each_connected_output(&display, output) {
>   			if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
