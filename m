Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 20 Mar 2020 14:44:07 -0000
Message-ID: <158471544725.11038.17524622511037577139@emeril.freedesktop.org>
References: <20200316160452.29636-1-lyude@redhat.com>
In-Reply-To: <20200316160452.29636-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL3Rl?=
 =?utf-8?q?sts/igt=5Fdescribe=3A_Use_=5F=5FFILE=5F=5F_in_JUST=5FC=5FOUTPUT?=
 =?utf-8?q?_and_DESCRIBE=5FALL=5FOUTPUT_=28rev2=29?=
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

Series: lib/tests/igt_describe: Use __FILE__ in JUST_C_OUTPUT and DESCRIBE_ALL_OUTPUT (rev2)
URL   : https://patchwork.freedesktop.org/series/74751/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8160_full -> IGTPW_4328_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/index.html

Known issues
------------

  Here are the changes found in IGTPW_4328_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@extended-parallel-vcs0:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2] ([IGT#81])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-tglb8/igt@gem_busy@extended-parallel-vcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-tglb1/igt@gem_busy@extended-parallel-vcs0.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [PASS][3] -> [INCOMPLETE][4] ([i915#1402])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-tglb5/igt@gem_ctx_persistence@close-replace-race.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-tglb1/igt@gem_ctx_persistence@close-replace-race.html
    - shard-kbl:          [PASS][5] -> [INCOMPLETE][6] ([i915#1402])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-kbl7/igt@gem_ctx_persistence@close-replace-race.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-kbl2/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110854])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb4/igt@gem_exec_balancer@smoke.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-iclb6/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112080]) +15 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-iclb7/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276]) +9 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb1/igt@gem_exec_schedule@out-order-bsd2.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-iclb3/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#677])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb5/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#112146]) +7 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb5/igt@gem_exec_schedule@preempt-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-iclb1/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_exec_schedule@wide-vebox:
    - shard-kbl:          [PASS][17] -> [INCOMPLETE][18] ([i915#180])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-kbl3/igt@gem_exec_schedule@wide-vebox.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-kbl7/igt@gem_exec_schedule@wide-vebox.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#644])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-apl3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [PASS][21] -> [DMESG-WARN][22] ([fdo#111870])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-hsw2/igt@gem_userptr_blits@sync-unmap-after-close.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-hsw5/igt@gem_userptr_blits@sync-unmap-after-close.html
    - shard-snb:          [PASS][23] -> [DMESG-WARN][24] ([fdo#111870] / [i915#478])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-glk:          [PASS][27] -> [SKIP][28] ([fdo#109271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-glk7/igt@i915_pm_rpm@gem-execbuf-stress.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-glk7/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-tglb:         [PASS][29] -> [SKIP][30] ([i915#1316])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-tglb6/igt@i915_pm_rpm@gem-execbuf-stress.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-tglb3/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-hsw:          [PASS][31] -> [SKIP][32] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-hsw2/igt@i915_pm_rpm@gem-execbuf-stress.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-hsw6/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([i915#1316])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-iclb3/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][35] -> [FAIL][36] ([i915#413])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb6/igt@i915_pm_rps@reset.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-iclb4/igt@i915_pm_rps@reset.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#79])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [PASS][39] -> [INCOMPLETE][40] ([i915#61]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-hsw4/igt@kms_flip@flip-vs-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-hsw4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-apl:          [PASS][41] -> [DMESG-WARN][42] ([i915#180]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-apl8/igt@kms_hdr@bpc-switch-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-apl1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-iclb3/igt@kms_psr@psr2_primary_page_flip.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-glk:          [INCOMPLETE][45] ([i915#1402] / [i915#58] / [k.org#198133]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-glk9/igt@gem_ctx_persistence@close-replace-race.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-glk8/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_persistence@engines-mixed-process@bcs0:
    - shard-iclb:         [FAIL][47] ([i915#679]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb4/igt@gem_ctx_persistence@engines-mixed-process@bcs0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-iclb7/igt@gem_ctx_persistence@engines-mixed-process@bcs0.html

  * igt@gem_ctx_persistence@engines-mixed-process@vcs0:
    - shard-iclb:         [INCOMPLETE][49] ([i915#1239]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb4/igt@gem_ctx_persistence@engines-mixed-process@vcs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-iclb7/igt@gem_ctx_persistence@engines-mixed-process@vcs0.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@blt:
    - shard-tglb:         [FAIL][51] ([i915#679]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-tglb2/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-tglb2/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox:
    - shard-tglb:         [INCOMPLETE][53] ([i915#1239]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-tglb2/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-tglb2/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html

  * igt@gem_exec_schedule@deep-bsd:
    - shard-iclb:         [SKIP][55] ([fdo#112146]) -> [PASS][56] +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb1/igt@gem_exec_schedule@deep-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-iclb8/igt@gem_exec_schedule@deep-bsd.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][57] ([fdo#109276] / [i915#677]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb6/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][59] ([i915#677]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-iclb6/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][61] ([fdo#109276]) -> [PASS][62] +19 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-tglb:         [INCOMPLETE][63] ([i915#1318] / [i915#1401]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-tglb1/igt@gem_exec_whisper@basic-fds-forked.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-tglb8/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][65] ([i915#447]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-iclb4/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-iclb:         [SKIP][67] ([i915#1316]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb1/igt@i915_pm_rpm@gem-execbuf.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-iclb8/igt@i915_pm_rpm@gem-execbuf.html
    - shard-glk:          [SKIP][69] ([fdo#109271]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-glk3/igt@i915_pm_rpm@gem-execbuf.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-glk9/igt@i915_pm_rpm@gem-execbuf.html
    - shard-tglb:         [SKIP][71] ([i915#1316]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-tglb2/igt@i915_pm_rpm@gem-execbuf.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-tglb3/igt@i915_pm_rpm@gem-execbuf.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-glk:          [FAIL][73] ([i915#34]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-glk4/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-glk6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack:
    - shard-glk:          [FAIL][75] ([i915#49]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78] +5 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][81] ([i915#899]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][83] ([fdo#109441]) -> [PASS][84] +3 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb7/igt@kms_psr@psr2_cursor_render.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@perf_pmu@busy-accuracy-2-vcs1:
    - shard-iclb:         [SKIP][85] ([fdo#112080]) -> [PASS][86] +6 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb8/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-iclb4/igt@perf_pmu@busy-accuracy-2-vcs1.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt:
    - shard-hsw:          [DMESG-WARN][87] ([fdo#110789] / [i915#478]) -> [DMESG-WARN][88] ([i915#478])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-hsw4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html
    - shard-snb:          [DMESG-WARN][89] ([fdo#110789] / [i915#478]) -> [DMESG-WARN][90] ([i915#478])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][91] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][92] ([fdo#110789] / [fdo#111870] / [i915#478])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html
    - shard-hsw:          [DMESG-WARN][93] ([fdo#111870]) -> [DMESG-WARN][94] ([fdo#110789] / [fdo#111870])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-hsw1/igt@gem_userptr_blits@sync-unmap-cycles.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-hsw7/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][95], [FAIL][96], [FAIL][97], [FAIL][98], [FAIL][99], [FAIL][100]) ([fdo#111870] / [i915#1485]) -> ([FAIL][101], [FAIL][102], [FAIL][103], [FAIL][104], [FAIL][105], [FAIL][106], [FAIL][107], [FAIL][108]) ([fdo#111870] / [i915#1454] / [i915#1485])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-hsw1/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-hsw2/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-hsw1/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-hsw1/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-hsw2/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-hsw5/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-hsw7/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-hsw5/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-hsw1/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-hsw2/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-hsw4/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-hsw6/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-hsw4/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-hsw7/igt@runner@aborted.html
    - shard-kbl:          [FAIL][109] ([i915#92]) -> ([FAIL][110], [FAIL][111], [FAIL][112]) ([i915#1389] / [i915#1402] / [i915#1455] / [i915#1485] / [i915#92])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-kbl6/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-kbl2/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-kbl3/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-kbl1/igt@runner@aborted.html
    - shard-iclb:         [FAIL][113] ([fdo#111093]) -> ([FAIL][114], [FAIL][115]) ([fdo#111093] / [i915#1485])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-iclb1/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-iclb4/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-iclb1/igt@runner@aborted.html
    - shard-apl:          ([FAIL][116], [FAIL][117]) ([fdo#103927] / [i915#1402]) -> ([FAIL][118], [FAIL][119], [FAIL][120]) ([fdo#103927] / [i915#1402] / [i915#1455] / [i915#1485])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-apl4/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-apl1/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-apl2/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-apl8/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-apl2/igt@runner@aborted.html
    - shard-glk:          [FAIL][121] ([i915#1402] / [k.org#202321]) -> [FAIL][122] ([i915#1455] / [i915#1485] / [k.org#202321])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-glk9/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-glk6/igt@runner@aborted.html
    - shard-tglb:         [FAIL][123] ([i915#1318]) -> ([FAIL][124], [FAIL][125]) ([i915#1389] / [i915#1455] / [i915#1485])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/shard-tglb1/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-tglb1/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/shard-tglb1/igt@runner@aborted.html

  
  [IGT#81]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/81
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111093]: https://bugs.freedesktop.org/show_bug.cgi?id=111093
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1239]: https://gitlab.freedesktop.org/drm/intel/issues/1239
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1318]: https://gitlab.freedesktop.org/drm/intel/issues/1318
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1401]: https://gitlab.freedesktop.org/drm/intel/issues/1401
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#1454]: https://gitlab.freedesktop.org/drm/intel/issues/1454
  [i915#1455]: https://gitlab.freedesktop.org/drm/intel/issues/1455
  [i915#1485]: https://gitlab.freedesktop.org/drm/intel/issues/1485
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5523 -> IGTPW_4328
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8160: 6ba1729e5025761ab74914f6b8aa3288f493e9c7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4328: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/index.html
  IGT_5523: cf6d524007ac51a7d5a48503ea3dd5f01fd4ebab @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4328/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
