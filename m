Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9CF10E1B2
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 16:24:28 +0000 (UTC)
Message-ID: <79b26f0a-8e25-dcbf-91d4-ccd785f93167@amd.com>
Date: Wed, 28 Sep 2022 10:24:22 -0600
Content-Language: en-US
To: Mark Yacoub <markyacoub@chromium.org>
References: <20220927193512.447146-1-alex.hung@amd.com>
 <CAJUqKUqvSE=3TUZaoxmKiZBbw7r9cbSp_2GFQ+i8M4oih4BUJA@mail.gmail.com>
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <CAJUqKUqvSE=3TUZaoxmKiZBbw7r9cbSp_2GFQ+i8M4oih4BUJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH][V2] tests/kms_plane_multiple: turn off pipe
 if all planes are off
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 2022-09-28 08:17, Mark Yacoub wrote:
> is the second fix not necessary anymore?
> 

The second fix is still needed but it does not need to be guarded by 
is_amdgpu_device().

 From IGT's CI test this seems to work fine.

> On Tue, Sep 27, 2022 at 3:36 PM Alex Hung <alex.hung@amd.com> wrote:
>>
>> amdgpu rejects when crtc is on + all planes are off, and it
>> is necessary to turn off crtc when all planes are off.
>>
>> This is revised from https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F80904%2F&amp;data=05%7C01%7Calex.hung%40amd.com%7C9618c44c52534176fa7608daa15c3b0e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637999714757526450%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=F%2FJ0xvZA1mpVrmuEimtMYUIXolalP9GG9NUGjfRepR0%3D&amp;reserved=0
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> ---
>>   tests/kms_plane_multiple.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
>> index cbe8c189..e900dc7f 100644
>> --- a/tests/kms_plane_multiple.c
>> +++ b/tests/kms_plane_multiple.c
>> @@ -311,6 +311,8 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
>>                  for_each_plane_on_pipe(&data->display, pipe, plane)
>>                          igt_plane_set_fb(plane, NULL);
>>
>> +               if (is_amdgpu_device(data->drm_fd))
>> +                       igt_output_set_pipe(output, PIPE_NONE);
> I'm still confused why do you need this just for AMD. If AMD has some
> requirements, I think it's gonna work for everyone else. If it breaks
> in the CI (testing on intel devices), then I think something is off
> here, and maybe it's a kernel thing.
> If it's the crtc/plan workaround that's in amdgpu, an IGT fix has
> always worked for everyone and didn't need an (is amd only) check.

It may not be for AMD only and can also work for other GPUs. See 
discussion 
https://lore.kernel.org/all/604a1d7e-1cd9-ad27-6d37-2e8535ce253b@mailbox.org/T/#m03b3196cbebcd85013b04f8e9bca3b130e4557d1

Without is_amdgpu_device() it breaks at least one i915 device. In theory 
"is_amdgpu_device()" can be replaced by "!is_i915_device()" but this 
patch was not tested on other GPUs so I did not assume that it works on 
all other GPUs.

>>                  igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>
>>                  for (int x = 0; x < c; x++)
>> @@ -344,6 +346,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
>>                  for_each_plane_on_pipe(&data->display, pipe, plane)
>>                          igt_plane_set_fb(plane, NULL);
>>
>> +               igt_output_set_pipe(output, PIPE_NONE);
>>                  igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>
>>                  for (int x = 0; x < c; x++)
>> --
>> 2.34.1
>>
