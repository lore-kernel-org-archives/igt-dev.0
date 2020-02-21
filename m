Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 21 Feb 2020 03:33:53 -0000
Message-ID: <158225603324.7917.8765020589175014998@emeril.freedesktop.org>
References: <20200219121940.18247-1-petri.latvala@intel.com>
In-Reply-To: <20200219121940.18247-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?/resultgen=3A_Provide_output_when_test_output_is_completely_emp?=
 =?utf-8?q?ty?=
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

Series: runner/resultgen: Provide output when test output is completely empty
URL   : https://patchwork.freedesktop.org/series/73643/
State : success

== Summary ==

CI Bug Log - changes from IGT_5450_full -> IGTPW_4184_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/index.html

Known issues
------------

  Here are the changes found in IGTPW_4184_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([i915#677])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276]) +19 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-iclb2/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-iclb5/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112146]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-iclb8/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_render_copy_redux@interruptible:
    - shard-hsw:          [PASS][7] -> [FAIL][8] ([i915#910])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-hsw6/igt@gem_render_copy_redux@interruptible.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-hsw6/igt@gem_render_copy_redux@interruptible.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][9] -> [FAIL][10] ([i915#454])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-iclb6/igt@i915_pm_dc@dc6-dpms.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180]) +6 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#54])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#54])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][19] -> [FAIL][20] ([i915#96])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-hsw7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#34])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-glk8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-glk7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109441]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-iclb1/igt@kms_psr@psr2_cursor_render.html

  * igt@perf@oa-exponents:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#84])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-glk3/igt@perf@oa-exponents.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-glk5/igt@perf@oa-exponents.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#112080]) +14 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-iclb7/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [SKIP][29] ([fdo#112080]) -> [PASS][30] +11 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-iclb6/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-iclb2/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [FAIL][31] -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-iclb1/igt@gem_exec_balancer@hang.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-iclb6/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][33] ([fdo#110854]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-iclb7/igt@gem_exec_balancer@smoke.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-iclb4/igt@gem_exec_balancer@smoke.html

  * {igt@gem_exec_schedule@implicit-both-bsd1}:
    - shard-iclb:         [SKIP][35] ([fdo#109276] / [i915#677]) -> [PASS][36] +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-iclb8/igt@gem_exec_schedule@implicit-both-bsd1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][37] ([i915#677]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][39] ([fdo#112146]) -> [PASS][40] +6 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-iclb6/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-hsw:          [FAIL][41] ([i915#694]) -> [PASS][42] +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-hsw6/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-hsw8/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][43] ([i915#180]) -> [PASS][44] +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-apl6/igt@gem_softpin@noreloc-s3.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-apl7/igt@gem_softpin@noreloc-s3.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [INCOMPLETE][45] ([fdo#103927]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-apl8/igt@gem_workarounds@suspend-resume.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-apl3/igt@gem_workarounds@suspend-resume.html

  * igt@i915_selftest@live_gtt:
    - shard-apl:          [TIMEOUT][47] ([fdo#112271]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-apl3/igt@i915_selftest@live_gtt.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-apl2/igt@i915_selftest@live_gtt.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding:
    - shard-kbl:          [FAIL][49] ([i915#54]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
    - shard-apl:          [FAIL][51] ([i915#54]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-tglb:         [SKIP][53] ([i915#668]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * {igt@kms_hdr@bpc-switch-suspend}:
    - shard-kbl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][57] ([i915#899]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-glk2/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][59] ([fdo#109441]) -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-iclb8/igt@kms_psr@psr2_no_drrs.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [TIMEOUT][61] ([fdo#112271] / [i915#1085]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-tglb6/igt@perf@gen12-mi-rpc.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-tglb1/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-hsw:          [INCOMPLETE][63] ([i915#1176] / [i915#61]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-hsw5/igt@perf_pmu@cpu-hotplug.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-hsw7/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][65] ([fdo#109276]) -> [PASS][66] +21 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-iclb3/igt@prime_busy@hang-bsd2.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-iclb2/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][67] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][68] ([fdo#110789] / [fdo#111870] / [i915#478])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-snb1/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][69] ([i915#468]) -> [FAIL][70] ([i915#454])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5450/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/shard-tglb7/igt@i915_pm_dc@dc6-psr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1176]: https://gitlab.freedesktop.org/drm/intel/issues/1176
  [i915#1241]: https://gitlab.freedesktop.org/drm/intel/issues/1241
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#750]: https://gitlab.freedesktop.org/drm/intel/issues/750
  [i915#84]: https://gitlab.freedesktop.org/drm/intel/issues/84
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#910]: https://gitlab.freedesktop.org/drm/intel/issues/910
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5450 -> IGTPW_4184

  CI-20190529: 20190529
  CI_DRM_7963: e0d737598eb749378a5dc4ed3dfafc6f79d512cb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4184: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/index.html
  IGT_5450: dfba090e720ed4e043158887f1ba6a76059491e8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4184/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
