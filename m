Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 23 Oct 2020 13:54:53 -0000
Message-ID: <160346129304.1407.14725935968417265133@emeril.freedesktop.org>
References: <20201023100709.5211-1-karthik.b.s@intel.com>
In-Reply-To: <20201023100709.5211-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIHN1?=
 =?utf-8?q?btests_for_HDCP_over_MST?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0057758856=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0057758856==
Content-Type: multipart/alternative;
 boundary="===============1050356711816316228=="

--===============1050356711816316228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add subtests for HDCP over MST
URL   : https://patchwork.freedesktop.org/series/82987/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5823_full -> IGTPW_5090_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5090_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5090_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5090_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_parallel@engines@contexts:
    - shard-hsw:          [PASS][1] -> [FAIL][2] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw8/igt@gem_exec_parallel@engines@contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-hsw6/igt@gem_exec_parallel@engines@contexts.html

  * {igt@kms_content_protection@dp-mst-lic-type-1} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][3] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-iclb7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * {igt@kms_content_protection@dp-mst-type-0} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][4] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-tglb6/igt@kms_content_protection@dp-mst-type-0.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-hsw:          [WARN][5] ([i915#2283]) -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw4/igt@core_hotunplug@hotrebind-lateclose.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-hsw7/igt@core_hotunplug@hotrebind-lateclose.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@core_hotunplug@hotrebind}:
    - shard-hsw:          NOTRUN -> [WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-hsw6/igt@core_hotunplug@hotrebind.html

  * {igt@gem_exec_parallel@engines@userptr}:
    - shard-hsw:          [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw8/igt@gem_exec_parallel@engines@userptr.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-hsw6/igt@gem_exec_parallel@engines@userptr.html

  
New tests
---------

  New tests have been introduced between IGT_5823_full and IGTPW_5090_full:

### New IGT tests (4) ###

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_content_protection@dp-mst-type-0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_content_protection@dp-mst-type-1:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_5090_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@disjoint-timelines:
    - shard-apl:          [PASS][10] -> [DMESG-WARN][11] ([i915#1635] / [i915#1982])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl8/igt@gem_ctx_shared@disjoint-timelines.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-apl4/igt@gem_ctx_shared@disjoint-timelines.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-hsw:          [PASS][12] -> [FAIL][13] ([i915#2389])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw8/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-hsw7/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][14] -> [DMESG-WARN][15] ([i915#180])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl7/igt@gem_exec_suspend@basic-s3.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-kbl6/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-hsw:          [PASS][16] -> [FAIL][17] ([i915#1888])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw2/igt@gem_userptr_blits@unsync-unmap-cycles.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-hsw6/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [PASS][18] -> [FAIL][19] ([i915#1119])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk1/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-iclb:         [PASS][20] -> [DMESG-WARN][21] ([i915#1982])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-iclb3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:
    - shard-glk:          [PASS][22] -> [DMESG-WARN][23] ([i915#1982])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk3/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
    - shard-tglb:         [PASS][24] -> [DMESG-WARN][25] ([i915#1982]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-snb:          [PASS][26] -> [SKIP][27] ([fdo#109271]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-snb5/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-snb4/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][28] -> [INCOMPLETE][29] ([i915#155] / [i915#648])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][30] -> [SKIP][31] ([fdo#109441]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-iclb8/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-b-wait-forked-busy:
    - shard-kbl:          [PASS][32] -> [DMESG-WARN][33] ([i915#1982])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl2/igt@kms_vblank@pipe-b-wait-forked-busy.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-kbl4/igt@kms_vblank@pipe-b-wait-forked-busy.html

  * igt@perf@oa-exponents:
    - shard-tglb:         [PASS][34] -> [SKIP][35] ([i915#1354])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb8/igt@perf@oa-exponents.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-tglb7/igt@perf@oa-exponents.html
    - shard-glk:          [PASS][36] -> [SKIP][37] ([fdo#109271] / [i915#1354]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk7/igt@perf@oa-exponents.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-glk9/igt@perf@oa-exponents.html
    - shard-apl:          [PASS][38] -> [SKIP][39] ([fdo#109271] / [i915#1354] / [i915#1635]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl8/igt@perf@oa-exponents.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-apl4/igt@perf@oa-exponents.html

  * igt@perf@rc6-disable:
    - shard-iclb:         [PASS][40] -> [SKIP][41] ([i915#1354]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb5/igt@perf@rc6-disable.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-iclb8/igt@perf@rc6-disable.html
    - shard-hsw:          [PASS][42] -> [SKIP][43] ([fdo#109271]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw6/igt@perf@rc6-disable.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-hsw6/igt@perf@rc6-disable.html
    - shard-kbl:          [PASS][44] -> [SKIP][45] ([fdo#109271] / [i915#1354]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl6/igt@perf@rc6-disable.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-kbl6/igt@perf@rc6-disable.html
    - shard-tglb:         [PASS][46] -> [SKIP][47] ([fdo#111719] / [i915#1354])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb3/igt@perf@rc6-disable.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-tglb7/igt@perf@rc6-disable.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][48] ([i915#658]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb5/igt@feature_discovery@psr2.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_exec_create@madvise:
    - shard-glk:          [DMESG-WARN][50] ([i915#118] / [i915#95]) -> [PASS][51] +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk5/igt@gem_exec_create@madvise.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-glk3/igt@gem_exec_create@madvise.html

  * igt@gem_exec_fence@long-history:
    - shard-kbl:          [INCOMPLETE][52] ([CI#80]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl7/igt@gem_exec_fence@long-history.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-kbl6/igt@gem_exec_fence@long-history.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [FAIL][54] ([i915#1635] / [i915#2389]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl3/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-apl1/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][56] ([i915#454]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-kbl:          [FAIL][58] ([i915#2521]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl4/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-kbl2/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - shard-tglb:         [FAIL][60] ([i915#2521]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb1/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-tglb2/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge:
    - shard-glk:          [DMESG-WARN][62] ([i915#1982]) -> [PASS][63] +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-glk3/igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge.html

  * igt@kms_draw_crc@draw-method-rgb565-render-xtiled:
    - shard-apl:          [DMESG-WARN][64] ([i915#1635] / [i915#1982]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl2/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-apl4/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][66] ([i915#2055]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-hsw5/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-glk:          [FAIL][68] ([i915#49]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-tglb:         [DMESG-WARN][70] ([i915#1982]) -> [PASS][71] +4 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][72] ([fdo#109441]) -> [PASS][73] +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  
#### Warnings ####

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][74] ([fdo#110321] / [i915#1635]) -> [TIMEOUT][75] ([i915#1319] / [i915#1635])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl1/igt@kms_content_protection@lic.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-apl2/igt@kms_content_protection@lic.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][76] ([fdo#109349]) -> [DMESG-WARN][77] ([i915#1226])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5823 -> IGTPW_5090

  CI-20190529: 20190529
  CI_DRM_9190: a3d535579dd93942862b867b4452ba11e4f6bbb1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5090: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/index.html
  IGT_5823: 7dd2fe99bd9dde00456cc5abf7e5ef0c8d7d6118 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/index.html

--===============1050356711816316228==
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
<tr><td><b>Series:</b></td><td>Add subtests for HDCP over MST</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82987/">https://patchwork.freedesktop.org/series/82987/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5823_full -&gt; IGTPW_5090_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5090_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5090_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5090_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@contexts:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw8/igt@gem_exec_parallel@engines@contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-hsw6/igt@gem_exec_parallel@engines@contexts.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_content_protection@dp-mst-lic-type-1} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-iclb7/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_content_protection@dp-mst-type-0} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-tglb6/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@core_hotunplug@hotrebind-lateclose:<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw4/igt@core_hotunplug@hotrebind-lateclose.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-hsw7/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@core_hotunplug@hotrebind}:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-hsw6/igt@core_hotunplug@hotrebind.html">WARN</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_parallel@engines@userptr}:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw8/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-hsw6/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_5823_full and IGTPW_5090_full:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5090_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_shared@disjoint-timelines:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl8/igt@gem_ctx_shared@disjoint-timelines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-apl4/igt@gem_ctx_shared@disjoint-timelines.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw8/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-hsw7/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl7/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-kbl6/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw2/igt@gem_userptr_blits@unsync-unmap-cycles.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-hsw6/igt@gem_userptr_blits@unsync-unmap-cycles.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk1/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1119">i915#1119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-iclb3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk3/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-snb5/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-snb4/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/648">i915#648</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-iclb8/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-wait-forked-busy:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl2/igt@kms_vblank@pipe-b-wait-forked-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-kbl4/igt@kms_vblank@pipe-b-wait-forked-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@oa-exponents:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb8/igt@perf@oa-exponents.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-tglb7/igt@perf@oa-exponents.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk7/igt@perf@oa-exponents.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-glk9/igt@perf@oa-exponents.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl8/igt@perf@oa-exponents.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-apl4/igt@perf@oa-exponents.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@rc6-disable:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb5/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-iclb8/igt@perf@rc6-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw6/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-hsw6/igt@perf@rc6-disable.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl6/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-kbl6/igt@perf@rc6-disable.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb3/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-tglb7/igt@perf@rc6-disable.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111719">fdo#111719</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb5/igt@feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@madvise:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk5/igt@gem_exec_create@madvise.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-glk3/igt@gem_exec_create@madvise.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@long-history:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl7/igt@gem_exec_fence@long-history.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80">CI#80</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-kbl6/igt@gem_exec_fence@long-history.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl3/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-apl1/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-iclb2/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl4/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-kbl2/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb1/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-tglb2/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-glk3/igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-xtiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl2/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-apl4/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-hsw5/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl1/igt@kms_content_protection@lic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-apl2/igt@kms_content_protection@lic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109349">fdo#109349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>)</li>
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
<li>IGT: IGT_5823 -&gt; IGTPW_5090</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9190: a3d535579dd93942862b867b4452ba11e4f6bbb1 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5090: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5090/index.html<br />
  IGT_5823: 7dd2fe99bd9dde00456cc5abf7e5ef0c8d7d6118 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============1050356711816316228==--

--===============0057758856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0057758856==--
