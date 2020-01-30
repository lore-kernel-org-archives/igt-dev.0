Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 30 Jan 2020 06:47:06 -0000
Message-ID: <158036682697.21032.8736596316187080265@emeril.freedesktop.org>
References: <cover.1580236781.git.dale.b.stimson@intel.com>
In-Reply-To: <cover.1580236781.git.dale.b.stimson@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Fisolation=3A_=5F=5Ffor=5Feach=5Fphysical=5Fengine_+_?=
 =?utf-8?q?engine_mapping?=
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
To: Dale B Stimson <dale.b.stimson@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_ctx_isolation: __for_each_physical_engine + engine mapping
URL   : https://patchwork.freedesktop.org/series/72686/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7833_full -> IGTPW_4022_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4022_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4022_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4022_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@in-flight-suspend:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb4/igt@gem_eio@in-flight-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-iclb6/igt@gem_eio@in-flight-suspend.html

  * igt@runner@aborted:
    - shard-apl:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-apl1/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4022_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([fdo#112080]) +15 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb2/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-iclb3/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb1/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-iclb7/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#110854])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb1/igt@gem_exec_balancer@smoke.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-iclb6/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([i915#677])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb5/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#109276]) +13 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb1/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-iclb8/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#112146]) +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb5/igt@gem_exec_schedule@wide-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-iclb1/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-hsw:          [PASS][16] -> [FAIL][17] ([i915#520])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-hsw8/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-hsw7/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][18] -> [FAIL][19] ([i915#644])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-apl:          [PASS][20] -> [FAIL][21] ([i915#644])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [PASS][22] -> [FAIL][23] ([i915#818])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-hsw8/igt@gem_tiled_blits@interruptible.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-hsw1/igt@gem_tiled_blits@interruptible.html

  * igt@gem_workarounds@reset-fd:
    - shard-apl:          [PASS][24] -> [SKIP][25] ([fdo#109271]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-apl2/igt@gem_workarounds@reset-fd.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-apl3/igt@gem_workarounds@reset-fd.html
    - shard-glk:          [PASS][26] -> [SKIP][27] ([fdo#109271]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-glk3/igt@gem_workarounds@reset-fd.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-glk5/igt@gem_workarounds@reset-fd.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][28] -> [DMESG-WARN][29] ([i915#180]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-hsw:          [PASS][30] -> [FAIL][31] ([i915#694])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-hsw8/igt@gen7_exec_parse@basic-offset.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-hsw2/igt@gen7_exec_parse@basic-offset.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][32] -> [FAIL][33] ([i915#454])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [PASS][34] -> [DMESG-FAIL][35] ([i915#553] / [i915#725])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-hsw5/igt@i915_selftest@live_blt.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-hsw4/igt@i915_selftest@live_blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-iclb:         [PASS][36] -> [INCOMPLETE][37] ([i915#123])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][38] -> [SKIP][39] ([fdo#109642] / [fdo#111068])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-iclb3/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][40] -> [SKIP][41] ([fdo#109441]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-iclb7/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][42] -> [INCOMPLETE][43] ([fdo#103665])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][44] -> [FAIL][45] ([i915#831])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-hsw4/igt@prime_mmap_coherency@ioctl-errors.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][46] ([fdo#112080]) -> [PASS][47] +9 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb3/igt@gem_busy@busy-vcs1.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-iclb1/igt@gem_busy@busy-vcs1.html

  * igt@gem_caching@reads:
    - shard-hsw:          [FAIL][48] ([i915#694]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-hsw5/igt@gem_caching@reads.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-hsw5/igt@gem_caching@reads.html

  * {igt@gem_ctx_persistence@hostile}:
    - shard-iclb:         [FAIL][50] -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb4/igt@gem_ctx_persistence@hostile.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-iclb5/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@vcs0-queued:
    - shard-tglb:         [INCOMPLETE][52] ([i915#472]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-tglb6/igt@gem_ctx_persistence@vcs0-queued.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-tglb8/igt@gem_ctx_persistence@vcs0-queued.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][54] ([fdo#109276] / [fdo#112080]) -> [PASS][55] +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb5/igt@gem_ctx_persistence@vcs1-queued.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-iclb2/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_ctx_shared@q-independent-default:
    - shard-kbl:          [FAIL][56] -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl6/igt@gem_ctx_shared@q-independent-default.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-kbl6/igt@gem_ctx_shared@q-independent-default.html

  * igt@gem_ctx_shared@q-promotion-vebox:
    - shard-kbl:          [FAIL][58] ([fdo#112118]) -> [PASS][59] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl6/igt@gem_ctx_shared@q-promotion-vebox.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-kbl4/igt@gem_ctx_shared@q-promotion-vebox.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][60] ([i915#677]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-iclb7/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd2:
    - shard-iclb:         [SKIP][62] ([fdo#109276]) -> [PASS][63] +18 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd2.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd2.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][64] ([fdo#112146]) -> [PASS][65] +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-hsw:          [FAIL][66] -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pwrite@big-cpu-fbr:
    - shard-glk:          [INCOMPLETE][68] ([CI#80] / [i915#58] / [k.org#198133]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-glk2/igt@gem_pwrite@big-cpu-fbr.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-glk1/igt@gem_pwrite@big-cpu-fbr.html

  * igt@i915_pm_rps@reset:
    - shard-tglb:         [FAIL][70] ([i915#413]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-tglb1/igt@i915_pm_rps@reset.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-tglb1/igt@i915_pm_rps@reset.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [FAIL][72] ([i915#54]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding:
    - shard-apl:          [FAIL][74] ([i915#54]) -> [PASS][75] +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-tglb:         [FAIL][76] ([IGT#5]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled:
    - shard-snb:          [DMESG-WARN][78] ([i915#478]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-snb4/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-snb4/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][80] ([i915#79]) -> [PASS][81] +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-panning-vs-hang-interruptible:
    - shard-iclb:         [SKIP][82] -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb4/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-iclb6/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-tglb:         [SKIP][84] ([i915#668]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][86] ([i915#180]) -> [PASS][87] +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][88] ([fdo#109441]) -> [PASS][89] +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb3/igt@kms_psr@psr2_cursor_plane_onoff.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][90] ([i915#180]) -> [PASS][91] +9 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-a-wait-busy-hang:
    - shard-kbl:          [SKIP][92] ([fdo#109271]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl6/igt@kms_vblank@pipe-a-wait-busy-hang.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-kbl3/igt@kms_vblank@pipe-a-wait-busy-hang.html

  * igt@perf_pmu@busy-hang-vcs1:
    - shard-kbl:          [SKIP][94] ([fdo#109271] / [fdo#112080]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl6/igt@perf_pmu@busy-hang-vcs1.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-kbl1/igt@perf_pmu@busy-hang-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [SKIP][96] ([fdo#109276] / [fdo#112080]) -> [SKIP][97] ([fdo#112080]) +9 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb5/igt@gem_ctx_isolation@vcs1-none.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-iclb5/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][98] ([IGT#28]) -> [SKIP][99] ([fdo#112080])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_ctx_isolation@vcs2-nonpriv-switch:
    - shard-tglb:         [SKIP][100] ([fdo#111912] / [fdo#112080]) -> [SKIP][101] ([fdo#112080]) +7 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-tglb3/igt@gem_ctx_isolation@vcs2-nonpriv-switch.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-tglb3/igt@gem_ctx_isolation@vcs2-nonpriv-switch.html

  * igt@gem_eio@in-flight-1us:
    - shard-glk:          [TIMEOUT][102] ([fdo#112271]) -> [INCOMPLETE][103] ([CI#80] / [i915#58] / [k.org#198133])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-glk5/igt@gem_eio@in-flight-1us.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-glk5/igt@gem_eio@in-flight-1us.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][104] ([i915#468]) -> [FAIL][105] ([i915#454])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111912]: https://bugs.freedesktop.org/show_bug.cgi?id=111912
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112118]: https://bugs.freedesktop.org/show_bug.cgi?id=112118
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1074]: https://gitlab.freedesktop.org/drm/intel/issues/1074
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5394 -> IGTPW_4022
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7833: 8210f0f999e2d396a8611e0cabc2f6c6a52468de @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4022: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/index.html
  IGT_5394: 991fd07bcd7add7a5beca2c95b72a994e62fbb75 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4022/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
