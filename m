Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64FA10E3C1
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 08:58:29 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Tue, 27 Sep 2022 08:58:26 +0000
Message-ID: <DM4PR11MB63129FFE564F5ABACA3F677890559@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20220926185321.2897136-1-kunal1.joshi@intel.com>
 <20220926185321.2897136-2-kunal1.joshi@intel.com>
In-Reply-To: <20220926185321.2897136-2-kunal1.joshi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v1 1/5] tests/chamelium/kms_chamelium.c:
 test cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

LGTM

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: Tuesday, September 27, 2022 12:23 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [igt-dev] [PATCH i-g-t v1 1/5] tests/chamelium/kms_chamelium.c:
> test cleanup
>=20
> -> Sanitize the state before starting the subtest
>=20
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/chamelium/kms_chamelium.c | 48
> +++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>=20
> diff --git a/tests/chamelium/kms_chamelium.c
> b/tests/chamelium/kms_chamelium.c index 1be1c41a..985a906c 100644
> --- a/tests/chamelium/kms_chamelium.c
> +++ b/tests/chamelium/kms_chamelium.c
> @@ -756,6 +756,13 @@ static void test_display_one_mode(data_t *data,
> struct chamelium_port *port,
>  	igt_output_t *output;
>  	igt_plane_t *primary;
>=20
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
> +	igt_display_reset(&data->display);
> +
> +
>  	igt_modeset_disable_all_outputs(&data->display);
>  	chamelium_reset_state(&data->display, data->chamelium,
>  			      port, data->ports, data->port_count); @@ -792,6
> +799,12 @@ static void test_display_all_modes(data_t *data, struct
> chamelium_port *port,
>  	if (check =3D=3D CHAMELIUM_CHECK_ANALOG)
>  		bridge =3D check_analog_bridge(data, port);
>=20
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
> +	igt_display_reset(&data->display);
> +
>  	i =3D 0;
>  	do {
>  		igt_output_t *output;
> @@ -847,6 +860,12 @@ test_display_frame_dump(data_t *data, struct
> chamelium_port *port)
>=20
>  	int i, count_modes;
>=20
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
> +	igt_display_reset(&data->display);
> +
>  	i =3D 0;
>  	do {
>  		igt_output_t *output;
> @@ -986,6 +1005,12 @@ static void test_mode_timings(data_t *data, struct
> chamelium_port *port)  {
>  	int i, count_modes;
>=20
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
> +	igt_display_reset(&data->display);
> +
>  	i =3D 0;
>  	igt_require(chamelium_supports_get_video_params(data-
> >chamelium));
>  	do {
> @@ -1104,6 +1129,11 @@ static void test_display_aspect_ratio(data_t
> *data, struct chamelium_port *port)
>  	uint32_t aspect_ratio;
>  	enum infoframe_avi_picture_aspect_ratio frame_ar;
>=20
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
> +	igt_display_reset(&data->display);
>  	igt_require(chamelium_supports_get_last_infoframe(data-
> >chamelium));
>=20
>  	igt_modeset_disable_all_outputs(&data->display);
> @@ -1835,6 +1865,12 @@ test_display_audio(data_t *data, struct
> chamelium_port *port,
>  	 * chamelium_get_audio_format support. */
>  	igt_require(chamelium_has_audio_support(data->chamelium, port));
>=20
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
> +	igt_display_reset(&data->display);
> +
>  	alsa =3D alsa_init();
>  	igt_assert(alsa);
>=20
> @@ -1921,6 +1957,12 @@ test_display_audio_edid(data_t *data, struct
> chamelium_port *port,
>=20
>  	igt_require(eld_is_supported());
>=20
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
> +	igt_display_reset(&data->display);
> +
>  	igt_modeset_disable_all_outputs(&data->display);
>  	chamelium_reset_state(&data->display, data->chamelium,
>  			      port, data->ports, data->port_count); @@ -
> 2348,6 +2390,12 @@ static void test_display_planes_random(data_t *data,
>  	unsigned int i;
>  	unsigned int fb_id;
>=20
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
> +	igt_display_reset(&data->display);
> +
>  	switch (check) {
>  	case CHAMELIUM_CHECK_CRC:
>  		allow_scaling =3D false;
> --
> 2.25.1
