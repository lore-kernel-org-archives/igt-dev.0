Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 02 Feb 2020 06:02:37 -0000
Message-ID: <158062335713.17038.7399222175730556337@emeril.freedesktop.org>
References: <20200130151757.14104-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200130151757.14104-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Ftiled=5F=2E*blits=3A_skip_the_tests_on_newer_gens?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_tiled_.*blits: skip the tests on newer gens
URL   : https://patchwork.freedesktop.org/series/72779/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7844_full -> IGTPW_4043_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4043_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4043_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4043_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-glk8/igt@gen9_exec_parse@allowed-all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-glk2/igt@gen9_exec_parse@allowed-all.html

  
Known issues
------------

  Here are the changes found in IGTPW_4043_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_caching@writes:
    - shard-hsw:          [PASS][3] -> [FAIL][4] ([i915#694]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-hsw1/igt@gem_caching@writes.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-hsw5/igt@gem_caching@writes.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112080]) +18 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb2/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-iclb8/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([i915#677])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb6/igt@gem_exec_schedule@pi-userfault-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb5/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276]) +16 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@i915_suspend@debugfs-reader:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-apl1/igt@i915_suspend@debugfs-reader.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-apl4/igt@i915_suspend@debugfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#54]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#54]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#54])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#72])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-hsw:          [PASS][23] -> [FAIL][24] ([i915#46])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-hsw2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-hsw1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#79])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-apl7/igt@kms_flip@flip-vs-expired-vblank.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-apl4/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-snb:          [PASS][27] -> [DMESG-WARN][28] ([i915#42])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb5/igt@kms_flip@flip-vs-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-snb5/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +5 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-iclb:         [PASS][31] -> [INCOMPLETE][32] ([i915#250])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#31])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-apl1/igt@kms_setmode@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-apl3/igt@kms_setmode@basic.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][37] -> [FAIL][38] ([i915#831])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-hsw1/igt@prime_mmap_coherency@ioctl-errors.html

  * igt@prime_mmap_coherency@read:
    - shard-hsw:          [PASS][39] -> [FAIL][40] ([i915#914])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-hsw1/igt@prime_mmap_coherency@read.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-hsw5/igt@prime_mmap_coherency@read.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][41] ([fdo#112080]) -> [PASS][42] +14 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb8/igt@gem_busy@busy-vcs1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-iclb4/igt@gem_busy@busy-vcs1.html

  * igt@gem_caching@reads:
    - shard-hsw:          [FAIL][43] ([i915#694]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-hsw2/igt@gem_caching@reads.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-hsw5/igt@gem_caching@reads.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][45] ([i915#180]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-kbl3/igt@gem_ctx_isolation@rcs0-s3.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][47] ([fdo#112146]) -> [PASS][48] +8 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-iclb8/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-apl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-apl4/igt@gem_workarounds@suspend-resume-fd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-apl2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][51] ([i915#454]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-iclb8/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][53] ([i915#413]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb8/igt@i915_pm_rps@reset.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-iclb4/igt@i915_pm_rps@reset.html

  * igt@kms_color@pipe-c-ctm-green-to-red:
    - shard-kbl:          [FAIL][55] ([i915#129]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-kbl1/igt@kms_color@pipe-c-ctm-green-to-red.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-kbl7/igt@kms_color@pipe-c-ctm-green-to-red.html
    - shard-apl:          [FAIL][57] ([i915#129]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-apl7/igt@kms_color@pipe-c-ctm-green-to-red.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-apl1/igt@kms_color@pipe-c-ctm-green-to-red.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-hsw:          [INCOMPLETE][59] ([CI#80] / [i915#61]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-hsw2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-hsw5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][61] ([i915#79]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][63] ([i915#173]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb1/igt@kms_psr@no_drrs.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-iclb5/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][65] ([fdo#109441]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb8/igt@kms_psr@psr2_dpms.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-iclb2/igt@kms_psr@psr2_dpms.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][67] ([fdo#109276]) -> [PASS][68] +20 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb8/igt@prime_busy@hang-bsd2.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-iclb2/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][69] ([IGT#28]) -> [SKIP][70] ([fdo#112080]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_eio@in-flight-immediate:
    - shard-glk:          [INCOMPLETE][71] ([CI#80] / [i915#58] / [k.org#198133]) -> [TIMEOUT][72] ([fdo#112271])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-glk2/igt@gem_eio@in-flight-immediate.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-glk8/igt@gem_eio@in-flight-immediate.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][73] ([i915#818]) -> [FAIL][74] ([i915#694])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-hsw2/igt@gem_tiled_blits@normal.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-hsw5/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][75] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][76] ([fdo#111870] / [i915#478])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][77] ([i915#454]) -> [SKIP][78] ([i915#468])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-tglb7/igt@i915_pm_dc@dc6-psr.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@legacy-planes-dpms:
    - shard-snb:          [SKIP][79] ([fdo#109271]) -> [INCOMPLETE][80] ([i915#82])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb2/igt@i915_pm_rpm@legacy-planes-dpms.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-snb1/igt@i915_pm_rpm@legacy-planes-dpms.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][81] ([fdo#107724]) -> [SKIP][82] ([fdo#109349])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#914]: https://gitlab.freedesktop.org/drm/intel/issues/914
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5407 -> IGTPW_4043
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7844: 47faa2a989ef89a15089190a5f942a2d2a34fda5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4043: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/index.html
  IGT_5407: a9d69f51dadbcbc53527671f87572d05c3370cba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4043/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
