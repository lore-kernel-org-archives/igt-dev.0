Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 03 Nov 2020 19:31:36 -0000
Message-ID: <160443189693.25740.3372073036395770491@emeril.freedesktop.org>
References: <20201103104712.29233-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20201103104712.29233-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgSW50cm9k?=
 =?utf-8?q?uce_IGT_allocator_=28rev8=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0281501891=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0281501891==
Content-Type: multipart/alternative;
 boundary="===============3401429864483274873=="

--===============3401429864483274873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce IGT allocator (rev8)
URL   : https://patchwork.freedesktop.org/series/82954/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9252_full -> IGTPW_5123_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5123_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5123_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5123_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-glk:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-glk4/igt@gem_exec_suspend@basic-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-glk5/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-iclb:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-iclb8/igt@gem_exec_whisper@basic-forked.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb2/igt@gem_exec_whisper@basic-forked.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-hsw:          [WARN][5] ([i915#2283]) -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-hsw7/igt@core_hotunplug@hotrebind-lateclose.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-hsw2/igt@core_hotunplug@hotrebind-lateclose.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9252_full and IGTPW_5123_full:

### New IGT tests (32) ###

  * igt@api_intel_allocator@alloc-simple:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@api_intel_allocator@fork-simple-once:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@api_intel_allocator@fork-simple-stress:
    - Statuses : 6 pass(s)
    - Exec time: [5.40, 5.50] s

  * igt@api_intel_allocator@fork-simple-stress-signal:
    - Statuses : 7 pass(s)
    - Exec time: [5.41, 5.55] s

  * igt@api_intel_allocator@print:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@api_intel_allocator@random-allocator:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_allocator@random-allocator@basic:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@api_intel_allocator@random-allocator@parallel-one:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_allocator@reopen:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_allocator@reopen-fork:
    - Statuses : 7 pass(s)
    - Exec time: [3.23, 3.28] s

  * igt@api_intel_allocator@reserve:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@api_intel_allocator@reserve-simple:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@api_intel_allocator@reuse:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@api_intel_allocator@simple-allocator:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_allocator@simple-allocator@basic:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_allocator@simple-allocator@parallel-one:
    - Statuses : 6 pass(s)
    - Exec time: [0.10, 0.21] s

  * igt@api_intel_allocator@simple-allocator@reserve:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@api_intel_allocator@simple-allocator@reuse:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@api_intel_allocator@two-level-inception:
    - Statuses : 7 pass(s)
    - Exec time: [5.41, 5.68] s

  * igt@api_intel_allocator@two-level-inception-interruptible:
    - Statuses : 6 pass(s)
    - Exec time: [5.41, 5.66] s

  * igt@api_intel_bb@add-remove-objects:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@api_intel_bb@blit-noreloc-keep-cache-random:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@api_intel_bb@blit-noreloc-purge-cache-random:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@api_intel_bb@destroy-bb:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@api_intel_bb@object-noreloc-keep-cache-random:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@api_intel_bb@object-noreloc-keep-cache-simple:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@api_intel_bb@object-noreloc-purge-cache-random:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@api_intel_bb@object-noreloc-purge-cache-simple:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@api_intel_bb@object-reloc-keep-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@object-reloc-purge-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@purge-bb:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@reset-bb:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_5123_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-noreloc-keep-cache:
    - shard-hsw:          [PASS][7] -> [SKIP][8] ([fdo#109271]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-hsw7/igt@api_intel_bb@blit-noreloc-keep-cache.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-hsw5/igt@api_intel_bb@blit-noreloc-keep-cache.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-iclb:         [PASS][9] -> [INCOMPLETE][10] ([i915#1185])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-iclb6/igt@gem_exec_suspend@basic-s3.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb6/igt@gem_exec_suspend@basic-s3.html
    - shard-hsw:          [PASS][11] -> [INCOMPLETE][12] ([i915#1888])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-hsw4/igt@gem_exec_suspend@basic-s3.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-hsw2/igt@gem_exec_suspend@basic-s3.html
    - shard-kbl:          [PASS][13] -> [INCOMPLETE][14] ([i915#155])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-kbl3/igt@gem_exec_suspend@basic-s3.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-kbl6/igt@gem_exec_suspend@basic-s3.html
    - shard-apl:          [PASS][15] -> [INCOMPLETE][16] ([i915#1635])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-apl2/igt@gem_exec_suspend@basic-s3.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-apl6/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-glk:          [PASS][17] -> [DMESG-WARN][18] ([i915#118] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-glk5/igt@gem_exec_whisper@basic-queues-priority-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-glk3/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-hsw:          [PASS][19] -> [FAIL][20] ([i915#1888])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-hsw1/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
    - shard-snb:          [PASS][21] -> [INCOMPLETE][22] ([i915#82]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-snb5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-snb6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [PASS][23] -> [WARN][24] ([i915#1519])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-snb:          [PASS][25] -> [DMESG-WARN][26] ([i915#42])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-snb2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-snb7/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-bottom-edge:
    - shard-snb:          [PASS][27] -> [SKIP][28] ([fdo#109271]) +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-snb6/igt@kms_cursor_edge_walk@pipe-b-64x64-bottom-edge.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-snb2/igt@kms_cursor_edge_walk@pipe-b-64x64-bottom-edge.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#1635] / [i915#1982]) +4 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-apl1/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-apl1/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
    - shard-glk:          [PASS][31] -> [DMESG-WARN][32] ([i915#1982]) +7 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-glk6/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-glk1/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-tglb:         [PASS][33] -> [FAIL][34] ([i915#2346])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_flip@2x-flip-vs-fences@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][35] -> [DMESG-WARN][36] ([i915#1982])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-hsw7/igt@kms_flip@2x-flip-vs-fences@ab-vga1-hdmi-a1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-hsw6/igt@kms_flip@2x-flip-vs-fences@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-plain-flip-ts-check@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#2122])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-glk3/igt@kms_flip@2x-plain-flip-ts-check@bc-hdmi-a1-hdmi-a2.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-glk5/igt@kms_flip@2x-plain-flip-ts-check@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@blocking-wf_vblank@a-edp1:
    - shard-tglb:         [PASS][39] -> [DMESG-WARN][40] ([i915#1982])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-tglb2/igt@kms_flip@blocking-wf_vblank@a-edp1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-tglb2/igt@kms_flip@blocking-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1:
    - shard-kbl:          [PASS][41] -> [DMESG-WARN][42] ([i915#1982]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-kbl6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-kbl3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-iclb:         [PASS][43] -> [FAIL][44] ([i915#79])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-iclb3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][45] -> [DMESG-WARN][46] ([i915#180]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109441]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][49] -> [FAIL][50] ([i915#31])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-hsw7/igt@kms_setmode@basic.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-hsw6/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * igt@gem_exec_create@forked:
    - shard-glk:          [DMESG-WARN][51] ([i915#118] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-glk7/igt@gem_exec_create@forked.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-glk7/igt@gem_exec_create@forked.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-hsw:          [SKIP][53] ([fdo#109271]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-hsw2/igt@i915_pm_rpm@pm-tiling.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-hsw1/igt@i915_pm_rpm@pm-tiling.html
    - shard-kbl:          [SKIP][55] ([fdo#109271]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-kbl1/igt@i915_pm_rpm@pm-tiling.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-kbl1/igt@i915_pm_rpm@pm-tiling.html
    - shard-apl:          [SKIP][57] ([fdo#109271] / [i915#1635]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-apl3/igt@i915_pm_rpm@pm-tiling.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-apl1/igt@i915_pm_rpm@pm-tiling.html
    - shard-glk:          [SKIP][59] ([fdo#109271]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-glk5/igt@i915_pm_rpm@pm-tiling.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-glk1/igt@i915_pm_rpm@pm-tiling.html
    - shard-iclb:         [SKIP][61] ([i915#579]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-iclb2/igt@i915_pm_rpm@pm-tiling.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb5/igt@i915_pm_rpm@pm-tiling.html

  * {igt@kms_async_flips@alternate-sync-async-flip}:
    - shard-kbl:          [FAIL][63] ([i915#2521]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-kbl2/igt@kms_async_flips@alternate-sync-async-flip.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-kbl4/igt@kms_async_flips@alternate-sync-async-flip.html
    - shard-tglb:         [FAIL][65] ([i915#2521]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-tglb7/igt@kms_async_flips@alternate-sync-async-flip.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-tglb3/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled:
    - shard-apl:          [DMESG-WARN][67] ([i915#1635] / [i915#1982]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-apl3/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-apl8/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-glk:          [DMESG-WARN][69] ([i915#1982]) -> [PASS][70] +5 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-glk6/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-glk1/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][71] ([i915#2055]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_flip_tiling@flip-to-yf-tiled:
    - shard-kbl:          [DMESG-WARN][73] ([i915#1982]) -> [PASS][74] +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-kbl4/igt@kms_flip_tiling@flip-to-yf-tiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-kbl7/igt@kms_flip_tiling@flip-to-yf-tiled.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
    - shard-iclb:         [DMESG-WARN][75] ([i915#1982]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-iclb6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][77] ([fdo#109441]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_psr@suspend:
    - shard-iclb:         [INCOMPLETE][79] ([i915#1185]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-iclb6/igt@kms_psr@suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb2/igt@kms_psr@suspend.html

  * igt@kms_vblank@pipe-d-accuracy-idle:
    - shard-tglb:         [DMESG-WARN][81] ([i915#1982]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-tglb8/igt@kms_vblank@pipe-d-accuracy-idle.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-tglb8/igt@kms_vblank@pipe-d-accuracy-idle.html

  * igt@perf@non-system-wide-paranoid:
    - shard-apl:          [SKIP][83] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-apl7/igt@perf@non-system-wide-paranoid.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-apl2/igt@perf@non-system-wide-paranoid.html
    - shard-glk:          [SKIP][85] ([fdo#109271] / [i915#1354]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-glk3/igt@perf@non-system-wide-paranoid.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-glk6/igt@perf@non-system-wide-paranoid.html
    - shard-iclb:         [SKIP][87] ([i915#1354]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-iclb6/igt@perf@non-system-wide-paranoid.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb2/igt@perf@non-system-wide-paranoid.html
    - shard-kbl:          [SKIP][89] ([fdo#109271] / [i915#1354]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-kbl3/igt@perf@non-system-wide-paranoid.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-kbl7/igt@perf@non-system-wide-paranoid.html
    - shard-tglb:         [SKIP][91] ([i915#1354]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-tglb8/igt@perf@non-system-wide-paranoid.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-tglb6/igt@perf@non-system-wide-paranoid.html

  * igt@perf@polling-parameterized:
    - shard-iclb:         [FAIL][93] ([i915#1542]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-iclb2/igt@perf@polling-parameterized.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb4/igt@perf@polling-parameterized.html
    - shard-hsw:          [FAIL][95] ([i915#1542]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-hsw6/igt@perf@polling-parameterized.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-hsw4/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-tglb:         [DMESG-WARN][97] ([i915#2411]) -> [DMESG-WARN][98] ([i915#1436])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-tglb6/igt@gem_exec_suspend@basic-s3.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-tglb1/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_pm_backlight@fade_with_suspend:
    - shard-tglb:         [INCOMPLETE][99] ([i915#1436] / [i915#456]) -> [DMESG-WARN][100] ([i915#2411])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-tglb2/igt@i915_pm_backlight@fade_with_suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-tglb6/igt@i915_pm_backlight@fade_with_suspend.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-iclb:         [SKIP][101] ([i915#579]) -> [SKIP][102] ([fdo#110892])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-iclb6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-tglb:         [SKIP][103] ([i915#579]) -> [DMESG-WARN][104] ([i915#2411])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-tglb2/igt@i915_pm_rpm@pm-tiling.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-tglb3/igt@i915_pm_rpm@pm-tiling.html

  * igt@kms_flip@flip-vs-suspend@a-edp1:
    - shard-tglb:         [DMESG-WARN][105] ([i915#2411]) -> [INCOMPLETE][106] ([i915#1436] / [i915#456])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-tglb1/igt@kms_flip@flip-vs-suspend@a-edp1.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-tglb2/igt@kms_flip@flip-vs-suspend@a-edp1.html

  * igt@runner@aborted:
    - shard-iclb:         [FAIL][107] ([i915#1814] / [i915#483]) -> ([FAIL][108], [FAIL][109]) ([i915#2439] / [i915#483])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-iclb6/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb6/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb2/igt@runner@aborted.html
    - shard-glk:          [FAIL][110] ([i915#1611] / [i915#1814] / [k.org#202321]) -> [FAIL][111] ([i915#2439] / [k.org#202321])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-glk8/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-glk5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5830 -> IGTPW_5123
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9252: bb8053708f1889f738f4247e84ef5e051e1e178d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5123: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/index.html
  IGT_5830: 12d370cb57e0cfcb781c87ad9e15e68b17a1f41f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/index.html

--===============3401429864483274873==
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
<tr><td><b>Series:</b></td><td>Introduce IGT allocator (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82954/">https://patchwork.freedesktop.org/series/82954/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9252_full -&gt; IGTPW_5123_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5123_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5123_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5123_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-glk4/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-glk5/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-iclb8/igt@gem_exec_whisper@basic-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb2/igt@gem_exec_whisper@basic-forked.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@core_hotunplug@hotrebind-lateclose:<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-hsw7/igt@core_hotunplug@hotrebind-lateclose.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-hsw2/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9252_full and IGTPW_5123_full:</p>
<h3>New IGT tests (32)</h3>
<ul>
<li>
<p>igt@api_intel_allocator@alloc-simple:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@fork-simple-once:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@fork-simple-stress:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [5.40, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@fork-simple-stress-signal:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [5.41, 5.55] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@print:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@random-allocator:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@random-allocator@basic:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@random-allocator@parallel-one:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@reopen:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@reopen-fork:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [3.23, 3.28] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@reserve:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@reserve-simple:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@reuse:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@simple-allocator:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@simple-allocator@basic:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@simple-allocator@parallel-one:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.10, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@simple-allocator@reserve:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@simple-allocator@reuse:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@two-level-inception:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [5.41, 5.68] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@two-level-inception-interruptible:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [5.41, 5.66] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@add-remove-objects:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@blit-noreloc-keep-cache-random:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@blit-noreloc-purge-cache-random:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@destroy-bb:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-noreloc-keep-cache-random:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-noreloc-keep-cache-simple:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-noreloc-purge-cache-random:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-noreloc-purge-cache-simple:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@purge-bb:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@reset-bb:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5123_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-noreloc-keep-cache:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-hsw7/igt@api_intel_bb@blit-noreloc-keep-cache.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-hsw5/igt@api_intel_bb@blit-noreloc-keep-cache.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-iclb6/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb6/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-hsw4/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-hsw2/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-kbl3/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-kbl6/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-apl2/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-apl6/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-glk5/igt@gem_exec_whisper@basic-queues-priority-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-glk3/igt@gem_exec_whisper@basic-queues-priority-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-hsw1/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-snb5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-snb6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-snb2/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-snb7/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/42">i915#42</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-64x64-bottom-edge:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-snb6/igt@kms_cursor_edge_walk@pipe-b-64x64-bottom-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-snb2/igt@kms_cursor_edge_walk@pipe-b-64x64-bottom-edge.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-apl1/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-apl1/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-glk6/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-glk1/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-hsw7/igt@kms_flip@2x-flip-vs-fences@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-hsw6/igt@kms_flip@2x-flip-vs-fences@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-glk3/igt@kms_flip@2x-plain-flip-ts-check@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-glk5/igt@kms_flip@2x-plain-flip-ts-check@bc-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-tglb2/igt@kms_flip@blocking-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-tglb2/igt@kms_flip@blocking-wf_vblank@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-kbl6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-kbl3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-iclb3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-hsw7/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-hsw6/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_create@forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-glk7/igt@gem_exec_create@forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-glk7/igt@gem_exec_create@forked.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-hsw2/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-hsw1/igt@i915_pm_rpm@pm-tiling.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-kbl1/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-kbl1/igt@i915_pm_rpm@pm-tiling.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-apl3/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-apl1/igt@i915_pm_rpm@pm-tiling.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-glk5/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-glk1/igt@i915_pm_rpm@pm-tiling.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-iclb2/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb5/igt@i915_pm_rpm@pm-tiling.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@alternate-sync-async-flip}:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-kbl2/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-kbl4/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-tglb7/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-tglb3/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-apl3/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-apl8/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-glk6/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-glk1/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-kbl4/igt@kms_flip_tiling@flip-to-yf-tiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-kbl7/igt@kms_flip_tiling@flip-to-yf-tiled.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-iclb6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-iclb6/igt@kms_psr@suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb2/igt@kms_psr@suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-accuracy-idle:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-tglb8/igt@kms_vblank@pipe-d-accuracy-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-tglb8/igt@kms_vblank@pipe-d-accuracy-idle.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@non-system-wide-paranoid:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-apl7/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-apl2/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-glk3/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-glk6/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-iclb6/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb2/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-kbl3/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-kbl7/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-tglb8/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-tglb6/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-iclb2/igt@perf@polling-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb4/igt@perf@polling-parameterized.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-hsw6/igt@perf@polling-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-hsw4/igt@perf@polling-parameterized.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-tglb6/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-tglb1/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade_with_suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-tglb2/igt@i915_pm_backlight@fade_with_suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-tglb6/igt@i915_pm_backlight@fade_with_suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-iclb6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110892">fdo#110892</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-tglb2/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-tglb3/igt@i915_pm_rpm@pm-tiling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-tglb1/igt@kms_flip@flip-vs-suspend@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-tglb2/igt@kms_flip@flip-vs-suspend@a-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-iclb6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-iclb2/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9252/shard-glk8/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/shard-glk5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>)</p>
</li>
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
<li>IGT: IGT_5830 -&gt; IGTPW_5123</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9252: bb8053708f1889f738f4247e84ef5e051e1e178d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5123: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/index.html<br />
  IGT_5830: 12d370cb57e0cfcb781c87ad9e15e68b17a1f41f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============3401429864483274873==--

--===============0281501891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0281501891==--
