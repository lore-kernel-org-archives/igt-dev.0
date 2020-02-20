Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 20 Feb 2020 01:42:49 -0000
Message-ID: <158216296933.17408.16275461980381610885@emeril.freedesktop.org>
References: <20200219175751.15293-1-akeem.g.abodunrin@intel.com>
In-Reply-To: <20200219175751.15293-1-akeem.g.abodunrin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgU3VwcG9y?=
 =?utf-8?q?t_to_assemble_CB_kernel_for_gen7?=
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
To: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Support to assemble CB kernel for gen7
URL   : https://patchwork.freedesktop.org/series/73684/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7968 -> IGTPW_4188
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/index.html

Known issues
------------

  Here are the changes found in IGTPW_4188 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-peppy:       [PASS][1] -> [INCOMPLETE][2] ([i915#694] / [i915#816])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/fi-hsw-peppy/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_parallel@contexts:
    - fi-byt-n2820:       [PASS][3] -> [FAIL][4] ([i915#694])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/fi-byt-n2820/igt@gem_exec_parallel@contexts.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-byt-n2820:       [PASS][5] -> [DMESG-FAIL][6] ([i915#1052])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html
    - fi-cml-s:           [PASS][7] -> [DMESG-FAIL][8] ([i915#877])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/fi-cml-s/igt@i915_selftest@live_gem_contexts.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/fi-cml-s/igt@i915_selftest@live_gem_contexts.html

  * igt@i915_selftest@live_sanitycheck:
    - fi-icl-u3:          [PASS][9] -> [DMESG-WARN][10] ([i915#585])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/fi-icl-u3/igt@i915_selftest@live_sanitycheck.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/fi-icl-u3/igt@i915_selftest@live_sanitycheck.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_gtt:
    - fi-bxt-dsi:         [TIMEOUT][11] ([fdo#112271]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/fi-bxt-dsi/igt@i915_selftest@live_gtt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/fi-bxt-dsi/igt@i915_selftest@live_gtt.html

  * igt@i915_selftest@live_hangcheck:
    - fi-icl-u2:          [INCOMPLETE][13] ([fdo#108569]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/fi-icl-u2/igt@i915_selftest@live_hangcheck.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/fi-icl-u2/igt@i915_selftest@live_hangcheck.html

  
#### Warnings ####

  * igt@amdgpu/amd_prime@amd-to-i915:
    - fi-icl-u3:          [SKIP][15] ([fdo#109315] / [i915#585]) -> [SKIP][16] ([fdo#109315])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7968/fi-icl-u3/igt@amdgpu/amd_prime@amd-to-i915.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/fi-icl-u3/igt@amdgpu/amd_prime@amd-to-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1052]: https://gitlab.freedesktop.org/drm/intel/issues/1052
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#585]: https://gitlab.freedesktop.org/drm/intel/issues/585
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877


Participating hosts (51 -> 45)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5452 -> IGTPW_4188

  CI-20190529: 20190529
  CI_DRM_7968: fbfd614e946dc8ba097ea684179eee70fb6e53ed @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4188: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/index.html
  IGT_5452: c05dc6cd816feb1cc518ce777ab3fd6c81893113 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4188/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
