Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C466E942
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jul 2020 08:57:21 +0000 (UTC)
Date: Fri, 24 Jul 2020 11:57:17 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200724085717.GZ20883@platvala-desk.ger.corp.intel.com>
References: <20200721214801.20517-1-bhanuprakash.modem@intel.com>
 <20200723225512.13492-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723225512.13492-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_dither: New IGT to validate
 crtc Dithering
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
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jul 24, 2020 at 04:25:12AM +0530, Bhanuprakash Modem wrote:
> Many of the display devices have color format support less than
> the color format of the input data (Ex: 8-bit input data and 6-bit
> display color depth). Then the input data will be either truncated
> or rounded, but this approach usually causes loss of detail and also
> produce large banded areas of a single color that significantly
> differs from the original image.
> =

> Dithering is a technique used to enhance these colors by creating the
> illusion of smoothness by adjusting the nearby pixel color.
> For Eg: Converting 8-bit to 6-bit by modifying the pixel information.
> =

> Dithering should be enabled when a panel color depth is lower than the
> color depth of the framebuffer.
> =

> Even though feature Dithering is there since legacy, there is no
> specific IGT for this. This patch will create New IGT for Dithering.
> And below is the truth table for CRTC Dithering.
> =

> |----------------|---------|-------------|
> |  Frame buffer  |  Panel  |  Dithering  |
> |----------------|---------|-------------|
> |      8 BPC     |  6 BPC  |     Yes     |
> |----------------|---------|-------------|
> |      8 BPC     |  8 BPC  |     No      |
> |----------------|---------|-------------|
> |      8 BPC     | 10 BPC  |     No      |
> |----------------|---------|-------------|
> |     10 BPC     |  6 BPC  |     Yes     |
> |----------------|---------|-------------|
> |     10 BPC     |  8 BPC  |     Yes     |
> |----------------|---------|-------------|
> |     10 BPC     | 10 BPC  |     No      |
> |----------------|---------|-------------|
> |     16 BPC     |  6 BPC  |     Yes     |
> |----------------|---------|-------------|
> |     16 BPC     |  8 BPC  |     Yes     |
> |----------------|---------|-------------|
> |     16 BPC     | 10 BPC  |     Yes     |
> |----------------|---------|-------------|
> =

> v2:
> * Fix commit message (Karthik)
> * Add file author (Karthik)
> * Dynamic subtests for pipe-output combinations (Karthik)
> * Update deprecated pipe name (Karthik)
> * Remove redundant fb creation logic (Karthik)
> =

> v3:
> * Use for_each_pipe_with_valid_output() to simplify the logic (Bhanu)
> * Remove magic numbers to create fb (Karthik)
> * Fix typos & comments (Swati)
> =

> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/Makefile.sources |   1 +
>  tests/kms_dither.c     | 256 +++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build      |   1 +
>  3 files changed, 258 insertions(+)
>  create mode 100644 tests/kms_dither.c
> =

> diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> index 0653c3d3..e816037c 100644
> --- a/tests/Makefile.sources
> +++ b/tests/Makefile.sources
> @@ -43,6 +43,7 @@ TESTS_progs =3D \
>  	kms_cursor_crc \
>  	kms_cursor_edge_walk \
>  	kms_cursor_legacy \
> +	kms_dither \
>  	kms_dp_aux_dev \
>  	kms_dp_dsc \
>  	kms_dp_tiled_display \
> diff --git a/tests/kms_dither.c b/tests/kms_dither.c
> new file mode 100644
> index 00000000..22d96d34
> --- /dev/null
> +++ b/tests/kms_dither.c
> @@ -0,0 +1,256 @@
> +/*
> + * Copyright =A9 2020 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors:
> + *     Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> + *
> + */
> +
> +#include "igt.h"
> +#include <fcntl.h>
> +#include <termios.h>
> +#include <unistd.h>
> +
> +IGT_TEST_DESCRIPTION("Test Dithering block status");
> +
> +/* Connector BPC */
> +#define IGT_CONNECTOR_BPC_6		6
> +#define IGT_CONNECTOR_BPC_8		8
> +#define IGT_CONNECTOR_BPC_10		10
> +#define IGT_CONNECTOR_BPC_12		12
> +
> +/* Framebuffer BPC */
> +#define IGT_FRAME_BUFFER_BPC_8		8
> +#define IGT_FRAME_BUFFER_BPC_10		10
> +#define IGT_FRAME_BUFFER_BPC_16		16
> +
> +/* Test flags. */
> +enum {
> +	TEST_NONE =3D 1 << 0,
> +	TEST_SUSPEND =3D 1 << 1,
> +};
> +
> +/* Common test data. */
> +typedef struct data {
> +	igt_display_t display;
> +	igt_plane_t *primary;
> +	igt_output_t *output;
> +	igt_pipe_t *pipe;
> +	drmModeModeInfo *mode;
> +	enum pipe pipe_id;
> +	int drm_fd;
> +	igt_fb_t fb;
> +} data_t;
> +
> +/* Prepare test data. */
> +static void prepare_test(data_t *data, igt_output_t *output, enum pipe p=
ipe)
> +{
> +	igt_display_t *display =3D &data->display;
> +
> +	data->pipe_id =3D pipe;
> +	data->pipe =3D &data->display.pipes[data->pipe_id];
> +	igt_assert(data->pipe);
> +
> +	igt_display_reset(display);
> +
> +	data->output =3D output;
> +	igt_assert(data->output);
> +
> +	data->mode =3D igt_output_get_mode(data->output);
> +	igt_assert(data->mode);
> +
> +	data->primary =3D
> +		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_output_set_pipe(data->output, data->pipe_id);
> +}
> +
> +/* Returns the current state of dithering from the crtc debugfs. */
> +static bool get_dither_state(data_t *data)
> +{
> +	char buf[256];
> +	char crtc_name[7];
> +	char *start_loc;
> +	int fd, res;
> +	unsigned int status;
> +
> +	snprintf(crtc_name, 7, "crtc-%d", data->pipe_id);
> +	fd =3D igt_debugfs_open(data->drm_fd, crtc_name, O_RDONLY);
> +	igt_assert(fd >=3D 0);
> +
> +	res =3D igt_debugfs_simple_read(fd, "dither", buf, sizeof(buf));
> +	igt_require(res > 0);
> +	close(fd);
> +
> +	igt_assert(start_loc =3D strstr(buf, "Dither: "));
> +	igt_assert_eq(sscanf(start_loc, "Dither: %u", &status), 1);
> +
> +	return !!status;
> +}
> +
> +/* Returns the maximum bpc from the connector debugfs. */
> +static unsigned int get_output_bpc(data_t *data, igt_output_t *output)
> +{
> +	char buf[256];
> +	char *start_loc;
> +	int fd, res;
> +	unsigned int max_bpc;
> +
> +	fd =3D igt_debugfs_connector_dir(data->drm_fd, output->name, O_RDONLY);
> +	igt_assert(fd >=3D 0);
> +
> +	res =3D igt_debugfs_simple_read(fd, "output_bpc", buf, sizeof(buf));
> +
> +	igt_require(res > 0);
> +
> +	close(fd);
> +
> +	igt_assert(start_loc =3D strstr(buf, "Maximum: "));
> +	igt_assert_eq(sscanf(start_loc, "Maximum: %u", &max_bpc), 1);
> +
> +	return max_bpc;
> +}
> +
> +static void test_dithering(data_t *data, enum pipe pipe,
> +			   igt_output_t *output,
> +			   int fb_bpc, int fb_format,
> +			   int output_bpc, uint32_t flags)
> +{
> +	igt_display_t *display =3D &data->display;
> +	bool enabled;
> +
> +	igt_info("Dithering test execution on %s PIPE_%s\n",
> +			output->name, kmstest_pipe_name(pipe));
> +	prepare_test(data, output, pipe);
> +
> +	igt_assert(igt_create_fb(data->drm_fd, data->mode->hdisplay,
> +				 data->mode->vdisplay, fb_format,
> +				 LOCAL_DRM_FORMAT_MOD_NONE, &data->fb));
> +	igt_plane_set_fb(data->primary, &data->fb);
> +	igt_plane_set_size(data->primary, data->mode->hdisplay, data->mode->vdi=
splay);
> +	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, output_b=
pc);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMI=
T_LEGACY);
> +
> +	/* Check the status of Dithering block
> +	 * If fb_bpc is greater than output_bpc, Dithering should be Enabled
> +	 * else Disabled
> +	 */
> +	enabled =3D get_dither_state(data);
> +	if (fb_bpc > output_bpc)
> +		igt_assert_f(enabled, "(fb_%dbpc > output_%dbpc): Dither should be ena=
bled\n",
> +				fb_bpc, output_bpc);
> +	else
> +		igt_assert_f(!enabled, "(fb_%dbpc <=3D output_%dbpc): Dither should be=
 disabled\n",
> +				fb_bpc, output_bpc);
> +
> +	igt_plane_set_fb(data->primary, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMI=
T_LEGACY);
> +
> +	igt_remove_fb(data->drm_fd, &data->fb);
> +
> +	return;
> +}
> +
> +/* Returns true if an output supports max bpc property. */
> +static bool has_max_bpc(igt_output_t *output)
> +{
> +        return igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC) &&
> +               igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
> +}
> +
> +static void
> +run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc,
> +		uint32_t flags)
> +{
> +	igt_output_t *output;
> +	igt_display_t *display =3D &data->display;
> +	enum pipe pipe;
> +	unsigned int max_bpc;
> +	int valid_outputs =3D 0;
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {
> +		if (!has_max_bpc(output))
> +			continue;
> +
> +		max_bpc =3D get_output_bpc(data, output);
> +		if(max_bpc < output_bpc)
> +			continue;
> +
> +		igt_dynamic_f("%s-on-pipe-%s", output->name, kmstest_pipe_name(pipe))
> +			if (igt_pipe_connector_valid(pipe, output))
> +				test_dithering(data, pipe, output, fb_bpc,
> +					       fb_format, output_bpc, flags);
> +
> +		valid_outputs++;
> +	}
> +
> +	igt_require_f(valid_outputs, "No connector found with MAX BPC connector=
 property. (or) "
> +				     "No connector found with Max Panel BPC (%d) >=3D %d.\n",
> +		      max_bpc, output_bpc);

You don't need to explicitly igt_require that valid outputs were
found. igt_subtest_with_dynamic automatically produces a skip if it
doesn't enter any igt_dynamic blocks.



-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
