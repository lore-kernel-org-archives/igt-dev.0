Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5812310E18E
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 18:23:18 +0000 (UTC)
Message-ID: <78b43129-a206-42e7-a517-6ee63d2787c9@amd.com>
Date: Fri, 3 Nov 2023 14:23:12 -0400
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231102200000.969208-1-aurabindo.pillai@amd.com>
 <20231102200000.969208-4-aurabindo.pillai@amd.com>
 <20231103092155.x3yuifgv5pjeiujp@kamilkon-desk.igk.intel.com>
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20231103092155.x3yuifgv5pjeiujp@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] test/amdgpu: Add test for
 Sub-viewport
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



On 2023-11-03 05:21, Kamil Konieczny wrote:
> Hi Aurabindo,
> On 2023-11-02 at 16:00:00 -0400, Aurabindo Pillai wrote:
>> Sub-viewport is a power saving feature found on DCN32/DCN321 and newer dGPUs.
>>
>> Add a test that commit a high resolution test pattern on multiple displays
>> and checks whether Sub-viewport feature is engaged.
>>
> 
> Please add a few AMD devs in Cc.
> 
>> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
>> ---
>>   tests/amdgpu/amd_subvp.c | 194 +++++++++++++++++++++++++++++++++++++++
>>   tests/amdgpu/meson.build |   1 +
>>   2 files changed, 195 insertions(+)
>>   create mode 100644 tests/amdgpu/amd_subvp.c
>>
>> diff --git a/tests/amdgpu/amd_subvp.c b/tests/amdgpu/amd_subvp.c
>> new file mode 100644
>> index 000000000..110ae31a5
>> --- /dev/null
>> +++ b/tests/amdgpu/amd_subvp.c
>> @@ -0,0 +1,194 @@
>> +/*
>> + * Copyright 2023 Advanced Micro Devices, Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
> ------ ^^^^^
> Delete this and write SPDX at begin, see other *.c test with SPDX licence.
> 
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +#include "igt.h"
>> +#include "igt_amd.h"
>> +#include "igt_core.h"
>> +#include <fcntl.h>
> ----------- ^
> Reverse order, first go system includes, then igt.
> 
> Please also use checkpatch.pl from Linux kernel for some style pointers
> or spelling corrections.
> 
> Regards,
> Kamil
> 
>> +
>> +IGT_TEST_DESCRIPTION("Test enabling sub-viewport feature");
>> +
>> +/* Common test data. */
>> +typedef struct data {
>> +	igt_display_t display;
>> +	igt_plane_t *primary[IGT_MAX_PIPES];
>> +	igt_output_t *output[IGT_MAX_PIPES];
>> +	igt_pipe_t *pipe[IGT_MAX_PIPES];
>> +	igt_pipe_crc_t *pipe_crc[IGT_MAX_PIPES];
>> +	drmModeModeInfo mode[IGT_MAX_PIPES];
>> +	enum pipe pipe_id[IGT_MAX_PIPES];
>> +	int fd;
>> +} data_t;
>> +
>> +struct line_check {
>> +	int found;
>> +	const char *substr;
>> +};
>> +
>> +static const drmModeModeInfo test_mode[] = {
>> +	{ 533250,
>> +	3840, 3888, 3920, 4000, 0,
>> +	2160, 2214, 2219, 2222, 0,
>> +	60,
>> +	DRM_MODE_FLAG_NHSYNC,
>> +	0x48,
>> +	"4k60\0",
>> +	}, /* from LG Ultra HD, product_id = 5B09, serial_number = 1010101 */
>> +};
>> +
>> +/* Forces a mode for a connector. */
>> +static void force_output_mode(struct data *d, igt_output_t *output,
>> +			      const drmModeModeInfo *mode)
>> +{
>> +	/* This allows us to create a virtual sink. */
>> +	if (!igt_output_is_connected(output)) {
>> +		kmstest_force_edid(d->fd, output->config.connector,
>> +				   igt_kms_get_4k_edid());
>> +
>> +		kmstest_force_connector(d->fd, output->config.connector,
>> +					FORCE_CONNECTOR_DIGITAL);
>> +	}
>> +
>> +	igt_output_override_mode(output, mode);
>> +}
>> +
>> +/* Common test setup. */
>> +static void test_init(data_t *data)
>> +{
>> +	igt_display_t *display = &data->display;
>> +	int i, n;
>> +	bool subvp_capable = false;
>> +	bool subvp_en = false;
>> +
>> +	for_each_pipe(display, i) {
>> +		data->pipe_id[i] = PIPE_A + i;
>> +		data->pipe[i] = &data->display.pipes[data->pipe_id[i]];
>> +		data->primary[i] = igt_pipe_get_plane_type(data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
>> +		data->pipe_crc[i] = igt_pipe_crc_new(data->fd, data->pipe_id[i], IGT_PIPE_CRC_SOURCE_AUTO);
>> +	}
>> +
>> +	for (i = 0, n = 0; i < display->n_outputs && n < display->n_pipes; ++i) {
>> +		igt_output_t *output = &display->outputs[i];
>> +		data->output[n] = output;
>> +
>> +		/* Only allow physically connected displays for the tests. */
>> +		if (!igt_output_is_connected(output))
>> +				continue;
>> +
>> +		/* SubVP is only enabled on DP */
>> +		if (output->config.connector->connector_type !=
>> +			DRM_MODE_CONNECTOR_DisplayPort)
>> +			continue;
>> +
>> +		igt_assert(kmstest_get_connector_default_mode(
>> +				data->fd, output->config.connector, &data->mode[n]));
>> +
>> +		force_output_mode(data, data->output[n], &test_mode[0]);
>> +
>> +		n += 1;
>> +	}
>> +
>> +	igt_require_f(n >= 2, "Requires at least two connected display\n");\
>> +
>> +	igt_amd_get_subvp_status(data->fd, &subvp_capable, &subvp_en);
>> +	igt_require_f(subvp_capable, "Requires hardware that supports Sub-viewport\n");
>> +
>> +	igt_display_reset(display);
>> +}
>> +
>> +/* Common test cleanup. */
>> +static void test_fini(data_t *data)
>> +{
>> +	igt_display_t *display = &data->display;
>> +	int i;
>> +
>> +	for_each_pipe(display, i) {
>> +		igt_pipe_crc_free(data->pipe_crc[i]);
>> +	}
>> +
>> +	igt_display_reset(display);
>> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>> +}
>> +
>> +static void test_subvp(data_t *data)
>> +{
>> +	igt_display_t *display = &data->display;
>> +	igt_fb_t rfb;
>> +	bool subvp_supp, subvp_en;
>> +	igt_output_t *output;
>> +	int i;
>> +
>> +	test_init(data);
>> +	igt_enable_connectors(data->fd);
>> +
>> +	for_each_pipe(&data->display, i) {
>> +		/* Setup the output */
>> +		output = data->output[i];
>> +		if (!output || !igt_output_is_connected(output))
>> +			continue;
>> +
>> +		igt_create_pattern_fb(data->fd,
>> +					test_mode[0].hdisplay,
>> +					test_mode[0].vdisplay,
>> +					DRM_FORMAT_XRGB8888,
>> +					0,
>> +					&rfb);
>> +
>> +		igt_output_set_pipe(output, data->pipe_id[i]);
>> +		igt_plane_set_fb(data->primary[i], &rfb);
>> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>> +	}
>> +
>> +
>> +	igt_amd_get_subvp_status(data->fd, &subvp_supp, &subvp_en);
>> +	igt_fail_on_f(!(subvp_supp && subvp_en), "SUBVP did not get enabled\n");
>> +
>> +	igt_remove_fb(data->fd, &rfb);
>> +	test_fini(data);
>> +}
>> +
>> +igt_main
>> +{
>> +	data_t data;
>> +
>> +	igt_skip_on_simulation();
>> +
>> +	memset(&data, 0, sizeof(data));
>> +
>> +	igt_fixture
>> +	{
>> +		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
>> +		igt_display_require(&data.display, data.fd);
>> +		igt_display_require_output(&data.display);
>> +		igt_require(data.display.is_atomic);
>> +
>> +		kmstest_set_vt_graphics_mode();
>> +	}
>> +
>> +	igt_describe("Tests whether system enables sub-viewport when a specific mode is commited");
>> +	igt_subtest("dual-4k60") test_subvp(&data);
>> +
>> +	igt_fixture
>> +	{
>> +		igt_display_fini(&data.display);
>> +	}
>> +}
>> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
>> index f52fc3645..efd911fab 100644
>> --- a/tests/amdgpu/meson.build
>> +++ b/tests/amdgpu/meson.build
>> @@ -36,6 +36,7 @@ if libdrm_amdgpu.found()
>>   			  'amd_vrr_range',
>>   			  'amd_mall',
>>   			  'amd_odm',
>> +			  'amd_subvp',
>>   			]
>>   	if libdrm_amdgpu.version().version_compare('> 2.4.97')
>>   		amdgpu_progs +=[ 'amd_syncobj', ]
>> -- 
>> 2.39.2
>>

Thanks for the review Kamil. I've just sent a v2
