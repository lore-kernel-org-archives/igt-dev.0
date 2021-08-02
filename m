Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6374689ED6
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Aug 2021 14:41:19 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id b128so10557007wmb.4
 for <igt-dev@lists.freedesktop.org>; Mon, 02 Aug 2021 07:41:19 -0700 (PDT)
References: <20210728045544.1046657-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <2ce3082b-9823-8625-920e-7dcb8da0efbc@intel.com>
 <62dfe8ca-34a3-cd2c-6cf1-4181a0acb36a@gmail.com>
 <cd2e65f9-b5de-3ac7-3f56-ec004cecacfa@intel.com>
 <SN6PR11MB34210D1C5FF9B12A07947902DFEF9@SN6PR11MB3421.namprd11.prod.outlook.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <23ed24c7-381d-8097-b19d-6f4d4934026f@gmail.com>
Date: Mon, 2 Aug 2021 17:41:09 +0300
MIME-Version: 1.0
In-Reply-To: <SN6PR11MB34210D1C5FF9B12A07947902DFEF9@SN6PR11MB3421.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [i-g-t] tests/kms_plane_alpha_blend: Align width to
 256B
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
To: "Surendrakumar Upadhyay, TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2.8.2021 17.16, Surendrakumar Upadhyay, TejaskumarX wrote:
> Hi JP,
> 
> You are right i915 driver is giving 64B aligned buffer but test uses raw width and thus it requires width to be aligned.

I don't understand what you mean with raw width? This is in use:

	mode = igt_output_get_mode(output);
	w = mode->hdisplay;

I see on kms_plane_alpha_blend is allocated framebuffer using normal igt 
functions like igt_create_fb(..) and then renders onto them with cairo, 
just like any other kms test. igt_create_fb(..) will create fb for you 
which is all correct, it get alignments from calc_plane_stride(..) which 
in this case will say stride alignment is 64 bytes since linear fb is in 
use. If these are wrong you will start to see all kms tests fail equally.

/Juha-Pekka

> 
> Thanks,
> Tejas
> 
>> -----Original Message-----
>> From: Sharma, Swati2 <swati2.sharma@intel.com>
>> Sent: 02 August 2021 18:35
>> To: juhapekka.heikkila@gmail.com; Surendrakumar Upadhyay, TejaskumarX
>> <tejaskumarx.surendrakumar.upadhyay@intel.com>; igt-
>> dev@lists.freedesktop.org
>> Subject: Re: [igt-dev] [i-g-t] tests/kms_plane_alpha_blend: Align width to
>> 256B
>>
>> Hi JP,
>>
>> Tejas reapplied the same fix as in
>> https://patchwork.freedesktop.org/patch/445010/?series=92751&rev=2
>> which was reviewed by Daniel.
>>
>> On 02-Aug-21 5:42 PM, Juha-Pekka Heikkila wrote:
>>> Hi Tejas, Swati,
>>>
>>> I was confused when I read this patch, mind you tell what happen here?
>>> To me it look like nothing matches with each other with the patch.
>>>
>>> Even subject is telling other things than what this patch actually does.
>>>
>>> On 30.7.2021 8.50, Sharma, Swati2 wrote:
>>>> Reviewed-by:
>>>> Swati Sharma <swati2.sharma@intel.com>
>>>>
>>>> On 28-Jul-21 10:25 AM, Tejas Upadhyay wrote:
>>>>> some display resolutions like 1366x768 6bpc which does not have 64B
>>>>> aligned width are creating crc mismatch in kms_plane_alpha_blend
>>>>> test on Intel platforms.
>>>
>>> hm. You are saying none of Intel hw is able to show 1366 wide
>>> framebuffers correctly? And it is fixed by hiding it from being tested?
>>>
>>> Memory given from kernel will have 64B alignment. You can easily see
>>> by yourself.
>>>
>>>>>
>>>>> Also having different alignment requirement by different drivers,
>>>>> 256B aligned width should work for all drm drivers.
>>>
>>> You are saying you are fixing some problem with Intel hw, what does
>>> all this other stuff have to do with it? None of those other drivers
>>> are able to show 1366 pixels wide framebuffers either?
>>>
>>>>>
>>>>> amdgpu and radeon, amdgpu_align_pitch: 256B armada, armada_pitch:
>>>>> 128B
>>>>> exynos_drm_gem_dumb_create: No alignment required
>>>>> drm_gem_shmem_dumb_create: 8B
>>>>> drm_gem_vram_fill_create_dumb: 8B
>>>>>
>>>>> Thus 256B covers everything we see in the kernel drm drivers.
>>>>> Signed-off-by: Tejas Upadhyay
>>>>> <tejaskumarx.surendrakumar.upadhyay@intel.com>
>>>>> ---
>>>>>    tests/kms_plane_alpha_blend.c | 1 +
>>>>>    1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/tests/kms_plane_alpha_blend.c
>>>>> b/tests/kms_plane_alpha_blend.c index d649a09f..864e83f9 100644
>>>>> --- a/tests/kms_plane_alpha_blend.c
>>>>> +++ b/tests/kms_plane_alpha_blend.c
>>>>> @@ -168,6 +168,7 @@ static void prepare_crtc(data_t *data,
>>>>> igt_output_t *output, enum pipe pipe)
>>>>>        w = mode->hdisplay;
>>>>>        h = mode->vdisplay;
>>>>> +    w = ALIGN(w, 256);
>>>
>>> This doesn't cause anything to align with 256 bytes. This makes fb
>>> width in pixels divisible by 256. For anything to do with fb
>>> alignments..this has very little to do. Kernel will do viewport
>>> clipping hence for actual intended test this does nothing. FB
>>> alignments are handled otherwise as in this case with with linear fb will
>> have 64 bytes per stride.
>>>
>>>>>        /* recreate all fbs if incompatible */
>>>>>        if (data->xrgb_fb.width != w || data->xrgb_fb.height != h) {
>>>>>            cairo_t *cr;
>>>>>
>>>>
>>>
>>> If this patch actually fixed anything you'll need to create hw wa and
>>> this need to be fixed in kernel. Not testing is not fixing. Imo there
>>> should be no problem for Intel hw to show varying fb sizes, including
>>> 1366 wide.
>>>
>>> /Juha-Pekka
>>
>> --
>> ~Swati Sharma
