Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 13 Mar 2020 02:37:54 -0000
Message-ID: <158406707480.30352.3881280838136851846@emeril.freedesktop.org>
References: <20200312090933.20001-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20200312090933.20001-1-dominik.grzegorzek@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fexec=5Falignment=2Ec=3A_Update_subtests?=
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

Series: tests/gem_exec_alignment.c: Update subtests
URL   : https://patchwork.freedesktop.org/series/74633/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5506_full -> IGTPW_4295_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4295_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4295_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4295_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-kbl3/igt@i915_suspend@fence-restore-untiled.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-kbl6/igt@i915_suspend@fence-restore-untiled.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][3], [FAIL][4]) ([i915#1389] / [i915#1402] / [i915#92]) -> ([FAIL][5], [FAIL][6]) ([i915#92])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-kbl2/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-kbl1/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-kbl3/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-kbl4/igt@runner@aborted.html
    - shard-apl:          ([FAIL][7], [FAIL][8]) ([fdo#103927] / [i915#1402]) -> ([FAIL][9], [FAIL][10]) ([fdo#103927])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-apl2/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-apl4/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-apl6/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-apl7/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@i915_selftest@mock}:
    - shard-glk:          NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-glk4/igt@i915_selftest@mock.html
    - shard-iclb:         NOTRUN -> [FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-iclb6/igt@i915_selftest@mock.html
    - shard-hsw:          NOTRUN -> [FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-hsw1/igt@i915_selftest@mock.html
    - shard-kbl:          NOTRUN -> [FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-kbl4/igt@i915_selftest@mock.html
    - shard-snb:          NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-snb5/igt@i915_selftest@mock.html
    - shard-tglb:         NOTRUN -> [FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-tglb5/igt@i915_selftest@mock.html
    - shard-apl:          NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-apl6/igt@i915_selftest@mock.html

  
Known issues
------------

  Here are the changes found in IGTPW_4295_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [PASS][18] -> [SKIP][19] ([fdo#112080]) +8 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd:
    - shard-iclb:         [PASS][20] -> [INCOMPLETE][21] ([i915#1239])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb3/igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-iclb3/igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@render:
    - shard-iclb:         [PASS][22] -> [FAIL][23] ([i915#679])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb3/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-iclb3/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [PASS][24] -> [SKIP][25] ([fdo#109276] / [i915#677]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd1.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-iclb5/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][26] -> [SKIP][27] ([i915#677]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#112146]) +5 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb8/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][30] -> [INCOMPLETE][31] ([i915#155])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-kbl3/igt@gem_exec_suspend@basic-s3.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-kbl3/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][32] -> [FAIL][33] ([i915#644])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-apl8/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][34] -> [FAIL][35] ([i915#413])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb4/igt@i915_pm_rps@reset.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-iclb5/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live@execlists:
    - shard-glk:          [PASS][36] -> [INCOMPLETE][37] ([i915#1430] / [i915#58] / [i915#656] / [k.org#198133])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-glk1/igt@i915_selftest@live@execlists.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-glk5/igt@i915_selftest@live@execlists.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
    - shard-apl:          [PASS][38] -> [FAIL][39] ([i915#54])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
    - shard-kbl:          [PASS][40] -> [FAIL][41] ([i915#54])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-apl:          [PASS][42] -> [DMESG-WARN][43] ([i915#180]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-apl1/igt@kms_hdr@bpc-switch-suspend.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-apl8/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][44] -> [SKIP][45] ([fdo#109642] / [fdo#111068])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-iclb6/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][46] -> [SKIP][47] ([fdo#109441]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-iclb7/igt@kms_psr@psr2_suspend.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][48] -> [FAIL][49] ([i915#31])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-kbl7/igt@kms_setmode@basic.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-kbl7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][50] -> [DMESG-WARN][51] ([i915#180]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-kbl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm:
    - shard-tglb:         [PASS][52] -> [SKIP][53] ([fdo#112015])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-tglb3/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][54] -> [SKIP][55] ([fdo#109276]) +20 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb4/igt@prime_busy@hang-bsd2.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-iclb3/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [INCOMPLETE][56] ([i915#1402]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-kbl1/igt@gem_ctx_persistence@close-replace-race.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-kbl3/igt@gem_ctx_persistence@close-replace-race.html
    - shard-iclb:         [INCOMPLETE][58] ([i915#1402]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb4/igt@gem_ctx_persistence@close-replace-race.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-iclb2/igt@gem_ctx_persistence@close-replace-race.html
    - shard-apl:          [INCOMPLETE][60] ([fdo#103927] / [i915#1402]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-apl4/igt@gem_ctx_persistence@close-replace-race.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-apl3/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][62] ([fdo#110841]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@fifo-bsd1:
    - shard-iclb:         [SKIP][64] ([fdo#109276]) -> [PASS][65] +16 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb8/igt@gem_exec_schedule@fifo-bsd1.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-iclb1/igt@gem_exec_schedule@fifo-bsd1.html

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [SKIP][66] ([i915#677]) -> [PASS][67] +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-iclb3/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][68] ([fdo#112146]) -> [PASS][69] +5 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-iclb6/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-tglb:         [INCOMPLETE][70] ([i915#1401]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-tglb6/igt@gem_exec_whisper@basic-fds-priority.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-tglb6/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][72] ([i915#180]) -> [PASS][73] +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-apl6/igt@gem_workarounds@suspend-resume-context.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-apl1/igt@gem_workarounds@suspend-resume-context.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][74] ([i915#72]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][76] ([i915#180]) -> [PASS][77] +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][78] ([fdo#109441]) -> [PASS][79] +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][80] ([i915#31]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-apl3/igt@kms_setmode@basic.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-apl2/igt@kms_setmode@basic.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [SKIP][82] ([fdo#112080]) -> [PASS][83] +10 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-iclb3/igt@perf_pmu@init-busy-vcs1.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-iclb2/igt@perf_pmu@init-busy-vcs1.html

  
#### Warnings ####

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [DMESG-WARN][84] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][85] ([fdo#111870] / [i915#478])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][86] ([i915#454]) -> [SKIP][87] ([i915#468])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-tglb5/igt@i915_pm_dc@dc6-psr.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-snb:          [SKIP][88] ([fdo#109271]) -> [INCOMPLETE][89] ([i915#82])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/shard-snb4/igt@i915_pm_rpm@system-suspend-modeset.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/shard-snb4/igt@i915_pm_rpm@system-suspend-modeset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1239]: https://gitlab.freedesktop.org/drm/intel/issues/1239
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1401]: https://gitlab.freedesktop.org/drm/intel/issues/1401
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#1430]: https://gitlab.freedesktop.org/drm/intel/issues/1430
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5506 -> IGTPW_4295

  CI-20190529: 20190529
  CI_DRM_8126: 2bd9e989a5653d4cd710e9dd2b42b0a080f1add8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4295: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/index.html
  IGT_5506: 59fd8a0d01dac58dc6c7d86ef391ed4393ab5aae @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
