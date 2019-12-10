Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 10 Dec 2019 10:01:06 -0000
Message-ID: <157597206644.18786.14009337776964646936@emeril.freedesktop.org>
References: <20191209133441.25851-1-stanislav.lisovskiy@intel.com>
In-Reply-To: <20191209133441.25851-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaWd0L3Rl?=
 =?utf-8?q?sts=3A_kms=5Fplane=5Fstress=3A_Add_plane_stress_test_=28rev20?=
 =?utf-8?q?=29?=
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
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: igt/tests: kms_plane_stress: Add plane stress test (rev20)
URL   : https://patchwork.freedesktop.org/series/58524/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7521 -> IGTPW_3833
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/index.html

Known issues
------------

  Here are the changes found in IGTPW_3833 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-8700k:       [PASS][1] -> [DMESG-FAIL][2] ([i915#730])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html
    - fi-hsw-peppy:       [PASS][3] -> [DMESG-FAIL][4] ([i915#761])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html

  
#### Possible fixes ####

  * igt@gem_ctx_create@basic-files:
    - {fi-tgl-guc}:       [INCOMPLETE][5] ([fdo#111735]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/fi-tgl-guc/igt@gem_ctx_create@basic-files.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/fi-tgl-guc/igt@gem_ctx_create@basic-files.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-icl-guc:         [INCOMPLETE][7] ([i915#140] / [i915#184]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/fi-icl-guc/igt@gem_exec_suspend@basic-s4-devices.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/fi-icl-guc/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [DMESG-FAIL][9] -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/fi-ivb-3770/igt@i915_selftest@live_blt.html
    - fi-byt-j1900:       [DMESG-FAIL][11] ([i915#725]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/fi-byt-j1900/igt@i915_selftest@live_blt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/fi-byt-j1900/igt@i915_selftest@live_blt.html
    - fi-hsw-4770:        [DMESG-FAIL][13] -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/fi-hsw-4770/igt@i915_selftest@live_blt.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-kbl-x1275:       [DMESG-WARN][15] ([fdo#107139] / [i915#62] / [i915#92]) -> [DMESG-WARN][16] ([fdo#107139] / [i915#62] / [i915#92] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/fi-kbl-x1275/igt@gem_exec_suspend@basic-s4-devices.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/fi-kbl-x1275/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - fi-kbl-x1275:       [DMESG-WARN][17] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][18] ([i915#62] / [i915#92]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - fi-kbl-x1275:       [DMESG-WARN][19] ([i915#62] / [i915#92]) -> [DMESG-WARN][20] ([i915#62] / [i915#92] / [i915#95]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/fi-kbl-x1275/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/fi-kbl-x1275/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#107139]: https://bugs.freedesktop.org/show_bug.cgi?id=107139
  [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#184]: https://gitlab.freedesktop.org/drm/intel/issues/184
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#730]: https://gitlab.freedesktop.org/drm/intel/issues/730
  [i915#761]: https://gitlab.freedesktop.org/drm/intel/issues/761
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (50 -> 46)
------------------------------

  Additional (1): fi-kbl-guc 
  Missing    (5): fi-ilk-m540 fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-kbl-r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5341 -> IGTPW_3833

  CI-20190529: 20190529
  CI_DRM_7521: 9203f67985ebf27211aa1eabb77093302248c9fc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3833: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/index.html
  IGT_5341: 5fe683cdebde2d77d16ffc42c9fdf29a9f95bb82 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_plane_stress@stress-xrgb8888-untiled
+igt@kms_plane_stress@stress-xrgb8888-xtiled
+igt@kms_plane_stress@stress-xrgb8888-ytiled

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
