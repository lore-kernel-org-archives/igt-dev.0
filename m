Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43BB910E0AA
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Oct 2023 13:51:34 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c50305c5c4so84424791fa.1
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Oct 2023 06:51:34 -0700 (PDT)
Message-ID: <571655a3-1898-58a1-ecad-88a3ebfc9f4f@gmail.com>
Date: Wed, 18 Oct 2023 16:51:26 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20231016134852.413678-1-juhapekka.heikkila@gmail.com>
 <20231017064451.mohdfg7vfkiqdrjr@zkempczy-mobl2>
 <161bd2a0-1395-ffab-76a9-d53bf2abc02e@gmail.com>
 <23af5e03-1f03-538e-49b6-0eff9353c2e7@linux.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <23af5e03-1f03-538e-49b6-0eff9353c2e7@linux.intel.com>
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
Reply-To: juhapekka.heikkila@gmail.com
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hei Maarten,

On 18.10.2023 15.57, Maarten Lankhorst wrote:
> Hey,
> 
> On i915 the X tiling mode is detiled in mmap directly and there is no 
> need for an internal copy. What happens if you explicitly force i915 to 
> take the same path as Xe here?
> 

During summer time i915 was taking same path and back then there was no 
reported errors. X-tile on i915 was taken away from blitter because it 
was failing async flip tests when doing copies w/ blitter was too slow 
for those tests but otherwise everything did seem to work. Those dpt 
patches for Xe driver went in yesterday so we'll soon see this in tests 
and get to figure out where the bug is hiding, we agree with Zbigniew to 
drop this change for now.

/Juha-Pekka

> 
> On 2023-10-17 09:08, Juha-Pekka Heikkila wrote:
>> On 17.10.2023 9.44, Zbigniew Kempczyński wrote:
>>> On Mon, Oct 16, 2023 at 04:48:52PM +0300, Juha-Pekka Heikkila wrote:
>>>> On Xe driver there seems to be some problems with blitter while copying
>>>> framebuffers. Switch to use engine copy instead of blitter copy
>>>> where possible at least until blitter path is fixed.
>>>
>>> Do we have separated test which exposes this bug on Xe?
>>> If not this looks like hiding bugs what's wrong as this might
>>> be triggered on another path.
>>>
>>
>> As discussed offline, any x-tile test will show this on adlp. 
>> Framebuffers here are for display testing, agreed this would put the 
>> bug in hiding on blitter but allow some basic display testing with rgb 
>> framebuffers on Xe. With this set once testing proceed to yuv 
>> framebuffers we'll see all of those failing as Vebox doesn't yet work 
>> on Xe either.
>>
>> /Juha-Pekka
>>
>>>
>>>
>>>>
>>>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>>
>>>> ---
>>>>   lib/igt_fb.c | 30 ++++++++++++++++++++++++------
>>>>   1 file changed, 24 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>>>> index e82393909..0ff610dc2 100644
>>>> --- a/lib/igt_fb.c
>>>> +++ b/lib/igt_fb.c
>>>> @@ -2502,12 +2502,17 @@ static bool block_copy_ok(const struct 
>>>> igt_fb *fb)
>>>>   static bool blitter_ok(const struct igt_fb *fb)
>>>>   {
>>>> +    int devid;
>>>> +
>>>>       if (!is_intel_device(fb->fd))
>>>>           return false;
>>>> +    devid = intel_get_drm_devid(fb->fd);
>>>> +
>>>>       if ((is_ccs_modifier(fb->modifier) &&
>>>> -         !HAS_FLATCCS(intel_get_drm_devid(fb->fd))) ||
>>>> -         is_gen12_mc_ccs_modifier(fb->modifier))
>>>> +         !HAS_FLATCCS(devid)) ||
>>>> +         is_gen12_mc_ccs_modifier(fb->modifier) ||
>>>> +         (is_xe_device(fb->fd) && igt_get_render_copyfunc(devid)))
>>>>           return false;
>>>>       for (int i = 0; i < fb->num_planes; i++) {
>>>> @@ -2538,15 +2543,20 @@ static bool blitter_ok(const struct igt_fb *fb)
>>>>   static bool use_enginecopy(const struct igt_fb *fb)
>>>>   {
>>>> +    int devid;
>>>> +
>>>>       if (!is_intel_device(fb->fd))
>>>>           return false;
>>>>       if (blitter_ok(fb))
>>>>           return false;
>>>> +    devid = intel_get_drm_devid(fb->fd);
>>>> +
>>>>       return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
>>>> -           (!HAS_FLATCCS(intel_get_drm_devid(fb->fd)) && 
>>>> is_ccs_modifier(fb->modifier)) ||
>>>> -           is_gen12_mc_ccs_modifier(fb->modifier);
>>>> +           (!HAS_FLATCCS(devid) && is_ccs_modifier(fb->modifier)) ||
>>>> +           is_gen12_mc_ccs_modifier(fb->modifier) ||
>>>> +           (is_xe_device(fb->fd) && igt_get_render_copyfunc(devid));
>>>>   }
>>>>   static bool use_blitter(const struct igt_fb *fb)
>>>> @@ -3052,7 +3062,12 @@ static void free_linear_mapping(struct 
>>>> fb_blit_upload *blit)
>>>>           igt_nouveau_delete_bo(&linear->fb);
>>>>       } else if (is_xe_device(fd)) {
>>>>           gem_munmap(linear->map, linear->fb.size);
>>>> -        blitcopy(fb, &linear->fb);
>>>> +
>>>> +        if (blit->ibb)
>>>> +            copy_with_engine(blit, fb, &linear->fb);
>>>> +        else
>>>> +            blitcopy(fb, &linear->fb);
>>>> +
>>>>           gem_close(fd, linear->fb.gem_handle);
>>>>       } else {
>>>>           gem_munmap(linear->map, linear->fb.size);
>>>> @@ -3132,7 +3147,10 @@ static void setup_linear_mapping(struct 
>>>> fb_blit_upload *blit)
>>>>           linear->map = igt_nouveau_mmap_bo(&linear->fb, PROT_READ | 
>>>> PROT_WRITE);
>>>>       } else if (is_xe_device(fd)) {
>>>> -        blitcopy(&linear->fb, fb);
>>>> +        if (blit->ibb)
>>>> +            copy_with_engine(blit, &linear->fb, fb);
>>>> +        else
>>>> +            blitcopy(&linear->fb, fb);
>>>>           linear->map = xe_bo_mmap_ext(fd, linear->fb.gem_handle,
>>>>                            linear->fb.size, PROT_READ | PROT_WRITE);
>>>> -- 
>>>> 2.34.1
>>>>
>>
