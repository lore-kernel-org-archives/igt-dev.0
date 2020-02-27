Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 27 Feb 2020 23:20:57 -0000
Message-ID: <158284565705.29657.14161407359619592009@emeril.freedesktop.org>
References: <20200227030845.16941-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20200227030845.16941-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Flut=5Fhandle=3A_Minor_fixes_=28rev2=29?=
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
To: bhanuprakash.modem@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_lut_handle: Minor fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/73938/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8010_full -> IGTPW_4232_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4232_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4232_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4232_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_mmap_offset@basic-uaf:
    - shard-hsw:          [PASS][1] -> [DMESG-WARN][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-hsw1/igt@gem_mmap_offset@basic-uaf.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-hsw5/igt@gem_mmap_offset@basic-uaf.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [PASS][3] -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-hsw7/igt@i915_selftest@live_blt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-hsw5/igt@i915_selftest@live_blt.html

  
Known issues
------------

  Here are the changes found in IGTPW_4232_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180]) +5 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-kbl7/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_isolation@vcs0-s3:
    - shard-iclb:         [PASS][7] -> [INCOMPLETE][8] ([fdo#109100])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb2/igt@gem_ctx_isolation@vcs0-s3.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-iclb3/igt@gem_ctx_isolation@vcs0-s3.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [PASS][9] -> [INCOMPLETE][10] ([i915#1291])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-tglb3/igt@gem_ctx_persistence@close-replace-race.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-tglb1/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [PASS][11] -> [FAIL][12] ([i915#1277])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-tglb5/igt@gem_exec_balancer@hang.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-tglb8/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112080]) +8 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb2/igt@gem_exec_parallel@vcs1-fds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-iclb3/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([i915#677]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb7/igt@gem_exec_schedule@implicit-both-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@implicit-both-bsd2:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109276] / [i915#677]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd2.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-iclb3/igt@gem_exec_schedule@implicit-both-bsd2.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#112146]) +7 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb8/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-iclb1/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html

  * igt@gem_mmap_offset@basic-uaf:
    - shard-snb:          [PASS][21] -> [DMESG-WARN][22] ([i915#478]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-snb5/igt@gem_mmap_offset@basic-uaf.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-snb6/igt@gem_mmap_offset@basic-uaf.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#644])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-apl3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-apl8/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#644])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-apl1/igt@gem_softpin@noreloc-s3.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-apl4/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#413])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb5/igt@i915_pm_rps@reset.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-iclb1/igt@i915_pm_rps@reset.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][31] -> [INCOMPLETE][32] ([fdo#103665] / [fdo#112219])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-kbl6/igt@i915_suspend@forcewake.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-kbl3/igt@i915_suspend@forcewake.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-random:
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#54])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#34])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-glk7/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-glk8/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#899])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-iclb3/igt@kms_psr@psr2_primary_page_flip.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109276]) +20 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb4/igt@prime_busy@hang-bsd2.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-iclb6/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][43] ([fdo#110854]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb6/igt@gem_exec_balancer@smoke.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][45] ([fdo#109276] / [i915#677]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb7/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@implicit-write-read-bsd:
    - shard-iclb:         [SKIP][47] ([i915#677]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb2/igt@gem_exec_schedule@implicit-write-read-bsd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-iclb7/igt@gem_exec_schedule@implicit-write-read-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][49] ([fdo#112146]) -> [PASS][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-iclb:         [INCOMPLETE][51] ([i915#1120]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb4/igt@gem_exec_whisper@basic-queues-forked.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-iclb2/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][53] ([i915#644]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-hsw:          [DMESG-WARN][55] ([fdo#111870]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-hsw1/igt@gem_userptr_blits@dmabuf-unsync.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-hsw5/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-snb:          [DMESG-WARN][57] ([fdo#111870] / [i915#478]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-snb4/igt@gem_userptr_blits@dmabuf-unsync.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen:
    - shard-apl:          [FAIL][59] ([i915#54]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-apl:          [FAIL][61] ([i915#79]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-apl6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
    - shard-glk:          [FAIL][63] ([i915#79]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +4 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][67] ([i915#899]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-glk2/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][69] ([fdo#109441]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb5/igt@kms_psr@psr2_basic.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][71] ([i915#31]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-apl3/igt@kms_setmode@basic.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-apl2/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-accuracy-98-vcs1:
    - shard-iclb:         [SKIP][73] ([fdo#112080]) -> [PASS][74] +13 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb3/igt@perf_pmu@busy-accuracy-98-vcs1.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-iclb4/igt@perf_pmu@busy-accuracy-98-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][75] ([fdo#109276]) -> [PASS][76] +13 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][77] ([IGT#28]) -> [SKIP][78] ([fdo#112080])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-snb:          [SKIP][79] ([fdo#109271]) -> [INCOMPLETE][80] ([i915#82])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-snb4/igt@i915_pm_rpm@gem-idle.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-snb2/igt@i915_pm_rpm@gem-idle.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][81] ([i915#1319] / [i915#727]) -> [TIMEOUT][82] ([i915#1319]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8010/shard-kbl2/igt@kms_content_protection@atomic.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/shard-kbl1/igt@kms_content_protection@atomic.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109100]: https://bugs.freedesktop.org/show_bug.cgi?id=109100
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112219]: https://bugs.freedesktop.org/show_bug.cgi?id=112219
  [i915#1120]: https://gitlab.freedesktop.org/drm/intel/issues/1120
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#1291]: https://gitlab.freedesktop.org/drm/intel/issues/1291
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#727]: https://gitlab.freedesktop.org/drm/intel/issues/727
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5471 -> IGTPW_4232
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8010: 97bbec4d80df1c6573fc7063ad830e8beefe07c8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4232: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/index.html
  IGT_5471: 668afe52887a164ee6a12fd1c898bc1c9086cf3e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4232/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
