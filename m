Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 23 Nov 2020 20:14:37 -0000
Message-ID: <160616247770.16916.7427874754818036269@emeril.freedesktop.org>
References: <20201123150312.55544-1-anandx.ram.moon@intel.com>
In-Reply-To: <20201123150312.55544-1-anandx.ram.moon@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fsetmode=3A_basic_Fix_the_testcase_failure_on_4K_monitors?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1373291423=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anand Moon <anandx.ram.moon@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1373291423==
Content-Type: multipart/alternative;
 boundary="===============6569847245114125328=="

--===============6569847245114125328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_setmode: basic Fix the testcase failure on 4K monitors
URL   : https://patchwork.freedesktop.org/series/84175/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5868_full -> IGTPW_5209_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5209_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5209_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5209_full:

### IGT changes ###

#### Possible regressions ####

  * igt@perf_pmu@rc6-runtime-pm-long:
    - shard-iclb:         [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb5/igt@perf_pmu@rc6-runtime-pm-long.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb3/igt@perf_pmu@rc6-runtime-pm-long.html

  
#### Warnings ####

  * igt@kms_setmode@basic:
    - shard-snb:          [FAIL][3] ([i915#31]) -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-snb6/igt@kms_setmode@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-snb2/igt@kms_setmode@basic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_userptr_blits@vma-merge}:
    - shard-snb:          [FAIL][5] ([i915#1635]) -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-snb2/igt@gem_userptr_blits@vma-merge.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-snb6/igt@gem_userptr_blits@vma-merge.html

  
Known issues
------------

  Here are the changes found in IGTPW_5209_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][7] -> [FAIL][8] ([i915#454])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-glk:          [PASS][9] -> [SKIP][10] ([fdo#109271]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk3/igt@i915_pm_rpm@gem-execbuf-stress.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-glk9/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-apl:          [PASS][11] -> [SKIP][12] ([fdo#109271] / [i915#1635]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl8/igt@i915_pm_rpm@gem-execbuf-stress.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-apl2/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-kbl:          [PASS][13] -> [SKIP][14] ([fdo#109271]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl1/igt@i915_pm_rpm@gem-execbuf-stress.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-kbl4/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-hsw:          [PASS][15] -> [SKIP][16] ([fdo#109271]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-hsw4/igt@i915_pm_rpm@gem-execbuf-stress.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-hsw4/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([i915#579]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb1/igt@i915_pm_rpm@gem-execbuf-stress.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb7/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +10 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk6/igt@kms_big_fb@linear-16bpp-rotate-0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-glk4/igt@kms_big_fb@linear-16bpp-rotate-0.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-tglb:         [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +6 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb2/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-tglb7/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([i915#2346])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +5 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-kbl3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#1635] / [i915#79])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-apl6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-iclb:         [PASS][29] -> [DMESG-WARN][30] ([i915#1982]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_plane@plane-position-hole-dpms-pipe-a-planes:
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#1635] / [i915#1982]) +6 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl7/igt@kms_plane@plane-position-hole-dpms-pipe-a-planes.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-apl4/igt@kms_plane@plane-position-hole-dpms-pipe-a-planes.html

  * igt@kms_plane_lowres@pipe-c-tiling-x:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#165] / [i915#78])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl6/igt@kms_plane_lowres@pipe-c-tiling-x.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-x.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109642] / [fdo#111068])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb8/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb1/igt@kms_psr@psr2_suspend.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [FAIL][39] ([i915#1635] / [i915#2389]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl6/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-apl3/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-hsw:          [FAIL][41] ([i915#2389]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-hsw1/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [INCOMPLETE][43] ([i915#2369] / [i915#2473]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl6/igt@gem_exec_suspend@basic-s3.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-kbl6/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_mmap@big-bo:
    - shard-iclb:         [DMESG-WARN][45] ([i915#1982]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb2/igt@gem_mmap@big-bo.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb2/igt@gem_mmap@big-bo.html

  * igt@gem_softpin@noreloc-s3:
    - shard-iclb:         [INCOMPLETE][47] ([i915#1373] / [i915#2405]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb5/igt@gem_softpin@noreloc-s3.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb8/igt@gem_softpin@noreloc-s3.html
    - shard-apl:          [INCOMPLETE][49] ([i915#1635] / [i915#2405] / [i915#2635]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl3/igt@gem_softpin@noreloc-s3.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-apl3/igt@gem_softpin@noreloc-s3.html
    - shard-glk:          [INCOMPLETE][51] ([i915#2199] / [i915#2405] / [i915#2635]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk6/igt@gem_softpin@noreloc-s3.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-glk6/igt@gem_softpin@noreloc-s3.html
    - shard-hsw:          [INCOMPLETE][53] ([i915#2405] / [i915#2637]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-hsw4/igt@gem_softpin@noreloc-s3.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-hsw6/igt@gem_softpin@noreloc-s3.html
    - shard-kbl:          [INCOMPLETE][55] ([i915#2405]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl4/igt@gem_softpin@noreloc-s3.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-kbl3/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-kbl:          [SKIP][57] ([fdo#109271]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl1/igt@i915_pm_rpm@drm-resources-equal.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-kbl4/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-iclb:         [SKIP][59] ([i915#579]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb1/igt@i915_pm_rpm@drm-resources-equal.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb6/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-hsw:          [SKIP][61] ([fdo#109271]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-hsw2/igt@i915_pm_rpm@gem-execbuf.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-hsw2/igt@i915_pm_rpm@gem-execbuf.html
    - shard-apl:          [SKIP][63] ([fdo#109271] / [i915#1635]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl6/igt@i915_pm_rpm@gem-execbuf.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-apl4/igt@i915_pm_rpm@gem-execbuf.html
    - shard-glk:          [SKIP][65] ([fdo#109271]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk4/igt@i915_pm_rpm@gem-execbuf.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-glk1/igt@i915_pm_rpm@gem-execbuf.html

  * igt@i915_selftest@live@gt_heartbeat:
    - shard-glk:          [DMESG-FAIL][67] -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk1/igt@i915_selftest@live@gt_heartbeat.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-glk7/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge:
    - shard-hsw:          [DMESG-WARN][69] ([i915#1982]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-hsw6/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-hsw4/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-apl:          [DMESG-WARN][71] ([i915#1635] / [i915#1982]) -> [PASS][72] +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl6/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-apl8/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [DMESG-WARN][73] ([i915#1982]) -> [PASS][74] +8 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a1-hdmi-a2.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-glk6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][75] ([i915#1982]) -> [PASS][76] +4 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl3/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-kbl3/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:
    - shard-tglb:         [DMESG-WARN][77] ([i915#1982]) -> [PASS][78] +4 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80] +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb8/igt@kms_psr@psr2_cursor_blt.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  
#### Warnings ####

  * igt@gem_softpin@noreloc-s3:
    - shard-tglb:         [DMESG-WARN][81] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -> [DMESG-WARN][82] ([i915#2411])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb2/igt@gem_softpin@noreloc-s3.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-tglb3/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][83] ([i915#2684]) -> [WARN][84] ([i915#1804] / [i915#2684])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][85] ([i915#1804]) -> [WARN][86] ([i915#2681])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-tglb:         [SKIP][87] ([i915#579]) -> [DMESG-WARN][88] ([i915#2411]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb3/igt@i915_pm_rpm@gem-execbuf.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-tglb1/igt@i915_pm_rpm@gem-execbuf.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-tglb:         [DMESG-WARN][89] ([i915#2411]) -> [SKIP][90] ([i915#579])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb5/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-tglb8/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-apl:          [DMESG-FAIL][91] ([fdo#108145] / [i915#1635] / [i915#1982]) -> [FAIL][92] ([fdo#108145] / [i915#1635] / [i915#265])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-apl3/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@perf_pmu@rc6-runtime-pm-long:
    - shard-tglb:         [DMESG-WARN][93] ([i915#2411]) -> [SKIP][94] ([fdo#111719])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb3/igt@perf_pmu@rc6-runtime-pm-long.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-tglb8/igt@perf_pmu@rc6-runtime-pm-long.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][95], [FAIL][96]) ([i915#2295] / [i915#2426] / [i915#2505] / [i915#483]) -> [FAIL][97] ([i915#2295] / [i915#483])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl4/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl6/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-kbl2/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][98], [FAIL][99]) ([i915#2295] / [i915#483]) -> [FAIL][100] ([i915#2295])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb1/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb5/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb4/igt@runner@aborted.html
    - shard-glk:          ([FAIL][101], [FAIL][102]) ([i915#2295] / [i915#86] / [k.org#202321]) -> [FAIL][103] ([i915#2295] / [k.org#202321])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk2/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk6/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-glk5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
  [i915#1373]: https://gitlab.freedesktop.org/drm/intel/issues/1373
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2199]: https://gitlab.freedesktop.org/drm/intel/issues/2199
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2369]: https://gitlab.freedesktop.org/drm/intel/issues/2369
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2473]: https://gitlab.freedesktop.org/drm/intel/issues/2473
  [i915#2505]: https://gitlab.freedesktop.org/drm/intel/issues/2505
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#86]: https://gitlab.freedesktop.org/drm/intel/issues/86
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5868 -> IGTPW_5209

  CI-20190529: 20190529
  CI_DRM_9376: d08ea807a6466f311fe921872bc18cfc384ae281 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5209: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/index.html
  IGT_5868: 36b5fc05c30dbfd9242069fd6e51ebb419b386bc @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/index.html

--===============6569847245114125328==
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
<tr><td><b>Series:</b></td><td>tests/kms_setmode: basic Fix the testcase failure on 4K monitors</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84175/">https://patchwork.freedesktop.org/series/84175/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5868_full -&gt; IGTPW_5209_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5209_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5209_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5209_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@perf_pmu@rc6-runtime-pm-long:<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb5/igt@perf_pmu@rc6-runtime-pm-long.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb3/igt@perf_pmu@rc6-runtime-pm-long.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_setmode@basic:<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-snb6/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-snb2/igt@kms_setmode@basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@gem_userptr_blits@vma-merge}:<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-snb2/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-snb6/igt@gem_userptr_blits@vma-merge.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5209_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb7/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk3/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-glk9/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl8/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-apl2/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl1/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-kbl4/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-hsw4/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-hsw4/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb1/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb7/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk6/igt@kms_big_fb@linear-16bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-glk4/igt@kms_big_fb@linear-16bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb2/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-tglb7/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-kbl3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-apl6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-badstride.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-badstride.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms-pipe-a-planes:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl7/igt@kms_plane@plane-position-hole-dpms-pipe-a-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-apl4/igt@kms_plane@plane-position-hole-dpms-pipe-a-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-x:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl6/igt@kms_plane_lowres@pipe-c-tiling-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb8/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb2/igt@kms_psr@psr2_suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb1/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-apl3/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-hsw1/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl6/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2369">i915#2369</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2473">i915#2473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-kbl6/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap@big-bo:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb2/igt@gem_mmap@big-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb2/igt@gem_mmap@big-bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb5/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb8/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl3/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-apl3/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk6/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2199">i915#2199</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-glk6/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-hsw4/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-hsw6/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl4/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-kbl3/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@drm-resources-equal:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl1/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-kbl4/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb1/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb6/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-hsw2/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-hsw2/igt@i915_pm_rpm@gem-execbuf.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl6/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-apl4/igt@i915_pm_rpm@gem-execbuf.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk4/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-glk1/igt@i915_pm_rpm@gem-execbuf.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk1/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-glk7/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-hsw6/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-hsw4/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl6/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-apl8/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a1-hdmi-a2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-glk6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl3/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-kbl3/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb8/igt@kms_psr@psr2_cursor_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb2/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-tglb3/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb3/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-tglb1/igt@i915_pm_rpm@gem-execbuf.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb5/igt@i915_pm_rpm@modeset-lpsp-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-tglb8/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-apl3/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-runtime-pm-long:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-tglb3/igt@perf_pmu@rc6-runtime-pm-long.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-tglb8/igt@perf_pmu@rc6-runtime-pm-long.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111719">fdo#111719</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-kbl6/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2505">i915#2505</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-kbl2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-iclb5/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-iclb4/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5868/shard-glk6/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/86">i915#86</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/shard-glk5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5868 -&gt; IGTPW_5209</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9376: d08ea807a6466f311fe921872bc18cfc384ae281 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5209: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5209/index.html<br />
  IGT_5868: 36b5fc05c30dbfd9242069fd6e51ebb419b386bc @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============6569847245114125328==--

--===============1373291423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1373291423==--
