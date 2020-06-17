Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 17 Jun 2020 19:36:53 -0000
Message-ID: <159242261345.29980.8776449473330786612@emeril.freedesktop.org>
References: <20200617180354.17770-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200617180354.17770-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fkms=3A_Add_support_for_display_with?=
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
To: "Khajapasha, Mohammed" <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_kms: Add support for display with
URL   : https://patchwork.freedesktop.org/series/78482/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5712_full -> IGTPW_4680_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4680_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4680_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4680_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@1x-modeset-transitions:
    - shard-snb:          [PASS][1] -> [FAIL][2] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-snb4/igt@kms_atomic_transition@1x-modeset-transitions.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-snb6/igt@kms_atomic_transition@1x-modeset-transitions.html

  * igt@kms_atomic_transition@1x-modeset-transitions-fencing:
    - shard-kbl:          [PASS][3] -> [FAIL][4] +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl7/igt@kms_atomic_transition@1x-modeset-transitions-fencing.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-kbl4/igt@kms_atomic_transition@1x-modeset-transitions-fencing.html
    - shard-iclb:         [PASS][5] -> [FAIL][6] +4 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-iclb4/igt@kms_atomic_transition@1x-modeset-transitions-fencing.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-iclb4/igt@kms_atomic_transition@1x-modeset-transitions-fencing.html

  * igt@kms_atomic_transition@1x-modeset-transitions-nonblocking:
    - shard-apl:          [PASS][7] -> [FAIL][8] +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-apl7/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-apl2/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking.html
    - shard-tglb:         [PASS][9] -> [FAIL][10] +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-tglb7/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-tglb5/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking.html

  * igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing:
    - shard-snb:          NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-snb6/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing.html
    - shard-tglb:         NOTRUN -> [FAIL][12] +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-tglb3/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing.html
    - shard-glk:          NOTRUN -> [FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-glk9/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing.html
    - shard-apl:          NOTRUN -> [FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-apl6/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing.html
    - shard-iclb:         NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-iclb1/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing.html
    - shard-kbl:          NOTRUN -> [FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-kbl4/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing.html
    - shard-hsw:          NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-hsw7/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing.html

  * igt@kms_atomic_transition@2x-modeset-transitions-fencing:
    - shard-hsw:          [PASS][18] -> [FAIL][19] +8 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-hsw5/igt@kms_atomic_transition@2x-modeset-transitions-fencing.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-hsw8/igt@kms_atomic_transition@2x-modeset-transitions-fencing.html

  * igt@kms_atomic_transition@2x-modeset-transitions-nonblocking-fencing:
    - shard-glk:          [PASS][20] -> [FAIL][21] +7 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-glk9/igt@kms_atomic_transition@2x-modeset-transitions-nonblocking-fencing.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-glk9/igt@kms_atomic_transition@2x-modeset-transitions-nonblocking-fencing.html

  
#### Warnings ####

  * igt@gem_eio@kms:
    - shard-snb:          [DMESG-WARN][22] ([i915#1982]) -> [FAIL][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-snb1/igt@gem_eio@kms.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-snb4/igt@gem_eio@kms.html

  
Known issues
------------

  Here are the changes found in IGTPW_4680_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@implicit-read-write@rcs0:
    - shard-snb:          [PASS][24] -> [INCOMPLETE][25] ([i915#82])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-snb1/igt@gem_exec_schedule@implicit-read-write@rcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-snb1/igt@gem_exec_schedule@implicit-read-write@rcs0.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [PASS][26] -> [INCOMPLETE][27] ([i915#1959])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl3/igt@gem_softpin@noreloc-s3.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-kbl6/igt@gem_softpin@noreloc-s3.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-snb:          [PASS][28] -> [TIMEOUT][29] ([i915#1958]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-snb6/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-snb4/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_addfb_basic@unused-pitches:
    - shard-kbl:          [PASS][30] -> [DMESG-WARN][31] ([i915#93] / [i915#95]) +33 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl2/igt@kms_addfb_basic@unused-pitches.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-kbl6/igt@kms_addfb_basic@unused-pitches.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [PASS][32] -> [DMESG-FAIL][33] ([i915#54] / [i915#95]) +3 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_legacy@all-pipes-forked-move:
    - shard-hsw:          [PASS][34] -> [TIMEOUT][35] ([i915#1958]) +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-hsw1/igt@kms_cursor_legacy@all-pipes-forked-move.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-hsw2/igt@kms_cursor_legacy@all-pipes-forked-move.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-apl:          [PASS][36] -> [DMESG-FAIL][37] ([i915#54] / [i915#95])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_flip@modeset-vs-vblank-race@a-dp1:
    - shard-kbl:          [PASS][38] -> [DMESG-WARN][39] ([i915#1982])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl2/igt@kms_flip@modeset-vs-vblank-race@a-dp1.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-kbl3/igt@kms_flip@modeset-vs-vblank-race@a-dp1.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-tglb:         [PASS][40] -> [DMESG-WARN][41] ([i915#1982]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][42] -> [SKIP][43] ([i915#433])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][44] -> [DMESG-WARN][45] ([i915#180]) +3 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-kbl2/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [PASS][46] -> [DMESG-FAIL][47] ([i915#95])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [PASS][48] -> [DMESG-FAIL][49] ([i915#95])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [PASS][50] -> [SKIP][51] ([fdo#109441])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-iclb4/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_vblank@pipe-b-wait-forked-busy:
    - shard-apl:          [PASS][52] -> [DMESG-WARN][53] ([i915#1982])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-apl6/igt@kms_vblank@pipe-b-wait-forked-busy.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-apl4/igt@kms_vblank@pipe-b-wait-forked-busy.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][54] -> [FAIL][55] ([i915#1542])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-iclb4/igt@perf@blocking-parameterized.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-iclb3/igt@perf@blocking-parameterized.html

  * igt@prime_mmap_kms@buffer-sharing:
    - shard-tglb:         [PASS][56] -> [DMESG-WARN][57] ([i915#402]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-tglb7/igt@prime_mmap_kms@buffer-sharing.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-tglb1/igt@prime_mmap_kms@buffer-sharing.html

  * igt@syncobj_wait@multi-wait-all-submitted-signaled:
    - shard-apl:          [PASS][58] -> [DMESG-WARN][59] ([i915#95]) +32 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-apl7/igt@syncobj_wait@multi-wait-all-submitted-signaled.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-apl6/igt@syncobj_wait@multi-wait-all-submitted-signaled.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd1:
    - shard-tglb:         [FAIL][60] ([i915#1528]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-tglb2/igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-tglb6/igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd1.html

  * igt@gem_exec_whisper@basic-contexts:
    - shard-iclb:         [DMESG-WARN][62] ([i915#1982]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-iclb2/igt@gem_exec_whisper@basic-contexts.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-iclb7/igt@gem_exec_whisper@basic-contexts.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-glk:          [DMESG-WARN][64] ([i915#118] / [i915#95]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-glk4/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-glk1/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_shrink@reclaim:
    - shard-hsw:          [SKIP][66] ([fdo#109271]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-hsw7/igt@gem_shrink@reclaim.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-hsw5/igt@gem_shrink@reclaim.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][68] ([i915#1899]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@debugfs-reader:
    - shard-tglb:         [INCOMPLETE][70] ([i915#1602] / [i915#456]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-tglb3/igt@i915_suspend@debugfs-reader.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-tglb3/igt@i915_suspend@debugfs-reader.html

  * igt@kms_addfb_basic@bad-pitch-128:
    - shard-snb:          [TIMEOUT][72] ([i915#1958]) -> [PASS][73] +4 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-snb6/igt@kms_addfb_basic@bad-pitch-128.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-snb2/igt@kms_addfb_basic@bad-pitch-128.html
    - shard-hsw:          [TIMEOUT][74] ([i915#1958]) -> [PASS][75] +4 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-hsw2/igt@kms_addfb_basic@bad-pitch-128.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-hsw8/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge:
    - shard-apl:          [DMESG-WARN][76] ([i915#95]) -> [PASS][77] +39 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-apl6/igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-apl8/igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled:
    - shard-kbl:          [DMESG-WARN][78] ([i915#93] / [i915#95]) -> [PASS][79] +42 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][80] ([i915#180]) -> [PASS][81] +6 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-apl:          [FAIL][82] ([i915#49]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
    - shard-kbl:          [FAIL][84] ([i915#49]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-tglb:         [DMESG-WARN][86] ([i915#1982]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][88] ([fdo#108145] / [i915#95]) -> [PASS][89] +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-apl:          [DMESG-FAIL][90] ([fdo#108145] / [i915#95]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][92] ([fdo#109441]) -> [PASS][93] +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][94] ([i915#31]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl7/igt@kms_setmode@basic.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-kbl6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-apl:          [INCOMPLETE][96] -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-apl6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@perf_pmu@module-unload:
    - shard-tglb:         [DMESG-WARN][98] ([i915#402]) -> [PASS][99] +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-tglb1/igt@perf_pmu@module-unload.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-tglb7/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][100] ([i915#1820] / [i915#93] / [i915#95]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl7/igt@perf_pmu@semaphore-busy@rcs0.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-kbl4/igt@perf_pmu@semaphore-busy@rcs0.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][102] ([i915#1899]) -> [SKIP][103] ([i915#468])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-tglb5/igt@i915_pm_dc@dc6-psr.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_color@pipe-a-degamma:
    - shard-apl:          [DMESG-WARN][104] ([i915#95]) -> [FAIL][105] ([fdo#108145] / [i915#71])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-apl1/igt@kms_color@pipe-a-degamma.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-apl6/igt@kms_color@pipe-a-degamma.html
    - shard-kbl:          [DMESG-WARN][106] ([i915#93] / [i915#95]) -> [FAIL][107] ([fdo#108145] / [i915#71])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl4/igt@kms_color@pipe-a-degamma.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-kbl6/igt@kms_color@pipe-a-degamma.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
    - shard-iclb:         [SKIP][108] ([fdo#109278] / [fdo#112010] / [i915#508]) -> [SKIP][109] ([fdo#109278] / [fdo#112010])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-iclb6/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-iclb6/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html

  * igt@kms_cursor_legacy@pipe-d-forked-bo:
    - shard-iclb:         [SKIP][110] ([fdo#109278] / [fdo#112010]) -> [SKIP][111] ([fdo#109278]) +4 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-iclb7/igt@kms_cursor_legacy@pipe-d-forked-bo.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-iclb6/igt@kms_cursor_legacy@pipe-d-forked-bo.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][112] ([i915#93] / [i915#95]) -> [DMESG-WARN][113] ([i915#180] / [i915#93] / [i915#95])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-snb:          [SKIP][114] ([fdo#109271]) -> [TIMEOUT][115] ([i915#1958]) +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-snb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
    - shard-hsw:          [SKIP][116] ([fdo#109271]) -> [TIMEOUT][117] ([i915#1958]) +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-hsw7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-hsw2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [DMESG-WARN][118] ([i915#93] / [i915#95]) -> [DMESG-WARN][119] ([i915#180])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-apl:          [DMESG-FAIL][120] ([i915#95]) -> [FAIL][121] ([i915#265])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
    - shard-kbl:          [DMESG-FAIL][122] ([i915#95]) -> [FAIL][123] ([i915#265])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         [SKIP][124] ([fdo#112025] / [fdo#112054]) -> [SKIP][125] ([fdo#112054])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-tglb:         [SKIP][126] ([fdo#111825] / [fdo#112015]) -> [SKIP][127] ([fdo#111825])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-tglb5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-tglb5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_sysfs_edid_timing:
    - shard-kbl:          [FAIL][128] ([IGT#2]) -> [DMESG-FAIL][129] ([IGT#2] / [i915#95])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl4/igt@kms_sysfs_edid_timing.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/shard-kbl2/igt@kms_sysfs_edid_timing.html

  
  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#112010]: https://bugs.freedesktop.org/show_bug.cgi?id=112010
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112025]: https://bugs.freedesktop.org/show_bug.cgi?id=112025
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1959]: https://gitlab.freedesktop.org/drm/intel/issues/1959
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#508]: https://gitlab.freedesktop.org/drm/intel/issues/508
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5712 -> IGTPW_4680

  CI-20190529: 20190529
  CI_DRM_8639: 47584e59cf51ec499d68a4cefbaf447448ce2894 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4680: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/index.html
  IGT_5712: eba1135ddd35f9d3097ed91032aefe8f9a9f9d02 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4680/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
