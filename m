Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 24 Jan 2020 03:43:55 -0000
Message-ID: <157983743508.15092.17388261270126643822@emeril.freedesktop.org>
References: <20200122233326.29131-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20200122233326.29131-1-vinay.belgaumkar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fmmap=5Fwc=3A_Update_test_to_use_mmap=5Fwc_IOCTL?=
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
To: vbelgaum <vinay.belgaumkar@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_mmap_wc: Update test to use mmap_wc IOCTL
URL   : https://patchwork.freedesktop.org/series/72431/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7799_full -> IGTPW_3973_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/index.html

Known issues
------------

  Here are the changes found in IGTPW_3973_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@close-race:
    - shard-hsw:          [PASS][1] -> [TIMEOUT][2] ([fdo#112271])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-hsw7/igt@gem_busy@close-race.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-hsw7/igt@gem_busy@close-race.html

  * igt@gem_ctx_persistence@bcs0-mixed-process:
    - shard-tglb:         [PASS][3] -> [FAIL][4] ([i915#679])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-tglb3/igt@gem_ctx_persistence@bcs0-mixed-process.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-tglb1/igt@gem_ctx_persistence@bcs0-mixed-process.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb2/igt@gem_ctx_persistence@vcs1-queued.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-iclb7/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_exec_parallel@bcs0-fds:
    - shard-hsw:          [PASS][7] -> [INCOMPLETE][8] ([i915#61]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-hsw8/igt@gem_exec_parallel@bcs0-fds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-hsw5/igt@gem_exec_parallel@bcs0-fds.html

  * igt@gem_exec_reuse@single:
    - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#118] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-glk7/igt@gem_exec_reuse@single.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-glk8/igt@gem_exec_reuse@single.html

  * igt@gem_exec_schedule@preempt-queue-chain-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb8/igt@gem_exec_schedule@preempt-queue-chain-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-iclb1/igt@gem_exec_schedule@preempt-queue-chain-bsd.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-kbl:          [PASS][13] -> [INCOMPLETE][14] ([fdo#103665]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-kbl3/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-kbl1/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-thrash-inactive:
    - shard-hsw:          [PASS][15] -> [FAIL][16] ([i915#520])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-hsw6/igt@gem_persistent_relocs@forked-thrash-inactive.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-hsw8/igt@gem_persistent_relocs@forked-thrash-inactive.html

  * igt@gem_pipe_control_store_loop@reused-buffer:
    - shard-hsw:          [PASS][17] -> [FAIL][18] ([i915#874])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-hsw6/igt@gem_pipe_control_store_loop@reused-buffer.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-hsw8/igt@gem_pipe_control_store_loop@reused-buffer.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [PASS][19] -> [FAIL][20] ([i915#818])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-hsw1/igt@gem_tiled_blits@normal.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-hsw2/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [PASS][21] -> [DMESG-WARN][22] ([fdo#111870] / [i915#478]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-snb4/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@gem_wait@await-vcs1:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#112080]) +7 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb4/igt@gem_wait@await-vcs1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-iclb7/igt@gem_wait@await-vcs1.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-apl8/igt@gem_workarounds@suspend-resume-context.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-apl6/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][27] -> [FAIL][28] ([i915#447])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb1/igt@i915_pm_dc@dc5-dpms.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#413])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb2/igt@i915_pm_rps@reset.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-iclb8/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@mock_requests:
    - shard-snb:          [PASS][31] -> [INCOMPLETE][32] ([i915#82])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-snb1/igt@i915_selftest@mock_requests.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-snb1/igt@i915_selftest@mock_requests.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding:
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#54]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([i915#54]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#54])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-glk7/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#180]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][41] -> [FAIL][42] ([i915#79])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-tglb:         [PASS][43] -> [FAIL][44] ([i915#49]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-glk:          [PASS][45] -> [FAIL][46] ([i915#49])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109441]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-iclb4/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-iclb:         [PASS][49] -> [INCOMPLETE][50] ([i915#140])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-iclb6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109276]) +19 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-iclb5/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +5 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-kbl1/igt@gem_ctx_isolation@rcs0-s3.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@rcs0-mixed-process:
    - shard-glk:          [FAIL][55] ([i915#679]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-glk6/igt@gem_ctx_persistence@rcs0-mixed-process.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-glk7/igt@gem_ctx_persistence@rcs0-mixed-process.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [SKIP][57] ([fdo#109276] / [fdo#112080]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb6/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-iclb2/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_eio@reset-stress:
    - shard-snb:          [FAIL][59] ([i915#232]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-snb4/igt@gem_eio@reset-stress.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-snb2/igt@gem_eio@reset-stress.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][61] ([fdo#112080]) -> [PASS][62] +10 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb8/igt@gem_exec_parallel@vcs1-fds.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-iclb2/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][63] ([i915#677]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-iclb5/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][65] ([fdo#112146]) -> [PASS][66] +8 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-iclb5/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_whisper@normal:
    - shard-glk:          [DMESG-WARN][67] ([i915#118] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-glk4/igt@gem_exec_whisper@normal.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-glk3/igt@gem_exec_whisper@normal.html

  * igt@gem_mmap_gtt@basic-small-bo-tiledy:
    - shard-snb:          [DMESG-WARN][69] ([i915#478]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-snb5/igt@gem_mmap_gtt@basic-small-bo-tiledy.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-snb2/igt@gem_mmap_gtt@basic-small-bo-tiledy.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-tglb:         [INCOMPLETE][71] ([i915#472]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-tglb1/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-tglb3/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-hsw:          [INCOMPLETE][73] ([i915#61]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-hsw7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-hsw2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-apl:          [INCOMPLETE][75] ([fdo#103927] / [i915#970]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-apl3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-apl2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
    - shard-glk:          [INCOMPLETE][77] ([i915#58] / [i915#970] / [k.org#198133]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-glk2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-glk5/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
    - shard-kbl:          [INCOMPLETE][79] ([fdo#103665] / [i915#970]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-kbl7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-kbl7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-hsw:          [INCOMPLETE][81] ([i915#530] / [i915#61]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-hsw5/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-hsw1/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-kbl:          [INCOMPLETE][83] ([fdo#103665]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-kbl1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-kbl2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][85] ([i915#454]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rps@reset:
    - shard-tglb:         [FAIL][87] ([i915#413]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-tglb5/igt@i915_pm_rps@reset.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-tglb7/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@mock_requests:
    - shard-apl:          [INCOMPLETE][89] ([fdo#103927]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-apl7/igt@i915_selftest@mock_requests.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-apl2/igt@i915_selftest@mock_requests.html
    - shard-iclb:         [INCOMPLETE][91] ([i915#140]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb7/igt@i915_selftest@mock_requests.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-iclb7/igt@i915_selftest@mock_requests.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-tglb:         [FAIL][93] ([i915#49]) -> [PASS][94] +5 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][95] ([fdo#109642] / [fdo#111068]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb4/igt@kms_psr2_su@page_flip.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][97] ([fdo#109441]) -> [PASS][98] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][99] ([i915#180]) -> [PASS][100] +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-apl8/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][101] ([fdo#109276]) -> [PASS][102] +21 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb7/igt@prime_busy@hang-bsd2.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-iclb1/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][103] ([fdo#109276] / [fdo#112080]) -> [FAIL][104] ([IGT#28])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb6/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][105] ([i915#694]) -> [FAIL][106] ([i915#818])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-hsw6/igt@gem_tiled_blits@interruptible.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-hsw7/igt@gem_tiled_blits@interruptible.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][107] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][108] ([fdo#110789] / [fdo#111870] / [i915#478]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][109] ([fdo#107724]) -> [SKIP][110] ([fdo#109349])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7799/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/shard-iclb3/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#874]: https://gitlab.freedesktop.org/drm/intel/issues/874
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#970]: https://gitlab.freedesktop.org/drm/intel/issues/970
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5377 -> IGTPW_3973
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7799: 0f8a46a25a7781ef6ede604c9cb50f82cfb5e960 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3973: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/index.html
  IGT_5377: 1e6cb3e75925cf623df04f78430ae9299632ec3f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3973/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
