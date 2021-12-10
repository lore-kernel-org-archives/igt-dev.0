Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7043710E42E
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Dec 2021 17:54:13 +0000 (UTC)
Message-ID: <3aacc57f-d13f-fb09-2593-f58aae1ac1d9@quicinc.com>
Date: Fri, 10 Dec 2021 09:54:07 -0800
MIME-Version: 1.0
Content-Language: en-US
References: <1639010440-16085-1-git-send-email-quic_abhinavk@quicinc.com>
 <YbMYomGyz7lJUj01@platvala-desk.ger.corp.intel.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <YbMYomGyz7lJUj01@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3] lib/igt_fb: fix the plane_size array
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: quic_khsieh@quicinc.com, swboyd@chromium.org, igt-dev@lists.freedesktop.org, nganji@codeaurora.org, seanpaul@chromium.org, aravindh@codeaurora.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Petri

Thanks for the review.

On 12/10/2021 1:06 AM, Petri Latvala wrote:
> On Wed, Dec 08, 2021 at 04:40:40PM -0800, Abhinav Kumar wrote:
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
>> changes in v3:
>> 	- use drm_format->num_planes to create the plane_size
>> 	- add assert checks for num of planes before memset
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   lib/igt_fb.c | 21 +++++++++++++++++++--
>>   1 file changed, 19 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>> index 92a0170..1530b96 100644
>> --- a/lib/igt_fb.c
>> +++ b/lib/igt_fb.c
>> @@ -1007,7 +1007,8 @@ static void memset64(uint64_t *s, uint64_t c, size_t n)
>>   static void clear_yuv_buffer(struct igt_fb *fb)
>>   {
>>   	bool full_range = fb->color_range == IGT_COLOR_YCBCR_FULL_RANGE;
>> -	size_t plane_size[2];
>> +	int num_planes = lookup_drm_format(fb->drm_format)->num_planes;
>> +	size_t plane_size[num_planes];
>>   	void *ptr;
>>   
>>   	igt_assert(igt_format_is_yuv(fb->drm_format));
>> @@ -1015,7 +1016,8 @@ static void clear_yuv_buffer(struct igt_fb *fb)
>>   	for (int i = 0; i < lookup_drm_format(fb->drm_format)->num_planes; i++) {
> 
> Since we have num_planes grabbed to a variable, might as well replace
> this lookup call with it too.
sure, i can fix this.
> 
> 
>>   		unsigned int tile_width, tile_height;
>>   
>> -		igt_assert_lt(i, ARRAY_SIZE(plane_size));
>> +		igt_assert_lt(i, num_planes);
>> +
>>   		igt_get_fb_tile_size(fb->fd, fb->modifier, fb->plane_bpp[i],
>>   				     &tile_width, &tile_height);
>>   		plane_size[i] = fb->strides[i] *
>> @@ -1082,6 +1084,21 @@ static void clear_yuv_buffer(struct igt_fb *fb)
>>   			 full_range ? 0x800000008000ULL : 0x800010008000ULL,
>>   			 plane_size[0] / sizeof(uint64_t));
>>   		break;
>> +	case DRM_FORMAT_YUV420:
>> +	case DRM_FORMAT_YUV422:
>> +	case DRM_FORMAT_YVU420:
>> +	case DRM_FORMAT_YVU422:
>> +		igt_assert(ARRAY_SIZE(plane_size) == 3);
>> +		memset(ptr + fb->offsets[0],
>> +		       full_range ? 0x00 : 0x10,
>> +		       plane_size[0]);
>> +		memset(ptr + fb->offsets[1],
>> +		       0x80,
>> +		       plane_size[1]);
>> +		memset(ptr + fb->offsets[2],
>> +		       0x80,
>> +		       plane_size[2]);
>> +		break;
> 
> 
> I have no clue what the correct numbers should be here. =(

What all the values are doing here like in other switch cases is 
resetting the color to black for all formats.
For these formats that will be,
Y to 16 or 0x10 ( 0x0 for Full Range )
U,V - 128 or 0x80
> 
> 
