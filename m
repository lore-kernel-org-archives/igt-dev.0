Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 04 Feb 2020 15:45:58 -0000
Message-ID: <158083115880.25087.6026187419551881908@emeril.freedesktop.org>
References: <20200204114837.887623-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200204114837.887623-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaW50ZWwt?=
 =?utf-8?q?ci=3A_Delegate_exhaustive_fault-injection_to_the_idle_runs_=28r?=
 =?utf-8?q?ev2=29?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: intel-ci: Delegate exhaustive fault-injection to the idle runs (rev2)
URL   : https://patchwork.freedesktop.org/series/70452/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7864 -> IGTPW_4090
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/index.html

Known issues
------------

  Here are the changes found in IGTPW_4090 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [PASS][1] -> [INCOMPLETE][2] ([i915#45])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [PASS][3] -> [FAIL][4] ([CI#94])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@i915_getparams_basic@basic-subslice-total:
    - fi-tgl-y:           [PASS][5] -> [DMESG-WARN][6] ([CI#94] / [i915#402])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-tgl-y/igt@i915_getparams_basic@basic-subslice-total.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/fi-tgl-y/igt@i915_getparams_basic@basic-subslice-total.html

  * igt@i915_selftest@live_execlists:
    - fi-skl-6600u:       [PASS][7] -> [INCOMPLETE][8] ([i915#529])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-skl-6600u/igt@i915_selftest@live_execlists.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/fi-skl-6600u/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@live_gtt:
    - fi-bdw-5557u:       [PASS][9] -> [TIMEOUT][10] ([fdo#112271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-bdw-5557u/igt@i915_selftest@live_gtt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/fi-bdw-5557u/igt@i915_selftest@live_gtt.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][11] -> [FAIL][12] ([fdo#111407])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-j1900:       [TIMEOUT][13] ([fdo#112271] / [i915#1084]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-byt-j1900/igt@gem_exec_parallel@contexts.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/fi-byt-j1900/igt@gem_exec_parallel@contexts.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6770hq:      [FAIL][15] ([i915#178]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][17] ([i915#725]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_execlists:
    - fi-icl-y:           [DMESG-FAIL][19] ([fdo#108569]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-icl-y/igt@i915_selftest@live_execlists.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/fi-icl-y/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-byt-j1900:       [DMESG-FAIL][21] ([i915#1052]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-byt-j1900/igt@i915_selftest@live_gem_contexts.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/fi-byt-j1900/igt@i915_selftest@live_gem_contexts.html

  * igt@i915_selftest@live_gtt:
    - fi-skl-6600u:       [TIMEOUT][23] ([fdo#111732] / [fdo#112271]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-skl-6600u/igt@i915_selftest@live_gtt.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/fi-skl-6600u/igt@i915_selftest@live_gtt.html

  * igt@i915_selftest@live_perf:
    - fi-apl-guc:         [INCOMPLETE][25] ([fdo#103927]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-apl-guc/igt@i915_selftest@live_perf.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/fi-apl-guc/igt@i915_selftest@live_perf.html

  * igt@kms_addfb_basic@bad-pitch-0:
    - fi-tgl-y:           [DMESG-WARN][27] ([CI#94] / [i915#402]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/fi-tgl-y/igt@kms_addfb_basic@bad-pitch-0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/fi-tgl-y/igt@kms_addfb_basic@bad-pitch-0.html

  
  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [fdo#111732]: https://bugs.freedesktop.org/show_bug.cgi?id=111732
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1052]: https://gitlab.freedesktop.org/drm/intel/issues/1052
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#178]: https://gitlab.freedesktop.org/drm/intel/issues/178
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725


Participating hosts (50 -> 47)
------------------------------

  Additional (3): fi-skl-lmem fi-glk-dsi fi-snb-2520m 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5417 -> IGTPW_4090

  CI-20190529: 20190529
  CI_DRM_7864: 5a140e2fc771e4c8b10d14e2db7bfb4996ee9d8a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4090: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/index.html
  IGT_5417: 33cc93c8ba5daa0b7498f297a4f626844d895d06 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4090/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
