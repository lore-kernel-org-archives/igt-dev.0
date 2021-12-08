Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E166EA49
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Dec 2021 17:00:41 +0000 (UTC)
Message-ID: <44a38f7c-517c-2f24-81e2-21724be1b963@quicinc.com>
Date: Wed, 8 Dec 2021 09:00:35 -0800
MIME-Version: 1.0
Content-Language: en-US
References: <1638907980-25938-1-git-send-email-quic_abhinavk@quicinc.com>
 <CAJUqKUrJvQL9txiOmWcEHNsLcwy2WozS4ZFThs11mbpSNhhXWA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAJUqKUrJvQL9txiOmWcEHNsLcwy2WozS4ZFThs11mbpSNhhXWA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2] lib/igt_fb: fix the plane_size array
 for yuv formats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: petri.latvala@intel.com, quic_khsieh@quicinc.com, swboyd@chromium.org, igt-dev@lists.freedesktop.org, nganji@codeaurora.org, seanpaul@chromium.org, aravindh@codeaurora.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mark

On 12/8/2021 7:43 AM, Mark Yacoub wrote:
> On Tue, Dec 7, 2021 at 3:13 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> clear_yuv_buffer() checks the size of the plane_size[] to
>> make sure its greater than the number of planes to avoid
>> overflows.
>>
>> The plane_size[] is fixed to two currently.
>>
>> However some of the formats like YV12 indeed have more than
>> 2 planes in the format_desc[] hence this incorrectly failing
>> this check.
>>
>> Increase the size of the plane_size[] to match the correct
>> max number of planes.
>>
>> changes in v2:
>>          - use dynamic plane_size allocation
>>          - change clear_yuv_buffer to support 3 plane formats
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   lib/igt_fb.c | 23 +++++++++++++++++++++--
>>   1 file changed, 21 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>> index 92a0170..b775b44 100644
>> --- a/lib/igt_fb.c
>> +++ b/lib/igt_fb.c
>> @@ -1007,15 +1007,19 @@ static void memset64(uint64_t *s, uint64_t c, size_t n)
>>   static void clear_yuv_buffer(struct igt_fb *fb)
>>   {
>>          bool full_range = fb->color_range == IGT_COLOR_YCBCR_FULL_RANGE;
>> -       size_t plane_size[2];
>> +       size_t *plane_size;
>>          void *ptr;
>>
>>          igt_assert(igt_format_is_yuv(fb->drm_format));
>>
>> +       plane_size = malloc(lookup_drm_format(fb->drm_format)->num_planes *
>> +                       sizeof(size_t));
> I'm not sure if you need a malloc? Can we do `size_t
> plane_size[num_planes]?` so we don't have to worry about freeing it at
> the end.
Ah, i briefly forgot that the format table was a static table and we 
know the num_planes already, sure we can do it like that.

>> +
>> +       igt_assert(plane_size);
>> +
>>          for (int i = 0; i < lookup_drm_format(fb->drm_format)->num_planes; i++) {
>>                  unsigned int tile_width, tile_height;
>>
>> -               igt_assert_lt(i, ARRAY_SIZE(plane_size));
> We know the size will be num_planes, we can create a var num_planes
> that's used for the array size and modify this instead to
> igt_assert_lt(i, num_planes);
Sure, will fix that.
>>                  igt_get_fb_tile_size(fb->fd, fb->modifier, fb->plane_bpp[i],
>>                                       &tile_width, &tile_height);
>>                  plane_size[i] = fb->strides[i] *
>> @@ -1082,8 +1086,23 @@ static void clear_yuv_buffer(struct igt_fb *fb)
>>                           full_range ? 0x800000008000ULL : 0x800010008000ULL,
>>                           plane_size[0] / sizeof(uint64_t));
>>                  break;
>> +       case DRM_FORMAT_YUV420:
>> +       case DRM_FORMAT_YUV422:
>> +       case DRM_FORMAT_YVU420:
>> +       case DRM_FORMAT_YVU422:
> to safeguard this check, can we add igt_assert num_planes is equal to
> 3, cause we're gonna use all 3 in the memset here
>> +               memset(ptr + fb->offsets[0],
>> +                      full_range ? 0x00 : 0x10,
> Cool! how did you figure out this number?
Just looking at some of the other switch cases for a long time ....
>> +                      plane_size[0]);
>> +               memset(ptr + fb->offsets[1],
>> +                      0x80,
>> +                      plane_size[1]);
>> +               memset(ptr + fb->offsets[2],
>> +                      0x80,
>> +                      plane_size[2]);
>> +               break;
>>          }
>>
>> +       free(plane_size);
>>          igt_fb_unmap_buffer(fb, ptr);
>>   }
>>
>> --
>> 2.7.4
>>
