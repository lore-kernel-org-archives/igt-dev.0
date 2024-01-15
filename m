Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 15 Jan 2024 14:45:48 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests=2Finte?=
 =?utf-8?Q?l=2Fgem=5Fexec=5Fschedule=3A?= Update for MTL RCS/CCS w/a (rev4)
Message-ID: <20240115134548.w24pqthagoicssfq@kamilkon-desk.igk.intel.com>
References: <20240111185645.4056250-1-John.C.Harrison@Intel.com>
 <170513951837.370337.16726310028220778547@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170513951837.370337.16726310028220778547@5338d5abeb45>
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
On 2024-01-13 at 09:51:58 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_exec_schedule: Update for MTL RCS/CCS w/a (rev4)
> URL   : https://patchwork.freedesktop.org/series/128342/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7672_full -> IGTPW_10527_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10527_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10527_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10527/index.html
> 
> Participating hosts (8 -> 9)
> ------------------------------
> 
>   Additional (1): shard-snb-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10527_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-128:
>     - shard-mtlp:         [PASS][1] -> [FAIL][2] +6 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7672/shard-mtlp-5/igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-128.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10527/shard-mtlp-5/igt@kms_plane_cursor@overlay@pipe-d-edp-1-size-128.html
> 

This is unrelated,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10527_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-mtlp:         NOTRUN -> [SKIP][3] ([i915#8411])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10527/shard-mtlp-2/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7672 -> IGTPW_10527
> 
>   CI-20190529: 20190529
>   CI_DRM_14118: 962785f4613664f29663206aa3355dc292a252c0 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10527: 10527
>   IGT_7672: 16d7484a28cc1aaf2dfb9e9c73c011daf602d926 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10527/index.html
