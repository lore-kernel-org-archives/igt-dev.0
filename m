Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 15 Jan 2024 14:43:54 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmbw==?= =?utf-8?Q?r?=
 tests/intel/xe_exec_compute_mode: Fix non-blocking subtest
Message-ID: <20240115134354.n43qiyqnwyvlk64q@kamilkon-desk.igk.intel.com>
References: <20240115031942.29658-1-sai.gowtham.ch@intel.com>
 <170529184723.386718.5134695795318875851@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170529184723.386718.5134695795318875851@5338d5abeb45>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: lgci.bug.filing@intel.com, I915-ci-infra@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi igt-dev,
On 2024-01-15 at 04:10:47 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_exec_compute_mode: Fix non-blocking subtest
> URL   : https://patchwork.freedesktop.org/series/128762/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14121 -> IGTPW_10530
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10530 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10530, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10530/index.html
> 
> Participating hosts (32 -> 34)
> ------------------------------
> 
>   Additional (3): bat-dg2-8 bat-kbl-2 bat-dg2-9 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10530:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@hangcheck:
>     - fi-skl-guc:         [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14121/fi-skl-guc/igt@i915_selftest@live@hangcheck.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10530/fi-skl-guc/igt@i915_selftest@live@hangcheck.html
> 

This is unrelated to Xe test, no need for respin nor fill IGT tests.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10530 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@fbdev@info:
>     - bat-kbl-2:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1849])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10530/bat-kbl-2/igt@fbdev@info.html
> 

...cut...

> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7673 -> IGTPW_10530
> 
>   CI-20190529: 20190529
>   CI_DRM_14121: 771f65be648bbe45f9adaae7f3a1cbc31faab9ae @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10530: 10530
>   IGT_7673: 7673
> 
> 
> Testlist changes
> ----------------
> 
> -igt@syncobj_timeline@wait-all-available-delayed-submit
> -igt@syncobj_timeline@wait-available-delayed-submit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10530/index.html
