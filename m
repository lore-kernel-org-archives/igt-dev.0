Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 16 Apr 2020 09:10:27 -0000
Message-ID: <158702822786.20887.1164519525584416607@emeril.freedesktop.org>
References: <20200409053951.26929-1-anshuman.gupta@intel.com>
In-Reply-To: <20200409053951.26929-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbHBzcCBw?=
 =?utf-8?q?latform_agnostic_support_=28rev8=29?=
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
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lpsp platform agnostic support (rev8)
URL   : https://patchwork.freedesktop.org/series/74647/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5591_full -> IGTPW_4467_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4467_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4467_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4467_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp-1} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-tglb2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp-1.html
    - shard-iclb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-iclb6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp-1.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-hsw:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-hsw4/igt@i915_pm_lpsp@screens-disabled.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-hsw1/igt@i915_pm_lpsp@screens-disabled.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-iclb:         [PASS][5] -> [SKIP][6] +4 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-iclb6/igt@i915_pm_rpm@dpms-lpsp.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-iclb7/igt@i915_pm_rpm@dpms-lpsp.html

  
#### Warnings ####

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-tglb:         [SKIP][7] ([fdo#109301]) -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-tglb7/igt@i915_pm_lpsp@screens-disabled.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-tglb1/igt@i915_pm_lpsp@screens-disabled.html
    - shard-snb:          [SKIP][9] ([fdo#109271]) -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-snb5/igt@i915_pm_lpsp@screens-disabled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-snb2/igt@i915_pm_lpsp@screens-disabled.html
    - shard-glk:          [SKIP][11] ([fdo#109271]) -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-glk9/igt@i915_pm_lpsp@screens-disabled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-glk4/igt@i915_pm_lpsp@screens-disabled.html
    - shard-iclb:         [SKIP][13] ([fdo#109301]) -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-iclb7/igt@i915_pm_lpsp@screens-disabled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-iclb4/igt@i915_pm_lpsp@screens-disabled.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2}:
    - shard-glk:          [PASS][15] -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html

  
New tests
---------

  New tests have been introduced between IGT_5591_full and IGTPW_4467_full:

### New IGT tests (20) ###

  * igt@i915_pm_lpsp@kms-lpsp:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-vga-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.56] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.52] s

  * igt@kms_flip@2x-flip-vs-panning-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [10.46] s

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ac-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.19] s

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@bc-hdmi-a1-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.28] s

  * igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.26] s

  * igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [5.27] s

  * igt@kms_flip@dpms-off-confusion-interruptible@d-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [8.70] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [2.27] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@d-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.65] s

  

Known issues
------------

  Here are the changes found in IGTPW_4467_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109276])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-iclb4/igt@gem_exec_params@invalid-bsd-ring.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-iclb6/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([i915#579])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-iclb3/igt@i915_pm_rpm@gem-idle.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-iclb4/igt@i915_pm_rpm@gem-idle.html
    - shard-glk:          [PASS][21] -> [SKIP][22] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-glk6/igt@i915_pm_rpm@gem-idle.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-glk4/igt@i915_pm_rpm@gem-idle.html
    - shard-tglb:         [PASS][23] -> [SKIP][24] ([i915#579])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-tglb8/igt@i915_pm_rpm@gem-idle.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-tglb1/igt@i915_pm_rpm@gem-idle.html
    - shard-hsw:          [PASS][25] -> [SKIP][26] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-hsw1/igt@i915_pm_rpm@gem-idle.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-hsw1/igt@i915_pm_rpm@gem-idle.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-tglb:         [PASS][27] -> [SKIP][28] ([i915#1397]) +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-tglb7/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-tglb6/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl6/igt@i915_suspend@sysfs-reader.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-apl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen:
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#54] / [i915#95]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#54])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
    - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#54])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
    - shard-kbl:          [PASS][41] -> [FAIL][42] ([i915#54])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled:
    - shard-glk:          [PASS][43] -> [FAIL][44] ([i915#52] / [i915#54])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-apl:          [PASS][45] -> [FAIL][46] ([i915#49])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
    - shard-kbl:          [PASS][47] -> [FAIL][48] ([i915#49])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][49] -> [FAIL][50] ([i915#53] / [i915#93] / [i915#95])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [PASS][51] -> [FAIL][52] ([i915#53] / [i915#95])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [PASS][53] -> [FAIL][54] ([fdo#108145] / [i915#265] / [i915#95])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_prime@basic-crc:
    - shard-apl:          [PASS][55] -> [FAIL][56] ([i915#1031] / [i915#95])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl4/igt@kms_prime@basic-crc.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-apl6/igt@kms_prime@basic-crc.html
    - shard-kbl:          [PASS][57] -> [FAIL][58] ([i915#1031] / [i915#93] / [i915#95])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl2/igt@kms_prime@basic-crc.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-kbl7/igt@kms_prime@basic-crc.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][59] -> [FAIL][60] ([i915#1085])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-tglb7/igt@perf@gen12-mi-rpc.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-tglb7/igt@perf@gen12-mi-rpc.html

  
#### Possible fixes ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [DMESG-WARN][61] ([i915#716]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl3/igt@gen9_exec_parse@allowed-all.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-kbl7/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][63] ([i915#454]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-iclb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         [SKIP][65] ([fdo#111644] / [i915#1397]) -> [PASS][66] +4 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-tglb7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-tglb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-iclb:         [SKIP][67] ([fdo#110892]) -> [PASS][68] +4 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [FAIL][69] ([i915#1119] / [i915#95]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-apl7/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [FAIL][71] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-kbl2/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [FAIL][73] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][74] +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][77] ([i915#72]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][79] ([i915#52] / [i915#54]) -> [PASS][80] +6 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [FAIL][81] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglb:         [INCOMPLETE][83] ([i915#456] / [i915#460]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-tglb8/igt@kms_fbcon_fbt@psr-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-tglb8/igt@kms_fbcon_fbt@psr-suspend.html

  * {igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1}:
    - shard-glk:          [FAIL][85] -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-glk4/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-kbl:          [DMESG-WARN][87] ([i915#180]) -> [PASS][88] +7 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-glk:          [FAIL][89] ([i915#49]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [FAIL][91] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-kbl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
    - shard-apl:          [FAIL][93] ([i915#53] / [i915#95]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-apl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [FAIL][95] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [FAIL][97] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][99] ([fdo#109441]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-snb:          [INCOMPLETE][101] ([i915#82]) -> [SKIP][102] ([fdo#109271])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-snb5/igt@i915_pm_dc@dc6-psr.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-snb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-apl:          [FAIL][103] ([i915#95]) -> [FAIL][104] ([i915#1525] / [i915#95])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl2/igt@kms_fbcon_fbt@fbc.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-apl2/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][105] ([i915#95]) -> [DMESG-FAIL][106] ([i915#180] / [i915#95])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][107] ([i915#93] / [i915#95]) -> [DMESG-FAIL][108] ([i915#180] / [i915#95])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][109], [FAIL][110]) ([i915#1423] / [i915#716] / [i915#92]) -> [FAIL][111] ([i915#1423] / [i915#92])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl4/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/shard-kbl3/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/shard-kbl4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109301]: https://bugs.freedesktop.org/show_bug.cgi?id=109301
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5591 -> IGTPW_4467

  CI-20190529: 20190529
  CI_DRM_8301: 7d2bdd2df0d18945bb274de8bc7560e14779e346 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4467: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/index.html
  IGT_5591: f57b7fdbe8d04ce3edf0433a03c7d9d5c3d96680 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4467/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
