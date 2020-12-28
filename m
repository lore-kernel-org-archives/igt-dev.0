Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 28 Dec 2020 05:09:18 -0000
Message-ID: <160913215828.11283.14016617188025783086@emeril.freedesktop.org>
References: <20201228031940.178954-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20201228031940.178954-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/4=5D_lib/i915/perf=3A_fix_intel=5Fp?=
 =?utf-8?q?erf=5Fdevinfo_gen_field?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1333719403=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1333719403==
Content-Type: multipart/alternative;
 boundary="===============0287423798200995100=="

--===============0287423798200995100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/4] lib/i915/perf: fix intel_perf_devinfo gen field
URL   : https://patchwork.freedesktop.org/series/85253/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9528_full -> IGTPW_5335_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5335_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5335_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5335_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] +4 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-iclb:         [PASS][7] -> [DMESG-WARN][8] +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9528_full and IGTPW_5335_full:

### New IGT tests (1) ###

  * igt@gem_exec_schedule@u-independent:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_5335_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-hostile-preempt:
    - shard-hsw:          NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#1099]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-hsw4/igt@gem_ctx_persistence@engines-hostile-preempt.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglb:         NOTRUN -> [SKIP][10] ([i915#280])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb8/igt@gem_ctx_sseu@engines.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][11] ([i915#768])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-idle@gtt:
    - shard-tglb:         NOTRUN -> [SKIP][12] ([i915#1317]) +3 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb7/igt@gem_userptr_blits@mmap-offset-invalidate-idle@gtt.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-idle@uc:
    - shard-iclb:         NOTRUN -> [SKIP][13] ([i915#1317]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb4/igt@gem_userptr_blits@mmap-offset-invalidate-idle@uc.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-idle@wb:
    - shard-glk:          NOTRUN -> [SKIP][14] ([fdo#109271]) +66 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk6/igt@gem_userptr_blits@mmap-offset-invalidate-idle@wb.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][15] ([fdo#110426] / [i915#1704])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb5/igt@gem_userptr_blits@readonly-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][16] ([fdo#110426] / [i915#1704])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb3/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-iclb:         NOTRUN -> [SKIP][17] ([fdo#112306])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb2/igt@gen9_exec_parse@valid-registers.html
    - shard-tglb:         NOTRUN -> [SKIP][18] ([fdo#112306])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb1/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-glk:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#658])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk8/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][20] ([i915#454])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-kbl6/igt@i915_pm_dc@dc6-dpms.html
    - shard-tglb:         NOTRUN -> [FAIL][21] ([i915#454])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][22] -> [FAIL][23] ([i915#454])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-iclb:         [PASS][24] -> [SKIP][25] ([i915#579])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-iclb1/igt@i915_pm_rpm@dpms-lpsp.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb3/igt@i915_pm_rpm@dpms-lpsp.html
    - shard-tglb:         [PASS][26] -> [SKIP][27] ([i915#579])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-tglb5/igt@i915_pm_rpm@dpms-lpsp.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb5/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_selftest@live@gem_contexts:
    - shard-glk:          [PASS][28] -> [INCOMPLETE][29] ([i915#2369])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-glk9/igt@i915_selftest@live@gem_contexts.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk9/igt@i915_selftest@live@gem_contexts.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb8/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#111614]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-apl4/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@vga-hpd-after-suspend:
    - shard-kbl:          NOTRUN -> [SKIP][33] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-kbl7/igt@kms_chamelium@vga-hpd-after-suspend.html

  * igt@kms_color@pipe-a-ctm-0-75:
    - shard-tglb:         NOTRUN -> [FAIL][34] ([i915#1149] / [i915#315]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb5/igt@kms_color@pipe-a-ctm-0-75.html

  * igt@kms_color@pipe-b-ctm-0-25:
    - shard-iclb:         NOTRUN -> [FAIL][35] ([i915#1149] / [i915#315]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb4/igt@kms_color@pipe-b-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb1/igt@kms_color_chamelium@pipe-a-ctm-0-5.html
    - shard-hsw:          NOTRUN -> [SKIP][37] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-hsw4/igt@kms_color_chamelium@pipe-a-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-glk:          NOTRUN -> [SKIP][38] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk7/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb7/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb1/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#109279])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109278]) +5 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb6/igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109274] / [fdo#109278])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#111825]) +17 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb1/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109274]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [PASS][46] -> [FAIL][47] ([i915#2598])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:
    - shard-glk:          [PASS][48] -> [FAIL][49] ([i915#79])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-apl:          [PASS][50] -> [DMESG-WARN][51] ([i915#2635]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - shard-tglb:         [PASS][52] -> [DMESG-WARN][53] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-tglb2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-hsw:          [PASS][54] -> [DMESG-WARN][55] ([i915#2637]) +6 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
    - shard-glk:          [PASS][56] -> [DMESG-WARN][57] ([i915#2635]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:
    - shard-tglb:         [PASS][58] -> [DMESG-FAIL][59] ([i915#1982])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-tglb2/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:
    - shard-tglb:         [PASS][60] -> [INCOMPLETE][61] ([i915#1436] / [i915#2295])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-tglb2/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a2:
    - shard-glk:          [PASS][62] -> [DMESG-WARN][63] ([i915#1602])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a2.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
    - shard-glk:          [PASS][64] -> [FAIL][65] ([i915#49])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109280]) +12 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          NOTRUN -> [SKIP][67] ([fdo#109271]) +53 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-kbl3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:
    - shard-apl:          NOTRUN -> [SKIP][68] ([fdo#109271]) +54 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-apl7/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
    - shard-hsw:          NOTRUN -> [SKIP][69] ([fdo#109271]) +56 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-hsw8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][70] ([fdo#108145] / [i915#265]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk9/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
    - shard-apl:          NOTRUN -> [FAIL][71] ([fdo#108145] / [i915#265])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
    - shard-kbl:          NOTRUN -> [FAIL][72] ([fdo#108145] / [i915#265])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][73] -> [SKIP][74] ([fdo#109441]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb3/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109441])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb3/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#2437])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk9/igt@kms_writeback@writeback-fb-id.html

  * igt@nouveau_crc@pipe-b-source-outp-complete:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#2530]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb2/igt@nouveau_crc@pipe-b-source-outp-complete.html

  * igt@nouveau_crc@pipe-c-source-outp-complete:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#2530]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb7/igt@nouveau_crc@pipe-c-source-outp-complete.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#109289])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb7/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@prime_nv_pcopy@test1_micro:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([fdo#109291]) +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb7/igt@prime_nv_pcopy@test1_micro.html

  * igt@prime_nv_test@i915_nv_sharing:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109291]) +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb5/igt@prime_nv_test@i915_nv_sharing.html

  * igt@prime_vgem@fence-read-hang:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([fdo#109295])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb3/igt@prime_vgem@fence-read-hang.html
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109295])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb4/igt@prime_vgem@fence-read-hang.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109307])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb2/igt@tools_test@sysfs_l3_parity.html
    - shard-tglb:         NOTRUN -> [SKIP][85] ([fdo#109307])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb1/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-hsw:          [INCOMPLETE][86] ([i915#1037]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-hsw4/igt@gem_eio@in-flight-contexts-10ms.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-hsw8/igt@gem_eio@in-flight-contexts-10ms.html

  * {igt@gem_exec_fair@basic-none-solo@rcs0}:
    - shard-apl:          [FAIL][88] ([i915#2842]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * {igt@gem_exec_fair@basic-pace@vecs0}:
    - shard-glk:          [FAIL][90] ([i915#2842]) -> [PASS][91] +2 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-glk9/igt@gem_exec_fair@basic-pace@vecs0.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk7/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-iclb:         [DMESG-WARN][92] ([i915#1602]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-iclb6/igt@gem_exec_suspend@basic-s3.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb8/igt@gem_exec_suspend@basic-s3.html
    - shard-kbl:          [DMESG-WARN][94] ([i915#1602]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-kbl3/igt@gem_exec_suspend@basic-s3.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-kbl2/igt@gem_exec_suspend@basic-s3.html
    - shard-apl:          [INCOMPLETE][96] ([i915#1602] / [i915#2369] / [i915#2502] / [i915#2635]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-apl1/igt@gem_exec_suspend@basic-s3.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-apl1/igt@gem_exec_suspend@basic-s3.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][98] ([i915#1436] / [i915#716]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-glk7/igt@gen9_exec_parse@allowed-all.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@fences:
    - shard-iclb:         [SKIP][100] ([i915#579]) -> [PASS][101] +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-iclb6/igt@i915_pm_rpm@fences.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb2/igt@i915_pm_rpm@fences.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-hsw:          [SKIP][102] ([fdo#109271]) -> [PASS][103] +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-hsw8/igt@i915_pm_rpm@gem-evict-pwrite.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-hsw4/igt@i915_pm_rpm@gem-evict-pwrite.html
    - shard-tglb:         [SKIP][104] ([i915#579]) -> [PASS][105] +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-tglb1/igt@i915_pm_rpm@gem-evict-pwrite.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb8/igt@i915_pm_rpm@gem-evict-pwrite.html
    - shard-kbl:          [SKIP][106] ([fdo#109271]) -> [PASS][107] +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-kbl3/igt@i915_pm_rpm@gem-evict-pwrite.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-kbl6/igt@i915_pm_rpm@gem-evict-pwrite.html
    - shard-apl:          [SKIP][108] ([fdo#109271]) -> [PASS][109] +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-apl3/igt@i915_pm_rpm@gem-evict-pwrite.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-apl3/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [FAIL][110] ([i915#2597]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-tglb7/igt@kms_async_flips@test-time-stamp.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb7/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][112] ([i915#2370]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-hsw:          [DMESG-WARN][114] ([i915#2637]) -> [PASS][115] +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-hsw8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-hsw4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-kbl:          [INCOMPLETE][116] ([i915#155]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-tglb:         [DMESG-WARN][118] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -> [PASS][119] +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [DMESG-WARN][120] ([i915#2635]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-glk:          [DMESG-WARN][122] ([i915#2635]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-glk5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][124] ([fdo#109441]) -> [PASS][125] +2 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf@polling-parameterized:
    - shard-tglb:         [FAIL][126] ([i915#1542]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-tglb3/igt@perf@polling-parameterized.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb3/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][128] ([i915#1804] / [i915#2684]) -> [WARN][129] ([i915#2681] / [i915#2684])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][130] ([i915#1804] / [i915#2684]) -> [WARN][131] ([i915#2684])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][132], [FAIL][133], [FAIL][134]) ([fdo#109271] / [i915#1436] / [i915#2295] / [i915#2722] / [i915#483]) -> ([FAIL][135], [FAIL][136]) ([fdo#109271] / [i915#2295])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-hsw8/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-hsw1/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-hsw4/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-hsw8/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-hsw4/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][137], [FAIL][138]) ([i915#2295] / [i915#483]) -> ([FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142]) ([fdo#109271] / [i915#1814] / [i915#2295] / [i915#2426] / [i915#2505] / [i915#483])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-kbl7/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-kbl3/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-kbl7/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-kbl1/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-kbl6/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-kbl4/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][143], [FAIL][144], [FAIL][145]) ([i915#2295] / [i915#2426] / [i915#2724] / [i915#483]) -> ([FAIL][146], [FAIL][147], [FAIL][148], [FAIL][149]) ([i915#1814] / [i915#2295] / [i915#2426] / [i915#2724] / [i915#483])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-iclb5/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-iclb2/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-iclb6/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb3/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb6/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb2/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb5/igt@runner@aborted.html
    - shard-apl:          ([FAIL][150], [FAIL][151], [FAIL][152]) ([fdo#109271] / [i915#1814] / [i915#2295]) -> ([FAIL][153], [FAIL][154], [FAIL][155], [FAIL][156]) ([fdo#109271] / [i915#1610] / [i915#1814] / [i915#2295] / [i915#2426])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-apl3/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/t

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/index.html

--===============0287423798200995100==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/4] lib/i915/perf: fix intel_perf_devinfo gen field</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85253/">https://patchwork.freedesktop.org/series/85253/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9528_full -&gt; IGTPW_5335_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5335_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5335_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5335_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">DMESG-WARN</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">DMESG-WARN</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9528_full and IGTPW_5335_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gem_exec_schedule@u-independent:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5335_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-hostile-preempt:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-hsw4/igt@gem_ctx_persistence@engines-hostile-preempt.html">SKIP</a> ([fdo#109271] / [i915#1099]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb8/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-idle@gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb7/igt@gem_userptr_blits@mmap-offset-invalidate-idle@gtt.html">SKIP</a> ([i915#1317]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-idle@uc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb4/igt@gem_userptr_blits@mmap-offset-invalidate-idle@uc.html">SKIP</a> ([i915#1317]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-idle@wb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk6/igt@gem_userptr_blits@mmap-offset-invalidate-idle@wb.html">SKIP</a> ([fdo#109271]) +66 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb5/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> ([fdo#110426] / [i915#1704])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb3/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> ([fdo#110426] / [i915#1704])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb2/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([fdo#112306])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb1/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([fdo#112306])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk8/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-kbl6/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-iclb1/igt@i915_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb3/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-tglb5/igt@i915_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb5/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#579])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-glk9/igt@i915_selftest@live@gem_contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk9/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a> ([i915#2369])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb8/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-apl4/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-after-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-kbl7/igt@kms_chamelium@vga-hpd-after-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-0-75:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb5/igt@kms_color@pipe-a-ctm-0-75.html">FAIL</a> ([i915#1149] / [i915#315]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb4/igt@kms_color@pipe-b-ctm-0-25.html">FAIL</a> ([i915#1149] / [i915#315]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-5:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb1/igt@kms_color_chamelium@pipe-a-ctm-0-5.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-hsw4/igt@kms_color_chamelium@pipe-a-ctm-0-5.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-limited-range:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk7/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb7/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +6 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb1/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html">SKIP</a> ([fdo#109279])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb6/igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge.html">SKIP</a> ([fdo#109278]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb1/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a> ([fdo#111825]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> ([fdo#109274]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> ([i915#2598])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#2635]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-tglb2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">DMESG-WARN</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> ([i915#2637]) +6 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> ([i915#2635]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-tglb2/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html">DMESG-FAIL</a> ([i915#1982])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-tglb2/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html">INCOMPLETE</a> ([i915#1436] / [i915#2295])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a2.html">DMESG-WARN</a> ([i915#1602])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html">FAIL</a> ([i915#49])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> ([fdo#109280]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-kbl3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +53 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-apl7/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html">SKIP</a> ([fdo#109271]) +54 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-hsw8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">SKIP</a> ([fdo#109271]) +56 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk9/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb3/igt@kms_psr@psr2_no_drrs.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb3/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk9/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-complete:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb2/igt@nouveau_crc@pipe-b-source-outp-complete.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-complete:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb7/igt@nouveau_crc@pipe-c-source-outp-complete.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb7/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test1_micro:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb7/igt@prime_nv_pcopy@test1_micro.html">SKIP</a> ([fdo#109291]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_nv_sharing:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb5/igt@prime_nv_test@i915_nv_sharing.html">SKIP</a> ([fdo#109291]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb3/igt@prime_vgem@fence-read-hang.html">SKIP</a> ([fdo#109295])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb4/igt@prime_vgem@fence-read-hang.html">SKIP</a> ([fdo#109295])</p>
</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb2/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([fdo#109307])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb1/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([fdo#109307])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-hsw4/igt@gem_eio@in-flight-contexts-10ms.html">INCOMPLETE</a> ([i915#1037]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-hsw8/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none-solo@rcs0}:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace@vecs0}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-glk9/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk7/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-iclb6/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> ([i915#1602]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb8/igt@gem_exec_suspend@basic-s3.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-kbl3/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> ([i915#1602]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-kbl2/igt@gem_exec_suspend@basic-s3.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-apl1/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> ([i915#1602] / [i915#2369] / [i915#2502] / [i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-apl1/igt@gem_exec_suspend@basic-s3.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-glk7/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> ([i915#1436] / [i915#716]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk2/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-iclb6/igt@i915_pm_rpm@fences.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb2/igt@i915_pm_rpm@fences.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-evict-pwrite:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-hsw8/igt@i915_pm_rpm@gem-evict-pwrite.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-hsw4/igt@i915_pm_rpm@gem-evict-pwrite.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-tglb1/igt@i915_pm_rpm@gem-evict-pwrite.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb8/igt@i915_pm_rpm@gem-evict-pwrite.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-kbl3/igt@i915_pm_rpm@gem-evict-pwrite.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-kbl6/igt@i915_pm_rpm@gem-evict-pwrite.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-apl3/igt@i915_pm_rpm@gem-evict-pwrite.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-apl3/igt@i915_pm_rpm@gem-evict-pwrite.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-tglb7/igt@kms_async_flips@test-time-stamp.html">FAIL</a> ([i915#2597]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb7/igt@kms_async_flips@test-time-stamp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> ([i915#2370]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-hsw8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> ([i915#2637]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-hsw4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPLETE</a> ([i915#155]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> ([i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-glk5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> ([i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-glk5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-tglb3/igt@perf@polling-parameterized.html">FAIL</a> ([i915#1542]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-tglb3/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#1804] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1804] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-hsw8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-hsw1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-hsw4/igt@runner@aborted.html">FAIL</a>) ([fdo#109271] / [i915#1436] / [i915#2295] / [i915#2722] / [i915#483]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-hsw8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-hsw4/igt@runner@aborted.html">FAIL</a>) ([fdo#109271] / [i915#2295])</p>
</li>
<li>
<p>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-kbl3/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#483]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-kbl4/igt@runner@aborted.html">FAIL</a>) ([fdo#109271] / [i915#1814] / [i915#2295] / [i915#2426] / [i915#2505] / [i915#483])</p>
</li>
<li>
<p>shard-iclb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-iclb5/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-iclb2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-iclb6/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2426] / [i915#2724] / [i915#483]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5335/shard-iclb5/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2426] / [i915#2724] / [i915#483])</p>
</li>
<li>
<p>shard-apl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9528/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/t">FAIL</a>, [FAIL][152]) ([fdo#109271] / [i915#1814] / [i915#2295]) -&gt; ([FAIL][153], [FAIL][154], [FAIL][155], [FAIL][156]) ([fdo#109271] / [i915#1610] / [i915#1814] / [i915#2295] / [i915#2426])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============0287423798200995100==--

--===============1333719403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1333719403==--
