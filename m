Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DDB10E033
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Aug 2022 18:21:31 +0000 (UTC)
Message-ID: <38cc4ab5-d313-3375-1692-6121c96394ac@amd.com>
Date: Thu, 25 Aug 2022 12:21:23 -0600
Content-Language: en-US
To: Mark Yacoub <markyacoub@chromium.org>
References: <20220825012401.2753758-1-alex.hung@amd.com>
 <CAJUqKUqcQj-TTR0K_J=D=5PhvkburXJXbaqoFfF93k8_=U7JLA@mail.gmail.com>
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <CAJUqKUqcQj-TTR0K_J=D=5PhvkburXJXbaqoFfF93k8_=U7JLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_concurrent: remove an AMD device
 check
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



On 2022-08-25 08:37, Mark Yacoub wrote:
> On Thu, Aug 25, 2022 at 3:54 AM Alex Hung <alex.hung@amd.com> wrote:
>>
>> This is to be deprecated by a kernel fix.
> Can you link the kernel commit for reference

The kernel and IGT patches are inter-dependent. This patch is required 
to avoid regression from kernel testing and that's the reason I 
submitted IGT patch first.

>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> ---
>>   tests/kms_concurrent.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
>> index 6f8ffd4a..3ad51569 100644
>> --- a/tests/kms_concurrent.c
>> +++ b/tests/kms_concurrent.c
>> @@ -276,8 +276,6 @@ test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_ou
>>                  /* switch to lower resolution */
>>                  igt_output_override_mode(output, mode_lo);
>>                  free(mode_lo);
>> -               if (is_amdgpu_device(data->drm_fd))
>> -                       igt_output_set_pipe(output, PIPE_NONE);
>>                  igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>
>>                  /* switch back to higher resolution */
>> --
>> 2.37.2
>>
