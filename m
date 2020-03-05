Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 05 Mar 2020 13:32:05 -0000
Message-ID: <158341512586.17237.8488509134235269444@emeril.freedesktop.org>
References: <1583333427-18040-1-git-send-email-juhapekka.heikkila@gmail.com>
In-Reply-To: <1583333427-18040-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Flegacy=3A_increase_timeout_for_nonblocking_flip_?=
 =?utf-8?q?wait_=28rev2=29?=
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_cursor_legacy: increase timeout for nonblocking flip wait (rev2)
URL   : https://patchwork.freedesktop.org/series/73767/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8065_full -> IGTPW_4258_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/index.html

Known issues
------------

  Here are the changes found in IGTPW_4258_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#110854])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb4/igt@gem_exec_balancer@smoke.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-iclb3/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112080]) +16 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [i915#677])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-iclb7/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([i915#677])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb5/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb8/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#31])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-apl8/igt@kms_setmode@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-apl3/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-snb:          [PASS][15] -> [DMESG-WARN][16] ([i915#42])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-snb6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-snb2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109276]) +16 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [INCOMPLETE][19] ([fdo#103665]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-kbl1/igt@gem_ctx_persistence@close-replace-race.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-kbl7/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][21] ([fdo#110841]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@implicit-write-read-bsd1:
    - shard-iclb:         [SKIP][23] ([fdo#109276] / [i915#677]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb6/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-iclb2/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][25] ([i915#677]) -> [PASS][26] +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][27] ([fdo#109276]) -> [PASS][28] +15 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][29] ([fdo#112146]) -> [PASS][30] +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][31] ([i915#644]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [FAIL][33] ([i915#644]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-kbl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-kbl7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][35] ([i915#180]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][37] ([i915#899]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][39] ([fdo#109441]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb4/igt@kms_psr@psr2_cursor_blt.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][41] ([i915#31]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-kbl6/igt@kms_setmode@basic.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-kbl6/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-accuracy-98-vcs1:
    - shard-iclb:         [SKIP][43] ([fdo#112080]) -> [PASS][44] +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb7/igt@perf_pmu@busy-accuracy-98-vcs1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-iclb4/igt@perf_pmu@busy-accuracy-98-vcs1.html

  
#### Warnings ####

  * igt@gem_exec_schedule@pi-userfault-bsd1:
    - shard-iclb:         [SKIP][45] ([fdo#109276]) -> [INCOMPLETE][46] ([i915#1381])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb8/igt@gem_exec_schedule@pi-userfault-bsd1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-iclb1/igt@gem_exec_schedule@pi-userfault-bsd1.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         [SKIP][47] ([fdo#109293] / [fdo#109506]) -> [SKIP][48] ([i915#1316])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-iclb3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-iclb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         [SKIP][49] ([fdo#109506]) -> [SKIP][50] ([i915#1316])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8065/shard-tglb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/shard-tglb1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1381]: https://gitlab.freedesktop.org/drm/intel/issues/1381
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5491 -> IGTPW_4258
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8065: e50ed1b1ef982f7648ca558f1cfd16ad3190e094 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4258: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/index.html
  IGT_5491: d52794b426ae16630cc1e0354ae435ec98f6174b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4258/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
