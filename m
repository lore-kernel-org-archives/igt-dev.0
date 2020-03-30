Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 30 Mar 2020 09:59:10 -0000
Message-ID: <158556235040.13828.754156904054128200@emeril.freedesktop.org>
References: <20200330081707.3084-1-mika.kahola@intel.com>
In-Reply-To: <20200330081707.3084-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fconcurrent=3A_Move_bandwidth_calculation_to_igt=5Ffixture?=
 =?utf-8?q?_=28rev3=29?=
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_concurrent: Move bandwidth calculation to igt_fixture (rev3)
URL   : https://patchwork.freedesktop.org/series/75174/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8212_full -> IGTPW_4370_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4370_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4370_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4370_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_concurrent@pipe-c:
    - shard-apl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-apl2/igt@kms_concurrent@pipe-c.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-apl3/igt@kms_concurrent@pipe-c.html

  
Known issues
------------

  Here are the changes found in IGTPW_4370_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [i915#677]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-iclb7/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276]) +11 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-iclb2/igt@gem_exec_schedule@independent-bsd2.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-iclb5/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-iclb3/igt@gem_exec_schedule@preempt-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-iclb1/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][9] -> [INCOMPLETE][10] ([i915#155])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#716])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-kbl7/igt@gen9_exec_parse@allowed-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-kbl2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_selftest@live@requests:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([i915#1531])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-tglb5/igt@i915_selftest@live@requests.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-tglb3/igt@i915_selftest@live@requests.html
    - shard-iclb:         [PASS][15] -> [INCOMPLETE][16] ([fdo#109644] / [fdo#110464])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-iclb7/igt@i915_selftest@live@requests.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-iclb3/igt@i915_selftest@live@requests.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#1119] / [i915#93] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-kbl1/igt@kms_big_fb@linear-32bpp-rotate-0.html
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#1119] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-apl6/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#54] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-dpms:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-dpms.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#118] / [i915#70] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-glk9/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-glk8/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#93] / [i915#95]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-kbl4/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#52] / [i915#54]) +7 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180] / [i915#93] / [i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#899])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#112080]) +10 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-iclb4/igt@perf_pmu@init-busy-vcs1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-iclb8/igt@perf_pmu@init-busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][43] ([fdo#112080]) -> [PASS][44] +10 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-iclb6/igt@gem_busy@busy-vcs1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-iclb4/igt@gem_busy@busy-vcs1.html

  * igt@gem_exec_schedule@implicit-write-read-bsd1:
    - shard-iclb:         [SKIP][45] ([fdo#109276] / [i915#677]) -> [PASS][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-iclb5/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-iclb4/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_exec_schedule@in-order-bsd2:
    - shard-iclb:         [SKIP][47] ([fdo#109276]) -> [PASS][48] +14 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-iclb8/igt@gem_exec_schedule@in-order-bsd2.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-iclb4/igt@gem_exec_schedule@in-order-bsd2.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][49] ([i915#677]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-iclb4/igt@gem_exec_schedule@pi-userfault-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-iclb6/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][51] ([fdo#112146]) -> [PASS][52] +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-iclb4/igt@gem_exec_schedule@reorder-wide-bsd.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-iclb7/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglb:         [INCOMPLETE][53] ([i915#1390]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-tglb5/igt@i915_module_load@reload-with-fault-injection.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-tglb6/igt@i915_module_load@reload-with-fault-injection.html
    - shard-glk:          [INCOMPLETE][55] ([i915#1390] / [i915#58] / [k.org#198133]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-glk3/igt@i915_module_load@reload-with-fault-injection.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-glk3/igt@i915_module_load@reload-with-fault-injection.html
    - shard-snb:          [INCOMPLETE][57] ([i915#82]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
    - shard-iclb:         [INCOMPLETE][59] ([i915#1390] / [i915#140]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-iclb8/igt@i915_module_load@reload-with-fault-injection.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-iclb4/igt@i915_module_load@reload-with-fault-injection.html
    - shard-hsw:          [INCOMPLETE][61] ([i915#61]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-hsw1/igt@i915_module_load@reload-with-fault-injection.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-hsw8/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][63] ([i915#454]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@live@execlists:
    - shard-apl:          [INCOMPLETE][65] ([i915#656]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-apl8/igt@i915_selftest@live@execlists.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-apl4/igt@i915_selftest@live@execlists.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [INCOMPLETE][67] ([i915#155]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-kbl2/igt@i915_suspend@sysfs-reader.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-kbl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_concurrent@pipe-b:
    - shard-hsw:          [FAIL][69] ([i915#1539]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-hsw1/igt@kms_concurrent@pipe-b.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-hsw4/igt@kms_concurrent@pipe-b.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [FAIL][71] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +5 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-glk:          [FAIL][75] ([i915#52] / [i915#54]) -> [PASS][76] +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [FAIL][77] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [FAIL][79] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_flip@flip-vs-fences:
    - shard-kbl:          [DMESG-WARN][81] ([i915#1297]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-kbl1/igt@kms_flip@flip-vs-fences.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-kbl2/igt@kms_flip@flip-vs-fences.html
    - shard-apl:          [DMESG-WARN][83] ([i915#1297]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-apl3/igt@kms_flip@flip-vs-fences.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-apl3/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-apl:          [FAIL][85] ([i915#95]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [FAIL][87] ([i915#93] / [i915#95]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-kbl3/igt@kms_mmap_write_crc@main.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-kbl7/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][89] ([i915#180]) -> [PASS][90] +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [SKIP][91] ([fdo#109441]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-iclb3/igt@kms_psr@psr2_primary_render.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-iclb2/igt@kms_psr@psr2_primary_render.html

  
#### Warnings ####

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-kbl:          [INCOMPLETE][93] ([i915#1390] / [i915#879]) -> [INCOMPLETE][94] ([i915#1423] / [i915#879])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-kbl2/igt@i915_module_load@reload-with-fault-injection.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-kbl7/igt@i915_module_load@reload-with-fault-injection.html
    - shard-apl:          [INCOMPLETE][95] ([i915#1390]) -> [INCOMPLETE][96] ([i915#1423])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-apl1/igt@i915_module_load@reload-with-fault-injection.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-apl6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][97] ([i915#454]) -> [SKIP][98] ([i915#468]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-tglb3/igt@i915_pm_dc@dc6-psr.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][99] ([i915#357]) -> [FAIL][100] ([i915#357] / [i915#93] / [i915#95])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-kbl4/igt@kms_content_protection@uevent.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-kbl3/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][101] ([i915#357]) -> [FAIL][102] ([i915#357] / [i915#95])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-apl6/igt@kms_content_protection@uevent.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-apl6/igt@kms_content_protection@uevent.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-apl:          [FAIL][103] ([fdo#108145] / [i915#95]) -> [FAIL][104] ([fdo#108145])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][105] ([fdo#108145] / [i915#93] / [i915#95]) -> [FAIL][106] ([fdo#108145])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][107] ([fdo#109642] / [fdo#111068]) -> [FAIL][108] ([i915#608])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-iclb7/igt@kms_psr2_su@page_flip.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][109] ([i915#31]) -> [FAIL][110] ([i915#31] / [i915#93] / [i915#95])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-kbl6/igt@kms_setmode@basic.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-kbl7/igt@kms_setmode@basic.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][111] ([i915#1423] / [i915#1485] / [i915#92]) -> ([FAIL][112], [FAIL][113]) ([i915#1423] / [i915#716] / [i915#92])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-kbl2/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-kbl7/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-kbl2/igt@runner@aborted.html
    - shard-apl:          ([FAIL][114], [FAIL][115]) ([i915#1423] / [i915#1485] / [i915#529]) -> [FAIL][116] ([i915#1423])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-apl8/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8212/shard-apl1/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/shard-apl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#109644]: https://bugs.freedesktop.org/show_bug.cgi?id=109644
  [fdo#110464]: https://bugs.freedesktop.org/show_bug.cgi?id=110464
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1390]: https://gitlab.freedesktop.org/drm/intel/issues/1390
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1485]: https://gitlab.freedesktop.org/drm/intel/issues/1485
  [i915#1531]: https://gitlab.freedesktop.org/drm/intel/issues/1531
  [i915#1539]: https://gitlab.freedesktop.org/drm/intel/issues/1539
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#879]: https://gitlab.freedesktop.org/drm/intel/issues/879
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5544 -> IGTPW_4370
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8212: 68b152390f915c189e2dd0b29eec557d5d8be9a8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4370: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/index.html
  IGT_5544: 477c562fc9932939083d732b77dd7b083c6bc0a1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4370/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
