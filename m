Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 10 Apr 2020 06:25:35 -0000
Message-ID: <158649993562.10044.269422207002782625@emeril.freedesktop.org>
References: <20200409133355.9606-1-petri.latvala@intel.com>
In-Reply-To: <20200409133355.9606-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQ09OVFJJ?=
 =?utf-8?q?BUTING=3A_Document_guidelines_for_interface_deprecation?=
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

Series: CONTRIBUTING: Document guidelines for interface deprecation
URL   : https://patchwork.freedesktop.org/series/75749/
State : success

== Summary ==

CI Bug Log - changes from IGT_5586_full -> IGTPW_4441_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4441_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_capture@capture@bcs0}:
    - shard-snb:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-snb2/igt@gem_exec_capture@capture@bcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-snb6/igt@gem_exec_capture@capture@bcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_4441_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb2/igt@gem_exec_params@invalid-bsd-ring.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-iclb8/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - shard-hsw:          [PASS][5] -> [SKIP][6] ([fdo#109271]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-hsw6/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-hsw6/igt@i915_pm_rpm@debugfs-forcewake-user.html

  * igt@i915_pm_rpm@i2c:
    - shard-tglb:         [PASS][7] -> [SKIP][8] ([i915#1316] / [i915#579]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-tglb7/igt@i915_pm_rpm@i2c.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-tglb2/igt@i915_pm_rpm@i2c.html
    - shard-glk:          [PASS][9] -> [SKIP][10] ([fdo#109271]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-glk2/igt@i915_pm_rpm@i2c.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-glk6/igt@i915_pm_rpm@i2c.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#1316] / [i915#579]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb6/igt@i915_pm_rpm@system-suspend-modeset.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-iclb2/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl3/igt@i915_suspend@fence-restore-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-kbl2/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#54] / [i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#1566] / [i915#93] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#52] / [i915#54]) +4 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#52] / [i915#54] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl1/igt@kms_draw_crc@fill-fb.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-apl3/igt@kms_draw_crc@fill-fb.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180] / [i915#93] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-apl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#53] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl7/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#53] / [i915#93] / [i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-kbl7/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-apl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [PASS][37] -> [FAIL][38] ([fdo#108145] / [i915#265] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#1559] / [i915#93] / [i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl3/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
    - shard-apl:          [PASS][41] -> [FAIL][42] ([i915#1559] / [i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl1/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-apl:          [TIMEOUT][45] ([i915#1340]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl6/igt@gem_ctx_persistence@close-replace-race.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-apl2/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_rpm@cursor:
    - shard-tglb:         [SKIP][49] ([i915#1316] / [i915#579]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-tglb2/igt@i915_pm_rpm@cursor.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-tglb2/igt@i915_pm_rpm@cursor.html
    - shard-hsw:          [SKIP][51] ([fdo#109271]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-hsw2/igt@i915_pm_rpm@cursor.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-hsw2/igt@i915_pm_rpm@cursor.html
    - shard-iclb:         [SKIP][53] ([i915#1316] / [i915#579]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb7/igt@i915_pm_rpm@cursor.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-iclb6/igt@i915_pm_rpm@cursor.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl4/igt@i915_suspend@sysfs-reader.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-apl8/igt@i915_suspend@sysfs-reader.html
    - shard-kbl:          [INCOMPLETE][57] ([CI#80] / [i915#155]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl2/igt@i915_suspend@sysfs-reader.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-kbl6/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [FAIL][59] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl1/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-kbl1/igt@kms_big_fb@linear-32bpp-rotate-0.html
    - shard-apl:          [FAIL][61] ([i915#1119] / [i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl6/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-apl6/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-snb:          [SKIP][63] ([fdo#109271]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-snb2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-snb5/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][65] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [FAIL][67] ([i915#52] / [i915#54]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [FAIL][69] ([i915#79]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][71] ([i915#180] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [FAIL][73] ([i915#93] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl2/igt@kms_mmap_write_crc@main.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-kbl1/igt@kms_mmap_write_crc@main.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [FAIL][75] ([i915#53] / [i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
    - shard-kbl:          [FAIL][77] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-kbl1/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [FAIL][81] ([i915#1559] / [i915#95]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [FAIL][83] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][85] ([fdo#109441]) -> [PASS][86] +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb5/igt@kms_psr@psr2_no_drrs.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@perf@oa-formats:
    - shard-iclb:         [SKIP][87] ([i915#405]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-iclb4/igt@perf@oa-formats.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-iclb4/igt@perf@oa-formats.html
    - shard-glk:          [SKIP][89] ([fdo#109271]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-glk9/igt@perf@oa-formats.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-glk9/igt@perf@oa-formats.html
    - shard-apl:          [SKIP][91] ([fdo#109271]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl2/igt@perf@oa-formats.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-apl2/igt@perf@oa-formats.html
    - shard-kbl:          [SKIP][93] ([fdo#109271]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl2/igt@perf@oa-formats.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-kbl6/igt@perf@oa-formats.html
    - shard-tglb:         [SKIP][95] ([i915#405]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-tglb7/igt@perf@oa-formats.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-tglb7/igt@perf@oa-formats.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][97] ([i915#454]) -> [SKIP][98] ([i915#468]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-tglb7/igt@i915_pm_dc@dc6-psr.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][99] ([i915#180] / [i915#93] / [i915#95]) -> [DMESG-WARN][100] ([i915#180])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [FAIL][101] ([i915#53] / [i915#93] / [i915#95]) -> [DMESG-WARN][102] ([i915#180])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [FAIL][103] ([fdo#108145] / [i915#265]) -> [FAIL][104] ([fdo#108145] / [i915#265] / [i915#95])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1340]: https://gitlab.freedesktop.org/drm/intel/issues/1340
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5586 -> IGTPW_4441

  CI-20190529: 20190529
  CI_DRM_8283: a6f4f55d343fea03e11e754b1094dda8cf2538ac @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4441: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/index.html
  IGT_5586: 29fad328e6a1b105c8d688cafe19b1b5c19ad0c8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4441/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
