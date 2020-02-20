Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 20 Feb 2020 19:43:51 -0000
Message-ID: <158222783195.17407.18267049270720941805@emeril.freedesktop.org>
References: <20200220173056.23088-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200220173056.23088-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2k5?=
 =?utf-8?q?15=3A_Restrict_mmap_types_to_GTT_if_no_MMAP=5FOFFSET_support_?=
 =?utf-8?b?KHJldjMp?=
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

Series: lib/i915: Restrict mmap types to GTT if no MMAP_OFFSET support (rev3)
URL   : https://patchwork.freedesktop.org/series/73719/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7975 -> IGTPW_4202
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4202/index.html

Known issues
------------

  Here are the changes found in IGTPW_4202 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-ivb-3770:        [PASS][1] -> [TIMEOUT][2] ([fdo#112271])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-ivb-3770/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4202/fi-ivb-3770/igt@gem_close_race@basic-threads.html

  * igt@prime_self_import@basic-with_fd_dup:
    - fi-tgl-y:           [PASS][3] -> [DMESG-WARN][4] ([CI#94] / [i915#402])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-tgl-y/igt@prime_self_import@basic-with_fd_dup.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4202/fi-tgl-y/igt@prime_self_import@basic-with_fd_dup.html

  
#### Possible fixes ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-4770r:       [TIMEOUT][5] ([fdo#112271] / [i915#1084]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-hsw-4770r/igt@gem_close_race@basic-threads.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4202/fi-hsw-4770r/igt@gem_close_race@basic-threads.html
    - fi-byt-n2820:       [INCOMPLETE][7] ([i915#45]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4202/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_execlists:
    - fi-tgl-y:           [INCOMPLETE][9] ([CI#94] / [i915#647]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-tgl-y/igt@i915_selftest@live_execlists.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4202/fi-tgl-y/igt@i915_selftest@live_execlists.html
    - fi-icl-y:           [DMESG-FAIL][11] ([fdo#108569]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-icl-y/igt@i915_selftest@live_execlists.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4202/fi-icl-y/igt@i915_selftest@live_execlists.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-cml-u2:          [FAIL][13] ([i915#262]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4202/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html

  * igt@prime_self_import@basic-llseek-bad:
    - fi-tgl-y:           [DMESG-WARN][15] ([CI#94] / [i915#402]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7975/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4202/fi-tgl-y/igt@prime_self_import@basic-llseek-bad.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#647]: https://gitlab.freedesktop.org/drm/intel/issues/647


Participating hosts (47 -> 45)
------------------------------

  Additional (5): fi-tgl-dsi fi-glk-dsi fi-bwr-2160 fi-snb-2520m fi-kbl-r 
  Missing    (7): fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-bsw-kefka fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5453 -> IGTPW_4202

  CI-20190529: 20190529
  CI_DRM_7975: f66891f7bdc3c60bb6f06fd6bc0718a0bd975896 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4202: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4202/index.html
  IGT_5453: cae9a5881ed2c5be2c2518a255740b612a927f9a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4202/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
