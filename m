Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 09 Mar 2020 10:48:09 -0000
Message-ID: <158375088900.9450.4886890718360371852@emeril.freedesktop.org>
References: <20200309075100.29834-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20200309075100.29834-1-dominik.grzegorzek@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fexec=5Falignment=2Ec=3A_Add_priority_inversion_test=2E?=
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

Series: tests/gem_exec_alignment.c: Add priority inversion test.
URL   : https://patchwork.freedesktop.org/series/74430/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8093_full -> IGTPW_4276_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/index.html

Known issues
------------

  Here are the changes found in IGTPW_4276_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2] ([i915#1402])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-tglb1/igt@gem_ctx_persistence@close-replace-race.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-tglb5/igt@gem_ctx_persistence@close-replace-race.html
    - shard-iclb:         [PASS][3] -> [INCOMPLETE][4] ([i915#1402])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb2/igt@gem_ctx_persistence@close-replace-race.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-iclb6/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_async@concurrent-writes-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112146]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb5/igt@gem_exec_async@concurrent-writes-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-iclb1/igt@gem_exec_async@concurrent-writes-bsd.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112080]) +12 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-write-read-bsd1:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276] / [i915#677]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb4/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-iclb6/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [PASS][11] -> [INCOMPLETE][12] ([fdo#103665])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-kbl1/igt@gem_workarounds@suspend-resume-context.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-kbl3/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][13] -> [FAIL][14] ([i915#413])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb8/igt@i915_pm_rps@waitboost.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-iclb5/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([fdo#103375]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#109642] / [fdo#111068])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-iclb8/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109441]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-iclb4/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm:
    - shard-tglb:         [PASS][25] -> [SKIP][26] ([fdo#112015])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-tglb6/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109276]) +23 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-apl:          [TIMEOUT][29] -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-apl2/igt@gem_ctx_persistence@close-replace-race.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-apl8/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [INCOMPLETE][31] ([fdo#103665]) -> [PASS][32] +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-kbl6/igt@gem_eio@in-flight-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-kbl6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][33] ([fdo#110854]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb7/igt@gem_exec_balancer@smoke.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-iclb1/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][35] ([fdo#109276] / [i915#677]) -> [PASS][36] +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][37] ([i915#677]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-queue-chain-bsd:
    - shard-iclb:         [SKIP][39] ([fdo#112146]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb4/igt@gem_exec_schedule@preempt-queue-chain-bsd.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-iclb5/igt@gem_exec_schedule@preempt-queue-chain-bsd.html

  * igt@gem_exec_whisper@basic-contexts-priority:
    - shard-glk:          [DMESG-WARN][41] ([i915#118] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-glk2/igt@gem_exec_whisper@basic-contexts-priority.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-glk2/igt@gem_exec_whisper@basic-contexts-priority.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][43] ([i915#644]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-tglb:         [FAIL][45] ([i915#644]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-tglb7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-tglb8/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rpm@fences:
    - shard-tglb:         [SKIP][47] ([i915#1316]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-tglb7/igt@i915_pm_rpm@fences.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-tglb8/igt@i915_pm_rpm@fences.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-iclb:         [SKIP][49] ([i915#1316]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb4/igt@i915_pm_rpm@system-suspend-execbuf.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-iclb4/igt@i915_pm_rpm@system-suspend-execbuf.html
    - shard-hsw:          [SKIP][51] ([fdo#109271]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-hsw4/igt@i915_pm_rpm@system-suspend-execbuf.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-hsw6/igt@i915_pm_rpm@system-suspend-execbuf.html
    - shard-glk:          [SKIP][53] ([fdo#109271]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-glk4/igt@i915_pm_rpm@system-suspend-execbuf.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-glk5/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][55] ([i915#413]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb4/igt@i915_pm_rps@reset.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-iclb8/igt@i915_pm_rps@reset.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +4 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [FAIL][59] ([i915#96]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-kbl:          [DMESG-WARN][61] ([i915#1297]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-kbl2/igt@kms_flip@absolute-wf_vblank.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-kbl7/igt@kms_flip@absolute-wf_vblank.html
    - shard-apl:          [DMESG-WARN][63] ([i915#1297]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-apl8/igt@kms_flip@absolute-wf_vblank.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-apl4/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@modeset-vs-vblank-race:
    - shard-apl:          [FAIL][65] ([i915#407]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-apl3/igt@kms_flip@modeset-vs-vblank-race.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-apl3/igt@kms_flip@modeset-vs-vblank-race.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-kbl:          [FAIL][67] ([i915#34]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-kbl3/igt@kms_flip@plain-flip-fb-recreate.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-kbl2/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][69] ([i915#180]) -> [PASS][70] +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][71] ([i915#899]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [FAIL][75] ([i915#1085]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-tglb7/igt@perf@gen12-mi-rpc.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-tglb2/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][77] ([fdo#112080]) -> [PASS][78] +10 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb8/igt@perf_pmu@busy-vcs1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-iclb1/igt@perf_pmu@busy-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][79] ([fdo#109276]) -> [PASS][80] +16 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-iclb3/igt@prime_busy@hang-bsd2.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-iclb4/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-glk:          [INCOMPLETE][81] ([i915#58] / [k.org#198133]) -> [INCOMPLETE][82] ([i915#1402] / [i915#58] / [k.org#198133])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-glk5/igt@gem_ctx_persistence@close-replace-race.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-glk1/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [DMESG-WARN][83] ([i915#180]) -> [INCOMPLETE][84] ([fdo#103665])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-kbl4/igt@gem_softpin@noreloc-s3.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-kbl4/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@process-exit-gtt-busy:
    - shard-hsw:          [SKIP][85] ([fdo#109271]) -> [INCOMPLETE][86] ([i915#61])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-hsw8/igt@gem_userptr_blits@process-exit-gtt-busy.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-hsw8/igt@gem_userptr_blits@process-exit-gtt-busy.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][87] ([i915#468]) -> [FAIL][88] ([i915#454])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8093/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/shard-tglb5/igt@i915_pm_dc@dc6-psr.html

  
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5499 -> IGTPW_4276
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8093: 0d201b03b62aacbd13fd104a371bd45ee2060277 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4276: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/index.html
  IGT_5499: 2e23cf6f63fc6ba1d9543f8327698d6f21813cec @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4276/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
