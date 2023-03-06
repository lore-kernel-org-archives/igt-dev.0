Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD48E10E099
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Mar 2023 09:32:36 +0000 (UTC)
Message-ID: <895ba3be-8a8a-e200-df81-c5ca4f3149b8@intel.com>
Date: Mon, 6 Mar 2023 10:32:16 +0100
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>
References: <20230301120905.1019314-1-karolina.stolarek@intel.com>
 <167809417666.4159.2875746413622431499@emeril.freedesktop.org>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <167809417666.4159.2875746413622431499@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fexercise=5Fblt=3A_Don=27t_allow_hangs_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sai Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 6.03.2023 10:16, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/gem_exercise_blt: Don't allow hangs (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/114513/ 
> <https://patchwork.freedesktop.org/series/114513/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/index.html>
> 
> 
>   CI Bug Log - changes from IGT_7180 -> IGTPW_8556
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_8556 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8556, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/index.html
> 
> 
>     Participating hosts (3 -> 12)

This is really strange, there should be at least 40 of them. My IGT 
change shouldn't prevent the machines from booting, something is going 
on with CI...

> 
> ERROR: It appears as if the changes made in IGTPW_8556 prevented too 
> many machines from booting.
> 
> Additional (11): bat-dg1-7 bat-adls-5 bat-adlp-9 bat-dg1-5 bat-dg2-8 
> bat-adlm-1 bat-dg2-9 bat-adlp-6 bat-adln-1 bat-dg2-11 bat-jsl-1
> Missing (2): bat-atsm-1 fi-snb-2520m
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_8556 that come from known issues:

I reviewed the list of failures, and the test I changed isn't listed 
here. These failures are unrelated to my patch.

Thanks,
Karolina

> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@debugfs_test@basic-hwmon:
> 
>       o
> 
>         bat-adls-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adls-5/igt@debugfs_test@basic-hwmon.html> (i915#7456 <https://gitlab.freedesktop.org/drm/intel/issues/7456>)
> 
>       o
> 
>         bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlp-9/igt@debugfs_test@basic-hwmon.html> (i915#7456 <https://gitlab.freedesktop.org/drm/intel/issues/7456>)
> 
>       o
> 
>         bat-adln-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adln-1/igt@debugfs_test@basic-hwmon.html> (i915#7456 <https://gitlab.freedesktop.org/drm/intel/issues/7456>)
> 
>       o
> 
>         bat-adlm-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlm-1/igt@debugfs_test@basic-hwmon.html> (i915#7456 <https://gitlab.freedesktop.org/drm/intel/issues/7456>)
> 
>       o
> 
>         bat-jsl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-jsl-1/igt@debugfs_test@basic-hwmon.html> (i915#7456 <https://gitlab.freedesktop.org/drm/intel/issues/7456>)
> 
>       o
> 
>         bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlp-6/igt@debugfs_test@basic-hwmon.html> (i915#7456 <https://gitlab.freedesktop.org/drm/intel/issues/7456>)
> 
>   *
> 
>     igt@fbdev@info:
> 
>       o bat-adlm-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlm-1/igt@fbdev@info.html> (i915#2582 <https://gitlab.freedesktop.org/drm/intel/issues/2582>) +4 similar issues
>   *
> 
>     igt@fbdev@write:
> 
>       o bat-dg1-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-7/igt@fbdev@write.html> (i915#2582 <https://gitlab.freedesktop.org/drm/intel/issues/2582>) +4 similar issues
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o bat-jsl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-jsl-1/igt@gem_huc_copy@huc-copy.html> (i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@basic:
> 
>       o bat-adln-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adln-1/igt@gem_lmem_swapping@basic.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3 similar issues
>   *
> 
>     igt@gem_lmem_swapping@random-engines:
> 
>       o
> 
>         bat-adlm-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlm-1/igt@gem_lmem_swapping@random-engines.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3 similar issues
> 
>       o
> 
>         bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlp-9/igt@gem_lmem_swapping@random-engines.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3 similar issues
> 
>       o
> 
>         bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlp-6/igt@gem_lmem_swapping@random-engines.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3 similar issues
> 
>       o
> 
>         bat-adls-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adls-5/igt@gem_lmem_swapping@random-engines.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3 similar issues
> 
>   *
> 
>     igt@gem_lmem_swapping@verify-random:
> 
>       o bat-jsl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3 similar issues
>   *
> 
>     igt@gem_mmap@basic:
> 
>       o
> 
>         bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-11/igt@gem_mmap@basic.html> (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>)
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-5/igt@gem_mmap@basic.html> (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>)
> 
>       o
> 
>         bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-8/igt@gem_mmap@basic.html> (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>)
> 
>       o
> 
>         bat-dg1-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-7/igt@gem_mmap@basic.html> (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>)
> 
>       o
> 
>         bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-9/igt@gem_mmap@basic.html> (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>)
> 
>   *
> 
>     igt@gem_mmap_gtt@basic:
> 
>       o bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-9/igt@gem_mmap_gtt@basic.html> (i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +2 similar issues
>   *
> 
>     igt@gem_render_tiled_blits@basic:
> 
>       o
> 
>         bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-8/igt@gem_render_tiled_blits@basic.html> (i915#4079 <https://gitlab.freedesktop.org/drm/intel/issues/4079>) +1 similar issue
> 
>       o
> 
>         bat-dg1-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-7/igt@gem_render_tiled_blits@basic.html> (i915#4079 <https://gitlab.freedesktop.org/drm/intel/issues/4079>) +1 similar issue
> 
>       o
> 
>         bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-9/igt@gem_render_tiled_blits@basic.html> (i915#4079 <https://gitlab.freedesktop.org/drm/intel/issues/4079>) +1 similar issue
> 
>   *
> 
>     igt@gem_tiled_blits@basic:
> 
>       o
> 
>         bat-dg1-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-7/igt@gem_tiled_blits@basic.html> (i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +2 similar issues
> 
>       o
> 
>         bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-11/igt@gem_tiled_blits@basic.html> (i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +2 similar issues
> 
>   *
> 
>     igt@gem_tiled_fence_blits@basic:
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-5/igt@gem_tiled_fence_blits@basic.html> (i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +2 similar issues
> 
>       o
> 
>         bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-8/igt@gem_tiled_fence_blits@basic.html> (i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +2 similar issues
> 
>   *
> 
>     igt@gem_tiled_pread_basic:
> 
>       o
> 
>         bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlp-9/igt@gem_tiled_pread_basic.html> (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
> 
>       o
> 
>         bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlp-6/igt@gem_tiled_pread_basic.html> (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
> 
>       o
> 
>         bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-11/igt@gem_tiled_pread_basic.html> (i915#4079 <https://gitlab.freedesktop.org/drm/intel/issues/4079>) +1 similar issue
> 
>       o
> 
>         bat-adls-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adls-5/igt@gem_tiled_pread_basic.html> (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
> 
>       o
> 
>         bat-adln-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adln-1/igt@gem_tiled_pread_basic.html> (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-5/igt@gem_tiled_pread_basic.html> (i915#4079 <https://gitlab.freedesktop.org/drm/intel/issues/4079>) +1 similar issue
> 
>       o
> 
>         bat-adlm-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlm-1/igt@gem_tiled_pread_basic.html> (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
> 
>   *
> 
>     igt@i915_pm_backlight@basic-brightness:
> 
>       o
> 
>         bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlp-9/igt@i915_pm_backlight@basic-brightness.html> (i915#7561 <https://gitlab.freedesktop.org/drm/intel/issues/7561>)
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-5/igt@i915_pm_backlight@basic-brightness.html> (i915#7561 <https://gitlab.freedesktop.org/drm/intel/issues/7561>)
> 
>       o
> 
>         bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-8/igt@i915_pm_backlight@basic-brightness.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#7561 <https://gitlab.freedesktop.org/drm/intel/issues/7561>)
> 
>       o
> 
>         bat-dg1-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-7/igt@i915_pm_backlight@basic-brightness.html> (i915#7561 <https://gitlab.freedesktop.org/drm/intel/issues/7561>)
> 
>       o
> 
>         bat-adlm-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlm-1/igt@i915_pm_backlight@basic-brightness.html> (i915#7561 <https://gitlab.freedesktop.org/drm/intel/issues/7561>)
> 
>       o
> 
>         bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-9/igt@i915_pm_backlight@basic-brightness.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#7561 <https://gitlab.freedesktop.org/drm/intel/issues/7561>)
> 
>       o
> 
>         bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-11/igt@i915_pm_backlight@basic-brightness.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#7561 <https://gitlab.freedesktop.org/drm/intel/issues/7561>)
> 
>   *
> 
>     igt@i915_pm_rps@basic-api:
> 
>       o
> 
>         bat-dg1-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-7/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
> 
>       o
> 
>         bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-11/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
> 
>       o
> 
>         bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlp-9/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
> 
>       o
> 
>         bat-adln-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adln-1/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-5/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
> 
>       o
> 
>         bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-8/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
> 
>       o
> 
>         bat-adlm-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlm-1/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
> 
>       o
> 
>         bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-9/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
> 
>       o
> 
>         bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlp-6/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
> 
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o bat-adls-5: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adls-5/igt@i915_selftest@live@hangcheck.html> (i915#5591 <https://gitlab.freedesktop.org/drm/intel/issues/5591>)
>   *
> 
>     igt@i915_selftest@live@slpc:
> 
>       o bat-adln-1: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adln-1/igt@i915_selftest@live@slpc.html> (i915#6997 <https://gitlab.freedesktop.org/drm/intel/issues/6997>)
>   *
> 
>     igt@i915_suspend@basic-s3-without-i915:
> 
>       o
> 
>         bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-8/igt@i915_suspend@basic-s3-without-i915.html> (i915#6645 <https://gitlab.freedesktop.org/drm/intel/issues/6645>)
> 
>       o
> 
>         bat-adln-1: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adln-1/igt@i915_suspend@basic-s3-without-i915.html> (i915#7443 <https://gitlab.freedesktop.org/drm/intel/issues/7443>)
> 
>   *
> 
>     igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
> 
>       o
> 
>         bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-11/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html> (i915#4212 <https://gitlab.freedesktop.org/drm/intel/issues/4212>) +7 similar issues
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-5/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html> (i915#4212 <https://gitlab.freedesktop.org/drm/intel/issues/4212>) +7 similar issues
> 
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o
> 
>         bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
> 
>       o
> 
>         bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
> 
>       o
> 
>         bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
> 
>   *
> 
>     igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>       o
> 
>         bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html> (i915#4215 <https://gitlab.freedesktop.org/drm/intel/issues/4215> / i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
> 
>       o
> 
>         bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html> (i915#4215 <https://gitlab.freedesktop.org/drm/intel/issues/4215> / i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html> (i915#4215 <https://gitlab.freedesktop.org/drm/intel/issues/4215>)
> 
>       o
> 
>         bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html> (i915#4215 <https://gitlab.freedesktop.org/drm/intel/issues/4215> / i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
> 
>       o
> 
>         bat-dg1-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html> (i915#4215 <https://gitlab.freedesktop.org/drm/intel/issues/4215>)
> 
>   *
> 
>     igt@kms_addfb_basic@clobberred-modifier:
> 
>       o
> 
>         bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-9/igt@kms_addfb_basic@clobberred-modifier.html> (i915#4212 <https://gitlab.freedesktop.org/drm/intel/issues/4212>) +7 similar issues
> 
>       o
> 
>         bat-dg1-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-7/igt@kms_addfb_basic@clobberred-modifier.html> (i915#4212 <https://gitlab.freedesktop.org/drm/intel/issues/4212>) +7 similar issues
> 
>   *
> 
>     igt@kms_addfb_basic@tile-pitch-mismatch:
> 
>       o bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-8/igt@kms_addfb_basic@tile-pitch-mismatch.html> (i915#4212 <https://gitlab.freedesktop.org/drm/intel/issues/4212>) +7 similar issues
>   *
> 
>     igt@kms_busy@basic:
> 
>       o bat-dg1-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-7/igt@kms_busy@basic.html> (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845> / i915#4303 <https://gitlab.freedesktop.org/drm/intel/issues/4303>)
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-read:
> 
>       o bat-jsl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-jsl-1/igt@kms_chamelium_edid@dp-edid-read.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +8 similar issues
>   *
> 
>     igt@kms_chamelium_edid@hdmi-edid-read:
> 
>       o
> 
>         bat-adln-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adln-1/igt@kms_chamelium_edid@hdmi-edid-read.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +7 similar issues
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-5/igt@kms_chamelium_edid@hdmi-edid-read.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +8 similar issues
> 
>       o
> 
>         bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-8/igt@kms_chamelium_edid@hdmi-edid-read.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +8 similar issues
> 
>   *
> 
>     igt@kms_chamelium_edid@vga-edid-read:
> 
>       o bat-adlm-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlm-1/igt@kms_chamelium_edid@vga-edid-read.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +8 similar issues
>   *
> 
>     igt@kms_chamelium_frames@hdmi-crc-fast:
> 
>       o bat-dg1-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-7/igt@kms_chamelium_frames@hdmi-crc-fast.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +8 similar issues
>   *
> 
>     igt@kms_chamelium_hpd@common-hpd-after-suspend:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-11/igt@kms_chamelium_hpd@common-hpd-after-suspend.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +8 similar issues
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-fast:
> 
>       o bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlp-6/igt@kms_chamelium_hpd@dp-hpd-fast.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +8 similar issues
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-fast:
> 
>       o bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-9/igt@kms_chamelium_hpd@hdmi-hpd-fast.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +8 similar issues
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-fast:
> 
>       o
> 
>         bat-adls-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adls-5/igt@kms_chamelium_hpd@vga-hpd-fast.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +8 similar issues
> 
>       o
> 
>         bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlp-9/igt@kms_chamelium_hpd@vga-hpd-fast.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +8 similar issues
> 
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>       o
> 
>         bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlp-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>) +1 similar issue
> 
>       o
> 
>         bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>) +1 similar issue
> 
>       o
> 
>         bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>) +1 similar issue
> 
>       o
> 
>         bat-adls-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adls-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>) +1 similar issue
> 
>       o
> 
>         bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>) +1 similar issue
> 
>       o
> 
>         bat-adln-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adln-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>) +1 similar issue
> 
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>) +1 similar issue
> 
>       o
> 
>         bat-jsl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>) +1 similar issue
> 
>       o
> 
>         bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>) +1 similar issue
> 
>   *
> 
>     igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
> 
>       o
> 
>         bat-dg1-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html> (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845>) +7 similar issues
> 
>       o
> 
>         bat-adlm-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html> (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845>) +15 similar issues
> 
>   *
> 
>     igt@kms_flip@basic-flip-vs-wf_vblank:
> 
>       o
> 
>         bat-dg1-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-7/igt@kms_flip@basic-flip-vs-wf_vblank.html> (i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637> / i915#4078 <https://gitlab.freedesktop.org/drm/intel/issues/4078>) +2 similar issues
> 
>       o
> 
>         bat-adlm-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlm-1/igt@kms_flip@basic-flip-vs-wf_vblank.html> (i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>) +3 similar issues
> 
>   *
> 
>     igt@kms_flip@basic-plain-flip:
> 
>       o bat-dg1-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-7/igt@kms_flip@basic-plain-flip.html> (i915#4078 <https://gitlab.freedesktop.org/drm/intel/issues/4078>) +1 similar issue
>   *
> 
>     igt@kms_force_connector_basic@force-load-detect:
> 
>       o
> 
>         bat-adls-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adls-5/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
> 
>       o
> 
>         bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
> 
>       o
> 
>         bat-adln-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adln-1/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-5/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
> 
>       o
> 
>         bat-jsl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
> 
>       o
> 
>         bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
> 
>       o
> 
>         bat-dg1-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-7/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
> 
>       o
> 
>         bat-adlm-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlm-1/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
> 
>       o
> 
>         bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlp-9/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
> 
>       o
> 
>         bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
> 
>       o
> 
>         bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-11/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
> 
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o
> 
>         bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/intel/issues/5274>)
> 
>       o
> 
>         bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/intel/issues/5274>)
> 
>       o
> 
>         bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/intel/issues/5274>)
> 
>   *
> 
>     igt@kms_frontbuffer_tracking@basic:
> 
>       o bat-adlm-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlm-1/igt@kms_frontbuffer_tracking@basic.html> (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849>)
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc:
> 
>       o bat-dg1-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-7/igt@kms_pipe_crc_basic@hang-read-crc.html> (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845> / i915#4078 <https://gitlab.freedesktop.org/drm/intel/issues/4078>) +6 similar issues
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +2 similar issues
>   *
> 
>     igt@kms_psr@cursor_plane_move:
> 
>       o
> 
>         bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlp-9/igt@kms_psr@cursor_plane_move.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +3 similar issues
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-5/igt@kms_psr@cursor_plane_move.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072> / i915#4078 <https://gitlab.freedesktop.org/drm/intel/issues/4078>) +3 similar issues
> 
>   *
> 
>     igt@kms_psr@primary_mmap_gtt:
> 
>       o
> 
>         bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-8/igt@kms_psr@primary_mmap_gtt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +3 similar issues
> 
>       o
> 
>         bat-dg1-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-7/igt@kms_psr@primary_mmap_gtt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +3 similar issues
> 
>       o
> 
>         bat-adlm-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlm-1/igt@kms_psr@primary_mmap_gtt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +3 similar issues
> 
>       o
> 
>         bat-jsl-1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-jsl-1/igt@kms_psr@primary_mmap_gtt.html> (i915#132 <https://gitlab.freedesktop.org/drm/intel/issues/132> / i915#3003 <https://gitlab.freedesktop.org/drm/intel/issues/3003>) +3 similar issues
> 
>   *
> 
>     igt@kms_psr@primary_page_flip:
> 
>       o
> 
>         bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-9/igt@kms_psr@primary_page_flip.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +3 similar issues
> 
>       o
> 
>         bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-11/igt@kms_psr@primary_page_flip.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +3 similar issues
> 
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o
> 
>         bat-adls-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adls-5/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
> 
>       o
> 
>         bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlp-9/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
> 
>       o
> 
>         bat-adln-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adln-1/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
> 
>       o
> 
>         bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
> 
>       o
> 
>         bat-adlm-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlm-1/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
> 
>       o
> 
>         bat-jsl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
> 
>       o
> 
>         bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
> 
>       o
> 
>         bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
> 
>       o
> 
>         bat-dg1-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-7/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
> 
>       o
> 
>         bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
> 
>   *
> 
>     igt@prime_vgem@basic-fence-flip:
> 
>       o
> 
>         bat-dg1-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-7/igt@prime_vgem@basic-fence-flip.html> (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845> / i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
> 
>       o
> 
>         bat-adlm-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlm-1/igt@prime_vgem@basic-fence-flip.html> (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845> / i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
> 
>       o
> 
>         bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
> 
>       o
> 
>         bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
> 
>       o
> 
>         bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
> 
>   *
> 
>     igt@prime_vgem@basic-fence-mmap:
> 
>       o bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-8/igt@prime_vgem@basic-fence-mmap.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +1 similar issue
>   *
> 
>     igt@prime_vgem@basic-fence-read:
> 
>       o
> 
>         bat-adlm-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlm-1/igt@prime_vgem@basic-fence-read.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +3 similar issues
> 
>       o
> 
>         bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-9/igt@prime_vgem@basic-fence-read.html> (i915#3291 <https://gitlab.freedesktop.org/drm/intel/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +2 similar issues
> 
>       o
> 
>         bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlp-6/igt@prime_vgem@basic-fence-read.html> (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295> / i915#3291 <https://gitlab.freedesktop.org/drm/intel/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +2 similar issues
> 
>       o
> 
>         bat-adls-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adls-5/igt@prime_vgem@basic-fence-read.html> (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295> / i915#3291 <https://gitlab.freedesktop.org/drm/intel/issues/3291>) +2 similar issues
> 
>       o
> 
>         bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlp-9/igt@prime_vgem@basic-fence-read.html> (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295> / i915#3291 <https://gitlab.freedesktop.org/drm/intel/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +2 similar issues
> 
>       o
> 
>         bat-adln-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adln-1/igt@prime_vgem@basic-fence-read.html> (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295> / i915#3291 <https://gitlab.freedesktop.org/drm/intel/issues/3291>) +2 similar issues
> 
>   *
> 
>     igt@prime_vgem@basic-gtt:
> 
>       o
> 
>         bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-9/igt@prime_vgem@basic-gtt.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +1 similar issue
> 
>       o
> 
>         bat-dg1-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-7/igt@prime_vgem@basic-gtt.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +1 similar issue
> 
>       o
> 
>         bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-11/igt@prime_vgem@basic-gtt.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +1 similar issue
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-5/igt@prime_vgem@basic-gtt.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +1 similar issue
> 
>   *
> 
>     igt@prime_vgem@basic-read:
> 
>       o
> 
>         bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-11/igt@prime_vgem@basic-read.html> (i915#3291 <https://gitlab.freedesktop.org/drm/intel/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +2 similar issues
> 
>       o
> 
>         bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-8/igt@prime_vgem@basic-read.html> (i915#3291 <https://gitlab.freedesktop.org/drm/intel/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +2 similar issues
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-5/igt@prime_vgem@basic-read.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +3 similar issues
> 
>       o
> 
>         bat-dg1-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-7/igt@prime_vgem@basic-read.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +2 similar issues
> 
>   *
> 
>     igt@prime_vgem@basic-userptr:
> 
>       o
> 
>         bat-adlp-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlp-9/igt@prime_vgem@basic-userptr.html> (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295> / i915#3301 <https://gitlab.freedesktop.org/drm/intel/issues/3301> / i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
> 
>       o
> 
>         bat-adlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adlp-6/igt@prime_vgem@basic-userptr.html> (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295> / i915#3301 <https://gitlab.freedesktop.org/drm/intel/issues/3301> / i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
> 
>       o
> 
>         bat-adln-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adln-1/igt@prime_vgem@basic-userptr.html> (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295> / i915#3301 <https://gitlab.freedesktop.org/drm/intel/issues/3301>)
> 
>       o
> 
>         bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-11/igt@prime_vgem@basic-userptr.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708> / i915#4873 <https://gitlab.freedesktop.org/drm/intel/issues/4873>)
> 
>       o
> 
>         bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-8/igt@prime_vgem@basic-userptr.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708> / i915#4873 <https://gitlab.freedesktop.org/drm/intel/issues/4873>)
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-5/igt@prime_vgem@basic-userptr.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708> / i915#4873 <https://gitlab.freedesktop.org/drm/intel/issues/4873>)
> 
>       o
> 
>         bat-jsl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-jsl-1/igt@prime_vgem@basic-userptr.html> (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295> / i915#3301 <https://gitlab.freedesktop.org/drm/intel/issues/3301>)
> 
>       o
> 
>         bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg2-9/igt@prime_vgem@basic-userptr.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708> / i915#4873 <https://gitlab.freedesktop.org/drm/intel/issues/4873>)
> 
>       o
> 
>         bat-dg1-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-dg1-7/igt@prime_vgem@basic-userptr.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708> / i915#4873 <https://gitlab.freedesktop.org/drm/intel/issues/4873>)
> 
>       o
> 
>         bat-adls-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/bat-adls-5/igt@prime_vgem@basic-userptr.html> (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295> / i915#3301 <https://gitlab.freedesktop.org/drm/intel/issues/3301>)
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7180 -> IGTPW_8556
> 
> CI-20190529: 20190529
> CI_DRM_12805: c1dbd5b5c8fdb5efd37a5a5234469b293c89a358 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8556: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8556/index.html
> IGT_7180: b6b1ceb4fc4d8f83a9540e4628a6c2648514bb19 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
