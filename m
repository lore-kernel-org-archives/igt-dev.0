Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E77010E32C
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Dec 2022 15:06:57 +0000 (UTC)
Message-ID: <a0880792-f52d-3a45-41d2-55ed12d98969@amd.com>
Date: Tue, 13 Dec 2022 10:06:48 -0500
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20221212192425.387971-1-harry.wentland@amd.com>
 <20221212192425.387971-2-harry.wentland@amd.com>
 <20221213133922.0e98c219@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20221213133922.0e98c219@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/2] tests/kms_hdr: Add test for output
 Colorspace
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sebastian Wick <sebastian.wick@redhat.com>, igt-dev@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 12/13/22 06:39, Pekka Paalanen wrote:
> On Mon, 12 Dec 2022 14:24:24 -0500
> Harry Wentland <harry.wentland@amd.com> wrote:
> 

<snip>

>> +
>> +/*
>> + * igt_assert_output_bpc_equal:
>> + * @drmfd: A drm file descriptor
>> + * @pipe: Display pipe
>> + * @output_name: Name of the libdrm connector we're going to use
>> + * @bpc: BPC to compare with max & current bpc
>> + *
>> + * Assert if crtc's current bpc is not matched with the requested one.
> 
> Hi,
> 
> forgot to rewrite the doc comment.
> 

Good catch.

> 
>> + */
>> +void igt_assert_output_colorspace_equal(int drmfd, enum pipe pipe,
>> +					const char *colorspace)
>> +{
>> +	char buf[35];
>> +
>> +	igt_get_pipe_current_colorspace(drmfd, pipe, buf, sizeof(buf));
>> +	igt_assert(strcmp(colorspace, buf) == 0);
>> +}

<snip>

>> +/*
>> + * List of all DP and HDMI colorspaces from drm_connector.c
>> + *
>> + * We purposely omit "Default" since driver behavior varies
>> + * and there is no good way to test for it.
>> + */
>> +static const char *colorspaces[] = {
>> +	/* Standard Definition Colorimetry based on CEA 861 */
>> +	"SMPTE_170M_YCC",
>> +	"BT709_YCC",
>> +	/* Standard Definition Colorimetry based on IEC 61966-2-4 */
>> +	"XVYCC_601",
>> +	/* High Definition Colorimetry based on IEC 61966-2-4 */
>> +	"XVYCC_709",
>> +	/* Colorimetry based on IEC 61966-2-1/Amendment 1 */
>> +	"SYCC_601",
>> +	/* Colorimetry based on IEC 61966-2-5 [33] */
>> +	"opYCC_601",
>> +	/* Colorimetry based on IEC 61966-2-5 */
>> +	"opRGB",
>> +	/* Colorimetry based on ITU-R BT.2020 */
>> +	"BT2020_CYCC",
>> +	/* Colorimetry based on ITU-R BT.2020 */
>> +	"BT2020_RGB",
>> +	/* Colorimetry based on ITU-R BT.2020 */
>> +	"BT2020_YCC",
>> +	/* Added as part of Additional Colorimetry Extension in 861.G */
>> +	"DCI-P3_RGB_D65",
>> +	"DCI-P3_RGB_Theater",
>> +	/* For Default case, driver will set the colorspace */
>> +	"RGB_Wide_Gamut_Fixed_Point",
> 
> What default case?

Oops, bad copy-paste. This line should be dropped.

> 
>> +	/* Colorimetry based on scRGB (IEC 61966-2-2) */
>> +	"RGB_Wide_Gamut_Floating_Point",
>> +	"BT601_YCC",
>> +	NULL
>> +};
>> +
>> +/* Prints the colorspace name on the framebuffer */
>> +static void draw_colorspace(igt_fb_t *fb, const char* colorspace)
>> +{
>> +	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
>> +
>> +	igt_paint_color(cr, 0, 0, fb->width, 50, 1.0, 1.0, 1.0);
>> +	cairo_move_to(cr, fb->width / 2, 20);
>> +	cairo_set_font_size(cr, 12);
>> +	igt_cairo_printf_line(cr, align_hcenter, 0, "%s", colorspace);
>> +
>> +	igt_put_cairo_ctx(cr);
>> +}
>> +
>> +
>> +static void test_colorspace_switch_on_output(data_t *data, enum pipe pipe,
>> +				      igt_output_t *output,
>> +				      uint32_t flags)
>> +{
>> +	igt_display_t *display = &data->display;
>> +	// igt_crc_t ref_crc, new_crc;
>> +	igt_fb_t afb;
>> +	int afb_id, ret;
>> +
>> +	/* 10-bit formats are slow, so limit the size. */
>> +	afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
>> +	igt_assert(afb_id);
>> +
>> +	draw_hdr_pattern(&afb);
>> +
>> +	/* Plane may be required to fit fullscreen. Check it here and allow
>> +	 * smaller plane size in following tests.
>> +	 */
> 
> I don't understand the code here. Is there some kind of assumption that
> the hardware is always capable of scaling a 512x512 FB to whatever CRTC
> size is?
> 
> I would have expected to see an allocation of FB with CRTC size.
> 

This is copy-paste from the other kms_hdr tests. The existing
tests were build assuming HW is capable of scaling.

512x512 was chosen to limit the impact of drawing the 10-bit
buffer in CPU as we want these tests to run fast so we an use
them as pre-submission tests.

Harry

> 
> Thanks,
> pq
> 
>> +	igt_plane_set_fb(data->primary, &afb);
>> +	igt_plane_set_size(data->primary, data->w, data->h);
>> +	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
>> +	if (!ret) {
>> +		data->w = afb.width;
>> +		data->h = afb.height;
>> +	}
>> +
>> +	/* require Colorspace prop */
>> +	igt_require(igt_output_has_prop(output, IGT_CONNECTOR_COLORSPACE));
>> +
>> +	/* Get enum values for colorspace */
>> +	/* for each value set colorspace */
>> +	for (int i = 0; colorspaces[i]; i++) {
>> +		if (igt_output_try_prop_enum(output, IGT_CONNECTOR_COLORSPACE, colorspaces[i])) {
>> +			igt_info("Testing colorspace %s on %s\n",
>> +				 colorspaces[i],
>> +				 igt_output_name(output));
>> +			draw_colorspace(&afb, colorspaces[i]);
>> +			igt_output_set_prop_enum(output, IGT_CONNECTOR_COLORSPACE, colorspaces[i]);
>> +			igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +			/* get and check current colorspace */
>> +			igt_assert_output_colorspace_equal(data->fd, pipe, colorspaces[i]);
>> +		}
>> +	}
>> +
>> +	igt_info("Testing bad colorspace on %s\n",
>> +			igt_output_name(output));
>> +	draw_colorspace(&afb, "bad");
>> +	igt_require(!igt_output_try_prop_enum(output, IGT_CONNECTOR_COLORSPACE, "bad"));
>> +
>> +	/* revert back to "Default" */
>> +	igt_info("Testing colorspace %s on %s\n",
>> +			"Default",
>> +			igt_output_name(output));
>> +	draw_colorspace(&afb, "Default");
>> +	igt_output_set_prop_enum(output, IGT_CONNECTOR_COLORSPACE, "Default");
>> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +
>> +	test_fini(data);
>> +	igt_remove_fb(data->fd, &afb);
>> +}
>> +
>> +static void test_colorspace_switch(data_t *data, uint32_t flags)
>> +{
>> +	igt_display_t *display = &data->display;
>> +	igt_output_t *output;
>> +
>> +	for_each_connected_output(display, output) {
>> +		enum pipe pipe;
>> +
>> +		for_each_pipe(display, pipe) {
>> +			if (igt_pipe_connector_valid(pipe, output)) {
>> +				prepare_test(data, output, pipe);
>> +
>> +				data->mode = igt_output_get_mode(output);
>> +				data->w = data->mode->hdisplay;
>> +				data->h = data->mode->vdisplay;
>> +
>> +				igt_dynamic_f("pipe-%s-%s",
>> +					      kmstest_pipe_name(pipe), output->name)
>> +					test_colorspace_switch_on_output(data, pipe, output, flags);
>> +
>> +				/* One pipe is enough */
>> +				break;
>> +			}
>> +		}
>> +	}
>> +}
>> +
>>  static bool cta_block(const char *edid_ext)
>>  {
>>  	/*
>> @@ -599,6 +738,10 @@ igt_main
>>  	igt_subtest_with_dynamic("bpc-switch-suspend")
>>  		test_bpc_switch(&data, TEST_SUSPEND);
>>  
>> +	igt_describe("Tests switching Colorspace property, .i.e., the display colorimetry");
>> +	igt_subtest_with_dynamic("colorspace-switch")
>> +		test_colorspace_switch(&data, TEST_NONE);
>> +
>>  	igt_describe("Tests entering and exiting HDR mode");
>>  	igt_subtest_with_dynamic("static-toggle")
>>  		test_hdr(&data, TEST_NONE);
> 
