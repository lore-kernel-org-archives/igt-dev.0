Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 27 Nov 2020 11:44:40 -0000
Message-ID: <160647748087.26784.400113101423624777@emeril.freedesktop.org>
References: <20201127073949.18730-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20201127073949.18730-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fscaling=3A_Correcting_typo_error_for_plane?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1180593452=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1180593452==
Content-Type: multipart/alternative;
 boundary="===============9150948977092302161=="

--===============9150948977092302161==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_scaling: Correcting typo error for plane
URL   : https://patchwork.freedesktop.org/series/84316/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9396_full -> IGTPW_5231_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/index.html

New tests
---------

  New tests have been introduced between CI_DRM_9396_full and IGTPW_5231_full:

### New IGT tests (4) ###

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-scaler-with-clipping-clamping:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 20.93] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-scaler-with-clipping-clamping:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 21.94] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 22.00] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-d-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [19.39] s

  

Known issues
------------

  Here are the changes found in IGTPW_5231_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_gttfill@all:
    - shard-glk:          [PASS][1] -> [DMESG-WARN][2] ([i915#118] / [i915#95]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk7/igt@gem_exec_gttfill@all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-glk2/igt@gem_exec_gttfill@all.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [PASS][3] -> [FAIL][4] ([i915#2389])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][5] -> [SKIP][6] ([i915#2190])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-tglb3/igt@gem_huc_copy@huc-copy.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][7] -> [FAIL][8] ([i915#454])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#579])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-iclb1/igt@i915_pm_rpm@gem-idle.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-iclb8/igt@i915_pm_rpm@gem-idle.html
    - shard-apl:          [PASS][11] -> [SKIP][12] ([fdo#109271]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-apl8/igt@i915_pm_rpm@gem-idle.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-apl8/igt@i915_pm_rpm@gem-idle.html
    - shard-glk:          [PASS][13] -> [SKIP][14] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk7/igt@i915_pm_rpm@gem-idle.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-glk6/igt@i915_pm_rpm@gem-idle.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-hsw:          [PASS][15] -> [SKIP][16] ([fdo#109271]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-hsw1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-hsw1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][17] -> [INCOMPLETE][18] ([i915#2635])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html
    - shard-iclb:         [PASS][19] -> [INCOMPLETE][20] ([i915#1185])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-iclb3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-iclb8/igt@i915_suspend@fence-restore-tiled2untiled.html
    - shard-hsw:          [PASS][21] -> [INCOMPLETE][22] ([i915#2055] / [i915#2637])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-hsw1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-hsw6/igt@i915_suspend@fence-restore-tiled2untiled.html
    - shard-glk:          [PASS][23] -> [INCOMPLETE][24] ([i915#2199] / [i915#2635])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk6/igt@i915_suspend@fence-restore-tiled2untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-glk6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-glk7/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][29] -> [FAIL][30] ([i915#2370])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
    - shard-glk:          [PASS][31] -> [DMESG-WARN][32] ([i915#1982]) +6 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk7/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-glk6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled:
    - shard-apl:          [PASS][33] -> [DMESG-WARN][34] ([i915#1982]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-apl3/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-apl1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - shard-iclb:         [PASS][35] -> [DMESG-WARN][36] ([i915#1982]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-iclb3/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-iclb5/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#79]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-hsw:          [PASS][39] -> [INCOMPLETE][40] ([i915#2055] / [i915#2295])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-hsw8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-hsw8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-tglb:         [PASS][41] -> [DMESG-WARN][42] ([i915#1982]) +5 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-tglb7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-tglb3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-glk:          [DMESG-WARN][45] ([i915#118] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk7/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-glk6/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][47] -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-iclb5/igt@i915_pm_dc@dc5-dpms.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
    - shard-glk:          [FAIL][49] -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk7/igt@i915_pm_dc@dc5-dpms.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-glk6/igt@i915_pm_dc@dc5-dpms.html
    - shard-apl:          [FAIL][51] -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-apl4/igt@i915_pm_dc@dc5-dpms.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-apl1/igt@i915_pm_dc@dc5-dpms.html
    - shard-tglb:         [FAIL][53] -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-tglb7/igt@i915_pm_dc@dc5-dpms.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-tglb1/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-iclb:         [SKIP][55] ([i915#579]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-iclb5/igt@i915_pm_rpm@modeset-lpsp.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-iclb4/igt@i915_pm_rpm@modeset-lpsp.html

  * {igt@kms_async_flips@test-time-stamp}:
    - shard-tglb:         [FAIL][57] ([i915#2597]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-tglb2/igt@kms_async_flips@test-time-stamp.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-tglb5/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge:
    - shard-hsw:          [DMESG-WARN][59] ([i915#1982]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-hsw6/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-hsw2/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:
    - shard-glk:          [FAIL][61] ([i915#79]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-glk4/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][63] ([i915#2295]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1:
    - shard-apl:          [DMESG-WARN][65] ([i915#1982]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-apl3/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-apl1/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-glk:          [DMESG-WARN][67] ([i915#1982]) -> [PASS][68] +4 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk2/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-glk3/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][69] ([fdo#109441]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-iclb4/igt@kms_psr@psr2_cursor_plane_onoff.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-glk:          [DMESG-WARN][71] ([i915#2635]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-glk2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
    - shard-apl:          [INCOMPLETE][73] ([i915#2635]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
    - shard-hsw:          [INCOMPLETE][75] ([i915#2637]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-hsw4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
    - shard-iclb:         [INCOMPLETE][77] ([fdo#111764] / [i915#1078] / [i915#1185]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-iclb1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf_pmu@module-unload:
    - shard-tglb:         [DMESG-WARN][79] ([i915#1982] / [i915#262]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-tglb7/igt@perf_pmu@module-unload.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-tglb8/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][81] ([i915#1436] / [i915#716]) -> [INCOMPLETE][82] ([i915#1436])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-apl1/igt@gen9_exec_parse@allowed-all.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-apl6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][83] ([i915#1804] / [i915#2684]) -> [WARN][84] ([i915#2684])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][85] ([i915#1804] / [i915#2684]) -> [WARN][86] ([i915#2681] / [i915#2684])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-tglb:         [DMESG-WARN][87] ([i915#2411]) -> [SKIP][88] ([i915#579])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-tglb3/igt@i915_pm_rpm@gem-idle.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-tglb1/igt@i915_pm_rpm@gem-idle.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-tglb:         [SKIP][89] ([i915#579]) -> [DMESG-WARN][90] ([i915#2411])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-tglb7/igt@i915_pm_rpm@modeset-lpsp.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-tglb3/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglb:         [SKIP][91] ([fdo#111644] / [i915#1397] / [i915#2411]) -> [SKIP][92] ([i915#579])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-tglb6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-glk:          [DMESG-WARN][93] ([i915#1982]) -> [SKIP][94] ([fdo#109271])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-glk2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-iclb:         [SKIP][95] ([fdo#110892]) -> [SKIP][96] ([i915#579])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-iclb6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-tglb:         [DMESG-WARN][97] ([i915#2411]) -> [INCOMPLETE][98] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411] / [i915#456])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-tglb2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-tglb1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-glk:          [FAIL][99] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][100] ([fdo#108145] / [i915#1982])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-glk6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-apl:          [FAIL][101] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][102] ([fdo#108145] / [i915#1982])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-tglb:         [INCOMPLETE][103] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -> [DMESG-WARN][104] ([i915#2411])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-tglb1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@runner@aborted:
    - shard-iclb:         ([FAIL][105], [FAIL][106]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483]) -> ([FAIL][107], [FAIL][108]) ([i915#2295] / [i915#2722] / [i915#483])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-iclb1/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-iclb3/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-iclb4/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-iclb8/igt@runner@aborted.html
    - shard-apl:          ([FAIL][109], [FAIL][110], [FAIL][111]) ([fdo#109271] / [i915#1814] / [i915#2295] / [i915#2722] / [i915#716]) -> ([FAIL][112], [FAIL][113], [FAIL][114]) ([fdo#109271] / [i915#2295] / [i915#2722] / [i915#716])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-apl1/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-apl8/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-apl4/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-apl6/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-apl2/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-apl8/igt@runner@aborted.html
    - shard-glk:          ([FAIL][115], [FAIL][116]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483] / [k.org#202321]) -> ([FAIL][117], [FAIL][118]) ([i915#2295] / [i915#2722] / [k.org#202321])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk7/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk5/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-glk6/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-glk9/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [i915#1078]: https://gitlab.freedesktop.org/drm/intel/issues/1078
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2199]: https://gitlab.freedesktop.org/drm/intel/issues/2199
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2370]: https://gitlab.freedesktop.org/drm/intel/issues/2370
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2597]: https://gitlab.freedesktop.org/drm/intel/issues/2597
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5872 -> IGTPW_5231
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9396: c5b0dff321fdead6daece5e91275c8436c15cf03 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5231: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/index.html
  IGT_5872: d8ebb937c76184d5e526c59a2c18abca1c7a03c1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/index.html

--===============9150948977092302161==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_scaling: Correcting typo err=
or for plane</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84316/">https://patchwork.freedesktop.org/series/84316/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5231/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5231/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9396_full -&gt; IGTPW_5231_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/index.=
html</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9396_full and IGTPW_5231_f=
ull:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-scaler-with-c=
lipping-clamping:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 20.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-scaler-with-c=
lipping-clamping:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 21.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-c=
lipping-clamping:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 22.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-d-scaler-with-c=
lipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [19.39] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5231_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-glk7/igt@gem_exec_gttfill@all.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-glk2/igt@ge=
m_exec_gttfill@all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/118">i915#118</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/=
shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-tglb3/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-tglb6/igt=
@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-iclb8/igt@i9=
15_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-idle:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-iclb1/igt@i915_pm_rpm@gem-idle.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-iclb8/igt@i=
915_pm_rpm@gem-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-apl8/igt@i915_pm_rpm@gem-idle.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-apl8/igt@i91=
5_pm_rpm@gem-idle.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-glk7/igt@i915_pm_rpm@gem-idle.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-glk6/igt@i91=
5_pm_rpm@gem-idle.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-hsw1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5231/shard-hsw1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_523=
1/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#=
2635</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-iclb3/igt@i915_suspend@fence-restore-tiled2untiled.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
31/shard-iclb8/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1185">i91=
5#1185</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-hsw1/igt@i915_suspend@fence-restore-tiled2untiled.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_523=
1/shard-hsw6/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#=
2055</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637"=
>i915#2637</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-glk6/igt@i915_suspend@fence-restore-tiled2untiled.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_523=
1/shard-glk6/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2199">i915#=
2199</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635"=
>i915#2635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5231/shard-glk7/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54=
</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5231/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_523=
1/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2370">i915#2370</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-glk7/igt@kms_cursor_legacy@short-flip-after-cursor-atomi=
c-transitions.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5231/shard-glk6/igt@kms_cursor_legacy@short-flip-after-cu=
rsor-atomic-transitions.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1982">i915#1982</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-apl3/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-x=
tiled.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5231/shard-apl1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt=
-xtiled.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-iclb3/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
31/shard-iclb5/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915=
#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c=
-hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5231/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@c-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/79">i915#79</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-hsw8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/sha=
rd-hsw8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-tglb7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-=
wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5231/shard-tglb3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-w=
c.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1982">i915#1982</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-i=
clb7/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar is=
sues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-glk7/igt@gem_exec_whisper@basic-contexts-forked-all.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/118">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5231/shard-glk6/igt@gem_exec_whisper@basic-contexts-forked-all.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-dpms:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-iclb5/igt@i915_pm_dc@dc5-dpms.html">FAIL</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-iclb3/igt@i9=
15_pm_dc@dc5-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-glk7/igt@i915_pm_dc@dc5-dpms.html">FAIL</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-glk6/igt@i915=
_pm_dc@dc5-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-apl4/igt@i915_pm_dc@dc5-dpms.html">FAIL</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-apl1/igt@i915=
_pm_dc@dc5-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-tglb7/igt@i915_pm_dc@dc5-dpms.html">FAIL</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-tglb1/igt@i9=
15_pm_dc@dc5-dpms.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-iclb5/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-ic=
lb4/igt@i915_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@test-time-stamp}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-tglb2/igt@kms_async_flips@test-time-stamp.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2597">i915#259=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231=
/shard-tglb5/igt@kms_async_flips@test-time-stamp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-hsw6/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5231/shard-hsw2/igt@kms_cursor_edge_walk@pipe-c-256x256-bo=
ttom-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i=
915#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5231/shard-glk4/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a=
1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2295">i915#2295</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5231/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptibl=
e@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-apl3/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5231/shard-apl1/igt@kms_flip@flip-vs-wf_vblank-interruptibl=
e@a-dp1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-a:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-glk2/igt@kms_pipe_crc_basic@read-crc-pipe-a.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">=
i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5231/shard-glk3/igt@kms_pipe_crc_basic@read-crc-pipe-a.html">PASS</a> +=
4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-iclb4/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
31/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a> +1 simila=
r issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-glk7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5231/shard-glk2/igt@kms_vblank@pipe-c-ts-continuation-suspend.htm=
l">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5231/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.htm=
l">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-hsw4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2637">i915#2637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5231/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-suspend.htm=
l">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-iclb1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111764">fdo#111764</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1078">i915#1078</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1185">i915#1185</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5231/shard-iclb3/igt@kms_vblank@pipe-c-ts-continua=
tion-suspend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-tglb7/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/262">i915#2=
62</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_523=
1/shard-tglb8/igt@perf_pmu@module-unload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-apl1/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#14=
36</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i9=
15#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5231/shard-apl6/igt@gen9_exec_parse@allowed-all.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a>)=
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#180=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i9=
15#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5231/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)=
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i91=
5#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5231/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-idle:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-tglb3/igt@i915_pm_rpm@gem-idle.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shar=
d-tglb1/igt@i915_pm_rpm@gem-idle.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-tglb7/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-tg=
lb3/igt@i915_pm_rpm@modeset-lpsp.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-tglb6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1116=
44">fdo#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1397">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5231/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp-stre=
ss-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-glk2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5231/shard-glk2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-iclb6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1108=
92">fdo#110892</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5231/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
79">i915#579</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-tglb2/igt@i915_suspend@fence-restore-tiled2untiled.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5231/shard-tglb1/igt@i915_suspend@fence-restore-tiled2untiled.ht=
ml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1887">i915#1887</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2411">i915#2411</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/456">i915#456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-glk6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">F=
AIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108145">=
fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/265">i915#265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5231/shard-glk6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html"=
>DMESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1982">i915#1982</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">F=
AIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108145">=
fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/265">i915#265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5231/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html"=
>DMESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1982">i915#1982</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1798">i915#1798</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1982">i915#1982</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/456">i915#456</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5231/shard-tglb1/igt@kms_vblank@pipe-c-ts-conti=
nuation-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-iclb3/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/483">i915#483</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-iclb4/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/sh=
ard-iclb8/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-apl8/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9396/shard-apl4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#=
716</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
231/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-apl2/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/sha=
rd-apl8/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-glk7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk5/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/483">i915#483</a> / <a href=3D"https://bugzilla.kerne=
l.org/show_bug.cgi?id=3D202321">k.org#202321</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/shard-glk6/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
231/shard-glk9/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"h=
ttps://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>)</p>
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
<li>IGT: IGT_5872 -&gt; IGTPW_5231</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9396: c5b0dff321fdead6daece5e91275c8436c15cf03 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5231: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5231/index.htm=
l<br />
  IGT_5872: d8ebb937c76184d5e526c59a2c18abca1c7a03c1 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============9150948977092302161==--

--===============1180593452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1180593452==--
