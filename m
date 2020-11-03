Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 03 Nov 2020 05:29:23 -0000
Message-ID: <160438136373.25741.14206065359350865902@emeril.freedesktop.org>
References: <20201102195503.22581-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20201102195503.22581-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgSW50cm9k?=
 =?utf-8?q?uce_IGT_allocator_=28rev7=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1270598562=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1270598562==
Content-Type: multipart/alternative;
 boundary="===============0736300379539635936=="

--===============0736300379539635936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce IGT allocator (rev7)
URL   : https://patchwork.freedesktop.org/series/82954/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9247_full -> IGTPW_5118_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5118_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5118_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5118_full:

### IGT changes ###

#### Possible regressions ####

  * igt@api_intel_bb@check-canonical:
    - shard-iclb:         [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb1/igt@api_intel_bb@check-canonical.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb6/igt@api_intel_bb@check-canonical.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-snb:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-snb4/igt@gem_userptr_blits@coherency-sync.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-snb7/igt@gem_userptr_blits@coherency-sync.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][5] -> [INCOMPLETE][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-glk:          [PASS][7] -> [INCOMPLETE][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> ([FAIL][9], [FAIL][10]) ([fdo#109271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-hsw6/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-hsw4/igt@runner@aborted.html

  
#### Warnings ####

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:
    - shard-tglb:         [DMESG-WARN][11] ([i915#2411]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-tglb8/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-tglb5/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_parallel@userptr@vcs0}:
    - shard-hsw:          [PASS][13] -> [FAIL][14] +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-hsw1/igt@gem_exec_parallel@userptr@vcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-hsw6/igt@gem_exec_parallel@userptr@vcs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9247_full and IGTPW_5118_full:

### New IGT tests (32) ###

  * igt@api_intel_allocator@alloc-simple:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@api_intel_allocator@fork-simple-once:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@api_intel_allocator@fork-simple-stress:
    - Statuses : 5 pass(s)
    - Exec time: [5.42, 5.57] s

  * igt@api_intel_allocator@fork-simple-stress-signal:
    - Statuses : 7 pass(s)
    - Exec time: [5.41, 5.57] s

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
    - Exec time: [0.00, 0.02] s

  * igt@api_intel_allocator@reopen-fork:
    - Statuses : 7 pass(s)
    - Exec time: [3.24, 3.27] s

  * igt@api_intel_allocator@reserve:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@api_intel_allocator@reserve-simple:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@api_intel_allocator@reuse:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@api_intel_allocator@simple-allocator:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_allocator@simple-allocator@basic:
    - Statuses : 7 pass(s)
    - Exec time: [0.00] s

  * igt@api_intel_allocator@simple-allocator@parallel-one:
    - Statuses : 7 pass(s)
    - Exec time: [0.10, 0.23] s

  * igt@api_intel_allocator@simple-allocator@reserve:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@api_intel_allocator@simple-allocator@reuse:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@api_intel_allocator@two-level-inception:
    - Statuses : 7 pass(s)
    - Exec time: [5.40, 5.62] s

  * igt@api_intel_allocator@two-level-inception-interruptible:
    - Statuses : 7 pass(s)
    - Exec time: [5.42, 5.68] s

  * igt@api_intel_bb@add-remove-objects:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@api_intel_bb@blit-noreloc-keep-cache-random:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@api_intel_bb@blit-noreloc-purge-cache-random:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@api_intel_bb@destroy-bb:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

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
    - Exec time: [0.00, 0.02] s

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

  Here are the changes found in IGTPW_5118_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-noreloc-keep-cache:
    - shard-hsw:          [PASS][15] -> [SKIP][16] ([fdo#109271]) +5 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-hsw6/igt@api_intel_bb@blit-noreloc-keep-cache.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-hsw6/igt@api_intel_bb@blit-noreloc-keep-cache.html
    - shard-snb:          [PASS][17] -> [SKIP][18] ([fdo#109271]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-snb4/igt@api_intel_bb@blit-noreloc-keep-cache.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-snb2/igt@api_intel_bb@blit-noreloc-keep-cache.html

  * igt@api_intel_bb@check-canonical:
    - shard-kbl:          [PASS][19] -> [SKIP][20] ([fdo#109271]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-kbl3/igt@api_intel_bb@check-canonical.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-kbl1/igt@api_intel_bb@check-canonical.html
    - shard-apl:          [PASS][21] -> [SKIP][22] ([fdo#109271] / [i915#1635]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-apl7/igt@api_intel_bb@check-canonical.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-apl4/igt@api_intel_bb@check-canonical.html
    - shard-glk:          [PASS][23] -> [SKIP][24] ([fdo#109271]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk1/igt@api_intel_bb@check-canonical.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk6/igt@api_intel_bb@check-canonical.html

  * igt@gem_exec_create@madvise:
    - shard-hsw:          [PASS][25] -> [FAIL][26] ([i915#1888])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-hsw4/igt@gem_exec_create@madvise.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-hsw6/igt@gem_exec_create@madvise.html

  * igt@gem_exec_gttfill@all:
    - shard-glk:          [PASS][27] -> [DMESG-WARN][28] ([i915#118] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk4/igt@gem_exec_gttfill@all.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk8/igt@gem_exec_gttfill@all.html

  * igt@i915_pm_backlight@fade_with_suspend:
    - shard-iclb:         [PASS][29] -> [INCOMPLETE][30] ([i915#1185])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb4/igt@i915_pm_backlight@fade_with_suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb1/igt@i915_pm_backlight@fade_with_suspend.html

  * igt@i915_pm_rpm@pm-caching:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([i915#579])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb4/igt@i915_pm_rpm@pm-caching.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb6/igt@i915_pm_rpm@pm-caching.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:
    - shard-apl:          [PASS][33] -> [DMESG-WARN][34] ([i915#1635] / [i915#1982]) +6 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-apl1/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-apl7/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [PASS][35] -> [FAIL][36] ([i915#2598])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#79])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html

  * igt@kms_flip@nonexisting-fb-interruptible@a-vga1:
    - shard-hsw:          [PASS][39] -> [DMESG-WARN][40] ([i915#1982]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-hsw1/igt@kms_flip@nonexisting-fb-interruptible@a-vga1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-hsw1/igt@kms_flip@nonexisting-fb-interruptible@a-vga1.html

  * igt@kms_flip@plain-flip-ts-check@c-hdmi-a1:
    - shard-glk:          [PASS][41] -> [FAIL][42] ([i915#2122])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk6/igt@kms_flip@plain-flip-ts-check@c-hdmi-a1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk7/igt@kms_flip@plain-flip-ts-check@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglb:         [PASS][43] -> [DMESG-WARN][44] ([i915#1982]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-apl:          [PASS][45] -> [INCOMPLETE][46] ([i915#1635])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
    - shard-kbl:          [PASS][47] -> [INCOMPLETE][48] ([i915#155])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-glk:          [PASS][49] -> [DMESG-WARN][50] ([i915#1982]) +7 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109441]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - shard-kbl:          [PASS][53] -> [DMESG-WARN][54] ([i915#1982]) +4 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-kbl2/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-kbl6/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:
    - shard-iclb:         [PASS][55] -> [SKIP][56] ([fdo#109278])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb8/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb6/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-tglb:         [PASS][57] -> [SKIP][58] ([i915#1354]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-tglb3/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-tglb8/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@perf@invalid-oa-format-id:
    - shard-kbl:          [PASS][59] -> [SKIP][60] ([fdo#109271] / [i915#1354])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-kbl4/igt@perf@invalid-oa-format-id.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-kbl6/igt@perf@invalid-oa-format-id.html
    - shard-iclb:         [PASS][61] -> [SKIP][62] ([i915#1354])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb2/igt@perf@invalid-oa-format-id.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb5/igt@perf@invalid-oa-format-id.html
    - shard-glk:          [PASS][63] -> [SKIP][64] ([fdo#109271] / [i915#1354])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk7/igt@perf@invalid-oa-format-id.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk6/igt@perf@invalid-oa-format-id.html
    - shard-apl:          [PASS][65] -> [SKIP][66] ([fdo#109271] / [i915#1354] / [i915#1635])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-apl2/igt@perf@invalid-oa-format-id.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-apl6/igt@perf@invalid-oa-format-id.html

  
#### Possible fixes ####

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-snb:          [FAIL][67] -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-snb7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-snb4/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pipe_control_store_loop@fresh-buffer:
    - shard-tglb:         [INCOMPLETE][69] -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-tglb1/igt@gem_pipe_control_store_loop@fresh-buffer.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-tglb5/igt@gem_pipe_control_store_loop@fresh-buffer.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [WARN][71] ([i915#1519]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-hsw:          [SKIP][73] ([fdo#109271]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-hsw6/igt@i915_pm_rpm@pm-tiling.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-hsw6/igt@i915_pm_rpm@pm-tiling.html
    - shard-kbl:          [SKIP][75] ([fdo#109271]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-kbl6/igt@i915_pm_rpm@pm-tiling.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-kbl7/igt@i915_pm_rpm@pm-tiling.html
    - shard-apl:          [SKIP][77] ([fdo#109271] / [i915#1635]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-apl6/igt@i915_pm_rpm@pm-tiling.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-apl4/igt@i915_pm_rpm@pm-tiling.html
    - shard-glk:          [SKIP][79] ([fdo#109271]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk4/igt@i915_pm_rpm@pm-tiling.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk8/igt@i915_pm_rpm@pm-tiling.html
    - shard-iclb:         [SKIP][81] ([i915#579]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb7/igt@i915_pm_rpm@pm-tiling.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb1/igt@i915_pm_rpm@pm-tiling.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-glk:          [DMESG-WARN][83] ([i915#1982]) -> [PASS][84] +6 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk3/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk3/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled:
    - shard-snb:          [FAIL][85] ([i915#54]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-snb7/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-snb2/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][87] ([i915#79]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][89] ([i915#2122]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk9/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk9/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][91] ([i915#1982]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-hsw6/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-hsw1/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html

  * igt@kms_flip@dpms-vs-vblank-race@b-dp1:
    - shard-kbl:          [INCOMPLETE][93] -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-kbl6/igt@kms_flip@dpms-vs-vblank-race@b-dp1.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-kbl7/igt@kms_flip@dpms-vs-vblank-race@b-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][95] ([i915#2055]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_flip_tiling@flip-to-yf-tiled:
    - shard-kbl:          [DMESG-WARN][97] ([i915#1982]) -> [PASS][98] +3 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-kbl4/igt@kms_flip_tiling@flip-to-yf-tiled.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-kbl1/igt@kms_flip_tiling@flip-to-yf-tiled.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-iclb:         [DMESG-WARN][99] ([i915#1982]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb3/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-iclb:         [INCOMPLETE][101] ([i915#1185] / [i915#250]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][103] ([fdo#109441]) -> [PASS][104] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb8/igt@kms_psr@psr2_cursor_blt.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_psr@suspend:
    - shard-iclb:         [INCOMPLETE][105] ([i915#1185]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb7/igt@kms_psr@suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb1/igt@kms_psr@suspend.html

  * igt@kms_vblank@pipe-b-wait-forked-busy-hang:
    - shard-apl:          [DMESG-WARN][107] ([i915#1635] / [i915#1982]) -> [PASS][108] +4 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-apl1/igt@kms_vblank@pipe-b-wait-forked-busy-hang.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-apl1/igt@kms_vblank@pipe-b-wait-forked-busy-hang.html

  * igt@kms_vblank@pipe-d-accuracy-idle:
    - shard-tglb:         [DMESG-WARN][109] ([i915#1982]) -> [PASS][110] +2 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-tglb2/igt@kms_vblank@pipe-d-accuracy-idle.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-tglb3/igt@kms_vblank@pipe-d-accuracy-idle.html

  * igt@perf@non-system-wide-paranoid:
    - shard-apl:          [SKIP][111] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-apl3/igt@perf@non-system-wide-paranoid.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-apl2/igt@perf@non-system-wide-paranoid.html
    - shard-glk:          [SKIP][113] ([fdo#109271] / [i915#1354]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk1/igt@perf@non-system-wide-paranoid.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk4/igt@perf@non-system-wide-paranoid.html
    - shard-iclb:         [SKIP][115] ([i915#1354]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb7/igt@perf@non-system-wide-paranoid.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb4/igt@perf@non-system-wide-paranoid.html
    - shard-kbl:          [SKIP][117] ([fdo#109271] / [i915#1354]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-kbl7/igt@perf@non-system-wide-paranoid.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-kbl4/igt@perf@non-system-wide-paranoid.html
    - shard-tglb:         [SKIP][119] ([i915#1354]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-tglb2/igt@perf@non-system-wide-paranoid.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-tglb7/igt@perf@non-system-wide-paranoid.html

  
#### Warnings ####

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         [SKIP][121] ([fdo#111644] / [i915#1397] / [i915#2411]) -> [SKIP][122] ([i915#579])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-tglb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-tglb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@pm-caching:
    - shard-tglb:         [DMESG-WARN][123] ([i915#2411]) -> [SKIP][124] ([i915#579])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-tglb5/igt@i915_pm_rpm@pm-caching.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-tglb5/igt@i915_pm_rpm@pm-caching.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-tglb:         [SKIP][125] ([i915#579]) -> [DMESG-WARN][126] ([i915#2411])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-tglb3/igt@i915_pm_rpm@pm-tiling.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-tglb5/igt@i915_pm_rpm@pm-tiling.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][127] ([i915#1319] / [i915#1635]) -> [FAIL][128] ([fdo#110321] / [i915#1635])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-apl2/igt@kms_content_protection@lic.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-apl2/igt@kms_content_protection@lic.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [DMESG-FAIL][129] ([fdo#108145] / [i915#1635] / [i915#1982]) -> [FAIL][130] ([fdo#108145] / [i915#1635] / [i915#265])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-apl:          [SKIP][131] ([fdo#109271] / [i915#1635]) -> [SKIP][132] ([fdo#109271] / [i915#1354] / [i915#1635]) +1 similar issue
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-apl6/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-apl6/igt@perf@gen12-unprivileged-single-ctx-counters.html
    - shard-glk:          [SKIP][133] ([fdo#109271]) -> [SKIP][134] ([fdo#109271] / [i915#1354]) +1 similar issue
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk4/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk6/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-iclb:         [SKIP][135] ([fdo#109289]) -> [SKIP][136] ([i915#1354]) +1 similar issue
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb1/igt@perf@per-context-mode-unprivileged.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb3/igt@perf@per-context-mode-unprivileged.html
    - shard-kbl:          [SKIP][137] ([fdo#109271]) -> [SKIP][138] ([fdo#109271] / [i915#1354]) +1 similar issue
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-kbl3/igt@perf@per-context-mode-unprivileged.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-kbl3/igt@perf@per-context-mode-unprivileged.html
    - shard-tglb:         [SKIP][139] ([fdo#109289]) -> [SKIP][140] ([i915#1354])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-tglb1/igt@perf@per-context-mode-unprivileged.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-tglb2/igt@perf@per-context-mode-unprivileged.html

  * igt@runner@aborted:
    - shard-iclb:         [FAIL][141] ([i915#1814]) -> [FAIL][142] ([i915#1814] / [i915#2439])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb7/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/index.html

--===============0736300379539635936==
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
<tr><td><b>Series:</b></td><td>Introduce IGT allocator (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82954/">https://patchwork.freedesktop.org/series/82954/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9247_full -&gt; IGTPW_5118_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5118_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5118_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5118_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@api_intel_bb@check-canonical:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb1/igt@api_intel_bb@check-canonical.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb6/igt@api_intel_bb@check-canonical.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-snb4/igt@gem_userptr_blits@coherency-sync.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-snb7/igt@gem_userptr_blits@coherency-sync.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-hsw6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-hsw4/igt@runner@aborted.html">FAIL</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-tglb8/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html">DMESG-WARN</a> ([i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-tglb5/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@gem_exec_parallel@userptr@vcs0}:<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-hsw1/igt@gem_exec_parallel@userptr@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-hsw6/igt@gem_exec_parallel@userptr@vcs0.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9247_full and IGTPW_5118_full:</p>
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
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [5.42, 5.57] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@fork-simple-stress-signal:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [5.41, 5.57] s</li>
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
<li>Exec time: [0.00, 0.02] s</li>
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
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@reuse:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
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
<li>Exec time: [0.10, 0.23] s</li>
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
<li>Exec time: [5.40, 5.62] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@two-level-inception-interruptible:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [5.42, 5.68] s</li>
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
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@destroy-bb:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
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
<li>Exec time: [0.00, 0.02] s</li>
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
<p>Here are the changes found in IGTPW_5118_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-noreloc-keep-cache:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-hsw6/igt@api_intel_bb@blit-noreloc-keep-cache.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-hsw6/igt@api_intel_bb@blit-noreloc-keep-cache.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-snb4/igt@api_intel_bb@blit-noreloc-keep-cache.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-snb2/igt@api_intel_bb@blit-noreloc-keep-cache.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@check-canonical:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-kbl3/igt@api_intel_bb@check-canonical.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-kbl1/igt@api_intel_bb@check-canonical.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-apl7/igt@api_intel_bb@check-canonical.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-apl4/igt@api_intel_bb@check-canonical.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#1635]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk1/igt@api_intel_bb@check-canonical.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk6/igt@api_intel_bb@check-canonical.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@madvise:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-hsw4/igt@gem_exec_create@madvise.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-hsw6/igt@gem_exec_create@madvise.html">FAIL</a> ([i915#1888])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk4/igt@gem_exec_gttfill@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk8/igt@gem_exec_gttfill@all.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade_with_suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb4/igt@i915_pm_backlight@fade_with_suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb1/igt@i915_pm_backlight@fade_with_suspend.html">INCOMPLETE</a> ([i915#1185])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-caching:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb4/igt@i915_pm_rpm@pm-caching.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb6/igt@i915_pm_rpm@pm-caching.html">SKIP</a> ([i915#579])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-apl1/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-apl7/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html">DMESG-WARN</a> ([i915#1635] / [i915#1982]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> ([i915#2598])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@a-vga1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-hsw1/igt@kms_flip@nonexisting-fb-interruptible@a-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-hsw1/igt@kms_flip@nonexisting-fb-interruptible@a-vga1.html">DMESG-WARN</a> ([i915#1982]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk6/igt@kms_flip@plain-flip-ts-check@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk7/igt@kms_flip@plain-flip-ts-check@c-hdmi-a1.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html">DMESG-WARN</a> ([i915#1982]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">INCOMPLETE</a> ([i915#1635])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">INCOMPLETE</a> ([i915#155])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html">DMESG-WARN</a> ([i915#1982]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-kbl2/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-kbl6/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">DMESG-WARN</a> ([i915#1982]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb8/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb6/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.c">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-tglb3/igt@perf@gen12-unprivileged-single-ctx-counters.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-tglb8/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> ([i915#1354]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-oa-format-id:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-kbl4/igt@perf@invalid-oa-format-id.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-kbl6/igt@perf@invalid-oa-format-id.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#1354])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb2/igt@perf@invalid-oa-format-id.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb5/igt@perf@invalid-oa-format-id.html">SKIP</a> ([i915#1354])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk7/igt@perf@invalid-oa-format-id.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk6/igt@perf@invalid-oa-format-id.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#1354])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-apl2/igt@perf@invalid-oa-format-id.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-apl6/igt@perf@invalid-oa-format-id.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#1354] / [i915#1635])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-snb7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-snb4/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pipe_control_store_loop@fresh-buffer:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-tglb1/igt@gem_pipe_control_store_loop@fresh-buffer.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-tglb5/igt@gem_pipe_control_store_loop@fresh-buffer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-hsw6/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-hsw6/igt@i915_pm_rpm@pm-tiling.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-kbl6/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-kbl7/igt@i915_pm_rpm@pm-tiling.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-apl6/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#1635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-apl4/igt@i915_pm_rpm@pm-tiling.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk4/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk8/igt@i915_pm_rpm@pm-tiling.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb7/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb1/igt@i915_pm_rpm@pm-tiling.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk3/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk3/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-snb7/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html">FAIL</a> ([i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-snb2/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk9/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk9/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-hsw6/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-hsw1/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@b-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-kbl6/igt@kms_flip@dpms-vs-vblank-race@b-dp1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-kbl7/igt@kms_flip@dpms-vs-vblank-race@b-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> ([i915#2055]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-kbl4/igt@kms_flip_tiling@flip-to-yf-tiled.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-kbl1/igt@kms_flip_tiling@flip-to-yf-tiled.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb3/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">INCOMPLETE</a> ([i915#1185] / [i915#250]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb8/igt@kms_psr@psr2_cursor_blt.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb7/igt@kms_psr@suspend.html">INCOMPLETE</a> ([i915#1185]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb1/igt@kms_psr@suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-wait-forked-busy-hang:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-apl1/igt@kms_vblank@pipe-b-wait-forked-busy-hang.html">DMESG-WARN</a> ([i915#1635] / [i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-apl1/igt@kms_vblank@pipe-b-wait-forked-busy-hang.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-accuracy-idle:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-tglb2/igt@kms_vblank@pipe-d-accuracy-idle.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-tglb3/igt@kms_vblank@pipe-d-accuracy-idle.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@non-system-wide-paranoid:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-apl3/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#1354] / [i915#1635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-apl2/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk1/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#1354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk4/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb7/igt@perf@non-system-wide-paranoid.html">SKIP</a> ([i915#1354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb4/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-kbl7/igt@perf@non-system-wide-paranoid.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#1354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-kbl4/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-tglb2/igt@perf@non-system-wide-paranoid.html">SKIP</a> ([i915#1354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-tglb7/igt@perf@non-system-wide-paranoid.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-tglb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-tglb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#579])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-caching:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-tglb5/igt@i915_pm_rpm@pm-caching.html">DMESG-WARN</a> ([i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-tglb5/igt@i915_pm_rpm@pm-caching.html">SKIP</a> ([i915#579])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-tglb3/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-tglb5/igt@i915_pm_rpm@pm-tiling.html">DMESG-WARN</a> ([i915#2411])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-apl2/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319] / [i915#1635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-apl2/igt@kms_content_protection@lic.html">FAIL</a> ([fdo#110321] / [i915#1635])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / [i915#1635] / [i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / [i915#1635] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-apl6/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#1635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-apl6/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#1354] / [i915#1635]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-glk4/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-glk6/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#1354]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb1/igt@perf@per-context-mode-unprivileged.html">SKIP</a> ([fdo#109289]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb3/igt@perf@per-context-mode-unprivileged.html">SKIP</a> ([i915#1354]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-kbl3/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-kbl3/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#1354]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-tglb1/igt@perf@per-context-mode-unprivileged.html">SKIP</a> ([fdo#109289]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-tglb2/igt@perf@per-context-mode-unprivileged.html">SKIP</a> ([i915#1354])</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9247/shard-iclb7/igt@runner@aborted.html">FAIL</a> ([i915#1814]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5118/shard-iclb1/igt@runner@aborted.html">FAIL</a> ([i915#1814] / [i915#2439])</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============0736300379539635936==--

--===============1270598562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1270598562==--
