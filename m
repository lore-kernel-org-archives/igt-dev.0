Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB63D10E943
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 13:50:31 +0000 (UTC)
Message-ID: <a04d4386-48d6-742f-099c-297fe7f54477@intel.com>
Date: Tue, 27 Sep 2022 19:20:26 +0530
MIME-Version: 1.0
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
References: <20220926185321.2897136-1-kunal1.joshi@intel.com>
 <20220926185321.2897136-2-kunal1.joshi@intel.com>
Content-Language: en-US
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <20220926185321.2897136-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v1 1/5] tests/chamelium/kms_chamelium.c:
 test cleanup
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

Hi Kunal,

Please don't add .c in subj.

On 27-Sep-22 12:23 AM, Kunal Joshi wrote:
> -> Sanitize the state before starting the subtest
> 
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/chamelium/kms_chamelium.c | 48 +++++++++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
> 
> diff --git a/tests/chamelium/kms_chamelium.c b/tests/chamelium/kms_chamelium.c
> index 1be1c41a..985a906c 100644
> --- a/tests/chamelium/kms_chamelium.c
> +++ b/tests/chamelium/kms_chamelium.c
> @@ -756,6 +756,13 @@ static void test_display_one_mode(data_t *data, struct chamelium_port *port,
>   	igt_output_t *output;
>   	igt_plane_t *primary;
>   
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
 >> No need of this comment. igt_display_reset() already has its 
description in lib.
Please remove other comments too.
> +	igt_display_reset(&data->display);
> +
> +
>   	igt_modeset_disable_all_outputs(&data->display);
>   	chamelium_reset_state(&data->display, data->chamelium,
>   			      port, data->ports, data->port_count);
> @@ -792,6 +799,12 @@ static void test_display_all_modes(data_t *data, struct chamelium_port *port,
>   	if (check == CHAMELIUM_CHECK_ANALOG)
>   		bridge = check_analog_bridge(data, port);
>   
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
> +	igt_display_reset(&data->display);
> +
>   	i = 0;
>   	do {
>   		igt_output_t *output;
> @@ -847,6 +860,12 @@ test_display_frame_dump(data_t *data, struct chamelium_port *port)
>   
>   	int i, count_modes;
>   
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
> +	igt_display_reset(&data->display);
> +
>   	i = 0;
>   	do {
>   		igt_output_t *output;
> @@ -986,6 +1005,12 @@ static void test_mode_timings(data_t *data, struct chamelium_port *port)
>   {
>   	int i, count_modes;
>   
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
> +	igt_display_reset(&data->display);
> +
>   	i = 0;
>   	igt_require(chamelium_supports_get_video_params(data->chamelium));
>   	do {
> @@ -1104,6 +1129,11 @@ static void test_display_aspect_ratio(data_t *data, struct chamelium_port *port)
>   	uint32_t aspect_ratio;
>   	enum infoframe_avi_picture_aspect_ratio frame_ar;
>   
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
> +	igt_display_reset(&data->display);
>   	igt_require(chamelium_supports_get_last_infoframe(data->chamelium));
>   
>   	igt_modeset_disable_all_outputs(&data->display);
> @@ -1835,6 +1865,12 @@ test_display_audio(data_t *data, struct chamelium_port *port,
>   	 * chamelium_get_audio_format support. */
>   	igt_require(chamelium_has_audio_support(data->chamelium, port));
>   
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
> +	igt_display_reset(&data->display);
> +
>   	alsa = alsa_init();
>   	igt_assert(alsa);
>   
> @@ -1921,6 +1957,12 @@ test_display_audio_edid(data_t *data, struct chamelium_port *port,
>   
>   	igt_require(eld_is_supported());
>   
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
> +	igt_display_reset(&data->display);
> +
>   	igt_modeset_disable_all_outputs(&data->display);
>   	chamelium_reset_state(&data->display, data->chamelium,
>   			      port, data->ports, data->port_count);
> @@ -2348,6 +2390,12 @@ static void test_display_planes_random(data_t *data,
>   	unsigned int i;
>   	unsigned int fb_id;
>   
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
> +	igt_display_reset(&data->display);
> +
>   	switch (check) {
>   	case CHAMELIUM_CHECK_CRC:
>   		allow_scaling = false;

-- 
~Swati Sharma
