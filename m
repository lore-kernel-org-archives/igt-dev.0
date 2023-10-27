Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E6B10E96E
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Oct 2023 09:56:15 +0000 (UTC)
Message-ID: <2b05e124-6772-ec09-1b50-f1dbfa860d57@intel.com>
Date: Fri, 27 Oct 2023 15:25:52 +0530
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 <igt-dev@lists.freedesktop.org>
References: <20231026022041.1851831-1-vignesh.raman@collabora.com>
 <59230665-790f-4bd8-37b4-30b5446127f7@intel.com>
 <7421357d-5adf-85b4-de1a-30eee373d86b@collabora.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <7421357d-5adf-85b4-de1a-30eee373d86b@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_kms: Fix memory corruption
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: helen.koike@collabora.com, daniels@collabora.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Vignesh,

On Thu-26-10-2023 03:15 pm, Vignesh Raman wrote:
> Hi Bhanu,
> 
> On 26/10/23 10:18, Modem, Bhanuprakash wrote:
> 
>> Why don't we use n_pipes = count_crtcs (before allocating the memory)?
>>
>> -       display->n_pipes = IGT_MAX_PIPES;
>> +       display->n_pipes = resources->count_crtcs;
>>
> 
> If we dynamically allocate memory for display->pipes using count_crtcs 
> instead of IGT_MAX_PIPES, subtest all-pipes is failing in the below tests,
> kms_cursor_legacy@forked-bo
> kms_cursor_legacy@forked-move
> kms_cursor_legacy@single-bo
> kms_cursor_legacy@single-move
> kms_cursor_legacy@torture-bo
> kms_cursor_legacy@torture-move
> 
> Starting dynamic subtest: all-pipes
> Stack trace:
>    #0 ../lib/igt_core.c:1988 __igt_fail_assert()
>    #1 ../tests/kms_cursor_legacy.c:138 stress.constprop.0()
>    #2 ../tests/kms_cursor_legacy.c:1942 __igt_unique____real_main1887()
>    #3 ../tests/kms_cursor_legacy.c:1887 main()
>    #4 [__libc_init_first+0x8a]
>    #5 [__libc_start_main+0x85]
>    #6 [_start+0x21]
> child 0 failed with exit status 98
> Dynamic subtest all-pipes: FAIL (0.021s)
> Subtest forked-bo: FAIL (43.029s)
> Test requirement not met in function igt_require_pipe_crc, file 
> ../lib/igt_pipe_crc.c:211:
> Test requirement: fstatat(dir, "crtc-0/crc/control", &stat, 0) == 0
> CRCs not supported on this platform
> Last errno: 2, No such file or directory
> Test requirement not met in function igt_require_intel, file 
> ../lib/drmtest.c:787:
> Test requirement: is_intel_device(fd)
> Last errno: 2, No such file or directory
> stderr:
> -------
> (kms_cursor_legacy:721) CRITICAL: Test assertion failure function 
> stress, file ../tests/kms_cursor_legacy.c:158:
> (kms_cursor_legacy:721) CRITICAL: Failed assertion: 
> igt_ioctl((display->drm_fd), ((((2U|1U) << (((0+8)+8)+14)) | ((('d')) << 
> (0+8)) | (((0xA3)) << 0) | ((((sizeof(struct drm_mode_cursor)))) << 
> ((0+8)+8)))), (&arg)) == 0
> (kms_cursor_legacy:721) CRITICAL: Last errno: 2, No such file or directory
> (kms_cursor_legacy:721) CRITICAL: error: -1 != 0
> (kms_cursor_legacy:722) CRITICAL: Test assertion failure function 
> stress, file ../tests/kms_cursor_legacy.c:158:
> (kms_cursor_legacy:722) CRITICAL: Failed assertion: 
> igt_ioctl((display->drm_fd), ((((2U|1U) << (((0+8)+8)+14)) | ((('d')) << 
> (0+8)) | (((0xA3)) << 0) | ((((sizeof(struct drm_mode_cursor)))) << 
> ((0+8)+8)))), (&arg)) == 0
> (kms_cursor_legacy:722) CRITICAL: Last errno: 2, No such file or directory
> (kms_cursor_legacy:722) CRITICAL: error: -1 != 0
> Dynamic subtest all-pipes failed.
> 
> With the initial patch all-pipes subtest was passing.

Looks, these tests are considering crtc count as display->n_pipes (16), 
but for_each_pipe() operates on IGT_MAX_PIPES (8) causing the failures.

> 
> 
>>> -    for (i = 0; i < resources->count_crtcs; i++) {
>>> +    for (i = 0; i < min(resources->count_crtcs, IGT_MAX_PIPES); i++) {
>>
>> With this change, we are missing the information of crtc index 7 to 15 
>> in the display structure, aren't we?
> 
> Yes agree. Do we need to fix the all-pipes subtest failure with your 
> proposed solution?

IMHO, increasing IGT_MAX_PIPES to 16 would be the simplest solution.

@@ -68,8 +68,15 @@ enum pipe {
          PIPE_D,
          PIPE_E,
          PIPE_F,
          PIPE_G,
          PIPE_H,
+        PIPE_I,
+        PIPE_J,
+        PIPE_K,
+        PIPE_L,
+        PIPE_M,
+        PIPE_N,
+        PIPE_O,
          IGT_MAX_PIPES
  };

- Bhanu

> 
> Regards,
> Vignesh
