Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 09 Apr 2020 12:41:30 -0000
Message-ID: <158643609093.11552.14651213537271299658@emeril.freedesktop.org>
References: <20200408201925.31566-1-jose.souza@intel.com>
In-Reply-To: <20200408201925.31566-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Ffbcon=5Ffbt=3A_Mak?=
 =?utf-8?q?e_FBC_wait=5Funtil=5Fupdate=28=29_more_reliable_=28rev2=29?=
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
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_fbcon_fbt: Make FBC wait_until_update() more reliable (rev2)
URL   : https://patchwork.freedesktop.org/series/75701/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5582_full -> IGTPW_4437_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4437_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4437_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4437_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-kbl4/igt@gem_softpin@noreloc-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-kbl4/igt@gem_softpin@noreloc-s3.html

  * igt@runner@aborted:
    - shard-tglb:         NOTRUN -> ([FAIL][3], [FAIL][4])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-tglb2/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-tglb6/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4437_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_softpin@noreloc-s3:
    - shard-tglb:         [PASS][5] -> [INCOMPLETE][6] ([i915#456])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-tglb7/igt@gem_softpin@noreloc-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-tglb6/igt@gem_softpin@noreloc-s3.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#716])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-glk4/igt@gen9_exec_parse@allowed-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-glk7/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@cursor:
    - shard-tglb:         [PASS][9] -> [SKIP][10] ([i915#1316] / [i915#579]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-tglb7/igt@i915_pm_rpm@cursor.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-tglb5/igt@i915_pm_rpm@cursor.html
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#1316] / [i915#579]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-iclb6/igt@i915_pm_rpm@cursor.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-iclb8/igt@i915_pm_rpm@cursor.html
    - shard-glk:          [PASS][13] -> [SKIP][14] ([fdo#109271]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-glk3/igt@i915_pm_rpm@cursor.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-glk2/igt@i915_pm_rpm@cursor.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-hsw:          [PASS][15] -> [SKIP][16] ([fdo#109271]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-hsw4/igt@i915_pm_rpm@gem-execbuf.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-hsw7/igt@i915_pm_rpm@gem-execbuf.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#54] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#52] / [i915#54]) +5 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#177] / [i915#52] / [i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglb:         [PASS][27] -> [INCOMPLETE][28] ([i915#456] / [i915#460])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-tglb2/igt@kms_fbcon_fbt@fbc-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-tglb2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-apl7/igt@kms_hdr@bpc-switch-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-apl6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#53] / [i915#93] / [i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-kbl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-kbl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#53] / [i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-apl4/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-apl4/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#1559] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-apl3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#1559] / [i915#93] / [i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][41] -> [FAIL][42] ([i915#899])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-iclb2/igt@kms_psr@psr2_basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-iclb3/igt@kms_psr@psr2_basic.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][45] -> [FAIL][46] ([i915#31])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-hsw1/igt@kms_setmode@basic.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-hsw5/igt@kms_setmode@basic.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][47] -> [FAIL][48] ([i915#1085])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-tglb1/igt@perf@gen12-mi-rpc.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-tglb2/igt@perf@gen12-mi-rpc.html

  
#### Possible fixes ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [SKIP][49] ([fdo#109276]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-iclb6/igt@gem_exec_params@invalid-bsd-ring.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-iclb1/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-snb:          [FAIL][51] ([i915#1066]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-snb1/igt@i915_pm_rc6_residency@rc6-idle.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-snb1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [FAIL][53] ([i915#1119] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-apl8/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [FAIL][55] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-kbl1/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding:
    - shard-apl:          [FAIL][57] ([i915#54] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen:
    - shard-kbl:          [FAIL][59] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [FAIL][61] ([i915#54]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][63] ([i915#52] / [i915#54]) -> [PASS][64] +4 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [FAIL][65] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
    - shard-kbl:          [FAIL][67] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [FAIL][69] ([i915#79]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-glk:          [FAIL][71] ([i915#34]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-glk7/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-glk2/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [FAIL][75] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [FAIL][77] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80] +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-iclb7/igt@kms_psr@psr2_cursor_plane_onoff.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  
#### Warnings ####

  * igt@i915_pm_rpm@cursor-dpms:
    - shard-snb:          [SKIP][81] ([fdo#109271]) -> [INCOMPLETE][82] ([i915#82])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-snb6/igt@i915_pm_rpm@cursor-dpms.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-snb6/igt@i915_pm_rpm@cursor-dpms.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [DMESG-FAIL][83] ([i915#180] / [i915#95]) -> [FAIL][84] ([i915#95])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5582/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1066]: https://gitlab.freedesktop.org/drm/intel/issues/1066
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5582 -> IGTPW_4437

  CI-20190529: 20190529
  CI_DRM_8281: 4d6c69198d6840226f92f2c4645e2c8260ca3e83 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4437: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/index.html
  IGT_5582: 66a7b20f4a1f95320c0d7c8c9704749001487783 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4437/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
