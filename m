Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 05 Jan 2021 15:55:49 -0000
Message-ID: <160986214959.13806.14063636928242901940@emeril.freedesktop.org>
References: <20210105111343.14332-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210105111343.14332-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fscaling=3A_reduce_repetitive_work_per_round?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0359144700=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0359144700==
Content-Type: multipart/alternative;
 boundary="===============9142092410435952968=="

--===============9142092410435952968==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_scaling: reduce repetitive work per round
URL   : https://patchwork.freedesktop.org/series/85498/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9545_full -> IGTPW_5354_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/index.html

New tests
---------

  New tests have been introduced between CI_DRM_9545_full and IGTPW_5354_full:

### New IGT tests (2) ###

  * igt@gem_spin_batch@legacy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@legacy-resubmit:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_5354_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-cleanup:
    - shard-hsw:          NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#1099]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-hsw7/igt@gem_ctx_persistence@engines-cleanup.html

  * igt@gem_pread@exhaustion:
    - shard-hsw:          NOTRUN -> [WARN][2] ([i915#2658])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-hsw7/igt@gem_pread@exhaustion.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-iclb:         NOTRUN -> [SKIP][3] ([fdo#109289])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-iclb2/igt@gen7_exec_parse@bitmasks.html
    - shard-tglb:         NOTRUN -> [SKIP][4] ([fdo#109289])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-tglb1/igt@gen7_exec_parse@bitmasks.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-apl:          [PASS][5] -> [DMESG-WARN][6] ([i915#1909])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-apl6/igt@i915_pm_rpm@system-suspend-modeset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-apl2/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_selftest@live@execlists:
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8] ([i915#1037] / [i915#2268])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-tglb3/igt@i915_selftest@live@execlists.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-tglb1/igt@i915_selftest@live@execlists.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [PASS][9] -> [FAIL][10] ([i915#2597])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-tglb6/igt@kms_async_flips@test-time-stamp.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-tglb2/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - shard-hsw:          NOTRUN -> [SKIP][11] ([fdo#109271] / [fdo#111827]) +12 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-hsw6/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-cmp-planar-formats:
    - shard-iclb:         NOTRUN -> [SKIP][12] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-iclb7/igt@kms_chamelium@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][13] ([fdo#109271] / [fdo#111827])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-kbl4/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html
    - shard-glk:          NOTRUN -> [SKIP][14] ([fdo#109271] / [fdo#111827])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-glk4/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html
    - shard-apl:          NOTRUN -> [SKIP][15] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-apl7/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html

  * igt@kms_color_chamelium@pipe-b-ctm-negative:
    - shard-tglb:         NOTRUN -> [SKIP][16] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-tglb1/igt@kms_color_chamelium@pipe-b-ctm-negative.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding:
    - shard-kbl:          NOTRUN -> [SKIP][17] ([fdo#109271]) +8 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][18] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-iclb1/igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#165])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][21] ([fdo#109279]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html
    - shard-glk:          NOTRUN -> [SKIP][22] ([fdo#109271]) +7 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-glk9/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([fdo#109274] / [fdo#109278])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-iclb3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([fdo#111825]) +4 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-tglb8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
    - shard-iclb:         NOTRUN -> [SKIP][25] ([fdo#109274])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-iclb4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-tglb:         NOTRUN -> [FAIL][26] ([i915#2122])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-tglb3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
    - shard-apl:          NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#2642])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-apl3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
    - shard-glk:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#2642])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-glk5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
    - shard-kbl:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#2642])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-kbl3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-apl:          NOTRUN -> [SKIP][30] ([fdo#109271]) +18 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-apl3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#109280]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-iclb:         [PASS][32] -> [INCOMPLETE][33] ([i915#1185] / [i915#123])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-iclb:         [PASS][34] -> [DMESG-WARN][35] ([i915#1602])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-iclb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
    - shard-glk:          [PASS][36] -> [DMESG-WARN][37] ([i915#1602] / [i915#2635])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-glk6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
    - shard-apl:          [PASS][38] -> [DMESG-WARN][39] ([i915#1602] / [i915#2635])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
    - shard-kbl:          [PASS][40] -> [INCOMPLETE][41] ([i915#155] / [i915#2828])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
    - shard-tglb:         [PASS][42] -> [INCOMPLETE][43] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#2828] / [i915#456])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-tglb8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-apl:          NOTRUN -> [FAIL][44] ([fdo#108145] / [i915#265])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109278]) +5 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-iclb2/igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_lowres@pipe-b-tiling-yf:
    - shard-hsw:          NOTRUN -> [SKIP][46] ([fdo#109271]) +190 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-hsw6/igt@kms_plane_lowres@pipe-b-tiling-yf.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#111615])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-c-tiling-yf.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][48] -> [SKIP][49] ([fdo#109441]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@prime_nv_api@i915_nv_import_vs_close:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#109291])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-tglb6/igt@prime_nv_api@i915_nv_import_vs_close.html
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109291])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-iclb8/igt@prime_nv_api@i915_nv_import_vs_close.html

  
#### Possible fixes ####

  * {igt@gem_exec_fair@basic-pace@rcs0}:
    - shard-kbl:          [FAIL][52] ([i915#2842]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html

  * {igt@gem_exec_fair@basic-pace@vecs0}:
    - shard-glk:          [FAIL][54] ([i915#2842]) -> [PASS][55] +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-glk8/igt@gem_exec_fair@basic-pace@vecs0.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-glk4/igt@gem_exec_fair@basic-pace@vecs0.html

  * {igt@gem_exec_fair@basic-throttle@rcs0}:
    - shard-iclb:         [FAIL][56] ([i915#2849]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][58] ([i915#2389]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * {igt@gem_exec_schedule@u-fairslice@rcs0}:
    - shard-iclb:         [DMESG-WARN][60] ([i915#2803]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb1/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-iclb4/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * {igt@gem_exec_schedule@u-fairslice@vcs1}:
    - shard-tglb:         [DMESG-WARN][62] ([i915#2803]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-tglb8/igt@gem_exec_schedule@u-fairslice@vcs1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-tglb8/igt@gem_exec_schedule@u-fairslice@vcs1.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [DMESG-WARN][64] ([i915#118] / [i915#95]) -> [PASS][65] +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-glk3/igt@gem_exec_whisper@basic-queues-forked-all.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-glk5/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-glk:          [FAIL][66] ([i915#49]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_plane_lowres@pipe-b-tiling-x:
    - shard-kbl:          [DMESG-WARN][68] ([i915#165] / [i915#180] / [i915#78]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-kbl2/igt@kms_plane_lowres@pipe-b-tiling-x.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-kbl2/igt@kms_plane_lowres@pipe-b-tiling-x.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][70] ([fdo#109441]) -> [PASS][71] +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][72] ([i915#2684]) -> [WARN][73] ([i915#1804] / [i915#2684])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][74] ([i915#1804] / [i915#2684]) -> [WARN][75] ([i915#2681] / [i915#2684])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][76] ([i915#1226]) -> [SKIP][77] ([fdo#109349])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][78] ([i915#2295] / [i915#483]) -> [FAIL][79] ([i915#2295])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-kbl1/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-kbl7/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][80], [FAIL][81]) ([i915#2295] / [i915#2426] / [i915#2724] / [i915#483]) -> ([FAIL][82], [FAIL][83]) ([i915#1814] / [i915#2295] / [i915#2724] / [i915#483])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb1/igt@runner@aborted.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb6/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-iclb1/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-iclb4/igt@runner@aborted.html
    - shard-apl:          ([FAIL][84], [FAIL][85]) ([i915#1610] / [i915#2295] / [i915#2426]) -> ([FAIL][86], [FAIL][87], [FAIL][88], [FAIL][89]) ([fdo#109271] / [i915#1610] / [i915#1814] / [i915#2295] / [i915#2426])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-apl7/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-apl2/igt@runner@aborted.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-apl7/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-apl1/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-apl2/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-apl2/igt@runner@aborted.html
    - shard-glk:          [FAIL][90] ([i915#2295] / [k.org#202321]) -> ([FAIL][91], [FAIL][92]) ([i915#1814] / [i915#2295] / [k.org#202321])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-glk8/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-glk6/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-glk1/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][93], [FAIL][94]) ([i915#2295] / [i915#2426] / [i915#2667] / [i915#2803]) -> ([FAIL][95], [FAIL][96]) ([i915#1602] / [i915#2295] / [i915#2667])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-tglb8/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-tglb7/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-tglb8/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-tglb2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1037]: https://gitlab.freedesktop.org/drm/intel/issues/1037
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1909]: https://gitlab.freedesktop.org/drm/intel/issues/1909
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2268]: https://gitlab.freedesktop.org/drm/intel/issues/2268
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2597]: https://gitlab.freedesktop.org/drm/intel/issues/2597
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2642]: https://gitlab.freedesktop.org/drm/intel/issues/2642
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2667]: https://gitlab.freedesktop.org/drm/intel/issues/2667
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#2803]: https://gitlab.freedesktop.org/drm/intel/issues/2803
  [i915#2804]: https://gitlab.freedesktop.org/drm/intel/issues/2804
  [i915#2828]: https://gitlab.freedesktop.org/drm/intel/issues/2828
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5942 -> IGTPW_5354
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9545: a412bacbe58bb98252a6b55f6390857a20689fc6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5354: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/index.html
  IGT_5942: e14e76a87c44c684ec958b391b030bb549254f88 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/index.html

--===============9142092410435952968==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_scaling: reduce repetitive w=
ork per round</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/85498/">https://patchwork.freedesktop.org/series/85498/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5354/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5354/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9545_full -&gt; IGTPW_5354_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/index.=
html</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9545_full and IGTPW_5354_f=
ull:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@gem_spin_batch@legacy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy-resubmit:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5354_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-cleanup:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5354/shard-hsw7/igt@gem_ctx_persistence@engines-cleanup=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1099">i915#1099</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5354/shard-hsw7/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5354/shard-iclb2/igt@gen7_exec_parse@bitmasks.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo=
#109289</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5354/shard-tglb1/igt@gen7_exec_parse@bitmasks.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo=
#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-apl6/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/sha=
rd-apl2/igt@i915_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1909">i915#1909</a>)</=
li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-tglb3/igt@i915_selftest@live@execlists.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-tg=
lb1/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/1037">i915#1037</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2268">i915#2268</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-tglb6/igt@kms_async_flips@test-time-stamp.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard=
-tglb2/igt@kms_async_flips@test-time-stamp.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2597">i915#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5354/shard-hsw6/igt@kms_chamelium@common-hpd-after-susp=
end.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5354/shard-iclb7/igt@kms_chamelium@hdmi-cmp-planar-form=
ats.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5354/shard-kbl4/igt@kms_chamelium@hdmi-hpd-for-each-pipe=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5354/shard-glk4/igt@kms_chamelium@hdmi-hpd-for-each-pipe=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5354/shard-apl7/igt@kms_chamelium@hdmi-hpd-for-each-pipe=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-negative:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5354/shard-tglb1/igt@kms_color_chamelium@pipe-b-ctm-neg=
ative.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5354/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-512x17=
0-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5354/shard-iclb1/igt@kms_cursor_crc@pipe-b-cursor-512x5=
12-rapid-movement.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109279">fdo#109279</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/s=
hard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5354/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x51=
2-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109279">fdo#109279</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5354/shard-glk9/igt@kms_cursor_crc@pipe-d-cursor-512x512=
-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5354/shard-iclb3/igt@kms_cursor_legacy@2x-long-flip-vs-=
cursor-legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5354/shard-tglb8/igt@kms_flip@2x-flip-vs-dpms-off-vs-mod=
eset.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111825">fdo#111825</a>) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5354/shard-iclb4/igt@kms_flip@2x-flip-vs-dpms-off-vs-mod=
eset.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109274">fdo#109274</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5354/shard-tglb3/igt@kms_flip@flip-vs-blocking-wf-vblan=
k@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5354/shard-apl3/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-64bpp-ytile.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2642">i915#2642</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5354/shard-glk5/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-64bpp-ytile.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2642">i915#2642</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5354/shard-kbl3/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-64bpp-ytile.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2642">i915#2642</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5354/shard-apl3/igt@kms_frontbuffer_tracking@fbc-2p-pri=
mscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5354/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +2 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_53=
54/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1185">i915=
#1185</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/123"=
>i915#123</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-iclb6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5354/shard-iclb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602"=
>i915#1602</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
354/shard-glk6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i=
915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
635">i915#2635</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
354/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i=
915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
635">i915#2635</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
354/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/155">i9=
15#155</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/282=
8">i915#2828</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5354/shard-tglb8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436"=
>i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1798">i915#1798</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1982">i915#1982</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2828">i915#2828</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/456">i915#456</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5354/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-=
7efc.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5354/shard-iclb2/igt@kms_plane_alpha_blend@pipe-d-cover=
age-vs-premult-vs-constant.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109278">fdo#109278</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-yf:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5354/shard-hsw6/igt@kms_plane_lowres@pipe-b-tiling-yf.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) +190 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5354/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-c-t=
iling-yf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-=
iclb8/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar =
issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_vs_close:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5354/shard-tglb6/igt@prime_nv_api@i915_nv_import_vs_clos=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109291">fdo#109291</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5354/shard-iclb8/igt@prime_nv_api@i915_nv_import_vs_clos=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109291">fdo#109291</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_exec_fair@basic-pace@rcs0}:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/sh=
ard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace@vecs0}:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-glk8/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/s=
hard-glk4/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +2 similar issu=
es</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-throttle@rcs0}:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2849">i915#2=
849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_53=
54/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i91=
5#2389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5354/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@rcs0}:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-iclb1/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2803"=
>i915#2803</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5354/shard-iclb4/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@vcs1}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-tglb8/igt@gem_exec_schedule@u-fairslice@vcs1.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2803"=
>i915#2803</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5354/shard-tglb8/igt@gem_exec_schedule@u-fairslice@vcs1.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-glk3/igt@gem_exec_whisper@basic-queues-forked-all.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
118">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5354/shard-glk5/igt@gem_exec_whisper@basic-queues-forked-all.html=
">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-in=
dfb-onoff.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/49">i915#49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5354/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscr=
n-cur-indfb-onoff.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-x:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-kbl2/igt@kms_plane_lowres@pipe-b-tiling-x.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/165">i91=
5#165</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180"=
>i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
78">i915#78</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5354/shard-kbl2/igt@kms_plane_lowres@pipe-b-tiling-x.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#10944=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354=
/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> +1 similar is=
sue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#268=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354=
/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)=
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i91=
5#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5354/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1226">i9=
15#1226</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5354/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109349">fdo#109349</a=
>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-kbl1/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-kbl7/igt=
@runner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2295">i915#2295</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb6/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2426">i915#2426</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2724">i915#2724</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/483">i915#483</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-iclb1/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/sh=
ard-iclb4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2724">i915#2724</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-apl2/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1610">i915#1610</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2426">i915#2426</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5354/shard-apl7/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-apl=
1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5354/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-apl2/igt@r=
unner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/1610">i915#1610</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-glk8/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>) -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-gl=
k6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5354/shard-glk1/igt@runner@aborted.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2=
295</a> / <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">=
k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-tglb7/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2426">i915#2426</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2667">i915#2667</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2803">i915#2803</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/shard-tglb8/igt@runner@aborted.html=
">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/=
shard-tglb2/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2667">i915#2667</a>)</p>
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
<li>IGT: IGT_5942 -&gt; IGTPW_5354</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9545: a412bacbe58bb98252a6b55f6390857a20689fc6 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5354: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5354/index.htm=
l<br />
  IGT_5942: e14e76a87c44c684ec958b391b030bb549254f88 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============9142092410435952968==--

--===============0359144700==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0359144700==--
