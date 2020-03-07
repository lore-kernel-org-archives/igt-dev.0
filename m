Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 07 Mar 2020 05:10:58 -0000
Message-ID: <158355785827.20976.15668043295465039952@emeril.freedesktop.org>
References: <20200306084550.12618-1-karthik.b.s@intel.com>
In-Reply-To: <20200306084550.12618-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fdp=5Ftiled=5Fdisplay=3A_Increase_the_time_limit_to_receiv?=
 =?utf-8?q?e_all_page_flips_=28rev2=29?=
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
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_dp_tiled_display: Increase the time limit to receive all page flips (rev2)
URL   : https://patchwork.freedesktop.org/series/74367/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8076_full -> IGTPW_4271_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/index.html

New tests
---------

  New tests have been introduced between CI_DRM_8076_full and IGTPW_4271_full:

### New IGT tests (4) ###

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt:
    - Statuses : 2 dmesg-warn(s) 5 pass(s)
    - Exec time: [0.41, 2.48] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@uc:
    - Statuses : 7 pass(s)
    - Exec time: [0.49, 2.50] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wb:
    - Statuses : 7 pass(s)
    - Exec time: [0.47, 2.42] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wc:
    - Statuses : 7 pass(s)
    - Exec time: [0.50, 2.55] s

  

Known issues
------------

  Here are the changes found in IGTPW_4271_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276] / [i915#677])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-iclb6/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([i915#677]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112146]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-iclb7/igt@gem_exec_schedule@reorder-wide-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-kbl:          [PASS][7] -> [INCOMPLETE][8] ([fdo#103665])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-kbl6/igt@gem_exec_whisper@basic-queues-forked.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-kbl4/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-apl:          [PASS][9] -> [INCOMPLETE][10] ([fdo#103927])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-apl6/igt@gem_exec_whisper@basic-queues-priority.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-apl3/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#644])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#644])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-kbl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-kbl7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +4 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#454])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rps@waitboost:
    - shard-tglb:         [PASS][19] -> [FAIL][20] ([i915#413])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-tglb3/igt@i915_pm_rps@waitboost.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-tglb3/igt@i915_pm_rps@waitboost.html

  * igt@kms_atomic_interruptible@legacy-cursor:
    - shard-snb:          [PASS][21] -> [SKIP][22] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-snb4/igt@kms_atomic_interruptible@legacy-cursor.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-snb5/igt@kms_atomic_interruptible@legacy-cursor.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#79])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@dpms-vs-vblank-race:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#407])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-glk3/igt@kms_flip@dpms-vs-vblank-race.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-glk8/igt@kms_flip@dpms-vs-vblank-race.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([fdo#103375])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-iclb7/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#31])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-apl7/igt@kms_setmode@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-apl1/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#112080]) +8 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-iclb4/igt@perf_pmu@busy-vcs1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-iclb7/igt@perf_pmu@busy-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109276]) +12 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [SKIP][37] ([fdo#112080]) -> [PASS][38] +10 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-iclb6/igt@gem_busy@extended-parallel-vcs1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-iclb4/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_create@create-clear:
    - shard-hsw:          [TIMEOUT][39] ([i915#1358]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-hsw6/igt@gem_create@create-clear.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-hsw8/igt@gem_create@create-clear.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][41] ([i915#180]) -> [PASS][42] +4 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html
    - shard-apl:          [DMESG-WARN][43] ([i915#180]) -> [PASS][44] +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-apl8/igt@gem_ctx_isolation@rcs0-s3.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-apl6/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [SKIP][45] ([fdo#109276]) -> [PASS][46] +12 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-iclb5/igt@gem_exec_schedule@out-order-bsd2.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-iclb2/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][47] ([i915#677]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][49] ([fdo#112146]) -> [PASS][50] +6 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [INCOMPLETE][51] ([i915#1390]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-tglb6/igt@i915_module_load@reload.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-tglb1/igt@i915_module_load@reload.html
    - shard-snb:          [INCOMPLETE][53] ([i915#82]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-snb5/igt@i915_module_load@reload.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-snb5/igt@i915_module_load@reload.html
    - shard-iclb:         [INCOMPLETE][55] ([i915#140]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-iclb3/igt@i915_module_load@reload.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-iclb3/igt@i915_module_load@reload.html
    - shard-kbl:          [INCOMPLETE][57] ([fdo#103665] / [i915#1390]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-kbl6/igt@i915_module_load@reload.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-kbl7/igt@i915_module_load@reload.html
    - shard-hsw:          [INCOMPLETE][59] ([i915#1312] / [i915#61]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-hsw1/igt@i915_module_load@reload.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-hsw1/igt@i915_module_load@reload.html
    - shard-glk:          [INCOMPLETE][61] ([i915#1390] / [i915#58] / [k.org#198133]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-glk8/igt@i915_module_load@reload.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-glk8/igt@i915_module_load@reload.html
    - shard-apl:          [INCOMPLETE][63] ([fdo#103927] / [i915#1390]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-apl3/igt@i915_module_load@reload.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-apl7/igt@i915_module_load@reload.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][65] ([i915#447]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-iclb8/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-tglb:         [SKIP][67] ([i915#1316]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-tglb1/igt@i915_pm_rpm@gem-evict-pwrite.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-tglb8/igt@i915_pm_rpm@gem-evict-pwrite.html
    - shard-iclb:         [SKIP][69] ([i915#1316]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-iclb1/igt@i915_pm_rpm@gem-evict-pwrite.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-iclb3/igt@i915_pm_rpm@gem-evict-pwrite.html
    - shard-glk:          [SKIP][71] ([fdo#109271]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-glk3/igt@i915_pm_rpm@gem-evict-pwrite.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-glk4/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-iclb:         [INCOMPLETE][73] ([i915#189]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-iclb2/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-iclb1/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-iclb:         [FAIL][75] ([i915#370]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-iclb7/igt@i915_pm_rps@min-max-config-loaded.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-iclb4/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][77] ([i915#413]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-iclb4/igt@i915_pm_rps@waitboost.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-iclb7/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][79] ([i915#57]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][83] ([i915#31]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-kbl7/igt@kms_setmode@basic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-kbl7/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][85] ([i915#677]) -> [INCOMPLETE][86] ([i915#1381])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-iclb1/igt@gem_exec_schedule@pi-userfault-bsd.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-iclb8/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@pi-userfault-bsd2:
    - shard-iclb:         [INCOMPLETE][87] ([i915#1381]) -> [SKIP][88] ([fdo#109276])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-iclb1/igt@gem_exec_schedule@pi-userfault-bsd2.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-iclb8/igt@gem_exec_schedule@pi-userfault-bsd2.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][89] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][90] ([fdo#111870] / [i915#478])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
    - shard-hsw:          [DMESG-WARN][91] ([fdo#111870]) -> [DMESG-WARN][92] ([fdo#110789] / [fdo#111870])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-hsw8/igt@gem_userptr_blits@sync-unmap-cycles.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-hsw4/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][93] ([i915#454]) -> [SKIP][94] ([i915#468])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-snb:          [INCOMPLETE][95] ([i915#82]) -> [SKIP][96] ([fdo#109271])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-snb2/igt@i915_pm_rpm@sysfs-read.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-snb5/igt@i915_pm_rpm@sysfs-read.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][97], [FAIL][98], [FAIL][99], [FAIL][100], [FAIL][101], [FAIL][102], [FAIL][103], [FAIL][104]) ([fdo#109271] / [fdo#111870] / [k.org#204565]) -> ([FAIL][105], [FAIL][106], [FAIL][107], [FAIL][108], [FAIL][109], [FAIL][110], [FAIL][111], [FAIL][112]) ([fdo#111870])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-hsw8/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-hsw1/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-hsw4/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-hsw1/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-hsw1/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-hsw6/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-hsw8/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-hsw8/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-hsw4/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-hsw8/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-hsw4/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-hsw1/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-hsw6/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-hsw4/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-hsw8/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-hsw1/igt@runner@aborted.html
    - shard-kbl:          [FAIL][113] ([k.org#204565]) -> [FAIL][114] ([i915#92])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-kbl6/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-kbl3/igt@runner@aborted.html
    - shard-apl:          ([FAIL][115], [FAIL][116]) ([fdo#103927] / [k.org#204565]) -> [FAIL][117] ([fdo#103927])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-apl1/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-apl3/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-apl2/igt@runner@aborted.html
    - shard-snb:          ([FAIL][118], [FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125]) ([fdo#111870] / [i915#1077] / [k.org#204565]) -> ([FAIL][126], [FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132], [FAIL][133]) ([fdo#111870] / [i915#1077])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-snb5/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-snb2/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-snb4/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-snb2/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-snb6/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-snb4/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-snb5/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8076/shard-snb6/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-snb5/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-snb6/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-snb2/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-snb5/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-snb6/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-snb4/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-snb6/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/shard-snb6/igt@runner@aborted.html

  
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1312]: https://gitlab.freedesktop.org/drm/intel/issues/1312
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1358]: https://gitlab.freedesktop.org/drm/intel/issues/1358
  [i915#1381]: https://gitlab.freedesktop.org/drm/intel/issues/1381
  [i915#1390]: https://gitlab.freedesktop.org/drm/intel/issues/1390
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#189]: https://gitlab.freedesktop.org/drm/intel/issues/189
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#370]: https://gitlab.freedesktop.org/drm/intel/issues/370
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133
  [k.org#204565]: https://bugzilla.kernel.org/show_bug.cgi?id=204565


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5495 -> IGTPW_4271
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8076: bb93ee259288a580da4625a7a747bcd9bbedaf96 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4271: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/index.html
  IGT_5495: 22df72de8affcec22d9f354bb6148d77f60cc580 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4271/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
