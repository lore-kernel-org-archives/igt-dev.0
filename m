Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 07 Feb 2020 15:05:18 -0000
Message-ID: <158108791808.8754.17231692740488509356@emeril.freedesktop.org>
References: <20200207134527.17205-1-ramalingam.c@intel.com>
In-Reply-To: <20200207134527.17205-1-ramalingam.c@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv2=2C1/2=5D_tests/intel=5Fdp=5Fcompli?=
 =?utf-8?q?ance=3A_use_device_coherent_mapping_instead_of_mmap=5Fgtt?=
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

Series: series starting with [i-g-t,v2,1/2] tests/intel_dp_compliance: use device coherent mapping instead of mmap_gtt
URL   : https://patchwork.freedesktop.org/series/73148/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7886 -> IGTPW_4113
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/index.html

Known issues
------------

  Here are the changes found in IGTPW_4113 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [PASS][1] -> [INCOMPLETE][2] ([i915#45])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [PASS][3] -> [DMESG-FAIL][4] ([i915#770])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/fi-ivb-3770/igt@i915_selftest@live_blt.html
    - fi-bsw-nick:        [PASS][5] -> [INCOMPLETE][6] ([i915#392])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/fi-bsw-nick/igt@i915_selftest@live_blt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/fi-bsw-nick/igt@i915_selftest@live_blt.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-icl-u2:          [PASS][7] -> [FAIL][8] ([fdo#109635] / [i915#217])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/fi-icl-u2/igt@kms_chamelium@hdmi-crc-fast.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/fi-icl-u2/igt@kms_chamelium@hdmi-crc-fast.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-n2820:       [FAIL][9] ([i915#694]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/fi-byt-n2820/igt@gem_exec_parallel@contexts.html

  * igt@i915_selftest@live_execlists:
    - fi-icl-y:           [DMESG-FAIL][11] ([fdo#108569]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/fi-icl-y/igt@i915_selftest@live_execlists.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/fi-icl-y/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-kbl-x1275:       [DMESG-FAIL][13] ([i915#943]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/fi-kbl-x1275/igt@i915_selftest@live_gem_contexts.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/fi-kbl-x1275/igt@i915_selftest@live_gem_contexts.html
    - fi-byt-n2820:       [DMESG-FAIL][15] ([i915#1052]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html

  * igt@i915_selftest@live_gt_pm:
    - {fi-tgl-dsi}:       [DMESG-FAIL][17] -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/fi-tgl-dsi/igt@i915_selftest@live_gt_pm.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/fi-tgl-dsi/igt@i915_selftest@live_gt_pm.html

  * igt@i915_selftest@live_gtt:
    - fi-bxt-dsi:         [TIMEOUT][19] ([fdo#112271]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/fi-bxt-dsi/igt@i915_selftest@live_gtt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/fi-bxt-dsi/igt@i915_selftest@live_gtt.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-icl-u2:          [DMESG-WARN][21] ([IGT#4] / [i915#263]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  
#### Warnings ####

  * igt@gem_exec_parallel@fds:
    - fi-byt-n2820:       [FAIL][23] ([i915#694]) -> [TIMEOUT][24] ([fdo#112271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/fi-byt-n2820/igt@gem_exec_parallel@fds.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/fi-byt-n2820/igt@gem_exec_parallel@fds.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][25] ([i915#553] / [i915#725]) -> [DMESG-FAIL][26] ([i915#725])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][27] ([fdo#111096] / [i915#323]) -> [FAIL][28] ([fdo#111407])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7886/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#4]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/4
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=109635
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1052]: https://gitlab.freedesktop.org/drm/intel/issues/1052
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#263]: https://gitlab.freedesktop.org/drm/intel/issues/263
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#392]: https://gitlab.freedesktop.org/drm/intel/issues/392
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770
  [i915#943]: https://gitlab.freedesktop.org/drm/intel/issues/943


Participating hosts (54 -> 48)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5425 -> IGTPW_4113

  CI-20190529: 20190529
  CI_DRM_7886: c76da740823aa950e340a8e53758511680da79ca @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4113: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/index.html
  IGT_5425: ad4542ef1adbaa1227bc9ba9e24bb0e0f6dd408d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4113/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
