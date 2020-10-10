Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 10 Oct 2020 16:50:56 -0000
Message-ID: <160234865644.25003.3076591698184920605@emeril.freedesktop.org>
References: <20201010143719.1778033-1-apoorva1.singh@intel.com>
In-Reply-To: <20201010143719.1778033-1-apoorva1.singh@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Fcreate=3A_Added_test_description_for_test_case?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1983958940=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1983958940==
Content-Type: multipart/alternative;
 boundary="===============3737280597874454062=="

--===============3737280597874454062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_ctx_create: Added test description for test case
URL   : https://patchwork.freedesktop.org/series/82544/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5808_full -> IGTPW_5055_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5055_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5055_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5055_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@engines-hostile@rcs0:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb8/igt@gem_ctx_persistence@engines-hostile@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-iclb1/igt@gem_ctx_persistence@engines-hostile@rcs0.html
    - shard-tglb:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-tglb2/igt@gem_ctx_persistence@engines-hostile@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-tglb7/igt@gem_ctx_persistence@engines-hostile@rcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_5055_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-hostile@rcs0:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#2410])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk3/igt@gem_ctx_persistence@engines-hostile@rcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-glk5/igt@gem_ctx_persistence@engines-hostile@rcs0.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#118] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk5/igt@gem_exec_whisper@basic-queues-forked-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-glk8/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][9] -> [FAIL][10] ([i915#454])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_color@pipe-a-gamma:
    - shard-tglb:         [PASS][11] -> [FAIL][12] ([i915#1149])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-tglb2/igt@kms_color@pipe-a-gamma.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-tglb8/igt@kms_color@pipe-a-gamma.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#79])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-hsw:          [PASS][15] -> [INCOMPLETE][16] ([i915#2055])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-tglb:         [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_plane_scaling@pipe-c-scaler-with-clipping-clamping:
    - shard-iclb:         [PASS][21] -> [DMESG-WARN][22] ([i915#1982])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb4/igt@kms_plane_scaling@pipe-c-scaler-with-clipping-clamping.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-iclb3/igt@kms_plane_scaling@pipe-c-scaler-with-clipping-clamping.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109441]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-iclb1/igt@kms_psr@psr2_cursor_plane_onoff.html

  
#### Possible fixes ####

  * igt@gem_ctx_engines@libapi:
    - shard-hsw:          [FAIL][25] ([i915#2541]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw4/igt@gem_ctx_engines@libapi.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-hsw2/igt@gem_ctx_engines@libapi.html
    - shard-iclb:         [FAIL][27] ([i915#2541]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb6/igt@gem_ctx_engines@libapi.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-iclb1/igt@gem_ctx_engines@libapi.html
    - shard-kbl:          [FAIL][29] ([i915#2541]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl4/igt@gem_ctx_engines@libapi.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-kbl4/igt@gem_ctx_engines@libapi.html
    - shard-apl:          [FAIL][31] ([i915#1635] / [i915#2541]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl1/igt@gem_ctx_engines@libapi.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-apl4/igt@gem_ctx_engines@libapi.html
    - shard-glk:          [FAIL][33] ([i915#2541]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk1/igt@gem_ctx_engines@libapi.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-glk5/igt@gem_ctx_engines@libapi.html
    - shard-tglb:         [FAIL][35] ([i915#2541]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-tglb5/igt@gem_ctx_engines@libapi.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-tglb7/igt@gem_ctx_engines@libapi.html
    - shard-snb:          [FAIL][37] ([i915#2541]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-snb4/igt@gem_ctx_engines@libapi.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-snb2/igt@gem_ctx_engines@libapi.html

  * {igt@gem_exec_capture@pi@vcs0}:
    - shard-glk:          [INCOMPLETE][39] ([i915#2553]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk5/igt@gem_exec_capture@pi@vcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-glk5/igt@gem_exec_capture@pi@vcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [FAIL][41] ([i915#1635] / [i915#2389]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-apl7/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-glk:          [DMESG-WARN][43] ([i915#118] / [i915#95]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk6/igt@gem_exec_whisper@basic-fds-priority.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-glk1/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-hsw:          [WARN][45] ([i915#1519]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw2/igt@i915_pm_rc6_residency@rc6-fence.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-hsw1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-apl:          [DMESG-WARN][47] ([i915#1635] / [i915#1982]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-apl7/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50] +4 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [FAIL][51] ([i915#96]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][53] -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw4/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-hsw1/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-tglb:         [DMESG-WARN][55] ([i915#1982]) -> [PASS][56] +7 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-iclb:         [DMESG-WARN][57] ([i915#1982]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-iclb2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][59] ([fdo#109441]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb3/igt@kms_psr@psr2_suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][61] ([i915#1635] / [i915#31]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl2/igt@kms_setmode@basic.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-apl7/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - shard-kbl:          [DMESG-WARN][63] ([i915#1982]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl1/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-kbl4/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  * igt@perf_pmu@module-unload:
    - shard-tglb:         [SKIP][65] -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-tglb5/igt@perf_pmu@module-unload.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-tglb2/igt@perf_pmu@module-unload.html
    - shard-snb:          [SKIP][67] ([fdo#109271]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-snb4/igt@perf_pmu@module-unload.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-snb4/igt@perf_pmu@module-unload.html
    - shard-hsw:          [SKIP][69] ([fdo#109271]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw4/igt@perf_pmu@module-unload.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-hsw2/igt@perf_pmu@module-unload.html
    - shard-kbl:          [SKIP][71] ([fdo#109271]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl4/igt@perf_pmu@module-unload.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-kbl2/igt@perf_pmu@module-unload.html
    - shard-apl:          [SKIP][73] ([fdo#109271] / [i915#1635]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl1/igt@perf_pmu@module-unload.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-apl6/igt@perf_pmu@module-unload.html
    - shard-iclb:         [SKIP][75] -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb6/igt@perf_pmu@module-unload.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-iclb7/igt@perf_pmu@module-unload.html
    - shard-glk:          [SKIP][77] ([fdo#109271]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk1/igt@perf_pmu@module-unload.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-glk4/igt@perf_pmu@module-unload.html

  * igt@testdisplay:
    - shard-apl:          [TIMEOUT][79] ([i915#1635] / [i915#1692]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl3/igt@testdisplay.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-apl6/igt@testdisplay.html
    - shard-kbl:          [TIMEOUT][81] ([i915#1692]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl1/igt@testdisplay.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-kbl2/igt@testdisplay.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1692]: https://gitlab.freedesktop.org/drm/intel/issues/1692
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2541]: https://gitlab.freedesktop.org/drm/intel/issues/2541
  [i915#2553]: https://gitlab.freedesktop.org/drm/intel/issues/2553
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5808 -> IGTPW_5055

  CI-20190529: 20190529
  CI_DRM_9124: 4e10e11b944de6a42e8dbad1f750adaa290c4646 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5055: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/index.html
  IGT_5808: f7d1ac8c479f7049bdd900df8d17c2fa6efdcaf6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/index.html

--===============3737280597874454062==
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
<tr><td><b>Series:</b></td><td>i915/gem_ctx_create: Added test description for test case</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82544/">https://patchwork.freedesktop.org/series/82544/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5808_full -&gt; IGTPW_5055_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5055_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5055_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5055_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-hostile@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb8/igt@gem_ctx_persistence@engines-hostile@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-iclb1/igt@gem_ctx_persistence@engines-hostile@rcs0.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-tglb2/igt@gem_ctx_persistence@engines-hostile@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-tglb7/igt@gem_ctx_persistence@engines-hostile@rcs0.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5055_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-hostile@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk3/igt@gem_ctx_persistence@engines-hostile@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-glk5/igt@gem_ctx_persistence@engines-hostile@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk5/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-glk8/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb1/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-gamma:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-tglb2/igt@kms_color@pipe-a-gamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-tglb8/igt@kms_color@pipe-a-gamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@pipe-c-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb4/igt@kms_plane_scaling@pipe-c-scaler-with-clipping-clamping.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-iclb3/igt@kms_plane_scaling@pipe-c-scaler-with-clipping-clamping.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-iclb1/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_engines@libapi:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw4/igt@gem_ctx_engines@libapi.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-hsw2/igt@gem_ctx_engines@libapi.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb6/igt@gem_ctx_engines@libapi.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-iclb1/igt@gem_ctx_engines@libapi.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl4/igt@gem_ctx_engines@libapi.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-kbl4/igt@gem_ctx_engines@libapi.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl1/igt@gem_ctx_engines@libapi.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-apl4/igt@gem_ctx_engines@libapi.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk1/igt@gem_ctx_engines@libapi.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-glk5/igt@gem_ctx_engines@libapi.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-tglb5/igt@gem_ctx_engines@libapi.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-tglb7/igt@gem_ctx_engines@libapi.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-snb4/igt@gem_ctx_engines@libapi.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-snb2/igt@gem_ctx_engines@libapi.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_capture@pi@vcs0}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk5/igt@gem_exec_capture@pi@vcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2553">i915#2553</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-glk5/igt@gem_exec_capture@pi@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-apl7/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk6/igt@gem_exec_whisper@basic-fds-priority.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-glk1/igt@gem_exec_whisper@basic-fds-priority.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-hsw1/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-apl7/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/96">i915#96</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw4/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-hsw1/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-iclb2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb3/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-iclb2/igt@kms_psr@psr2_suspend.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl2/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-apl7/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl1/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-kbl4/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-tglb5/igt@perf_pmu@module-unload.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-tglb2/igt@perf_pmu@module-unload.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-snb4/igt@perf_pmu@module-unload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-snb4/igt@perf_pmu@module-unload.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-hsw4/igt@perf_pmu@module-unload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-hsw2/igt@perf_pmu@module-unload.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl4/igt@perf_pmu@module-unload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-kbl2/igt@perf_pmu@module-unload.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl1/igt@perf_pmu@module-unload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-apl6/igt@perf_pmu@module-unload.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-iclb6/igt@perf_pmu@module-unload.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-iclb7/igt@perf_pmu@module-unload.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-glk1/igt@perf_pmu@module-unload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-glk4/igt@perf_pmu@module-unload.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-apl3/igt@testdisplay.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1692">i915#1692</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-apl6/igt@testdisplay.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5808/shard-kbl1/igt@testdisplay.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1692">i915#1692</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/shard-kbl2/igt@testdisplay.html">PASS</a></p>
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
<li>IGT: IGT_5808 -&gt; IGTPW_5055</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9124: 4e10e11b944de6a42e8dbad1f750adaa290c4646 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5055: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5055/index.html<br />
  IGT_5808: f7d1ac8c479f7049bdd900df8d17c2fa6efdcaf6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============3737280597874454062==--

--===============1983958940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1983958940==--
