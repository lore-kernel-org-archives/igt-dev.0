Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAAD6E049
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Aug 2021 13:09:35 +0000 (UTC)
References: <20210728045544.1046657-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <2ce3082b-9823-8625-920e-7dcb8da0efbc@intel.com>
 <62dfe8ca-34a3-cd2c-6cf1-4181a0acb36a@gmail.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <cd2e65f9-b5de-3ac7-3f56-ec004cecacfa@intel.com>
Date: Mon, 2 Aug 2021 18:34:45 +0530
MIME-Version: 1.0
In-Reply-To: <62dfe8ca-34a3-cd2c-6cf1-4181a0acb36a@gmail.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: juhapekka.heikkila@gmail.com, Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi JP,

Tejas reapplied the same fix as in 
https://patchwork.freedesktop.org/patch/445010/?series=92751&rev=2 which 
was reviewed by Daniel.

On 02-Aug-21 5:42 PM, Juha-Pekka Heikkila wrote:
> Hi Tejas, Swati,
> 
> I was confused when I read this patch, mind you tell what happen here? 
> To me it look like nothing matches with each other with the patch.
> 
> Even subject is telling other things than what this patch actually does.
> 
> On 30.7.2021 8.50, Sharma, Swati2 wrote:
>> Reviewed-by:
>> Swati Sharma <swati2.sharma@intel.com>
>>
>> On 28-Jul-21 10:25 AM, Tejas Upadhyay wrote:
>>> some display resolutions like 1366x768 6bpc which does not
>>> have 64B aligned width are creating crc mismatch in
>>> kms_plane_alpha_blend test on Intel platforms.
> 
> hm. You are saying none of Intel hw is able to show 1366 wide 
> framebuffers correctly? And it is fixed by hiding it from being tested?
> 
> Memory given from kernel will have 64B alignment. You can easily see by 
> yourself.
> 
>>>
>>> Also having different alignment requirement by different drivers,
>>> 256B aligned width should work for all drm drivers.
> 
> You are saying you are fixing some problem with Intel hw, what does all 
> this other stuff have to do with it? None of those other drivers are 
> able to show 1366 pixels wide framebuffers either?
> 
>>>
>>> amdgpu and radeon, amdgpu_align_pitch: 256B
>>> armada, armada_pitch: 128B
>>> exynos_drm_gem_dumb_create: No alignment required
>>> drm_gem_shmem_dumb_create: 8B
>>> drm_gem_vram_fill_create_dumb: 8B
>>>
>>> Thus 256B covers everything we see in the kernel drm drivers.
>>> Signed-off-by: Tejas Upadhyay 
>>> <tejaskumarx.surendrakumar.upadhyay@intel.com>
>>> ---
>>>   tests/kms_plane_alpha_blend.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/tests/kms_plane_alpha_blend.c 
>>> b/tests/kms_plane_alpha_blend.c
>>> index d649a09f..864e83f9 100644
>>> --- a/tests/kms_plane_alpha_blend.c
>>> +++ b/tests/kms_plane_alpha_blend.c
>>> @@ -168,6 +168,7 @@ static void prepare_crtc(data_t *data, 
>>> igt_output_t *output, enum pipe pipe)
>>>       w = mode->hdisplay;
>>>       h = mode->vdisplay;
>>> +    w = ALIGN(w, 256);
> 
> This doesn't cause anything to align with 256 bytes. This makes fb width 
> in pixels divisible by 256. For anything to do with fb alignments..this 
> has very little to do. Kernel will do viewport clipping hence for actual 
> intended test this does nothing. FB alignments are handled otherwise as 
> in this case with with linear fb will have 64 bytes per stride.
> 
>>>       /* recreate all fbs if incompatible */
>>>       if (data->xrgb_fb.width != w || data->xrgb_fb.height != h) {
>>>           cairo_t *cr;
>>>
>>
> 
> If this patch actually fixed anything you'll need to create hw wa and 
> this need to be fixed in kernel. Not testing is not fixing. Imo there 
> should be no problem for Intel hw to show varying fb sizes, including 
> 1366 wide.
> 
> /Juha-Pekka

-- 
~Swati Sharma
