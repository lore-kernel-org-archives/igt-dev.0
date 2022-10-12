Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8869310E2AC
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Oct 2022 15:44:56 +0000 (UTC)
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Wed, 12 Oct 2022 15:44:50 +0000
Message-ID: <PH0PR11MB480615E07C4838FC18EA67FCE4229@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20220928133703.55196-1-mohammed.thasleem@intel.com>
 <20221006193319.230261-1-mohammed.thasleem@intel.com>
 <Yz8y/zn5q05WeOsR@intel.com>
In-Reply-To: <Yz8y/zn5q05WeOsR@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_properties: Create dynamic
 subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Ville,

Thanks for the reviews.
Addressed your comments at below series.
https://patchwork.freedesktop.org/series/109555/=20
Could you please provide inputs?

Thanks,
Mohammed Thasleem
-----Original Message-----
From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>=20
Sent: Friday, October 7, 2022 1:27 AM
To: Thasleem, Mohammed <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_properties: Create dynamic s=
ubtests

On Fri, Oct 07, 2022 at 01:03:19AM +0530, Mohammed Thasleem wrote:
> Modified kms_properties to include dynamic test cases.
>=20
> v2: Fixed compilation issue.
> v3: Removed redundant code.
> v4: Moved get_prop_sanity calls to igt_subtest_group.
> v5: Replace for loop with for_each_disconnected_output.
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/kms_properties.c | 176=20
> ++++++++++++++++++-----------------------
>  1 file changed, 77 insertions(+), 99 deletions(-)
>=20
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c index=20
> 2958efac..76ef64ab 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -43,6 +43,7 @@ static void prepare_pipe(igt_display_t *display, enum p=
ipe pipe, igt_output_t *o
>  	igt_create_pattern_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
>  			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, fb);
> =20
> +	igt_display_reset(display);
>  	igt_output_set_pipe(output, pipe);
> =20
>  	igt_plane_set_fb(igt_output_get_plane_type(output,=20
> DRM_PLANE_TYPE_PRIMARY), fb); @@ -230,77 +231,52 @@ static void=20
> run_connector_property_tests(igt_display_t *display, enum pipe pipe,
> =20
>  static void plane_properties(igt_display_t *display, bool atomic)  {
> -	bool found_any =3D false, found;
>  	igt_output_t *output;
>  	enum pipe pipe;
> =20
> -	if (atomic)
> -		igt_skip_on(!display->is_atomic);
> -
> -	for_each_pipe(display, pipe) {
> -		found =3D false;
> -
> -		for_each_valid_output_on_pipe(display, pipe, output) {
> -			found_any =3D found =3D true;
> -
> +	for_each_pipe_with_single_output(display, pipe, output) {
> +		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +			      igt_output_name(output)) {
>  			run_plane_property_tests(display, pipe, output, atomic);
> -			break;
>  		}
>  	}
> -
> -	igt_skip_on(!found_any);
>  }
> =20
>  static void crtc_properties(igt_display_t *display, bool atomic)  {
> -	bool found_any_valid_pipe =3D false, found;
>  	enum pipe pipe;
>  	igt_output_t *output;
> =20
> -	if (atomic)
> -		igt_skip_on(!display->is_atomic);
> -
> -	for_each_pipe(display, pipe) {
> -		found =3D false;
> -
> -		for_each_valid_output_on_pipe(display, pipe, output) {
> -			found_any_valid_pipe =3D found =3D true;
> -
> +	for_each_pipe_with_single_output(display, pipe, output) {
> +		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +			      igt_output_name(output)) {
>  			run_crtc_property_tests(display, pipe, output, atomic);
> -			break;
>  		}
>  	}
> -
> -	igt_skip_on(!found_any_valid_pipe);
>  }
> =20
>  static void connector_properties(igt_display_t *display, bool atomic) =20
> {
> -	int i;
>  	enum pipe pipe;
>  	igt_output_t *output;
> =20
> -	if (atomic)
> -		igt_skip_on(!display->is_atomic);
> -
>  	for_each_connected_output(display, output) {
> -		bool found =3D false;
> =20
>  		for_each_pipe(display, pipe) {
>  			if (!igt_pipe_connector_valid(pipe, output))
>  				continue;
> =20
> -			found =3D true;
> -			run_connector_property_tests(display, pipe, output, atomic);
> -			break;
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +				      igt_output_name(output)) {
> +				run_connector_property_tests(display, pipe, output, atomic);
> +			}
>  		}
> +		break;
> =20
> -		igt_assert_f(found, "Connected output should have at least 1 valid crt=
c\n");
>  	}
> =20
> -	for (i =3D 0; i < display->n_outputs; i++)
> -		if (!igt_output_is_connected(&display->outputs[i]))
> -			run_connector_property_tests(display, PIPE_NONE, &display->outputs[i]=
, atomic);
> +	for_each_disconnected_output(display, output)

Nothing to do with the subject of this patch.

> +		run_connector_property_tests(display, PIPE_NONE, output, atomic);
>  }
> =20
>  static void test_invalid_properties(int fd, @@ -368,7 +344,6 @@=20
> static void test_object_invalid_properties(igt_display_t *display,
>  	igt_output_t *output;
>  	igt_plane_t *plane;
>  	enum pipe pipe;
> -	int i;
> =20
>  	for_each_pipe(display, pipe)
>  		test_invalid_properties(display->drm_fd, id, type,=20
> display->pipes[pipe].crtc_id, DRM_MODE_OBJECT_CRTC, atomic); @@ -377,7 +3=
52,7 @@ static void test_object_invalid_properties(igt_display_t *display,
>  		for_each_plane_on_pipe(display, pipe, plane)
>  			test_invalid_properties(display->drm_fd, id, type,=20
> plane->drm_plane->plane_id, DRM_MODE_OBJECT_PLANE, atomic);
> =20
> -	for (i =3D 0, output =3D &display->outputs[0]; i < display->n_outputs; =
output =3D &display->outputs[++i])
> +	for_each_connected_output(display, output)

Those two things are not at all the same.

There are clearly multiple patches hiding inside this single mega patch of =
yours. Please split it up properly.

--
Ville Syrj=E4l=E4
Intel
