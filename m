Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8042C10E64B
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 10:32:29 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32003aae100so2291961f8f.0
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 03:32:29 -0700 (PDT)
Message-ID: <0e5d562e-bcfb-eaa3-2e01-fccab0a83318@gmail.com>
Date: Fri, 22 Sep 2023 13:32:21 +0300
MIME-Version: 1.0
To: "Sharma, Swati2" <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20230921163530.285456-1-juhapekka.heikkila@gmail.com>
 <160cb1ad-d6ec-39b2-2c65-5f7517aefd17@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <160cb1ad-d6ec-39b2-2c65-5f7517aefd17@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] lib/xe: on xe driver use blitter for
 x-tile
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Thanks. Those ci reported failures don't seem to relate to this change 
at all so I'll change subject/message and push.

/Juha-Pekka

On 22.9.2023 7.54, Sharma, Swati2 wrote:
> Hi JP,
> 
> Since for xe, we want to use blitter generically, please update commit 
> message and subject accordingly.
> 
> With above fixed.
> 
> LGTM
> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
> 
> On 21-Sep-23 10:05 PM, Juha-Pekka Heikkila wrote:
>> on xe driver need to use blitter for x-tile
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>   lib/igt_fb.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>> index 4b592825d..c8a7b31a8 100644
>> --- a/lib/igt_fb.c
>> +++ b/lib/igt_fb.c
>> @@ -2557,7 +2557,8 @@ static bool use_blitter(const struct igt_fb *fb)
>>       return fb->modifier == I915_FORMAT_MOD_4_TILED ||
>>              fb->modifier == I915_FORMAT_MOD_Y_TILED ||
>>              fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
>> -           (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd));
>> +           (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd)) ||
>> +           is_xe_device(fb->fd);
>>   }
>>   static void init_buf_ccs(struct intel_buf *buf, int ccs_idx,
