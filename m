Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 24 Dec 2020 16:52:08 -0000
Message-ID: <160882872899.23491.7753815582459131871@emeril.freedesktop.org>
References: <20201224110158.3560769-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201224110158.3560769-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fsoftpin=3A_Test_total_occupancy_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0525906287=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0525906287==
Content-Type: multipart/alternative;
 boundary="===============4271155999876354319=="

--===============4271155999876354319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_softpin: Test total occupancy (rev5)
URL   : https://patchwork.freedesktop.org/series/85201/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5921_full -> IGTPW_5330_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5330_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5330_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5330_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-hsw:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw1/igt@gem_eio@in-flight-contexts-10ms.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-hsw2/igt@gem_eio@in-flight-contexts-10ms.html

  
New tests
---------

  New tests have been introduced between IGT_5921_full and IGTPW_5330_full:

### New IGT tests (1) ###

  * igt@gem_softpin@full:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  

Known issues
------------

  Here are the changes found in IGTPW_5330_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@render-ccs:
    - shard-apl:          [PASS][3] -> [INCOMPLETE][4] ([i915#2405] / [i915#2499])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl2/igt@api_intel_bb@render-ccs.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl6/igt@api_intel_bb@render-ccs.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-tglb:         [PASS][5] -> [DMESG-WARN][6] ([i915#1602])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb7/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb2/igt@core_hotunplug@unbind-rebind.html
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#2283])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl4/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl2/igt@core_hotunplug@unbind-rebind.html
    - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#2283])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk9/igt@core_hotunplug@unbind-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk6/igt@core_hotunplug@unbind-rebind.html
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#2283])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl3/igt@core_hotunplug@unbind-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl4/igt@core_hotunplug@unbind-rebind.html
    - shard-iclb:         [PASS][13] -> [DMESG-WARN][14] ([i915#2283])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb2/igt@core_hotunplug@unbind-rebind.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb4/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_ctx_persistence@engines-hostile:
    - shard-hsw:          NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#1099])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-hsw1/igt@gem_ctx_persistence@engines-hostile.html

  * igt@gem_ctx_persistence@legacy-engines-cleanup:
    - shard-snb:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#1099])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-snb5/igt@gem_ctx_persistence@legacy-engines-cleanup.html

  * igt@gem_ctx_persistence@userptr:
    - shard-hsw:          NOTRUN -> [SKIP][17] ([fdo#109271]) +53 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-hsw8/igt@gem_ctx_persistence@userptr.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-iclb:         NOTRUN -> [SKIP][18] ([fdo#109313])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
    - shard-tglb:         NOTRUN -> [SKIP][19] ([fdo#109313])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb8/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_params@no-blt:
    - shard-tglb:         NOTRUN -> [SKIP][20] ([fdo#109283])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb8/igt@gem_exec_params@no-blt.html
    - shard-iclb:         NOTRUN -> [SKIP][21] ([fdo#109283])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb5/igt@gem_exec_params@no-blt.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][22] ([i915#2389])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb1/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-glk:          [PASS][23] -> [DMESG-WARN][24] ([i915#118] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk1/igt@gem_exec_whisper@basic-contexts-forked.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk4/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@gen3_render_mixed_blits:
    - shard-tglb:         NOTRUN -> [SKIP][25] ([fdo#109289])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb1/igt@gen3_render_mixed_blits.html
    - shard-iclb:         NOTRUN -> [SKIP][26] ([fdo#109289])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb2/igt@gen3_render_mixed_blits.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#579])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#579])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb8/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-apl:          NOTRUN -> [SKIP][29] ([fdo#109271]) +67 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl2/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#110725] / [fdo#111614])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb7/igt@kms_big_fb@linear-32bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#111614])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb3/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([fdo#110723])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb4/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#111615])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb8/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_chamelium@dp-hpd-storm-disable:
    - shard-glk:          NOTRUN -> [SKIP][34] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk3/igt@kms_chamelium@dp-hpd-storm-disable.html

  * igt@kms_chamelium@hdmi-hpd:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb7/igt@kms_chamelium@hdmi-hpd.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-75:
    - shard-kbl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl6/igt@kms_color_chamelium@pipe-a-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-a-gamma:
    - shard-snb:          NOTRUN -> [SKIP][37] ([fdo#109271] / [fdo#111827])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-snb6/igt@kms_color_chamelium@pipe-a-gamma.html

  * igt@kms_color_chamelium@pipe-c-ctm-limited-range:
    - shard-hsw:          NOTRUN -> [SKIP][38] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-hsw2/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-c-gamma:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb8/igt@kms_color_chamelium@pipe-c-gamma.html

  * igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes:
    - shard-apl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl6/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][41] ([i915#1319])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl8/igt@kms_content_protection@lic.html
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109300] / [fdo#111066])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb4/igt@kms_content_protection@lic.html
    - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#111828])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb8/igt@kms_content_protection@lic.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][44] ([i915#1319])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl3/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][45] -> [DMESG-WARN][46] ([i915#180])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][47] -> [DMESG-WARN][48] ([i915#1602] / [i915#2635])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-iclb:         [PASS][49] -> [DMESG-WARN][50] ([i915#1602])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-glk:          [PASS][51] -> [DMESG-WARN][52] ([i915#1602] / [i915#2635])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-hsw:          [PASS][53] -> [DMESG-WARN][54] ([i915#2637])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-hsw2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-kbl:          [PASS][55] -> [INCOMPLETE][56] ([i915#155] / [i915#2405])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-tglb:         [PASS][57] -> [INCOMPLETE][58] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-kbl:          NOTRUN -> [SKIP][59] ([fdo#109271]) +39 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl4/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-tglb:         [PASS][61] -> [FAIL][62] ([i915#2346])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109274])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb1/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][64] -> [FAIL][65] ([i915#2598])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:
    - shard-apl:          NOTRUN -> [FAIL][66] ([i915#2641])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html
    - shard-kbl:          NOTRUN -> [FAIL][67] ([i915#2641])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-snb:          NOTRUN -> [SKIP][68] ([fdo#109271]) +40 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][69] ([fdo#109271]) +57 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#111825]) +7 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109280]) +4 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([fdo#112054])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][73] -> [SKIP][74] ([fdo#109441]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb7/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109441]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb5/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle-hang:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109278]) +6 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb1/igt@kms_vblank@pipe-d-ts-continuation-idle-hang.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-kbl:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#533])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl6/igt@kms_vblank@pipe-d-wait-idle.html
    - shard-apl:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#533])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl8/igt@kms_vblank@pipe-d-wait-idle.html
    - shard-glk:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#533])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk6/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-glk:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#2437])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk5/igt@kms_writeback@writeback-pixel-formats.html
    - shard-apl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#2437])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl6/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@polling-parameterized:
    - shard-apl:          [PASS][82] -> [FAIL][83] ([i915#1542])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl2/igt@perf@polling-parameterized.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl7/igt@perf@polling-parameterized.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-glk:          [DMESG-WARN][84] ([i915#2283]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk8/igt@device_reset@unbind-reset-rebind.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk6/igt@device_reset@unbind-reset-rebind.html
    - shard-apl:          [DMESG-WARN][86] ([i915#2283]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl7/igt@device_reset@unbind-reset-rebind.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl8/igt@device_reset@unbind-reset-rebind.html
    - shard-kbl:          [DMESG-WARN][88] ([i915#2283]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl6/igt@device_reset@unbind-reset-rebind.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl6/igt@device_reset@unbind-reset-rebind.html
    - shard-hsw:          [DMESG-WARN][90] ([i915#2283]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw2/igt@device_reset@unbind-reset-rebind.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-hsw8/igt@device_reset@unbind-reset-rebind.html

  * {igt@gem_exec_balancer@fairslice}:
    - shard-iclb:         [FAIL][92] ([i915#2802]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb1/igt@gem_exec_balancer@fairslice.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb7/igt@gem_exec_balancer@fairslice.html

  * {igt@gem_exec_fair@basic-flow@rcs0}:
    - shard-tglb:         [FAIL][94] ([i915#2842]) -> [PASS][95] +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html
    - shard-glk:          [FAIL][96] ([i915#2842]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk7/igt@gem_exec_fair@basic-flow@rcs0.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk1/igt@gem_exec_fair@basic-flow@rcs0.html

  * {igt@gem_exec_fair@basic-none-share@rcs0}:
    - shard-iclb:         [FAIL][98] ([i915#2842]) -> [PASS][99] +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * {igt@gem_exec_fair@basic-none@rcs0}:
    - shard-kbl:          [FAIL][100] ([i915#2842]) -> [PASS][101] +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl6/igt@gem_exec_fair@basic-none@rcs0.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl7/igt@gem_exec_fair@basic-none@rcs0.html

  * {igt@gem_exec_fair@basic-pace-share@rcs0}:
    - shard-apl:          [FAIL][102] ([i915#2842]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl4/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][104] ([i915#2389]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk4/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * {igt@gem_exec_schedule@u-fairslice@rcs0}:
    - shard-apl:          [DMESG-WARN][106] ([i915#1610]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl8/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl1/igt@gem_exec_schedule@u-fairslice@rcs0.html
    - shard-glk:          [DMESG-WARN][108] ([i915#1610]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk1/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk1/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-snb:          [INCOMPLETE][110] ([i915#2055]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-snb4/igt@gem_fenced_exec_thrash@no-spare-fences.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-snb2/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][112] ([i915#2745]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb5/igt@i915_pm_dc@dc5-dpms.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb4/igt@i915_pm_dc@dc5-dpms.html
    - shard-glk:          [FAIL][114] ([i915#2745]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk1/igt@i915_pm_dc@dc5-dpms.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk1/igt@i915_pm_dc@dc5-dpms.html
    - shard-apl:          [FAIL][116] ([i915#2745]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl1/igt@i915_pm_dc@dc5-dpms.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl8/igt@i915_pm_dc@dc5-dpms.html
    - shard-kbl:          [FAIL][118] ([i915#545]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl1/igt@i915_pm_dc@dc5-dpms.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl7/igt@i915_pm_dc@dc5-dpms.html
    - shard-tglb:         [FAIL][120] ([i915#2745]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb5/igt@i915_pm_dc@dc5-dpms.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb1/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [WARN][122] ([i915#1519]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-hsw8/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-glk:          [SKIP][124] ([fdo#109271]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk1/igt@i915_pm_rpm@gem-execbuf-stress.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk1/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-apl:          [SKIP][126] ([fdo#109271]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl1/igt@i915_pm_rpm@gem-execbuf-stress.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl1/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-kbl:          [SKIP][128] ([fdo#109271]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl1/igt@i915_pm_rpm@gem-execbuf-stress.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl6/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-hsw:          [SKIP][130] ([fdo#109271]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw8/igt@i915_pm_rpm@gem-execbuf-stress.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-hsw4/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-iclb:         [SKIP][132] ([i915#579]) -> [PASS][133] +1 similar issue
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb5/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb8/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
    - shard-tglb:         [SKIP][134] ([i915#579]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb5/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb3/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_color@pipe-b-degamma:
    - shard-kbl:          [FAIL][136] ([i915#71]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl3/igt@kms_color@pipe-b-degamma.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl1/igt@kms_color@pipe-b-degamma.html
    - shard-apl:          [FAIL][138] ([i915#71]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl7/igt@kms_color@pipe-b-degamma.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl2/igt@kms_color@pipe-b-degamma.html
    - shard-glk:          [FAIL][140] ([i915#71]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk6/igt@kms_color@pipe-b-degamma.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk4/igt@kms_color@pipe-b-degamma.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][142] -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
    - shard-tglb:         [INCOMPLETE][144] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [FAIL][146] ([i915#96]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-hsw:          [FAIL][148] ([i915#2370]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [INCOMPLETE][150] ([i915#155]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
    - shard-apl:          [DMESG-WARN][152] ([i915#2635]) -> [PASS][153] +1 similar issue
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - shard-tglb:         [DMESG-WARN][154] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb8/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb3/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][156] ([i915#2637]) -> [PASS][157] +6 similar issues
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
    - shard-glk:          [DMESG-WARN][158] ([i915#2635]) -> [PASS][159] +1 similar issue
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/index.html

--===============4271155999876354319==
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
<tr><td><b>Series:</b></td><td>i915/gem_softpin: Test total occupancy (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85201/">https://patchwork.freedesktop.org/series/85201/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5921_full -&gt; IGTPW_5330_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5330_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5330_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5330_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_eio@in-flight-contexts-10ms:<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw1/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-hsw2/igt@gem_eio@in-flight-contexts-10ms.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_5921_full and IGTPW_5330_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gem_softpin@full:<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5330_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl2/igt@api_intel_bb@render-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl6/igt@api_intel_bb@render-ccs.html">INCOMPLETE</a> ([i915#2405] / [i915#2499])</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#1602])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl4/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#2283])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk9/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk6/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#2283])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl3/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl4/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#2283])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb4/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#2283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-hsw1/igt@gem_ctx_persistence@engines-hostile.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-cleanup:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-snb5/igt@gem_ctx_persistence@legacy-engines-cleanup.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@userptr:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-hsw8/igt@gem_ctx_persistence@userptr.html">SKIP</a> ([fdo#109271]) +53 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb8/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb8/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb5/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb1/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk1/igt@gem_exec_whisper@basic-contexts-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk4/igt@gem_exec_whisper@basic-contexts-forked.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_mixed_blits:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb1/igt@gen3_render_mixed_blits.html">SKIP</a> ([fdo#109289])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb2/igt@gen3_render_mixed_blits.html">SKIP</a> ([fdo#109289])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb8/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#579])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl2/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#109271]) +67 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb7/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb3/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> ([fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb4/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#110723])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb8/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#111615])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm-disable:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk3/igt@kms_chamelium@dp-hpd-storm-disable.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb7/igt@kms_chamelium@hdmi-hpd.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-75:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl6/igt@kms_color_chamelium@pipe-a-ctm-0-75.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-gamma:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-snb6/igt@kms_color_chamelium@pipe-a-gamma.html">SKIP</a> ([fdo#109271] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-limited-range:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-hsw2/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-gamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb8/igt@kms_color_chamelium@pipe-c-gamma.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl6/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl8/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb4/igt@kms_content_protection@lic.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb8/igt@kms_content_protection@lic.html">SKIP</a> ([fdo#111828])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl3/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> ([i915#1602] / [i915#2635])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> ([i915#1602])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> ([i915#1602] / [i915#2635])</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-hsw2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> ([i915#2637])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> ([i915#155] / [i915#2405])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl4/igt@kms_cursor_crc@pipe-d-cursor-suspend.html">SKIP</a> ([fdo#109271]) +39 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb1/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> ([i915#2598])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html">FAIL</a> ([i915#2641])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html">FAIL</a> ([i915#2641])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> ([fdo#109271]) +40 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +57 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#111825]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#109280]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html">SKIP</a> ([fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb7/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb5/igt@kms_psr@psr2_primary_blt.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb1/igt@kms_vblank@pipe-d-ts-continuation-idle-hang.html">SKIP</a> ([fdo#109278]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl6/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl8/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk6/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk5/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl6/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl2/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl7/igt@perf@polling-parameterized.html">FAIL</a> ([i915#1542])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk8/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> ([i915#2283]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk6/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl7/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> ([i915#2283]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl8/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl6/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> ([i915#2283]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl6/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw2/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> ([i915#2283]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-hsw8/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_balancer@fairslice}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb1/igt@gem_exec_balancer@fairslice.html">FAIL</a> ([i915#2802]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb7/igt@gem_exec_balancer@fairslice.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-flow@rcs0}:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk7/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk1/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none-share@rcs0}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none@rcs0}:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl6/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl7/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace-share@rcs0}:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl4/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk4/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@rcs0}:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl8/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> ([i915#1610]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl1/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk1/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> ([i915#1610]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk1/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-snb4/igt@gem_fenced_exec_thrash@no-spare-fences.html">INCOMPLETE</a> ([i915#2055]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-snb2/igt@gem_fenced_exec_thrash@no-spare-fences.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-dpms:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb5/igt@i915_pm_dc@dc5-dpms.html">FAIL</a> ([i915#2745]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb4/igt@i915_pm_dc@dc5-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk1/igt@i915_pm_dc@dc5-dpms.html">FAIL</a> ([i915#2745]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk1/igt@i915_pm_dc@dc5-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl1/igt@i915_pm_dc@dc5-dpms.html">FAIL</a> ([i915#2745]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl8/igt@i915_pm_dc@dc5-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl1/igt@i915_pm_dc@dc5-dpms.html">FAIL</a> ([i915#545]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl7/igt@i915_pm_dc@dc5-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb5/igt@i915_pm_dc@dc5-dpms.html">FAIL</a> ([i915#2745]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb1/igt@i915_pm_dc@dc5-dpms.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-hsw8/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk1/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk1/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl1/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl1/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl1/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl6/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw8/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-hsw4/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb5/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-iclb8/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb5/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb3/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-degamma:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl3/igt@kms_color@pipe-b-degamma.html">FAIL</a> ([i915#71]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl1/igt@kms_color@pipe-b-degamma.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl7/igt@kms_color@pipe-b-degamma.html">FAIL</a> ([i915#71]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl2/igt@kms_color@pipe-b-degamma.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk6/igt@kms_color@pipe-b-degamma.html">FAIL</a> ([i915#71]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk4/igt@kms_color@pipe-b-degamma.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">INCOMPLETE</a> ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">FAIL</a> ([i915#96]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">FAIL</a> ([i915#2370]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">INCOMPLETE</a> ([i915#155]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb8/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">DMESG-WARN</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-tglb3/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> ([i915#2637]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> +6 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> ([i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5330/shard-glk1">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============4271155999876354319==--

--===============0525906287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0525906287==--
