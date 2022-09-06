Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4634406347208919625=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Date: Tue, 06 Sep 2022 14:03:01 -0000
Message-ID: <166247298101.8881.209145004365367778@emeril.freedesktop.org>
References: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdG9vbHMv?=
 =?utf-8?q?intel=5Fvbt=5Fdecode=3A_Improve_VBT_decoder_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============4634406347208919625==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools/intel_vbt_decode: Improve VBT decoder (rev2)
URL   : https://patchwork.freedesktop.org/series/106398/
State : success

== Summary ==

CI Bug Log - changes from IGT_6646_full -> IGTPW_7742_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7742_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:
    - {shard-dg1}:        NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html

  
New tests
---------

  New tests have been introduced between IGT_6646_full and IGTPW_7742_full:

### New IGT tests (16) ###

  * igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.51] s

  * igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.38] s

  * igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.40] s

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [5.71] s

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [5.62] s

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [5.48] s

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [5.53] s

  * igt@kms_cursor_crc@cursor-sliding-64x64@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [5.76] s

  * igt@kms_cursor_crc@cursor-sliding-64x64@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [5.38] s

  * igt@kms_cursor_crc@cursor-sliding-64x64@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [5.60] s

  * igt@kms_cursor_crc@cursor-sliding-64x64@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [5.43] s

  * igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_flip@basic-flip-vs-modeset@d-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  

Known issues
------------

  Here are the changes found in IGTPW_7742_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@close-race:
    - shard-snb:          [PASS][2] -> [TIMEOUT][3] ([i915#5748])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-snb4/igt@gem_busy@close-race.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-snb2/igt@gem_busy@close-race.html

  * igt@gem_eio@kms:
    - shard-tglb:         [PASS][4] -> [FAIL][5] ([i915#5784]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-tglb6/igt@gem_eio@kms.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglb5/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [PASS][6] -> [TIMEOUT][7] ([i915#3070])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-iclb5/igt@gem_eio@unwedge-stress.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([i915#4525]) +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb8/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [PASS][10] -> [FAIL][11] ([i915#2846])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-glk9/igt@gem_exec_fair@basic-deadline.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-glk3/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-glk:          [PASS][12] -> [FAIL][13] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-glk1/igt@gem_exec_fair@basic-none@vecs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-glk9/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][14] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][15] -> [SKIP][16] ([i915#2190])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-tglb1/igt@gem_huc_copy@huc-copy.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglb7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@verify:
    - shard-apl:          NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#4613])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-apl4/igt@gem_lmem_swapping@verify.html
    - shard-glk:          NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#4613])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-glk3/igt@gem_lmem_swapping@verify.html

  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][19] ([i915#768])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][20] -> [DMESG-WARN][21] ([i915#5566] / [i915#716])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-glk2/igt@gen9_exec_parse@allowed-all.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-glk9/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-tglb:         [PASS][22] -> [FAIL][23] ([i915#3989])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-tglb6/igt@i915_pm_dc@dc5-psr.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglb7/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][24] -> [FAIL][25] ([i915#454]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [PASS][26] -> [SKIP][27] ([i915#4281])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_suspend@debugfs-reader:
    - shard-apl:          [PASS][28] -> [DMESG-WARN][29] ([i915#180]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-apl4/igt@i915_suspend@debugfs-reader.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-apl7/igt@i915_suspend@debugfs-reader.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-apl:          NOTRUN -> [SKIP][30] ([fdo#109271]) +46 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-apl7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#5286]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglb1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
    - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#5286]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#3886]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-apl4/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#3689] / [i915#3886])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglb6/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#109278] / [i915#3886])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb8/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#3886]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-glk2/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#6095])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglb6/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([fdo#109278]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb1/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs.html

  * igt@kms_chamelium@dp-hpd-after-suspend:
    - shard-apl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-apl6/igt@kms_chamelium@dp-hpd-after-suspend.html
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#109284] / [fdo#111827])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglb7/igt@kms_chamelium@dp-hpd-after-suspend.html
    - shard-glk:          NOTRUN -> [SKIP][41] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-glk6/igt@kms_chamelium@dp-hpd-after-suspend.html
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109284] / [fdo#111827])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb2/igt@kms_chamelium@dp-hpd-after-suspend.html
    - shard-snb:          NOTRUN -> [SKIP][43] ([fdo#109271] / [fdo#111827])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-snb4/igt@kms_chamelium@dp-hpd-after-suspend.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          NOTRUN -> [TIMEOUT][44] ([i915#1319])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-apl8/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][45] -> [FAIL][46] ([i915#72])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#109274] / [fdo#111825])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglb5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109274])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
    - shard-glk:          [PASS][49] -> [FAIL][50] ([i915#2346])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([i915#2672]) +10 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([i915#3555]) +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([i915#2672] / [i915#3555])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109280]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#109280] / [fdo#111825]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][56] ([fdo#109271]) +43 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-glk9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][57] -> [SKIP][58] ([i915#433])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#3555])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglb2/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-glk:          NOTRUN -> [SKIP][60] ([fdo#109271] / [i915#658])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-glk9/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-apl:          NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#658])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-apl6/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-tglb:         NOTRUN -> [FAIL][62] ([i915#132] / [i915#3467])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglb2/igt@kms_psr@psr2_cursor_plane_move.html
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109441])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb4/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-iclb:         [PASS][64] -> [SKIP][65] ([i915#5519])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-iclb3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglb:         [PASS][66] -> [SKIP][67] ([i915#5519])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-tglb5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglb5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_vblank@pipe-c-wait-forked-hang:
    - shard-apl:          [PASS][68] -> [SKIP][69] ([fdo#109271])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-apl2/igt@kms_vblank@pipe-c-wait-forked-hang.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-apl6/igt@kms_vblank@pipe-c-wait-forked-hang.html
    - shard-glk:          [PASS][70] -> [SKIP][71] ([fdo#109271])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-glk1/igt@kms_vblank@pipe-c-wait-forked-hang.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-glk6/igt@kms_vblank@pipe-c-wait-forked-hang.html

  * igt@perf@stress-open-close:
    - shard-glk:          [PASS][72] -> [INCOMPLETE][73] ([i915#5213])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-glk7/igt@perf@stress-open-close.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-glk9/igt@perf@stress-open-close.html

  * igt@sysfs_clients@sema-50:
    - shard-snb:          NOTRUN -> [SKIP][74] ([fdo#109271]) +54 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-snb2/igt@sysfs_clients@sema-50.html
    - shard-apl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#2994])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-apl2/igt@sysfs_clients@sema-50.html
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#2994])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglb3/igt@sysfs_clients@sema-50.html
    - shard-glk:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#2994])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-glk5/igt@sysfs_clients@sema-50.html
    - shard-iclb:         NOTRUN -> [SKIP][78] ([i915#2994])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb3/igt@sysfs_clients@sema-50.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-write:
    - {shard-rkl}:        [SKIP][79] ([i915#2582]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-rkl-4/igt@fbdev@unaligned-write.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-6/igt@fbdev@unaligned-write.html

  * igt@gem_ctx_persistence@hang:
    - {shard-rkl}:        [SKIP][81] ([i915#6252]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-rkl-5/igt@gem_ctx_persistence@hang.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-1/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@many-contexts:
    - {shard-rkl}:        [FAIL][83] ([i915#2410]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-rkl-1/igt@gem_ctx_persistence@many-contexts.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-5/igt@gem_ctx_persistence@many-contexts.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-glk:          [TIMEOUT][85] ([i915#3063]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-glk5/igt@gem_eio@in-flight-contexts-1us.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-glk2/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_eio@in-flight-contexts-immediate:
    - {shard-rkl}:        [TIMEOUT][87] ([i915#3063] / [i915#6637]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-rkl-6/igt@gem_eio@in-flight-contexts-immediate.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-1/igt@gem_eio@in-flight-contexts-immediate.html

  * igt@gem_eio@reset-stress:
    - shard-tglb:         [FAIL][89] ([i915#5784]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-tglb1/igt@gem_eio@reset-stress.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglb1/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - {shard-tglu}:       [TIMEOUT][91] ([i915#3063]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-tglu-5/igt@gem_eio@unwedge-stress.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglu-2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [SKIP][93] ([i915#4525]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-iclb7/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb2/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][95] ([i915#2842]) -> [PASS][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [FAIL][97] ([i915#2842]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-apl8/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - {shard-rkl}:        [FAIL][99] ([i915#2842]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-rkl-2/igt@gem_exec_fair@basic-pace@vecs0.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-5/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][101] ([i915#2842]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_reloc@basic-write-read:
    - {shard-rkl}:        [SKIP][103] ([i915#3281]) -> [PASS][104] +9 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-rkl-2/igt@gem_exec_reloc@basic-write-read.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_schedule@semaphore-power:
    - {shard-rkl}:        [SKIP][105] ([fdo#110254]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_mmap_wc@set-cache-level:
    - {shard-rkl}:        [SKIP][107] ([i915#1850]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-rkl-1/igt@gem_mmap_wc@set-cache-level.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-6/igt@gem_mmap_wc@set-cache-level.html

  * igt@gem_pread@snoop:
    - {shard-rkl}:        [SKIP][109] ([i915#3282]) -> [PASS][110] +2 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-rkl-1/igt@gem_pread@snoop.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-5/igt@gem_pread@snoop.html

  * igt@gem_softpin@evict-single-offset:
    - shard-tglb:         [FAIL][111] ([i915#4171]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-tglb1/igt@gem_softpin@evict-single-offset.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglb2/igt@gem_softpin@evict-single-offset.html
    - shard-iclb:         [FAIL][113] ([i915#4171]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-iclb4/igt@gem_softpin@evict-single-offset.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb6/igt@gem_softpin@evict-single-offset.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [DMESG-WARN][115] ([i915#5566] / [i915#716]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-apl8/igt@gen9_exec_parse@allowed-single.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-apl1/igt@gen9_exec_parse@allowed-single.html
    - shard-glk:          [DMESG-WARN][117] ([i915#5566] / [i915#716]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-glk9/igt@gen9_exec_parse@allowed-single.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-glk1/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@basic-rejected:
    - {shard-rkl}:        [SKIP][119] ([i915#2527]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-rkl-1/igt@gen9_exec_parse@basic-rejected.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-5/igt@gen9_exec_parse@basic-rejected.html

  * igt@i915_hangman@engine-engine-error@bcs0:
    - {shard-rkl}:        [SKIP][121] ([i915#6258]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-rkl-5/igt@i915_hangman@engine-engine-error@bcs0.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-4/igt@i915_hangman@engine-engine-error@bcs0.html

  * igt@i915_pm_dc@dc6-psr:
    - {shard-rkl}:        [SKIP][123] ([i915#658]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-rkl-1/igt@i915_pm_dc@dc6-psr.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - {shard-dg1}:        [SKIP][125] ([i915#1397]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-dg1-19/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-dg1-15/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          [INCOMPLETE][127] ([i915#3921]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-snb5/igt@i915_selftest@live@hangcheck.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-snb6/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@perf@engine_cs:
    - shard-tglb:         [DMESG-WARN][129] ([i915#2867]) -> [PASS][130] +3 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-tglb3/igt@i915_selftest@perf@engine_cs.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglb1/igt@i915_selftest@perf@engine_cs.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-iclb:         [FAIL][131] ([i915#1888]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-iclb6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - {shard-rkl}:        [SKIP][133] ([i915#1845] / [i915#4098]) -> [PASS][134] +17 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-rkl-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - {shard-rkl}:        [SKIP][135] ([i915#4098]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-rkl-4/igt@kms_fbcon_fbt@fbc-suspend.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:
    - shard-iclb:         [DMESG-WARN][137] ([i915#2867]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-iclb1/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb4/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-glk:          [FAIL][139] ([i915#1888] / [i915#2546]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - {shard-rkl}:        [SKIP][141] ([i915#1849] / [i915#4098]) -> [PASS][142] +10 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-2:
    - shard-glk:          [FAIL][143] -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-glk2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-2.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-glk1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-2.html

  * igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant:
    - {shard-rkl}:        [SKIP][145] ([i915#3546] / [i915#4098]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-rkl-4/igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1:
    - shard-iclb:         [SKIP][147] ([i915#5235]) -> [PASS][148] +2 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-iclb:         [SKIP][149] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-iclb7/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@cursor_render:
    - {shard-rkl}:        [SKIP][151] ([i915#1072]) -> [PASS][152] +2 similar issues
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-rkl-4/igt@kms_psr@cursor_render.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-6/igt@kms_psr@cursor_render.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-b:
    - {shard-rkl}:        [SKIP][153] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-rkl-1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-b.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-b.html

  * igt@perf@gen12-oa-tlb-invalidate:
    - {shard-rkl}:        [SKIP][155] ([fdo#109289]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-rkl-5/igt@perf@gen12-oa-tlb-invalidate.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-6/igt@perf@gen12-oa-tlb-invalidate.html

  * igt@perf@polling-small-buf:
    - {shard-rkl}:        [FAIL][157] ([i915#1722]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-rkl-4/igt@perf@polling-small-buf.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-5/igt@perf@polling-small-buf.html

  * igt@prime_vgem@basic-read:
    - {shard-rkl}:        [SKIP][159] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-rkl-4/igt@prime_vgem@basic-read.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-5/igt@prime_vgem@basic-read.html

  * igt@sysfs_heartbeat_interval@precise@vcs0:
    - {shard-rkl}:        [FAIL][161] ([i915#1755]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-rkl-5/igt@sysfs_heartbeat_interval@precise@vcs0.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-4/igt@sysfs_heartbeat_interval@precise@vcs0.html

  * igt@testdisplay:
    - {shard-tglu}:       [DMESG-WARN][163] ([i915#4941]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-tglu-4/igt@testdisplay.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglu-1/igt@testdisplay.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [FAIL][165] ([i915#6117]) -> [SKIP][166] ([i915#4525])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][167] ([i915#658]) -> [SKIP][168] ([i915#2920])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-iclb3/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-iclb:         [SKIP][169] ([fdo#111068] / [i915#658]) -> [SKIP][170] ([i915#2920])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-iclb6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-iclb:         [SKIP][171] ([i915#2920]) -> [SKIP][172] ([i915#658])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-iclb:         [FAIL][173] ([i915#5939]) -> [SKIP][174] ([fdo#109642] / [fdo#111068] / [i915#658])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb6/igt@kms_psr2_su@page_flip-p010.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][175], [FAIL][176], [FAIL][177]) ([fdo#109271] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#6599]) -> ([FAIL][178], [FAIL][179], [FAIL][180], [FAIL][181], [FAIL][182]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#6599])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-apl8/igt@runner@aborted.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-apl3/igt@runner@aborted.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-apl1/igt@runner@aborted.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-apl8/igt@runner@aborted.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-apl4/igt@runner@aborted.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-apl7/igt@runner@aborted.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-apl3/igt@runner@aborted.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-apl2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2232]: https://gitlab.freedesktop.org/drm/intel/issues/2232
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3070]: https://gitlab.freedesktop.org/drm/intel/issues/3070
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3639]: https://gitlab.freedesktop.org/drm/intel/issues/3639
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4883]: https://gitlab.freedesktop.org/drm/intel/issues/4883
  [i915#4941]: https://gitlab.freedesktop.org/drm/intel/issues/4941
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5030]: https://gitlab.freedesktop.org/drm/intel/issues/5030
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5213]: https://gitlab.freedesktop.org/drm/intel/issues/5213
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5748]: https://gitlab.freedesktop.org/drm/intel/issues/5748
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6011]: https://gitlab.freedesktop.org/drm/intel/issues/6011
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6331]: https://gitlab.freedesktop.org/drm/intel/issues/6331
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6355]: https://gitlab.freedesktop.org/drm/intel/issues/6355
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6458]: https://gitlab.freedesktop.org/drm/intel/issues/6458
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6599]: https://gitlab.freedesktop.org/drm/intel/issues/6599
  [i915#6637]: https://gitlab.freedesktop.org/drm/intel/issues/6637
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6646 -> IGTPW_7742

  CI-20190529: 20190529
  CI_DRM_12074: c16b937da799ddbebf0d940aff159b96ce9fec0f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7742: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/index.html
  IGT_6646: c1f420ae84b76079cd32ac014cfdf95b5f2922f7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/index.html

--===============4634406347208919625==
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
<tr><td><b>Series:</b></td><td>tools/intel_vbt_decode: Improve VBT decoder =
(rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/106398/">https://patchwork.freedesktop.org/series/106398/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7742/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6646_full -&gt; IGTPW_7742_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/index.=
html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7742=
_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@p=
ipe-a-valid-mode:<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7742/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-li=
near-to-64bpp-linear-downscaling@pipe-a-valid-mode.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6646_full and IGTPW_7742_full=
:</p>
<h3>New IGT tests (16)</h3>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7742_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_busy@close-race:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-snb4/igt@gem_busy@close-race.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-snb2/igt@gem_=
busy@close-race.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/5748">i915#5748</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-tglb6/igt@gem_eio@kms.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglb5/igt@gem_eio@kms.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
5784">i915#5784</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-iclb5/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb7/igt@g=
em_eio@unwedge-stress.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3070">i915#3070</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shar=
d-iclb8/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) +2 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-glk9/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-glk3/i=
gt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-glk1/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-glk9=
/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7742/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-tglb1/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglb7/igt@ge=
m_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/shard-apl4/igt@gem_lmem_swapping@verify.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/461=
3">i915#4613</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/shard-glk3/igt@gem_lmem_swapping@verify.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/461=
3">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7742/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-y=
-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/768">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-glk2/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-glk9/ig=
t@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-tglb6/igt@i915_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglb7/igt@i91=
5_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3989">i915#3989</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb3/igt@i91=
5_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/454">i915#454</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb3/igt@i91=
5_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4281">i915#4281</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-apl4/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-apl7/ig=
t@i915_suspend@debugfs-reader.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +3 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7742/shard-apl7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a>) +46 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/shard-tglb1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
5286">i915#5286</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/shard-iclb2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
5286">i915#5286</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/shard-apl4/igt@kms_ccs@pipe-b-bad-aux-stride-y_tile=
d_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/shard-tglb6/igt@kms_ccs@pipe-b-bad-aux-stride-y_til=
ed_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/shard-iclb8/igt@kms_ccs@pipe-b-bad-aux-stride-y_til=
ed_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7742/shard-glk2/igt@kms_ccs@pipe-b-bad-rotation-90-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7742/shard-tglb6/igt@kms_ccs@pipe-b-crc-sprite-planes-b=
asic-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7742/shard-iclb1/igt@kms_ccs@pipe-c-crc-primary-rotatio=
n-180-y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109278">fdo#109278</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-after-suspend:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/shard-apl6/igt@kms_chamelium@dp-hpd-after-suspend.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/shard-tglb7/igt@kms_chamelium@dp-hpd-after-suspend.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/shard-glk6/igt@kms_chamelium@dp-hpd-after-suspend.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/shard-iclb2/igt@kms_chamelium@dp-hpd-after-suspend.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/shard-snb4/igt@kms_chamelium@dp-hpd-after-suspend.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7742/shard-apl8/igt@kms_content_protection@legacy.html"=
>TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
19">i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7742/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/72">i=
915#72</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/shard-tglb5/igt@kms_cursor_legacy@2x-long-flip-vs-c=
ursor-legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D111825">fdo#111825</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/shard-iclb1/igt@kms_cursor_legacy@2x-long-flip-vs-c=
ursor-legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109274">fdo#109274</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transition=
s-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@ato=
mic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7742/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</=
a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7742/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-lin=
ear-to-32bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7742/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#355=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7742/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7742/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7742/shard-glk9/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +43 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglb6=
/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7742/shard-tglb2/igt@kms_hdr@bpc-switch-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i=
915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/shard-glk9/igt@kms_psr2_su@frontbuffer-xrgb8888.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/shard-apl6/igt@kms_psr2_su@frontbuffer-xrgb8888.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/shard-tglb2/igt@kms_psr@psr2_cursor_plane_move.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132"=
>i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
3467">i915#3467</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/shard-iclb4/igt@kms_psr@psr2_cursor_plane_move.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10944=
1">fdo#109441</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-iclb3/igt@kms_psr_stress_test@flip-primary-invalidate-overl=
ay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7742/shard-iclb5/igt@kms_psr_stress_test@flip-primary-invalidate-ove=
rlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/5519">i915#5519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-tglb5/igt@kms_psr_stress_test@invalidate-primary-flip-overl=
ay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7742/shard-tglb5/igt@kms_psr_stress_test@invalidate-primary-flip-ove=
rlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/5519">i915#5519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-forked-hang:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6646/shard-apl2/igt@kms_vblank@pipe-c-wait-forked-hang.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-a=
pl6/igt@kms_vblank@pipe-c-wait-forked-hang.html">SKIP</a> (<a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6646/shard-glk1/igt@kms_vblank@pipe-c-wait-forked-hang.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-g=
lk6/igt@kms_vblank@pipe-c-wait-forked-hang.html">SKIP</a> (<a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-glk7/igt@perf@stress-open-close.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-glk9/igt@per=
f@stress-open-close.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/5213">i915#5213</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-50:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/shard-snb2/igt@sysfs_clients@sema-50.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a>) +54 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/shard-apl2/igt@sysfs_clients@sema-50.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/shard-tglb3/igt@sysfs_clients@sema-50.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/shard-glk5/igt@sysfs_clients@sema-50.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7742/shard-iclb3/igt@sysfs_clients@sema-50.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-rkl-4/igt@fbdev@unaligned-write.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-6/=
igt@fbdev@unaligned-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-rkl-5/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/6252">i915#6252</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rk=
l-1/igt@gem_ctx_persistence@hang.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-rkl-1/igt@gem_ctx_persistence@many-contexts.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/=
shard-rkl-5/igt@gem_ctx_persistence@many-contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-glk5/igt@gem_eio@in-flight-contexts-1us.html">TIMEOUT</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/s=
hard-glk2/igt@gem_eio@in-flight-contexts-1us.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-immediate:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-rkl-6/igt@gem_eio@in-flight-contexts-immediate.html">TIMEOU=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i91=
5#3063</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/663=
7">i915#6637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7742/shard-rkl-1/igt@gem_eio@in-flight-contexts-immediate.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-tglb1/igt@gem_eio@reset-stress.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglb1/i=
gt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-tglu-5/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-t=
glu-2/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-iclb7/igt@gem_exec_balancer@parallel-keep-submit-fence.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525=
">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7742/shard-iclb2/igt@gem_exec_balancer@parallel-keep-submit-fence.htm=
l">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#284=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742=
/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/=
shard-apl8/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-rkl-2/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/sha=
rd-rkl-5/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/=
shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-rkl-2/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/sh=
ard-rkl-5/igt@gem_exec_reloc@basic-write-read.html">PASS</a> +9 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110254">fdo#1102=
54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_774=
2/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@set-cache-level:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-rkl-1/igt@gem_mmap_wc@set-cache-level.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1850">i915#1850</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-=
rkl-6/igt@gem_mmap_wc@set-cache-level.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-rkl-1/igt@gem_pread@snoop.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-5/igt@ge=
m_pread@snoop.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6646/shard-tglb1/igt@gem_softpin@evict-single-offset.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171">i915#4171</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/sha=
rd-tglb2/igt@gem_softpin@evict-single-offset.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6646/shard-iclb4/igt@gem_softpin@evict-single-offset.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171">i915#4171</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/sha=
rd-iclb6/igt@gem_softpin@evict-single-offset.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6646/shard-apl8/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#556=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i91=
5#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7742/shard-apl1/igt@gen9_exec_parse@allowed-single.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6646/shard-glk9/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#556=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i91=
5#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7742/shard-glk1/igt@gen9_exec_parse@allowed-single.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-rkl-1/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/sha=
rd-rkl-5/igt@gen9_exec_parse@basic-rejected.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-error@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-rkl-5/igt@i915_hangman@engine-engine-error@bcs0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6258">i915#=
6258</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
742/shard-rkl-4/igt@i915_hangman@engine-engine-error@bcs0.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-rkl-1/igt@i915_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-6/igt@i=
915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-dg1-19/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#=
1397</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
742/shard-dg1-15/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-snb5/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/=
shard-snb6/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf@engine_cs:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-tglb3/igt@i915_selftest@perf@engine_cs.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#286=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742=
/shard-tglb1/igt@i915_selftest@perf@engine_cs.html">PASS</a> +3 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-iclb6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/=
shard-iclb8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-rkl-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180=
-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7742/shard-rkl-6/igt@kms_big_fb@y-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip.html">PASS</a> +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-rkl-4/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rk=
l-6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-iclb1/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2867">i915#2867</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7742/shard-iclb4/igt@kms_flip@flip-vs-suspend-interruptible@c-=
edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb=
-draw-mmap-cpu.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1888">i915#1888</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2546">i915#2546</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7742/shard-glk3/igt@kms_frontbuffer_tracking=
@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7742/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-rgb565-dra=
w-render.html">PASS</a> +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-2:</=
p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-glk2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@=
pipe-b-hdmi-a-2.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7742/shard-glk1/igt@kms_pipe_crc_basic@nonblocking-crc-=
frame-sequence@pipe-b-hdmi-a-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-rkl-4/igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-=
vs-constant.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/3546">i915#3546</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-6/igt@kms_plane_alpha_blend@pipe=
-b-coverage-vs-premult-vs-constant.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-down=
scale-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/5235">i915#5235</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-iclb7/igt@kms_plane_scal=
ing@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html">PASS=
</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-iclb7/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#10964=
2</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">f=
do#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7742/shard-iclb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_render:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-rkl-4/igt@kms_psr@cursor_render.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-6/=
igt@kms_psr@cursor_render.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-b:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-rkl-1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-=
b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7742/shard-rkl-6/igt@kms_universal_plane@disable-pr=
imary-vs-flip-pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@gen12-oa-tlb-invalidate:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-rkl-5/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo#109289</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/sha=
rd-rkl-6/igt@perf@gen12-oa-tlb-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-rkl-4/igt@perf@polling-small-buf.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1722">i915#1722</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-rkl-5=
/igt@perf@polling-small-buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-rkl-4/igt@prime_vgem@basic-read.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">fdo#109295</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#37=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_774=
2/shard-rkl-5/igt@prime_vgem@basic-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-rkl-5/igt@sysfs_heartbeat_interval@precise@vcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1755">i915#=
1755</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
742/shard-rkl-4/igt@sysfs_heartbeat_interval@precise@vcs0.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-tglu-4/igt@testdisplay.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/4941">i915#4941</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-tglu-1/ig=
t@testdisplay.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i915#61=
17</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_774=
2/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-iclb3/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-s=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7742/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exc=
eed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-iclb6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7742/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dm=
g-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-=
fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7742/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-a=
rea-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6646/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5939">i915#5939</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-i=
clb6/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6646/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/shard-apl3/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6646/=
shard-apl1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6599">i915#6599</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/s=
hard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7742/shard-apl4/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-ap=
l7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7742/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/shard-apl2/igt@=
runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/5257">i915#5257</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/6599">i915#6599</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6646 -&gt; IGTPW_7742</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12074: c16b937da799ddbebf0d940aff159b96ce9fec0f @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7742: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7742/index.htm=
l<br />
  IGT_6646: c1f420ae84b76079cd32ac014cfdf95b5f2922f7 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4634406347208919625==--
