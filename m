Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F5E10E065
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Oct 2022 18:30:18 +0000 (UTC)
Message-ID: <1b873d26-39d6-69e5-840e-f4b2dac9b7fd@amd.com>
Date: Fri, 7 Oct 2022 12:30:09 -0600
Content-Language: en-US
To: Karthik B S <karthik.b.s@intel.com>,
 "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
References: <20220929200644.4160588-1-alex.hung@amd.com>
 <ae9f24ee-6982-4ef8-ba52-835184c03a25@amd.com>
 <CAJUqKUqO9wDLDU2=Q=EcyZsXRO5yZ-if6-kV8HWaZeBqg+uDSw@mail.gmail.com>
 <DM4PR11MB6213D37BA33E02D2AE17A13DEC5F9@DM4PR11MB6213.namprd11.prod.outlook.com>
 <e21ac305-22b0-e6fd-c767-05f312ef5297@intel.com>
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <e21ac305-22b0-e6fd-c767-05f312ef5297@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH][V3] tests/kms_plane_multiple: turn off pipe
 if all planes are off
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "michel.daenzer@mailbox.org" <michel.daenzer@mailbox.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

Thanks the comments.

I tested the following changes on i915 and amdgpu devices and it worked 
without failures. This also reduces more device-dependent code.

Does this change make more sense? If so, I can send a V4 patch to be 
tested by more systems on CI.

--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -311,6 +311,7 @@ test_plane_position_with_output(data_t *data, enum 
pipe pipe,
                 for_each_plane_on_pipe(&data->display, pipe, plane)
                         igt_plane_set_fb(plane, NULL);

+               igt_output_set_pipe(output, PIPE_NONE);
                 igt_display_commit2(&data->display, COMMIT_ATOMIC);

                 for (int x = 0; x < c; x++)
@@ -326,16 +327,12 @@ test_plane_position_with_output(data_t *data, enum 
pipe pipe,

         i = 0;
         while (i < iterations || loop_forever) {
-               /* Intel devices need it here, timing sensitive on few 
devices */
-               if (is_i915_device(data->drm_fd))
-                       igt_pipe_crc_start(data->pipe_crc);

                 /* randomize planes and set up the holes */
                 prepare_planes(data, pipe, &blue, modifier, c, output);

                 igt_display_commit2(&data->display, COMMIT_ATOMIC);
-               if (!is_i915_device(data->drm_fd))
-                       igt_pipe_crc_start(data->pipe_crc);
+               igt_pipe_crc_start(data->pipe_crc);

                 igt_pipe_crc_get_current(data->display.drm_fd, 
data->pipe_crc, &crc);
                 igt_assert_crc_equal(&data->ref_crc, &crc);
@@ -344,6 +341,7 @@ test_plane_position_with_output(data_t *data, enum 
pipe pipe,
                 for_each_plane_on_pipe(&data->display, pipe, plane)
                         igt_plane_set_fb(plane, NULL);

+               igt_output_set_pipe(output, PIPE_NONE);
                 igt_display_commit2(&data->display, COMMIT_ATOMIC);



On 2022-10-06 23:51, Karthik B S wrote:
> Hi,
> 
> This is a new issue which is seen with this patch.
> We are seeing a failure in pipe_crc_start when this patch is added.
> 
> (kms_plane_multiple:5716) igt_debugfs-CRITICAL: Test assertion failure 
> function igt_pipe_crc_start, file 
> ../../../usr/src/igt-gpu-tools/lib/igt_debugfs.c:884:
> (kms_plane_multiple:5716) igt_debugfs-CRITICAL: Failed assertion: 
> pipe_crc->crc_fd != -1
> 
> This is because the pipe is off when we're trying to do pipe_crc_start 
> with this patch.
> This is hitting only on i915 because of the below code, where we start 
> pipe crc before the next commit specifically for i915 devices.
> For other devices, the pipe_crc_start is after the next commit and this 
> is the reason we don’t see any issue there.
> 
>   /* Intel devices need it here, timing sensitive on few devices */
>                  if (is_i915_device(data->drm_fd))
>                          igt_pipe_crc_start(data->pipe_crc);
> 
>                  /* randomize planes and set up the holes */
>                  prepare_planes(data, pipe, &blue, modifier, c, output);
> 
>                  igt_display_commit2(&data->display, COMMIT_ATOMIC);
>                  if (!is_i915_device(data->drm_fd))
>                          igt_pipe_crc_start(data->pipe_crc);
> 
> IMHO, this patch needs to be reworked to work with i915 devices.
> 
> Regards,
> Karthik.B.S
> 
> On 10/7/2022 11:03 AM, Vudum, Lakshminarayana wrote:
>> +Karthik and Vandita.
>>
>> Lakshmi.
>> -----Original Message-----
>> From: Mark Yacoub<markyacoub@chromium.org>  
>> Sent: Thursday, October 6, 2022 8:34 AM
>> To: Vudum, Lakshminarayana<lakshminarayana.vudum@intel.com>
>> Cc:igt-dev@lists.freedesktop.org;michel.daenzer@mailbox.org; Alex Hung<alex.hung@amd.com>
>> Subject: Re: [igt-dev] [PATCH][V3] tests/kms_plane_multiple: turn off pipe if all planes are off
>>
>> Hi Lakshminarayana, I have a feeling that this might be an intel bug - the code is pretty straightforward and works on amdpgu. we have a feeling that i915 might be missing something.
>>
>> On Mon, Oct 3, 2022 at 12:25 PM Alex Hung<alex.hung@amd.com>  wrote:
>>> Hi Mark,
>>>
>>> As expected, the rev 3 has kms_plane_multiple failures on CI.IGT
>>> unlike rev 2 which has "is_amdgpu_device()" on the first set_pipe, and
>>> the failures are as below. The first set_pipe required by amdgpu is
>>> not needed on all devices.
>>>
>>> (kms_plane_multiple:1581) igt_debugfs-CRITICAL: Test assertion failure
>>> function igt_pipe_crc_start, file
>>> ../../../usr/src/igt-gpu-tools/lib/igt_debugfs.c:884:
>>> (kms_plane_multiple:1581) igt_debugfs-CRITICAL: Failed assertion:
>>> pipe_crc->crc_fd != -1
>>> (kms_plane_multiple:1581) igt_debugfs-CRITICAL: Last errno: 5,
>>> Input/output error
>>>
>>> The Fi.CI.IGT results are available on
>>> https://patchwork.freedesktop.org/series/109086/
>>>
>>>
>>> On 2022-09-29 14:06, Alex Hung wrote:
>>>> amdgpu rejects when crtc is on + all planes are off, and it is
>>>> necessary to turn off crtc when all planes are off in the subtest
>>>> "tiling-none".
>>>>
>>>> This is revised fromhttps://patchwork.freedesktop.org/series/80904/
>>>>
>>>> Signed-off-by: Alex Hung<alex.hung@amd.com>
>>>> ---
>>>> V2 - remove second is_amdgpu_device() before setting PIPE_NONE
>>>>
>>>> V3 - remove both is_amdgpu_device() before setting PIPE_NONE
>>>>
>>>>    tests/kms_plane_multiple.c | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
>>>> index cbe8c189..6c0bc36d 100644
>>>> --- a/tests/kms_plane_multiple.c
>>>> +++ b/tests/kms_plane_multiple.c
>>>> @@ -311,6 +311,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
>>>>                for_each_plane_on_pipe(&data->display, pipe, plane)
>>>>                        igt_plane_set_fb(plane, NULL);
>>>>
>>>> +             igt_output_set_pipe(output, PIPE_NONE);
>>>>                igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>>>
>>>>                for (int x = 0; x < c; x++) @@ -344,6 +345,7 @@
>>>> test_plane_position_with_output(data_t *data, enum pipe pipe,
>>>>                for_each_plane_on_pipe(&data->display, pipe, plane)
>>>>                        igt_plane_set_fb(plane, NULL);
>>>>
>>>> +             igt_output_set_pipe(output, PIPE_NONE);
>>>>                igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>>>
>>>>                for (int x = 0; x < c; x++)
> 
> 
