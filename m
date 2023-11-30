Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 30 Nov 2023 15:07:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231130140706.s3fhrtjmeitegrpi@kamilkon-desk.igk.intel.com>
References: <20231130032130.2709-1-quic_abhinavk@quicinc.com>
 <170131887097.15646.16663714203706169165@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170131887097.15646.16663714203706169165@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fwriteback=3A_fix_kms=5Fwriteback_failure_for_XRGB8888_onl?=
 =?utf-8?q?y_devices?=
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

below change is unrelated to kmw_writeback tests.

Regards,
Kamil

On 2023-11-30 at 04:34:30 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_writeback: fix kms_writeback failure for XRGB8888 only devices
> URL   : https://patchwork.freedesktop.org/series/127097/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13951 -> IGTPW_10298
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10298 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10298, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10298/index.html
> 
> Participating hosts (36 -> 35)
> ------------------------------
> 
>   Additional (2): bat-kbl-2 bat-mtlp-8 
>   Missing    (3): bat-jsl-1 fi-snb-2520m bat-dg1-5 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10298:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gt_timelines:
>     - bat-rpls-1:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13951/bat-rpls-1/igt@i915_selftest@live@gt_timelines.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10298/bat-rpls-1/igt@i915_selftest@live@gt_timelines.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-dp-5:
>     - bat-adlp-11:        [PASS][3] -> [FAIL][4] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13951/bat-adlp-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-dp-5.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10298/bat-adlp-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-dp-5.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10298 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - bat-mtlp-8:         NOTRUN -> [SKIP][5] ([i915#9318])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10298/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html

[...cut...]

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7610 -> IGTPW_10298
> 
>   CI-20190529: 20190529
>   CI_DRM_13951: 7bd342323d5bd405b02fd21cd78f157f363278ac @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10298: 10298
>   IGT_7610: 7610
> 
> 
> Testlist changes
> ----------------
> 
> -igt@kms_vrr@seamless-rr-switch
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10298/index.html
