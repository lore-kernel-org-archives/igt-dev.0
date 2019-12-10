Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 10 Dec 2019 20:54:55 -0000
Message-ID: <157601129508.23232.16149176990216011223@emeril.freedesktop.org>
References: <20191210195559.9860-1-jose.souza@intel.com>
In-Reply-To: <20191210195559.9860-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliOiBT?=
 =?utf-8?q?ync_i915=5Fpciids=2Eh?=
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
To: "Souza, Jose" <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib: Sync i915_pciids.h
URL   : https://patchwork.freedesktop.org/series/70712/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7532 -> IGTPW_3842
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3842 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3842, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3842/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3842:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_create@basic-files:
    - fi-ivb-3770:        [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7532/fi-ivb-3770/igt@gem_ctx_create@basic-files.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3842/fi-ivb-3770/igt@gem_ctx_create@basic-files.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [PASS][3] -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7532/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3842/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  
Known issues
------------

  Here are the changes found in IGTPW_3842 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live_blt:
    - fi-bsw-nick:        [PASS][5] -> [DMESG-FAIL][6] ([i915#723])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7532/fi-bsw-nick/igt@i915_selftest@live_blt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3842/fi-bsw-nick/igt@i915_selftest@live_blt.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@basic:
    - {fi-tgl-u}:         [INCOMPLETE][7] ([i915#476]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7532/fi-tgl-u/igt@gem_exec_parallel@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3842/fi-tgl-u/igt@gem_exec_parallel@basic.html

  * igt@i915_selftest@live_blt:
    - fi-bsw-n3050:       [DMESG-FAIL][9] ([i915#723]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7532/fi-bsw-n3050/igt@i915_selftest@live_blt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3842/fi-bsw-n3050/igt@i915_selftest@live_blt.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-kbl-guc:         [SKIP][11] ([fdo#109271]) -> [FAIL][12] ([i915#704])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7532/fi-kbl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3842/fi-kbl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][13] ([i915#770]) -> [DMESG-FAIL][14] ([i915#725])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7532/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3842/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-hsw-peppy:       [INCOMPLETE][15] ([i915#694]) -> [DMESG-FAIL][16] ([i915#722])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7532/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3842/fi-hsw-peppy/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_busy@basic-flip-pipe-a:
    - fi-kbl-x1275:       [DMESG-WARN][17] ([i915#62] / [i915#92]) -> [DMESG-WARN][18] ([i915#62] / [i915#92] / [i915#95]) +6 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7532/fi-kbl-x1275/igt@kms_busy@basic-flip-pipe-a.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3842/fi-kbl-x1275/igt@kms_busy@basic-flip-pipe-a.html

  * igt@kms_busy@basic-flip-pipe-b:
    - fi-kbl-x1275:       [DMESG-WARN][19] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][20] ([i915#62] / [i915#92]) +4 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7532/fi-kbl-x1275/igt@kms_busy@basic-flip-pipe-b.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3842/fi-kbl-x1275/igt@kms_busy@basic-flip-pipe-b.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#476]: https://gitlab.freedesktop.org/drm/intel/issues/476
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#704]: https://gitlab.freedesktop.org/drm/intel/issues/704
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#722]: https://gitlab.freedesktop.org/drm/intel/issues/722
  [i915#723]: https://gitlab.freedesktop.org/drm/intel/issues/723
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (55 -> 47)
------------------------------

  Missing    (8): fi-icl-1065g7 fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5341 -> IGTPW_3842

  CI-20190529: 20190529
  CI_DRM_7532: 2004c1c9d9669c6722274d5cf62f8f2b00720d57 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3842: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3842/index.html
  IGT_5341: 5fe683cdebde2d77d16ffc42c9fdf29a9f95bb82 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3842/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
