Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9166E219
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Aug 2021 04:44:33 +0000 (UTC)
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Wed, 4 Aug 2021 04:44:28 +0000
Message-ID: <DM8PR11MB57193EFD41705ACE35A5C4AF8DF19@DM8PR11MB5719.namprd11.prod.outlook.com>
References: <20210730072145.224255-1-bhanuprakash.modem@intel.com>
 <20210803160638.dznao3jw74asp7ic@outlook.office365.com>
In-Reply-To: <20210803160638.dznao3jw74asp7ic@outlook.office365.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms: Move Intel specific kms
 tests to i915 directory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Latvala,
 Petri" <petri.latvala@intel.com>, "nicholas.choi@amd.com" <nicholas.choi@amd.com>, Melissa Wen <melissa.srw@gmail.com>, Mark Yacoub <markyacoub@google.com>, Anson Jacob <Anson.Jacob@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

> From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Sent: Tuesday, August 3, 2021 9:37 PM
> To: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Latvala, Petri <petri.latvala@intel.co=
m>;
> nicholas.choi@amd.com; Melissa Wen <melissa.srw@gmail.com>; Mark Yacoub
> <markyacoub@google.com>; Anson Jacob <Anson.Jacob@amd.com>
> Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms: Move Intel specific kms t=
ests
> to i915 directory
>=20
> Hi,
>=20
> First of all, thanks a lot for this series. In general, this patch lgtm,
> I just have a few comments but just for discussion.
>=20
> On 07/30, Bhanuprakash Modem wrote:
> > As KMS tests on IGT are officially supported on multiple SoCs
> > and there is an active development on it. So, KMS tests are
> > meant to be generic and if we need to test few things specific
> > to Intel, so we can use igt_require_intel(). But if the whole
> > test is Intel specific, then the best place for the test would
> > be tests/i915.
> >
> > This patch will move all Intel specific kms tests to tests/i915
> > directory. And update the tests those are generic but still open
> > the driver as 'drm_open_driver_master(DRIVER_INTEL);'. This patch
> > will also do some minor cleanups.
> >
> > Cc: Mark Yacoub <markyacoub@chromium.org>
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > Cc: Vidya Srinivas <vidya.srinivas@intel.com>
> > Cc: Karthik B S <karthik.b.s@intel.com>
> > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > ---
> >  tests/{ =3D> i915}/kms_big_fb.c               |  0
> >  tests/{ =3D> i915}/kms_busy.c                 |  0
> >  tests/{ =3D> i915}/kms_ccs.c                  |  0
> >  tests/{ =3D> i915}/kms_cdclk.c                |  0
> >  tests/{ =3D> i915}/kms_draw_crc.c             |  0
> >  tests/{ =3D> i915}/kms_fence_pin_leak.c       |  0
> >  tests/{ =3D> i915}/kms_flip_scaled_crc.c      |  0
> >  tests/{ =3D> i915}/kms_flip_tiling.c          |  0
> >  tests/{ =3D> i915}/kms_frontbuffer_tracking.c |  0
> >  tests/{ =3D> i915}/kms_invalid_dotclock.c     |  0
> >  tests/{ =3D> i915}/kms_legacy_colorkey.c      |  0
> >  tests/{ =3D> i915}/kms_pipe_b_c_ivb.c         |  0
> >  tests/{ =3D> i915}/kms_psr.c                  |  0
> >  tests/{ =3D> i915}/kms_psr2_sf.c              |  0
> >  tests/{ =3D> i915}/kms_psr2_su.c              |  0
> >  tests/kms_3d.c                              |  5 ++--
> >  tests/kms_big_joiner.c                      |  2 +-
> >  tests/kms_cursor_edge_walk.c                |  9 ++++---
> >  tests/kms_fbcon_fbt.c                       |  3 ++-
> >  tests/kms_force_connector_basic.c           |  4 +--
> >  tests/kms_hdmi_inject.c                     | 14 +++++-----
> >  tests/kms_mmap_write_crc.c                  |  8 +++---
> >  tests/kms_pwrite_crc.c                      |  8 +++---
> >  tests/kms_tv_load_detect.c                  |  2 +-
> >  tests/kms_universal_plane.c                 | 10 ++++---
> >  tests/meson.build                           | 30 ++++++++++-----------
> >  26 files changed, 50 insertions(+), 45 deletions(-)
> >  rename tests/{ =3D> i915}/kms_big_fb.c (100%)
> >  rename tests/{ =3D> i915}/kms_busy.c (100%)
> >  rename tests/{ =3D> i915}/kms_ccs.c (100%)
> >  rename tests/{ =3D> i915}/kms_cdclk.c (100%)
> >  rename tests/{ =3D> i915}/kms_draw_crc.c (100%)
> >  rename tests/{ =3D> i915}/kms_fence_pin_leak.c (100%)
> >  rename tests/{ =3D> i915}/kms_flip_scaled_crc.c (100%)
> >  rename tests/{ =3D> i915}/kms_flip_tiling.c (100%)
> >  rename tests/{ =3D> i915}/kms_frontbuffer_tracking.c (100%)
> >  rename tests/{ =3D> i915}/kms_invalid_dotclock.c (100%)
> >  rename tests/{ =3D> i915}/kms_legacy_colorkey.c (100%)
> >  rename tests/{ =3D> i915}/kms_pipe_b_c_ivb.c (100%)
> >  rename tests/{ =3D> i915}/kms_psr.c (100%)
> >  rename tests/{ =3D> i915}/kms_psr2_sf.c (100%)
> >  rename tests/{ =3D> i915}/kms_psr2_su.c (100%)
> >
> > diff --git a/tests/kms_big_fb.c b/tests/i915/kms_big_fb.c
> > similarity index 100%
> > rename from tests/kms_big_fb.c
> > rename to tests/i915/kms_big_fb.c
> > diff --git a/tests/kms_busy.c b/tests/i915/kms_busy.c
> > similarity index 100%
> > rename from tests/kms_busy.c
> > rename to tests/i915/kms_busy.c
> > diff --git a/tests/kms_ccs.c b/tests/i915/kms_ccs.c
> > similarity index 100%
> > rename from tests/kms_ccs.c
> > rename to tests/i915/kms_ccs.c
> > diff --git a/tests/kms_cdclk.c b/tests/i915/kms_cdclk.c
> > similarity index 100%
> > rename from tests/kms_cdclk.c
> > rename to tests/i915/kms_cdclk.c
> > diff --git a/tests/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
> > similarity index 100%
> > rename from tests/kms_draw_crc.c
> > rename to tests/i915/kms_draw_crc.c
> > diff --git a/tests/kms_fence_pin_leak.c b/tests/i915/kms_fence_pin_leak=
.c
> > similarity index 100%
> > rename from tests/kms_fence_pin_leak.c
> > rename to tests/i915/kms_fence_pin_leak.c
> > diff --git a/tests/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_c=
rc.c
> > similarity index 100%
> > rename from tests/kms_flip_scaled_crc.c
> > rename to tests/i915/kms_flip_scaled_crc.c
> > diff --git a/tests/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c
> > similarity index 100%
> > rename from tests/kms_flip_tiling.c
> > rename to tests/i915/kms_flip_tiling.c
> > diff --git a/tests/kms_frontbuffer_tracking.c
> b/tests/i915/kms_frontbuffer_tracking.c
> > similarity index 100%
> > rename from tests/kms_frontbuffer_tracking.c
> > rename to tests/i915/kms_frontbuffer_tracking.c
> > diff --git a/tests/kms_invalid_dotclock.c
> b/tests/i915/kms_invalid_dotclock.c
> > similarity index 100%
> > rename from tests/kms_invalid_dotclock.c
> > rename to tests/i915/kms_invalid_dotclock.c
> > diff --git a/tests/kms_legacy_colorkey.c b/tests/i915/kms_legacy_colork=
ey.c
> > similarity index 100%
> > rename from tests/kms_legacy_colorkey.c
> > rename to tests/i915/kms_legacy_colorkey.c
> > diff --git a/tests/kms_pipe_b_c_ivb.c b/tests/i915/kms_pipe_b_c_ivb.c
> > similarity index 100%
> > rename from tests/kms_pipe_b_c_ivb.c
> > rename to tests/i915/kms_pipe_b_c_ivb.c
> > diff --git a/tests/kms_psr.c b/tests/i915/kms_psr.c
> > similarity index 100%
> > rename from tests/kms_psr.c
> > rename to tests/i915/kms_psr.c
> > diff --git a/tests/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
> > similarity index 100%
> > rename from tests/kms_psr2_sf.c
> > rename to tests/i915/kms_psr2_sf.c
> > diff --git a/tests/kms_psr2_su.c b/tests/i915/kms_psr2_su.c
> > similarity index 100%
> > rename from tests/kms_psr2_su.c
> > rename to tests/i915/kms_psr2_su.c
> > diff --git a/tests/kms_3d.c b/tests/kms_3d.c
> > index 2e438b430..c29d1d57c 100644
> > --- a/tests/kms_3d.c
> > +++ b/tests/kms_3d.c
> > @@ -34,7 +34,7 @@ igt_simple_main
> >  	const struct edid *edid;
> >  	int mode_count, connector_id;
> >
> > -	drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> > +	drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> >
> >  	res =3D drmModeGetResources(drm_fd);
> >  	igt_require(res);
> > @@ -44,7 +44,8 @@ igt_simple_main
> >  	/* find an hdmi connector */
> >  	for (int i =3D 0; i < res->count_connectors; i++) {
> >  		connector =3D drmModeGetConnectorCurrent(drm_fd, res->connectors[i])=
;
> > -		if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA)
> > +		if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
> > +		    connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIB)
> >  			break;
> >  		drmModeFreeConnector(connector);
> >  		connector =3D NULL;
> > diff --git a/tests/kms_big_joiner.c b/tests/kms_big_joiner.c
> > index 4f1f3152e..45c5b2a2a 100644
> > --- a/tests/kms_big_joiner.c
> > +++ b/tests/kms_big_joiner.c
> > @@ -258,7 +258,7 @@ igt_main
> >  	uint16_t width =3D 0, height =3D 0;
> >
> >  	igt_fixture {
> > -		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> > +		data.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> >  		kmstest_set_vt_graphics_mode();
> >
> >  		igt_display_require(&data.display, data.drm_fd);
> > diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.=
c
> > index e9902f5e7..66781eec6 100644
> > --- a/tests/kms_cursor_edge_walk.c
> > +++ b/tests/kms_cursor_edge_walk.c
> > @@ -94,8 +94,8 @@ static void cursor_move(data_t *data, int x, int y, i=
nt i)
> >  	 * fails). So let's accept a failure from the ioctl in that case.
> >  	 */
> >  	igt_assert(drmModeMoveCursor(data->drm_fd, crtc_id, x, y) =3D=3D 0 ||
> > -		   (IS_CHERRYVIEW(data->devid) && data->pipe =3D=3D PIPE_C &&
> > -		    x < 0 && x > -data->curw));
> > +		   (data->devid && IS_CHERRYVIEW(data->devid) &&
> > +		    data->pipe =3D=3D PIPE_C && x < 0 && x > -data->curw));
> >  	igt_wait_for_vblank(data->drm_fd,
> >  			display->pipes[data->pipe].crtc_offset);
> >  }
> > @@ -312,9 +312,10 @@ igt_main_args("", long_opts, help_str, opt_handler=
,
> &data)
> >  	igt_fixture {
> >  		int ret;
> >
> > -		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> > +		data.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> >
> > -		data.devid =3D intel_get_drm_devid(data.drm_fd);
> > +		if (is_i915_device(data.drm_fd))
> > +			data.devid =3D intel_get_drm_devid(data.drm_fd);
> >
> >  		ret =3D drmGetCap(data.drm_fd, DRM_CAP_CURSOR_WIDTH, &max_curw);
> >  		igt_assert(ret =3D=3D 0 || errno =3D=3D EINVAL);
>=20
> After this changes, all of these tests pass on Radeon RX 5600 :)
>=20
> > diff --git a/tests/kms_fbcon_fbt.c b/tests/kms_fbcon_fbt.c
> > index 98c452c4f..ff9c5f7bc 100644
> > --- a/tests/kms_fbcon_fbt.c
> > +++ b/tests/kms_fbcon_fbt.c
> > @@ -337,6 +337,7 @@ static void subtest(struct drm_info *drm, struct fe=
ature
> *feature, bool suspend)
> >  	igt_device_set_master(drm->fd);
> >  	kmstest_set_vt_graphics_mode();
> >
> > +	igt_require_intel(drm->fd);
> >  	igt_require(feature->supported_on_chipset(drm->fd, drm->debugfs_fd));
> >
> >  	disable_features(drm->fd, drm->debugfs_fd);
> > @@ -378,7 +379,7 @@ static void setup_environment(struct drm_info *drm)
> >  {
> >  	int i;
> >
> > -	drm->fd =3D drm_open_driver_master(DRIVER_INTEL);
> > +	drm->fd =3D drm_open_driver_master(DRIVER_ANY);
> >  	igt_require(drm->fd >=3D 0);
> >  	drm->debugfs_fd =3D igt_debugfs_dir(drm->fd);
> >  	igt_require(drm->debugfs_fd >=3D 0);
>=20
> All of these tests skip on AMD devices. I noticed that two of them
> require psr, which I suppose cannot be generic, right?

True, but we can restrict those tests by adding above check.
igt_require_intel(drm->fd);

Intension of this patch is:
If the whole test is i915 specific, then move it to tests/i915 directory.
If few subtests are specific to i915, still we can consider that whole
test as generic & restrict the i915 specific stuff with igt_require_intel()

>=20
> > diff --git a/tests/kms_force_connector_basic.c
> b/tests/kms_force_connector_basic.c
> > index 3b0146fe9..683d36720 100644
> > --- a/tests/kms_force_connector_basic.c
> > +++ b/tests/kms_force_connector_basic.c
> > @@ -37,7 +37,7 @@ static void reset_connectors(void)
> >  	drmModeRes *res;
> >  	drmModeConnector *connector =3D NULL;
> >
> > -	drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> > +	drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> >  	res =3D drmModeGetResources(drm_fd);
> >
> >  	for (int i =3D 0; i < res->count_connectors; i++) {
> > @@ -86,7 +86,7 @@ igt_main_args("", long_opts, help_str, opt_handler, N=
ULL)
> >  	igt_fixture {
> >  		unsigned connector_id =3D 0;
> >
> > -		drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> > +		drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> >
> >  		res =3D drmModeGetResources(drm_fd);
> >  		igt_require(res);
> > diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
> > index ad2dde569..13a05eb1e 100644
> > --- a/tests/kms_hdmi_inject.c
> > +++ b/tests/kms_hdmi_inject.c
> > @@ -63,7 +63,8 @@ get_connector(int drm_fd, drmModeRes *res)
> >  		connector =3D
> >  			drmModeGetConnectorCurrent(drm_fd, res->connectors[i]);
> >
> > -		if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA)
> > +		if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
> > +		    connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIB)
> >  			break;
> >
> >  		drmModeFreeConnector(connector);
> > @@ -82,12 +83,13 @@ hdmi_inject_4k(int drm_fd, drmModeConnector *connec=
tor)
> >  	int fb_id;
> >  	struct igt_fb fb;
> >  	uint8_t found_4k_mode =3D 0;
> > -	uint32_t devid;
> >
> > -	devid =3D intel_get_drm_devid(drm_fd);
> > +	if (is_i915_device(drm_fd)) {
> > +		uint32_t devid =3D intel_get_drm_devid(drm_fd);
> >
> > -	/* 4K requires at least HSW */
> > -	igt_require(IS_HASWELL(devid) || intel_display_ver(devid) >=3D 8);
> > +		/* 4K requires at least HSW */
> > +		igt_require(IS_HASWELL(devid) || intel_display_ver(devid) >=3D 8);
> > +	}
> >
> >  	edid =3D igt_kms_get_4k_edid();
> >  	kmstest_force_edid(drm_fd, connector, edid);
> > @@ -195,7 +197,7 @@ igt_main
> >  	drmModeConnector *connector;
> >
> >  	igt_fixture {
> > -		drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> > +		drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> >
> >  		res =3D drmModeGetResources(drm_fd);
> >  		igt_require(res);
>=20
> I tried this test using Radeon RX 5600, with HDMI, connected to a 4k
> display; however, it failed:
>=20
> Starting subtest: inject-4k
> (kms_hdmi_inject:2531) CRITICAL: Test assertion failure function
> hdmi_inject_4k, file ../tests/kms_hdmi_inject.c:112:
> (kms_hdmi_inject:2531) CRITICAL: Failed assertion: found_4k_mode
> Stack trace:
>   #0 ../lib/igt_core.c:1745 __igt_fail_assert()
>   #1 [hdmi_inject_4k+0x26c]
>   #2 ../tests/kms_hdmi_inject.c:213 __real_main193()
>   #3 ../tests/kms_hdmi_inject.c:193 main()
>   #4 ../csu/libc-start.c:342 __libc_start_main()
>   #5 [_start+0x2e]
> Subtest inject-4k failed
>=20
> Any hint?

From this log, we can say that we haven't find the 4k mode from the connect=
ed
display. You can add below snippet on top of this patch to dump all support=
ed
modes.=20

 @@ -102,6 +102,8 @@ hdmi_inject_4k(int drm_fd, drmModeConnector *connector=
)
        connector =3D drmModeGetConnectorCurrent(drm_fd, cid);

        for (i =3D 0; i < connector->count_modes; i++) {
+               kmstest_dump_mode(&connector->modes[i]);
+
                if (connector->modes[i].hdisplay =3D=3D HDISPLAY_4K &&
                    connector->modes[i].vdisplay =3D=3D VDISPLAY_4K) {
                        found_4k_mode++;

>=20
> > diff --git a/tests/kms_mmap_write_crc.c b/tests/kms_mmap_write_crc.c
> > index 2e323a209..0c697c246 100644
> > --- a/tests/kms_mmap_write_crc.c
> > +++ b/tests/kms_mmap_write_crc.c
> > @@ -51,7 +51,6 @@ typedef struct {
> >  	enum pipe pipe;
> >  	igt_crc_t ref_crc;
> >  	igt_pipe_crc_t *pipe_crc;
> > -	uint32_t devid;
> >  } data_t;
> >
> >  static int ioctl_sync =3D true;
> > @@ -103,6 +102,7 @@ static void test(data_t *data)
> >  	igt_display_commit(display);
> >
> >  	/* make sure caching mode has become UC/WT */
> > +	igt_require_intel(data->drm_fd);
>=20
> This test skips because this line. If this cannot be generic, maybe
> consider moving it to i915?
=20
As of now only i915 is using these tests, so I have added this check.
Whoever (non-Intel SOCs) wants to expand/use these tests can remove
this check.

>=20
> >  	caching =3D gem_get_caching(data->drm_fd, fb->gem_handle);
> >  	igt_assert(caching =3D=3D I915_CACHING_NONE || caching =3D=3D
> I915_CACHING_DISPLAY);
> >
> > @@ -204,7 +204,7 @@ static void cleanup_crtc(data_t *data)
> >
> >  	igt_plane_set_fb(data->primary, NULL);
> >
> > -	igt_output_set_pipe(output, PIPE_ANY);
> > +	igt_output_set_pipe(output, PIPE_NONE);
> >  	igt_display_commit(display);
> >
> >  	igt_remove_fb(data->drm_fd, &data->fb[0]);
> > @@ -272,9 +272,7 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
> >  	int i;
> >
> >  	igt_fixture {
> > -		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> > -
> > -		data.devid =3D intel_get_drm_devid(data.drm_fd);
> > +		data.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> >
> >  		kmstest_set_vt_graphics_mode();
> >
> > diff --git a/tests/kms_pwrite_crc.c b/tests/kms_pwrite_crc.c
> > index dc32a070c..a1642df6f 100644
> > --- a/tests/kms_pwrite_crc.c
> > +++ b/tests/kms_pwrite_crc.c
> > @@ -42,7 +42,6 @@ typedef struct {
> >  	enum pipe pipe;
> >  	igt_crc_t ref_crc;
> >  	igt_pipe_crc_t *pipe_crc;
> > -	uint32_t devid;
> >  } data_t;
> >
> >  static void test(data_t *data)
> > @@ -77,6 +76,7 @@ static void test(data_t *data)
> >  			0, 0, fb->width << 16, fb->height << 16);
> >
> >  	/* make sure caching mode has become UC/WT */
> > +	igt_require_intel(data->drm_fd);
>=20
> Same idea from my previous comment.

Please consider my previous comments.

- Bhanu

>=20
> Thanks
> Siqueira
>=20
> >  	caching =3D gem_get_caching(data->drm_fd, fb->gem_handle);
> >  	igt_assert(caching =3D=3D I915_CACHING_NONE || caching =3D=3D
> I915_CACHING_DISPLAY);
> >
> > @@ -141,7 +141,7 @@ static void cleanup_crtc(data_t *data)
> >
> >  	igt_plane_set_fb(data->primary, NULL);
> >
> > -	igt_output_set_pipe(output, PIPE_ANY);
> > +	igt_output_set_pipe(output, PIPE_NONE);
> >  	igt_display_commit(display);
> >
> >  	igt_remove_fb(data->drm_fd, &data->fb[0]);
> > @@ -174,9 +174,7 @@ static data_t data;
> >
> >  igt_simple_main
> >  {
> > -	data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> > -
> > -	data.devid =3D intel_get_drm_devid(data.drm_fd);
> > +	data.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> >
> >  	kmstest_set_vt_graphics_mode();
> >
> > diff --git a/tests/kms_tv_load_detect.c b/tests/kms_tv_load_detect.c
> > index caac3aecb..80ced9918 100644
> > --- a/tests/kms_tv_load_detect.c
> > +++ b/tests/kms_tv_load_detect.c
> > @@ -34,7 +34,7 @@ igt_main
> >  	drmModeConnector *tv_connector =3D NULL, *temp;
> >
> >  	igt_fixture {
> > -		drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> > +		drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> >
> >  		res =3D drmModeGetResources(drm_fd);
> >  		igt_require(res);
> > diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> > index c9a9cd47a..ea9bd9a56 100644
> > --- a/tests/kms_universal_plane.c
> > +++ b/tests/kms_universal_plane.c
> > @@ -107,7 +107,7 @@ functional_test_fini(functional_test_t *test,
> igt_output_t *output)
> >  	igt_remove_fb(test->data->drm_fd, &test->red_fb);
> >  	igt_remove_fb(test->data->drm_fd, &test->yellow_fb);
> >
> > -	igt_output_set_pipe(output, PIPE_ANY);
> > +	igt_output_set_pipe(output, PIPE_NONE);
> >  	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
> >  }
> >
> > @@ -382,6 +382,7 @@ sanity_test_pipe(data_t *data, enum pipe pipe,
> igt_output_t *output)
> >  	 * doesn't cover CRTC (should fail on pre-gen9 and succeed on
> >  	 * gen9+).
> >  	 */
> > +	igt_require_intel(data->drm_fd);
> >  	igt_plane_set_fb(primary, &test.undersized_fb);
> >  	expect =3D (data->display_ver < 9) ? -EINVAL : 0;
> >  	igt_assert(igt_display_try_commit2(&data->display, COMMIT_UNIVERSAL) =
=3D=3D
> expect);
> > @@ -579,6 +580,7 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe,
> igt_output_t *output)
> >
> >  	igt_require_pipe(display, pipe);
> >  	igt_require(display->has_cursor_plane);
> > +	igt_require_intel(data->drm_fd);
> >
> >  	igt_output_set_pipe(output, pipe);
> >  	mode =3D igt_output_get_mode(output);
> > @@ -704,6 +706,7 @@ gen9_test_pipe(data_t *data, enum pipe pipe,
> igt_output_t *output)
> >
> >  	int ret =3D 0;
> >
> > +	igt_require_intel(data->drm_fd);
> >  	igt_skip_on(data->display_ver < 9);
> >  	igt_require_pipe(&data->display, pipe);
> >
> > @@ -797,8 +800,9 @@ igt_main
> >  	enum pipe pipe;
> >
> >  	igt_fixture {
> > -		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> > -		data.display_ver =3D
> intel_display_ver(intel_get_drm_devid(data.drm_fd));
> > +		data.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> > +		if (is_i915_device(data.drm_fd))
> > +			data.display_ver =3D
> intel_display_ver(intel_get_drm_devid(data.drm_fd));
> >
> >  		kmstest_set_vt_graphics_mode();
> >
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 1bdfddbb2..f4f33ca60 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -19,11 +19,7 @@ test_progs =3D [
> >  	'kms_atomic',
> >  	'kms_atomic_interruptible',
> >  	'kms_atomic_transition',
> > -	'kms_big_fb',
> >  	'kms_big_joiner' ,
> > -	'kms_busy',
> > -	'kms_ccs',
> > -	'kms_cdclk',
> >  	'kms_concurrent',
> >  	'kms_content_protection',
> >  	'kms_cursor_crc',
> > @@ -32,26 +28,18 @@ test_progs =3D [
> >  	'kms_dither',
> >  	'kms_dp_aux_dev',
> >  	'kms_dp_tiled_display',
> > -	'kms_draw_crc',
> >  	'kms_dsc',
> >  	'kms_fbcon_fbt',
> > -	'kms_fence_pin_leak',
> >  	'kms_flip',
> >  	'kms_flip_event_leak',
> > -	'kms_flip_scaled_crc',
> > -	'kms_flip_tiling',
> >  	'kms_force_connector_basic',
> > -	'kms_frontbuffer_tracking',
> >  	'kms_getfb',
> >  	'kms_hdmi_inject',
> >  	'kms_hdr',
> > -	'kms_invalid_dotclock',
> >  	'kms_lease',
> > -	'kms_legacy_colorkey',
> >  	'kms_mmap_write_crc',
> >  	'kms_multipipe_modeset',
> >  	'kms_panel_fitting',
> > -	'kms_pipe_b_c_ivb',
> >  	'kms_pipe_crc_basic',
> >  	'kms_plane',
> >  	'kms_plane_alpha_blend',
> > @@ -62,9 +50,6 @@ test_progs =3D [
> >  	'kms_prime',
> >  	'kms_prop_blob',
> >  	'kms_properties',
> > -	'kms_psr',
> > -	'kms_psr2_su',
> > -	'kms_psr2_sf',
> >  	'kms_pwrite_crc',
> >  	'kms_rmfb',
> >  	'kms_rotation_crc',
> > @@ -235,6 +220,21 @@ i915_progs =3D [
> >  	'i915_query',
> >  	'i915_selftest',
> >  	'i915_suspend',
> > +	'kms_big_fb',
> > +	'kms_busy',
> > +	'kms_ccs',
> > +	'kms_cdclk',
> > +	'kms_draw_crc',
> > +	'kms_fence_pin_leak',
> > +	'kms_flip_scaled_crc',
> > +	'kms_flip_tiling',
> > +	'kms_frontbuffer_tracking',
> > +	'kms_invalid_dotclock',
> > +	'kms_legacy_colorkey',
> > +	'kms_pipe_b_c_ivb',
> > +	'kms_psr',
> > +	'kms_psr2_su',
> > +	'kms_psr2_sf',
> >  	'sysfs_clients',
> >  	'sysfs_defaults',
> >  	'sysfs_heartbeat_interval',
> > --
> > 2.32.0
> >
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.freede
> sktop.org%2Fmailman%2Flistinfo%2Figt-
> dev&amp;data=3D04%7C01%7CRodrigo.Siqueira%40amd.com%7Cd1a308d9ee3441dd2db=
508d953
> 2a9b5b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637632264727564399%7C=
Unkno
> wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6M
> n0%3D%7C1000&amp;sdata=3DyY%2BAdDWByyM3k4LOoLq58Qj6w%2BRm2QnxIwXwQDwDhew%=
3D&amp;
> reserved=3D0
>=20
> --
> Rodrigo Siqueira
> https://siqueira.tech
