Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42F36E3AE
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Oct 2021 10:27:28 +0000 (UTC)
Message-ID: <6af0dcf3-16f6-bdfe-9c9a-2f017debb4c2@intel.com>
Date: Tue, 5 Oct 2021 15:57:10 +0530
Content-Language: en-US
References: <20210916153515.21369-1-ville.syrjala@linux.intel.com>
 <20210916153515.21369-6-ville.syrjala@linux.intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20210916153515.21369-6-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 6/6] tests/kms_invalid_mode: Allow the
 test on !i915
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 9/16/2021 9:05 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> The only i915 specific subtest is the max dotclock check,
> so let's add the i915 check there and switch from DRIVER_INTEL
> to DRIVER_ANY so that the other subtests can run everywhere.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/{i915 => }/kms_invalid_mode.c | 6 ++++--
>   tests/meson.build                   | 2 +-
>   2 files changed, 5 insertions(+), 3 deletions(-)
>   rename tests/{i915 => }/kms_invalid_mode.c (98%)
>
> diff --git a/tests/i915/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> similarity index 98%
> rename from tests/i915/kms_invalid_mode.c
> rename to tests/kms_invalid_mode.c
> index 722aa816fca1..8a4e824a4caa 100644
> --- a/tests/i915/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -237,6 +237,9 @@ static int i915_max_dotclock(data_t *data)
>   	char *s;
>   	int max_dotclock = 0;
>   
> +	if (!is_i915_device(data->drm_fd))
> +		return 0;
> +
>   	igt_debugfs_read(data->drm_fd, "i915_frequency_info", buf);
>   	s = strstr(buf, "Max pixel clock frequency:");
>   	igt_assert(s);
> @@ -298,8 +301,7 @@ igt_main
>   	igt_fixture {
>   		igt_skip_on_simulation();
>   
> -		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> -		igt_require_intel(data.drm_fd);
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>   
>   		kmstest_set_vt_graphics_mode();
>   
> diff --git a/tests/meson.build b/tests/meson.build
> index 3e3090e5d8b4..99557912adc1 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -33,6 +33,7 @@ test_progs = [
>   	'kms_getfb',
>   	'kms_hdmi_inject',
>   	'kms_hdr',
> +	'kms_invalid_mode',
>   	'kms_lease',
>   	'kms_multipipe_modeset',
>   	'kms_panel_fitting',
> @@ -228,7 +229,6 @@ i915_progs = [
>   	'kms_flip_scaled_crc',
>   	'kms_flip_tiling',
>   	'kms_frontbuffer_tracking',
> -	'kms_invalid_mode',
>   	'kms_legacy_colorkey',
>   	'kms_mmap_write_crc',
>   	'kms_pipe_b_c_ivb',

