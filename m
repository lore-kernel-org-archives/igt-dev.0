Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 23 Mar 2020 14:48:32 -0000
Message-ID: <158497491284.9809.8104484969459997490@emeril.freedesktop.org>
References: <20200323084828.20695-1-imre.deak@intel.com>
In-Reply-To: <20200323084828.20695-1-imre.deak@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fchamelium=3A_Fix_waiting_for_hotplug_uevents?=
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_chamelium: Fix waiting for hotplug uevents
URL   : https://patchwork.freedesktop.org/series/74966/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8175_full -> IGTPW_4341_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/index.html

Known issues
------------

  Here are the changes found in IGTPW_4341_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +18 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-iclb1/igt@gem_busy@extended-parallel-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-iclb8/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-apl8/igt@gem_ctx_isolation@rcs0-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-apl1/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_eio@kms:
    - shard-glk:          [PASS][5] -> [TIMEOUT][6] ([i915#1383])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-glk2/igt@gem_eio@kms.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-glk2/igt@gem_eio@kms.html

  * igt@gem_exec_schedule@implicit-read-write-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([i915#677])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-iclb5/igt@gem_exec_schedule@implicit-read-write-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd.html

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276] / [i915#677])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-iclb5/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276]) +27 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-iclb2/igt@gem_exec_schedule@independent-bsd2.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-iclb8/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-shared-iova-blt:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#859])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-glk4/igt@gem_exec_schedule@pi-shared-iova-blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-glk7/igt@gem_exec_schedule@pi-shared-iova-blt.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#112146]) +6 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-iclb8/igt@gem_exec_schedule@reorder-wide-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_linear_blits@interruptible:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#1263])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-apl2/igt@gem_linear_blits@interruptible.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-apl2/igt@gem_linear_blits@interruptible.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-hsw:          [PASS][19] -> [SKIP][20] ([fdo#109271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-hsw2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-hsw7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-glk:          [PASS][21] -> [SKIP][22] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-glk5/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-glk3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_selftest@live@execlists:
    - shard-apl:          [PASS][23] -> [INCOMPLETE][24] ([fdo#103927] / [i915#1430] / [i915#656])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-apl2/igt@i915_selftest@live@execlists.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-apl6/igt@i915_selftest@live@execlists.html
    - shard-kbl:          [PASS][25] -> [INCOMPLETE][26] ([fdo#112259] / [i915#656])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-kbl1/igt@i915_selftest@live@execlists.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-kbl6/igt@i915_selftest@live@execlists.html

  * igt@kms_atomic_transition@2x-modeset-transitions-nonblocking:
    - shard-glk:          [PASS][27] -> [INCOMPLETE][28] ([i915#58] / [k.org#198133])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-glk1/igt@kms_atomic_transition@2x-modeset-transitions-nonblocking.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-glk5/igt@kms_atomic_transition@2x-modeset-transitions-nonblocking.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-random:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#54]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-snb:          [PASS][33] -> [DMESG-WARN][34] ([i915#42])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-snb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-snb6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-iclb2/igt@kms_psr@psr2_dpms.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-iclb5/igt@kms_psr@psr2_dpms.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#31])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-apl2/igt@kms_setmode@basic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-apl6/igt@kms_setmode@basic.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][39] -> [FAIL][40] ([i915#1085])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-tglb1/igt@perf@gen12-mi-rpc.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-tglb7/igt@perf@gen12-mi-rpc.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][41] ([fdo#112080]) -> [PASS][42] +5 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-iclb7/igt@gem_exec_parallel@vcs1-fds.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-write-read-bsd2:
    - shard-iclb:         [SKIP][43] ([fdo#109276] / [i915#677]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-iclb8/igt@gem_exec_schedule@implicit-write-read-bsd2.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-iclb2/igt@gem_exec_schedule@implicit-write-read-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][45] ([i915#677]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][47] ([fdo#112146]) -> [PASS][48] +5 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][49] ([i915#644]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [INCOMPLETE][51] ([fdo#103927]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +5 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [FAIL][55] ([i915#79]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-hsw:          [INCOMPLETE][57] ([i915#61]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-hsw2/igt@kms_flip@2x-flip-vs-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-hsw8/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-glk:          [FAIL][59] ([i915#49]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - shard-snb:          [SKIP][61] ([fdo#109271]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-snb2/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-snb2/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][65] ([i915#899]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-glk2/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][67] ([fdo#109441]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-iclb1/igt@kms_psr@psr2_no_drrs.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-kbl:          [INCOMPLETE][69] ([i915#155]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@prime_busy@after-bsd2:
    - shard-iclb:         [SKIP][71] ([fdo#109276]) -> [PASS][72] +14 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-iclb5/igt@prime_busy@after-bsd2.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-iclb2/igt@prime_busy@after-bsd2.html

  
#### Warnings ####

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][73] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][74] ([fdo#110789] / [fdo#111870] / [i915#478])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-snb2/igt@gem_userptr_blits@sync-unmap.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-snb6/igt@gem_userptr_blits@sync-unmap.html
    - shard-hsw:          [DMESG-WARN][75] ([fdo#111870]) -> [DMESG-WARN][76] ([fdo#110789] / [fdo#111870])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-hsw7/igt@gem_userptr_blits@sync-unmap.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-hsw1/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglb:         [SKIP][77] ([fdo#111644] / [i915#1397]) -> [SKIP][78] ([i915#1316])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-iclb:         [SKIP][79] ([fdo#110892]) -> [SKIP][80] ([i915#1316])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [INCOMPLETE][81] ([i915#155] / [i915#648]) -> [DMESG-WARN][82] ([i915#180])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][83] ([i915#92]) -> ([FAIL][84], [FAIL][85]) ([i915#656] / [i915#92])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-kbl7/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-kbl6/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-kbl3/igt@runner@aborted.html
    - shard-apl:          ([FAIL][86], [FAIL][87]) ([fdo#103927] / [i915#1402]) -> ([FAIL][88], [FAIL][89], [FAIL][90]) ([fdo#103927] / [i915#1402] / [i915#529])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-apl1/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/shard-apl7/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-apl4/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-apl6/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/shard-apl6/igt@runner@aborted.html

  
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112259]: https://bugs.freedesktop.org/show_bug.cgi?id=112259
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1263]: https://gitlab.freedesktop.org/drm/intel/issues/1263
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1383]: https://gitlab.freedesktop.org/drm/intel/issues/1383
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#1430]: https://gitlab.freedesktop.org/drm/intel/issues/1430
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#859]: https://gitlab.freedesktop.org/drm/intel/issues/859
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5527 -> IGTPW_4341
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8175: 75b2b15f2ab26f5373a13ece8e5d40b472333d0e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4341: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/index.html
  IGT_5527: 0ab05a51a059645d2e12e553a1de1d97451f57c5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
