Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 19 Mar 2020 09:31:19 -0000
Message-ID: <158461027992.17934.5615550770372667666@emeril.freedesktop.org>
References: <20200319073819.13383-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20200319073819.13383-1-dominik.grzegorzek@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fexec=5Falignment=2Ec=3A_Update_subtests_=28rev3=29?=
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
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/gem_exec_alignment.c: Update subtests (rev3)
URL   : https://patchwork.freedesktop.org/series/74633/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8157_full -> IGTPW_4323_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/index.html

Known issues
------------

  Here are the changes found in IGTPW_4323_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs0-s3:
    - shard-apl:          [PASS][1] -> [INCOMPLETE][2] ([fdo#103927])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-apl1/igt@gem_ctx_isolation@vcs0-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-apl8/igt@gem_ctx_isolation@vcs0-s3.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [PASS][3] -> [INCOMPLETE][4] ([i915#1402])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-tglb6/igt@gem_ctx_persistence@close-replace-race.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-tglb8/igt@gem_ctx_persistence@close-replace-race.html
    - shard-iclb:         [PASS][5] -> [INCOMPLETE][6] ([i915#1402])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-iclb2/igt@gem_ctx_persistence@close-replace-race.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-iclb1/igt@gem_ctx_persistence@close-replace-race.html
    - shard-apl:          [PASS][7] -> [INCOMPLETE][8] ([fdo#103927] / [i915#1402])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-apl6/igt@gem_ctx_persistence@close-replace-race.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-apl6/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#110841])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@implicit-write-read-bsd1:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276] / [i915#677])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-iclb2/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-iclb8/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#677]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@promotion-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#112146]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-iclb5/igt@gem_exec_schedule@promotion-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-iclb4/igt@gem_exec_schedule@promotion-bsd.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#454])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#413])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-iclb3/igt@i915_pm_rps@reset.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-iclb4/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live@execlists:
    - shard-apl:          [PASS][21] -> [INCOMPLETE][22] ([fdo#103927] / [i915#656])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-apl6/igt@i915_selftest@live@execlists.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-apl1/igt@i915_selftest@live@execlists.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-hsw:          [PASS][25] -> [FAIL][26] ([IGT#5])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-hsw6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-hsw6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-kbl:          [PASS][27] -> [INCOMPLETE][28] ([i915#1297])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-kbl2/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-kbl4/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html
    - shard-apl:          [PASS][29] -> [INCOMPLETE][30] ([fdo#103927] / [i915#1297])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-apl3/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-apl6/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +6 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][33] -> [SKIP][34] ([i915#433])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109642] / [fdo#111068])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-iclb3/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:
    - shard-tglb:         [PASS][37] -> [SKIP][38] ([fdo#112015])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-tglb6/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
    - shard-hsw:          [PASS][39] -> [SKIP][40] ([fdo#109271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-hsw1/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-hsw5/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109278])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-iclb2/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-iclb2/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
    - shard-glk:          [PASS][43] -> [SKIP][44] ([fdo#109271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-glk6/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-glk1/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#112080]) +10 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-iclb5/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109276]) +20 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [INCOMPLETE][49] ([i915#1402]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-kbl4/igt@gem_ctx_persistence@close-replace-race.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-kbl6/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][51] ([fdo#112080]) -> [PASS][52] +10 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][53] ([fdo#109276] / [i915#677]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-iclb7/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][55] ([i915#677]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@pi-ringfull-bsd:
    - shard-iclb:         [SKIP][57] ([fdo#112146]) -> [PASS][58] +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-iclb2/igt@gem_exec_schedule@pi-ringfull-bsd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-iclb5/igt@gem_exec_schedule@pi-ringfull-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][59] ([fdo#109276]) -> [PASS][60] +17 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-iclb3/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-iclb2/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][61] ([i915#644]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-apl4/igt@kms_flip@flip-vs-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-apl2/igt@kms_flip@flip-vs-suspend.html
    - shard-iclb:         [INCOMPLETE][65] ([i915#1185] / [i915#221]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-iclb3/igt@kms_flip@flip-vs-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-iclb4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68] +10 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][69] ([i915#899]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-glk2/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][71] ([fdo#109441]) -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-iclb8/igt@kms_psr@psr2_cursor_render.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:
    - shard-tglb:         [SKIP][73] ([fdo#112015]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-tglb3/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-tglb5/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-hsw:          [SKIP][75] ([fdo#109271]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-hsw1/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-hsw1/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-iclb:         [SKIP][77] ([fdo#109278]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-iclb7/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-iclb6/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-glk:          [SKIP][79] ([fdo#109271]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-glk5/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-glk9/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html

  
#### Warnings ####

  * igt@i915_pm_rpm@fences:
    - shard-snb:          [SKIP][81] ([fdo#109271]) -> [INCOMPLETE][82] ([i915#82])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-snb4/igt@i915_pm_rpm@fences.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-snb5/igt@i915_pm_rpm@fences.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][83], [FAIL][84], [FAIL][85], [FAIL][86], [FAIL][87], [FAIL][88], [FAIL][89], [FAIL][90]) ([fdo#111870]) -> ([FAIL][91], [FAIL][92], [FAIL][93], [FAIL][94], [FAIL][95], [FAIL][96], [FAIL][97], [FAIL][98], [FAIL][99]) ([fdo#111870] / [i915#1485])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-hsw6/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-hsw2/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-hsw6/igt@runner@aborted.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-hsw6/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-hsw4/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-hsw4/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-hsw1/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-hsw7/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-hsw4/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-hsw7/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-hsw7/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-hsw1/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-hsw2/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-hsw6/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-hsw5/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-hsw2/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-hsw2/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][100], [FAIL][101]) ([i915#1389] / [i915#1402] / [i915#92]) -> [FAIL][102] ([i915#92])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-kbl7/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-kbl4/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-kbl3/igt@runner@aborted.html
    - shard-apl:          [FAIL][103] ([fdo#103927]) -> ([FAIL][104], [FAIL][105], [FAIL][106]) ([fdo#103927] / [i915#1402] / [i915#529])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-apl4/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-apl3/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-apl1/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-apl6/igt@runner@aborted.html
    - shard-snb:          ([FAIL][107], [FAIL][108], [FAIL][109], [FAIL][110], [FAIL][111], [FAIL][112], [FAIL][113], [FAIL][114]) ([fdo#111870] / [i915#1077]) -> ([FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118], [FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122]) ([fdo#111870] / [i915#1077] / [i915#1485])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-snb5/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-snb5/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-snb5/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-snb4/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-snb4/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-snb6/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-snb5/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8157/shard-snb2/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-snb6/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-snb2/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-snb5/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-snb6/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-snb4/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-snb4/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-snb4/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/shard-snb6/igt@runner@aborted.html

  
  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#1485]: https://gitlab.freedesktop.org/drm/intel/issues/1485
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#221]: https://gitlab.freedesktop.org/drm/intel/issues/221
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5522 -> IGTPW_4323
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8157: 4f297a639d15ec6c293b74ff0904de6146b18e4f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4323: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/index.html
  IGT_5522: bd2b01af69c9720d54e68a8702a23e4ff3637746 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4323/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
