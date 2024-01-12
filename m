Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 12 Jan 2024 18:43:31 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlQkFUOiBmYWlsdXI=?= =?utf-8?Q?e?= for
 tests/intel/xe_exec_store: don't pass gt_id as bind queue
Message-ID: <20240112174331.jv3mo7acbpbrfszk@kamilkon-desk.igk.intel.com>
References: <20240111090152.296752-1-matthew.auld@intel.com>
 <170497200787.271298.14081014318331454784@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170497200787.271298.14081014318331454784@5338d5abeb45>
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

Hi igt-dev,
On 2024-01-11 at 11:20:07 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_exec_store: don't pass gt_id as bind queue
> URL   : https://patchwork.freedesktop.org/series/128560/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7669_BAT -> XEIGTPW_10510_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_10510_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_10510_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_10510_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:
>     - bat-pvc-2:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10510/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html
> 

This is unrelated to change in xe_exec_store test.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_10510_BAT that come from known issues:
> 

...cut...

> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7669 -> IGTPW_10510
>   * Linux: xe-617-bda9437030d914aefcbc145d3be1a9f5f05ea693 -> xe-618-79184e72263e91528195db01783148435c7e4fad
> 
>   IGTPW_10510: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10510/index.html
>   IGT_7669: 418064e40ca6399700b0548983fdb679be4d855b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-617-bda9437030d914aefcbc145d3be1a9f5f05ea693: bda9437030d914aefcbc145d3be1a9f5f05ea693
>   xe-618-79184e72263e91528195db01783148435c7e4fad: 79184e72263e91528195db01783148435c7e4fad
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10510/index.html
