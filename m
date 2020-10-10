Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 10 Oct 2020 01:21:02 -0000
Message-ID: <160229286285.25006.13074336830425993183@emeril.freedesktop.org>
References: <20201009170225.10542-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20201009170225.10542-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?core=5Fhotunplug=3A_Restore_i915_debugfs_health_check?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1994710213=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1994710213==
Content-Type: multipart/alternative;
 boundary="===============0751415768870799810=="

--===============0751415768870799810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/core_hotunplug: Restore i915 debugfs health check
URL   : https://patchwork.freedesktop.org/series/82519/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9120_full -> IGTPW_5050_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5050_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@core_hotunplug@hotrebind} (NEW):
    - shard-hsw:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-hsw2/igt@core_hotunplug@hotrebind.html
    - shard-tglb:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-tglb6/igt@core_hotunplug@hotrebind.html
    - shard-iclb:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-iclb5/igt@core_hotunplug@hotrebind.html
    - shard-snb:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-snb2/igt@core_hotunplug@hotrebind.html
    - shard-glk:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-glk8/igt@core_hotunplug@hotrebind.html
    - shard-kbl:          NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-kbl7/igt@core_hotunplug@hotrebind.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@core_hotunplug@hotrebind-lateclose}:
    - shard-snb:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-snb6/igt@core_hotunplug@hotrebind-lateclose.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-snb7/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-iclb:         [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-iclb6/igt@core_hotunplug@hotrebind-lateclose.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-iclb3/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-tglb:         [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-tglb2/igt@core_hotunplug@hotrebind-lateclose.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-tglb3/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-glk:          [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-glk4/igt@core_hotunplug@hotrebind-lateclose.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-glk7/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-hsw:          [WARN][15] ([i915#2283]) -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-hsw2/igt@core_hotunplug@hotrebind-lateclose.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-hsw4/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-kbl:          [PASS][17] -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-kbl7/igt@core_hotunplug@hotrebind-lateclose.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-kbl4/igt@core_hotunplug@hotrebind-lateclose.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9120_full and IGTPW_5050_full:

### New IGT tests (1) ###

  * igt@core_hotunplug@hotrebind:
    - Statuses : 7 fail(s)
    - Exec time: [0.44, 1.98] s

  

Known issues
------------

  Here are the changes found in IGTPW_5050_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-kbl7/igt@gem_eio@in-flight-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-kbl4/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#1635] / [i915#2389])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-apl1/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@vecs0:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#2389]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-glk2/igt@gem_exec_reloc@basic-many-active@vecs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-glk2/igt@gem_exec_reloc@basic-many-active@vecs0.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-iclb:         [PASS][25] -> [DMESG-WARN][26] ([i915#1226])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#54]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#1635] / [i915#54]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#1982])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#79])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-tglb:         [PASS][35] -> [DMESG-WARN][36] ([i915#1982]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109642] / [fdo#111068])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-iclb8/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [PASS][41] -> [INCOMPLETE][42] ([i915#155])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-b-wait-idle-hang:
    - shard-apl:          [PASS][43] -> [DMESG-WARN][44] ([i915#1635] / [i915#1982])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-apl6/igt@kms_vblank@pipe-b-wait-idle-hang.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-apl6/igt@kms_vblank@pipe-b-wait-idle-hang.html

  * igt@perf@blocking-parameterized:
    - shard-kbl:          [PASS][45] -> [SKIP][46] ([fdo#109271] / [i915#1354]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-kbl2/igt@perf@blocking-parameterized.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-kbl2/igt@perf@blocking-parameterized.html
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([i915#1354]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-iclb5/igt@perf@blocking-parameterized.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-iclb1/igt@perf@blocking-parameterized.html
    - shard-hsw:          [PASS][49] -> [SKIP][50] ([fdo#109271]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-hsw1/igt@perf@blocking-parameterized.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-hsw2/igt@perf@blocking-parameterized.html

  * igt@perf@polling-small-buf:
    - shard-glk:          [PASS][51] -> [SKIP][52] ([fdo#109271] / [i915#1354]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-glk9/igt@perf@polling-small-buf.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-glk2/igt@perf@polling-small-buf.html
    - shard-tglb:         [PASS][53] -> [SKIP][54] ([i915#1354]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-tglb5/igt@perf@polling-small-buf.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-tglb7/igt@perf@polling-small-buf.html
    - shard-apl:          [PASS][55] -> [SKIP][56] ([fdo#109271] / [i915#1354] / [i915#1635]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-apl8/igt@perf@polling-small-buf.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-apl7/igt@perf@polling-small-buf.html

  * igt@syncobj_timeline@multi-wait-all-available-submitted-signaled:
    - shard-iclb:         [PASS][57] -> [DMESG-WARN][58] ([i915#1982])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-iclb3/igt@syncobj_timeline@multi-wait-all-available-submitted-signaled.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-iclb7/igt@syncobj_timeline@multi-wait-all-available-submitted-signaled.html

  
#### Possible fixes ####

  * {igt@gem_exec_capture@pi@rcs0}:
    - shard-glk:          [INCOMPLETE][59] ([i915#2553]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-glk5/igt@gem_exec_capture@pi@rcs0.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-glk1/igt@gem_exec_capture@pi@rcs0.html

  * {igt@gem_exec_capture@pi@vcs0}:
    - shard-iclb:         [INCOMPLETE][61] ([i915#2559]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-iclb7/igt@gem_exec_capture@pi@vcs0.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-iclb6/igt@gem_exec_capture@pi@vcs0.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [DMESG-WARN][63] ([i915#118] / [i915#95]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-glk9/igt@gem_exec_whisper@basic-queues-forked-all.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-glk6/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][65] ([i915#2190]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-tglb1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-tglb:         [FAIL][67] ([i915#2541]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-tglb2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-tglb1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [WARN][69] ([i915#1519]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][71] ([i915#1635] / [i915#1982]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-apl2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-apl4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
    - shard-kbl:          [DMESG-WARN][73] ([i915#1982]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-kbl4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-kbl4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [FAIL][75] ([i915#96]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_flip@flip-vs-suspend@a-edp1:
    - shard-iclb:         [INCOMPLETE][77] ([i915#2483]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-iclb3/igt@kms_flip@flip-vs-suspend@a-edp1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-iclb1/igt@kms_flip@flip-vs-suspend@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-snb:          [FAIL][79] ([i915#2546]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
    - shard-tglb:         [DMESG-WARN][81] ([i915#1982]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-tglb8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-tglb5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [DMESG-WARN][83] ([i915#180]) -> [PASS][84] +11 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@perf@polling:
    - shard-glk:          [SKIP][85] ([fdo#109271] / [i915#1354]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-glk4/igt@perf@polling.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-glk1/igt@perf@polling.html
    - shard-tglb:         [SKIP][87] ([i915#1354]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-tglb2/igt@perf@polling.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-tglb5/igt@perf@polling.html
    - shard-apl:          [SKIP][89] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-apl3/igt@perf@polling.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-apl8/igt@perf@polling.html
    - shard-kbl:          [SKIP][91] ([fdo#109271] / [i915#1354]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-kbl7/igt@perf@polling.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-kbl2/igt@perf@polling.html
    - shard-hsw:          [SKIP][93] ([fdo#109271]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-hsw2/igt@perf@polling.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-hsw2/igt@perf@polling.html
    - shard-iclb:         [SKIP][95] ([i915#1354]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-iclb6/igt@perf@polling.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-iclb6/igt@perf@polling.html

  
#### Warnings ####

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-snb:          [FAIL][97] ([i915#2541]) -> [SKIP][98] ([fdo#109271])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-snb6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-snb2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
    - shard-iclb:         [FAIL][99] ([i915#2541]) -> [SKIP][100] ([i915#768])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-iclb6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-iclb7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
    - shard-kbl:          [FAIL][101] ([i915#2541]) -> [SKIP][102] ([fdo#109271])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-kbl7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-kbl6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
    - shard-hsw:          [FAIL][103] ([i915#2541]) -> [SKIP][104] ([fdo#109271])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-hsw2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-hsw2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
    - shard-glk:          [FAIL][105] ([i915#2541]) -> [SKIP][106] ([fdo#109271])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-glk4/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-glk5/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
    - shard-apl:          [FAIL][107] ([i915#1635]) -> [SKIP][108] ([fdo#109271] / [i915#1635])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-apl3/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-apl3/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-tglb:         [SKIP][109] ([fdo#109289]) -> [SKIP][110] ([i915#1354])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-tglb8/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-tglb7/igt@perf@gen8-unprivileged-single-ctx-counters.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2483]: https://gitlab.freedesktop.org/drm/intel/issues/2483
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2541]: https://gitlab.freedesktop.org/drm/intel/issues/2541
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2553]: https://gitlab.freedesktop.org/drm/intel/issues/2553
  [i915#2559]: https://gitlab.freedesktop.org/drm/intel/issues/2559
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5806 -> IGTPW_5050
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9120: c68cc26e956a13687638a89bdec9e25cc6eb2411 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5050: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/index.html
  IGT_5806: 6adb80cd84310b6d90a5259768d03ebb2c30fe50 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/index.html

--===============0751415768870799810==
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
<tr><td><b>Series:</b></td><td>tests/core_hotunplug: Restore i915 debugfs health check</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82519/">https://patchwork.freedesktop.org/series/82519/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9120_full -&gt; IGTPW_5050_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5050_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@core_hotunplug@hotrebind} (NEW):</p>
<ul>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-hsw2/igt@core_hotunplug@hotrebind.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-tglb6/igt@core_hotunplug@hotrebind.html">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-iclb5/igt@core_hotunplug@hotrebind.html">FAIL</a></p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-snb2/igt@core_hotunplug@hotrebind.html">FAIL</a></p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-glk8/igt@core_hotunplug@hotrebind.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-kbl7/igt@core_hotunplug@hotrebind.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@core_hotunplug@hotrebind-lateclose}:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-snb6/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-snb7/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-iclb6/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-iclb3/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-tglb2/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-tglb3/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-glk4/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-glk7/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-hsw2/igt@core_hotunplug@hotrebind-lateclose.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-hsw4/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-kbl7/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-kbl4/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9120_full and IGTPW_5050_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@core_hotunplug@hotrebind:<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.44, 1.98] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5050_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-kbl7/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-kbl4/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-apl1/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-glk2/igt@gem_exec_reloc@basic-many-active@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-glk2/igt@gem_exec_reloc@basic-many-active@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-iclb8/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-wait-idle-hang:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-apl6/igt@kms_vblank@pipe-b-wait-idle-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-apl6/igt@kms_vblank@pipe-b-wait-idle-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-kbl2/igt@perf@blocking-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-kbl2/igt@perf@blocking-parameterized.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-iclb5/igt@perf@blocking-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-iclb1/igt@perf@blocking-parameterized.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +2 similar issues</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-hsw1/igt@perf@blocking-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-hsw2/igt@perf@blocking-parameterized.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-glk9/igt@perf@polling-small-buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-glk2/igt@perf@polling-small-buf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-tglb5/igt@perf@polling-small-buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-tglb7/igt@perf@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-apl8/igt@perf@polling-small-buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-apl7/igt@perf@polling-small-buf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-all-available-submitted-signaled:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-iclb3/igt@syncobj_timeline@multi-wait-all-available-submitted-signaled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-iclb7/igt@syncobj_timeline@multi-wait-all-available-submitted-signaled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_exec_capture@pi@rcs0}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-glk5/igt@gem_exec_capture@pi@rcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2553">i915#2553</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-glk1/igt@gem_exec_capture@pi@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_capture@pi@vcs0}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-iclb7/igt@gem_exec_capture@pi@vcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2559">i915#2559</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-iclb6/igt@gem_exec_capture@pi@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-glk9/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-glk6/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-tglb1/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-tglb2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-tglb1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-apl2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-apl4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-kbl4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-kbl4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/96">i915#96</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-edp1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-iclb3/igt@kms_flip@flip-vs-suspend@a-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2483">i915#2483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-iclb1/igt@kms_flip@flip-vs-suspend@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2546">i915#2546</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-tglb8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-tglb5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@polling:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-glk4/igt@perf@polling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-glk1/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-tglb2/igt@perf@polling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-tglb5/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-apl3/igt@perf@polling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-apl8/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-kbl7/igt@perf@polling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-kbl2/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-hsw2/igt@perf@polling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-hsw2/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-iclb6/igt@perf@polling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-iclb6/igt@perf@polling.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-snb6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-snb2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-iclb6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-iclb7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/768">i915#768</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-kbl7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-kbl6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-hsw2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-hsw2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-glk4/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-glk5/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-apl3/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-apl3/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9120/shard-tglb8/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/shard-tglb7/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</li>
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
<li>IGT: IGT_5806 -&gt; IGTPW_5050</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9120: c68cc26e956a13687638a89bdec9e25cc6eb2411 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5050: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5050/index.html<br />
  IGT_5806: 6adb80cd84310b6d90a5259768d03ebb2c30fe50 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============0751415768870799810==--

--===============1994710213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1994710213==--
