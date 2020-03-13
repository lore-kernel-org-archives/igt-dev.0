Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 13 Mar 2020 12:38:57 -0000
Message-ID: <158410313752.30352.15804878640471001030@emeril.freedesktop.org>
References: <20200312230535.4613-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200312230535.4613-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgVGVzdCBj?=
 =?utf-8?q?onfigurable_poll_delay_in_perf_OA?=
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
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Test configurable poll delay in perf OA
URL   : https://patchwork.freedesktop.org/series/74655/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8130_full -> IGTPW_4299_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4299_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@perf@blocking-parameterized} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-kbl3/igt@perf@blocking-parameterized.html
    - shard-iclb:         NOTRUN -> [FAIL][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-iclb6/igt@perf@blocking-parameterized.html
    - shard-apl:          NOTRUN -> [FAIL][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-apl8/igt@perf@blocking-parameterized.html

  * {igt@perf@polling-parameterized} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-glk6/igt@perf@polling-parameterized.html
    - shard-hsw:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-hsw2/igt@perf@polling-parameterized.html
    - shard-tglb:         NOTRUN -> [FAIL][6] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-tglb5/igt@perf@polling-parameterized.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8130_full and IGTPW_4299_full:

### New IGT tests (2) ###

  * igt@perf@blocking-parameterized:
    - Statuses : 5 fail(s)
    - Exec time: [0.01, 0.02] s

  * igt@perf@polling-parameterized:
    - Statuses : 6 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.34] s

  

Known issues
------------

  Here are the changes found in IGTPW_4299_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110854])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-iclb1/igt@gem_exec_balancer@smoke.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-iclb6/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#677]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276]) +21 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-iclb2/igt@gem_exec_schedule@promotion-bsd1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-iclb8/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-iclb8/igt@gem_exec_schedule@reorder-wide-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#644])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][19] -> [INCOMPLETE][20] ([i915#58] / [k.org#198133])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-glk2/igt@gen9_exec_parse@allowed-all.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-glk4/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - shard-hsw:          [PASS][21] -> [SKIP][22] ([fdo#109271]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-hsw5/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-hsw5/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([i915#1316])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-iclb4/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-iclb3/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-tglb:         [PASS][25] -> [SKIP][26] ([i915#1316])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-tglb6/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-tglb8/igt@i915_pm_rpm@debugfs-forcewake-user.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-glk:          [PASS][27] -> [SKIP][28] ([fdo#109271]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-glk9/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-glk7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_color@pipe-c-ctm-green-to-red:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#129])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-kbl7/igt@kms_color@pipe-c-ctm-green-to-red.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-kbl4/igt@kms_color@pipe-c-ctm-green-to-red.html
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#129])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-apl4/igt@kms_color@pipe-c-ctm-green-to-red.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-apl2/igt@kms_color@pipe-c-ctm-green-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][33] -> [INCOMPLETE][34] ([i915#155])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-dpms:
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#54]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-dpms.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-dpms.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#79])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-apl1/igt@kms_flip@flip-vs-expired-vblank.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-apl7/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][39] -> [FAIL][40] ([i915#79]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-glk:          [PASS][41] -> [FAIL][42] ([i915#34])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-glk7/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-glk4/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-iclb:         [PASS][43] -> [INCOMPLETE][44] ([i915#250])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-iclb6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_cursor@pipe-c-viewport-size-64:
    - shard-apl:          [PASS][45] -> [INCOMPLETE][46] ([fdo#103927])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-apl3/igt@kms_plane_cursor@pipe-c-viewport-size-64.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-apl1/igt@kms_plane_cursor@pipe-c-viewport-size-64.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109642] / [fdo#111068])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-iclb8/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][49] -> [FAIL][50] ([i915#31])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-apl6/igt@kms_setmode@basic.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-apl3/igt@kms_setmode@basic.html
    - shard-glk:          [PASS][51] -> [FAIL][52] ([i915#31])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-glk4/igt@kms_setmode@basic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-glk6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [PASS][53] -> [DMESG-WARN][54] ([i915#180]) +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][55] -> [SKIP][56] ([fdo#112080]) +14 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-iclb1/igt@perf_pmu@busy-vcs1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-iclb5/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][57] ([fdo#112080]) -> [PASS][58] +11 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-iclb3/igt@gem_busy@busy-vcs1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-iclb2/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [INCOMPLETE][59] ([i915#1402]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-kbl4/igt@gem_ctx_persistence@close-replace-race.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-kbl3/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][61] ([fdo#110841]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_async@concurrent-writes-bsd:
    - shard-iclb:         [SKIP][63] ([fdo#112146]) -> [PASS][64] +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-iclb1/igt@gem_exec_async@concurrent-writes-bsd.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-iclb6/igt@gem_exec_async@concurrent-writes-bsd.html

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [SKIP][65] ([i915#677]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-iclb7/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][67] ([fdo#109276] / [i915#677]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-iclb6/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@in-order-bsd2:
    - shard-iclb:         [SKIP][69] ([fdo#109276]) -> [PASS][70] +13 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-iclb3/igt@gem_exec_schedule@in-order-bsd2.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-iclb4/igt@gem_exec_schedule@in-order-bsd2.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72] +5 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-kbl6/igt@gem_exec_suspend@basic-s3.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-kbl3/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-tglb:         [TIMEOUT][73] ([i915#1408]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-tglb3/igt@gem_exec_whisper@basic-fds-priority.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-tglb8/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [FAIL][75] ([i915#644]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][77] ([i915#413]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-iclb1/igt@i915_pm_rps@reset.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-iclb5/igt@i915_pm_rps@reset.html

  * igt@i915_suspend@debugfs-reader:
    - shard-apl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-apl3/igt@i915_suspend@debugfs-reader.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-apl4/igt@i915_suspend@debugfs-reader.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-kbl:          [FAIL][81] ([i915#79]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-kbl6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-kbl2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][83] ([i915#899]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][85] ([fdo#109441]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-iclb4/igt@kms_psr@psr2_cursor_blt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][87] ([i915#31]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-hsw2/igt@kms_setmode@basic.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-hsw2/igt@kms_setmode@basic.html
    - shard-kbl:          [FAIL][89] ([i915#31]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-kbl1/igt@kms_setmode@basic.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-kbl7/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@gem_linear_blits@normal:
    - shard-apl:          [TIMEOUT][91] ([fdo#111732] / [i915#1322]) -> [TIMEOUT][92] ([i915#1322])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-apl7/igt@gem_linear_blits@normal.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-apl3/igt@gem_linear_blits@normal.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [DMESG-WARN][93] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][94] ([fdo#111870])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-hsw2/igt@gem_userptr_blits@sync-unmap-after-close.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-hsw1/igt@gem_userptr_blits@sync-unmap-after-close.html
    - shard-snb:          [DMESG-WARN][95] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][96] ([fdo#111870] / [i915#478])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglb:         [SKIP][97] ([fdo#111644] / [i915#1397]) -> [SKIP][98] ([i915#1316])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-tglb5/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-tglb8/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-iclb:         [SKIP][99] ([fdo#110892]) -> [SKIP][100] ([i915#1316])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][101], [FAIL][102]) ([i915#1389] / [i915#1402] / [i915#92]) -> [FAIL][103] ([i915#92])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-kbl2/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8130/shard-kbl4/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/shard-kbl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111732]: https://bugs.freedesktop.org/show_bug.cgi?id=111732
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1322]: https://gitlab.freedesktop.org/drm/intel/issues/1322
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#1408]: https://gitlab.freedesktop.org/drm/intel/issues/1408
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5506 -> IGTPW_4299
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8130: cf47ad003bc75f001bd33caedb28c8ba2e3c3d33 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4299: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/index.html
  IGT_5506: 59fd8a0d01dac58dc6c7d86ef391ed4393ab5aae @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4299/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
