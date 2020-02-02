Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 02 Feb 2020 04:41:57 -0000
Message-ID: <158061851713.17038.17833078569744356700@emeril.freedesktop.org>
References: <20200130151229.984-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200130151229.984-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D_lib/vec=3A_Add_igt=5Fvec?=
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/3] lib/vec: Add igt_vec
URL   : https://patchwork.freedesktop.org/series/72778/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7844_full -> IGTPW_4042_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4042_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4042_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4042_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  
Known issues
------------

  Here are the changes found in IGTPW_4042_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-apl3/igt@gem_ctx_isolation@rcs0-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-apl1/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112080]) +17 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb2/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-iclb3/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110854])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb4/igt@gem_exec_balancer@smoke.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-iclb5/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#677])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb6/igt@gem_exec_schedule@pi-userfault-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-iclb4/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146]) +4 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb5/igt@gem_exec_schedule@preempt-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-iclb2/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109276]) +22 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_userptr_blits@map-fixed-invalidate-gup:
    - shard-snb:          [PASS][15] -> [DMESG-WARN][16] ([i915#478]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-gup.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-gup.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#447])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb7/igt@i915_pm_dc@dc5-dpms.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#454])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@live_gtt:
    - shard-apl:          [PASS][21] -> [TIMEOUT][22] ([fdo#112271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-apl3/igt@i915_selftest@live_gtt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-apl6/igt@i915_selftest@live_gtt.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-snb:          [PASS][23] -> [SKIP][24] ([fdo#109271]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb5/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-snb6/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_color@pipe-a-gamma:
    - shard-tglb:         [PASS][25] -> [FAIL][26] ([i915#71])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-tglb8/igt@kms_color@pipe-a-gamma.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-tglb8/igt@kms_color@pipe-a-gamma.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-random:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#54])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-tglb:         [PASS][31] -> [FAIL][32] ([IGT#5])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [PASS][33] -> [INCOMPLETE][34] ([i915#61])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-hsw1/igt@kms_flip@flip-vs-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-hsw2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +4 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-tglb:         [PASS][37] -> [SKIP][38] ([i915#668]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][41] -> [FAIL][42] ([i915#31])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-apl1/igt@kms_setmode@basic.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-apl6/igt@kms_setmode@basic.html
    - shard-hsw:          [PASS][43] -> [FAIL][44] ([i915#31])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-hsw5/igt@kms_setmode@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-hsw2/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][45] -> [INCOMPLETE][46] ([fdo#103665])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][47] -> [FAIL][48] ([i915#831])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Possible fixes ####

  * igt@gem_caching@reads:
    - shard-hsw:          [FAIL][49] ([i915#694]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-hsw2/igt@gem_caching@reads.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-hsw1/igt@gem_caching@reads.html

  * igt@gem_exec_schedule@preempt-queue-bsd2:
    - shard-iclb:         [SKIP][51] ([fdo#109276]) -> [PASS][52] +11 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb7/igt@gem_exec_schedule@preempt-queue-bsd2.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd2.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][53] ([fdo#112146]) -> [PASS][54] +6 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-iclb6/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][55] ([i915#644]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][57] ([fdo#111870] / [i915#478]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-apl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-apl4/igt@gem_workarounds@suspend-resume-fd.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-apl3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][61] ([i915#454]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-iclb7/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][63] ([i915#413]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb5/igt@i915_pm_rps@waitboost.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-iclb8/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-kbl7/igt@i915_suspend@fence-restore-untiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-kbl6/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_color@pipe-c-ctm-green-to-red:
    - shard-kbl:          [FAIL][67] ([i915#129]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-kbl1/igt@kms_color@pipe-c-ctm-green-to-red.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-kbl3/igt@kms_color@pipe-c-ctm-green-to-red.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-hsw:          [INCOMPLETE][69] ([CI#80] / [i915#61]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-hsw2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-hsw5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][71] ([fdo#109642] / [fdo#111068]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb4/igt@kms_psr2_su@page_flip.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb8/igt@kms_psr@psr2_basic.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [TIMEOUT][75] ([fdo#112271] / [i915#1085] / [i915#472]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-tglb6/igt@perf@gen12-mi-rpc.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-tglb3/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][77] ([fdo#112080]) -> [PASS][78] +10 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb7/igt@perf_pmu@busy-vcs1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-iclb2/igt@perf_pmu@busy-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][79] ([IGT#28]) -> [SKIP][80] ([fdo#112080]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-apl:          [TIMEOUT][81] ([fdo#112271]) -> [INCOMPLETE][82] ([CI#80] / [fdo#103927])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-apl7/igt@gem_eio@in-flight-contexts-10ms.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-apl4/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_eio@in-flight-contexts-immediate:
    - shard-glk:          [TIMEOUT][83] ([fdo#112271]) -> [INCOMPLETE][84] ([CI#80] / [i915#58] / [k.org#198133])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-glk3/igt@gem_eio@in-flight-contexts-immediate.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-glk3/igt@gem_eio@in-flight-contexts-immediate.html

  * igt@gem_eio@in-flight-immediate:
    - shard-glk:          [INCOMPLETE][85] ([CI#80] / [i915#58] / [k.org#198133]) -> [TIMEOUT][86] ([fdo#112271])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-glk2/igt@gem_eio@in-flight-immediate.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-glk3/igt@gem_eio@in-flight-immediate.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][87] ([i915#818]) -> [FAIL][88] ([i915#694]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-hsw2/igt@gem_tiled_blits@normal.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-hsw5/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][89] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][90] ([fdo#111870] / [i915#478])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-snb:          [INCOMPLETE][91] ([i915#82]) -> [SKIP][92] ([fdo#109271])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb2/igt@i915_pm_rpm@pm-tiling.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-snb2/igt@i915_pm_rpm@pm-tiling.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][93] ([fdo#107724]) -> [SKIP][94] ([fdo#109349])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][95], [FAIL][96], [FAIL][97], [FAIL][98], [FAIL][99], [FAIL][100], [FAIL][101]) ([i915#1077]) -> ([FAIL][102], [FAIL][103], [FAIL][104], [FAIL][105], [FAIL][106], [FAIL][107], [FAIL][108], [FAIL][109], [FAIL][110]) ([i915#1077] / [i915#698])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb4/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb6/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb1/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb5/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb1/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb2/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7844/shard-snb5/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-snb2/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-snb4/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-snb2/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-snb5/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-snb2/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-snb2/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-snb2/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-snb2/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/shard-snb4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5407 -> IGTPW_4042
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7844: 47faa2a989ef89a15089190a5f942a2d2a34fda5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4042: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/index.html
  IGT_5407: a9d69f51dadbcbc53527671f87572d05c3370cba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4042/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
