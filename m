Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B127210E979
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 15:44:32 +0000 (UTC)
Message-ID: <e7032221-a412-c8e5-a9c6-2b985d4dbcaa@amd.com>
Date: Tue, 27 Sep 2022 09:44:28 -0600
Content-Language: en-US
To: Mark Yacoub <markyacoub@chromium.org>
References: <20220926214933.4077592-1-alex.hung@amd.com>
 <CAJUqKUr+oP3ROrXE+xcY4ZQ5er6eZMp1uSBHmWdd-43CteZHoQ@mail.gmail.com>
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <CAJUqKUr+oP3ROrXE+xcY4ZQ5er6eZMp1uSBHmWdd-43CteZHoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_plane_multiple: turn off pipe if
 all planes are off
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



On 2022-09-27 08:56, Mark Yacoub wrote:
> On Mon, Sep 26, 2022 at 5:50 PM Alex Hung <alex.hung@amd.com> wrote:
>>
>> amdgpu rejects when crtc is on + all planes are off, and it
>> is necessary to turn off crtc when all planes are off.
>>
>> This is revised from https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F80904%2F&amp;data=05%7C01%7Calex.hung%40amd.com%7C42618d56e1f7423320c108daa0988584%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637998874185935073%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=nrAwP%2BwX5rS9u6BgNPp5jCKcpIrii63j6qap06QU8gU%3D&amp;reserved=0
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> ---
>>   tests/kms_plane_multiple.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
>> index cbe8c189..6ebde8b0 100644
>> --- a/tests/kms_plane_multiple.c
>> +++ b/tests/kms_plane_multiple.c
>> @@ -311,6 +311,8 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
>>                  for_each_plane_on_pipe(&data->display, pipe, plane)
>>                          igt_plane_set_fb(plane, NULL);
>>
>> +               if (is_amdgpu_device(data->drm_fd))
> what if we apply it for everyone else?

It causes the kms_plane_multiple to fail on an i915 system. I don't have 
other non-AMD devices to test.

>> +                       igt_output_set_pipe(output, PIPE_NONE);
>>                  igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>
>>                  for (int x = 0; x < c; x++)
>> @@ -344,6 +346,8 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
>>                  for_each_plane_on_pipe(&data->display, pipe, plane)
>>                          igt_plane_set_fb(plane, NULL);
>>
>> +               if (is_amdgpu_device(data->drm_fd))
> ditto - would it hurt?

This seems to be okay to be removed on the i915 system I have. I can 
send a V2 later today to be verified on CI.

>> +                       igt_output_set_pipe(output, PIPE_NONE);
>>                  igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>
>>                  for (int x = 0; x < c; x++)
>> --
>> 2.34.1
>>
