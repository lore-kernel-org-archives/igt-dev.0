Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF6C10EA19
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jan 2022 15:07:06 +0000 (UTC)
Message-ID: <f419b85f-cad4-66f9-c92e-b1fbd5731780@intel.com>
Date: Mon, 24 Jan 2022 20:36:31 +0530
MIME-Version: 1.0
Content-Language: en-US
References: <20220121193636.1413-1-swati2.sharma@intel.com>
 <4333f801-f482-1b52-0ad9-2231116ef619@gmail.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <4333f801-f482-1b52-0ad9-2231116ef619@gmail.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [v2] tests/kms_scaling_modes: New IGT to validate
 scaling modes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: juhapekka.heikkila@gmail.com, igt-dev@lists.freedesktop.org, Bhanuprakash Modem <bhanuprakash.modem@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Addressed review comments.
Floated v3 https://patchwork.freedesktop.org/series/98463/#rev4

On 24-Jan-22 2:28 PM, Juha-Pekka Heikkila wrote:
> On 21.1.2022 21.36, Swati Sharma wrote:
>> In this IGT, various scaling modes are validated. Scaling
>> mode is one of the connector properties. This property
>> defines how a non-native mode is upscaled to the native
>> mode of an LCD panel.
>>
>> There are 4 types of scaling modes defined:
>>     None:
>>         No upscaling happens, scaling is left to the panel. Not all
>>         drivers expose this mode.
>>     Full:
>>         The output is upscaled to the full resolution of the panel,
>>         ignoring the aspect ratio. It will expand current image to
>>         the size of the monitor.
>>     Center:
>>         No upscaling happens, the output is centered within the native
>>         resolution the panel. As a result, black bars may appear
>>         around the image.
>>     Full aspect:
>>         The output is upscaled to maximize either the width or height
>>         while retaining the aspect ratio. It will fill the screen w/o
>>         stretching the image. Black bars are placed either on top
>>         and bottom or left and right of the picture.
>>
>> v2: -removed test flags/test_cycle_flags() (JP)
>>      -removed redundant igt_display_commit_atomic() (JP)
>>      -corrected indentation (JP)
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/kms_scaling_modes.c | 144 ++++++++++++++++++++++++++++++++++++++
>>   tests/meson.build         |   1 +
>>   2 files changed, 145 insertions(+)
>>   create mode 100644 tests/kms_scaling_modes.c
>>
>> diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
>> new file mode 100644
>> index 00000000..28b5801a
>> --- /dev/null
>> +++ b/tests/kms_scaling_modes.c
>> @@ -0,0 +1,144 @@
>> +/*
>> + * Copyright © 2022 Intel Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person 
>> obtaining a
>> + * copy of this software and associated documentation files (the 
>> "Software"),
>> + * to deal in the Software without restriction, including without 
>> limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, 
>> sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice (including 
>> the next
>> + * paragraph) shall be included in all copies or substantial portions 
>> of the
>> + * Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT 
>> SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, 
>> DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * Author:
>> + *     Swati Sharma <swati2.sharma@intel.com>
>> + */
>> +
>> +#include "igt.h"
>> +#include <fcntl.h>
>> +#include <termios.h>
>> +#include <unistd.h>
>> +
>> +IGT_TEST_DESCRIPTION("Test display scaling modes");
>> +
>> +/* Common test data */
>> +typedef struct data {
>> +    igt_display_t display;
>> +    int drm_fd;
>> +} data_t;
>> +
>> +static void test_scaling_mode_on_output(igt_display_t *display, const 
>> enum pipe pipe,
>> +                    igt_output_t *output, uint32_t flags)
>> +{
>> +    igt_plane_t *primary, *sprite;
>> +    drmModeModeInfo mode;
>> +    struct igt_fb red, blue;
>> +    int ret;
>> +
>> +    igt_output_set_pipe(output, pipe);
>> +    mode = *igt_output_get_mode(output);
>> +
>> +    primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +    sprite = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
>> +
>> +    igt_create_color_fb(display->drm_fd, mode.hdisplay, mode.vdisplay,
>> +                DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
>> +                0.f, 0.f, 1.f, &blue);
>> +
>> +    igt_create_color_fb(display->drm_fd, 640, 480,
>> +                DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
>> +                1.f, 0.f, 0.f, &red);
>> +
>> +    igt_plane_set_fb(primary, &blue);
>> +    igt_plane_set_fb(sprite, &red);
>> +
>> +    igt_display_commit2(display, COMMIT_ATOMIC);
>> +
>> +    mode.hdisplay = 640;
>> +    mode.vdisplay = 480;
>> +    igt_output_override_mode(output, &mode);
>> +
>> +    igt_plane_set_fb(sprite, NULL);
>> +    igt_plane_set_fb(primary, &red);
>> +
>> +    igt_output_set_prop_value(output, IGT_CONNECTOR_SCALING_MODE, 
>> flags);
>> +
>> +    /* Don't pass ALLOW_MODESET with overridden mode, force fastset */
>> +    ret = igt_display_try_commit_atomic(display, 0, NULL);
>> +
>> +    if (ret == -EINVAL)
>> +        igt_skip_on_f(ret == -EINVAL, "Scaling mode not supported\n");
>> +
>> +    igt_remove_fb(display->drm_fd, &red);
>> +    igt_remove_fb(display->drm_fd, &blue);
> 
> Above "if" statement is now redundant. Also you could remove these 
> framebuffers before deciding if skip or no.
> 
>> +}
>> +
>> +/* Returns true if an output supports scaling mode property */
>> +static bool has_scaling_mode(igt_output_t *output)
>> +{
>> +    return igt_output_has_prop(output, IGT_CONNECTOR_SCALING_MODE) &&
>> +           igt_output_get_prop(output, IGT_CONNECTOR_SCALING_MODE);
>> +}
>> +
>> +static void test_scaling_mode(data_t *data, uint32_t flags)
>> +{
>> +    igt_display_t *display = &data->display;
>> +    igt_output_t *output;
>> +    enum pipe pipe;
>> +    int valid_tests = 0;
>> +
>> +    for_each_pipe_with_valid_output(display, pipe, output) {
>> +        if (!has_scaling_mode(output))
>> +            continue;
>> +
>> +        igt_dynamic_f("%s-pipe-%s", output->name, 
>> kmstest_pipe_name(pipe));
>> +        igt_display_reset(display);
>> +        test_scaling_mode_on_output(display, pipe, output, flags);
>> +        valid_tests++;
>> +    }
>> +
>> +    igt_require_f(valid_tests, "No valid crtc/connector combinations 
>> found\n");
>> +}
>> +
>> +igt_main
>> +{
>> +    data_t data = {};
>> +
>> +    igt_fixture {
>> +        data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>> +        igt_require(data.drm_fd >= 0);
>> +
>> +        kmstest_set_vt_graphics_mode();
>> +
>> +        igt_display_require(&data.display, data.drm_fd);
>> +        igt_require(data.display.is_atomic);
>> +
>> +        igt_display_require_output(&data.display);
>> +    }
>> +
>> +    igt_describe("Tests full display scaling mode");
>> +    igt_subtest_with_dynamic("scaling-mode-full")
>> +        test_scaling_mode(&data, DRM_MODE_SCALE_FULLSCREEN);
>> +    igt_describe("Tests center display scaling mode");
>> +    igt_subtest_with_dynamic("scaling-mode-center")
>> +        test_scaling_mode(&data, DRM_MODE_SCALE_CENTER);
>> +    igt_describe("Tests full aspect display scaling mode");
>> +    igt_subtest_with_dynamic("scaling-mode-full-aspect")
>> +        test_scaling_mode(&data, DRM_MODE_SCALE_ASPECT);
>> +    igt_describe("Tests none display scaling mode (no scaling)");
>> +    igt_subtest_with_dynamic("scaling-mode-none")
>> +        test_scaling_mode(&data, DRM_MODE_SCALE_NONE);
>> +
>> +    igt_fixture
>> +        igt_display_fini(&data.display);
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index c14acf99..7003d064 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -50,6 +50,7 @@ test_progs = [
>>       'kms_properties',
>>       'kms_rmfb',
>>       'kms_rotation_crc',
>> +    'kms_scaling_modes',
>>       'kms_selftest',
>>       'kms_sequence',
>>       'kms_setmode',
> 

-- 
~Swati Sharma
