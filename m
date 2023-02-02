Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A8310E047
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Feb 2023 18:39:53 +0000 (UTC)
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 2 Feb 2023 18:39:38 +0000
Message-ID: <DM4PR11MB6360BFC2E0ABDFFCC0E55499F4D69@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20221227083741.14644-1-swati2.sharma@intel.com>
 <20221227083741.14644-3-swati2.sharma@intel.com>
In-Reply-To: <20221227083741.14644-3-swati2.sharma@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_hdr: Add negative test to
 enforce HDR on non-HDR panel
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



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati =
Sharma
> Sent: Tuesday, December 27, 2022 2:08 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_hdr: Add negative test to =
enforce HDR
> on non-HDR panel
>=20
> Negative test is added to ensure HDR is not enabled on non-HDR panel.
> Commit/modeset won't fail. However, in dmesg we can find
> 	[drm:drm_hdmi_infoframe_set_hdr_metadata [drm_display_helper]] EOTF
> Not Supported

Hmm, not very ideal to rely on kernel message. But no major objection,
Looks ok to me.

Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/kms_hdr.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c index 629a45a7..18ccfce7 1=
00644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -51,6 +51,7 @@ enum {
>  	TEST_SUSPEND =3D 1 << 2,
>  	TEST_SWAP =3D 1 << 3,
>  	TEST_INVALID_METADATA_SIZES =3D 1 << 4,
> +	TEST_INVALID_HDR =3D 1 << 5,
>  };
>=20
>  /* BPC connector state. */
> @@ -414,6 +415,8 @@ static void test_static_toggle(data_t *data, enum pip=
e pipe,
>  	set_hdr_output_metadata(data, &hdr);
>  	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
>  	igt_display_commit_atomic(display,
> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	if (flags & TEST_INVALID_HDR)
> +		igt_assert_eq(system("dmesg|grep -E \"EOTF Not Supported\""), 0);
>  	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 10);
>=20
>  	/* Verify that the CRC are equal after DPMS or suspend. */ @@ -565,7
> +568,11 @@ static void test_hdr(data_t *data, uint32_t flags)
>  		if (!has_max_bpc(output) || !has_hdr(output))
>  			continue;
>=20
> -		if (!is_panel_hdr(data, output))
> +		/* For negative test, panel should be non-hdr. */
> +		if ((flags & TEST_INVALID_HDR) && is_panel_hdr(data, output))
> +			continue;
> +
> +		if ((flags & ~TEST_INVALID_HDR) && !is_panel_hdr(data, output))
>  			continue;
>=20
>  		if (igt_get_output_max_bpc(data->fd, output->name) < 10) @@ -
> 587,7 +594,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>=20
>  				igt_dynamic_f("pipe-%s-%s",
>  					      kmstest_pipe_name(pipe), output-
> >name) {
> -					if (flags & TEST_NONE || flags &
> TEST_DPMS || flags & TEST_SUSPEND)
> +					if (flags & TEST_NONE || flags &
> TEST_DPMS || flags & TEST_SUSPEND
> +|| flags & TEST_INVALID_HDR)
>  						test_static_toggle(data, pipe,
> output, flags);
>  					if (flags & TEST_SWAP)
>  						test_static_swap(data, pipe,
> output); @@ -645,6 +652,10 @@ igt_main
>  	igt_subtest_with_dynamic("invalid-metadata-sizes")
>  		test_hdr(&data, TEST_INVALID_METADATA_SIZES);
>=20
> +	igt_describe("Test to ensure HDR is not enabled on non-HDR panel");
> +	igt_subtest_with_dynamic("invalid-hdr")
> +		test_hdr(&data, TEST_INVALID_HDR);
> +
>  	igt_fixture {
>  		igt_display_fini(&data.display);
>  		close(data.fd);
> --
> 2.17.1
