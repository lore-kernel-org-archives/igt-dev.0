Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 13 Dec 2023 16:11:49 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] =?utf-8?B?4pyXIENJLnhlQkFU?= =?utf-8?Q?=3A?= failure
 for Initial SR-IOV validation (rev8)
Message-ID: <20231213151149.pkmb42fh2oayhvss@kamilkon-desk.igk.intel.com>
References: <20231205081618.18143-1-lukasz.laguna@intel.com>
 <170178631718.24285.11991045043018542795@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170178631718.24285.11991045043018542795@emeril.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

this is unrelated to new sr-iov (sriov) libs and tests.

Regards,
Kamil

On 2023-12-05 at 14:25:17 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Initial SR-IOV validation (rev8)
> URL   : https://patchwork.freedesktop.org/series/126034/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7620_BAT -> XEIGTPW_10335_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_10335_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_10335_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 4)
> ------------------------------
> 
>   Additional (1): bat-dg2-oem2 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_10335_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-edp-1:
>     - bat-adlp-7:         NOTRUN -> [FAIL][1] +3 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-edp-1.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_evict@evict-beng-small-external:
>     - bat-pvc-2:          [SKIP][2] ([Intel XE#688]) -> [FAIL][3] +3 other tests fail
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
>     - bat-pvc-2:          [FAIL][4] -> [SKIP][5] +32 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_mmap@vram:
>     - bat-adlp-7:         [FAIL][6] -> [SKIP][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7620/bat-adlp-7/igt@xe_mmap@vram.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/bat-adlp-7/igt@xe_mmap@vram.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_10335_BAT that come from known issues:
> 
> ### IGT changes ###

[...cut...]

> 
> Build changes
> -------------
> 
>   * IGT: IGT_7620 -> IGTPW_10335
>   * Linux: xe-549-9c26345b7aaf1e2fa46cf8ee34b60d587790d600 -> xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b
> 
>   IGTPW_10335: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10335/index.html
>   IGT_7620: 6714b814e7f82743abf45c33361fbe057a22880a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-549-9c26345b7aaf1e2fa46cf8ee34b60d587790d600: 9c26345b7aaf1e2fa46cf8ee34b60d587790d600
>   xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b: ac7b89571d802765762e7c15d78a6dcd5d92c41b
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10335/index.html
