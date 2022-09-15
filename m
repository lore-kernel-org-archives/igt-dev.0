Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DB410E28D
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Sep 2022 20:08:04 +0000 (UTC)
Message-ID: <62042f8d-0314-96d1-e799-131c4e57f35c@quicinc.com>
Date: Thu, 15 Sep 2022 13:07:57 -0700
MIME-Version: 1.0
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <juhapekka.heikkila@gmail.com>
References: <20220914225800.3850-1-quic_jesszhan@quicinc.com>
 <f3ffbe22-8054-e51b-5aef-c2d30bd4f767@gmail.com>
 <a2a6cded-a8b3-dc60-6900-404b7a66efa8@quicinc.com>
In-Reply-To: <a2a6cded-a8b3-dc60-6900-404b7a66efa8@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v1] tests/kms_cursor_crc: Wait extra
 vblank
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, igt-dev@lists.freedesktop.org,
 petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 9/15/2022 12:58 PM, Jessica Zhang wrote:
> Hi Juha-Pekka
> 
> On 9/15/2022 11:02 AM, Juha-Pekka Heikkila wrote:
>> Hi Jessica,
>>
>> On 15.9.2022 1.58, Jessica Zhang wrote:
>>> Wait an extra vblank for legacy cursor ioctl to finish.
>>>
>>> Extra vblank wait is needed for both HW and SW test as the legacy cursor
>>> ioctl is called in both cases.
>>>
>>> Based on Rob's patch [1] and, similarly, fixes flaky results on MSM.
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>
>>> [1] https://patchwork.freedesktop.org/series/105999/
>>> ---
>>>   tests/kms_cursor_crc.c | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
>>> index 53f18f4f1add..272dcb7fa0a4 100644
>>> --- a/tests/kms_cursor_crc.c
>>> +++ b/tests/kms_cursor_crc.c
>>> @@ -202,8 +202,8 @@ static void do_single_test(data_t *data, int x, 
>>> int y, bool hw_test,
>>>           igt_display_commit(display);
>>>           /* Extra vblank wait is because nonblocking cursor ioctl */
>>> -        igt_wait_for_vblank(data->drm_fd,
>>> -                display->pipes[data->pipe].crtc_offset);
>>> +        igt_wait_for_vblank_count(data->drm_fd,
>>> +                display->pipes[data->pipe].crtc_offset, 2);
>>
>> It will take more than one frame on your target device for non 
>> blocking cursor commit to settle? This cannot be right, even if this 
>> somehow was the case you are breaking this test for everyone else.
> 
> As stated in Rob's original patch [1]:
> 
> "if the cursor update comes too close to vblank,
> it could end up being scheduled for the *following* vblank to avoid
> blocking"
> 
> In the case that the cursor commit is scheduled for the next vblank 
> (let's call it vblank n + 1), the CRC value will be updated in the 
> *following* that vblank (so, vblank n + 2) because the CRC value in MSM 
> updates in the following vblank after a commit [2].

*"... in the vblank *following* that vblank ..."

> 
> Basically, since we're using CRC to validate, we should wait 2 vblanks 
> to get the CRC value that matches the frame where the cursor is 
> committed due to the possibility that the cursor update might come in 
> the next vblank.
> 
> [1] https://patchwork.freedesktop.org/patch/492589/?series=105999&rev=1
> 
> [2] 
> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c#L591
> 
>>
>>>           igt_pipe_crc_get_current(data->drm_fd, pipe_crc, hwcrc);
>>> @@ -243,8 +243,8 @@ static void do_single_test(data_t *data, int x, 
>>> int y, bool hw_test,
>>>           igt_plane_set_fb(data->primary, &data->primary_fb[swbufidx]);
>>>           igt_display_commit(display);
>>> -        igt_wait_for_vblank(data->drm_fd,
>>> -                display->pipes[data->pipe].crtc_offset);
>>> +        igt_wait_for_vblank_count(data->drm_fd,
>>> +                display->pipes[data->pipe].crtc_offset, 2);
>>
>> This change make even less sense to me than above. There's nothing 
>> cursor plane related on this part of test. You are saying flipping 
>> normal framebuffers on non cursor plane take also more than one frame 
>> on your target device? It sound like vblank counting is somehow broken 
>> on your target device if these changes together fix something.
> 
> 2 cursor mode ioctls are actually called during the igt_display_commit 
> here. This is because before a SW test is run, disable_cursor is called 
> ([1], for example). This will just set the FB to NULL and position to 
> (0, 0) on IGT side and the following commit (which is the 
> igt_display_commit called here) will then call drmModeSetCursor and 
> drmModeMoveCursor [2] to disable the cursor plane + reset position on 
> driver side.
> 
> So, like with the HW test, we should wait for 2 vblanks to get the 
> corresponding CRC value.
> 
> Thanks,
> 
> Jessica Zhang
> 
> [1] 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_cursor_crc.c#L561
> 
> [2] 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/lib/igt_kms.c#L3239
> 
>>
>> /Juha-Pekka
>>
>>>           igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
>>>           igt_assert_crc_equal(&crc, hwcrc);
>>
