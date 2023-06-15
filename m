Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD31710E189
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jun 2023 08:30:02 +0000 (UTC)
Message-ID: <3038241b-6f6c-36df-ed51-aa809e3a1348@intel.com>
Date: Thu, 15 Jun 2023 13:58:43 +0530
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, "vitaly
 prosyak" <vprosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <igt-dev@lists.freedesktop.org>,
 <janga.rahul.kumar@intel.com>, David Zhang <dingchen.zhang@amd.com>, "Harry
 Wentland" <harry.wentland@amd.com>
References: <20230516165058.4047595-1-bhanuprakash.modem@intel.com>
 <20230516165058.4047595-6-bhanuprakash.modem@intel.com>
 <20230614123933.5aqzgq2f4y4hrn47@kamilkon-desk1>
 <fd7d8c65-d943-c7ca-2f4d-fc5a9ac7bbd9@amd.com>
 <a52493c8-85c3-6698-0dfa-71235eef9d86@intel.com>
 <ee20db45-ffde-2372-3b41-659f2ce7aa89@amd.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <ee20db45-ffde-2372-3b41-659f2ce7aa89@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 05/20] tests/amdgpu: Close the fd before exit
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



On Thu-15-06-2023 12:43 pm, Christian König wrote:
> Hi guys,
> 
> Am 15.06.23 um 06:46 schrieb Modem, Bhanuprakash:
>> Hi Vitaliy,
>>
>> On Thu-15-06-2023 05:44 am, vitaly prosyak wrote:
>>> Hi Kamil,
>>>
>>> Thanks for letting us know about new(?) function
>>> /drm_close_driver/.
>>>
>>> Is there a pending change, I could not find this function in the DRM 
>>> or IGT.
>>
>> Yes, changes are not yet landed into the IGT (WIP).
>>
>> Please refer Patch 1/20 in this series:
>> https://patchwork.freedesktop.org/patch/538070/?series=117263&rev=5
> 
> well neither this patch here nor the referenced series is correct.
> 
> The libdrm functions take ownership of the file descriptor given to them!
> 
> So the application or in this case IGT is *not* supposed to close them 
> at all.

Unfortunately, that is not correct.

The application (IGT in this case), opens the driver and uses the libdrm 
functions to perform operations (like ioctl), but file descriptor is 
still with the IGT only.

Once it is done with the operations performed, it's IGT responsibility 
to close the driver (I think there are few gcc options available to 
close the device on IGT exit)

A typical IGT sudo-code:

	fd = open(/dev/device);

	libdrm_call(fd);
	libdrm_call(fd);

	close(fd);

- Bhanu

> 
> Regards,
> Christian.
> 
>>
>> - Bhanu
>>
>>>
>>> We open the driver with /drm_open_driver/, but then we use close vs 
>>> /drm_close_driver/. I makes sense to have a symmetrical call:
>>> /open/close/ and /drm_open_driver/drm_close_driver/
>>>
>>>
>>> Thanks, Vitaly
>>>
>>> On 2023-06-14 08:39, Kamil Konieczny wrote:
>>>> Hi Bhanuprakash,
>>>>
>>>> +cc Vitaliy and Christian
>>>>
>>>> Cc: Vitaly Prosyak<vitaly.prosyak@amd.com>
>>>> Cc: Christian König<christian.koenig@amd.com>
>>>>
>>>> Regards,
>>>> Kamil
>>>>
>>>> On 2023-05-16 at 22:20:43 +0530, Bhanuprakash Modem wrote:
>>>>> Close the file descriptor before exiting the test.
>>>>>
>>>>> Cc: David Zhang<dingchen.zhang@amd.com>
>>>>> Cc: Harry Wentland<harry.wentland@amd.com>
>>>>> Signed-off-by: Bhanuprakash Modem<bhanuprakash.modem@intel.com>
>>>>> ---
>>>>>   tests/amdgpu/amd_abm.c                 | 1 +
>>>>>   tests/amdgpu/amd_assr.c                | 1 +
>>>>>   tests/amdgpu/amd_freesync_video_mode.c | 1 +
>>>>>   tests/amdgpu/amd_mem_leak.c            | 1 +
>>>>>   tests/amdgpu/amd_psr.c                 | 3 ++-
>>>>>   tests/amdgpu/amd_vrr_range.c           | 1 +
>>>>>   6 files changed, 7 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
>>>>> index 9400ed806..082da7ed6 100644
>>>>> --- a/tests/amdgpu/amd_abm.c
>>>>> +++ b/tests/amdgpu/amd_abm.c
>>>>> @@ -378,5 +378,6 @@ igt_main
>>>>>         igt_fixture {
>>>>>           igt_display_fini(&data.display);
>>>>> +        drm_close_driver(data.drm_fd);
>>>>>       }
>>>>>   }
>>>>> diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
>>>>> index 80cbbe8e9..fc2367f99 100644
>>>>> --- a/tests/amdgpu/amd_assr.c
>>>>> +++ b/tests/amdgpu/amd_assr.c
>>>>> @@ -299,5 +299,6 @@ igt_main
>>>>>       igt_fixture
>>>>>       {
>>>>>           igt_display_fini(&data.display);
>>>>> +        drm_close_driver(data.fd);
>>>>>       }
>>>>>   }
>>>>> diff --git a/tests/amdgpu/amd_freesync_video_mode.c 
>>>>> b/tests/amdgpu/amd_freesync_video_mode.c
>>>>> index 579d24436..62d42a06c 100644
>>>>> --- a/tests/amdgpu/amd_freesync_video_mode.c
>>>>> +++ b/tests/amdgpu/amd_freesync_video_mode.c
>>>>> @@ -868,5 +868,6 @@ igt_main
>>>>>         igt_fixture {
>>>>>           igt_display_fini(&data.display);
>>>>> +        drm_close_driver(data.drm_fd);
>>>>>       }
>>>>>   }
>>>>> diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
>>>>> index dee563cbe..e4a4b5c47 100644
>>>>> --- a/tests/amdgpu/amd_mem_leak.c
>>>>> +++ b/tests/amdgpu/amd_mem_leak.c
>>>>> @@ -232,5 +232,6 @@ igt_main
>>>>>       igt_fixture
>>>>>       {
>>>>>           igt_display_fini(&data.display);
>>>>> +        drm_close_driver(data.fd);
>>>>>       }
>>>>>   }
>>>>> diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
>>>>> index 966a0dccf..3932e143a 100644
>>>>> --- a/tests/amdgpu/amd_psr.c
>>>>> +++ b/tests/amdgpu/amd_psr.c
>>>>> @@ -640,7 +640,7 @@ static void run_check_psr_su_cursor(data_t 
>>>>> *data, bool test_mpo)
>>>>>        * panning the primary plane at the top-left of screen
>>>>>        * set alpha region in overlay plane and set alpha to 0.0 to 
>>>>> show primary plane
>>>>>        * set cursor plane and starting from position of (0, 0)
>>>>> -     */
>>>>> +     */
>>>>>       draw_color_alpha(&data->ov_fb[0], 0, 0, data->pfb_w, 
>>>>> data->pfb_h, 1.0, 1.0, 1.0, .0);
>>>>>       igt_plane_set_fb(data->primary, &data->pm_fb[0]);
>>>>>       igt_plane_set_fb(data->overlay, &data->ov_fb[0]);
>>>>> @@ -763,5 +763,6 @@ igt_main_args("", long_options, help_str, 
>>>>> opt_handler, NULL)
>>>>>           }
>>>>>           close(data.debugfs_fd);
>>>>>           igt_display_fini(&data.display);
>>>>> +        drm_close_driver(data.fd);
>>>>>       }
>>>>>   }
>>>>> diff --git a/tests/amdgpu/amd_vrr_range.c 
>>>>> b/tests/amdgpu/amd_vrr_range.c
>>>>> index 2f27296dd..cacd668cd 100644
>>>>> --- a/tests/amdgpu/amd_vrr_range.c
>>>>> +++ b/tests/amdgpu/amd_vrr_range.c
>>>>> @@ -338,5 +338,6 @@ igt_main
>>>>>       igt_fixture
>>>>>       {
>>>>>           igt_display_fini(&data.display);
>>>>> +        drm_close_driver(data.fd);
>>>>>       }
>>>>>   }
>>>>> -- 
>>>>> 2.40.0
>>>>>
> 
