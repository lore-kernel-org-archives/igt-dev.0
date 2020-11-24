Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 24 Nov 2020 01:37:15 -0000
Message-ID: <160618183515.10859.12333928606180450698@emeril.freedesktop.org>
References: <20201123201525.3991343-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201123201525.3991343-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Frequest=5Fretire=3A_Switch_from_random_blitter_loads_to_du?=
 =?utf-8?q?mmy?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1856592794=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1856592794==
Content-Type: multipart/alternative;
 boundary="===============0871476525339054030=="

--===============0871476525339054030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_request_retire: Switch from random blitter loads to dummy
URL   : https://patchwork.freedesktop.org/series/84185/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9378_full -> IGTPW_5211_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5211_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5211_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5211_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
Known issues
------------

  Here are the changes found in IGTPW_5211_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-hsw:          [PASS][3] -> [FAIL][4] ([i915#2389])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-hsw1/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-hsw:          [PASS][5] -> [INCOMPLETE][6] ([i915#2637]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-hsw6/igt@gem_exec_suspend@basic-s0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-hsw6/igt@gem_exec_suspend@basic-s0.html
    - shard-iclb:         [PASS][7] -> [INCOMPLETE][8] ([i915#1090] / [i915#1185])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-iclb6/igt@gem_exec_suspend@basic-s0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-iclb3/igt@gem_exec_suspend@basic-s0.html
    - shard-glk:          [PASS][9] -> [INCOMPLETE][10] ([i915#2635])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-glk3/igt@gem_exec_suspend@basic-s0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-glk2/igt@gem_exec_suspend@basic-s0.html
    - shard-apl:          [PASS][11] -> [INCOMPLETE][12] ([i915#1635] / [i915#2635])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-apl6/igt@gem_exec_suspend@basic-s0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-apl8/igt@gem_exec_suspend@basic-s0.html
    - shard-kbl:          [PASS][13] -> [INCOMPLETE][14] ([i915#155])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-kbl7/igt@gem_exec_suspend@basic-s0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-kbl3/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [PASS][15] -> [WARN][16] ([i915#1519])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#1635] / [i915#54])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#54])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge:
    - shard-hsw:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-hsw2/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-hsw1/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#1635] / [i915#1982]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-apl2/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-apl3/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-tglb:         [PASS][25] -> [FAIL][26] ([i915#2346])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-glk:          [PASS][27] -> [DMESG-WARN][28] ([i915#1982]) +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-glk6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-glk5/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#2122])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-glk5/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-glk5/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][31] -> [FAIL][32] ([i915#2598])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [PASS][33] -> [INCOMPLETE][34] ([i915#2295])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#1982]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-tglb:         [PASS][37] -> [DMESG-WARN][38] ([i915#1982]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#180])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109441]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-glk:          [PASS][43] -> [DMESG-WARN][44] ([i915#2635])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-glk5/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-glk8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
    - shard-apl:          [PASS][45] -> [DMESG-WARN][46] ([i915#1635] / [i915#2635])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
    - shard-iclb:         [PASS][47] -> [INCOMPLETE][48] ([fdo#111764] / [i915#1078] / [i915#1185])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-iclb4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-iclb1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-contexts-all:
    - shard-glk:          [DMESG-WARN][49] ([i915#118] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-glk4/igt@gem_exec_whisper@basic-contexts-all.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-glk9/igt@gem_exec_whisper@basic-contexts-all.html

  * igt@gem_softpin@noreloc-s3:
    - shard-iclb:         [INCOMPLETE][51] ([i915#1373] / [i915#2405]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-iclb1/igt@gem_softpin@noreloc-s3.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-iclb7/igt@gem_softpin@noreloc-s3.html
    - shard-apl:          [INCOMPLETE][53] ([i915#1635] / [i915#2405] / [i915#2635]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-apl1/igt@gem_softpin@noreloc-s3.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-apl8/igt@gem_softpin@noreloc-s3.html
    - shard-glk:          [INCOMPLETE][55] ([i915#2199] / [i915#2405] / [i915#2635]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-glk9/igt@gem_softpin@noreloc-s3.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-glk1/igt@gem_softpin@noreloc-s3.html
    - shard-hsw:          [INCOMPLETE][57] ([i915#2405] / [i915#2637]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-hsw4/igt@gem_softpin@noreloc-s3.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-hsw4/igt@gem_softpin@noreloc-s3.html
    - shard-kbl:          [INCOMPLETE][59] ([i915#2405]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-kbl4/igt@gem_softpin@noreloc-s3.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-kbl3/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-hsw:          [WARN][61] ([i915#1519]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-hsw2/igt@i915_pm_rc6_residency@rc6-fence.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-hsw4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-kbl:          [SKIP][63] ([fdo#109271]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-kbl4/igt@i915_pm_rpm@drm-resources-equal.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-kbl4/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-iclb:         [SKIP][65] ([i915#579]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-iclb2/igt@i915_pm_rpm@drm-resources-equal.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-iclb6/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-hsw:          [SKIP][67] ([fdo#109271]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-hsw6/igt@i915_pm_rpm@gem-execbuf.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-hsw4/igt@i915_pm_rpm@gem-execbuf.html
    - shard-apl:          [SKIP][69] ([fdo#109271] / [i915#1635]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-apl6/igt@i915_pm_rpm@gem-execbuf.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-apl8/igt@i915_pm_rpm@gem-execbuf.html
    - shard-glk:          [SKIP][71] ([fdo#109271]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-glk4/igt@i915_pm_rpm@gem-execbuf.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-glk7/igt@i915_pm_rpm@gem-execbuf.html

  * {igt@kms_async_flips@alternate-sync-async-flip}:
    - shard-tglb:         [FAIL][73] ([i915#2521]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-tglb5/igt@kms_async_flips@alternate-sync-async-flip.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-tglb6/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-kbl:          [DMESG-WARN][75] ([i915#1982]) -> [PASS][76] +5 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-kbl3/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-kbl6/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-iclb:         [INCOMPLETE][77] ([i915#1185] / [i915#2295]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-apl:          [DMESG-WARN][79] ([i915#1635] / [i915#1982]) -> [PASS][80] +4 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-apl6/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-apl2/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [DMESG-WARN][81] ([i915#1982]) -> [PASS][82] +6 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-glk3/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a1-hdmi-a2.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-glk1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:
    - shard-glk:          [FAIL][83] ([i915#79]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-iclb:         [DMESG-WARN][85] ([i915#1982]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-tglb:         [DMESG-WARN][87] ([i915#1982]) -> [PASS][88] +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_prop_blob@blob-prop-validate:
    - shard-hsw:          [DMESG-WARN][89] ([i915#1982]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-hsw6/igt@kms_prop_blob@blob-prop-validate.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-hsw1/igt@kms_prop_blob@blob-prop-validate.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][91] ([fdo#109441]) -> [PASS][92] +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-iclb4/igt@kms_psr@psr2_suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-iclb2/igt@kms_psr@psr2_suspend.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s0:
    - shard-tglb:         [DMESG-WARN][93] ([i915#2411]) -> [INCOMPLETE][94] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411] / [i915#456])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-tglb7/igt@gem_exec_suspend@basic-s0.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-tglb1/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_softpin@noreloc-s3:
    - shard-tglb:         [DMESG-WARN][95] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -> [DMESG-WARN][96] ([i915#2411])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-tglb7/igt@gem_softpin@noreloc-s3.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-tglb1/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][97] ([i915#1804] / [i915#2684]) -> [WARN][98] ([i915#2681] / [i915#2684])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][99] -> [WARN][100] ([i915#2681])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-tglb:         [SKIP][101] ([i915#579]) -> [DMESG-WARN][102] ([i915#2411]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-tglb8/igt@i915_pm_rpm@gem-execbuf.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-tglb8/igt@i915_pm_rpm@gem-execbuf.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-apl:          [DMESG-FAIL][103] ([fdo#108145] / [i915#1635] / [i915#1982]) -> [FAIL][104] ([fdo#108145] / [i915#1635] / [i915#265])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-tglb:         [DMESG-WARN][105] ([i915#2411]) -> [INCOMPLETE][106] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-tglb5/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][107], [FAIL][108]) ([i915#2295] / [i915#483]) -> ([FAIL][109], [FAIL][110]) ([i915#1814] / [i915#2295] / [i915#483] / [i915#602])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-kbl1/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-kbl4/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-kbl7/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-kbl3/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][111], [FAIL][112]) ([i915#2295] / [i915#483]) -> ([FAIL][113], [FAIL][114]) ([i915#1814] / [i915#2295] / [i915#483])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-iclb1/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-iclb2/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-iclb3/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-iclb1/igt@runner@aborted.html
    - shard-apl:          ([FAIL][115], [FAIL][116]) ([i915#1635] / [i915#2295]) -> ([FAIL][117], [FAIL][118]) ([i915#1635] / [i915#1814] / [i915#2295])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-apl2/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-apl1/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-apl1/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-apl8/igt@runner@aborted.html
    - shard-glk:          ([FAIL][119], [FAIL][120], [FAIL][121]) ([i915#1814] / [i915#2295] / [i915#483] / [i915#86] / [k.org#202321]) -> ([FAIL][122], [FAIL][123]) ([i915#1814] / [i915#2295] / [k.org#202321])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-glk3/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-glk8/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-glk9/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-glk2/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-glk8/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][124], [FAIL][125]) ([i915#2295]) -> ([FAIL][126], [FAIL][127]) ([i915#1602] / [i915#2295])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-tglb7/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-tglb2/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-tglb5/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-tglb1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [i915#1078]: https://gitlab.freedesktop.org/drm/intel/issues/1078
  [i915#1090]: https://gitlab.freedesktop.org/drm/intel/issues/1090
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1373]: https://gitlab.freedesktop.org/drm/intel/issues/1373
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2199]: https://gitlab.freedesktop.org/drm/intel/issues/2199
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#602]: https://gitlab.freedesktop.org/drm/intel/issues/602
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#86]: https://gitlab.freedesktop.org/drm/intel/issues/86
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5868 -> IGTPW_5211
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9378: efc7f880143d6fe75922ad393045665c8ea60f57 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5211: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/index.html
  IGT_5868: 36b5fc05c30dbfd9242069fd6e51ebb419b386bc @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/index.html

--===============0871476525339054030==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>i915/gem_request_retire: Switch from random =
blitter loads to dummy</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84185/">https://patchwork.freedesktop.org/series/84185/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5211/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5211/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9378_full -&gt; IGTPW_5211_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5211_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5211_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5211=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_vblank@pipe-c-ts-continuation-suspend:<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
211/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-WA=
RN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5211_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/=
shard-hsw1/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9378/shard-hsw6/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-hsw6/ig=
t@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2637">i915#2637</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9378/shard-iclb6/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-iclb3/=
igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1090">i915#1090</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9378/shard-glk3/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-glk2/ig=
t@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9378/shard-apl6/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-apl8/ig=
t@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9378/shard-kbl7/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-kbl3/ig=
t@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/155">i915#155</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-h=
sw1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9378/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
211/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#16=
35</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i91=
5#54</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9378/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
211/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</=
a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-hsw2/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5211/shard-hsw1/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-apl2/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5211/shard-apl3/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5211/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">i9=
15#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-glk6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-unti=
led.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5211/shard-glk5/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-unti=
led.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-glk5/igt@kms_flip@2x-plain-flip-ts-check-interruptible@a=
b-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5211/shard-glk5/igt@kms_flip@2x-plain-flip-ts-check-i=
nterruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_521=
1/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2598">i915#2598</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a=
1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5211/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-sh=
rfb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5211/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-offscr=
en-pri-shrfb-draw-blt.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-s=
hrfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5211/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p=
-primscrn-pri-shrfb-draw-mmap-gtt.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5211/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i=
915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-ic=
lb8/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9378/shard-glk5/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
11/shard-glk8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i91=
5#2635</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9378/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
11/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i91=
5#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/263=
5">i915#2635</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9378/shard-iclb4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
211/shard-iclb1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">INCOMPL=
ETE</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111764">=
fdo#111764</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1078">i915#1078</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1185">i915#1185</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-contexts-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-glk4/igt@gem_exec_whisper@basic-contexts-all.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">=
i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/9=
5">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5211/shard-glk9/igt@gem_exec_whisper@basic-contexts-all.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9378/shard-iclb1/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2=
405</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
11/shard-iclb7/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9378/shard-apl1/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#24=
05</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i=
915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5211/shard-apl8/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9378/shard-glk9/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2199">i915#2199</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#24=
05</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i=
915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5211/shard-glk1/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9378/shard-hsw4/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#26=
37</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_521=
1/shard-hsw4/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9378/shard-kbl4/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shar=
d-kbl3/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-hsw2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/=
shard-hsw4/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@drm-resources-equal:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9378/shard-kbl4/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10927=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211=
/shard-kbl4/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> +1 similar i=
ssue</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9378/shard-iclb2/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/sh=
ard-iclb6/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> +1 similar iss=
ue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9378/shard-hsw6/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-=
hsw4/igt@i915_pm_rpm@gem-execbuf.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9378/shard-apl6/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/=
shard-apl8/igt@i915_pm_rpm@gem-execbuf.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9378/shard-glk4/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-=
glk7/igt@i915_pm_rpm@gem-execbuf.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@alternate-sync-async-flip}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-tglb5/igt@kms_async_flips@alternate-sync-async-flip.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2521=
">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5211/shard-tglb6/igt@kms_async_flips@alternate-sync-async-flip.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-kbl3/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982"=
>i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5211/shard-kbl6/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">PASS</a>=
 +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118=
5">i915#1185</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2295">i915#2295</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5211/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-suspend.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-apl6/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5211/shard-apl2/igt@kms_draw_crc@draw-method-rgb565-pw=
rite-ytiled.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@=
ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-glk3/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-m=
odeset-interruptible@ab-hdmi-a1-hdmi-a2.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-glk1/igt=
@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdm=
i-a1-hdmi-a2.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i=
915#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5211/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cu=
r-indfb-draw-pwrite.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-iclb3/igt@kms_frontbuffer_tr=
acking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-sp=
r-indfb-draw-blt.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-tglb5/igt@kms_frontbuffer_track=
ing@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">PASS</a> +2 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@blob-prop-validate:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-hsw6/igt@kms_prop_blob@blob-prop-validate.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i9=
15#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5211/shard-hsw1/igt@kms_prop_blob@blob-prop-validate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-iclb4/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-=
iclb2/igt@kms_psr@psr2_suspend.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-tglb7/igt@gem_exec_suspend@basic-s0.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#241=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211=
/shard-tglb1/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#188=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i9=
15#2411</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/45=
6">i915#456</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-tglb7/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#=
1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1887"=
>i915#1887</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5211/shard-tglb1/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#241=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#180=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i9=
15#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5211/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#268=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-=
iclb8/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-tglb8/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-tgl=
b8/igt@i915_pm_rpm@gem-execbuf.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) +1 similar issue<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">D=
MESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
8145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5211/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alp=
ha-7efc.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5211/shard-tglb5/igt@kms_vblank@pipe-c-ts-continuation-suspend.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1798">i915#1798</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1982">i915#1982</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/456">i915#456</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-kbl4/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/483">i915#483</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5211/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-kbl3/igt@ru=
nner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/483">i915#483</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/602">i915#602</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-iclb2/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/483">i915#483</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5211/shard-iclb3/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-iclb1/ig=
t@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-apl1/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5211/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-apl8/igt@=
runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/2295">i915#2295</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-glk3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-glk8/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9378/shard-glk9/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/86">i915#86</a> / <=
a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#20232=
1</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_521=
1/shard-glk2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_5211/shard-glk8/igt@runner@aborted.html">FAI=
L</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i9=
15#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/22=
95">i915#2295</a> / <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=
=3D202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9378/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9378/shard-tglb2/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5211/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/shard-tglb1/igt@ru=
nner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/2295">i915#2295</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5868 -&gt; IGTPW_5211</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9378: efc7f880143d6fe75922ad393045665c8ea60f57 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5211: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5211/index.htm=
l<br />
  IGT_5868: 36b5fc05c30dbfd9242069fd6e51ebb419b386bc @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============0871476525339054030==--

--===============1856592794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1856592794==--
