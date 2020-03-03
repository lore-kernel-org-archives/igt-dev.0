Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 03 Mar 2020 23:00:49 -0000
Message-ID: <158327644951.15379.10855416651278516641@emeril.freedesktop.org>
References: <20200303090225.7192-1-satyavathi.k@intel.com>
In-Reply-To: <20200303090225.7192-1-satyavathi.k@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fringfill=3AAdded_=5F=5Ffor=5Feach=5Fphysical=5Fengin?=
 =?utf-8?q?e_to_utilize_all_available_engines=2E_=28rev6=29?=
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
To: satyavat <satyavathi.k@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_ringfill:Added __for_each_physical_engine to utilize all available engines. (rev6)
URL   : https://patchwork.freedesktop.org/series/73463/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8054_full -> IGTPW_4246_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4246_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4246_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4246_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8054_full and IGTPW_4246_full:

### New IGT tests (30) ###

  * igt@gem_ringfill@basic:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@basic-fd:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@basic-fd@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.03, 0.06] s

  * igt@gem_ringfill@basic-fd@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.04, 0.07] s

  * igt@gem_ringfill@basic-fd@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.03, 0.06] s

  * igt@gem_ringfill@basic-fd@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@gem_ringfill@basic-fd@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.03, 0.06] s

  * igt@gem_ringfill@basic-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@basic-forked@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.03, 0.06] s

  * igt@gem_ringfill@basic-forked@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.04, 0.06] s

  * igt@gem_ringfill@basic-forked@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.03, 0.05] s

  * igt@gem_ringfill@basic-forked@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.03] s

  * igt@gem_ringfill@basic-forked@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.03, 0.06] s

  * igt@gem_ringfill@basic-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@basic-hang@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [10.75, 15.04] s

  * igt@gem_ringfill@basic-hang@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [10.77, 15.30] s

  * igt@gem_ringfill@basic-hang@vcs0:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 15.04] s

  * igt@gem_ringfill@basic-hang@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [10.75, 14.97] s

  * igt@gem_ringfill@basic-hang@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [10.75, 15.04] s

  * igt@gem_ringfill@basic-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@basic-interruptible@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [1.08, 1.11] s

  * igt@gem_ringfill@basic-interruptible@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [1.09, 1.17] s

  * igt@gem_ringfill@basic-interruptible@vcs0:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.11] s

  * igt@gem_ringfill@basic-interruptible@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [1.08, 1.11] s

  * igt@gem_ringfill@basic-interruptible@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [1.08, 1.12] s

  * igt@gem_ringfill@basic@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ringfill@basic@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@gem_ringfill@basic@vcs0:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_ringfill@basic@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ringfill@basic@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.01, 0.02] s

  

Known issues
------------

  Here are the changes found in IGTPW_4246_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@blt:
    - shard-apl:          [PASS][3] -> [FAIL][4] ([i915#679])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-apl6/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-apl8/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox:
    - shard-apl:          [PASS][5] -> [INCOMPLETE][6] ([fdo#103927] / [i915#1239])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-apl6/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-apl8/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110841])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112080]) +9 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@fifo-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb8/igt@gem_exec_schedule@fifo-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-iclb4/igt@gem_exec_schedule@fifo-bsd.html

  * igt@gem_exec_schedule@implicit-both-bsd2:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109276] / [i915#677])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd2.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-iclb3/igt@gem_exec_schedule@implicit-both-bsd2.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#109276]) +14 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb4/igt@gem_exec_schedule@independent-bsd2.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-iclb7/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-iclb:         [PASS][17] -> [INCOMPLETE][18] ([i915#1120])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb6/igt@gem_exec_whisper@basic-queues-forked.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-iclb7/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +4 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-hsw:          [PASS][21] -> [DMESG-WARN][22] ([i915#478])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-hsw7/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-hsw8/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_color@pipe-b-legacy-gamma:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#71])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-kbl3/igt@kms_color@pipe-b-legacy-gamma.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-kbl4/igt@kms_color@pipe-b-legacy-gamma.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#71])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-apl1/igt@kms_color@pipe-b-legacy-gamma.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-apl2/igt@kms_color@pipe-b-legacy-gamma.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-random:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#54])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-hsw:          [PASS][31] -> [INCOMPLETE][32] ([i915#61])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-hsw8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-hsw5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#1297]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-kbl3/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-kbl4/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@bo-too-big-interruptible:
    - shard-apl:          [PASS][35] -> [DMESG-WARN][36] ([i915#1297]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-apl2/igt@kms_flip@bo-too-big-interruptible.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-apl6/igt@kms_flip@bo-too-big-interruptible.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180]) +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-iclb1/igt@kms_psr@psr2_cursor_blt.html

  
#### Possible fixes ####

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][41] ([fdo#109276] / [i915#677]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb6/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][43] ([i915#677]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-iclb6/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][45] ([fdo#109276]) -> [PASS][46] +9 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [SKIP][47] ([fdo#112146]) -> [PASS][48] +5 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb4/igt@gem_exec_schedule@wide-bsd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-iclb3/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][49] ([i915#644]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-tglb:         [FAIL][51] ([i915#644]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-tglb3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-tglb3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
    - shard-snb:          [DMESG-WARN][55] ([i915#478]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
    - shard-hsw:          [DMESG-WARN][57] ([i915#478]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-hsw7/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-hsw2/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html

  * igt@kms_flip@flip-vs-dpms-interruptible:
    - shard-apl:          [DMESG-WARN][59] ([i915#1297]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-apl8/igt@kms_flip@flip-vs-dpms-interruptible.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-apl7/igt@kms_flip@flip-vs-dpms-interruptible.html
    - shard-kbl:          [DMESG-WARN][61] ([i915#1297]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-kbl6/igt@kms_flip@flip-vs-dpms-interruptible.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-kbl1/igt@kms_flip@flip-vs-dpms-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +7 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][65] ([fdo#109441]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb8/igt@kms_psr@psr2_cursor_render.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][67] ([i915#31]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-apl8/igt@kms_setmode@basic.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-apl6/igt@kms_setmode@basic.html
    - shard-kbl:          [FAIL][69] ([i915#31]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-kbl4/igt@kms_setmode@basic.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-kbl6/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [SKIP][71] ([fdo#112080]) -> [PASS][72] +9 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb8/igt@perf_pmu@busy-check-all-vcs1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-iclb1/igt@perf_pmu@busy-check-all-vcs1.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][73] ([i915#454]) -> [SKIP][74] ([i915#468])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-tglb7/igt@i915_pm_dc@dc6-psr.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - shard-snb:          [SKIP][75] ([fdo#109271]) -> [INCOMPLETE][76] ([i915#82])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-snb6/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-snb4/igt@i915_pm_rpm@debugfs-forcewake-user.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][77] ([i915#1226]) -> [SKIP][78] ([fdo#109349])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8054/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1120]: https://gitlab.freedesktop.org/drm/intel/issues/1120
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1239]: https://gitlab.freedesktop.org/drm/intel/issues/1239
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5484 -> IGTPW_4246
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8054: 00395f50bbdc5b9eb3e287e85465566d1ec094a6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4246: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/index.html
  IGT_5484: 91b36b61e76901a2bd09fe93ac7bf7b8a60f258c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4246/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
