Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5D710E3D9
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Oct 2023 12:58:00 +0000 (UTC)
Message-ID: <23af5e03-1f03-538e-49b6-0eff9353c2e7@linux.intel.com>
Date: Wed, 18 Oct 2023 14:57:56 +0200
MIME-Version: 1.0
To: juhapekka.heikkila@gmail.com,
 =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20231016134852.413678-1-juhapekka.heikkila@gmail.com>
 <20231017064451.mohdfg7vfkiqdrjr@zkempczy-mobl2>
 <161bd2a0-1395-ffab-76a9-d53bf2abc02e@gmail.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <161bd2a0-1395-ffab-76a9-d53bf2abc02e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_fb/xe: use engine copy where
 available
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hey,

On i915 the X tiling mode is detiled in mmap directly and there is no 
need for an internal copy. What happens if you explicitly force i915 to 
take the same path as Xe here?

Cheers,
~Maarten

On 2023-10-17 09:08, Juha-Pekka Heikkila wrote:
> On 17.10.2023 9.44, Zbigniew Kempczyński wrote:
>> On Mon, Oct 16, 2023 at 04:48:52PM +0300, Juha-Pekka Heikkila wrote:
>>> On Xe driver there seems to be some problems with blitter while copying
>>> framebuffers. Switch to use engine copy instead of blitter copy
>>> where possible at least until blitter path is fixed.
>>
>> Do we have separated test which exposes this bug on Xe?
>> If not this looks like hiding bugs what's wrong as this might
>> be triggered on another path.
>>
> 
> As discussed offline, any x-tile test will show this on adlp. 
> Framebuffers here are for display testing, agreed this would put the bug 
> in hiding on blitter but allow some basic display testing with rgb 
> framebuffers on Xe. With this set once testing proceed to yuv 
> framebuffers we'll see all of those failing as Vebox doesn't yet work on 
> Xe either.
> 
> /Juha-Pekka
> 
>>
>>
>>>
>>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>
>>> ---
>>>   lib/igt_fb.c | 30 ++++++++++++++++++++++++------
>>>   1 file changed, 24 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>>> index e82393909..0ff610dc2 100644
>>> --- a/lib/igt_fb.c
>>> +++ b/lib/igt_fb.c
>>> @@ -2502,12 +2502,17 @@ static bool block_copy_ok(const struct igt_fb 
>>> *fb)
>>>   static bool blitter_ok(const struct igt_fb *fb)
>>>   {
>>> +    int devid;
>>> +
>>>       if (!is_intel_device(fb->fd))
>>>           return false;
>>> +    devid = intel_get_drm_devid(fb->fd);
>>> +
>>>       if ((is_ccs_modifier(fb->modifier) &&
>>> -         !HAS_FLATCCS(intel_get_drm_devid(fb->fd))) ||
>>> -         is_gen12_mc_ccs_modifier(fb->modifier))
>>> +         !HAS_FLATCCS(devid)) ||
>>> +         is_gen12_mc_ccs_modifier(fb->modifier) ||
>>> +         (is_xe_device(fb->fd) && igt_get_render_copyfunc(devid)))
>>>           return false;
>>>       for (int i = 0; i < fb->num_planes; i++) {
>>> @@ -2538,15 +2543,20 @@ static bool blitter_ok(const struct igt_fb *fb)
>>>   static bool use_enginecopy(const struct igt_fb *fb)
>>>   {
>>> +    int devid;
>>> +
>>>       if (!is_intel_device(fb->fd))
>>>           return false;
>>>       if (blitter_ok(fb))
>>>           return false;
>>> +    devid = intel_get_drm_devid(fb->fd);
>>> +
>>>       return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
>>> -           (!HAS_FLATCCS(intel_get_drm_devid(fb->fd)) && 
>>> is_ccs_modifier(fb->modifier)) ||
>>> -           is_gen12_mc_ccs_modifier(fb->modifier);
>>> +           (!HAS_FLATCCS(devid) && is_ccs_modifier(fb->modifier)) ||
>>> +           is_gen12_mc_ccs_modifier(fb->modifier) ||
>>> +           (is_xe_device(fb->fd) && igt_get_render_copyfunc(devid));
>>>   }
>>>   static bool use_blitter(const struct igt_fb *fb)
>>> @@ -3052,7 +3062,12 @@ static void free_linear_mapping(struct 
>>> fb_blit_upload *blit)
>>>           igt_nouveau_delete_bo(&linear->fb);
>>>       } else if (is_xe_device(fd)) {
>>>           gem_munmap(linear->map, linear->fb.size);
>>> -        blitcopy(fb, &linear->fb);
>>> +
>>> +        if (blit->ibb)
>>> +            copy_with_engine(blit, fb, &linear->fb);
>>> +        else
>>> +            blitcopy(fb, &linear->fb);
>>> +
>>>           gem_close(fd, linear->fb.gem_handle);
>>>       } else {
>>>           gem_munmap(linear->map, linear->fb.size);
>>> @@ -3132,7 +3147,10 @@ static void setup_linear_mapping(struct 
>>> fb_blit_upload *blit)
>>>           linear->map = igt_nouveau_mmap_bo(&linear->fb, PROT_READ | 
>>> PROT_WRITE);
>>>       } else if (is_xe_device(fd)) {
>>> -        blitcopy(&linear->fb, fb);
>>> +        if (blit->ibb)
>>> +            copy_with_engine(blit, &linear->fb, fb);
>>> +        else
>>> +            blitcopy(&linear->fb, fb);
>>>           linear->map = xe_bo_mmap_ext(fd, linear->fb.gem_handle,
>>>                            linear->fb.size, PROT_READ | PROT_WRITE);
>>> -- 
>>> 2.34.1
>>>
> 
