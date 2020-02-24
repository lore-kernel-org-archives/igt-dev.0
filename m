Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 24 Feb 2020 10:52:03 -0000
Message-ID: <158254152396.28360.15039997738507084084@emeril.freedesktop.org>
References: <20200220174155.2162242-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200220174155.2162242-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9p?=
 =?utf-8?q?915=5Fpm=5Frpm=3A_Only_check_for_suspend_failures_after_each_de?=
 =?utf-8?q?bugfs_entry_=28rev2=29?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/i915_pm_rpm: Only check for suspend failures after each debugfs entry (rev2)
URL   : https://patchwork.freedesktop.org/series/73729/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7982_full -> IGTPW_4211_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/index.html

Known issues
------------

  Here are the changes found in IGTPW_4211_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276]) +15 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-iclb1/igt@gem_exec_schedule@independent-bsd2.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-iclb6/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([i915#677])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-iclb5/igt@gem_exec_schedule@pi-userfault-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-iclb4/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112146]) +5 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-iclb5/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [PASS][7] -> [DMESG-WARN][8] ([fdo#111870] / [i915#478])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:
    - shard-snb:          [PASS][9] -> [INCOMPLETE][10] ([CI#80] / [i915#82])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-snb1/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-snb1/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-tglb:         [PASS][13] -> [SKIP][14] ([i915#668]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#899]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109642] / [fdo#111068])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-iclb1/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#109441]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-iclb2/igt@kms_psr@psr2_dpms.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-iclb5/igt@kms_psr@psr2_dpms.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#112080]) +15 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-iclb6/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@sw_sync@sync_multi_producer_single_consumer:
    - shard-iclb:         [PASS][25] -> [TIMEOUT][26] ([fdo#112271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-iclb6/igt@sw_sync@sync_multi_producer_single_consumer.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-iclb1/igt@sw_sync@sync_multi_producer_single_consumer.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@bcs0-s3:
    - shard-apl:          [DMESG-WARN][27] ([i915#180]) -> [PASS][28] +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-apl6/igt@gem_ctx_isolation@bcs0-s3.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-apl4/igt@gem_ctx_isolation@bcs0-s3.html

  * {igt@gem_ctx_persistence@close-replace-race}:
    - shard-kbl:          [INCOMPLETE][29] ([fdo#103665] / [i915#1291]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-kbl4/igt@gem_ctx_persistence@close-replace-race.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-kbl6/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][31] ([fdo#112080]) -> [PASS][32] +9 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-iclb7/igt@gem_exec_parallel@vcs1-fds.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html

  * {igt@gem_exec_schedule@implicit-both-bsd2}:
    - shard-iclb:         [SKIP][33] ([fdo#109276] / [i915#677]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-iclb3/igt@gem_exec_schedule@implicit-both-bsd2.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][35] ([i915#677]) -> [PASS][36] +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-iclb7/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@pi-userfault-bsd2:
    - shard-iclb:         [SKIP][37] ([fdo#109276]) -> [PASS][38] +15 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-iclb7/igt@gem_exec_schedule@pi-userfault-bsd2.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd2.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd:
    - shard-iclb:         [SKIP][39] ([fdo#112146]) -> [PASS][40] +4 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-iclb4/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-iclb6/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html

  * {igt@gem_exec_whisper@basic-queues-forked}:
    - shard-glk:          [INCOMPLETE][41] ([i915#58] / [k.org#198133]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-glk4/igt@gem_exec_whisper@basic-queues-forked.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-glk8/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][43] ([i915#413]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-iclb1/igt@i915_pm_rps@waitboost.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-iclb4/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen:
    - shard-apl:          [FAIL][45] ([i915#54]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][47] ([i915#79]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50] +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-kbl:          [FAIL][51] ([i915#49]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
    - shard-apl:          [FAIL][53] ([i915#49]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
    - shard-glk:          [FAIL][55] ([i915#49]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-glk8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][57] ([fdo#109441]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-iclb5/igt@kms_psr@psr2_cursor_render.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][59] ([i915#31]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-apl2/igt@kms_setmode@basic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-apl8/igt@kms_setmode@basic.html

  * igt@sw_sync@sync_multi_producer_single_consumer:
    - shard-kbl:          [TIMEOUT][61] ([fdo#112271]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-kbl1/igt@sw_sync@sync_multi_producer_single_consumer.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-kbl1/igt@sw_sync@sync_multi_producer_single_consumer.html
    - shard-snb:          [TIMEOUT][63] ([fdo#112271]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-snb2/igt@sw_sync@sync_multi_producer_single_consumer.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-snb2/igt@sw_sync@sync_multi_producer_single_consumer.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][65] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][66] ([fdo#111870] / [i915#478])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-kbl:          [TIMEOUT][67] ([fdo#112271]) -> [TIMEOUT][68] ([fdo#112271] / [i915#727])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7982/shard-kbl2/igt@kms_content_protection@atomic-dpms.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/shard-kbl6/igt@kms_content_protection@atomic-dpms.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1291]: https://gitlab.freedesktop.org/drm/intel/issues/1291
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#727]: https://gitlab.freedesktop.org/drm/intel/issues/727
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5457 -> IGTPW_4211
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7982: f02659605b48dcabb562bbb96db2996b334e57fd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4211: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/index.html
  IGT_5457: 3e686098d928aa928f668e00fa01e92234e173ff @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4211/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
