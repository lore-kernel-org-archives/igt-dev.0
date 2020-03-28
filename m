Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 28 Mar 2020 14:13:37 -0000
Message-ID: <158540481790.10054.11524624427396684026@emeril.freedesktop.org>
References: <20200327131222.26945-1-swati2.sharma@intel.com>
In-Reply-To: <20200327131222.26945-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv5=2C1/2=5D_tests/kms=5Fatomic=3A_Add?=
 =?utf-8?q?_test_to_validate_immutable_zpos?=
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
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,v5,1/2] tests/kms_atomic: Add test to validate immutable zpos
URL   : https://patchwork.freedesktop.org/series/75170/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8202_full -> IGTPW_4366_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4366_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_atomic@plane-immutable-zpos} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-snb5/igt@kms_atomic@plane-immutable-zpos.html
    - shard-hsw:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-hsw8/igt@kms_atomic@plane-immutable-zpos.html
    - shard-kbl:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-kbl4/igt@kms_atomic@plane-immutable-zpos.html
    - shard-apl:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-apl4/igt@kms_atomic@plane-immutable-zpos.html
    - shard-glk:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-glk2/igt@kms_atomic@plane-immutable-zpos.html

  * {igt@kms_atomic@plane-primary-overlay-mutable-zpos} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-tglb5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-iclb:         NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-iclb2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_ctx_shared@q-independent@vcs0}:
    - shard-tglb:         [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-tglb7/igt@gem_ctx_shared@q-independent@vcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-tglb1/igt@gem_ctx_shared@q-independent@vcs0.html

  * {igt@gem_ctx_shared@q-independent@vecs0}:
    - shard-iclb:         [PASS][10] -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb4/igt@gem_ctx_shared@q-independent@vecs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-iclb8/igt@gem_ctx_shared@q-independent@vecs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8202_full and IGTPW_4366_full:

### New IGT tests (11) ###

  * igt@kms_atomic@atomic-invalid-params:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.23] s

  * igt@kms_atomic@crtc-invalid-params:
    - Statuses : 7 pass(s)
    - Exec time: [0.02, 0.19] s

  * igt@kms_atomic@crtc-invalid-params-fence:
    - Statuses : 7 pass(s)
    - Exec time: [0.05, 0.23] s

  * igt@kms_atomic@plane-cursor-legacy:
    - Statuses : 7 pass(s)
    - Exec time: [0.05, 0.19] s

  * igt@kms_atomic@plane-immutable-zpos:
    - Statuses : 5 fail(s) 2 pass(s)
    - Exec time: [0.05, 0.51] s

  * igt@kms_atomic@plane-invalid-params:
    - Statuses : 5 pass(s)
    - Exec time: [0.08, 0.24] s

  * igt@kms_atomic@plane-invalid-params-fence:
    - Statuses : 7 pass(s)
    - Exec time: [0.02, 0.17] s

  * igt@kms_atomic@plane-overlay-legacy:
    - Statuses : 7 pass(s)
    - Exec time: [0.10, 0.28] s

  * igt@kms_atomic@plane-primary-legacy:
    - Statuses : 7 pass(s)
    - Exec time: [0.09, 0.31] s

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_atomic@test-only:
    - Statuses : 7 pass(s)
    - Exec time: [0.23, 2.63] s

  

Known issues
------------

  Here are the changes found in IGTPW_4366_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#109276] / [i915#677])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-iclb5/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([i915#677]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb3/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#109276]) +17 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][18] -> [SKIP][19] ([fdo#112146]) +4 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-iclb:         [PASS][20] -> [INCOMPLETE][21] ([i915#1373])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb2/igt@gem_exec_suspend@basic-s4-devices.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-iclb2/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_wait@await-vcs1:
    - shard-iclb:         [PASS][22] -> [SKIP][23] ([fdo#112080]) +6 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb2/igt@gem_wait@await-vcs1.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-iclb3/igt@gem_wait@await-vcs1.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#1527])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-glk2/igt@i915_pm_rc6_residency@rc6-idle.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-glk8/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_busy@basic-flip-pipe-a:
    - shard-snb:          [PASS][26] -> [DMESG-WARN][27] ([i915#478])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-snb2/igt@kms_busy@basic-flip-pipe-a.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-snb1/igt@kms_busy@basic-flip-pipe-a.html
    - shard-hsw:          [PASS][28] -> [DMESG-WARN][29] ([i915#478])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-hsw5/igt@kms_busy@basic-flip-pipe-a.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-hsw5/igt@kms_busy@basic-flip-pipe-a.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-kbl:          [PASS][30] -> [FAIL][31] ([i915#54] / [i915#93] / [i915#95])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled:
    - shard-glk:          [PASS][32] -> [FAIL][33] ([i915#52] / [i915#54])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled.html

  * igt@kms_flip@basic-plain-flip:
    - shard-apl:          [PASS][34] -> [DMESG-WARN][35] ([i915#1297])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-apl4/igt@kms_flip@basic-plain-flip.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-apl3/igt@kms_flip@basic-plain-flip.html
    - shard-kbl:          [PASS][36] -> [DMESG-WARN][37] ([i915#1297])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl3/igt@kms_flip@basic-plain-flip.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-kbl7/igt@kms_flip@basic-plain-flip.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [PASS][38] -> [INCOMPLETE][39] ([i915#61])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-hsw8/igt@kms_flip@flip-vs-suspend.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-hsw8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][40] -> [DMESG-WARN][41] ([i915#180]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][42] -> [SKIP][43] ([i915#433])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][44] -> [DMESG-WARN][45] ([i915#180]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [PASS][46] -> [FAIL][47] ([i915#95])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-apl3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [PASS][48] -> [FAIL][49] ([i915#93] / [i915#95])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][50] -> [SKIP][51] ([fdo#109642] / [fdo#111068])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-iclb1/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][52] -> [SKIP][53] ([fdo#109441]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-iclb3/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][54] -> [FAIL][55] ([i915#31])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl7/igt@kms_setmode@basic.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-kbl2/igt@kms_setmode@basic.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][56] -> [FAIL][57] ([i915#1085])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-tglb1/igt@perf@gen12-mi-rpc.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-tglb3/igt@perf@gen12-mi-rpc.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][58] ([fdo#112080]) -> [PASS][59] +11 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb5/igt@gem_busy@busy-vcs1.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-iclb4/igt@gem_busy@busy-vcs1.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [DMESG-WARN][60] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl2/igt@gem_eio@in-flight-suspend.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-kbl1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_async@concurrent-writes-bsd:
    - shard-iclb:         [SKIP][62] ([fdo#112146]) -> [PASS][63] +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb1/igt@gem_exec_async@concurrent-writes-bsd.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-iclb5/igt@gem_exec_async@concurrent-writes-bsd.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [FAIL][64] ([i915#1277]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-tglb5/igt@gem_exec_balancer@hang.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-tglb7/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@implicit-both-bsd2:
    - shard-iclb:         [SKIP][66] ([fdo#109276] / [i915#677]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb5/igt@gem_exec_schedule@implicit-both-bsd2.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-iclb2/igt@gem_exec_schedule@implicit-both-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd1:
    - shard-iclb:         [SKIP][68] ([fdo#109276]) -> [PASS][69] +11 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb6/igt@gem_exec_schedule@pi-common-bsd1.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd1.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-hsw:          [DMESG-WARN][70] ([fdo#111870]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-hsw7/igt@gem_userptr_blits@dmabuf-unsync.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-hsw6/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-snb:          [DMESG-WARN][72] ([fdo#111870] / [i915#478]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-snb4/igt@gem_userptr_blits@dmabuf-unsync.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - shard-tglb:         [SKIP][74] ([i915#1316]) -> [PASS][75] +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-tglb2/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-tglb2/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-iclb:         [SKIP][76] ([i915#1316]) -> [PASS][77] +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb4/igt@i915_pm_rpm@pm-tiling.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-iclb4/igt@i915_pm_rpm@pm-tiling.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen:
    - shard-kbl:          [FAIL][78] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][79] +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][80] ([i915#180]) -> [PASS][81] +3 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][82] ([fdo#109349]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [FAIL][84] ([i915#52] / [i915#54]) -> [PASS][85] +4 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [FAIL][86] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][87] +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [FAIL][88] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][89] +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [DMESG-WARN][90] ([i915#180] / [i915#95]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-kbl:          [FAIL][92] ([i915#49]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
    - shard-apl:          [FAIL][94] ([i915#49]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [FAIL][96] ([i915#95]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-apl2/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-apl1/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [FAIL][98] ([i915#93] / [i915#95]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl2/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-kbl3/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][100] ([fdo#109441]) -> [PASS][101] +3 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-a-wait-forked-busy:
    - shard-snb:          [SKIP][102] ([fdo#109271]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-snb4/igt@kms_vblank@pipe-a-wait-forked-busy.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-snb1/igt@kms_vblank@pipe-a-wait-forked-busy.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][104] ([i915#180]) -> [PASS][105] +2 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-apl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf_pmu@rc6-runtime-pm:
    - shard-glk:          [SKIP][106] ([fdo#109271]) -> [PASS][107] +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-glk5/igt@perf_pmu@rc6-runtime-pm.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-glk1/igt@perf_pmu@rc6-runtime-pm.html
    - shard-tglb:         [SKIP][108] ([fdo#111719]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-tglb2/igt@perf_pmu@rc6-runtime-pm.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-tglb2/igt@perf_pmu@rc6-runtime-pm.html
    - shard-hsw:          [SKIP][110] ([fdo#109271]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-hsw7/igt@perf_pmu@rc6-runtime-pm.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-hsw6/igt@perf_pmu@rc6-runtime-pm.html
    - shard-iclb:         [SKIP][112] ([i915#293]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb4/igt@perf_pmu@rc6-runtime-pm.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-iclb6/igt@perf_pmu@rc6-runtime-pm.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][114] ([i915#454]) -> [SKIP][115] ([i915#468])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-tglb6/igt@i915_pm_dc@dc6-psr.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][116] ([fdo#108145] / [i915#95]) -> [FAIL][117] ([fdo#108145])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparant-fb:
    - shard-kbl:          [FAIL][118] ([fdo#108145]) -> [FAIL][119] ([fdo#108145] / [i915#93] / [i915#95])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparant-fb.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-transparant-fb.html
    - shard-apl:          [FAIL][120] ([fdo#108145]) -> [FAIL][121] ([fdo#108145] / [i915#95]) +1 similar issue
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-apl3/igt@kms_plane_alpha_blend@pipe-c-alpha-transparant-fb.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-transparant-fb.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125], [FAIL][126], [FAIL][127], [FAIL][128]) ([fdo#111870] / [i915#1485]) -> ([FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132], [FAIL][133], [FAIL][134], [FAIL][135], [FAIL][136], [FAIL][137]) ([fdo#111870] / [i915#1485] / [i915#478])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-hsw4/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-hsw8/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-hsw8/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-hsw8/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-hsw7/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-hsw8/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-hsw4/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-hsw5/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-hsw4/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-hsw5/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-hsw6/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-hsw2/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-hsw2/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-hsw8/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-hsw7/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/shard-hsw4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1373]: https://gitlab.freedesktop.org/drm/intel/issues/1373
  [i915#1485]: https://gitlab.freedesktop.org/drm/intel/issues/1485
  [i915#1527]: https://gitlab.freedesktop.org/drm/intel/issues/1527
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#293]: https://gitlab.freedesktop.org/drm/intel/issues/293
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5542 -> IGTPW_4366
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8202: 3d926ba12446374635f2fc299233742ffc1ba69a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4366: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/index.html
  IGT_5542: 633ae927e4924006040f075841ef8d98751ce3b4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4366/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
