Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9517A6E223
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Sep 2020 07:55:21 +0000 (UTC)
Date: Tue, 15 Sep 2020 10:46:34 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200915074634.GW7444@platvala-desk.ger.corp.intel.com>
References: <20200904005439.17146-1-abhinavk@codeaurora.org>
 <20200904005439.17146-6-abhinavk@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904005439.17146-6-abhinavk@codeaurora.org>
Subject: Re: [igt-dev] [PATCH i-g-t 5/5] tools: add support for
 msm_dp_compliance to IGT
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
To: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: khsieh@codeaurora.org, tanmay@codeaurora.org, swboyd@chromium.org, igt-dev@lists.freedesktop.org, nganji@codeaurora.org, seanpaul@chromium.org, aravindh@codeaurora.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 03, 2020 at 05:54:39PM -0700, Abhinav Kumar wrote:
> Add support for msm_dp_compliance to igt tools to validate
> video pattern DP compliance tests on MSM chipsets.
> =

> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  tools/Makefile.am         |   4 +
>  tools/Makefile.sources    |   6 +
>  tools/meson.build         |  12 +
>  tools/msm_dp_compliance.c | 812 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 834 insertions(+)
>  create mode 100644 tools/msm_dp_compliance.c
> =

> diff --git a/tools/Makefile.am b/tools/Makefile.am
> index f97f9e08..eac52be8 100644
> --- a/tools/Makefile.am
> +++ b/tools/Makefile.am
> @@ -14,6 +14,10 @@ intel_dp_compliance_LDADD =3D $(top_builddir)/lib/libi=
ntel_tools.la
>  bin_PROGRAMS +=3D amd_hdmi_compliance
>  amd_hdmi_compliance_CFLAGS =3D $(AM_CFLAGS) $(GLIB_CFLAGS)
>  =

> +bin_PROGRAMS +=3D msm_dp_compliance
> +msm_dp_compliance_CFLAGS =3D $(AM_CFLAGS) $(GLIB_CFLAGS)
> +msm_dp_compliance_LDADD =3D $(top_builddir)/lib/libintel_tools.la
> +
>  SUBDIRS =3D i915-perf null_state_gen registers
>  =

>  AM_CPPFLAGS =3D -I$(top_srcdir) -I$(top_srcdir)/include/drm-uapi -I$(top=
_srcdir)/lib \
> diff --git a/tools/Makefile.sources b/tools/Makefile.sources
> index 47171490..c93bfe7d 100644
> --- a/tools/Makefile.sources
> +++ b/tools/Makefile.sources
> @@ -72,3 +72,9 @@ amd_hdmi_compliance_SOURCES =3D \
>          amd_hdmi_compliance.c \
>  		$(NULL)
>  =

> +msm_dp_compliance_SOURCES =3D \
> +        msm_dp_compliance.c \
> +		igt_dp_compliance.h \
> +		igt_dp_compliance_hotplug.c \
> +		igt_compliance_utils.c \
> +		$(NULL)
> diff --git a/tools/meson.build b/tools/meson.build
> index 56877fb3..65f78938 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -101,5 +101,17 @@ executable('amd_hdmi_compliance', 'amd_hdmi_complian=
ce.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  =

> +if libudev.found()
> +		msm_dp_compliance_src =3D [
> +		'msm_dp_compliance.c',
> +		'igt_dp_compliance_hotplug.c',
> +		'igt_compliance_utils.c'
> +	]

Check indentation here for the msm_dp_compliance_src =3D [ line.

Otherwise looks good,
Acked-by: Petri Latvala <petri.latvala@intel.com>

For future changes that affect this tool, do you want to be the main
contact person to ask for acks/tests/opinions?


-- =

Petri Latvala



> +	executable('msm_dp_compliance', sources : msm_dp_compliance_src,
> +			dependencies : [tool_deps, libudev],
> +			install_rpath : bindir_rpathdir,
> +			install : true)
> +endif
> +
>  subdir('i915-perf')
>  subdir('null_state_gen')
> diff --git a/tools/msm_dp_compliance.c b/tools/msm_dp_compliance.c
> new file mode 100644
> index 00000000..7bc2bfa8
> --- /dev/null
> +++ b/tools/msm_dp_compliance.c
> @@ -0,0 +1,812 @@
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + * Copyright =A9 2017 Intel Corporation
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
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + *
> + * Displayport Compliance Testing Application
> + *
> + * This is the userspace component of the Displayport Compliance testing
> + * software required for compliance testing of the MSM Display Port driv=
er.
> + * This must be running in order to successfully complete Display Port
> + * compliance testing. This app and the kernel code that accompanies it =
has been
> + * written to satify the requirements of the Displayport Link CTS 1.2 re=
v1.1
> + * specification from VESA. Note that this application does not support =
eDP
> + * compliance testing.
> + *
> + * Compliance Testing requires several components:
> + *   - A kernel build that contains the patch set for DP compliance supp=
ort
> + *   - A Displayport Compliance Testing appliance such as Qdbox 980
> + *   - This user application
> + *   - A windows host machine to run the Qdbox 980 test software
> + *   - Root access on the DUT due to the use of sysfs utility
> + *
> + * Test Setup:
> + * It is strongly recommended that the windows host, test appliance and =
DUT
> + * be freshly restarted before any testing begins to ensure that any pre=
vious
> + * configurations and settings will not interfere with test process. Ref=
er to
> + * the test appliance documentation for setup, software installation and
> + * operation specific to that device.
> + *
> + * The Linux DUT must be in text (console) mode and cannot have any other
> + * display manager running. You must be logged in as root to run this us=
er app.
> + * Once the user application is up and running, waiting for test request=
s, the
> + * software on the windows host can now be used to execute the complianc=
e tests.
> + *
> + * This userspace application supports following tests from the DP CTS S=
pec
> + * Rev 1.1:
> + *   - Video Pattern generation tests: This supports only the 24 and
> + *     18bpp color
> + *     ramp test pattern (4.3.3.1).
> + *
> + * Connections (required):
> + *   - Test Appliance connected to the external Displayport connector on=
 the DUT
> + *   - Test Appliance Monitor Out connected to Displayport connector on =
the
> + * monitor
> + *   - Test appliance connected to the Windows Host via USB
> + *
> + * Debugfs Files:
> + * The file root for all  the debugfs file:
> + * /sys/kernel/debug/dri/0/
> + *
> + * The specific files are as follows:
> + *
> + * msm_dp_test_active
> + * A simple flag that indicates whether or not compliance testing is cur=
rently
> + * active in the kernel. This flag is polled by userspace and once set, =
invokes
> + * the test handler in the user app. This flag is set by the test handle=
r in the
> + * kernel after reading the registers requested by the test appliance.
> + *
> + * msm_dp_test_data
> + * Test data is used by the kernel to pass parameters to the user app. E=
g: In
> + * case of EDID tests, the data that is delivered to the userspace is th=
e video
> + * mode to be set for the test.
> + * In case of video pattern test, the data that is delivered to the user=
space is
> + * the width and height of the test pattern and the bits per color value.
> + *
> + * msm_dp_test_type
> + * The test type variable instructs the user app as to what the requeste=
d test
> + * was from the sink device. These values defined at the top of the
> + * application's main implementation file must be kept in sync with the
> + * values defined in the kernel's drm_dp_helper.h file.
> + * This app is based on some prior work submitted in April 2015 by Todd =
Previte
> + * (<tprevite@gmail.com>).
> + *
> + * This work is based upon the intel_dp_compliance.c authored by
> + * Manasi Navare <manasi.d.navare@intel.com>
> + *
> + *
> + * This tool can be run as:
> + * ./msm_dp_compliance  It will wait till you start compliance suite from
> + * Qdbox 980.
> + * ./msm_dp_compliance -h  This will open the help
> + * ./msm_dp_compliance -i  This will provide information about current
> + * connectors/CRTCs. This can be used for debugging purpose.
> + *
> + * Authors:
> + *    Abhinav Kumar <abhinavk@codeaurora.org>
> + *
> + * Elements of the modeset code adapted from David Herrmann's
> + * DRM modeset example
> + *
> + */
> +#include "igt.h"
> +#include <errno.h>
> +#include <getopt.h>
> +#include <math.h>
> +#include <stdint.h>
> +#include <stdbool.h>
> +#include <strings.h>
> +#include <unistd.h>
> +#include <termios.h>
> +#include <sys/poll.h>
> +#include <sys/time.h>
> +#include <sys/ioctl.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <sys/select.h>
> +#include <assert.h>
> +#include <signal.h>
> +#include <fcntl.h>
> +#include <time.h>
> +
> +#include "igt_dp_compliance.h"
> +
> +#include <stdlib.h>
> +#include <signal.h>
> +
> +/* User Input definitions */
> +#define HELP_DESCRIPTION 1
> +
> +/* Debugfs file definitions */
> +#define MSM_DP_TEST_TYPE_FILE		"msm_dp_test_type"
> +#define MSM_DP_TEST_ACTIVE_FILE	"msm_dp_test_active"
> +#define MSM_DP_TEST_DATA_FILE		"msm_dp_test_data"
> +
> +/* DRM definitions - must be kept in sync with the DRM header */
> +#define DP_TEST_LINK_VIDEO_PATTERN	(1 << 1)
> +
> +/* Global file pointers for the sysfs files */
> +FILE *test_active_fp, *test_data_fp, *test_type_fp;
> +
> +bool video_pattern_flag;
> +
> +/* Video pattern test globals */
> +uint16_t hdisplay;
> +uint16_t vdisplay;
> +uint8_t bitdepth;
> +
> +drmModeRes *resources;
> +int drm_fd, modes, gen;
> +uint64_t tiling =3D LOCAL_DRM_FORMAT_MOD_NONE;
> +uint32_t depth =3D 24, stride, bpp;
> +int specified_mode_num =3D -1, specified_disp_id =3D -1;
> +int width, height;
> +uint32_t test_crtc;
> +uint32_t active_crtc;
> +uint32_t test_connector_id;
> +enum {
> +	MSM_MODE_INVALID =3D -1,
> +	MSM_MODE_NONE =3D 0,
> +	MSM_MODE_VIDEO_PATTERN_TEST
> +} msm_display_mode;
> +
> +struct test_video_pattern {
> +	uint16_t hdisplay;
> +	uint16_t vdisplay;
> +	uint8_t bitdepth;
> +	uint32_t fb;
> +	uint32_t size;
> +	struct igt_fb fb_pattern;
> +	drmModeModeInfo mode;
> +	uint32_t *pixmap;
> +};
> +
> +struct connector {
> +	uint32_t id;
> +	int mode_valid;
> +	drmModeModeInfo mode, mode_failsafe;
> +	drmModeConnector *connector;
> +	int crtc;
> +	/* Standard and preferred frame buffer*/
> +	uint8_t *pixmap;
> +
> +	struct test_video_pattern test_pattern;
> +};
> +
> +static void clear_test_active(void)
> +{
> +	rewind(test_active_fp);
> +	fprintf(test_active_fp, "%d", 0);
> +	fflush(test_active_fp);
> +}
> +
> +static FILE *fopenat(int dir, const char *name, const char *mode)
> +{
> +	int fd =3D openat(dir, name, O_RDWR);
> +
> +	return fdopen(fd, mode);
> +}
> +
> +static void setup_debugfs_files(void)
> +{
> +	int dir =3D igt_debugfs_dir(drm_fd);
> +
> +	test_type_fp =3D fopenat(dir, MSM_DP_TEST_TYPE_FILE, "r");
> +	igt_require(test_type_fp);
> +
> +	test_data_fp =3D fopenat(dir, MSM_DP_TEST_DATA_FILE, "r");
> +	igt_require(test_data_fp);
> +	test_active_fp =3D fopenat(dir, MSM_DP_TEST_ACTIVE_FILE, "w+");
> +
> +	igt_require(test_active_fp);
> +
> +	close(dir);
> +
> +	/* Reset the active flag for safety */
> +	clear_test_active();
> +}
> +
> +static unsigned long get_test_type(void)
> +{
> +	unsigned long test_type;
> +	int ret;
> +
> +	if (!test_type_fp)
> +		fprintf(stderr, "Invalid test_type file\n");
> +	rewind(test_type_fp);
> +	ret =3D fscanf(test_type_fp, "%lx", &test_type);
> +	if (ret < 1 || test_type <=3D 0) {
> +		igt_warn("test_type read failed - %lx\n", test_type);
> +		return 0;
> +	}
> +
> +	return test_type;
> +}
> +
> +static void get_test_videopattern_data(void)
> +{
> +	int count =3D 0;
> +	uint16_t video_pattern_value[3];
> +	char video_pattern_attribute[15];
> +	int ret;
> +
> +	if (!test_data_fp)
> +		fprintf(stderr, "Invalid test_data file\n");
> +
> +	rewind(test_data_fp);
> +	while (!feof(test_data_fp) && count < 3) {
> +		ret =3D fscanf(test_data_fp, "%s %u\n", video_pattern_attribute,
> +		       (unsigned int *)&video_pattern_value[count++]);
> +		if (ret < 2) {
> +			igt_warn("test_data read failed\n");
> +			return;
> +		}
> +	}
> +
> +	hdisplay =3D video_pattern_value[0];
> +	vdisplay =3D video_pattern_value[1];
> +	bitdepth =3D video_pattern_value[2];
> +	igt_info("Hdisplay =3D %d\n", hdisplay);
> +	igt_info("Vdisplay =3D %d\n", vdisplay);
> +	igt_info("BitDepth =3D %u\n", bitdepth);
> +
> +}
> +
> +static int process_test_request(int test_type)
> +{
> +	int mode;
> +	bool valid =3D false;
> +
> +	switch (test_type) {
> +	case DP_TEST_LINK_VIDEO_PATTERN:
> +		video_pattern_flag =3D true;
> +		get_test_videopattern_data();
> +		mode =3D MSM_MODE_VIDEO_PATTERN_TEST;
> +		valid =3D true;
> +		break;
> +	default:
> +		/* Unknown test type */
> +		fprintf(stderr, "Invalid test request, ignored.\n");
> +		break;
> +	}
> +
> +	if (valid)
> +		return update_display(mode, true);
> +
> +	return -1;
> +}
> +
> +static void dump_info(void)
> +{
> +	igt_dump_connectors_fd(drm_fd);
> +	igt_dump_crtcs_fd(drm_fd);
> +}
> +
> +static int setup_video_pattern_framebuffer(struct connector *dp_conn)
> +{
> +	uint32_t  video_width, video_height;
> +
> +	video_width =3D dp_conn->test_pattern.hdisplay;
> +	video_height =3D dp_conn->test_pattern.vdisplay;
> +
> +	dp_conn->test_pattern.fb =3D igt_create_fb(drm_fd,
> +			video_width, video_height,
> +			DRM_FORMAT_XRGB8888,
> +			LOCAL_DRM_FORMAT_MOD_NONE,
> +			&dp_conn->test_pattern.fb_pattern);
> +	igt_assert(dp_conn->test_pattern.fb);
> +
> +
> +	dp_conn->test_pattern.pixmap =3D kmstest_dumb_map_buffer(drm_fd,
> +			dp_conn->test_pattern.fb_pattern.gem_handle,
> +			dp_conn->test_pattern.fb_pattern.size,
> +			PROT_READ | PROT_WRITE);
> +
> +	if (dp_conn->test_pattern.pixmap =3D=3D NULL)
> +		return -1;
> +
> +	dp_conn->test_pattern.size =3D dp_conn->test_pattern.fb_pattern.size;
> +	memset(dp_conn->test_pattern.pixmap, 0, dp_conn->test_pattern.size);
> +	return 0;
> +
> +}
> +
> +static int set_test_mode(struct connector *dp_conn)
> +{
> +	int ret =3D 0;
> +	int i;
> +	drmModeConnector *c =3D dp_conn->connector;
> +
> +	/* Ignore any disconnected devices */
> +	if (c->connection !=3D DRM_MODE_CONNECTED) {
> +		igt_warn("Connector %u disconnected\n", c->connector_id);
> +		return -ENOENT;
> +	}
> +	igt_info("Connector setup:\n");
> +
> +	/*
> +	 * to-do: for cases where driver doesn't support 4K but
> +	 * its the preferred mode of the sink, use 640x480 as
> +	 * default resolution
> +	 */
> +
> +	for (i =3D 0; i < c->count_modes; i++) {
> +		if (c->modes[i].hdisplay =3D=3D 640 &&
> +			c->modes[i].vdisplay =3D=3D 480 &&
> +			c->modes[i].vrefresh =3D=3D 60) {
> +			igt_info("found idx of failsafe mode =3D %d\n", i);
> +			break;
> +		}
> +	}
> +
> +	if (i =3D=3D c->count_modes) {
> +		igt_info("didn't find failsafe using default\n");
> +		i =3D 0;
> +	}
> +
> +	dp_conn->test_pattern.mode =3D c->modes[i];
> +	dp_conn->test_pattern.mode.hdisplay =3D c->modes[i].hdisplay;
> +	dp_conn->test_pattern.mode.vdisplay =3D c->modes[i].vdisplay;
> +
> +	igt_info("failsafe (mode %d) for connector %u is %ux%u\n", i,
> +		 dp_conn->id, c->modes[i].hdisplay, c->modes[i].vdisplay);
> +	fflush(stdin);
> +
> +	if (video_pattern_flag) {
> +		dp_conn->test_pattern.hdisplay =3D hdisplay;
> +		dp_conn->test_pattern.vdisplay =3D vdisplay;
> +		dp_conn->test_pattern.bitdepth =3D bitdepth;
> +
> +		ret =3D setup_video_pattern_framebuffer(dp_conn);
> +		if (ret) {
> +			igt_warn("Creating framebuffer for connector %u failed (%d)\n",
> +				 c->connector_id, ret);
> +			return ret;
> +		}
> +
> +		ret =3D igt_fill_cts_framebuffer(dp_conn->test_pattern.pixmap,
> +				dp_conn->test_pattern.hdisplay,
> +				dp_conn->test_pattern.vdisplay,
> +				dp_conn->test_pattern.bitdepth,
> +				0);
> +		if (ret) {
> +			igt_warn("Filling framebuffer for connector %u failed (%d)\n",
> +				 c->connector_id, ret);
> +			return ret;
> +		}
> +		/* unmapping the buffer previously mapped during setup */
> +		munmap(dp_conn->test_pattern.pixmap,
> +				dp_conn->test_pattern.size);
> +	}
> +
> +	return ret;
> +}
> +
> +static int set_video(int mode, struct connector *test_connector)
> +{
> +	drmModeModeInfo *requested_mode;
> +	uint32_t required_fb_id;
> +	struct igt_fb required_fb;
> +	int ret =3D 0;
> +
> +	switch (mode) {
> +	case MSM_MODE_NONE:
> +		igt_info("NONE\n");
> +		ret =3D drmModeSetCrtc(drm_fd, test_connector->crtc,
> +				     -1, 0, 0, NULL, 0, NULL);
> +		goto out;
> +	case MSM_MODE_VIDEO_PATTERN_TEST:
> +		igt_info("VIDEO PATTERN TEST\n");
> +		requested_mode =3D &test_connector->test_pattern.mode;
> +		required_fb_id =3D test_connector->test_pattern.fb;
> +		required_fb =3D test_connector->test_pattern.fb_pattern;
> +		break;
> +	case MSM_MODE_INVALID:
> +	default:
> +		igt_warn("INVALID! (%08x) Mode set aborted!\n", mode);
> +		return -1;
> +	}
> +
> +	igt_info("CRTC(%u):", test_connector->crtc);
> +	kmstest_dump_mode(requested_mode);
> +	ret =3D drmModeSetCrtc(drm_fd, test_connector->crtc, required_fb_id, 0,=
 0,
> +			     &test_connector->id, 1, requested_mode);
> +	if (ret) {
> +		igt_warn("Failed to set mode (%dx%d@%dHz): %s\n",
> +			 requested_mode->hdisplay, requested_mode->vdisplay,
> +			 requested_mode->vrefresh, strerror(errno));
> +		igt_remove_fb(drm_fd, &required_fb);
> +
> +	}
> +	/* Keep the pattern for 1 sec for Qdbox 980 to detect it */
> +	sleep(1);
> +
> +out:
> +	if (ret) {
> +		igt_warn("Failed to set CRTC for connector %u\n",
> +			 test_connector->id);
> +	}
> +
> +	return ret;
> +}
> +
> +static int
> +set_default_mode(struct connector *c, bool set_mode)
> +{
> +	unsigned int fb_id =3D 0;
> +	struct igt_fb fb_info;
> +	int ret =3D 0;
> +	int i;
> +	drmModeConnector *conn =3D c->connector;
> +
> +	if (!set_mode) {
> +		igt_info("not resetting the mode\n");
> +		ret =3D drmModeSetCrtc(drm_fd, c->crtc, 0, 0, 0,
> +				     NULL, 0, NULL);
> +		if (ret)
> +			igt_warn("Failed to unset mode");
> +		return ret;
> +	}
> +
> +	for (i =3D 0; i < conn->count_modes; i++) {
> +		if (conn->modes[i].hdisplay =3D=3D 640 &&
> +			conn->modes[i].vdisplay =3D=3D 480 &&
> +			conn->modes[i].vrefresh =3D=3D 60) {
> +			igt_info("found idx of failsafe mode =3D %d\n", i);
> +			break;
> +		}
> +	}
> +
> +	if (i =3D=3D conn->count_modes) {
> +		igt_info("didn't find failsafe using default\n");
> +		i =3D 0;
> +	}
> +
> +	c->mode =3D c->connector->modes[i];
> +
> +	width =3D c->mode.hdisplay;
> +	height =3D c->mode.vdisplay;
> +
> +	fb_id =3D igt_create_pattern_fb(drm_fd, width, height,
> +				      DRM_FORMAT_XRGB8888,
> +				      tiling, &fb_info);
> +
> +	kmstest_dump_mode(&c->mode);
> +	drmModeSetCrtc(drm_fd, c->crtc, -1, 0, 0, NULL, 0, NULL);
> +	ret =3D drmModeSetCrtc(drm_fd, c->crtc, fb_id, 0, 0,
> +			     &c->id, 1, &c->mode);
> +	if (ret) {
> +		igt_warn("Failed to set mode (%dx%d@%dHz): %s\n",
> +			 width, height, c->mode.vrefresh, strerror(errno));
> +		igt_remove_fb(drm_fd, &fb_info);
> +
> +	}
> +
> +	return ret;
> +}
> +
> +static uint32_t find_crtc_for_connector(drmModeConnector *c)
> +{
> +	drmModeEncoder *e;
> +	drmModeCrtcPtr crtc_ptr;
> +	int i;
> +
> +	active_crtc =3D 0;
> +
> +	for (i =3D 0; i < c->count_encoders; i++) {
> +		e =3D drmModeGetEncoder(drm_fd, c->encoders[i]);
> +
> +		 /* if there is an active crtc use it */
> +		if (e->crtc_id) {
> +			active_crtc =3D e->crtc_id;
> +			drmModeFreeEncoder(e);
> +			break;
> +		}
> +		drmModeFreeEncoder(e);
> +	}
> +
> +	/* no need to search further if active crtc is found */
> +	if (active_crtc)
> +		return active_crtc;
> +
> +	/*
> +	 * if there is no active crtc find one from the list of
> +	 * unused ones. Cannot use anything from possible_crtc of
> +	 * of encoder because it then tries to steal the crtc of the
> +	 * primary display. DPU driver does not support switching CRTCs
> +	 * across displays in the same commit. Hence need to find some
> +	 * other unused crtc.
> +	 */
> +	for (i =3D 0; i < resources->count_crtcs; i++) {
> +		crtc_ptr =3D drmModeGetCrtc(drm_fd, resources->crtcs[i]);
> +		/* if a crtc which is unused is found , use it */
> +		if (!crtc_ptr->mode_valid) {
> +			active_crtc =3D crtc_ptr->crtc_id;
> +			drmModeFreeCrtc(crtc_ptr);
> +			break;
> +		}
> +		drmModeFreeCrtc(crtc_ptr);
> +	}
> +
> +	return active_crtc;
> +}
> +
> +/*
> + * Re-probe connectors and do a modeset based on test request or
> + * in case of a hotplug uevent.
> + *
> + * @mode: Video mode requested by the test
> + * @is_compliance_test: 1: If it is a compliance test
> + *                      0: If it is a hotplug event
> + *
> + * Returns:
> + * 0: On Success
> + * -1: On failure
> + */
> +int update_display(int mode, bool is_compliance_test)
> +{
> +	struct connector *connectors, *conn;
> +	int cnt, ret =3D 0;
> +	bool set_mode;
> +	//int crtc;
> +
> +	resources =3D drmModeGetResources(drm_fd);
> +	if (!resources) {
> +		igt_warn("drmModeGetResources failed: %s\n", strerror(errno));
> +		return -1;
> +	}
> +
> +	connectors =3D calloc(resources->count_connectors,
> +			    sizeof(struct connector));
> +	if (!connectors)
> +		return -1;
> +
> +	/* Find any connected displays */
> +	for (cnt =3D 0; cnt < resources->count_connectors; cnt++) {
> +		drmModeConnector *c;
> +
> +		conn =3D &connectors[cnt];
> +		conn->id =3D resources->connectors[cnt];
> +		c =3D drmModeGetConnector(drm_fd, conn->id);
> +		if (c->connector_type =3D=3D DRM_MODE_CONNECTOR_DisplayPort &&
> +			c->connection =3D=3D DRM_MODE_CONNECTED) {
> +			test_connector_id =3D c->connector_id;
> +			conn->connector =3D c;
> +			conn->crtc =3D find_crtc_for_connector(c);
> +			test_crtc =3D conn->crtc;
> +			set_mode =3D true;
> +			break;
> +		} else if (c->connector_id =3D=3D test_connector_id &&
> +			   c->connection =3D=3D DRM_MODE_DISCONNECTED) {
> +			conn->connector =3D c;
> +			conn->crtc =3D test_crtc;
> +			set_mode =3D false;
> +			break;
> +		}
> +	}
> +
> +	if (cnt =3D=3D resources->count_connectors) {
> +		ret =3D -1;
> +		goto err;
> +	}
> +
> +	if (is_compliance_test) {
> +		set_test_mode(conn);
> +		ret =3D set_video(MSM_MODE_NONE, conn);
> +		ret =3D set_video(mode, conn);
> +
> +	} else
> +		ret =3D set_default_mode(conn, set_mode);
> +
> + err:
> +	drmModeFreeConnector(conn->connector);
> +	/* Error condition if no connected displays */
> +	free(connectors);
> +	drmModeFreeResources(resources);
> +	return ret;
> +}
> +
> +static const char optstr[] =3D "hi";
> +
> +static void __attribute__((noreturn)) usage(char *name, char opt)
> +{
> +	igt_info("usage: %s [-hi]\n", name);
> +	igt_info("\t-i\tdump info\n");
> +	igt_info("\tDefault is to respond to Qd980 tests\n");
> +	exit((opt !=3D 'h') ? -1 : 0);
> +}
> +
> +static void cleanup_debugfs(void)
> +{
> +	fclose(test_active_fp);
> +	fclose(test_data_fp);
> +	fclose(test_type_fp);
> +}
> +
> +static void __attribute__((noreturn)) cleanup_and_exit(int ret)
> +{
> +	cleanup_debugfs();
> +	close(drm_fd);
> +	igt_info("Compliance testing application exiting\n");
> +	exit(ret);
> +}
> +
> +static void cleanup_test(void)
> +{
> +	video_pattern_flag =3D false;
> +	hdisplay =3D 0;
> +	vdisplay =3D 0;
> +	bitdepth =3D 0;
> +}
> +
> +static void read_test_request(void)
> +{
> +	unsigned long test_type;
> +
> +	test_type =3D get_test_type();
> +
> +	process_test_request(test_type);
> +	cleanup_test();
> +	clear_test_active();
> +}
> +
> +static gboolean test_handler(GIOChannel *source, GIOCondition condition,
> +			     gpointer data)
> +{
> +	unsigned long test_active;
> +	int ret;
> +
> +	rewind(test_active_fp);
> +
> +	ret =3D fscanf(test_active_fp, "%lx", &test_active);
> +	if (ret < 1)
> +		return FALSE;
> +
> +	if (test_active)
> +		read_test_request();
> +
> +	return TRUE;
> +}
> +
> +static gboolean input_event(GIOChannel *source, GIOCondition condition,
> +				gpointer data)
> +{
> +	gchar buf[2];
> +	gsize count;
> +
> +	count =3D read(g_io_channel_unix_get_fd(source), buf, sizeof(buf));
> +	if (buf[0] =3D=3D 'q' && (count =3D=3D 1 || buf[1] =3D=3D '\n'))
> +		cleanup_and_exit(0);
> +
> +	return TRUE;
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	int c;
> +	int ret =3D 0;
> +	GIOChannel *stdinchannel, *testactive_channel;
> +	GMainLoop *mainloop;
> +	bool opt_dump_info =3D false;
> +	struct option long_opts[] =3D {
> +		{"help-description", 0, 0, HELP_DESCRIPTION},
> +		{"help", 0, 0, 'h'},
> +	};
> +
> +	enter_exec_path(argv);
> +
> +	while ((c =3D getopt_long(argc, argv, optstr, long_opts, NULL)) !=3D -1=
) {
> +		switch (c) {
> +		case 'i':
> +			opt_dump_info =3D true;
> +			break;
> +		case HELP_DESCRIPTION:
> +			igt_info("DP Compliance Test Suite using Qd 980\n");
> +			igt_info("Video Pattern Generation tests\n");
> +			exit(0);
> +			break;
> +		default:
> +			/* fall through */
> +		case 'h':
> +			usage(argv[0], c);
> +			break;
> +		}
> +	}
> +
> +	set_termio_mode();
> +
> +	drm_fd =3D drm_open_driver(DRIVER_ANY);
> +
> +	kmstest_set_vt_graphics_mode();
> +	setup_debugfs_files();
> +	cleanup_test();
> +	if (opt_dump_info) {
> +		dump_info();
> +		goto out_close;
> +	}
> +
> +	/* Get the DP connector ID and CRTC */
> +	if (update_display(0, false)) {
> +		igt_warn("Failed to set default mode\n");
> +		ret =3D -1;
> +		goto out_close;
> +	}
> +
> +	mainloop =3D g_main_loop_new(NULL, FALSE);
> +	if (!mainloop) {
> +		igt_warn("Failed to create GMainLoop\n");
> +		ret =3D -1;
> +		goto out_close;
> +	}
> +
> +	if (!igt_dp_compliance_setup_hotplug()) {
> +		igt_warn("Failed to initialize hotplug support\n");
> +		goto out_mainloop;
> +	}
> +
> +	testactive_channel =3D g_io_channel_unix_new(fileno(test_active_fp));
> +	if (!testactive_channel) {
> +		igt_warn("Failed to create test_active GIOChannel\n");
> +		goto out_close;
> +	}
> +
> +	ret =3D g_io_add_watch(testactive_channel, G_IO_IN | G_IO_ERR,
> +			     test_handler, NULL);
> +	if (ret < 0) {
> +		igt_warn("Failed to add watch on udev GIOChannel\n");
> +			goto out_close;
> +	}
> +
> +	stdinchannel =3D g_io_channel_unix_new(0);
> +	if (!stdinchannel) {
> +		igt_warn("Failed to create stdin GIOChannel\n");
> +		goto out_hotplug;
> +	}
> +
> +	ret =3D g_io_add_watch(stdinchannel, G_IO_IN | G_IO_ERR, input_event,
> +			     NULL);
> +	if (ret < 0) {
> +		igt_warn("Failed to add watch on stdin GIOChannel\n");
> +		goto out_stdio;
> +	}
> +
> +	ret =3D 0;
> +
> +	igt_info("*************DP Compliance Testing using Qdbox 980***********=
**\n");
> +	igt_info("Waiting for test request......\n");
> +
> +	g_main_loop_run(mainloop);
> +
> +out_stdio:
> +	g_io_channel_shutdown(stdinchannel, TRUE, NULL);
> +out_hotplug:
> +	igt_dp_compliance_cleanup_hotplug();
> +out_mainloop:
> +	g_main_loop_unref(mainloop);
> +out_close:
> +	cleanup_debugfs();
> +	close(drm_fd);
> +
> +	igt_assert_eq(ret, 0);
> +
> +	igt_info("Compliance testing application exiting\n");
> +	igt_exit();
> +}
> -- =

> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
