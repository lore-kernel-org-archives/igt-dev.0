Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 08 Jan 2021 19:51:53 -0000
Message-ID: <161013551327.332.3152784884819646503@emeril.freedesktop.org>
References: <20210108135845.4096422-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210108135845.4096422-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fscheduler=3A_Check_dependency_chains_around_engines?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2080423181=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2080423181==
Content-Type: multipart/alternative;
 boundary="===============4781849588754651321=="

--===============4781849588754651321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_exec_scheduler: Check dependency chains around engines
URL   : https://patchwork.freedesktop.org/series/85616/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9566_full -> IGTPW_5371_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5371_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4}:
    - shard-iclb:         NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html

  * {igt@kms_psr2_sf@plane-move-sf-dmg-area-2}:
    - shard-tglb:         NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb7/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9566_full and IGTPW_5371_full:

### New IGT tests (12) ###

  * igt@gem_exec_schedule@noreorder:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@noreorder-priority:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@noreorder-priority@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [1.13, 1.16] s

  * igt@gem_exec_schedule@noreorder-priority@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [1.11, 1.13] s

  * igt@gem_exec_schedule@noreorder-priority@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [1.11, 1.14] s

  * igt@gem_exec_schedule@noreorder-priority@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [1.10] s

  * igt@gem_exec_schedule@noreorder-priority@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [1.10, 1.13] s

  * igt@gem_exec_schedule@noreorder@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.06, 0.08] s

  * igt@gem_exec_schedule@noreorder@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.04, 0.06] s

  * igt@gem_exec_schedule@noreorder@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.04, 0.07] s

  * igt@gem_exec_schedule@noreorder@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.04, 0.08] s

  * igt@gem_exec_schedule@noreorder@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.05, 0.10] s

  

Known issues
------------

  Here are the changes found in IGTPW_5371_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-2x:
    - shard-tglb:         NOTRUN -> [SKIP][3] ([i915#1839])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb6/igt@feature_discovery@display-2x.html

  * igt@gem_ctx_persistence@engines-hang:
    - shard-hsw:          NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#1099]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-hsw2/igt@gem_ctx_persistence@engines-hang.html

  * igt@gem_eio@in-flight-contexts-immediate:
    - shard-hsw:          [PASS][5] -> [INCOMPLETE][6] ([i915#2870])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-hsw7/igt@gem_eio@in-flight-contexts-immediate.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-hsw6/igt@gem_eio@in-flight-contexts-immediate.html

  * {igt@gem_exec_schedule@noreorder-priority} (NEW):
    - shard-snb:          NOTRUN -> [SKIP][7] ([fdo#109271]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-snb7/igt@gem_exec_schedule@noreorder-priority.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][8] -> [SKIP][9] ([i915#2190])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-tglb5/igt@gem_huc_copy@huc-copy.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][10] ([i915#768]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb7/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html

  * igt@gem_userptr_blits@process-exit-mmap@wc:
    - shard-hsw:          NOTRUN -> [SKIP][11] ([fdo#109271]) +153 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-hsw2/igt@gem_userptr_blits@process-exit-mmap@wc.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-iclb:         NOTRUN -> [SKIP][12] ([fdo#112306])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb6/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][13] ([fdo#112306]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb7/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-hsw:          [PASS][14] -> [WARN][15] ([i915#1519])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-hsw2/igt@i915_pm_rc6_residency@rc6-fence.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-hsw5/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][16] ([fdo#111644] / [i915#1397] / [i915#2411])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-iclb:         NOTRUN -> [SKIP][17] ([fdo#110892])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-kbl:          [PASS][18] -> [SKIP][19] ([fdo#109271])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-kbl3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-hsw:          [PASS][20] -> [SKIP][21] ([fdo#109271])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-hsw4/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-hsw7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-glk:          [PASS][22] -> [SKIP][23] ([fdo#109271])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-glk1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-glk6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-apl:          [PASS][24] -> [SKIP][25] ([fdo#109271])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-apl7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-apl3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][26] ([i915#2373])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb2/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][27] ([i915#1759] / [i915#2291])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-iclb:         [PASS][28] -> [DMESG-WARN][29] ([i915#1602]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-iclb3/igt@i915_suspend@fence-restore-untiled.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb1/igt@i915_suspend@fence-restore-untiled.html
    - shard-glk:          [PASS][30] -> [DMESG-WARN][31] ([i915#1602] / [i915#2635]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-glk2/igt@i915_suspend@fence-restore-untiled.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-glk4/igt@i915_suspend@fence-restore-untiled.html
    - shard-kbl:          [PASS][32] -> [DMESG-WARN][33] ([i915#1602]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-kbl2/igt@i915_suspend@fence-restore-untiled.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl4/igt@i915_suspend@fence-restore-untiled.html
    - shard-tglb:         [PASS][34] -> [DMESG-WARN][35] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-tglb7/igt@i915_suspend@fence-restore-untiled.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb6/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb7/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111614]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo:
    - shard-glk:          NOTRUN -> [SKIP][38] ([fdo#109271]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-glk6/igt@kms_ccs@pipe-c-ccs-on-another-bo.html

  * igt@kms_chamelium@dp-audio:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109284] / [fdo#111827])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb4/igt@kms_chamelium@dp-audio.html

  * igt@kms_color@pipe-c-ctm-0-25:
    - shard-iclb:         NOTRUN -> [FAIL][40] ([i915#1149] / [i915#315])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb6/igt@kms_color@pipe-c-ctm-0-25.html
    - shard-tglb:         NOTRUN -> [FAIL][41] ([i915#1149] / [i915#315])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb2/igt@kms_color@pipe-c-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-75:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
    - shard-kbl:          NOTRUN -> [SKIP][43] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl4/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-d-gamma:
    - shard-hsw:          NOTRUN -> [SKIP][44] ([fdo#109271] / [fdo#111827]) +12 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-hsw4/igt@kms_color_chamelium@pipe-d-gamma.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109278] / [fdo#109279])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb1/igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109278]) +6 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb5/igt@kms_cursor_crc@pipe-d-cursor-512x170-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#109279]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109274] / [fdo#109278])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-tglb:         NOTRUN -> [FAIL][49] ([i915#2346])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([i915#426])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb6/igt@kms_dp_tiled_display@basic-test-pattern.html
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#426])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb7/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109274])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb3/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-apl:          NOTRUN -> [SKIP][53] ([fdo#109271]) +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-apl1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#111825]) +12 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt:
    - shard-kbl:          NOTRUN -> [SKIP][55] ([fdo#109271]) +30 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109280]) +7 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [i915#533])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl3/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html

  * igt@kms_plane@plane-panning-top-left-pipe-a-planes:
    - shard-glk:          [PASS][58] -> [FAIL][59] ([i915#1036])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-glk2/igt@kms_plane@plane-panning-top-left-pipe-a-planes.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-glk6/igt@kms_plane@plane-panning-top-left-pipe-a-planes.html

  * igt@kms_plane@plane-position-hole-dpms-pipe-c-planes:
    - shard-glk:          [PASS][60] -> [FAIL][61] ([i915#2472])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-glk6/igt@kms_plane@plane-position-hole-dpms-pipe-c-planes.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-glk6/igt@kms_plane@plane-position-hole-dpms-pipe-c-planes.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][62] -> [SKIP][63] ([fdo#109441]) +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#109309])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb1/igt@kms_tv_load_detect@load-detect.html
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109309])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [PASS][66] -> [DMESG-WARN][67] ([i915#1602] / [i915#2635]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-apl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-hsw:          [PASS][68] -> [DMESG-WARN][69] ([i915#2637]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-hsw5/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-hsw7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-tglb:         [PASS][70] -> [INCOMPLETE][71] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-tglb7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-accuracy-idle:
    - shard-glk:          [PASS][72] -> [FAIL][73] ([i915#43])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-glk9/igt@kms_vblank@pipe-c-accuracy-idle.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-glk1/igt@kms_vblank@pipe-c-accuracy-idle.html

  * igt@kms_vrr@flipline:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([fdo#109502])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb2/igt@kms_vrr@flipline.html
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109502])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb5/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#2437])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb3/igt@kms_writeback@writeback-fb-id.html

  * igt@nouveau_crc@pipe-a-source-outp-complete:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([i915#2530])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb3/igt@nouveau_crc@pipe-a-source-outp-complete.html
    - shard-iclb:         NOTRUN -> [SKIP][78] ([i915#2530])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb2/igt@nouveau_crc@pipe-a-source-outp-complete.html

  * igt@perf@mi-rpc:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#109289]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb2/igt@perf@mi-rpc.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#109289])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb3/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@polling-parameterized:
    - shard-iclb:         [PASS][81] -> [FAIL][82] ([i915#1542])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-iclb8/igt@perf@polling-parameterized.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb8/igt@perf@polling-parameterized.html

  * igt@prime_vgem@fence-read-hang:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([fdo#109295])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb7/igt@prime_vgem@fence-read-hang.html
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109295])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb4/igt@prime_vgem@fence-read-hang.html

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> ([FAIL][85], [FAIL][86]) ([i915#2295] / [i915#2505])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-hsw7/igt@runner@aborted.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-hsw4/igt@runner@aborted.html

  
#### Possible fixes ####

  * {igt@gem_exec_fair@basic-deadline}:
    - shard-glk:          [FAIL][87] ([i915#2846]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-glk2/igt@gem_exec_fair@basic-deadline.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-glk2/igt@gem_exec_fair@basic-deadline.html

  * {igt@gem_exec_fair@basic-none-share@rcs0}:
    - shard-kbl:          [FAIL][89] ([i915#2842]) -> [PASS][90] +3 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-kbl7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl6/igt@gem_exec_fair@basic-none-share@rcs0.html

  * {igt@gem_exec_fair@basic-pace@rcs0}:
    - shard-tglb:         [FAIL][91] ([i915#2842]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-tglb1/igt@gem_exec_fair@basic-pace@rcs0.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb3/igt@gem_exec_fair@basic-pace@rcs0.html

  * {igt@gem_exec_fair@basic-pace@vecs0}:
    - shard-kbl:          [SKIP][93] ([fdo#109271]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html

  * {igt@gem_exec_schedule@u-fairslice@rcs0}:
    - shard-kbl:          [DMESG-WARN][95] ([i915#1610] / [i915#2803]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-kbl1/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl1/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-priority:
    - shard-glk:          [DMESG-WARN][97] ([i915#118] / [i915#95]) -> [PASS][98] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-glk5/igt@gem_exec_whisper@basic-contexts-priority.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-glk2/igt@gem_exec_whisper@basic-contexts-priority.html

  * {igt@gem_vm_create@destroy-race}:
    - shard-tglb:         [TIMEOUT][99] ([i915#2795]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-tglb8/igt@gem_vm_create@destroy-race.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb5/igt@gem_vm_create@destroy-race.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-tglb:         [INCOMPLETE][101] ([i915#2295] / [i915#456]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-tglb2/igt@gem_workarounds@suspend-resume-context.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb2/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-hsw:          [SKIP][103] ([fdo#109271]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-hsw6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-hsw7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-apl:          [SKIP][105] ([fdo#109271]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-apl1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-apl1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-glk:          [SKIP][107] ([fdo#109271]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-glk6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-glk5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [FAIL][109] ([i915#54]) -> [PASS][110] +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
    - shard-apl:          [FAIL][111] ([i915#54]) -> [PASS][112] +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
    - shard-glk:          [FAIL][113] ([i915#54]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-glk2/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [FAIL][115] ([i915#2598]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-iclb:         [DMESG-WARN][117] ([i915#1602]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-iclb4/igt@kms_frontbuffer_tracking@psr-suspend.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb4/igt@kms_frontbuffer_tracking@psr-suspend.html
    - shard-tglb:         [DMESG-WARN][119] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-tglb2/igt@kms_frontbuffer_tracking@psr-suspend.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb1/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [INCOMPLETE][121] -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-kbl:          [DMESG-WARN][123] ([i915#165] / [i915#180] / [i915#2621] / [i915#78]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-kbl2/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl1/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][125] ([fdo#109642] / [fdo#111068]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-iclb7/igt@kms_psr2_su@frontbuffer.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][127] ([fdo#109441]) -> [PASS][128] +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-iclb6/igt@kms_psr@psr2_cursor_render.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][129] ([i915#2681] / [i915#2684]) -> [WARN][130] ([i915#1804] / [i915#2684])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglb:         [SKIP][131] ([fdo#111644] / [i915#1397] / [i915#2411]) -> [SKIP][132] ([i915#579])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-tglb5/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-iclb:         [SKIP][133] ([fdo#110892]) -> [SKIP][134] ([i915#579])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [SKIP][135] ([fdo#109271]) -> [TIMEOUT][136] ([i915#1319])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-apl1/igt@kms_content_protection@srm.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-apl8/igt@kms_content_protection@srm.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][137] ([fdo#109349]) -> [DMESG-WARN][138] ([i915#1226])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][139], [FAIL][140]) ([i915#2295] / [i915#2426] / [i915#2505]) -> ([FAIL][141], [FAIL][142], [FAIL][143]) ([i915#1814] / [i915#2295] / [i915#2505] / [i915#602])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-kbl1/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-kbl6/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl2/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl4/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl6/igt@runner@aborted.html
    - shard-apl:          [FAIL][144] ([i915#2295]) -> ([FAIL][145], [FAIL][146], [FAIL][147]) ([i915#1814] / [i915#2295])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-apl2/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-apl7/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-apl3/igt@runner@aborted.html
   [147]: https://i

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/index.html

--===============4781849588754651321==
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
<tr><td><b>Series:</b></td><td>i915/gem_exec_scheduler: Check dependency chains around engines</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85616/">https://patchwork.freedesktop.org/series/85616/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9566_full -&gt; IGTPW_5371_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5371_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4}:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@plane-move-sf-dmg-area-2}:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb7/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9566_full and IGTPW_5371_full:</p>
<h3>New IGT tests (12)</h3>
<ul>
<li>
<p>igt@gem_exec_schedule@noreorder:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@noreorder-priority:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@noreorder-priority@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.13, 1.16] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@noreorder-priority@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.11, 1.13] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@noreorder-priority@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.11, 1.14] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@noreorder-priority@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@noreorder-priority@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.10, 1.13] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@noreorder@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.06, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@noreorder@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.04, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@noreorder@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.04, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@noreorder@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.04, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@noreorder@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.05, 0.10] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5371_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb6/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-hsw2/igt@gem_ctx_persistence@engines-hang.html">SKIP</a> ([fdo#109271] / [i915#1099]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-immediate:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-hsw7/igt@gem_eio@in-flight-contexts-immediate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-hsw6/igt@gem_eio@in-flight-contexts-immediate.html">INCOMPLETE</a> ([i915#2870])</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@noreorder-priority} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-snb7/igt@gem_exec_schedule@noreorder-priority.html">SKIP</a> ([fdo#109271]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-tglb5/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb7/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap@wc:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-hsw2/igt@gem_userptr_blits@process-exit-mmap@wc.html">SKIP</a> ([fdo#109271]) +153 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb6/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> ([fdo#112306])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb7/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([fdo#112306]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-hsw2/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-hsw5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#1519])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-kbl3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-hsw4/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-hsw7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-glk1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-glk6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-apl7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-apl3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#109271])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb2/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> ([i915#2373])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> ([i915#1759] / [i915#2291])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-iclb3/igt@i915_suspend@fence-restore-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb1/igt@i915_suspend@fence-restore-untiled.html">DMESG-WARN</a> ([i915#1602]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-glk2/igt@i915_suspend@fence-restore-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-glk4/igt@i915_suspend@fence-restore-untiled.html">DMESG-WARN</a> ([i915#1602] / [i915#2635]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-kbl2/igt@i915_suspend@fence-restore-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl4/igt@i915_suspend@fence-restore-untiled.html">DMESG-WARN</a> ([i915#1602]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-tglb7/igt@i915_suspend@fence-restore-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb6/igt@i915_suspend@fence-restore-untiled.html">DMESG-WARN</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb7/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-glk6/igt@kms_ccs@pipe-c-ccs-on-another-bo.html">SKIP</a> ([fdo#109271]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-audio:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb4/igt@kms_chamelium@dp-audio.html">SKIP</a> ([fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-ctm-0-25:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb6/igt@kms_color@pipe-c-ctm-0-25.html">FAIL</a> ([i915#1149] / [i915#315])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb2/igt@kms_color@pipe-c-ctm-0-25.html">FAIL</a> ([i915#1149] / [i915#315])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-75:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-0-75.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl4/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-gamma:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-hsw4/igt@kms_color_chamelium@pipe-d-gamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb1/igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding.html">SKIP</a> ([fdo#109278] / [fdo#109279])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb5/igt@kms_cursor_crc@pipe-d-cursor-512x170-sliding.html">SKIP</a> ([fdo#109278]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html">SKIP</a> ([fdo#109279]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb6/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb7/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb3/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-apl1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([fdo#109271]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> ([fdo#111825]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> ([fdo#109271]) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#109280]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl3/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left-pipe-a-planes:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-glk2/igt@kms_plane@plane-panning-top-left-pipe-a-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-glk6/igt@kms_plane@plane-panning-top-left-pipe-a-planes.html">FAIL</a> ([i915#1036])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms-pipe-c-planes:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-glk6/igt@kms_plane@plane-position-hole-dpms-pipe-c-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-glk6/igt@kms_plane@plane-position-hole-dpms-pipe-c-planes.html">FAIL</a> ([i915#2472])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb1/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109309])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb1/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109309])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-apl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#1602] / [i915#2635]) +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-hsw5/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-hsw7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#2637]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-tglb7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INCOMPLETE</a> ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-accuracy-idle:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-glk9/igt@kms_vblank@pipe-c-accuracy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-glk1/igt@kms_vblank@pipe-c-accuracy-idle.html">FAIL</a> ([i915#43])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb2/igt@kms_vrr@flipline.html">SKIP</a> ([fdo#109502])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb5/igt@kms_vrr@flipline.html">SKIP</a> ([fdo#109502])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb3/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-outp-complete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb3/igt@nouveau_crc@pipe-a-source-outp-complete.html">SKIP</a> ([i915#2530])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb2/igt@nouveau_crc@pipe-a-source-outp-complete.html">SKIP</a> ([i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb2/igt@perf@mi-rpc.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb3/igt@perf@per-context-mode-unprivileged.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-iclb8/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb8/igt@perf@polling-parameterized.html">FAIL</a> ([i915#1542])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb7/igt@prime_vgem@fence-read-hang.html">SKIP</a> ([fdo#109295])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb4/igt@prime_vgem@fence-read-hang.html">SKIP</a> ([fdo#109295])</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-hsw7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-hsw4/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2505])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_exec_fair@basic-deadline}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-glk2/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-glk2/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none-share@rcs0}:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-kbl7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl6/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace@rcs0}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-tglb1/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb3/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace@vecs0}:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@rcs0}:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-kbl1/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> ([i915#1610] / [i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl1/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-glk5/igt@gem_exec_whisper@basic-contexts-priority.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-glk2/igt@gem_exec_whisper@basic-contexts-priority.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_vm_create@destroy-race}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-tglb8/igt@gem_vm_create@destroy-race.html">TIMEOUT</a> ([i915#2795]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb5/igt@gem_vm_create@destroy-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-tglb2/igt@gem_workarounds@suspend-resume-context.html">INCOMPLETE</a> ([i915#2295] / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb2/igt@gem_workarounds@suspend-resume-context.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-hsw6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-hsw7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-apl1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-apl1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-glk6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-glk5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-128x42-random:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html">FAIL</a> ([i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html">FAIL</a> ([i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html">FAIL</a> ([i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-glk2/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> ([i915#2598]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-iclb4/igt@kms_frontbuffer_tracking@psr-suspend.html">DMESG-WARN</a> ([i915#1602]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb4/igt@kms_frontbuffer_tracking@psr-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-tglb2/igt@kms_frontbuffer_tracking@psr-suspend.html">DMESG-WARN</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb1/igt@kms_frontbuffer_tracking@psr-suspend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-y:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-kbl2/igt@kms_plane_lowres@pipe-a-tiling-y.html">DMESG-WARN</a> ([i915#165] / [i915#180] / [i915#2621] / [i915#78]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl1/igt@kms_plane_lowres@pipe-a-tiling-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-iclb7/igt@kms_psr2_su@frontbuffer.html">SKIP</a> ([fdo#109642] / [fdo#111068]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-iclb6/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-tglb5/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#110892]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#579])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-apl1/igt@kms_content_protection@srm.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-apl8/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> ([fdo#109349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> ([i915#1226])</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-kbl6/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2426] / [i915#2505]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-kbl6/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2505] / [i915#602])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9566/shard-apl2/igt@runner@aborted.html">FAIL</a> ([i915#2295]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5371/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href="https://i">FAIL</a>) ([i915#1814] / [i915#2295])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============4781849588754651321==--

--===============2080423181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2080423181==--
