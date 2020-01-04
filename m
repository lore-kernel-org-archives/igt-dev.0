Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 04 Jan 2020 10:42:43 -0000
Message-ID: <157813456321.3253.15654055825491152615@emeril.freedesktop.org>
References: <20200104100826.21067-1-ramalingam.c@intel.com>
In-Reply-To: <20200104100826.21067-1-ramalingam.c@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5BRFC=2C1/2=5D_lib/i915/intel=5Fmemory=5Fregion?=
 =?utf-8?q?=3A_wrappers_for_memory_regions_ops?=
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
To: Ramalingam C <ramalingam.c@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [RFC,1/2] lib/i915/intel_memory_region: wrappers for memory regions ops
URL   : https://patchwork.freedesktop.org/series/71618/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7675 -> IGTPW_3898
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3898 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3898, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3898/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3898:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_create@basic-files:
    - fi-byt-n2820:       NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3898/fi-byt-n2820/igt@gem_ctx_create@basic-files.html

  
Known issues
------------

  Here are the changes found in IGTPW_3898 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [PASS][2] -> [TIMEOUT][3] ([i915#816])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7675/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3898/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-guc:         [PASS][4] -> [INCOMPLETE][5] ([i915#151])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7675/fi-skl-guc/igt@i915_pm_rpm@module-reload.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3898/fi-skl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [PASS][6] -> [DMESG-FAIL][7] ([i915#725])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7675/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3898/fi-ivb-3770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-8700k:       [PASS][8] -> [INCOMPLETE][9] ([i915#424])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7675/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3898/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-icl-u2:          [PASS][10] -> [FAIL][11] ([fdo#109635] / [i915#217])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7675/fi-icl-u2/igt@kms_chamelium@dp-edid-read.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3898/fi-icl-u2/igt@kms_chamelium@dp-edid-read.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [TIMEOUT][12] ([i915#816]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7675/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3898/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-6770hq:      [DMESG-WARN][14] ([i915#889]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7675/fi-skl-6770hq/igt@i915_module_load@reload-with-fault-injection.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3898/fi-skl-6770hq/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][16] ([i915#553] / [i915#725]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7675/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3898/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-hsw-peppy:       [DMESG-FAIL][18] ([i915#722]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7675/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3898/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][20] ([i915#217]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7675/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3898/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Warnings ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [DMESG-FAIL][22] ([i915#725]) -> [DMESG-FAIL][23] ([i915#553] / [i915#725])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7675/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3898/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  
  [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=109635
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#722]: https://gitlab.freedesktop.org/drm/intel/issues/722
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889


Participating hosts (52 -> 44)
------------------------------

  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-bsw-n3050 fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5357 -> IGTPW_3898

  CI-20190529: 20190529
  CI_DRM_7675: 9a97e886930c21e976205c47180ab256a6dbc135 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3898: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3898/index.html
  IGT_5357: a555a4b98f90dab655d24bb3d07e9291a8b8dac8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3898/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
