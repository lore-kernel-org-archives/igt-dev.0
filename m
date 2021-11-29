Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <87b6d5b9-dc58-2e43-cbfe-162e4f9f467e@amd.com>
Date: Mon, 29 Nov 2021 09:56:33 -0500
Content-Language: en-US
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211115094759.520955-8-bhanuprakash.modem@intel.com>
 <20211118111941.764737fb@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20211118111941.764737fb@eldfell>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 07/14] tests/kms_color: New negative tests for
 plane level color mgmt
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Pekka Paalanen <ppaalanen@gmail.com>, Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On 2021-11-18 04:19, Pekka Paalanen wrote:
> On Mon, 15 Nov 2021 15:17:52 +0530
> Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:
> 
>> Negative check for:
>>  * plane gamma lut sizes
>>  * plane degamma lut sizes
>>  * plane ctm matrix sizes
>>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>  tests/kms_color.c | 127 ++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 127 insertions(+)
>>
>> diff --git a/tests/kms_color.c b/tests/kms_color.c
>> index e14b37cb6f..d9fe417ba9 100644
>> --- a/tests/kms_color.c
>> +++ b/tests/kms_color.c
>> @@ -736,6 +736,118 @@ static void test_pipe_limited_range_ctm(data_t *data,
>>  }
>>  #endif
>>  
>> +static bool invalid_plane_gamma_test(data_t *data, igt_plane_t *plane)
>> +{
>> +	igt_display_t *display = &data->display;
>> +	drmModePropertyPtr gamma_mode = NULL;
>> +	uint32_t i;
>> +
>> +	igt_info("Plane invalid gamma test is running on pipe-%s plane-%s(%s)\n",
>> +			kmstest_pipe_name(plane->pipe->pipe),
>> +			kmstest_plane_type_name(plane->type),
>> +			is_hdr_plane(plane) ? "hdr":"sdr");
>> +
>> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_MODE));
>> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_LUT));
>> +
>> +	gamma_mode = get_plane_gamma_degamma_mode(plane, IGT_PLANE_GAMMA_MODE);
>> +
>> +	/* Iterate all supported gamma modes. */
>> +	for (i = 0; i < gamma_mode->count_enums; i++) {
>> +		segment_data_t *segment_info = NULL;
>> +		size_t lut_size = 0;
>> +
>> +		/* Ignore 'no gamma' from enum list. */
>> +		if (!strcmp(gamma_mode->enums[i].name, "no gamma"))
>> +			continue;
>> +
>> +		igt_info("Trying to use gamma mode: \'%s\'\n", gamma_mode->enums[i].name);
>> +
>> +		segment_info = get_segment_data(data, gamma_mode->enums[i].value,
>> +				gamma_mode->enums[i].name);
>> +		lut_size = sizeof(struct drm_color_lut_ext) * segment_info->entries_count;
>> +
>> +		igt_plane_set_prop_enum(plane, IGT_PLANE_GAMMA_MODE, gamma_mode->enums[i].name);
>> +		invalid_plane_lut_sizes(display, plane,
>> +					IGT_PLANE_GAMMA_LUT,
>> +					lut_size);
>> +
>> +		clear_segment_data(segment_info);
>> +
>> +		/* One enum is enough. */
>> +		break;
>> +	}
>> +
>> +	drmModeFreeProperty(gamma_mode);
>> +
>> +	return true;
>> +}
>> +
>> +static bool invalid_plane_degamma_test(data_t *data, igt_plane_t *plane)
>> +{
>> +	igt_display_t *display = &data->display;
>> +	drmModePropertyPtr degamma_mode = NULL;
>> +	uint32_t i;
>> +
>> +	igt_info("Plane invalid degamma test is running on pipe-%s plane-%s(%s)\n",
>> +			kmstest_pipe_name(plane->pipe->pipe),
>> +			kmstest_plane_type_name(plane->type),
>> +			is_hdr_plane(plane) ? "hdr":"sdr");
>> +
>> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_DEGAMMA_MODE));
>> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_DEGAMMA_LUT));
>> +
>> +	degamma_mode = get_plane_gamma_degamma_mode(plane, IGT_PLANE_DEGAMMA_MODE);
>> +
>> +	/* Iterate all supported degamma modes. */
>> +	for (i = 0; i < degamma_mode->count_enums; i++) {
>> +		segment_data_t *segment_info = NULL;
>> +		size_t lut_size = 0;
>> +
>> +		/* Ignore 'no degamma' from enum list. */
>> +		if (!strcmp(degamma_mode->enums[i].name, "no degamma"))
>> +			continue;
>> +
>> +		igt_info("Trying to use degamma mode: \'%s\'\n", degamma_mode->enums[i].name);
>> +
>> +		segment_info = get_segment_data(data,
>> +						degamma_mode->enums[i].value,
>> +						degamma_mode->enums[i].name);
>> +		lut_size = sizeof(struct drm_color_lut_ext) * segment_info->entries_count * 2;
>> +
>> +		igt_plane_set_prop_enum(plane,
>> +					IGT_PLANE_DEGAMMA_MODE,
>> +					degamma_mode->enums[i].name);
>> +		invalid_plane_lut_sizes(display, plane,
>> +					IGT_PLANE_DEGAMMA_LUT,
>> +					lut_size);
>> +
>> +		clear_segment_data(segment_info);
>> +
>> +		/* One enum is enough. */
>> +		break;
> 
> Why is one enum enough?
> 

I think it's another intellism since Uma's patches only
report one enum.

Since the API is designed to allow for multiple enums the test
should just run on all of them. It'd be a trivial change to the
test.

Harry

> The same question for the other case in this patch.
> 
> 
>> +	}
>> +
>> +	drmModeFreeProperty(degamma_mode);
>> +
>> +	return true;
>> +}
>> +
>> +static bool invalid_plane_ctm_test(data_t *data, igt_plane_t *plane)
>> +{
>> +	igt_info("Plane invalid CTM test is running on pipe-%s plane-%s(%s)\n",
>> +			kmstest_pipe_name(plane->pipe->pipe),
>> +			kmstest_plane_type_name(plane->type),
>> +			is_hdr_plane(plane) ? "hdr":"sdr");
>> +
>> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_CTM));
>> +	invalid_plane_lut_sizes(&data->display, plane,
>> +				IGT_PLANE_CTM,
>> +				sizeof(struct drm_color_ctm));
> 
> The code says you're trying shove a LUT into a CTM blob. I understand
> that mechanically this is test you want to do, feed a wrong sized blob,
> and in this case the contents do not matter (unlike with actual LUTs),
> but reading this code is completely misleading and does not make sense.
> It takes a while to think about what you actually want to test here,
> and then reverse-engineer the code to understand that that is what
> actually happens, too. That is too much mental burden for the reader to
> realize that this piece of code actually works.
> 
> 
> Thanks,
> pq
> 
>> +
>> +	return true;
>> +}
>> +
>>  static bool plane_gamma_test(data_t *data, igt_plane_t *plane)
>>  {
>>  	igt_output_t *output;
>> @@ -1411,6 +1523,21 @@ static void run_tests_for_plane(data_t *data, enum pipe pipe)
>>  					ctm_tests[i].iter);
>>  		}
>>  	}
>> +
>> +	igt_describe("Negative check for invalid plane gamma lut sizes");
>> +	igt_subtest_f("pipe-%s-invalid-plane-gamma-lut-sizes",
>> +			kmstest_pipe_name(pipe))
>> +		run_plane_color_test(data, pipe, invalid_plane_gamma_test);
>> +
>> +	igt_describe("Negative check for invalid plane degamma lut sizes");
>> +	igt_subtest_f("pipe-%s-invalid-plane-degamma-lut-sizes",
>> +			kmstest_pipe_name(pipe))
>> +		run_plane_color_test(data, pipe, invalid_plane_degamma_test);
>> +
>> +	igt_describe("Negative check for invalid plane ctm matrix sizes");
>> +	igt_subtest_f("pipe-%s-invalid-plane-ctm-matrix-sizes",
>> +			kmstest_pipe_name(pipe))
>> +		run_plane_color_test(data, pipe, invalid_plane_ctm_test);
>>  }
>>  
>>  igt_main
> 
