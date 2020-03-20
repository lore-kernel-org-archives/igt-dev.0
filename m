Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 20 Mar 2020 17:07:52 -0000
Message-ID: <158472407238.11036.7380374808233610794@emeril.freedesktop.org>
References: <20200320090340.27836-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20200320090340.27836-1-ankit.k.nautiyal@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcontent=5Fprotection=3A_Bifurcate_tests_into_HDCP1=2E4_?=
 =?utf-8?b?JiAyLjI=?=
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
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_content_protection: Bifurcate tests into HDCP1.4 & 2.2
URL   : https://patchwork.freedesktop.org/series/74911/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8163_full -> IGTPW_4334_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4334_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4334_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4334_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-kbl3/igt@gem_ctx_isolation@rcs0-s3.html

  * {igt@kms_content_protection@hdcp-1_4} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-tglb2/igt@kms_content_protection@hdcp-1_4.html

  * {igt@kms_content_protection@hdcp-1_4@legacy-dp-1} (NEW):
    - shard-kbl:          NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-kbl3/igt@kms_content_protection@hdcp-1_4@legacy-dp-1.html

  * {igt@kms_content_protection@hdcp-2_2} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-iclb2/igt@kms_content_protection@hdcp-2_2.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8163_full and IGTPW_4334_full:

### New IGT tests (3) ###

  * igt@kms_content_protection@hdcp-1_4:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_content_protection@hdcp-1_4@legacy-dp-1:
    - Statuses : 2 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_content_protection@hdcp-2_2:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_4334_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#112080]) +7 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-iclb2/igt@gem_busy@busy-vcs1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-iclb7/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-iclb:         [PASS][8] -> [INCOMPLETE][9] ([i915#1402])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-iclb4/igt@gem_ctx_persistence@close-replace-race.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-iclb8/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#109276] / [i915#677])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-iclb3/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#109276]) +15 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-iclb2/igt@gem_exec_schedule@independent-bsd2.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-iclb5/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([i915#677]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#112146]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-iclb3/igt@gem_exec_schedule@preempt-queue-bsd.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#644])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-apl8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][20] -> [DMESG-WARN][21] ([i915#180]) +6 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][22] -> [DMESG-WARN][23] ([i915#716])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-kbl6/igt@gen9_exec_parse@allowed-all.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-kbl2/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#79])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][26] -> [DMESG-WARN][27] ([i915#180])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#109441]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][30] -> [FAIL][31] ([i915#31])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-kbl2/igt@kms_setmode@basic.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-kbl4/igt@kms_setmode@basic.html

  * igt@perf@short-reads:
    - shard-apl:          [PASS][32] -> [FAIL][33] ([i915#51])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-apl1/igt@perf@short-reads.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-apl1/igt@perf@short-reads.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [INCOMPLETE][34] ([i915#1402]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-kbl4/igt@gem_ctx_persistence@close-replace-race.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-kbl4/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [SKIP][36] ([i915#677]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-iclb2/igt@gem_exec_schedule@implicit-both-bsd.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-iclb7/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [SKIP][38] ([fdo#109276] / [i915#677]) -> [PASS][39] +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-iclb5/igt@gem_exec_schedule@implicit-both-bsd1.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][40] ([fdo#112146]) -> [PASS][41] +6 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][42] ([fdo#109276]) -> [PASS][43] +16 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-tglb:         [INCOMPLETE][44] ([i915#1318] / [i915#1401]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-tglb8/igt@gem_exec_whisper@basic-fds-forked.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-tglb5/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [FAIL][46] ([i915#644]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-kbl6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-kbl:          [INCOMPLETE][48] ([i915#879]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-kbl4/igt@i915_module_load@reload-with-fault-injection.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-kbl3/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][50] ([i915#447]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-iclb7/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][52] ([i915#454]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-iclb4/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-iclb:         [SKIP][54] ([i915#1316]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-iclb1/igt@i915_pm_rpm@gem-execbuf.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-iclb8/igt@i915_pm_rpm@gem-execbuf.html
    - shard-glk:          [SKIP][56] ([fdo#109271]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-glk2/igt@i915_pm_rpm@gem-execbuf.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-glk3/igt@i915_pm_rpm@gem-execbuf.html
    - shard-tglb:         [SKIP][58] ([i915#1316]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-tglb8/igt@i915_pm_rpm@gem-execbuf.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-tglb5/igt@i915_pm_rpm@gem-execbuf.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][60] ([i915#413]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-iclb2/igt@i915_pm_rps@reset.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-iclb7/igt@i915_pm_rps@reset.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][62] ([i915#180]) -> [PASS][63] +5 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
    - shard-apl:          [DMESG-WARN][64] ([i915#180]) -> [PASS][65] +3 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][66] ([i915#72]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack:
    - shard-glk:          [FAIL][68] ([i915#49]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack.html

  * igt@kms_plane@plane-panning-bottom-right-pipe-c-planes:
    - shard-glk:          [INCOMPLETE][70] ([i915#58] / [k.org#198133]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-glk4/igt@kms_plane@plane-panning-bottom-right-pipe-c-planes.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-glk5/igt@kms_plane@plane-panning-bottom-right-pipe-c-planes.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][72] ([fdo#109441]) -> [PASS][73] +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][74] ([fdo#112080]) -> [PASS][75] +17 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-iclb6/igt@perf_pmu@busy-vcs1.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-iclb4/igt@perf_pmu@busy-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [INCOMPLETE][76] ([i915#1492]) -> [INCOMPLETE][77] ([i915#1402])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-tglb3/igt@gem_ctx_persistence@close-replace-race.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-tglb5/igt@gem_ctx_persistence@close-replace-race.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][78] ([i915#454]) -> [SKIP][79] ([i915#468])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-tglb3/igt@i915_pm_dc@dc6-psr.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@perf_pmu@busy-accuracy-2-vecs0:
    - shard-snb:          [INCOMPLETE][80] ([i915#82]) -> [SKIP][81] ([fdo#109271])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-snb6/igt@perf_pmu@busy-accuracy-2-vecs0.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-snb6/igt@perf_pmu@busy-accuracy-2-vecs0.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][82], [FAIL][83]) ([i915#1389] / [i915#1402] / [i915#92]) -> [FAIL][84] ([i915#716])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-kbl4/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-kbl4/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-kbl2/igt@runner@aborted.html
    - shard-tglb:         [FAIL][85] ([i915#1389] / [i915#1485]) -> [FAIL][86] ([i915#1389])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8163/shard-tglb3/igt@runner@aborted.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/shard-tglb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1318]: https://gitlab.freedesktop.org/drm/intel/issues/1318
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1401]: https://gitlab.freedesktop.org/drm/intel/issues/1401
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#1485]: https://gitlab.freedesktop.org/drm/intel/issues/1485
  [i915#1492]: https://gitlab.freedesktop.org/drm/intel/issues/1492
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#51]: https://gitlab.freedesktop.org/drm/intel/issues/51
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#879]: https://gitlab.freedesktop.org/drm/intel/issues/879
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5523 -> IGTPW_4334
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8163: 710b3af22d17146897a55f01868d8e2d867895d3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4334: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/index.html
  IGT_5523: cf6d524007ac51a7d5a48503ea3dd5f01fd4ebab @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4334/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
