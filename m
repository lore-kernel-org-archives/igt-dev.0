Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 24 Mar 2020 20:18:26 -0000
Message-ID: <158508110665.5747.10511460932897302903@emeril.freedesktop.org>
References: <20200318004914.236815-1-lyude@redhat.com>
In-Reply-To: <20200318004914.236815-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fpipe=5Fcrc=5Fbasic?=
 =?utf-8?b?OiBVc2UgaWd0X2Rpc3BsYXlfcmVxdWlyZV9vdXRwdXRfb25fcGlwZSgpIChy?=
 =?utf-8?q?ev3=29?=
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
To: Lyude Paul <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_pipe_crc_basic: Use igt_display_require_output_on_pipe() (rev3)
URL   : https://patchwork.freedesktop.org/series/74808/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8183_full -> IGTPW_4347_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/index.html

New tests
---------

  New tests have been introduced between CI_DRM_8183_full and IGTPW_4347_full:

### New IGT tests (4) ###

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a:
    - Statuses : 5 pass(s)
    - Exec time: [0.48, 1.37] s

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b:
    - Statuses : 7 pass(s)
    - Exec time: [0.38, 2.62] s

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c:
    - Statuses : 5 pass(s)
    - Exec time: [0.58, 2.61] s

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 2.50] s

  

Known issues
------------

  Here are the changes found in IGTPW_4347_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@bcs0-s3:
    - shard-apl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-apl8/igt@gem_ctx_isolation@bcs0-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-apl1/igt@gem_ctx_isolation@bcs0-s3.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [i915#677]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-iclb5/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276]) +18 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-iclb1/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-iclb6/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +8 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-iclb7/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@kms_color@pipe-a-legacy-gamma:
    - shard-snb:          [PASS][11] -> [SKIP][12] ([fdo#109271]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-snb5/igt@kms_color@pipe-a-legacy-gamma.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-snb6/igt@kms_color@pipe-a-legacy-gamma.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x85-random:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#54])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#54])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#72])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#899])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109642] / [fdo#111068])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-iclb7/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-iclb2/igt@kms_psr@psr2_dpms.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-iclb3/igt@kms_psr@psr2_dpms.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#112080]) +11 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-iclb2/igt@perf_pmu@busy-vcs1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-iclb8/igt@perf_pmu@busy-vcs1.html

  * igt@prime_busy@hang-default:
    - shard-snb:          [PASS][29] -> [INCOMPLETE][30] ([i915#82])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-snb2/igt@prime_busy@hang-default.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-snb1/igt@prime_busy@hang-default.html

  
#### Possible fixes ####

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][31] ([fdo#110841]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_parallel@contexts:
    - shard-tglb:         [INCOMPLETE][33] ([i915#470] / [i915#529]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-tglb2/igt@gem_exec_parallel@contexts.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-tglb7/igt@gem_exec_parallel@contexts.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][35] ([fdo#112080]) -> [PASS][36] +13 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-iclb2/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [SKIP][37] ([i915#677]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-iclb2/igt@gem_exec_schedule@implicit-both-bsd.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-iclb6/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][39] ([fdo#112146]) -> [PASS][40] +4 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_ringfill@basic-default-hang:
    - shard-tglb:         [INCOMPLETE][41] -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-tglb6/igt@gem_ringfill@basic-default-hang.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-tglb2/igt@gem_ringfill@basic-default-hang.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][43] ([i915#180]) -> [PASS][44] +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-apl:          [FAIL][45] ([i915#54]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +4 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-random:
    - shard-glk:          [FAIL][49] ([i915#54]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-glk:          [FAIL][51] ([i915#34]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-glk4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@nonexisting-fb-interruptible:
    - shard-apl:          [DMESG-WARN][53] ([i915#1297]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-apl1/igt@kms_flip@nonexisting-fb-interruptible.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-apl2/igt@kms_flip@nonexisting-fb-interruptible.html
    - shard-kbl:          [DMESG-WARN][55] ([i915#1297]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-kbl1/igt@kms_flip@nonexisting-fb-interruptible.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-kbl2/igt@kms_flip@nonexisting-fb-interruptible.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [INCOMPLETE][57] ([i915#155]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][59] ([fdo#109441]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-iclb6/igt@kms_psr@psr2_cursor_plane_onoff.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][61] ([i915#31]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-apl4/igt@kms_setmode@basic.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-apl4/igt@kms_setmode@basic.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][63] ([fdo#109276]) -> [PASS][64] +18 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@i915_pm_rpm@cursor:
    - shard-snb:          [INCOMPLETE][65] ([i915#82]) -> [SKIP][66] ([fdo#109271]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-snb2/igt@i915_pm_rpm@cursor.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-snb6/igt@i915_pm_rpm@cursor.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
    - shard-iclb:         [SKIP][67] ([fdo#109278] / [fdo#112010]) -> [SKIP][68] ([fdo#109278]) +4 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/shard-iclb3/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/shard-iclb2/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#112010]: https://bugs.freedesktop.org/show_bug.cgi?id=112010
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5535 -> IGTPW_4347
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8183: 795894daf2cc32246af94541733e08649d082470 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4347: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/index.html
  IGT_5535: d1dcf40cc6869ac858586c5ad9f09af6617ce2ee @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
