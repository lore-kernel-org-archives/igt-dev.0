Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A00589B20
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Aug 2021 06:04:15 +0000 (UTC)
Date: Tue, 31 Aug 2021 09:06:29 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YS3G5TE3itejdbTb@platvala-desk.ger.corp.intel.com>
References: <20210830162232.1328594-1-robdclark@gmail.com>
 <163034309381.14976.10026239798210863296@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163034309381.14976.10026239798210863296@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgSW5pdGlh?=
 =?utf-8?q?l_igt_tests_for_drm/msm_ioctls_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Aug 30, 2021 at 05:04:53PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Initial igt tests for drm/msm ioctls (rev3)
> URL   : https://patchwork.freedesktop.org/series/93973/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_10536 -> IGTPW_6173
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_6173 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_6173, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6173/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_6173:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:
>     - fi-tgl-1115g4:      [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10536/fi-tgl-1115g4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6173/fi-tgl-1115g4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html


Lakshmi, false positive here.


-- 
Petri Latvala



> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_6173 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@amdgpu/amd_cs_nop@sync-fork-compute0:
>     - fi-snb-2600:        NOTRUN -> [SKIP][3] ([fdo#109271]) +17 similar issues
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6173/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@hangcheck:
>     - fi-snb-2600:        [INCOMPLETE][4] ([i915#3921]) -> [PASS][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10536/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6173/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
>   [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
> 
> 
> Participating hosts (44 -> 34)
> ------------------------------
> 
>   Missing    (10): fi-ilk-m540 fi-rkl-guc bat-adls-5 bat-dg1-6 bat-dg1-5 fi-bsw-cyan fi-kbl-guc fi-ctg-p8600 fi-bdw-samus bat-jsl-1 
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6191 -> IGTPW_6173
> 
>   CI-20190529: 20190529
>   CI_DRM_10536: b6d834a72c14ca22b2df32a607c1ee36e8629f1a @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_6173: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6173/index.html
>   IGT_6191: e9292b533691784f46eeb9bae522ca7a8710c920 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
> 
> == Testlist changes ==
> 
> +igt@msm_submit@empty-submit
> +igt@msm_submit@invalid-cmd-idx-submit
> +igt@msm_submit@invalid-cmd-type-submit
> +igt@msm_submit@invalid-duplicate-bo-submit
> +igt@msm_submit@invalid-flags-submit
> +igt@msm_submit@invalid-in-fence-submit
> +igt@msm_submit@invalid-queue-submit
> +igt@msm_submit@valid-submit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6173/index.html
