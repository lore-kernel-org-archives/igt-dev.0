Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 11 Dec 2020 18:23:54 -0000
Message-ID: <160771103493.16100.7238637446162789737@emeril.freedesktop.org>
References: <20201211143909.2716931-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201211143909.2716931-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9w?=
 =?utf-8?q?erf=5Fpmu=3A_Verify_RC6_measurements_before/after_suspend?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0260527494=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0260527494==
Content-Type: multipart/alternative;
 boundary="===============2861796793720513109=="

--===============2861796793720513109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/perf_pmu: Verify RC6 measurements before/after suspend
URL   : https://patchwork.freedesktop.org/series/84846/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9476_full -> IGTPW_5273_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5273_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5273_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5273_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@pipe-c-torture-move:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-hsw8/igt@kms_cursor_legacy@pipe-c-torture-move.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-hsw7/igt@kms_cursor_legacy@pipe-c-torture-move.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:
    - shard-kbl:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html

  * {igt@perf_pmu@rc6-suspend} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-snb4/igt@perf_pmu@rc6-suspend.html
    - shard-kbl:          NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl1/igt@perf_pmu@rc6-suspend.html
    - shard-hsw:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-hsw7/igt@perf_pmu@rc6-suspend.html
    - shard-glk:          NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-glk1/igt@perf_pmu@rc6-suspend.html
    - shard-apl:          NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-apl8/igt@perf_pmu@rc6-suspend.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9476_full and IGTPW_5273_full:

### New IGT tests (1) ###

  * igt@perf_pmu@rc6-suspend:
    - Statuses : 5 fail(s) 2 pass(s)
    - Exec time: [8.11, 16.50] s

  

Known issues
------------

  Here are the changes found in IGTPW_5273_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-glk:          [PASS][10] -> [DMESG-WARN][11] ([i915#2283])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-glk3/igt@device_reset@unbind-reset-rebind.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-glk1/igt@device_reset@unbind-reset-rebind.html
    - shard-apl:          [PASS][12] -> [DMESG-WARN][13] ([i915#2283])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-apl2/igt@device_reset@unbind-reset-rebind.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-apl2/igt@device_reset@unbind-reset-rebind.html
    - shard-kbl:          [PASS][14] -> [DMESG-WARN][15] ([i915#2283])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-kbl3/igt@device_reset@unbind-reset-rebind.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl7/igt@device_reset@unbind-reset-rebind.html
    - shard-tglb:         [PASS][16] -> [DMESG-WARN][17] ([i915#1602])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-tglb3/igt@device_reset@unbind-reset-rebind.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb5/igt@device_reset@unbind-reset-rebind.html
    - shard-iclb:         [PASS][18] -> [DMESG-WARN][19] ([i915#2283])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-iclb2/igt@device_reset@unbind-reset-rebind.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb8/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-hsw:          NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#1099]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-hsw1/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#2389])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-glk5/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][23] ([i915#2389])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb2/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_userptr_blits@process-exit-mmap@wc:
    - shard-hsw:          NOTRUN -> [SKIP][24] ([fdo#109271]) +52 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-hsw7/igt@gem_userptr_blits@process-exit-mmap@wc.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-apl:          NOTRUN -> [SKIP][25] ([fdo#109271]) +25 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-apl1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-tglb:         NOTRUN -> [SKIP][26] ([i915#579])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb5/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#579])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [PASS][28] -> [FAIL][29] ([i915#2574])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-tglb6/igt@kms_async_flips@test-time-stamp.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb6/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_atomic_transition@4x-modeset-transitions-fencing:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#112022] / [fdo#112041])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb6/igt@kms_atomic_transition@4x-modeset-transitions-fencing.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#110725] / [fdo#111614])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#111614])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb5/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_chamelium@dp-audio-edid:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb5/igt@kms_chamelium@dp-audio-edid.html

  * igt@kms_chamelium@dp-crc-multiple:
    - shard-hsw:          NOTRUN -> [SKIP][34] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-hsw7/igt@kms_chamelium@dp-crc-multiple.html

  * igt@kms_chamelium@dp-mode-timings:
    - shard-apl:          NOTRUN -> [SKIP][35] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-apl6/igt@kms_chamelium@dp-mode-timings.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb5/igt@kms_color_chamelium@pipe-c-ctm-0-5.html
    - shard-glk:          NOTRUN -> [SKIP][37] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-glk8/igt@kms_color_chamelium@pipe-c-ctm-0-5.html
    - shard-kbl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl1/igt@kms_color_chamelium@pipe-c-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-75:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-0-75.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:
    - shard-kbl:          [PASS][40] -> [FAIL][41] ([i915#54])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
    - shard-apl:          [PASS][42] -> [FAIL][43] ([i915#54])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#109279]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109278] / [fdo#109279])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb1/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [PASS][46] -> [DMESG-WARN][47] ([i915#180]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x256-sliding:
    - shard-kbl:          NOTRUN -> [SKIP][48] ([fdo#109271]) +24 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl4/igt@kms_cursor_crc@pipe-d-cursor-256x256-sliding.html

  * igt@kms_cursor_edge_walk@pipe-d-256x256-right-edge:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109278]) +4 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb2/igt@kms_cursor_edge_walk@pipe-d-256x256-right-edge.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109274])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb6/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [PASS][51] -> [FAIL][52] ([i915#2598])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109285])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb2/igt@kms_force_connector_basic@force-load-detect.html
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109285])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109280]) +5 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#111825]) +6 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-glk:          NOTRUN -> [SKIP][57] ([fdo#109271]) +22 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-glk2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109289]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb5/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#109289]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb5/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][60] ([fdo#108145] / [i915#265])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-glk8/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
    - shard-apl:          NOTRUN -> [FAIL][61] ([fdo#108145] / [i915#265])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
    - shard-kbl:          NOTRUN -> [FAIL][62] ([fdo#108145] / [i915#265])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-iclb:         [PASS][63] -> [SKIP][64] ([i915#1836])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-iclb6/igt@kms_prime@basic-crc@first-to-second.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb8/igt@kms_prime@basic-crc@first-to-second.html
    - shard-snb:          [PASS][65] -> [SKIP][66] ([fdo#109271])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-snb4/igt@kms_prime@basic-crc@first-to-second.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-snb7/igt@kms_prime@basic-crc@first-to-second.html
    - shard-hsw:          [PASS][67] -> [SKIP][68] ([fdo#109271])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-hsw4/igt@kms_prime@basic-crc@first-to-second.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-hsw1/igt@kms_prime@basic-crc@first-to-second.html
    - shard-kbl:          [PASS][69] -> [SKIP][70] ([fdo#109271])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-kbl1/igt@kms_prime@basic-crc@first-to-second.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl1/igt@kms_prime@basic-crc@first-to-second.html
    - shard-apl:          [PASS][71] -> [SKIP][72] ([fdo#109271])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-apl2/igt@kms_prime@basic-crc@first-to-second.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-apl6/igt@kms_prime@basic-crc@first-to-second.html
    - shard-tglb:         [PASS][73] -> [SKIP][74] ([i915#1836])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-tglb2/igt@kms_prime@basic-crc@first-to-second.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb3/igt@kms_prime@basic-crc@first-to-second.html
    - shard-glk:          [PASS][75] -> [SKIP][76] ([fdo#109271])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-glk7/igt@kms_prime@basic-crc@first-to-second.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-glk1/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][77] -> [SKIP][78] ([fdo#109642] / [fdo#111068])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb5/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][79] -> [SKIP][80] ([fdo#109441])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb8/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109441])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb8/igt@kms_psr@psr2_suspend.html

  * igt@perf@short-reads:
    - shard-hsw:          [PASS][82] -> [FAIL][83] ([i915#51])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-hsw1/igt@perf@short-reads.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-hsw1/igt@perf@short-reads.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#112283])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb2/igt@perf_pmu@event-wait@rcs0.html
    - shard-tglb:         NOTRUN -> [SKIP][85] ([fdo#112283])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb1/igt@perf_pmu@event-wait@rcs0.html

  * igt@prime_nv_pcopy@test3_4:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109291])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb4/igt@prime_nv_pcopy@test3_4.html
    - shard-tglb:         NOTRUN -> [SKIP][87] ([fdo#109291])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb1/igt@prime_nv_pcopy@test3_4.html

  * igt@testdisplay:
    - shard-kbl:          [PASS][88] -> [DMESG-WARN][89] ([i915#165] / [i915#180] / [i915#78])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-kbl6/igt@testdisplay.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl2/igt@testdisplay.html

  
#### Possible fixes ####

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][90] ([i915#2190]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb1/igt@gem_huc_copy@huc-copy.html

  * {igt@gem_vm_create@destroy-race}:
    - shard-tglb:         [TIMEOUT][92] -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-tglb6/igt@gem_vm_create@destroy-race.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb3/igt@gem_vm_create@destroy-race.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - shard-glk:          [SKIP][94] ([fdo#109271]) -> [PASS][95] +2 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-glk3/igt@i915_pm_rpm@basic-pci-d3-state.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-glk7/igt@i915_pm_rpm@basic-pci-d3-state.html
    - shard-iclb:         [SKIP][96] ([i915#579]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-iclb3/igt@i915_pm_rpm@basic-pci-d3-state.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb4/igt@i915_pm_rpm@basic-pci-d3-state.html
    - shard-tglb:         [SKIP][98] ([i915#579]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-tglb3/igt@i915_pm_rpm@basic-pci-d3-state.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb6/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [FAIL][100] ([i915#54]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
    - shard-apl:          [FAIL][102] ([i915#54]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:
    - shard-glk:          [FAIL][104] ([i915#79]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-kbl:          [DMESG-WARN][106] ([i915#180]) -> [PASS][107] +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-glk:          [FAIL][108] ([i915#49]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_plane@plane-position-hole-pipe-c-planes:
    - shard-apl:          [FAIL][110] ([i915#2472]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-apl4/igt@kms_plane@plane-position-hole-pipe-c-planes.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-apl4/igt@kms_plane@plane-position-hole-pipe-c-planes.html
    - shard-kbl:          [FAIL][112] ([i915#2472]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-kbl2/igt@kms_plane@plane-position-hole-pipe-c-planes.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl1/igt@kms_plane@plane-position-hole-pipe-c-planes.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-apl:          [SKIP][114] ([fdo#109271]) -> [PASS][115] +2 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-apl2/igt@kms_prime@basic-crc@second-to-first.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-apl6/igt@kms_prime@basic-crc@second-to-first.html
    - shard-kbl:          [SKIP][116] ([fdo#109271]) -> [PASS][117] +2 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-kbl1/igt@kms_prime@basic-crc@second-to-first.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl1/igt@kms_prime@basic-crc@second-to-first.html
    - shard-hsw:          [SKIP][118] ([fdo#109271]) -> [PASS][119] +2 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-hsw4/igt@kms_prime@basic-crc@second-to-first.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-hsw1/igt@kms_prime@basic-crc@second-to-first.html
    - shard-iclb:         [SKIP][120] ([i915#1836]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-iclb6/igt@kms_prime@basic-crc@second-to-first.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb8/igt@kms_prime@basic-crc@second-to-first.html
    - shard-snb:          [SKIP][122] ([fdo#109271]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-snb4/igt@kms_prime@basic-crc@second-to-first.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-snb7/igt@kms_prime@basic-crc@second-to-first.html
    - shard-tglb:         [SKIP][124] ([i915#1836]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-tglb2/igt@kms_prime@basic-crc@second-to-first.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb3/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][126] ([fdo#109441]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-iclb1/igt@kms_psr@psr2_cursor_render.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  
#### Warnings ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-hsw:          [WARN][128] ([i915#2283]) -> [DMESG-WARN][129] ([i915#2283])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-hsw4/igt@device_reset@unbind-reset-rebind.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-hsw7/igt@device_reset@unbind-reset-rebind.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][130] ([i915#2681] / [i915#2684]) -> [WARN][131] ([i915#1804] / [i915#2684])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][132] ([i915#2684]) -> [WARN][133] ([i915#1804] / [i915#2684])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglb:         [SKIP][134] ([i915#579]) -> [SKIP][135] ([fdo#111644] / [i915#1397] / [i915#2411])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-iclb:         [SKIP][136] ([i915#579]) -> [SKIP][137] ([fdo#110892])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb5/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][138], [FAIL][139]) ([fdo#109271] / [i915#2295] / [i915#2505]) -> [FAIL][140] ([i915#2283] / [i915#2295])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-hsw8/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-hsw1/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-hsw7/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][141], [FAIL][142]) ([i915#2295] / [i915#2722] / [i915#483]) -> ([FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-kbl2/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-kbl2/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl3/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl1/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl4/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl7/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][147], [FAIL][148]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#2724] / [i915#483]) -> ([FAIL][149], [FAIL][150]) ([i915#2283] / [i915#2295] / [i915#2722] / [i915#2724] / [i915#483])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-iclb5/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-iclb4/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb6/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb8/igt@runner@aborted.html
    - shard-apl:          ([FAIL][151], [FAIL][152]) ([i915#1814] / [i915#2295] / [i915#2722]) -> ([FAIL][153], [FAIL][154]) ([i915#2295] / [i915#2722])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-apl6/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-apl7/igt@runner@aborted.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-apl2/igt@runner@aborted.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-apl6/igt@runner@aborted.html
    - shard-glk:          ([FAIL][155], [FAIL][156]) ([i915#1814] / [i915#2295] / [i915#2722] / [k.org#202321]) -> ([FAIL][157], [FAIL][158]) ([i915#2295] / [i915#2722] / [k.org#202321])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-glk1/igt@runner@aborted.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-glk4/igt@runner@aborted.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-glk1/igt@runner@aborted.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-glk2/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][159], [FAIL][160]) ([i915#1602] / [i915#2295] / [i915#2722]) -> ([FAIL][161], [FAIL][162]) ([i915#2295] / [i915#2722])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-tglb5/igt@runner@aborted.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-tglb2/igt@runner@aborted.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb7/igt@runner@aborted.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/index.html

--===============2861796793720513109==
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
<tr><td><b>Series:</b></td><td>i915/perf_pmu: Verify RC6 measurements before/after suspend</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84846/">https://patchwork.freedesktop.org/series/84846/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9476_full -&gt; IGTPW_5273_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5273_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5273_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5273_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@pipe-c-torture-move:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-hsw8/igt@kms_cursor_legacy@pipe-c-torture-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-hsw7/igt@kms_cursor_legacy@pipe-c-torture-move.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@perf_pmu@rc6-suspend} (NEW):</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-snb4/igt@perf_pmu@rc6-suspend.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl1/igt@perf_pmu@rc6-suspend.html">FAIL</a></p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-hsw7/igt@perf_pmu@rc6-suspend.html">FAIL</a></p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-glk1/igt@perf_pmu@rc6-suspend.html">FAIL</a></p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-apl8/igt@perf_pmu@rc6-suspend.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9476_full and IGTPW_5273_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@perf_pmu@rc6-suspend:<ul>
<li>Statuses : 5 fail(s) 2 pass(s)</li>
<li>Exec time: [8.11, 16.50] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5273_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-glk3/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-glk1/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> ([i915#2283])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-apl2/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-apl2/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> ([i915#2283])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-kbl3/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl7/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> ([i915#2283])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-tglb3/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb5/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> ([i915#1602])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-iclb2/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb8/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> ([i915#2283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-hsw1/igt@gem_ctx_persistence@smoketest.html">SKIP</a> ([fdo#109271] / [i915#1099]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-glk5/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb2/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap@wc:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-hsw7/igt@gem_userptr_blits@process-exit-mmap@wc.html">SKIP</a> ([fdo#109271]) +52 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-apl1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([fdo#109271]) +25 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb5/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([i915#579])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-tglb6/igt@kms_async_flips@test-time-stamp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb6/igt@kms_async_flips@test-time-stamp.html">FAIL</a> ([i915#2574])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@4x-modeset-transitions-fencing:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb6/igt@kms_atomic_transition@4x-modeset-transitions-fencing.html">SKIP</a> ([fdo#112022] / [fdo#112041])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb5/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-audio-edid:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb5/igt@kms_chamelium@dp-audio-edid.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-multiple:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-hsw7/igt@kms_chamelium@dp-crc-multiple.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-mode-timings:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-apl6/igt@kms_chamelium@dp-mode-timings.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-5:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb5/igt@kms_color_chamelium@pipe-c-ctm-0-5.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-glk8/igt@kms_color_chamelium@pipe-c-ctm-0-5.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl1/igt@kms_color_chamelium@pipe-c-ctm-0-5.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-75:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-0-75.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html">FAIL</a> ([i915#54])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html">FAIL</a> ([i915#54])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html">SKIP</a> ([fdo#109279]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb1/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x256-sliding:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl4/igt@kms_cursor_crc@pipe-d-cursor-256x256-sliding.html">SKIP</a> ([fdo#109271]) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-256x256-right-edge:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb2/igt@kms_cursor_edge_walk@pipe-d-256x256-right-edge.html">SKIP</a> ([fdo#109278]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb6/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> ([i915#2598])</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> ([fdo#109285])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> ([fdo#109285])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> ([fdo#109280]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> ([fdo#111825]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-glk2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> ([fdo#109271]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb5/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html">SKIP</a> ([fdo#109289]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb5/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html">SKIP</a> ([fdo#109289]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-glk8/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> (<a href="https://b">fdo#108145</a> / [i915#265])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> (<a href="https://b">fdo#108145</a> / [i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> (<a href="https://b">fdo#108145</a> / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-iclb6/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb8/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([i915#1836])</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-snb4/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-snb7/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-hsw4/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-hsw1/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-kbl1/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl1/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-apl2/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-apl6/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-tglb2/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb3/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([i915#1836])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-glk7/igt@kms_prime@basic-crc@first-to-second.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-glk1/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([fdo#109271])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb5/igt@kms_psr2_su@frontbuffer.html">SKIP</a> ([fdo#109642] / [fdo#111068])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb8/igt@kms_psr@psr2_cursor_blt.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb8/igt@kms_psr@psr2_suspend.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@perf@short-reads:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-hsw1/igt@perf@short-reads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-hsw1/igt@perf@short-reads.html">FAIL</a> ([i915#51])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb2/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb1/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_4:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb4/igt@prime_nv_pcopy@test3_4.html">SKIP</a> ([fdo#109291])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb1/igt@prime_nv_pcopy@test3_4.html">SKIP</a> ([fdo#109291])</p>
</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-kbl6/igt@testdisplay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl2/igt@testdisplay.html">DMESG-WARN</a> ([i915#165] / [i915#180] / [i915#78])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb1/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_vm_create@destroy-race}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-tglb6/igt@gem_vm_create@destroy-race.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb3/igt@gem_vm_create@destroy-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-glk3/igt@i915_pm_rpm@basic-pci-d3-state.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-glk7/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-iclb3/igt@i915_pm_rpm@basic-pci-d3-state.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb4/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-tglb3/igt@i915_pm_rpm@basic-pci-d3-state.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb6/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">FAIL</a> ([i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">FAIL</a> ([i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">FAIL</a> ([i915#49]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-pipe-c-planes:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-apl4/igt@kms_plane@plane-position-hole-pipe-c-planes.html">FAIL</a> ([i915#2472]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-apl4/igt@kms_plane@plane-position-hole-pipe-c-planes.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-kbl2/igt@kms_plane@plane-position-hole-pipe-c-planes.html">FAIL</a> ([i915#2472]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl1/igt@kms_plane@plane-position-hole-pipe-c-planes.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@second-to-first:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-apl2/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-apl6/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-kbl1/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl1/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-hsw4/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-hsw1/igt@kms_prime@basic-crc@second-to-first.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-iclb6/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> ([i915#1836]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb8/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-snb4/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-snb7/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-tglb2/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a> ([i915#1836]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb3/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-iclb1/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-hsw4/igt@device_reset@unbind-reset-rebind.html">WARN</a> ([i915#2283]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-hsw7/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> ([i915#2283])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb5/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-hsw8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-hsw1/igt@runner@aborted.html">FAIL</a>) ([fdo#109271] / [i915#2295] / [i915#2505]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-hsw7/igt@runner@aborted.html">FAIL</a> ([i915#2283] / [i915#2295])</p>
</li>
<li>
<p>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-kbl2/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2722] / [i915#483]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-kbl7/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483])</p>
</li>
<li>
<p>shard-iclb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-iclb5/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-iclb4/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#2724] / [i915#483]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-iclb8/igt@runner@aborted.html">FAIL</a>) ([i915#2283] / [i915#2295] / [i915#2722] / [i915#2724] / [i915#483])</p>
</li>
<li>
<p>shard-apl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-apl7/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2722]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-apl6/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2722])</p>
</li>
<li>
<p>shard-glk:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-glk1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-glk4/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2722] / [k.org#202321]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-glk1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-glk2/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2722] / [k.org#202321])</p>
</li>
<li>
<p>shard-tglb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9476/shard-tglb2/igt@runner@aborted.html">FAIL</a>) ([i915#1602] / [i915#2295] / [i915#2722]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5273/shard-tglb5/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2722])</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============2861796793720513109==--

--===============0260527494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0260527494==--
