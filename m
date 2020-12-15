Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 15 Dec 2020 18:24:28 -0000
Message-ID: <160805666873.24784.6361927944932973108@emeril.freedesktop.org>
References: <20201215084825.101358-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20201215084825.101358-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/gem=5Fuserptr=5Fblits=3A?=
 =?utf-8?q?_Rework_userptr_tests_to_copy_with_changes?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0326737931=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0326737931==
Content-Type: multipart/alternative;
 boundary="===============4962087982238547000=="

--===============4962087982238547000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/gem_userptr_blits: Rework userptr tests to copy with changes
URL   : https://patchwork.freedesktop.org/series/84948/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9484_full -> IGTPW_5292_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5292_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_balancer@fairslice}:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-iclb7/igt@gem_exec_balancer@fairslice.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb2/igt@gem_exec_balancer@fairslice.html

  * {igt@gem_exec_schedule@u-fairslice@rcs0}:
    - shard-tglb:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-tglb8/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb7/igt@gem_exec_schedule@u-fairslice@rcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_5292_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@vecs0:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#2389]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-glk3/igt@gem_exec_reloc@basic-many-active@vecs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk3/igt@gem_exec_reloc@basic-many-active@vecs0.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-apl:          NOTRUN -> [WARN][7] ([i915#2658])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][8] ([i915#768])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb2/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_userptr_blits@readonly-mmap-unsync@wb:
    - shard-tglb:         NOTRUN -> [SKIP][9] ([i915#1704]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb1/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html
    - shard-iclb:         NOTRUN -> [SKIP][10] ([i915#1704]) +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb5/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-tglb:         NOTRUN -> [SKIP][11] ([fdo#109289])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb3/igt@gen7_exec_parse@basic-allocation.html
    - shard-iclb:         NOTRUN -> [SKIP][12] ([fdo#109289])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb1/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#1436] / [i915#716])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-kbl4/igt@gen9_exec_parse@allowed-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-kbl3/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-iclb:         NOTRUN -> [SKIP][15] ([fdo#112306])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb2/igt@gen9_exec_parse@batch-zero-length.html
    - shard-tglb:         NOTRUN -> [SKIP][16] ([fdo#112306])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb6/igt@gen9_exec_parse@batch-zero-length.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [PASS][17] -> [FAIL][18] ([i915#1567])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-hsw:          NOTRUN -> [SKIP][19] ([fdo#109271]) +14 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-hsw2/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglb:         [PASS][20] -> [WARN][21] ([i915#2681] / [i915#2684])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-tglb6/igt@i915_pm_rc6_residency@rc6-idle.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb3/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-iclb:         [PASS][22] -> [WARN][23] ([i915#2681] / [i915#2684])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - shard-hsw:          [PASS][24] -> [SKIP][25] ([fdo#109271]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-hsw2/igt@i915_pm_rpm@basic-pci-d3-state.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-hsw2/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_suspend@debugfs-reader:
    - shard-tglb:         [PASS][26] -> [DMESG-WARN][27] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-tglb8/igt@i915_suspend@debugfs-reader.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb2/igt@i915_suspend@debugfs-reader.html
    - shard-glk:          [PASS][28] -> [DMESG-WARN][29] ([i915#1602] / [i915#2635])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-glk7/igt@i915_suspend@debugfs-reader.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk5/igt@i915_suspend@debugfs-reader.html
    - shard-apl:          [PASS][30] -> [DMESG-WARN][31] ([i915#1602] / [i915#2635])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-apl8/igt@i915_suspend@debugfs-reader.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl8/igt@i915_suspend@debugfs-reader.html
    - shard-iclb:         [PASS][32] -> [DMESG-WARN][33] ([i915#1602])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-iclb7/igt@i915_suspend@debugfs-reader.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb1/igt@i915_suspend@debugfs-reader.html
    - shard-kbl:          [PASS][34] -> [INCOMPLETE][35] ([i915#155])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-kbl4/igt@i915_suspend@debugfs-reader.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-kbl4/igt@i915_suspend@debugfs-reader.html

  * igt@kms_atomic_transition@5x-modeset-transitions-nonblocking-fencing:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#112025])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb8/igt@kms_atomic_transition@5x-modeset-transitions-nonblocking-fencing.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111615]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([fdo#110723]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_ccs@pipe-d-ccs-on-another-bo:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109278]) +6 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb6/igt@kms_ccs@pipe-d-ccs-on-another-bo.html

  * igt@kms_chamelium@dp-crc-single:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb1/igt@kms_chamelium@dp-crc-single.html

  * igt@kms_chamelium@vga-hpd-after-suspend:
    - shard-apl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl8/igt@kms_chamelium@vga-hpd-after-suspend.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109278] / [i915#1149])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb8/igt@kms_color@pipe-d-ctm-0-25.html
    - shard-tglb:         NOTRUN -> [FAIL][43] ([i915#1149] / [i915#315])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb8/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color@pipe-d-legacy-gamma:
    - shard-glk:          NOTRUN -> [SKIP][44] ([fdo#109271]) +15 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk6/igt@kms_color@pipe-d-legacy-gamma.html

  * igt@kms_color_chamelium@pipe-b-ctm-max:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-max.html

  * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#111828])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb6/igt@kms_content_protection@atomic-dpms.html
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109300] / [fdo#111066])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#109279])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x170-sliding.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109274] / [fdo#109278])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][51] -> [FAIL][52] ([i915#96])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-hsw7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - shard-tglb:         [PASS][53] -> [FAIL][54] ([i915#2122])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-tglb6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-tglb:         [PASS][55] -> [FAIL][56] ([i915#79])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:
    - shard-glk:          [PASS][57] -> [FAIL][58] ([i915#79])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-hsw:          [PASS][59] -> [DMESG-WARN][60] ([i915#2637]) +6 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [PASS][61] -> [INCOMPLETE][62] ([i915#2055])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:
    - shard-glk:          [PASS][63] -> [FAIL][64] ([i915#2122])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-glk1/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk6/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-kbl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#2672])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-kbl6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html
    - shard-glk:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#2672])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html
    - shard-iclb:         NOTRUN -> [SKIP][67] ([i915#2587])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html
    - shard-apl:          NOTRUN -> [SKIP][68] ([fdo#109271] / [i915#2672])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-glk:          [PASS][69] -> [FAIL][70] ([i915#49]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
    - shard-apl:          [PASS][71] -> [FAIL][72] ([i915#49]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
    - shard-kbl:          [PASS][73] -> [FAIL][74] ([i915#49]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109280]) +6 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-apl:          NOTRUN -> [SKIP][76] ([fdo#109271]) +38 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
    - shard-kbl:          NOTRUN -> [SKIP][77] ([fdo#109271]) +19 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-kbl7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([fdo#111825]) +7 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([i915#1187])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb7/igt@kms_hdr@static-toggle-suspend.html
    - shard-iclb:         NOTRUN -> [SKIP][80] ([i915#1187])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][81] ([fdo#108145] / [i915#265])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109441])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb6/igt@kms_psr@psr2_suspend.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-apl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#2437])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl7/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-a-source-outp-complete:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([i915#2530]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb1/igt@nouveau_crc@pipe-a-source-outp-complete.html
    - shard-iclb:         NOTRUN -> [SKIP][85] ([i915#2530])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb5/igt@nouveau_crc@pipe-a-source-outp-complete.html

  * igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109278] / [i915#2530])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb8/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html

  * igt@prime_nv_test@i915_nv_sharing:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109291])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb4/igt@prime_nv_test@i915_nv_sharing.html

  * igt@prime_vgem@fence-write-hang:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#109295])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb8/igt@prime_vgem@fence-write-hang.html
    - shard-tglb:         NOTRUN -> [SKIP][89] ([fdo#109295])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb7/igt@prime_vgem@fence-write-hang.html

  
#### Possible fixes ####

  * {igt@gem_exec_schedule@u-fairslice@vcs0}:
    - shard-iclb:         [DMESG-WARN][90] -> [PASS][91] +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-iclb7/igt@gem_exec_schedule@u-fairslice@vcs0.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb4/igt@gem_exec_schedule@u-fairslice@vcs0.html

  * {igt@gem_exec_schedule@u-fairslice@vcs1}:
    - shard-tglb:         [DMESG-WARN][92] -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-tglb8/igt@gem_exec_schedule@u-fairslice@vcs1.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb7/igt@gem_exec_schedule@u-fairslice@vcs1.html

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [DMESG-WARN][94] ([i915#118] / [i915#95]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-glk5/igt@gem_exec_whisper@basic-queues-all.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk9/igt@gem_exec_whisper@basic-queues-all.html

  * {igt@gem_vm_create@destroy-race}:
    - shard-tglb:         [TIMEOUT][96] ([i915#2795]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-tglb3/igt@gem_vm_create@destroy-race.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb2/igt@gem_vm_create@destroy-race.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-snb:          [DMESG-WARN][98] ([i915#42]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-snb5/igt@i915_suspend@fence-restore-untiled.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-snb5/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:
    - shard-glk:          [FAIL][100] ([i915#79]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html

  * igt@kms_plane_lowres@pipe-a-tiling-none:
    - shard-kbl:          [DMESG-WARN][102] ([i915#165] / [i915#180]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-kbl2/igt@kms_plane_lowres@pipe-a-tiling-none.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-kbl7/igt@kms_plane_lowres@pipe-a-tiling-none.html

  * igt@kms_plane_lowres@pipe-c-tiling-none:
    - shard-kbl:          [DMESG-WARN][104] ([i915#165] / [i915#180] / [i915#78]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-none.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-kbl4/igt@kms_plane_lowres@pipe-c-tiling-none.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][106] ([fdo#109441]) -> [PASS][107] +3 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-iclb7/igt@kms_psr@psr2_cursor_plane_move.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [INCOMPLETE][108] ([i915#2295]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-apl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-glk:          [DMESG-WARN][110] ([i915#2635]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-glk2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk5/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
    - shard-tglb:         [INCOMPLETE][112] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
    - shard-apl:          [DMESG-WARN][114] ([i915#2635]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
    - shard-kbl:          [DMESG-WARN][116] -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
    - shard-hsw:          [DMESG-WARN][118] ([i915#2637]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-hsw7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-hsw2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@sysfs_timeslice_duration@timeout@bcs0:
    - shard-glk:          [FAIL][120] -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-glk5/igt@sysfs_timeslice_duration@timeout@bcs0.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk2/igt@sysfs_timeslice_duration@timeout@bcs0.html

  * igt@testdisplay:
    - shard-apl:          [TIMEOUT][122] ([i915#2502]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-apl6/igt@testdisplay.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl3/igt@testdisplay.html
    - shard-kbl:          [TIMEOUT][124] ([i915#2502]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-kbl6/igt@testdisplay.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-kbl2/igt@testdisplay.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][126], [FAIL][127]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483] / [i915#602]) -> ([FAIL][128], [FAIL][129], [FAIL][130]) ([fdo#109271] / [i915#1436] / [i915#2295] / [i915#2426] / [i915#2722] / [i915#483] / [i915#716])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-kbl2/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-kbl4/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-kbl4/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-kbl1/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-kbl3/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][131], [FAIL][132], [FAIL][133]) ([i915#1814] / [i915#2295] / [i915#2426] / [i915#2722] / [i915#2724] / [i915#483]) -> ([FAIL][134], [FAIL][135]) ([i915#2295] / [i915#2722] / [i915#2724] / [i915#483])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-iclb1/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-iclb7/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-iclb6/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb1/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb2/igt@runner@aborted.html
    - shard-apl:          ([FAIL][136], [FAIL][137]) ([i915#1814] / [i915#2295] / [i915#2722]) -> ([FAIL][138], [FAIL][139]) ([i915#2295] / [i915#2722])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-apl1/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-apl2/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl8/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl3/igt@runner@aborted.html
    - shard-glk:          ([FAIL][140], [FAIL][141]) ([i915#1814] / [i915#2295] / [i915#2722] / [k.org#202321]) -> ([FAIL][142], [FAIL][143]) ([i915#2295] / [i915#2722] / [k.org#202321])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-glk9/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-glk2/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk5/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk9/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#111828]: https://bugs.freedesktop.org/show_bug.cgi?id=111828
  [fdo#112025]: https://bugs.freedesktop.org/show_bug.cgi?id=112025
  [fdo#112306]: https://bugs.freedesktop.org/show_bug.cgi?id=112306
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1187]: https://gitlab.freedesktop.org/drm/intel/issues/1187
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1567]: https://gitlab.freedesktop.org/drm/intel/issues/1567
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1704]: https://gitlab.freedesktop.org/drm/intel/issues/1704
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i91

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/index.html

--===============4962087982238547000==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/gem_userptr_blits: Rework userptr tests to copy with changes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84948/">https://patchwork.freedesktop.org/series/84948/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9484_full -&gt; IGTPW_5292_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5292_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@gem_exec_balancer@fairslice}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-iclb7/igt@gem_exec_balancer@fairslice.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb2/igt@gem_exec_balancer@fairslice.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@rcs0}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-tglb8/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb7/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5292_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-glk3/igt@gem_exec_reloc@basic-many-active@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk3/igt@gem_exec_reloc@basic-many-active@vecs0.html">FAIL</a> ([i915#2389]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl7/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb2/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-mmap-unsync@wb:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb1/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1704">i915#1704</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb5/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1704">i915#1704</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb3/igt@gen7_exec_parse@basic-allocation.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb1/igt@gen7_exec_parse@basic-allocation.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-kbl4/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-kbl3/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / [i915#716])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb2/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112306">fdo#112306</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb6/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112306">fdo#112306</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1567">i915#1567</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-hsw2/igt@i915_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-tglb6/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb3/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2681] / [i915#2684])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2681] / [i915#2684])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-hsw2/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-hsw2/igt@i915_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-tglb8/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb2/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / [i915#2411])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-glk7/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk5/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / [i915#2635])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-apl8/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl8/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / [i915#2635])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-iclb7/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb1/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-kbl4/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-kbl4/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@5x-modeset-transitions-nonblocking-fencing:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb8/igt@kms_atomic_transition@5x-modeset-transitions-nonblocking-fencing.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112025">fdo#112025</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb6/igt@kms_ccs@pipe-d-ccs-on-another-bo.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-single:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb1/igt@kms_chamelium@dp-crc-single.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-after-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl8/igt@kms_chamelium@vga-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb8/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb8/igt@kms_color@pipe-d-ctm-0-25.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a> / [i915#315])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-legacy-gamma:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk6/igt@kms_color@pipe-d-legacy-gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-max:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-green-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111828">fdo#111828</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb7/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109300">fdo#109300</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111066">fdo#111066</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x170-sliding.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-hsw7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">FAIL</a> ([i915#96])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-tglb6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> ([i915#2637]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> ([i915#2055])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-glk1/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk6/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-kbl6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#2672])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#2672])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> ([i915#2587])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#2672])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> ([i915#49]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> ([i915#49]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> ([i915#49]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +38 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-kbl7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +19 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb7/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1187">i915#1187</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1187">i915#1187</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb6/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl7/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-outp-complete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb1/igt@nouveau_crc@pipe-a-source-outp-complete.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb5/igt@nouveau_crc@pipe-a-source-outp-complete.html">SKIP</a> ([i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb8/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / [i915#2530])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_nv_sharing:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb4/igt@prime_nv_test@i915_nv_sharing.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb8/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb7/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@vcs0}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-iclb7/igt@gem_exec_schedule@u-fairslice@vcs0.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb4/igt@gem_exec_schedule@u-fairslice@vcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@vcs1}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-tglb8/igt@gem_exec_schedule@u-fairslice@vcs1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb7/igt@gem_exec_schedule@u-fairslice@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-glk5/igt@gem_exec_whisper@basic-queues-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk9/igt@gem_exec_whisper@basic-queues-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_vm_create@destroy-race}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-tglb3/igt@gem_vm_create@destroy-race.html">TIMEOUT</a> ([i915#2795]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb2/igt@gem_vm_create@destroy-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-snb5/igt@i915_suspend@fence-restore-untiled.html">DMESG-WARN</a> ([i915#42]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-snb5/igt@i915_suspend@fence-restore-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-none:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-kbl2/igt@kms_plane_lowres@pipe-a-tiling-none.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-kbl7/igt@kms_plane_lowres@pipe-a-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-none:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-none.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / [i915#78]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-kbl4/igt@kms_plane_lowres@pipe-c-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-iclb7/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-apl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">INCOMPLETE</a> ([i915#2295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-glk2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk5/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1798">i915#1798</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-tglb2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-hsw7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#2637]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-hsw2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@bcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-glk5/igt@sysfs_timeslice_duration@timeout@bcs0.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk2/igt@sysfs_timeslice_duration@timeout@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-apl6/igt@testdisplay.html">TIMEOUT</a> ([i915#2502]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl3/igt@testdisplay.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-kbl6/igt@testdisplay.html">TIMEOUT</a> ([i915#2502]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-kbl2/igt@testdisplay.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-kbl4/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / [i915#2295] / [i915#2722] / [i915#483] / [i915#602]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-kbl3/igt@runner@aborted.html">FAIL</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / [i915#2295] / [i915#2426] / [i915#2722] / [i915#483] / [i915#716])</p>
</li>
<li>
<p>shard-iclb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-iclb7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-iclb6/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / [i915#2295] / [i915#2426] / [i915#2722] / [i915#2724] / [i915#483]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-iclb2/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2722] / [i915#2724] / [i915#483])</p>
</li>
<li>
<p>shard-apl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-apl2/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / [i915#2295] / [i915#2722]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-apl3/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2722])</p>
</li>
<li>
<p>shard-glk:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-glk9/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9484/shard-glk2/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / [i915#2295] / [i915#2722] / [k.org#202321]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk5/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5292/shard-glk9/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2722] / [k.org#202321])</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<p>[i91</p>

</body>
</html>

--===============4962087982238547000==--

--===============0326737931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0326737931==--
