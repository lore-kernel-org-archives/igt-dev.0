Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 13 Nov 2020 09:32:21 -0000
Message-ID: <160525994196.20635.5746952996676505975@emeril.freedesktop.org>
References: <20201113050201.229179-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20201113050201.229179-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2k5?=
 =?utf-8?q?15=3A_Identify_Jasperlake_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0443122579=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0443122579==
Content-Type: multipart/alternative;
 boundary="===============8742683806014563726=="

--===============8742683806014563726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/i915: Identify Jasperlake (rev2)
URL   : https://patchwork.freedesktop.org/series/83674/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9322_full -> IGTPW_5162_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5162_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5162_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5162_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_userptr_blits@coherency-sync:
    - shard-snb:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-snb4/igt@gem_userptr_blits@coherency-sync.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-snb5/igt@gem_userptr_blits@coherency-sync.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9322_full and IGTPW_5162_full:

### New IGT tests (2) ###

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-d-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [9.73] s

  * igt@kms_plane_scaling@scaler-with-rotation:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_5162_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@in-flight-suspend:
    - shard-hsw:          [PASS][3] -> [INCOMPLETE][4] ([i915#2637])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-hsw7/igt@gem_eio@in-flight-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-hsw1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#2635])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-glk9/igt@gem_workarounds@suspend-resume-fd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-glk9/igt@gem_workarounds@suspend-resume-fd.html
    - shard-hsw:          [PASS][7] -> [DMESG-WARN][8] ([i915#2637])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-hsw5/igt@gem_workarounds@suspend-resume-fd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-hsw7/igt@gem_workarounds@suspend-resume-fd.html
    - shard-iclb:         [PASS][9] -> [INCOMPLETE][10] ([i915#1185])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-iclb8/igt@gem_workarounds@suspend-resume-fd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-iclb5/igt@gem_workarounds@suspend-resume-fd.html
    - shard-kbl:          [PASS][11] -> [INCOMPLETE][12] ([i915#155])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html
    - shard-apl:          [PASS][13] -> [INCOMPLETE][14] ([i915#1635] / [i915#2635])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-apl1/igt@gem_workarounds@suspend-resume-fd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-apl7/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-kbl:          [PASS][15] -> [SKIP][16] ([fdo#109271]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-kbl7/igt@i915_pm_rpm@drm-resources-equal.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-kbl2/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([i915#579]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-iclb1/igt@i915_pm_rpm@drm-resources-equal.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-iclb5/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#1119])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-glk7/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-glk3/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:
    - shard-glk:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-glk7/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-glk8/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#1635] / [i915#1982]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-apl6/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-apl7/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html

  * igt@kms_flip@dpms-vs-vblank-race@a-dp1:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-kbl4/igt@kms_flip@dpms-vs-vblank-race@a-dp1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-kbl6/igt@kms_flip@dpms-vs-vblank-race@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-hsw:          [PASS][27] -> [INCOMPLETE][28] ([i915#2055])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-hsw5/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-snb:          [PASS][29] -> [FAIL][30] ([i915#2546])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-tglb:         [PASS][31] -> [DMESG-WARN][32] ([i915#1982]) +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-iclb:         [PASS][33] -> [INCOMPLETE][34] ([i915#1185] / [i915#123])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-iclb6/igt@kms_frontbuffer_tracking@psr-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-iclb7/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-iclb6/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:
    - shard-hsw:          [PASS][37] -> [SKIP][38] ([fdo#109271]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-hsw7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-hsw7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-apl:          [PASS][39] -> [SKIP][40] ([fdo#109271] / [i915#1635]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-apl7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-glk:          [PASS][41] -> [SKIP][42] ([fdo#109271]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-glk7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-glk9/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109278])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-iclb1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-iclb5/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html

  * igt@perf@polling:
    - shard-glk:          [PASS][45] -> [SKIP][46] ([fdo#109271] / [i915#1354])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-glk2/igt@perf@polling.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-glk8/igt@perf@polling.html
    - shard-tglb:         [PASS][47] -> [SKIP][48] ([i915#1354])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-tglb8/igt@perf@polling.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-tglb8/igt@perf@polling.html
    - shard-apl:          [PASS][49] -> [SKIP][50] ([fdo#109271] / [i915#1354] / [i915#1635])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-apl7/igt@perf@polling.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-apl1/igt@perf@polling.html
    - shard-kbl:          [PASS][51] -> [SKIP][52] ([fdo#109271] / [i915#1354])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-kbl2/igt@perf@polling.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-kbl6/igt@perf@polling.html
    - shard-iclb:         [PASS][53] -> [SKIP][54] ([i915#1354])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-iclb3/igt@perf@polling.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-iclb2/igt@perf@polling.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-apl:          [INCOMPLETE][55] ([i915#1635] / [i915#2283]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-apl6/igt@device_reset@unbind-reset-rebind.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-apl4/igt@device_reset@unbind-reset-rebind.html
    - shard-kbl:          [INCOMPLETE][57] ([i915#2283]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-kbl6/igt@device_reset@unbind-reset-rebind.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-kbl1/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-glk:          [INCOMPLETE][59] -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-glk1/igt@gem_exec_whisper@basic-queues-forked.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-glk1/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_sync@basic-each:
    - shard-snb:          [FAIL][61] -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-snb7/igt@gem_sync@basic-each.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-snb4/igt@gem_sync@basic-each.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-iclb:         [FAIL][63] ([i915#2521]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-iclb2/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-iclb7/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - shard-apl:          [FAIL][65] ([i915#1635] / [i915#2521]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-apl2/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-apl6/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge:
    - shard-glk:          [DMESG-WARN][67] ([i915#1982]) -> [PASS][68] +6 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-glk3/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-glk2/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-right-edge:
    - shard-snb:          [SKIP][69] ([fdo#109271]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-snb6/igt@kms_cursor_edge_walk@pipe-a-64x64-right-edge.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-snb6/igt@kms_cursor_edge_walk@pipe-a-64x64-right-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-kbl:          [FAIL][71] ([i915#2346]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-kbl4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-untiled:
    - shard-apl:          [DMESG-WARN][73] ([i915#1635] / [i915#1982]) -> [PASS][74] +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-apl8/igt@kms_draw_crc@draw-method-rgb565-blt-untiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-apl4/igt@kms_draw_crc@draw-method-rgb565-blt-untiled.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1:
    - shard-kbl:          [DMESG-WARN][75] ([i915#1982]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-kbl1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-kbl1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-tglb:         [DMESG-WARN][77] ([i915#1982]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-hsw:          [INCOMPLETE][79] ([i915#2055] / [i915#2637]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-hsw6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-hsw5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-kbl:          [INCOMPLETE][81] ([i915#155]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [INCOMPLETE][83] ([i915#1635] / [i915#2635]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-glk:          [DMESG-WARN][85] ([i915#2635]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-glk6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-glk7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][87] ([fdo#109441]) -> [PASS][88] +5 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  
#### Warnings ####

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-tglb:         [DMESG-WARN][89] ([i915#2411]) -> [DMESG-WARN][90] ([i915#1436])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-tglb1/igt@gem_workarounds@suspend-resume-fd.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-tglb5/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-tglb:         [DMESG-WARN][91] ([i915#2411]) -> [SKIP][92] ([i915#579]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-tglb6/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-tglb5/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-tglb:         [DMESG-WARN][93] ([i915#2411]) -> [INCOMPLETE][94] ([i915#1436] / [i915#456])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-tglb2/igt@kms_frontbuffer_tracking@psr-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-tglb1/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
    - shard-apl:          [FAIL][95] ([fdo#108145] / [i915#1635] / [i915#265]) -> [DMESG-FAIL][96] ([fdo#108145] / [i915#1635] / [i915#1982])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:
    - shard-tglb:         [DMESG-WARN][97] ([i915#2411]) -> [SKIP][98] ([i915#2648])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-tglb6/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-tglb5/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][99] ([fdo#109271]) -> ([FAIL][100], [FAIL][101]) ([fdo#109271] / [i915#1436] / [i915#2439] / [i915#483])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-hsw6/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-hsw7/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-hsw1/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][102], [FAIL][103]) ([i915#1611] / [i915#2439] / [i915#483]) -> [FAIL][104] ([i915#1611] / [i915#2439])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-kbl6/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-kbl6/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-kbl7/igt@runner@aborted.html
    - shard-apl:          ([FAIL][105], [FAIL][106], [FAIL][107]) ([fdo#109271] / [i915#1611] / [i915#1635] / [i915#1814] / [i915#2439]) -> ([FAIL][108], [FAIL][109], [FAIL][110]) ([fdo#109271] / [i915#1610] / [i915#1611] / [i915#1635] / [i915#1814] / [i915#2439])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-apl3/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-apl2/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-apl6/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-apl3/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-apl7/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-apl1/igt@runner@aborted.html
    - shard-glk:          ([FAIL][111], [FAIL][112], [FAIL][113]) ([i915#1611] / [i915#1814] / [i915#2263] / [i915#2439] / [k.org#202321]) -> ([FAIL][114], [FAIL][115], [FAIL][116]) ([i915#1611] / [i915#1814] / [i915#2439] / [k.org#202321])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-glk1/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-glk6/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-glk1/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-glk9/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-glk9/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-glk5/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][117], [FAIL][118]) ([i915#2439]) -> ([FAIL][119], [FAIL][120], [FAIL][121]) ([i915#1602] / [i915#1814] / [i915#2439] / [i915#456])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-tglb6/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-tglb2/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-tglb3/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-tglb1/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-tglb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2263]: https://gitlab.freedesktop.org/drm/intel/issues/2263
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2648]: https://gitlab.freedesktop.org/drm/intel/issues/2648
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5848 -> IGTPW_5162
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9322: 9e8f0d817f61254084a325460e636ecc43fac95b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5162: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/index.html
  IGT_5848: 1e2525da258aab5e0e3a7705ea8e89b521d5bf88 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/index.html

--===============8742683806014563726==
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
<tr><td><b>Series:</b></td><td>lib/i915: Identify Jasperlake (rev2)</td></t=
r>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/83674/">https://patchwork.freedesktop.org/series/83674/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5162/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5162/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9322_full -&gt; IGTPW_5162_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5162_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5162_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5162=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_userptr_blits@coherency-sync:<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-snb4/igt@gem_userptr_blits@coherency-sync.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard=
-snb5/igt@gem_userptr_blits@coherency-sync.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9322_full and IGTPW_5162_f=
ull:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-d-scaler-with-pixel-=
format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5162_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-hsw7/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-hsw1/i=
gt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2637">i915#2637</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-glk9/igt@gem_workarounds@suspend-resume-fd.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard=
-glk9/igt@gem_workarounds@suspend-resume-fd.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-hsw5/igt@gem_workarounds@suspend-resume-fd.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard=
-hsw7/igt@gem_workarounds@suspend-resume-fd.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-iclb8/igt@gem_workarounds@suspend-resume-fd.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shar=
d-iclb5/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard=
-kbl2/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-apl1/igt@gem_workarounds@suspend-resume-fd.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard=
-apl7/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</=
a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@drm-resources-equal:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-kbl7/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-k=
bl2/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +2 similar i=
ssues</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-iclb1/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-=
iclb5/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) +1 similar iss=
ue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-glk7/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/sh=
ard-glk3/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1119">i915#1119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-glk7/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5162/shard-glk8/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-apl6/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5162/shard-apl7/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635=
">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-kbl4/igt@kms_flip@dpms-vs-vblank-race@a-dp1.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/sha=
rd-kbl6/igt@kms_flip@dpms-vs-vblank-race@a-dp1.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +=
1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-hsw5/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a=
1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5162/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2055">i915#2055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-in=
dfb-draw-pwrite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5162/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-pri=
mscrn-spr-indfb-draw-pwrite.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-in=
dfb-plflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5162/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-=
primscrn-indfb-plflip-blt.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-iclb6/igt@kms_frontbuffer_tracking@psr-suspend.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/=
shard-iclb7/igt@kms_frontbuffer_tracking@psr-suspend.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/123">i915#=
123</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-iclb6/igt@=
kms_psr@psr2_no_drrs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-hsw7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5162/shard-hsw7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5162/shard-apl7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1635">i915#1635</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-glk7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5162/shard-glk9/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-iclb1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5162/shard-iclb5/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278=
">fdo#109278</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-glk2/igt@perf@polling.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-glk8/igt@perf@pollin=
g.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-tglb8/igt@perf@polling.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-tglb8/igt@perf@poll=
ing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-apl7/igt@perf@polling.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-apl1/igt@perf@pollin=
g.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1354">i915#1354</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-kbl2/igt@perf@polling.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-kbl6/igt@perf@pollin=
g.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-iclb3/igt@perf@polling.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-iclb2/igt@perf@poll=
ing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1354">i915#1354</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-apl6/igt@device_reset@unbind-reset-rebind.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i91=
5#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/228=
3">i915#2283</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5162/shard-apl4/igt@device_reset@unbind-reset-rebind.html">PASS</a><=
/p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-kbl6/igt@device_reset@unbind-reset-rebind.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i91=
5#2283</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5162/shard-kbl1/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-glk1/igt@gem_exec_whisper@basic-queues-forked.html">INCO=
MPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5162/shard-glk1/igt@gem_exec_whisper@basic-queues-forked.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_sync@basic-each:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-snb7/igt@gem_sync@basic-each.html">FAIL</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-snb4/igt@gem=
_sync@basic-each.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-iclb2/igt@kms_async_flips@async-flip-with-page-flip-event=
s.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2521">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5162/shard-iclb7/igt@kms_async_flips@async-flip-with-page-flip-=
events.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-apl2/igt@kms_async_flips@async-flip-with-page-flip-events=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2521">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5162/shard-apl6/igt@kms_async_flips@async-flip-with-page-f=
lip-events.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-glk3/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5162/shard-glk2/igt@kms_cursor_edge_walk@pipe-a-128x128-top-e=
dge.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-64x64-right-edge:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-snb6/igt@kms_cursor_edge_walk@pipe-a-64x64-right-edge.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5162/shard-snb6/igt@kms_cursor_edge_walk@pipe-a-64x64-right-edge.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-kbl4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">i=
915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5162/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-untiled:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-apl8/igt@kms_draw_crc@draw-method-rgb565-blt-untiled.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5162/shard-apl4/igt@kms_draw_crc@draw-method-rgb565-blt-=
untiled.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-kbl1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5162/shard-kbl1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.ht=
ml">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-badstride.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5162/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-badstride.html">=
PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-hsw6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2055">i915#2055</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2637">i915#2637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5162/shard-hsw5/igt@kms_pipe_crc_basic@suspend-read-crc-pi=
pe-a.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/155">i915#155</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5162/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.htm=
l">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5162/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pi=
pe-a.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-glk6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5162/shard-glk7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.h=
tml">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/=
shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> +5 similar issu=
es</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-tglb1/igt@gem_workarounds@suspend-resume-fd.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">=
i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5162/shard-tglb5/igt@gem_workarounds@suspend-resume-fd.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915=
#1436</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-tglb6/igt@i915_pm_rpm@modeset-lpsp-stress.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i9=
15#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5162/shard-tglb5/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) +=
1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-tglb2/igt@kms_frontbuffer_tracking@psr-suspend.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/241=
1">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5162/shard-tglb1/igt@kms_frontbuffer_tracking@psr-suspend.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436=
">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/456">i915#456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html">F=
AIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108145">=
fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/265">i915#265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5162/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.=
html">DMESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-tglb6/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5162/shard-tglb5/igt@kms_vblank@pipe-c-ts-continuation-mode=
set-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2648">i915#2648</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9322/shard-hsw6/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-hsw7/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5162/shard-hsw1/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i91=
5#2439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/483=
">i915#483</a>)</p>
</li>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-kbl6/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1611">i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2439">i915#2439</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/483">i915#483</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5162/shard-kbl7/igt@runner@aborted.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915=
#2439</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-apl2/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9322/shard-apl6/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915=
#2439</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5162/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-apl7/igt@runner@aborted.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/s=
hard-apl1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#=
2439</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-glk1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-glk6/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9322/shard-glk1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2263">i915#2263</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</=
a> / <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org=
#202321</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5162/shard-glk9/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-glk9/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162=
/shard-glk5/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <a href=
=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>)=
</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9322/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9322/shard-tglb2/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2439">i915#2439</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5162/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/shard-tglb1/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5162/shard-tglb5/igt@runner@aborted.html">FAIL</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#243=
9</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/456">i91=
5#456</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5848 -&gt; IGTPW_5162</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9322: 9e8f0d817f61254084a325460e636ecc43fac95b @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5162: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5162/index.htm=
l<br />
  IGT_5848: 1e2525da258aab5e0e3a7705ea8e89b521d5bf88 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============8742683806014563726==--

--===============0443122579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0443122579==--
