Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1230312489868421038=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Fri, 25 Aug 2023 22:57:51 -0000
Message-ID: <169300427185.10954.5604334662938547929@emeril.freedesktop.org>
References: <20230825081153.883708-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230825081153.883708-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkIFhF?=
 =?utf-8?q?_support_for_Async_flip_tests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1230312489868421038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add XE support for Async flip tests
URL   : https://patchwork.freedesktop.org/series/122893/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13566_full -> IGTPW_9659_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in IGTPW_9659_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglu:         [PASS][1] -> [FAIL][2] ([i915#6268])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-9/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_freq@sysfs@gt0:
    - shard-dg2:          [PASS][3] -> [FAIL][4] ([i915#6786])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg2-2/igt@gem_ctx_freq@sysfs@gt0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-6/igt@gem_ctx_freq@sysfs@gt0.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#8555])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-6/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#1099]) +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-snb2/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_ctx_persistence@saturated-hostile@vecs0:
    - shard-mtlp:         [PASS][7] -> [FAIL][8] ([i915#7816]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-5/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-2/igt@gem_ctx_persistence@saturated-hostile@vecs0.html

  * igt@gem_eio@in-flight-1us:
    - shard-mtlp:         [PASS][9] -> [ABORT][10] ([i915#8503])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-2/igt@gem_eio@in-flight-1us.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-3/igt@gem_eio@in-flight-1us.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-mtlp:         [PASS][11] -> [ABORT][12] ([i915#7941])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-5/igt@gem_eio@in-flight-contexts-10ms.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-3/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [PASS][13] -> [FAIL][14] ([i915#5784])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg1-13/igt@gem_eio@unwedge-stress.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-17/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#4812]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-5/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#6344])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-1/igt@gem_exec_capture@capture-recoverable.html
    - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#6344])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-3/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-rkl:          [PASS][18] -> [FAIL][19] ([i915#2842]) +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-rkl-7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_flush@basic-wb-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#3539] / [i915#4852])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@gem_exec_flush@basic-wb-ro-default.html

  * igt@gem_exec_reloc@basic-cpu-wc-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#3281])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-6/igt@gem_exec_reloc@basic-cpu-wc-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#3281]) +5 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-8/igt@gem_exec_reloc@basic-gtt-cpu-active.html
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#3281]) +5 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#4537] / [i915#4812])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-3/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-snb:          NOTRUN -> [DMESG-WARN][25] ([i915#8841]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-snb5/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg2:          NOTRUN -> [ABORT][26] ([i915#7975] / [i915#8213])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-10/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_exec_suspend@basic-s4-devices@smem:
    - shard-tglu:         [PASS][27] -> [ABORT][28] ([i915#7975] / [i915#8213])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-tglu-2/igt@gem_exec_suspend@basic-s4-devices@smem.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices@smem.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#4860]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-12/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_lmem_swapping@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#4613]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-1/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#4613]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-7/igt@gem_lmem_swapping@massive-random.html
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#4613])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-2/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_mmap@bad-offset:
    - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#4083])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-3/igt@gem_mmap@bad-offset.html

  * igt@gem_mmap_gtt@basic-write-cpu-read-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][34] ([i915#4077]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-2/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#4077]) +5 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-3/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_wc@invalid-flags:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#4083]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-8/igt@gem_mmap_wc@invalid-flags.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][37] ([i915#4270])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-4/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][38] ([i915#4270])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-3/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_readwrite@read-write:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#3282]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-1/igt@gem_readwrite@read-write.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#5190]) +4 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-3/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_spin_batch@spin-all-new:
    - shard-dg2:          NOTRUN -> [FAIL][41] ([i915#5889])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-6/igt@gem_spin_batch@spin-all-new.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#3297])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#3297])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@gem_userptr_blits@readonly-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][44] ([i915#3297])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-5/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#3297])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-4/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-dg2:          NOTRUN -> [FAIL][46] ([i915#3318])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-8/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_render_linear_blits:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([fdo#109289]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-2/igt@gen3_render_linear_blits.html
    - shard-rkl:          NOTRUN -> [SKIP][48] ([fdo#109289]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-2/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-tglu:         NOTRUN -> [SKIP][49] ([fdo#109289])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-3/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#2856]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_hangman@engine-engine-error@vcs0:
    - shard-mtlp:         [PASS][51] -> [FAIL][52] ([i915#7069]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-6/igt@i915_hangman@engine-engine-error@vcs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-6/igt@i915_hangman@engine-engine-error@vcs0.html

  * igt@i915_module_load@load:
    - shard-tglu:         NOTRUN -> [SKIP][53] ([i915#6227])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-7/igt@i915_module_load@load.html
    - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#6227])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-4/igt@i915_module_load@load.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#6412])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-2/igt@i915_module_load@resize-bar.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#7091])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-5/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#658])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-3/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-dg1:          [PASS][58] -> [FAIL][59] ([i915#3591])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
    - shard-tglu:         NOTRUN -> [WARN][60] ([i915#2681]) +3 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#1397])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-7/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([fdo#109506])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [PASS][63] -> [SKIP][64] ([i915#1397]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg2-6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-12/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-dg2:          [PASS][65] -> [FAIL][66] ([fdo#103375]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg2-1/igt@i915_pm_rpm@system-suspend-modeset.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_pm_rps@thresholds@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#8925])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-1/igt@i915_pm_rps@thresholds@gt0.html

  * igt@i915_query@query-topology-kernel-writes:
    - shard-mtlp:         [PASS][68] -> [DMESG-WARN][69] ([i915#2017])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-8/igt@i915_query@query-topology-kernel-writes.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-8/igt@i915_query@query-topology-kernel-writes.html

  * igt@i915_query@query-topology-unsupported:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([fdo#109302])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-6/igt@i915_query@query-topology-unsupported.html

  * igt@i915_selftest@live@gt_heartbeat:
    - shard-apl:          [PASS][71] -> [DMESG-FAIL][72] ([i915#5334])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-apl7/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@mock@sanitycheck:
    - shard-snb:          [PASS][73] -> [ABORT][74] ([i915#4528] / [i915#8668])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-snb1/igt@i915_selftest@mock@sanitycheck.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-snb2/igt@i915_selftest@mock@sanitycheck.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#8502]) +7 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-14/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#8502] / [i915#8709]) +11 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-12/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-mc_ccs.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [FAIL][77] ([i915#8247]) +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-2/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-snb:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#1769])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-snb5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#5286])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
    - shard-tglu:         NOTRUN -> [SKIP][80] ([fdo#111615] / [i915#5286])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-9/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-mtlp:         [PASS][81] -> [FAIL][82] ([i915#5138])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-mtlp:         [PASS][83] -> [FAIL][84] ([i915#3743])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4538] / [i915#5286])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-mtlp:         [PASS][86] -> [DMESG-WARN][87] ([i915#1982])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-5/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-4/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([fdo#111614])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-6/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([fdo#111615])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][90] ([fdo#110723])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#4538] / [i915#5190]) +5 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#2705])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-2/igt@kms_big_joiner@invalid-modeset.html
    - shard-tglu:         NOTRUN -> [SKIP][93] ([i915#2705])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-5/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#3689] / [i915#5354]) +10 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-3/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][95] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-4/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#3886] / [i915#5354] / [i915#6095]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#5354] / [i915#6095]) +5 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html
    - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#5354] / [i915#6095]) +4 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-5/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#5354]) +16 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_mc_ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#5354]) +8 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-2/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#3689] / [i915#3886] / [i915#5354]) +6 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-12/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][102] ([i915#3886] / [i915#6095])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-7/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][103] ([i915#3689] / [i915#5354] / [i915#6095]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-8/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-yf_tiled_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][104] ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-5/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#6095])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-7/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#4087] / [i915#7213]) +3 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#7828]) +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-10/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([fdo#111827])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([fdo#111827]) +2 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-8/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#7828]) +2 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-5/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#7828]) +3 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][112] ([i915#7828]) +3 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-4/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_color@deep-color:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#3555]) +2 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-1/igt@kms_color@deep-color.html
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#3555])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-2/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#7118]) +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-2/igt@kms_content_protection@atomic-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#7118])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][117] ([i915#7173])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#3359])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#3359]) +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-tglu:         NOTRUN -> [SKIP][120] ([i915#3359])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-6/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([fdo#109274] / [fdo#111767] / [i915#5354])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#4103] / [i915#4213]) +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([fdo#109274] / [i915#5354])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-3/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][124] ([fdo#111767] / [i915#3546])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-snb:          NOTRUN -> [SKIP][125] ([fdo#109271] / [fdo#111767])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-snb1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][126] ([fdo#111825]) +1 similar issue
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
    - shard-tglu:         NOTRUN -> [SKIP][127] ([fdo#109274])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([fdo#109274] / [i915#3637])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([fdo#109274])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-8/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#3637]) +1 similar issue
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-5/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-dg1:          NOTRUN -> [SKIP][131] ([fdo#111825]) +1 similar issue
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-16/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#8381])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-5/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#2672]) +1 similar issue
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#2672])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-dg2:          [PASS][135] -> [FAIL][136] ([i915#6880])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2:          NOTRUN -> [FAIL][137] ([i915#6880])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#8708]) +10 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
    - shard-rkl:          NOTRUN -> [SKIP][139] ([fdo#111825] / [i915#1825]) +12 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][140] ([i915#1825]) +5 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#3458]) +3 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#3023]) +3 similar issues
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][143] ([fdo#109280]) +7 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#8708])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#3555] / [i915#8228]) +1 similar issue
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-6/igt@kms_hdr@bpc-switch.html
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#3555] / [i915#8228]) +1 similar issue
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-7/igt@kms_hdr@bpc-switch.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:
    - shard-mtlp:         [PASS][147] -> [FAIL][148] ([i915#1623]) +1 similar issue
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-3/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-1/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#3555] / [i915#8806])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-12/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#6953])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-6/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][151] ([i915#8292])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#5176]) +11 similar issues
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#5176]) +1 similar issue
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][154] ([fdo#109271]) +193 similar issues
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-snb4/igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#5176]) +3 similar issues
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-18/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-b-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#5235]) +3 similar issues
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#5235]) +23 similar issues
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#5235]) +3 similar issues
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#5235]) +15 similar issues
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-14/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#658])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
    - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#658])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@cursor_mmap_cpu:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#1072]) +3 similar issues
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-4/igt@kms_psr@cursor_mmap_cpu.html
    - shard-tglu:         NOTRUN -> [SKIP][163] ([fdo#110189]) +7 similar issues
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-6/igt@kms_psr@cursor_mmap_cpu.html

  * igt@kms_psr@primary_page_flip:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#1072] / [i915#4078])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-18/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@psr2_dpms:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#1072]) +3 similar issues
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@kms_psr@psr2_dpms.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#4235])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_selftest@drm_format:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#8661]) +1 similar issue
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-6/igt@kms_selftest@drm_format.html

  * igt@kms_selftest@framebuffer:
    - shard-snb:          NOTRUN -> [SKIP][168] ([fdo#109271] / [i915#8661])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-snb6/igt@kms_selftest@framebuffer.html

  * igt@kms_universal_plane@universal-plane-pipe-d-functional:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#4070] / [i915#533] / [i915#6768])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-4/igt@kms_universal_plane@universal-plane-pipe-d-functional.html

  * igt@kms_vblank@pipe-c-query-forked-busy:
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#4070] / [i915#6768]) +2 similar issues
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@kms_vblank@pipe-c-query-forked-busy.html

  * igt@kms_vblank@pipe-d-ts-continuation-suspend:
    - shard-dg2:          [PASS][171] -> [INCOMPLETE][172] ([i915#7838])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg2-1/igt@kms_vblank@pipe-d-ts-continuation-suspend.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-5/igt@kms_vblank@pipe-d-ts-continuation-suspend.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#2437])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-8/igt@kms_writeback@writeback-fb-id.html
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#2437])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@kms_writeback@writeback-fb-id.html
    - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#2437]) +1 similar issue
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-8/igt@kms_writeback@writeback-fb-id.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([fdo#109295] / [i915#3291] / [i915#3708])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-1/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#3708])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@prime_vgem@fence-read-hang.html

  * igt@sysfs_preempt_timeout@timeout@vecs0:
    - shard-mtlp:         [PASS][178] -> [ABORT][179] ([i915#8521] / [i915#8865])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-4/igt@sysfs_preempt_timeout@timeout@vecs0.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-4/igt@sysfs_preempt_timeout@timeout@vecs0.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#4818])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-12/igt@tools_test@sysfs_l3_parity.html

  * igt@v3d/v3d_get_bo_offset@create-get-offsets:
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#2575]) +1 similar issue
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-18/igt@v3d/v3d_get_bo_offset@create-get-offsets.html

  * igt@v3d/v3d_job_submission@array-job-submission:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([fdo#109315]) +4 similar issues
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-4/igt@v3d/v3d_job_submission@array-job-submission.html
    - shard-tglu:         NOTRUN -> [SKIP][183] ([fdo#109315] / [i915#2575]) +2 similar issues
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-7/igt@v3d/v3d_job_submission@array-job-submission.html

  * igt@v3d/v3d_submit_cl@simple-flush-cache:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#2575]) +7 similar issues
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@v3d/v3d_submit_cl@simple-flush-cache.html

  * igt@v3d/v3d_submit_cl@single-in-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#2575])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-7/igt@v3d/v3d_submit_cl@single-in-sync.html

  * igt@vc4/vc4_mmap@mmap-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#7711])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-1/igt@vc4/vc4_mmap@mmap-bo.html

  * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged:
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#2575])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-6/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged.html
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#7711])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-2/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged.html

  * igt@vc4/vc4_tiling@set-get:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#7711]) +4 similar issues
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@vc4/vc4_tiling@set-get.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          [FAIL][190] ([i915#7742]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-rkl-6/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-mtlp:         [FAIL][192] ([i915#6121]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-5/igt@gem_ctx_exec@basic-nohangcheck.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-3/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_freq@sysfs@gt0:
    - shard-mtlp:         [FAIL][194] ([i915#6786]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-5/igt@gem_ctx_freq@sysfs@gt0.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-3/igt@gem_ctx_freq@sysfs@gt0.html

  * igt@gem_ctx_persistence@legacy-engines-hostile@vebox:
    - shard-mtlp:         [FAIL][196] ([i915#2410]) -> [PASS][197] +2 similar issues
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-3/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-6/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [FAIL][198] ([i915#5784]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg1-17/igt@gem_eio@reset-stress.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-17/igt@gem_eio@reset-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          [FAIL][200] ([i915#2846]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-rkl-7/igt@gem_exec_fair@basic-deadline.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-rkl:          [FAIL][202] ([i915#2842]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-rkl-1/igt@gem_exec_fair@basic-none@bcs0.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          [FAIL][204] ([i915#2842]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-glk9/igt@gem_exec_fair@basic-pace@rcs0.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-glk1/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-mtlp:         [DMESG-FAIL][206] ([i915#9121]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-4/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-5/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [TIMEOUT][208] ([i915#5493]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg2-6/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_ppgtt@blt-vs-render-ctxn:
    - shard-snb:          [DMESG-FAIL][210] ([i915#8295]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-snb1/igt@gem_ppgtt@blt-vs-render-ctxn.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-snb5/igt@gem_ppgtt@blt-vs-render-ctxn.html

  * igt@gem_userptr_blits@nohangcheck:
    - shard-mtlp:         [FAIL][212] ([i915#6268]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-2/igt@gem_userptr_blits@nohangcheck.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-5/igt@gem_userptr_blits@nohangcheck.html

  * igt@i915_hangman@engine-engine-hang@vcs0:
    - shard-mtlp:         [FAIL][214] ([i915#7069]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-5/igt@i915_hangman@engine-engine-hang@vcs0.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-6/igt@i915_hangman@engine-engine-hang@vcs0.html

  * igt@i915_pipe_stress@stress-xrgb8888-untiled:
    - shard-mtlp:         [FAIL][216] ([i915#8691]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-2/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-5/igt@i915_pipe_stress@stress-xrgb8888-untiled.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [SKIP][218] ([fdo#109271]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-apl2/igt@i915_pm_dc@dc9-dpms.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-apl1/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-rkl:          [SKIP][220] ([i915#1937]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-rkl-4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-mtlp:         [SKIP][222] ([i915#8403]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-5/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-4/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
    - shard-dg1:          [FAIL][224] ([i915#3591]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-dg1:          [SKIP][226] ([i915#1397]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg1-18/igt@i915_pm_rpm@dpms-lpsp.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-19/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][228] ([i915#1397]) -> [PASS][229] +2 similar issues
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [SKIP][230] ([i915#1397]) -> [PASS][231] +1 similar issue
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg2-12/igt@i915_pm_rpm@modeset-non-lpsp.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-2/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:
    - shard-mtlp:         [FAIL][232] ([i915#2521]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-2:
    - shard-glk:          [FAIL][234] ([i915#2521]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-glk7/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-2.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-2.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [FAIL][236] ([i915#5138]) -> [PASS][237] +1 similar issue
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-mtlp:         [FAIL][238] ([i915#8248]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-3/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-7/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [FAIL][240] ([i915#2346]) -> [PASS][241] +1 similar issue
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          [FAIL][242] ([i915#6880]) -> [PASS][243] +1 similar issue
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  
#### Warnings ####

  * igt@kms_content_protection@mei_interface:
    - shard-dg2:          [SKIP][244] ([i915#7118]) -> [SKIP][245] ([i915#7118] / [i915#7162])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg2-1/igt@kms_content_protection@mei_interface.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-12/igt@kms_content_protection@mei_interface.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-mtlp:         [DMESG-FAIL][246] ([i915#2017] / [i915#5954]) -> [FAIL][247] ([i915#2346])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][248] ([fdo#110189] / [i915#3955]) -> [SKIP][249] ([i915#3955])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-rkl:          [SKIP][250] ([fdo#109285]) -> [SKIP][251] ([fdo#109285] / [i915#4098])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_psr@cursor_plane_move:
    - shard-dg1:          [SKIP][252] ([i915#1072] / [i915#4078]) -> [SKIP][253] ([i915#1072]) +1 similar issue
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg1-13/igt@kms_psr@cursor_plane_move.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-15/igt@kms_psr@cursor_plane_move.html

  
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1623]: https://gitlab.freedesktop.org/drm/intel/issues/1623
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5889]: https://gitlab.freedesktop.org/drm/intel/issues/5889
  [i915#5954]: https://gitlab.freedesktop.org/drm/intel/issues/5954
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6786]: https://gitlab.freedesktop.org/drm/intel/issues/6786
  [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7069]: https://gitlab.freedesktop.org/drm/intel/issues/7069
  [i915#7091]: https://gitlab.freedesktop.org/drm/intel/issues/7091
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7162]: https://gitlab.freedesktop.org/drm/intel/issues/7162
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7816]: https://gitlab.freedesktop.org/drm/intel/issues/7816
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7838]: https://gitlab.freedesktop.org/drm/intel/issues/7838
  [i915#7941]: https://gitlab.freedesktop.org/drm/intel/issues/7941
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
  [i915#8248]: https://gitlab.freedesktop.org/drm/intel/issues/8248
  [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
  [i915#8295]: https://gitlab.freedesktop.org/drm/intel/issues/8295
  [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
  [i915#8403]: https://gitlab.freedesktop.org/drm/intel/issues/8403
  [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502
  [i915#8503]: https://gitlab.freedesktop.org/drm/intel/issues/8503
  [i915#8521]: https://gitlab.freedesktop.org/drm/intel/issues/8521
  [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
  [i915#8661]: https://gitlab.freedesktop.org/drm/intel/issues/8661
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8691]: https://gitlab.freedesktop.org/drm/intel/issues/8691
  [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
  [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
  [i915#8806]: https://gitlab.freedesktop.org/drm/intel/issues/8806
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#8865]: https://gitlab.freedesktop.org/drm/intel/issues/8865
  [i915#8925]: https://gitlab.freedesktop.org/drm/intel/issues/8925
  [i915#9121]: https://gitlab.freedesktop.org/drm/intel/issues/9121


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7452 -> IGTPW_9659

  CI-20190529: 20190529
  CI_DRM_13566: 27d7428010c6e414a1df1b5a92a38017d4063d64 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9659: 9659
  IGT_7452: 7452

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/index.html

--===============1230312489868421038==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>Add XE support for Async flip tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122893/">https://patchwork.freedesktop.org/series/122893/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13566_full -&gt; IGTPW_9659_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9659_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-9/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_freq@sysfs@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg2-2/igt@gem_ctx_freq@sysfs@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-6/igt@gem_ctx_freq@sysfs@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6786">i915#6786</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-6/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-snb2/igt@gem_ctx_persistence@legacy-engines-mixed-process.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-5/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-2/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7816">i915#7816</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-1us:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-2/igt@gem_eio@in-flight-1us.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-3/igt@gem_eio@in-flight-1us.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8503">i915#8503</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-5/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-3/igt@gem_eio@in-flight-contexts-10ms.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7941">i915#7941</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg1-13/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-17/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-5/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-1/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6344">i915#6344</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-3/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6344">i915#6344</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-rkl-7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@gem_exec_flush@basic-wb-ro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-wc-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-6/igt@gem_exec_reloc@basic-cpu-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-8/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +5 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-3/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-snb5/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-10/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@smem:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-tglu-2/igt@gem_exec_suspend@basic-s4-devices@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-12/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-1/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-7/igt@gem_lmem_swapping@massive-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-2/igt@gem_lmem_swapping@massive-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-offset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-3/igt@gem_mmap@bad-offset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-write-cpu-read-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-2/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-3/igt@gem_mmap_gtt@cpuset-big-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@invalid-flags:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-8/igt@gem_mmap_wc@invalid-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-4/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-3/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-1/igt@gem_readwrite@read-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-3/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@spin-all-new:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-6/igt@gem_spin_batch@spin-all-new.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5889">i915#5889</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-5/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-4/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-8/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3318">i915#3318</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-2/igt@gen3_render_linear_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +3 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-2/igt@gen3_render_linear_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-3/igt@gen7_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-error@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-6/igt@i915_hangman@engine-engine-error@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-6/igt@i915_hangman@engine-engine-error@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7069">i915#7069</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-7/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6227">i915#6227</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-4/igt@i915_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6227">i915#6227</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-2/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-5/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7091">i915#7091</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-3/igt@i915_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-7/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg2-6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-12/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg2-1/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@i915_pm_rpm@system-suspend-modeset.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-1/igt@i915_pm_rps@thresholds@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8925">i915#8925</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-kernel-writes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-8/igt@i915_query@query-topology-kernel-writes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-8/igt@i915_query@query-topology-kernel-writes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-6/igt@i915_query@query-topology-unsupported.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109302">fdo#109302</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-apl7/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@sanitycheck:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-snb1/igt@i915_selftest@mock@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-snb2/igt@i915_selftest@mock@sanitycheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-14/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8502">i915#8502</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-mc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-12/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8502">i915#8502</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8709">i915#8709</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-2/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8247">i915#8247</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-snb5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-9/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-5/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-4/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-6/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-2/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-5/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-3/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-4/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +5 similar issues</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-5/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +16 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-2/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-12/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +6 similar issues</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-7/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-8/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-5/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-yf_tiled_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-7/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7213">i915#7213</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-10/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-8/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-5/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-4/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-1/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-2/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-2/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-4/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-6/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-3/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-snb1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-8/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-5/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-16/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-5/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +10 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +12 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-6/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-7/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-3/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-1/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1623">i915#1623</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-12/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8806">i915#8806</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-6/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8292">i915#8292</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-snb4/igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +193 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-18/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-b-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-14/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_mmap_cpu:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-4/igt@kms_psr@cursor_mmap_cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-6/igt@kms_psr@cursor_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-18/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-6/igt@kms_selftest@drm_format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8661">i915#8661</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@framebuffer:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-snb6/igt@kms_selftest@framebuffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8661">i915#8661</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-d-functional:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-4/igt@kms_universal_plane@universal-plane-pipe-d-functional.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-forked-busy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@kms_vblank@pipe-c-query-forked-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg2-1/igt@kms_vblank@pipe-d-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-5/igt@kms_vblank@pipe-d-ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7838">i915#7838</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-8/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-8/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-1/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@timeout@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-4/igt@sysfs_preempt_timeout@timeout@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-4/igt@sysfs_preempt_timeout@timeout@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8521">i915#8521</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8865">i915#8865</a>)</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-12/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4818">i915#4818</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_get_bo_offset@create-get-offsets:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-18/igt@v3d/v3d_get_bo_offset@create-get-offsets.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_job_submission@array-job-submission:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-4/igt@v3d/v3d_job_submission@array-job-submission.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +4 similar issues</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-7/igt@v3d/v3d_job_submission@array-job-submission.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@simple-flush-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@v3d/v3d_submit_cl@simple-flush-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@single-in-sync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-7/igt@v3d/v3d_submit_cl@single-in-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_mmap@mmap-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-1/igt@vc4/vc4_mmap@mmap-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>)</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-tglu-6/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-2/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@set-get:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@vc4/vc4_tiling@set-get.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-rkl-6/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-5/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-3/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_freq@sysfs@gt0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-5/igt@gem_ctx_freq@sysfs@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6786">i915#6786</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-3/igt@gem_ctx_freq@sysfs@gt0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile@vebox:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-3/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-6/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg1-17/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-17/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-rkl-7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-rkl-1/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@gem_exec_fair@basic-none@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-glk9/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-glk1/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-4/igt@gem_exec_flush@basic-batch-kernel-default-wb.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9121">i915#9121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-5/igt@gem_exec_flush@basic-batch-kernel-default-wb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg2-6/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctxn:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-snb1/igt@gem_ppgtt@blt-vs-render-ctxn.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8295">i915#8295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-snb5/igt@gem_ppgtt@blt-vs-render-ctxn.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@nohangcheck:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-2/igt@gem_userptr_blits@nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-5/igt@gem_userptr_blits@nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-5/igt@i915_hangman@engine-engine-hang@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7069">i915#7069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-6/igt@i915_hangman@engine-engine-hang@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-2/igt@i915_pipe_stress@stress-xrgb8888-untiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8691">i915#8691</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-5/igt@i915_pipe_stress@stress-xrgb8888-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-apl2/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-apl1/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-rkl-4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-5/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8403">i915#8403</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-4/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vecs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg1-18/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-19/igt@i915_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg2-12/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-2/igt@i915_pm_rpm@modeset-non-lpsp.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-glk7/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-3/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8248">i915#8248</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-7/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg2-1/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg2-12/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7162">i915#7162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-mtlp-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5954">i915#5954</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-mtlp-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-rkl-2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13566/shard-dg1-13/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9659/shard-dg1-15/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7452 -&gt; IGTPW_9659</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13566: 27d7428010c6e414a1df1b5a92a38017d4063d64 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9659: 9659<br />
  IGT_7452: 7452</p>

</body>
</html>

--===============1230312489868421038==--
