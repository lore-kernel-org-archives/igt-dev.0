Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 07 Jan 2020 17:07:34 -0000
Message-ID: <157841685411.8940.3122451896403195587@emeril.freedesktop.org>
References: <20200107151906.10098-1-ramalingam.c@intel.com>
In-Reply-To: <20200107151906.10098-1-ramalingam.c@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2k5?=
 =?utf-8?q?15/intel=5Fmemory=5Fregion=3A_wrappers_for_memory_regions_ops_?=
 =?utf-8?b?KHJldjIp?=
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

Series: lib/i915/intel_memory_region: wrappers for memory regions ops (rev2)
URL   : https://patchwork.freedesktop.org/series/71687/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7695 -> IGTPW_3903
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/index.html

Known issues
------------

  Here are the changes found in IGTPW_3903 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-icl-u2:          [PASS][1] -> [FAIL][2] ([fdo#109635])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/fi-icl-u2/igt@kms_chamelium@hdmi-crc-fast.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/fi-icl-u2/igt@kms_chamelium@hdmi-crc-fast.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-byt-n2820:       [FAIL][3] ([i915#694]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/fi-byt-n2820/igt@gem_exec_suspend@basic-s0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/fi-byt-n2820/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_selftest@live_blt:
    - fi-bsw-nick:        [DMESG-FAIL][5] ([i915#723]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/fi-bsw-nick/igt@i915_selftest@live_blt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/fi-bsw-nick/igt@i915_selftest@live_blt.html

  
#### Warnings ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-6770hq:      [INCOMPLETE][7] ([i915#671]) -> [DMESG-WARN][8] ([i915#889])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/fi-skl-6770hq/igt@i915_module_load@reload-with-fault-injection.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/fi-skl-6770hq/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-kbl-guc:         [SKIP][9] ([fdo#109271]) -> [FAIL][10] ([i915#704])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html

  * igt@runner@aborted:
    - fi-kbl-8809g:       [FAIL][11] ([i915#192] / [i915#193] / [i915#194]) -> [FAIL][12] ([i915#858])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7695/fi-kbl-8809g/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/fi-kbl-8809g/igt@runner@aborted.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=109635
  [i915#192]: https://gitlab.freedesktop.org/drm/intel/issues/192
  [i915#193]: https://gitlab.freedesktop.org/drm/intel/issues/193
  [i915#194]: https://gitlab.freedesktop.org/drm/intel/issues/194
  [i915#671]: https://gitlab.freedesktop.org/drm/intel/issues/671
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#704]: https://gitlab.freedesktop.org/drm/intel/issues/704
  [i915#723]: https://gitlab.freedesktop.org/drm/intel/issues/723
  [i915#858]: https://gitlab.freedesktop.org/drm/intel/issues/858
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889


Participating hosts (53 -> 46)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5358 -> IGTPW_3903

  CI-20190529: 20190529
  CI_DRM_7695: 8df346a062d56d97ab53555d3f5829c26f950233 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3903: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/index.html
  IGT_5358: c6fc013f414b806175dc4143c58ab445e5235ea5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3903/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
