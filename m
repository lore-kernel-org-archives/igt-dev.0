Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 04 Feb 2020 16:23:16 -0000
Message-ID: <158083339623.25087.3607349647948202314@emeril.freedesktop.org>
References: <20200204114113.22436-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200204114113.22436-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?prime=5Fvgem=3A_Examine_blitter_access_path_=28rev2=29?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/prime_vgem: Examine blitter access path (rev2)
URL   : https://patchwork.freedesktop.org/series/71823/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7864 -> IGTPW_4091
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4091 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4091, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4091/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4091:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - fi-skl-6770hq:      [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-skl-6770hq/igt@kms_flip@basic-flip-vs-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4091/fi-skl-6770hq/igt@kms_flip@basic-flip-vs-dpms.html

  
Known issues
------------

  Here are the changes found in IGTPW_4091 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@fds:
    - fi-byt-n2820:       [PASS][3] -> [FAIL][4] ([i915#694])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-byt-n2820/igt@gem_exec_parallel@fds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4091/fi-byt-n2820/igt@gem_exec_parallel@fds.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [PASS][5] -> [FAIL][6] ([CI#94])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4091/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [PASS][7] -> [DMESG-FAIL][8] ([i915#725])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4091/fi-ivb-3770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-8700k:       [PASS][9] -> [INCOMPLETE][10] ([CI#80] / [i915#424])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4091/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html
    - fi-cfl-guc:         [PASS][11] -> [INCOMPLETE][12] ([fdo#106070] / [i915#424])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4091/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][13] -> [FAIL][14] ([fdo#111407])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4091/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@prime_self_import@basic-with_one_bo:
    - fi-tgl-y:           [PASS][15] -> [DMESG-WARN][16] ([CI#94] / [i915#402])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-tgl-y/igt@prime_self_import@basic-with_one_bo.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4091/fi-tgl-y/igt@prime_self_import@basic-with_one_bo.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][17] ([i915#725]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4091/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-byt-j1900:       [DMESG-FAIL][19] ([i915#1052]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-byt-j1900/igt@i915_selftest@live_gem_contexts.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4091/fi-byt-j1900/igt@i915_selftest@live_gem_contexts.html

  * igt@i915_selftest@live_gtt:
    - fi-skl-6600u:       [TIMEOUT][21] ([fdo#111732] / [fdo#112271]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-skl-6600u/igt@i915_selftest@live_gtt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4091/fi-skl-6600u/igt@i915_selftest@live_gtt.html

  * igt@i915_selftest@live_perf:
    - fi-apl-guc:         [INCOMPLETE][23] ([fdo#103927]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-apl-guc/igt@i915_selftest@live_perf.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4091/fi-apl-guc/igt@i915_selftest@live_perf.html

  * igt@prime_self_import@basic-llseek-bad:
    - fi-tgl-y:           [DMESG-WARN][25] ([CI#94] / [i915#402]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4091/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html

  
#### Warnings ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-j1900:       [TIMEOUT][27] ([fdo#112271] / [i915#1084]) -> [FAIL][28] ([i915#694])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-byt-j1900/igt@gem_exec_parallel@contexts.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4091/fi-byt-j1900/igt@gem_exec_parallel@contexts.html
    - fi-byt-n2820:       [TIMEOUT][29] ([fdo#112271]) -> [FAIL][30] ([i915#694])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4091/fi-byt-n2820/igt@gem_exec_parallel@contexts.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#106070]: https://bugs.freedesktop.org/show_bug.cgi?id=106070
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [fdo#111732]: https://bugs.freedesktop.org/show_bug.cgi?id=111732
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1052]: https://gitlab.freedesktop.org/drm/intel/issues/1052
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725


Participating hosts (50 -> 46)
------------------------------

  Additional (3): fi-skl-lmem fi-glk-dsi fi-snb-2520m 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-ctg-p8600 fi-icl-y fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5417 -> IGTPW_4091

  CI-20190529: 20190529
  CI_DRM_7864: 5a140e2fc771e4c8b10d14e2db7bfb4996ee9d8a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4091: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4091/index.html
  IGT_5417: 33cc93c8ba5daa0b7498f297a4f626844d895d06 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@prime_vgem@basic-blt
+igt@prime_vgem@basic-fence-blt
+igt@prime_vgem@coherency-blt

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4091/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
