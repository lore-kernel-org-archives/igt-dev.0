Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 20 Dec 2019 07:27:01 -0000
Message-ID: <157682682126.9212.13144385665134520787@emeril.freedesktop.org>
References: <20191218193915.1375365-1-vanshidhar.r.konda@intel.com>
In-Reply-To: <20191218193915.1375365-1-vanshidhar.r.konda@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgUHJlcGFy?=
 =?utf-8?q?e_IGT_display_test_for_removal_of_=28rev2=29?=
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
To: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Prepare IGT display test for removal of (rev2)
URL   : https://patchwork.freedesktop.org/series/71083/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7599_full -> IGTPW_3878_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3878_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3878_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3878_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-kbl:          NOTRUN -> [FAIL][1] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-kbl4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-apl:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-apl4/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_plane@pixel-format-pipe-a-planes:
    - shard-iclb:         [PASS][3] -> [FAIL][4] +7 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-iclb3/igt@kms_plane@pixel-format-pipe-a-planes.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-iclb3/igt@kms_plane@pixel-format-pipe-a-planes.html

  * igt@kms_plane@pixel-format-pipe-b-planes:
    - shard-kbl:          [PASS][5] -> [FAIL][6] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-kbl3/igt@kms_plane@pixel-format-pipe-b-planes.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-kbl1/igt@kms_plane@pixel-format-pipe-b-planes.html

  * igt@kms_plane@pixel-format-pipe-c-planes:
    - shard-apl:          [PASS][7] -> [FAIL][8] +7 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-apl6/igt@kms_plane@pixel-format-pipe-c-planes.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-apl3/igt@kms_plane@pixel-format-pipe-c-planes.html
    - shard-glk:          [PASS][9] -> [FAIL][10] +7 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-glk4/igt@kms_plane@pixel-format-pipe-c-planes.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-glk7/igt@kms_plane@pixel-format-pipe-c-planes.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-pixel-format:
    - shard-iclb:         NOTRUN -> [FAIL][11] +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-iclb5/igt@kms_plane_scaling@pipe-a-scaler-with-pixel-format.html

  * igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping:
    - shard-tglb:         [PASS][12] -> [FAIL][13] +4 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-tglb3/igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-tglb5/igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping.html

  * igt@kms_plane_scaling@pipe-d-scaler-with-clipping-clamping:
    - shard-tglb:         NOTRUN -> [FAIL][14] +5 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-tglb7/igt@kms_plane_scaling@pipe-d-scaler-with-clipping-clamping.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-kbl:          [SKIP][15] ([fdo#109271]) -> [FAIL][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-kbl4/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-kbl1/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
    - shard-glk:          [SKIP][17] ([fdo#109271]) -> [FAIL][18] +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-glk7/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-glk9/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-apl:          [SKIP][19] ([fdo#109271]) -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-apl1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-apl6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
    - shard-tglb:         [SKIP][21] ([fdo#111614]) -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-tglb4/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-tglb3/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  
Known issues
------------

  Here are the changes found in IGTPW_3878_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@q-smoketest-bsd1:
    - shard-tglb:         [PASS][23] -> [INCOMPLETE][24] ([fdo#111735])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-tglb9/igt@gem_ctx_shared@q-smoketest-bsd1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-tglb9/igt@gem_ctx_shared@q-smoketest-bsd1.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-iclb:         [PASS][25] -> [TIMEOUT][26] ([i915#530])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-iclb5/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-iclb3/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#644])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-apl3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [PASS][29] -> [DMESG-WARN][30] ([fdo#111870]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-snb1/igt@gem_userptr_blits@sync-unmap-cycles.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-tglb:         [PASS][31] -> [INCOMPLETE][32] ([i915#435] / [i915#460])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-tglb5/igt@i915_pm_rpm@system-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-tglb5/igt@i915_pm_rpm@system-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-offscreen:
    - shard-hsw:          [PASS][33] -> [DMESG-WARN][34] ([IGT#6])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-hsw7/igt@kms_cursor_crc@pipe-c-cursor-64x64-offscreen.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-hsw6/igt@kms_cursor_crc@pipe-c-cursor-64x64-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#79])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-apl3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-iclb:         [PASS][39] -> [INCOMPLETE][40] ([i915#123] / [i915#140])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-tglb:         [PASS][41] -> [INCOMPLETE][42] ([i915#456] / [i915#460]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-tglb9/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-tglb5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_universal_plane@universal-plane-pipe-a-functional:
    - shard-kbl:          [PASS][43] -> [FAIL][44] ([i915#331])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-kbl1/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-kbl4/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
    - shard-apl:          [PASS][45] -> [FAIL][46] ([i915#331])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-apl6/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-apl8/igt@kms_universal_plane@universal-plane-pipe-a-functional.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][47] -> [DMESG-WARN][48] ([i915#180]) +7 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-kbl3/igt@gem_ctx_isolation@rcs0-s3.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-kbl3/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_isolation@vecs0-s3:
    - shard-tglb:         [INCOMPLETE][51] ([i915#456]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-tglb1/igt@gem_ctx_isolation@vecs0-s3.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-tglb5/igt@gem_ctx_isolation@vecs0-s3.html

  * igt@gem_exec_create@forked:
    - shard-tglb:         [INCOMPLETE][53] ([fdo#108838] / [i915#435]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-tglb5/igt@gem_exec_create@forked.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-tglb2/igt@gem_exec_create@forked.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-snb:          [TIMEOUT][55] ([i915#530]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-snb5/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-snb6/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_persistent_relocs@interruptible:
    - shard-snb:          [DMESG-WARN][57] ([i915#478]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-snb1/igt@gem_persistent_relocs@interruptible.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-snb6/igt@gem_persistent_relocs@interruptible.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [DMESG-WARN][59] ([fdo#111870]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-snb7/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * {igt@gen9_exec_parse@allowed-single}:
    - shard-apl:          [DMESG-WARN][61] ([i915#716]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-apl3/igt@gen9_exec_parse@allowed-single.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-apl2/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
    - shard-apl:          [FAIL][65] ([i915#54]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding:
    - shard-hsw:          [DMESG-WARN][67] ([IGT#6]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-hsw6/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-hsw4/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite:
    - shard-tglb:         [FAIL][69] ([i915#49]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-tglb4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-apl:          [FAIL][71] ([i915#49]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-iclb:         [INCOMPLETE][73] ([i915#123] / [i915#140]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-iclb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-iclb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-tglb:         [INCOMPLETE][75] ([i915#456] / [i915#460]) -> [PASS][76] +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-tglb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-tglb9/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][77] ([i915#31]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-apl1/igt@kms_setmode@basic.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-apl8/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs2-nonpriv-switch:
    - shard-tglb:         [SKIP][79] ([fdo#112080]) -> [SKIP][80] ([fdo#111912] / [fdo#112080])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-tglb9/igt@gem_ctx_isolation@vcs2-nonpriv-switch.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-tglb2/igt@gem_ctx_isolation@vcs2-nonpriv-switch.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
    - shard-snb:          [DMESG-WARN][81] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][82] ([fdo#111870])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7599/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#6]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6
  [fdo#108838]: https://bugs.freedesktop.org/show_bug.cgi?id=108838
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#111912]: https://bugs.freedesktop.org/show_bug.cgi?id=111912
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5351 -> IGTPW_3878
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7599: 03dfaf2e5f39b632d0187544f3c988b8596f11b0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3878: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/index.html
  IGT_5351: e7fdcef72d1d6b3bb9f3003bbc37571959e6e8bb @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3878/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
