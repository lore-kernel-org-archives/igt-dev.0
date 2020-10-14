Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 14 Oct 2020 06:58:08 -0000
Message-ID: <160265868869.21207.680253533190011453@emeril.freedesktop.org>
References: <20201013121139.104017-1-matthew.auld@intel.com>
In-Reply-To: <20201013121139.104017-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fexec=5Fparams=3A_test_overly_large_batch?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0686128934=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0686128934==
Content-Type: multipart/alternative;
 boundary="===============6062158142503182325=="

--===============6062158142503182325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/gem_exec_params: test overly large batch
URL   : https://patchwork.freedesktop.org/series/82625/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9135_full -> IGTPW_5063_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5063_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5063_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5063_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_params@larger-than-life-batch} (NEW):
    - shard-kbl:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-kbl1/igt@gem_exec_params@larger-than-life-batch.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-glk5/igt@gem_exec_params@larger-than-life-batch.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-hsw:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-hsw2/igt@gem_partial_pwrite_pread@write-uncached.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-hsw2/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@kms_flip@plain-flip-ts-check@a-dp1:
    - shard-kbl:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl6/igt@kms_flip@plain-flip-ts-check@a-dp1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-kbl7/igt@kms_flip@plain-flip-ts-check@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
    - shard-tglb:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-tglb:         [DMESG-FAIL][9] ([i915#1982]) -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9135_full and IGTPW_5063_full:

### New IGT tests (1) ###

  * igt@gem_exec_params@larger-than-life-batch:
    - Statuses : 3 incomplete(s) 3 pass(s)
    - Exec time: [0.0, 3.55] s

  

Known issues
------------

  Here are the changes found in IGTPW_5063_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#658])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb2/igt@feature_discovery@psr2.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-iclb4/igt@feature_discovery@psr2.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [PASS][13] -> [INCOMPLETE][14] ([i915#155])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl2/igt@gem_eio@in-flight-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-kbl1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_reloc@basic-many-active@vecs0:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#2389]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk1/igt@gem_exec_reloc@basic-many-active@vecs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-glk9/igt@gem_exec_reloc@basic-many-active@vecs0.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-glk:          [PASS][17] -> [DMESG-WARN][18] ([i915#118] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk7/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-glk5/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@gem_mmap_wc@copy:
    - shard-iclb:         [PASS][19] -> [DMESG-WARN][20] ([i915#1982])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb2/igt@gem_mmap_wc@copy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-iclb2/igt@gem_mmap_wc@copy.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1635] / [i915#1982])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl3/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-apl6/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp1:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#1635] / [i915#79])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl1/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-apl2/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#49])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-tglb:         [PASS][29] -> [DMESG-WARN][30] ([i915#1982]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([i915#1836])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb7/igt@kms_prime@basic-crc@first-to-second.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-iclb2/igt@kms_prime@basic-crc@first-to-second.html
    - shard-snb:          [PASS][33] -> [SKIP][34] ([fdo#109271])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-snb6/igt@kms_prime@basic-crc@first-to-second.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-snb5/igt@kms_prime@basic-crc@first-to-second.html
    - shard-hsw:          [PASS][35] -> [SKIP][36] ([fdo#109271])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-hsw2/igt@kms_prime@basic-crc@first-to-second.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-hsw2/igt@kms_prime@basic-crc@first-to-second.html
    - shard-kbl:          [PASS][37] -> [SKIP][38] ([fdo#109271])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl1/igt@kms_prime@basic-crc@first-to-second.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-kbl1/igt@kms_prime@basic-crc@first-to-second.html
    - shard-apl:          [PASS][39] -> [SKIP][40] ([fdo#109271] / [i915#1635])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl1/igt@kms_prime@basic-crc@first-to-second.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-apl3/igt@kms_prime@basic-crc@first-to-second.html
    - shard-tglb:         [PASS][41] -> [SKIP][42] ([i915#1836])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb6/igt@kms_prime@basic-crc@first-to-second.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-tglb5/igt@kms_prime@basic-crc@first-to-second.html
    - shard-glk:          [PASS][43] -> [SKIP][44] ([fdo#109271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk7/igt@kms_prime@basic-crc@first-to-second.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-glk6/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109441]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-iclb5/igt@kms_psr@psr2_sprite_plane_onoff.html

  
#### Possible fixes ####

  * {igt@gem_exec_capture@pi@bcs0}:
    - shard-glk:          [INCOMPLETE][47] -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk1/igt@gem_exec_capture@pi@bcs0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-glk6/igt@gem_exec_capture@pi@bcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][49] ([i915#2389]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-kbl:          [FAIL][51] ([i915#2521]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl2/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-kbl4/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - shard-iclb:         [FAIL][53] ([i915#2521]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb6/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-iclb4/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - shard-tglb:         [DMESG-WARN][55] ([i915#1982]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-tglb1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@pipe-b-torture-move:
    - shard-tglb:         [DMESG-WARN][57] ([i915#128]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb7/igt@kms_cursor_legacy@pipe-b-torture-move.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-tglb1/igt@kms_cursor_legacy@pipe-b-torture-move.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          [DMESG-FAIL][59] ([i915#118] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk3/igt@kms_fbcon_fbt@fbc-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-glk6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - shard-kbl:          [DMESG-WARN][61] ([i915#1982]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl4/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-kbl2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:
    - shard-apl:          [FAIL][63] ([i915#1635] / [i915#79]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-tglb:         [FAIL][65] -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-iclb:         [DMESG-WARN][67] ([i915#1982]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb8/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-iclb8/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_plane@plane-position-covered-pipe-c-planes:
    - shard-apl:          [FAIL][69] ([i915#1635] / [i915#247]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl2/igt@kms_plane@plane-position-covered-pipe-c-planes.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-apl1/igt@kms_plane@plane-position-covered-pipe-c-planes.html
    - shard-kbl:          [FAIL][71] ([i915#247]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl6/igt@kms_plane@plane-position-covered-pipe-c-planes.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-kbl7/igt@kms_plane@plane-position-covered-pipe-c-planes.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-apl:          [SKIP][73] ([fdo#109271] / [i915#1635]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl1/igt@kms_prime@basic-crc@second-to-first.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-apl3/igt@kms_prime@basic-crc@second-to-first.html
    - shard-kbl:          [SKIP][75] ([fdo#109271]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl1/igt@kms_prime@basic-crc@second-to-first.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-kbl1/igt@kms_prime@basic-crc@second-to-first.html
    - shard-hsw:          [SKIP][77] ([fdo#109271]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-hsw2/igt@kms_prime@basic-crc@second-to-first.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-hsw2/igt@kms_prime@basic-crc@second-to-first.html
    - shard-iclb:         [SKIP][79] ([i915#1836]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb7/igt@kms_prime@basic-crc@second-to-first.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-iclb2/igt@kms_prime@basic-crc@second-to-first.html
    - shard-snb:          [SKIP][81] ([fdo#109271]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-snb6/igt@kms_prime@basic-crc@second-to-first.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-snb5/igt@kms_prime@basic-crc@second-to-first.html
    - shard-tglb:         [SKIP][83] ([i915#1836]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb6/igt@kms_prime@basic-crc@second-to-first.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-tglb5/igt@kms_prime@basic-crc@second-to-first.html
    - shard-glk:          [SKIP][85] ([fdo#109271]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk7/igt@kms_prime@basic-crc@second-to-first.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-glk6/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [SKIP][87] ([fdo#109441]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb3/igt@kms_psr@psr2_primary_mmap_gtt.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@sysfs_heartbeat_interval@mixed@vcs1:
    - shard-kbl:          [INCOMPLETE][89] ([i915#1731]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl4/igt@sysfs_heartbeat_interval@mixed@vcs1.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-kbl2/igt@sysfs_heartbeat_interval@mixed@vcs1.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][91] ([i915#1319] / [i915#1635]) -> [FAIL][92] ([fdo#110321] / [fdo#110336] / [i915#1635])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl2/igt@kms_content_protection@atomic.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-apl1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][93] ([fdo#110321] / [fdo#110336] / [i915#1635]) -> [TIMEOUT][94] ([i915#1319] / [i915#1635])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl3/igt@kms_content_protection@atomic-dpms.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-apl4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
    - shard-tglb:         [FAIL][95] -> [DMESG-FAIL][96] ([i915#1982])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [FAIL][97] ([fdo#108145] / [i915#1635] / [i915#265]) -> [DMESG-FAIL][98] ([fdo#108145] / [i915#1635] / [i915#1982])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@runner@aborted:
    - shard-glk:          [FAIL][99] ([i915#2439] / [k.org#202321]) -> [FAIL][100] ([i915#1611] / [i915#2439] / [k.org#202321])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk1/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-glk5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1731]: https://gitlab.freedesktop.org/drm/intel/issues/1731
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#247]: https://gitlab.freedesktop.org/drm/intel/issues/247
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2542]: https://gitlab.freedesktop.org/drm/intel/issues/2542
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5813 -> IGTPW_5063
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9135: eb70ad33fcc91d3464b07679391fb477927ad4c7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5063: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/index.html
  IGT_5813: d4e6dd955a1dad02271aa41c9389f5097ee17765 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/index.html

--===============6062158142503182325==
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
<tr><td><b>Series:</b></td><td>tests/gem_exec_params: test overly large batch</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82625/">https://patchwork.freedesktop.org/series/82625/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9135_full -&gt; IGTPW_5063_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5063_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5063_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5063_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_exec_params@larger-than-life-batch} (NEW):</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-kbl1/igt@gem_exec_params@larger-than-life-batch.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-glk5/igt@gem_exec_params@larger-than-life-batch.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-uncached:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-hsw2/igt@gem_partial_pwrite_pread@write-uncached.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-hsw2/igt@gem_partial_pwrite_pread@write-uncached.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl6/igt@kms_flip@plain-flip-ts-check@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-kbl7/igt@kms_flip@plain-flip-ts-check@a-dp1.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9135_full and IGTPW_5063_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gem_exec_params@larger-than-life-batch:<ul>
<li>Statuses : 3 incomplete(s) 3 pass(s)</li>
<li>Exec time: [0.0, 3.55] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5063_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-iclb4/igt@feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl2/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-kbl1/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk1/igt@gem_exec_reloc@basic-many-active@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-glk9/igt@gem_exec_reloc@basic-many-active@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk7/igt@gem_exec_whisper@basic-contexts-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-glk5/igt@gem_exec_whisper@basic-contexts-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb2/igt@gem_mmap_wc@copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-iclb2/igt@gem_mmap_wc@copy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl3/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-apl6/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl1/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-apl2/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb7/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-iclb2/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-snb6/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-snb5/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-hsw2/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-hsw2/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl1/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-kbl1/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl1/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-apl3/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb6/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-tglb5/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk7/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-glk6/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-iclb5/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_exec_capture@pi@bcs0}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk1/igt@gem_exec_capture@pi@bcs0.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-glk6/igt@gem_exec_capture@pi@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl2/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-kbl4/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb6/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-iclb4/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-tglb1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-b-torture-move:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb7/igt@kms_cursor_legacy@pipe-b-torture-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/128">i915#128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-tglb1/igt@kms_cursor_legacy@pipe-b-torture-move.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk3/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-glk6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl4/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-kbl2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb8/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-iclb8/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered-pipe-c-planes:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl2/igt@kms_plane@plane-position-covered-pipe-c-planes.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/247">i915#247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-apl1/igt@kms_plane@plane-position-covered-pipe-c-planes.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl6/igt@kms_plane@plane-position-covered-pipe-c-planes.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/247">i915#247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-kbl7/igt@kms_plane@plane-position-covered-pipe-c-planes.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@second-to-first:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl1/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-apl3/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl1/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-kbl1/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-hsw2/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-hsw2/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb7/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-iclb2/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-snb6/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-snb5/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb6/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-tglb5/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk7/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-glk6/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-iclb3/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-kbl4/igt@sysfs_heartbeat_interval@mixed@vcs1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1731">i915#1731</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-kbl2/igt@sysfs_heartbeat_interval@mixed@vcs1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl2/igt@kms_content_protection@atomic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-apl1/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=110336">fdo#110336</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl3/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=110336">fdo#110336</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-apl4/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9135/shard-glk1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/shard-glk5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5813 -&gt; IGTPW_5063</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9135: eb70ad33fcc91d3464b07679391fb477927ad4c7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5063: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5063/index.html<br />
  IGT_5813: d4e6dd955a1dad02271aa41c9389f5097ee17765 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============6062158142503182325==--

--===============0686128934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0686128934==--
