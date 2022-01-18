Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCD510E1F2
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jan 2022 08:30:35 +0000 (UTC)
Date: Tue, 18 Jan 2022 10:28:56 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YeZ6SPvQ5WXEcMG0@platvala-desk.ger.corp.intel.com>
References: <20220117133246.33810-1-jouni.hogander@intel.com>
 <164242984395.28492.9925598859329611749@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164242984395.28492.9925598859329611749@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Iga21zX3Bz?=
 =?utf-8?q?r2=5Fsu=3A_Fix_igt=5Ffixture_handling?=
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
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jan 17, 2022 at 02:30:43PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: kms_psr2_su: Fix igt_fixture handling
> URL   : https://patchwork.freedesktop.org/series/98948/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_11090 -> IGTPW_6559
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_6559 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_6559, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6559/index.html
> 
> Participating hosts (47 -> 41)
> ------------------------------
> 
>   Missing    (6): shard-tglu fi-bsw-cyan shard-rkl shard-dg1 bat-jsl-2 fi-bdw-samus 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_6559:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-dg1-5:          [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11090/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6559/bat-dg1-5/igt@i915_selftest@live@hangcheck.html

Lakshmi, false hit here.


-- 
Petri Latvala


> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_6559 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_flink_basic@bad-flink:
>     - fi-skl-6600u:       [PASS][3] -> [FAIL][4] ([i915#4547])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11090/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6559/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html
> 
>   * igt@i915_selftest@live@execlists:
>     - fi-bsw-n3050:       [PASS][5] -> [INCOMPLETE][6] ([i915#2940])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11090/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6559/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-dg1-6:          [PASS][7] -> [DMESG-FAIL][8] ([i915#4494])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11090/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6559/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@runner@aborted:
>     - fi-bsw-n3050:       NOTRUN -> [FAIL][9] ([fdo#109271] / [i915#1436] / [i915#2722] / [i915#3428] / [i915#4312])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6559/fi-bsw-n3050/igt@runner@aborted.html
>     - fi-skl-6600u:       NOTRUN -> [FAIL][10] ([i915#4312])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6559/fi-skl-6600u/igt@runner@aborted.html
> 
>   
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
>   [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
>   [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
>   [i915#3428]: https://gitlab.freedesktop.org/drm/intel/issues/3428
>   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
>   [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
>   [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6327 -> IGTPW_6559
> 
>   CI-20190529: 20190529
>   CI_DRM_11090: f088829d829541382c32e13bb8d9317b0f4a4865 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_6559: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6559/index.html
>   IGT_6327: 0d559158c2d3b5723abbfc2cb4b04532e28663b2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6559/index.html
