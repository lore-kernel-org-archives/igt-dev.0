Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 10 Dec 2019 00:43:03 -0000
Message-ID: <157593858368.18782.431907066415139756@emeril.freedesktop.org>
References: <1575897543-24266-1-git-send-email-juhapekka.heikkila@gmail.com>
In-Reply-To: <1575897543-24266-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fcrc=3A_Fix_user_space_read_too_slow_error_=28rev?=
 =?utf-8?q?2=29?=
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_cursor_crc: Fix user space read too slow error (rev2)
URL   : https://patchwork.freedesktop.org/series/70218/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7521_full -> IGTPW_3832_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3832_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3832_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3832_full:

### IGT changes ###

#### Possible regressions ####

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-tglb1/igt@perf@gen8-unprivileged-single-ctx-counters.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_render_copy@y-tiled-to-vebox-yf-tiled}:
    - shard-iclb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-iclb1/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html

  
Known issues
------------

  Here are the changes found in IGTPW_3832_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#110841])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_ctx_shared@q-smoketest-bsd:
    - shard-tglb:         [PASS][5] -> [INCOMPLETE][6] ([i915#461])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb8/igt@gem_ctx_shared@q-smoketest-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-tglb9/igt@gem_ctx_shared@q-smoketest-bsd.html

  * igt@gem_ctx_shared@q-smoketest-bsd2:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb2/igt@gem_ctx_shared@q-smoketest-bsd2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-iclb3/igt@gem_ctx_shared@q-smoketest-bsd2.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-tglb:         [PASS][9] -> [TIMEOUT][10] ([fdo#112126] / [i915#530])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb5/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-tglb7/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_sync@basic-all:
    - shard-tglb:         [PASS][11] -> [INCOMPLETE][12] ([i915#470] / [i915#472])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb2/igt@gem_sync@basic-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-tglb6/igt@gem_sync@basic-all.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [PASS][13] -> [DMESG-WARN][14] ([fdo#111870])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-snb2/igt@gem_userptr_blits@sync-unmap.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-snb7/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][15] -> [INCOMPLETE][16] ([i915#140])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb8/igt@i915_pm_dc@dc6-dpms.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-iclb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_selftest@live_requests:
    - shard-tglb:         [PASS][17] -> [INCOMPLETE][18] ([fdo#112057])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb1/igt@i915_selftest@live_requests.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-tglb5/igt@i915_selftest@live_requests.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +4 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-kbl:          [PASS][21] -> [INCOMPLETE][22] ([fdo#103665])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#49])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-snb:          [PASS][25] -> [SKIP][26] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-snb4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-snb4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-tilingchange:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#49])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-apl4/igt@kms_frontbuffer_tracking@fbc-tilingchange.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-apl3/igt@kms_frontbuffer_tracking@fbc-tilingchange.html
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#49])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-tilingchange.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-tilingchange.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-tglb:         [PASS][31] -> [INCOMPLETE][32] ([i915#435] / [i915#474] / [i915#667])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-apl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109642] / [fdo#111068])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-iclb6/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-iclb5/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_suspend:
    - shard-tglb:         [PASS][39] -> [INCOMPLETE][40] ([i915#456] / [i915#460]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb9/igt@kms_psr@psr2_suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-tglb8/igt@kms_psr@psr2_suspend.html

  * igt@kms_universal_plane@universal-plane-pipe-a-functional:
    - shard-kbl:          [PASS][41] -> [FAIL][42] ([i915#331]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl2/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-kbl2/igt@kms_universal_plane@universal-plane-pipe-a-functional.html

  * igt@kms_universal_plane@universal-plane-pipe-c-functional:
    - shard-apl:          [PASS][43] -> [FAIL][44] ([i915#331])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-apl1/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-apl1/igt@kms_universal_plane@universal-plane-pipe-c-functional.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#112080])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-iclb5/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][47] ([fdo#109276] / [fdo#112080]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb8/igt@gem_ctx_persistence@vcs1-queued.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-iclb1/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_ctx_shared@q-smoketest-bsd1:
    - shard-tglb:         [INCOMPLETE][49] ([fdo#111735]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb9/igt@gem_ctx_shared@q-smoketest-bsd1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-tglb1/igt@gem_ctx_shared@q-smoketest-bsd1.html

  * igt@gem_exec_parallel@fds:
    - shard-tglb:         [INCOMPLETE][51] ([i915#470]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb6/igt@gem_exec_parallel@fds.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-tglb3/igt@gem_exec_parallel@fds.html

  * igt@gem_exec_schedule@fifo-bsd:
    - shard-iclb:         [SKIP][53] ([fdo#112146]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb2/igt@gem_exec_schedule@fifo-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-iclb5/igt@gem_exec_schedule@fifo-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][55] ([fdo#109276]) -> [PASS][56] +6 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][57] ([i915#644]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-apl8/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_sync@basic-store-each:
    - shard-tglb:         [INCOMPLETE][59] ([i915#435] / [i915#472]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb6/igt@gem_sync@basic-store-each.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-tglb1/igt@gem_sync@basic-store-each.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][61] ([fdo#111870]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-snb7/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +5 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_selftest@mock_sanitycheck:
    - shard-kbl:          [DMESG-WARN][65] ([i915#747]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl1/igt@i915_selftest@mock_sanitycheck.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-kbl3/igt@i915_selftest@mock_sanitycheck.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-random:
    - shard-kbl:          [FAIL][67] ([i915#54]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
    - shard-apl:          [FAIL][69] ([i915#54]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][71] ([i915#72]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-tglb:         [FAIL][75] ([i915#49]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-tglb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-tglb:         [INCOMPLETE][77] ([i915#456] / [i915#460]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane@pixel-format-pipe-a-planes-source-clamping:
    - shard-kbl:          [INCOMPLETE][79] ([fdo#103665]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl4/igt@kms_plane@pixel-format-pipe-a-planes-source-clamping.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-kbl6/igt@kms_plane@pixel-format-pipe-a-planes-source-clamping.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [FAIL][81] ([fdo#111842]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb8/igt@kms_psr2_su@frontbuffer.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-tglb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_vblank@pipe-d-ts-continuation-suspend:
    - shard-tglb:         [INCOMPLETE][83] ([i915#460]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-tglb4/igt@kms_vblank@pipe-d-ts-continuation-suspend.html

  * igt@perf_pmu@init-sema-vcs1:
    - shard-iclb:         [SKIP][85] ([fdo#112080]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb6/igt@perf_pmu@init-sema-vcs1.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-iclb1/igt@perf_pmu@init-sema-vcs1.html

  
#### Warnings ####

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][87] ([fdo#111870]) -> [DMESG-WARN][88] ([fdo#110789] / [fdo#111870])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-snb1/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [INCOMPLETE][89] ([fdo#103665]) -> [FAIL][90] ([fdo#110321])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl7/igt@kms_content_protection@lic.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/shard-kbl1/igt@kms_content_protection@lic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111842]: https://bugs.freedesktop.org/show_bug.cgi?id=111842
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112057]: https://bugs.freedesktop.org/show_bug.cgi?id=112057
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112126]: https://bugs.freedesktop.org/show_bug.cgi?id=112126
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#461]: https://gitlab.freedesktop.org/drm/intel/issues/461
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
  [i915#669]: https://gitlab.freedesktop.org/drm/intel/issues/669
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#747]: https://gitlab.freedesktop.org/drm/intel/issues/747


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5341 -> IGTPW_3832
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7521: 9203f67985ebf27211aa1eabb77093302248c9fc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3832: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/index.html
  IGT_5341: 5fe683cdebde2d77d16ffc42c9fdf29a9f95bb82 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3832/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
