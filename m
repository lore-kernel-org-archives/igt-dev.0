Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 04 Jan 2021 14:19:05 -0000
Message-ID: <160976994501.24930.10470139868034788703@emeril.freedesktop.org>
References: <20210104104324.3125175-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210104104324.3125175-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fspin=5Fbatch=3A_Convert_to_dynamic_engine_discovery?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2142268701=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2142268701==
Content-Type: multipart/alternative;
 boundary="===============1006296188769762521=="

--===============1006296188769762521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_spin_batch: Convert to dynamic engine discovery
URL   : https://patchwork.freedesktop.org/series/85438/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9541_full -> IGTPW_5348_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/index.html

New tests
---------

  New tests have been introduced between CI_DRM_9541_full and IGTPW_5348_full:

### New IGT tests (54) ###

  * igt@gem_spin_batch@engines:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@engines@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [3.22, 3.33] s

  * igt@gem_spin_batch@engines@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [3.22, 3.32] s

  * igt@gem_spin_batch@engines@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [3.23, 3.32] s

  * igt@gem_spin_batch@engines@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [3.23, 3.32] s

  * igt@gem_spin_batch@engines@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [3.23, 3.33] s

  * igt@gem_spin_batch@legacy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@legacy-resubmit:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@legacy-resubmit-new:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@legacy-resubmit-new@blt:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@gem_spin_batch@legacy-resubmit-new@bsd:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_spin_batch@legacy-resubmit-new@bsd1:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_spin_batch@legacy-resubmit-new@bsd2:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@gem_spin_batch@legacy-resubmit-new@default:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_spin_batch@legacy-resubmit-new@render:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_spin_batch@legacy-resubmit-new@vebox:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_spin_batch@legacy-resubmit@blt:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_spin_batch@legacy-resubmit@bsd:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_spin_batch@legacy-resubmit@bsd1:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_spin_batch@legacy-resubmit@bsd2:
    - Statuses : 3 pass(s)
    - Exec time: [0.00] s

  * igt@gem_spin_batch@legacy-resubmit@default:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_spin_batch@legacy-resubmit@render:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_spin_batch@legacy-resubmit@vebox:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_spin_batch@legacy@blt:
    - Statuses : 6 pass(s)
    - Exec time: [3.22, 3.33] s

  * igt@gem_spin_batch@legacy@bsd:
    - Statuses : 6 pass(s)
    - Exec time: [3.22, 3.33] s

  * igt@gem_spin_batch@legacy@bsd1:
    - Statuses : 6 pass(s)
    - Exec time: [3.23, 3.33] s

  * igt@gem_spin_batch@legacy@bsd2:
    - Statuses : 3 pass(s)
    - Exec time: [3.22, 3.33] s

  * igt@gem_spin_batch@legacy@default:
    - Statuses : 6 pass(s)
    - Exec time: [3.22, 3.32] s

  * igt@gem_spin_batch@legacy@render:
    - Statuses : 6 pass(s)
    - Exec time: [3.23, 3.33] s

  * igt@gem_spin_batch@legacy@vebox:
    - Statuses : 5 pass(s)
    - Exec time: [3.23, 3.33] s

  * igt@gem_spin_batch@resubmit:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@resubmit-all:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@resubmit-all@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_spin_batch@resubmit-all@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_spin_batch@resubmit-all@vcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_spin_batch@resubmit-all@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@gem_spin_batch@resubmit-all@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_spin_batch@resubmit-new:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@resubmit-new-all:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@resubmit-new-all@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_spin_batch@resubmit-new-all@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_spin_batch@resubmit-new-all@vcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_spin_batch@resubmit-new-all@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_spin_batch@resubmit-new-all@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_spin_batch@resubmit-new@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@gem_spin_batch@resubmit-new@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@gem_spin_batch@resubmit-new@vcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_spin_batch@resubmit-new@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@gem_spin_batch@resubmit-new@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@gem_spin_batch@resubmit@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_spin_batch@resubmit@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_spin_batch@resubmit@vcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_spin_batch@resubmit@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@gem_spin_batch@resubmit@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_5348_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-hang:
    - shard-hsw:          NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#1099]) +6 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-hsw5/igt@gem_ctx_persistence@engines-hang.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglb:         NOTRUN -> [SKIP][2] ([i915#280])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-tglb1/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_reloc@basic-many-active@vcs0:
    - shard-hsw:          NOTRUN -> [FAIL][3] ([i915#2389]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-hsw6/igt@gem_exec_reloc@basic-many-active@vcs0.html

  * igt@gem_exec_whisper@basic-queues:
    - shard-glk:          [PASS][4] -> [DMESG-WARN][5] ([i915#118] / [i915#95])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-glk5/igt@gem_exec_whisper@basic-queues.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-glk1/igt@gem_exec_whisper@basic-queues.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-iclb:         NOTRUN -> [SKIP][6] ([fdo#110892])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp.html
    - shard-tglb:         NOTRUN -> [SKIP][7] ([fdo#111644] / [i915#1397] / [i915#2411])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([i915#579])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-iclb7/igt@i915_pm_rpm@reg-read-ioctl.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-iclb5/igt@i915_pm_rpm@reg-read-ioctl.html
    - shard-hsw:          [PASS][10] -> [SKIP][11] ([fdo#109271]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-hsw6/igt@i915_pm_rpm@reg-read-ioctl.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-hsw7/igt@i915_pm_rpm@reg-read-ioctl.html
    - shard-tglb:         [PASS][12] -> [SKIP][13] ([i915#579])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-tglb3/igt@i915_pm_rpm@reg-read-ioctl.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-tglb8/igt@i915_pm_rpm@reg-read-ioctl.html
    - shard-kbl:          [PASS][14] -> [SKIP][15] ([fdo#109271]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-kbl3/igt@i915_pm_rpm@reg-read-ioctl.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-kbl3/igt@i915_pm_rpm@reg-read-ioctl.html
    - shard-apl:          [PASS][16] -> [SKIP][17] ([fdo#109271]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-apl3/igt@i915_pm_rpm@reg-read-ioctl.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-apl2/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-snb:          NOTRUN -> [SKIP][18] ([fdo#109271]) +23 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-snb7/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][19] ([i915#1602]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-iclb5/igt@i915_suspend@fence-restore-untiled.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][20] ([i915#1602] / [i915#2635]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-glk2/igt@i915_suspend@fence-restore-untiled.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][21] ([i915#155])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-kbl3/igt@i915_suspend@fence-restore-untiled.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][22] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-tglb8/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([i915#2597])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-tglb3/igt@kms_async_flips@test-time-stamp.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-tglb1/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-tglb:         NOTRUN -> [SKIP][25] ([fdo#111615]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-tglb2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_ccs@pipe-a-bad-aux-stride:
    - shard-kbl:          [PASS][26] -> [DMESG-WARN][27] ([i915#180] / [i915#78])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-kbl4/igt@kms_ccs@pipe-a-bad-aux-stride.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-kbl2/igt@kms_ccs@pipe-a-bad-aux-stride.html

  * igt@kms_chamelium@dp-crc-multiple:
    - shard-snb:          NOTRUN -> [SKIP][28] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-snb7/igt@kms_chamelium@dp-crc-multiple.html

  * igt@kms_chamelium@hdmi-mode-timings:
    - shard-kbl:          NOTRUN -> [SKIP][29] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-kbl6/igt@kms_chamelium@hdmi-mode-timings.html
    - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-iclb4/igt@kms_chamelium@hdmi-mode-timings.html
    - shard-glk:          NOTRUN -> [SKIP][31] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-glk3/igt@kms_chamelium@hdmi-mode-timings.html
    - shard-apl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-apl7/igt@kms_chamelium@hdmi-mode-timings.html

  * igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-tglb3/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-75:
    - shard-hsw:          NOTRUN -> [SKIP][34] ([fdo#109271] / [fdo#111827]) +21 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-hsw4/igt@kms_color_chamelium@pipe-d-ctm-0-75.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([i915#54])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#54])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:
    - shard-kbl:          NOTRUN -> [FAIL][39] ([i915#54])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
    - shard-apl:          NOTRUN -> [FAIL][40] ([i915#54])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
    - shard-glk:          NOTRUN -> [FAIL][41] ([i915#54])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-glk1/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-128x42-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109278]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-kbl:          NOTRUN -> [SKIP][43] ([fdo#109271]) +40 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-kbl4/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109280]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-glk:          [PASS][45] -> [FAIL][46] ([i915#49])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#111825]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - shard-apl:          NOTRUN -> [SKIP][48] ([fdo#109271]) +10 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-apl4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][49] ([fdo#109271]) +8 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-glk6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
    - shard-kbl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [i915#533])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-kbl6/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html

  * igt@kms_plane_lowres@pipe-b-tiling-yf:
    - shard-hsw:          NOTRUN -> [SKIP][51] ([fdo#109271]) +311 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-hsw4/igt@kms_plane_lowres@pipe-b-tiling-yf.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-y:
    - shard-tglb:         [PASS][52] -> [INCOMPLETE][53] ([i915#2473])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-d-tiling-y.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-tglb2/igt@kms_plane_multiple@atomic-pipe-d-tiling-y.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][54] -> [SKIP][55] ([fdo#109441]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-iclb8/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109441])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-iclb7/igt@kms_psr@psr2_suspend.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          NOTRUN -> [DMESG-WARN][57] ([i915#1602] / [i915#2635]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-apl8/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][58] ([i915#1602])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-tglb:         NOTRUN -> [INCOMPLETE][59] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-tglb7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:
    - shard-glk:          [PASS][60] -> [SKIP][61] ([fdo#109271]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-glk3/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-glk2/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-tglb:         [PASS][62] -> [SKIP][63] ([i915#2648])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-tglb2/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-tglb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-iclb:         [PASS][64] -> [SKIP][65] ([fdo#109278])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-iclb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-iclb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([fdo#109289])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-tglb1/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@prime_nv_api@i915_self_import_to_different_fd:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#109291])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-tglb2/igt@prime_nv_api@i915_self_import_to_different_fd.html
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109291])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-iclb4/igt@prime_nv_api@i915_self_import_to_different_fd.html

  * igt@sysfs_heartbeat_interval@mixed@rcs0:
    - shard-kbl:          [PASS][69] -> [INCOMPLETE][70] ([i915#1731])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-kbl7/igt@sysfs_heartbeat_interval@mixed@rcs0.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-kbl7/igt@sysfs_heartbeat_interval@mixed@rcs0.html

  
#### Possible fixes ####

  * {igt@gem_exec_fair@basic-deadline}:
    - shard-kbl:          [FAIL][71] ([i915#2846]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-kbl1/igt@gem_exec_fair@basic-deadline.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-kbl2/igt@gem_exec_fair@basic-deadline.html

  * {igt@gem_exec_fair@basic-pace-share@rcs0}:
    - shard-glk:          [FAIL][73] ([i915#2842]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * {igt@gem_exec_fair@basic-pace-solo@rcs0}:
    - shard-kbl:          [FAIL][75] ([i915#2842]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-kbl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-kbl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-hsw:          [SKIP][77] ([fdo#109271]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-hsw4/igt@i915_pm_rpm@modeset-non-lpsp.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-hsw2/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-kbl1/igt@i915_suspend@debugfs-reader.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-kbl3/igt@i915_suspend@debugfs-reader.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][81] ([i915#2370]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-tglb:         [FAIL][83] ([i915#2346]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][85] ([i915#433]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][87] ([fdo#109642] / [fdo#111068]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-iclb8/igt@kms_psr2_su@page_flip.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][91] ([i915#1804] / [i915#2684]) -> [WARN][92] ([i915#2681] / [i915#2684]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][93], [FAIL][94]) ([i915#2295] / [i915#483]) -> ([FAIL][95], [FAIL][96]) ([i915#1814] / [i915#2295] / [i915#483] / [i915#602])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-kbl1/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-kbl1/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-kbl2/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-kbl2/igt@runner@aborted.html
    - shard-iclb:         [FAIL][97] ([i915#2295] / [i915#2724] / [i915#483]) -> ([FAIL][98], [FAIL][99], [FAIL][100], [FAIL][101]) ([i915#1814] / [i915#2295] / [i915#2426] / [i915#2724] / [i915#483])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-iclb8/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-iclb5/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-iclb3/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-iclb4/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-iclb5/igt@runner@aborted.html
    - shard-apl:          [FAIL][102] ([i915#2295]) -> ([FAIL][103], [FAIL][104], [FAIL][105]) ([i915#1814] / [i915#2295])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-apl7/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-apl7/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-apl8/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-apl2/igt@runner@aborted.html
    - shard-glk:          [FAIL][106] ([i915#2295] / [i915#483] / [k.org#202321]) -> ([FAIL][107], [FAIL][108], [FAIL][109]) ([i915#1814] / [i915#2295] / [k.org#202321])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-glk3/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-glk2/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-glk6/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-glk9/igt@runner@aborted.html
    - shard-tglb:         [FAIL][110] ([i915#2295] / [i915#2667]) -> ([FAIL][111], [FAIL][112], [FAIL][113], [FAIL][114]) ([i915#1602] / [i915#1814] / [i915#2295] / [i915#2426] / [i915#2667])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-tglb8/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-tglb2/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-tglb2/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-tglb8/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-tglb7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1731]: https://gitlab.freedesktop.org/drm/intel/issues/1731
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2370]: https://gitlab.freedesktop.org/drm/intel/issues/2370
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2473]: https://gitlab.freedesktop.org/drm/intel/issues/2473
  [i915#2597]: https://gitlab.freedesktop.org/drm/intel/issues/2597
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2648]: https://gitlab.freedesktop.org/drm/intel/issues/2648
  [i915#2667]: https://gitlab.freedesktop.org/drm/intel/issues/2667
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#2795]: https://gitlab.freedesktop.org/drm/intel/issues/2795
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2803]: https:/

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/index.html

--===============1006296188769762521==
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
<tr><td><b>Series:</b></td><td>i915/gem_spin_batch: Convert to dynamic engi=
ne discovery</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/85438/">https://patchwork.freedesktop.org/series/85438/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5348/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5348/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9541_full -&gt; IGTPW_5348_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/index.=
html</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9541_full and IGTPW_5348_f=
ull:</p>
<h3>New IGT tests (54)</h3>
<ul>
<li>
<p>igt@gem_spin_batch@engines:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@engines@bcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [3.22, 3.33] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@engines@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [3.22, 3.32] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@engines@vcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [3.23, 3.32] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@engines@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.23, 3.32] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@engines@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [3.23, 3.33] s</li>
</ul>
</li>
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
<li>
<p>igt@gem_spin_batch@legacy-resubmit-new:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy-resubmit-new@blt:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy-resubmit-new@bsd:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy-resubmit-new@bsd1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy-resubmit-new@bsd2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy-resubmit-new@default:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy-resubmit-new@render:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy-resubmit-new@vebox:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy-resubmit@blt:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy-resubmit@bsd:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy-resubmit@bsd1:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy-resubmit@bsd2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy-resubmit@default:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy-resubmit@render:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy-resubmit@vebox:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy@blt:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [3.22, 3.33] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy@bsd:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [3.22, 3.33] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy@bsd1:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [3.23, 3.33] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy@bsd2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [3.22, 3.33] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy@default:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [3.22, 3.32] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy@render:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [3.23, 3.33] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy@vebox:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [3.23, 3.33] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit-all:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit-all@bcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit-all@rcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit-all@vcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit-all@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit-all@vecs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit-new:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit-new-all:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit-new-all@bcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit-new-all@rcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit-new-all@vcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit-new-all@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit-new-all@vecs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit-new@bcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit-new@rcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit-new@vcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit-new@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit-new@vecs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit@bcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit@rcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit@vcs0:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@resubmit@vecs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5348_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-hang:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5348/shard-hsw5/igt@gem_ctx_persistence@engines-hang.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1099">i915#1099</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5348/shard-tglb1/igt@gem_ctx_sseu@mmap-args.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/280">i915#2=
80</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs0:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5348/shard-hsw6/igt@gem_exec_reloc@basic-many-active@vc=
s0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2389">i915#2389</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9541/shard-glk5/igt@gem_exec_whisper@basic-queues.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-gl=
k1/igt@gem_exec_whisper@basic-queues.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / [i915#95])</=
li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5348/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110892"=
>fdo#110892</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5348/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111644"=
>fdo#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1397">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2411">i915#2411</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@reg-read-ioctl:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9541/shard-iclb7/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-iclb5=
/igt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9541/shard-hsw6/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-hsw7/i=
gt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9541/shard-tglb3/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-tglb8=
/igt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9541/shard-kbl3/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-kbl3/i=
gt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9541/shard-apl3/igt@i915_pm_rpm@reg-read-ioctl.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-apl2/i=
gt@i915_pm_rpm@reg-read-ioctl.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5348/shard-snb7/igt@i915_pm_rpm@system-suspend-execbuf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5348/shard-iclb5/igt@i915_suspend@fence-restore-untiled.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1602">i915#1602</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5348/shard-glk2/igt@i915_suspend@fence-restore-untiled.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2635">i915#2635</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5348/shard-kbl3/igt@i915_suspend@fence-restore-untiled.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/155">i915#155</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5348/shard-tglb8/igt@i915_suspend@fence-restore-untiled.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1887">i915#1887</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2411">i915#2411</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9541/shard-tglb3/igt@kms_async_flips@test-time-stamp.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard=
-tglb1/igt@kms_async_flips@test-time-stamp.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2597">i915#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5348/shard-tglb2/igt@kms_big_fb@yf-tiled-addfb-size-ove=
rflow.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111615">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9541/shard-kbl4/igt@kms_ccs@pipe-a-bad-aux-stride.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-kb=
l2/igt@kms_ccs@pipe-a-bad-aux-stride.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / [i915#78])</=
li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-multiple:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5348/shard-snb7/igt@kms_chamelium@dp-crc-multiple.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-mode-timings:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5348/shard-kbl6/igt@kms_chamelium@hdmi-mode-timings.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5348/shard-iclb4/igt@kms_chamelium@hdmi-mode-timings.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
84">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5348/shard-glk3/igt@kms_chamelium@hdmi-mode-timings.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5348/shard-apl7/igt@kms_chamelium@hdmi-mode-timings.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5348/shard-tglb3/igt@kms_color_chamelium@pipe-a-ctm-red=
-to-blue.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-75:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5348/shard-hsw4/igt@kms_color_chamelium@pipe-d-ctm-0-75=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9541/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5348/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html">FAIL<=
/a> ([i915#54])</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9541/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5348/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html">FAIL<=
/a> ([i915#54])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5348/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-o=
nscreen.html">FAIL</a> ([i915#54])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5348/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-64x21-o=
nscreen.html">FAIL</a> ([i915#54])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5348/shard-glk1/igt@kms_cursor_crc@pipe-b-cursor-64x21-o=
nscreen.html">FAIL</a> ([i915#54])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-128x42-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5348/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-128x4=
2-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109278">fdo#109278</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5348/shard-kbl4/igt@kms_cursor_crc@pipe-d-cursor-suspen=
d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) +40 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5348/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9541/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-in=
dfb-draw-pwrite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5348/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-cur-indfb-draw-pwrite.html">FAIL</a> ([i915#49])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5348/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5348/shard-apl4/igt@kms_frontbuffer_tracking@psr-1p-pri=
mscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271">fdo#109271</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5348/shard-glk6/igt@kms_frontbuffer_tracking@psr-rgb565=
-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5348/shard-kbl6/igt@kms_pipe_crc_basic@nonblocking-crc-=
pipe-d-frame-sequence.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-yf:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5348/shard-hsw4/igt@kms_plane_lowres@pipe-b-tiling-yf.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) +311 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-y:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9541/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-d-tiling-y.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5348/shard-tglb2/igt@kms_plane_multiple@atomic-pipe-d-tiling-y.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2473">=
i915#2473</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9541/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-iclb8/i=
gt@kms_psr@psr2_cursor_blt.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5348/shard-iclb7/igt@kms_psr@psr2_suspend.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#10=
9441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5348/shard-apl8/igt@kms_vblank@pipe-b-ts-continuation-su=
spend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2635">i915#2635</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5348/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-su=
spend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1602">i915#1602</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5348/shard-tglb7/igt@kms_vblank@pipe-b-ts-continuation-s=
uspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/1798">i915#1798</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/1982">i915#1982</a> / [i915#456])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9541/shard-glk3/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
348/shard-glk2/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9541/shard-tglb2/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5348/shard-tglb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2648">i915#=
2648</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9541/shard-iclb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5348/shard-iclb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">fdo#=
109278</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5348/shard-tglb1/igt@perf@gen8-unprivileged-single-ctx-=
counters.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_self_import_to_different_fd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5348/shard-tglb2/igt@prime_nv_api@i915_self_import_to_di=
fferent_fd.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109291">fdo#109291</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5348/shard-iclb4/igt@prime_nv_api@i915_self_import_to_di=
fferent_fd.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109291">fdo#109291</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9541/shard-kbl7/igt@sysfs_heartbeat_interval@mixed@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/sh=
ard-kbl7/igt@sysfs_heartbeat_interval@mixed@rcs0.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1731">i915#1731</a>)=
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_exec_fair@basic-deadline}:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9541/shard-kbl1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i=
915#2846]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5348/shard-kbl2/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace-share@rcs0}:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9541/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL<=
/a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5348/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace-solo@rcs0}:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9541/shard-kbl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</=
a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5348/shard-kbl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9541/shard-hsw4/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/s=
hard-hsw2/igt@i915_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9541/shard-kbl1/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/=
shard-kbl3/igt@i915_suspend@debugfs-reader.html">PASS</a> +1 similar issue<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9541/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2370">i=
915#2370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5348/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9541/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transi=
tions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2346">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5348/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-atomi=
c-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9541/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([=
i915#433]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5348/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9541/shard-iclb8/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> /=
 <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#1110=
68</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_534=
8/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9541/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/=
shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9541/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#180=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i9=
15#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5348/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#268=
4</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9541/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9541/shard-kbl1/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2295">i915#2295</a> / [i915#483]) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5348/shard-kbl2/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-kb=
l2/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2295">i915#2295</a> / [i915#483] / [i915#602])=
</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9541/shard-iclb8/igt@runner@aborted.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2724">i915#2724</a> / [i91=
5#483]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_53=
48/shard-iclb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-iclb3/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/sh=
ard-iclb4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5348/shard-iclb5/igt@runner@aborted.html">FAIL<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915=
#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295=
">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2426">i915#2426</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2724">i915#2724</a> / [i915#483])</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9541/shard-apl7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-apl7/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5348/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-apl2/igt@runner@ab=
orted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2295">i915#2295</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9541/shard-glk3/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / [i915#483] =
/ [k.org#202321]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5348/shard-glk2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-glk6/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5348/shard-glk9/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / [k.org#202=
321])</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9541/shard-tglb8/igt@runner@aborted.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2667">i915#2667</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-tglb=
2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5348/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5348/shard-tglb8/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5348/shard-tglb7/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#=
2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2426"=
>i915#2426</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2667">i915#2667</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============1006296188769762521==--

--===============2142268701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2142268701==--
