Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 30 Jul 2020 12:28:18 -0000
Message-ID: <159611209842.11112.18023672168212619841@emeril.freedesktop.org>
References: <20200720165011.23918-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20200720165011.23918-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIG5l?=
 =?utf-8?q?w_IGT_test_to_validate_crtc_Dithering_=28rev6=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0900436522=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0900436522==
Content-Type: multipart/alternative;
 boundary="===============1143839392600025247=="

--===============1143839392600025247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add new IGT test to validate crtc Dithering (rev6)
URL   : https://patchwork.freedesktop.org/series/79661/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5752_full -> IGTPW_4826_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4826_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4826_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4826_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_parallel@contexts@bcs0:
    - shard-kbl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl4/igt@gem_exec_parallel@contexts@bcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-kbl7/igt@gem_exec_parallel@contexts@bcs0.html

  * {igt@kms_dither@fb-8bpc-vs-panel-6bpc} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][3] +16 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-iclb1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * {igt@kms_dither@fb-8bpc-vs-panel-6bpc-suspend} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][4] +16 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-tglb8/igt@kms_dither@fb-8bpc-vs-panel-6bpc-suspend.html

  * igt@kms_flip@2x-flip-vs-fences@bc-vga1-hdmi-a1:
    - shard-hsw:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw6/igt@kms_flip@2x-flip-vs-fences@bc-vga1-hdmi-a1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-hsw8/igt@kms_flip@2x-flip-vs-fences@bc-vga1-hdmi-a1.html

  
New tests
---------

  New tests have been introduced between IGT_5752_full and IGTPW_4826_full:

### New IGT tests (18) ###

  * igt@kms_dither@fb-10bpc-vs-panel-10bpc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_dither@fb-10bpc-vs-panel-10bpc-suspend:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_dither@fb-10bpc-vs-panel-6bpc:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_dither@fb-10bpc-vs-panel-6bpc-suspend:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dither@fb-10bpc-vs-panel-8bpc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_dither@fb-10bpc-vs-panel-8bpc-suspend:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_dither@fb-16bpc-vs-panel-10bpc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_dither@fb-16bpc-vs-panel-10bpc-suspend:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dither@fb-16bpc-vs-panel-6bpc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dither@fb-16bpc-vs-panel-6bpc-suspend:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_dither@fb-16bpc-vs-panel-8bpc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_dither@fb-16bpc-vs-panel-8bpc-suspend:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dither@fb-8bpc-vs-panel-10bpc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_dither@fb-8bpc-vs-panel-10bpc-suspend:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc-suspend:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc-suspend:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_4826_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#1930])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk6/igt@gem_exec_reloc@basic-concurrent0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-glk1/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#1436] / [i915#1635] / [i915#716])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl8/igt@gen9_exec_parse@allowed-all.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-apl1/igt@gen9_exec_parse@allowed-all.html
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1436] / [i915#716])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl2/igt@gen9_exec_parse@allowed-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-kbl2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][13] -> [FAIL][14] ([i915#454])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge:
    - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#1982])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk3/igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-glk1/igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][17] -> [DMESG-WARN][18] ([i915#1982])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-hsw6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl1/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-kbl1/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-tglb:         [PASS][23] -> [DMESG-WARN][24] ([i915#1982]) +4 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-tglb5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
    - shard-iclb:         [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb7/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_prop_blob@blob-prop-validate:
    - shard-snb:          [PASS][27] -> [TIMEOUT][28] ([i915#1958] / [i915#2119])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb5/igt@kms_prop_blob@blob-prop-validate.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-snb6/igt@kms_prop_blob@blob-prop-validate.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-iclb8/igt@kms_psr@psr2_cursor_plane_onoff.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-iclb:         [FAIL][31] -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb5/igt@core_setmaster@master-drop-set-user.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-iclb2/igt@core_setmaster@master-drop-set-user.html
    - shard-kbl:          [FAIL][33] -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl2/igt@core_setmaster@master-drop-set-user.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-kbl1/igt@core_setmaster@master-drop-set-user.html
    - shard-snb:          [FAIL][35] -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb6/igt@core_setmaster@master-drop-set-user.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-snb5/igt@core_setmaster@master-drop-set-user.html
    - shard-tglb:         [FAIL][37] -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb5/igt@core_setmaster@master-drop-set-user.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-tglb5/igt@core_setmaster@master-drop-set-user.html
    - shard-apl:          [FAIL][39] ([i915#1635]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl4/igt@core_setmaster@master-drop-set-user.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-apl2/igt@core_setmaster@master-drop-set-user.html
    - shard-glk:          [FAIL][41] -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk5/igt@core_setmaster@master-drop-set-user.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-glk3/igt@core_setmaster@master-drop-set-user.html
    - shard-hsw:          [FAIL][43] -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw6/igt@core_setmaster@master-drop-set-user.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-hsw2/igt@core_setmaster@master-drop-set-user.html

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [DMESG-WARN][45] ([i915#180]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-glk:          [DMESG-WARN][47] ([i915#118] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk4/igt@gem_exec_whisper@basic-queues-priority-all.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-glk2/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@kms_addfb_basic@bo-too-small:
    - shard-hsw:          [TIMEOUT][49] ([i915#1958] / [i915#2119]) -> [PASS][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw1/igt@kms_addfb_basic@bo-too-small.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-hsw4/igt@kms_addfb_basic@bo-too-small.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge:
    - shard-glk:          [DMESG-WARN][51] ([i915#1982]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge:
    - shard-snb:          [TIMEOUT][53] ([i915#1958] / [i915#2119]) -> [PASS][54] +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb5/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-snb2/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][55] ([i915#1982]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-hsw4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][57] ([i915#2055]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - shard-kbl:          [DMESG-WARN][59] ([i915#1982]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-tglb:         [DMESG-WARN][61] ([i915#1982]) -> [PASS][62] +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
    - shard-iclb:         [DMESG-WARN][63] ([i915#1982]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [INCOMPLETE][65] ([i915#155]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][67] ([fdo#109642] / [fdo#111068]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb4/igt@kms_psr2_su@page_flip.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][69] ([fdo#109441]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb5/igt@kms_psr@psr2_primary_page_flip.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_vblank@pipe-c-query-forked-busy:
    - shard-apl:          [DMESG-WARN][71] ([i915#1635] / [i915#1982]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl3/igt@kms_vblank@pipe-c-query-forked-busy.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-apl7/igt@kms_vblank@pipe-c-query-forked-busy.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [FAIL][73] ([i915#1542]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb2/igt@perf@blocking-parameterized.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-iclb2/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@engines-mixed-process:
    - shard-snb:          [SKIP][75] ([fdo#109271] / [i915#1099]) -> [TIMEOUT][76] ([i915#1958] / [i915#2119])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb5/igt@gem_ctx_persistence@engines-mixed-process.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-snb6/igt@gem_ctx_persistence@engines-mixed-process.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][77] ([i915#1319] / [i915#2119]) -> [TIMEOUT][78] ([i915#1319] / [i915#1958] / [i915#2119])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl1/igt@kms_content_protection@atomic.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-kbl4/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
    - shard-snb:          [TIMEOUT][79] ([i915#1958] / [i915#2119]) -> [SKIP][80] ([fdo#109271])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb5/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-snb5/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-hsw:          [TIMEOUT][81] ([i915#1958] / [i915#2119]) -> [SKIP][82] ([fdo#109271]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-hsw4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
    - shard-hsw:          [SKIP][83] ([fdo#109271]) -> [TIMEOUT][84] ([i915#1958] / [i915#2119]) +3 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-hsw1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-snb:          [SKIP][85] ([fdo#109271]) -> [TIMEOUT][86] ([i915#1958] / [i915#2119]) +3 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-snb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5752 -> IGTPW_4826

  CI-20190529: 20190529
  CI_DRM_8815: 521846d50ed323d4dcb0ffafa63e34528b0a4996 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4826: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/index.html
  IGT_5752: 3ecf9d88803a686354394ea60164551646235273 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/index.html

--===============1143839392600025247==
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
<tr><td><b>Series:</b></td><td>Add new IGT test to validate crtc Dithering (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/79661/">https://patchwork.freedesktop.org/series/79661/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5752_full -&gt; IGTPW_4826_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4826_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4826_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4826_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@contexts@bcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl4/igt@gem_exec_parallel@contexts@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-kbl7/igt@gem_exec_parallel@contexts@bcs0.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_dither@fb-8bpc-vs-panel-6bpc} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-iclb1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> +16 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_dither@fb-8bpc-vs-panel-6bpc-suspend} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-tglb8/igt@kms_dither@fb-8bpc-vs-panel-6bpc-suspend.html">SKIP</a> +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@bc-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw6/igt@kms_flip@2x-flip-vs-fences@bc-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-hsw8/igt@kms_flip@2x-flip-vs-fences@bc-vga1-hdmi-a1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_5752_full and IGTPW_4826_full:</p>
<h3>New IGT tests (18)</h3>
<ul>
<li>
<p>igt@kms_dither@fb-10bpc-vs-panel-10bpc:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-10bpc-vs-panel-10bpc-suspend:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-10bpc-vs-panel-6bpc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-10bpc-vs-panel-6bpc-suspend:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-10bpc-vs-panel-8bpc:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-10bpc-vs-panel-8bpc-suspend:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-16bpc-vs-panel-10bpc:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-16bpc-vs-panel-10bpc-suspend:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-16bpc-vs-panel-6bpc:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-16bpc-vs-panel-6bpc-suspend:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-16bpc-vs-panel-8bpc:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-16bpc-vs-panel-8bpc-suspend:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-10bpc:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-10bpc-suspend:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc-suspend:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc-suspend:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4826_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk6/igt@gem_exec_reloc@basic-concurrent0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-glk1/igt@gem_exec_reloc@basic-concurrent0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1930">i915#1930</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl8/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-apl1/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl2/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-kbl2/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-iclb2/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk3/igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-glk1/igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-hsw6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl1/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-kbl1/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-tglb5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb7/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@blob-prop-validate:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb5/igt@kms_prop_blob@blob-prop-validate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-snb6/igt@kms_prop_blob@blob-prop-validate.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-iclb8/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb5/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-iclb2/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl2/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-kbl1/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb6/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-snb5/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb5/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-tglb5/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl4/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-apl2/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk5/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-glk3/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw6/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-hsw2/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk4/igt@gem_exec_whisper@basic-queues-priority-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-glk2/igt@gem_exec_whisper@basic-queues-priority-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw1/igt@kms_addfb_basic@bo-too-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-hsw4/igt@kms_addfb_basic@bo-too-small.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb5/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-snb2/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-hsw4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">PASS</a> +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb4/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb5/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-forked-busy:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl3/igt@kms_vblank@pipe-c-query-forked-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-apl7/igt@kms_vblank@pipe-c-query-forked-busy.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb2/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-iclb2/igt@perf@blocking-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-mixed-process:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb5/igt@gem_ctx_persistence@engines-mixed-process.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-snb6/igt@gem_ctx_persistence@engines-mixed-process.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl1/igt@kms_content_protection@atomic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-kbl4/igt@kms_content_protection@atomic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-random:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb5/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-snb5/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-hsw4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-hsw1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/shard-snb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +3 similar issues</li>
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
<li>IGT: IGT_5752 -&gt; IGTPW_4826</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8815: 521846d50ed323d4dcb0ffafa63e34528b0a4996 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4826: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4826/index.html<br />
  IGT_5752: 3ecf9d88803a686354394ea60164551646235273 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============1143839392600025247==--

--===============0900436522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0900436522==--
