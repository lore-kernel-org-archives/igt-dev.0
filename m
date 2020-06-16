Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 16 Jun 2020 18:25:44 -0000
Message-ID: <159233194445.4598.9246744281768038907@emeril.freedesktop.org>
References: <20200616141450.1181127-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200616141450.1181127-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D_lib/core=3A_Print_thred=3Atid_?=
 =?utf-8?q?with_igt=5Flog_for_non-main_threads?=
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/3] lib/core: Print thred:tid with igt_log for non-main threads
URL   : https://patchwork.freedesktop.org/series/78422/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8634_full -> IGTPW_4677_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4677_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4677_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4677_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@kms:
    - shard-hsw:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-hsw2/igt@gem_eio@kms.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-hsw6/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@bonded-early:
    - shard-tglb:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-tglb7/igt@gem_exec_balancer@bonded-early.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-tglb1/igt@gem_exec_balancer@bonded-early.html

  * igt@gem_mmap_offset@clear:
    - shard-iclb:         [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-iclb6/igt@gem_mmap_offset@clear.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-iclb1/igt@gem_mmap_offset@clear.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-iclb:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-iclb3/igt@i915_pm_rpm@system-suspend-devices.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-iclb6/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@perf@i915-ref-count:
    - shard-hsw:          [PASS][9] -> [INCOMPLETE][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-hsw5/igt@perf@i915-ref-count.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-hsw1/igt@perf@i915-ref-count.html

  
Known issues
------------

  Here are the changes found in IGTPW_4677_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-kbl:          [PASS][11] -> [INCOMPLETE][12] ([i915#794])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@rcs0.html
    - shard-iclb:         [PASS][13] -> [FAIL][14] ([fdo#103375]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-iclb5/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-iclb6/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#1930])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-glk5/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [PASS][17] -> [DMESG-WARN][18] ([i915#402]) +6 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-tglb6/igt@i915_module_load@reload.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-tglb2/igt@i915_module_load@reload.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [PASS][19] -> [SKIP][20] ([i915#1904])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [PASS][21] -> [FAIL][22] ([i915#1899])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-iclb6/igt@i915_pm_dc@dc5-psr.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-iclb7/igt@i915_pm_dc@dc5-psr.html
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([i915#1899])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-tglb3/igt@i915_pm_dc@dc5-psr.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-tglb6/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglb:         [PASS][25] -> [FAIL][26] ([i915#1568])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-tglb3/igt@i915_pm_rc6_residency@rc6-idle.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-tglb5/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-glk:          [PASS][27] -> [DMESG-FAIL][28] ([i915#118] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-glk9/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#1982])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl6/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-apl4/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_color@pipe-b-ctm-max:
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#95]) +42 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl4/igt@kms_color@pipe-b-ctm-max.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-apl1/igt@kms_color@pipe-b-ctm-max.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-tglb:         [PASS][33] -> [INCOMPLETE][34] ([i915#1602])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +5 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - shard-iclb:         [PASS][37] -> [DMESG-WARN][38] ([i915#1982])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [PASS][39] -> [DMESG-FAIL][40] ([i915#95]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [PASS][41] -> [DMESG-FAIL][42] ([i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl3/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109642] / [fdo#111068]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-iclb6/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][45] -> [FAIL][46] ([i915#31])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl3/igt@kms_setmode@basic.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-kbl1/igt@kms_setmode@basic.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][47] -> [FAIL][48] ([i915#1542])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-iclb2/igt@perf@blocking-parameterized.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-iclb1/igt@perf@blocking-parameterized.html

  * igt@syncobj_basic@bad-flags-fd-to-handle:
    - shard-kbl:          [PASS][49] -> [DMESG-WARN][50] ([i915#93] / [i915#95]) +50 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl2/igt@syncobj_basic@bad-flags-fd-to-handle.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-kbl7/igt@syncobj_basic@bad-flags-fd-to-handle.html

  
#### Possible fixes ####

  * igt@gem_exec_schedule@implicit-write-read@rcs0:
    - shard-snb:          [INCOMPLETE][51] ([i915#82]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-snb1/igt@gem_exec_schedule@implicit-write-read@rcs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-snb1/igt@gem_exec_schedule@implicit-write-read@rcs0.html

  * igt@gem_tiled_blits@basic:
    - shard-snb:          [TIMEOUT][53] ([i915#1958]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-snb4/igt@gem_tiled_blits@basic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-snb1/igt@gem_tiled_blits@basic.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-hsw:          [SKIP][55] ([fdo#109271]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-hsw7/igt@i915_pm_rpm@system-suspend-modeset.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-hsw6/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_query@query-topology-kernel-writes:
    - shard-iclb:         [DMESG-WARN][57] ([i915#1982]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-iclb7/igt@i915_query@query-topology-kernel-writes.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-iclb3/igt@i915_query@query-topology-kernel-writes.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [INCOMPLETE][59] ([i915#155]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl1/igt@i915_suspend@fence-restore-untiled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-kbl3/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [DMESG-FAIL][61] ([i915#95]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-glk:          [DMESG-FAIL][63] ([i915#118] / [i915#95]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-glk7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-apl:          [DMESG-WARN][65] ([i915#95]) -> [PASS][66] +45 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [DMESG-FAIL][67] ([i915#54] / [i915#95]) -> [PASS][68] +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding:
    - shard-apl:          [FAIL][69] ([i915#54]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
    - shard-kbl:          [FAIL][71] ([i915#54]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
    - shard-glk:          [FAIL][73] ([i915#54]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-glk7/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-glk5/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled:
    - shard-kbl:          [DMESG-WARN][75] ([i915#93] / [i915#95]) -> [PASS][76] +55 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [DMESG-FAIL][77] ([i915#95]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl7/igt@kms_fbcon_fbt@fbc.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-kbl4/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][79] ([i915#1525]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl3/igt@kms_fbcon_fbt@fbc.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-apl7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-tglb:         [DMESG-WARN][81] ([i915#1982]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-tglb:         [DMESG-WARN][83] ([i915#1982] / [i915#402]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [DMESG-WARN][85] ([i915#180]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [SKIP][87] ([fdo#109441]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-iclb8/igt@kms_psr@psr2_sprite_render.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-iclb2/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_vblank@pipe-b-wait-busy-hang:
    - shard-apl:          [DMESG-WARN][89] ([i915#1982]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl3/igt@kms_vblank@pipe-b-wait-busy-hang.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-apl2/igt@kms_vblank@pipe-b-wait-busy-hang.html

  * igt@kms_vblank@pipe-c-query-forked-busy:
    - shard-hsw:          [TIMEOUT][91] ([i915#1958]) -> [PASS][92] +3 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-hsw7/igt@kms_vblank@pipe-c-query-forked-busy.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-hsw6/igt@kms_vblank@pipe-c-query-forked-busy.html

  * igt@perf@invalid-open-flags:
    - shard-tglb:         [SKIP][93] ([i915#405]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-tglb6/igt@perf@invalid-open-flags.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-tglb7/igt@perf@invalid-open-flags.html
    - shard-apl:          [SKIP][95] ([fdo#109271]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl4/igt@perf@invalid-open-flags.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-apl4/igt@perf@invalid-open-flags.html
    - shard-iclb:         [SKIP][97] ([i915#405]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-iclb7/igt@perf@invalid-open-flags.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-iclb7/igt@perf@invalid-open-flags.html
    - shard-glk:          [SKIP][99] ([fdo#109271]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-glk8/igt@perf@invalid-open-flags.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-glk1/igt@perf@invalid-open-flags.html
    - shard-kbl:          [SKIP][101] ([fdo#109271]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl2/igt@perf@invalid-open-flags.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-kbl7/igt@perf@invalid-open-flags.html

  
#### Warnings ####

  * igt@gen7_exec_parse@chained-batch:
    - shard-snb:          [TIMEOUT][103] ([i915#1958]) -> [SKIP][104] ([fdo#109271]) +2 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-snb4/igt@gen7_exec_parse@chained-batch.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-snb5/igt@gen7_exec_parse@chained-batch.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][105] ([i915#454]) -> [SKIP][106] ([i915#468])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-hsw:          [TIMEOUT][107] ([i915#1958]) -> [SKIP][108] ([fdo#109271])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-hsw7/igt@i915_pm_dc@dc6-psr.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-hsw1/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_color_chamelium@pipe-b-ctm-max:
    - shard-snb:          [TIMEOUT][109] ([i915#1958]) -> [SKIP][110] ([fdo#109271] / [fdo#111827])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-snb4/igt@kms_color_chamelium@pipe-b-ctm-max.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-snb1/igt@kms_color_chamelium@pipe-b-ctm-max.html
    - shard-hsw:          [TIMEOUT][111] ([i915#1958]) -> [SKIP][112] ([fdo#109271] / [fdo#111827])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-hsw7/igt@kms_color_chamelium@pipe-b-ctm-max.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-hsw6/igt@kms_color_chamelium@pipe-b-ctm-max.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [TIMEOUT][113] ([i915#1319]) -> [TIMEOUT][114] ([i915#1319] / [i915#1958])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl1/igt@kms_content_protection@lic.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-kbl3/igt@kms_content_protection@lic.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-FAIL][115] ([i915#95]) -> [FAIL][116] ([i915#64])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-FAIL][117] ([i915#95]) -> [DMESG-WARN][118] ([i915#180])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-apl:          [FAIL][119] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][120] ([fdo#108145] / [i915#95]) +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-kbl:          [FAIL][121] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][122] ([fdo#108145] / [i915#95]) +1 similar issue
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-apl:          [DMESG-FAIL][123] ([i915#95]) -> [FAIL][124] ([i915#265])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1568]: https://gitlab.freedesktop.org/drm/intel/issues/1568
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2036]: https://gitlab.freedesktop.org/drm/intel/issues/2036
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5711 -> IGTPW_4677
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8634: 72c556b3627adef8cef3b7a47c32987b96e7f1c2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4677: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/index.html
  IGT_5711: 90611a0c90afa4a46496c78a4faf9638a1538ac3 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
