Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4526691828813145906=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 25 Nov 2021 16:48:27 -0000
Message-ID: <163785890742.17557.13739056259735917707@emeril.freedesktop.org>
References: <20211125155548.1354801-1-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20211125155548.1354801-1-Rodrigo.Siqueira@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?amdgpu=3A_Add_test_for_AMD_DP_DSC_=28rev6=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============4526691828813145906==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: Add test for AMD DP DSC (rev6)
URL   : https://patchwork.freedesktop.org/series/97108/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10928 -> IGTPW_6436
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6436 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6436, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/index.html

Participating hosts (41 -> 34)
------------------------------

  Additional (1): fi-tgl-u2 
  Missing    (8): bat-dg1-6 bat-dg1-5 fi-bdw-gvtdvm fi-bsw-cyan bat-adlp-6 fi-bdw-samus bat-jsl-2 bat-jsl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6436:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - fi-rkl-11600:       [PASS][1] -> [FAIL][2] +36 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-11600/igt@kms_addfb_basic@addfb25-bad-modifier.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-11600/igt@kms_addfb_basic@addfb25-bad-modifier.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - fi-rkl-guc:         [PASS][3] -> [FAIL][4] +36 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-guc/igt@kms_addfb_basic@basic-x-tiled-legacy.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-guc/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small:
    - fi-tgl-1115g4:      [PASS][5] -> [FAIL][6] +37 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-1115g4/igt@kms_addfb_basic@bo-too-small.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-1115g4/igt@kms_addfb_basic@bo-too-small.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - fi-icl-u2:          [PASS][7] -> [FAIL][8] +46 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-icl-u2/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-icl-u2/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_busy@basic:
    - fi-icl-u2:          NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-icl-u2/igt@kms_busy@basic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a:
    - fi-tgl-u2:          NOTRUN -> [FAIL][10] +53 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-u2/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-icl-u2:          [PASS][11] -> [CRASH][12] +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-icl-u2/igt@prime_vgem@basic-fence-flip.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-icl-u2/igt@prime_vgem@basic-fence-flip.html
    - fi-tgl-u2:          NOTRUN -> [CRASH][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-u2/igt@prime_vgem@basic-fence-flip.html
    - fi-rkl-11600:       [PASS][14] -> [CRASH][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html
    - fi-rkl-guc:         [PASS][16] -> [CRASH][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-guc/igt@prime_vgem@basic-fence-flip.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-guc/igt@prime_vgem@basic-fence-flip.html
    - fi-tgl-1115g4:      [PASS][18] -> [CRASH][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-1115g4/igt@prime_vgem@basic-fence-flip.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-1115g4/igt@prime_vgem@basic-fence-flip.html

  
#### Warnings ####

  * igt@i915_pm_backlight@basic-brightness:
    - fi-tgl-1115g4:      [SKIP][20] ([i915#1155]) -> [FAIL][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-1115g4/igt@i915_pm_backlight@basic-brightness.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-1115g4/igt@i915_pm_backlight@basic-brightness.html
    - fi-rkl-11600:       [SKIP][22] ([i915#3012]) -> [FAIL][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html
    - fi-rkl-guc:         [SKIP][24] ([i915#3012]) -> [FAIL][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-tgl-1115g4:      [SKIP][26] ([fdo#111827]) -> [FAIL][27] +8 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-1115g4/igt@kms_chamelium@common-hpd-after-suspend.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-1115g4/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-rkl-11600:       [SKIP][28] ([fdo#111827]) -> [FAIL][29] +8 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-11600/igt@kms_chamelium@dp-crc-fast.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-11600/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-rkl-guc:         [SKIP][30] ([fdo#111827]) -> [FAIL][31] +8 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-guc/igt@kms_chamelium@dp-edid-read.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-guc/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [SKIP][32] ([fdo#111827]) -> [FAIL][33] +8 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-rkl-11600:       [SKIP][34] ([i915#4103]) -> [FAIL][35] +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-rkl-guc:         [SKIP][36] ([i915#4103]) -> [FAIL][37] +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-tgl-1115g4:      [SKIP][38] ([i915#4103]) -> [FAIL][39] +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-icl-u2:          [SKIP][40] ([fdo#109278]) -> [FAIL][41] +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-rkl-11600:       [SKIP][42] ([i915#533]) -> [FAIL][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - fi-rkl-guc:         [SKIP][44] ([i915#533]) -> [FAIL][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rpm@basic-rte:
    - {fi-jsl-1}:         [PASS][46] -> [CRASH][47] +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-jsl-1/igt@i915_pm_rpm@basic-rte.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-jsl-1/igt@i915_pm_rpm@basic-rte.html

  * igt@kms_addfb_basic@too-high:
    - {fi-ehl-2}:         [PASS][48] -> [FAIL][49] +46 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-ehl-2/igt@kms_addfb_basic@too-high.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-ehl-2/igt@kms_addfb_basic@too-high.html

  * igt@kms_busy@basic:
    - {fi-jsl-1}:         NOTRUN -> [FAIL][50]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-jsl-1/igt@kms_busy@basic.html
    - {fi-ehl-2}:         NOTRUN -> [FAIL][51]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-ehl-2/igt@kms_busy@basic.html

  * igt@kms_chamelium@dp-hpd-fast:
    - {fi-jsl-1}:         [SKIP][52] ([fdo#111827]) -> [FAIL][53] +8 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-jsl-1/igt@kms_chamelium@dp-hpd-fast.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-jsl-1/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-edid-read:
    - {fi-ehl-2}:         [SKIP][54] ([fdo#111827]) -> [FAIL][55] +8 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-ehl-2/igt@kms_chamelium@hdmi-edid-read.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-ehl-2/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - {fi-tgl-dsi}:       [SKIP][56] ([fdo#109284] / [fdo#111827]) -> [FAIL][57] +8 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-dsi/igt@kms_chamelium@hdmi-hpd-fast.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-dsi/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - {fi-jsl-1}:         [SKIP][58] ([i915#4103]) -> [FAIL][59] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - {fi-ehl-2}:         [SKIP][60] ([fdo#109278]) -> [FAIL][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - {fi-tgl-dsi}:       [SKIP][62] ([i915#4103]) -> [FAIL][63] +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a:
    - {fi-tgl-dsi}:       [PASS][64] -> [FAIL][65] +38 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - {fi-jsl-1}:         [SKIP][66] ([i915#533]) -> [FAIL][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-jsl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-jsl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - {fi-ehl-2}:         [SKIP][68] ([fdo#109278] / [i915#533]) -> [FAIL][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-ehl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-ehl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - {fi-jsl-1}:         [PASS][70] -> [FAIL][71] +46 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-jsl-1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-jsl-1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@prime_vgem@basic-fence-flip:
    - {fi-tgl-dsi}:       [PASS][72] -> [CRASH][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-dsi/igt@prime_vgem@basic-fence-flip.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-dsi/igt@prime_vgem@basic-fence-flip.html
    - {fi-ehl-2}:         [PASS][74] -> [CRASH][75] +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-ehl-2/igt@prime_vgem@basic-fence-flip.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-ehl-2/igt@prime_vgem@basic-fence-flip.html

  
Known issues
------------

  Here are the changes found in IGTPW_6436 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@sync-fork-compute0:
    - fi-snb-2600:        NOTRUN -> [SKIP][76] ([fdo#109271]) +17 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html

  * igt@gem_exec_suspend@basic-s0:
    - fi-tgl-u2:          NOTRUN -> [FAIL][77] ([i915#1888])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_huc_copy@huc-copy:
    - fi-tgl-u2:          NOTRUN -> [SKIP][78] ([i915#2190])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-u2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-tgl-u2:          NOTRUN -> [SKIP][79] ([i915#4613]) +3 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-u2/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-rkl-guc:         [PASS][80] -> [CRASH][81] ([i915#4598])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-guc/igt@i915_pm_rpm@basic-rte.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-guc/igt@i915_pm_rpm@basic-rte.html
    - fi-tgl-1115g4:      [PASS][82] -> [CRASH][83] ([i915#4598])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-1115g4/igt@i915_pm_rpm@basic-rte.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-1115g4/igt@i915_pm_rpm@basic-rte.html
    - fi-tgl-u2:          NOTRUN -> [CRASH][84] ([i915#4598])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-u2/igt@i915_pm_rpm@basic-rte.html
    - fi-rkl-11600:       [PASS][85] -> [CRASH][86] ([i915#4598])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-11600/igt@i915_pm_rpm@basic-rte.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-11600/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@module-reload:
    - fi-rkl-11600:       [PASS][87] -> [FAIL][88] ([i915#4598]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html
    - fi-tgl-u2:          NOTRUN -> [FAIL][89] ([i915#4598]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-u2/igt@i915_pm_rpm@module-reload.html
    - fi-tgl-1115g4:      [PASS][90] -> [FAIL][91] ([i915#4598]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html
    - fi-rkl-guc:         [PASS][92] -> [FAIL][93] ([i915#4598]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-guc/igt@i915_pm_rpm@module-reload.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][94] -> [INCOMPLETE][95] ([i915#2940])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][96] ([i915#1886] / [i915#2291])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - fi-rkl-guc:         [PASS][97] -> [FAIL][98] ([i915#4638]) +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-guc/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-guc/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@too-wide:
    - fi-tgl-1115g4:      [PASS][99] -> [FAIL][100] ([i915#4638]) +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-1115g4/igt@kms_addfb_basic@too-wide.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-1115g4/igt@kms_addfb_basic@too-wide.html

  * igt@kms_busy@basic:
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][101] ([i915#4638])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-1115g4/igt@kms_busy@basic.html
    - fi-rkl-guc:         NOTRUN -> [FAIL][102] ([i915#4638])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-guc/igt@kms_busy@basic.html
    - fi-rkl-11600:       NOTRUN -> [FAIL][103] ([i915#4638])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-11600/igt@kms_busy@basic.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - fi-rkl-11600:       [PASS][104] -> [FAIL][105] ([i915#4638]) +2 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-11600/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-11600/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
    - fi-tgl-u2:          NOTRUN -> [FAIL][106] ([i915#4638]) +3 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-rkl-11600:       [PASS][107] -> [CRASH][108] ([i915#4638])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html
    - fi-tgl-u2:          NOTRUN -> [CRASH][109] ([i915#4638])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-u2/igt@kms_force_connector_basic@force-connector-state.html
    - fi-rkl-guc:         [PASS][110] -> [CRASH][111] ([i915#4638])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-guc/igt@kms_force_connector_basic@force-connector-state.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-guc/igt@kms_force_connector_basic@force-connector-state.html
    - fi-tgl-1115g4:      [PASS][112] -> [CRASH][113] ([i915#4638])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-1115g4/igt@kms_force_connector_basic@force-connector-state.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-1115g4/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-tgl-u2:          NOTRUN -> [SKIP][114] ([fdo#109285])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-u2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][115] ([fdo#109271] / [i915#533])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_psr@primary_page_flip:
    - fi-skl-6600u:       [PASS][116] -> [FAIL][117] ([i915#4547])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-skl-6600u/igt@kms_psr@primary_page_flip.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-skl-6600u/igt@kms_psr@primary_page_flip.html

  * igt@prime_vgem@basic-userptr:
    - fi-tgl-u2:          NOTRUN -> [SKIP][118] ([i915#3301])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-u2/igt@prime_vgem@basic-userptr.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][119] ([fdo#109271])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-kbl-soraka/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-skl-6600u:       NOTRUN -> [FAIL][120] ([i915#3363] / [i915#4312])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-skl-6600u/igt@runner@aborted.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][121] ([fdo#109271] / [i915#1436] / [i915#3428] / [i915#4312])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-bsw-nick/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [INCOMPLETE][122] ([i915#3921]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:
    - fi-cfl-8109u:       [DMESG-WARN][124] ([i915#295]) -> [PASS][125] +12 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:
    - fi-kbl-soraka:      [INCOMPLETE][126] -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#295]: https://gitlab.freedesktop.org/drm/intel/issues/295
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#3428]: https://gitlab.freedesktop.org/drm/intel/issues/3428
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
  [i915#4598]: https://gitlab.freedesktop.org/drm/intel/issues/4598
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4638]: https://gitlab.freedesktop.org/drm/intel/issues/4638
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6291 -> IGTPW_6436

  CI-20190529: 20190529
  CI_DRM_10928: 3bf56d24d381c492c14d093554d975b6a529784b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6436: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/index.html
  IGT_6291: 9ff3844d8c1fee8d8736d888f16223c4789fb69f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@amdgpu/amd_dp_dsc@dsc-bpc
+igt@amdgpu/amd_dp_dsc@dsc-enable-basic
+igt@amdgpu/amd_dp_dsc@dsc-link-settings
+igt@amdgpu/amd_dp_dsc@dsc-slice-dimensions-change
+igt@amdgpu/amd_dp_dsc@dsc-slice-height-property

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/index.html

--===============4526691828813145906==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: Add test for AMD DP DSC (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/97108/">https://patchwork.freedesktop.org/series/97108/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10928 -&gt; IGTPW_6436</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6436 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6436, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/index.html</p>
<h2>Participating hosts (41 -&gt; 34)</h2>
<p>Additional (1): fi-tgl-u2 <br />
  Missing    (8): bat-dg1-6 bat-dg1-5 fi-bdw-gvtdvm fi-bsw-cyan bat-adlp-6 fi-bdw-samus bat-jsl-2 bat-jsl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6436:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-bad-modifier:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-11600/igt@kms_addfb_basic@addfb25-bad-modifier.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-11600/igt@kms_addfb_basic@addfb25-bad-modifier.html">FAIL</a> +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-guc/igt@kms_addfb_basic@basic-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-guc/igt@kms_addfb_basic@basic-x-tiled-legacy.html">FAIL</a> +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-1115g4/igt@kms_addfb_basic@bo-too-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-1115g4/igt@kms_addfb_basic@bo-too-small.html">FAIL</a> +37 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-icl-u2/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-icl-u2/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">FAIL</a> +46 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-icl-u2/igt@kms_busy@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-u2/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html">FAIL</a> +53 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-icl-u2/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-icl-u2/igt@prime_vgem@basic-fence-flip.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-u2/igt@prime_vgem@basic-fence-flip.html">CRASH</a></p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html">CRASH</a></p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-guc/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-guc/igt@prime_vgem@basic-fence-flip.html">CRASH</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-1115g4/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-1115g4/igt@prime_vgem@basic-fence-flip.html">CRASH</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-1115g4/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-1115g4/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-1115g4/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-1115g4/igt@kms_chamelium@common-hpd-after-suspend.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-11600/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-11600/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-read:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-guc/igt@kms_chamelium@dp-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-guc/igt@kms_chamelium@dp-edid-read.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-jsl-1/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-jsl-1/igt@i915_pm_rpm@basic-rte.html">CRASH</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-high:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-ehl-2/igt@kms_addfb_basic@too-high.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-ehl-2/igt@kms_addfb_basic@too-high.html">FAIL</a> +46 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-jsl-1/igt@kms_busy@basic.html">FAIL</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-ehl-2/igt@kms_busy@basic.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-jsl-1/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-jsl-1/igt@kms_chamelium@dp-hpd-fast.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-ehl-2/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-ehl-2/igt@kms_chamelium@hdmi-edid-read.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-dsi/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-dsi/igt@kms_chamelium@hdmi-hpd-fast.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html">FAIL</a> +38 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-jsl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-jsl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">FAIL</a></p>
</li>
<li>
<p>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-ehl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-ehl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:</p>
<ul>
<li>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-jsl-1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-jsl-1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html">FAIL</a> +46 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>
<p>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-dsi/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-dsi/igt@prime_vgem@basic-fence-flip.html">CRASH</a></p>
</li>
<li>
<p>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-ehl-2/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-ehl-2/igt@prime_vgem@basic-fence-flip.html">CRASH</a> +2 similar issues</p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6436 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-fork-compute0:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-u2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-u2/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-guc/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-guc/igt@i915_pm_rpm@basic-rte.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>)</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-1115g4/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-1115g4/igt@i915_pm_rpm@basic-rte.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>)</p>
</li>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-u2/igt@i915_pm_rpm@basic-rte.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>)</p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-11600/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-11600/igt@i915_pm_rpm@basic-rte.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>) +1 similar issue</p>
</li>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-u2/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>) +1 similar issue</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>) +1 similar issue</p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-guc/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2291">i915#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-guc/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-guc/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-wide:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-1115g4/igt@kms_addfb_basic@too-wide.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-1115g4/igt@kms_addfb_basic@too-wide.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-1115g4/igt@kms_busy@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>)</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-guc/igt@kms_busy@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>)</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-11600/igt@kms_busy@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-11600/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-11600/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>) +2 similar issues</p>
</li>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>)</p>
</li>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-u2/igt@kms_force_connector_basic@force-connector-state.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>)</p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-rkl-guc/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-rkl-guc/igt@kms_force_connector_basic@force-connector-state.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>)</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-tgl-1115g4/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-1115g4/igt@kms_force_connector_basic@force-connector-state.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-u2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-tgl-u2/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-kbl-soraka/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-bsw-nick/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/295">i915#295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html">PASS</a> +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10928/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6291 -&gt; IGTPW_6436</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10928: 3bf56d24d381c492c14d093554d975b6a529784b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6436: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6436/index.html<br />
  IGT_6291: 9ff3844d8c1fee8d8736d888f16223c4789fb69f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@amdgpu/amd_dp_dsc@dsc-bpc<br />
+igt@amdgpu/amd_dp_dsc@dsc-enable-basic<br />
+igt@amdgpu/amd_dp_dsc@dsc-link-settings<br />
+igt@amdgpu/amd_dp_dsc@dsc-slice-dimensions-change<br />
+igt@amdgpu/amd_dp_dsc@dsc-slice-height-property</p>

</body>
</html>

--===============4526691828813145906==--
