Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 06 Mar 2020 08:36:53 -0000
Message-ID: <158348381367.3082.918621658833320605@emeril.freedesktop.org>
References: <20200305175321.31384-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200305175321.31384-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fexec=5Fgttfill=3A_MMAP=5FOFFSET_related_refresh?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/gem_exec_gttfill: MMAP_OFFSET related refresh
URL   : https://patchwork.freedesktop.org/series/74347/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8070_full -> IGTPW_4267_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4267_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4267_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4267_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt} (NEW):
    - shard-hsw:          NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][2], [FAIL][3], [FAIL][4], [FAIL][5], [FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9]) ([fdo#109271] / [fdo#111870] / [k.org#204565]) -> ([FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15]) ([fdo#111870])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-hsw1/igt@runner@aborted.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-hsw2/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-hsw2/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-hsw2/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-hsw8/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-hsw4/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-hsw6/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-hsw4/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-hsw2/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-hsw1/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-hsw6/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-hsw1/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-hsw1/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-hsw2/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt}:
    - shard-hsw:          NOTRUN -> [DMESG-WARN][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt.html

  * {igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt}:
    - shard-hsw:          [DMESG-WARN][17] ([i915#478]) -> [DMESG-WARN][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-hsw4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8070_full and IGTPW_4267_full:

### New IGT tests (4) ###

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt:
    - Statuses : 2 dmesg-warn(s)
    - Exec time: [0.44, 0.49] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@uc:
    - Statuses : 2 pass(s)
    - Exec time: [0.42, 0.48] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wb:
    - Statuses : 2 pass(s)
    - Exec time: [0.43, 0.47] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wc:
    - Statuses : 2 pass(s)
    - Exec time: [0.43, 0.50] s

  

Known issues
------------

  Here are the changes found in IGTPW_4267_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#110854])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-iclb1/igt@gem_exec_balancer@smoke.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-iclb3/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@deep-bsd:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#112146]) +4 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-iclb7/igt@gem_exec_schedule@deep-bsd.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-iclb2/igt@gem_exec_schedule@deep-bsd.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109276]) +16 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-iclb4/igt@gem_exec_schedule@independent-bsd2.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-iclb8/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([i915#677]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_mmap_gtt@close-race:
    - shard-hsw:          [PASS][27] -> [DMESG-WARN][28] ([i915#478])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-hsw8/igt@gem_mmap_gtt@close-race.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-hsw2/igt@gem_mmap_gtt@close-race.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#644])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-kbl7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][31] -> [FAIL][32] ([i915#454])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-iclb7/igt@i915_pm_dc@dc6-psr.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@fences-dpms:
    - shard-hsw:          [PASS][33] -> [SKIP][34] ([fdo#109271]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-hsw8/igt@i915_pm_rpm@fences-dpms.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-hsw6/igt@i915_pm_rpm@fences-dpms.html
    - shard-tglb:         [PASS][35] -> [SKIP][36] ([i915#1316])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-tglb5/igt@i915_pm_rpm@fences-dpms.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-tglb7/igt@i915_pm_rpm@fences-dpms.html
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([i915#1316])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-iclb3/igt@i915_pm_rpm@fences-dpms.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-iclb2/igt@i915_pm_rpm@fences-dpms.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][39] -> [DMESG-WARN][40] ([i915#180]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen:
    - shard-kbl:          [PASS][41] -> [FAIL][42] ([i915#54])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
    - shard-apl:          [PASS][43] -> [FAIL][44] ([i915#54])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [PASS][45] -> [INCOMPLETE][46] ([i915#61])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-hsw6/igt@kms_flip@flip-vs-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-hsw1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-snb:          [PASS][47] -> [DMESG-WARN][48] ([i915#478])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][49] -> [DMESG-WARN][50] ([i915#180])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][51] -> [FAIL][52] ([i915#899])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][53] -> [SKIP][54] ([fdo#109642] / [fdo#111068])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-iclb8/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][55] -> [FAIL][56] ([i915#173])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-iclb5/igt@kms_psr@no_drrs.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][57] -> [SKIP][58] ([fdo#109441]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-iclb6/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][59] -> [FAIL][60] ([i915#31])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-apl7/igt@kms_setmode@basic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-apl2/igt@kms_setmode@basic.html
    - shard-kbl:          [PASS][61] -> [FAIL][62] ([i915#31])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-kbl7/igt@kms_setmode@basic.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-kbl2/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][63] -> [SKIP][64] ([fdo#112080]) +11 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-iclb1/igt@perf_pmu@busy-vcs1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-iclb3/igt@perf_pmu@busy-vcs1.html

  * igt@perf_pmu@rc6-runtime-pm:
    - shard-tglb:         [PASS][65] -> [SKIP][66] ([fdo#111719])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-tglb1/igt@perf_pmu@rc6-runtime-pm.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-tglb7/igt@perf_pmu@rc6-runtime-pm.html
    - shard-iclb:         [PASS][67] -> [SKIP][68] ([i915#293])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-iclb2/igt@perf_pmu@rc6-runtime-pm.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-iclb2/igt@perf_pmu@rc6-runtime-pm.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@blt:
    - shard-tglb:         [INCOMPLETE][69] -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-tglb6/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-tglb6/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd2:
    - shard-tglb:         [FAIL][71] ([i915#679]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-tglb6/igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd2.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-tglb6/igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd2.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][73] ([fdo#112080]) -> [PASS][74] +4 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-iclb7/igt@gem_exec_parallel@vcs1-fds.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [SKIP][75] ([i915#677]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-iclb6/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [SKIP][77] ([fdo#109276] / [i915#677]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-iclb7/igt@gem_exec_schedule@implicit-both-bsd1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-iclb2/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][79] ([fdo#112146]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-iclb1/igt@gem_exec_schedule@reorder-wide-bsd.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-iclb6/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-hsw:          [DMESG-WARN][81] ([fdo#111870]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-hsw8/igt@gem_userptr_blits@dmabuf-unsync.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-hsw2/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-snb:          [DMESG-WARN][83] ([fdo#111870] / [i915#478]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-snb4/igt@gem_userptr_blits@dmabuf-unsync.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [INCOMPLETE][85] ([i915#1390]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-tglb3/igt@i915_module_load@reload.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-tglb7/igt@i915_module_load@reload.html
    - shard-iclb:         [INCOMPLETE][87] ([i915#140]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-iclb4/igt@i915_module_load@reload.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-iclb2/igt@i915_module_load@reload.html
    - shard-kbl:          [INCOMPLETE][89] ([fdo#103665]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-kbl1/igt@i915_module_load@reload.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-kbl3/igt@i915_module_load@reload.html
    - shard-glk:          [INCOMPLETE][91] ([i915#58] / [k.org#198133]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-glk6/igt@i915_module_load@reload.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-glk4/igt@i915_module_load@reload.html
    - shard-apl:          [INCOMPLETE][93] ([fdo#103927]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-apl6/igt@i915_module_load@reload.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-apl8/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-hsw:          [SKIP][95] ([fdo#109271]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-hsw2/igt@i915_pm_rpm@gem-evict-pwrite.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-hsw6/igt@i915_pm_rpm@gem-evict-pwrite.html
    - shard-tglb:         [SKIP][97] ([i915#1316]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-tglb2/igt@i915_pm_rpm@gem-evict-pwrite.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-tglb6/igt@i915_pm_rpm@gem-evict-pwrite.html
    - shard-iclb:         [SKIP][99] ([i915#1316]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-iclb6/igt@i915_pm_rpm@gem-evict-pwrite.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-iclb2/igt@i915_pm_rpm@gem-evict-pwrite.html
    - shard-glk:          [SKIP][101] ([fdo#109271]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-glk4/igt@i915_pm_rpm@gem-evict-pwrite.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-glk7/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-hsw:          [INCOMPLETE][103] ([i915#61]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-hsw8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [DMESG-WARN][105] ([i915#180]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [DMESG-WARN][107] ([i915#180]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [SKIP][109] ([fdo#109441]) -> [PASS][110] +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-iclb7/igt@kms_psr@psr2_primary_blt.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-iclb2/igt@kms_psr@psr2_primary_blt.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][111] ([fdo#109276]) -> [PASS][112] +9 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_exec_schedule@pi-userfault-bsd1:
    - shard-iclb:         [INCOMPLETE][113] ([i915#1381]) -> [SKIP][114] ([fdo#109276])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd1.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-iclb8/igt@gem_exec_schedule@pi-userfault-bsd1.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][115] ([i915#468]) -> [FAIL][116] ([i915#454])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-tglb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][117] ([fdo#109349]) -> [DMESG-WARN][118] ([i915#1226])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][119], [FAIL][120]) ([i915#92] / [k.org#204565]) -> [FAIL][121] ([i915#92])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-kbl6/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-kbl1/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-kbl6/igt@runner@aborted.html
    - shard-apl:          ([FAIL][122], [FAIL][123]) ([fdo#103927] / [k.org#204565]) -> [FAIL][124] ([fdo#103927])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-apl8/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-apl6/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-apl4/igt@runner@aborted.html
    - shard-snb:          ([FAIL][125], [FAIL][126], [FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132]) ([fdo#111870] / [i915#1077] / [k.org#204565]) -> ([FAIL][133], [FAIL][134], [FAIL][135], [FAIL][136], [FAIL][137]) ([fdo#111870] / [i915#1077] / [i915#698])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-snb6/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-snb2/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-snb6/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-snb2/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-snb5/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-snb2/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-snb2/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8070/shard-snb4/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-snb2/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-snb2/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-snb6/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-snb2/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/shard-snb4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1381]: https://gitlab.freedesktop.org/drm/intel/issues/1381
  [i915#1390]: https://gitlab.freedesktop.org/drm/intel/issues/1390
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#293]: https://gitlab.freedesktop.org/drm/intel/issues/293
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133
  [k.org#204565]: https://bugzilla.kernel.org/show_bug.cgi?id=204565


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5495 -> IGTPW_4267
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8070: d4e6f8b48e361f0cae9132f50f1778707b2546a2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4267: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/index.html
  IGT_5495: 22df72de8affcec22d9f354bb6148d77f60cc580 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4267/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
