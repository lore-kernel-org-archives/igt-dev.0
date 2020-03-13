Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 13 Mar 2020 04:08:24 -0000
Message-ID: <158407250485.30350.15187745926321546325@emeril.freedesktop.org>
References: <20200312095944.7477-1-petri.latvala@intel.com>
In-Reply-To: <20200312095944.7477-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D_runner=3A_Handle_outputs_befor?=
 =?utf-8?q?e_checking_for_timeout?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/3] runner: Handle outputs before checking for timeout
URL   : https://patchwork.freedesktop.org/series/74636/
State : success

== Summary ==

CI Bug Log - changes from IGT_5506_full -> IGTPW_4297_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/index.html

Known issues
------------

  Here are the changes found in IGTPW_4297_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@vcs0-fds:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2] ([i915#470])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-tglb2/igt@gem_exec_parallel@vcs0-fds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-tglb3/igt@gem_exec_parallel@vcs0-fds.html

  * igt@gem_exec_schedule@implicit-write-read-bsd2:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [i915#677])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb1/igt@gem_exec_schedule@implicit-write-read-bsd2.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-iclb5/igt@gem_exec_schedule@implicit-write-read-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb6/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-iclb1/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - shard-hsw:          [PASS][9] -> [SKIP][10] ([fdo#109271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-hsw7/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-hsw1/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#1316])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb6/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-iclb4/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-tglb:         [PASS][13] -> [SKIP][14] ([i915#1316])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-tglb3/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-tglb3/igt@i915_pm_rpm@debugfs-forcewake-user.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-kbl:          [PASS][15] -> [INCOMPLETE][16] ([i915#151])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-kbl4/igt@i915_pm_rpm@system-suspend-modeset.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-kbl1/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_selftest@live@execlists:
    - shard-apl:          [PASS][17] -> [INCOMPLETE][18] ([fdo#103927] / [i915#656])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-apl4/igt@i915_selftest@live@execlists.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-apl1/igt@i915_selftest@live@execlists.html

  * igt@kms_busy@basic-flip-pipe-b:
    - shard-snb:          [PASS][19] -> [DMESG-WARN][20] ([i915#478])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-snb2/igt@kms_busy@basic-flip-pipe-b.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-snb4/igt@kms_busy@basic-flip-pipe-b.html
    - shard-hsw:          [PASS][21] -> [DMESG-WARN][22] ([i915#478])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-hsw2/igt@kms_busy@basic-flip-pipe-b.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-hsw7/igt@kms_busy@basic-flip-pipe-b.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +5 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-random:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-apl8/igt@kms_flip@flip-vs-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-apl4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][29] -> [SKIP][30] ([i915#433])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([fdo#103375]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#899])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109642] / [fdo#111068])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-iclb8/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-iclb3/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#31])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-kbl7/igt@kms_setmode@basic.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-kbl3/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@universal-plane-pipe-a-functional:
    - shard-snb:          [PASS][41] -> [SKIP][42] ([fdo#109271]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-snb5/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-snb4/igt@kms_universal_plane@universal-plane-pipe-a-functional.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:
    - shard-tglb:         [PASS][43] -> [SKIP][44] ([fdo#112015])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-tglb5/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-tglb3/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-glk:          [PASS][45] -> [SKIP][46] ([fdo#109271]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-glk9/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-glk1/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#112080]) +7 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb4/igt@perf_pmu@busy-vcs1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-iclb3/igt@perf_pmu@busy-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#109276]) +19 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb4/igt@prime_busy@hang-bsd2.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-iclb7/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-s3:
    - shard-kbl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-kbl2/igt@gem_ctx_isolation@vcs1-s3.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-kbl6/igt@gem_ctx_isolation@vcs1-s3.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [INCOMPLETE][53] ([i915#1402]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-tglb2/igt@gem_ctx_persistence@close-replace-race.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-tglb3/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][55] ([fdo#110841]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [SKIP][57] ([i915#677]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-iclb3/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [SKIP][59] ([fdo#109276] / [i915#677]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb5/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][61] ([fdo#112146]) -> [PASS][62] +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-iclb5/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-tglb:         [INCOMPLETE][63] ([i915#1401]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-tglb6/igt@gem_exec_whisper@basic-fds-priority.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-tglb6/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][65] ([i915#644]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-hsw:          [INCOMPLETE][67] ([i915#61]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-hsw5/igt@gem_softpin@noreloc-s3.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-hsw2/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][69] ([fdo#111870] / [i915#478]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-snb6/igt@gem_userptr_blits@sync-unmap.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-snb4/igt@gem_userptr_blits@sync-unmap.html
    - shard-hsw:          [DMESG-WARN][71] ([fdo#111870]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-hsw7/igt@gem_userptr_blits@sync-unmap.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-hsw7/igt@gem_userptr_blits@sync-unmap.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-apl6/igt@gem_workarounds@suspend-resume-context.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-apl7/igt@gem_workarounds@suspend-resume-context.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][75] ([i915#72]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][77] ([fdo#109349]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb8/igt@kms_psr@psr2_sprite_blt.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [FAIL][81] ([i915#1085]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-tglb7/igt@perf@gen12-mi-rpc.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-tglb1/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][83] ([fdo#112080]) -> [PASS][84] +10 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb7/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][85] ([fdo#109276]) -> [PASS][86] +15 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-glk:          [INCOMPLETE][87] ([i915#1402] / [i915#58] / [k.org#198133]) -> [TIMEOUT][88] ([i915#1340])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-glk8/igt@gem_ctx_persistence@close-replace-race.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-glk1/igt@gem_ctx_persistence@close-replace-race.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][89] ([i915#454]) -> [SKIP][90] ([i915#468])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-tglb5/igt@i915_pm_dc@dc6-psr.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-snb:          [SKIP][91] ([fdo#109271]) -> [INCOMPLETE][92] ([i915#82])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-snb6/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-snb2/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][93], [FAIL][94]) ([i915#1389] / [i915#1402] / [i915#92]) -> [FAIL][95] ([i915#92])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-kbl2/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-kbl1/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-kbl3/igt@runner@aborted.html
    - shard-apl:          ([FAIL][96], [FAIL][97]) ([fdo#103927] / [i915#1402]) -> ([FAIL][98], [FAIL][99]) ([fdo#103927] / [i915#529])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-apl2/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-apl4/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-apl1/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/shard-apl2/igt@runner@aborted.html

  
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1340]: https://gitlab.freedesktop.org/drm/intel/issues/1340
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1401]: https://gitlab.freedesktop.org/drm/intel/issues/1401
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5506 -> IGTPW_4297

  CI-20190529: 20190529
  CI_DRM_8126: 2bd9e989a5653d4cd710e9dd2b42b0a080f1add8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4297: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/index.html
  IGT_5506: 59fd8a0d01dac58dc6c7d86ef391ed4393ab5aae @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4297/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
