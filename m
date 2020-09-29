Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 29 Sep 2020 16:37:44 -0000
Message-ID: <160139746486.28027.15648408852337209021@emeril.freedesktop.org>
References: <20200928220027.417167-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200928220027.417167-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?en9=5Fexec=5Fparse=3A_Check_parsing_of_large_objects_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1813870336=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1813870336==
Content-Type: multipart/alternative;
 boundary="===============2053335461942025420=="

--===============2053335461942025420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gen9_exec_parse: Check parsing of large objects (rev2)
URL   : https://patchwork.freedesktop.org/series/82166/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9070_full -> IGTPW_5019_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5019_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gen9_exec_parse@bb-large} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-tglb1/igt@gen9_exec_parse@bb-large.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-kbl4/igt@gen9_exec_parse@bb-large.html
    - shard-iclb:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-iclb4/igt@gen9_exec_parse@bb-large.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9070_full and IGTPW_5019_full:

### New IGT tests (1) ###

  * igt@gen9_exec_parse@bb-large:
    - Statuses : 1 incomplete(s) 1 pass(s) 4 skip(s) 1 timeout(s)
    - Exec time: [0.0, 125.44] s

  

Known issues
------------

  Here are the changes found in IGTPW_5019_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [PASS][4] -> [FAIL][5] ([i915#1635] / [i915#2389])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-apl8/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-apl6/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@vcs0:
    - shard-glk:          [PASS][6] -> [FAIL][7] ([i915#2389]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-glk4/igt@gem_exec_reloc@basic-many-active@vcs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-glk1/igt@gem_exec_reloc@basic-many-active@vcs0.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-glk:          [PASS][8] -> [DMESG-WARN][9] ([i915#118] / [i915#95]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-glk5/igt@gem_exec_whisper@basic-fds-priority.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-glk8/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [PASS][10] -> [INCOMPLETE][11] ([i915#155])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-kbl4/igt@i915_suspend@sysfs-reader.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-kbl3/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen:
    - shard-glk:          [PASS][12] -> [FAIL][13] ([i915#54])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-glk7/igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen.html
    - shard-apl:          [PASS][14] -> [FAIL][15] ([i915#1635] / [i915#54])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen.html
    - shard-kbl:          [PASS][16] -> [FAIL][17] ([i915#54])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled:
    - shard-apl:          [PASS][18] -> [DMESG-WARN][19] ([i915#1635] / [i915#1982])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-apl1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-apl6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html
    - shard-glk:          [PASS][20] -> [DMESG-WARN][21] ([i915#1982])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-glk1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-glk4/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html

  * igt@kms_flip@2x-flip-vs-panning@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][22] -> [DMESG-WARN][23] ([i915#1982])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-hsw6/igt@kms_flip@2x-flip-vs-panning@ab-vga1-hdmi-a1.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-hsw1/igt@kms_flip@2x-flip-vs-panning@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1:
    - shard-kbl:          [PASS][24] -> [DMESG-WARN][25] ([i915#1982]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-kbl1/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-kbl4/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-tglb:         [PASS][26] -> [DMESG-WARN][27] ([i915#1982]) +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack:
    - shard-glk:          [PASS][28] -> [FAIL][29] ([i915#49])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][30] -> [DMESG-WARN][31] ([i915#180]) +7 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][32] -> [SKIP][33] ([fdo#109441]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-iclb7/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_setmode@basic:
    - shard-glk:          [PASS][34] -> [FAIL][35] ([i915#31])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-glk9/igt@kms_setmode@basic.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-glk7/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * {igt@gem_ctx_persistence@heartbeat-close}:
    - shard-iclb:         [FAIL][36] ([i915#2519]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-iclb4/igt@gem_ctx_persistence@heartbeat-close.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-iclb5/igt@gem_ctx_persistence@heartbeat-close.html
    - shard-tglb:         [FAIL][38] ([i915#2519]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-tglb1/igt@gem_ctx_persistence@heartbeat-close.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-tglb2/igt@gem_ctx_persistence@heartbeat-close.html

  * {igt@gem_ctx_persistence@heartbeat-stop}:
    - shard-kbl:          [FAIL][40] ([i915#2520]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-kbl6/igt@gem_ctx_persistence@heartbeat-stop.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-kbl6/igt@gem_ctx_persistence@heartbeat-stop.html
    - shard-iclb:         [FAIL][42] ([i915#2520]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-iclb2/igt@gem_ctx_persistence@heartbeat-stop.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-iclb4/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_exec_reloc@basic-many-active@vecs0:
    - shard-glk:          [FAIL][44] ([i915#2389]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-glk4/igt@gem_exec_reloc@basic-many-active@vecs0.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-glk1/igt@gem_exec_reloc@basic-many-active@vecs0.html

  * igt@gem_exec_whisper@basic-contexts-priority:
    - shard-glk:          [DMESG-WARN][46] ([i915#118] / [i915#95]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-glk9/igt@gem_exec_whisper@basic-contexts-priority.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-glk2/igt@gem_exec_whisper@basic-contexts-priority.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-snb:          [INCOMPLETE][48] ([i915#82]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-snb1/igt@gem_fenced_exec_thrash@no-spare-fences.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-snb6/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-kbl:          [INCOMPLETE][50] ([i915#1373] / [i915#726]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-kbl1/igt@i915_module_load@reload-with-fault-injection.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-kbl6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [FAIL][52] ([i915#1899]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-iclb1/igt@i915_pm_dc@dc5-psr.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-iclb4/igt@i915_pm_dc@dc5-psr.html

  * {igt@kms_async_flips@alternate-sync-async-flip}:
    - shard-apl:          [FAIL][54] ([i915#1635] / [i915#2521]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-apl4/igt@kms_async_flips@alternate-sync-async-flip.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-apl6/igt@kms_async_flips@alternate-sync-async-flip.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-glk:          [FAIL][56] ([i915#2521]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-glk2/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-glk8/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-kbl:          [DMESG-WARN][58] ([i915#1982]) -> [PASS][59] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-kbl4/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-kbl1/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-iclb:         [INCOMPLETE][60] ([i915#1185]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][62] ([i915#180]) -> [PASS][63] +7 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-tglb:         [DMESG-WARN][64] ([i915#1982]) -> [PASS][65] +3 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [DMESG-FAIL][66] ([i915#118] / [i915#95]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][68] ([fdo#109441]) -> [PASS][69] +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf_pmu@module-unload:
    - shard-hsw:          [DMESG-WARN][70] ([i915#1982]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-hsw1/igt@perf_pmu@module-unload.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-hsw1/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc5-psr:
    - shard-tglb:         [FAIL][72] ([i915#1899]) -> [DMESG-WARN][73] ([i915#2411])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-tglb7/igt@i915_pm_dc@dc5-psr.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-tglb8/igt@i915_pm_dc@dc5-psr.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][74] ([i915#2292] / [i915#2439] / [i915#92]) -> [FAIL][75] ([fdo#109271] / [i915#1436] / [i915#1784])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-kbl1/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-kbl4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1373]: https://gitlab.freedesktop.org/drm/intel/issues/1373
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1784]: https://gitlab.freedesktop.org/drm/intel/issues/1784
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2292]: https://gitlab.freedesktop.org/drm/intel/issues/2292
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#2519]: https://gitlab.freedesktop.org/drm/intel/issues/2519
  [i915#2520]: https://gitlab.freedesktop.org/drm/intel/issues/2520
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#726]: https://gitlab.freedesktop.org/drm/intel/issues/726
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5790 -> IGTPW_5019
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9070: 56af0fcd9fad36c90150b0244f61e94adaac3d6a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5019: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/index.html
  IGT_5790: 722a3eb9734f04030508d244df9dff55c5ab686c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/index.html

--===============2053335461942025420==
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
<tr><td><b>Series:</b></td><td>i915/gen9_exec_parse: Check parsing of large objects (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82166/">https://patchwork.freedesktop.org/series/82166/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9070_full -&gt; IGTPW_5019_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5019_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gen9_exec_parse@bb-large} (NEW):</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-tglb1/igt@gen9_exec_parse@bb-large.html">SKIP</a></p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-kbl4/igt@gen9_exec_parse@bb-large.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-iclb4/igt@gen9_exec_parse@bb-large.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9070_full and IGTPW_5019_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gen9_exec_parse@bb-large:<ul>
<li>Statuses : 1 incomplete(s) 1 pass(s) 4 skip(s) 1 timeout(s)</li>
<li>Exec time: [0.0, 125.44] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5019_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-apl8/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-apl6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-glk4/igt@gem_exec_reloc@basic-many-active@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-glk1/igt@gem_exec_reloc@basic-many-active@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-glk5/igt@gem_exec_whisper@basic-fds-priority.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-glk8/igt@gem_exec_whisper@basic-fds-priority.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-kbl4/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-kbl3/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-glk7/igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-apl1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-apl6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-glk1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-glk4/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-hsw6/igt@kms_flip@2x-flip-vs-panning@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-hsw1/igt@kms_flip@2x-flip-vs-panning@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-kbl1/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-kbl4/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-iclb7/igt@kms_psr@psr2_cursor_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-glk9/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-glk7/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_ctx_persistence@heartbeat-close}:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-iclb4/igt@gem_ctx_persistence@heartbeat-close.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2519">i915#2519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-iclb5/igt@gem_ctx_persistence@heartbeat-close.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-tglb1/igt@gem_ctx_persistence@heartbeat-close.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2519">i915#2519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-tglb2/igt@gem_ctx_persistence@heartbeat-close.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_ctx_persistence@heartbeat-stop}:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-kbl6/igt@gem_ctx_persistence@heartbeat-stop.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2520">i915#2520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-kbl6/igt@gem_ctx_persistence@heartbeat-stop.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-iclb2/igt@gem_ctx_persistence@heartbeat-stop.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2520">i915#2520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-iclb4/igt@gem_ctx_persistence@heartbeat-stop.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-glk4/igt@gem_exec_reloc@basic-many-active@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-glk1/igt@gem_exec_reloc@basic-many-active@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-glk9/igt@gem_exec_whisper@basic-contexts-priority.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-glk2/igt@gem_exec_whisper@basic-contexts-priority.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-snb1/igt@gem_fenced_exec_thrash@no-spare-fences.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-snb6/igt@gem_fenced_exec_thrash@no-spare-fences.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-kbl1/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/726">i915#726</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-kbl6/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-iclb1/igt@i915_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1899">i915#1899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-iclb4/igt@i915_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@alternate-sync-async-flip}:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-apl4/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-apl6/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-glk2/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-glk8/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-kbl4/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-kbl1/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-y:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-hsw1/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-hsw1/igt@perf_pmu@module-unload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-tglb7/igt@i915_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1899">i915#1899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-tglb8/igt@i915_pm_dc@dc5-psr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9070/shard-kbl1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2292">i915#2292</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/shard-kbl4/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1784">i915#1784</a>)</li>
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
<li>IGT: IGT_5790 -&gt; IGTPW_5019</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9070: 56af0fcd9fad36c90150b0244f61e94adaac3d6a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5019: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5019/index.html<br />
  IGT_5790: 722a3eb9734f04030508d244df9dff55c5ab686c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============2053335461942025420==--

--===============1813870336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1813870336==--
