Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 10 Oct 2020 12:41:27 -0000
Message-ID: <160233368791.25006.8064290195775832953@emeril.freedesktop.org>
References: <20201010090701.1772297-1-apoorva1.singh@intel.com>
In-Reply-To: <20201010090701.1772297-1-apoorva1.singh@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Ffreq=3A_Added_sub-test_description?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1286104975=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1286104975==
Content-Type: multipart/alternative;
 boundary="===============6936809680079180774=="

--===============6936809680079180774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_ctx_freq: Added sub-test description
URL   : https://patchwork.freedesktop.org/series/82536/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5808_full -> IGTPW_5054_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5054_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5054_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5054_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_render_linear_blits@basic:
    - shard-snb:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-snb6/igt@gem_render_linear_blits@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-snb6/igt@gem_render_linear_blits@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_5054_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_engines@execute-oneforall:
    - shard-snb:          [PASS][3] -> [FAIL][4] ([i915#2541]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-snb4/igt@gem_ctx_engines@execute-oneforall.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-snb6/igt@gem_ctx_engines@execute-oneforall.html

  * igt@gem_ctx_param@non-root-set-no-zeromap:
    - shard-apl:          [PASS][5] -> [FAIL][6] ([i915#1635] / [i915#2541]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl4/igt@gem_ctx_param@non-root-set-no-zeromap.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-apl6/igt@gem_ctx_param@non-root-set-no-zeromap.html
    - shard-iclb:         [PASS][7] -> [FAIL][8] ([i915#2541]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb4/igt@gem_ctx_param@non-root-set-no-zeromap.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-iclb7/igt@gem_ctx_param@non-root-set-no-zeromap.html
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#2541]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk7/igt@gem_ctx_param@non-root-set-no-zeromap.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-glk2/igt@gem_ctx_param@non-root-set-no-zeromap.html
    - shard-hsw:          [PASS][11] -> [FAIL][12] ([i915#2541])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw2/igt@gem_ctx_param@non-root-set-no-zeromap.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-hsw4/igt@gem_ctx_param@non-root-set-no-zeromap.html
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#2541]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl6/igt@gem_ctx_param@non-root-set-no-zeromap.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-kbl1/igt@gem_ctx_param@non-root-set-no-zeromap.html
    - shard-tglb:         [PASS][15] -> [FAIL][16] ([i915#2541]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-tglb1/igt@gem_ctx_param@non-root-set-no-zeromap.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-tglb1/igt@gem_ctx_param@non-root-set-no-zeromap.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1436] / [i915#716])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl1/igt@gen9_exec_parse@allowed-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-kbl6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [PASS][19] -> [WARN][20] ([i915#1519])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_color@pipe-b-ctm-max:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#165] / [i915#78])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl1/igt@kms_color@pipe-b-ctm-max.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-kbl2/igt@kms_color@pipe-b-ctm-max.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-snb:          [PASS][25] -> [FAIL][26] ([i915#2546])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-glk:          [PASS][27] -> [DMESG-WARN][28] ([i915#1982]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +4 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-tglb:         [PASS][31] -> [DMESG-WARN][32] ([i915#1982]) +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-tglb1/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-tglb5/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [PASS][33] -> [INCOMPLETE][34] ([i915#155])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-iclb1/igt@kms_psr@psr2_sprite_render.html

  * igt@perf@buffer-fill:
    - shard-hsw:          [PASS][37] -> [SKIP][38] ([fdo#109271]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw1/igt@perf@buffer-fill.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-hsw4/igt@perf@buffer-fill.html
    - shard-kbl:          [PASS][39] -> [SKIP][40] ([fdo#109271] / [i915#1354]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl1/igt@perf@buffer-fill.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-kbl1/igt@perf@buffer-fill.html
    - shard-tglb:         [PASS][41] -> [SKIP][42] ([i915#1354]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-tglb3/igt@perf@buffer-fill.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-tglb1/igt@perf@buffer-fill.html
    - shard-apl:          [PASS][43] -> [SKIP][44] ([fdo#109271] / [i915#1354] / [i915#1635]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl3/igt@perf@buffer-fill.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-apl6/igt@perf@buffer-fill.html
    - shard-glk:          [PASS][45] -> [SKIP][46] ([fdo#109271] / [i915#1354]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk1/igt@perf@buffer-fill.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-glk2/igt@perf@buffer-fill.html

  * igt@perf@global-sseu-config:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([i915#1354]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb4/igt@perf@global-sseu-config.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-iclb7/igt@perf@global-sseu-config.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][49] ([i915#658]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb5/igt@feature_discovery@psr2.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_ctx_engines@libapi:
    - shard-hsw:          [FAIL][51] ([i915#2541]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw4/igt@gem_ctx_engines@libapi.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-hsw2/igt@gem_ctx_engines@libapi.html
    - shard-iclb:         [FAIL][53] ([i915#2541]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb6/igt@gem_ctx_engines@libapi.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-iclb5/igt@gem_ctx_engines@libapi.html
    - shard-apl:          [FAIL][55] ([i915#1635] / [i915#2541]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl1/igt@gem_ctx_engines@libapi.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-apl2/igt@gem_ctx_engines@libapi.html
    - shard-glk:          [FAIL][57] ([i915#2541]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk1/igt@gem_ctx_engines@libapi.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-glk8/igt@gem_ctx_engines@libapi.html
    - shard-tglb:         [FAIL][59] ([i915#2541]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-tglb5/igt@gem_ctx_engines@libapi.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-tglb2/igt@gem_ctx_engines@libapi.html
    - shard-snb:          [FAIL][61] ([i915#2541]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-snb4/igt@gem_ctx_engines@libapi.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-snb5/igt@gem_ctx_engines@libapi.html

  * {igt@gem_exec_capture@pi@vcs0}:
    - shard-glk:          [INCOMPLETE][63] ([i915#2553]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk5/igt@gem_exec_capture@pi@vcs0.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-glk6/igt@gem_exec_capture@pi@vcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [FAIL][65] ([i915#1635] / [i915#2389]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-apl4/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@vecs0:
    - shard-glk:          [FAIL][67] ([i915#2389]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk2/igt@gem_exec_reloc@basic-many-active@vecs0.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-glk5/igt@gem_exec_reloc@basic-many-active@vecs0.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-glk:          [DMESG-WARN][69] ([i915#118] / [i915#95]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk6/igt@gem_exec_whisper@basic-fds-priority.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-glk8/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-hsw:          [WARN][71] ([i915#1519]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw2/igt@i915_pm_rc6_residency@rc6-fence.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-hsw4/igt@i915_pm_rc6_residency@rc6-fence.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-glk:          [FAIL][73] ([i915#2521]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk4/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-glk8/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-apl:          [DMESG-WARN][75] ([i915#1635] / [i915#1982]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-apl2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][77] -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw4/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-hsw2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +4 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-tglb:         [DMESG-WARN][81] ([i915#1982]) -> [PASS][82] +7 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-iclb:         [DMESG-WARN][83] ([i915#1982]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-iclb7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][85] ([fdo#109642] / [fdo#111068]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb5/igt@kms_psr2_su@page_flip.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][87] ([fdo#109441]) -> [PASS][88] +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][89] ([i915#1635] / [i915#31]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl2/igt@kms_setmode@basic.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-apl6/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - shard-kbl:          [DMESG-WARN][91] ([i915#1982]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl1/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-kbl4/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  * igt@perf_pmu@module-unload:
    - shard-tglb:         [SKIP][93] -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-tglb5/igt@perf_pmu@module-unload.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-tglb6/igt@perf_pmu@module-unload.html
    - shard-snb:          [SKIP][95] ([fdo#109271]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-snb4/igt@perf_pmu@module-unload.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-snb6/igt@perf_pmu@module-unload.html
    - shard-hsw:          [SKIP][97] ([fdo#109271]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw4/igt@perf_pmu@module-unload.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-hsw1/igt@perf_pmu@module-unload.html
    - shard-kbl:          [SKIP][99] ([fdo#109271]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl4/igt@perf_pmu@module-unload.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-kbl2/igt@perf_pmu@module-unload.html
    - shard-apl:          [SKIP][101] ([fdo#109271] / [i915#1635]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl1/igt@perf_pmu@module-unload.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-apl3/igt@perf_pmu@module-unload.html
    - shard-iclb:         [SKIP][103] -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb6/igt@perf_pmu@module-unload.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-iclb1/igt@perf_pmu@module-unload.html
    - shard-glk:          [SKIP][105] ([fdo#109271]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk1/igt@perf_pmu@module-unload.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-glk7/igt@perf_pmu@module-unload.html

  * igt@testdisplay:
    - shard-apl:          [TIMEOUT][107] ([i915#1635] / [i915#1692]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl3/igt@testdisplay.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-apl1/igt@testdisplay.html
    - shard-kbl:          [TIMEOUT][109] ([i915#1692]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl1/igt@testdisplay.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-kbl6/igt@testdisplay.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][111] ([i915#1319] / [i915#1635]) -> [FAIL][112] ([fdo#110321] / [fdo#110336] / [i915#1635])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl1/igt@kms_content_protection@atomic.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-apl6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [TIMEOUT][113] ([i915#1319] / [i915#1635]) -> [FAIL][114] ([fdo#110321] / [i915#1635])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl4/igt@kms_content_protection@srm.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-apl3/igt@kms_content_protection@srm.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1692]: https://gitlab.freedesktop.org/drm/intel/issues/1692
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2541]: https://gitlab.freedesktop.org/drm/intel/issues/2541
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2553]: https://gitlab.freedesktop.org/drm/intel/issues/2553
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5808 -> IGTPW_5054

  CI-20190529: 20190529
  CI_DRM_9124: 4e10e11b944de6a42e8dbad1f750adaa290c4646 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5054: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/index.html
  IGT_5808: f7d1ac8c479f7049bdd900df8d17c2fa6efdcaf6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/index.html

--===============6936809680079180774==
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
<tr><td><b>Series:</b></td><td>i915/gem_ctx_freq: Added sub-test description</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82536/">https://patchwork.freedesktop.org/series/82536/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5808_full -&gt; IGTPW_5054_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5054_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5054_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5054_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_render_linear_blits@basic:<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-snb6/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-snb6/igt@gem_render_linear_blits@basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5054_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_engines@execute-oneforall:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-snb4/igt@gem_ctx_engines@execute-oneforall.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-snb6/igt@gem_ctx_engines@execute-oneforall.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@non-root-set-no-zeromap:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl4/igt@gem_ctx_param@non-root-set-no-zeromap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-apl6/igt@gem_ctx_param@non-root-set-no-zeromap.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb4/igt@gem_ctx_param@non-root-set-no-zeromap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-iclb7/igt@gem_ctx_param@non-root-set-no-zeromap.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk7/igt@gem_ctx_param@non-root-set-no-zeromap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-glk2/igt@gem_ctx_param@non-root-set-no-zeromap.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw2/igt@gem_ctx_param@non-root-set-no-zeromap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-hsw4/igt@gem_ctx_param@non-root-set-no-zeromap.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl6/igt@gem_ctx_param@non-root-set-no-zeromap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-kbl1/igt@gem_ctx_param@non-root-set-no-zeromap.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-tglb1/igt@gem_ctx_param@non-root-set-no-zeromap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-tglb1/igt@gem_ctx_param@non-root-set-no-zeromap.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl1/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-kbl6/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-max:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl1/igt@kms_color@pipe-b-ctm-max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-kbl2/igt@kms_color@pipe-b-ctm-max.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-tglb1/igt@kms_frontbuffer_tracking@psr-slowdraw.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-tglb5/igt@kms_frontbuffer_tracking@psr-slowdraw.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb2/igt@kms_psr@psr2_sprite_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-iclb1/igt@kms_psr@psr2_sprite_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@buffer-fill:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw1/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-hsw4/igt@perf@buffer-fill.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl1/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-kbl1/igt@perf@buffer-fill.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-tglb3/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-tglb1/igt@perf@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl3/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-apl6/igt@perf@buffer-fill.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk1/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-glk2/igt@perf@buffer-fill.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb4/igt@perf@global-sseu-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-iclb7/igt@perf@global-sseu-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb5/igt@feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@libapi:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw4/igt@gem_ctx_engines@libapi.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-hsw2/igt@gem_ctx_engines@libapi.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb6/igt@gem_ctx_engines@libapi.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-iclb5/igt@gem_ctx_engines@libapi.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl1/igt@gem_ctx_engines@libapi.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-apl2/igt@gem_ctx_engines@libapi.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk1/igt@gem_ctx_engines@libapi.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-glk8/igt@gem_ctx_engines@libapi.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-tglb5/igt@gem_ctx_engines@libapi.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-tglb2/igt@gem_ctx_engines@libapi.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-snb4/igt@gem_ctx_engines@libapi.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-snb5/igt@gem_ctx_engines@libapi.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_capture@pi@vcs0}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk5/igt@gem_exec_capture@pi@vcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2553">i915#2553</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-glk6/igt@gem_exec_capture@pi@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-apl4/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk2/igt@gem_exec_reloc@basic-many-active@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-glk5/igt@gem_exec_reloc@basic-many-active@vecs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk6/igt@gem_exec_whisper@basic-fds-priority.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-glk8/igt@gem_exec_whisper@basic-fds-priority.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-hsw4/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk4/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-glk8/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-apl2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw4/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-hsw2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-iclb7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb5/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl2/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-apl6/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl1/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-kbl4/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-tglb5/igt@perf_pmu@module-unload.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-tglb6/igt@perf_pmu@module-unload.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-snb4/igt@perf_pmu@module-unload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-snb6/igt@perf_pmu@module-unload.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw4/igt@perf_pmu@module-unload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-hsw1/igt@perf_pmu@module-unload.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl4/igt@perf_pmu@module-unload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-kbl2/igt@perf_pmu@module-unload.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl1/igt@perf_pmu@module-unload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-apl3/igt@perf_pmu@module-unload.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb6/igt@perf_pmu@module-unload.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-iclb1/igt@perf_pmu@module-unload.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk1/igt@perf_pmu@module-unload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-glk7/igt@perf_pmu@module-unload.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl3/igt@testdisplay.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1692">i915#1692</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-apl1/igt@testdisplay.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl1/igt@testdisplay.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1692">i915#1692</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-kbl6/igt@testdisplay.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl1/igt@kms_content_protection@atomic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-apl6/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=110336">fdo#110336</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl4/igt@kms_content_protection@srm.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/shard-apl3/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
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
<li>IGT: IGT_5808 -&gt; IGTPW_5054</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9124: 4e10e11b944de6a42e8dbad1f750adaa290c4646 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5054: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5054/index.html<br />
  IGT_5808: f7d1ac8c479f7049bdd900df8d17c2fa6efdcaf6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============6936809680079180774==--

--===============1286104975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1286104975==--
