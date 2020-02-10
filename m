Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 10 Feb 2020 11:35:26 -0000
Message-ID: <158133452621.3097.18152985296243047610@emeril.freedesktop.org>
References: <20200210025233.222606-1-drinkcat@chromium.org>
In-Reply-To: <20200210025233.222606-1-drinkcat@chromium.org>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbWVzb246?=
 =?utf-8?q?_Port_cpuid=2Eh_test_from_configure=2Eac?=
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
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: meson: Port cpuid.h test from configure.ac
URL   : https://patchwork.freedesktop.org/series/73223/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7897 -> IGTPW_4117
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/index.html

Known issues
------------

  Here are the changes found in IGTPW_4117 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [PASS][1] -> [INCOMPLETE][2] ([i915#45])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [PASS][3] -> [DMESG-FAIL][4] ([i915#725])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/fi-ivb-3770/igt@i915_selftest@live_blt.html
    - fi-hsw-4770:        [PASS][5] -> [DMESG-FAIL][6] ([i915#553] / [i915#725])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_execlists:
    - fi-icl-y:           [PASS][7] -> [DMESG-FAIL][8] ([fdo#108569])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/fi-icl-y/igt@i915_selftest@live_execlists.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/fi-icl-y/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-hsw-peppy:       [PASS][9] -> [DMESG-FAIL][10] ([i915#722])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - fi-glk-dsi:         [PASS][11] -> [INCOMPLETE][12] ([i915#58] / [k.org#198133])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/fi-glk-dsi/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/fi-glk-dsi/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_active:
    - fi-skl-lmem:        [DMESG-FAIL][13] ([i915#666]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/fi-skl-lmem/igt@i915_selftest@live_active.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/fi-skl-lmem/igt@i915_selftest@live_active.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cml-s:           [DMESG-FAIL][15] ([i915#877]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/fi-cml-s/igt@i915_selftest@live_gem_contexts.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/fi-cml-s/igt@i915_selftest@live_gem_contexts.html

  
#### Warnings ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [TIMEOUT][17] ([fdo#112271] / [i915#1084] / [i915#816]) -> [INCOMPLETE][18] ([i915#45])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#666]: https://gitlab.freedesktop.org/drm/intel/issues/666
  [i915#722]: https://gitlab.freedesktop.org/drm/intel/issues/722
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (46 -> 48)
------------------------------

  Additional (5): fi-kbl-7560u fi-bsw-n3050 fi-gdg-551 fi-bsw-kefka fi-blb-e6850 
  Missing    (3): fi-ilk-m540 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5431 -> IGTPW_4117

  CI-20190529: 20190529
  CI_DRM_7897: b1c4983a1cff9719019abfb5da7d142f23b7834d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4117: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/index.html
  IGT_5431: 33c7f2c0a2b238bb55d3c5b3a3006d965125cf76 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
