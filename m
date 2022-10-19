Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2089.outbound.protection.outlook.com [40.107.96.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EA810E012
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Oct 2022 18:38:57 +0000 (UTC)
Message-ID: <1fa65573-b86c-3d59-bff4-e640eb6272f9@amd.com>
Date: Wed, 19 Oct 2022 14:38:51 -0400
Content-Language: en-US
To: juhapekka.heikkila@gmail.com, igt-dev@lists.freedesktop.org
References: <20221014184942.205868-1-aurabindo.pillai@amd.com>
 <b2631fef-ddca-e74d-cd8b-39f76fb4af7d@gmail.com>
 <80b537b3-07a8-c7ee-c0f3-5ff141720f78@amd.com>
 <8b174345-980e-eaad-6daa-b1f7e8683b0a@gmail.com>
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <8b174345-980e-eaad-6daa-b1f7e8683b0a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_cursor: Change API for
 collecting the CRC
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



On 2022-10-18 13:18, Juha-Pekka Heikkila wrote:
> On 18.10.2022 19.09, Aurabindo Pillai wrote:
>>
>>
>> On 2022-10-15 16:30, Juha-Pekka Heikkila wrote:
>>> On 14.10.2022 21.49, Aurabindo Pillai wrote:
>>>> On AMD hw, igt_pipe_crc_get_current() does not work correctly, but
>>>> igt_pipe_crc_collect_crc() does. The latter is more robust and reports
>>>> the expected crc. This is due to a delay of 2 frames in the hardware 
>>>> for
>>>> crc capture.
>>>>
>>>> The following diff is an alternate fix instead of changing the API:
>>>>
>>>> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
>>>> index fa1e3b69..dfcb2638 100644
>>>> --- a/lib/igt_debugfs.c
>>>> +++ b/lib/igt_debugfs.c
>>>> @@ -1061,6 +1061,10 @@ igt_pipe_crc_get_current(int drm_fd, 
>>>> igt_pipe_crc_t *pipe_crc, igt_crc_t *crc)
>>>>   {
>>>>          unsigned vblank = kmstest_get_vblank(drm_fd, 
>>>> pipe_crc->pipe, 0) + 1;
>>>>
>>>> +       /* AMD hw has an additional frame delay */
>>>> +       if (is_amdgpu_device(drm_fd))
>>>> +               vblank += 1;
>>>> +
>>>>          return igt_pipe_crc_get_for_frame(drm_fd, pipe_crc, vblank, 
>>>> crc);
>>>>   }
>>>>
>>>> Since the above solution adds device specific code into core IGT lib,
>>>> changing the API is a preferable solution.
>>>
>>> This sound like you are fixing driver bug in test suite. If pipe crc 
>>> doesn't match it mean rendered picture is wrong. If later crcs match 
>>> you're probably showing picture too early, I have no amd hw at hand 
>>> so I have no real idea what's going wrong.
>>
>> Looks like patchwork got confused. The hunk above is not part of the 
>> change and was just meant to show the underlying problem. Its either 
>> the above one, or the one below that fixes the issue.
>>
>> Since flipping and crc enablement happen asynchronously, more often 
>> than not -  we return an 'uncooked' crc on first frame probably 
>> because hw isn't ready yet. For this reason, we skip the first two CRC 
>> values. Its not a driver bug.
> 
> If crc enablement is where problem is coming from would correct place 
> for amd related special case then be at igt_pipe_crc_start() ?
> 
> If you look at that function you see also Intel hw need special handling 
> there with fifo underruns.

Here is the case that fails:

igt_pipe_crc_start()
igt_pipe_crc_get_current(ref_crc)
igt_pipe_crc_get_current(test_crc)
igt_pipe_crc_stop()

Once I change the API like in this patch, this sequence becomes:

igt_pipe_crc_start()
igt_pipe_crc_get_current(ref_crc)
igt_pipe_crc_stop()

igt_pipe_crc_start()
igt_pipe_crc_get_current(test_crc)
igt_pipe_crc_stop()

Since igt_pipe_crc_start() already calls an igt_pipe_crc_stop(), the 
openat syscall within igt_pipe_crc_start() is what helps in a pass, 
since inside the driver, we skip the first two CRCs when it's opened.

The subsequent calls to igt_pipe_crc_get_current() should technically be 
correct, without having to require additional frame delays. However, 
cursor updates aren't synchronized with our atomic code path with the 
same frame. It's possible that they get deferred to the next.

I think a proper fix would be to make the cursor programming an atomic 
update for AMDGPU, but that's not a trivial change. Someone else was 
working on this, though. Until that solution is ready, I'd like a device 
specific call to igt_pipe_crc_collect_crc() so that this test passes on 
AMD hw.

