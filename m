Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E567210E28F
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Mar 2022 21:00:20 +0000 (UTC)
Message-ID: <5d361e23-378d-def4-aa28-647ff82dab32@quicinc.com>
Date: Thu, 24 Mar 2022 14:00:18 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Mark Yacoub <markyacoub@chromium.org>
References: <1648151791-16202-1-git-send-email-quic_abhinavk@quicinc.com>
 <CAJUqKUp108BWzkVVBcy1yp1Hc0DqqSmq_dQ39Q3=bLRbKRwWug@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAJUqKUp108BWzkVVBcy1yp1Hc0DqqSmq_dQ39Q3=bLRbKRwWug@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_concurrent: check if second
 primary plane is valid
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, swboyd@chromium.org, igt-dev@lists.freedesktop.org,
 nganji@codeaurora.org, seanpaul@chromium.org, quic_aravindh@quicinc.com,
 quic_khsieh@quicinc.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 3/24/2022 1:56 PM, Mark Yacoub wrote:
> On Thu, Mar 24, 2022 at 3:57 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> prepare_planes() in kms_concurrent loops through the list
>> of planes and assigns them to the data->plane array.
>>
>> During this assignment, it skips planes which are of type
>> DRM_PLANE_TYPE_PRIMARY as they are assigned separately.
>>
>> However, only one primary plane is assigned and prepared for
>> the test.
> do you not need the other primary plane to be assigned and prepared
> for the test?

I am just fixing the current behavior of the test which is prepare one 
primary plane and rest of the overlay planes before the commit.

This was broken without this change.

If we want to change the behavior of the test to prepare multiple 
primary planes and rest of the overlay planes, that would be a separate 
change in my opinion.

Let me know what you think.

Thanks

Abhinav
>>
>> This causes an issue later on in the test when there are
>> multiple primary planes as the second one is not added
>> to the data->plane list causing a segmentation fault
>> when trying to access the second primary plane.
>>
>> Check if the data->plane is valid before accessing its
>> members to fix this crash.
>>
>> This fixes the crash and makes kms_concurrent pass on devices
>> having multiple primary planes.
>>
>> localhost /usr/local/libexec/igt-gpu-tools # ./kms_concurrent
>> IGT-Version: 1.26-NO-GIT (arm) (Linux: 5.17.0-rc2-lockdep-75821-g6200d34d858f aarch64)
>> Starting subtest: pipe-A
>> Testing resolution with connector eDP-1 using pipe A with seed 1648151339
>> Subtest pipe-A: SUCCESS (0.429s)
>> Starting subtest: pipe-B
>> Testing resolution with connector eDP-1 using pipe B with seed 1648151340
>> Subtest pipe-B: SUCCESS (0.592s)
>> Test requirement not met in function igt_require_pipe, file ../igt-gpu-tools-9999/lib/igt_kms.c:2135:
>> Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
>> Pipe C does not exist or not enabled
>> Subtest pipe-C: SKIP
>> Test requirement not met in function igt_require_pipe, file ../igt-gpu-tools-9999/lib/igt_kms.c:2135:
>> Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
>> Pipe D does not exist or not enabled
>> Subtest pipe-D: SKIP
>> Test requirement not met in function igt_require_pipe, file ../igt-gpu-tools-9999/lib/igt_kms.c:2135:
>> Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
>> Pipe E does not exist or not enabled
>> Subtest pipe-E: SKIP
>> Test requirement not met in function igt_require_pipe, file ../igt-gpu-tools-9999/lib/igt_kms.c:2135:
>> Test requirement: !(pipe >= display->n_pipes || !display->pipes[pipe].enabled)
>> Pipe F does not exist or not enabled
>> Subtest pipe-F: SKIP
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   tests/kms_concurrent.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
>> index 1b8f4b0..9cbeec4 100644
>> --- a/tests/kms_concurrent.c
>> +++ b/tests/kms_concurrent.c
>> @@ -116,7 +116,7 @@ create_fb_for_mode_position(data_t *data, drmModeModeInfo *mode,
>>                          0.0f, 0.0f, 1.0f);
>>
>>          for (int i = 0; i < max_planes; i++) {
>> -               if (data->plane[i]->type == DRM_PLANE_TYPE_PRIMARY)
>> +               if (data->plane[i] && data->plane[i]->type == DRM_PLANE_TYPE_PRIMARY)
>>                          continue;
>>
>>                  igt_paint_color(cr, rect_x[i], rect_y[i],
>> --
>> 2.7.4
>>
