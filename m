Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 07 Mar 2020 01:24:57 -0000
Message-ID: <158354429788.20976.5830940409416102865@emeril.freedesktop.org>
References: <1583452975-8507-1-git-send-email-kunal1.joshi@intel.com>
In-Reply-To: <1583452975-8507-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fchamelium=3A_Add_support_to_validate_RGB/YUV_pixel_format?=
 =?utf-8?q?s?=
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_chamelium: Add support to validate RGB/YUV pixel formats
URL   : https://patchwork.freedesktop.org/series/74368/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8074_full -> IGTPW_4270_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4270_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4270_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4270_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt} (NEW):
    - shard-hsw:          NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-hsw6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt.html

  * {igt@kms_chamelium@hdmi-yuv-pixel-format} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-tglb2/igt@kms_chamelium@hdmi-yuv-pixel-format.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][3], [FAIL][4], [FAIL][5], [FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10]) ([fdo#109271] / [fdo#111870] / [k.org#204565]) -> ([FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18]) ([fdo#111870])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw1/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw4/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw4/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw8/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw6/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw2/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw4/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw8/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-hsw1/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-hsw1/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-hsw1/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-hsw6/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-hsw4/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-hsw1/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-hsw6/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-hsw6/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt}:
    - shard-hsw:          NOTRUN -> [DMESG-WARN][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-hsw4/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8074_full and IGTPW_4270_full:

### New IGT tests (6) ###

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt:
    - Statuses : 2 dmesg-warn(s) 5 pass(s)
    - Exec time: [0.48, 2.46] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@uc:
    - Statuses : 7 pass(s)
    - Exec time: [0.54, 2.52] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wb:
    - Statuses : 7 pass(s)
    - Exec time: [0.54, 2.48] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wc:
    - Statuses : 7 pass(s)
    - Exec time: [0.55, 2.56] s

  * igt@kms_chamelium@hdmi-rgb-pixel-format:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium@hdmi-yuv-pixel-format:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4270_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [PASS][20] -> [SKIP][21] ([fdo#112080]) +9 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb1/igt@gem_busy@extended-parallel-vcs1.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-iclb7/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][22] -> [SKIP][23] ([fdo#110854])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb2/igt@gem_exec_balancer@smoke.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-iclb5/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-write-read-bsd2:
    - shard-iclb:         [PASS][24] -> [SKIP][25] ([fdo#109276] / [i915#677])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb2/igt@gem_exec_schedule@implicit-write-read-bsd2.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-iclb7/igt@gem_exec_schedule@implicit-write-read-bsd2.html

  * igt@gem_exec_schedule@independent-bsd:
    - shard-iclb:         [PASS][26] -> [SKIP][27] ([fdo#112146]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb5/igt@gem_exec_schedule@independent-bsd.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-iclb2/igt@gem_exec_schedule@independent-bsd.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#109276]) +11 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb1/igt@gem_exec_schedule@independent-bsd2.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-iclb5/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_whisper@basic-queues:
    - shard-glk:          [PASS][30] -> [DMESG-WARN][31] ([i915#118] / [i915#95])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-glk7/igt@gem_exec_whisper@basic-queues.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-glk5/igt@gem_exec_whisper@basic-queues.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [PASS][32] -> [DMESG-WARN][33] ([i915#180]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-kbl1/igt@gem_softpin@noreloc-s3.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-kbl7/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-hsw:          [PASS][34] -> [DMESG-WARN][35] ([fdo#111870])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw8/igt@gem_userptr_blits@sync-unmap.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-hsw1/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][36] -> [FAIL][37] ([i915#454])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb6/igt@i915_pm_dc@dc6-dpms.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@basic-rte:
    - shard-glk:          [PASS][38] -> [FAIL][39] ([i915#579])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-glk4/igt@i915_pm_rpm@basic-rte.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-glk8/igt@i915_pm_rpm@basic-rte.html
    - shard-iclb:         [PASS][40] -> [FAIL][41] ([i915#579])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb8/igt@i915_pm_rpm@basic-rte.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-iclb2/igt@i915_pm_rpm@basic-rte.html
    - shard-hsw:          [PASS][42] -> [FAIL][43] ([i915#579])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw1/igt@i915_pm_rpm@basic-rte.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-hsw4/igt@i915_pm_rpm@basic-rte.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding:
    - shard-kbl:          [PASS][44] -> [FAIL][45] ([i915#54])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html
    - shard-apl:          [PASS][46] -> [FAIL][47] ([i915#54])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
    - shard-snb:          [PASS][48] -> [DMESG-WARN][49] ([i915#478]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-snb4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-apl:          [PASS][50] -> [DMESG-WARN][51] ([i915#180])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  
#### Possible fixes ####

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [SKIP][52] ([fdo#109276]) -> [PASS][53] +13 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb8/igt@gem_exec_schedule@out-order-bsd2.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-iclb2/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][54] ([i915#677]) -> [PASS][55] +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [SKIP][56] ([fdo#112146]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-iclb7/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-glk:          [DMESG-WARN][58] ([i915#118] / [i915#95]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-glk5/igt@gem_exec_whisper@basic-queues-priority.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-glk9/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][60] ([fdo#111870] / [i915#478]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb4/igt@gem_userptr_blits@dmabuf-sync.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-snb4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][62] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
    - shard-hsw:          [DMESG-WARN][64] ([fdo#111870]) -> [PASS][65] +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw8/igt@gem_userptr_blits@sync-unmap-cycles.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-hsw1/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_module_load@reload:
    - shard-glk:          [INCOMPLETE][66] ([i915#1390] / [i915#58] / [k.org#198133]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-glk6/igt@i915_module_load@reload.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-glk6/igt@i915_module_load@reload.html
    - shard-apl:          [INCOMPLETE][68] ([fdo#103927] / [i915#1390]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-apl7/igt@i915_module_load@reload.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-apl6/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-hsw:          [SKIP][70] ([fdo#109271]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-hsw6/igt@i915_pm_rpm@gem-evict-pwrite.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-hsw4/igt@i915_pm_rpm@gem-evict-pwrite.html
    - shard-tglb:         [SKIP][72] ([i915#1316]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-tglb8/igt@i915_pm_rpm@gem-evict-pwrite.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-tglb3/igt@i915_pm_rpm@gem-evict-pwrite.html
    - shard-iclb:         [SKIP][74] ([i915#1316]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb6/igt@i915_pm_rpm@gem-evict-pwrite.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-iclb4/igt@i915_pm_rpm@gem-evict-pwrite.html
    - shard-glk:          [SKIP][76] ([fdo#109271]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-glk1/igt@i915_pm_rpm@gem-evict-pwrite.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-glk2/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [DMESG-WARN][78] ([i915#180]) -> [PASS][79] +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-kbl2/igt@i915_suspend@debugfs-reader.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-kbl3/igt@i915_suspend@debugfs-reader.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge:
    - shard-snb:          [SKIP][80] ([fdo#109271]) -> [PASS][81] +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb6/igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-snb2/igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][82] ([i915#899]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][84] ([fdo#109441]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [SKIP][86] ([fdo#112080]) -> [PASS][87] +9 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb7/igt@perf_pmu@init-busy-vcs1.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-iclb2/igt@perf_pmu@init-busy-vcs1.html

  
#### Warnings ####

  * igt@gem_exec_schedule@pi-userfault-bsd1:
    - shard-iclb:         [SKIP][88] ([fdo#109276]) -> [INCOMPLETE][89] ([i915#1381])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-iclb3/igt@gem_exec_schedule@pi-userfault-bsd1.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd1.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][90] ([i915#454]) -> [SKIP][91] ([i915#468])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-tglb7/igt@i915_pm_dc@dc6-psr.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][92], [FAIL][93]) ([i915#92] / [k.org#204565]) -> [FAIL][94] ([i915#92])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-kbl7/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-kbl6/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-kbl1/igt@runner@aborted.html
    - shard-apl:          ([FAIL][95], [FAIL][96]) ([fdo#103927] / [k.org#204565]) -> [FAIL][97] ([fdo#103927])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-apl8/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-apl7/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-apl3/igt@runner@aborted.html
    - shard-snb:          ([FAIL][98], [FAIL][99], [FAIL][100], [FAIL][101], [FAIL][102], [FAIL][103], [FAIL][104], [FAIL][105]) ([fdo#111870] / [i915#1077] / [k.org#204565]) -> ([FAIL][106], [FAIL][107], [FAIL][108], [FAIL][109], [FAIL][110], [FAIL][111], [FAIL][112], [FAIL][113]) ([fdo#111870] / [i915#1077] / [i915#698])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb4/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb5/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb6/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb6/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb2/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb2/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb4/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8074/shard-snb4/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-snb4/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-snb6/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-snb2/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-snb6/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-snb6/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-snb4/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-snb2/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/shard-snb4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1381]: https://gitlab.freedesktop.org/drm/intel/issues/1381
  [i915#1390]: https://gitlab.freedesktop.org/drm/intel/issues/1390
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133
  [k.org#204565]: https://bugzilla.kernel.org/show_bug.cgi?id=204565


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5495 -> IGTPW_4270
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8074: 0dd63259839ca847514d9999749219635f311015 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4270: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/index.html
  IGT_5495: 22df72de8affcec22d9f354bb6148d77f60cc580 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4270/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
