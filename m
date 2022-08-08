Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1054C10FC61
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Aug 2022 14:02:52 +0000 (UTC)
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
To: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Mon, 8 Aug 2022 14:02:41 +0000
Message-ID: <DM8PR11MB5719C6E42645B6BA73E8D6838D639@DM8PR11MB5719.namprd11.prod.outlook.com>
References: <20220804034029.17355-1-nidhi1.gupta@intel.com>
 <20220804034029.17355-3-nidhi1.gupta@intel.com>
 <PH7PR11MB60065A5E2620BD63B428B79BC5639@PH7PR11MB6006.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB60065A5E2620BD63B428B79BC5639@PH7PR11MB6006.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 2/2] tests/i915/kms_draw_crc: Test Cleanup
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

Hi Nidhi,

Sure, I'll try to do it by tomorrow.

BTW, did you visually verified this patch locally?


Thanks,
Bhanu

> -----Original Message-----
> From: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
> Sent: Monday, August 8, 2022 4:46 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: RE: [PATCH 2/2] tests/i915/kms_draw_crc: Test Cleanup
>=20
> Hi Bhanu,
>=20
> If you could review the below patch it would be helpful.
>=20
> Thanks
> Nidhi.
>=20
> -----Original Message-----
> From: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
> Sent: Thursday, August 4, 2022 9:10 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Gupta, Nidhi1
> <nidhi1.gupta@intel.com>
> Subject: [PATCH 2/2] tests/i915/kms_draw_crc: Test Cleanup
>=20
> v2: -Replace drm function call with existing library functions
>      (Bhanu)
>=20
> v3: -Replace PIPE_A with compatible pipe/output combo.
>      (Bhanu)
>=20
> v4: -use for_each_pipe_with_single_output() for finding
>      compatible pipe/ouput combo.
>      -remove crtc_id as not used anywhere.
>      -set fb to primary plane before commiting.
>      (Bhanu)
>=20
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>  tests/i915/kms_draw_crc.c | 73 +++++++++++++++------------------------
>  1 file changed, 28 insertions(+), 45 deletions(-)
>=20
> diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c index
> 48c7d931..c7354df9 100644
> --- a/tests/i915/kms_draw_crc.c
> +++ b/tests/i915/kms_draw_crc.c
> @@ -31,12 +31,12 @@
>=20
>  struct modeset_params {
>  	uint32_t crtc_id;
> -	uint32_t connector_id;
>  	drmModeModeInfoPtr mode;
>  };
>=20
>  int drm_fd;
> -drmModeResPtr drm_res;
> +igt_display_t display;
> +igt_output_t *output;
>  drmModeConnectorPtr drm_connectors[MAX_CONNECTORS];  struct buf_ops *bop=
s;
> igt_pipe_crc_t *pipe_crc; @@ -64,30 +64,25 @@ struct modeset_params ms;
>=20
>  static void find_modeset_params(void)
>  {
> -	int i;
> -	uint32_t crtc_id;
> -	drmModeConnectorPtr connector =3D NULL;
> -	drmModeModeInfoPtr mode =3D NULL;
> -
> -	for (i =3D 0; i < drm_res->count_connectors; i++) {
> -		drmModeConnectorPtr c =3D drm_connectors[i];
> +	enum pipe pipe1;
> +	drmModeModeInfo *mode;
>=20
> -		if (c->count_modes) {
> -			connector =3D c;
> -			mode =3D &c->modes[0];
> -			break;
> -		}
> -	}
> -	igt_require(connector);
> +	igt_display_reset(&display);
> +	igt_display_commit(&display);
>=20
> -	crtc_id =3D kmstest_find_crtc_for_connector(drm_fd, drm_res, connector,
> -						  0);
> -	igt_assert(mode);
> +	for_each_pipe_with_single_output(&display, pipe1, output) {
> +		output =3D igt_get_single_output_for_pipe(&display, pipe1);
> +		igt_require(output);
> +		igt_output_set_pipe(output, pipe1);
>=20
> -	ms.connector_id =3D connector->connector_id;
> -	ms.crtc_id =3D crtc_id;
> -	ms.mode =3D mode;
> +		mode =3D igt_output_get_mode(output);
> +		igt_assert(mode);
>=20
> +		ms.mode =3D mode;
> +		pipe_crc =3D igt_pipe_crc_new(drm_fd, pipe1,
> INTEL_PIPE_CRC_SOURCE_AUTO);
> +		/*Only one pipe/output is enough*/
> +		break;
> +	}
>  }
>=20
>  static uint32_t get_color(uint32_t drm_format, bool r, bool g, bool b) @=
@ -
> 122,9 +117,14 @@ static void get_method_crc(enum igt_draw_method method,
> uint32_t drm_format,  {
>  	struct igt_fb fb;
>  	int rc;
> +	igt_plane_t *primary;
> +
> +	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>=20
>  	igt_create_fb(drm_fd, ms.mode->hdisplay, ms.mode->vdisplay,
>  		      drm_format, modifier, &fb);
> +	igt_plane_set_fb(primary, &fb);
> +
>  	igt_draw_rect_fb(drm_fd, bops, 0, &fb, method,
>  			 0, 0, fb.width, fb.height,
>  			 get_color(drm_format, 0, 0, 1));
> @@ -144,8 +144,7 @@ static void get_method_crc(enum igt_draw_method metho=
d,
> uint32_t drm_format,
>  	igt_draw_rect_fb(drm_fd, bops, 0, &fb, method, 1, 1, 15, 15,
>  			 get_color(drm_format, 0, 1, 1));
>=20
> -	rc =3D drmModeSetCrtc(drm_fd, ms.crtc_id, fb.fb_id, 0, 0,
> -			    &ms.connector_id, 1, ms.mode);
> +	rc =3D igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC =
:
> +COMMIT_LEGACY);
>  	igt_assert_eq(rc, 0);
>=20
>  	igt_pipe_crc_collect_crc(pipe_crc, crc); @@ -203,8 +202,7 @@ static voi=
d
> get_fill_crc(uint64_t modifier, igt_crc_t *crc)
>=20
>  	igt_draw_fill_fb(drm_fd, &fb, 0xFF);
>=20
> -	rc =3D drmModeSetCrtc(drm_fd, ms.crtc_id, fb.fb_id, 0, 0,
> -			    &ms.connector_id, 1, ms.mode);
> +	rc =3D igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC =
:
> +COMMIT_LEGACY);
>  	igt_assert_eq(rc, 0);
>=20
>  	igt_pipe_crc_collect_crc(pipe_crc, crc); @@ -227,8 +225,7 @@ static voi=
d
> fill_fb_subtest(void)
>  							 IGT_DRAW_MMAP_WC,
>  			 0, 0, fb.width, fb.height, 0xFF);
>=20
> -	rc =3D drmModeSetCrtc(drm_fd, ms.crtc_id, fb.fb_id, 0, 0,
> -			    &ms.connector_id, 1, ms.mode);
> +	rc =3D igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC =
:
> +COMMIT_LEGACY);
>  	igt_assert_eq(rc, 0);
>=20
>  	igt_pipe_crc_collect_crc(pipe_crc, &base_crc); @@ -251,40 +248,26 @@
> static void fill_fb_subtest(void)
>=20
>  static void setup_environment(void)
>  {
> -	int i;
> -
>  	drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
>  	igt_require(drm_fd >=3D 0);
> -
> -	drm_res =3D drmModeGetResources(drm_fd);
> -	igt_require(drm_res);
> -	igt_assert(drm_res->count_connectors <=3D MAX_CONNECTORS);
> -
> -	for (i =3D 0; i < drm_res->count_connectors; i++)
> -		drm_connectors[i] =3D drmModeGetConnectorCurrent(drm_fd,
> -							       drm_res->connectors[i]);
> +	igt_display_require(&display, drm_fd);
> +	igt_display_require_output(&display);
>=20
>  	kmstest_set_vt_graphics_mode();
>=20
>  	bops =3D buf_ops_create(drm_fd);
>=20
>  	find_modeset_params();
> -	pipe_crc =3D igt_pipe_crc_new(drm_fd, kmstest_get_crtc_idx(drm_res,
> ms.crtc_id),
> -				    INTEL_PIPE_CRC_SOURCE_AUTO);
>  }
>=20
>  static void teardown_environment(void)
>  {
> -	int i;
> -
>  	igt_pipe_crc_free(pipe_crc);
>=20
>  	buf_ops_destroy(bops);
>=20
> -	for (i =3D 0; i < drm_res->count_connectors; i++)
> -		drmModeFreeConnector(drm_connectors[i]);
> +	igt_display_reset(&display);
>=20
> -	drmModeFreeResources(drm_res);
>  	close(drm_fd);
>  }
>=20
> --
> 2.36.0
