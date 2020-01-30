Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 30 Jan 2020 19:04:27 -0000
Message-ID: <158041106761.21032.297795142767929178@emeril.freedesktop.org>
References: <20200130183101.20930-1-imre.deak@intel.com>
In-Reply-To: <20200130183101.20930-1-imre.deak@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bv2=2C1/7=5D_lib/igt=5Ffb=3A_Fix_creating_FBs_?=
 =?utf-8?q?on_platforms_w/o_HW_detiling?=
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [v2,1/7] lib/igt_fb: Fix creating FBs on platforms w/o HW detiling
URL   : https://patchwork.freedesktop.org/series/72790/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7844 -> IGTPW_4045
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/index.html

Known issues
------------

  Here are the changes found in IGTPW_4045 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [PASS][1] -> [DMESG-FAIL][2] ([i915#563])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gtt:
    - fi-skl-lmem:        [PASS][3] -> [TIMEOUT][4] ([fdo#111732] / [fdo#112271])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/fi-skl-lmem/igt@i915_selftest@live_gtt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/fi-skl-lmem/igt@i915_selftest@live_gtt.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [PASS][5] -> [FAIL][6] ([i915#217])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6770hq:      [FAIL][7] ([i915#178]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-icl-u2:          [DMESG-WARN][9] ([IGT#4] / [i915#263]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-hsw-peppy:       [DMESG-WARN][11] ([i915#44]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/fi-hsw-peppy/igt@kms_frontbuffer_tracking@basic.html

  
  [IGT#4]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/4
  [fdo#111732]: https://bugs.freedesktop.org/show_bug.cgi?id=111732
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#178]: https://gitlab.freedesktop.org/drm/intel/issues/178
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#263]: https://gitlab.freedesktop.org/drm/intel/issues/263
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563


Participating hosts (46 -> 48)
------------------------------

  Additional (8): fi-glk-dsi fi-ilk-650 fi-whl-u fi-ivb-3770 fi-cfl-8109u fi-blb-e6850 fi-skl-6600u fi-kbl-r 
  Missing    (6): fi-icl-1065g7 fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5407 -> IGTPW_4045

  CI-20190529: 20190529
  CI_DRM_7844: 47faa2a989ef89a15089190a5f942a2d2a34fda5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4045: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/index.html
  IGT_5407: a9d69f51dadbcbc53527671f87572d05c3370cba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4045/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
