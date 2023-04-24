Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5160005988481952456=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 24 Apr 2023 10:38:02 -0000
Message-ID: <168233268245.1233.9863334399890722022@emeril.freedesktop.org>
References: <20230424073907.158701-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230424073907.158701-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgSW50ZWdy?=
 =?utf-8?q?ate_intel-bb_with_Xe_=28rev6=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============5160005988481952456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Integrate intel-bb with Xe (rev6)
URL   : https://patchwork.freedesktop.org/series/116578/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13052 -> IGTPW_8842
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8842 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8842, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/index.html

Participating hosts (38 -> 35)
------------------------------

  Missing    (3): fi-kbl-soraka bat-mtlp-8 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8842:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_render_linear_blits@basic:
    - fi-rkl-11600:       [PASS][1] -> [FAIL][2] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-rkl-11600/igt@gem_render_linear_blits@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-rkl-11600/igt@gem_render_linear_blits@basic.html
    - fi-skl-6600u:       [PASS][3] -> [FAIL][4] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-skl-6600u/igt@gem_render_linear_blits@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-skl-6600u/igt@gem_render_linear_blits@basic.html
    - bat-adls-5:         [PASS][5] -> [FAIL][6] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-adls-5/igt@gem_render_linear_blits@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-adls-5/igt@gem_render_linear_blits@basic.html
    - fi-apl-guc:         [PASS][7] -> [FAIL][8] +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-apl-guc/igt@gem_render_linear_blits@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-apl-guc/igt@gem_render_linear_blits@basic.html
    - bat-dg1-5:          [PASS][9] -> [FAIL][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-dg1-5/igt@gem_render_linear_blits@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-dg1-5/igt@gem_render_linear_blits@basic.html
    - bat-atsm-1:         [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-atsm-1/igt@gem_render_linear_blits@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-atsm-1/igt@gem_render_linear_blits@basic.html
    - bat-dg1-7:          [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-dg1-7/igt@gem_render_linear_blits@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-dg1-7/igt@gem_render_linear_blits@basic.html
    - bat-jsl-3:          [PASS][15] -> [FAIL][16] +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-jsl-3/igt@gem_render_linear_blits@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-jsl-3/igt@gem_render_linear_blits@basic.html
    - fi-skl-guc:         [PASS][17] -> [FAIL][18] +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-skl-guc/igt@gem_render_linear_blits@basic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-skl-guc/igt@gem_render_linear_blits@basic.html
    - fi-kbl-7567u:       [PASS][19] -> [FAIL][20] +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-kbl-7567u/igt@gem_render_linear_blits@basic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-kbl-7567u/igt@gem_render_linear_blits@basic.html
    - fi-kbl-8809g:       [PASS][21] -> [FAIL][22] +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-kbl-8809g/igt@gem_render_linear_blits@basic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-kbl-8809g/igt@gem_render_linear_blits@basic.html
    - fi-elk-e7500:       [PASS][23] -> [FAIL][24] +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-elk-e7500/igt@gem_render_linear_blits@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-elk-e7500/igt@gem_render_linear_blits@basic.html
    - fi-bsw-nick:        [PASS][25] -> [FAIL][26] +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-bsw-nick/igt@gem_render_linear_blits@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-bsw-nick/igt@gem_render_linear_blits@basic.html
    - bat-dg2-9:          [PASS][27] -> [FAIL][28] +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-dg2-9/igt@gem_render_linear_blits@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-dg2-9/igt@gem_render_linear_blits@basic.html

  * igt@gem_render_tiled_blits@basic:
    - fi-glk-j4005:       [PASS][29] -> [FAIL][30] +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-glk-j4005/igt@gem_render_tiled_blits@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-glk-j4005/igt@gem_render_tiled_blits@basic.html
    - bat-adlp-9:         [PASS][31] -> [FAIL][32] +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-adlp-9/igt@gem_render_tiled_blits@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-adlp-9/igt@gem_render_tiled_blits@basic.html
    - fi-cfl-8700k:       [PASS][33] -> [FAIL][34] +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-cfl-8700k/igt@gem_render_tiled_blits@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-cfl-8700k/igt@gem_render_tiled_blits@basic.html
    - bat-rplp-1:         [PASS][35] -> [FAIL][36] +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-rplp-1/igt@gem_render_tiled_blits@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-rplp-1/igt@gem_render_tiled_blits@basic.html
    - fi-kbl-x1275:       [PASS][37] -> [FAIL][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-kbl-x1275/igt@gem_render_tiled_blits@basic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-kbl-x1275/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_blits@basic:
    - fi-kbl-guc:         [PASS][39] -> [FAIL][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-kbl-guc/igt@gem_tiled_blits@basic.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-kbl-guc/igt@gem_tiled_blits@basic.html
    - bat-adlm-1:         [PASS][41] -> [FAIL][42] +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-adlm-1/igt@gem_tiled_blits@basic.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-adlm-1/igt@gem_tiled_blits@basic.html
    - fi-ilk-650:         [PASS][43] -> [FAIL][44] +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-ilk-650/igt@gem_tiled_blits@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-ilk-650/igt@gem_tiled_blits@basic.html
    - bat-jsl-1:          [PASS][45] -> [FAIL][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-jsl-1/igt@gem_tiled_blits@basic.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-jsl-1/igt@gem_tiled_blits@basic.html
    - fi-tgl-1115g4:      [PASS][47] -> [FAIL][48] +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-tgl-1115g4/igt@gem_tiled_blits@basic.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-tgl-1115g4/igt@gem_tiled_blits@basic.html
    - bat-rpls-1:         [PASS][49] -> [FAIL][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-rpls-1/igt@gem_tiled_blits@basic.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-rpls-1/igt@gem_tiled_blits@basic.html
    - fi-cfl-guc:         [PASS][51] -> [FAIL][52] +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-cfl-guc/igt@gem_tiled_blits@basic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-cfl-guc/igt@gem_tiled_blits@basic.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-hsw-4770:        [PASS][53] -> [FAIL][54] +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-hsw-4770/igt@kms_frontbuffer_tracking@basic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-hsw-4770/igt@kms_frontbuffer_tracking@basic.html
    - fi-cfl-8109u:       [PASS][55] -> [FAIL][56] +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html
    - bat-adln-1:         [PASS][57] -> [FAIL][58] +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-adln-1/igt@kms_frontbuffer_tracking@basic.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-adln-1/igt@kms_frontbuffer_tracking@basic.html
    - fi-ivb-3770:        [PASS][59] -> [FAIL][60] +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-ivb-3770/igt@kms_frontbuffer_tracking@basic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-ivb-3770/igt@kms_frontbuffer_tracking@basic.html
    - bat-dg2-8:          [PASS][61] -> [FAIL][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-dg2-8/igt@kms_frontbuffer_tracking@basic.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-dg2-8/igt@kms_frontbuffer_tracking@basic.html
    - fi-bsw-n3050:       [PASS][63] -> [FAIL][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-bsw-n3050/igt@kms_frontbuffer_tracking@basic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-bsw-n3050/igt@kms_frontbuffer_tracking@basic.html
    - bat-adlp-6:         [PASS][65] -> [FAIL][66] +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-adlp-6/igt@kms_frontbuffer_tracking@basic.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-adlp-6/igt@kms_frontbuffer_tracking@basic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_render_tiled_blits@basic:
    - {bat-kbl-2}:        [PASS][67] -> [FAIL][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-kbl-2/igt@gem_render_tiled_blits@basic.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-kbl-2/igt@gem_render_tiled_blits@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_8842 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - bat-rpls-1:         NOTRUN -> [ABORT][69] ([i915#6687] / [i915#7978])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@slpc:
    - bat-rpls-1:         NOTRUN -> [DMESG-FAIL][70] ([i915#6367])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-rpls-1/igt@i915_selftest@live@slpc.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - bat-jsl-3:          NOTRUN -> [SKIP][71] ([i915#7828])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-jsl-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@read-crc:
    - bat-adlp-9:         NOTRUN -> [SKIP][72] ([i915#3546]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-adlp-9/igt@kms_pipe_crc_basic@read-crc.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests@sanitycheck:
    - bat-jsl-3:          [INCOMPLETE][73] ([i915#8144]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-jsl-3/igt@dmabuf@all-tests@sanitycheck.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-jsl-3/igt@dmabuf@all-tests@sanitycheck.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [ABORT][75] ([i915#4983] / [i915#8384]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-rpls-1/igt@i915_selftest@live@reset.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-rpls-1/igt@i915_selftest@live@reset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
  [i915#8144]: https://gitlab.freedesktop.org/drm/intel/issues/8144
  [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7266 -> IGTPW_8842

  CI-20190529: 20190529
  CI_DRM_13052: 04154f5c718e377bd30449c425a34de089a99d35 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8842: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/index.html
  IGT_7266: 94411dd85f9ad6d76fb7b2097197122703a3914c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_gpgpu_fill@basic
+igt@xe_intel_bb@add-remove-objects
+igt@xe_intel_bb@bb-with-allocator
+igt@xe_intel_bb@blit-reloc
+igt@xe_intel_bb@blit-simple
+igt@xe_intel_bb@create-in-region
+igt@xe_intel_bb@delta-check
+igt@xe_intel_bb@destroy-bb
+igt@xe_intel_bb@full-batch
+igt@xe_intel_bb@intel-bb-blit-none
+igt@xe_intel_bb@intel-bb-blit-x
+igt@xe_intel_bb@intel-bb-blit-y
+igt@xe_intel_bb@lot-of-buffers
+igt@xe_intel_bb@offset-control
+igt@xe_intel_bb@purge-bb
+igt@xe_intel_bb@render
+igt@xe_intel_bb@reset-bb
+igt@xe_intel_bb@simple-bb
+igt@xe_intel_bb@simple-bb-ctx

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/index.html

--===============5160005988481952456==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>Integrate intel-bb with Xe (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/116578/">https://patchwork.freedesktop.org/series/116578/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13052 -&gt; IGTPW_8842</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8842 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8842, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/index.html</p>
<h2>Participating hosts (38 -&gt; 35)</h2>
<p>Missing    (3): fi-kbl-soraka bat-mtlp-8 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8842:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_render_linear_blits@basic:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-rkl-11600/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-rkl-11600/igt@gem_render_linear_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-skl-6600u/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-skl-6600u/igt@gem_render_linear_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-adls-5/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-adls-5/igt@gem_render_linear_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-apl-guc/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-apl-guc/igt@gem_render_linear_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-dg1-5/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-dg1-5/igt@gem_render_linear_blits@basic.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-atsm-1/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-atsm-1/igt@gem_render_linear_blits@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-dg1-7/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-dg1-7/igt@gem_render_linear_blits@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-jsl-3/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-jsl-3/igt@gem_render_linear_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-skl-guc/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-skl-guc/igt@gem_render_linear_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-kbl-7567u/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-kbl-7567u/igt@gem_render_linear_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-kbl-8809g/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-kbl-8809g/igt@gem_render_linear_blits@basic.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-elk-e7500/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-elk-e7500/igt@gem_render_linear_blits@basic.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-bsw-nick/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-bsw-nick/igt@gem_render_linear_blits@basic.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-dg2-9/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-dg2-9/igt@gem_render_linear_blits@basic.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-glk-j4005/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-glk-j4005/igt@gem_render_tiled_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-adlp-9/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-adlp-9/igt@gem_render_tiled_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-cfl-8700k/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-cfl-8700k/igt@gem_render_tiled_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-rplp-1/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-rplp-1/igt@gem_render_tiled_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-kbl-x1275/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-kbl-x1275/igt@gem_render_tiled_blits@basic.html">FAIL</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-kbl-guc/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-kbl-guc/igt@gem_tiled_blits@basic.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-adlm-1/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-adlm-1/igt@gem_tiled_blits@basic.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-ilk-650/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-ilk-650/igt@gem_tiled_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-jsl-1/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-jsl-1/igt@gem_tiled_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-tgl-1115g4/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-tgl-1115g4/igt@gem_tiled_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-rpls-1/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-rpls-1/igt@gem_tiled_blits@basic.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-cfl-guc/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-cfl-guc/igt@gem_tiled_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-hsw-4770/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-hsw-4770/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-adln-1/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-adln-1/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-ivb-3770/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-ivb-3770/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-dg2-8/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-dg2-8/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-bsw-n3050/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/fi-bsw-n3050/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-adlp-6/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-adlp-6/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +3 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_render_tiled_blits@basic:<ul>
<li>{bat-kbl-2}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-kbl-2/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-kbl-2/igt@gem_render_tiled_blits@basic.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8842 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-jsl-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-adlp-9/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests@sanitycheck:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-jsl-3/igt@dmabuf@all-tests@sanitycheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8144">i915#8144</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-jsl-3/igt@dmabuf@all-tests@sanitycheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8384">i915#8384</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7266 -&gt; IGTPW_8842</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13052: 04154f5c718e377bd30449c425a34de089a99d35 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8842: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8842/index.html<br />
  IGT_7266: 94411dd85f9ad6d76fb7b2097197122703a3914c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_gpgpu_fill@basic<br />
+igt@xe_intel_bb@add-remove-objects<br />
+igt@xe_intel_bb@bb-with-allocator<br />
+igt@xe_intel_bb@blit-reloc<br />
+igt@xe_intel_bb@blit-simple<br />
+igt@xe_intel_bb@create-in-region<br />
+igt@xe_intel_bb@delta-check<br />
+igt@xe_intel_bb@destroy-bb<br />
+igt@xe_intel_bb@full-batch<br />
+igt@xe_intel_bb@intel-bb-blit-none<br />
+igt@xe_intel_bb@intel-bb-blit-x<br />
+igt@xe_intel_bb@intel-bb-blit-y<br />
+igt@xe_intel_bb@lot-of-buffers<br />
+igt@xe_intel_bb@offset-control<br />
+igt@xe_intel_bb@purge-bb<br />
+igt@xe_intel_bb@render<br />
+igt@xe_intel_bb@reset-bb<br />
+igt@xe_intel_bb@simple-bb<br />
+igt@xe_intel_bb@simple-bb-ctx</p>

</body>
</html>

--===============5160005988481952456==--
