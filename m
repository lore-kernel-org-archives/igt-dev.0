Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 12 Jan 2024 18:51:08 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlQkFUOiBmYWlsdXI=?= =?utf-8?Q?e?= for
 tests/perf_pmu: Set defaults before frequency test
Message-ID: <20240112175108.fzcjnuko7ufoehqd@kamilkon-desk.igk.intel.com>
References: <20240111222054.2403101-1-vinay.belgaumkar@intel.com>
 <170501970390.290000.6603325616123794587@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170501970390.290000.6603325616123794587@5338d5abeb45>
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
On 2024-01-12 at 00:35:03 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/perf_pmu: Set defaults before frequency test
> URL   : https://patchwork.freedesktop.org/series/128695/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7670_BAT -> XEIGTPW_10517_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_10517_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_10517_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_10517_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
>     - bat-dg2-oem2:       [PASS][1] -> [SKIP][2] +1 other test skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7670/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10517/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_10517_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch:
>     - bat-pvc-2:          [INCOMPLETE][3] -> [PASS][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7670/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10517/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html
> 
>   

Unrelated, this is i915 test.

Regards,
Kamil

> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7670 -> IGTPW_10517
>   * Linux: xe-618-79184e72263e91528195db01783148435c7e4fad -> xe-621-3095fbb4deb0722d417b6a4ad4213e2ed9ecd052
> 
>   IGTPW_10517: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10517/index.html
>   IGT_7670: 1b32bcdb2d9965090234739aba891a90743e01c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-618-79184e72263e91528195db01783148435c7e4fad: 79184e72263e91528195db01783148435c7e4fad
>   xe-621-3095fbb4deb0722d417b6a4ad4213e2ed9ecd052: 3095fbb4deb0722d417b6a4ad4213e2ed9ecd052
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10517/index.html
