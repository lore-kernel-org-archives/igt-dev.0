Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 12 Nov 2020 08:13:25 -0000
Message-ID: <160516880579.29795.11828051171134858055@emeril.freedesktop.org>
References: <20201112050044.28416-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20201112050044.28416-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Ftiled=5Fpread=5Fbasic=3A_Add_test_description?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0164478939=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0164478939==
Content-Type: multipart/alternative;
 boundary="===============5946828177656602970=="

--===============5946828177656602970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_tiled_pread_basic: Add test description
URL   : https://patchwork.freedesktop.org/series/83749/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9312_full -> IGTPW_5157_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/index.html

New tests
---------

  New tests have been introduced between CI_DRM_9312_full and IGTPW_5157_full:

### New IGT tests (1) ###

  * igt@sysfs_defaults@readonly:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_5157_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-hsw:          [PASS][1] -> [FAIL][2] ([i915#2389])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw1/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-hsw8/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl1/igt@gem_exec_suspend@basic-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-kbl6/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_partial_pwrite_pread@reads-display:
    - shard-snb:          [PASS][5] -> [INCOMPLETE][6] ([i915#1037])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-snb5/igt@gem_partial_pwrite_pread@reads-display.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-snb6/igt@gem_partial_pwrite_pread@reads-display.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-iclb:         [PASS][7] -> [DMESG-WARN][8] ([i915#1982])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb6/igt@i915_module_load@reload-with-fault-injection.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-iclb2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-hsw:          [PASS][9] -> [SKIP][10] ([fdo#109271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-hsw8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-kbl:          [PASS][11] -> [SKIP][12] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-kbl2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-apl:          [PASS][13] -> [SKIP][14] ([fdo#109271] / [i915#1635])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-apl7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-glk:          [PASS][15] -> [SKIP][16] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-glk9/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-iclb:         [PASS][17] -> [INCOMPLETE][18] ([i915#1185])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb6/igt@i915_suspend@fence-restore-untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-iclb3/igt@i915_suspend@fence-restore-untiled.html
    - shard-glk:          [PASS][19] -> [INCOMPLETE][20] ([i915#2635])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk6/igt@i915_suspend@fence-restore-untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-glk9/igt@i915_suspend@fence-restore-untiled.html
    - shard-apl:          [PASS][21] -> [INCOMPLETE][22] ([i915#1635] / [i915#2635])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl7/igt@i915_suspend@fence-restore-untiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-apl7/igt@i915_suspend@fence-restore-untiled.html
    - shard-kbl:          [PASS][23] -> [INCOMPLETE][24] ([i915#155])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl1/igt@i915_suspend@fence-restore-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-kbl2/igt@i915_suspend@fence-restore-untiled.html
    - shard-hsw:          [PASS][25] -> [INCOMPLETE][26] ([i915#2637])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw4/igt@i915_suspend@fence-restore-untiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-hsw8/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][27] -> [FAIL][28] ([i915#96])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][29] -> [FAIL][30] ([i915#2370])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_draw_crc@draw-method-rgb565-render-xtiled:
    - shard-snb:          [PASS][31] -> [FAIL][32] ([i915#54]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-snb5/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [PASS][33] -> [FAIL][34] ([i915#2598])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@plain-flip-ts-check@a-dp1:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#1982]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl3/igt@kms_flip@plain-flip-ts-check@a-dp1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-kbl1/igt@kms_flip@plain-flip-ts-check@a-dp1.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-tglb:         [PASS][37] -> [DMESG-WARN][38] ([i915#1982]) +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb8/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-tglb5/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_flip@plain-flip-ts-check@a-hdmi-a1:
    - shard-glk:          [PASS][39] -> [DMESG-WARN][40] ([i915#1982]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk6/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-glk4/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-snb:          [PASS][41] -> [FAIL][42] ([i915#2546])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-iclb5/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-a:
    - shard-apl:          [PASS][45] -> [DMESG-WARN][46] ([i915#1635] / [i915#1982]) +4 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl7/igt@kms_universal_plane@disable-primary-vs-flip-pipe-a.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-apl1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-a.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][47] ([i915#658]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb3/igt@feature_discovery@psr2.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          [DMESG-WARN][49] ([i915#2635]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk4/igt@gem_eio@in-flight-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-glk7/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_create@basic:
    - shard-snb:          [FAIL][51] ([i915#1037]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-snb7/igt@gem_exec_create@basic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-snb7/igt@gem_exec_create@basic.html

  * igt@gem_exec_create@forked:
    - shard-glk:          [FAIL][53] -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk8/igt@gem_exec_create@forked.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-glk6/igt@gem_exec_create@forked.html
    - shard-hsw:          [FAIL][55] -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw8/igt@gem_exec_create@forked.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-hsw4/igt@gem_exec_create@forked.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-hsw:          [FAIL][57] ([i915#1888]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw8/igt@gem_userptr_blits@unsync-unmap-cycles.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-hsw4/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge:
    - shard-glk:          [DMESG-WARN][59] ([i915#1982]) -> [PASS][60] +7 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-glk9/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-toggle:
    - shard-apl:          [DMESG-WARN][61] ([i915#1635] / [i915#1982]) -> [PASS][62] +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl7/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-apl2/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][63] ([i915#1982]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl4/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-kbl2/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-snb:          [FAIL][65] ([i915#2546]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-snb7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-snb6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [DMESG-WARN][67] ([i915#1982]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_plane@plane-position-hole-pipe-a-planes:
    - shard-apl:          [FAIL][69] ([i915#1635] / [i915#2472]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl6/igt@kms_plane@plane-position-hole-pipe-a-planes.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-apl1/igt@kms_plane@plane-position-hole-pipe-a-planes.html
    - shard-kbl:          [FAIL][71] ([i915#2472]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl7/igt@kms_plane@plane-position-hole-pipe-a-planes.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-kbl3/igt@kms_plane@plane-position-hole-pipe-a-planes.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74] +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-c-query-forked-busy:
    - shard-hsw:          [DMESG-WARN][75] ([i915#1982]) -> [PASS][76] +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw6/igt@kms_vblank@pipe-c-query-forked-busy.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-hsw8/igt@kms_vblank@pipe-c-query-forked-busy.html
    - shard-iclb:         [DMESG-WARN][77] ([i915#1982]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb7/igt@kms_vblank@pipe-c-query-forked-busy.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-iclb2/igt@kms_vblank@pipe-c-query-forked-busy.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-iclb:         [INCOMPLETE][79] ([i915#1185]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-iclb2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-kbl:          [INCOMPLETE][81] ([i915#155]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-hsw:          [INCOMPLETE][83] ([i915#2637]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-hsw6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-glk:          [INCOMPLETE][85] ([i915#2635]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-glk5/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-apl:          [INCOMPLETE][87] ([i915#1635] / [i915#2635]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-apl7/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-tglb:         [SKIP][89] ([i915#1354]) -> [PASS][90] +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb7/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-tglb1/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@perf@invalid-oa-exponent:
    - shard-hsw:          [SKIP][91] ([fdo#109271]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw8/igt@perf@invalid-oa-exponent.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-hsw1/igt@perf@invalid-oa-exponent.html
    - shard-iclb:         [SKIP][93] ([i915#1354]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb8/igt@perf@invalid-oa-exponent.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-iclb5/igt@perf@invalid-oa-exponent.html

  * igt@perf@non-system-wide-paranoid:
    - shard-apl:          [SKIP][95] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl8/igt@perf@non-system-wide-paranoid.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-apl4/igt@perf@non-system-wide-paranoid.html
    - shard-glk:          [SKIP][97] ([fdo#109271] / [i915#1354]) -> [PASS][98] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk8/igt@perf@non-system-wide-paranoid.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-glk6/igt@perf@non-system-wide-paranoid.html
    - shard-kbl:          [SKIP][99] ([fdo#109271] / [i915#1354]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl6/igt@perf@non-system-wide-paranoid.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-kbl3/igt@perf@non-system-wide-paranoid.html

  
#### Warnings ####

  * igt@gem_eio@in-flight-suspend:
    - shard-tglb:         [INCOMPLETE][101] ([i915#1436] / [i915#456]) -> [DMESG-WARN][102] ([i915#2411]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb7/igt@gem_eio@in-flight-suspend.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-tglb5/igt@gem_eio@in-flight-suspend.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         [SKIP][103] ([fdo#111644] / [i915#1397] / [i915#2411]) -> [SKIP][104] ([i915#579])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-tglb3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-iclb:         [SKIP][105] ([fdo#110892]) -> [SKIP][106] ([i915#579])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-iclb3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-tglb:         [DMESG-WARN][107] ([i915#2411]) -> [INCOMPLETE][108] ([i915#1436] / [i915#456])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb2/igt@i915_suspend@fence-restore-untiled.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-tglb3/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][109] ([i915#1319] / [i915#1635]) -> [FAIL][110] ([fdo#110321] / [i915#1635])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl8/igt@kms_content_protection@lic.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-apl3/igt@kms_content_protection@lic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-glk:          [FAIL][111] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][112] ([fdo#108145] / [i915#1982])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk7/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-glk4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-apl:          [FAIL][113] ([fdo#108145] / [i915#1635] / [i915#265]) -> [DMESG-FAIL][114] ([fdo#108145] / [i915#1635] / [i915#1982])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-apl:          [SKIP][115] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [SKIP][116] ([fdo#109271] / [i915#1635])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl8/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-apl1/igt@perf@gen12-unprivileged-single-ctx-counters.html
    - shard-glk:          [SKIP][117] ([fdo#109271] / [i915#1354]) -> [SKIP][118] ([fdo#109271])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk8/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-glk8/igt@perf@gen12-unprivileged-single-ctx-counters.html
    - shard-iclb:         [SKIP][119] ([i915#1354]) -> [SKIP][120] ([fdo#109289])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb8/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-iclb4/igt@perf@gen12-unprivileged-single-ctx-counters.html
    - shard-kbl:          [SKIP][121] ([fdo#109271] / [i915#1354]) -> [SKIP][122] ([fdo#109271])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl6/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-kbl4/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][123], [FAIL][124]) ([i915#1436] / [i915#2439] / [i915#483]) -> [FAIL][125] ([i915#2439])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw6/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw1/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-hsw8/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][126], [FAIL][127]) ([i915#1436] / [i915#1611] / [i915#1814] / [i915#2439] / [i915#483]) -> [FAIL][128] ([i915#1611] / [i915#2439])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl1/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl3/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-kbl7/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][129], [FAIL][130], [FAIL][131]) ([i915#1814] / [i915#2439] / [i915#483]) -> ([FAIL][132], [FAIL][133]) ([i915#2439])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb6/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb3/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb2/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-iclb3/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-iclb4/igt@runner@aborted.html
    - shard-apl:          ([FAIL][134], [FAIL][135], [FAIL][136]) ([i915#1610] / [i915#1611] / [i915#1635] / [i915#1814] / [i915#2439]) -> ([FAIL][137], [FAIL][138]) ([i915#1611] / [i915#1635] / [i915#2439])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl8/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl3/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl2/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-apl7/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-apl8/igt@runner@aborted.html
    - shard-glk:          ([FAIL][139], [FAIL][140], [FAIL][141]) ([i915#1611] / [i915#1814] / [i915#2439] / [k.org#202321]) -> ([FAIL][142], [FAIL][143]) ([i915#1611] / [i915#2439] / [k.org#202321])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk4/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk2/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk6/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-glk9/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-glk6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [i915#1037]: https://gitlab.freedesktop.org/drm/intel/issues/1037
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2370]: https://gitlab.freedesktop.org/drm/intel/issues/2370
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#2472]: https://gitlab.freedesktop.org/drm/intel/issues/2472
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5847 -> IGTPW_5157
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9312: 88b74d59a27aa168f7cd2dec199c33ee71fe8bb0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5157: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/index.html
  IGT_5847: 8cffaebec5228a5042cc6928ac582a0589e2de3e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/index.html

--===============5946828177656602970==
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
<tr><td><b>Series:</b></td><td>i915/gem_tiled_pread_basic: Add test descrip=
tion</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/83749/">https://patchwork.freedesktop.org/series/83749/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5157/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5157/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9312_full -&gt; IGTPW_5157_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/index.=
html</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9312_full and IGTPW_5157_f=
ull:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@sysfs_defaults@readonly:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5157_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-hsw1/igt@gem_exec_reloc@basic-many-active@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/=
shard-hsw8/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-kbl1/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-kbl6/i=
gt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-display:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-snb5/igt@gem_partial_pwrite_pread@reads-display.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157=
/shard-snb6/igt@gem_partial_pwrite_pread@reads-display.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1037">i915#103=
7</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-iclb6/igt@i915_module_load@reload-with-fault-injection.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5157/shard-iclb2/igt@i915_module_load@reload-with-fault-injection.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-hsw8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/sh=
ard-hsw8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)<=
/p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-kbl3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/sh=
ard-kbl2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)<=
/p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-apl3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/sh=
ard-apl7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635=
</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-glk6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/sh=
ard-glk9/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)<=
/p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-iclb6/igt@i915_suspend@fence-restore-untiled.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/sha=
rd-iclb3/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>)<=
/p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-glk6/igt@i915_suspend@fence-restore-untiled.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shar=
d-glk9/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-apl7/igt@i915_suspend@fence-restore-untiled.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shar=
d-apl7/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</=
a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-kbl1/igt@i915_suspend@fence-restore-untiled.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shar=
d-kbl2/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-hsw4/igt@i915_suspend@fence-restore-untiled.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shar=
d-hsw8/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5157/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/96=
">i915#96</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_515=
7/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2370">i915#2370</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-xtiled:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-snb5/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5157/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i9=
15#54</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
a-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5157/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2598">i915#2598</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-kbl3/igt@kms_flip@plain-flip-ts-check@a-dp1.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/sha=
rd-kbl1/igt@kms_flip@plain-flip-ts-check@a-dp1.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +=
3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-tglb8/igt@kms_flip@plain-flip-ts-check@a-edp1.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/s=
hard-tglb5/igt@kms_flip@plain-flip-ts-check@a-edp1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a=
>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-glk6/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157=
/shard-glk4/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#198=
2</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-in=
dfb-draw-pwrite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5157/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-pri=
mscrn-cur-indfb-draw-pwrite.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-=
iclb5/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar =
issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-a:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-apl7/igt@kms_universal_plane@disable-primary-vs-flip-pip=
e-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5157/shard-apl1/igt@kms_universal_plane@disable-primary-vs-flip-pip=
e-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-iclb3/igt@feature_discovery@psr2.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-iclb=
2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-glk4/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/=
shard-glk7/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@basic:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-snb7/igt@gem_exec_create@basic.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1037">i915#1037</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-sn=
b7/igt@gem_exec_create@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@forked:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-glk8/igt@gem_exec_create@forked.html">FAIL</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-glk6/igt@g=
em_exec_create@forked.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-hsw8/igt@gem_exec_create@forked.html">FAIL</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-hsw4/igt@g=
em_exec_create@forked.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-hsw8/igt@gem_userptr_blits@unsync-unmap-cycles.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i91=
5#1888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5157/shard-hsw4/igt@gem_userptr_blits@unsync-unmap-cycles.html">PASS</a> +=
1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5157/shard-glk9/igt@kms_cursor_edge_walk@pipe-b-64x64-right-e=
dge.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-toggle:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-apl7/igt@kms_cursor_legacy@short-flip-before-cursor-togg=
le.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5157/shard-apl2/igt@kms_cursor_legacy@short-flip-b=
efore-cursor-toggle.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-kbl4/igt@kms_flip@blocking-absolute-wf_vblank-interrupti=
ble@a-dp1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5157/shard-kbl2/igt@kms_flip@blocking-absolute-wf=
_vblank-interruptible@a-dp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-snb7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-c=
pu.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2546">i915#2546</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5157/shard-snb6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-m=
map-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-stridechange.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5157/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-stridechange.=
html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-pipe-a-planes:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-apl6/igt@kms_plane@plane-position-hole-pipe-a-planes.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635=
">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2472">i915#2472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5157/shard-apl1/igt@kms_plane@plane-position-hole-pipe-a-planes=
.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-kbl7/igt@kms_plane@plane-position-hole-pipe-a-planes.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2472=
">i915#2472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5157/shard-kbl3/igt@kms_plane@plane-position-hole-pipe-a-planes.html"=
>PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/=
shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> +3 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-forked-busy:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-hsw6/igt@kms_vblank@pipe-c-query-forked-busy.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">=
i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5157/shard-hsw8/igt@kms_vblank@pipe-c-query-forked-busy.html">PASS</a> =
+2 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-iclb7/igt@kms_vblank@pipe-c-query-forked-busy.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982"=
>i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5157/shard-iclb2/igt@kms_vblank@pipe-c-query-forked-busy.html">PASS</a=
> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-iclb6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1185">i915#1185</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5157/shard-iclb2/igt@kms_vblank@pipe-c-ts-continuation-dpms=
-suspend.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/155">i915#155</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5157/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-dpms-sus=
pend.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2637">i915#2637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5157/shard-hsw6/igt@kms_vblank@pipe-c-ts-continuation-dpms-s=
uspend.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-glk2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5157/shard-glk5/igt@kms_vblank@pipe-c-ts-continuation-dpms-s=
uspend.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5157/shard-apl7/igt@kms_vblank@pipe-c-ts-continuation-=
dpms-suspend.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-tglb7/igt@perf@gen12-unprivileged-single-ctx-counters.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
54">i915#1354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5157/shard-tglb1/igt@perf@gen12-unprivileged-single-ctx-counters.ht=
ml">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-oa-exponent:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-hsw8/igt@perf@invalid-oa-exponent.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-=
hsw1/igt@perf@invalid-oa-exponent.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-iclb8/igt@perf@invalid-oa-exponent.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-i=
clb5/igt@perf@invalid-oa-exponent.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@non-system-wide-paranoid:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-apl8/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915=
#1354</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635=
">i915#1635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5157/shard-apl4/igt@perf@non-system-wide-paranoid.html">PASS</a> +1 s=
imilar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-glk8/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915=
#1354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5157/shard-glk6/igt@perf@non-system-wide-paranoid.html">PASS</a> +1 similar=
 issue</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-kbl6/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915=
#1354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5157/shard-kbl3/igt@perf@non-system-wide-paranoid.html">PASS</a> +1 similar=
 issue</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-tglb7/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#143=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/456">i91=
5#456</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5157/shard-tglb5/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) +=
1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-tglb8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111644">fdo=
#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
97">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5157/shard-tglb3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579=
">i915#579</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-iclb3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110892">fdo=
#110892</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5157/shard-iclb3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</=
a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-tglb2/igt@i915_suspend@fence-restore-untiled.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411"=
>i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5157/shard-tglb3/igt@i915_suspend@fence-restore-untiled.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i9=
15#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/45=
6">i915#456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-apl8/igt@kms_content_protection@lic.html">TIMEOUT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#=
1635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
157/shard-apl3/igt@kms_content_protection@lic.html">FAIL</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D110321">fdo#110321</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-glk7/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">F=
AIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108145">=
fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/265">i915#265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5157/shard-glk4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html"=
>DMESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1982">i915#1982</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">F=
AIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108145">=
fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/265">i915#265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5157/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-basic=
.html">DMESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-apl8/igt@perf@gen12-unprivileged-single-ctx-counters.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1354">i915#1354</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1635">i915#1635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5157/shard-apl1/igt@perf@gen12-unprivileged-single-ctx-=
counters.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-glk8/igt@perf@gen12-unprivileged-single-ctx-counters.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1354">i915#1354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5157/shard-glk8/igt@perf@gen12-unprivileged-single-ctx-counte=
rs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-iclb8/igt@perf@gen12-unprivileged-single-ctx-counters.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/135=
4">i915#1354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5157/shard-iclb4/igt@perf@gen12-unprivileged-single-ctx-counters.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
89">fdo#109289</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-kbl6/igt@perf@gen12-unprivileged-single-ctx-counters.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1354">i915#1354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5157/shard-kbl4/igt@perf@gen12-unprivileged-single-ctx-counte=
rs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-hsw6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw1/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2439">i915#2439</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/483">i915#483</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5157/shard-hsw8/igt@runner@aborted.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439<=
/a>)</p>
</li>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl3/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1611">i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2439">i915#2439</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/483">i915#483</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-kbl7/igt@runner@aborted.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1611=
">i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2439">i915#2439</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-iclb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb3/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_9312/shard-iclb2/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-i=
clb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5157/shard-iclb4/igt@runner@aborted.html">FAIL</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439=
</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl3/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9312/shard-apl2/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#=
2439</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5157/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/shard-apl8/igt@runner@aborted.html">=
FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1611"=
>i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2439">i915#2439</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-glk4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk2/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9312/shard-glk6/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <=
a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#20232=
1</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_515=
7/shard-glk9/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_5157/shard-glk6/igt@runner@aborted.html">FAI=
L</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1611">i9=
15#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/24=
39">i915#2439</a> / <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=
=3D202321">k.org#202321</a>)</p>
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
<li>IGT: IGT_5847 -&gt; IGTPW_5157</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9312: 88b74d59a27aa168f7cd2dec199c33ee71fe8bb0 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5157: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5157/index.htm=
l<br />
  IGT_5847: 8cffaebec5228a5042cc6928ac582a0589e2de3e @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============5946828177656602970==--

--===============0164478939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0164478939==--
