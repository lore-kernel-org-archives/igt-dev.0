Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 08 Feb 2020 00:26:31 -0000
Message-ID: <158112159183.30228.15664016437419321457@emeril.freedesktop.org>
References: <20200205133154.1886680-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200205133154.1886680-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Fpersistence=3A_Check_that_we_cannot_hide_hangs_on_ol?=
 =?utf-8?q?d_engines_=28rev2=29?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_ctx_persistence: Check that we cannot hide hangs on old engines (rev2)
URL   : https://patchwork.freedesktop.org/series/73029/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7869_full -> IGTPW_4101_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4101_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_ctx_persistence@replace-hostile} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-iclb1/igt@gem_ctx_persistence@replace-hostile.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7869_full and IGTPW_4101_full:

### New IGT tests (1) ###

  * igt@gem_ctx_persistence@replace-hostile:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4101_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][2] -> [SKIP][3] ([fdo#110854])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb4/igt@gem_exec_balancer@smoke.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-iclb3/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([i915#677])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#112146]) +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb7/igt@gem_exec_schedule@preempt-bsd.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-iclb4/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-hsw:          [PASS][8] -> [FAIL][9] ([i915#694])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-hsw7/igt@gem_partial_pwrite_pread@reads.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-hsw1/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][10] -> [INCOMPLETE][11] ([fdo#103665])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][12] -> [FAIL][13] ([i915#413])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb1/igt@i915_pm_rps@waitboost.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-iclb8/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@live_gtt:
    - shard-tglb:         [PASS][14] -> [TIMEOUT][15] ([fdo#112126] / [fdo#112271])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-tglb8/igt@i915_selftest@live_gtt.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-tglb7/igt@i915_selftest@live_gtt.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-hsw:          [PASS][16] -> [FAIL][17] ([i915#969])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-hsw4/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-hsw8/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][18] -> [DMESG-WARN][19] ([i915#180]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-hsw:          [PASS][20] -> [INCOMPLETE][21] ([i915#61])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-hsw8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-hsw6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][22] -> [DMESG-WARN][23] ([i915#180]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][24] -> [SKIP][25] ([fdo#109441]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-iclb6/igt@kms_psr@psr2_cursor_render.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [PASS][26] -> [SKIP][27] ([fdo#112080]) +12 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb2/igt@perf_pmu@init-busy-vcs1.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-iclb7/igt@perf_pmu@init-busy-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#109276]) +11 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb1/igt@prime_busy@hang-bsd2.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-iclb5/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-iclb:         [INCOMPLETE][30] -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb2/igt@gem_ctx_exec@basic-nohangcheck.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-iclb7/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][32] ([i915#677]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-iclb8/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [SKIP][34] ([fdo#112146]) -> [PASS][35] +7 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-iclb7/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-hsw:          [FAIL][36] ([i915#694]) -> [PASS][37] +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-hsw7/igt@gem_partial_pwrite_pread@write.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-hsw2/igt@gem_partial_pwrite_pread@write.html

  * igt@i915_pm_rps@reset:
    - shard-apl:          [FAIL][38] ([i915#39]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-apl1/igt@i915_pm_rps@reset.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-apl7/igt@i915_pm_rps@reset.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][40] ([i915#79]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][42] ([i915#180]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][44] ([i915#180]) -> [PASS][45] +5 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][46] ([fdo#109441]) -> [PASS][47] +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb6/igt@kms_psr@psr2_cursor_blt.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][48] ([fdo#112080]) -> [PASS][49] +7 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb3/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-hsw:          [INCOMPLETE][50] ([i915#61]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-hsw4/igt@perf_pmu@cpu-hotplug.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-hsw5/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][52] ([fdo#109276]) -> [PASS][53] +26 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb5/igt@prime_vgem@fence-wait-bsd2.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-apl:          [INCOMPLETE][54] ([fdo#103927]) -> [TIMEOUT][55] ([fdo#112271])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-apl6/igt@gem_ctx_exec@basic-nohangcheck.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-apl7/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][56] ([fdo#112080]) -> [FAIL][57] ([IGT#28])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][58] ([IGT#28]) -> [SKIP][59] ([fdo#112080])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][60] ([i915#818]) -> [FAIL][61] ([i915#694])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-hsw8/igt@gem_tiled_blits@interruptible.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-hsw2/igt@gem_tiled_blits@interruptible.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][62] ([i915#694]) -> [FAIL][63] ([i915#818])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-hsw1/igt@gem_tiled_blits@normal.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-hsw5/igt@gem_tiled_blits@normal.html

  * igt@gem_wait@wait-vcs1:
    - shard-apl:          [SKIP][64] ([fdo#109271] / [fdo#112080]) -> [INCOMPLETE][65] ([CI#80] / [fdo#103927])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-apl1/igt@gem_wait@wait-vcs1.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-apl7/igt@gem_wait@wait-vcs1.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][66] ([i915#454]) -> [SKIP][67] ([i915#468])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-tglb6/igt@i915_pm_dc@dc6-psr.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-apl:          [SKIP][68] ([fdo#109271]) -> [TIMEOUT][69] ([fdo#112271])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7869/shard-apl4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/shard-apl7/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112126]: https://bugs.freedesktop.org/show_bug.cgi?id=112126
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#39]: https://gitlab.freedesktop.org/drm/intel/issues/39
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#969]: https://gitlab.freedesktop.org/drm/intel/issues/969


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5419 -> IGTPW_4101
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7869: db0579be255412f38a450c3c577f8d10f1195034 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4101: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/index.html
  IGT_5419: 44913a91e77434b03001bb9ea53216cd03c476e6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4101/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
