Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 17 Dec 2019 01:06:49 -0000
Message-ID: <157654480990.21848.11344975905539304594@emeril.freedesktop.org>
References: <20191216235407.23070-1-imre.deak@intel.com>
In-Reply-To: <20191216235407.23070-1-imre.deak@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Ffb=3A_Add_support_for_the_gen12_media_compressed_modifier_?=
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_fb: Add support for the gen12 media compressed modifier (rev2)
URL   : https://patchwork.freedesktop.org/series/71012/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7578 -> IGTPW_3868
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3868 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3868, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3868/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3868:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live_gt_heartbeat:
    - fi-tgl-y:           [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/fi-tgl-y/igt@i915_selftest@live_gt_heartbeat.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3868/fi-tgl-y/igt@i915_selftest@live_gt_heartbeat.html

  
Known issues
------------

  Here are the changes found in IGTPW_3868 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6770hq:      [PASS][3] -> [DMESG-WARN][4] ([i915#592])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3868/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [PASS][5] -> [DMESG-FAIL][6] ([i915#770])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3868/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-icl-u2:          [FAIL][7] ([fdo#103375]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/fi-icl-u2/igt@gem_exec_suspend@basic-s3.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3868/fi-icl-u2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-icl-u2:          [FAIL][9] ([fdo#111550]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/fi-icl-u2/igt@gem_exec_suspend@basic-s4-devices.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3868/fi-icl-u2/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-byt-n2820:       [DMESG-FAIL][11] ([i915#722]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3868/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html
    - fi-cfl-guc:         [DMESG-FAIL][13] ([i915#730]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3868/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_busy@basic-flip-pipe-a:
    - fi-icl-u2:          [INCOMPLETE][15] ([i915#140]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/fi-icl-u2/igt@kms_busy@basic-flip-pipe-a.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3868/fi-icl-u2/igt@kms_busy@basic-flip-pipe-a.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [FAIL][17] ([fdo#109635] / [i915#217]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3868/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][19] ([fdo#111096] / [i915#323]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3868/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-kbl-x1275:       [DMESG-WARN][21] ([i915#62] / [i915#92]) -> [DMESG-WARN][22] ([i915#62] / [i915#92] / [i915#95]) +6 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3868/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][23] ([i915#553] / [i915#725]) -> [DMESG-FAIL][24] ([i915#563])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3868/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - fi-kbl-x1275:       [DMESG-WARN][25] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][26] ([i915#62] / [i915#92]) +10 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-modeset.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3868/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-modeset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=109635
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#111550]: https://bugs.freedesktop.org/show_bug.cgi?id=111550
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#592]: https://gitlab.freedesktop.org/drm/intel/issues/592
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#722]: https://gitlab.freedesktop.org/drm/intel/issues/722
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#730]: https://gitlab.freedesktop.org/drm/intel/issues/730
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (51 -> 45)
------------------------------

  Additional (2): fi-kbl-soraka fi-kbl-7560u 
  Missing    (8): fi-ilk-m540 fi-tgl-u fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5349 -> IGTPW_3868

  CI-20190529: 20190529
  CI_DRM_7578: cc329d389f5609d2969d0797bc96f754adb26d62 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3868: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3868/index.html
  IGT_5349: 048f58513d8b8ec6bb307a939f0ac959bc0f0e10 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3868/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
