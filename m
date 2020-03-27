Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 27 Mar 2020 15:19:29 -0000
Message-ID: <158532236911.17235.11737269936462078650@emeril.freedesktop.org>
References: <20200327044250.64274-1-ashutosh.dixit@intel.com>
In-Reply-To: <20200327044250.64274-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?perf=3A_add_a_test_for_OA_data_polling_reads_using_=22small=22_?=
 =?utf-8?q?buffers_=28rev2=29?=
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/perf: add a test for OA data polling reads using "small" buffers (rev2)
URL   : https://patchwork.freedesktop.org/series/75100/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8198_full -> IGTPW_4362_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4362_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4362_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4362_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@perf@polling-small-buf} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-glk7/igt@perf@polling-small-buf.html
    - shard-tglb:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-tglb1/igt@perf@polling-small-buf.html
    - shard-apl:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-apl6/igt@perf@polling-small-buf.html
    - shard-kbl:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-kbl6/igt@perf@polling-small-buf.html
    - shard-iclb:         NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-iclb8/igt@perf@polling-small-buf.html

  
#### Warnings ####

  * igt@kms_crtc_background_color:
    - shard-iclb:         [SKIP][6] ([fdo#109305]) -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb4/igt@kms_crtc_background_color.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-iclb7/igt@kms_crtc_background_color.html
    - shard-tglb:         [SKIP][8] ([i915#274]) -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-tglb7/igt@kms_crtc_background_color.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-tglb5/igt@kms_crtc_background_color.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8198_full and IGTPW_4362_full:

### New IGT tests (4) ###

  * igt@gem_ctx_isolation@clean:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_isolation@dirty-create:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_shared@exec-shared-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@perf@polling-small-buf:
    - Statuses : 5 fail(s)
    - Exec time: [0.10, 0.15] s

  

Known issues
------------

  Here are the changes found in IGTPW_4362_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#112080]) +10 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb4/igt@gem_busy@extended-parallel-vcs1.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-iclb6/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#109276]) +13 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb4/igt@gem_exec_schedule@independent-bsd2.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-iclb8/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([i915#677]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#112146]) +6 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-snb:          [PASS][18] -> [TIMEOUT][19] ([i915#1526])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-snb1/igt@i915_pm_rc6_residency@rc6-idle.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-snb1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@cursor-dpms:
    - shard-hsw:          [PASS][20] -> [SKIP][21] ([fdo#109271])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-hsw4/igt@i915_pm_rpm@cursor-dpms.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-hsw6/igt@i915_pm_rpm@cursor-dpms.html
    - shard-glk:          [PASS][22] -> [SKIP][23] ([fdo#109271])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-glk6/igt@i915_pm_rpm@cursor-dpms.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-glk4/igt@i915_pm_rpm@cursor-dpms.html
    - shard-iclb:         [PASS][24] -> [SKIP][25] ([i915#1316])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb5/igt@i915_pm_rpm@cursor-dpms.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-iclb7/igt@i915_pm_rpm@cursor-dpms.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-kbl:          [PASS][26] -> [FAIL][27] ([i915#54] / [i915#93] / [i915#95])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-random:
    - shard-glk:          [PASS][28] -> [FAIL][29] ([i915#54])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
    - shard-apl:          [PASS][30] -> [FAIL][31] ([i915#54]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-onscreen:
    - shard-kbl:          [PASS][32] -> [FAIL][33] ([i915#54]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x42-onscreen.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-128x42-onscreen.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][34] -> [FAIL][35] ([i915#72])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:
    - shard-glk:          [PASS][36] -> [FAIL][37] ([i915#52] / [i915#54]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][38] -> [FAIL][39] ([i915#177] / [i915#52] / [i915#54])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-kbl:          [PASS][40] -> [INCOMPLETE][41] ([i915#155] / [i915#600])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-kbl3/igt@kms_flip@flip-vs-suspend.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-kbl3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][42] -> [DMESG-WARN][43] ([i915#180])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-glk:          [PASS][44] -> [FAIL][45] ([i915#49])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-pwrite.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][46] -> [SKIP][47] ([fdo#109441]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb2/igt@kms_psr@psr2_basic.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-iclb7/igt@kms_psr@psr2_basic.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [INCOMPLETE][48] ([i915#1492]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-tglb2/igt@gem_ctx_persistence@close-replace-race.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-tglb8/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][50] ([fdo#110854]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb7/igt@gem_exec_balancer@smoke.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][52] ([fdo#112080]) -> [PASS][53] +8 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb3/igt@gem_exec_parallel@vcs1-fds.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][54] ([fdo#109276] / [i915#677]) -> [PASS][55] +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][56] ([i915#677]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [SKIP][58] ([fdo#112146]) -> [PASS][59] +3 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb1/igt@gem_exec_schedule@wide-bsd.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-iclb6/igt@gem_exec_schedule@wide-bsd.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][60] ([i915#716]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-apl1/igt@gen9_exec_parse@allowed-all.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-apl6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-iclb:         [SKIP][62] ([i915#1316]) -> [PASS][63] +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb2/igt@i915_pm_rpm@gem-idle.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-iclb1/igt@i915_pm_rpm@gem-idle.html
    - shard-glk:          [SKIP][64] ([fdo#109271]) -> [PASS][65] +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-glk6/igt@i915_pm_rpm@gem-idle.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-glk3/igt@i915_pm_rpm@gem-idle.html
    - shard-tglb:         [SKIP][66] ([i915#1316]) -> [PASS][67] +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-tglb3/igt@i915_pm_rpm@gem-idle.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-tglb2/igt@i915_pm_rpm@gem-idle.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-hsw:          [SKIP][68] ([fdo#109271]) -> [PASS][69] +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-hsw6/igt@i915_pm_rpm@system-suspend-execbuf.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-hsw8/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][70] ([i915#52] / [i915#54]) -> [PASS][71] +6 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [FAIL][72] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [FAIL][74] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [DMESG-WARN][76] ([i915#180] / [i915#95]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [FAIL][78] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [FAIL][80] ([i915#53] / [i915#95]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [DMESG-WARN][82] ([i915#180]) -> [PASS][83] +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [DMESG-WARN][84] ([i915#180]) -> [PASS][85] +2 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][86] ([i915#93] / [i915#95]) -> [PASS][87] +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][88] ([fdo#109441]) -> [PASS][89] +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb6/igt@kms_psr@psr2_suspend.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][90] ([fdo#109276]) -> [PASS][91] +15 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt:
    - shard-hsw:          [DMESG-WARN][92] ([fdo#110789] / [i915#478]) -> [DMESG-WARN][93] ([i915#478])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [DMESG-WARN][94] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][95] ([fdo#111870])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-hsw2/igt@gem_userptr_blits@sync-unmap-after-close.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-hsw2/igt@gem_userptr_blits@sync-unmap-after-close.html
    - shard-snb:          [DMESG-WARN][96] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][97] ([fdo#111870] / [i915#478])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-snb:          [INCOMPLETE][98] ([i915#82]) -> [SKIP][99] ([fdo#109271])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-snb4/igt@i915_pm_rpm@pc8-residency.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-snb5/igt@i915_pm_rpm@pc8-residency.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][100], [FAIL][101]) ([fdo#103927] / [i915#716]) -> [FAIL][102] ([fdo#103927])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-apl1/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8198/shard-apl6/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/shard-apl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109305]: https://bugs.freedesktop.org/show_bug.cgi?id=109305
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1492]: https://gitlab.freedesktop.org/drm/intel/issues/1492
  [i915#1526]: https://gitlab.freedesktop.org/drm/intel/issues/1526
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#274]: https://gitlab.freedesktop.org/drm/intel/issues/274
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#600]: https://gitlab.freedesktop.org/drm/intel/issues/600
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5539 -> IGTPW_4362
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8198: a421a6390d4a76e4df310bfe9adb78dde7207249 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4362: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/index.html
  IGT_5539: e7aae12e37771a8b7796ba252574eb832a5839c3 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4362/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
