Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11ED810E190
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Nov 2023 18:58:20 +0000 (UTC)
Message-ID: <486ab228-3db5-4eea-a90a-c27477203c67@collabora.com>
Date: Wed, 8 Nov 2023 18:58:15 +0000
MIME-Version: 1.0
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 bhanuprakash.modem@intel.com, igt-dev@lists.freedesktop.org
References: <20231108062902.390248-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniels@collabora.com>
In-Reply-To: <20231108062902.390248-1-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3] lib/igt_kms: Fix memory corruption
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: helen.koike@collabora.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Vignesh,

On 08/11/2023 06:29, Vignesh Raman wrote:
> In crosvm

Strictly speaking, the change is in virtio-gpu (the kernel driver 
providing KMS), not crosvm (the KVM host for the kernel), but this is an 
unimportant detail.


> , the kernel reports 16 for count_crtcs, which exceeds
> IGT_MAX_PIPES set to 8. The function igt_display_require allocates
> memory for IGT_MAX_PIPES members of igt_pipe_t structures, but then
> writes into it based on the count_crtcs reported by the kernel,
> resulting in memory corruption.
>
>   [...]
>   # Received signal SIGABRT.
>   # Stack trace:
>   #  #0 [fatal_sig_handler+0x17b]
>   #  #1 [__sigaction+0x40]
>   #  #2 [pthread_key_delete+0x14c]
>   #  #3 [gsignal+0x12]
>   #  #4 [abort+0xd3]
>   #  #5 [__fsetlocking+0x290]
>   #  #6 [timer_settime+0x37a]
>   #  #7 [__default_morecore+0x1f1b]
>   #  #8 [__libc_calloc+0x161]
>   #  #9 [drmModeGetPlaneResources+0x44]
>   #  #10 [igt_display_require+0x194]
>   #  #11 [__igt_unique____real_main1356+0x93c]
>   #  #12 [main+0x3f]
>   #  #13 [__libc_init_first+0x8a]
>   #  #14 [__libc_start_main+0x85]
>   #  #15 [_start+0x21]
>
> Increase IGT_MAX_PIPES to 16 to fix this memory corruption issue.
> igt_display_require initializes display and allocate resources as
> a prerequisite for the tests. Fail the test if count_crtcs exceeds
> IGT_MAX_PIPES with debug information.
>
> This fix is required for drm-ci to run igt tests on virtio-gpu.

The rest is all good though, so this change is:
Reviewed-by: Daniel Stone <daniels@collabora.com>

Thanks,
Daniel
