Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 04 Mar 2020 14:44:43 -0000
Message-ID: <158333308332.426.17380939861715067724@emeril.freedesktop.org>
References: <20200303223813.3866-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200303223813.3866-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIGln?=
 =?utf-8?q?t_tests_for_perf_OA_interrupts?=
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
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add igt tests for perf OA interrupts
URL   : https://patchwork.freedesktop.org/series/74229/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8059_full -> IGTPW_4252_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4252_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4252_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4252_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@perf@flush-data} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +4 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-iclb6/igt@perf@flush-data.html

  * igt@perf@oa-exponents:
    - shard-tglb:         [PASS][2] -> [TIMEOUT][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-tglb7/igt@perf@oa-exponents.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-tglb3/igt@perf@oa-exponents.html

  * {igt@perf@polling-with-interrupt} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][4] +4 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-tglb6/igt@perf@polling-with-interrupt.html

  
#### Warnings ####

  * igt@gem_exec_schedule@pi-userfault-bsd2:
    - shard-iclb:         [SKIP][5] ([fdo#109276]) -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-iclb8/igt@gem_exec_schedule@pi-userfault-bsd2.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-iclb1/igt@gem_exec_schedule@pi-userfault-bsd2.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8059_full and IGTPW_4252_full:

### New IGT tests (5) ###

  * igt@perf@blocking-parameterized:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@perf@blocking-with-interrupt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@perf@flush-data:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@perf@polling-parameterized:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@perf@polling-with-interrupt:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4252_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112080]) +14 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-iclb2/igt@gem_busy@busy-vcs1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-iclb6/igt@gem_busy@busy-vcs1.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#110854])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-iclb4/igt@gem_exec_balancer@smoke.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-iclb3/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-read-write-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-iclb6/igt@gem_exec_schedule@implicit-read-write-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd1:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109276]) +12 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-iclb6/igt@gem_exec_schedule@pi-common-bsd1.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#112146]) +5 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-kbl7/igt@gem_workarounds@suspend-resume-context.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-kbl1/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-apl1/igt@i915_suspend@sysfs-reader.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-apl6/igt@i915_suspend@sysfs-reader.html

  * igt@kms_invalid_dotclock:
    - shard-apl:          [PASS][21] -> [INCOMPLETE][22] ([fdo#103927])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-apl7/igt@kms_invalid_dotclock.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-apl8/igt@kms_invalid_dotclock.html

  * igt@kms_plane@plane-position-covered-pipe-a-planes:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#247])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-apl8/igt@kms_plane@plane-position-covered-pipe-a-planes.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-apl7/igt@kms_plane@plane-position-covered-pipe-a-planes.html
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#247])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-kbl1/igt@kms_plane@plane-position-covered-pipe-a-planes.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-kbl6/igt@kms_plane@plane-position-covered-pipe-a-planes.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-iclb2/igt@kms_psr@psr2_basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-iclb8/igt@kms_psr@psr2_basic.html

  
#### Possible fixes ####

  * igt@gem_exec_schedule@implicit-write-read-bsd2:
    - shard-iclb:         [SKIP][29] ([fdo#109276] / [i915#677]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-iclb8/igt@gem_exec_schedule@implicit-write-read-bsd2.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-iclb4/igt@gem_exec_schedule@implicit-write-read-bsd2.html

  * igt@gem_exec_schedule@independent-bsd:
    - shard-iclb:         [SKIP][31] ([fdo#112146]) -> [PASS][32] +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-iclb2/igt@gem_exec_schedule@independent-bsd.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-iclb7/igt@gem_exec_schedule@independent-bsd.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][33] ([i915#677]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-iclb5/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-glk:          [INCOMPLETE][35] ([i915#58] / [k.org#198133]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-glk9/igt@gem_exec_whisper@basic-queues-forked.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-glk2/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][37] ([i915#180]) -> [PASS][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][39] ([i915#57]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-hsw5/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-hsw7/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_flip@flip-vs-dpms-interruptible:
    - shard-apl:          [DMESG-WARN][41] ([i915#1297]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-apl6/igt@kms_flip@flip-vs-dpms-interruptible.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-apl3/igt@kms_flip@flip-vs-dpms-interruptible.html
    - shard-kbl:          [DMESG-WARN][43] ([i915#1297]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-kbl2/igt@kms_flip@flip-vs-dpms-interruptible.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-kbl6/igt@kms_flip@flip-vs-dpms-interruptible.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b:
    - shard-snb:          [SKIP][45] ([fdo#109271]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-snb6/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-snb5/igt@kms_pipe_crc_basic@read-crc-pipe-b.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][47] ([i915#899]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][49] ([fdo#109642] / [fdo#111068]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-iclb1/igt@kms_psr2_su@page_flip.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][51] ([i915#31]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-hsw8/igt@kms_setmode@basic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-hsw7/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][53] ([fdo#112080]) -> [PASS][54] +5 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-iclb7/igt@perf_pmu@busy-vcs1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-iclb4/igt@perf_pmu@busy-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][55] ([fdo#109276]) -> [PASS][56] +13 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-iclb5/igt@prime_vgem@fence-wait-bsd2.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-hsw:          [DMESG-WARN][57] ([fdo#111870]) -> [DMESG-WARN][58] ([fdo#110789] / [fdo#111870])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-hsw5/igt@gem_userptr_blits@dmabuf-unsync.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-hsw8/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-snb:          [DMESG-WARN][59] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][60] ([fdo#110789] / [fdo#111870] / [i915#478])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-snb2/igt@gem_userptr_blits@dmabuf-unsync.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
    - shard-hsw:          [DMESG-WARN][61] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][62] ([fdo#111870])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][63] ([i915#468]) -> [FAIL][64] ([i915#454])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-tglb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         [SKIP][65] ([i915#1316]) -> [SKIP][66] ([fdo#109293] / [fdo#109506])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-iclb1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-iclb8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         [SKIP][67] ([i915#1316]) -> [SKIP][68] ([fdo#109506])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-tglb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-tglb3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][69] ([i915#1226]) -> [SKIP][70] ([fdo#109349])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8059/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#247]: https://gitlab.freedesktop.org/drm/intel/issues/247
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5489 -> IGTPW_4252
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8059: 1beee9fc089828e40507003ffeaeef0697345be7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4252: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/index.html
  IGT_5489: f74d9ecfb482388b05f6902b29e64c031989ad33 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4252/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
