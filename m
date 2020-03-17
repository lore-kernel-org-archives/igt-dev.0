Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 17 Mar 2020 11:40:12 -0000
Message-ID: <158444521234.5180.2812280552048660540@emeril.freedesktop.org>
References: <20200317053247.14489-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20200317053247.14489-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fring=5Fsync=5Fcopy=3A_Removal_of_test?=
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
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_ring_sync_copy: Removal of test
URL   : https://patchwork.freedesktop.org/series/74760/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8139_full -> IGTPW_4313_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4313_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4313_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4313_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-kbl7/igt@gem_workarounds@suspend-resume.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-kbl6/igt@gem_workarounds@suspend-resume.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt:
    - shard-hsw:          [DMESG-WARN][3] ([i915#478]) -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-hsw5/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8139_full and IGTPW_4313_full:

### New IGT tests (3) ###

  * igt@sysfs_heartbeat_interval@off:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_heartbeat_interval@precise:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_preempt_timeout@idempotent:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_4313_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [i915#677]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-iclb7/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276]) +20 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb1/igt@gem_exec_schedule@independent-bsd2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-iclb3/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#677]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb3/igt@gem_exec_schedule@pi-common-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146]) +6 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy:
    - shard-hsw:          [PASS][13] -> [DMESG-WARN][14] ([i915#478])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-hsw1/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-hsw1/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
    - shard-snb:          [PASS][15] -> [DMESG-WARN][16] ([i915#478])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-snb4/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-snb4/igt@gem_mmap_gtt@cpuset-basic-small-copy.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#644])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [PASS][19] -> [DMESG-WARN][20] ([fdo#111870] / [i915#478])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([i915#1316])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb5/igt@i915_pm_rpm@gem-execbuf.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-iclb6/igt@i915_pm_rpm@gem-execbuf.html
    - shard-glk:          [PASS][23] -> [SKIP][24] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-glk6/igt@i915_pm_rpm@gem-execbuf.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-glk1/igt@i915_pm_rpm@gem-execbuf.html
    - shard-tglb:         [PASS][25] -> [SKIP][26] ([i915#1316])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-tglb7/igt@i915_pm_rpm@gem-execbuf.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-tglb6/igt@i915_pm_rpm@gem-execbuf.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#49])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#49])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-iclb6/igt@kms_psr@psr2_cursor_blt.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][35] -> [FAIL][36] ([i915#1085])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-tglb5/igt@perf@gen12-mi-rpc.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-tglb2/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#112080]) +11 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-iclb3/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-iclb:         [INCOMPLETE][39] ([i915#1402]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb8/igt@gem_ctx_persistence@close-replace-race.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-iclb1/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [SKIP][41] ([fdo#109276] / [i915#677]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb5/igt@gem_exec_schedule@implicit-both-bsd1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@pi-common-bsd1:
    - shard-iclb:         [SKIP][43] ([fdo#109276]) -> [PASS][44] +18 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][45] ([i915#677]) -> [PASS][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [SKIP][47] ([fdo#112146]) -> [PASS][48] +5 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb1/igt@gem_exec_schedule@wide-bsd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-iclb3/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-snb:          [DMESG-WARN][49] ([fdo#110789] / [i915#478]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-snb6/igt@gem_partial_pwrite_pread@write-uncached.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-snb5/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][51] ([i915#644]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [FAIL][53] ([i915#644]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-kbl7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][55] ([i915#413]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb6/igt@i915_pm_rps@reset.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-iclb6/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live@execlists:
    - shard-apl:          [INCOMPLETE][57] ([fdo#103927] / [i915#656]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-apl6/igt@i915_selftest@live@execlists.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-apl8/igt@i915_selftest@live@execlists.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][59] ([i915#72]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][61] ([fdo#109349]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][63] ([i915#79]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +5 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-apl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][69] ([i915#899]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][71] ([fdo#109441]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb1/igt@kms_psr@psr2_no_drrs.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][73] ([i915#31]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-apl8/igt@kms_setmode@basic.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-apl8/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:
    - shard-glk:          [SKIP][75] ([fdo#109271]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-glk5/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-glk8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-tglb:         [SKIP][77] ([fdo#112015]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-tglb2/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-iclb:         [SKIP][79] ([fdo#109278]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-iclb4/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-hsw:          [INCOMPLETE][81] ([i915#61]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-hsw4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf_pmu@busy-accuracy-2-vcs1:
    - shard-iclb:         [SKIP][83] ([fdo#112080]) -> [PASS][84] +12 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-iclb6/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-iclb1/igt@perf_pmu@busy-accuracy-2-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-apl:          [INCOMPLETE][85] ([fdo#103927]) -> [INCOMPLETE][86] ([fdo#103927] / [i915#1402])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-apl4/igt@gem_ctx_persistence@close-replace-race.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-apl4/igt@gem_ctx_persistence@close-replace-race.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][87] ([i915#454]) -> [SKIP][88] ([i915#468]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-tglb8/igt@i915_pm_dc@dc6-psr.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][89], [FAIL][90], [FAIL][91]) ([fdo#103927] / [i915#1402] / [i915#529]) -> ([FAIL][92], [FAIL][93]) ([fdo#103927] / [i915#1402])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-apl6/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-apl6/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/shard-apl4/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-apl4/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/shard-apl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5512 -> IGTPW_4313
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8139: 1516ff1b2279ede916d81b1978da0428414705f8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4313: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/index.html
  IGT_5512: f6fef7eff6f121e5e89afd7e70116f471ccd5b8b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
