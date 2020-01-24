Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 24 Jan 2020 12:03:24 -0000
Message-ID: <157986740429.15091.930535048713619826@emeril.freedesktop.org>
References: <20200116135546.14003-1-anna.karas@intel.com>
In-Reply-To: <20200116135546.14003-1-anna.karas@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgRGlzdGlu?=
 =?utf-8?q?guish_particular_engines_during_calculating_nop_calibration=2E_?=
 =?utf-8?b?KHJldjQp?=
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
To: Anna Karas <anna.karas@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Distinguish particular engines during calculating nop calibration. (rev4)
URL   : https://patchwork.freedesktop.org/series/72113/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7808 -> IGTPW_3987
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/index.html

Known issues
------------

  Here are the changes found in IGTPW_3987 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-6700k2:      [PASS][1] -> [INCOMPLETE][2] ([i915#671])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6600u:       [PASS][3] -> [DMESG-WARN][4] ([i915#889]) +23 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_gt_heartbeat:
    - fi-bsw-kefka:       [PASS][5] -> [DMESG-FAIL][6] ([i915#541])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/fi-bsw-kefka/igt@i915_selftest@live_gt_heartbeat.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/fi-bsw-kefka/igt@i915_selftest@live_gt_heartbeat.html

  * igt@i915_selftest@live_gt_lrc:
    - fi-skl-6600u:       [PASS][7] -> [DMESG-FAIL][8] ([i915#889]) +7 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html

  * igt@kms_addfb_basic@bad-pitch-63:
    - fi-tgl-y:           [PASS][9] -> [DMESG-WARN][10] ([CI#94] / [i915#402])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/fi-tgl-y/igt@kms_addfb_basic@bad-pitch-63.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/fi-tgl-y/igt@kms_addfb_basic@bad-pitch-63.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@fds:
    - fi-byt-n2820:       [TIMEOUT][11] ([fdo#112271]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/fi-byt-n2820/igt@gem_exec_parallel@fds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/fi-byt-n2820/igt@gem_exec_parallel@fds.html

  * igt@gem_exec_suspend@basic-s0:
    - fi-cml-s:           [FAIL][13] ([fdo#103375]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/fi-cml-s/igt@gem_exec_suspend@basic-s0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/fi-cml-s/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-lmem:        [DMESG-WARN][15] ([i915#889]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [DMESG-FAIL][17] ([i915#725]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-8700k:       [INCOMPLETE][19] ([i915#424]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html

  * igt@i915_selftest@live_gtt:
    - fi-icl-dsi:         [TIMEOUT][21] ([fdo#112271]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/fi-icl-dsi/igt@i915_selftest@live_gtt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/fi-icl-dsi/igt@i915_selftest@live_gtt.html

  * igt@prime_vgem@basic-busy-default:
    - fi-tgl-y:           [DMESG-WARN][23] ([CI#94] / [i915#402]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/fi-tgl-y/igt@prime_vgem@basic-busy-default.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/fi-tgl-y/igt@prime_vgem@basic-busy-default.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541
  [i915#671]: https://gitlab.freedesktop.org/drm/intel/issues/671
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889


Participating hosts (52 -> 45)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5382 -> IGTPW_3987

  CI-20190529: 20190529
  CI_DRM_7808: 2c0cac4ed28a1f343c5a7c5c3a1c2edb382ab4dd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3987: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/index.html
  IGT_5382: 8dbe5ce61baa2d563d4dd7c56a018bb1e1077467 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
