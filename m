Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF8C10E4D7
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jan 2024 18:22:42 +0000 (UTC)
Date: Thu, 4 Jan 2024 19:22:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/3] test/kms_async_flips: fix test abortion due to
 unreadable mod name
Message-ID: <20240104182216.zpy62w4p7c3tvjvj@kamilkon-desk.igk.intel.com>
References: <20231226191054.23794-1-mwen@igalia.com>
 <20231226191054.23794-2-mwen@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231226191054.23794-2-mwen@igalia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kernel-dev@igalia.com, Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Melissa,
On 2023-12-26 at 17:57:32 -0100, Melissa Wen wrote:
> When looking for names of non-intel modifiers, igt_fb_modifier_name()
> returns "?" which causes run_test_with_modifiers abortion and therefore
> a regression to `async-flip-with-page-flip-events` test case, as below:
> 
> (kms_async_flips:9663) igt_core-CRITICAL: Invalid dynamic subtest name "pipe-A-eDP-1-?".
> kms_async_flips: ../lib/igt_core.c:2296: igt_exit: Assertion `!test_with_subtests || skipped_one || succeeded_one || failed_one' failed.
> Received signal SIGABRT.
> Stack trace:
>  #0 [fatal_sig_handler+0x17b]
>  #1 [__sigaction+0x40]
>  #2 [pthread_key_delete+0x14c]
>  #3 [gsignal+0x12]
>  #4 [abort+0xd3]
>  #5 [<unknown>+0xd3]
>  #6 [__assert_fail+0x42]
>  #7 [igt_exit+0x1ca]
>  #8 [__igt_run_dynamic_subtest+0x122]
>  #9 [run_test_with_modifiers.constprop.0+0x1c7]
>  #10 [__igt_unique____real_main635+0x56b]
>  #11 [main+0x27]
>  #12 [__libc_init_first+0x8a]
>  #13 [__libc_start_main+0x85]
>  #14 [_start+0x21]
> Aborted
> 
> Replacing "?" with "unknown" solves the issue and async flip tests run
> again.
> 
> Fixes: 7fa7602ccf ("tests/kms_async_flips: Test all modifiers")
> Signed-off-by: Melissa Wen <mwen@igalia.com>

LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 683eb176b..2cf94013e 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -4951,6 +4951,6 @@ const char *igt_fb_modifier_name(uint64_t modifier)
>  	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
>  		return "4-rc-ccs-cc";
>  	default:
> -		return "?";
> +		return "unknown";
>  	}
>  }
> -- 
> 2.43.0
> 
