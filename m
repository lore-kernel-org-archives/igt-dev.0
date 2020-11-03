Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 03 Nov 2020 18:15:45 -0000
Message-ID: <160442734527.25741.12493000922252380396@emeril.freedesktop.org>
References: <20201103091735.8302-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20201103091735.8302-1-dominik.grzegorzek@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdG9vbHM6?=
 =?utf-8?q?_Remove_libdrm_dependency?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1091750934=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1091750934==
Content-Type: multipart/alternative;
 boundary="===============1380944776283865978=="

--===============1380944776283865978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools: Remove libdrm dependency
URL   : https://patchwork.freedesktop.org/series/83415/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9251_full -> IGTPW_5122_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5122_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5122_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5122_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_pipe_control_store_loop@fresh-buffer:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-iclb3/igt@gem_pipe_control_store_loop@fresh-buffer.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb8/igt@gem_pipe_control_store_loop@fresh-buffer.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-glk:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-glk2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-hsw:          [WARN][5] ([i915#2283]) -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-hsw6/igt@core_hotunplug@hotrebind-lateclose.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-hsw6/igt@core_hotunplug@hotrebind-lateclose.html

  
Known issues
------------

  Here are the changes found in IGTPW_5122_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#54]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:
    - shard-apl:          [PASS][9] -> [FAIL][10] ([i915#1635] / [i915#54]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#1982]) +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-glk1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-hdmi-a1-hdmi-a2.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-glk5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#1982]) +5 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-kbl6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-kbl7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-iclb:         [PASS][15] -> [DMESG-WARN][16] ([i915#1982]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-iclb6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#79])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#49])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite:
    - shard-snb:          [PASS][21] -> [FAIL][22] ([i915#2546])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-snb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-snb6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
    - shard-tglb:         [PASS][23] -> [DMESG-WARN][24] ([i915#1982]) +4 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-tglb7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-tglb8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][25] -> [SKIP][26] ([i915#433])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-hsw:          [PASS][27] -> [INCOMPLETE][28] ([i915#2055])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-hsw4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-hsw1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-kbl:          [PASS][29] -> [INCOMPLETE][30] ([i915#155])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [PASS][31] -> [INCOMPLETE][32] ([i915#1635])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-iclb:         [PASS][33] -> [INCOMPLETE][34] ([i915#1185])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-iclb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_scaling@pipe-b-scaler-with-pixel-format:
    - shard-apl:          [PASS][35] -> [DMESG-WARN][36] ([i915#1635] / [i915#1982]) +8 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-apl8/igt@kms_plane_scaling@pipe-b-scaler-with-pixel-format.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-apl8/igt@kms_plane_scaling@pipe-b-scaler-with-pixel-format.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-hsw:          [PASS][39] -> [SKIP][40] ([fdo#109271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-hsw4/igt@perf@per-context-mode-unprivileged.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-hsw4/igt@perf@per-context-mode-unprivileged.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-snb:          [INCOMPLETE][41] ([i915#82]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-snb7/igt@core_hotunplug@hotrebind-lateclose.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-snb6/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-iclb:         [DMESG-WARN][43] ([i915#1982]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-iclb6/igt@core_hotunplug@hotrebind-lateclose.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb7/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-hsw:          [FAIL][45] ([i915#1888] / [i915#2261]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-hsw6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-hsw:          [SKIP][47] ([fdo#109271]) -> [PASS][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-hsw2/igt@i915_pm_rpm@pm-tiling.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-hsw1/igt@i915_pm_rpm@pm-tiling.html
    - shard-kbl:          [SKIP][49] ([fdo#109271]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-kbl3/igt@i915_pm_rpm@pm-tiling.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-kbl4/igt@i915_pm_rpm@pm-tiling.html
    - shard-apl:          [SKIP][51] ([fdo#109271] / [i915#1635]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-apl6/igt@i915_pm_rpm@pm-tiling.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-apl1/igt@i915_pm_rpm@pm-tiling.html
    - shard-glk:          [SKIP][53] ([fdo#109271]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-glk1/igt@i915_pm_rpm@pm-tiling.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-glk2/igt@i915_pm_rpm@pm-tiling.html
    - shard-iclb:         [SKIP][55] ([i915#579]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-iclb2/igt@i915_pm_rpm@pm-tiling.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb2/igt@i915_pm_rpm@pm-tiling.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-kbl:          [FAIL][57] ([i915#2521]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-kbl4/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-kbl6/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - shard-glk:          [FAIL][59] ([i915#2521]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-glk8/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-glk7/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * {igt@kms_async_flips@test-time-stamp}:
    - shard-apl:          [DMESG-WARN][61] ([i915#1635] / [i915#1982]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-apl1/igt@kms_async_flips@test-time-stamp.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-apl6/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-glk:          [DMESG-WARN][63] ([i915#1982]) -> [PASS][64] +7 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-glk2/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-glk3/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][65] ([i915#2122]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-glk8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-glk1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@dpms-vs-vblank-race@c-dp1:
    - shard-kbl:          [INCOMPLETE][67] -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-kbl1/igt@kms_flip@dpms-vs-vblank-race@c-dp1.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-kbl4/igt@kms_flip@dpms-vs-vblank-race@c-dp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:
    - shard-glk:          [FAIL][69] ([i915#79]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][71] ([i915#2055]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_flip_tiling@flip-x-tiled:
    - shard-kbl:          [DMESG-WARN][73] ([i915#1982]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-kbl2/igt@kms_flip_tiling@flip-x-tiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-kbl3/igt@kms_flip_tiling@flip-x-tiled.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-tglb:         [DMESG-WARN][75] ([i915#1982]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-tglb2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-tglb7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][77] ([fdo#109441]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_psr@suspend:
    - shard-iclb:         [INCOMPLETE][79] ([i915#1185]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-iclb6/igt@kms_psr@suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb5/igt@kms_psr@suspend.html

  * igt@perf@non-system-wide-paranoid:
    - shard-apl:          [SKIP][81] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-apl7/igt@perf@non-system-wide-paranoid.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-apl4/igt@perf@non-system-wide-paranoid.html
    - shard-glk:          [SKIP][83] ([fdo#109271] / [i915#1354]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-glk2/igt@perf@non-system-wide-paranoid.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-glk9/igt@perf@non-system-wide-paranoid.html
    - shard-iclb:         [SKIP][85] ([i915#1354]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-iclb6/igt@perf@non-system-wide-paranoid.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb6/igt@perf@non-system-wide-paranoid.html
    - shard-kbl:          [SKIP][87] ([fdo#109271] / [i915#1354]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-kbl3/igt@perf@non-system-wide-paranoid.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-kbl1/igt@perf@non-system-wide-paranoid.html
    - shard-tglb:         [SKIP][89] ([i915#1354]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-tglb2/igt@perf@non-system-wide-paranoid.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-tglb1/igt@perf@non-system-wide-paranoid.html

  * igt@sysfs_heartbeat_interval@mixed@rcs0:
    - shard-kbl:          [INCOMPLETE][91] ([i915#1731]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-kbl6/igt@sysfs_heartbeat_interval@mixed@rcs0.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-kbl1/igt@sysfs_heartbeat_interval@mixed@rcs0.html

  
#### Warnings ####

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-iclb:         [SKIP][93] ([i915#579]) -> [SKIP][94] ([fdo#110892])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-iclb6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-tglb:         [SKIP][95] ([i915#579]) -> [DMESG-WARN][96] ([i915#2411])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-tglb3/igt@i915_pm_rpm@pm-tiling.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-tglb7/igt@i915_pm_rpm@pm-tiling.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][97] ([fdo#110321] / [i915#1635]) -> [TIMEOUT][98] ([i915#1319] / [i915#1635])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-apl4/igt@kms_content_protection@lic.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-apl3/igt@kms_content_protection@lic.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-tglb:         [DMESG-WARN][99] ([i915#2411]) -> [DMESG-WARN][100] ([i915#1436])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-tglb8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-tglb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-apl:          [SKIP][101] ([fdo#109271] / [i915#1635]) -> [SKIP][102] ([fdo#109271] / [i915#1354] / [i915#1635])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-apl8/igt@perf@per-context-mode-unprivileged.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-apl8/igt@perf@per-context-mode-unprivileged.html
    - shard-iclb:         [SKIP][103] ([fdo#109289]) -> [SKIP][104] ([i915#1354])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-iclb1/igt@perf@per-context-mode-unprivileged.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb5/igt@perf@per-context-mode-unprivileged.html
    - shard-glk:          [SKIP][105] ([fdo#109271]) -> [SKIP][106] ([fdo#109271] / [i915#1354])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-glk8/igt@perf@per-context-mode-unprivileged.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-glk4/igt@perf@per-context-mode-unprivileged.html
    - shard-kbl:          [SKIP][107] ([fdo#109271]) -> [SKIP][108] ([fdo#109271] / [i915#1354])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-kbl4/igt@perf@per-context-mode-unprivileged.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-kbl7/igt@perf@per-context-mode-unprivileged.html
    - shard-tglb:         [SKIP][109] ([fdo#109289]) -> [SKIP][110] ([i915#1354])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-tglb6/igt@perf@per-context-mode-unprivileged.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-tglb8/igt@perf@per-context-mode-unprivileged.html

  * igt@runner@aborted:
    - shard-iclb:         [FAIL][111] ([i915#1814] / [i915#483]) -> ([FAIL][112], [FAIL][113]) ([i915#1814] / [i915#2439] / [i915#483])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-iclb6/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb7/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb8/igt@runner@aborted.html
    - shard-tglb:         [FAIL][114] ([i915#2439]) -> [FAIL][115] ([i915#1602] / [i915#456])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-tglb3/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-tglb3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1731]: https://gitlab.freedesktop.org/drm/intel/issues/1731
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2261]: https://gitlab.freedesktop.org/drm/intel/issues/2261
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5830 -> IGTPW_5122
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9251: ed79ec92754cf19d3cc924fce8ab915e541d5761 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5122: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/index.html
  IGT_5830: 12d370cb57e0cfcb781c87ad9e15e68b17a1f41f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/index.html

--===============1380944776283865978==
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
<tr><td><b>Series:</b></td><td>tools: Remove libdrm dependency</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83415/">https://patchwork.freedesktop.org/series/83415/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9251_full -&gt; IGTPW_5122_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5122_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5122_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5122_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_pipe_control_store_loop@fresh-buffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-iclb3/igt@gem_pipe_control_store_loop@fresh-buffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb8/igt@gem_pipe_control_store_loop@fresh-buffer.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-glk2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@core_hotunplug@hotrebind-lateclose:<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-hsw6/igt@core_hotunplug@hotrebind-lateclose.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-hsw6/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5122_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-glk1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-glk5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-hdmi-a1-hdmi-a2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-kbl6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-kbl7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-iclb6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-snb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-snb6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-tglb7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-tglb8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-hsw4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-hsw1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-iclb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@pipe-b-scaler-with-pixel-format:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-apl8/igt@kms_plane_scaling@pipe-b-scaler-with-pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-apl8/igt@kms_plane_scaling@pipe-b-scaler-with-pixel-format.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-hsw4/igt@perf@per-context-mode-unprivileged.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-hsw4/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-snb7/igt@core_hotunplug@hotrebind-lateclose.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-snb6/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-iclb6/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb7/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-hsw6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2261">i915#2261</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-hsw2/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-hsw1/igt@i915_pm_rpm@pm-tiling.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-kbl3/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-kbl4/igt@i915_pm_rpm@pm-tiling.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-apl6/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-apl1/igt@i915_pm_rpm@pm-tiling.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-glk1/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-glk2/igt@i915_pm_rpm@pm-tiling.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-iclb2/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb2/igt@i915_pm_rpm@pm-tiling.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-kbl4/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-kbl6/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-glk8/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-glk7/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@test-time-stamp}:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-apl1/igt@kms_async_flips@test-time-stamp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-apl6/igt@kms_async_flips@test-time-stamp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-glk2/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-glk3/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-glk8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-glk1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-kbl1/igt@kms_flip@dpms-vs-vblank-race@c-dp1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-kbl4/igt@kms_flip@dpms-vs-vblank-race@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-kbl2/igt@kms_flip_tiling@flip-x-tiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-kbl3/igt@kms_flip_tiling@flip-x-tiled.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-tglb2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-tglb7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-iclb6/igt@kms_psr@suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb5/igt@kms_psr@suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@non-system-wide-paranoid:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-apl7/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-apl4/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-glk2/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-glk9/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-iclb6/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb6/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-kbl3/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-kbl1/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-tglb2/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-tglb1/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-kbl6/igt@sysfs_heartbeat_interval@mixed@rcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1731">i915#1731</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-kbl1/igt@sysfs_heartbeat_interval@mixed@rcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-iclb6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110892">fdo#110892</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-tglb3/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-tglb7/igt@i915_pm_rpm@pm-tiling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-apl4/igt@kms_content_protection@lic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-apl3/igt@kms_content_protection@lic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-tglb8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-tglb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-apl8/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-apl8/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-iclb1/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb5/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-glk8/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-glk4/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-kbl4/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-kbl7/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-tglb6/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-tglb8/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-iclb6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-iclb8/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9251/shard-tglb3/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/shard-tglb3/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5830 -&gt; IGTPW_5122</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9251: ed79ec92754cf19d3cc924fce8ab915e541d5761 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5122: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5122/index.html<br />
  IGT_5830: 12d370cb57e0cfcb781c87ad9e15e68b17a1f41f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============1380944776283865978==--

--===============1091750934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1091750934==--
