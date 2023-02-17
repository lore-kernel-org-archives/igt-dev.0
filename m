Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2BC10E423
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Feb 2023 07:03:30 +0000 (UTC)
Message-ID: <4d524ec5-42e2-46a7-45b4-ff7767bf0217@intel.com>
Date: Fri, 17 Feb 2023 12:33:16 +0530
MIME-Version: 1.0
Content-Language: en-US
To: juhapekka.heikkila@gmail.com, igt-dev@lists.freedesktop.org
References: <20230215073615.26505-1-swati2.sharma@intel.com>
 <260751da-e735-1204-bcf2-0ca7dbd2e89f@gmail.com>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <260751da-e735-1204-bcf2-0ca7dbd2e89f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [v3] tests/kms_plane_scaling: Add
 downscaling+upscaling tests
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

Thanks for the reviews. Pushed.

On 16-Feb-23 8:59 PM, Juha-Pekka Heikkila wrote:
> Look ok to me.
> 
> Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> 
> On 15.2.2023 9.36, Swati Sharma wrote:
>> In newer hardware versions (i.e. display version >= 14), the second
>> scaler doesn't support downscaling. Current driver design in the
>> case of 2 plane scaling scenario is if plane1-US and plane2-DS,
>> it's reject for now. That's why new tests are added for plane1-DS
>> and plane2-US, so that different DS+US combinations can be validated.
>>
>> v2: -minor fix
>> v3: -change to if-else ladder to switch (JP)
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/kms_plane_scaling.c | 108 ++++++++++++++++++++++++++++++++------
>>   1 file changed, 91 insertions(+), 17 deletions(-)
>>
>> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
>> index 4a04f42a0..1f132bae1 100644
>> --- a/tests/kms_plane_scaling.c
>> +++ b/tests/kms_plane_scaling.c
>> @@ -31,7 +31,8 @@ IGT_TEST_DESCRIPTION("Test display plane scaling");
>>   enum scaler_combo_test_type {
>>       TEST_PLANES_UPSCALE = 0,
>>       TEST_PLANES_DOWNSCALE,
>> -    TEST_PLANES_UPSCALE_DOWNSCALE
>> +    TEST_PLANES_UPSCALE_DOWNSCALE,
>> +    TEST_PLANES_DOWNSCALE_UPSCALE,
>>   };
>>   typedef struct {
>> @@ -286,6 +287,69 @@ const struct {
>>           0.75,
>>           TEST_PLANES_UPSCALE_DOWNSCALE,
>>       },
>> +    {
>> +        "Tests downscaling (scaling factor 0.25) and upscaling 
>> (20x20) of 2 planes.",
>> +        "planes-downscale-factor-0-25-upscale-20x20",
>> +        0.25,
>> +        0.0,
>> +        TEST_PLANES_DOWNSCALE_UPSCALE,
>> +    },
>> +    {
>> +        "Tests downscaling (scaling factor 0.25) and upscaling 
>> (scaling factor 0.25) of 2 planes.",
>> +        "planes-downscale-factor-0-25-upscale-0-25",
>> +        0.25,
>> +        0.25,
>> +        TEST_PLANES_DOWNSCALE_UPSCALE,
>> +    },
>> +    {
>> +        "Tests downscaling (scaling factor 0.25) and scaling (unity) 
>> of 2 planes.",
>> +        "planes-downscale-factor-0-25-unity-scaling",
>> +        0.25,
>> +        1.0,
>> +        TEST_PLANES_DOWNSCALE_UPSCALE,
>> +    },
>> +    {
>> +        "Tests downscaling (scaling factor 0.5) and upscaling (20x20) 
>> of 2 planes.",
>> +        "planes-downscale-factor-0-5-upscale-20x20",
>> +        0.5,
>> +        0.0,
>> +        TEST_PLANES_DOWNSCALE_UPSCALE,
>> +    },
>> +    {
>> +        "Tests downscaling (scaling factor 0.5) and upscaling 
>> (scaling factor 0.25) of 2 planes.",
>> +        "planes-downscale-factor-0-5-upscale-0-25",
>> +        0.5,
>> +        0.25,
>> +        TEST_PLANES_DOWNSCALE_UPSCALE,
>> +    },
>> +    {
>> +        "Tests downscaling (scaling factor 0.5) and scaling (unity) 
>> of 2 planes.",
>> +        "planes-downscale-factor-0-5-unity-scaling",
>> +        0.5,
>> +        1.0,
>> +        TEST_PLANES_DOWNSCALE_UPSCALE,
>> +    },
>> +    {
>> +        "Tests downscaling (scaling factor 0.75) and upscaling 
>> (20x20) of 2 planes.",
>> +        "planes-downscale-factor-0-75-upscale-20x20",
>> +        0.75,
>> +        0.0,
>> +        TEST_PLANES_DOWNSCALE_UPSCALE,
>> +    },
>> +    {
>> +        "Tests downscaling (scaling factor 0.75) and upscaling 
>> (scaling factor 0.25) of 2 planes.",
>> +        "planes-downscale-factor-0-75-upscale-0-25",
>> +        0.75,
>> +        0.25,
>> +        TEST_PLANES_DOWNSCALE_UPSCALE,
>> +    },
>> +    {
>> +        "Tests downscaling (scaling factor 0.75) and scaling (unity) 
>> of 2 planes.",
>> +        "planes-downscale-factor-0-75-unity-scaling",
>> +        0.75,
>> +        1.0,
>> +        TEST_PLANES_DOWNSCALE_UPSCALE,
>> +    },
>>   };
>>   static int get_width(drmModeModeInfo *mode, double scaling_factor)
>> @@ -589,23 +653,25 @@ __test_planes_scaling_combo(data_t *d, int w1, 
>> int h1, int w2, int h2,
>>       igt_plane_set_fb(p1, fb1);
>>       igt_plane_set_fb(p2, fb2);
>> -    if (test_type == TEST_PLANES_UPSCALE) {
>> -        /* first plane upscaling */
>> +    switch (test_type) {
>> +    case TEST_PLANES_UPSCALE:
>>           igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
>> -        /* second plane upscaling */
>>           igt_plane_set_size(p2, mode->hdisplay - 20, mode->vdisplay - 
>> 20);
>> -    }
>> -    if (test_type == TEST_PLANES_DOWNSCALE) {
>> -        /* first plane downscaling */
>> +        break;
>> +    case TEST_PLANES_DOWNSCALE:
>>           igt_plane_set_size(p1, w1, h1);
>> -        /* second plane downscaling */
>>           igt_plane_set_size(p2, w2, h2);
>> -    }
>> -    if (test_type == TEST_PLANES_UPSCALE_DOWNSCALE) {
>> -        /* first plane upscaling */
>> +        break;
>> +    case TEST_PLANES_UPSCALE_DOWNSCALE:
>>           igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
>> -        /* second plane downscaling */
>>           igt_plane_set_size(p2, w2, h2);
>> +        break;
>> +    case TEST_PLANES_DOWNSCALE_UPSCALE:
>> +        igt_plane_set_size(p1, w1, h1);
>> +        igt_plane_set_size(p2, mode->hdisplay, mode->vdisplay);
>> +        break;
>> +    default:
>> +        igt_assert(0);
>>       }
>>       ret = igt_display_try_commit_atomic(display, 
>> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> @@ -641,17 +707,25 @@ test_planes_scaling_combo(data_t *d, int w1, int 
>> h1, int w2, int h2,
>>       igt_output_set_pipe(output, pipe);
>>       mode = igt_output_get_mode(output);
>> -    if (test_type == TEST_PLANES_UPSCALE) {
>> +    switch (test_type) {
>> +    case TEST_PLANES_UPSCALE:
>>           setup_fb(display->drm_fd, w1, h1, 1.0, 0.0, 0.0, &d->fb[1]);
>>           setup_fb(display->drm_fd, w2, h2, 0.0, 1.0, 0.0, &d->fb[2]);
>> -    }
>> -    if (test_type == TEST_PLANES_DOWNSCALE) {
>> +        break;
>> +    case TEST_PLANES_DOWNSCALE:
>>           setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, 
>> 1.0, 0.0, 0.0, &d->fb[1]);
>>           setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, 
>> 0.0, 1.0, 0.0, &d->fb[2]);
>> -    }
>> -    if (test_type == TEST_PLANES_UPSCALE_DOWNSCALE) {
>> +        break;
>> +    case TEST_PLANES_UPSCALE_DOWNSCALE:
>>           setup_fb(display->drm_fd, w1, h1, 1.0, 0.0, 0.0, &d->fb[1]);
>>           setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, 
>> 0.0, 1.0, 0.0, &d->fb[2]);
>> +        break;
>> +    case TEST_PLANES_DOWNSCALE_UPSCALE:
>> +        setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, 
>> 0.0, 1.0, 0.0, &d->fb[1]);
>> +        setup_fb(display->drm_fd, w2, h2, 1.0, 0.0, 0.0, &d->fb[2]);
>> +        break;
>> +    default:
>> +        igt_assert(0);
>>       }
>>       for (int k = 0; k < display->pipes[pipe].n_planes; k++) {
> 

-- 
~Swati Sharma
