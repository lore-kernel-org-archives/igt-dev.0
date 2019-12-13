Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 13 Dec 2019 10:35:28 -0000
Message-ID: <157623332805.23799.3291980524957636407@emeril.freedesktop.org>
References: <20191213095204.20667-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20191213095204.20667-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fdummyload=3A_Use_mapping_selection_to_allow_run_batch_from_?=
 =?utf-8?q?lmem?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_dummyload: Use mapping selection to allow run batch from lmem
URL   : https://patchwork.freedesktop.org/series/70872/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5349 -> IGTPW_3860
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3860 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3860, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3860/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3860:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_busy@busy-all:
    - fi-glk-dsi:         [PASS][1] -> [FAIL][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5349/fi-glk-dsi/igt@gem_busy@busy-all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3860/fi-glk-dsi/igt@gem_busy@busy-all.html

  * igt@gem_exec_fence@basic-await-default:
    - fi-elk-e7500:       [PASS][3] -> [FAIL][4] +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5349/fi-elk-e7500/igt@gem_exec_fence@basic-await-default.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3860/fi-elk-e7500/igt@gem_exec_fence@basic-await-default.html

  * igt@gem_wait@basic-await-all:
    - fi-bsw-n3050:       [PASS][5] -> [FAIL][6] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5349/fi-bsw-n3050/igt@gem_wait@basic-await-all.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3860/fi-bsw-n3050/igt@gem_wait@basic-await-all.html
    - fi-byt-n2820:       [PASS][7] -> [FAIL][8] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5349/fi-byt-n2820/igt@gem_wait@basic-await-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3860/fi-byt-n2820/igt@gem_wait@basic-await-all.html

  * igt@gem_wait@basic-busy-all:
    - fi-bsw-kefka:       [PASS][9] -> [FAIL][10] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5349/fi-bsw-kefka/igt@gem_wait@basic-busy-all.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3860/fi-bsw-kefka/igt@gem_wait@basic-busy-all.html
    - fi-blb-e6850:       [PASS][11] -> [FAIL][12] +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5349/fi-blb-e6850/igt@gem_wait@basic-busy-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3860/fi-blb-e6850/igt@gem_wait@basic-busy-all.html
    - fi-bxt-dsi:         [PASS][13] -> [FAIL][14] +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5349/fi-bxt-dsi/igt@gem_wait@basic-busy-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3860/fi-bxt-dsi/igt@gem_wait@basic-busy-all.html

  * igt@gem_wait@basic-wait-all:
    - fi-ilk-650:         [PASS][15] -> [FAIL][16] +5 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5349/fi-ilk-650/igt@gem_wait@basic-wait-all.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3860/fi-ilk-650/igt@gem_wait@basic-wait-all.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-byt-j1900:       [PASS][17] -> [FAIL][18] +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5349/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3860/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-pnv-d510:        [PASS][19] -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5349/fi-pnv-d510/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3860/fi-pnv-d510/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - fi-gdg-551:         [PASS][21] -> [FAIL][22] +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5349/fi-gdg-551/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3860/fi-gdg-551/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - fi-bwr-2160:        [PASS][23] -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5349/fi-bwr-2160/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3860/fi-bwr-2160/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  
Known issues
------------

  Here are the changes found in IGTPW_3860 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [PASS][25] -> [DMESG-FAIL][26] ([i915#563])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5349/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3860/fi-hsw-4770/igt@i915_selftest@live_blt.html
    - fi-hsw-4770r:       [PASS][27] -> [DMESG-FAIL][28] ([i915#553] / [i915#725])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5349/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3860/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-hsw-peppy:       [PASS][29] -> [INCOMPLETE][30] ([i915#694])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5349/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3860/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][31] -> [FAIL][32] ([fdo#111096] / [i915#323])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5349/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3860/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-kbl-x1275:       [DMESG-WARN][33] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][34] ([i915#62] / [i915#92]) +5 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5349/fi-kbl-x1275/igt@gem_exec_suspend@basic-s3.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3860/fi-kbl-x1275/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-kbl-x1275:       [DMESG-WARN][35] ([i915#62] / [i915#92]) -> [DMESG-WARN][36] ([i915#62] / [i915#92] / [i915#95]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5349/fi-kbl-x1275/igt@i915_pm_rpm@basic-pci-d3-state.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3860/fi-kbl-x1275/igt@i915_pm_rpm@basic-pci-d3-state.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (51 -> 46)
------------------------------

  Additional (3): fi-kbl-soraka fi-icl-dsi fi-kbl-r 
  Missing    (8): fi-icl-1065g7 fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5349 -> IGTPW_3860

  CI-20190529: 20190529
  CI_DRM_7556: cf70b6f71886f9ca726093db29be61264cb031b6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3860: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3860/index.html
  IGT_5349: 048f58513d8b8ec6bb307a939f0ac959bc0f0e10 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3860/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
