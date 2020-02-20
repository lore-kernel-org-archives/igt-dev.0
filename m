Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 20 Feb 2020 13:31:28 -0000
Message-ID: <158220548881.17408.1650223772253479131@emeril.freedesktop.org>
References: <20200220125152.1188880-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200220125152.1188880-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdG9vbHMv?=
 =?utf-8?q?i915-perf=3A_workaround_overzelous_compiler_warnings?=
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tools/i915-perf: workaround overzelous compiler warnings
URL   : https://patchwork.freedesktop.org/series/73709/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7973 -> IGTPW_4192
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/index.html

Known issues
------------

  Here are the changes found in IGTPW_4192 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-ilk-650:         [PASS][1] -> [DMESG-WARN][2] ([i915#116])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-ilk-650/igt@gem_exec_suspend@basic-s0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/fi-ilk-650/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6770hq:      [PASS][3] -> [DMESG-WARN][4] ([i915#92]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-byt-n2820:       [PASS][5] -> [DMESG-FAIL][6] ([i915#1052])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html

  * igt@i915_selftest@live_hangcheck:
    - fi-skl-guc:         [PASS][7] -> [INCOMPLETE][8] ([fdo#108744])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-skl-guc/igt@i915_selftest@live_hangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/fi-skl-guc/igt@i915_selftest@live_hangcheck.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - fi-skl-6770hq:      [PASS][9] -> [SKIP][10] ([fdo#109271]) +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-c:
    - fi-skl-6770hq:      [PASS][11] -> [DMESG-WARN][12] ([i915#106])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-c.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/fi-skl-6770hq/igt@kms_pipe_crc_basic@read-crc-pipe-c.html

  * igt@kms_prop_blob@basic:
    - fi-tgl-y:           [PASS][13] -> [DMESG-WARN][14] ([CI#94] / [i915#402])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-tgl-y/igt@kms_prop_blob@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/fi-tgl-y/igt@kms_prop_blob@basic.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_gem_contexts:
    - fi-cml-s:           [DMESG-FAIL][15] ([i915#877]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-cml-s/igt@i915_selftest@live_gem_contexts.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/fi-cml-s/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [FAIL][17] ([i915#217]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Warnings ####

  * igt@amdgpu/amd_prime@amd-to-i915:
    - fi-icl-u3:          [SKIP][19] ([fdo#109315]) -> [SKIP][20] ([fdo#109315] / [i915#585])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-icl-u3/igt@amdgpu/amd_prime@amd-to-i915.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/fi-icl-u3/igt@amdgpu/amd_prime@amd-to-i915.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][21] ([fdo#111407]) -> [FAIL][22] ([fdo#111096] / [i915#323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#108744]: https://bugs.freedesktop.org/show_bug.cgi?id=108744
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [i915#1052]: https://gitlab.freedesktop.org/drm/intel/issues/1052
  [i915#106]: https://gitlab.freedesktop.org/drm/intel/issues/106
  [i915#116]: https://gitlab.freedesktop.org/drm/intel/issues/116
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#585]: https://gitlab.freedesktop.org/drm/intel/issues/585
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Participating hosts (49 -> 47)
------------------------------

  Additional (4): fi-kbl-soraka fi-skl-lmem fi-ivb-3770 fi-pnv-d510 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5453 -> IGTPW_4192

  CI-20190529: 20190529
  CI_DRM_7973: 07350317e4b2be54b1de7f1e73f77875df5e43f3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4192: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/index.html
  IGT_5453: cae9a5881ed2c5be2c2518a255740b612a927f9a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
