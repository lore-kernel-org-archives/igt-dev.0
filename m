Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E99C6EE0D
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2020 17:59:35 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id d16so4292661wre.10
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2020 09:59:35 -0800 (PST)
References: <20200120220320.17092-1-imre.deak@intel.com>
 <20200120220320.17092-2-imre.deak@intel.com>
 <885187ed-0ba3-8bba-729a-cf5e3fca1dc0@gmail.com>
 <20200121163517.GA7975@ideak-desk.fi.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <4f43500b-1bb7-4e60-065e-b2a95af4797e@gmail.com>
Date: Tue, 21 Jan 2020 19:59:30 +0200
MIME-Version: 1.0
In-Reply-To: <20200121163517.GA7975@ideak-desk.fi.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/igt_fb: Use render copy/blit
 for tiled formats on platforms w/o HW detiling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: imre.deak@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 21.1.2020 18.35, Imre Deak wrote:
> On Tue, Jan 21, 2020 at 06:19:30PM +0200, Juha-Pekka Heikkila wrote:
>> On 21.1.2020 0.03, Imre Deak wrote:
>>> On platforms without HW detiling use render copy or blitting to convert
>>> between a tiled and a linear framebuffer.
>>>
>>> Signed-off-by: Imre Deak <imre.deak@intel.com>
>>> ---
>>>    lib/igt_fb.c | 16 +++++++++++++---
>>>    1 file changed, 13 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>>> index c81b9de8..b5b1750e 100644
>>> --- a/lib/igt_fb.c
>>> +++ b/lib/igt_fb.c
>>> @@ -1975,17 +1975,27 @@ static bool blitter_ok(const struct igt_fb *fb)
>>>    	return true;
>>>    }
>>> +static bool hw_can_detile(const struct igt_fb *fb)
>>> +{
>>> +	if (fb->modifier == DRM_FORMAT_MOD_NONE)
>>> +		return true;
>>> +
>>> +	if (!gem_has_legacy_hw_tiling(fb->fd))
>>> +		return false;
>>> +
>>> +	return fb->modifier != I915_FORMAT_MOD_Yf_TILED;
>>
>> Should above line depend on gen? Like
>> return (gen < 12 || fb->modifier != I915_FORMAT_MOD_Yf_TILED); ?
> 
> AFAIK no platform can detile the Yf format (only X or Y), but this
> shouldn't change the logic in any case, except for
> !gem_has_legacy_hw_tiling().
> 

You are right.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

>>
>>> +}
>>> +
>>>    static bool use_enginecopy(const struct igt_fb *fb)
>>>    {
>>>    	return is_ccs_modifier(fb->modifier) ||
>>> -		(fb->modifier == I915_FORMAT_MOD_Yf_TILED &&
>>> -		 !blitter_ok(fb));
>>> +		(!hw_can_detile(fb) && !blitter_ok(fb));
>>>    }
>>>    static bool use_blitter(const struct igt_fb *fb)
>>>    {
>>>    	return (fb->modifier == I915_FORMAT_MOD_Y_TILED ||
>>> -		fb->modifier == I915_FORMAT_MOD_Yf_TILED) &&
>>> +		!hw_can_detile(fb)) &&
>>>    		blitter_ok(fb);
>>>    }
>>>
>>

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
