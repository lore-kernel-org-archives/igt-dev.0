Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A2110F59E
 for <igt-dev@lists.freedesktop.org>; Mon,  2 May 2022 22:31:30 +0000 (UTC)
Message-ID: <054e3a77-fbfd-1526-088b-18cd120a0c7d@quicinc.com>
Date: Mon, 2 May 2022 15:31:29 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Rob Clark <robdclark@chromium.org>
References: <20220429011117.147-1-quic_jesszhan@quicinc.com>
 <CAJs_Fx7ccyWrdnCDMM8Ayj-jwOZ6BLgAM9hsXk2r+9QHD_gjqw@mail.gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CAJs_Fx7ccyWrdnCDMM8Ayj-jwOZ6BLgAM9hsXk2r+9QHD_gjqw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v1] tests/kms_universal_plane: Skip
 pageflip_test_pipe subtest if pipe has more than 1 primary plane
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, quic_aravindh@quicinc.com,
 petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 5/2/2022 2:50 PM, Rob Clark wrote:
> On Thu, Apr 28, 2022 at 6:11 PM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>> Currently, IGT assumes that the first primary plane it encounters in
>> display->planes is the primary plane being assigned to the current pipe
>> in the driver [1]. However, this is not always the case when planes are
>> being shared between pipes and there are multiple possible primary
>> planes.
> 
> I wonder if it is actually worse than that.. igt_pipe_t seems designed
> around the idea that CRTCs have exclusive ownership of planes.  Not
> sure if there are any tests that drive multiple CRTCs at the same
> time, which could end up trying to use the same plane on multiple
> pipes..
> 
> BR,
> -R
Yep, there are at least a few cases in kms_atomic_transition where, with 
DP connected, IGT will try to do a commit for 2 CRTCs within the same 
commit [1]. Planning to submit a patch addressing that after we sort out 
the shared planes-related failures for the no DP case.

(BTW, to elaborate some more on the issue we were facing with this 
subtest on trogdor: an -EBUSY was being thrown from the page flip ioctl 
[2] because we were assigning an fb to an unused primary plane.)

Best,

Jessica Zhang

[1] 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_atomic_transition.c#L709 
(note: `mask` in this method is a mask for which CRTC to commit to, and 
with DP connected it can go up to 3)

[2] 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/ed944b45563c694dc6373bc48dc83b8ba7edb19f

> 
>> It's possible for IGT to set pipe->plane_primary to a primary plane
>> that's different from the one being used in the driver, since IGT uses
>> possible_crtcs to find the primary planes and stops at the first match.
>>
>> Unfortunately, DRM doesn't expose which primary plane is being used by a
>> pipe, so let's skip pageflip_test_pipe for cases where there are
>> multiple possible primary planes.
>>
>> [1]
>> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/lib/igt_kms.c#L2305
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   tests/kms_universal_plane.c | 14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
>> index 3cb6d704a6ef..95cae2be1aaf 100644
>> --- a/tests/kms_universal_plane.c
>> +++ b/tests/kms_universal_plane.c
>> @@ -470,13 +470,25 @@ static void
>>   pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>>   {
>>          pageflip_test_t test = { .data = data };
>> -       igt_plane_t *primary;
>> +       igt_plane_t *primary, *plane;
>>          struct timeval timeout = { .tv_sec = 0, .tv_usec = 500 };
>>          drmEventContext evctx = { .version = 2 };
>>
>>          fd_set fds;
>> +       int primary_plane_count = 0;
>>          int ret = 0;
>>
>> +       for_each_plane_on_pipe(&data->display, pipe, plane)
>> +               if (plane->type == DRM_PLANE_TYPE_PRIMARY)
>> +                       primary_plane_count++;
>> +
>> +       /*
>> +        * Skip subtest when there are multiple primary planes since we
>> +        * aren't able to distinguish which primary plane is actually being
>> +        * assigned a pipe
>> +        */
>> +       igt_skip_on(primary_plane_count > 1);
>> +
>>          igt_require_pipe(&data->display, pipe);
>>
>>          igt_output_set_pipe(output, pipe);
>> --
>> 2.31.0
>>
