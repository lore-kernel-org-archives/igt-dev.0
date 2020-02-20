Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 20 Feb 2020 04:01:06 -0000
Message-ID: <158217126663.17409.7128351155578445111@emeril.freedesktop.org>
References: <20200218121549.12917-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20200218121549.12917-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Fcreate=3A_Added_=5F=5Ffor=5Feach=5Fphysical?=
 =?utf-8?q?=5Fengine_to_utilize_all_available_engines=2E?=
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
To: sai gowtham <sai.gowtham.ch@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_exec_create: Added __for_each_physical_engine to utilize all available engines.
URL   : https://patchwork.freedesktop.org/series/73568/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7960_full -> IGTPW_4177_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4177_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_whisper@basic-fds-forked}:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-tglb8/igt@gem_exec_whisper@basic-fds-forked.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-tglb7/igt@gem_exec_whisper@basic-fds-forked.html

  
Known issues
------------

  Here are the changes found in IGTPW_4177_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#110854])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb1/igt@gem_exec_balancer@smoke.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-iclb5/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112080]) +10 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb2/igt@gem_exec_parallel@vcs1-fds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@preempt-other-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb8/igt@gem_exec_schedule@preempt-other-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-iclb1/igt@gem_exec_schedule@preempt-other-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +14 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-snb:          [PASS][11] -> [DMESG-WARN][12] ([i915#478])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-snb4/igt@gem_mmap_gtt@fault-concurrent.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-snb2/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-kbl4/igt@gem_softpin@noreloc-s3.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-kbl1/igt@gem_softpin@noreloc-s3.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-hsw:          [PASS][15] -> [FAIL][16] ([i915#694])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-hsw8/igt@gen7_exec_parse@basic-offset.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-hsw2/igt@gen7_exec_parse@basic-offset.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][17] -> [INCOMPLETE][18] ([i915#58] / [k.org#198133])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-glk2/igt@gen9_exec_parse@allowed-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-glk2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#454])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-hsw:          [PASS][21] -> [FAIL][22] ([i915#969])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-hsw7/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-hsw2/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#72])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#79])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-glk8/igt@kms_flip@flip-vs-expired-vblank.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-glk1/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#34])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-apl3/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-apl7/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][35] -> [TIMEOUT][36] ([fdo#112271] / [i915#1085])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-tglb1/igt@perf@gen12-mi-rpc.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-tglb5/igt@perf@gen12-mi-rpc.html

  
#### Possible fixes ####

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][37] ([fdo#110841]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][39] ([fdo#112146]) -> [PASS][40] +4 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb1/igt@gem_exec_schedule@in-order-bsd.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-iclb6/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][41] ([i915#677]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-iclb3/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-hsw:          [FAIL][43] ([i915#694]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-hsw6/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-hsw6/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][45] ([i915#644]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-iclb:         [INCOMPLETE][47] ([fdo#109100]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb3/igt@gem_softpin@noreloc-s3.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-iclb8/igt@gem_softpin@noreloc-s3.html

  * igt@i915_selftest@live_gt_heartbeat:
    - shard-apl:          [DMESG-FAIL][49] ([i915#541]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-apl2/igt@i915_selftest@live_gt_heartbeat.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-apl3/igt@i915_selftest@live_gt_heartbeat.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52] +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][53] ([i915#57]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-hsw5/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][55] ([i915#79]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-apl:          [FAIL][59] ([i915#49]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
    - shard-kbl:          [FAIL][61] ([i915#49]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][63] ([fdo#109441]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][65] ([i915#31]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-apl8/igt@kms_setmode@basic.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-apl7/igt@kms_setmode@basic.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-hsw:          [INCOMPLETE][67] ([i915#1176] / [i915#61]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-hsw6/igt@perf_pmu@cpu-hotplug.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-hsw1/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [SKIP][69] ([fdo#112080]) -> [PASS][70] +8 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb7/igt@perf_pmu@init-busy-vcs1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-iclb2/igt@perf_pmu@init-busy-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][71] ([fdo#109276]) -> [PASS][72] +21 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb6/igt@prime_busy@hang-bsd2.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-iclb2/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][73] ([IGT#28]) -> [SKIP][74] ([fdo#112080])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_shared@q-promotion-bsd:
    - shard-hsw:          [SKIP][75] ([fdo#109271]) -> [INCOMPLETE][76] ([i915#61])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-hsw8/igt@gem_ctx_shared@q-promotion-bsd.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-hsw7/igt@gem_ctx_shared@q-promotion-bsd.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][77] ([i915#694]) -> [FAIL][78] ([i915#818])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-hsw7/igt@gem_tiled_blits@interruptible.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-hsw6/igt@gem_tiled_blits@interruptible.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][79] ([i915#818]) -> [FAIL][80] ([i915#694])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7960/shard-hsw2/igt@gem_tiled_blits@normal.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/shard-hsw6/igt@gem_tiled_blits@normal.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#109100]: https://bugs.freedesktop.org/show_bug.cgi?id=109100
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1176]: https://gitlab.freedesktop.org/drm/intel/issues/1176
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#969]: https://gitlab.freedesktop.org/drm/intel/issues/969
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5447 -> IGTPW_4177
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7960: b86443a3c1d1b32a03f381c9198eed9243f06d18 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4177: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/index.html
  IGT_5447: 8d6b2500e44d3dc78b5eac8798f0de42f2ff9014 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4177/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
