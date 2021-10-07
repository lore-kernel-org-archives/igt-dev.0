Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC296E530
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Oct 2021 13:59:02 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id t2so6175738qtx.8
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Oct 2021 06:59:02 -0700 (PDT)
References: <20211005135601.17102-1-igormtorrente@gmail.com>
 <YV7u53mbUGWf07Kv@platvala-desk.ger.corp.intel.com>
From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Message-ID: <c4592038-072d-6cf8-af25-a98227fddbce@gmail.com>
Date: Thu, 7 Oct 2021 10:58:58 -0300
MIME-Version: 1.0
In-Reply-To: <YV7u53mbUGWf07Kv@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH] tests/kms_writeback.c: fix the `fill_fb`
 function
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 10/7/21 9:58 AM, Petri Latvala wrote:
> On Tue, Oct 05, 2021 at 10:56:01AM -0300, Igor Matheus Andrade Torrente wrote:
>> Currently, the `fill_fb` function, instead of filling the framebuffer
>> with the whole pixel, is only filling it with the rightmost byte.
>>
>> This is happening because, even though the memset accepts an int as
>> a parameter, it's casting the value to unsigned char and will fill
>> the memory with this 8 bits value.
>>
>> If we setup the pixel to 0xff0000|f0|, the buffer will filled with:
>>
>> | addr     | = 0f
>> | addr + 1 | = 0f
>> | addr + 2 | = 0f
>> | addr + 3 | = 0f
>>      ...
>> | addr + N | = 0f
>>
>> This patch address this issue by manually copying the entire integer
>> in the little-endian format.
>>
>> Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
>> ---
>>   tests/kms_writeback.c | 16 ++++++++++++++--
>>   1 file changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
>> index 60dbda2a..60d9b74e 100644
>> --- a/tests/kms_writeback.c
>> +++ b/tests/kms_writeback.c
>> @@ -227,14 +227,26 @@ static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb, igt_fb_t *
>>   
>>   static void fill_fb(igt_fb_t *fb, uint32_t pixel)
>>   {
>> -	void *ptr;
>> +	uint8_t *ptr, x, r, g, b, step = sizeof(uint32_t);
>> +	int64_t pixel_count, i;
>>   
>>   	igt_assert(fb->drm_format == DRM_FORMAT_XRGB8888);
>>   
>>   	ptr = igt_fb_map_buffer(fb->fd, fb);
>>   	igt_assert(ptr);
>>   
>> -	memset(ptr, pixel, fb->strides[0] * fb->height);
>> +	pixel_count = fb->strides[0] * fb->height;
>> +	x = (pixel & (0xff << 24)) >> 24;
>> +	r = (pixel & (0xff << 16)) >> 16;
>> +	g = (pixel & (0xff << 8)) >> 8;
>> +	b = pixel & 0xff;
>> +
>> +	for (i = 0; i <= pixel_count - step; i += step) {
>> +		ptr[i + 3] = x;
>> +		ptr[i + 2] = r;
>> +		ptr[i + 1] = g;
>> +		ptr[i + 0] = b;
>> +	}
> 
> Is there a reason to explicitly go for little endian here? Can't the
> pixel be written as is, like
> 
> uint32_t *p = ptr;
> 
> while (p++ < ptr + fb->strides[0] * fb->height)
>    *p = pixel;
> 
>

I did it to cover the possible case of this code being running on 
big-endian machines. But, I realized that isn't necessary, since I'm 
just copying the bytes and not manipulating them.

I will send a V2 without all this code.
