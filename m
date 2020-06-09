Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 09 Jun 2020 17:45:16 -0000
Message-ID: <159172471683.17061.182856755401350416@emeril.freedesktop.org>
References: <20200609142137.203218-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200609142137.203218-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgcnVubmVy?=
 =?utf-8?q?/resultgen=3A_Explain_why_json_creation_might_have_failed?=
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: runner/resultgen: Explain why json creation might have failed
URL   : https://patchwork.freedesktop.org/series/78168/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8603_full -> IGTPW_4659_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4659_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4659_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4659_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_parallel@basic@vcs1:
    - shard-kbl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl3/igt@gem_exec_parallel@basic@vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-kbl4/igt@gem_exec_parallel@basic@vcs1.html

  
Known issues
------------

  Here are the changes found in IGTPW_4659_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_param@set-priority-invalid-size:
    - shard-tglb:         [PASS][3] -> [DMESG-WARN][4] ([i915#402])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-tglb2/igt@gem_ctx_param@set-priority-invalid-size.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-tglb3/igt@gem_ctx_param@set-priority-invalid-size.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#1930])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-glk1/igt@gem_exec_reloc@basic-concurrent0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-glk4/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-contexts-priority:
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#118] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-glk8/igt@gem_exec_whisper@basic-contexts-priority.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-glk1/igt@gem_exec_whisper@basic-contexts-priority.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-hsw:          [PASS][9] -> [TIMEOUT][10] ([i915#1958]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-hsw1/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-glk:          [PASS][11] -> [DMESG-FAIL][12] ([i915#118] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-glk1/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#1982])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-apl8/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-apl2/igt@kms_big_fb@linear-8bpp-rotate-180.html
    - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#1982])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-glk9/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-glk5/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#54])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#54])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-glk7/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-glk7/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#54])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#95]) +36 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-hsw:          [PASS][25] -> [INCOMPLETE][26] ([CI#80] / [i915#61])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#93] / [i915#95]) +44 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@pipe-b-torture-bo:
    - shard-iclb:         [PASS][29] -> [DMESG-WARN][30] ([i915#128])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-iclb7/igt@kms_cursor_legacy@pipe-b-torture-bo.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-iclb2/igt@kms_cursor_legacy@pipe-b-torture-bo.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][31] -> [DMESG-WARN][32] ([i915#1982])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-hsw8/igt@kms_flip@2x-flip-vs-modeset-vs-hang@ab-vga1-hdmi-a1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-hsw8/igt@kms_flip@2x-flip-vs-modeset-vs-hang@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180]) +6 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-iclb:         [PASS][37] -> [DMESG-WARN][38] ([i915#1982])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-snb:          [PASS][39] -> [SKIP][40] ([fdo#109271]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-snb1/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-kbl:          [PASS][41] -> [DMESG-WARN][42] ([i915#1982] / [i915#93] / [i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-glk:          [PASS][43] -> [FAIL][44] ([i915#49])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglb:         [PASS][45] -> [FAIL][46] ([i915#83])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-tglb5/igt@kms_panel_fitting@atomic-fastset.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-tglb7/igt@kms_panel_fitting@atomic-fastset.html
    - shard-iclb:         [PASS][47] -> [FAIL][48] ([i915#83])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-iclb8/igt@kms_panel_fitting@atomic-fastset.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-iclb8/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-apl:          [PASS][49] -> [DMESG-FAIL][50] ([i915#95]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-apl6/igt@kms_prime@basic-crc@second-to-first.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-apl6/igt@kms_prime@basic-crc@second-to-first.html
    - shard-kbl:          [PASS][51] -> [DMESG-FAIL][52] ([i915#95]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl7/igt@kms_prime@basic-crc@second-to-first.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-kbl3/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][53] -> [FAIL][54] ([i915#173])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-iclb4/igt@kms_psr@no_drrs.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][55] -> [SKIP][56] ([fdo#109441]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-iclb3/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-c-accuracy-idle:
    - shard-kbl:          [PASS][57] -> [DMESG-WARN][58] ([i915#1982])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl7/igt@kms_vblank@pipe-c-accuracy-idle.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-kbl4/igt@kms_vblank@pipe-c-accuracy-idle.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl6/igt@gem_exec_suspend@basic-s3.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-kbl3/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-glk:          [DMESG-WARN][61] ([i915#118] / [i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-glk9/igt@gem_exec_whisper@basic-queues-priority-all.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-glk4/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@gem_sync@basic-store-each:
    - shard-apl:          [DMESG-WARN][63] ([i915#95]) -> [PASS][64] +35 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-apl7/igt@gem_sync@basic-store-each.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-apl1/igt@gem_sync@basic-store-each.html

  * igt@gem_wait@await@vecs0:
    - shard-hsw:          [INCOMPLETE][65] ([i915#61]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-hsw4/igt@gem_wait@await@vecs0.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-hsw8/igt@gem_wait@await@vecs0.html

  * igt@i915_getparams_basic@basic-subslice-total:
    - shard-kbl:          [DMESG-WARN][67] ([i915#93] / [i915#95]) -> [PASS][68] +39 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl7/igt@i915_getparams_basic@basic-subslice-total.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-kbl7/igt@i915_getparams_basic@basic-subslice-total.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a:
    - shard-apl:          [DMESG-WARN][69] ([i915#1982]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-apl2/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-apl2/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-kbl:          [DMESG-FAIL][71] ([i915#95]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-kbl1/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:
    - shard-hsw:          [TIMEOUT][73] ([i915#1958]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-hsw2/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-hsw8/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [DMESG-FAIL][75] ([i915#54] / [i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [DMESG-FAIL][77] ([i915#54] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [DMESG-FAIL][79] ([fdo#108145] / [i915#54] / [i915#95]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [DMESG-FAIL][81] ([fdo#108145] / [i915#54] / [i915#95]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1:
    - shard-tglb:         [DMESG-WARN][83] ([i915#1982]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-tglb8/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-tglb1/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-snb:          [SKIP][85] ([fdo#109271]) -> [PASS][86] +3 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [DMESG-WARN][87] ([i915#1982]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-glk4/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-glk8/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_lease@page_flip_implicit_plane:
    - shard-snb:          [TIMEOUT][89] ([i915#1958]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-snb4/igt@kms_lease@page_flip_implicit_plane.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-snb4/igt@kms_lease@page_flip_implicit_plane.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [DMESG-FAIL][91] ([i915#95]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-apl2/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-apl:          [DMESG-WARN][93] ([i915#180]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][95] ([fdo#109642] / [fdo#111068]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-iclb4/igt@kms_psr2_su@frontbuffer.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][97] ([fdo#109441]) -> [PASS][98] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [INCOMPLETE][99] ([i915#155]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [TIMEOUT][101] ([i915#1958]) -> [FAIL][102] ([i915#1930])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-snb4/igt@gem_exec_reloc@basic-concurrent16.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-snb4/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@kms_color@pipe-a-degamma:
    - shard-tglb:         [DMESG-FAIL][103] ([i915#1149] / [i915#402]) -> [FAIL][104] ([i915#1149] / [i915#1897])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-tglb3/igt@kms_color@pipe-a-degamma.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-tglb3/igt@kms_color@pipe-a-degamma.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [DMESG-FAIL][105] ([fdo#110321] / [i915#95]) -> [TIMEOUT][106] ([i915#1319] / [i915#1635])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-apl6/igt@kms_content_protection@atomic.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-apl6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][107] ([i915#1319]) -> [TIMEOUT][108] ([i915#1319] / [i915#1635])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-apl2/igt@kms_content_protection@atomic-dpms.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-apl6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][109] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][110] ([i915#1319] / [i915#1635])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-apl7/igt@kms_content_protection@legacy.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-apl7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][111] ([i915#1319] / [i915#1635]) -> [FAIL][112] ([fdo#110321])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-apl4/igt@kms_content_protection@lic.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-apl6/igt@kms_content_protection@lic.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][113] ([i915#180] / [i915#93] / [i915#95]) -> [DMESG-WARN][114] ([i915#93] / [i915#95])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-hsw:          [TIMEOUT][115] ([i915#1958]) -> [SKIP][116] ([fdo#109271]) +2 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-hsw2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-hsw4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [FAIL][117] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][118] ([fdo#108145] / [i915#95])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
    - shard-kbl:          [FAIL][119] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][120] ([fdo#108145] / [i915#95])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_psr@sprite_blt:
    - shard-hsw:          [SKIP][121] ([fdo#109271]) -> [TIMEOUT][122] ([i915#1958]) +1 similar issue
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-hsw2/igt@kms_psr@sprite_blt.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-hsw7/igt@kms_psr@sprite_blt.html

  * igt@kms_psr@suspend:
    - shard-snb:          [TIMEOUT][123] ([i915#1958]) -> [SKIP][124] ([fdo#109271]) +2 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8603/shard-snb4/igt@kms_psr@suspend.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/shard-snb1/igt@kms_psr@suspend.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1897]: https://gitlab.freedesktop.org/drm/intel/issues/1897
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5699 -> IGTPW_4659
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8603: 03f5a3d90ccfb2f1bb13e293a83d48a0b7da8af0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4659: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/index.html
  IGT_5699: 201da47cb57b8fadd9bc45be16b82617b32a2c01 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4659/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
