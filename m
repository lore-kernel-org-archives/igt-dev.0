Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 06 Feb 2020 11:18:29 -0000
Message-ID: <158098790966.14483.9536179089371913498@emeril.freedesktop.org>
References: <20200204013043.584-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20200204013043.584-1-vinay.belgaumkar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fuserptr=5Fblits=3A_Add_aperture_check?=
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
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_userptr_blits: Add aperture check
URL   : https://patchwork.freedesktop.org/series/72951/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7863_full -> IGTPW_4086_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4086_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4086_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4086_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-gup:
    - shard-iclb:         [PASS][1] -> [SKIP][2] +7 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-gup.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-iclb8/igt@gem_userptr_blits@map-fixed-invalidate-overlap-gup.html

  
Known issues
------------

  Here are the changes found in IGTPW_4086_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_caching@writes:
    - shard-hsw:          [PASS][3] -> [FAIL][4] ([i915#694])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-hsw7/igt@gem_caching@writes.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-hsw2/igt@gem_caching@writes.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180]) +7 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-kbl3/igt@gem_ctx_isolation@rcs0-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-kbl1/igt@gem_ctx_isolation@rcs0-s3.html
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180]) +5 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-apl6/igt@gem_ctx_isolation@rcs0-s3.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-apl6/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +7 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb6/igt@gem_exec_schedule@wide-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-iclb1/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-apl:          [PASS][11] -> [SKIP][12] ([fdo#109271]) +7 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-apl1/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-apl3/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
    - shard-kbl:          [PASS][13] -> [SKIP][14] ([fdo#109271]) +7 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-kbl1/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-kbl1/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
    - shard-hsw:          [PASS][15] -> [SKIP][16] ([fdo#109271]) +7 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-hsw6/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-glk:          [PASS][17] -> [SKIP][18] ([fdo#109271]) +7 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-glk2/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-glk1/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
    - shard-snb:          [PASS][19] -> [SKIP][20] ([fdo#109271]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
    - shard-tglb:         [PASS][21] -> [SKIP][22] ([fdo#112099]) +6 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-tglb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-tglb1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [PASS][23] -> [DMESG-WARN][24] ([fdo#111870] / [i915#478])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-snb4/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#454])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([IGT#5] / [i915#697])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [PASS][29] -> [INCOMPLETE][30] ([i915#61])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-hsw5/igt@kms_flip@flip-vs-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-hsw2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][33] -> [FAIL][34] ([i915#31])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-hsw4/igt@kms_setmode@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-hsw4/igt@kms_setmode@basic.html

  * igt@perf@oa-exponents:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#84])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-glk9/igt@perf@oa-exponents.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-glk8/igt@perf@oa-exponents.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#112080]) +12 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-iclb6/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109276]) +21 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb2/igt@prime_busy@hang-bsd2.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-iclb8/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [SKIP][41] ([fdo#112080]) -> [PASS][42] +11 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb5/igt@gem_busy@extended-parallel-vcs1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-iclb1/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][43] ([fdo#110854]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb6/igt@gem_exec_balancer@smoke.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-iclb1/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][45] ([fdo#112146]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb1/igt@gem_exec_schedule@in-order-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-iclb6/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-distinct-iova-blt:
    - shard-glk:          [FAIL][47] ([i915#859]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-glk5/igt@gem_exec_schedule@pi-distinct-iova-blt.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-glk1/igt@gem_exec_schedule@pi-distinct-iova-blt.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][49] ([i915#677]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][51] ([fdo#109276]) -> [PASS][52] +17 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_mmap_gtt@big-copy-odd:
    - shard-snb:          [DMESG-WARN][53] ([i915#478]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-snb5/igt@gem_mmap_gtt@big-copy-odd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-snb1/igt@gem_mmap_gtt@big-copy-odd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-hsw:          [FAIL][55] ([i915#694]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_ringfill@basic-default-hang:
    - shard-iclb:         [INCOMPLETE][57] ([i915#140]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb5/igt@gem_ringfill@basic-default-hang.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-iclb6/igt@gem_ringfill@basic-default-hang.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][59] ([i915#553] / [i915#725]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-hsw6/igt@i915_selftest@live_blt.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-hsw1/igt@i915_selftest@live_blt.html

  * igt@kms_cursor_crc@pipe-a-cursor-dpms:
    - shard-apl:          [FAIL][61] ([i915#54]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [FAIL][63] ([i915#79]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         [SKIP][65] ([i915#668]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-apl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
    - shard-kbl:          [DMESG-WARN][69] ([i915#180]) -> [PASS][70] +4 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][71] ([i915#173]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb1/igt@kms_psr@no_drrs.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-iclb5/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb6/igt@kms_psr@psr2_basic.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][75] ([i915#31]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-apl8/igt@kms_setmode@basic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-apl6/igt@kms_setmode@basic.html

  * igt@perf@short-reads:
    - shard-apl:          [TIMEOUT][77] ([fdo#112271] / [i915#51]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-apl2/igt@perf@short-reads.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-apl1/igt@perf@short-reads.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-hsw:          [INCOMPLETE][79] ([i915#61]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-hsw6/igt@perf_pmu@cpu-hotplug.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-hsw5/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][81] ([i915#831]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-hsw4/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][83] ([fdo#112080]) -> [FAIL][84] ([IGT#28])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][85] ([i915#694]) -> [FAIL][86] ([i915#818])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-hsw7/igt@gem_tiled_blits@normal.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-hsw7/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][87] ([fdo#111870] / [i915#478]) -> [SKIP][88] ([fdo#109271]) +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7863/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112099]: https://bugs.freedesktop.org/show_bug.cgi?id=112099
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#51]: https://gitlab.freedesktop.org/drm/intel/issues/51
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#697]: https://gitlab.freedesktop.org/drm/intel/issues/697
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#84]: https://gitlab.freedesktop.org/drm/intel/issues/84
  [i915#859]: https://gitlab.freedesktop.org/drm/intel/issues/859


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5417 -> IGTPW_4086
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7863: 8ae46cc3902da96a0744a7237dce4b17747438b4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4086: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/index.html
  IGT_5417: 33cc93c8ba5daa0b7498f297a4f626844d895d06 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4086/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
