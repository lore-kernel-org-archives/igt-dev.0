Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7501021411473884126=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 26 Nov 2021 15:08:07 -0000
Message-ID: <163793928750.11078.15559582292236440457@emeril.freedesktop.org>
References: <20211126140911.1556205-1-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20211126140911.1556205-1-Rodrigo.Siqueira@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?amdgpu=3A_Introduces_DP_DSC_test?=
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
To: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============7501021411473884126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: Introduces DP DSC test
URL   : https://patchwork.freedesktop.org/series/97325/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6293 -> IGTPW_6442
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6442 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6442, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/index.html

Participating hosts (33 -> 34)
------------------------------

  Additional (2): fi-kbl-soraka fi-tgl-u2 
  Missing    (1): fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6442:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - fi-rkl-11600:       [PASS][1] -> [FAIL][2] +36 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_addfb_basic@addfb25-bad-modifier.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_addfb_basic@addfb25-bad-modifier.html

  * igt@kms_addfb_basic@bo-too-small:
    - fi-tgl-1115g4:      [PASS][3] -> [FAIL][4] +37 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@kms_addfb_basic@bo-too-small.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_addfb_basic@bo-too-small.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a:
    - fi-tgl-u2:          NOTRUN -> [FAIL][5] +53 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b:
    - fi-rkl-guc:         [PASS][6] -> [FAIL][7] +36 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_pipe_crc_basic@read-crc-pipe-b.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-rkl-11600:       [PASS][8] -> [CRASH][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html
    - fi-tgl-1115g4:      [PASS][10] -> [CRASH][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@prime_vgem@basic-fence-flip.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@prime_vgem@basic-fence-flip.html
    - fi-tgl-u2:          NOTRUN -> [CRASH][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@prime_vgem@basic-fence-flip.html
    - fi-rkl-guc:         [PASS][13] -> [CRASH][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@prime_vgem@basic-fence-flip.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@prime_vgem@basic-fence-flip.html

  
#### Warnings ####

  * igt@i915_pm_backlight@basic-brightness:
    - fi-tgl-1115g4:      [SKIP][15] ([i915#1155]) -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@i915_pm_backlight@basic-brightness.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@i915_pm_backlight@basic-brightness.html
    - fi-rkl-11600:       [SKIP][17] ([i915#3012]) -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html
    - fi-rkl-guc:         [SKIP][19] ([i915#3012]) -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-rkl-guc:         [SKIP][21] ([fdo#111827]) -> [FAIL][22] +8 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_chamelium@common-hpd-after-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-rkl-11600:       [SKIP][23] ([fdo#111827]) -> [FAIL][24] +8 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_chamelium@dp-crc-fast.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@vga-hpd-fast:
    - fi-tgl-1115g4:      [SKIP][25] ([fdo#111827]) -> [FAIL][26] +8 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@kms_chamelium@vga-hpd-fast.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_chamelium@vga-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-rkl-guc:         [SKIP][27] ([i915#4103]) -> [FAIL][28] +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-rkl-11600:       [SKIP][29] ([i915#4103]) -> [FAIL][30] +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-tgl-1115g4:      [SKIP][31] ([i915#4103]) -> [FAIL][32] +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-rkl-11600:       [SKIP][33] ([i915#533]) -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - fi-rkl-guc:         [SKIP][35] ([i915#533]) -> [FAIL][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rpm@basic-rte:
    - {fi-jsl-1}:         [PASS][37] -> [CRASH][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-jsl-1/igt@i915_pm_rpm@basic-rte.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-jsl-1/igt@i915_pm_rpm@basic-rte.html
    - {fi-ehl-2}:         [PASS][39] -> [CRASH][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-ehl-2/igt@i915_pm_rpm@basic-rte.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-ehl-2/igt@i915_pm_rpm@basic-rte.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - {fi-ehl-2}:         [PASS][41] -> [FAIL][42] +46 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-ehl-2/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-ehl-2/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_busy@basic:
    - {fi-jsl-1}:         NOTRUN -> [FAIL][43]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-jsl-1/igt@kms_busy@basic.html
    - {fi-ehl-2}:         NOTRUN -> [FAIL][44]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-ehl-2/igt@kms_busy@basic.html

  * igt@kms_chamelium@dp-crc-fast:
    - {fi-ehl-2}:         [SKIP][45] ([fdo#111827]) -> [FAIL][46] +8 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-ehl-2/igt@kms_chamelium@dp-crc-fast.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-ehl-2/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@dp-hpd-fast:
    - {fi-jsl-1}:         [SKIP][47] ([fdo#111827]) -> [FAIL][48] +8 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-jsl-1/igt@kms_chamelium@dp-hpd-fast.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-jsl-1/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - {fi-tgl-dsi}:       [SKIP][49] ([fdo#109284] / [fdo#111827]) -> [FAIL][50] +8 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-dsi/igt@kms_chamelium@hdmi-hpd-fast.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-dsi/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - {fi-ehl-2}:         [SKIP][51] ([fdo#109278]) -> [FAIL][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - {fi-jsl-1}:         [SKIP][53] ([i915#4103]) -> [FAIL][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - {fi-tgl-dsi}:       [SKIP][55] ([i915#4103]) -> [FAIL][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a:
    - {fi-tgl-dsi}:       [PASS][57] -> [FAIL][58] +38 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - {fi-jsl-1}:         [SKIP][59] ([i915#533]) -> [FAIL][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-jsl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-jsl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - {fi-ehl-2}:         [SKIP][61] ([fdo#109278] / [i915#533]) -> [FAIL][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-ehl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-ehl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - {fi-jsl-1}:         [PASS][63] -> [FAIL][64] +46 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-jsl-1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-jsl-1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@prime_vgem@basic-fence-flip:
    - {fi-tgl-dsi}:       [PASS][65] -> [CRASH][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-dsi/igt@prime_vgem@basic-fence-flip.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-dsi/igt@prime_vgem@basic-fence-flip.html

  
Known issues
------------

  Here are the changes found in IGTPW_6442 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][67] ([fdo#109271]) +31 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html

  * igt@amdgpu/amd_cs_nop@sync-fork-compute0:
    - fi-snb-2600:        NOTRUN -> [SKIP][68] ([fdo#109271]) +17 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html

  * igt@gem_exec_fence@basic-busy@bcs0:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][69] ([fdo#109271]) +8 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_huc_copy@huc-copy:
    - fi-tgl-u2:          NOTRUN -> [SKIP][70] ([i915#2190])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][71] ([fdo#109271] / [i915#2190])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#4613]) +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-kbl-soraka/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-tgl-u2:          NOTRUN -> [SKIP][73] ([i915#4613]) +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-rkl-11600:       [PASS][74] -> [FAIL][75] ([i915#4598]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@i915_pm_rpm@basic-pci-d3-state.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-rkl-guc:         [PASS][76] -> [CRASH][77] ([i915#4598])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@i915_pm_rpm@basic-rte.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@i915_pm_rpm@basic-rte.html
    - fi-tgl-u2:          NOTRUN -> [CRASH][78] ([i915#4598])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@i915_pm_rpm@basic-rte.html
    - fi-tgl-1115g4:      [PASS][79] -> [CRASH][80] ([i915#4598])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@i915_pm_rpm@basic-rte.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@i915_pm_rpm@basic-rte.html
    - fi-rkl-11600:       [PASS][81] -> [CRASH][82] ([i915#4598])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@i915_pm_rpm@basic-rte.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@module-reload:
    - fi-tgl-u2:          NOTRUN -> [FAIL][83] ([i915#4598]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@i915_pm_rpm@module-reload.html
    - fi-tgl-1115g4:      [PASS][84] -> [FAIL][85] ([i915#4598]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html
    - fi-rkl-guc:         [PASS][86] -> [FAIL][87] ([i915#4598]) +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@i915_pm_rpm@module-reload.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][88] ([i915#1886] / [i915#2291])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_addfb_basic@too-wide:
    - fi-rkl-11600:       [PASS][89] -> [FAIL][90] ([i915#4638]) +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_addfb_basic@too-wide.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_addfb_basic@too-wide.html

  * igt@kms_busy@basic:
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][91] ([i915#4638])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_busy@basic.html
    - fi-rkl-guc:         NOTRUN -> [FAIL][92] ([i915#4638])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_busy@basic.html
    - fi-rkl-11600:       NOTRUN -> [FAIL][93] ([i915#4638])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_busy@basic.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][94] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-kbl-soraka/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_chamelium@vga-edid-read:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][95] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-bdw-5557u/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - fi-tgl-u2:          NOTRUN -> [FAIL][96] ([i915#4638]) +3 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
    - fi-tgl-1115g4:      [PASS][97] -> [FAIL][98] ([i915#4638]) +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
    - fi-rkl-guc:         [PASS][99] -> [FAIL][100] ([i915#4638]) +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-tgl-u2:          NOTRUN -> [CRASH][101] ([i915#4638])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@kms_force_connector_basic@force-connector-state.html
    - fi-rkl-11600:       [PASS][102] -> [CRASH][103] ([i915#4638])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html
    - fi-rkl-guc:         [PASS][104] -> [CRASH][105] ([i915#4638])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_force_connector_basic@force-connector-state.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_force_connector_basic@force-connector-state.html
    - fi-tgl-1115g4:      [PASS][106] -> [CRASH][107] ([i915#4638])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@kms_force_connector_basic@force-connector-state.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-tgl-u2:          NOTRUN -> [SKIP][108] ([fdo#109285])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#533])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b:
    - fi-cfl-8109u:       [PASS][110] -> [DMESG-WARN][111] ([i915#295]) +12 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-pipe-b.html

  * igt@prime_vgem@basic-userptr:
    - fi-tgl-u2:          NOTRUN -> [SKIP][112] ([i915#3301])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@prime_vgem@basic-userptr.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gtt:
    - fi-snb-2600:        [DMESG-FAIL][113] ([i915#4610]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-snb-2600/igt@i915_selftest@live@gtt.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-snb-2600/igt@i915_selftest@live@gtt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#295]: https://gitlab.freedesktop.org/drm/intel/issues/295
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4598]: https://gitlab.freedesktop.org/drm/intel/issues/4598
  [i915#4610]: https://gitlab.freedesktop.org/drm/intel/issues/4610
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4638]: https://gitlab.freedesktop.org/drm/intel/issues/4638
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6293 -> IGTPW_6442

  CI-20190529: 20190529
  CI_DRM_10930: 2c9ba65f2befe9febd864f0795227b351bd62dba @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6442: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/index.html
  IGT_6293: bf11f87c27ad1cec3e60bd31c23080d19aa093f3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@amdgpu/amd_dp_dsc@dsc-bpc
+igt@amdgpu/amd_dp_dsc@dsc-enable-basic
+igt@amdgpu/amd_dp_dsc@dsc-link-settings
+igt@amdgpu/amd_dp_dsc@dsc-slice-dimensions-change
+igt@amdgpu/amd_dp_dsc@dsc-slice-height-property

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/index.html

--===============7501021411473884126==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: Introduces DP DSC test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/97325/">https://patchwork.freedesktop.org/series/97325/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6293 -&gt; IGTPW_6442</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6442 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6442, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/index.html</p>
<h2>Participating hosts (33 -&gt; 34)</h2>
<p>Additional (2): fi-kbl-soraka fi-tgl-u2 <br />
  Missing    (1): fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6442:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-bad-modifier:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_addfb_basic@addfb25-bad-modifier.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_addfb_basic@addfb25-bad-modifier.html">FAIL</a> +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@kms_addfb_basic@bo-too-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_addfb_basic@bo-too-small.html">FAIL</a> +37 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html">FAIL</a> +53 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-b:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">FAIL</a> +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html">CRASH</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@prime_vgem@basic-fence-flip.html">CRASH</a></p>
</li>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@prime_vgem@basic-fence-flip.html">CRASH</a></p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@prime_vgem@basic-fence-flip.html">CRASH</a></p>
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
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_chamelium@common-hpd-after-suspend.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-fast:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@kms_chamelium@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_chamelium@vga-hpd-fast.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">FAIL</a></p>
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
<li>
<p>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-jsl-1/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-jsl-1/igt@i915_pm_rpm@basic-rte.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-ehl-2/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-ehl-2/igt@i915_pm_rpm@basic-rte.html">CRASH</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-ehl-2/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-ehl-2/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">FAIL</a> +46 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-jsl-1/igt@kms_busy@basic.html">FAIL</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-ehl-2/igt@kms_busy@basic.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-ehl-2/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-ehl-2/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-jsl-1/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-jsl-1/igt@kms_chamelium@dp-hpd-fast.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-dsi/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-dsi/igt@kms_chamelium@hdmi-hpd-fast.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-dsi/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html">FAIL</a> +38 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-jsl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-jsl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">FAIL</a></p>
</li>
<li>
<p>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-ehl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-ehl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:</p>
<ul>
<li>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-jsl-1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-jsl-1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html">FAIL</a> +46 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-dsi/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-dsi/igt@prime_vgem@basic-fence-flip.html">CRASH</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6442 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-fork-compute0:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-kbl-soraka/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@i915_pm_rpm@basic-pci-d3-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@i915_pm_rpm@basic-rte.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>)</p>
</li>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@i915_pm_rpm@basic-rte.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>)</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@i915_pm_rpm@basic-rte.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>)</p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@i915_pm_rpm@basic-rte.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>) +1 similar issue</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>) +1 similar issue</p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4598">i915#4598</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2291">i915#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-wide:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_addfb_basic@too-wide.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_addfb_basic@too-wide.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_busy@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>)</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_busy@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>)</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_busy@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-read:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-kbl-soraka/igt@kms_chamelium@dp-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-bdw-5557u/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>) +3 similar issues</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>) +2 similar issues</p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@kms_force_connector_basic@force-connector-state.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>)</p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_force_connector_basic@force-connector-state.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>)</p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_force_connector_basic@force-connector-state.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>)</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_force_connector_basic@force-connector-state.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-b:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/295">i915#295</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gtt:<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-snb-2600/igt@i915_selftest@live@gtt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4610">i915#4610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-snb-2600/igt@i915_selftest@live@gtt.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6293 -&gt; IGTPW_6442</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10930: 2c9ba65f2befe9febd864f0795227b351bd62dba @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6442: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/index.html<br />
  IGT_6293: bf11f87c27ad1cec3e60bd31c23080d19aa093f3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@amdgpu/amd_dp_dsc@dsc-bpc<br />
+igt@amdgpu/amd_dp_dsc@dsc-enable-basic<br />
+igt@amdgpu/amd_dp_dsc@dsc-link-settings<br />
+igt@amdgpu/amd_dp_dsc@dsc-slice-dimensions-change<br />
+igt@amdgpu/amd_dp_dsc@dsc-slice-height-property</p>

</body>
</html>

--===============7501021411473884126==--
