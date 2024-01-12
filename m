Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 12 Jan 2024 18:45:17 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_series_startin?=
 =?utf-8?Q?g?= with [1/2] lib/amdgpu: add secure flag to sdma packet
Message-ID: <20240112174517.lgzevxcgbkevj3jg@kamilkon-desk.igk.intel.com>
References: <20240111192553.113902-1-vitaly.prosyak@amd.com>
 <170500822933.290001.14312049240469862391@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170500822933.290001.14312049240469862391@5338d5abeb45>
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
On 2024-01-11 at 21:23:49 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [1/2] lib/amdgpu: add secure flag to sdma packet
> URL   : https://patchwork.freedesktop.org/series/128689/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7670_BAT -> XEIGTPW_10514_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_10514_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_10514_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_10514_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
>     - bat-dg2-oem2:       [PASS][1] -> [SKIP][2] +1 other test skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7670/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10514/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
> 

Unrelated to amdgpu test.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_10514_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch:
>     - bat-pvc-2:          [INCOMPLETE][3] -> [PASS][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7670/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10514/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html
> 
>   
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7670 -> IGTPW_10514
>   * Linux: xe-618-79184e72263e91528195db01783148435c7e4fad -> xe-619-85bad57174d54b8cd91e4ce3da9fe7091d53d98c
> 
>   IGTPW_10514: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10514/index.html
>   IGT_7670: 1b32bcdb2d9965090234739aba891a90743e01c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-618-79184e72263e91528195db01783148435c7e4fad: 79184e72263e91528195db01783148435c7e4fad
>   xe-619-85bad57174d54b8cd91e4ce3da9fe7091d53d98c: 85bad57174d54b8cd91e4ce3da9fe7091d53d98c
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10514/index.html
