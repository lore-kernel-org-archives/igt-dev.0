Return-path: <SRS0=aXFB=TA=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DD110EB86
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Feb 2022 12:16:15 +0000 (UTC)
Message-ID: <f477c5f7-be29-bd08-41b9-ac802dc9ca30@intel.com>
Date: Thu, 17 Feb 2022 17:45:57 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Jessica Zhang <quic_jesszhan@quicinc.com>, igt-dev@lists.freedesktop.org
References: <20220215122344.11168-1-swati2.sharma@intel.com>
 <20220215122344.11168-5-swati2.sharma@intel.com>
 <a85c6701-43ad-4b25-6184-8798e8db2e2d@quicinc.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <a85c6701-43ad-4b25-6184-8798e8db2e2d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [v4 4/9] tests/kms_plane_scaling: Downscaling each
 plane
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Jessica/Petri,

Sorry missed your mail.

Do you think we should drop upscaling and downscaling single plane tests 
from
my series
https://patchwork.freedesktop.org/series/98333/ ?
That should be covered by your tests?

What do you think?

On 16-Feb-22 6:15 AM, Jessica Zhang wrote:
> 
> 
> On 2/15/2022 4:23 AM, Swati Sharma wrote:
>> Subtest for testing downscaling for each plane
>> individually (checked 1 plane per "class" like
>> we do in other tests).
>>
>> v2: -set modifier as LINEAR (Ville)
>>      -shared code for upscaling and downscaling tests (Ville)
>>      -removed num_scaler() check and added try_commit() (Ville)
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> 
> Hi Swati,
> 
> FYI, Petri and I have been working on a similar patch: [1][2]
> 
> For the latest version we've modified `check_scaling_pipe_plane_rot` so 
> that it takes in a custom buffer height/width and created multiple 
> subtests for different scaling factors.
> 
> I see that you've added tests for both upscaling and downscaling that do 
> something similar. Maybe our changes to `check_scaling_pipe_plane_rot` 
> can be useful for your series to reduce redundant code in both the 
> upscale and downscale cases? Let me know your thoughts on this.
> 
> Thanks,
> 
> Jessica Zhang
> 
> [1] latest version: 
> https://patchwork.freedesktop.org/patch/470921/?series=99364&rev=2
> [2] earlier version: 
> https://patchwork.freedesktop.org/patch/470856/?series=97584&rev=5
> 
>> ---
>>   tests/kms_plane_scaling.c | 55 ++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 54 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
>> index 39f2de3c..e960a6c5 100644
>> --- a/tests/kms_plane_scaling.c
>> +++ b/tests/kms_plane_scaling.c
>> @@ -32,6 +32,7 @@ IGT_TEST_DESCRIPTION("Test display plane scaling");
>>   /* Test flags. */
>>   enum {
>>       TEST_UPSCALING = 1 << 0,
>> +    TEST_DOWNSCALING = 1 << 1,
>>   };
>>   typedef struct {
>> @@ -266,6 +267,48 @@ __test_plane_upscaling(data_t *d, igt_plane_t 
>> *plane,
>>       igt_skip_on_f(ret == -EINVAL, "Scaling op not supported\n");
>>   }
>> +static void
>> +__test_plane_downscaling(data_t *d, igt_plane_t *plane,
>> +                 enum pipe pipe, igt_output_t *output)
>> +{
>> +    igt_display_t *display = &d->display;
>> +    int width, height;
>> +    drmModeModeInfo *mode;
>> +    bool test_complete = false;
>> +    int scaling = 50;
>> +    int ret;
>> +
>> +    cleanup_crtc(d);
>> +
>> +    igt_output_set_pipe(output, pipe);
>> +    mode = igt_output_get_mode(output);
>> +    width = mode->hdisplay;
>> +    height = mode->vdisplay;
>> +
>> +    igt_create_color_pattern_fb(display->drm_fd,
>> +                    width, height,
>> +                    DRM_FORMAT_XRGB8888,
>> +                    I915_TILING_NONE,
>> +                    1.0, 0.0, 0.0, &d->fb[0]);
>> +
>> +    igt_plane_set_fb(plane, &d->fb[0]);
>> +
>> +    while(!test_complete) {
>> +        igt_plane_set_size(plane, (width * scaling) / 100, (height * 
>> scaling) / 100);
>> +        ret = igt_display_try_commit_atomic(display, 
>> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +
>> +        if (ret != -EINVAL)
>> +            test_complete = true;
>> +
>> +        scaling += 5;
>> +    }
>> +
>> +    igt_plane_set_fb(plane, NULL);
>> +    igt_remove_fb(display->drm_fd, &d->fb[0]);
>> +
>> +    igt_skip_on_f(ret == -EINVAL, "Scaling op not supported\n");
>> +}
>> +
>>   static void
>>   test_plane_scaling(data_t *d, enum pipe pipe, igt_output_t *output, 
>> uint32_t flags)
>>   {
>> @@ -285,9 +328,12 @@ test_plane_scaling(data_t *d, enum pipe pipe, 
>> igt_output_t *output, uint32_t fla
>>               uint32_t format = plane->drm_plane->formats[j];
>>               if (test_format(d, &tested_formats, format) &&
>>                   igt_plane_has_format_mod(plane, format, modifier) &&
>> -                can_scale(d, format))
>> +                can_scale(d, format)) {
>>                   if (flags & TEST_UPSCALING)
>>                       __test_plane_upscaling(d, plane, pipe, output);
>> +                if (flags & TEST_DOWNSCALING)
>> +                    __test_plane_downscaling(d, plane, pipe, output);
>> +                }
>>           }
>>           igt_vec_fini(&tested_formats);
>> @@ -618,6 +664,13 @@ igt_main_args("", long_opts, help_str, 
>> opt_handler, &data)
>>                       test_plane_scaling(&data, pipe, output, 
>> TEST_UPSCALING);
>>           }
>> +        igt_describe("Tests plane downscaling.");
>> +        igt_subtest_with_dynamic("plane-downscaling") {
>> +            for_each_pipe_with_single_output(&data.display, pipe, 
>> output)
>> +                igt_dynamic_f("pipe-%s-%s-downscaling", 
>> kmstest_pipe_name(pipe), igt_output_name(output))
>> +                    test_plane_scaling(&data, pipe, output, 
>> TEST_DOWNSCALING);
>> +        }
>> +
>>           igt_describe("Tests scaling with pixel formats.");
>>           igt_subtest_with_dynamic("scaler-with-pixel-format") {
>>               for_each_pipe_with_single_output(&data.display, pipe, 
>> output)
>> -- 
>> 2.25.1
>>

-- 
~Swati Sharma
