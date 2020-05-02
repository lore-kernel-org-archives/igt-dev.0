Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 02 May 2020 10:37:45 -0000
Message-ID: <158841586528.5001.13014754364710198007@emeril.freedesktop.org>
References: <20200502080902.1536701-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200502080902.1536701-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaW50ZWwt?=
 =?utf-8?q?ci=3A_Only_skip_the_hanging_gem=5Fexec=5Ffence_tests?=
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

Series: intel-ci: Only skip the hanging gem_exec_fence tests
URL   : https://patchwork.freedesktop.org/series/76845/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8409_full -> IGTPW_4525_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4525_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_fence@flip} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-iclb2/igt@gem_exec_fence@flip.html
    - shard-tglb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-tglb7/igt@gem_exec_fence@flip.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8409_full and IGTPW_4525_full:

### New IGT tests (25) ###

  * igt@gem_exec_fence@expired-history:
    - Statuses : 7 pass(s)
    - Exec time: [0.04, 6.15] s

  * igt@gem_exec_fence@flip:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@invalid-fence-array:
    - Statuses : 7 pass(s)
    - Exec time: [0.00] s

  * igt@gem_exec_fence@keep-in-fence:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@keep-in-fence@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.08] s

  * igt@gem_exec_fence@keep-in-fence@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@gem_exec_fence@keep-in-fence@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@gem_exec_fence@keep-in-fence@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@gem_exec_fence@keep-in-fence@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@gem_exec_fence@long-history:
    - Statuses : 7 pass(s)
    - Exec time: [0.05, 6.03] s

  * igt@gem_exec_fence@parallel:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@parallel@bcs0:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.15] s

  * igt@gem_exec_fence@parallel@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [2.15] s

  * igt@gem_exec_fence@parallel@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [2.15] s

  * igt@gem_exec_fence@parallel@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [2.15] s

  * igt@gem_exec_fence@parallel@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [2.15] s

  * igt@gem_exec_fence@syncobj-channel:
    - Statuses : 6 pass(s)
    - Exec time: [1.02, 1.05] s

  * igt@gem_exec_fence@syncobj-export:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_fence@syncobj-import:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_fence@syncobj-invalid-flags:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-invalid-wait:
    - Statuses : 6 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_fence@syncobj-repeat:
    - Statuses : 7 pass(s)
    - Exec time: [0.16, 0.78] s

  * igt@gem_exec_fence@syncobj-signal:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_fence@syncobj-unused-fence:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_fence@syncobj-wait:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.02] s

  

Known issues
------------

  Here are the changes found in IGTPW_4525_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@kms:
    - shard-glk:          [PASS][3] -> [TIMEOUT][4] ([i915#1383])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-glk1/igt@gem_eio@kms.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-glk6/igt@gem_eio@kms.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-kbl6/igt@gem_exec_suspend@basic-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-kbl1/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-apl7/igt@gem_workarounds@suspend-resume.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-apl2/igt@gem_workarounds@suspend-resume.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-random:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#54] / [i915#93] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#54])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#72])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][15] -> [FAIL][16] ([i915#57])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109349])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#177] / [i915#52] / [i915#54])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#52] / [i915#54]) +4 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#52] / [i915#54] / [i915#95]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-apl6/igt@kms_draw_crc@fill-fb.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-apl1/igt@kms_draw_crc@fill-fb.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180] / [i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-apl2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][35] -> [SKIP][36] ([i915#433])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#53] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-apl4/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#53] / [i915#93] / [i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-kbl4/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-hsw:          [PASS][41] -> [INCOMPLETE][42] ([i915#61])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-hsw1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-hsw4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [PASS][43] -> [FAIL][44] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [PASS][45] -> [FAIL][46] ([fdo#108145] / [i915#265] / [i915#95])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][47] -> [FAIL][48] ([i915#1559] / [i915#95])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [PASS][49] -> [FAIL][50] ([i915#1559] / [i915#93] / [i915#95])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109441]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-iclb1/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][53] -> [FAIL][54] ([i915#31])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-apl7/igt@kms_setmode@basic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-apl8/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [SKIP][55] ([fdo#109276]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-iclb6/igt@gem_exec_params@invalid-bsd-ring.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-iclb4/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][57] ([i915#716]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-apl7/igt@gen9_exec_parse@allowed-all.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-apl1/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +5 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [FAIL][61] ([i915#52] / [i915#54]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-apl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-glk:          [FAIL][65] ([i915#49]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-pwrite.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][67] ([i915#899]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_prime@basic-crc:
    - shard-apl:          [FAIL][69] ([i915#1031] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-apl1/igt@kms_prime@basic-crc.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-apl7/igt@kms_prime@basic-crc.html
    - shard-kbl:          [FAIL][71] ([i915#1031] / [i915#93] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-kbl1/igt@kms_prime@basic-crc.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-kbl7/igt@kms_prime@basic-crc.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][73] ([fdo#109642] / [fdo#111068]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-iclb6/igt@kms_psr2_su@frontbuffer.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][75] ([fdo#109441]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-iclb6/igt@kms_psr@psr2_primary_page_flip.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][77] ([i915#454]) -> [SKIP][78] ([i915#468])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-tglb3/igt@i915_pm_dc@dc6-psr.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][79] ([i915#95]) -> [FAIL][80] ([i915#1525])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][81] ([i915#93] / [i915#95]) -> [FAIL][82] ([i915#64])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-kbl:          [FAIL][83] ([fdo#108145] / [i915#265]) -> [FAIL][84] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-apl:          [FAIL][85] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][86] ([fdo#108145] / [i915#265])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [FAIL][87] ([i915#608]) -> [SKIP][88] ([fdo#109642] / [fdo#111068])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8409/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/shard-iclb3/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#1383]: https://gitlab.freedesktop.org/drm/intel/issues/1383
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5626 -> IGTPW_4525
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8409: 62a6fd0fefe59854db85f52a0ee1d3b1b4a9c51e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4525: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/index.html
  IGT_5626: f27fdfff026276ac75c69e487c929a843f66f6ca @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4525/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
