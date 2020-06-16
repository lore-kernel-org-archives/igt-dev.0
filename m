Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 16 Jun 2020 17:44:22 -0000
Message-ID: <159232946277.4596.241608677004507403@emeril.freedesktop.org>
References: <20200616105812.21558-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20200616105812.21558-1-ankit.k.nautiyal@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkIHN1?=
 =?utf-8?q?pport_to_detect_HDCP_events?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add support to detect HDCP events
URL   : https://patchwork.freedesktop.org/series/78413/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8634_full -> IGTPW_4676_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4676_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4676_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4676_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][1] ([i915#357]) -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl4/igt@kms_content_protection@uevent.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-kbl7/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][3] ([i915#357]) -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl6/igt@kms_content_protection@uevent.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-apl1/igt@kms_content_protection@uevent.html

  
Known issues
------------

  Here are the changes found in IGTPW_4676_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#1930])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-glk9/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#118] / [i915#95]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-glk8/igt@gem_exec_whisper@basic-fds-priority.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-glk5/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#95]) +26 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl1/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-apl8/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-glk:          [PASS][13] -> [DMESG-FAIL][14] ([i915#118] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-glk1/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][15] -> [DMESG-FAIL][16] ([i915#54] / [i915#95]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#72])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][19] -> [DMESG-FAIL][20] ([i915#54] / [i915#95]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-tglb:         [PASS][23] -> [DMESG-WARN][24] ([i915#1982]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-tglb:         [PASS][25] -> [DMESG-WARN][26] ([i915#402]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][27] -> [SKIP][28] ([i915#433])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [PASS][29] -> [DMESG-FAIL][30] ([i915#95]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl7/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
    - shard-kbl:          [PASS][31] -> [DMESG-FAIL][32] ([i915#95]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl2/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-kbl1/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_plane_multiple@atomic-pipe-a-tiling-none:
    - shard-hsw:          [PASS][33] -> [TIMEOUT][34] ([i915#1958]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-hsw1/igt@kms_plane_multiple@atomic-pipe-a-tiling-none.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-hsw8/igt@kms_plane_multiple@atomic-pipe-a-tiling-none.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([i915#31])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl3/igt@kms_setmode@basic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-kbl4/igt@kms_setmode@basic.html

  * igt@perf@rc6-disable:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([i915#405])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-iclb2/igt@perf@rc6-disable.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-iclb6/igt@perf@rc6-disable.html
    - shard-hsw:          [PASS][41] -> [SKIP][42] ([fdo#109271])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-hsw6/igt@perf@rc6-disable.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-hsw6/igt@perf@rc6-disable.html
    - shard-kbl:          [PASS][43] -> [SKIP][44] ([fdo#109271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl3/igt@perf@rc6-disable.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-kbl2/igt@perf@rc6-disable.html
    - shard-apl:          [PASS][45] -> [SKIP][46] ([fdo#109271])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl8/igt@perf@rc6-disable.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-apl3/igt@perf@rc6-disable.html
    - shard-tglb:         [PASS][47] -> [SKIP][48] ([fdo#111719] / [i915#405])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-tglb2/igt@perf@rc6-disable.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-tglb1/igt@perf@rc6-disable.html
    - shard-glk:          [PASS][49] -> [SKIP][50] ([fdo#109271])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-glk7/igt@perf@rc6-disable.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-glk8/igt@perf@rc6-disable.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [PASS][51] -> [FAIL][52] ([i915#1820])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl7/igt@perf_pmu@semaphore-busy@rcs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-kbl1/igt@perf_pmu@semaphore-busy@rcs0.html

  * igt@syncobj_wait@invalid-wait-zero-handles:
    - shard-kbl:          [PASS][53] -> [DMESG-WARN][54] ([i915#93] / [i915#95]) +35 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl7/igt@syncobj_wait@invalid-wait-zero-handles.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-kbl2/igt@syncobj_wait@invalid-wait-zero-handles.html

  
#### Possible fixes ####

  * igt@gem_exec_schedule@implicit-write-read@rcs0:
    - shard-snb:          [INCOMPLETE][55] ([i915#82]) -> [PASS][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-snb1/igt@gem_exec_schedule@implicit-write-read@rcs0.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-snb6/igt@gem_exec_schedule@implicit-write-read@rcs0.html

  * igt@gem_tiled_blits@basic:
    - shard-snb:          [TIMEOUT][57] ([i915#1958]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-snb4/igt@gem_tiled_blits@basic.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-snb5/igt@gem_tiled_blits@basic.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-hsw:          [TIMEOUT][59] ([i915#1958]) -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-hsw7/igt@gen7_exec_parse@chained-batch.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-hsw7/igt@gen7_exec_parse@chained-batch.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-hsw:          [SKIP][61] ([fdo#109271]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-hsw7/igt@i915_pm_rpm@system-suspend-modeset.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-hsw6/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_query@query-topology-kernel-writes:
    - shard-iclb:         [DMESG-WARN][63] ([i915#1982]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-iclb7/igt@i915_query@query-topology-kernel-writes.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-iclb5/igt@i915_query@query-topology-kernel-writes.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [INCOMPLETE][65] ([i915#155]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl1/igt@i915_suspend@fence-restore-untiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-kbl6/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-glk:          [DMESG-FAIL][67] ([i915#118] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-glk4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-apl:          [DMESG-WARN][69] ([i915#95]) -> [PASS][70] +45 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [DMESG-FAIL][71] ([i915#54] / [i915#95]) -> [PASS][72] +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding:
    - shard-apl:          [FAIL][73] ([i915#54]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
    - shard-kbl:          [FAIL][75] ([i915#54]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
    - shard-glk:          [FAIL][77] ([i915#54]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-glk7/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled:
    - shard-kbl:          [DMESG-WARN][79] ([i915#93] / [i915#95]) -> [PASS][80] +55 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [DMESG-FAIL][81] ([i915#95]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl1/igt@kms_draw_crc@fill-fb.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-apl2/igt@kms_draw_crc@fill-fb.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][83] ([i915#1525]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-tglb:         [DMESG-WARN][85] ([i915#1982]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-tglb:         [DMESG-WARN][87] ([i915#1982] / [i915#402]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-FAIL][89] ([i915#95]) -> [PASS][90] +3 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [DMESG-WARN][91] ([i915#180]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][93] ([fdo#109441]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-iclb5/igt@kms_psr@psr2_dpms.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-iclb2/igt@kms_psr@psr2_dpms.html

  * igt@kms_vblank@pipe-b-wait-busy-hang:
    - shard-apl:          [DMESG-WARN][95] ([i915#1982]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl3/igt@kms_vblank@pipe-b-wait-busy-hang.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-apl7/igt@kms_vblank@pipe-b-wait-busy-hang.html

  * igt@perf@invalid-open-flags:
    - shard-tglb:         [SKIP][97] ([i915#405]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-tglb6/igt@perf@invalid-open-flags.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-tglb2/igt@perf@invalid-open-flags.html
    - shard-apl:          [SKIP][99] ([fdo#109271]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl4/igt@perf@invalid-open-flags.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-apl4/igt@perf@invalid-open-flags.html
    - shard-iclb:         [SKIP][101] ([i915#405]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-iclb7/igt@perf@invalid-open-flags.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-iclb6/igt@perf@invalid-open-flags.html
    - shard-glk:          [SKIP][103] ([fdo#109271]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-glk8/igt@perf@invalid-open-flags.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-glk9/igt@perf@invalid-open-flags.html
    - shard-kbl:          [SKIP][105] ([fdo#109271]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl2/igt@perf@invalid-open-flags.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-kbl2/igt@perf@invalid-open-flags.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [TIMEOUT][107] ([i915#1958]) -> [FAIL][108] ([i915#1930])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-snb4/igt@gem_exec_reloc@basic-concurrent16.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-snb:          [TIMEOUT][109] ([i915#1958]) -> [SKIP][110] ([fdo#109271]) +2 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-snb4/igt@gen7_exec_parse@chained-batch.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-snb2/igt@gen7_exec_parse@chained-batch.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-hsw:          [TIMEOUT][111] ([i915#1958]) -> [SKIP][112] ([fdo#109271])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-hsw7/igt@i915_pm_dc@dc6-psr.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-hsw4/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_color_chamelium@pipe-b-ctm-max:
    - shard-snb:          [TIMEOUT][113] ([i915#1958]) -> [SKIP][114] ([fdo#109271] / [fdo#111827])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-snb4/igt@kms_color_chamelium@pipe-b-ctm-max.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-snb2/igt@kms_color_chamelium@pipe-b-ctm-max.html
    - shard-hsw:          [TIMEOUT][115] ([i915#1958]) -> [SKIP][116] ([fdo#109271] / [fdo#111827])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-hsw7/igt@kms_color_chamelium@pipe-b-ctm-max.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-hsw1/igt@kms_color_chamelium@pipe-b-ctm-max.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [TIMEOUT][117] ([i915#1319]) -> [TIMEOUT][118] ([i915#1319] / [i915#1958])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl1/igt@kms_content_protection@lic.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-kbl2/igt@kms_content_protection@lic.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][119] ([i915#93] / [i915#95]) -> [INCOMPLETE][120] ([i915#155])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-apl:          [FAIL][121] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][122] ([fdo#108145] / [i915#95])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-kbl:          [FAIL][123] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][124] ([fdo#108145] / [i915#95]) +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-apl:          [DMESG-FAIL][125] ([i915#95]) -> [FAIL][126] ([i915#265])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_scaling@pipe-c-scaler-with-pixel-format:
    - shard-hsw:          [SKIP][127] ([fdo#109271]) -> [TIMEOUT][128] ([i915#1958]) +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-hsw6/igt@kms_plane_scaling@pipe-c-scaler-with-pixel-format.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/shard-hsw8/igt@kms_plane_scaling@pipe-c-scaler-with-pixel-format.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2036]: https://gitlab.freedesktop.org/drm/intel/issues/2036
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5711 -> IGTPW_4676
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8634: 72c556b3627adef8cef3b7a47c32987b96e7f1c2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4676: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/index.html
  IGT_5711: 90611a0c90afa4a46496c78a4faf9638a1538ac3 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4676/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
