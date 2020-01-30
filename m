Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 30 Jan 2020 16:38:14 -0000
Message-ID: <158040229492.21034.11649506800511288910@emeril.freedesktop.org>
References: <20200130151757.14104-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200130151757.14104-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Ftiled=5F=2E*blits=3A_skip_the_tests_on_newer_gens?=
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

Series: tests/i915/gem_tiled_.*blits: skip the tests on newer gens
URL   : https://patchwork.freedesktop.org/series/72779/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7844 -> IGTPW_4043
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/index.html

Known issues
------------

  Here are the changes found in IGTPW_4043 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [PASS][1] -> [DMESG-FAIL][2] ([i915#553] / [i915#725])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/fi-hsw-4770r/igt@i915_selftest@live_blt.html
    - fi-hsw-4770:        [PASS][3] -> [DMESG-FAIL][4] ([i915#553] / [i915#725])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/fi-hsw-4770/igt@i915_selftest@live_blt.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [TIMEOUT][5] ([fdo#112271] / [i915#1084] / [i915#816]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6770hq:      [FAIL][7] ([i915#178]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-hsw-peppy:       [DMESG-WARN][9] ([i915#44]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html

  
#### Warnings ####

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][11] ([fdo#111096] / [i915#323]) -> [FAIL][12] ([fdo#111407])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#178]: https://gitlab.freedesktop.org/drm/intel/issues/178
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816


Participating hosts (46 -> 47)
------------------------------

  Additional (8): fi-glk-dsi fi-ilk-650 fi-whl-u fi-ivb-3770 fi-cfl-8109u fi-blb-e6850 fi-skl-6600u fi-kbl-r 
  Missing    (7): fi-icl-1065g7 fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-kbl-7560u fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5407 -> IGTPW_4043

  CI-20190529: 20190529
  CI_DRM_7844: 47faa2a989ef89a15089190a5f942a2d2a34fda5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4043: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/index.html
  IGT_5407: a9d69f51dadbcbc53527671f87572d05c3370cba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
