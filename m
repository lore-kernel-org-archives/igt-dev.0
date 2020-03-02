Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 02 Mar 2020 17:29:05 -0000
Message-ID: <158317014552.30644.9262743403898417685@emeril.freedesktop.org>
References: <20200302101603.3195-1-satyavathi.k@intel.com>
In-Reply-To: <20200302101603.3195-1-satyavathi.k@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fringfill=3AAdded_=5F=5Ffor=5Feach=5Fphysical=5Fengin?=
 =?utf-8?q?e_to_utilize_all_available_engines=2E_=28rev5=29?=
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
To: satyavat <satyavathi.k@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_ringfill:Added __for_each_physical_engine to utilize all available engines. (rev5)
URL   : https://patchwork.freedesktop.org/series/73463/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8039_full -> IGTPW_4243_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4243_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4243_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4243_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-tglb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-tglb2/igt@runner@aborted.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][2], [FAIL][3], [FAIL][4], [FAIL][5], [FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10]) ([fdo#111870] / [i915#1356]) -> ([FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18]) ([fdo#111870])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-hsw5/igt@runner@aborted.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-hsw1/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-hsw1/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-hsw4/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-hsw4/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-hsw4/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-hsw5/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-hsw1/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-hsw6/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-hsw5/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-hsw4/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-hsw4/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-hsw6/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-hsw6/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-hsw6/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-hsw1/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-hsw1/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8039_full and IGTPW_4243_full:

### New IGT tests (30) ###

  * igt@gem_ringfill@basic:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@basic-fd:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@basic-fd@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.10] s

  * igt@gem_ringfill@basic-fd@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.04, 0.10] s

  * igt@gem_ringfill@basic-fd@vcs0:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@gem_ringfill@basic-fd@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@gem_ringfill@basic-fd@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.03, 0.09] s

  * igt@gem_ringfill@basic-forked:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@basic-forked@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.03, 0.06] s

  * igt@gem_ringfill@basic-forked@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.04, 0.06] s

  * igt@gem_ringfill@basic-forked@vcs0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@gem_ringfill@basic-forked@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@gem_ringfill@basic-forked@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.03, 0.06] s

  * igt@gem_ringfill@basic-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@basic-hang@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [10.75, 10.76] s

  * igt@gem_ringfill@basic-hang@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [10.76, 10.78] s

  * igt@gem_ringfill@basic-hang@vcs0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 10.76] s

  * igt@gem_ringfill@basic-hang@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [10.75, 10.76] s

  * igt@gem_ringfill@basic-hang@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [10.75, 10.76] s

  * igt@gem_ringfill@basic-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ringfill@basic-interruptible@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [1.09, 1.11] s

  * igt@gem_ringfill@basic-interruptible@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [1.10, 1.18] s

  * igt@gem_ringfill@basic-interruptible@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [1.09, 1.11] s

  * igt@gem_ringfill@basic-interruptible@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [1.08, 1.11] s

  * igt@gem_ringfill@basic-interruptible@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [1.09, 1.11] s

  * igt@gem_ringfill@basic@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ringfill@basic@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@gem_ringfill@basic@vcs0:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_ringfill@basic@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_ringfill@basic@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.01, 0.02] s

  

Known issues
------------

  Here are the changes found in IGTPW_4243_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-apl:          [PASS][19] -> [INCOMPLETE][20] ([fdo#103927] / [i915#1291])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-apl3/igt@gem_ctx_persistence@close-replace-race.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-apl6/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#110854])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-iclb2/igt@gem_exec_balancer@smoke.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-iclb6/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-both-bsd2:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109276] / [i915#677])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-iclb2/igt@gem_exec_schedule@implicit-both-bsd2.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-iclb8/igt@gem_exec_schedule@implicit-both-bsd2.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#112146]) +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][27] -> [FAIL][28] ([i915#447])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-iclb6/igt@i915_pm_dc@dc5-dpms.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#454])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][31] -> [FAIL][32] ([i915#413])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-iclb6/igt@i915_pm_rps@reset.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-iclb5/igt@i915_pm_rps@reset.html

  * igt@kms_color@pipe-b-ctm-blue-to-red:
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#129])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-apl8/igt@kms_color@pipe-b-ctm-blue-to-red.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-apl8/igt@kms_color@pipe-b-ctm-blue-to-red.html
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([i915#129])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-kbl6/igt@kms_color@pipe-b-ctm-blue-to-red.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-kbl6/igt@kms_color@pipe-b-ctm-blue-to-red.html

  * igt@kms_color@pipe-c-degamma:
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#71])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-apl7/igt@kms_color@pipe-c-degamma.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-apl4/igt@kms_color@pipe-c-degamma.html
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#71])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-kbl6/igt@kms_color@pipe-c-degamma.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-kbl4/igt@kms_color@pipe-c-degamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][41] -> [DMESG-WARN][42] ([i915#180]) +5 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_draw_crc@fill-fb:
    - shard-hsw:          [PASS][43] -> [DMESG-WARN][44] ([i915#478])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-hsw4/igt@kms_draw_crc@fill-fb.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-hsw4/igt@kms_draw_crc@fill-fb.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][45] -> [DMESG-WARN][46] ([i915#180])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-snb:          [PASS][47] -> [SKIP][48] ([fdo#109271]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:
    - shard-snb:          [PASS][49] -> [DMESG-WARN][50] ([i915#478])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-snb2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-snb5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109441]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][53] -> [FAIL][54] ([i915#31])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-apl4/igt@kms_setmode@basic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-apl4/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][55] -> [SKIP][56] ([fdo#112080]) +9 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-iclb2/igt@perf_pmu@busy-vcs1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-iclb3/igt@perf_pmu@busy-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][57] -> [SKIP][58] ([fdo#109276]) +15 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-iclb1/igt@prime_busy@hang-bsd2.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-iclb3/igt@prime_busy@hang-bsd2.html

  * igt@prime_vgem@sync-bsd2:
    - shard-tglb:         [PASS][59] -> [INCOMPLETE][60] ([i915#409])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-tglb5/igt@prime_vgem@sync-bsd2.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-tglb2/igt@prime_vgem@sync-bsd2.html

  
#### Possible fixes ####

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [SKIP][61] ([fdo#109276] / [i915#677]) -> [PASS][62] +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-iclb8/igt@gem_exec_schedule@implicit-both-bsd1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][63] ([i915#677]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-iclb3/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][65] ([fdo#112146]) -> [PASS][66] +10 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][67] ([fdo#109276]) -> [PASS][68] +12 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-iclb3/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][69] ([i915#716]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-glk1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - shard-hsw:          [SKIP][71] ([fdo#109271]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-hsw4/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-hsw4/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-iclb:         [SKIP][73] ([i915#1316]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-iclb1/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-iclb7/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-tglb:         [SKIP][75] ([i915#1316]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-tglb2/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-tglb3/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-glk:          [SKIP][77] ([fdo#109271]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-glk5/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-glk8/igt@i915_pm_rpm@debugfs-forcewake-user.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][79] ([IGT#5]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-glk:          [FAIL][81] ([i915#49]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][83] ([i915#180]) -> [PASS][84] +3 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-apl:          [DMESG-WARN][85] ([i915#180]) -> [PASS][86] +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-apl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][87] ([i915#899]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][89] ([i915#173]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-iclb1/igt@kms_psr@no_drrs.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-iclb3/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][91] ([fdo#109441]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * {igt@perf@stress-open-close}:
    - shard-glk:          [INCOMPLETE][93] ([i915#1356] / [i915#58] / [k.org#198133]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-glk3/igt@perf@stress-open-close.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-glk5/igt@perf@stress-open-close.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [SKIP][95] ([fdo#112080]) -> [PASS][96] +7 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-iclb3/igt@perf_pmu@init-busy-vcs1.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-iclb1/igt@perf_pmu@init-busy-vcs1.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][97] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][98] ([fdo#111870] / [i915#478])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
    - shard-hsw:          [DMESG-WARN][99] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][100] ([fdo#111870])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-hsw6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglb:         [SKIP][101] ([fdo#109506]) -> [SKIP][102] ([i915#1316])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-tglb6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-tglb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-iclb:         [SKIP][103] ([fdo#109293] / [fdo#109506]) -> [SKIP][104] ([i915#1316])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-iclb7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-iclb3/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][105], [FAIL][106], [FAIL][107], [FAIL][108], [FAIL][109], [FAIL][110], [FAIL][111], [FAIL][112]) ([fdo#111870] / [i915#1077]) -> ([FAIL][113], [FAIL][114], [FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118], [FAIL][119], [FAIL][120]) ([fdo#111870] / [i915#1077] / [i915#698])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-snb5/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-snb2/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-snb6/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-snb2/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-snb6/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-snb4/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-snb6/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8039/shard-snb2/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-snb6/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-snb6/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-snb4/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-snb6/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-snb4/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-snb6/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-snb2/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/shard-snb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#1291]: https://gitlab.freedesktop.org/drm/intel/issues/1291
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1356]: https://gitlab.freedesktop.org/drm/intel/issues/1356
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5483 -> IGTPW_4243
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8039: 4e89f06e187b49991dec568c4824ed3fcf0c4522 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4243: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/index.html
  IGT_5483: 1707153df224ffb6333c6c660a792b7f334eb3d3 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4243/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
