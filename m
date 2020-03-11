Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 11 Mar 2020 20:39:03 -0000
Message-ID: <158395914377.13950.8937614559940575552@emeril.freedesktop.org>
References: <20200310190024.6627-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200310190024.6627-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdC9w?=
 =?utf-8?q?erf=3A_Add_test_to_verify_OA_TLB_invalidation_=28rev2=29?=
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
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: test/perf: Add test to verify OA TLB invalidation (rev2)
URL   : https://patchwork.freedesktop.org/series/74477/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8112_full -> IGTPW_4288_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4288_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4288_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4288_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@perf@gen12-oa-tlb-invalidate} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-tglb1/igt@perf@gen12-oa-tlb-invalidate.html
    - shard-iclb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-iclb4/igt@perf@gen12-oa-tlb-invalidate.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][3], [FAIL][4], [FAIL][5], [FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11]) ([fdo#111870] / [i915#478]) -> ([FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18]) ([fdo#111870])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw1/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw2/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw1/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw2/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw5/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw4/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw2/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw5/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw7/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-hsw6/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-hsw5/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-hsw1/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-hsw4/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-hsw6/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-hsw2/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-hsw2/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8112_full and IGTPW_4288_full:

### New IGT tests (1) ###

  * igt@perf@gen12-oa-tlb-invalidate:
    - Statuses : 1 fail(s) 6 skip(s)
    - Exec time: [0.0, 10.12] s

  

Known issues
------------

  Here are the changes found in IGTPW_4288_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [PASS][19] -> [INCOMPLETE][20] ([i915#1402])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-tglb1/igt@gem_ctx_persistence@close-replace-race.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-tglb2/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd:
    - shard-tglb:         [PASS][21] -> [INCOMPLETE][22] ([i915#1239])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-tglb3/igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-tglb6/igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@render:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([i915#679])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-tglb3/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-tglb6/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html

  * igt@gem_exec_schedule@implicit-write-read-bsd:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([i915#677])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb8/igt@gem_exec_schedule@implicit-write-read-bsd.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-iclb1/igt@gem_exec_schedule@implicit-write-read-bsd.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109276]) +21 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb4/igt@gem_exec_schedule@independent-bsd2.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-iclb7/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#112146]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-glk:          [PASS][31] -> [DMESG-WARN][32] ([i915#118] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-glk4/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#644])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#644])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [PASS][37] -> [DMESG-WARN][38] ([fdo#111870] / [i915#478])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][39] -> [DMESG-WARN][40] ([i915#716])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-glk2/igt@gen9_exec_parse@allowed-all.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-glk8/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([i915#1316])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb3/igt@i915_pm_rpm@dpms-lpsp.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-iclb8/igt@i915_pm_rpm@dpms-lpsp.html
    - shard-tglb:         [PASS][43] -> [SKIP][44] ([i915#1316])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-tglb8/igt@i915_pm_rpm@dpms-lpsp.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-tglb1/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-iclb:         [PASS][45] -> [FAIL][46] ([i915#370])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb4/igt@i915_pm_rps@min-max-config-loaded.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-iclb2/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][47] -> [FAIL][48] ([i915#413])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb1/igt@i915_pm_rps@reset.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-iclb7/igt@i915_pm_rps@reset.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][49] -> [DMESG-WARN][50] ([i915#180]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_fence_pin_leak:
    - shard-hsw:          [PASS][51] -> [DMESG-WARN][52] ([i915#478])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw4/igt@kms_fence_pin_leak.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-hsw6/igt@kms_fence_pin_leak.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-kbl:          [PASS][53] -> [INCOMPLETE][54] ([i915#155] / [i915#600])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-kbl3/igt@kms_flip@flip-vs-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-kbl3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][55] -> [FAIL][56] ([i915#899])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-glk2/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][57] -> [FAIL][58] ([i915#173])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb5/igt@kms_psr@no_drrs.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][59] -> [SKIP][60] ([fdo#109441]) +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][61] -> [DMESG-WARN][62] ([i915#180]) +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@busy-start-vcs1:
    - shard-iclb:         [PASS][63] -> [SKIP][64] ([fdo#112080]) +10 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb1/igt@perf_pmu@busy-start-vcs1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-iclb5/igt@perf_pmu@busy-start-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][65] ([fdo#112080]) -> [PASS][66] +11 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb5/igt@gem_busy@busy-vcs1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-iclb4/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [INCOMPLETE][67] ([i915#1402]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-kbl1/igt@gem_ctx_persistence@close-replace-race.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-kbl1/igt@gem_ctx_persistence@close-replace-race.html
    - shard-iclb:         [INCOMPLETE][69] ([i915#1402]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb7/igt@gem_ctx_persistence@close-replace-race.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-iclb7/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_persistence@engines-mixed-process@vecs0:
    - shard-kbl:          [FAIL][71] ([i915#679]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-kbl7/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-kbl4/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][73] ([i915#677]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-iclb5/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][75] ([fdo#112146]) -> [PASS][76] +4 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-glk:          [DMESG-WARN][77] ([i915#118] / [i915#95]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-glk3/igt@gem_exec_whisper@basic-fds-priority.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-glk9/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][79] ([i915#413]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb6/igt@i915_pm_rps@waitboost.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-iclb1/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen:
    - shard-apl:          [FAIL][81] ([i915#54]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled:
    - shard-glk:          [FAIL][83] ([i915#52] / [i915#54]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][85] ([i915#180]) -> [PASS][86] +3 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][87] ([i915#180]) -> [PASS][88] +4 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][89] ([i915#899]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-x:
    - shard-hsw:          [DMESG-WARN][91] ([i915#478]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw5/igt@kms_plane_multiple@atomic-pipe-c-tiling-x.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-hsw1/igt@kms_plane_multiple@atomic-pipe-c-tiling-x.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][93] ([fdo#109441]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@prime_vgem@basic-gtt:
    - shard-snb:          [DMESG-WARN][95] ([i915#478]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-snb5/igt@prime_vgem@basic-gtt.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-snb5/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][97] ([fdo#109276]) -> [PASS][98] +17 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_linear_blits@normal:
    - shard-apl:          [TIMEOUT][99] ([i915#1322]) -> [TIMEOUT][100] ([fdo#111732] / [i915#1322])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-apl1/igt@gem_linear_blits@normal.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-apl3/igt@gem_linear_blits@normal.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][101] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][102] ([fdo#111870] / [i915#478])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-hsw:          [DMESG-WARN][103] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][104] ([fdo#111870])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw4/igt@gem_userptr_blits@dmabuf-sync.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-hsw1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][105] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][106] ([fdo#110789] / [fdo#111870] / [i915#478])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html
    - shard-hsw:          [DMESG-WARN][107] ([fdo#111870]) -> [DMESG-WARN][108] ([fdo#110789] / [fdo#111870])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw7/igt@gem_userptr_blits@sync-unmap-cycles.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-hsw5/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][109] ([i915#468]) -> [FAIL][110] ([i915#454])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-tglb6/igt@i915_pm_dc@dc6-dpms.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][111], [FAIL][112]) ([i915#1389] / [i915#1402] / [i915#92]) -> [FAIL][113] ([i915#92])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-kbl1/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-kbl1/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/shard-kbl2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111732]: https://bugs.freedesktop.org/show_bug.cgi?id=111732
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1239]: https://gitlab.freedesktop.org/drm/intel/issues/1239
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1322]: https://gitlab.freedesktop.org/drm/intel/issues/1322
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#370]: https://gitlab.freedesktop.org/drm/intel/issues/370
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#600]: https://gitlab.freedesktop.org/drm/intel/issues/600
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5504 -> IGTPW_4288
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8112: 032f2fe5c92eb1db6d417738431153c001a41bcc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4288: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/index.html
  IGT_5504: d6788bf0404f76b66170e18eb26c85004b5ccb25 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4288/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
