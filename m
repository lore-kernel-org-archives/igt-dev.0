Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 15 Jun 2020 10:37:17 -0000
Message-ID: <159221743733.2460.10326571233629458992@emeril.freedesktop.org>
References: <20200615051848.24654-1-pankaj.laxminarayan.bharadiya@intel.com>
In-Reply-To: <20200615051848.24654-1-pankaj.laxminarayan.bharadiya@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL3Jl?=
 =?utf-8?q?ndercopy=3A_Specify_the_correct_vertex_buffer_offset?=
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
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/rendercopy: Specify the correct vertex buffer offset
URL   : https://patchwork.freedesktop.org/series/78326/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8625 -> IGTPW_4674
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4674 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4674, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4674:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_render_linear_blits@basic:
    - fi-cfl-8700k:       [PASS][1] -> [FAIL][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-cfl-8700k/igt@gem_render_linear_blits@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-cfl-8700k/igt@gem_render_linear_blits@basic.html
    - fi-kbl-r:           [PASS][3] -> [FAIL][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-kbl-r/igt@gem_render_linear_blits@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-kbl-r/igt@gem_render_linear_blits@basic.html
    - fi-icl-guc:         [PASS][5] -> [FAIL][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-icl-guc/igt@gem_render_linear_blits@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-icl-guc/igt@gem_render_linear_blits@basic.html
    - fi-cfl-8109u:       [PASS][7] -> [FAIL][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-cfl-8109u/igt@gem_render_linear_blits@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-cfl-8109u/igt@gem_render_linear_blits@basic.html
    - fi-kbl-guc:         [PASS][9] -> [FAIL][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-kbl-guc/igt@gem_render_linear_blits@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-kbl-guc/igt@gem_render_linear_blits@basic.html
    - fi-kbl-7500u:       [PASS][11] -> [FAIL][12] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-kbl-7500u/igt@gem_render_linear_blits@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-kbl-7500u/igt@gem_render_linear_blits@basic.html
    - fi-bxt-dsi:         [PASS][13] -> [FAIL][14] +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-bxt-dsi/igt@gem_render_linear_blits@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-bxt-dsi/igt@gem_render_linear_blits@basic.html
    - fi-kbl-x1275:       [PASS][15] -> [FAIL][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-kbl-x1275/igt@gem_render_linear_blits@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-kbl-x1275/igt@gem_render_linear_blits@basic.html
    - fi-glk-dsi:         [PASS][17] -> [FAIL][18] +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-glk-dsi/igt@gem_render_linear_blits@basic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-glk-dsi/igt@gem_render_linear_blits@basic.html

  * igt@gem_render_tiled_blits@basic:
    - fi-skl-6700k2:      [PASS][19] -> [FAIL][20] +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-skl-6700k2/igt@gem_render_tiled_blits@basic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-skl-6700k2/igt@gem_render_tiled_blits@basic.html
    - fi-kbl-soraka:      [PASS][21] -> [FAIL][22] +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-kbl-soraka/igt@gem_render_tiled_blits@basic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-kbl-soraka/igt@gem_render_tiled_blits@basic.html
    - fi-cfl-guc:         [PASS][23] -> [FAIL][24] +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-cfl-guc/igt@gem_render_tiled_blits@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-cfl-guc/igt@gem_render_tiled_blits@basic.html
    - fi-cml-s:           [PASS][25] -> [FAIL][26] +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-cml-s/igt@gem_render_tiled_blits@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-cml-s/igt@gem_render_tiled_blits@basic.html
    - fi-tgl-u2:          [PASS][27] -> [FAIL][28] +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-tgl-u2/igt@gem_render_tiled_blits@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-tgl-u2/igt@gem_render_tiled_blits@basic.html
    - fi-icl-u2:          [PASS][29] -> [FAIL][30] +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-icl-u2/igt@gem_render_tiled_blits@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-icl-u2/igt@gem_render_tiled_blits@basic.html
    - fi-cml-u2:          [PASS][31] -> [FAIL][32] +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-cml-u2/igt@gem_render_tiled_blits@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-cml-u2/igt@gem_render_tiled_blits@basic.html
    - fi-icl-y:           NOTRUN -> [FAIL][33] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-icl-y/igt@gem_render_tiled_blits@basic.html
    - fi-apl-guc:         [PASS][34] -> [FAIL][35] +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-apl-guc/igt@gem_render_tiled_blits@basic.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-apl-guc/igt@gem_render_tiled_blits@basic.html
    - fi-skl-guc:         [PASS][36] -> [FAIL][37] +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-skl-guc/igt@gem_render_tiled_blits@basic.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-skl-guc/igt@gem_render_tiled_blits@basic.html
    - fi-kbl-8809g:       [PASS][38] -> [FAIL][39] +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-kbl-8809g/igt@gem_render_tiled_blits@basic.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-kbl-8809g/igt@gem_render_tiled_blits@basic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_render_tiled_blits@basic:
    - {fi-tgl-dsi}:       [PASS][40] -> [FAIL][41] +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-tgl-dsi/igt@gem_render_tiled_blits@basic.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-tgl-dsi/igt@gem_render_tiled_blits@basic.html

  * igt@kms_frontbuffer_tracking@basic:
    - {fi-ehl-1}:         [PASS][42] -> [FAIL][43] +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-ehl-1/igt@kms_frontbuffer_tracking@basic.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-ehl-1/igt@kms_frontbuffer_tracking@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_4674 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload:
    - fi-bxt-dsi:         [PASS][44] -> [DMESG-WARN][45] ([i915#1982])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-bxt-dsi/igt@i915_module_load@reload.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-bxt-dsi/igt@i915_module_load@reload.html
    - fi-tgl-u2:          [PASS][46] -> [DMESG-WARN][47] ([i915#402])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-tgl-u2/igt@i915_module_load@reload.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-tgl-u2/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - fi-byt-j1900:       [PASS][48] -> [DMESG-WARN][49] ([i915#1982]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-tgl-u2:          [PASS][50] -> [FAIL][51] ([i915#1897])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-tgl-u2/igt@kms_frontbuffer_tracking@basic.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-tgl-u2/igt@kms_frontbuffer_tracking@basic.html
    - fi-cml-s:           [PASS][52] -> [FAIL][53] ([i915#49])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-cml-s/igt@kms_frontbuffer_tracking@basic.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-cml-s/igt@kms_frontbuffer_tracking@basic.html
    - fi-kbl-soraka:      [PASS][54] -> [FAIL][55] ([i915#49])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-kbl-soraka/igt@kms_frontbuffer_tracking@basic.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-kbl-soraka/igt@kms_frontbuffer_tracking@basic.html
    - fi-cfl-guc:         [PASS][56] -> [FAIL][57] ([i915#49])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-cfl-guc/igt@kms_frontbuffer_tracking@basic.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-cfl-guc/igt@kms_frontbuffer_tracking@basic.html
    - fi-icl-guc:         [PASS][58] -> [FAIL][59] ([i915#49])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-icl-guc/igt@kms_frontbuffer_tracking@basic.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-icl-guc/igt@kms_frontbuffer_tracking@basic.html
    - fi-bxt-dsi:         [PASS][60] -> [FAIL][61] ([i915#49])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-bxt-dsi/igt@kms_frontbuffer_tracking@basic.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-bxt-dsi/igt@kms_frontbuffer_tracking@basic.html
    - fi-skl-6700k2:      [PASS][62] -> [FAIL][63] ([i915#49])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-skl-6700k2/igt@kms_frontbuffer_tracking@basic.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-skl-6700k2/igt@kms_frontbuffer_tracking@basic.html
    - fi-cml-u2:          [PASS][64] -> [FAIL][65] ([i915#49])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
    - fi-apl-guc:         [PASS][66] -> [FAIL][67] ([i915#49])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-apl-guc/igt@kms_frontbuffer_tracking@basic.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-apl-guc/igt@kms_frontbuffer_tracking@basic.html
    - fi-cfl-8700k:       [PASS][68] -> [FAIL][69] ([i915#49])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-cfl-8700k/igt@kms_frontbuffer_tracking@basic.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-cfl-8700k/igt@kms_frontbuffer_tracking@basic.html
    - fi-icl-u2:          [PASS][70] -> [FAIL][71] ([i915#49])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-icl-u2/igt@kms_frontbuffer_tracking@basic.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-icl-u2/igt@kms_frontbuffer_tracking@basic.html
    - fi-kbl-7500u:       [PASS][72] -> [FAIL][73] ([i915#49])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-kbl-7500u/igt@kms_frontbuffer_tracking@basic.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-kbl-7500u/igt@kms_frontbuffer_tracking@basic.html
    - fi-skl-guc:         [PASS][74] -> [FAIL][75] ([i915#49])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-skl-guc/igt@kms_frontbuffer_tracking@basic.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-skl-guc/igt@kms_frontbuffer_tracking@basic.html
    - fi-kbl-r:           [PASS][76] -> [FAIL][77] ([i915#49])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-kbl-r/igt@kms_frontbuffer_tracking@basic.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-kbl-r/igt@kms_frontbuffer_tracking@basic.html
    - fi-cfl-8109u:       [PASS][78] -> [FAIL][79] ([i915#49])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html
    - fi-glk-dsi:         [PASS][80] -> [FAIL][81] ([i915#49])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-glk-dsi/igt@kms_frontbuffer_tracking@basic.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-glk-dsi/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-u2:          [FAIL][82] ([i915#1888]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - {fi-tgl-dsi}:       [DMESG-WARN][84] ([i915#1982]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-tgl-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-tgl-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-bsw-n3050:       [DMESG-WARN][86] ([i915#1982]) -> [PASS][87] +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-icl-guc:         [DMESG-WARN][88] ([i915#1982]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-icl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-icl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - fi-icl-u2:          [DMESG-WARN][90] ([i915#1982]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-x1275:       [SKIP][92] ([fdo#109271]) -> [DMESG-FAIL][93] ([i915#62])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html

  * igt@kms_flip@basic-plain-flip@a-dp1:
    - fi-kbl-x1275:       [DMESG-WARN][94] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][95] ([i915#62] / [i915#92]) +2 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-kbl-x1275/igt@kms_flip@basic-plain-flip@a-dp1.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-kbl-x1275/igt@kms_flip@basic-plain-flip@a-dp1.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-kbl-x1275:       [DMESG-WARN][96] ([i915#62] / [i915#92]) -> [DMESG-FAIL][97] ([i915#49] / [i915#62])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-kbl-x1275/igt@kms_frontbuffer_tracking@basic.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-kbl-x1275/igt@kms_frontbuffer_tracking@basic.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-kbl-x1275:       [DMESG-WARN][98] ([i915#62] / [i915#92]) -> [DMESG-WARN][99] ([i915#62] / [i915#92] / [i915#95]) +4 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8625/fi-kbl-x1275/igt@prime_vgem@basic-fence-flip.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/fi-kbl-x1275/igt@prime_vgem@basic-fence-flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1897]: https://gitlab.freedesktop.org/drm/intel/issues/1897
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (44 -> 38)
------------------------------

  Additional (1): fi-icl-y 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5710 -> IGTPW_4674

  CI-20190529: 20190529
  CI_DRM_8625: e5c6bbf45df498bd60d81b23c9f9ae7ed567eb8a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4674: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/index.html
  IGT_5710: f524eee47930601ad7b4cba9d40c26d68dc7d250 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4674/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
