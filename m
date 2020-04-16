Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 16 Apr 2020 07:51:21 -0000
Message-ID: <158702348175.20885.5770634135968275346@emeril.freedesktop.org>
References: <20200415084955.29370-1-petri.latvala@intel.com>
In-Reply-To: <20200415084955.29370-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Add_--version_to_igt=5Frunner_=28rev3=29?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: runner: Add --version to igt_runner (rev3)
URL   : https://patchwork.freedesktop.org/series/75549/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8300_full -> IGTPW_4464_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4464_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_parallel@fds@bcs0}:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-tglb8/igt@gem_exec_parallel@fds@bcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-tglb8/igt@gem_exec_parallel@fds@bcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_4464_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@processes:
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#1528])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-kbl6/igt@gem_ctx_persistence@processes.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-kbl7/igt@gem_ctx_persistence@processes.html

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-iclb4/igt@gem_exec_params@invalid-bsd-ring.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-iclb3/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - shard-hsw:          [PASS][7] -> [SKIP][8] ([fdo#109271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-hsw2/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-hsw2/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#1316] / [i915#579])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-iclb1/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-iclb7/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-tglb:         [PASS][11] -> [SKIP][12] ([i915#1316] / [i915#579])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-tglb1/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-tglb6/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-glk:          [PASS][13] -> [SKIP][14] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-glk8/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-glk9/igt@i915_pm_rpm@debugfs-forcewake-user.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#54] / [i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#54] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#52] / [i915#54]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#165])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_cursor@pipe-b-viewport-size-128:
    - shard-hsw:          [PASS][25] -> [INCOMPLETE][26] ([i915#61])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-hsw4/igt@kms_plane_cursor@pipe-b-viewport-size-128.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-hsw1/igt@kms_plane_cursor@pipe-b-viewport-size-128.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-iclb5/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_universal_plane@universal-plane-pipe-b-functional:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#331])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-apl7/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-apl7/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#331])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-kbl6/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-kbl6/igt@kms_universal_plane@universal-plane-pipe-b-functional.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@rcs0}:
    - shard-apl:          [DMESG-WARN][33] ([i915#180]) -> [PASS][34] +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-apl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-apl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][35] ([i915#454]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [WARN][37] ([i915#1519]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@i2c:
    - shard-tglb:         [SKIP][39] ([i915#1316] / [i915#579]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-tglb5/igt@i915_pm_rpm@i2c.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-tglb7/igt@i915_pm_rpm@i2c.html
    - shard-glk:          [SKIP][41] ([fdo#109271]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-glk2/igt@i915_pm_rpm@i2c.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-glk7/igt@i915_pm_rpm@i2c.html
    - shard-hsw:          [SKIP][43] ([fdo#109271]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-hsw2/igt@i915_pm_rpm@i2c.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-hsw7/igt@i915_pm_rpm@i2c.html
    - shard-iclb:         [SKIP][45] ([i915#1316] / [i915#579]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-iclb1/igt@i915_pm_rpm@i2c.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-iclb1/igt@i915_pm_rpm@i2c.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [INCOMPLETE][47] ([i915#155]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-kbl3/igt@i915_suspend@debugfs-reader.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-kbl6/igt@i915_suspend@debugfs-reader.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen:
    - shard-apl:          [FAIL][49] ([i915#54]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
    - shard-glk:          [FAIL][51] ([i915#54]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
    - shard-kbl:          [FAIL][53] ([i915#54]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:
    - shard-glk:          [FAIL][55] ([i915#52] / [i915#54]) -> [PASS][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [FAIL][57] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
    - shard-kbl:          [FAIL][59] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:
    - shard-snb:          [SKIP][61] ([fdo#109271]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-snb1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-apl:          [FAIL][63] ([i915#49] / [i915#95]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-apl2/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-apl8/igt@kms_frontbuffer_tracking@fbc-badstride.html
    - shard-kbl:          [FAIL][65] ([i915#49]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [FAIL][67] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [FAIL][69] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_prime@basic-crc:
    - shard-apl:          [FAIL][71] ([i915#1031] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-apl7/igt@kms_prime@basic-crc.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-apl1/igt@kms_prime@basic-crc.html
    - shard-kbl:          [FAIL][73] ([i915#1031] / [i915#93] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-kbl1/igt@kms_prime@basic-crc.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-kbl4/igt@kms_prime@basic-crc.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][75] ([fdo#109441]) -> [PASS][76] +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78] +4 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][79] ([i915#1542]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-iclb5/igt@perf@blocking-parameterized.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-iclb5/igt@perf@blocking-parameterized.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [FAIL][81] ([i915#1085]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-tglb8/igt@perf@gen12-mi-rpc.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-tglb5/igt@perf@gen12-mi-rpc.html

  * {igt@prime_vgem@sync@bcs0}:
    - shard-tglb:         [INCOMPLETE][83] ([i915#409]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-tglb1/igt@prime_vgem@sync@bcs0.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-tglb8/igt@prime_vgem@sync@bcs0.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][85] ([i915#588]) -> [SKIP][86] ([i915#658])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@cursor:
    - shard-snb:          [SKIP][87] ([fdo#109271]) -> [INCOMPLETE][88] ([i915#82])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-snb2/igt@i915_pm_rpm@cursor.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-snb5/igt@i915_pm_rpm@cursor.html

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - shard-snb:          [INCOMPLETE][89] ([i915#82]) -> [SKIP][90] ([fdo#109271])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-snb2/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-snb2/igt@i915_pm_rpm@debugfs-forcewake-user.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         [SKIP][91] ([i915#1316] / [i915#579]) -> [SKIP][92] ([fdo#111644] / [i915#1397])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-tglb5/igt@i915_pm_rpm@dpms-non-lpsp.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-tglb5/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         [SKIP][93] ([i915#1316] / [i915#579]) -> [SKIP][94] ([fdo#110892])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-iclb1/igt@i915_pm_rpm@dpms-non-lpsp.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-iclb8/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][95] ([i915#357]) -> [FAIL][96] ([i915#357] / [i915#93] / [i915#95])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-kbl7/igt@kms_content_protection@uevent.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-kbl3/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][97] ([i915#357]) -> [FAIL][98] ([i915#357] / [i915#95])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-apl6/igt@kms_content_protection@uevent.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-apl2/igt@kms_content_protection@uevent.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [FAIL][99] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][100] ([fdo#108145] / [i915#265]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][101] ([i915#31] / [i915#93] / [i915#95]) -> [FAIL][102] ([i915#31])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8300/shard-kbl6/igt@kms_setmode@basic.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/shard-kbl4/igt@kms_setmode@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5590 -> IGTPW_4464
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8300: 02f5d84db84f885cba1f8d258b23e9ea0f2d922e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4464: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/index.html
  IGT_5590: c7b4a43942be32245b1c00b5b4a38401d8ca6e0d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4464/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
