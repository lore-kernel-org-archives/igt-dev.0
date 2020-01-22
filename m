Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 22 Jan 2020 19:56:13 -0000
Message-ID: <157972297365.22393.15534094020835933567@emeril.freedesktop.org>
References: <20200122164332.11460-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200122164332.11460-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fcore=3A_Detect_gdb_harder?=
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
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_core: Detect gdb harder
URL   : https://patchwork.freedesktop.org/series/72413/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7796 -> IGTPW_3970
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/index.html

Known issues
------------

  Here are the changes found in IGTPW_3970 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@mmap:
    - fi-icl-dsi:         [PASS][1] -> [DMESG-WARN][2] ([i915#109])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/fi-icl-dsi/igt@fbdev@mmap.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/fi-icl-dsi/igt@fbdev@mmap.html

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [PASS][3] -> [INCOMPLETE][4] ([i915#45])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-cml-s:           [PASS][5] -> [INCOMPLETE][6] ([i915#283])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/fi-cml-s/igt@gem_exec_suspend@basic-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/fi-cml-s/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [PASS][7] -> [DMESG-FAIL][8] ([i915#770])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/fi-ivb-3770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_coherency:
    - fi-cfl-guc:         [PASS][9] -> [DMESG-FAIL][10] ([i915#889]) +7 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/fi-cfl-guc/igt@i915_selftest@live_coherency.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/fi-cfl-guc/igt@i915_selftest@live_coherency.html

  * igt@i915_selftest@live_gt_timelines:
    - fi-cfl-guc:         [PASS][11] -> [DMESG-WARN][12] ([i915#889]) +23 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/fi-cfl-guc/igt@i915_selftest@live_gt_timelines.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/fi-cfl-guc/igt@i915_selftest@live_gt_timelines.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][13] -> [FAIL][14] ([fdo#111096] / [i915#323])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-cml-s:           [FAIL][15] ([fdo#103375]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/fi-cml-s/igt@gem_exec_suspend@basic-s0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/fi-cml-s/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-8700k:       [INCOMPLETE][17] ([CI#80] / [i915#424]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html

  
#### Warnings ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-n2820:       [FAIL][19] -> [TIMEOUT][20] ([fdo#112271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/fi-byt-n2820/igt@gem_exec_parallel@contexts.html

  * igt@gem_exec_parallel@fds:
    - fi-byt-n2820:       [INCOMPLETE][21] ([i915#45]) -> [TIMEOUT][22] ([fdo#112271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/fi-byt-n2820/igt@gem_exec_parallel@fds.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/fi-byt-n2820/igt@gem_exec_parallel@fds.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [DMESG-FAIL][23] ([i915#553] / [i915#725]) -> [DMESG-FAIL][24] ([i915#725])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#109]: https://gitlab.freedesktop.org/drm/intel/issues/109
  [i915#283]: https://gitlab.freedesktop.org/drm/intel/issues/283
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889


Participating hosts (49 -> 47)
------------------------------

  Additional (4): fi-kbl-7560u fi-kbl-r fi-ilk-650 fi-elk-e7500 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5377 -> IGTPW_3970

  CI-20190529: 20190529
  CI_DRM_7796: 2d96f6aa93defd19024f701d05c0284034e914e2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3970: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/index.html
  IGT_5377: 1e6cb3e75925cf623df04f78430ae9299632ec3f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
