Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 07 Jan 2020 16:43:45 -0000
Message-ID: <157841542521.8941.14336221377190448085@emeril.freedesktop.org>
References: <20200107112913.2726371-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200107112913.2726371-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Fengine=3A_Skip_redundant_clear_of_a_fresh_buffer?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_ctx_engine: Skip redundant clear of a fresh buffer
URL   : https://patchwork.freedesktop.org/series/71690/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7695 -> IGTPW_3902
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3902/index.html

Known issues
------------

  Here are the changes found in IGTPW_3902 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-cfl-8700k:       [PASS][1] -> [DMESG-WARN][2] ([i915#889])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3902/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html
    - fi-skl-lmem:        [PASS][3] -> [INCOMPLETE][4] ([i915#671])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3902/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [PASS][5] -> [DMESG-FAIL][6] ([i915#725])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3902/fi-ivb-3770/igt@i915_selftest@live_blt.html
    - fi-hsw-4770:        [PASS][7] -> [DMESG-FAIL][8] ([i915#725])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3902/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-hsw-peppy:       [PASS][9] -> [DMESG-FAIL][10] ([i915#722])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3902/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html

  * igt@i915_selftest@live_gt_engines:
    - fi-bxt-dsi:         [PASS][11] -> [DMESG-FAIL][12] ([i915#889]) +7 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/fi-bxt-dsi/igt@i915_selftest@live_gt_engines.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3902/fi-bxt-dsi/igt@i915_selftest@live_gt_engines.html

  * igt@i915_selftest@live_mman:
    - fi-bxt-dsi:         [PASS][13] -> [DMESG-WARN][14] ([i915#889]) +23 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/fi-bxt-dsi/igt@i915_selftest@live_mman.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3902/fi-bxt-dsi/igt@i915_selftest@live_mman.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][15] -> [FAIL][16] ([fdo#111096] / [i915#323])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3902/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-byt-n2820:       [FAIL][17] ([i915#694]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/fi-byt-n2820/igt@gem_exec_suspend@basic-s0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3902/fi-byt-n2820/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-6770hq:      [INCOMPLETE][19] ([i915#671]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/fi-skl-6770hq/igt@i915_module_load@reload-with-fault-injection.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3902/fi-skl-6770hq/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_blt:
    - fi-bsw-nick:        [DMESG-FAIL][21] ([i915#723]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/fi-bsw-nick/igt@i915_selftest@live_blt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3902/fi-bsw-nick/igt@i915_selftest@live_blt.html

  
#### Warnings ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-icl-u2:          [FAIL][23] ([fdo#103375]) -> [FAIL][24] ([i915#217])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3902/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@runner@aborted:
    - fi-kbl-8809g:       [FAIL][25] ([i915#192] / [i915#193] / [i915#194]) -> [FAIL][26] ([i915#858])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/fi-kbl-8809g/igt@runner@aborted.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3902/fi-kbl-8809g/igt@runner@aborted.html

  
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [i915#192]: https://gitlab.freedesktop.org/drm/intel/issues/192
  [i915#193]: https://gitlab.freedesktop.org/drm/intel/issues/193
  [i915#194]: https://gitlab.freedesktop.org/drm/intel/issues/194
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#671]: https://gitlab.freedesktop.org/drm/intel/issues/671
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#722]: https://gitlab.freedesktop.org/drm/intel/issues/722
  [i915#723]: https://gitlab.freedesktop.org/drm/intel/issues/723
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#858]: https://gitlab.freedesktop.org/drm/intel/issues/858
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889


Participating hosts (53 -> 46)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5358 -> IGTPW_3902

  CI-20190529: 20190529
  CI_DRM_7695: 8df346a062d56d97ab53555d3f5829c26f950233 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3902: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3902/index.html
  IGT_5358: c6fc013f414b806175dc4143c58ab445e5235ea5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3902/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
