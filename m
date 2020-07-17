Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 17 Jul 2020 17:33:05 -0000
Message-ID: <159500718580.14919.6022765284937022479@emeril.freedesktop.org>
References: <20200717154101.8849-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200717154101.8849-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fkms=3A_Add_support_for_display_with_=28rev8=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0326445496=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Khajapasha, Mohammed" <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0326445496==
Content-Type: multipart/alternative;
 boundary="===============8587039780513884334=="

--===============8587039780513884334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_kms: Add support for display with (rev8)
URL   : https://patchwork.freedesktop.org/series/78482/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5739_full -> IGTPW_4774_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4774_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4774_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4774_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-tglb1/igt@gem_exec_whisper@basic-fds-forked.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-tglb7/igt@gem_exec_whisper@basic-fds-forked.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-tglb:         ([FAIL][3], [FAIL][4]) ([i915#1764] / [i915#2110]) -> ([FAIL][5], [FAIL][6]) ([i915#2110])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-tglb1/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-tglb3/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-tglb1/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-tglb7/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4774_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#1930])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-glk1/igt@gem_exec_reloc@basic-concurrent0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-glk6/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#118] / [i915#95]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-glk3/igt@gem_exec_whisper@basic-fds-forked.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-glk4/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-snb:          [PASS][11] -> [TIMEOUT][12] ([i915#1958] / [i915#2119])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-snb6/igt@kms_fbcon_fbt@fbc-suspend.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-snb1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#79])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-tglb:         [PASS][15] -> [DMESG-WARN][16] ([i915#1982]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#1635] / [i915#49])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#49])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-b:
    - shard-tglb:         [PASS][21] -> [DMESG-WARN][22] ([i915#402]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-tglb3/igt@kms_pipe_crc_basic@hang-read-crc-pipe-b.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-tglb6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-b.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +5 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-c-wait-busy:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#1635] / [i915#1982])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-apl8/igt@kms_vblank@pipe-c-wait-busy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-apl2/igt@kms_vblank@pipe-c-wait-busy.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#1542])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-iclb2/igt@perf@blocking-parameterized.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-iclb8/igt@perf@blocking-parameterized.html

  
#### Possible fixes ####

  * {igt@gem_huc_copy@huc-copy}:
    - shard-tglb:         [SKIP][31] ([i915#2190]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-tglb7/igt@gem_huc_copy@huc-copy.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-glk:          [DMESG-FAIL][33] ([i915#118] / [i915#95]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-glk3/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][35] ([i915#180]) -> [PASS][36] +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding:
    - shard-glk:          [FAIL][37] ([i915#54]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
    - shard-apl:          [FAIL][39] ([i915#1635] / [i915#54]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
    - shard-kbl:          [FAIL][41] ([i915#54]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-kbl:          [DMESG-WARN][43] ([i915#1982]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-tglb:         [DMESG-WARN][45] ([i915#1982]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][47] ([fdo#109642] / [fdo#111068]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-iclb8/igt@kms_psr2_su@frontbuffer.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][49] ([fdo#109441]) -> [PASS][50] +5 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][51] ([i915#31]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-kbl7/igt@kms_setmode@basic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-kbl3/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-hsw:          [TIMEOUT][53] ([i915#1958] / [i915#2119]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-hsw6/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-hsw4/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_vblank@pipe-a-query-forked-busy-hang:
    - shard-snb:          [TIMEOUT][55] ([i915#1958] / [i915#2119]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-snb4/igt@kms_vblank@pipe-a-query-forked-busy-hang.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-snb4/igt@kms_vblank@pipe-a-query-forked-busy-hang.html

  * igt@perf@missing-sample-flags:
    - shard-apl:          [SKIP][57] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-apl6/igt@perf@missing-sample-flags.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-apl8/igt@perf@missing-sample-flags.html
    - shard-glk:          [SKIP][59] ([fdo#109271] / [i915#1354]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-glk9/igt@perf@missing-sample-flags.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-glk7/igt@perf@missing-sample-flags.html
    - shard-iclb:         [SKIP][61] ([i915#1354]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-iclb1/igt@perf@missing-sample-flags.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-iclb4/igt@perf@missing-sample-flags.html
    - shard-hsw:          [SKIP][63] ([fdo#109271]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-hsw1/igt@perf@missing-sample-flags.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-hsw2/igt@perf@missing-sample-flags.html
    - shard-kbl:          [SKIP][65] ([fdo#109271] / [i915#1354]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-kbl7/igt@perf@missing-sample-flags.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-kbl2/igt@perf@missing-sample-flags.html
    - shard-tglb:         [SKIP][67] ([i915#1354]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-tglb1/igt@perf@missing-sample-flags.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-tglb1/igt@perf@missing-sample-flags.html

  * igt@perf_pmu@init-busy@vcs0:
    - shard-snb:          [DMESG-WARN][69] ([i915#1958] / [i915#2119]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-snb4/igt@perf_pmu@init-busy@vcs0.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-snb4/igt@perf_pmu@init-busy@vcs0.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][71] ([i915#1820]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-kbl7/igt@perf_pmu@semaphore-busy@rcs0.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-kbl2/igt@perf_pmu@semaphore-busy@rcs0.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-tglb:         [DMESG-WARN][73] ([i915#402]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-tglb8/igt@prime_vgem@basic-fence-flip.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-tglb2/igt@prime_vgem@basic-fence-flip.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][75] ([i915#180]) -> [INCOMPLETE][76] ([i915#155])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-kbl3/igt@gem_exec_suspend@basic-s3.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-kbl6/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [INCOMPLETE][77] ([i915#1959]) -> [DMESG-WARN][78] ([i915#180])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-kbl4/igt@gem_softpin@noreloc-s3.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-kbl2/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][79] ([i915#588]) -> [SKIP][80] ([i915#658])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         [SKIP][81] ([fdo#109278] / [fdo#112010] / [i915#1149]) -> [SKIP][82] ([fdo#109278] / [i915#1149]) +8 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-iclb6/igt@kms_color@pipe-d-ctm-0-25.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-iclb4/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-c-ctm-max:
    - shard-hsw:          [SKIP][83] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][84] ([i915#1958] / [i915#2119])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-hsw2/igt@kms_color_chamelium@pipe-c-ctm-max.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-hsw2/igt@kms_color_chamelium@pipe-c-ctm-max.html
    - shard-snb:          [SKIP][85] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][86] ([i915#1958] / [i915#2119])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-snb1/igt@kms_color_chamelium@pipe-c-ctm-max.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-snb1/igt@kms_color_chamelium@pipe-c-ctm-max.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
    - shard-iclb:         [SKIP][87] ([fdo#109279]) -> [SKIP][88] ([fdo#109278] / [fdo#109279]) +25 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
    - shard-iclb:         [SKIP][89] ([fdo#109278] / [fdo#112010] / [i915#508]) -> [SKIP][90] ([fdo#109278])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-iclb2/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-iclb8/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html

  * igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge:
    - shard-snb:          [TIMEOUT][91] ([i915#1958] / [i915#2119]) -> [SKIP][92] ([fdo#109271]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-snb4/igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-snb5/igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-iclb:         [SKIP][93] ([fdo#109274]) -> [SKIP][94] ([fdo#109274] / [fdo#109278]) +26 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-iclb1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-iclb5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@pipe-d-single-move:
    - shard-iclb:         [SKIP][95] ([fdo#109278] / [fdo#112010]) -> [SKIP][96] ([fdo#109278]) +85 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-iclb1/igt@kms_cursor_legacy@pipe-d-single-move.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-iclb2/igt@kms_cursor_legacy@pipe-d-single-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-hsw:          [SKIP][97] ([fdo#109271]) -> [TIMEOUT][98] ([i915#1958] / [i915#2119]) +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-hsw8/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-hsw2/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
    - shard-hsw:          [TIMEOUT][99] ([i915#1958] / [i915#2119]) -> [SKIP][100] ([fdo#109271])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-hsw6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-hsw2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-snb:          [SKIP][101] ([fdo#109271]) -> [TIMEOUT][102] ([i915#1958] / [i915#2119]) +2 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-snb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-snb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         [SKIP][103] ([fdo#112025] / [fdo#112054]) -> [SKIP][104] ([fdo#112054])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-tglb8/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-tglb:         [SKIP][105] ([fdo#111825] / [fdo#112015]) -> [SKIP][106] ([fdo#111825])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-tglb3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-tglb2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112010]: https://bugs.freedesktop.org/show_bug.cgi?id=112010
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112025]: https://bugs.freedesktop.org/show_bug.cgi?id=112025
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1764]: https://gitlab.freedesktop.org/drm/intel/issues/1764
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1959]: https://gitlab.freedesktop.org/drm/intel/issues/1959
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#508]: https://gitlab.freedesktop.org/drm/intel/issues/508
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5739 -> IGTPW_4774

  CI-20190529: 20190529
  CI_DRM_8760: 6cd3f0d5b81362d933c87318fa0bc3badd9ab92d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4774: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/index.html
  IGT_5739: 9b964d7359db9799f2b5b905403dda668ae28c87 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/index.html

--===============8587039780513884334==
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
<tr><td><b>Series:</b></td><td>lib/igt_kms: Add support for display with (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/78482/">https://patchwork.freedesktop.org/series/78482/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5739_full -&gt; IGTPW_4774_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4774_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4774_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4774_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_exec_whisper@basic-fds-forked:<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-tglb1/igt@gem_exec_whisper@basic-fds-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-tglb7/igt@gem_exec_whisper@basic-fds-forked.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>shard-tglb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-tglb3/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1764">i915#1764</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-tglb7/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4774_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-glk1/igt@gem_exec_reloc@basic-concurrent0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-glk6/igt@gem_exec_reloc@basic-concurrent0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1930">i915#1930</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-glk3/igt@gem_exec_whisper@basic-fds-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-glk4/igt@gem_exec_whisper@basic-fds-forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-snb6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-snb1/igt@kms_fbcon_fbt@fbc-suspend.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-b:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-tglb3/igt@kms_pipe_crc_basic@hang-read-crc-pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-tglb6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-busy:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-apl8/igt@kms_vblank@pipe-c-wait-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-apl2/igt@kms_vblank@pipe-c-wait-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-iclb2/igt@perf@blocking-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-iclb8/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_huc_copy@huc-copy}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-tglb7/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-glk3/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-iclb8/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-kbl7/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-kbl3/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-hsw6/igt@kms_setmode@invalid-clone-exclusive-crtc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-hsw4/igt@kms_setmode@invalid-clone-exclusive-crtc.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-query-forked-busy-hang:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-snb4/igt@kms_vblank@pipe-a-query-forked-busy-hang.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-snb4/igt@kms_vblank@pipe-a-query-forked-busy-hang.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@missing-sample-flags:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-apl6/igt@perf@missing-sample-flags.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-apl8/igt@perf@missing-sample-flags.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-glk9/igt@perf@missing-sample-flags.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-glk7/igt@perf@missing-sample-flags.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-iclb1/igt@perf@missing-sample-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-iclb4/igt@perf@missing-sample-flags.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-hsw1/igt@perf@missing-sample-flags.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-hsw2/igt@perf@missing-sample-flags.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-kbl7/igt@perf@missing-sample-flags.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-kbl2/igt@perf@missing-sample-flags.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-tglb1/igt@perf@missing-sample-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-tglb1/igt@perf@missing-sample-flags.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@init-busy@vcs0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-snb4/igt@perf_pmu@init-busy@vcs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-snb4/igt@perf_pmu@init-busy@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-kbl7/igt@perf_pmu@semaphore-busy@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1820">i915#1820</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-kbl2/igt@perf_pmu@semaphore-busy@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-tglb8/igt@prime_vgem@basic-fence-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-tglb2/igt@prime_vgem@basic-fence-flip.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-kbl3/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-kbl6/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-kbl4/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1959">i915#1959</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-kbl2/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-iclb6/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=112010">fdo#112010</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-iclb4/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-max:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-hsw2/igt@kms_color_chamelium@pipe-c-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-hsw2/igt@kms_color_chamelium@pipe-c-ctm-max.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-snb1/igt@kms_color_chamelium@pipe-c-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-snb1/igt@kms_color_chamelium@pipe-c-ctm-max.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a>) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-iclb2/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=112010">fdo#112010</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/508">i915#508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-iclb8/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-snb4/igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-snb5/igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-iclb1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-iclb5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-iclb1/igt@kms_cursor_legacy@pipe-d-single-move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=112010">fdo#112010</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-iclb2/igt@kms_cursor_legacy@pipe-d-single-move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +85 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-hsw8/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-hsw2/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-hsw6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-hsw2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-snb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-snb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-tglb8/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112025">fdo#112025</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=112054">fdo#112054</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112054">fdo#112054</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5739/shard-tglb3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=112015">fdo#112015</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/shard-tglb2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5739 -&gt; IGTPW_4774</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8760: 6cd3f0d5b81362d933c87318fa0bc3badd9ab92d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4774: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4774/index.html<br />
  IGT_5739: 9b964d7359db9799f2b5b905403dda668ae28c87 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============8587039780513884334==--

--===============0326445496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0326445496==--
