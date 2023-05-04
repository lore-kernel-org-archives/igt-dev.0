Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3A710E1A5
 for <igt-dev@lists.freedesktop.org>; Thu,  4 May 2023 17:09:06 +0000 (UTC)
Message-ID: <d0f0a206-e6ca-22d1-5725-1a5343656bd9@intel.com>
Date: Thu, 4 May 2023 22:38:41 +0530
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Karthik B S <karthik.b.s@intel.com>
References: <20230504145438.257055-1-mcanal@igalia.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230504145438.257055-1-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_flip: Check if is Intel
 device before doing all the setup
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



On Thu-04-05-2023 08:24 pm, Maíra Canal wrote:
> The tests bo-too-big and bo-too-big-interruptible should only run on
> Intel devices. Instead of checking this condition after doing all the
> setup, check this condition in the beginning of the test.
> 
> Checking if is an Intel device in the beginning of the test will also
> avoid the following error, which occurs in non-Intel devices when
> running the test bo-too-big:
> 
> (kms_flip:1641) igt_kms-CRITICAL: Test assertion failure function kmstest_set_connector_dpms, file ../lib/igt_kms.c:1960:
> (kms_flip:1641) igt_kms-CRITICAL: Failed assertion: found_it
> (kms_flip:1641) igt_kms-CRITICAL: Last errno: 9, Bad file descriptor
> (kms_flip:1641) igt_kms-CRITICAL: DPMS property not found on 36
> Stack trace:
>      #0 ../lib/igt_core.c:1963 __igt_fail_assert()
>      #1 ../lib/igt_kms.c:1960 kmstest_set_connector_dpms()
>      #2 ../lib/igt_core.c:2831 igt_atexit_handler()
>      #3 /usr/src/debug/glibc-2.36-9.fc37.x86_64/stdlib/exit.c:114 __run_exit_handlers()
>      #4 /usr/src/debug/glibc-2.36-9.fc37.x86_64/stdlib/fmtmsg.c:292 internal_addseverity()
>      #5 ../lib/igt_core.c:2297 igt_exit()
>      #6 [main+0x32]
>      #7 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
>      #8 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>      #9 [_start+0x25]
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
> 
> v1 -> v2:
> 
> - As kms_flip is using dynamic subtests, no need to trigger the skip. So, just
> return if it is not an intel device (Bhanuprakash Modem).
> - Add the same check for 2x tests (Bhanuprakash Modem).
> 
> ---
>   tests/kms_flip.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index e4c98b8e..ae94b15e 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1354,7 +1354,6 @@ restart:
>   	/* 256 MB is usually the maximum mappable aperture,
>   	 * (make it 4x times that to ensure failure) */
>   	if (o->flags & TEST_BO_TOOBIG) {
> -		igt_skip_on(!is_intel_device(drm_fd));
>   		bo_size = 4*gem_mappable_aperture_size(drm_fd);
>   
>   		if (is_i915_device(drm_fd))
> @@ -1566,6 +1565,9 @@ static void run_test(int duration, int flags)
>   	if (is_xe_device(drm_fd) && flags & TEST_FENCE_STRESS)
>   		return;
>   
> +	if (flags & TEST_BO_TOOBIG && !is_intel_device(drm_fd))
> +		return;
> +
>   	igt_require((flags & TEST_HANG) == 0 ||
>   		    (is_i915_device(drm_fd) && !is_wedged(drm_fd)));
>   	igt_require(!(flags & TEST_FENCE_STRESS) ||
> @@ -1639,6 +1641,9 @@ static void run_pair(int duration, int flags)
>   	if (is_xe_device(drm_fd) && flags & TEST_FENCE_STRESS)
>   		return;
>   
> +	if (flags & TEST_BO_TOOBIG && !is_intel_device(drm_fd))
> +		return;

LGTM
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu

> +
>   	igt_require((flags & TEST_HANG) == 0 ||
>   		    (is_i915_device(drm_fd) && !is_wedged(drm_fd)));
>   	igt_require(!(flags & TEST_FENCE_STRESS) ||
