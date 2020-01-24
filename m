Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 24 Jan 2020 14:27:03 -0000
Message-ID: <157987602396.15092.1497753441661285247@emeril.freedesktop.org>
References: <20200116135546.14003-1-anna.karas@intel.com>
In-Reply-To: <20200116135546.14003-1-anna.karas@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgRGlzdGlu?=
 =?utf-8?q?guish_particular_engines_during_calculating_nop_calibration=2E_?=
 =?utf-8?b?KHJldjUp?=
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

Series: Distinguish particular engines during calculating nop calibration. (rev5)
URL   : https://patchwork.freedesktop.org/series/72113/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7809 -> IGTPW_3989
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/index.html

Known issues
------------

  Here are the changes found in IGTPW_3989 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [PASS][1] -> [INCOMPLETE][2] ([i915#45])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [PASS][3] -> [FAIL][4] ([CI#94])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@vgem_basic@debugfs:
    - fi-tgl-y:           [PASS][5] -> [DMESG-WARN][6] ([CI#94] / [i915#402]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/fi-tgl-y/igt@vgem_basic@debugfs.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/fi-tgl-y/igt@vgem_basic@debugfs.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-j1900:       [TIMEOUT][7] ([fdo#112271]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/fi-byt-j1900/igt@gem_exec_parallel@contexts.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/fi-byt-j1900/igt@gem_exec_parallel@contexts.html

  * igt@gem_exec_parallel@fds:
    - fi-byt-j1900:       [INCOMPLETE][9] ([i915#45]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/fi-byt-j1900/igt@gem_exec_parallel@fds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/fi-byt-j1900/igt@gem_exec_parallel@fds.html

  * igt@i915_getparams_basic@basic-eu-total:
    - fi-tgl-y:           [DMESG-WARN][11] ([CI#94] / [i915#402]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/fi-tgl-y/igt@i915_getparams_basic@basic-eu-total.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/fi-tgl-y/igt@i915_getparams_basic@basic-eu-total.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-kbl-7500u:       [INCOMPLETE][13] ([i915#879]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/fi-kbl-7500u/igt@i915_module_load@reload-with-fault-injection.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/fi-kbl-7500u/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-x1275:       [DMESG-WARN][15] ([i915#889]) -> [PASS][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [DMESG-FAIL][17] ([i915#725]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-skl-lmem:        [INCOMPLETE][19] ([i915#424]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/fi-skl-lmem/igt@i915_selftest@live_gem_contexts.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/fi-skl-lmem/igt@i915_selftest@live_gem_contexts.html

  * igt@i915_selftest@live_sanitycheck:
    - fi-kbl-x1275:       [INCOMPLETE][21] -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/fi-kbl-x1275/igt@i915_selftest@live_sanitycheck.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/fi-kbl-x1275/igt@i915_selftest@live_sanitycheck.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-skl-6700k2:      [FAIL][23] ([i915#410]) -> [PASS][24] +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/fi-skl-6700k2/igt@kms_chamelium@hdmi-crc-fast.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/fi-skl-6700k2/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][25] ([fdo#111096] / [i915#323]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Warnings ####

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-skl-6700k2:      [FAIL][27] ([i915#410]) -> [SKIP][28] ([fdo#109271]) +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/fi-skl-6700k2/igt@kms_chamelium@dp-hpd-fast.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/fi-skl-6700k2/igt@kms_chamelium@dp-hpd-fast.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#410]: https://gitlab.freedesktop.org/drm/intel/issues/410
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#879]: https://gitlab.freedesktop.org/drm/intel/issues/879
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889


Participating hosts (51 -> 44)
------------------------------

  Missing    (7): fi-hsw-4200u fi-skl-guc fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5382 -> IGTPW_3989

  CI-20190529: 20190529
  CI_DRM_7809: 861f608ce6e3c1a1ad320a5d18055601cff36e45 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3989: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/index.html
  IGT_5382: 8dbe5ce61baa2d563d4dd7c56a018bb1e1077467 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
