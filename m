Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5808110E660
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jan 2024 19:40:28 +0000 (UTC)
Date: Fri, 5 Jan 2024 20:40:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/3] tests/intel/kms_dsc: add new subtest
Message-ID: <20240105194006.6vhghyjhgngn4iic@kamilkon-desk.igk.intel.com>
References: <20240105155951.124374-1-swati2.sharma@intel.com>
 <20240105155951.124374-3-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240105155951.124374-3-swati2.sharma@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Swati,
On 2024-01-05 at 21:29:50 +0530, Swati Sharma wrote:
> Add new subtest to validate dsc and big joiner usecase.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_dsc.c | 16 ++++++++++++++++

This should be last patch in series.

Regards,
Kamil

>  1 file changed, 16 insertions(+)
> 
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 3433e0907..a71c69e16 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -50,6 +50,7 @@
>   * arg[1]:
>   *
>   * @basic:                        DSC with default parameters
> + * @with-bigjoiner:               DSC with default parameters and big joiner
>   * @with-bpc:                     DSC with certain input BPC for the connector
>   * @with-bpc-formats:             DSC with certain input BPC for the connector and diff formats
>   * @with-formats:                 DSC with default parameters and creating fb with diff formats
> @@ -69,6 +70,7 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
>  #define TEST_DSC_FORMAT		(1<<1)
>  #define TEST_DSC_OUTPUT_FORMAT	(1<<2)
>  #define TEST_DSC_FRACTIONAL_BPP (1<<3)
> +#define TEST_DSC_BIGJOINER	(1<<4)
>  
>  typedef struct {
>  	int drm_fd;
> @@ -177,6 +179,12 @@ static void update_display(data_t *data, uint32_t test_type)
>  		force_dsc_fractional_bpp_enable(data->drm_fd, data->output);
>  	}
>  
> +	if (test_type & TEST_DSC_BIGJOINER) {
> +		igt_debug("DSC big joiner is supported on %s\n", data->output->name);
> +		save_force_dsc_bigjoiner_en(data->drm_fd, data->output);
> +		force_dsc_bigjoiner_enable(data->drm_fd, data->output);
> +	}
> +
>  	igt_output_set_pipe(output, data->pipe);
>  	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  
> @@ -237,6 +245,7 @@ static void update_display(data_t *data, uint32_t test_type)
>  
>  	restore_force_dsc_en();
>  	restore_force_dsc_fractional_bpp_en();
> +	restore_force_dsc_bigjoiner_en();
>  
>  	if (test_type & TEST_DSC_BPC) {
>  		current_bpc = igt_get_pipe_current_bpc(data->drm_fd, data->pipe);
> @@ -349,6 +358,13 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
>  			test_dsc(&data, TEST_DSC_BASIC, DEFAULT_BPC,
>  				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
>  
> +	igt_describe("Tests basic display stream compression functionality with big joiner "
> +		     "if supported by a connector by forcing DSC and big joiner on all connectors "
> +		     "that support it with default parameters");
> +	igt_subtest_with_dynamic("dsc-with-bigjoiner")
> +			test_dsc(&data, TEST_DSC_BASIC | TEST_DSC_BIGJOINER, DEFAULT_BPC,
> +				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
> +
>  	igt_describe("Tests basic display stream compression functionality if supported "
>  		     "by a connector by forcing DSC on all connectors that support it "
>  		     "with default parameters and creating fb with diff formats");
> -- 
> 2.25.1
> 
