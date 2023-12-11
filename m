Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 11 Dec 2023 13:46:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests=2Finte?=
 =?utf-8?B?bC94ZV9leGVjX3N0b3Jl?= =?utf-8?Q?=3A?= Test to check
 CONDITIONAL_BATCH_BUFFER_END (rev3)
Message-ID: <20231211124644.leizajsmxlenwzia@kamilkon-desk.igk.intel.com>
References: <20231208051831.2276393-1-priyanka.dandamudi@intel.com>
 <170205443792.7327.4591888345893014129@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170205443792.7327.4591888345893014129@emeril.freedesktop.org>
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

Hi,

this is unrelated to Xe subtest,

Regards,
Kamil

On 2023-12-08 at 16:53:57 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_exec_store: Test to check CONDITIONAL_BATCH_BUFFER_END (rev3)
> URL   : https://patchwork.freedesktop.org/series/127123/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13997_full -> IGTPW_10378_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10378_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10378_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10378/index.html
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10378_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane@pixel-format-source-clamping@pipe-a:
>     - shard-mtlp:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13997/shard-mtlp-2/igt@kms_plane@pixel-format-source-clamping@pipe-a.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10378/shard-mtlp-5/igt@kms_plane@pixel-format-source-clamping@pipe-a.html
> 
>   * igt@perf@blocking@0-rcs0:
>     - shard-glk:          [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13997/shard-glk7/igt@perf@blocking@0-rcs0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10378/shard-glk1/igt@perf@blocking@0-rcs0.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10378_full that come from known issues:
> 
> ### IGT changes ###
> 

[...cut...]

> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7628 -> IGTPW_10378
> 
>   CI-20190529: 20190529
>   CI_DRM_13997: b8c52dddcf3b2e88a54e5e5cd6973ccc5880b31d @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10378: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10378/index.html
>   IGT_7628: 431c2d2dd5828b25fcbe1c82afbac865f4771aee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10378/index.html
