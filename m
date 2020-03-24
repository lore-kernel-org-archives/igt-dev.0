Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEE86E50E
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2020 18:16:03 +0000 (UTC)
Date: Tue, 24 Mar 2020 20:15:59 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200324181559.GA13686@intel.com>
References: <20200117181418.18755-1-jose.souza@intel.com>
 <20200117181418.18755-2-jose.souza@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200117181418.18755-2-jose.souza@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests: Add tests for DP MST
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jan 17, 2020 at 10:14:18AM -0800, Jos=E9 Roberto de Souza wrote:
> Test DP MST corner cases.
> =

> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> ---
>  tests/Makefile.sources |   1 +
>  tests/kms_mst.c        | 347 +++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build      |   1 +
>  3 files changed, 349 insertions(+)
>  create mode 100644 tests/kms_mst.c
> =

> diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> index 806eb02d..68794ed3 100644
> --- a/tests/Makefile.sources
> +++ b/tests/Makefile.sources
> @@ -59,6 +59,7 @@ TESTS_progs =3D \
>  	kms_lease \
>  	kms_legacy_colorkey \
>  	kms_mmap_write_crc \
> +	kms_mst \
>  	kms_panel_fitting \
>  	kms_pipe_b_c_ivb \
>  	kms_pipe_crc_basic \
> diff --git a/tests/kms_mst.c b/tests/kms_mst.c
> new file mode 100644
> index 00000000..7cc01417
> --- /dev/null
> +++ b/tests/kms_mst.c
> @@ -0,0 +1,347 @@
> +#include <ctype.h>
> +#include <string.h>
> +
> +#include "igt.h"
> +
> +IGT_TEST_DESCRIPTION("Test DP MST corner cases.");
> +/*
> + * It is testing only the first MST port found, to test multiple ports o=
r force
> + * test in a specific port changes will be needed
> + */
> +
> +#define SQUARE_SIZE 100
> +#define MAX_MST_OUTPUTS 3
> +#define RESOLUTION_H 1920
> +#define RESOLUTION_V 1080
> +#define ANOTHER_RESOLUTION_H 1024
> +#define ANOTHER_RESOLUTION_V 768

There a quite a lot of assumptions in this test. In genral I get
the feeling this should be more of a general "test all the modeset
combinations" type of thing. It would then get run for all kinds of
other cases with similar behaviour (eg. port sync). =


In fact I wonder if something like kms_atomic_transitions doesn't
already hit these cases? I think that's pretty much what it's supposed
to do.


> +
> +typedef struct {
> +	int drm_fd;
> +	igt_display_t display;
> +	igt_output_t *mst_output[MAX_MST_OUTPUTS];
> +	struct igt_fb fb[MAX_MST_OUTPUTS];
> +	uint8_t mst_connectors, prepared;
> +} data_t;
> +
> +static drmModeModeInfo *find_mode(igt_output_t *output, uint16_t h, uint=
16_t v,
> +				  uint32_t *mode_clock)
> +{
> +	drmModeModeInfo *ret =3D NULL;
> +	int i;
> +
> +	for (i =3D 0; i < output->config.connector->count_modes; i++) {
> +		drmModeModeInfo *mode;
> +
> +		mode =3D &output->config.connector->modes[i];
> +		if (mode->hdisplay !=3D h ||
> +		    mode->vdisplay !=3D v)
> +			continue;
> +
> +		if (mode_clock && *mode_clock && mode->clock !=3D *mode_clock)
> +			continue;
> +
> +		if (mode_clock && !*mode_clock)
> +			*mode_clock =3D mode->clock;
> +
> +		ret =3D mode;
> +
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int16_t get_parent_conn_id(const char *mst_path)
> +{
> +	int i;
> +	char buffer[6];
> +
> +	if (mst_path[0] !=3D 'm' || mst_path[1] !=3D 's' || mst_path[2] !=3D 't=
' ||
> +	    mst_path[3] !=3D ':')
> +		return -1;
> +
> +	/* Unlikely to need more than 5 digits to represent a connector id */
> +	for (i =3D 4; i < 9; i++) {
> +		if (!isdigit(mst_path[i]))
> +			break;
> +	}
> +
> +	if (i =3D=3D 4)
> +		return -1;
> +
> +	i =3D i - 4;
> +	memcpy(buffer, &mst_path[4], i);
> +	buffer[i] =3D 0;
> +	return atoi(buffer);
> +}
> +
> +static void search_mst_outputs(data_t *data)
> +{
> +	igt_display_t *display =3D &data->display;
> +	igt_output_t *output;
> +	uint32_t clock =3D 0;
> +	int16_t parent_conn =3D -1;
> +
> +	for_each_connected_output(display, output) {
> +		drmModePropertyBlobPtr blob;
> +		char mst_path_buffer[32];
> +		drmModeModeInfo *mode;
> +		uint64_t val;
> +
> +		igt_output_set_pipe(output, PIPE_NONE);
> +
> +		if (data->mst_connectors =3D=3D MAX_MST_OUTPUTS)
> +			continue;
> +
> +		if (!igt_output_has_prop(output, IGT_CONNECTOR_PATH)) {
> +			igt_debug("\tno patch prop\n");
> +			continue;
> +		}
> +
> +		val =3D igt_output_get_prop(output, IGT_CONNECTOR_PATH);
> +		blob =3D drmModeGetPropertyBlob(data->drm_fd, val);
> +		strncpy(mst_path_buffer, (const char *)blob->data,
> +			sizeof(mst_path_buffer) - 1);
> +		drmModeFreePropertyBlob(blob);
> +
> +		if (parent_conn !=3D -1) {
> +			if (get_parent_conn_id(mst_path_buffer) !=3D parent_conn)
> +				continue;
> +		} else {
> +			parent_conn =3D get_parent_conn_id(mst_path_buffer);
> +			igt_info("MST parent connector %i\n", parent_conn);
> +		}
> +
> +		mode =3D find_mode(output, RESOLUTION_H, RESOLUTION_V, &clock);
> +		if (!mode) {
> +			igt_info("MST connector %s[%s] found but no compatible mode found\n",
> +				 output->name, mst_path_buffer);
> +			continue;
> +		}
> +
> +		igt_info("Added MST connector %s[%s]\n", output->name, mst_path_buffer=
);
> +
> +		igt_output_override_mode(output, mode);
> +		data->mst_output[data->mst_connectors] =3D output;
> +		data->mst_connectors++;
> +	}
> +
> +	igt_require_f(data->mst_connectors, "No MST connector found\n");
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +static void prepare(data_t *data, uint8_t n_outputs)
> +{
> +	igt_output_t *output;
> +	uint8_t i;
> +
> +	for (i =3D 0; i < data->mst_connectors && i < n_outputs; i++) {
> +		const drmModeModeInfo *mode;
> +		igt_plane_t *primary;
> +		double r, g, b;
> +		cairo_t *cr;
> +
> +		output =3D data->mst_output[i];
> +		mode =3D igt_output_get_mode(output);
> +
> +		igt_output_set_pipe(output, PIPE_A + i);
> +
> +		primary =3D igt_output_get_plane_type(output,
> +						    DRM_PLANE_TYPE_PRIMARY);
> +		igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> +				    DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
> +				    1.0, 1.0, 1.0, &data->fb[i]);
> +
> +		cr =3D igt_get_cairo_ctx(data->drm_fd, &data->fb[i]);
> +
> +		/* paint square in different color */
> +		switch (i % 4) {
> +		case 0:
> +			r =3D 1.0;
> +			g =3D b =3D 0.0;
> +			break;
> +		case 1:
> +			g =3D 1.0;
> +			r =3D b =3D 0.0;
> +			break;
> +		case 2:
> +			b =3D 1.0;
> +			r =3D g =3D 0.0;
> +			break;
> +		default:
> +		case 4:
> +			r =3D g =3D b =3D 0.0;
> +			break;
> +		}
> +		igt_paint_color_alpha(cr, 0, 0, SQUARE_SIZE, SQUARE_SIZE,
> +				      r, g, b, 1.0);
> +
> +		igt_plane_set_fb(primary, &data->fb[i]);
> +		igt_put_cairo_ctx(data->drm_fd,  &data->fb[i], cr);
> +	}
> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	data->prepared =3D n_outputs;
> +}
> +
> +static void change_resolution(data_t *data, bool all)
> +{
> +	igt_output_t *output;
> +	uint32_t clock =3D 0;
> +	uint8_t i;
> +
> +	for (i =3D 0; i < data->mst_connectors; i++) {
> +		drmModeModeInfo *mode;
> +
> +		output =3D data->mst_output[i];
> +		if (output->pending_pipe =3D=3D PIPE_NONE)
> +			continue;
> +
> +		mode =3D find_mode(output, ANOTHER_RESOLUTION_H,
> +				 ANOTHER_RESOLUTION_V, &clock);
> +		if (!mode) {
> +			igt_info("New resolution not found on %s skipping it\n",
> +				 output->name);
> +			igt_output_set_pipe(output, PIPE_NONE);
> +			continue;
> +		}
> +
> +		igt_output_override_mode(output, mode);
> +
> +		if (!all)
> +			break;
> +	}
> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +static void restore_resolution(data_t *data)
> +{
> +	igt_output_t *output;
> +	uint32_t clock =3D 0;
> +	uint8_t i;
> +
> +	for (i =3D 0; i < data->mst_connectors; i++) {
> +		drmModeModeInfo *mode;
> +
> +		output =3D data->mst_output[i];
> +		mode =3D find_mode(output, RESOLUTION_H, RESOLUTION_V, &clock);
> +		/*
> +		 * No need to check because this mode was already found in
> +		 * search_mst_outputs()
> +		 */
> +		igt_output_override_mode(output, mode);
> +		/* Reenable any sink left off in change_resolution() */
> +		igt_output_set_pipe(output, PIPE_A + i);
> +	}
> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +static void cleanup(data_t *data)
> +{
> +	uint8_t i;
> +
> +	for (i =3D 0; i < data->prepared; i++) {
> +		igt_output_t *output =3D data->mst_output[i];
> +		igt_plane_t *primary;
> +
> +		primary =3D igt_output_get_plane_type(output,
> +						    DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_set_fb(primary, NULL);
> +		igt_output_set_pipe(output, PIPE_NONE);
> +	}
> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	for (i =3D 0; i < data->prepared; i++)
> +		igt_remove_fb(data->drm_fd, &data->fb[i]);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	data_t data =3D {};
> +
> +	igt_subtest_init_parse_opts(&argc, argv, "", NULL,
> +				    NULL, NULL, NULL);
> +	igt_skip_on_simulation();
> +
> +	igt_fixture {
> +		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +		search_mst_outputs(&data);
> +	}
> +
> +	igt_describe("Enable all MST streams in the same port");
> +	igt_subtest_f("all_enabled") {
> +		prepare(&data, data.mst_connectors);
> +		igt_debug_manual_check("all", "all streams enabled");
> +		cleanup(&data);
> +	}
> +
> +	igt_describe("Test change the master CRTC of the MST stream");
> +	igt_subtest_f("change_master") {
> +		enum pipe pipe;
> +
> +		igt_require(data.mst_connectors >=3D 2);
> +
> +		prepare(&data, 2);
> +		igt_debug_manual_check("all", "dual output");
> +
> +		pipe =3D data.mst_output[0]->pending_pipe;
> +		igt_output_set_pipe(data.mst_output[0], PIPE_NONE);
> +		igt_display_commit2(&data.display, COMMIT_ATOMIC);
> +		igt_debug_manual_check("all", "first MST stream disabled");
> +
> +		igt_output_set_pipe(data.mst_output[0], pipe);
> +		igt_display_commit2(&data.display, COMMIT_ATOMIC);
> +		igt_debug_manual_check("all", "dual output");
> +
> +		pipe =3D data.mst_output[1]->pending_pipe;
> +		igt_output_set_pipe(data.mst_output[1], PIPE_NONE);
> +		igt_display_commit2(&data.display, COMMIT_ATOMIC);
> +		igt_debug_manual_check("all", "second MST stream disabled");
> +
> +		igt_output_set_pipe(data.mst_output[1], pipe);
> +		igt_display_commit2(&data.display, COMMIT_ATOMIC);
> +		igt_debug_manual_check("all", "dual output");
> +
> +		cleanup(&data);
> +	}
> +
> +	igt_describe("Test change the resolution off all MST streams");
> +	igt_subtest_f("change_resolution") {
> +		prepare(&data, data.mst_connectors);
> +		igt_debug_manual_check("all", "regular resolution in all streams");
> +
> +		change_resolution(&data, true);
> +		igt_debug_manual_check("all", "new resolution set in compatible stream=
s");
> +
> +		restore_resolution(&data);
> +		igt_debug_manual_check("all", "regular resolution in all streams again=
");
> +		cleanup(&data);
> +	}
> +
> +	igt_describe("Test do a fullmodeset in the master CRTC of the MST strea=
m");
> +	igt_subtest_f("fullmodeset_master") {
> +		prepare(&data, data.mst_connectors);
> +		igt_debug_manual_check("all", "regular resolution in all streams");
> +
> +		change_resolution(&data, false);
> +		igt_debug_manual_check("all", "new resolution in the first stream");
> +
> +		restore_resolution(&data);
> +		igt_debug_manual_check("all", "regular resolution in all streams again=
");
> +		cleanup(&data);
> +	}
> +
> +	igt_fixture {
> +		igt_display_reset(&data.display);
> +		igt_display_fini(&data.display);
> +	}
> +
> +	igt_exit();
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index a79d22ba..a552301b 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -43,6 +43,7 @@ test_progs =3D [
>  	'kms_lease',
>  	'kms_legacy_colorkey',
>  	'kms_mmap_write_crc',
> +	'kms_mst',
>  	'kms_panel_fitting',
>  	'kms_pipe_b_c_ivb',
>  	'kms_pipe_crc_basic',
> -- =

> 2.25.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
