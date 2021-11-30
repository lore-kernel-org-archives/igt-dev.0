Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0507499711906797127=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 30 Nov 2021 00:16:35 -0000
Message-ID: <163823139550.20410.8026339773208275451@emeril.freedesktop.org>
References: <20211126140911.1556205-1-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20211126140911.1556205-1-Rodrigo.Siqueira@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
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

--===============0507499711906797127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: Introduces DP DSC test
URL   : https://patchwork.freedesktop.org/series/97325/
State : success

== Summary ==

CI Bug Log - changes from IGT_6293 -> IGTPW_6442
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/index.html

Participating hosts (33 -> 34)
------------------------------

  Additional (2): fi-kbl-soraka fi-tgl-u2 
  Missing    (1): fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6442:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rpm@basic-rte:
    - {fi-jsl-1}:         [PASS][1] -> [CRASH][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-jsl-1/igt@i915_pm_rpm@basic-rte.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-jsl-1/igt@i915_pm_rpm@basic-rte.html
    - {fi-ehl-2}:         [PASS][3] -> [CRASH][4] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-ehl-2/igt@i915_pm_rpm@basic-rte.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-ehl-2/igt@i915_pm_rpm@basic-rte.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - {fi-ehl-2}:         [PASS][5] -> [FAIL][6] +46 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-ehl-2/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-ehl-2/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_busy@basic:
    - {fi-jsl-1}:         NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-jsl-1/igt@kms_busy@basic.html
    - {fi-ehl-2}:         NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-ehl-2/igt@kms_busy@basic.html

  * igt@kms_chamelium@dp-crc-fast:
    - {fi-ehl-2}:         [SKIP][9] ([fdo#111827]) -> [FAIL][10] +8 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-ehl-2/igt@kms_chamelium@dp-crc-fast.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-ehl-2/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@dp-hpd-fast:
    - {fi-jsl-1}:         [SKIP][11] ([fdo#111827]) -> [FAIL][12] +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-jsl-1/igt@kms_chamelium@dp-hpd-fast.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-jsl-1/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - {fi-ehl-2}:         [SKIP][13] ([fdo#109278]) -> [FAIL][14] +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-ehl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - {fi-jsl-1}:         [SKIP][15] ([i915#4103]) -> [FAIL][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - {fi-jsl-1}:         [SKIP][17] ([i915#533]) -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-jsl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-jsl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - {fi-ehl-2}:         [SKIP][19] ([fdo#109278] / [i915#533]) -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-ehl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-ehl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - {fi-jsl-1}:         [PASS][21] -> [FAIL][22] +46 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-jsl-1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-jsl-1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  
Known issues
------------

  Here are the changes found in IGTPW_6442 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][23] ([fdo#109271]) +31 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html

  * igt@amdgpu/amd_cs_nop@sync-fork-compute0:
    - fi-snb-2600:        NOTRUN -> [SKIP][24] ([fdo#109271]) +17 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html

  * igt@gem_exec_fence@basic-busy@bcs0:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][25] ([fdo#109271]) +8 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_huc_copy@huc-copy:
    - fi-tgl-u2:          NOTRUN -> [SKIP][26] ([i915#2190])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#2190])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#4613]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-kbl-soraka/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-tgl-u2:          NOTRUN -> [SKIP][29] ([i915#4613]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-rkl-11600:       [PASS][30] -> [FAIL][31] ([i915#4598]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@i915_pm_rpm@basic-pci-d3-state.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-rkl-guc:         [PASS][32] -> [CRASH][33] ([i915#4598])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@i915_pm_rpm@basic-rte.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@i915_pm_rpm@basic-rte.html
    - fi-tgl-u2:          NOTRUN -> [CRASH][34] ([i915#4598])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@i915_pm_rpm@basic-rte.html
    - fi-tgl-1115g4:      [PASS][35] -> [CRASH][36] ([i915#4598])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@i915_pm_rpm@basic-rte.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@i915_pm_rpm@basic-rte.html
    - fi-rkl-11600:       [PASS][37] -> [CRASH][38] ([i915#4598])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@i915_pm_rpm@basic-rte.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@module-reload:
    - fi-tgl-u2:          NOTRUN -> [FAIL][39] ([i915#4598]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@i915_pm_rpm@module-reload.html
    - fi-tgl-1115g4:      [PASS][40] -> [FAIL][41] ([i915#4598]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html
    - fi-rkl-guc:         [PASS][42] -> [FAIL][43] ([i915#4598]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@i915_pm_rpm@module-reload.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][44] ([i915#1886] / [i915#2291])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - fi-rkl-11600:       [PASS][45] -> [FAIL][46] ([i915#4638]) +39 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_addfb_basic@addfb25-bad-modifier.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_addfb_basic@addfb25-bad-modifier.html

  * igt@kms_addfb_basic@bo-too-small:
    - fi-tgl-1115g4:      [PASS][47] -> [FAIL][48] ([i915#4638]) +40 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@kms_addfb_basic@bo-too-small.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_addfb_basic@bo-too-small.html

  * igt@kms_busy@basic:
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][49] ([i915#4638])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_busy@basic.html
    - fi-rkl-guc:         NOTRUN -> [FAIL][50] ([i915#4638])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_busy@basic.html
    - fi-rkl-11600:       NOTRUN -> [FAIL][51] ([i915#4638])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_busy@basic.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-kbl-soraka/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_chamelium@vga-edid-read:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][53] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-bdw-5557u/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-tgl-u2:          NOTRUN -> [CRASH][54] ([i915#4638]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-tgl-u2:          NOTRUN -> [SKIP][55] ([fdo#109285])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][56] ([fdo#109271] / [i915#533])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a:
    - fi-tgl-u2:          NOTRUN -> [FAIL][57] ([i915#4638]) +57 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b:
    - fi-cfl-8109u:       [PASS][58] -> [DMESG-WARN][59] ([i915#295]) +12 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
    - fi-rkl-guc:         [PASS][60] -> [FAIL][61] ([i915#4638]) +39 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_pipe_crc_basic@read-crc-pipe-b.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-rkl-11600:       [PASS][62] -> [CRASH][63] ([i915#4638]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html
    - fi-tgl-1115g4:      [PASS][64] -> [CRASH][65] ([i915#4638]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@prime_vgem@basic-fence-flip.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@prime_vgem@basic-fence-flip.html
    - fi-rkl-guc:         [PASS][66] -> [CRASH][67] ([i915#4638]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@prime_vgem@basic-fence-flip.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-userptr:
    - fi-tgl-u2:          NOTRUN -> [SKIP][68] ([i915#3301])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@prime_vgem@basic-userptr.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gtt:
    - fi-snb-2600:        [DMESG-FAIL][69] ([i915#4610]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-snb-2600/igt@i915_selftest@live@gtt.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-snb-2600/igt@i915_selftest@live@gtt.html

  
#### Warnings ####

  * igt@i915_pm_backlight@basic-brightness:
    - fi-tgl-1115g4:      [SKIP][71] ([i915#1155]) -> [FAIL][72] ([i915#4638])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@i915_pm_backlight@basic-brightness.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@i915_pm_backlight@basic-brightness.html
    - fi-rkl-11600:       [SKIP][73] ([i915#3012]) -> [FAIL][74] ([i915#4638])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html
    - fi-rkl-guc:         [SKIP][75] ([i915#3012]) -> [FAIL][76] ([i915#4638])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-rkl-guc:         [SKIP][77] ([fdo#111827]) -> [FAIL][78] ([i915#4638]) +8 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_chamelium@common-hpd-after-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-rkl-11600:       [SKIP][79] ([fdo#111827]) -> [FAIL][80] ([i915#4638]) +8 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_chamelium@dp-crc-fast.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@vga-hpd-fast:
    - fi-tgl-1115g4:      [SKIP][81] ([fdo#111827]) -> [FAIL][82] ([i915#4638]) +8 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@kms_chamelium@vga-hpd-fast.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_chamelium@vga-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-rkl-guc:         [SKIP][83] ([i915#4103]) -> [FAIL][84] ([i915#4638]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-rkl-11600:       [SKIP][85] ([i915#4103]) -> [FAIL][86] ([i915#4638]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-tgl-1115g4:      [SKIP][87] ([i915#4103]) -> [FAIL][88] ([i915#4638]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-rkl-11600:       [SKIP][89] ([i915#533]) -> [FAIL][90] ([i915#4638])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - fi-rkl-guc:         [SKIP][91] ([i915#533]) -> [FAIL][92] ([i915#4638])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  
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

--===============0507499711906797127==
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
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6293 -&gt; IGTPW_6442</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/index.html</p>
<h2>Participating hosts (33 -&gt; 34)</h2>
<p>Additional (2): fi-kbl-soraka fi-tgl-u2 <br />
  Missing    (1): fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6442:</p>
<h3>IGT changes</h3>
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
<p>igt@kms_addfb_basic@addfb25-bad-modifier:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_addfb_basic@addfb25-bad-modifier.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_addfb_basic@addfb25-bad-modifier.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>) +39 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@kms_addfb_basic@bo-too-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_addfb_basic@bo-too-small.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>) +40 similar issues</li>
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
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@kms_force_connector_basic@force-connector-state.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>) +1 similar issue</li>
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
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-u2/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>) +57 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-b:</p>
<ul>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/295">i915#295</a>) +12 similar issues</p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>) +39 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>) +1 similar issue</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@prime_vgem@basic-fence-flip.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>) +1 similar issue</p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@prime_vgem@basic-fence-flip.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>) +1 similar issue</p>
</li>
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
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@i915_pm_backlight@basic-brightness.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>)</p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>)</p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_chamelium@common-hpd-after-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-fast:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@kms_chamelium@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_chamelium@vga-hpd-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>) +1 similar issue</p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>) +1 similar issue</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>)</p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6293/fi-rkl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/fi-rkl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4638">i915#4638</a>)</p>
</li>
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

--===============0507499711906797127==--
