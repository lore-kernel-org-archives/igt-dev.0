Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 28 Nov 2020 04:18:11 -0000
Message-ID: <160653709170.21582.2382428164041408814@emeril.freedesktop.org>
References: <20201127224030.8912-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20201127224030.8912-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fplane=3A_optimize_?=
 =?utf-8?q?pixel_format_tests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0391758760=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0391758760==
Content-Type: multipart/alternative;
 boundary="===============6932360942395457190=="

--===============6932360942395457190==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_plane: optimize pixel format tests
URL   : https://patchwork.freedesktop.org/series/84372/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9401_full -> IGTPW_5236_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/index.html

Known issues
------------

  Here are the changes found in IGTPW_5236_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [PASS][1] -> [FAIL][2] ([i915#2389])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-glk7/igt@gem_exec_whisper@basic-fds-priority.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-glk5/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-hsw:          [PASS][5] -> [FAIL][6] ([i915#2370])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-tglb:         [PASS][7] -> [FAIL][8] ([i915#2346])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#52] / [i915#54])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled.html

  * igt@kms_flip@blocking-wf_vblank@a-dp1:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1982]) +5 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-kbl4/igt@kms_flip@blocking-wf_vblank@a-dp1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-kbl2/igt@kms_flip@blocking-wf_vblank@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [PASS][13] -> [INCOMPLETE][14] ([i915#2055])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-hsw8/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#2122])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-glk4/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-glk9/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1982]) +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-apl6/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-apl2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#49])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
    - shard-tglb:         [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html

  * igt@kms_plane@pixel-format-pipe-b-planes-source-clamping:
    - shard-hsw:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-hsw8/igt@kms_plane@pixel-format-pipe-b-planes-source-clamping.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-hsw6/igt@kms_plane@pixel-format-pipe-b-planes-source-clamping.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-glk:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +6 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-glk3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-glk4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-iclb2/igt@kms_psr@psr2_primary_render.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-iclb7/igt@kms_psr@psr2_primary_render.html

  * igt@kms_vblank@pipe-c-wait-idle:
    - shard-iclb:         [PASS][29] -> [DMESG-WARN][30] ([i915#1982])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-iclb6/igt@kms_vblank@pipe-c-wait-idle.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-iclb8/igt@kms_vblank@pipe-c-wait-idle.html

  * igt@perf@polling-parameterized:
    - shard-hsw:          [PASS][31] -> [FAIL][32] ([i915#1542])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-hsw4/igt@perf@polling-parameterized.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-hsw1/igt@perf@polling-parameterized.html

  * igt@perf_pmu@module-unload:
    - shard-tglb:         [PASS][33] -> [DMESG-WARN][34] ([i915#1982] / [i915#262])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-tglb1/igt@perf_pmu@module-unload.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-tglb2/igt@perf_pmu@module-unload.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@gem-idle:
    - shard-hsw:          [SKIP][35] ([fdo#109271]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-hsw1/igt@i915_pm_rpm@gem-idle.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-hsw1/igt@i915_pm_rpm@gem-idle.html

  * {igt@kms_async_flips@alternate-sync-async-flip}:
    - shard-tglb:         [FAIL][37] ([i915#2521]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-tglb1/igt@kms_async_flips@alternate-sync-async-flip.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-tglb5/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_cursor_edge_walk@pipe-c-128x128-left-edge:
    - shard-apl:          [DMESG-WARN][39] ([i915#1982]) -> [PASS][40] +4 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-apl7/igt@kms_cursor_edge_walk@pipe-c-128x128-left-edge.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-apl4/igt@kms_cursor_edge_walk@pipe-c-128x128-left-edge.html

  * igt@kms_cursor_edge_walk@pipe-c-64x64-bottom-edge:
    - shard-hsw:          [INCOMPLETE][41] -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-hsw1/igt@kms_cursor_edge_walk@pipe-c-64x64-bottom-edge.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-hsw4/igt@kms_cursor_edge_walk@pipe-c-64x64-bottom-edge.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-toggle:
    - shard-tglb:         [DMESG-WARN][43] ([i915#1982]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-tglb1/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-tglb8/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][45] ([i915#1982]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-hsw6/igt@kms_flip@2x-nonexisting-fb-interruptible@ab-vga1-hdmi-a1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-hsw4/igt@kms_flip@2x-nonexisting-fb-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:
    - shard-kbl:          [FAIL][47] ([i915#79]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [FAIL][49] ([i915#2598]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite:
    - shard-glk:          [DMESG-WARN][53] ([i915#1982]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-glk1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-glk7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-iclb:         [INCOMPLETE][55] ([i915#1185]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-iclb8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-iclb2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
    - shard-glk:          [DMESG-WARN][57] ([i915#2635]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-glk2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-glk3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
    - shard-apl:          [INCOMPLETE][59] ([i915#2635]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
    - shard-kbl:          [INCOMPLETE][61] ([i915#155]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
    - shard-hsw:          [INCOMPLETE][63] ([i915#2637]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-hsw8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-hsw6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane@pixel-format-pipe-c-planes:
    - shard-glk:          [INCOMPLETE][65] ([i915#2554]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-glk8/igt@kms_plane@pixel-format-pipe-c-planes.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-glk7/igt@kms_plane@pixel-format-pipe-c-planes.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][67] ([fdo#109441]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-iclb8/igt@kms_psr@psr2_cursor_plane_move.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_sysfs_edid_timing:
    - shard-hsw:          [FAIL][69] ([IGT#2]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-hsw6/igt@kms_sysfs_edid_timing.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-hsw4/igt@kms_sysfs_edid_timing.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][71] ([i915#2681] / [i915#2684]) -> [WARN][72] ([i915#1804] / [i915#2684])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][73] ([i915#1226]) -> [SKIP][74] ([fdo#109349])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-tglb:         [INCOMPLETE][75] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -> [DMESG-WARN][76] ([i915#2411])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-tglb8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-tglb6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-glk:          [FAIL][77] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][78] ([fdo#108145] / [i915#1982])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-glk2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-glk7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
    - shard-apl:          [FAIL][79] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][80] ([fdo#108145] / [i915#1982]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][81], [FAIL][82]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483]) -> [FAIL][83] ([i915#2295] / [i915#2722] / [i915#483])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-kbl7/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-kbl6/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-kbl6/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][84], [FAIL][85]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483]) -> [FAIL][86] ([i915#2295] / [i915#2722] / [i915#483])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-iclb2/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-iclb8/igt@runner@aborted.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-iclb1/igt@runner@aborted.html
    - shard-apl:          ([FAIL][87], [FAIL][88]) ([fdo#109271] / [i915#1814] / [i915#2295] / [i915#2722]) -> [FAIL][89] ([i915#2295] / [i915#2722])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-apl7/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-apl3/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-apl4/igt@runner@aborted.html
    - shard-glk:          ([FAIL][90], [FAIL][91], [FAIL][92]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483] / [k.org#202321]) -> [FAIL][93] ([i915#2295] / [i915#2722] / [k.org#202321])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-glk2/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-glk8/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-glk7/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-glk8/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][94], [FAIL][95]) ([i915#1602] / [i915#2295] / [i915#2722]) -> [FAIL][96] ([i915#2295] / [i915#2722])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-tglb8/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-tglb5/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-tglb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2370]: https://gitlab.freedesktop.org/drm/intel/issues/2370
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2554]: https://gitlab.freedesktop.org/drm/intel/issues/2554
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5873 -> IGTPW_5236
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9401: a88f54b9c003dd8ee5442caa8212cf507e0172c1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5236: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/index.html
  IGT_5873: b6321b58dcaa41ba1d28aced42d6b15dc3d49ca2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/index.html

--===============6932360942395457190==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_p=
lane: optimize pixel format tests</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84372/">https://patchwork.freedesktop.org/series/84372/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5236/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5236/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9401_full -&gt; IGTPW_5236_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/index.=
html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5236_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/=
shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-glk7/igt@gem_exec_whisper@basic-fds-priority.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/sh=
ard-glk5/igt@gem_exec_whisper@basic-fds-priority.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)=
 +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5236/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2370">=
i915#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5236/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">i9=
15#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5236/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/52=
">i915#52</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
54">i915#54</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-kbl4/igt@kms_flip@blocking-wf_vblank@a-dp1.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shar=
d-kbl2/igt@kms_flip@blocking-wf_vblank@a-dp1.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +5=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-hsw8/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/sha=
rd-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-glk4/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
236/shard-glk9/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#212=
2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-apl6/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5236/shard-apl2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-=
pgflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5236/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn=
-indfb-pgflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mm=
ap-cpu.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5236/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw=
-mmap-cpu.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-pipe-b-planes-source-clamping:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-hsw8/igt@kms_plane@pixel-format-pipe-b-planes-source-cla=
mping.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5236/shard-hsw6/igt@kms_plane@pixel-format-pipe-b-planes-source-c=
lamping.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-glk3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5236/shard-glk4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1982">i915#1982</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-iclb2/igt@kms_psr@psr2_primary_render.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-icl=
b7/igt@kms_psr@psr2_primary_render.html">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue<=
/li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-iclb6/igt@kms_vblank@pipe-c-wait-idle.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-icl=
b8/igt@kms_vblank@pipe-c-wait-idle.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-hsw4/igt@perf@polling-parameterized.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-hsw1/=
igt@perf@polling-parameterized.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-tglb1/igt@perf_pmu@module-unload.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-tglb2/ig=
t@perf_pmu@module-unload.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/262">i915#262</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@gem-idle:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-hsw1/igt@i915_pm_rpm@gem-idle.html">SKIP</a> (<a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-hsw=
1/igt@i915_pm_rpm@gem-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@alternate-sync-async-flip}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-tglb1/igt@kms_async_flips@alternate-sync-async-flip.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2521=
">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5236/shard-tglb5/igt@kms_async_flips@alternate-sync-async-flip.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-128x128-left-edge:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-apl7/igt@kms_cursor_edge_walk@pipe-c-128x128-left-edge.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5236/shard-apl4/igt@kms_cursor_edge_walk@pipe-c-128x128-left=
-edge.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-64x64-bottom-edge:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-hsw1/igt@kms_cursor_edge_walk@pipe-c-64x64-bottom-edge.h=
tml">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5236/shard-hsw4/igt@kms_cursor_edge_walk@pipe-c-64x64-bottom-edge.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-toggle:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-tglb1/igt@kms_cursor_legacy@short-flip-after-cursor-togg=
le.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5236/shard-tglb8/igt@kms_cursor_legacy@short-flip-after-=
cursor-toggle.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-hsw6/igt@kms_flip@2x-nonexisting-fb-interruptible@ab-vga=
1-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5236/shard-hsw4/igt@kms_flip@2x-nonexisting-fb-in=
terruptible@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b=
-dp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/79">i915#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5236/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank-interruptibl=
e@b-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2598">i=
915#2598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5236/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5236/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp=
1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-glk1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwr=
ite.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5236/shard-glk7/igt@kms_frontbuffer_tracking@fbc-rgb101=
010-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9401/shard-iclb8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1185">i915#1185</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5236/shard-iclb2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c=
.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9401/shard-glk2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5236/shard-glk3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.h=
tml">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9401/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5236/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.h=
tml">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9401/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/155">i915#155</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5236/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.htm=
l">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9401/shard-hsw8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2637">i915#2637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5236/shard-hsw6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.h=
tml">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-pipe-c-planes:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-glk8/igt@kms_plane@pixel-format-pipe-c-planes.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2554=
">i915#2554</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5236/shard-glk7/igt@kms_plane@pixel-format-pipe-c-planes.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-iclb8/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#1094=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_523=
6/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> +2 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-hsw6/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT#2</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-h=
sw4/igt@kms_sysfs_edid_timing.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#268=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i9=
15#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5236/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#268=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1226">i9=
15#1226</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5236/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109349">fdo#109349</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-tglb8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1798">i915#1798</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1982">i915#1982</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/456">i915#456</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5236/shard-tglb6/igt@kms_pipe_crc_basic@suspen=
d-read-crc-pipe-c.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9401/shard-glk2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">F=
AIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108145">=
fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/265">i915#265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5236/shard-glk7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html"=
>DMESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1982">i915#1982</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9401/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">F=
AIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108145">=
fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/265">i915#265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5236/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html"=
>DMESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1982">i915#1982</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-kbl6/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/483">i915#483</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_5236/shard-kbl6/igt@runner@aborted.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915=
#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722=
">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/483">i915#483</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-iclb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-iclb8/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/483">i915#483</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-iclb1/igt@runner@aborted.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i=
915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-apl3/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2722">i915#2722</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/shard-apl4/igt@runner@aborted.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">=
i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2722">i915#2722</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-glk2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-glk8/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9401/shard-glk7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>=
 / <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#2=
02321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5236/shard-glk8/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"h=
ttps://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9401/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9401/shard-tglb5/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2722">i915#2722</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5236/shard-tglb5/igt@runner@aborted.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#=
2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722"=
>i915#2722</a>)</p>
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
<li>IGT: IGT_5873 -&gt; IGTPW_5236</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9401: a88f54b9c003dd8ee5442caa8212cf507e0172c1 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5236: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5236/index.htm=
l<br />
  IGT_5873: b6321b58dcaa41ba1d28aced42d6b15dc3d49ca2 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============6932360942395457190==--

--===============0391758760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0391758760==--
