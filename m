Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E1D10F4AB
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jun 2022 13:35:16 +0000 (UTC)
Date: Fri, 10 Jun 2022 16:33:12 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org,
 Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Message-ID: <YqNIGEmsP99yYLJo@platvala-desk.ger.corp.intel.com>
References: <20220525152719.1022426-1-ryszard.knop@intel.com>
 <165350843506.16573.12750181661946081154@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165350843506.16573.12750181661946081154@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with__=5Bi-g-t=2Cv2=2C1/2=5D_tests/i915=5Fmodule=5Flo?=
 =?utf-8?q?ad=3A_Add_the_=22load=22_test?=
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

On Wed, May 25, 2022 at 07:53:55PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,v2,1/2] tests/i915_module_load: Add the "load" test
> URL   : https://patchwork.freedesktop.org/series/104362/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_11700 -> IGTPW_7171
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/index.html
> 
> Participating hosts (46 -> 45)
> ------------------------------
> 
>   Missing    (1): bat-dg2-9 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_7171:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * {igt@i915_module_load@load} (NEW):
>     - fi-tgl-u2:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-tgl-u2/igt@i915_module_load@load.html
>     - {bat-jsl-1}:        NOTRUN -> [SKIP][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/bat-jsl-1/igt@i915_module_load@load.html
>     - bat-dg1-6:          NOTRUN -> [SKIP][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/bat-dg1-6/igt@i915_module_load@load.html
>     - fi-tgl-1115g4:      NOTRUN -> [SKIP][4]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-tgl-1115g4/igt@i915_module_load@load.html
>     - {bat-jsl-2}:        NOTRUN -> [SKIP][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/bat-jsl-2/igt@i915_module_load@load.html
>     - fi-rkl-guc:         NOTRUN -> [SKIP][6]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-rkl-guc/igt@i915_module_load@load.html
>     - {fi-jsl-1}:         NOTRUN -> [SKIP][7]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-jsl-1/igt@i915_module_load@load.html
>     - fi-adl-ddr5:        NOTRUN -> [SKIP][8]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-adl-ddr5/igt@i915_module_load@load.html
>     - {bat-adln-1}:       NOTRUN -> [SKIP][9]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/bat-adln-1/igt@i915_module_load@load.html
>     - bat-adlp-4:         NOTRUN -> [SKIP][10]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/bat-adlp-4/igt@i915_module_load@load.html
>     - bat-dg1-5:          NOTRUN -> [SKIP][11]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/bat-dg1-5/igt@i915_module_load@load.html
>     - {fi-tgl-dsi}:       NOTRUN -> [SKIP][12]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-tgl-dsi/igt@i915_module_load@load.html
>     - {bat-adlp-6}:       NOTRUN -> [SKIP][13]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/bat-adlp-6/igt@i915_module_load@load.html
>     - {bat-dg2-8}:        NOTRUN -> [SKIP][14]
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/bat-dg2-8/igt@i915_module_load@load.html
>     - {fi-ehl-2}:         NOTRUN -> [SKIP][15]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-ehl-2/igt@i915_module_load@load.html
>     - fi-rkl-11600:       NOTRUN -> [SKIP][16]
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-rkl-11600/igt@i915_module_load@load.html


Lakshmi, heads-up: I'm merging this now and above skips will appear in
postmerge soon. SKIP result with "i915 is already loaded" is to be
expected.


-- 
Petri Latvala


> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_11700 and IGTPW_7171:
> 
> ### New IGT tests (1) ###
> 
>   * igt@i915_module_load@load:
>     - Statuses : 45 skip(s)
>     - Exec time: [0.00, 0.01] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_7171 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_suspend@basic-s3@smem:
>     - fi-skl-6700k2:      [PASS][17] -> [INCOMPLETE][18] ([i915#4939])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/fi-skl-6700k2/igt@gem_exec_suspend@basic-s3@smem.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-skl-6700k2/igt@gem_exec_suspend@basic-s3@smem.html
> 
>   * {igt@i915_module_load@load} (NEW):
>     - fi-cfl-8700k:       NOTRUN -> [SKIP][19] ([fdo#109271])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-cfl-8700k/igt@i915_module_load@load.html
>     - fi-blb-e6850:       NOTRUN -> [SKIP][20] ([fdo#109271])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-blb-e6850/igt@i915_module_load@load.html
>     - fi-ivb-3770:        NOTRUN -> [SKIP][21] ([fdo#109271])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-ivb-3770/igt@i915_module_load@load.html
>     - fi-skl-6700k2:      NOTRUN -> [SKIP][22] ([fdo#109271])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-skl-6700k2/igt@i915_module_load@load.html
>     - fi-bsw-n3050:       NOTRUN -> [SKIP][23] ([fdo#109271])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-bsw-n3050/igt@i915_module_load@load.html
>     - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][24] ([fdo#109271])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-bdw-gvtdvm/igt@i915_module_load@load.html
>     - fi-ilk-650:         NOTRUN -> [SKIP][25] ([fdo#109271])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-ilk-650/igt@i915_module_load@load.html
>     - fi-kbl-7567u:       NOTRUN -> [SKIP][26] ([fdo#109271])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-kbl-7567u/igt@i915_module_load@load.html
>     - fi-skl-guc:         NOTRUN -> [SKIP][27] ([fdo#109271])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-skl-guc/igt@i915_module_load@load.html
>     - fi-snb-2600:        NOTRUN -> [SKIP][28] ([fdo#109271])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-snb-2600/igt@i915_module_load@load.html
>     - fi-cfl-guc:         NOTRUN -> [SKIP][29] ([fdo#109271])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-cfl-guc/igt@i915_module_load@load.html
>     - fi-hsw-4770:        NOTRUN -> [SKIP][30] ([fdo#109271])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-hsw-4770/igt@i915_module_load@load.html
>     - fi-bxt-dsi:         NOTRUN -> [SKIP][31] ([fdo#109271])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-bxt-dsi/igt@i915_module_load@load.html
>     - fi-kbl-8809g:       NOTRUN -> [SKIP][32] ([fdo#109271])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-kbl-8809g/igt@i915_module_load@load.html
>     - fi-cfl-8109u:       NOTRUN -> [SKIP][33] ([fdo#109271])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-cfl-8109u/igt@i915_module_load@load.html
>     - fi-bsw-nick:        NOTRUN -> [SKIP][34] ([fdo#109271])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-bsw-nick/igt@i915_module_load@load.html
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][35] ([fdo#109271])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-kbl-soraka/igt@i915_module_load@load.html
>     - fi-pnv-d510:        NOTRUN -> [SKIP][36] ([fdo#109271])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-pnv-d510/igt@i915_module_load@load.html
>     - fi-hsw-g3258:       NOTRUN -> [SKIP][37] ([fdo#109271])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-hsw-g3258/igt@i915_module_load@load.html
>     - fi-kbl-guc:         NOTRUN -> [SKIP][38] ([fdo#109271])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-kbl-guc/igt@i915_module_load@load.html
>     - fi-bdw-5557u:       NOTRUN -> [SKIP][39] ([fdo#109271])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-bdw-5557u/igt@i915_module_load@load.html
>     - fi-bwr-2160:        NOTRUN -> [SKIP][40] ([fdo#109271])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-bwr-2160/igt@i915_module_load@load.html
>     - fi-skl-6600u:       NOTRUN -> [SKIP][41] ([fdo#109271])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-skl-6600u/igt@i915_module_load@load.html
>     - fi-glk-dsi:         NOTRUN -> [SKIP][42] ([fdo#109271])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-glk-dsi/igt@i915_module_load@load.html
>     - fi-bsw-kefka:       NOTRUN -> [SKIP][43] ([fdo#109271])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-bsw-kefka/igt@i915_module_load@load.html
>     - fi-apl-guc:         NOTRUN -> [SKIP][44] ([fdo#109271])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-apl-guc/igt@i915_module_load@load.html
>     - fi-snb-2520m:       NOTRUN -> [SKIP][45] ([fdo#109271])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-snb-2520m/igt@i915_module_load@load.html
>     - fi-elk-e7500:       NOTRUN -> [SKIP][46] ([fdo#109271])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-elk-e7500/igt@i915_module_load@load.html
>     - fi-glk-j4005:       NOTRUN -> [SKIP][47] ([fdo#109271])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-glk-j4005/igt@i915_module_load@load.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-dg1-6:          [PASS][48] -> [DMESG-FAIL][49] ([i915#4494] / [i915#4957])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@kms_busy@basic@modeset:
>     - bat-adlp-4:         [PASS][50] -> [DMESG-WARN][51] ([i915#3576])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/bat-adlp-4/igt@kms_busy@basic@modeset.html
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/bat-adlp-4/igt@kms_busy@basic@modeset.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@hugepages:
>     - {bat-adln-1}:       [DMESG-WARN][52] -> [PASS][53]
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/bat-adln-1/igt@i915_selftest@live@hugepages.html
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/bat-adln-1/igt@i915_selftest@live@hugepages.html
> 
>   * igt@i915_selftest@live@requests:
>     - bat-adlp-4:         [DMESG-FAIL][54] -> [PASS][55]
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/bat-adlp-4/igt@i915_selftest@live@requests.html
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/bat-adlp-4/igt@i915_selftest@live@requests.html
> 
>   * igt@kms_busy@basic@flip:
>     - fi-tgl-u2:          [DMESG-WARN][56] ([i915#402]) -> [PASS][57] +1 similar issue
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/fi-tgl-u2/igt@kms_busy@basic@flip.html
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/fi-tgl-u2/igt@kms_busy@basic@flip.html
> 
>   * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
>     - {bat-adlp-6}:       [DMESG-WARN][58] ([i915#3576]) -> [PASS][59]
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11700/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
>   [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
>   [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
>   [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
>   [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
>   [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
>   [i915#5885]: https://gitlab.freedesktop.org/drm/intel/issues/5885
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6492 -> IGTPW_7171
> 
>   CI-20190529: 20190529
>   CI_DRM_11700: f5895776c32b7fc5c196fafef3f5dab7e5ad19c6 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_7171: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/index.html
>   IGT_6492: ef18e59c374472e961a3a145724e7381eb4800aa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
> Testlist changes
> ----------------
> 
> +igt@i915_module_load@load
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7171/index.html
