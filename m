Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E50112109
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 12:32:14 +0000 (UTC)
Date: Tue, 31 May 2022 15:30:01 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org,
 Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Message-ID: <YpYKSSxYxxwiV4o5@platvala-desk.ger.corp.intel.com>
References: <20220531105654.1029576-1-karolina.drobnik@intel.com>
 <165399980093.17346.12089514356695488575@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165399980093.17346.12089514356695488575@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915=3A_Use_correct_type_for_gen_parameter?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, May 31, 2022 at 12:23:20PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/i915: Use correct type for gen parameter
> URL   : https://patchwork.freedesktop.org/series/104543/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_11710 -> IGTPW_7200
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_7200 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_7200, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/index.html
> 
> Participating hosts (46 -> 45)
> ------------------------------
> 
>   Additional (1): fi-icl-u2 
>   Missing    (2): bat-adln-1 bat-adlm-1 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_7200:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_force_connector_basic@force-connector-state:
>     - fi-icl-u2:          NOTRUN -> [WARN][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/fi-icl-u2/igt@kms_force_connector_basic@force-connector-state.html
> 

Lakshmi, false positive here.


-- 
Petri Latvala



>   
> #### Warnings ####
> 
>   * igt@debugfs_test@read_all_entries:
>     - fi-apl-guc:         [DMESG-WARN][2] ([i915#5595]) -> [DMESG-WARN][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/fi-apl-guc/igt@debugfs_test@read_all_entries.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/fi-apl-guc/igt@debugfs_test@read_all_entries.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_7200 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-icl-u2:          NOTRUN -> [SKIP][4] ([i915#2190])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/fi-icl-u2/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@random-engines:
>     - fi-icl-u2:          NOTRUN -> [SKIP][5] ([i915#4613]) +3 similar issues
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/fi-icl-u2/igt@gem_lmem_swapping@random-engines.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - fi-bdw-5557u:       NOTRUN -> [INCOMPLETE][6] ([i915#3921])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/fi-bdw-5557u/igt@i915_selftest@live@hangcheck.html
>     - bat-dg1-6:          NOTRUN -> [DMESG-FAIL][7] ([i915#4494] / [i915#4957])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@i915_selftest@live@requests:
>     - fi-pnv-d510:        [PASS][8] -> [DMESG-FAIL][9] ([i915#4528])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/fi-pnv-d510/igt@i915_selftest@live@requests.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/fi-pnv-d510/igt@i915_selftest@live@requests.html
> 
>   * igt@i915_suspend@basic-s2idle-without-i915:
>     - bat-dg1-6:          NOTRUN -> [INCOMPLETE][10] ([i915#6011])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/bat-dg1-6/igt@i915_suspend@basic-s2idle-without-i915.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - fi-icl-u2:          NOTRUN -> [SKIP][11] ([i915#5903])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/fi-icl-u2/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@kms_chamelium@hdmi-hpd-fast:
>     - fi-icl-u2:          NOTRUN -> [SKIP][12] ([fdo#111827]) +8 similar issues
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - fi-icl-u2:          NOTRUN -> [SKIP][13] ([fdo#109285])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
>     - fi-icl-u2:          NOTRUN -> [SKIP][14] ([fdo#109278]) +2 similar issues
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/fi-icl-u2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - fi-icl-u2:          NOTRUN -> [SKIP][15] ([i915#3555])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/fi-icl-u2/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-userptr:
>     - fi-icl-u2:          NOTRUN -> [SKIP][16] ([fdo#109295] / [i915#3301])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/fi-icl-u2/igt@prime_vgem@basic-userptr.html
> 
>   * igt@runner@aborted:
>     - fi-pnv-d510:        NOTRUN -> [FAIL][17] ([fdo#109271] / [i915#2403] / [i915#4312])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/fi-pnv-d510/igt@runner@aborted.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@gt_engines:
>     - bat-dg1-6:          [INCOMPLETE][18] ([i915#4418]) -> [PASS][19]
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/bat-dg1-6/igt@i915_selftest@live@gt_engines.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/bat-dg1-6/igt@i915_selftest@live@gt_engines.html
> 
>   * igt@i915_selftest@live@gt_pm:
>     - fi-tgl-1115g4:      [DMESG-FAIL][20] ([i915#3987]) -> [PASS][21]
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@i915_selftest@live@mman:
>     - fi-bdw-5557u:       [INCOMPLETE][22] ([i915#5704]) -> [PASS][23]
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/fi-bdw-5557u/igt@i915_selftest@live@mman.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/fi-bdw-5557u/igt@i915_selftest@live@mman.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#2403]: https://gitlab.freedesktop.org/drm/intel/issues/2403
>   [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
>   [i915#3987]: https://gitlab.freedesktop.org/drm/intel/issues/3987
>   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
>   [i915#4418]: https://gitlab.freedesktop.org/drm/intel/issues/4418
>   [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
>   [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
>   [i915#5153]: https://gitlab.freedesktop.org/drm/intel/issues/5153
>   [i915#5595]: https://gitlab.freedesktop.org/drm/intel/issues/5595
>   [i915#5704]: https://gitlab.freedesktop.org/drm/intel/issues/5704
>   [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
>   [i915#6011]: https://gitlab.freedesktop.org/drm/intel/issues/6011
>   [i915#6106]: https://gitlab.freedesktop.org/drm/intel/issues/6106
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6500 -> IGTPW_7200
> 
>   CI-20190529: 20190529
>   CI_DRM_11710: d2798c4b9213f0d14080bdeef58e692a2c01a0bf @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_7200: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/index.html
>   IGT_6500: de4c6076a0f38ad3522b08931748f59d59a925ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/index.html
