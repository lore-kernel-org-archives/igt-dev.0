Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 21 Dec 2019 03:18:33 -0000
Message-ID: <157689831313.32690.2793316999188078093@emeril.freedesktop.org>
References: <20191219235047.15224-1-robert.m.fosha@intel.com>
In-Reply-To: <20191219235047.15224-1-robert.m.fosha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fhuc=5Fcopy=3A_Enable_a_HuC_copy_test?=
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
To: "Robert M. Fosha" <robert.m.fosha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_huc_copy: Enable a HuC copy test
URL   : https://patchwork.freedesktop.org/series/71194/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7611_full -> IGTPW_3880_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_3880_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3880_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3880_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_huc_copy@huc-copy} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-apl7/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-glk4/igt@gem_huc_copy@huc-copy.html
    - shard-iclb:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-iclb6/igt@gem_huc_copy@huc-copy.html
    - shard-kbl:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-kbl3/igt@gem_huc_copy@huc-copy.html

  
#### Warnings ####

  * igt@i915_selftest@mock_requests:
    - shard-snb:          [INCOMPLETE][5] ([i915#82]) -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-snb5/igt@i915_selftest@mock_requests.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-snb5/igt@i915_selftest@mock_requests.html
    - shard-iclb:         [INCOMPLETE][7] ([i915#140]) -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-iclb8/igt@i915_selftest@mock_requests.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-iclb3/igt@i915_selftest@mock_requests.html

  * igt@runner@aborted:
    - shard-apl:          [FAIL][9] -> ([FAIL][10], [FAIL][11]) ([i915#716])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-apl8/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-apl2/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-apl3/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7611_full and IGTPW_3880_full:

### New IGT tests (1) ###

  * igt@gem_huc_copy@huc-copy:
    - Statuses : 4 fail(s) 2 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_3880_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#112080]) +7 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-iclb5/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@bcs0-s3:
    - shard-apl:          [PASS][14] -> [DMESG-WARN][15] ([i915#180]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-apl7/igt@gem_ctx_isolation@bcs0-s3.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-apl4/igt@gem_ctx_isolation@bcs0-s3.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#109276] / [fdo#112080])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-iclb1/igt@gem_ctx_persistence@vcs1-queued.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-iclb6/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_ctx_shared@q-smoketest-vebox:
    - shard-tglb:         [PASS][18] -> [INCOMPLETE][19] ([fdo#111735])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-tglb5/igt@gem_ctx_shared@q-smoketest-vebox.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-tglb4/igt@gem_ctx_shared@q-smoketest-vebox.html

  * igt@gem_eio@hibernate:
    - shard-tglb:         [PASS][20] -> [INCOMPLETE][21] ([i915#456])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-tglb1/igt@gem_eio@hibernate.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-tglb5/igt@gem_eio@hibernate.html

  * igt@gem_exec_parallel@contexts:
    - shard-tglb:         [PASS][22] -> [INCOMPLETE][23] ([i915#470])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-tglb3/igt@gem_exec_parallel@contexts.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-tglb4/igt@gem_exec_parallel@contexts.html

  * igt@gem_exec_schedule@preempt-contexts-bsd:
    - shard-iclb:         [PASS][24] -> [SKIP][25] ([fdo#112146]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-iclb3/igt@gem_exec_schedule@preempt-contexts-bsd.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-iclb2/igt@gem_exec_schedule@preempt-contexts-bsd.html

  * igt@gem_exec_schedule@preempt-queue-chain-bsd1:
    - shard-tglb:         [PASS][26] -> [INCOMPLETE][27] ([fdo#111606] / [fdo#111677])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-tglb3/igt@gem_exec_schedule@preempt-queue-chain-bsd1.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-tglb6/igt@gem_exec_schedule@preempt-queue-chain-bsd1.html

  * igt@gem_exec_whisper@normal:
    - shard-tglb:         [PASS][28] -> [INCOMPLETE][29] ([i915#435])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-tglb6/igt@gem_exec_whisper@normal.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-tglb7/igt@gem_exec_whisper@normal.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-kbl:          [PASS][30] -> [TIMEOUT][31] ([i915#530])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-kbl7/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-kbl1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][32] -> [FAIL][33] ([i915#644])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-apl:          [PASS][34] -> [FAIL][35] ([i915#644])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [PASS][36] -> [DMESG-WARN][37] ([fdo#111870])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][38] -> [FAIL][39] ([i915#454])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-iclb5/igt@i915_pm_dc@dc6-psr.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-tglb:         [PASS][40] -> [INCOMPLETE][41] ([i915#456] / [i915#460])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-tglb6/igt@i915_pm_rpm@system-suspend-modeset.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-tglb2/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@kms_concurrent@pipe-b:
    - shard-snb:          [PASS][42] -> [DMESG-WARN][43] ([i915#478])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-snb4/igt@kms_concurrent@pipe-b.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-snb6/igt@kms_concurrent@pipe-b.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][44] -> [DMESG-WARN][45] ([i915#180]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-tglb:         [PASS][46] -> [INCOMPLETE][47] ([i915#456] / [i915#460] / [i915#516])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-tglb6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-tglb4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-glk:          [PASS][48] -> [FAIL][49] ([i915#49])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-tglb:         [PASS][50] -> [INCOMPLETE][51] ([i915#456] / [i915#460] / [i915#474])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][52] -> [SKIP][53] ([fdo#109441])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][54] -> [SKIP][55] ([fdo#109276]) +11 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-iclb3/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs1-mixed:
    - shard-iclb:         [SKIP][56] ([fdo#109276] / [fdo#112080]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-iclb6/igt@gem_ctx_persistence@vcs1-mixed.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-iclb2/igt@gem_ctx_persistence@vcs1-mixed.html

  * igt@gem_exec_nop@basic-sequential:
    - shard-tglb:         [INCOMPLETE][58] ([i915#435]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-tglb9/igt@gem_exec_nop@basic-sequential.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-tglb2/igt@gem_exec_nop@basic-sequential.html

  * {igt@gem_exec_schedule@pi-common-bsd1}:
    - shard-iclb:         [SKIP][60] ([fdo#109276]) -> [PASS][61] +10 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-iclb6/igt@gem_exec_schedule@pi-common-bsd1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd1.html

  * {igt@gem_exec_schedule@pi-shared-iova-bsd}:
    - shard-iclb:         [SKIP][62] ([i915#677]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-iclb6/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][64] ([fdo#112146]) -> [PASS][65] +3 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_store@pages-vcs1:
    - shard-iclb:         [SKIP][66] ([fdo#112080]) -> [PASS][67] +7 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-iclb3/igt@gem_exec_store@pages-vcs1.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-iclb2/igt@gem_exec_store@pages-vcs1.html

  * igt@gem_persistent_relocs@interruptible:
    - shard-snb:          [DMESG-WARN][68] ([i915#478]) -> [PASS][69] +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-snb1/igt@gem_persistent_relocs@interruptible.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-snb1/igt@gem_persistent_relocs@interruptible.html

  * igt@gem_workarounds@suspend-resume:
    - shard-tglb:         [INCOMPLETE][70] ([i915#456] / [i915#460]) -> [PASS][71] +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-tglb1/igt@gem_workarounds@suspend-resume.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-tglb9/igt@gem_workarounds@suspend-resume.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
    - shard-apl:          [FAIL][72] ([i915#54]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
    - shard-kbl:          [FAIL][74] ([i915#54]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][76] ([i915#180]) -> [PASS][77] +7 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][78] ([i915#79]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][80] ([i915#180]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-kbl:          [DMESG-WARN][82] ([i915#180] / [i915#56]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-kbl:          [FAIL][84] ([i915#49]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-apl:          [FAIL][86] ([i915#49]) -> [PASS][87] +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [INCOMPLETE][88] ([fdo#103665]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [FAIL][90] ([fdo#111842] / [i915#608]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-tglb6/igt@kms_psr2_su@frontbuffer.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-tglb3/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [SKIP][92] ([fdo#109441]) -> [PASS][93] +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-iclb8/igt@kms_psr@psr2_primary_mmap_gtt.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [DMESG-WARN][94] ([fdo#107724]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@perf@oa-exponents:
    - shard-tglb:         [FAIL][96] ([i915#84]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-tglb6/igt@perf@oa-exponents.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-tglb9/igt@perf@oa-exponents.html

  
#### Warnings ####

  * igt@gem_eio@kms:
    - shard-snb:          [DMESG-WARN][98] ([i915#444]) -> [INCOMPLETE][99] ([i915#82])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-snb1/igt@gem_eio@kms.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-snb1/igt@gem_eio@kms.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
    - shard-snb:          [DMESG-WARN][100] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][101] ([fdo#111870])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-snb:          [INCOMPLETE][102] ([i915#82]) -> [SKIP][103] ([fdo#109271])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-snb2/igt@i915_pm_dc@dc5-dpms.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-snb7/igt@i915_pm_dc@dc5-dpms.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][104] ([fdo#103665]) -> ([FAIL][105], [FAIL][106]) ([fdo#103665] / [i915#716])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7611/shard-kbl7/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-kbl1/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/shard-kbl3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111842]: https://bugs.freedesktop.org/show_bug.cgi?id=111842
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#516]: https://gitlab.freedesktop.org/drm/intel/issues/516
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#56]: https://gitlab.freedesktop.org/drm/intel/issues/56
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#84]: https://gitlab.freedesktop.org/drm/intel/issues/84


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5351 -> IGTPW_3880
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7611: a838a8d6accc9027d4d04fb67d2f8a7a2049946c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3880: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/index.html
  IGT_5351: e7fdcef72d1d6b3bb9f3003bbc37571959e6e8bb @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3880/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
