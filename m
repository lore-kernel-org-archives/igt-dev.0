Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 12 Nov 2020 11:24:50 -0000
Message-ID: <160518029031.29794.15383701774656015274@emeril.freedesktop.org>
References: <20201112073523.25602-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20201112073523.25602-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgSW50cm9k?=
 =?utf-8?q?uce_IGT_allocator_=28rev9=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1865571702=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1865571702==
Content-Type: multipart/alternative;
 boundary="===============0799826824159482498=="

--===============0799826824159482498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce IGT allocator (rev9)
URL   : https://patchwork.freedesktop.org/series/82954/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9312_full -> IGTPW_5159_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5159_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5159_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5159_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-snb:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-snb7/igt@core_hotunplug@hotrebind-lateclose.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-snb4/igt@core_hotunplug@hotrebind-lateclose.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][3], [FAIL][4]) ([i915#1436] / [i915#2439] / [i915#483]) -> ([FAIL][5], [FAIL][6]) ([fdo#109271] / [i915#2439])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw6/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw1/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-hsw4/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-hsw8/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9312_full and IGTPW_5159_full:

### New IGT tests (33) ###

  * igt@api_intel_allocator@alloc-simple:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@api_intel_allocator@fork-simple-once:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@api_intel_allocator@fork-simple-stress:
    - Statuses : 7 pass(s)
    - Exec time: [5.40, 5.67] s

  * igt@api_intel_allocator@fork-simple-stress-signal:
    - Statuses : 7 pass(s)
    - Exec time: [5.41, 5.64] s

  * igt@api_intel_allocator@print:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@api_intel_allocator@random-allocator:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_allocator@random-allocator@basic:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@api_intel_allocator@random-allocator@parallel-one:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_allocator@reopen:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_allocator@reopen-fork:
    - Statuses : 7 pass(s)
    - Exec time: [3.24, 3.27] s

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
    - Statuses : 7 pass(s)
    - Exec time: [0.00] s

  * igt@api_intel_allocator@simple-allocator@parallel-one:
    - Statuses : 7 pass(s)
    - Exec time: [0.10, 0.24] s

  * igt@api_intel_allocator@simple-allocator@reserve:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@api_intel_allocator@simple-allocator@reuse:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@api_intel_allocator@two-level-inception:
    - Statuses : 7 pass(s)
    - Exec time: [5.40, 5.67] s

  * igt@api_intel_allocator@two-level-inception-interruptible:
    - Statuses : 7 pass(s)
    - Exec time: [5.41, 5.58] s

  * igt@api_intel_bb@add-remove-objects:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@api_intel_bb@blit-noreloc-keep-cache-random:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@api_intel_bb@blit-noreloc-purge-cache-random:
    - Statuses : 5 pass(s) 2 skip(s)
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
    - Exec time: [0.00] s

  * igt@api_intel_bb@reset-bb:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@sysfs_defaults@readonly:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_5159_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-noreloc-keep-cache:
    - shard-hsw:          [PASS][7] -> [SKIP][8] ([fdo#109271]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw4/igt@api_intel_bb@blit-noreloc-keep-cache.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-hsw4/igt@api_intel_bb@blit-noreloc-keep-cache.html
    - shard-snb:          [PASS][9] -> [SKIP][10] ([fdo#109271]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-snb4/igt@api_intel_bb@blit-noreloc-keep-cache.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-snb6/igt@api_intel_bb@blit-noreloc-keep-cache.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#118] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-glk8/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_workarounds@suspend-resume:
    - shard-hsw:          [PASS][13] -> [DMESG-WARN][14] ([i915#2637]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw8/igt@gem_workarounds@suspend-resume.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-hsw4/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_rpm@fences-dpms:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#1982]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl7/igt@i915_pm_rpm@fences-dpms.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-kbl4/igt@i915_pm_rpm@fences-dpms.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([i915#579])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb1/igt@i915_pm_rpm@modeset-lpsp.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-iclb3/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-glk3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][21] -> [FAIL][22] ([i915#96])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#1635] / [i915#1982]) +4 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl4/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-apl3/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][25] -> [FAIL][26] ([i915#2598])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-iclb:         [PASS][27] -> [INCOMPLETE][28] ([i915#1185])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - shard-tglb:         [PASS][29] -> [DMESG-WARN][30] ([i915#1982]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][31] -> [INCOMPLETE][32] ([i915#155]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html
    - shard-apl:          [PASS][33] -> [INCOMPLETE][34] ([i915#1635] / [i915#2635]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl7/igt@kms_hdr@bpc-switch-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-apl8/igt@kms_hdr@bpc-switch-suspend.html
    - shard-glk:          [PASS][35] -> [INCOMPLETE][36] ([i915#2635]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk6/igt@kms_hdr@bpc-switch-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-glk6/igt@kms_hdr@bpc-switch-suspend.html
    - shard-iclb:         [PASS][37] -> [INCOMPLETE][38] ([i915#1185] / [i915#1373])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb6/igt@kms_hdr@bpc-switch-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-iclb1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-iclb6/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@perf@invalid-create-userspace-config:
    - shard-kbl:          [PASS][41] -> [SKIP][42] ([fdo#109271] / [i915#1354]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl2/igt@perf@invalid-create-userspace-config.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-kbl1/igt@perf@invalid-create-userspace-config.html
    - shard-apl:          [PASS][43] -> [SKIP][44] ([fdo#109271] / [i915#1354] / [i915#1635]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl8/igt@perf@invalid-create-userspace-config.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-apl4/igt@perf@invalid-create-userspace-config.html
    - shard-glk:          [PASS][45] -> [SKIP][46] ([fdo#109271] / [i915#1354]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk5/igt@perf@invalid-create-userspace-config.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-glk7/igt@perf@invalid-create-userspace-config.html

  * igt@perf@invalid-open-flags:
    - shard-tglb:         [PASS][47] -> [SKIP][48] ([i915#1354]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb1/igt@perf@invalid-open-flags.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-tglb7/igt@perf@invalid-open-flags.html
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([i915#1354]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb1/igt@perf@invalid-open-flags.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-iclb3/igt@perf@invalid-open-flags.html

  * igt@perf@polling-parameterized:
    - shard-glk:          [PASS][51] -> [FAIL][52] ([i915#1542])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk5/igt@perf@polling-parameterized.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-glk9/igt@perf@polling-parameterized.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          [DMESG-WARN][53] ([i915#2635]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk4/igt@gem_eio@in-flight-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-glk5/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_create@basic:
    - shard-snb:          [FAIL][55] ([i915#1037]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-snb7/igt@gem_exec_create@basic.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-snb5/igt@gem_exec_create@basic.html

  * igt@gem_exec_create@forked:
    - shard-glk:          [FAIL][57] -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk8/igt@gem_exec_create@forked.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-glk9/igt@gem_exec_create@forked.html
    - shard-hsw:          [FAIL][59] -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw8/igt@gem_exec_create@forked.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-hsw6/igt@gem_exec_create@forked.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-hsw:          [FAIL][61] ([i915#1888]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw8/igt@gem_userptr_blits@unsync-unmap-cycles.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-hsw5/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * {igt@kms_async_flips@alternate-sync-async-flip}:
    - shard-tglb:         [FAIL][63] ([i915#2521]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb1/igt@kms_async_flips@alternate-sync-async-flip.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-tglb6/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge:
    - shard-glk:          [DMESG-WARN][65] ([i915#1982]) -> [PASS][66] +7 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-toggle:
    - shard-apl:          [DMESG-WARN][67] ([i915#1635] / [i915#1982]) -> [PASS][68] +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl7/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-apl7/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][69] ([i915#1982]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl4/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-kbl2/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-snb:          [FAIL][71] ([i915#2546]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-snb7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-snb6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [DMESG-WARN][73] ([i915#1982]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_plane@plane-position-hole-pipe-a-planes:
    - shard-apl:          [FAIL][75] ([i915#1635] / [i915#2472]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl6/igt@kms_plane@plane-position-hole-pipe-a-planes.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-apl2/igt@kms_plane@plane-position-hole-pipe-a-planes.html
    - shard-kbl:          [FAIL][77] ([i915#2472]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl7/igt@kms_plane@plane-position-hole-pipe-a-planes.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-kbl4/igt@kms_plane@plane-position-hole-pipe-a-planes.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][79] ([fdo#109642] / [fdo#111068]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb7/igt@kms_psr2_su@page_flip.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb3/igt@kms_psr@psr2_suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@kms_vblank@pipe-c-query-forked-busy:
    - shard-hsw:          [DMESG-WARN][83] ([i915#1982]) -> [PASS][84] +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw6/igt@kms_vblank@pipe-c-query-forked-busy.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-hsw4/igt@kms_vblank@pipe-c-query-forked-busy.html
    - shard-iclb:         [DMESG-WARN][85] ([i915#1982]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb7/igt@kms_vblank@pipe-c-query-forked-busy.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-iclb3/igt@kms_vblank@pipe-c-query-forked-busy.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-iclb:         [INCOMPLETE][87] ([i915#1185]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-kbl:          [INCOMPLETE][89] ([i915#155]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-hsw:          [INCOMPLETE][91] ([i915#2637]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-glk:          [INCOMPLETE][93] ([i915#2635]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-glk2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-apl:          [INCOMPLETE][95] ([i915#1635] / [i915#2635]) -> [PASS][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-apl4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-tglb:         [SKIP][97] ([i915#1354]) -> [PASS][98] +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb7/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-tglb5/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@perf@invalid-oa-exponent:
    - shard-hsw:          [SKIP][99] ([fdo#109271]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw8/igt@perf@invalid-oa-exponent.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-hsw4/igt@perf@invalid-oa-exponent.html
    - shard-iclb:         [SKIP][101] ([i915#1354]) -> [PASS][102] +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb8/igt@perf@invalid-oa-exponent.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-iclb4/igt@perf@invalid-oa-exponent.html

  * igt@perf@non-system-wide-paranoid:
    - shard-apl:          [SKIP][103] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][104] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl8/igt@perf@non-system-wide-paranoid.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-apl3/igt@perf@non-system-wide-paranoid.html
    - shard-glk:          [SKIP][105] ([fdo#109271] / [i915#1354]) -> [PASS][106] +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk8/igt@perf@non-system-wide-paranoid.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-glk7/igt@perf@non-system-wide-paranoid.html
    - shard-kbl:          [SKIP][107] ([fdo#109271] / [i915#1354]) -> [PASS][108] +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl6/igt@perf@non-system-wide-paranoid.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-kbl2/igt@perf@non-system-wide-paranoid.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-hsw:          [WARN][109] ([i915#2283]) -> [FAIL][110] ([i915#2644])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw4/igt@core_hotunplug@hotrebind-lateclose.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-hsw4/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@gem_eio@in-flight-suspend:
    - shard-tglb:         [INCOMPLETE][111] ([i915#1436] / [i915#456]) -> [DMESG-WARN][112] ([i915#2411]) +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb7/igt@gem_eio@in-flight-suspend.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-tglb6/igt@gem_eio@in-flight-suspend.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-tglb:         [DMESG-WARN][113] ([i915#2411]) -> [SKIP][114] ([i915#579])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb6/igt@i915_pm_rpm@modeset-lpsp.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-tglb7/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [TIMEOUT][115] ([i915#1319] / [i915#1635]) -> [FAIL][116] ([fdo#110321] / [i915#1635])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl1/igt@kms_content_protection@srm.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-apl3/igt@kms_content_protection@srm.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-tglb:         [DMESG-WARN][117] ([i915#2411]) -> [INCOMPLETE][118] ([i915#1436] / [i915#456])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-apl:          [SKIP][119] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [SKIP][120] ([fdo#109271] / [i915#1635])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl8/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-apl2/igt@perf@gen12-unprivileged-single-ctx-counters.html
    - shard-glk:          [SKIP][121] ([fdo#109271] / [i915#1354]) -> [SKIP][122] ([fdo#109271])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-glk8/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-glk4/igt@perf@gen12-unprivileged-single-ctx-counters.html
    - shard-iclb:         [SKIP][123] ([i915#1354]) -> [SKIP][124] ([fdo#109289])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-iclb8/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-iclb5/igt@perf@gen12-unprivileged-single-ctx-counters.html
    - shard-kbl:          [SKIP][125] ([fdo#109271] / [i915#1354]) -> [SKIP][126] ([fdo#109271])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl6/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-kbl4/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][127], [FAIL][128]) ([i915#1436] / [i915#1611] / [i915#1814] / [i915#2439] / [i915#483]) -> [FAIL][129] ([i915#1611] / [i915#2439])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl1/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl3/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-kbl7/igt@runner@aborted.html
    - shard-apl:          ([FAIL][130], [FAIL][131], [FAIL][132]) ([i915#1610] / [i915#1611] / [i915#1635] / [i915#1814] / [i915#2439]) -> ([FAIL][133], [FAIL][134], [FAIL][135]) ([fdo#109271] / [i915#1611] / [i915#1635] / [i915#1814] / [i915#2439])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl8/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl3/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl2/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-apl8/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-apl8/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-apl3/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][136], [FAIL][137], [FAIL][138]) ([i915#1602] / [i915#2439]) -> ([FAIL][139], [FAIL][140]) ([i915#1814] / [i915#2439] / [i915#456])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb8/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb7/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb1/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-tglb7/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-tglb7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1037]: https://gitlab.freedesktop.org/drm/intel/issues/1037
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1373]: https://gitlab.freedesktop.org/drm/intel/issues/1373
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https:/

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/index.html

--===============0799826824159482498==
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
<tr><td><b>Series:</b></td><td>Introduce IGT allocator (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/82954/">https://patchwork.freedesktop.org/series/82954/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5159/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5159/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9312_full -&gt; IGTPW_5159_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5159_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5159_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5159=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@hotrebind-lateclose:<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-snb7/igt@core_hotunplug@hotrebind-lateclose.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/sha=
rd-snb4/igt@core_hotunplug@hotrebind-lateclose.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>shard-hsw:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_9312/shard-hsw6/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-hsw1/igt@runner@abor=
ted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1436">i915#1436</a> / [i915#2439] / [i915#483]) -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-hsw4/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5159/shard-hsw8/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / [i915#2439])<=
/li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9312_full and IGTPW_5159_f=
ull:</p>
<h3>New IGT tests (33)</h3>
<ul>
<li>
<p>igt@api_intel_allocator@alloc-simple:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
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
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [5.40, 5.67] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@fork-simple-stress-signal:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [5.41, 5.64] s</li>
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
<li>Exec time: [0.0, 0.01] s</li>
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
<li>Exec time: [3.24, 3.27] s</li>
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
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@simple-allocator@parallel-one:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.10, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@simple-allocator@reserve:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@simple-allocator@reuse:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@two-level-inception:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [5.40, 5.67] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@two-level-inception-interruptible:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [5.41, 5.58] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@add-remove-objects:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
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
<li>Statuses : 5 pass(s) 2 skip(s)</li>
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
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@reset-bb:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_defaults@readonly:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5159_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-noreloc-keep-cache:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-hsw4/igt@api_intel_bb@blit-noreloc-keep-cache.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/sh=
ard-hsw4/igt@api_intel_bb@blit-noreloc-keep-cache.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
+1 similar issue</p>
</li>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-snb4/igt@api_intel_bb@blit-noreloc-keep-cache.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/sh=
ard-snb6/igt@api_intel_bb@blit-noreloc-keep-cache.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
+1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
59/shard-glk8/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#=
118</a> / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-hsw8/igt@gem_workarounds@suspend-resume.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-h=
sw4/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a> ([i915#2637]) +=
1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences-dpms:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-kbl7/igt@i915_pm_rpm@fences-dpms.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-kbl4/igt=
@i915_pm_rpm@fences-dpms.html">DMESG-WARN</a> ([i915#1982]) +3 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-iclb1/igt@i915_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-iclb3/=
igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#579])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-glk4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5159/shard-glk3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">DMESG-=
WARN</a> ([i915#1982]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5159/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.ht=
ml">FAIL</a> ([i915#96])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-apl4/igt@kms_cursor_legacy@basic-flip-before-cursor-lega=
cy.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5159/shard-apl3/igt@kms_cursor_legacy@basic-flip-before-cursor-legac=
y.html">DMESG-WARN</a> (<a href=3D"https:/">i915#1635</a> / [i915#1982]) +4=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_515=
9/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> ([i=
915#2598])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-suspend.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/=
shard-iclb3/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pr=
i-shrfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5159/shard-tglb6/igt@kms_frontbuffer_tracking@fbc=
psr-1p-offscren-pri-shrfb-draw-mmap-cpu.html">DMESG-WARN</a> ([i915#1982]) =
+2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-kbl6/i=
gt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/155">i915#155</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-apl7/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-apl8/i=
gt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</a> (<a href=3D"https:/">i91=
5#1635</a> / [i915#2635]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-glk6/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-glk6/i=
gt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</a> ([i915#2635]) +1 similar=
 issue</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-iclb6/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-iclb1=
/igt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-=
iclb6/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar =
issue</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-create-userspace-config:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-kbl2/igt@perf@invalid-create-userspace-config.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/sh=
ard-kbl1/igt@perf@invalid-create-userspace-config.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354=
</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-apl8/igt@perf@invalid-create-userspace-config.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/sh=
ard-apl4/igt@perf@invalid-create-userspace-config.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354=
</a> / <a href=3D"https:/">i915#1635</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-glk5/igt@perf@invalid-create-userspace-config.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/sh=
ard-glk7/igt@perf@invalid-create-userspace-config.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354=
</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-open-flags:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-tglb1/igt@perf@invalid-open-flags.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-tglb7/ig=
t@perf@invalid-open-flags.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1354">i915#1354</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-iclb1/igt@perf@invalid-open-flags.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-iclb3/ig=
t@perf@invalid-open-flags.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1354">i915#1354</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-glk5/igt@perf@polling-parameterized.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-glk9/=
igt@perf@polling-parameterized.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-glk4/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> =
([i915#2635]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5159/shard-glk5/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@basic:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-snb7/igt@gem_exec_create@basic.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1037">i915#1037</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-sn=
b5/igt@gem_exec_create@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@forked:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-glk8/igt@gem_exec_create@forked.html">FAIL</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-glk9/igt@g=
em_exec_create@forked.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-hsw8/igt@gem_exec_create@forked.html">FAIL</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-hsw6/igt@g=
em_exec_create@forked.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-hsw8/igt@gem_userptr_blits@unsync-unmap-cycles.html">FAI=
L</a> ([i915#1888]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5159/shard-hsw5/igt@gem_userptr_blits@unsync-unmap-cycles.html">PA=
SS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@alternate-sync-async-flip}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-tglb1/igt@kms_async_flips@alternate-sync-async-flip.html=
">FAIL</a> ([i915#2521]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5159/shard-tglb6/igt@kms_async_flips@alternate-sync-async-fli=
p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.ht=
ml">DMESG-WARN</a> ([i915#1982]) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5159/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-64x64=
-right-edge.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-toggle:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-apl7/igt@kms_cursor_legacy@short-flip-before-cursor-togg=
le.html">DMESG-WARN</a> (<a href=3D"https:/">i915#1635</a> / [i915#1982]) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-a=
pl7/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html">PASS</a> +3=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-kbl4/igt@kms_flip@blocking-absolute-wf_vblank-interrupti=
ble@a-dp1.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-kbl2/igt@kms_flip@blocking-abs=
olute-wf_vblank-interruptible@a-dp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-snb7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-c=
pu.html">FAIL</a> ([i915#2546]) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5159/shard-snb6/igt@kms_frontbuffer_tracking@fbc-rgb56=
5-draw-mmap-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-stridechange.html=
">DMESG-WARN</a> ([i915#1982]) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5159/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-strid=
echange.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-pipe-a-planes:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-apl6/igt@kms_plane@plane-position-hole-pipe-a-planes.html=
">FAIL</a> (<a href=3D"https:/">i915#1635</a> / [i915#2472]) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-apl2/igt@kms_=
plane@plane-position-hole-pipe-a-planes.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-kbl7/igt@kms_plane@plane-position-hole-pipe-a-planes.html=
">FAIL</a> ([i915#2472]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5159/shard-kbl4/igt@kms_plane@plane-position-hole-pipe-a-plan=
es.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-iclb7/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> /=
 <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#1110=
68</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_515=
9/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-iclb3/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-=
iclb2/igt@kms_psr@psr2_suspend.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-forked-busy:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-hsw6/igt@kms_vblank@pipe-c-query-forked-busy.html">DMESG-=
WARN</a> ([i915#1982]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5159/shard-hsw4/igt@kms_vblank@pipe-c-query-forked-busy.html">P=
ASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-iclb7/igt@kms_vblank@pipe-c-query-forked-busy.html">DMESG=
-WARN</a> ([i915#1982]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5159/shard-iclb3/igt@kms_vblank@pipe-c-query-forked-busy.html"=
>PASS</a> +1 similar issue</p>
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
e/drm-tip/IGTPW_5159/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-dpms=
-suspend.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/155">i915#155</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5159/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-dpms-sus=
pend.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.h=
tml">INCOMPLETE</a> ([i915#2637]) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5159/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuatio=
n-dpms-suspend.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-glk2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.h=
tml">INCOMPLETE</a> ([i915#2635]) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5159/shard-glk2/igt@kms_vblank@pipe-c-ts-continuatio=
n-dpms-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.h=
tml">INCOMPLETE</a> (<a href=3D"https:/">i915#1635</a> / [i915#2635]) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-apl4/=
igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">PASS</a> +1 simila=
r issue</p>
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
p/IGTPW_5159/shard-tglb5/igt@perf@gen12-unprivileged-single-ctx-counters.ht=
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
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-=
hsw4/igt@perf@invalid-oa-exponent.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-iclb8/igt@perf@invalid-oa-exponent.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-i=
clb4/igt@perf@invalid-oa-exponent.html">PASS</a> +1 similar issue</p>
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
#1354</a> / <a href=3D"https:/">i915#1635</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-apl3/igt@perf@non-system-wid=
e-paranoid.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-glk8/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915=
#1354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5159/shard-glk7/igt@perf@non-system-wide-paranoid.html">PASS</a> +1 similar=
 issue</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-kbl6/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915=
#1354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5159/shard-kbl2/igt@perf@non-system-wide-paranoid.html">PASS</a> +1 similar=
 issue</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-hsw4/igt@core_hotunplug@hotrebind-lateclose.html">WARN</=
a> ([i915#2283]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5159/shard-hsw4/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a>=
 ([i915#2644])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-tglb7/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#143=
6</a> / [i915#456]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5159/shard-tglb6/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a=
> ([i915#2411]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-tglb6/igt@i915_pm_rpm@modeset-lpsp.html">DMESG-WARN</a> =
([i915#2411]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5159/shard-tglb7/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#579]=
)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-apl1/igt@kms_content_protection@srm.html">TIMEOUT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</=
a> / <a href=3D"https:/">i915#1635</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5159/shard-apl3/igt@kms_content_protection@srm=
.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110321">fdo#110321</a> / <a href=3D"https:/">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-suspend.html">DME=
SG-WARN</a> ([i915#2411]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5159/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-suspend.ht=
ml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1436">i915#1436</a> / [i915#456])</li>
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
ues/1354">i915#1354</a> / <a href=3D"https:/">i915#1635</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-apl2/igt@perf=
@gen12-unprivileged-single-ctx-counters.html">SKIP</a> (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"=
https:/">i915#1635</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-glk8/igt@perf@gen12-unprivileged-single-ctx-counters.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1354">i915#1354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5159/shard-glk4/igt@perf@gen12-unprivileged-single-ctx-counte=
rs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-iclb8/igt@perf@gen12-unprivileged-single-ctx-counters.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/135=
4">i915#1354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5159/shard-iclb5/igt@perf@gen12-unprivileged-single-ctx-counters.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
89">fdo#109289</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9312/shard-kbl6/igt@perf@gen12-unprivileged-single-ctx-counters.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1354">i915#1354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5159/shard-kbl4/igt@perf@gen12-unprivileged-single-ctx-counte=
rs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-kbl3/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1611">i915#1611</a> / [i915#1814] / [i915#2439] / [i915#483]) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-kbl=
7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/1611">i915#1611</a> / [i915#2439])</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-apl3/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9312/shard-apl2/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=
=3D"https:/">i915#1635</a> / [i915#1814] / [i915#2439]) -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-apl8/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5159/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/shard-apl3/igt@runner@aborted.h=
tml">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1611">i915#1611</a> / <a href=3D"https:/">i915#1635</a> / [i915#181=
4] / [i915#2439])</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9312/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9312/shard-tglb7/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_9312/shard-tglb1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / [i915#2439]=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5159/sha=
rd-tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5159/shard-tglb7/igt@runner@aborted.html">FAIL</=
a>) ([i915#1814] / [i915#2439] / [i915#456])</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============0799826824159482498==--

--===============1865571702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1865571702==--
