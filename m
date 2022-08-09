Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEDA1123BC
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Aug 2022 16:45:53 +0000 (UTC)
Message-ID: <e3235f5f-3dc1-0d06-4a40-f5261446e558@intel.com>
Date: Tue, 9 Aug 2022 22:15:29 +0530
Content-Language: en-US
To: <juhapekka.heikkila@gmail.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>,
 <petri.latvala@intel.com>
References: <20220726031116.974261-1-bhanuprakash.modem@intel.com>
 <4330ad72-d7b5-80eb-0236-83944fd6f063@intel.com>
 <210664fd-359a-4700-c540-3d81981e04b3@gmail.com>
 <88fa1fed-4922-7aa4-d78b-5ebc4fcceabf@intel.com>
 <12059b48-fd05-36db-e669-86cb576fd8a4@gmail.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <12059b48-fd05-36db-e669-86cb576fd8a4@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] tests/kms_cursor_crc: Drop max-size test
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

On Tue-09-08-2022 09:01 pm, Juha-Pekka Heikkila wrote:
> On 9.8.2022 18.08, Modem, Bhanuprakash wrote:
>> On Tue-09-08-2022 08:06 pm, Juha-Pekka Heikkila wrote:
>>> On 27.7.2022 21.42, Sharma, Swati2 wrote:
>>>> LGTM
>>>> Reviewed-by:  Swati Sharma <swati2.sharma@intel.com>
>>>>
>>>> On 26-Jul-22 8:41 AM, Bhanuprakash Modem wrote:
>>>>> As we already covering it by the other tests, there is no point in
>>>>> doing the "max-size" test. Hence dropping it.
>>>
>>> This doesn't look correct.
>>>
>>>>>
>>>>> This patch will also do some cleanup to avoid skips in igt_dynamic.
>>>>>
>>>>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>>> ---
>>>>>   tests/kms_cursor_crc.c | 47 
>>>>> ++++++++++++++++++++----------------------
>>>>>   1 file changed, 22 insertions(+), 25 deletions(-)
>>>>>
>>>>> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
>>>>> index f07a045a..14d4c4ca 100644
>>>>> --- a/tests/kms_cursor_crc.c
>>>>> +++ b/tests/kms_cursor_crc.c
>>>>> @@ -576,7 +576,7 @@ static void test_cursor_opaque(data_t *data)
>>>>>       test_cursor_alpha(data);
>>>>>   }
>>>>> -static void require_cursor_size(data_t *data, int w, int h)
>>>>> +static bool require_cursor_size(data_t *data, int w, int h)
>>>>>   {
>>>>>       igt_fb_t primary_fb;
>>>>>       drmModeModeInfo *mode;
>>>>> @@ -618,14 +618,11 @@ static void require_cursor_size(data_t *data, 
>>>>> int w, int h)
>>>>>       igt_remove_fb(data->drm_fd, &primary_fb);
>>>>>       igt_output_set_pipe(output, PIPE_NONE);
>>>>> -    igt_skip_on_f(ret, "Cursor size %dx%d not supported by 
>>>>> driver\n", w, h);
>>>>> +    return !!ret;
>>>>>   }
>>>>>   static void run_test(data_t *data, void (*testfunc)(data_t *), 
>>>>> int cursor_w, int cursor_h)
>>>>>   {
>>>>> -    if (data->fb.fb_id != 0)
>>>>> -        require_cursor_size(data, cursor_w, cursor_h);
>>>>> -
>>>>>       prepare_crtc(data, cursor_w, cursor_h);
>>>>>       testfunc(data);
>>>>>       cleanup_crtc(data);
>>>>> @@ -696,24 +693,15 @@ static void run_size_tests(data_t *data, void 
>>>>> (*testfunc)(data_t *),
>>>>>       char name[32];
>>>>>       enum pipe pipe;
>>>>> -    if (w == 0 && h == 0)
>>>>> -        strcpy(name, "max-size");
>>>>> -    else
>>>>> -        snprintf(name, sizeof(name), "%dx%d", w, h);
>>>>> -
>>>>> -    if (w == 0 && h == 0) {
>>>>> -        w = data->cursor_max_w;
>>>>> -        h = data->cursor_max_h;
>>>>> -        /*
>>>>> -         * No point in doing the "max-size" test if
>>>>> -         * it was already covered by the other tests.
>>>>> -         */
>>>>> -        igt_require_f(w != h || w > 512 || h > 512 ||
>>>>> -                  !is_power_of_two(w) || !is_power_of_two(h),
>>>>> -                  "Cursor max size %dx%d already covered by other 
>>>>> tests\n",
>>>>> -                  w, h);
>>>
>>> Reading from above, for cursor maximum size if any of:
>>>
>>> * width is not equal to height
>>> * width > 512 or height > 512
>>> * (width & (width - 1)) != 0 or (height & (height - 1)) != 0
>>>
>>> then maximum cursor size was not covered by any other test. You can 
>>> see from where run_size_tests is called why these conditions.
>>
>>  From the called function, max cursor size is configured as 64x64. So 
>> the condition for igt_require_f() isn't met (all above mentioned 
>> conditions were failed), means 64x64 is already covered.
>>
>> igt_main() {
>>   867         uint64_t cursor_width = 64, cursor_height = 64;
>>
>>   887         data.cursor_max_w = cursor_width;
>>   888         data.cursor_max_h = cursor_height;
>> }
>>
> 
> Between those lines you pasted there's these lines where cursor size is 
> asked from kernel:
> 
> 876 ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_WIDTH, &cursor_width);
> 879 ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_HEIGHT, &cursor_height);
> 
> That initially set default value of 64 is coming from drm, you can see 
> from drm_ioctl.c on kernel side why 64. 64 is not what most drivers give 
> and also i915 support larger cursor size than 64x64.

Got it, thanks for the explanation. I'll float a patch to revert this.

- Bhanu

> 
> /Juha-Pekka
> 
> 
>>>>> -    }
>>>>> +    snprintf(name, sizeof(name), "%dx%d", w, h);
>>>>> +
>>>>>       create_cursor_fb(data, w, h);
>>>>> +    if (require_cursor_size(data, w, h)) {
>>>>> +        igt_debug("Cursor size %dx%d not supported by driver\n", 
>>>>> w, h);
>>>>> +
>>>>> +        igt_remove_fb(data->drm_fd, &data->fb);
>>>>> +        return;
>>>>> +    }
>>>>>       for_each_pipe(&data->display, pipe) {
>>>>>           data->pipe = pipe;
>>>>> @@ -807,6 +795,12 @@ static void run_tests_on_pipe(data_t *data)
>>>>>               data->pipe = pipe;
>>>>>               data->flags = TEST_DPMS;
>>>>> +            if (require_cursor_size(data, data->cursor_max_w, 
>>>>> data->cursor_max_h)) {
>>>>> +                igt_debug("Cursor size %dx%d not supported by 
>>>>> driver\n",
>>>>> +                      data->cursor_max_w, data->cursor_max_h);
>>>>> +                continue;
>>>>> +            }
>>>>> +
>>>>>               igt_dynamic_f("pipe-%s-%s",
>>>>>                         kmstest_pipe_name(pipe),
>>>>>                         data->output->name)
>>>>> @@ -822,6 +816,12 @@ static void run_tests_on_pipe(data_t *data)
>>>>>               data->pipe = pipe;
>>>>>               data->flags = TEST_SUSPEND;
>>>>> +            if (require_cursor_size(data, data->cursor_max_w, 
>>>>> data->cursor_max_h)) {
>>>>> +                igt_debug("Cursor size %dx%d not supported by 
>>>>> driver\n",
>>>>> +                      data->cursor_max_w, data->cursor_max_h);
>>>>> +                continue;
>>>>> +            }
>>>>> +
>>>>>               igt_dynamic_f("pipe-%s-%s",
>>>>>                         kmstest_pipe_name(pipe),
>>>>>                         data->output->name)
>>>>> @@ -855,9 +855,6 @@ static void run_tests_on_pipe(data_t *data)
>>>>>                       igt_subtest_group
>>>>>                           run_size_tests(data, 
>>>>> size_tests[i].testfunc, w, h);
>>>>>                   }
>>>>> -
>>>>> -                igt_subtest_group
>>>>> -                    run_size_tests(data, size_tests[i].testfunc, 
>>>>> 0, 0);
>>>>>               }
>>>>>           }
>>>>>       }
>>>>
>>>
>>
> 
