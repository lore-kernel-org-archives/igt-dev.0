Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888E310F236
 for <igt-dev@lists.freedesktop.org>; Mon, 30 May 2022 06:44:26 +0000 (UTC)
Message-ID: <3a936bfe-5d9d-9386-62d3-e42484b6c653@intel.com>
Date: Mon, 30 May 2022 12:14:13 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220523101807.3627871-1-bhanuprakash.modem@intel.com>
 <20220523101807.3627871-2-bhanuprakash.modem@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20220523101807.3627871-2-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/2] tests/kms_hdr: Skip if current &
 requested BPC doesn't match
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

Hi Bhanu,

Please find some comments inline:

On 5/23/2022 3:48 PM, Bhanuprakash Modem wrote:
> Due to the limitaion of port clock values supported for HDMI, i915
Typo : limitation
> may downgrade the requested bpc for a given mode.
>
> This patch will skip the subtest if the requested bpc doesn't match
> with crtc's current bpc.

The max bpc property only ensures that the bpc will not go beyond the 
value set through this property. It does not guarantee that the same bpc 
will be used for the given mode.

If clock/bandwidth constraints permit, the max bpc will be used to show 
the mode, otherwise the bpc will be reduced.

As we were discussing offline, if we really want a particular bpc set, 
we can try reducing the resolution, till we get the bpc that we set in 
max bpc property.

(Again for HDR, I think we cannot go below 4K resolution.)

With this approach, if there exists no valid resolution, for which we 
get the same bpc as set by max_bpc property,

then we can skip the test.


> Cc: Swati Sharma <swati2.sharma@intel.com>
> CC: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_hdr.c | 43 +++++++++++++++++++++++++++++++++++++------
>   1 file changed, 37 insertions(+), 6 deletions(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index fb2e0790..6ad03aa0 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -144,8 +144,6 @@ static void test_bpc_switch_on_output(data_t *data, enum pipe pipe,
>   	igt_fb_t afb;
>   	int afb_id, ret;
>   
> -	prepare_test(data, output, pipe);
> -
>   	/* 10-bit formats are slow, so limit the size. */
>   	afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
>   	igt_assert(afb_id);
> @@ -206,6 +204,27 @@ static bool has_max_bpc(igt_output_t *output)
>   	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
>   }
>   
> +static bool i915_clock_constraint(data_t *data)
> +{
> +	drmModeConnector *connector = data->output->config.connector;
> +
> +	if (connector->connector_type != DRM_MODE_CONNECTOR_HDMIA &&
> +	    connector->connector_type != DRM_MODE_CONNECTOR_HDMIB)

I think this can happen with DP as well. For DP during link training we 
compute the optimal bpp, link rate and num lanes.

We start trying with max bpp (based on max bpc property from connector), 
and keep on reducing bpp.

So in principle this can happen with any connector.


> +		return true;
> +
> +	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +	if (!igt_check_output_bpc_equal(data->fd, data->pipe_id,
> +					data->output->name, 10)) {

I think if we pass requested bpc as parameter, this can avoid hard 
coding and function will be future proof.


Regards,

Ankit


> +		test_fini(data);
> +
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>   static void test_bpc_switch(data_t *data, uint32_t flags)
>   {
>   	igt_display_t *display = &data->display;
> @@ -217,8 +236,16 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   		if (!has_max_bpc(output))
>   			continue;
>   
> +		if (igt_get_output_max_bpc(data->fd, output->name) < 10)
> +			continue;
> +
>   		for_each_pipe(display, pipe) {
>   			if (igt_pipe_connector_valid(pipe, output)) {
> +				prepare_test(data, output, pipe);
> +
> +				if (is_i915_device(data->fd) && !i915_clock_constraint(data))
> +					break;
> +
>   				igt_dynamic_f("pipe-%s-%s",
>   					      kmstest_pipe_name(pipe), output->name)
>   					test_bpc_switch_on_output(data, pipe, output, flags);
> @@ -367,8 +394,6 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
>   	igt_fb_t afb;
>   	int afb_id;
>   
> -	prepare_test(data, output, pipe);
> -
>   	/* 10-bit formats are slow, so limit the size. */
>   	afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
>   	igt_assert(afb_id);
> @@ -446,8 +471,6 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output)
>   	int afb_id;
>   	struct hdr_output_metadata hdr;
>   
> -	prepare_test(data, output, pipe);
> -
>   	/* 10-bit formats are slow, so limit the size. */
>   	afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
>   	igt_assert(afb_id);
> @@ -532,8 +555,16 @@ static void test_hdr(data_t *data, uint32_t flags)
>   		if (!is_panel_hdr(data, output))
>   			continue;
>   
> +		if (igt_get_output_max_bpc(data->fd, output->name) < 10)
> +			continue;
> +
>   		for_each_pipe(display, pipe) {
>   			if (igt_pipe_connector_valid(pipe, output)) {
> +				prepare_test(data, output, pipe);
> +
> +				if (is_i915_device(data->fd) && !i915_clock_constraint(data))
> +					break;
> +
>   				igt_dynamic_f("pipe-%s-%s",
>   					      kmstest_pipe_name(pipe), output->name) {
>   					if (flags & TEST_NONE || flags & TEST_DPMS || flags & TEST_SUSPEND)
