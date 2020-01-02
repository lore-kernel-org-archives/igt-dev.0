Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CBC6E0ED
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jan 2020 13:30:21 +0000 (UTC)
References: <20191231132158.3911-1-swati2.sharma@intel.com>
 <20191231132158.3911-8-swati2.sharma@intel.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <7113faf3-9447-a8ea-6d9d-0b41b44a279f@amd.com>
Date: Thu, 2 Jan 2020 08:29:54 -0500
In-Reply-To: <20191231132158.3911-8-swati2.sharma@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 7/7] tests/kms_hdr: Add subtest to swap
 static HDR metadata
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2019-12-31 8:21 a.m., Swati Sharma wrote:
> From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> 
> Add subtest to enable fast static metadata switches.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Thanks for picking up and updating this series - I like that you've 
moved this into a shared kms_hdr test.

You can have my:

Acked-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

on patches 4-7. They're split up logically and I don't see any glaring 
issues with them.

I'll leave the first three patches for review from others since I wrote 
those.

Regards,
Nicholas Kazlauskas

> ---
>   tests/kms_hdr.c | 109 ++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 109 insertions(+)
> 
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index a63021b1..b2fc8fe3 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -45,6 +45,7 @@ enum {
>   	TEST_DPMS = 1 << 0,
>   	TEST_SUSPEND = 1 << 1,
>   	TEST_OUTPUT = 1 << 2,
> +	TEST_SWAP = 1 << 3,
>   };
>   
>   /* BPC connector state. */
> @@ -659,6 +660,110 @@ static void test_static_output(data_t *data, igt_output_t *output)
>   	}
>   }
>   
> +/* Fills some test values for HDR metadata targeting SDR. */
> +static void fill_hdr_output_metadata_sdr(struct hdr_output_metadata *meta)
> +{
> +	memset(meta, 0, sizeof(*meta));
> +
> +	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
> +	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_TRADITIONAL_GAMMA_SDR;
> +
> +	/* Rec. 709 */
> +	meta->hdmi_metadata_type1.display_primaries[0].x =
> +		calc_hdr_float(0.640); /* Red */
> +	meta->hdmi_metadata_type1.display_primaries[0].y =
> +		calc_hdr_float(0.330);
> +	meta->hdmi_metadata_type1.display_primaries[1].x =
> +		calc_hdr_float(0.300); /* Green */
> +	meta->hdmi_metadata_type1.display_primaries[1].y =
> +		calc_hdr_float(0.600);
> +	meta->hdmi_metadata_type1.display_primaries[2].x =
> +		calc_hdr_float(0.150); /* Blue */
> +	meta->hdmi_metadata_type1.display_primaries[2].y =
> +		calc_hdr_float(0.006);
> +	meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
> +	meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
> +
> +	meta->hdmi_metadata_type1.max_display_mastering_luminance = 0;
> +	meta->hdmi_metadata_type1.min_display_mastering_luminance = 0;
> +	meta->hdmi_metadata_type1.max_fall = 0;
> +	meta->hdmi_metadata_type1.max_cll = 0;
> +}
> +
> +static void test_static_swap(data_t *data, igt_output_t *output)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_crc_t ref_crc, new_crc;
> +	enum pipe pipe;
> +	igt_fb_t afb;
> +	int afb_id;
> +	struct hdr_output_metadata hdr;
> +
> +	for_each_pipe(display, pipe) {
> +		if (!igt_pipe_connector_valid(pipe, output))
> +			continue;
> +
> +		if (!igt_pipe_is_free(display, pipe))
> +			continue;
> +
> +		prepare_test(data, output, pipe);
> +
> +		/* 10-bit formats are slow, so limit the size. */
> +		afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
> +		igt_assert(afb_id);
> +
> +		draw_hdr_pattern(&afb);
> +
> +		/* Start in SDR. */
> +		igt_plane_set_fb(data->primary, &afb);
> +		igt_plane_set_size(data->primary, data->w, data->h);
> +		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +		if (is_amdgpu_device(data->fd))
> +			assert_output_bpc(data, 8);
> +
> +		/* Enter HDR, a modeset is allowed here. */
> +		fill_hdr_output_metadata_st2048(&hdr);
> +		set_hdr_output_metadata(data, &hdr);
> +		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +		if (is_amdgpu_device(data->fd))
> +			assert_output_bpc(data, 10);
> +
> +		igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
> +
> +		/* Change the mastering information, no modeset allowed. */
> +		hdr.hdmi_metadata_type1.max_display_mastering_luminance = 200;
> +		hdr.hdmi_metadata_type1.max_fall = 200;
> +		hdr.hdmi_metadata_type1.max_cll = 100;
> +
> +		set_hdr_output_metadata(data, &hdr);
> +		igt_display_commit_atomic(display, 0, NULL);
> +
> +		/* Enter SDR via metadata, no modeset allowed. */
> +		fill_hdr_output_metadata_sdr(&hdr);
> +		set_hdr_output_metadata(data, &hdr);
> +		igt_display_commit_atomic(display, 0, NULL);
> +
> +		igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
> +
> +		/* Exit SDR and enter 8bpc, cleanup. */
> +		set_hdr_output_metadata(data, NULL);
> +		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +		if (is_amdgpu_device(data->fd))
> +			assert_output_bpc(data, 8);
> +
> +		/* Verify that the CRC didn't change while cycling metadata. */
> +		igt_assert_crc_equal(&ref_crc, &new_crc);
> +
> +		test_fini(data);
> +		igt_remove_fb(data->fd, &afb);
> +
> +		break;
> +	}
> +}
> +
>   /* Returns true if an output supports hdr metadata property */
>   static bool has_hdr(igt_output_t *output)
>   {
> @@ -686,6 +791,8 @@ static void test_hdr(data_t *data, const char *test_name, uint32_t flags)
>   			test_static_toggle(data, output, flags);
>   		if (flags & TEST_OUTPUT)
>   			test_static_output(data, output);
> +		if (flags & TEST_SWAP)
> +			test_static_swap(data, output);
>   		valid_tests++;
>   	}
>   
> @@ -723,6 +830,8 @@ igt_main
>   
>   	igt_describe("Tests HDR mode by setting the static metadata");
>   	igt_subtest("static-output") test_hdr(&data, "static-output", TEST_OUTPUT);
> +	igt_describe("Tests swapping static HDR metadata");
> +	igt_subtest("static-swap") test_hdr(&data, "static-swap", TEST_SWAP);
>   
>   	igt_fixture {
>   		igt_display_fini(&data.display);
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
