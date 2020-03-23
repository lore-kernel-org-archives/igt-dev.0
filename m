Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 23 Mar 2020 07:27:20 -0000
Message-ID: <158494844049.9808.10924356465548522316@emeril.freedesktop.org>
References: <20200323063248.5261-1-anshuman.gupta@intel.com>
In-Reply-To: <20200323063248.5261-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbHBzcCBw?=
 =?utf-8?q?latform_agnostic_support_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lpsp platform agnostic support (rev3)
URL   : https://patchwork.freedesktop.org/series/74647/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8172 -> IGTPW_4338
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4338 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4338, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4338:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-glk-dsi:         [PASS][1] -> [FAIL][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-glk-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-glk-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-icl-u2:          [PASS][3] -> [FAIL][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-icl-u2/igt@i915_pm_rpm@basic-pci-d3-state.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-icl-u2/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-kbl-r:           [PASS][5] -> [FAIL][6] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-kbl-r/igt@i915_pm_rpm@basic-pci-d3-state.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-kbl-r/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-icl-guc:         [PASS][7] -> [FAIL][8] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-icl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-icl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-bdw-5557u:       [PASS][9] -> [FAIL][10] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-bdw-5557u/igt@i915_pm_rpm@basic-pci-d3-state.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-bdw-5557u/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-kbl-soraka:      [PASS][11] -> [FAIL][12] +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-kbl-soraka/igt@i915_pm_rpm@basic-pci-d3-state.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-kbl-soraka/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-kbl-7500u:       NOTRUN -> [FAIL][13] +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-kbl-7500u/igt@i915_pm_rpm@basic-rte.html
    - fi-gdg-551:         NOTRUN -> [FAIL][14] +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-gdg-551/igt@i915_pm_rpm@basic-rte.html
    - fi-skl-lmem:        NOTRUN -> [FAIL][15] +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-skl-lmem/igt@i915_pm_rpm@basic-rte.html
    - fi-cml-u2:          [PASS][16] -> [FAIL][17] +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-cml-u2/igt@i915_pm_rpm@basic-rte.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-cml-u2/igt@i915_pm_rpm@basic-rte.html
    - fi-bxt-dsi:         [PASS][18] -> [FAIL][19] +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-bxt-dsi/igt@i915_pm_rpm@basic-rte.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-bxt-dsi/igt@i915_pm_rpm@basic-rte.html
    - fi-byt-j1900:       [PASS][20] -> [FAIL][21] +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-byt-j1900/igt@i915_pm_rpm@basic-rte.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-byt-j1900/igt@i915_pm_rpm@basic-rte.html
    - fi-hsw-4770:        [PASS][22] -> [FAIL][23] +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-hsw-4770/igt@i915_pm_rpm@basic-rte.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-hsw-4770/igt@i915_pm_rpm@basic-rte.html
    - fi-snb-2520m:       NOTRUN -> [FAIL][24] +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-snb-2520m/igt@i915_pm_rpm@basic-rte.html
    - fi-apl-guc:         [PASS][25] -> [FAIL][26] +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-apl-guc/igt@i915_pm_rpm@basic-rte.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-apl-guc/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@module-reload:
    - fi-cfl-8109u:       [PASS][27] -> [FAIL][28] +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
    - fi-skl-6600u:       [PASS][29] -> [FAIL][30] +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html
    - fi-cfl-8700k:       [PASS][31] -> [FAIL][32] +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html
    - fi-bsw-kefka:       [PASS][33] -> [FAIL][34] +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html
    - fi-kbl-x1275:       [PASS][35] -> [FAIL][36] +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
    - fi-icl-dsi:         [PASS][37] -> [FAIL][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-icl-dsi/igt@i915_pm_rpm@module-reload.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-icl-dsi/igt@i915_pm_rpm@module-reload.html
    - fi-skl-guc:         [PASS][39] -> [FAIL][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-skl-guc/igt@i915_pm_rpm@module-reload.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-skl-guc/igt@i915_pm_rpm@module-reload.html
    - fi-bsw-n3050:       NOTRUN -> [FAIL][41] +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html
    - fi-skl-6700k2:      [PASS][42] -> [FAIL][43] +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-skl-6700k2/igt@i915_pm_rpm@module-reload.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-skl-6700k2/igt@i915_pm_rpm@module-reload.html
    - fi-cfl-guc:         [PASS][44] -> [FAIL][45] +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html
    - fi-icl-y:           [PASS][46] -> [FAIL][47] +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-icl-y/igt@i915_pm_rpm@module-reload.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-icl-y/igt@i915_pm_rpm@module-reload.html
    - fi-cml-s:           [PASS][48] -> [FAIL][49] +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-cml-s/igt@i915_pm_rpm@module-reload.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-cml-s/igt@i915_pm_rpm@module-reload.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-bwr-2160:        [SKIP][50] ([fdo#109271]) -> [FAIL][51] +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-bwr-2160/igt@i915_pm_rpm@basic-pci-d3-state.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-bwr-2160/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-ivb-3770:        [SKIP][52] ([fdo#109271]) -> [FAIL][53] +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-ivb-3770/igt@i915_pm_rpm@basic-rte.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-ivb-3770/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@module-reload:
    - fi-pnv-d510:        [SKIP][54] ([fdo#109271]) -> [FAIL][55] +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-pnv-d510/igt@i915_pm_rpm@module-reload.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-pnv-d510/igt@i915_pm_rpm@module-reload.html
    - fi-ilk-650:         [SKIP][56] ([fdo#109271]) -> [FAIL][57] +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-ilk-650/igt@i915_pm_rpm@module-reload.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-ilk-650/igt@i915_pm_rpm@module-reload.html
    - fi-blb-e6850:       [SKIP][58] ([fdo#109271]) -> [FAIL][59] +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html
    - fi-elk-e7500:       [SKIP][60] ([fdo#109271]) -> [FAIL][61] +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-elk-e7500/igt@i915_pm_rpm@module-reload.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-elk-e7500/igt@i915_pm_rpm@module-reload.html
    - fi-icl-u2:          [DMESG-WARN][62] ([i915#289]) -> [FAIL][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-icl-u2/igt@i915_pm_rpm@module-reload.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-icl-u2/igt@i915_pm_rpm@module-reload.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - {fi-kbl-7560u}:     NOTRUN -> [FAIL][64] +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-kbl-7560u/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@basic-rte:
    - {fi-ehl-1}:         [PASS][65] -> [FAIL][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-ehl-1/igt@i915_pm_rpm@basic-rte.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-ehl-1/igt@i915_pm_rpm@basic-rte.html
    - {fi-tgl-u}:         [PASS][67] -> [FAIL][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-tgl-u/igt@i915_pm_rpm@basic-rte.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-tgl-u/igt@i915_pm_rpm@basic-rte.html

  
Known issues
------------

  Here are the changes found in IGTPW_4338 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-8809g:       [PASS][69] -> [SKIP][70] ([fdo#109271])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-kbl-8809g/igt@i915_pm_rpm@module-reload.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-kbl-8809g/igt@i915_pm_rpm@module-reload.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - {fi-ehl-1}:         [INCOMPLETE][71] -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8172/fi-ehl-1/igt@i915_selftest@live@hangcheck.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/fi-ehl-1/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#289]: https://gitlab.freedesktop.org/drm/intel/issues/289


Participating hosts (39 -> 40)
------------------------------

  Additional (7): fi-bsw-n3050 fi-snb-2520m fi-kbl-7500u fi-gdg-551 fi-skl-lmem fi-kbl-7560u fi-bsw-nick 
  Missing    (6): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5526 -> IGTPW_4338

  CI-20190529: 20190529
  CI_DRM_8172: b53e00acaa550df13d601f258011b180013c5d38 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4338: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/index.html
  IGT_5526: f49ebeee9f54d6f23c60a842f75f65561d452ab0 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4338/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
