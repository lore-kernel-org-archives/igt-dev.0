Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B1E10F6DD
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Feb 2022 13:52:59 +0000 (UTC)
Date: Wed, 23 Feb 2022 15:52:08 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YhY8CET3Mv43VkOR@platvala-desk.ger.corp.intel.com>
References: <20220223111641.467123-1-mauro.chehab@linux.intel.com>
 <164562411007.25291.6068477867899431106@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164562411007.25291.6068477867899431106@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIHN1?=
 =?utf-8?q?pport_to_collecr_code_coverage_data?=
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

On Wed, Feb 23, 2022 at 01:48:30PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add support to collecr code coverage data
> URL   : https://patchwork.freedesktop.org/series/100629/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_11271 -> IGTPW_6683
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_6683 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_6683, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6683/index.html
> 
> Participating hosts (51 -> 45)
> ------------------------------
> 
>   Missing    (6): fi-hsw-4200u fi-icl-u2 fi-bsw-cyan fi-ctg-p8600 bat-rpls-1 fi-bdw-samus 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_6683:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@workarounds:
>     - fi-bdw-5557u:       NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6683/fi-bdw-5557u/igt@i915_selftest@live@workarounds.html
> 

Lakshmi, false positive here.


-- 
Petri Latvala




>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_6683 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live@execlists:
>     - fi-kbl-soraka:      [PASS][2] -> [INCOMPLETE][3] ([i915#794])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11271/fi-kbl-soraka/igt@i915_selftest@live@execlists.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6683/fi-kbl-soraka/igt@i915_selftest@live@execlists.html
> 
>   * igt@i915_selftest@live@gem:
>     - fi-blb-e6850:       NOTRUN -> [DMESG-FAIL][4] ([i915#5026])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6683/fi-blb-e6850/igt@i915_selftest@live@gem.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-dg1-6:          [PASS][5] -> [DMESG-FAIL][6] ([i915#4494] / [i915#4957])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11271/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6683/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@kms_chamelium@vga-edid-read:
>     - fi-bdw-5557u:       NOTRUN -> [SKIP][7] ([fdo#109271] / [fdo#111827]) +8 similar issues
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6683/fi-bdw-5557u/igt@kms_chamelium@vga-edid-read.html
> 
>   * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
>     - bat-adlp-4:         [PASS][8] -> [DMESG-WARN][9] ([i915#3576])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11271/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6683/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
> 
>   * igt@kms_psr@cursor_plane_move:
>     - fi-bdw-5557u:       NOTRUN -> [SKIP][10] ([fdo#109271]) +13 similar issues
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6683/fi-bdw-5557u/igt@kms_psr@cursor_plane_move.html
> 
>   * igt@runner@aborted:
>     - fi-skl-6600u:       NOTRUN -> [FAIL][11] ([i915#2722] / [i915#4312])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6683/fi-skl-6600u/igt@runner@aborted.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@requests:
>     - fi-blb-e6850:       [DMESG-FAIL][12] ([i915#5026]) -> [PASS][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11271/fi-blb-e6850/igt@i915_selftest@live@requests.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6683/fi-blb-e6850/igt@i915_selftest@live@requests.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-dg1-5:          [DMESG-FAIL][14] ([i915#4957]) -> [DMESG-FAIL][15] ([i915#4494] / [i915#4957])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11271/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6683/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@kms_psr@primary_page_flip:
>     - fi-skl-6600u:       [INCOMPLETE][16] ([i915#4838]) -> [INCOMPLETE][17] ([i915#4547] / [i915#4838])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11271/fi-skl-6600u/igt@kms_psr@primary_page_flip.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6683/fi-skl-6600u/igt@kms_psr@primary_page_flip.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
>   [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
>   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
>   [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
>   [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
>   [i915#4838]: https://gitlab.freedesktop.org/drm/intel/issues/4838
>   [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
>   [i915#5026]: https://gitlab.freedesktop.org/drm/intel/issues/5026
>   [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6354 -> IGTPW_6683
> 
>   CI-20190529: 20190529
>   CI_DRM_11271: 5ed6be9e87d53c5c788f55d2c40f2e4f34bad8e9 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_6683: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6683/index.html
>   IGT_6354: 7146765b80919e3f134398ba433b36a56377e4c9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6683/index.html
