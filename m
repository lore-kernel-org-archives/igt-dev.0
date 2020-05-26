Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 26 May 2020 20:43:36 -0000
Message-ID: <159052581610.28045.8710448848472170126@emeril.freedesktop.org>
References: <20200526141723.401469-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200526141723.401469-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9w?=
 =?utf-8?q?erf=5Fpmu=3A_Update_inter-engine_semaphore_detection?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/perf_pmu: Update inter-engine semaphore detection
URL   : https://patchwork.freedesktop.org/series/77665/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5679_full -> IGTPW_4615_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4615_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4615_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4615_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_param@root-set-no-zeromap-disabled:
    - shard-glk:          [PASS][1] -> [TIMEOUT][2] +4 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-glk5/igt@gem_ctx_param@root-set-no-zeromap-disabled.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-glk7/igt@gem_ctx_param@root-set-no-zeromap-disabled.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-glk:          [SKIP][3] ([fdo#109271]) -> [TIMEOUT][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-glk6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-glk7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_reloc@basic-concurrent16}:
    - shard-kbl:          [FAIL][5] ([i915#1930]) -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-kbl6/igt@gem_exec_reloc@basic-concurrent16.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-kbl7/igt@gem_exec_reloc@basic-concurrent16.html

  * {igt@i915_pm_rc6_residency@rc6-fence}:
    - shard-hsw:          [PASS][7] -> [WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-hsw1/igt@i915_pm_rc6_residency@rc6-fence.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-hsw6/igt@i915_pm_rc6_residency@rc6-fence.html

  
Known issues
------------

  Here are the changes found in IGTPW_4615_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_param@root-set-no-zeromap-disabled:
    - shard-apl:          [PASS][9] -> [TIMEOUT][10] ([i915#1635]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-apl4/igt@gem_ctx_param@root-set-no-zeromap-disabled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-apl8/igt@gem_ctx_param@root-set-no-zeromap-disabled.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#1119] / [i915#93] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-0.html
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#1119] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-apl8/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-bottom-edge:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#70] / [i915#93] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-kbl3/igt@kms_cursor_edge_walk@pipe-a-256x256-bottom-edge.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-kbl7/igt@kms_cursor_edge_walk@pipe-a-256x256-bottom-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-glk:          [PASS][21] -> [DMESG-WARN][22] ([i915#1927])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-glk1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-glk2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-glk:          [PASS][23] -> [DMESG-WARN][24] ([i915#1926])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-glk7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-glk4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#52] / [i915#54] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-apl6/igt@kms_draw_crc@fill-fb.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-apl7/igt@kms_draw_crc@fill-fb.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#1525] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#64] / [i915#93] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#49])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [PASS][39] -> [FAIL][40] ([fdo#108145] / [i915#265] / [i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-kbl:          [PASS][41] -> [FAIL][42] ([i915#1559] / [i915#93] / [i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-kbl2/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
    - shard-apl:          [PASS][43] -> [FAIL][44] ([i915#1559] / [i915#95])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109642] / [fdo#111068])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-iclb8/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][47] -> [FAIL][48] ([i915#173])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-iclb3/igt@kms_psr@no_drrs.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#109441])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-iclb2/igt@kms_psr@psr2_primary_blt.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-iclb7/igt@kms_psr@psr2_primary_blt.html

  
#### Possible fixes ####

  * igt@gem_softpin@reverse:
    - shard-glk:          [DMESG-WARN][51] ([i915#1927]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-glk7/igt@gem_softpin@reverse.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-glk5/igt@gem_softpin@reverse.html

  * igt@gem_workarounds@suspend-resume:
    - shard-tglb:         [INCOMPLETE][53] ([i915#1602] / [i915#456]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-tglb3/igt@gem_workarounds@suspend-resume.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-tglb1/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_rpm@fences-dpms:
    - shard-kbl:          [SKIP][55] ([fdo#109271]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-kbl1/igt@i915_pm_rpm@fences-dpms.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-kbl6/igt@i915_pm_rpm@fences-dpms.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-kbl1/igt@i915_suspend@sysfs-reader.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-kbl7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [FAIL][59] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-size-change:
    - shard-glk:          [FAIL][61] ([i915#54]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-size-change.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-size-change.html
    - shard-apl:          [FAIL][63] ([i915#54]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-size-change.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-size-change.html
    - shard-kbl:          [FAIL][65] ([i915#54]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-size-change.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-size-change.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled:
    - shard-apl:          [TIMEOUT][67] ([i915#1635]) -> [PASS][68] +5 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-apl4/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-apl3/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [FAIL][69] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [FAIL][71] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][73] ([i915#64]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-kbl4/igt@kms_fbcon_fbt@fbc.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-kbl1/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][75] ([i915#1525]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-apl4/igt@kms_fbcon_fbt@fbc.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-apl3/igt@kms_fbcon_fbt@fbc.html

  * {igt@kms_flip@flip-vs-suspend@b-dp1}:
    - shard-apl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-apl1/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-apl6/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [FAIL][79] ([i915#95]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_prop_blob@blob-prop-lifetime:
    - shard-hsw:          [DMESG-WARN][81] -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-hsw1/igt@kms_prop_blob@blob-prop-lifetime.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-hsw6/igt@kms_prop_blob@blob-prop-lifetime.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][83] ([fdo#109441]) -> [PASS][84] +3 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][85] ([i915#468]) -> [FAIL][86] ([i915#454])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-tglb8/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][87] ([fdo#110321]) -> [TIMEOUT][88] ([i915#1319] / [i915#1635]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-apl4/igt@kms_content_protection@lic.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-apl2/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][89] ([i915#357] / [i915#93] / [i915#95]) -> [FAIL][90] ([i915#357])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-kbl2/igt@kms_content_protection@uevent.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-kbl1/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][91] ([i915#357] / [i915#95]) -> [FAIL][92] ([i915#357])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-apl2/igt@kms_content_protection@uevent.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-apl3/igt@kms_content_protection@uevent.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [INCOMPLETE][93] ([i915#155] / [i915#648]) -> [DMESG-WARN][94] ([i915#180])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [FAIL][95] ([i915#608]) -> [SKIP][96] ([fdo#109642] / [fdo#111068])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-iclb5/igt@kms_psr2_su@page_flip.html

  * igt@prime_vgem@fence-write-hang:
    - shard-apl:          [SKIP][97] ([fdo#109271]) -> [TIMEOUT][98] ([i915#1635])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-apl3/igt@prime_vgem@fence-write-hang.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-apl8/igt@prime_vgem@fence-write-hang.html

  * igt@runner@aborted:
    - shard-glk:          [FAIL][99] ([k.org#202321]) -> [FAIL][100] ([i915#1611] / [k.org#202321])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5679/shard-glk7/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/shard-glk2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1927]: https://gitlab.freedesktop.org/drm/intel/issues/1927
  [i915#1929]: https://gitlab.freedesktop.org/drm/intel/issues/1929
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5679 -> IGTPW_4615

  CI-20190529: 20190529
  CI_DRM_8539: 6590da76d8c6a2952b3cde70859bad41c59ed444 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4615: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/index.html
  IGT_5679: 93639b4e52140826c24da21865e912a280f9aefb @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4615/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
