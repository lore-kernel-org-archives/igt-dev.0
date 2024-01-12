Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 12 Jan 2024 18:39:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests=2Fintel?=
 =?utf-8?Q?=2Fgem=5Fexec=5Fschedule=3A?= Update for MTL RCS/CCS w/a (rev3)
Message-ID: <20240112173944.zfdu2oe55vsez5pt@kamilkon-desk.igk.intel.com>
References: <20240111185645.4056250-1-John.C.Harrison@Intel.com>
 <170500449210.290000.1016677963749010043@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170500449210.290000.1016677963749010043@5338d5abeb45>
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
On 2024-01-11 at 20:21:32 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_exec_schedule: Update for MTL RCS/CCS w/a (rev3)
> URL   : https://patchwork.freedesktop.org/series/128342/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7670_BAT -> XEIGTPW_10513_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_10513_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_10513_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_10513_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
>     - bat-dg2-oem2:       [PASS][1] -> [SKIP][2] +1 other test skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7670/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10513/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
>     - bat-dg2-oem2:       [PASS][3] -> [TIMEOUT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7670/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10513/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
> 
>   * igt@xe_evict@evict-mixed-threads-small:
>     - bat-atsm-2:         [PASS][5] -> [DMESG-WARN][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7670/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10513/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html
> 

This is unrelated to gem_ (i915) test.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_10513_BAT that come from known issues:
> 

[...cut...]

>   
>   [Intel XE#1009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1009
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7670 -> IGTPW_10513
>   * Linux: xe-618-79184e72263e91528195db01783148435c7e4fad -> xe-619-85bad57174d54b8cd91e4ce3da9fe7091d53d98c
> 
>   IGTPW_10513: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10513/index.html
>   IGT_7670: 1b32bcdb2d9965090234739aba891a90743e01c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-618-79184e72263e91528195db01783148435c7e4fad: 79184e72263e91528195db01783148435c7e4fad
>   xe-619-85bad57174d54b8cd91e4ce3da9fe7091d53d98c: 85bad57174d54b8cd91e4ce3da9fe7091d53d98c
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10513/index.html
