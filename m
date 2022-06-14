Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF59110FF2B
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 05:46:12 +0000 (UTC)
Message-ID: <e1599ec3-bef7-1d66-0df7-bc2b4325f01f@intel.com>
Date: Tue, 14 Jun 2022 11:15:51 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220610120639.13832-1-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220610120639.13832-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [v3] tests/i915/kms_dsc: Validate dsc with diff plane
 formats
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

On Fri-10-06-2022 05:36 pm, Swati Sharma wrote:
> Already existing subtest is modified so that dsc can be validated
> using different plane modifiers. Few 8/10/16 bpc RGB and YUV formats
> are added.
> 
> v2: minor fixes
> v3: -renaming
>      -addition of new planar format test
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/i915/kms_dsc.c | 68 +++++++++++++++++++++++++++++++-------------
>   1 file changed, 48 insertions(+), 20 deletions(-)
> 
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> index c94c64c4..7fe7d3d8 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -47,11 +47,11 @@
>   IGT_TEST_DESCRIPTION("Test to validate display stream compression");
>   
>   #define HDISPLAY_5K	5120
> -#define XRGB8888_DRM_FORMAT_MIN_BPP	8
> +#define MIN_BPP		8
>   
>   enum dsc_test_type {
> -	TEST_BASIC_DSC_ENABLE,
> -	TEST_DSC_COMPRESSION_BPP
> +	TEST_BASIC_DSC,
> +	TEST_DSC_BPP
>   };
>   
>   typedef struct {
> @@ -68,6 +68,17 @@ typedef struct {
>   bool force_dsc_en_orig;
>   int force_dsc_restore_fd = -1;
>   
> +const struct {
> +	const int format;
> +	const char format_str[20];
> +} test_list[] = {
> +	{DRM_FORMAT_XRGB8888, "XRGB8888"},
> +	{DRM_FORMAT_XYUV8888, "XYUV8888"},
> +	{DRM_FORMAT_XRGB2101010, "XRGB2101010"},
> +	{DRM_FORMAT_XRGB16161616F, "XRGB16161616F"},
> +	{DRM_FORMAT_YUYV, "YUYV"},
> +};
> +
>   static inline void manual(const char *expected)
>   {
>   	igt_debug_interactive_mode_check("all", expected);
> @@ -171,7 +182,7 @@ static bool check_big_joiner_test_constraint(data_t *data,
>   	igt_output_t *output = data->output;
>   	drmModeModeInfo *mode = get_highres_mode(output);
>   
> -	if (test_type == TEST_DSC_COMPRESSION_BPP &&
> +	if (test_type == TEST_DSC_BPP &&
>   	    mode->hdisplay >= HDISPLAY_5K) {
>   		igt_debug("Bigjoiner does not support force bpp on %s\n",
>   			   output->name);
> @@ -224,7 +235,7 @@ static void test_cleanup(data_t *data)
>   }
>   
>   /* re-probe connectors and do a modeset with DSC */
> -static void update_display(data_t *data, enum dsc_test_type test_type)
> +static void update_display(data_t *data, enum dsc_test_type test_type, unsigned int plane_format)
>   {
>   	bool enabled;
>   	igt_plane_t *primary;
> @@ -240,7 +251,7 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
>   	save_force_dsc_en(data);
>   	force_dsc_enable(data);
>   
> -	if (test_type == TEST_DSC_COMPRESSION_BPP) {
> +	if (test_type == TEST_DSC_BPP) {
>   		igt_debug("Trying to set BPP to %d\n", data->compression_bpp);
>   		force_dsc_enable_bpp(data);
>   	}
> @@ -252,10 +263,14 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
>   	igt_output_override_mode(output, mode);
>   
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_skip_on(!igt_plane_has_format_mod(primary, plane_format,
> +		    DRM_FORMAT_MOD_LINEAR));
> +
>   	igt_create_pattern_fb(data->drm_fd,
>   			      mode->hdisplay,
>   			      mode->vdisplay,
> -			      DRM_FORMAT_XRGB8888,
> +			      plane_format,
>   			      DRM_FORMAT_MOD_LINEAR,
>   			      &data->fb_test_pattern);
>   
> @@ -281,11 +296,12 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
>   	test_cleanup(data);
>   }
>   
> -static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpp)
> +static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpp, unsigned int plane_format)
>   {
>   	igt_display_t *display = &data->display;
>   	igt_output_t *output;
> -	char test_name[10];
> +	char name1[20];
> +	char name2[20];
>   	enum pipe pipe;
>   
>   	for_each_pipe_with_valid_output(display, pipe, output) {
> @@ -305,10 +321,11 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpp)
>   		if (!check_big_joiner_pipe_constraint(data))
>   			continue;
>   
> -		snprintf(test_name, sizeof(test_name), "-%dbpp", data->compression_bpp);
> +		snprintf(name1, sizeof(name1), "-%dbpp", data->compression_bpp);
> +		snprintf(name2, sizeof(name2), "-%s", igt_format_str(plane_format));
>   		igt_dynamic_f("pipe-%s-%s%s",  kmstest_pipe_name(data->pipe), data->output->name,
> -			     (test_type == TEST_DSC_COMPRESSION_BPP) ? test_name : "")
> -			update_display(data, test_type);
> +			     (test_type == TEST_DSC_BPP) ? name1 : name2)

Can we move this check to where you constructing the test name? So that 
we can manage with single variable for test name.	

> +			update_display(data, test_type, plane_format);
>   	}
>   }
>   
> @@ -332,25 +349,36 @@ igt_main
>   	igt_describe("Tests basic display stream compression functionality if supported "
>   		     "by a connector by forcing DSC on all connectors that support it "
>   		     "with default parameters");
> -	igt_subtest_with_dynamic("basic-dsc-enable")
> -			test_dsc(&data, TEST_BASIC_DSC_ENABLE, 0);
> +	igt_subtest_with_dynamic("basic-dsc")
> +			test_dsc(&data, TEST_BASIC_DSC, 0, DRM_FORMAT_XRGB8888);

Why do we need this extra subtest, as we are doing the same with 
"dsc-with-formats"?

IMO, we just need to drop "basic-dsc".

> +
> +	igt_describe("Tests basic display stream compression functionality if supported "
> +		     "by a connector by forcing DSC on all connectors that support it "
> +		     "with default parameters and creating fb with diff formats");
> +	igt_subtest_with_dynamic("dsc-with-formats") {
> +		for (int k = 0; k < ARRAY_SIZE(test_list); k++)
> +			test_dsc(&data, TEST_BASIC_DSC, 0, test_list[k].format);
> +	}
>   
>   	igt_fixture
>   		igt_require(intel_display_ver(data.devid) >= 13);
>   
> +	/* output bpp/compressed bpp supported is 8 to 23 (pipe_bpp -1)
> +	 * i.e. 8 to 23. so, here we are considering compressed bpp as min(8), mean (8+23/2)
> +	 * and max(23).
> +	 */
>   	igt_describe("Tests basic display stream compression functionality if supported "
>   		     "by a connector by forcing DSC on all connectors that support it "
>   		     "with certain BPP as the output BPP for the connector");
> -	igt_subtest_with_dynamic("XRGB8888-dsc-compression") {
> +	igt_subtest_with_dynamic("dsc-with-bpp") {
>   		uint32_t bpp_list[] = {
> -			XRGB8888_DRM_FORMAT_MIN_BPP,
> -			(XRGB8888_DRM_FORMAT_MIN_BPP  +
> -			(XRGB8888_DRM_FORMAT_MIN_BPP * 3) - 1) / 2,
> -			(XRGB8888_DRM_FORMAT_MIN_BPP * 3) - 1
> +			MIN_BPP,
> +			(MIN_BPP  + (MIN_BPP * 3) - 1) / 2,
> +			(MIN_BPP * 3) - 1
>   		};
>   
>   		for (int j = 0; j < ARRAY_SIZE(bpp_list); j++)
> -			test_dsc(&data, TEST_DSC_COMPRESSION_BPP, bpp_list[j]);
> +			test_dsc(&data, TEST_DSC_BPP, bpp_list[j], DRM_FORMAT_XRGB8888);

Why are we limiting this test to XRGB8888 only? Is it overkill to run on 
all formats mentioned in test_list[]?

>   	}
>   
>   	igt_fixture {
