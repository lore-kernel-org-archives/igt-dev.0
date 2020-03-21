Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 21 Mar 2020 03:09:49 -0000
Message-ID: <158476018954.2759.10337318579689021860@emeril.freedesktop.org>
References: <20200320224621.55102-1-jose.souza@intel.com>
In-Reply-To: <20200320224621.55102-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv4=2C1/7=5D_tests/kms=5Ffrontbuffer?=
 =?utf-8?q?=5Ftracking=3A_Add_tiling_to_test=5Fmode?=
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
To: "Souza, Jose" <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,v4,1/7] tests/kms_frontbuffer_tracking: Add tiling to test_mode
URL   : https://patchwork.freedesktop.org/series/74934/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8167_full -> IGTPW_4337_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4337_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4337_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4337_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_fbcon_fbt@fbc:
    - shard-glk:          [PASS][1] -> [FAIL][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-glk6/igt@kms_fbcon_fbt@fbc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-glk8/igt@kms_fbcon_fbt@fbc.html
    - shard-kbl:          [PASS][3] -> [FAIL][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-kbl4/igt@kms_fbcon_fbt@fbc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-kbl6/igt@kms_fbcon_fbt@fbc.html
    - shard-iclb:         [PASS][5] -> [FAIL][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-iclb5/igt@kms_fbcon_fbt@fbc.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-iclb3/igt@kms_fbcon_fbt@fbc.html
    - shard-tglb:         [PASS][7] -> [FAIL][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-tglb5/igt@kms_fbcon_fbt@fbc.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-tglb2/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-snb:          [PASS][9] -> [FAIL][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-snb2/igt@kms_fbcon_fbt@fbc-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-snb5/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-apl:          [PASS][11] -> [FAIL][12] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * {igt@kms_frontbuffer_tracking@fbc-tiling-y} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-snb4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8167_full and IGTPW_4337_full:

### New IGT tests (4) ###

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 9.16] s

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - Statuses : 1 fail(s) 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.37] s

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0, 10.95] s

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0, 4.89] s

  

Known issues
------------

  Here are the changes found in IGTPW_4337_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@bcs0-s3:
    - shard-apl:          [PASS][14] -> [DMESG-WARN][15] ([i915#180]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-apl1/igt@gem_ctx_isolation@bcs0-s3.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-apl1/igt@gem_ctx_isolation@bcs0-s3.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#109276]) +14 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-iclb4/igt@gem_exec_schedule@independent-bsd2.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-iclb8/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][18] -> [SKIP][19] ([i915#677]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-iclb7/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [PASS][20] -> [SKIP][21] ([fdo#112146])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-iclb8/igt@gem_exec_schedule@preempt-bsd.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-iclb1/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][22] -> [FAIL][23] ([i915#644])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-apl3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [PASS][24] -> [DMESG-WARN][25] ([fdo#111870] / [i915#478])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-hsw:          [PASS][26] -> [DMESG-WARN][27] ([fdo#111870]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-hsw8/igt@gem_userptr_blits@sync-unmap-cycles.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-hsw8/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][28] -> [FAIL][29] ([i915#447])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-iclb4/igt@i915_pm_dc@dc5-dpms.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][30] -> [FAIL][31] ([i915#413])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-iclb2/igt@i915_pm_rps@waitboost.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-iclb5/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:
    - shard-apl:          [PASS][32] -> [FAIL][33] ([i915#54])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
    - shard-kbl:          [PASS][34] -> [FAIL][35] ([i915#54])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][36] -> [DMESG-WARN][37] ([i915#180]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [PASS][38] -> [INCOMPLETE][39] ([i915#61])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-hsw7/igt@kms_flip@flip-vs-suspend.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-hsw6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [PASS][40] -> [INCOMPLETE][41] ([i915#155])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [PASS][42] -> [SKIP][43] ([fdo#109441])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-iclb3/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [PASS][44] -> [SKIP][45] ([fdo#112080]) +18 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-iclb2/igt@perf_pmu@init-busy-vcs1.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-iclb6/igt@perf_pmu@init-busy-vcs1.html

  * igt@prime_mmap_kms@buffer-sharing:
    - shard-snb:          [PASS][46] -> [SKIP][47] ([fdo#109271]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-snb2/igt@prime_mmap_kms@buffer-sharing.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-snb5/igt@prime_mmap_kms@buffer-sharing.html

  
#### Possible fixes ####

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [SKIP][48] ([i915#677]) -> [PASS][49] +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-iclb8/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][50] ([fdo#109276] / [i915#677]) -> [PASS][51] +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-iclb5/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][52] ([fdo#112146]) -> [PASS][53] +5 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_mmap_gtt@basic-small-copy-odd:
    - shard-hsw:          [DMESG-WARN][54] ([i915#478]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-hsw8/igt@gem_mmap_gtt@basic-small-copy-odd.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-hsw5/igt@gem_mmap_gtt@basic-small-copy-odd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [FAIL][56] ([i915#644]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][58] ([i915#180]) -> [PASS][59] +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][60] ([i915#180]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][62] ([fdo#109441]) -> [PASS][63] +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-iclb6/igt@kms_psr@psr2_suspend.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm:
    - shard-tglb:         [SKIP][64] ([fdo#112015]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-tglb8/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-tglb1/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
    - shard-iclb:         [SKIP][66] ([fdo#109278]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-iclb6/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-iclb4/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
    - shard-glk:          [SKIP][68] ([fdo#109271]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-glk2/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-glk9/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [FAIL][70] ([i915#1085]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-tglb7/igt@perf@gen12-mi-rpc.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-tglb6/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][72] ([fdo#112080]) -> [PASS][73] +11 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-iclb6/igt@perf_pmu@busy-vcs1.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-iclb4/igt@perf_pmu@busy-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][74] ([fdo#109276]) -> [PASS][75] +15 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-iclb3/igt@prime_busy@hang-bsd2.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-iclb1/igt@prime_busy@hang-bsd2.html

  * {igt@sysfs_preempt_timeout@timeout@vecs0}:
    - shard-glk:          [FAIL][76] -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-glk6/igt@sysfs_preempt_timeout@timeout@vecs0.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-glk8/igt@sysfs_preempt_timeout@timeout@vecs0.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [DMESG-WARN][78] -> [TIMEOUT][79] ([i915#1340])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-kbl1/igt@gem_ctx_persistence@close-replace-race.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-kbl2/igt@gem_ctx_persistence@close-replace-race.html
    - shard-glk:          [INCOMPLETE][80] ([i915#1402] / [i915#58] / [k.org#198133]) -> [TIMEOUT][81] ([i915#1340])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-glk8/igt@gem_ctx_persistence@close-replace-race.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-glk3/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt:
    - shard-hsw:          [DMESG-WARN][82] -> [DMESG-WARN][83] ([i915#478])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-hsw5/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-hsw6/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][84], [FAIL][85], [FAIL][86], [FAIL][87], [FAIL][88], [FAIL][89], [FAIL][90], [FAIL][91]) ([fdo#109271] / [fdo#111870] / [i915#1485]) -> ([FAIL][92], [FAIL][93], [FAIL][94], [FAIL][95], [FAIL][96], [FAIL][97], [FAIL][98], [FAIL][99], [FAIL][100]) ([fdo#111870] / [i915#1485])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-hsw8/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-hsw1/igt@runner@aborted.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-hsw5/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-hsw6/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-hsw8/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-hsw5/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-hsw8/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-hsw7/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-hsw6/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-hsw7/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-hsw8/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-hsw1/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-hsw5/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-hsw5/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-hsw5/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-hsw8/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-hsw8/igt@runner@aborted.html
    - shard-apl:          ([FAIL][101], [FAIL][102]) ([fdo#103927] / [i915#1402] / [i915#1485]) -> ([FAIL][103], [FAIL][104]) ([fdo#103927] / [i915#1402])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-apl6/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-apl8/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-apl4/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-apl4/igt@runner@aborted.html
    - shard-glk:          [FAIL][105] ([i915#1402] / [k.org#202321]) -> [FAIL][106] ([i915#1402] / [i915#1485] / [k.org#202321])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8167/shard-glk8/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/shard-glk3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1340]: https://gitlab.freedesktop.org/drm/intel/issues/1340
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#1485]: https://gitlab.freedesktop.org/drm/intel/issues/1485
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5526 -> IGTPW_4337
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8167: b51a7e7f4f72cf780661a1e4b479e2b27ddbafc8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4337: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/index.html
  IGT_5526: f49ebeee9f54d6f23c60a842f75f65561d452ab0 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4337/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
