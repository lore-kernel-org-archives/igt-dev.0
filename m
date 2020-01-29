Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 29 Jan 2020 22:51:47 -0000
Message-ID: <158033830757.5462.18200994718962215654@emeril.freedesktop.org>
References: <20200129214116.29107-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20200129214116.29107-1-vinay.belgaumkar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Flargeobject=3A_Skip_when_aperture_is_not_supported?=
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
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_largeobject: Skip when aperture is not supported
URL   : https://patchwork.freedesktop.org/series/72742/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5405 -> IGTPW_4034
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4034 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4034, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4034/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4034:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - fi-bsw-nick:        NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4034/fi-bsw-nick/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4034 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [PASS][2] -> [TIMEOUT][3] ([fdo#112271] / [i915#816])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4034/fi-byt-j1900/igt@gem_close_race@basic-threads.html
    - fi-byt-n2820:       [PASS][4] -> [TIMEOUT][5] ([fdo#112271] / [i915#816])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4034/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_blt:
    - fi-byt-j1900:       [PASS][6] -> [DMESG-FAIL][7] ([i915#725])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-byt-j1900/igt@i915_selftest@live_blt.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4034/fi-byt-j1900/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_execlists:
    - fi-icl-dsi:         [PASS][8] -> [INCOMPLETE][9] ([i915#140])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-icl-dsi/igt@i915_selftest@live_execlists.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4034/fi-icl-dsi/igt@i915_selftest@live_execlists.html

  * igt@prime_vgem@basic-gtt:
    - fi-tgl-y:           [PASS][10] -> [DMESG-WARN][11] ([CI#94] / [i915#402]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-tgl-y/igt@prime_vgem@basic-gtt.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4034/fi-tgl-y/igt@prime_vgem@basic-gtt.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-peppy:       [TIMEOUT][12] ([fdo#112271]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4034/fi-hsw-peppy/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [DMESG-FAIL][14] ([i915#725]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4034/fi-ivb-3770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_execlists:
    - fi-skl-guc:         [INCOMPLETE][16] -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-skl-guc/igt@i915_selftest@live_execlists.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4034/fi-skl-guc/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-byt-j1900:       [DMESG-FAIL][18] ([i915#1052]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-byt-j1900/igt@i915_selftest@live_gem_contexts.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4034/fi-byt-j1900/igt@i915_selftest@live_gem_contexts.html

  * igt@prime_self_import@basic-with_one_bo:
    - fi-tgl-y:           [DMESG-WARN][20] ([CI#94] / [i915#402]) -> [PASS][21] +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-tgl-y/igt@prime_self_import@basic-with_one_bo.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4034/fi-tgl-y/igt@prime_self_import@basic-with_one_bo.html

  
#### Warnings ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-j1900:       [TIMEOUT][22] ([fdo#112271]) -> [FAIL][23] ([i915#694])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-byt-j1900/igt@gem_exec_parallel@contexts.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4034/fi-byt-j1900/igt@gem_exec_parallel@contexts.html

  * igt@i915_selftest@live_execlists:
    - fi-icl-y:           [DMESG-FAIL][24] ([fdo#108569]) -> [INCOMPLETE][25] ([i915#140])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-icl-y/igt@i915_selftest@live_execlists.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4034/fi-icl-y/igt@i915_selftest@live_execlists.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1052]: https://gitlab.freedesktop.org/drm/intel/issues/1052
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816


Participating hosts (46 -> 44)
------------------------------

  Additional (5): fi-bdw-gvtdvm fi-snb-2520m fi-gdg-551 fi-elk-e7500 fi-bsw-nick 
  Missing    (7): fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-bwr-2160 fi-kbl-x1275 fi-kbl-7560u fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5405 -> IGTPW_4034

  CI-20190529: 20190529
  CI_DRM_7838: d3d96beea538c8de906a1c4d7e6793a47d17a471 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4034: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4034/index.html
  IGT_5405: add505d102f5d27e38cb4d926524664e161c2a1a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4034/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
