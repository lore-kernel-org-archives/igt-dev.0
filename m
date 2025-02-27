Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF0DC021B8
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 02:07:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB8710EA0A;
	Thu, 27 Feb 2025 02:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aQvLV0ns";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12D810EA0A
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 02:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mV5sM+nDnO0PvV1r9jo+lJn7He7ZXiQG+xbh3ZFjxtI=; b=aQvLV0nsxu+vx5hO/+szg55dzw
 J/qJU4ms6hkJlTwrGUVljjro5THLeOy22zbm2Q3+mpf4YtpZY8Oom5Ek3utWaUWgmVCrQvFmfKZTp
 lO8lZwMugWL6spWHIycGPrgDlsMMH0snBfdWyp08JGBkSQG2VwSlWl653nwuwp0OD3io131SwW+3o
 HHVaqgaOkusis3djg9uUhlFM4UhKAs1L+YB0hUNbMMKgZiAmjTvDKZMIdLkOn5IkIWDSErkb9LeDd
 FadNA1dAkOqrfPEltlm7+iZZeA7OW++o3tYlP5nhbpOfuApw2VE1ZX6oDV9p0VvKAmHMWjFgvwTHJ
 Vl5FsPGg==;
Received: from [191.204.194.148] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tnTJ5-001MfA-MP; Thu, 27 Feb 2025 03:07:29 +0100
Message-ID: <a94b0312-b5db-483e-a4f8-5ef5b57d2952@igalia.com>
Date: Wed, 26 Feb 2025 23:07:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/kms_async_flips: Create subtest for overlay
 planes
To: Alex Hung <alex.hung@amd.com>, vitaly prosyak <vprosyak@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Jeevan B <jeevan.b@intel.com>, kernel-dev@igalia.com,
 Harry Wentland <harry.wentland@amd.com>
References: <20241216202427.76168-1-andrealmeid@igalia.com>
 <20250219103703.2hbadorsyh5ezd3e@kamilkon-desk.igk.intel.com>
 <5b88ea25-c9a6-4025-8f9b-34e1b213e258@amd.com>
 <78c0bb06-fb95-443c-a16c-9478daa11562@igalia.com>
 <a8fc5cef-5ccf-486d-b401-f587e500746d@amd.com>
 <41966687-e25e-42eb-a6b3-fba5d6c85e16@amd.com>
 <96660957-4656-4a48-9df0-bf62f7aa5433@igalia.com>
 <ebe71668-236c-4f6d-bcf3-82b8c2c63d02@amd.com>
 <4c03e73f-e110-41b7-995f-b81857546d8c@igalia.com>
 <0138a6e0-8e3a-467a-b6c6-41244bd1737c@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <0138a6e0-8e3a-467a-b6c6-41244bd1737c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Alex,

Em 25/02/2025 19:47, Alex Hung escreveu:
> 
> 
> On 2/25/25 15:01, André Almeida wrote:
>> Hi Alex,
>>
>> Em 25/02/2025 18:40, Alex Hung escreveu:
>>>
>>>
>>> On 2/25/25 13:16, André Almeida wrote:
>>>> Hi Alex,
>>>>
>>>> Thanks for testing it.
>>>>
>>>> Em 25/02/2025 16:06, Alex Hung escreveu:
>>>>>
>>>>> We don't have a CI to test individual IGT patches so I tested this 
>>>>> patch on an APU and dGPU with kms_async_flips
>>>>
>>>> [...]
>>>>
>>>>>
>>>>>
>>>>> If I run overlay-atomic alone (i.e., --run-subtest overlay-atomic), 
>>>>> overlay-atomic fails as below (partial outputs only). Is this an 
>>>>> expected result? Does overlay-atomic need to run along with other 
>>>>> subtests?
>>>>>
>>>>
>>>> This is not the expected result, I tried to reproduce here but it 
>>>> worked fine. Tested on Steam Deck, rebased on current igt master 
>>>> (commit 6cdff4099c6c95e):
>>>
>>> I also have IGT rebased to current commit (same as yours)
>>>
>>> db3a185f3 (HEAD -> master) tests/kms_async_flips: Create subtest for 
>>> overlay planes
>>> 6cdff4099 (origin/master, origin/HEAD) lib/i915/fbc: fbc psr combo 
>>> support update for xe3
>>>
>>> The kernels I tried are
>>> - 6.11.0-18-generic (from Ubuntu's current)
>>> - 6.12.0 from amd-staging-drm-next
>>>
>>
>> The changes required for this tested can't be found in any of those 
>> branches. They are in after the tag drm-misc-next-2025-02-20 ("drm- 
>> misc- next for v6.15") and this is the patchset:
>>
>> https://lore.kernel.org/lkml/20250127-tonyk-async_flip- 
>> v12-2-0f7f8a8610d3@igalia.com/
>>
>> So now the mistery is not about why this test fails, but why it 
>> succeeds in the first place :) I will have a look using an older 
>> kernel to see if I can figure that out, thanks!
>>
> 
> I applied the two patches on top of amd-staging-drm-next:
>      drm/amdgpu: Enable async flip on overlay planes
>      drm/atomic: Let drivers decide which planes to async flip
> 
> The results are the same, i.e. SUCCESS when running kms_async_flips, and 
> FAIL when running overlay-atomic alone but with different error messages 
> (see below). I can tell the patterns on screen are different.
> 
> 

This error signs that the commit was accepted but the flip wasn't async. 
Could you try to run in a newer kernel to see the results? This is the 
HEAD that I'm using, no need to apply any kernel patch:

commit 72d0af4accd965dc32f504440d74d0a4d18bf781 
(drm-misc/for-linux-next, drm-misc/drm-misc-next)

> IGT-Version: 1.30-gdcb53a091 (x86_64) (Linux: 6.12.0-99-custom x86_64)
> Using IGT_SRANDOM=1740523111 for randomisation
> Opened device: /dev/dri/card1
> Starting subtest: overlay-atomic
> Starting dynamic subtest: pipe-A-eDP-1
> (kms_async_flips:3133) CRITICAL: Test assertion failure function 
> test_async_flip, file ../tests/kms_async_flips.c:384:
> (kms_async_flips:3133) CRITICAL: Failed assertion: (fps / 1000) > (data- 
>  >refresh_rate * MIN_FLIPS_PER_FRAME)
> (kms_async_flips:3133) CRITICAL: Last errno: 38, Function not implemented
> (kms_async_flips:3133) CRITICAL: FPS should be significantly higher than 
> the refresh rate
> Stack trace:
>    #0 ../lib/igt_core.c:2055 __igt_fail_assert()
>    #1 ../tests/kms_async_flips.c:384 test_async_flip()
>    #2 ../tests/kms_async_flips.c:728 run_test.constprop.0()
>    #3 ../tests/kms_async_flips.c:840 __igt_unique____real_main773()
>    #4 ../tests/kms_async_flips.c:773 main()
>    #5 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
>    #6 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>    #7 [_start+0x25]
> Dynamic subtest pipe-A-eDP-1 failed.
> 
> 
> 
>>>>
>>>> sudo ./build/tests/kms_async_flips --run-subtest overlay-atomic
>>>> IGT-Version: 1.30-g19c7e62ea (x86_64) (Linux: 6.14.0-rc4-00318- 
>>>> g72d0af4accd9 x86_64)
>>>> Using IGT_SRANDOM=1740513273 for randomisation
>>>> Opened device: /dev/dri/card0
>>>> Starting subtest: overlay-atomic
>>>> Starting dynamic subtest: pipe-A-eDP-1
>>>> Dynamic subtest pipe-A-eDP-1: SUCCESS (2.124s)
>>>> Starting dynamic subtest: pipe-B-eDP-1
>>>> Dynamic subtest pipe-B-eDP-1: SUCCESS (2.101s)
>>>> Starting dynamic subtest: pipe-C-eDP-1
>>>> Dynamic subtest pipe-C-eDP-1: SUCCESS (2.101s)
>>>> Starting dynamic subtest: pipe-D-eDP-1
>>>> Dynamic subtest pipe-D-eDP-1: SUCCESS (2.101s)
>>>> Subtest overlay-atomic: SUCCESS (8.950s)
>>>>
>>>> However, I saw this type of error before where the first flip is 
>>>> refused with -EINVAL. That usually happens because we can't change 
>>>> most of plane properties with the DRM_MODE_PAGE_FLIP_ASYNC flag and 
>>>> the previous state was somewhat different from the one that we want 
>>>> to present now, so we need to do a sync flip to modeset, and then do 
>>>> the async ones.
>>>>
>>>> Is there anything particular from your setup so I can try to 
>>>> reproduce here? I see that you have more than one card attached, 
>>>> what did you run prior to the test on that card?
>>>
>>> I tried on phoenix APU and dGPU Radeon RX 6800/6800 XT, and both of 
>>> them have the same results.
>>>
>>>>
>>>> Alternatively, adding the following lines in the begining of 
>>>> test_async_flip() should force a DRM_MODE_ATOMIC_ALLOW_MODESET and 
>>>> allow the next page flips:
>>>>
>>>> igt_plane_set_fb(data->overlay_plane, &data->bufs[0]);
>>>> igt_display_try_commit_atomic(&data->display, 
>>>> DRM_MODE_ATOMIC_ALLOW_MODESET, data);
>>>>
>>>
>>> Like the below changes? It doesn't fix the error messages for me, and 
>>> I saw some SIGSEGV.
>>>
>>> --- a/tests/kms_async_flips.c
>>> +++ b/tests/kms_async_flips.c
>>> @@ -326,6 +326,9 @@ static void test_async_flip(data_t *data)
>>>          struct timeval start, end, diff;
>>>          int suspend_time = RUN_TIME / 2;
>>>
>>> +       igt_plane_set_fb(data->overlay_plane, &data->bufs[0]);
>>> +       igt_display_try_commit_atomic(&data->display, 
>>> DRM_MODE_ATOMIC_ALLOW_MODESET, data);
>>> +
>>>          igt_display_commit2(&data->display, data- 
>>> >display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>>>
>>>
>>>
>>> If either alternate-sync-async-flip or alternate-sync-async-flip- 
>>> atomic is run before overlay-atomic, overlay-atomic will SUCCESS 
>>> (tested on phoenix APU)
>>>
>>> Cheers,
>>> Alex Hung
>>>
>>>> Thanks,
>>>>       André
>>>>
>>>>> IGT-Version: 1.30-g8fee6d12c (x86_64) (Linux: 6.11.0-18-generic 
>>>>> x86_64)
>>>>> Using IGT_SRANDOM=1740510058 for randomisation
>>>>> Opened device: /dev/dri/card1
>>>>> Starting subtest: overlay-atomic
>>>>> Starting dynamic subtest: pipe-A-DP-1
>>>>> (kms_async_flips:3180096) CRITICAL: Test assertion failure function 
>>>>> test_async_flip, file ../tests/kms_async_flips.c:361:
>>>>> (kms_async_flips:3180096) CRITICAL: Failed assertion: ret == 0
>>>>> (kms_async_flips:3180096) CRITICAL: Last errno: 22, Invalid argument
>>>>> (kms_async_flips:3180096) CRITICAL: error: -22 != 0
>>>>> Stack trace:
>>>>> Dynamic subtest pipe-A-DP-1 failed.
>>>>> **** DEBUG ****
>>>>> (kms_async_flips:3180096) DEBUG: Test requirement passed: ! 
>>>>> (is_joiner_mode(data->drm_fd, data->output))
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>>>>> format=XR24(0x34325258), modifier=0x0, size=0)
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>> igt_create_fb_with_bo_size(handle=1, pitch=13824)
>>>>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>>>>> passed: igt_has_fb_modifiers(fd)
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>>>>> format=XR24(0x34325258), modifier=0x0, size=0)
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>> igt_create_fb_with_bo_size(handle=2, pitch=13824)
>>>>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>>>>> passed: igt_has_fb_modifiers(fd)
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>>>>> format=XR24(0x34325258), modifier=0x0, size=0)
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>> igt_create_fb_with_bo_size(handle=3, pitch=13824)
>>>>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>>>>> passed: igt_has_fb_modifiers(fd)
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>>>>> format=XR24(0x34325258), modifier=0x0, size=0)
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>> igt_create_fb_with_bo_size(handle=4, pitch=13824)
>>>>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>>>>> passed: igt_has_fb_modifiers(fd)
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>>>>> format=XR24(0x34325258), modifier=0x0, size=0)
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>> igt_create_fb_with_bo_size(handle=5, pitch=13824)
>>>>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>>>>> passed: igt_has_fb_modifiers(fd)
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>>>>> format=XR24(0x34325258), modifier=0x0, size=0)
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>> igt_create_fb_with_bo_size(handle=6, pitch=13824)
>>>>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>>>>> passed: igt_has_fb_modifiers(fd)
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>>>>> format=XR24(0x34325258), modifier=0x0, size=0)
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>> igt_create_fb_with_bo_size(handle=7, pitch=13824)
>>>>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>>>>> passed: igt_has_fb_modifiers(fd)
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>> igt_create_fb_with_bo_size(width=3440, height=1440, 
>>>>> format=XR24(0x34325258), modifier=0x0, size=0)
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: 
>>>>> igt_create_fb_with_bo_size(handle=8, pitch=13824)
>>>>> (kms_async_flips:3180096) ioctl_wrappers-DEBUG: Test requirement 
>>>>> passed: igt_has_fb_modifiers(fd)
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>> (kms_async_flips:3180096) igt_fb-DEBUG: Test requirement passed: 
>>>>> cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: 
>>>>> plane_set_fb(151)
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: 
>>>>> plane_set_size (3440x1440)
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: 
>>>>> fb_set_position(0,0)
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: 
>>>>> fb_set_size(3440x1440)
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.0: 
>>>>> plane_set_size (3440x1440)
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>>> plane_set_fb(151)
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>>> plane_set_size (3440x1440)
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>>> fb_set_position(0,0)
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>>> fb_set_size(3440x1440)
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>>> plane_set_size (3440x1440)
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: commit {
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: Pipe A: Setting property 
>>>>> "MODE_ID" to 0x96/150
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: Pipe A: Setting property 
>>>>> "ACTIVE" to 0x1/1
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating 
>>>>> plane data: A.0, fb 151
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting 
>>>>> property "SRC_X" to 0x0/0
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting 
>>>>> property "SRC_Y" to 0x0/0
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting 
>>>>> property "SRC_W" to 0xd700000/225443840
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting 
>>>>> property "SRC_H" to 0x5a00000/94371840
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting 
>>>>> property "CRTC_W" to 0xd70/3440
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting 
>>>>> property "CRTC_H" to 0x5a0/1440
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting 
>>>>> property "FB_ID" to 0x97/151
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting 
>>>>> property "CRTC_ID" to 0x5b/91
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting 
>>>>> property "COLOR_ENCODING" to 0x1/1
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.0: Setting 
>>>>> property "COLOR_RANGE" to 0x0/0
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating 
>>>>> plane data: A.2, fb 151
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>> property "SRC_X" to 0x0/0
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>> property "SRC_Y" to 0x0/0
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>> property "SRC_W" to 0xd700000/225443840
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>> property "SRC_H" to 0x5a00000/94371840
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>> property "CRTC_W" to 0xd70/3440
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>> property "CRTC_H" to 0x5a0/1440
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>> property "FB_ID" to 0x97/151
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>> property "CRTC_ID" to 0x5b/91
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating 
>>>>> plane data: B.0, fb 0
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane B.0: Setting 
>>>>> property "COLOR_ENCODING" to 0x0/0
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane B.0: Setting 
>>>>> property "COLOR_RANGE" to 0x0/0
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating 
>>>>> plane data: C.0, fb 0
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane C.0: Setting 
>>>>> property "COLOR_ENCODING" to 0x0/0
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane C.0: Setting 
>>>>> property "COLOR_RANGE" to 0x0/0
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating 
>>>>> plane data: D.0, fb 0
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane D.0: Setting 
>>>>> property "COLOR_ENCODING" to 0x0/0
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane D.0: Setting 
>>>>> property "COLOR_RANGE" to 0x0/0
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating 
>>>>> plane data: E.0, fb 0
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane E.0: Setting 
>>>>> property "COLOR_ENCODING" to 0x0/0
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane E.0: Setting 
>>>>> property "COLOR_RANGE" to 0x0/0
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating 
>>>>> plane data: F.0, fb 0
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane F.0: Setting 
>>>>> property "COLOR_ENCODING" to 0x0/0
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane F.0: Setting 
>>>>> property "COLOR_RANGE" to 0x0/0
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     DP-1: 
>>>>> preparing atomic, pipe: A
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: DP-1: Setting property 
>>>>> "CRTC_ID" to 0x5b/91
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: }
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>>> plane_set_fb(154)
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>>> plane_set_size (3440x1440)
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>>> fb_set_position(0,0)
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: A.2: 
>>>>> fb_set_size(3440x1440)
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: commit {
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display:     populating 
>>>>> plane data: A.2, fb 154
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>> property "SRC_X" to 0x0/0
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>> property "SRC_Y" to 0x0/0
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>> property "SRC_W" to 0xd700000/225443840
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>> property "SRC_H" to 0x5a00000/94371840
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>> property "CRTC_W" to 0xd70/3440
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>> property "CRTC_H" to 0x5a0/1440
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>> property "FB_ID" to 0x9a/154
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: plane A.2: Setting 
>>>>> property "CRTC_ID" to 0x5b/91
>>>>> (kms_async_flips:3180096) igt_kms-DEBUG: display: }
>>>>> (kms_async_flips:3180096) CRITICAL: Test assertion failure function 
>>>>> test_async_flip, file ../tests/kms_async_flips.c:361:
>>>>> (kms_async_flips:3180096) CRITICAL: Failed assertion: ret == 0
>>>>> (kms_async_flips:3180096) CRITICAL: Last errno: 22, Invalid argument
>>>>> (kms_async_flips:3180096) CRITICAL: error: -22 != 0
>>>>> (kms_async_flips:3180096) igt_core-INFO: Stack trace:
>>>>> ****  END  ****
>>>>> Dynamic subtest pipe-A-DP-1: FAIL (0.227s)
>>>>>
>>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>> Thanks!
>>>>>>>
>>>>>>>> Vitaly
>>>>>>>>
>>>>>>>>> Please add to Cc Vitaly from AMD:
>>>>>>>>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>>>>>>>>
>>>>>>>>> Also add Jeevan here:
>>>>>>>>> Cc: Jeevan B <jeevan.b@intel.com>
>>>>>>>>>
>>>>>>>>> Regards,
>>>>>>>>> Kamil
>>>>>>>>>
>>>>>>>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>>>>>>>>> ---
>>>>>>>>>> v2: Add test description for GitLab compilation
>>>>>>>>>> ---
>>>>>>>>>>    tests/kms_async_flips.c | 45 ++++++++++++++++++++++++++++++ 
>>>>>>>>>> + + + + +++----
>>>>>>>>>>    1 file changed, 41 insertions(+), 4 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>>>>>>>>>> index 4a72be7b5..dd0907d50 100644
>>>>>>>>>> --- a/tests/kms_async_flips.c
>>>>>>>>>> +++ b/tests/kms_async_flips.c
>>>>>>>>>> @@ -89,6 +89,9 @@
>>>>>>>>>>     *
>>>>>>>>>>     * SUBTEST: async-flip-suspend-resume
>>>>>>>>>>     * Description: Verify the async flip functionality with 
>>>>>>>>>> suspend and resume cycle
>>>>>>>>>> + *
>>>>>>>>>> + * SUBTEST: overlay-atomic
>>>>>>>>>> + * Description: Verify overlay planes with async flips in 
>>>>>>>>>> atomic API
>>>>>>>>>>     */
>>>>>>>>>>    #define CURSOR_POS 128
>>>>>>>>>> @@ -109,12 +112,14 @@ typedef struct {
>>>>>>>>>>        uint32_t crtc_id;
>>>>>>>>>>        uint32_t refresh_rate;
>>>>>>>>>>        struct igt_fb bufs[NUM_FBS];
>>>>>>>>>> +    struct igt_fb bufs_overlay[NUM_FBS];
>>>>>>>>>>        igt_display_t display;
>>>>>>>>>>        igt_output_t *output;
>>>>>>>>>>        unsigned long flip_timestamp_us;
>>>>>>>>>>        double flip_interval;
>>>>>>>>>>        uint64_t modifier;
>>>>>>>>>>        igt_plane_t *plane;
>>>>>>>>>> +    igt_plane_t *overlay_plane;
>>>>>>>>>>        igt_pipe_crc_t *pipe_crc;
>>>>>>>>>>        igt_crc_t ref_crc;
>>>>>>>>>>        int flip_count;
>>>>>>>>>> @@ -126,6 +131,7 @@ typedef struct {
>>>>>>>>>>        bool allow_fail;
>>>>>>>>>>        struct buf_ops *bops;
>>>>>>>>>>        bool atomic_path;
>>>>>>>>>> +    bool overlay_path;
>>>>>>>>>>    } data_t;
>>>>>>>>>>    static void flip_handler(int fd_, unsigned int sequence, 
>>>>>>>>>> unsigned int tv_sec,
>>>>>>>>>> @@ -226,6 +232,8 @@ static void test_init(data_t *data)
>>>>>>>>>>        igt_output_set_pipe(data->output, data->pipe);
>>>>>>>>>>        data->plane = igt_output_get_plane_type(data->output, 
>>>>>>>>>> DRM_PLANE_TYPE_PRIMARY);
>>>>>>>>>> +    if (data->overlay_path)
>>>>>>>>>> +        data->overlay_plane = igt_output_get_plane_type(data- 
>>>>>>>>>> >output, DRM_PLANE_TYPE_OVERLAY);
>>>>>>>>>>    }
>>>>>>>>>>    static void test_init_fbs(data_t *data)
>>>>>>>>>> @@ -246,16 +254,27 @@ static void test_init_fbs(data_t *data)
>>>>>>>>>>            prev_modifier = data->modifier;
>>>>>>>>>>            if (data->bufs[0].fb_id) {
>>>>>>>>>> -            for (i = 0; i < NUM_FBS; i++)
>>>>>>>>>> +            for (i = 0; i < NUM_FBS; i++) {
>>>>>>>>>>                    igt_remove_fb(data->drm_fd, &data->bufs[i]);
>>>>>>>>>> +                if (data->overlay_path)
>>>>>>>>>> +                    igt_remove_fb(data->drm_fd, &data- 
>>>>>>>>>> >bufs_overlay[i]);
>>>>>>>>>> +            }
>>>>>>>>>>            }
>>>>>>>>>> -        for (i = 0; i < NUM_FBS; i++)
>>>>>>>>>> +        for (i = 0; i < NUM_FBS; i++) {
>>>>>>>>>>                make_fb(data, &data->bufs[i], width, height, i);
>>>>>>>>>> +            if (data->overlay_path)
>>>>>>>>>> +                make_fb(data, &data->bufs_overlay[i], width, 
>>>>>>>>>> height, i);
>>>>>>>>>> +        }
>>>>>>>>>>        }
>>>>>>>>>>        igt_plane_set_fb(data->plane, &data->bufs[0]);
>>>>>>>>>>        igt_plane_set_size(data->plane, width, height);
>>>>>>>>>> +
>>>>>>>>>> +    if (data->overlay_path) {
>>>>>>>>>> +        igt_plane_set_fb(data->overlay_plane, &data->bufs[0]);
>>>>>>>>>> +        igt_plane_set_size(data->overlay_plane, width, height);
>>>>>>>>>> +    }
>>>>>>>>>>    }
>>>>>>>>>>    static bool async_flip_needs_extra_frame(data_t *data)
>>>>>>>>>> @@ -283,12 +302,17 @@ static bool 
>>>>>>>>>> async_flip_needs_extra_frame(data_t *data)
>>>>>>>>>>    static int perform_flip(data_t *data, int frame, int flags)
>>>>>>>>>>    {
>>>>>>>>>>        int ret;
>>>>>>>>>> +    igt_plane_t *plane;
>>>>>>>>>> +    struct igt_fb *bufs;
>>>>>>>>>> +
>>>>>>>>>> +    plane = data->overlay_path ? data->overlay_plane : data- 
>>>>>>>>>> >plane;
>>>>>>>>>> +    bufs = data->overlay_path ? data->bufs_overlay : data->bufs;
>>>>>>>>>>        if (!data->atomic_path) {
>>>>>>>>>>            ret = drmModePageFlip(data->drm_fd, data->crtc_id,
>>>>>>>>>> -                      data->bufs[frame % NUM_FBS].fb_id, 
>>>>>>>>>> flags, data);
>>>>>>>>>> +                     bufs[frame % NUM_FBS].fb_id, flags, data);
>>>>>>>>>>        } else {
>>>>>>>>>> -        igt_plane_set_fb(data->plane, &data->bufs[frame % 
>>>>>>>>>> NUM_FBS]);
>>>>>>>>>> +        igt_plane_set_fb(plane, &data->bufs[frame % NUM_FBS]);
>>>>>>>>>>            ret = igt_display_try_commit_atomic(&data->display, 
>>>>>>>>>> flags, data);
>>>>>>>>>>        }
>>>>>>>>>> @@ -772,6 +796,7 @@ igt_main
>>>>>>>>>>            igt_subtest_with_dynamic("async-flip-with-page- 
>>>>>>>>>> flip- events") {
>>>>>>>>>>                data.alternate_sync_async = false;
>>>>>>>>>>                data.atomic_path = false;
>>>>>>>>>> +            data.overlay_path = false;
>>>>>>>>>>                if (is_intel_device(data.drm_fd))
>>>>>>>>>>                    run_test_with_modifiers(&data, 
>>>>>>>>>> test_async_flip);
>>>>>>>>>>                else
>>>>>>>>>> @@ -783,6 +808,7 @@ igt_main
>>>>>>>>>>            igt_subtest_with_dynamic("async-flip-with-page- 
>>>>>>>>>> flip- events-atomic") {
>>>>>>>>>>                data.alternate_sync_async = false;
>>>>>>>>>>                data.atomic_path = true;
>>>>>>>>>> +            data.overlay_path = false;
>>>>>>>>>>                if (is_intel_device(data.drm_fd))
>>>>>>>>>>                    run_test_with_modifiers(&data, 
>>>>>>>>>> test_async_flip);
>>>>>>>>>>                else
>>>>>>>>>> @@ -793,6 +819,7 @@ igt_main
>>>>>>>>>>            igt_subtest_with_dynamic("alternate-sync-async- 
>>>>>>>>>> flip") {
>>>>>>>>>>                data.alternate_sync_async = true;
>>>>>>>>>>                data.atomic_path = false;
>>>>>>>>>> +            data.overlay_path = false;
>>>>>>>>>>                run_test(&data, test_async_flip);
>>>>>>>>>>            }
>>>>>>>>>> @@ -800,7 +827,17 @@ igt_main
>>>>>>>>>>            igt_subtest_with_dynamic("alternate-sync-async- 
>>>>>>>>>> flip- atomic") {
>>>>>>>>>>                data.alternate_sync_async = true;
>>>>>>>>>>                data.atomic_path = true;
>>>>>>>>>> +            data.overlay_path = false;
>>>>>>>>>> +            run_test(&data, test_async_flip);
>>>>>>>>>> +        }
>>>>>>>>>> +
>>>>>>>>>> +        igt_describe("Verify overlay planes with async flips 
>>>>>>>>>> in atomic API");
>>>>>>>>>> +        igt_subtest_with_dynamic("overlay-atomic") {
>>>>>>>>>> +            igt_require(is_amdgpu_device(data.drm_fd));
>>>>>>>>>> +            data.atomic_path = true;
>>>>>>>>>> +            data.overlay_path = true;
>>>>>>>>>>                run_test(&data, test_async_flip);
>>>>>>>>>> +            data.overlay_path = false;
>>>>>>>>>>            }
>>>>>>>>>>            igt_describe("Verify that the async flip timestamp 
>>>>>>>>>> does not "
>>>>>>>>>> -- 
>>>>>>>>>> 2.47.1
>>>>>>>>>>
>>>>>
>>>>>
>>>>
>>>
>>>
>>
> 

