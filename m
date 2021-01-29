Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 29 Jan 2021 21:10:32 -0000
Message-ID: <161195463252.15524.15107769330778784087@emeril.freedesktop.org>
References: <20210129144454.121178-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210129144454.121178-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgSW50cm9k?=
 =?utf-8?q?uce_IGT_allocator_=28rev19=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1993762478=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1993762478==
Content-Type: multipart/alternative;
 boundary="===============3023869871227336608=="

--===============3023869871227336608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce IGT allocator (rev19)
URL   : https://patchwork.freedesktop.org/series/82954/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9700_full -> IGTPW_5445_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5445_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5445_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5445_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_pipe_control_store_loop@fresh-buffer:
    - shard-snb:          [PASS][1] -> [TIMEOUT][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-snb5/igt@gem_pipe_control_store_loop@fresh-buffer.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-snb7/igt@gem_pipe_control_store_loop@fresh-buffer.html
    - shard-tglb:         [PASS][3] -> [TIMEOUT][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-tglb2/igt@gem_pipe_control_store_loop@fresh-buffer.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb7/igt@gem_pipe_control_store_loop@fresh-buffer.html
    - shard-kbl:          [PASS][5] -> [TIMEOUT][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-kbl2/igt@gem_pipe_control_store_loop@fresh-buffer.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl2/igt@gem_pipe_control_store_loop@fresh-buffer.html
    - shard-hsw:          [PASS][7] -> [TIMEOUT][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-hsw4/igt@gem_pipe_control_store_loop@fresh-buffer.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-hsw7/igt@gem_pipe_control_store_loop@fresh-buffer.html
    - shard-glk:          [PASS][9] -> [TIMEOUT][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-glk4/igt@gem_pipe_control_store_loop@fresh-buffer.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-glk9/igt@gem_pipe_control_store_loop@fresh-buffer.html
    - shard-apl:          [PASS][11] -> [TIMEOUT][12] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-apl3/igt@gem_pipe_control_store_loop@fresh-buffer.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-apl7/igt@gem_pipe_control_store_loop@fresh-buffer.html

  * igt@gem_pipe_control_store_loop@reused-buffer:
    - shard-iclb:         [PASS][13] -> [TIMEOUT][14] +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-iclb8/igt@gem_pipe_control_store_loop@reused-buffer.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb5/igt@gem_pipe_control_store_loop@reused-buffer.html

  * igt@gem_render_copy_redux@flink:
    - shard-hsw:          [PASS][15] -> [CRASH][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-hsw4/igt@gem_render_copy_redux@flink.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-hsw8/igt@gem_render_copy_redux@flink.html
    - shard-kbl:          [PASS][17] -> [CRASH][18] +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-kbl7/igt@gem_render_copy_redux@flink.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl4/igt@gem_render_copy_redux@flink.html
    - shard-iclb:         NOTRUN -> [CRASH][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb7/igt@gem_render_copy_redux@flink.html

  * igt@gem_render_copy_redux@flink-interruptible:
    - shard-glk:          [PASS][20] -> [CRASH][21] +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-glk2/igt@gem_render_copy_redux@flink-interruptible.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-glk2/igt@gem_render_copy_redux@flink-interruptible.html
    - shard-apl:          [PASS][22] -> [CRASH][23] +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-apl1/igt@gem_render_copy_redux@flink-interruptible.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-apl8/igt@gem_render_copy_redux@flink-interruptible.html
    - shard-tglb:         [PASS][24] -> [CRASH][25] +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-tglb5/igt@gem_render_copy_redux@flink-interruptible.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb8/igt@gem_render_copy_redux@flink-interruptible.html
    - shard-snb:          [PASS][26] -> [CRASH][27] +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-snb4/igt@gem_render_copy_redux@flink-interruptible.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-snb6/igt@gem_render_copy_redux@flink-interruptible.html
    - shard-iclb:         [PASS][28] -> [CRASH][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-iclb6/igt@gem_render_copy_redux@flink-interruptible.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb8/igt@gem_render_copy_redux@flink-interruptible.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9700_full and IGTPW_5445_full:

### New IGT tests (37) ###

  * igt@api_intel_allocator@alloc-simple:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@api_intel_allocator@fork-simple-once:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@api_intel_allocator@fork-simple-stress:
    - Statuses : 7 pass(s)
    - Exec time: [5.41, 5.70] s

  * igt@api_intel_allocator@fork-simple-stress-signal:
    - Statuses : 7 pass(s)
    - Exec time: [5.42, 5.53] s

  * igt@api_intel_allocator@print:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@api_intel_allocator@random-allocator:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_allocator@random-allocator@basic:
    - Statuses : 6 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@api_intel_allocator@random-allocator@parallel-one:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.02] s

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
    - Exec time: [0.10, 0.22] s

  * igt@api_intel_allocator@simple-allocator@reserve:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@api_intel_allocator@simple-allocator@reuse:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@api_intel_allocator@two-level-inception:
    - Statuses : 7 pass(s)
    - Exec time: [5.41, 5.63] s

  * igt@api_intel_allocator@two-level-inception-interruptible:
    - Statuses : 7 pass(s)
    - Exec time: [5.42, 5.53] s

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

  * igt@gem_softpin@allocator-basic:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.30] s

  * igt@gem_softpin@allocator-basic-reserve:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@gem_softpin@allocator-fork:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.45] s

  * igt@gem_softpin@allocator-nopin:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.30] s

  * igt@gem_softpin@allocator-nopin-reserve:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.30] s

  

Known issues
------------

  Here are the changes found in IGTPW_5445_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-noreloc-keep-cache:
    - shard-hsw:          [PASS][30] -> [SKIP][31] ([fdo#109271]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-hsw1/igt@api_intel_bb@blit-noreloc-keep-cache.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-hsw7/igt@api_intel_bb@blit-noreloc-keep-cache.html
    - shard-snb:          [PASS][32] -> [SKIP][33] ([fdo#109271]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-snb7/igt@api_intel_bb@blit-noreloc-keep-cache.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-snb7/igt@api_intel_bb@blit-noreloc-keep-cache.html

  * igt@gem_ctx_persistence@engines-queued:
    - shard-hsw:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#1099]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-hsw8/igt@gem_ctx_persistence@engines-queued.html

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#1099])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-snb6/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-apl:          NOTRUN -> [SKIP][36] ([fdo#109271]) +50 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-apl8/igt@gem_ctx_sseu@invalid-args.html
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#280])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb8/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][38] -> [FAIL][39] ([i915#2846])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-kbl7/igt@gem_exec_fair@basic-deadline.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl7/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][40] ([i915#2842])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-glk8/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         [PASS][41] -> [FAIL][42] ([i915#2842])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html
    - shard-iclb:         [PASS][43] -> [FAIL][44] ([i915#2842])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-iclb7/igt@gem_exec_fair@basic-pace@bcs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb4/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-kbl:          [PASS][45] -> [FAIL][46] ([i915#2842])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl2/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][47] ([i915#2842])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][48] -> [FAIL][49] ([i915#2842]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@no-vebox:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109283])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb4/igt@gem_exec_params@no-vebox.html
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#109283])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb3/igt@gem_exec_params@no-vebox.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [PASS][52] -> [DMESG-WARN][53] ([i915#118] / [i915#95])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-glk9/igt@gem_exec_whisper@basic-queues-forked-all.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_pread@exhaustion:
    - shard-hsw:          NOTRUN -> [WARN][54] ([i915#2658])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-hsw1/igt@gem_pread@exhaustion.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([i915#1317]) +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb2/igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:
    - shard-snb:          NOTRUN -> [SKIP][56] ([fdo#109271]) +60 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-snb4/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html
    - shard-kbl:          NOTRUN -> [SKIP][57] ([fdo#109271]) +78 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl7/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@wc:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#1317]) +3 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb6/igt@gem_userptr_blits@mmap-offset-invalidate-active@wc.html

  * igt@gem_userptr_blits@readonly-mmap-unsync@wb:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#1704]) +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb2/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html
    - shard-iclb:         NOTRUN -> [SKIP][60] ([i915#1704]) +3 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb3/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109289]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb6/igt@gen7_exec_parse@bitmasks.html
    - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#109289]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb7/igt@gen7_exec_parse@bitmasks.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#109506] / [i915#2411])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb5/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109293] / [fdo#109506])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][65] -> [INCOMPLETE][66] ([i915#636])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-kbl1/igt@i915_suspend@forcewake.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl2/igt@i915_suspend@forcewake.html

  * igt@i915_suspend@sysfs-reader:
    - shard-tglb:         [PASS][67] -> [DMESG-WARN][68] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-tglb8/igt@i915_suspend@sysfs-reader.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb6/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#111614]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_chamelium@dp-mode-timings:
    - shard-apl:          NOTRUN -> [SKIP][71] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-apl8/igt@kms_chamelium@dp-mode-timings.html
    - shard-glk:          NOTRUN -> [SKIP][72] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-glk1/igt@kms_chamelium@dp-mode-timings.html

  * igt@kms_chamelium@vga-edid-read:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb8/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb8/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-c-ctm-limited-range:
    - shard-hsw:          NOTRUN -> [SKIP][75] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-hsw1/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html
    - shard-kbl:          NOTRUN -> [SKIP][76] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl2/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html
    - shard-snb:          NOTRUN -> [SKIP][77] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-snb6/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][78] ([i915#1319])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl7/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109278] / [fdo#109279])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb4/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x85-offscreen:
    - shard-hsw:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#533]) +6 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-hsw7/igt@kms_cursor_crc@pipe-d-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([fdo#109279]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x170-random.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][82] -> [FAIL][83] ([i915#96])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#111825]) +19 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb5/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109274]) +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb6/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
    - shard-kbl:          NOTRUN -> [FAIL][86] ([i915#2641]) +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html
    - shard-tglb:         NOTRUN -> [SKIP][87] ([i915#2587])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html
    - shard-glk:          NOTRUN -> [FAIL][88] ([i915#2628])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html
    - shard-apl:          NOTRUN -> [FAIL][89] ([i915#2641])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-hsw:          NOTRUN -> [SKIP][90] ([fdo#109271]) +70 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-hsw8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109280]) +16 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html

  * igt@kms_plane_alpha_blend@pipe-d-alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [SKIP][92] ([fdo#109271]) +73 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-glk2/igt@kms_plane_alpha_blend@pipe-d-alpha-opaque-fb.html

  * igt@kms_psr@primary_mmap_cpu:
    - shard-hsw:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#1072]) +3 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-hsw8/igt@kms_psr@primary_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][94] -> [SKIP][95] ([fdo#109441]) +2 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb1/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#109309])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-apl:          [PASS][97] -> [DMESG-WARN][98] ([i915#165])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-apl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle-hang:
    - shard-iclb:         NOTRUN -> [SKIP][99] ([fdo#109278]) +7 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb5/igt@kms_vblank@pipe-d-ts-continuation-idle-hang.html

  * igt@kms_vrr@flip-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][100] ([fdo#109502])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb7/igt@kms_vrr@flip-dpms.html
    - shard-tglb:         NOTRUN -> [SKIP][101] ([fdo#109502])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb8/igt@kms_vrr@flip-dpms.html

  * igt@perf@rc6-disable:
    - shard-iclb:         [PASS][102] -> [SKIP][103] ([i915#1354])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-iclb8/igt@perf@rc6-disable.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb5/igt@perf@rc6-disable.html
    - shard-kbl:          [PASS][104] -> [SKIP][105] ([fdo#109271] / [i915#1354])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-kbl7/igt@perf@rc6-disable.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl6/igt@perf@rc6-disable.html
    - shard-apl:          [PASS][106] -> [SKIP][107] ([fdo#109271] / [i915#1354])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-apl3/igt@perf@rc6-disable.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-apl4/igt@perf@rc6-disable.html
    - shard-tglb:         [PASS][108] -> [SKIP][109] ([fdo#111719] / [i915#1354])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-tglb5/igt@perf@rc6-disable.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb3/igt@perf@rc6-disable.html
    - shard-glk:          [PASS][110] -> [SKIP][111] ([fdo#109271] / [i915#1354])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-glk7/igt@perf@rc6-disable.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-glk6/igt@perf@rc6-disable.html

  * igt@prime_nv_api@i915_nv_import_twice:
    - shard-iclb:         NOTRUN -> [SKIP][112] ([fdo#109291]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb3/igt@prime_nv_api@i915_nv_import_twice.html
    - shard-tglb:         NOTRUN -> [SKIP][113] ([fdo#109291]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb7/igt@prime_nv_api@i915_nv_import_twice.html

  * igt@sysfs_heartbeat_interval@mixed@vcs0:
    - shard-kbl:          [PASS][114] -> [INCOMPLETE][115] ([i915#1731])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-kbl4/igt@sysfs_heartbeat_interval@mixed@vcs0.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl6/igt@sysfs_heartbeat_interval@mixed@vcs0.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [FAIL][116] ([i915#2842]) -> [PASS][117] +2 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-iclb:         [FAIL][118] ([i915#2842]) -> [PASS][119] +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-iclb7/igt@gem_exec_fair@basic-pace@vcs0.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-tglb:         [FAIL][120] ([i915#2842]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-tglb3/igt@gem_exec_fair@basic-pace@vcs1.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb3/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][122] ([i915#2849]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_schedule@u-fairslice@rcs0:
    - shard-kbl:          [DMESG-WARN][124] ([i915#1610] / [i915#2803]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-kbl4/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl4/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * igt@gem_exec_schedule@u-fairslice@vecs0:
    - shard-glk:          [DMESG-WARN][126] ([i915#2803]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-glk6/igt@gem_exec_schedule@u-fairslice@vecs0.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-glk6/igt@gem_exec_schedule@u-fairslice@vecs0.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen:
    - shard-kbl:          [FAIL][128] ([i915#54]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html
    - shard-apl:          [FAIL][130] ([i915#54]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][132] ([fdo#109441]) -> [PASS][133] +1 similar issue
   [132]: h

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/index.html

--===============3023869871227336608==
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
<tr><td><b>Series:</b></td><td>Introduce IGT allocator (rev19)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82954/">https://patchwork.freedesktop.org/series/82954/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9700_full -&gt; IGTPW_5445_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5445_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5445_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5445_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_pipe_control_store_loop@fresh-buffer:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-snb5/igt@gem_pipe_control_store_loop@fresh-buffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-snb7/igt@gem_pipe_control_store_loop@fresh-buffer.html">TIMEOUT</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-tglb2/igt@gem_pipe_control_store_loop@fresh-buffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb7/igt@gem_pipe_control_store_loop@fresh-buffer.html">TIMEOUT</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-kbl2/igt@gem_pipe_control_store_loop@fresh-buffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl2/igt@gem_pipe_control_store_loop@fresh-buffer.html">TIMEOUT</a> +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-hsw4/igt@gem_pipe_control_store_loop@fresh-buffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-hsw7/igt@gem_pipe_control_store_loop@fresh-buffer.html">TIMEOUT</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-glk4/igt@gem_pipe_control_store_loop@fresh-buffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-glk9/igt@gem_pipe_control_store_loop@fresh-buffer.html">TIMEOUT</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-apl3/igt@gem_pipe_control_store_loop@fresh-buffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-apl7/igt@gem_pipe_control_store_loop@fresh-buffer.html">TIMEOUT</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pipe_control_store_loop@reused-buffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-iclb8/igt@gem_pipe_control_store_loop@reused-buffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb5/igt@gem_pipe_control_store_loop@reused-buffer.html">TIMEOUT</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy_redux@flink:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-hsw4/igt@gem_render_copy_redux@flink.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-hsw8/igt@gem_render_copy_redux@flink.html">CRASH</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-kbl7/igt@gem_render_copy_redux@flink.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl4/igt@gem_render_copy_redux@flink.html">CRASH</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb7/igt@gem_render_copy_redux@flink.html">CRASH</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy_redux@flink-interruptible:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-glk2/igt@gem_render_copy_redux@flink-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-glk2/igt@gem_render_copy_redux@flink-interruptible.html">CRASH</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-apl1/igt@gem_render_copy_redux@flink-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-apl8/igt@gem_render_copy_redux@flink-interruptible.html">CRASH</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-tglb5/igt@gem_render_copy_redux@flink-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb8/igt@gem_render_copy_redux@flink-interruptible.html">CRASH</a> +1 similar issue</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-snb4/igt@gem_render_copy_redux@flink-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-snb6/igt@gem_render_copy_redux@flink-interruptible.html">CRASH</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-iclb6/igt@gem_render_copy_redux@flink-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb8/igt@gem_render_copy_redux@flink-interruptible.html">CRASH</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9700_full and IGTPW_5445_full:</p>
<h3>New IGT tests (37)</h3>
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
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [5.41, 5.70] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@fork-simple-stress-signal:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [5.42, 5.53] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@print:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
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
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@random-allocator@parallel-one:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
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
<li>Exec time: [0.10, 0.22] s</li>
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
<li>Exec time: [5.41, 5.63] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@two-level-inception-interruptible:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [5.42, 5.53] s</li>
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
<p>igt@gem_softpin@allocator-basic:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-basic-reserve:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-fork:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 2.45] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-nopin:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-nopin-reserve:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5445_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-noreloc-keep-cache:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-hsw1/igt@api_intel_bb@blit-noreloc-keep-cache.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-hsw7/igt@api_intel_bb@blit-noreloc-keep-cache.html">SKIP</a> ([fdo#109271]) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-snb7/igt@api_intel_bb@blit-noreloc-keep-cache.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-snb7/igt@api_intel_bb@blit-noreloc-keep-cache.html">SKIP</a> ([fdo#109271]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-queued:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-hsw8/igt@gem_ctx_persistence@engines-queued.html">SKIP</a> ([fdo#109271] / [i915#1099]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile-preempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-snb6/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-apl8/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([fdo#109271]) +50 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb8/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-glk8/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-iclb7/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb4/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl2/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb4/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb3/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-glk9/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-hsw1/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb2/igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt.html">SKIP</a> ([i915#1317]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-snb4/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html">SKIP</a> ([fdo#109271]) +60 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl7/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html">SKIP</a> ([fdo#109271]) +78 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@wc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb6/igt@gem_userptr_blits@mmap-offset-invalidate-active@wc.html">SKIP</a> ([i915#1317]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-mmap-unsync@wb:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb2/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html">SKIP</a> ([i915#1704]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb3/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html">SKIP</a> ([i915#1704]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb6/igt@gen7_exec_parse@bitmasks.html">SKIP</a> ([fdo#109289]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb7/igt@gen7_exec_parse@bitmasks.html">SKIP</a> ([fdo#109289]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb5/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([fdo#109506] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([fdo#109293] / [fdo#109506])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-kbl1/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl2/igt@i915_suspend@forcewake.html">INCOMPLETE</a> ([i915#636])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-tglb8/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb6/igt@i915_suspend@sysfs-reader.html">DMESG-WARN</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-mode-timings:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-apl8/igt@kms_chamelium@dp-mode-timings.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-glk1/igt@kms_chamelium@dp-mode-timings.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +9 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb8/igt@kms_chamelium@vga-edid-read.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-limited-range:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb8/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-limited-range:</p>
<ul>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-hsw1/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl2/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +9 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-snb6/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl7/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb4/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x85-offscreen:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-hsw7/igt@kms_cursor_crc@pipe-d-cursor-256x85-offscreen.html">SKIP</a> ([fdo#109271] / [i915#533]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x170-random.html">SKIP</a> ([fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">FAIL</a> ([i915#96])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb5/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a> ([fdo#111825]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb6/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> ([fdo#109274]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html">FAIL</a> ([i915#2641]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html">SKIP</a> ([i915#2587])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html">FAIL</a> ([i915#2628])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html">FAIL</a> ([i915#2641])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-hsw8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> ([fdo#109271]) +70 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html">SKIP</a> ([fdo#109280]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-glk2/igt@kms_plane_alpha_blend@pipe-d-alpha-opaque-fb.html">SKIP</a> ([fdo#109271]) +73 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_cpu:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-hsw8/igt@kms_psr@primary_mmap_cpu.html">SKIP</a> ([fdo#109271] / [i915#1072]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb1/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb1/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109309])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-apl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#165])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb5/igt@kms_vblank@pipe-d-ts-continuation-idle-hang.html">SKIP</a> ([fdo#109278]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb7/igt@kms_vrr@flip-dpms.html">SKIP</a> ([fdo#109502])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb8/igt@kms_vrr@flip-dpms.html">SKIP</a> ([fdo#109502])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@rc6-disable:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-iclb8/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb5/igt@perf@rc6-disable.html">SKIP</a> ([i915#1354])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-kbl7/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl6/igt@perf@rc6-disable.html">SKIP</a> ([fdo#109271] / [i915#1354])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-apl3/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-apl4/igt@perf@rc6-disable.html">SKIP</a> ([fdo#109271] / [i915#1354])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-tglb5/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb3/igt@perf@rc6-disable.html">SKIP</a> ([fdo#111719] / [i915#1354])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-glk7/igt@perf@rc6-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-glk6/igt@perf@rc6-disable.html">SKIP</a> ([fdo#109271] / [i915#1354])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb3/igt@prime_nv_api@i915_nv_import_twice.html">SKIP</a> ([fdo#109291]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb7/igt@prime_nv_api@i915_nv_import_twice.html">SKIP</a> ([fdo#109291]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-kbl4/igt@sysfs_heartbeat_interval@mixed@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl6/igt@sysfs_heartbeat_interval@mixed@vcs0.html">INCOMPLETE</a> ([i915#1731])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-iclb7/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-tglb3/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-tglb3/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-kbl4/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> ([i915#1610] / [i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl4/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-glk6/igt@gem_exec_schedule@u-fairslice@vecs0.html">DMESG-WARN</a> ([i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-glk6/igt@gem_exec_schedule@u-fairslice@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html">FAIL</a> ([i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9700/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html">FAIL</a> ([i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5445/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href="h">SKIP</a> ([fdo#109441]) -&gt; [PASS][133] +1 similar issue</li>
</ul>
</li>
</ul>

</body>
</html>

--===============3023869871227336608==--

--===============1993762478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1993762478==--
