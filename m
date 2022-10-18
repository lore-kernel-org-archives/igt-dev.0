Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF3210E283
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Oct 2022 16:09:56 +0000 (UTC)
Message-ID: <80b537b3-07a8-c7ee-c0f3-5ff141720f78@amd.com>
Date: Tue, 18 Oct 2022 12:09:52 -0400
To: juhapekka.heikkila@gmail.com, igt-dev@lists.freedesktop.org
References: <20221014184942.205868-1-aurabindo.pillai@amd.com>
 <b2631fef-ddca-e74d-cd8b-39f76fb4af7d@gmail.com>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <b2631fef-ddca-e74d-cd8b-39f76fb4af7d@gmail.com>
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



On 2022-10-15 16:30, Juha-Pekka Heikkila wrote:
> On 14.10.2022 21.49, Aurabindo Pillai wrote:
>> On AMD hw, igt_pipe_crc_get_current() does not work correctly, but
>> igt_pipe_crc_collect_crc() does. The latter is more robust and reports
>> the expected crc. This is due to a delay of 2 frames in the hardware for
>> crc capture.
>>
>> The following diff is an alternate fix instead of changing the API:
>>
>> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
>> index fa1e3b69..dfcb2638 100644
>> --- a/lib/igt_debugfs.c
>> +++ b/lib/igt_debugfs.c
>> @@ -1061,6 +1061,10 @@ igt_pipe_crc_get_current(int drm_fd, 
>> igt_pipe_crc_t *pipe_crc, igt_crc_t *crc)
>>   {
>>          unsigned vblank = kmstest_get_vblank(drm_fd, pipe_crc->pipe, 
>> 0) + 1;
>>
>> +       /* AMD hw has an additional frame delay */
>> +       if (is_amdgpu_device(drm_fd))
>> +               vblank += 1;
>> +
>>          return igt_pipe_crc_get_for_frame(drm_fd, pipe_crc, vblank, 
>> crc);
>>   }
>>
>> Since the above solution adds device specific code into core IGT lib,
>> changing the API is a preferable solution.
> 
> This sound like you are fixing driver bug in test suite. If pipe crc 
> doesn't match it mean rendered picture is wrong. If later crcs match 
> you're probably showing picture too early, I have no amd hw at hand so I 
> have no real idea what's going wrong.

Looks like patchwork got confused. The hunk above is not part of the 
change and was just meant to show the underlying problem. Its either the 
above one, or the one below that fixes the issue.

Since flipping and crc enablement happen asynchronously, more often than 
not -  we return an 'uncooked' crc on first frame probably because hw 
isn't ready yet. For this reason, we skip the first two CRC values. Its 
not a driver bug.

> 
>>
>> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
>> ---
>>   tests/kms_plane_cursor.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
>> index e9abfd78..e2a9e97b 100644
>> --- a/tests/kms_plane_cursor.c
>> +++ b/tests/kms_plane_cursor.c
>> @@ -150,8 +150,7 @@ static void test_cursor_pos(data_t *data, int x, 
>> int y, unsigned int flags)
>>       igt_plane_set_fb(data->cursor, NULL);
>>       igt_display_commit_atomic(&data->display, 0, NULL);
>> -    igt_pipe_crc_start(data->pipe_crc);
>> -    igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &ref_crc);
>> +    igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
> 
> This change would slow test down and on same go make it possible for 
> other drivers to get same problem on crcs with nobody noticing it. I'd 
> suggest instead of relaxing test to figure out why your crcs are not 
> matching.
Would you rather have the AMD specific quirks instead? This is from 
kms_rotation_crc:

  if (is_amdgpu_device(data->gfx_fd)) {
          igt_pipe_crc_collect_crc(
                  data->pipe_crc,
                  &data->crc_rect[data->output_crc_in_use][rect].flip_crc);
  } else {
          igt_pipe_crc_get_current(
                  display->drm_fd, data->pipe_crc,
                  &data->crc_rect[data->output_crc_in_use][rect].flip_crc);
          igt_remove_fb(data->gfx_fd, &data->fb_flip);
  }
