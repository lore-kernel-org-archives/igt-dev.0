Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 04 Feb 2020 14:27:58 -0000
Message-ID: <158082647890.25088.9111472099525885942@emeril.freedesktop.org>
References: <20200204072122.5968-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200204072122.5968-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fset=5Ftiling=5Fvs=5Fpwrite=3A_disable_test_on_gens_w?=
 =?utf-8?q?ithout_ggtt?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_set_tiling_vs_pwrite: disable test on gens without ggtt
URL   : https://patchwork.freedesktop.org/series/72952/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7864 -> IGTPW_4087
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/index.html

Known issues
------------

  Here are the changes found in IGTPW_4087 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [PASS][1] -> [INCOMPLETE][2] ([i915#45])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/fi-byt-j1900/igt@gem_close_race@basic-threads.html
    - fi-byt-n2820:       [PASS][3] -> [INCOMPLETE][4] ([i915#45])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [PASS][5] -> [DMESG-FAIL][6] ([i915#725])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/fi-hsw-4770r/igt@i915_selftest@live_blt.html
    - fi-ivb-3770:        [PASS][7] -> [DMESG-FAIL][8] ([i915#770])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/fi-ivb-3770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gtt:
    - fi-kbl-7500u:       [PASS][9] -> [TIMEOUT][10] ([fdo#112271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-kbl-7500u/igt@i915_selftest@live_gtt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/fi-kbl-7500u/igt@i915_selftest@live_gtt.html

  * igt@i915_selftest@live_hangcheck:
    - fi-icl-u2:          [PASS][11] -> [INCOMPLETE][12] ([fdo#108569])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-icl-u2/igt@i915_selftest@live_hangcheck.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/fi-icl-u2/igt@i915_selftest@live_hangcheck.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-cml-s:           [INCOMPLETE][13] ([i915#1078] / [i915#283]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-cml-s/igt@gem_exec_suspend@basic-s3.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/fi-cml-s/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6770hq:      [FAIL][15] ([i915#178]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][17] ([i915#725]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_execlists:
    - fi-icl-y:           [DMESG-FAIL][19] ([fdo#108569]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-icl-y/igt@i915_selftest@live_execlists.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/fi-icl-y/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@live_gtt:
    - fi-skl-6600u:       [TIMEOUT][21] ([fdo#111732] / [fdo#112271]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-skl-6600u/igt@i915_selftest@live_gtt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/fi-skl-6600u/igt@i915_selftest@live_gtt.html

  * igt@i915_selftest@live_perf:
    - fi-apl-guc:         [INCOMPLETE][23] ([fdo#103927]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-apl-guc/igt@i915_selftest@live_perf.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/fi-apl-guc/igt@i915_selftest@live_perf.html

  
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#111732]: https://bugs.freedesktop.org/show_bug.cgi?id=111732
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1078]: https://gitlab.freedesktop.org/drm/intel/issues/1078
  [i915#178]: https://gitlab.freedesktop.org/drm/intel/issues/178
  [i915#283]: https://gitlab.freedesktop.org/drm/intel/issues/283
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770


Participating hosts (50 -> 46)
------------------------------

  Additional (3): fi-skl-lmem fi-glk-dsi fi-snb-2520m 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-ctg-p8600 fi-tgl-y fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5417 -> IGTPW_4087

  CI-20190529: 20190529
  CI_DRM_7864: 5a140e2fc771e4c8b10d14e2db7bfb4996ee9d8a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4087: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/index.html
  IGT_5417: 33cc93c8ba5daa0b7498f297a4f626844d895d06 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
