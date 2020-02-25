Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 25 Feb 2020 21:36:30 -0000
Message-ID: <158266659008.770.11417601411321428832@emeril.freedesktop.org>
References: <20200224150358.1472416-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200224150358.1472416-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/perf=3A_add_some_debug_p?=
 =?utf-8?q?rints?=
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/perf: add some debug prints
URL   : https://patchwork.freedesktop.org/series/73854/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7997_full -> IGTPW_4218_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/index.html

Known issues
------------

  Here are the changes found in IGTPW_4218_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_caching@reads:
    - shard-hsw:          [PASS][1] -> [FAIL][2] ([i915#694])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-hsw8/igt@gem_caching@reads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-hsw2/igt@gem_caching@reads.html

  * igt@gem_close_race@basic-threads:
    - shard-hsw:          [PASS][3] -> [INCOMPLETE][4] ([i915#61] / [i915#694] / [i915#816])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-hsw7/igt@gem_close_race@basic-threads.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-hsw8/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#110854])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-iclb4/igt@gem_exec_balancer@smoke.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-iclb7/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112080]) +12 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-iclb8/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_reloc@basic-cpu-gtt:
    - shard-snb:          [PASS][9] -> [DMESG-WARN][10] ([i915#478])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-snb5/igt@gem_exec_reloc@basic-cpu-gtt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-snb2/igt@gem_exec_reloc@basic-cpu-gtt.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-iclb5/igt@gem_exec_schedule@pi-userfault-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-iclb1/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-iclb3/igt@gem_exec_schedule@preempt-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-iclb2/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#644])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#644])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#413])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-iclb4/igt@i915_pm_rps@waitboost.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-iclb1/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +5 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-random:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-apl8/igt@kms_flip@flip-vs-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-apl1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
    - shard-tglb:         [PASS][29] -> [SKIP][30] ([i915#668])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][31] -> [SKIP][32] ([i915#433])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][35] -> [TIMEOUT][36] ([fdo#112271] / [i915#1085])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-tglb1/igt@perf@gen12-mi-rpc.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-tglb3/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-hsw:          [PASS][37] -> [INCOMPLETE][38] ([i915#61])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-hsw2/igt@perf_pmu@cpu-hotplug.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-hsw5/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109276]) +18 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-iclb1/igt@prime_busy@hang-bsd2.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-iclb8/igt@prime_busy@hang-bsd2.html

  * igt@sw_sync@sync_multi_producer_single_consumer:
    - shard-hsw:          [PASS][41] -> [TIMEOUT][42] ([fdo#112271])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-hsw2/igt@sw_sync@sync_multi_producer_single_consumer.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-hsw2/igt@sw_sync@sync_multi_producer_single_consumer.html

  
#### Possible fixes ####

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][43] ([i915#677]) -> [PASS][44] +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-iclb5/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][45] ([fdo#112146]) -> [PASS][46] +8 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-iclb5/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][47] ([fdo#109276]) -> [PASS][48] +12 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-iclb8/igt@gem_exec_schedule@promotion-bsd1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-iclb1/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-hsw:          [FAIL][49] ([i915#694]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][51] ([i915#716]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-glk5/igt@gen9_exec_parse@allowed-all.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-glk3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][53] ([i915#454]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-iclb4/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-glk:          [SKIP][55] ([fdo#109271]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-glk3/igt@i915_pm_rpm@dpms-non-lpsp.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-glk2/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-hsw:          [SKIP][57] ([fdo#109271]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-hsw2/igt@i915_pm_rpm@dpms-non-lpsp.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-hsw2/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_selftest@live_gt_lrc:
    - shard-tglb:         [DMESG-FAIL][59] ([i915#1233]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-tglb2/igt@i915_selftest@live_gt_lrc.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-tglb1/igt@i915_selftest@live_gt_lrc.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-glk:          [FAIL][61] ([i915#34]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-glk3/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-glk2/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@dpms-vs-vblank-race:
    - shard-kbl:          [INCOMPLETE][63] ([fdo#103665]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-kbl2/igt@kms_flip@dpms-vs-vblank-race.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-kbl3/igt@kms_flip@dpms-vs-vblank-race.html
    - shard-apl:          [INCOMPLETE][65] ([fdo#103927]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-apl6/igt@kms_flip@dpms-vs-vblank-race.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-apl8/igt@kms_flip@dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68] +5 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-glk:          [FAIL][69] ([i915#49]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglb:         [SKIP][71] ([i915#668]) -> [PASS][72] +7 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][75] ([fdo#109642] / [fdo#111068]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-iclb1/igt@kms_psr2_su@frontbuffer.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [SKIP][77] ([fdo#109441]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-iclb1/igt@kms_psr@psr2_primary_mmap_gtt.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][79] ([i915#31]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-apl2/igt@kms_setmode@basic.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-apl6/igt@kms_setmode@basic.html

  * igt@perf@disabled-read-error:
    - shard-iclb:         [DMESG-WARN][81] ([i915#645]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-iclb2/igt@perf@disabled-read-error.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-iclb1/igt@perf@disabled-read-error.html

  * igt@perf@oa-formats:
    - shard-apl:          [FAIL][83] ([i915#1301]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-apl2/igt@perf@oa-formats.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-apl3/igt@perf@oa-formats.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [SKIP][85] ([fdo#112080]) -> [PASS][86] +5 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-iclb6/igt@perf_pmu@busy-check-all-vcs1.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-iclb1/igt@perf_pmu@busy-check-all-vcs1.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][87] ([i915#831]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-hsw4/igt@prime_mmap_coherency@ioctl-errors.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][89] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][90] ([fdo#110789] / [fdo#111870] / [i915#478])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         [SKIP][91] -> [SKIP][92] ([fdo#111644])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-tglb1/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         [SKIP][93] -> [SKIP][94] ([fdo#110892])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-iclb5/igt@i915_pm_rpm@dpms-non-lpsp.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-iclb5/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][95] ([i915#1226]) -> [SKIP][96] ([fdo#109349])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7997/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#1301]: https://gitlab.freedesktop.org/drm/intel/issues/1301
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#645]: https://gitlab.freedesktop.org/drm/intel/issues/645
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5463 -> IGTPW_4218
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7997: 3d3098d1384ee777baa141f69112669fed5ea90e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4218: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/index.html
  IGT_5463: d519c80219ebe558cd2fa378f26f9d73f9e35310 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4218/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
