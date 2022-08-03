Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9A211BB56
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Aug 2022 23:43:04 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id
 bl27-20020a05620a1a9b00b0069994eeb30cso14531273qkb.11
 for <igt-dev@lists.freedesktop.org>; Wed, 03 Aug 2022 16:43:00 -0700 (PDT)
Message-ID: <d542ea17766046b24d2e91eef07b16750280678f.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Wayne Lin <Wayne.Lin@amd.com>, igt-dev@lists.freedesktop.org
Date: Wed, 03 Aug 2022 19:42:56 -0400
In-Reply-To: <20220802105634.9635-1-Wayne.Lin@amd.com>
References: <20220802105634.9635-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2] test/amdgpu: Add DP mst test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: jerry.zuo@amd.com, hersenxs.wu@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

I realized I should just be open about what the delay on looking at this was,
and just some of the general delay from me with reviewing MST work like this
in general both in igt and the kernel. It's been pretty difficult finding the
motivation to review work like this, and this is a sentiment I've been seeing
increasingly in other parts of the community as well.

This is a lot of code, all of which is amdgpu specific despite covering
functionality that is not at all specific to amdgpu, in a codebase where
testing MST has been a topic of discussion for quite a while now. This adds to
another pile of functionality where all of the time to implement it has been
taken, without consideration to how other drivers might be able to benefit
from this. And it's being done in addition to debugfs code we already have
that could be modified to support these things. Put more simply: if someone
had the time to write this code in the first place, it's very hard for me to
understand how they didn't also have the time to try to contribute this
functionality back in an open source project where that's more or less
expected and has been the standard. Especially considering that just looking
at this code, I'm not finding anything that would be difficult to move to DRM
helpers. Some extra state tracking might be needed to keep track of whether
we've probed the link address of something yet, or have read the EDID from it,
etc. but that doesn't really seem like a deal breaker.

Sure - you could say that the code's been written now, and surely that must be
less effort then trying to come up with something like this from scratch. And
sometimes it is, but it still takes considerably more effort across the
community then just making it work outside your driver in the first place
would have. And sometimes it isn't even easier then writing it from scratch.
In porting it to other drivers, there might be issues with the approach taken
that come up. There also might just be the general struggle of trying to
understand how the various layers of abstraction in amdgpu correspond to DRM
at all, and the more stuff like this that gets added the higher that bar of
understanding for contributions gets even for contributors who very regularly
jump between numerous different GPU drivers for different vendors and have
been doing so for the better half of a decade.

So, may I ask that we consider changing the approach to how this is
implemented, and start from the DRM helpers? I would love to see this kind of
functionality introduced to igt and DRM, and I'd be quite happy to review a
patch series that added this generally in a way other drivers could take
advantage of for either project. I'm sure others would likely find a lot of
use with more MST testing infra as well, along with a lot of the other feature
work currently going on with amdgpu.

On Tue, 2022-08-02 at 18:56 +0800, Wayne Lin wrote:
> [Why & How]
> Add new igt test amd_mst for DP mst feature.
> 
> MST (Multi-Stream Transport) is the feature introduced from DP 1.2.
> By mst, source can transport multiple streams to different stream
> sinks through the same DP Tx.
> 
> This new igt test "amd_mst" validate mst feature from two perspectives:
> 
> * Trigger hotplug via debugfs to see whether all mst end sinks
>   successfully go through mst light up procedure
> * Check if all mst end sinks successfully go through mst light up
>   procedure after suspend-resume
> 
> This tool is developed under the setup below:
> * 2xFHD monitors connected after the 3D club mst hub (model CSV-7300).
>   Upstream port of 3D club hub is connected directly to ASIC DP port.
> 
> v2:
> - Revise the commit message to describe the hardware setup while
>   developing this tool.
> - Rename is_mst_connector to mst_roles
> - Remove unnecessary variable/space/brackets
> - Add more descriptions for MST progress status
> - Add option to specify the delay before checking MST progress status
> 
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> ---
>  lib/igt_amd.c            | 157 +++++++++++++++++++
>  lib/igt_amd.h            |  47 ++++++
>  tests/amdgpu/amd_mst.c   | 316 +++++++++++++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build |   1 +
>  4 files changed, 521 insertions(+)
>  create mode 100644 tests/amdgpu/amd_mst.c
> 
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index bef9c193..7ad70dc8 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -1175,3 +1175,160 @@ bool igt_amd_set_visual_confirm(int drm_fd, enum amdgpu_debug_visual_confirm opt
>  
>  	return res;
>  }
> +
> +/**
> + * igt_amd_output_has_mst: check if connector has MST debugfs entries
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +static bool igt_amd_output_has_mst(int drm_fd, char *connector_name)
> +{
> +	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_MST_IS_MST_CONNECTOR) &
> +			igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_MST_PROGRESS_STATUS);
> +}
> +
> +/**
> + * igt_amd_require_mst: Checks if connectors have mst debugfs entries
> + * @display: A pointer to an #igt_display_t structure
> + * @drm_fd: DRM file descriptor
> + *
> + * Checks if the AMDGPU driver supports the 'is_mst_connector'
> + * and 'mst_progress_status' entry for mst. Skip test if there
> + * are no relevant debugfs entries.
> + */
> +void igt_amd_require_mst(igt_display_t *display, int drm_fd)
> +{
> +	igt_output_t *output;
> +
> +	for_each_connected_output(display, output)
> +		if (igt_amd_output_has_mst(drm_fd, output->name))
> +			return;
> +
> +	igt_skip("No MST relevant debugfs support.\n");
> +}
> +
> +/**
> + * igt_amd_get_mst_role: Get the mst role of this output
> + * @drm_fd: DRM file descriptor
> + * @output: the output to be checked
> + *
> + * DRM enumerates a drm connector to each MST output port. This is used to
> + * determine the mst role of this specific output. The mst role in the
> + * mst topology shoule be 'no', 'root', 'branch' and 'end'
> + */
> +enum dp_mst_role igt_amd_get_mst_role(int drm_fd, igt_output_t *output)
> +{
> +	int fd, ret;
> +	char buf[256] = {'\0'};
> +	int i = 0;
> +	enum dp_mst_role role = MST_NONE;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("Could not open connector %s debugfs directory\n",
> +			 output->name);
> +		return MST_NONE;
> +	}
> +
> +	if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort)
> +		return MST_NONE;
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_MST_IS_MST_CONNECTOR, buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		     DEBUGFS_MST_IS_MST_CONNECTOR, output->name);
> +
> +	close(fd);
> +
> +	for (i = 0; i < sizeof(mst_roles)/sizeof(char *); i++) {
> +		if (strstr(buf, mst_roles[i])) {
> +			role = i;
> +			break;
> +		}
> +	}
> +
> +	if (role != MST_NONE)
> +		igt_info("Connector %s: is a mst %s", output->name, buf);
> +	else
> +		igt_info("Connector %s: is not a mst device\n", output->name);
> +
> +	return role;
> +}
> +
> +/**
> + * igt_amd_get_mst_progress_status: Get the mst progress status of a mst device
> + * @drm_fd: DRM file descriptor
> + * @output: the output to be checked
> + *
> + * Get the mst progress status of this specific output. The mst progress status
> + * is indicated by:
> + * MST_PROBE - drm connector got detected by LINK_ADDRESS sideband msg.
> + * MST_REMOTE_EDID - successfully read out edid by REMOTE_I2C_READ sideband msg.
> + * MST_ALLOCATE_NEW_PAYLOAD - suuccessfully allocate time slots for the stream.
> + * MST_CLEAR_ALLOCATED_PAYLOAD - successfully clean out allocated time slots.
> + */
> +uint8_t igt_amd_get_mst_progress_status(int drm_fd, igt_output_t *output)
> +{
> +	int fd, ret;
> +	char buf[256] = {'\0'};
> +	int idx = 0;
> +	char *token_end;
> +	uint8_t status = MST_STATUS_DEFAULT;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("Could not open connector %s debugfs directory\n",
> +			 output->name);
> +		return MST_STATUS_DEFAULT;
> +	}
> +
> +	if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort)
> +		return MST_STATUS_DEFAULT;
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_MST_PROGRESS_STATUS, buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		     DEBUGFS_MST_PROGRESS_STATUS, output->name);
> +
> +	close(fd);
> +
> +	/* Parse values read from file. */
> +	for (char *token = strtok_r(buf, "\n", &token_end);
> +	     token != NULL;
> +	     token = strtok_r(NULL, "\n", &token_end), idx++)
> +	{
> +		if (strstr(token, "not") == NULL)
> +			status |= BIT(idx);
> +	}
> +
> +	return status;
> +}
> +
> +/**
> + * mst_trigger_hotplug: Trigger mst hotplug
> + * @drm_fd: DRM file descriptor
> + * @output: #igt_output_t to check.
> + *
> + * Trigger soft hotplug on mst connector. Caller should make sure the
> + * passed output is mst root by igt_amd_get_mst_role(). We can't generate
> + * soft hotplug on mst end device.
> + */
> +void mst_trigger_hotplug(int drm_fd, igt_output_t *output)
> +{
> +	int fd, hpd_fd;
> +	int wr_len;
> +	const char *enable_hpd = "1", *disable_hpd = "0";
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	igt_assert(fd >= 0);
> +	hpd_fd = openat(fd, DEBUGFS_HPD_TRIGGER, O_WRONLY);
> +	close(fd);
> +	igt_assert(hpd_fd >= 0);
> +
> +	wr_len = write(hpd_fd, disable_hpd, strlen(disable_hpd));
> +	igt_assert_eq(wr_len, strlen(disable_hpd));
> +
> +	sleep(3);
> +
> +	wr_len = write(hpd_fd, enable_hpd, strlen(enable_hpd));
> +	igt_assert_eq(wr_len, strlen(enable_hpd));
> +	close(hpd_fd);
> +}
> \ No newline at end of file
> diff --git a/lib/igt_amd.h b/lib/igt_amd.h
> index 428bfe6f..2d54ddc3 100644
> --- a/lib/igt_amd.h
> +++ b/lib/igt_amd.h
> @@ -52,6 +52,12 @@
>  /* amdgpu DM interface entries */
>  #define DEBUGFS_DM_VISUAL_CONFIRM "amdgpu_dm_visual_confirm"
>  
> +/* mst related read only status*/
> +#define DEBUGFS_MST_IS_MST_CONNECTOR "is_mst_connector"
> +#define DEBUGFS_MST_PROGRESS_STATUS "mst_progress_status"
> +
> +#define BIT(x) (1ul <<(x))
> +
>  enum amd_dsc_clock_force {
>  	DSC_AUTOMATIC = 0,
>  	DSC_FORCE_ON,
> @@ -131,6 +137,41 @@ enum amdgpu_debug_visual_confirm {
>  	VISUAL_CONFIRM_SWIZZLE	= 9
>  };
>  
> +/*
> + * Enumeration of the role in MST topology:
> + * MST_NONE - drm connector is not in a MST topology
> + * MST_ROOT - the output DP port locates at stream source.
> + * MST_BRANCH - the intermdediate node of a path from root to leaf within a mst topology
> + * MST_END - the leaf node of a mst topology
> + */
> +enum dp_mst_role {
> +	MST_NONE = 0,
> +	MST_ROOT,
> +	MST_BRANCH,
> +	MST_END,
> +};
> +
> +static const char *const mst_roles[] = {
> +    "no",
> +    "root",
> +    "branch",
> +    "end",
> +};
> +
> +/*
> + * Enumeration of MST progress state. The bit order should align
> + * with the 'enum mst_progress_statusto' in amdgpu_dm.h of
> + * upstreamed amdgpu kernel driver
> + */
> +enum mst_progress_status {
> +	MST_STATUS_DEFAULT = 0,
> +	MST_PROBE = BIT(0),
> +	MST_REMOTE_EDID = BIT(1),
> +	MST_ALLOCATE_NEW_PAYLOAD = BIT(2),
> +	MST_CLEAR_ALLOCATED_PAYLOAD = BIT(3),
> +	NUM_MST_STATUS = 4,
> +};
> +
>  uint32_t igt_amd_create_bo(int fd, uint64_t size);
>  void *igt_amd_mmap_bo(int fd, uint32_t handle, uint64_t size, int prot);
>  unsigned int igt_amd_compute_offset(unsigned int* swizzle_pattern,
> @@ -192,4 +233,10 @@ int  igt_amd_read_psr_state(int drm_fd, char *connector_name);
>  bool igt_amd_has_visual_confirm(int drm_fd);
>  int  igt_amd_get_visual_confirm(int drm_fd);
>  bool igt_amd_set_visual_confirm(int drm_fd, enum amdgpu_debug_visual_confirm option);
> +
> +/* DP MST debugfs helpers*/
> +void igt_amd_require_mst(igt_display_t *display, int drm_fd);
> +enum dp_mst_role igt_amd_get_mst_role(int drm_fd, igt_output_t *output);
> +uint8_t igt_amd_get_mst_progress_status(int drm_fd, igt_output_t *output);
> +void mst_trigger_hotplug(int drm_fd, igt_output_t *output);
>  #endif /* IGT_AMD_H */
> diff --git a/tests/amdgpu/amd_mst.c b/tests/amdgpu/amd_mst.c
> new file mode 100644
> index 00000000..def4edbc
> --- /dev/null
> +++ b/tests/amdgpu/amd_mst.c
> @@ -0,0 +1,316 @@
> +/*
> + * Copyright 2022 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include "igt.h"
> +#include "igt_amd.h"
> +
> +IGT_TEST_DESCRIPTION("This igt test validates DP MST feature by:"
> +	"1. Check each mst end sink successfully go through mst light up procedure"
> +	"after hotplug root branch."
> +	"2. Check each mst end sink successfully go through mst light up procedure"
> +	"after suspend-resume");
> +
> +/* Maximum pipes on any AMD ASIC. */
> +#define MAX_PIPES 6
> +
> +typedef struct data {
> +	igt_display_t display;
> +	igt_plane_t *primary[MAX_PIPES];
> +	igt_output_t *output_mst_end[MAX_PIPES];
> +	igt_output_t *output_mst_root[MAX_PIPES];
> +	igt_pipe_t *pipe[MAX_PIPES];
> +	igt_fb_t ref_fb[MAX_PIPES];
> +	drmModeModeInfo mode[MAX_PIPES];
> +	enum pipe pipe_id[MAX_PIPES];
> +	int w[MAX_PIPES];
> +	int h[MAX_PIPES];
> +	int fd;
> +	int num_mst_end;
> +	int usr_num_mst_end;
> +	int delay_for_progress;
> +} data_t;
> +
> +static void test_init(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	int i, m, n, max_pipes = display->n_pipes;
> +	enum dp_mst_role role;
> +	drmModeConnector *conn;
> +
> +	for_each_pipe(display, i) {
> +		data->pipe_id[i] = PIPE_A + i;
> +		data->pipe[i] = &data->display.pipes[data->pipe_id[i]];
> +		data->primary[i] = igt_pipe_get_plane_type(
> +			data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
> +	}
> +
> +	/* Find mst connected root/end connector*/
> +	for (i = 0, n = 0, m = 0, data->num_mst_end = 0;
> +		i < display->n_outputs && n < max_pipes && m < max_pipes; i++) {
> +		igt_output_t *output = &display->outputs[i];
> +
> +		conn = output->config.connector;
> +		if (conn->connector_type != DRM_MODE_CONNECTOR_DisplayPort)
> +			continue;
> +
> +		role = igt_amd_get_mst_role(data->fd, output);
> +
> +		switch(role) {
> +			case MST_ROOT:
> +				data->output_mst_root[n++] = output;
> +				break;
> +			case MST_END:
> +				if (!igt_output_is_connected(output))
> +					continue;
> +				data->output_mst_end[m] = output;
> +				igt_assert(kmstest_get_connector_default_mode(
> +				data->fd, output->config.connector, &data->mode[m]));
> +
> +				data->w[m] = data->mode[m].hdisplay;
> +				data->h[m] = data->mode[m].vdisplay;
> +				m++;
> +				data->num_mst_end++;
> +				break;
> +			default:
> +				continue;
> +				break;
> +		}
> +	}
> +
> +	igt_require(data->output_mst_root[0]);
> +	igt_require(data->output_mst_end[0]);
> +	if (data->usr_num_mst_end)
> +		igt_assert_eq(data->usr_num_mst_end, data->num_mst_end);
> +	igt_display_reset(display);
> +}
> +
> +static void test_fini(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +
> +	igt_display_reset(display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +}
> +
> +static bool show_mst_status_result(igt_output_t *output, uint8_t status)
> +{
> +	uint8_t bit_idx = 0;
> +	bool result = true;
> +
> +	igt_info("Connector:%s mst progress status:\n", output->name);
> +
> +	for (bit_idx = 0; bit_idx < NUM_MST_STATUS; bit_idx++) {
> +		switch(BIT(bit_idx)) {
> +			case MST_PROBE:
> +				if ((status & MST_PROBE) == MST_STATUS_DEFAULT)
> +					result = false;
> +				igt_info("Probe:%s\n", (status & MST_PROBE) ? "PASS" : "FAIL");
> +				break;
> +			case MST_REMOTE_EDID:
> +				if ((status & MST_REMOTE_EDID) == MST_STATUS_DEFAULT)
> +					result = false;
> +				igt_info("Remote EDID:%s\n", (status & MST_REMOTE_EDID) ? "PASS" : "FAIL");
> +				break;
> +			case MST_ALLOCATE_NEW_PAYLOAD:
> +				if ((status & MST_ALLOCATE_NEW_PAYLOAD) == MST_STATUS_DEFAULT)
> +					result = false;
> +				igt_info("Allocate new payload:%s\n",
> +					(status & MST_ALLOCATE_NEW_PAYLOAD) ? "PASS" : "FAIL");
> +				break;
> +			default:
> +				break;
> +		}
> +	}
> +
> +	return result;
> +}
> +
> +static void reset_resource(data_t *data)
> +{
> +	igt_display_reset(&data->display);
> +	igt_display_fini(&data->display);
> +	close(data->fd);
> +
> +	memset(data->primary, 0, sizeof(igt_plane_t *)*MAX_PIPES);
> +	memset(data->output_mst_end, 0, sizeof(igt_output_t *)*MAX_PIPES);
> +	memset(data->output_mst_root, 0, sizeof(igt_output_t *)*MAX_PIPES);
> +	memset(data->pipe, 0, sizeof(igt_pipe_t *)*MAX_PIPES);
> +	memset(data->mode, 0, sizeof(drmModeModeInfo)*MAX_PIPES);
> +	memset(data->pipe_id, 0, sizeof(enum pipe)*MAX_PIPES);
> +	memset(data->w, 0, sizeof(int)*MAX_PIPES);
> +	memset(data->h, 0, sizeof(int)*MAX_PIPES);
> +
> +	data->fd = drm_open_driver_master(DRIVER_AMDGPU);
> +	igt_display_require(&data->display, data->fd);
> +}
> +
> +static void set_up_streams(data_t *data)
> +{
> +	igt_output_t *output;
> +	int i;
> +
> +	for (i = 0; i < MAX_PIPES; i++) {
> +		output = data->output_mst_end[i];
> +		if (!output || !igt_output_is_connected(output))
> +			continue;
> +
> +		igt_create_pattern_fb(data->fd, data->w[i], data->h[i],
> +				      DRM_FORMAT_XRGB8888, 0, &data->ref_fb[i]);
> +		igt_output_set_pipe(output, data->pipe_id[i]);
> +		igt_plane_set_fb(data->primary[i], &data->ref_fb[i]);
> +	}
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +	sleep(5);
> +}
> +
> +static void validate_mst_progress_result(data_t *data)
> +{
> +	int i = 0;
> +	uint8_t status = 0;
> +	igt_output_t *output;
> +
> +	for (i = 0; i < data->num_mst_end; i++) {
> +		output = data->output_mst_end[i];
> +
> +		if (!output)
> +			continue;
> +
> +		status = igt_amd_get_mst_progress_status(data->fd, output);
> +
> +		/* make sure all mst end device get lit up correctly*/
> +		igt_assert(show_mst_status_result(output, status));
> +	}
> +}
> +
> +static void test_mst_hotplug_basic(data_t *data)
> +{
> +	igt_output_t *output;
> +	int i = 0;
> +
> +	test_init(data);
> +
> +	/* Setup all end mst output */
> +	set_up_streams(data);
> +
> +	/*confirm mst progress is done*/
> +	validate_mst_progress_result(data);
> +
> +	/* Trigger hotplug*/
> +	for (i = 0; i < MAX_PIPES; i++) {
> +		output = data->output_mst_root[i];
> +
> +		if (!output)
> +			continue;
> +
> +		mst_trigger_hotplug(data->fd, output);
> +	}
> +
> +	/* mst connectors are dynamically created/destroyed. Need
> +	 * to free and reallocate resources then commit streams again
> +	 */
> +	reset_resource(data);
> +
> +	test_init(data);
> +
> +	set_up_streams(data);
> +
> +	if (data->delay_for_progress)
> +		sleep(data->delay_for_progress);
> +	else
> +		sleep(5);
> +	/*confirm mst progress status again*/
> +	validate_mst_progress_result(data);
> +
> +	/*do suspend resume*/
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +
> +	if (data->delay_for_progress)
> +		sleep(data->delay_for_progress);
> +	else
> +		sleep(5);
> +
> +	/*confirm mst progress status again*/
> +	validate_mst_progress_result(data);
> +
> +	for (i = 0; i < MAX_PIPES; i++) {
> +		output = data->output_mst_end[i];
> +
> +		if (!output)
> +			continue;
> +
> +		igt_remove_fb(data->fd, &data->ref_fb[i]);
> +	}
> +
> +	test_fini(data);
> +}
> +
> +const char *optstr = "hn:d:";
> +static void usage(const char *name)
> +{
> +	igt_info("Usage: %s options\n", name);
> +	igt_info("-h			Show help\n");
> +	igt_info("-n mst_num	Set how many monitors connected in the mst topology\n");
> +	igt_info("-d delay		Set delay before checking the mst progress status\n");
> +	igt_info("NOTE: if -n is not specified, number of monitors will be detected automatically"
> +		"by current connection status\n");
> +	igt_info("NOTE: if -d is not specified, delay before checking the mst progress status"
> +		"will be set as 5s\n");
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	data_t data;
> +	int c;
> +
> +	igt_skip_on_simulation();
> +
> +	memset(&data, 0, sizeof(data));
> +
> +	data.fd = drm_open_driver_master(DRIVER_AMDGPU);
> +	kmstest_set_vt_graphics_mode();
> +
> +	igt_display_require(&data.display, data.fd);
> +	igt_require(data.display.is_atomic);
> +	igt_display_require_output(&data.display);
> +
> +	igt_amd_require_hpd(&data.display, data.fd);
> +	igt_amd_require_mst(&data.display, data.fd);
> +
> +	while((c = getopt(argc, argv, optstr)) != -1) {
> +		switch(c) {
> +		case 'n':
> +			data.usr_num_mst_end = atoi(optarg);
> +			break;
> +		case 'd':
> +			data.delay_for_progress = atoi(optarg);
> +			break;
> +		case 'h':
> +		default:
> +			usage(argv[0]);
> +			exit(EXIT_SUCCESS);
> +		}
> +	}
> +
> +	test_mst_hotplug_basic(&data);
> +
> +	igt_display_fini(&data.display);
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index f4a0b9fd..5964c080 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -21,6 +21,7 @@ if libdrm_amdgpu.found()
>  			  'amd_psr',
>  			  'amd_plane',
>  			  'amd_ilr',
> +			  'amd_mst',
>  			]
>  	amdgpu_deps += libdrm_amdgpu
>  endif

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat
