Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 12 Jan 2024 13:39:31 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/xe_exec_store: Remove redundant code
Message-ID: <20240112123931.jzta2yhvu7teb3xe@kamilkon-desk.igk.intel.com>
References: <20240112074902.2455804-1-janga.rahul.kumar@intel.com>
 <170504819487.332087.4706617168133748424@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170504819487.332087.4706617168133748424@5338d5abeb45>
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
On 2024-01-12 at 08:29:54 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_exec_store: Remove redundant code
> URL   : https://patchwork.freedesktop.org/series/128704/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7671 -> IGTPW_10521
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10521 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10521, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10521/index.html
> 
> Participating hosts (39 -> 38)
> ------------------------------
> 
>   Additional (1): bat-dg2-8 
>   Missing    (2): bat-rpls-2 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10521:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-dg2-9:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7671/bat-dg2-9/igt@i915_selftest@live@hangcheck.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10521/bat-dg2-9/igt@i915_selftest@live@hangcheck.html
>     - fi-skl-guc:         [PASS][3] -> [DMESG-FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7671/fi-skl-guc/igt@i915_selftest@live@hangcheck.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10521/fi-skl-guc/igt@i915_selftest@live@hangcheck.html
> 
>   

These are unrelated to Xe test, no need for respin.

Regards,
Kamil

> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10521 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - bat-jsl-1:          NOTRUN -> [SKIP][5] ([i915#9318])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10521/bat-jsl-1/igt@debugfs_test@basic-hwmon.html
> 

[...cut...]

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7671 -> IGTPW_10521
> 
>   CI-20190529: 20190529
>   CI_DRM_14116: 3b92a66f4bc89f4fa6e9e9369ac8243e23670030 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10521: 10521
>   IGT_7671: 7671
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10521/index.html
