Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2480510E1DB
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Dec 2023 14:01:50 +0000 (UTC)
Date: Thu, 7 Dec 2023 15:01:43 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmbw==?=
 =?utf-8?Q?r?= tests/xe_spin_batch: Add spin-fixed-duration-with-preempter
Message-ID: <20231207140143.chpiqxpdxi4tflg4@kamilkon-desk.igk.intel.com>
References: <20231205154333.32554-1-nirmoy.das@intel.com>
 <170181668288.24286.2790748835088103806@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170181668288.24286.2790748835088103806@emeril.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

this is unrelated to Xe test.

Regards,
Kamil

On 2023-12-05 at 22:51:22 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/xe_spin_batch: Add spin-fixed-duration-with-preempter
> URL   : https://patchwork.freedesktop.org/series/127369/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7622_full -> IGTPW_10341_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10341_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10341_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10341/index.html
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10341_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_lmem_swapping@basic@lmem0:
>     - shard-dg1:          NOTRUN -> [ABORT][1] +11 other tests abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10341/shard-dg1-18/igt@gem_lmem_swapping@basic@lmem0.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random@lmem0:
>     - shard-dg2:          NOTRUN -> [ABORT][2] +10 other tests abort
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10341/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10341/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>     - shard-mtlp:         NOTRUN -> [SKIP][4] +3 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10341/shard-mtlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
> 
>   * igt@kms_flip@flip-vs-modeset-vs-hang@a-hdmi-a1:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10341/shard-glk6/igt@kms_flip@flip-vs-modeset-vs-hang@a-hdmi-a1.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-tglu:         NOTRUN -> [SKIP][6]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10341/shard-tglu-10/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_vblank@query-forked-busy-hang@pipe-a-edp-1:
>     - shard-mtlp:         [PASS][7] -> [INCOMPLETE][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7622/shard-mtlp-4/igt@kms_vblank@query-forked-busy-hang@pipe-a-edp-1.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10341/shard-mtlp-4/igt@kms_vblank@query-forked-busy-hang@pipe-a-edp-1.html
> 
>   
> #### Suppressed ####
> 

[...cut...]

> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10341/index.html
