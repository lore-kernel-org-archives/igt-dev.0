Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 13 Jan 2020 12:29:07 -0000
Message-ID: <157891854760.25475.8798935254930985719@emeril.freedesktop.org>
References: <20200113095908.17194-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200113095908.17194-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgU2ltcGxp?=
 =?utf-8?q?fy_working_on_tiled_surfaces_over_GenX_=28rev4=29?=
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

Series: Simplify working on tiled surfaces over GenX (rev4)
URL   : https://patchwork.freedesktop.org/series/71740/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7728 -> IGTPW_3918
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/index.html

Known issues
------------

  Here are the changes found in IGTPW_3918 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [PASS][1] -> [TIMEOUT][2] ([fdo#112271] / [i915#816])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-cfl-8700k:       [PASS][3] -> [INCOMPLETE][4] ([i915#505])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html
    - fi-kbl-x1275:       [PASS][5] -> [INCOMPLETE][6] ([i915#879])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-kbl-x1275/igt@i915_module_load@reload-with-fault-injection.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/fi-kbl-x1275/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [PASS][7] -> [DMESG-FAIL][8] ([i915#563])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [PASS][9] -> [FAIL][10] ([i915#217])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [DMESG-FAIL][11] ([i915#563]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/fi-ivb-3770/igt@i915_selftest@live_blt.html
    - fi-hsw-4770r:       [DMESG-FAIL][13] ([i915#725]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_reset:
    - fi-cfl-guc:         [DMESG-FAIL][15] ([i915#889]) -> [PASS][16] +7 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-cfl-guc/igt@i915_selftest@live_reset.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/fi-cfl-guc/igt@i915_selftest@live_reset.html

  * igt@i915_selftest@live_workarounds:
    - fi-cfl-guc:         [DMESG-WARN][17] ([i915#889]) -> [PASS][18] +23 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-cfl-guc/igt@i915_selftest@live_workarounds.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/fi-cfl-guc/igt@i915_selftest@live_workarounds.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][19] ([fdo#111096] / [i915#323]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Warnings ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-icl-u2:          [FAIL][21] ([i915#217]) -> [DMESG-WARN][22] ([IGT#4] / [i915#263])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  
  [IGT#4]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/4
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#263]: https://gitlab.freedesktop.org/drm/intel/issues/263
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#505]: https://gitlab.freedesktop.org/drm/intel/issues/505
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#879]: https://gitlab.freedesktop.org/drm/intel/issues/879
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889


Participating hosts (52 -> 37)
------------------------------

  Missing    (15): fi-kbl-soraka fi-bdw-5557u fi-kbl-7560u fi-bsw-n3050 fi-byt-j1900 fi-hsw-4200u fi-hsw-peppy fi-byt-squawks fi-bsw-cyan fi-ilk-650 fi-ctg-p8600 fi-whl-u fi-elk-e7500 fi-blb-e6850 fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5364 -> IGTPW_3918

  CI-20190529: 20190529
  CI_DRM_7728: 8ece19823fb6b581f6577b8fa85a12227e38028c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3918: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/index.html
  IGT_5364: b7cb6ffdb65cbd233f5ddee2f2dabf97b34fa640 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
