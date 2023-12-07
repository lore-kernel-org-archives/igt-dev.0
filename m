Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 7 Dec 2023 12:33:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] =?utf-8?B?4pyXIEZpLkNJLkJBVA==?= =?utf-8?Q?=3A?=
 failure for lib/xe_query: Fix xe_supports_faults()
Message-ID: <20231207113306.6rzkze3s4sstfexu@kamilkon-desk.igk.intel.com>
References: <20231207012623.15901-1-brian.welty@intel.com>
 <170191680784.28719.16159650094500296323@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170191680784.28719.16159650094500296323@emeril.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: I915-ci-infra@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

below failure is unrelated to Xe path fix. Please do not run
i915 BAT nor FULL.

Regards,
Kamil

On 2023-12-07 at 02:40:07 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/xe_query: Fix xe_supports_faults()
> URL   : https://patchwork.freedesktop.org/series/127467/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13990 -> IGTPW_10361
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10361 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10361, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10361/index.html
> 
> Participating hosts (37 -> 32)
> ------------------------------
> 
>   Missing    (5): bat-adls-5 bat-dg1-5 bat-dg2-9 fi-snb-2520m fi-pnv-d510 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10361:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-6:
>     - bat-adlp-11:        [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13990/bat-adlp-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-6.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10361/bat-adlp-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-6.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_13990 and IGTPW_10361:
> 
> ### New IGT tests (12) ###
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-7:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.01] s
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-7:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.85] s
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-7:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.90] s
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-7:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.18] s
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-7:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.98] s
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-7:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.89] s
> 
>   * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-7:
>     - Statuses : 1 abort(s)
>     - Exec time: [1.94] s
> 
>   * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-7:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.85] s
> 
>   * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-7:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.78] s
> 
>   * igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-7:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.06] s
> 
>   * igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-7:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.76] s
> 
>   * igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-7:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.78] s
> 
>   
> 
> Known issues
> ------------
> 

[...cut...]

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7626 -> IGTPW_10361
> 
>   CI-20190529: 20190529
>   CI_DRM_13990: 85d33d0ad82a5c1a71492f14a5ceb67ada6a22d8 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10361: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10361/index.html
>   IGT_7626: 154b7288552cd7ed3033f8ef396e88d0bd1b7646 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10361/index.html
