Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E23CD342F
	for <igt-dev@archiver.kernel.org>; Wed, 12 Nov 2025 18:05:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C7310E78B;
	Wed, 12 Nov 2025 18:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ma6owwa1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902D610E788
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Nov 2025 18:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762970722; x=1794506722;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=eyiQ77eqZKJNAnJBKQsPeeftx+7muEn1KJ/q83XYhw0=;
 b=Ma6owwa1myMeezmoRmzjh06vpUUtoWgTDnM9EHPiIey/gTURlZgiRgeh
 dZcdmHiASR5/C75Bkl12cc4QSqG+KOI61DFNSlVYy+ffQoHbURMWKtwvb
 uoUhY3L+wo57N540y+h74Cm7nVsLPDYOJwYonY4oqxhp2tmy3ZK88cs5v
 56gcYo/WkNO9vThlUTHxJC7OxmP6Xb42iByFgPKgnj+oEHCij6Q2nRCfw
 +DRGr/SPQXKCwcWmsTJahEcAkivhJ1LNJ2xyXgSaRbNCw+8A0z2PwrIyo
 pSywK3BOu9hZMcbxpbFI9ir9XpTBVWXVVj/7JJOTkR+4kRyXfRnxQqDgo A==;
X-CSE-ConnectionGUID: T8svj/dSSAKCLb2apmRWTQ==
X-CSE-MsgGUID: sFiXBH3eRryUNXqHv5TP7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64948220"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="64948220"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 10:05:22 -0800
X-CSE-ConnectionGUID: 4GTIt5z1TTu23QlGeyhcyw==
X-CSE-MsgGUID: 2goN2o8hSpm3cXngGipEtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="189461457"
Received: from sanbuman-mobl.gar.corp.intel.com (HELO [10.247.200.233])
 ([10.247.200.233])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 10:05:21 -0800
Message-ID: <748e795f-8e8c-4e23-8d3f-478f41d36c78@intel.com>
Date: Wed, 12 Nov 2025 23:35:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/intel/kms_pm_rpm: Add test to validate G7 residency
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20251031142936.10874-1-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20251031142936.10874-1-mohammed.thasleem@intel.com>
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

Hello Thasleem,

On 31-10-2025 19:59, Mohammed Thasleem wrote:
> This test validates the dgfx Package G7 residency.
>
> v2: Move igt display reset outside loop. (Jeevan)
>      Add G7 residency check before test execution. (Jeevan)
>      Add 4k@144hz supported mode for G7 validation.
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/intel/kms_pm_rpm.c | 138 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 137 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
> index 1610404ff..76f3544c5 100644
> --- a/tests/intel/kms_pm_rpm.c
> +++ b/tests/intel/kms_pm_rpm.c
> @@ -131,6 +131,9 @@
>    *
>    * SUBTEST: system-suspend-idle
>    * Description: Validate suspend-to-idle (S0ix) functionality.
> + *
> + * SUBTEST: package-g7
> + * Description: Validate the package-g7 residency.
>    */
>   
>   #define MSR_PC8_RES	0x630
> @@ -163,6 +166,14 @@ enum plane_type {
>   	PLANE_CURSOR,
>   };
>   
> +static const struct {
> +	int w, h, hz;
> +	const char *name;
> +} prefers_mode[] = {
> +	{7680, 4320, 60,  "8K@60"},
> +	{3840, 2160, 144, "4K@144"},
> +};
> +
>   /* Wait flags */
>   #define DONT_WAIT	0
>   #define WAIT_STATUS	1
> @@ -181,7 +192,10 @@ struct mode_set_data {
>   	drmModeConnectorPtr connectors[MAX_CONNECTORS];
>   	drmModePropertyBlobPtr edids[MAX_CONNECTORS];
>   	igt_display_t display;
> -
> +	igt_output_t *output;
> +	drmModeModeInfo *mode;
> +	igt_plane_t *primary;
> +	struct igt_fb fb_white;
>   	uint32_t devid;
>   	int fw_fd;
>   };
> @@ -1576,6 +1590,121 @@ static void pm_test_caching(void)
>   	gem_close(drm_fd, handle);
>   }
>   
> +static void set_prefered_mode(void)
> +{
> +	enum pipe pipe;
> +	igt_output_t *output;
> +	bool mode_found = false;
> +	drmModeModeInfo *mode = NULL;
> +	drmModeConnectorPtr connector = NULL;
> +	igt_display_t *display = &ms_data.display;
> +
> +	igt_display_reset(display);
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {
> +		connector = output->config.connector;
> +
> +		if (connector->connection != DRM_MODE_CONNECTED)
> +			continue;
> +
> +		igt_output_set_pipe(output, pipe);
> +
> +		if (!intel_pipe_output_combo_valid(display))
> +			continue;
> +
> +		for (int i = 0; i < output->config.connector->count_modes && !mode_found; i++) {
> +			mode = &output->config.connector->modes[i];
> +
> +			for (int j = 0; j < ARRAY_SIZE(prefers_mode); j++) {
> +				if (mode->hdisplay == prefers_mode[j].w &&
> +					mode->vdisplay == prefers_mode[j].h &&
> +					mode->vrefresh == prefers_mode[j].hz) {
> +
> +					igt_output_override_mode(output, mode);
> +					ms_data.output = output;
> +					ms_data.mode = igt_output_get_mode(output);
> +					ms_data.primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +					mode_found = true;
> +					break;
> +				}
> +			}
> +		}
> +		if (mode_found)
> +			break;
> +	}
> +
> +	igt_require_f(mode_found, "Not found any 8K@60Hz or 4k@144hz mode on any connected output\n");
> +}
> +
> +static void set_output(void)
> +{
> +	igt_plane_set_fb(ms_data.primary, NULL);
> +	igt_create_color_fb(drm_fd,
> +			    ms_data.mode->hdisplay, ms_data.mode->vdisplay,
> +			    DRM_FORMAT_XRGB8888,
> +			    DRM_FORMAT_MOD_LINEAR,
> +			    1.0, 1.0, 1.0,
> +			    &ms_data.fb_white);
> +	igt_plane_set_fb(ms_data.primary, &ms_data.fb_white);
> +
> +	igt_display_commit(&ms_data.display);
> +}
> +
Above function set's fb and commit
Rename for better clarity
> +static void has_g7_support(void)
> +{
> +	char buf[256];
> +
> +	igt_require_f(igt_debugfs_simple_read(debugfs, "dgfx_pkg_residencies", buf, sizeof(buf)) >= 0 &&
> +		      strstr(buf, "Package G7"), "Package G7 is not supported\n");
> +}
> +
> +static uint64_t get_pkg_count(char *pkg_data)
> +{
> +	char *e;
> +	long long ret;
> +	char *s = strchr(pkg_data, ':');
> +
> +	igt_assert(s);
> +	s++;
> +	ret = strtol(s, &e, 10);
> +	igt_assert(((ret != LLONG_MIN && ret != LLONG_MAX) || errno != ERANGE) && e > s && *e == '\n' && ret >= 0);
> +
> +	return ret;
> +}
> +
> +static uint64_t read_g7(void)
> +{
> +	char buf[256];
> +	int ret;
> +	char *str;
> +
> +	ret = igt_debugfs_simple_read(debugfs, "dgfx_pkg_residencies", buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Debugfs dgfx_pkg_residencies file not present.\n");
> +
> +	str = strstr(buf, "Package G7");
> +	igt_skip_on_f(!str, "Package G7 is not supported.\n");
> +
> +	return get_pkg_count(str);
> +}
> +
> +static void test_g7(void)
> +{
> +	uint64_t prev_count = 0;
> +
> +	prev_count = read_g7();
> +	igt_assert_f(igt_wait(read_g7() > prev_count, 30000, 100),
> +		     "Package G7 residency is not achived\n");
> +}
Is this documented somewhere that we should achieve g7 residency within 
30 seconds?
Document it if it's just based on trial statistics
> +
> +static void cleanup(void)
> +{
> +	igt_plane_set_fb(ms_data.primary, NULL);
> +	igt_output_override_mode(ms_data.output, NULL);
> +	igt_display_commit(&ms_data.display);
> +	igt_remove_fb(drm_fd, &ms_data.fb_white);
> +}
> +
>   int rounds = 10;
>   bool stay = false;
>   
> @@ -1703,6 +1832,13 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		gem_require_mappable_ggtt(drm_fd);
>   		pm_test_caching();
>   	}
> +	igt_subtest("package-g7") {
> +		has_g7_support();
> +		set_prefered_mode();
> +		set_output();
> +		test_g7();
> +		cleanup();
Move above to function test_package_g7 or something.

Thanks and Regards
Kunal Joshi
> +	}
>   
>   	igt_fixture {
>   		teardown_environment();
