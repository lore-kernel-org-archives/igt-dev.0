Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 28 Feb 2020 14:09:36 -0000
Message-ID: <158289897696.7475.6365270664865464460@emeril.freedesktop.org>
References: <20200227101724.1620389-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200227101724.1620389-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?perf=3A_add_a_stress_test_opening/closing_the_stream?=
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

Series: tests/perf: add a stress test opening/closing the stream
URL   : https://patchwork.freedesktop.org/series/74002/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8017_full -> IGTPW_4233_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4233_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4233_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4233_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@blocking-wf_vblank:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-iclb5/igt@kms_flip@blocking-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-iclb7/igt@kms_flip@blocking-wf_vblank.html

  * igt@runner@aborted:
    - shard-tglb:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-tglb5/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8017_full and IGTPW_4233_full:

### New IGT tests (5) ###

  * igt@drm_mm@all:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@mock:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@perf:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_selftest@all:
    - Statuses :
    - Exec time: [None] s

  * igt@perf@stress-open-close:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.17] s

  

Known issues
------------

  Here are the changes found in IGTPW_4233_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([fdo#112080]) +8 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-iclb2/igt@gem_exec_parallel@vcs1-fds.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-iclb7/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#109276] / [i915#677]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-iclb2/igt@gem_exec_schedule@implicit-both-bsd1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-iclb7/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([i915#677]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-iclb6/igt@gem_exec_schedule@pi-common-bsd.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#112146]) +5 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-iclb8/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [PASS][12] -> [DMESG-WARN][13] ([fdo#111870])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-hsw7/igt@gem_userptr_blits@sync-unmap-after-close.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-hsw6/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_rpm@i2c:
    - shard-tglb:         [PASS][14] -> [SKIP][15] ([i915#1316])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-tglb5/igt@i915_pm_rpm@i2c.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-tglb5/igt@i915_pm_rpm@i2c.html
    - shard-glk:          [PASS][16] -> [SKIP][17] ([fdo#109271]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-glk3/igt@i915_pm_rpm@i2c.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-glk5/igt@i915_pm_rpm@i2c.html
    - shard-iclb:         [PASS][18] -> [SKIP][19] ([i915#1316])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-iclb4/igt@i915_pm_rpm@i2c.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-iclb3/igt@i915_pm_rpm@i2c.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][20] -> [FAIL][21] ([i915#413])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-iclb7/igt@i915_pm_rps@reset.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-iclb8/igt@i915_pm_rps@reset.html

  * igt@kms_color@pipe-a-degamma:
    - shard-tglb:         [PASS][22] -> [FAIL][23] ([i915#1149])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-tglb8/igt@kms_color@pipe-a-degamma.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-tglb8/igt@kms_color@pipe-a-degamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-apl:          [PASS][24] -> [FAIL][25] ([i915#54])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
    - shard-kbl:          [PASS][26] -> [FAIL][27] ([i915#54])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][28] -> [FAIL][29] ([i915#72])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-glk:          [PASS][30] -> [FAIL][31] ([i915#34])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-glk7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-glk2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [PASS][32] -> [DMESG-WARN][33] ([i915#180]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][34] -> [DMESG-WARN][35] ([i915#180]) +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-apl8/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-tglb:         [PASS][36] -> [SKIP][37] ([i915#668]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][38] -> [FAIL][39] ([i915#899])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][40] -> [SKIP][41] ([fdo#109441]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-iclb2/igt@kms_psr@psr2_basic.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-iclb6/igt@kms_psr@psr2_basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:
    - shard-hsw:          [PASS][42] -> [SKIP][43] ([fdo#109271])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-hsw6/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-hsw6/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-iclb:         [PASS][44] -> [SKIP][45] ([fdo#109278])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-iclb1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-tglb:         [PASS][46] -> [SKIP][47] ([fdo#112015])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-tglb1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-tglb5/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][48] -> [SKIP][49] ([fdo#109276]) +18 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-iclb2/igt@prime_busy@hang-bsd2.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-iclb5/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@bcs0-s3:
    - shard-apl:          [DMESG-WARN][50] ([i915#180]) -> [PASS][51] +4 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-apl4/igt@gem_ctx_isolation@bcs0-s3.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-apl4/igt@gem_ctx_isolation@bcs0-s3.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [INCOMPLETE][52] ([fdo#103665]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [INCOMPLETE][54] ([i915#1291]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-tglb1/igt@gem_ctx_persistence@close-replace-race.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-tglb6/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox:
    - shard-kbl:          [FAIL][56] ([i915#679]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-kbl6/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-kbl1/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html

  * igt@gem_ctx_shared@exec-shared-gtt-vebox:
    - shard-apl:          [FAIL][58] ([i915#616]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-apl4/igt@gem_ctx_shared@exec-shared-gtt-vebox.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-apl1/igt@gem_ctx_shared@exec-shared-gtt-vebox.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][60] ([fdo#110854]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-iclb7/igt@gem_exec_balancer@smoke.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][62] ([fdo#109276] / [i915#677]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-iclb7/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [SKIP][64] ([fdo#109276]) -> [PASS][65] +15 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-iclb3/igt@gem_exec_schedule@independent-bsd2.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-iclb2/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][66] ([fdo#112146]) -> [PASS][67] +4 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-iclb1/igt@gem_exec_schedule@reorder-wide-bsd.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-iclb8/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][68] ([i915#716]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-glk6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         [DMESG-FAIL][70] ([i915#1233]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-tglb2/igt@i915_selftest@live@gt_lrc.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-tglb7/igt@i915_selftest@live@gt_lrc.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-hsw:          [DMESG-WARN][72] ([i915#478]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-hsw7/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-hsw7/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen:
    - shard-apl:          [FAIL][74] ([i915#54]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][76] ([i915#180]) -> [PASS][77] +3 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [SKIP][78] ([fdo#109441]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-iclb1/igt@kms_psr@psr2_primary_blt.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-iclb2/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][80] ([i915#31]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-apl2/igt@kms_setmode@basic.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-apl7/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][82] ([fdo#112080]) -> [PASS][83] +10 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-iclb8/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][84] ([fdo#112080]) -> [FAIL][85] ([IGT#28])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][86] ([IGT#28]) -> [SKIP][87] ([fdo#112080])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][88] ([i915#468]) -> [FAIL][89] ([i915#454])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-tglb1/igt@i915_pm_dc@dc6-psr.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][90], [FAIL][91], [FAIL][92], [FAIL][93], [FAIL][94]) ([fdo#111870] / [i915#478]) -> ([FAIL][95], [FAIL][96], [FAIL][97], [FAIL][98], [FAIL][99], [FAIL][100], [FAIL][101]) ([fdo#111870])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-hsw5/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-hsw7/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-hsw7/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-hsw7/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8017/shard-hsw1/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-hsw7/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-hsw4/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-hsw7/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-hsw1/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-hsw6/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-hsw4/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/shard-hsw6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#1291]: https://gitlab.freedesktop.org/drm/intel/issues/1291
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1333]: https://gitlab.freedesktop.org/drm/intel/issues/1333
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#616]: https://gitlab.freedesktop.org/drm/intel/issues/616
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5473 -> IGTPW_4233
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8017: 97e8d028e02f730e59a759f6636fd3d629a73f69 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4233: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/index.html
  IGT_5473: d22b3507ff2678a05d69d47c0ddf6f0e72ee7ffd @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4233/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
