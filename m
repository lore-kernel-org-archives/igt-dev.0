Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 24 Nov 2020 16:38:21 -0000
Message-ID: <160623590126.10863.2864998819060409621@emeril.freedesktop.org>
References: <20201124123145.26723-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20201124123145.26723-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=3A_optimize_pixel_format_tests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1712928649=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1712928649==
Content-Type: multipart/alternative;
 boundary="===============0797700365536604155=="

--===============0797700365536604155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane: optimize pixel format tests
URL   : https://patchwork.freedesktop.org/series/84213/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9382_full -> IGTPW_5216_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5216_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5216_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5216_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@banned:
    - shard-tglb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-tglb1/igt@gem_eio@banned.html

  * igt@gem_eio@execbuf:
    - shard-iclb:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-iclb5/igt@gem_eio@execbuf.html

  * igt@gem_eio@in-flight-internal-immediate:
    - shard-glk:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-glk4/igt@gem_eio@in-flight-internal-immediate.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-tglb:         [PASS][4] -> [SKIP][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-tglb6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
    - shard-iclb:         [PASS][6] -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-iclb1/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@kms_ccs@pipe-b-crc-primary-basic:
    - shard-kbl:          [PASS][8] -> [FAIL][9] +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl7/igt@kms_ccs@pipe-b-crc-primary-basic.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-kbl6/igt@kms_ccs@pipe-b-crc-primary-basic.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-glk:          [PASS][10] -> [FAIL][11] +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html
    - shard-iclb:         [PASS][12] -> [FAIL][13] +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html
    - shard-snb:          [PASS][14] -> [FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence:
    - shard-tglb:         [PASS][16] -> [FAIL][17] +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb8/igt@kms_frontbuffer_tracking@psr-farfromfence.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-tglb7/igt@kms_frontbuffer_tracking@psr-farfromfence.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_userptr_blits@vma-merge}:
    - shard-snb:          [FAIL][18] ([i915#1635]) -> [FAIL][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb5/igt@gem_userptr_blits@vma-merge.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-snb6/igt@gem_userptr_blits@vma-merge.html

  
Known issues
------------

  Here are the changes found in IGTPW_5216_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@render-ccs:
    - shard-apl:          [PASS][20] -> [INCOMPLETE][21] ([i915#1635] / [i915#2405] / [i915#2499])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl4/igt@api_intel_bb@render-ccs.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-apl2/igt@api_intel_bb@render-ccs.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-hsw:          [PASS][22] -> [SKIP][23] ([fdo#109271])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-hsw7/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
    - shard-glk:          [PASS][24] -> [SKIP][25] ([fdo#109271])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-glk3/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
    - shard-apl:          [PASS][26] -> [SKIP][27] ([fdo#109271] / [i915#1635])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-apl4/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
    - shard-snb:          [PASS][28] -> [SKIP][29] ([fdo#109271])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-snb7/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
    - shard-kbl:          [PASS][30] -> [SKIP][31] ([fdo#109271])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-kbl2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [PASS][32] -> [FAIL][33] ([i915#2389])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-glk5/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][34] -> [SKIP][35] ([i915#2190])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb2/igt@gem_huc_copy@huc-copy.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [PASS][36] -> [DMESG-WARN][37] ([i915#1982]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb3/igt@i915_module_load@reload.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-tglb6/igt@i915_module_load@reload.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         [PASS][38] -> [WARN][39] ([i915#2681])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb7/igt@i915_pm_rc6_residency@rc6-fence.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-tglb1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_ccs@pipe-b-crc-primary-basic:
    - shard-apl:          [PASS][40] -> [FAIL][41] ([i915#1635]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl3/igt@kms_ccs@pipe-b-crc-primary-basic.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-apl2/igt@kms_ccs@pipe-b-crc-primary-basic.html

  * igt@kms_color@pipe-a-legacy-gamma:
    - shard-apl:          [PASS][42] -> [FAIL][43] ([fdo#108145] / [i915#1635] / [i915#71])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl3/igt@kms_color@pipe-a-legacy-gamma.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-apl6/igt@kms_color@pipe-a-legacy-gamma.html
    - shard-glk:          [PASS][44] -> [FAIL][45] ([fdo#108145] / [i915#71])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk5/igt@kms_color@pipe-a-legacy-gamma.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-glk8/igt@kms_color@pipe-a-legacy-gamma.html
    - shard-kbl:          [PASS][46] -> [FAIL][47] ([fdo#108145] / [i915#71])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl3/igt@kms_color@pipe-a-legacy-gamma.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-kbl6/igt@kms_color@pipe-a-legacy-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][48] -> [INCOMPLETE][49] ([i915#155] / [i915#2295])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
    - shard-iclb:         [PASS][50] -> [INCOMPLETE][51] ([i915#1185] / [i915#2295])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
    - shard-apl:          [PASS][52] -> [INCOMPLETE][53] ([i915#1635] / [i915#2295] / [i915#2635])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
    - shard-glk:          [PASS][54] -> [INCOMPLETE][55] ([i915#2295] / [i915#2635])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk9/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-glk9/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
    - shard-hsw:          [PASS][56] -> [INCOMPLETE][57] ([i915#2055] / [i915#2295] / [i915#2637])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-hsw6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:
    - shard-apl:          [PASS][58] -> [DMESG-WARN][59] ([i915#1635] / [i915#1982]) +8 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl7/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-apl4/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][60] -> [FAIL][61] ([i915#2370])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_flip@2x-busy-flip@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][62] -> [DMESG-WARN][63] ([i915#1982]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw6/igt@kms_flip@2x-busy-flip@ab-vga1-hdmi-a1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-hsw6/igt@kms_flip@2x-busy-flip@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-vga1-hdmi-a1:
    - shard-hsw:          [PASS][64] -> [FAIL][65] ([i915#79])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-vga1-hdmi-a1.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-hsw4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-vga1-hdmi-a1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - shard-kbl:          [PASS][66] -> [DMESG-WARN][67] ([i915#1982]) +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl6/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-kbl1/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][68] -> [FAIL][69] ([i915#2598]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-kbl:          [PASS][70] -> [DMESG-WARN][71] ([i915#180])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-glk:          [PASS][72] -> [DMESG-WARN][73] ([i915#1982]) +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][74] -> [SKIP][75] ([i915#433])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][76] -> [SKIP][77] ([fdo#109642] / [fdo#111068])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-iclb7/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][78] -> [SKIP][79] ([fdo#109441]) +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb2/igt@kms_psr@psr2_basic.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-iclb8/igt@kms_psr@psr2_basic.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-kbl:          [DMESG-WARN][80] ([i915#180]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * {igt@gem_exec_capture@pi@rcs0}:
    - shard-iclb:         [INCOMPLETE][82] ([i915#2369] / [i915#2559]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb1/igt@gem_exec_capture@pi@rcs0.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-iclb5/igt@gem_exec_capture@pi@rcs0.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - shard-iclb:         [SKIP][84] -> [PASS][85] +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb6/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-iclb4/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html

  * igt@i915_hangman@error-state-basic:
    - shard-snb:          [TIMEOUT][86] -> [PASS][87] +2 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb2/igt@i915_hangman@error-state-basic.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-snb6/igt@i915_hangman@error-state-basic.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][88] ([i915#454]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-iclb3/igt@i915_pm_dc@dc6-psr.html

  * {igt@kms_async_flips@alternate-sync-async-flip}:
    - shard-tglb:         [FAIL][90] ([i915#2521]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb7/igt@kms_async_flips@alternate-sync-async-flip.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-tglb5/igt@kms_async_flips@alternate-sync-async-flip.html

  * {igt@kms_async_flips@test-time-stamp}:
    - shard-tglb:         [FAIL][92] ([i915#2597]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb8/igt@kms_async_flips@test-time-stamp.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-tglb7/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge:
    - shard-glk:          [DMESG-WARN][94] ([i915#1982]) -> [PASS][95] +5 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1:
    - shard-apl:          [DMESG-WARN][96] ([i915#1635] / [i915#1982]) -> [PASS][97] +4 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl1/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-apl3/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1:
    - shard-kbl:          [DMESG-WARN][98] ([i915#1982]) -> [PASS][99] +5 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-kbl6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [DMESG-WARN][100] ([i915#1982]) -> [PASS][101] +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-tglb:         [FAIL][102] -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
    - shard-iclb:         [FAIL][104] -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence:
    - shard-hsw:          [DMESG-WARN][106] ([i915#1982]) -> [PASS][107] +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw6/igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-hsw1/igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][108] ([fdo#109441]) -> [PASS][109] +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf@disabled-read-error:
    - shard-glk:          [SKIP][110] ([fdo#109271]) -> [PASS][111] +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk5/igt@perf@disabled-read-error.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-glk8/igt@perf@disabled-read-error.html
    - shard-apl:          [SKIP][112] ([fdo#109271] / [i915#1635]) -> [PASS][113] +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl8/igt@perf@disabled-read-error.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-apl6/igt@perf@disabled-read-error.html
    - shard-kbl:          [SKIP][114] ([fdo#109271]) -> [PASS][115] +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl4/igt@perf@disabled-read-error.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-kbl6/igt@perf@disabled-read-error.html
    - shard-tglb:         [SKIP][116] -> [PASS][117] +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb6/igt@perf@disabled-read-error.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-tglb5/igt@perf@disabled-read-error.html
    - shard-hsw:          [SKIP][118] ([fdo#109271]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw1/igt@perf@disabled-read-error.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-hsw4/igt@perf@disabled-read-error.html

  * igt@prime_vgem@coherency-blt:
    - shard-tglb:         [INCOMPLETE][120] -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb1/igt@prime_vgem@coherency-blt.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-tglb7/igt@prime_vgem@coherency-blt.html

  
#### Warnings ####

  * igt@gem_eio@in-flight-suspend:
    - shard-tglb:         [DMESG-FAIL][122] ([i915#2411]) -> [DMESG-WARN][123] ([i915#2411])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb2/igt@gem_eio@in-flight-suspend.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-tglb3/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@kms:
    - shard-hsw:          [FAIL][124] -> [FAIL][125] ([i915#1888])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw1/igt@gem_eio@kms.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-hsw8/igt@gem_eio@kms.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-snb:          [TIMEOUT][126] -> [SKIP][127] ([fdo#109271]) +2 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb2/igt@gem_exec_schedule@preempt-queue.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-snb6/igt@gem_exec_schedule@preempt-queue.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][128] ([i915#2684]) -> [WARN][129] ([i915#2681] / [i915#2684])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_suspend@sysfs-reader:
    - shard-tglb:         [INCOMPLETE][130] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411] / [i915#456]) -> [DMESG-WARN][131] ([i915#2411]) +1 similar issue
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb7/igt@i915_suspend@sysfs-reader.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-tglb2/igt@i915_suspend@sysfs-reader.html

  * igt@kms_color_chamelium@pipe-b-ctm-negative:
    - shard-snb:          [TIMEOUT][132] -> [SKIP][133] ([fdo#109271] / [fdo#111827])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb2/igt@kms_color_chamelium@pipe-b-ctm-negative.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-snb5/igt@kms_color_chamelium@pipe-b-ctm-negative.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-tglb:         [DMESG-WARN][134] ([i915#2295] / [i915#2411]) -> [INCOMPLETE][135] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2295] / [i915#2411] / [i915#456])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][136] ([i915#2295]) -> [FAIL][137] ([i915#2295] / [i915#483])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl7/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-kbl3/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][138], [FAIL][139]) ([i915#2295] / [i915#483]) -> ([FAIL][140], [FAIL][141]) ([i915#1814] / [i915#2295] / [i915#483])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb1/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb3/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-iclb1/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-iclb2/igt@runner@aborted.html
    - shard-apl:          [FAIL][142] ([i915#1635] / [i915#2295]) -> ([FAIL][143], [FAIL][144]) ([i915#1635] / [i915#1814] / [i915#2295])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl1/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-apl2/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-apl4/igt@runner@aborted.html
    - shard-glk:          ([FAIL][145], [FAIL][146]) ([i915#1814] / [i915#2295] / [i915#483] / [k.org#202321]) -> ([FAIL][147], [FAIL][148]) ([i915#1814] / [i915#2295] / [k.org#202321])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk7/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk8/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-glk2/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-glk9/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][149], [FAIL][150], [FAIL][151], [FAIL][152]) ([i915#1602] / [i915#1814] / [i915#2295] / [i915#2426] / [i915#409]) -> ([FAIL][153], [FAIL][154]) ([i915#1602] / [i915#2295])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb5/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb6/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb1/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb7/igt@runner@aborted.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-tglb1/igt@runner@aborted.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-tglb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2369]: https://gitlab.freedesktop.org/drm/intel/issues/2369
  [i915#2370]: https://gitlab.freedesktop.org/drm/intel/issues/2370
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2499]: https://gitlab.freedesktop.org/drm/intel/issues/2499
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2559]: https://gitlab.freedesktop.org/drm/intel/issues/2559
  [i915#2597]: https://gitlab.freedesktop.org/drm/intel/issues/2597
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/i

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/index.html

--===============0797700365536604155==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/kms_plane: optimize pixel format tests=
</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84213/">https://patchwork.freedesktop.org/series/84213/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5216/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5216/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9382_full -&gt; IGTPW_5216_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5216_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5216_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5216=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_eio@banned:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5216/shard-tglb1/igt@gem_eio@banned.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@execbuf:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5216/shard-iclb5/igt@gem_eio@execbuf.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-internal-immediate:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5216/shard-glk4/igt@gem_eio@in-flight-internal-immediat=
e.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-tglb5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/sh=
ard-tglb6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-iclb5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/sh=
ard-iclb1/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-kbl7/igt@kms_ccs@pipe-b-crc-primary-basic.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard=
-kbl6/igt@kms_ccs@pipe-b-crc-primary-basic.html">FAIL</a> +1 similar issue<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shr=
fb-draw-pwrite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5216/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-offs=
cren-pri-shrfb-draw-pwrite.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-sh=
rfb-draw-pwrite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5216/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-1p-of=
fscren-pri-shrfb-draw-pwrite.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shr=
fb-draw-pwrite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5216/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-offs=
cren-pri-shrfb-draw-pwrite.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-farfromfence:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb8/igt@kms_frontbuffer_tracking@psr-farfromfence.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5216/shard-tglb7/igt@kms_frontbuffer_tracking@psr-farfromfence.html">FAIL</=
a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@gem_userptr_blits@vma-merge}:<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-snb5/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shar=
d-snb6/igt@gem_userptr_blits@vma-merge.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5216_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-apl4/igt@api_intel_bb@render-ccs.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-apl2/igt=
@api_intel_bb@render-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2405">i915#2405</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2499">i915#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-hsw2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/sha=
rd-hsw7/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-glk6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/sha=
rd-glk3/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-apl6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/sha=
rd-apl4/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>=
)</p>
</li>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-snb6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/sha=
rd-snb7/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-kbl2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/sha=
rd-kbl2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/=
shard-glk5/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb2/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-tglb6/igt=
@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb3/igt@i915_module_load@reload.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-tglb6/i=
gt@i915_module_load@reload.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb7/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard=
-tglb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-apl3/igt@kms_ccs@pipe-b-crc-primary-basic.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard=
-apl2/igt@kms_ccs@pipe-b-crc-primary-basic.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +1 similar =
issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-legacy-gamma:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-apl3/igt@kms_color@pipe-a-legacy-gamma.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-apl=
6/igt@kms_color@pipe-a-legacy-gamma.html">FAIL</a> (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D108145">fdo#108145</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / [i915#71]=
)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-glk5/igt@kms_color@pipe-a-legacy-gamma.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-glk=
8/igt@kms_color@pipe-a-legacy-gamma.html">FAIL</a> (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D108145">fdo#108145</a> / [i915#71])</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-kbl3/igt@kms_color@pipe-a-legacy-gamma.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-kbl=
6/igt@kms_color@pipe-a-legacy-gamma.html">FAIL</a> (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D108145">fdo#108145</a> / [i915#71])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/sh=
ard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295=
</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/s=
hard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#=
2295</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/sh=
ard-apl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#22=
95</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i=
915#2635</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-glk9/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/sh=
ard-glk9/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#26=
35</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-hsw2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/sh=
ard-hsw6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#22=
95</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637">i=
915#2637</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-apl7/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5216/shard-apl4/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1982">i915#1982</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_521=
6/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2370">i915#2370</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-hsw6/igt@kms_flip@2x-busy-flip@ab-vga1-hdmi-a1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/=
shard-hsw6/igt@kms_flip@2x-busy-flip@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982<=
/a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-hsw1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-vga1-hdmi=
-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5216/shard-hsw4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-vga1-hdmi=
-a1.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-kbl6/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216=
/shard-kbl1/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#198=
2</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_521=
6/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2598">i915#2598</a=
>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5216/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/18=
0">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-in=
dfb-draw-render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5216/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-cur-indfb-draw-render.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-tg=
lb6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-iclb7/i=
gt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb2/igt@kms_psr@psr2_basic.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-iclb8/igt@km=
s_psr@psr2_basic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vecs0.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5216/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vecs0.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_capture@pi@rcs0}:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb1/igt@gem_exec_capture@pi@rcs0.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2369">i915#2369=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2559">i91=
5#2559</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5216/shard-iclb5/igt@gem_exec_capture@pi@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb6/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html"=
>SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
216/shard-iclb4/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">PASS</a>=
 +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@error-state-basic:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-snb2/igt@i915_hangman@error-state-basic.html">TIMEOUT</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shar=
d-snb6/igt@i915_hangman@error-state-basic.html">PASS</a> +2 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-iclb3/ig=
t@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@alternate-sync-async-flip}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb7/igt@kms_async_flips@alternate-sync-async-flip.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2521=
">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5216/shard-tglb5/igt@kms_async_flips@alternate-sync-async-flip.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@test-time-stamp}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb8/igt@kms_async_flips@test-time-stamp.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2597">i915#259=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216=
/shard-tglb7/igt@kms_async_flips@test-time-stamp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5216/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-64x64-right-e=
dge.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-apl1/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5216/shard-apl3/igt@kms_flip@absolute-wf_vblank-inte=
rruptible@a-dp1.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-kbl7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5216/shard-kbl6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.ht=
ml">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-stridechange.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5216/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-stridechange.=
html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt=
.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5216/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.h=
tml">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt=
.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5216/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.h=
tml">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-hsw6/igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequen=
ce.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5216/shard-hsw1/igt@kms_pipe_crc_basic@read-crc-pipe-b-f=
rame-sequence.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#10944=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216=
/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> +1 similar is=
sue</li>
</ul>
</li>
<li>
<p>igt@perf@disabled-read-error:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-glk5/igt@perf@disabled-read-error.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-=
glk8/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-apl8/igt@perf@disabled-read-error.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/=
shard-apl6/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-kbl4/igt@perf@disabled-read-error.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-=
kbl6/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-tglb6/igt@perf@disabled-read-error.html">SKIP</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-tglb5/i=
gt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-hsw1/igt@perf@disabled-read-error.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-=
hsw4/igt@perf@disabled-read-error.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-blt:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb1/igt@prime_vgem@coherency-blt.html">INCOMPLETE</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-=
tglb7/igt@prime_vgem@coherency-blt.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb2/igt@gem_eio@in-flight-suspend.html">DMESG-FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#241=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216=
/shard-tglb3/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-hsw1/igt@gem_eio@kms.html">FAIL</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-hsw8/igt@gem_eio@kms=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-snb2/igt@gem_exec_schedule@preempt-queue.html">TIMEOUT</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/sha=
rd-snb6/igt@gem_exec_schedule@preempt-queue.html">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +2 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#268=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216=
/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)=
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb7/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#143=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i9=
15#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/18=
87">i915#1887</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2411">i915#2411</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i">=
i915#456</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5216/shard-tglb2/igt@i915_suspend@sysfs-reader.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>=
) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-negative:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-snb2/igt@kms_color_chamelium@pipe-b-ctm-negative.html">T=
IMEOUT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5216/shard-snb5/igt@kms_color_chamelium@pipe-b-ctm-negative.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">=
fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/229=
5">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5216/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1887">i915#1887</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2411">i915#2411</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i">i915#456</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-kbl7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-kbl3/igt@run=
ner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / [i915#483])</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb3/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a> / [i915#483]) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_5216/shard-iclb1/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard=
-iclb2/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2295">i915#2295</a> / [i915#483])</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-apl1/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-apl2/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5216/shard-apl4/igt@runner@aborted.html">FAIL</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i91=
5#2295</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-glk7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk8/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a> / [i915#483] / [k.org#202321]) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-glk2/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5216/shard-glk9/igt@runner@aborted.html">FAIL</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / [=
k.org#202321])</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb6/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_9382/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb7/igt@runner@aborte=
d.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2426">i915#2426</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/409">i915#409</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_5216/shard-tglb1/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5216=
/shard-tglb5/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============0797700365536604155==--

--===============1712928649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1712928649==--
