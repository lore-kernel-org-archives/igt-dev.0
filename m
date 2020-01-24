Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 24 Jan 2020 14:47:11 -0000
Message-ID: <157987723115.15091.9009625243072884860@emeril.freedesktop.org>
References: <20200123111536.28216-1-petri.latvala@intel.com>
In-Reply-To: <20200123111536.28216-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Don=27t_check_for_taints_when_not_configured_for_it?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: runner: Don't check for taints when not configured for it
URL   : https://patchwork.freedesktop.org/series/72458/
State : success

== Summary ==

CI Bug Log - changes from IGT_5379_full -> IGTPW_3976_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/index.html

Known issues
------------

  Here are the changes found in IGTPW_3976_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb4/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-iclb5/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#110854])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb4/igt@gem_exec_balancer@smoke.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-iclb3/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112080]) +4 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-iclb5/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-ringfull-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb8/igt@gem_exec_schedule@pi-ringfull-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-iclb2/igt@gem_exec_schedule@pi-ringfull-bsd.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#677])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb7/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive:
    - shard-glk:          [PASS][11] -> [INCOMPLETE][12] ([i915#530] / [i915#58] / [k.org#198133])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-glk6/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-glk8/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-hsw:          [PASS][13] -> [FAIL][14] ([i915#520])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-hsw1/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-hsw6/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-thrash-inactive:
    - shard-iclb:         [PASS][15] -> [INCOMPLETE][16] ([i915#140])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb1/igt@gem_persistent_relocs@forked-thrash-inactive.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-iclb1/igt@gem_persistent_relocs@forked-thrash-inactive.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-hsw:          [PASS][19] -> [FAIL][20] ([i915#694])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-hsw1/igt@gen7_exec_parse@basic-offset.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-hsw2/igt@gen7_exec_parse@basic-offset.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][21] -> [INCOMPLETE][22] ([i915#58] / [k.org#198133])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-glk6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#454])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#413])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb4/igt@i915_pm_rps@reset.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-iclb2/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@mock_requests:
    - shard-apl:          [PASS][27] -> [INCOMPLETE][28] ([fdo#103927])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-apl7/igt@i915_selftest@mock_requests.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-apl6/igt@i915_selftest@mock_requests.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-kbl:          [PASS][29] -> [DMESG-FAIL][30] ([i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-kbl1/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-kbl2/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#407])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-glk1/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-glk7/igt@kms_flip@dpms-vs-vblank-race-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         [PASS][33] -> [FAIL][34] ([i915#49]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-iclb4/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][39] -> [FAIL][40] ([i915#31])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-hsw5/igt@kms_setmode@basic.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-hsw1/igt@kms_setmode@basic.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-hsw:          [PASS][41] -> [INCOMPLETE][42] ([i915#61]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-hsw2/igt@perf_pmu@cpu-hotplug.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-hsw6/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109276]) +18 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb4/igt@prime_busy@hang-bsd2.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-iclb7/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vecs0-s3:
    - shard-apl:          [DMESG-WARN][45] ([i915#180]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-apl6/igt@gem_ctx_isolation@vecs0-s3.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-apl4/igt@gem_ctx_isolation@vecs0-s3.html

  * igt@gem_ctx_persistence@vcs0-mixed-process:
    - shard-glk:          [FAIL][47] ([i915#679]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-glk2/igt@gem_ctx_persistence@vcs0-mixed-process.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-glk8/igt@gem_ctx_persistence@vcs0-mixed-process.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][49] ([fdo#109276] / [fdo#112080]) -> [PASS][50] +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb5/igt@gem_ctx_persistence@vcs1-queued.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-iclb2/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][51] ([fdo#112146]) -> [PASS][52] +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb4/igt@gem_exec_schedule@in-order-bsd.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-iclb7/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][53] ([fdo#109276]) -> [PASS][54] +17 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +5 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-kbl7/igt@gem_exec_suspend@basic-s3.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-kbl4/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-apl:          [INCOMPLETE][57] ([fdo#103927] / [i915#530]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-apl1/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-apl1/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-snb:          [FAIL][59] ([i915#520]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-snb1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-snb4/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-iclb:         [INCOMPLETE][61] ([fdo#109100] / [i915#140]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb3/igt@gem_persistent_relocs@forked-thrashing.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-iclb3/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][63] ([fdo#111870] / [i915#478]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          [INCOMPLETE][65] ([fdo#103665]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-kbl1/igt@gem_workarounds@suspend-resume.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-kbl7/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][67] ([i915#454]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-iclb7/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_cursor_crc@pipe-c-cursor-dpms:
    - shard-apl:          [FAIL][69] ([i915#54]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-dpms.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][71] ([i915#72]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - shard-snb:          [SKIP][73] ([fdo#109271]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-snb5/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-snb5/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-toggle:
    - shard-hsw:          [INCOMPLETE][75] ([i915#61]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-hsw5/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-hsw5/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-glk:          [FAIL][77] ([i915#49]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-tglb:         [FAIL][79] ([i915#49]) -> [PASS][80] +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82] +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf_pmu@busy-accuracy-2-vcs1:
    - shard-iclb:         [SKIP][83] ([fdo#112080]) -> [PASS][84] +12 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb3/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-iclb1/igt@perf_pmu@busy-accuracy-2-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][85] ([IGT#28]) -> [SKIP][86] ([fdo#109276] / [fdo#112080])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-apl:          [INCOMPLETE][87] ([fdo#103927] / [i915#530]) -> [INCOMPLETE][88] ([fdo#103927])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-apl6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-apl7/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-hsw:          [INCOMPLETE][89] ([i915#530] / [i915#61]) -> [INCOMPLETE][90] ([i915#61]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-hsw2/igt@gem_persistent_relocs@forked-thrashing.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-hsw6/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][91] ([i915#818]) -> [FAIL][92] ([i915#694])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-hsw1/igt@gem_tiled_blits@interruptible.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-hsw5/igt@gem_tiled_blits@interruptible.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][93] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][94] ([fdo#111870] / [i915#478])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-snb2/igt@gem_userptr_blits@sync-unmap.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-snb2/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_rpm@gem-mmap-gtt:
    - shard-snb:          [SKIP][95] ([fdo#109271]) -> [INCOMPLETE][96] ([i915#82])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-snb1/igt@i915_pm_rpm@gem-mmap-gtt.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-snb6/igt@i915_pm_rpm@gem-mmap-gtt.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-kbl:          [DMESG-WARN][97] ([i915#180]) -> [INCOMPLETE][98] ([fdo#103665] / [i915#600])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-kbl4/igt@kms_flip@flip-vs-suspend.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/shard-kbl7/igt@kms_flip@flip-vs-suspend.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109100]: https://bugs.freedesktop.org/show_bug.cgi?id=109100
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#600]: https://gitlab.freedesktop.org/drm/intel/issues/600
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5379 -> IGTPW_3976

  CI-20190529: 20190529
  CI_DRM_7801: 6e1cfbab49286533a902e0c265249b80e5cf71da @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3976: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/index.html
  IGT_5379: b8d03fef6f135c27b3f45f820e62d40aac956471 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3976/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
