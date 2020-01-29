Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 29 Jan 2020 17:22:24 -0000
Message-ID: <158031854476.5463.14896062780139260045@emeril.freedesktop.org>
References: <20200129135520.20336-1-swati2.sharma@intel.com>
In-Reply-To: <20200129135520.20336-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIHRl?=
 =?utf-8?q?sts_for_HDR_metadata_interfaces_and_bpc_switch_=28rev4=29?=
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
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add tests for HDR metadata interfaces and bpc switch (rev4)
URL   : https://patchwork.freedesktop.org/series/71524/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7838 -> IGTPW_4029
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/index.html

Known issues
------------

  Here are the changes found in IGTPW_4029 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [PASS][1] -> [FAIL][2] ([CI#94])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [PASS][3] -> [DMESG-FAIL][4] ([i915#725])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/fi-ivb-3770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_execlists:
    - fi-icl-dsi:         [PASS][5] -> [INCOMPLETE][6] ([i915#140])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-icl-dsi/igt@i915_selftest@live_execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/fi-icl-dsi/igt@i915_selftest@live_execlists.html
    - fi-icl-u3:          [PASS][7] -> [INCOMPLETE][8] ([i915#140])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-icl-u3/igt@i915_selftest@live_execlists.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/fi-icl-u3/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-hsw-peppy:       [PASS][9] -> [DMESG-FAIL][10] ([i915#722])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_addfb_basic@bad-pitch-1024:
    - fi-tgl-y:           [PASS][11] -> [DMESG-WARN][12] ([CI#94] / [i915#402]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-tgl-y/igt@kms_addfb_basic@bad-pitch-1024.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/fi-tgl-y/igt@kms_addfb_basic@bad-pitch-1024.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-cml-u2:          [PASS][13] -> [FAIL][14] ([i915#217])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [PASS][15] -> [FAIL][16] ([i915#217])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-hsw-4770:        [PASS][17] -> [FAIL][18] ([i915#49])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-hsw-4770/igt@kms_frontbuffer_tracking@basic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/fi-hsw-4770/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][19] ([i915#553] / [i915#725]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-8700k:       [INCOMPLETE][21] ([i915#424]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html

  * igt@i915_selftest@live_gtt:
    - fi-bdw-5557u:       [TIMEOUT][23] ([fdo#112271]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-bdw-5557u/igt@i915_selftest@live_gtt.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/fi-bdw-5557u/igt@i915_selftest@live_gtt.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][25] ([fdo#111096] / [i915#323]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - fi-icl-dsi:         [DMESG-WARN][27] ([i915#109]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-icl-dsi/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/fi-icl-dsi/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@prime_self_import@basic-llseek-size:
    - fi-tgl-y:           [DMESG-WARN][29] ([CI#94] / [i915#402]) -> [PASS][30] +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-tgl-y/igt@prime_self_import@basic-llseek-size.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/fi-tgl-y/igt@prime_self_import@basic-llseek-size.html

  
#### Warnings ####

  * igt@i915_selftest@live_execlists:
    - fi-icl-y:           [INCOMPLETE][31] ([i915#140]) -> [DMESG-FAIL][32] ([fdo#108569])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/fi-icl-y/igt@i915_selftest@live_execlists.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/fi-icl-y/igt@i915_selftest@live_execlists.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#109]: https://gitlab.freedesktop.org/drm/intel/issues/109
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#722]: https://gitlab.freedesktop.org/drm/intel/issues/722
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725


Participating hosts (50 -> 46)
------------------------------

  Additional (2): fi-byt-n2820 fi-bwr-2160 
  Missing    (6): fi-kbl-soraka fi-ilk-m540 fi-hsw-4200u fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5404 -> IGTPW_4029

  CI-20190529: 20190529
  CI_DRM_7838: d3d96beea538c8de906a1c4d7e6793a47d17a471 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4029: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/index.html
  IGT_5404: 4147bab8e3dcaf11bd657b5fb4c109708e94e60c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_hdr@bpc-switch
+igt@kms_hdr@bpc-switch-dpms
+igt@kms_hdr@bpc-switch-suspend
+igt@kms_hdr@static-swap
+igt@kms_hdr@static-toggle
+igt@kms_hdr@static-toggle-dpms
+igt@kms_hdr@static-toggle-suspend

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
