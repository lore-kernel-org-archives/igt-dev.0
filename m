Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 7 Dec 2023 15:16:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?=
 for tests/intel/xe_pat: limit number of dynamic tests
Message-ID: <20231207141641.dntxo5rw2nugdcgw@kamilkon-desk.igk.intel.com>
References: <20231206121203.270852-1-matthew.auld@intel.com>
 <170187336815.26425.10955147857289494593@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170187336815.26425.10955147857289494593@emeril.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: lgci.bug.filing@intel.com, I915-ci-infra@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

this are unrelated to Xe test.

Regards,
Kamil

On 2023-12-06 at 14:36:08 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_pat: limit number of dynamic tests
> URL   : https://patchwork.freedesktop.org/series/127429/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7623_full -> IGTPW_10352_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10352_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10352_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10352/index.html
> 
> Participating hosts (8 -> 7)
> ------------------------------
> 
>   Missing    (1): shard-glk-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10352_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_lmem_swapping@heavy-verify-random@lmem0:
>     - shard-dg2:          NOTRUN -> [ABORT][1] +4 other tests abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10352/shard-dg2-2/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html
>     - shard-dg1:          NOTRUN -> [ABORT][2] +4 other tests abort
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10352/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
>     - shard-tglu:         NOTRUN -> [WARN][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10352/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
> 
>   * igt@i915_selftest@live@gt_lrc:
>     - shard-mtlp:         [PASS][4] -> [DMESG-WARN][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7623/shard-mtlp-7/igt@i915_selftest@live@gt_lrc.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10352/shard-mtlp-8/igt@i915_selftest@live@gt_lrc.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-dg2:          NOTRUN -> [SKIP][6]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10352/shard-dg2-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-tglu:         NOTRUN -> [SKIP][7]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10352/shard-tglu-9/igt@kms_pm_backlight@basic-brightness.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-dg2:          [ABORT][8] -> [INCOMPLETE][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7623/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10352/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10352_full that come from known issues:
> 

[...cut...]


> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10352/index.html
