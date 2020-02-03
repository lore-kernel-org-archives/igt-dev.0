Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 03 Feb 2020 08:06:52 -0000
Message-ID: <158071721286.3017.2616279306472579386@emeril.freedesktop.org>
References: <20200131065456.16467-1-ayaz.siddiqui@intel.com>
In-Reply-To: <20200131065456.16467-1-ayaz.siddiqui@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkIGNo?=
 =?utf-8?q?eck_for_HW_tiling_support_in_gem=5Fset=5Ftiling=5Fvs=5Fblt_test?=
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
To: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add check for HW tiling support in gem_set_tiling_vs_blt test
URL   : https://patchwork.freedesktop.org/series/72803/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7848_full -> IGTPW_4054_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4054_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_ctx_persistence@legacy-vecs0-mixed-process}:
    - shard-apl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-apl3/igt@gem_ctx_persistence@legacy-vecs0-mixed-process.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-apl3/igt@gem_ctx_persistence@legacy-vecs0-mixed-process.html

  
Known issues
------------

  Here are the changes found in IGTPW_4054_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112080]) +10 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-iclb4/igt@gem_ctx_persistence@vcs1-queued.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-iclb5/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#110841])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276]) +18 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-iclb1/igt@gem_exec_schedule@out-order-bsd2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-iclb7/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_ringfill@basic-default-hang:
    - shard-iclb:         [PASS][11] -> [INCOMPLETE][12] ([i915#140])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-iclb6/igt@gem_ringfill@basic-default-hang.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-iclb7/igt@gem_ringfill@basic-default-hang.html

  * igt@i915_selftest@live_execlists:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([i915#472] / [i915#529] / [i915#647])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-tglb2/igt@i915_selftest@live_execlists.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-tglb5/igt@i915_selftest@live_execlists.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +4 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-tglb:         [PASS][17] -> [SKIP][18] ([i915#668]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-tglb1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-tglb1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#109441])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-iclb8/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][23] -> [FAIL][24] ([i915#831])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][25] ([fdo#110854]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-iclb8/igt@gem_exec_balancer@smoke.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][27] ([fdo#112080]) -> [PASS][28] +22 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-iclb7/igt@gem_exec_parallel@vcs1-fds.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][29] ([i915#677]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-iclb5/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [SKIP][31] ([fdo#112146]) -> [PASS][32] +5 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-iclb4/igt@gem_exec_schedule@preempt-bsd.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-iclb8/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][33] ([fdo#109276]) -> [PASS][34] +12 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_linear_blits@interruptible:
    - shard-hsw:          [FAIL][35] -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-hsw5/igt@gem_linear_blits@interruptible.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-hsw2/igt@gem_linear_blits@interruptible.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][37] ([i915#447]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-iclb2/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][39] ([i915#454]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-iclb:         [FAIL][41] ([i915#370]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-iclb7/igt@i915_pm_rps@min-max-config-loaded.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-iclb5/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][43] ([i915#413]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-iclb5/igt@i915_pm_rps@reset.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-iclb6/igt@i915_pm_rps@reset.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-hsw:          [DMESG-WARN][45] ([i915#44]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-hsw5/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-hsw6/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-tglb:         [SKIP][47] ([i915#668]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50] +6 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][51] ([fdo#109441]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][53] ([i915#31]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-apl3/igt@kms_setmode@basic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-apl1/igt@kms_setmode@basic.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [TIMEOUT][55] ([fdo#112271] / [i915#1085] / [i915#472]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-tglb6/igt@perf@gen12-mi-rpc.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-tglb5/igt@perf@gen12-mi-rpc.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][57] ([fdo#112080]) -> [FAIL][58] ([IGT#28])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][59] ([IGT#28]) -> [SKIP][60] ([fdo#112080])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_eio@in-flight-immediate:
    - shard-glk:          [INCOMPLETE][61] ([CI#80] / [i915#1098] / [i915#58] / [k.org#198133]) -> [TIMEOUT][62] ([fdo#112271])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-glk8/igt@gem_eio@in-flight-immediate.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-glk9/igt@gem_eio@in-flight-immediate.html

  * igt@gem_exec_balancer@hang:
    - shard-kbl:          [TIMEOUT][63] ([fdo#112271]) -> [INCOMPLETE][64] ([CI#80] / [fdo#103665])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-kbl3/igt@gem_exec_balancer@hang.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-kbl6/igt@gem_exec_balancer@hang.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][65] ([i915#454]) -> [SKIP][66] ([i915#468])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-tglb6/igt@i915_pm_dc@dc6-dpms.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-snb:          [SKIP][67] ([fdo#109271]) -> [INCOMPLETE][68] ([i915#82])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-snb5/igt@i915_pm_rpm@gem-evict-pwrite.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-snb1/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-snb:          [INCOMPLETE][69] ([i915#82]) -> [SKIP][70] ([fdo#109271])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7848/shard-snb6/igt@i915_pm_rpm@system-suspend-execbuf.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/shard-snb1/igt@i915_pm_rpm@system-suspend-execbuf.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1098]: https://gitlab.freedesktop.org/drm/intel/issues/1098
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#370]: https://gitlab.freedesktop.org/drm/intel/issues/370
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#647]: https://gitlab.freedesktop.org/drm/intel/issues/647
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5407 -> IGTPW_4054
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7848: 8aedf54deffb209efaf2daeef154423f55c322c6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4054: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/index.html
  IGT_5407: a9d69f51dadbcbc53527671f87572d05c3370cba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4054/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
