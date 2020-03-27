Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 27 Mar 2020 15:36:53 -0000
Message-ID: <158532341353.17237.3633620274889704705@emeril.freedesktop.org>
References: <20200327050435.8531-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200327050435.8531-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Fnop=3A-Fixed_Crash_issue_seen_on_few_platform?=
 =?utf-8?q?_=28rev3=29?=
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
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_exec_nop:-Fixed Crash issue seen on few platform (rev3)
URL   : https://patchwork.freedesktop.org/series/75145/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8198_full -> IGTPW_4363_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4363_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4363_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4363_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd:
    - shard-iclb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-iclb8/igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8198_full and IGTPW_4363_full:

### New IGT tests (3) ###

  * igt@gem_ctx_isolation@clean:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_isolation@dirty-create:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_shared@exec-shared-gtt:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_4363_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-iclb:         [PASS][2] -> [INCOMPLETE][3] ([i915#1492])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb5/igt@gem_ctx_persistence@close-replace-race.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-iclb7/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([i915#677]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb6/igt@gem_exec_schedule@implicit-both-bsd.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#109276] / [i915#677])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-iclb3/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#109276]) +19 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb4/igt@gem_exec_schedule@independent-bsd2.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-iclb7/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#112146]) +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb6/igt@gem_exec_schedule@reorder-wide-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-glk:          [PASS][12] -> [FAIL][13] ([i915#1527])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-glk1/igt@i915_pm_rc6_residency@rc6-idle.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-glk5/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-hsw:          [PASS][14] -> [TIMEOUT][15] ([i915#1526])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-hsw8/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@i2c:
    - shard-tglb:         [PASS][16] -> [SKIP][17] ([i915#1316])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-tglb7/igt@i915_pm_rpm@i2c.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-tglb6/igt@i915_pm_rpm@i2c.html
    - shard-glk:          [PASS][18] -> [SKIP][19] ([fdo#109271])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-glk1/igt@i915_pm_rpm@i2c.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-glk7/igt@i915_pm_rpm@i2c.html
    - shard-hsw:          [PASS][20] -> [SKIP][21] ([fdo#109271])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-hsw2/igt@i915_pm_rpm@i2c.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-hsw5/igt@i915_pm_rpm@i2c.html
    - shard-iclb:         [PASS][22] -> [SKIP][23] ([i915#1316])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb7/igt@i915_pm_rpm@i2c.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-iclb1/igt@i915_pm_rpm@i2c.html

  * igt@i915_selftest@live@execlists:
    - shard-apl:          [PASS][24] -> [INCOMPLETE][25] ([fdo#103927] / [i915#656])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-apl1/igt@i915_selftest@live@execlists.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-apl6/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@requests:
    - shard-tglb:         [PASS][26] -> [INCOMPLETE][27] ([i915#1531])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-tglb3/igt@i915_selftest@live@requests.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-tglb3/igt@i915_selftest@live@requests.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][28] -> [DMESG-WARN][29] ([i915#180]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-kbl6/igt@i915_suspend@forcewake.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-kbl3/igt@i915_suspend@forcewake.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [PASS][30] -> [FAIL][31] ([i915#54] / [i915#93] / [i915#95])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][32] -> [FAIL][33] ([i915#54])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
    - shard-apl:          [PASS][34] -> [FAIL][35] ([i915#54])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][36] -> [FAIL][37] ([i915#96])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled:
    - shard-glk:          [PASS][38] -> [FAIL][39] ([i915#52] / [i915#54]) +4 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [PASS][40] -> [INCOMPLETE][41] ([i915#61])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-hsw7/igt@kms_flip@flip-vs-suspend.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-hsw4/igt@kms_flip@flip-vs-suspend.html
    - shard-apl:          [PASS][42] -> [DMESG-WARN][43] ([i915#180])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-apl8/igt@kms_flip@flip-vs-suspend.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-apl4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-glk:          [PASS][44] -> [FAIL][45] ([i915#49])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [PASS][46] -> [INCOMPLETE][47] ([i915#155])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [PASS][48] -> [FAIL][49] ([fdo#108145] / [i915#95])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [PASS][50] -> [FAIL][51] ([i915#93] / [i915#95])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][52] -> [FAIL][53] ([i915#95]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-apl1/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][54] -> [FAIL][55] ([i915#899])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-glk2/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][56] -> [SKIP][57] ([fdo#109441]) +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb2/igt@kms_psr@psr2_basic.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-iclb1/igt@kms_psr@psr2_basic.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][58] -> [FAIL][59] ([i915#31])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-apl8/igt@kms_setmode@basic.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-apl2/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][60] -> [SKIP][61] ([fdo#112080]) +10 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb4/igt@perf_pmu@busy-vcs1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-iclb8/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@rcs0}:
    - shard-kbl:          [DMESG-WARN][62] ([i915#180]) -> [PASS][63] +4 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_schedule@implicit-write-read-bsd1:
    - shard-iclb:         [SKIP][64] ([fdo#109276] / [i915#677]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb6/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-iclb2/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][66] ([fdo#112146]) -> [PASS][67] +5 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-iclb5/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][68] ([i915#716]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-apl1/igt@gen9_exec_parse@allowed-all.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-apl3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-iclb:         [SKIP][70] ([i915#1316]) -> [PASS][71] +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb2/igt@i915_pm_rpm@gem-idle.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-iclb5/igt@i915_pm_rpm@gem-idle.html
    - shard-glk:          [SKIP][72] ([fdo#109271]) -> [PASS][73] +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-glk6/igt@i915_pm_rpm@gem-idle.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-glk4/igt@i915_pm_rpm@gem-idle.html
    - shard-tglb:         [SKIP][74] ([i915#1316]) -> [PASS][75] +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-tglb3/igt@i915_pm_rpm@gem-idle.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-tglb5/igt@i915_pm_rpm@gem-idle.html
    - shard-hsw:          [SKIP][76] ([fdo#109271]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-hsw6/igt@i915_pm_rpm@gem-idle.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-hsw2/igt@i915_pm_rpm@gem-idle.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [FAIL][78] ([i915#52] / [i915#54]) -> [PASS][79] +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [FAIL][80] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [FAIL][82] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [DMESG-WARN][84] ([i915#180] / [i915#95]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][86] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-apl:          [FAIL][88] ([i915#53] / [i915#95]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][90] ([i915#180]) -> [PASS][91] +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][92] ([i915#93] / [i915#95]) -> [PASS][93] +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][94] ([fdo#109441]) -> [PASS][95] +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb6/igt@kms_psr@psr2_no_drrs.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][96] ([i915#31]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-kbl7/igt@kms_setmode@basic.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-kbl2/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][98] ([fdo#112080]) -> [PASS][99] +4 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb3/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][100] ([fdo#109276]) -> [PASS][101] +15 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt:
    - shard-hsw:          [DMESG-WARN][102] ([fdo#110789] / [i915#478]) -> [DMESG-WARN][103] ([i915#478])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-hsw6/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [DMESG-WARN][104] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][105] ([fdo#111870])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-hsw2/igt@gem_userptr_blits@sync-unmap-after-close.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-hsw4/igt@gem_userptr_blits@sync-unmap-after-close.html
    - shard-snb:          [DMESG-WARN][106] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][107] ([fdo#111870] / [i915#478])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][108] ([i915#454]) -> [SKIP][109] ([i915#468])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-tglb7/igt@i915_pm_dc@dc6-dpms.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-snb:          [INCOMPLETE][110] ([i915#82]) -> [SKIP][111] ([fdo#109271])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-snb4/igt@i915_pm_rpm@pc8-residency.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-snb1/igt@i915_pm_rpm@pc8-residency.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][112], [FAIL][113]) ([fdo#103927] / [i915#716]) -> ([FAIL][114], [FAIL][115]) ([fdo#103927] / [i915#529])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-apl1/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-apl6/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-apl7/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/shard-apl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1492]: https://gitlab.freedesktop.org/drm/intel/issues/1492
  [i915#1526]: https://gitlab.freedesktop.org/drm/intel/issues/1526
  [i915#1527]: https://gitlab.freedesktop.org/drm/intel/issues/1527
  [i915#1531]: https://gitlab.freedesktop.org/drm/intel/issues/1531
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5539 -> IGTPW_4363
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8198: a421a6390d4a76e4df310bfe9adb78dde7207249 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4363: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/index.html
  IGT_5539: e7aae12e37771a8b7796ba252574eb832a5839c3 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4363/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
