Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 20 Dec 2020 19:24:59 -0000
Message-ID: <160849229902.12072.5132934627410395613@emeril.freedesktop.org>
References: <20201220171049.333955-1-apoorva1.singh@intel.com>
In-Reply-To: <20201220171049.333955-1-apoorva1.singh@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9p?=
 =?utf-8?q?915=5Fquery=3A_Add_subtests_description?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1153402619=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1153402619==
Content-Type: multipart/alternative;
 boundary="===============1350721630392496634=="

--===============1350721630392496634==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/i915_query: Add subtests description
URL   : https://patchwork.freedesktop.org/series/85124/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5912_full -> IGTPW_5317_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5317_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5317_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5317_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-apl:          [PASS][1] -> [DMESG-WARN][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-apl6/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-apl2/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-edp1:
    - shard-iclb:         [PASS][3] -> [DMESG-WARN][4] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-iclb6/igt@kms_flip@flip-vs-suspend@c-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb1/igt@kms_flip@flip-vs-suspend@c-edp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a2:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] +4 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-glk9/igt@kms_flip@flip-vs-suspend@c-hdmi-a2.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-glk2/igt@kms_flip@flip-vs-suspend@c-hdmi-a2.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html

  
Known issues
------------

  Here are the changes found in IGTPW_5317_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-3x:
    - shard-glk:          NOTRUN -> [SKIP][9] ([fdo#109271]) +31 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-glk4/igt@feature_discovery@display-3x.html
    - shard-iclb:         NOTRUN -> [SKIP][10] ([i915#1839])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb7/igt@feature_discovery@display-3x.html
    - shard-tglb:         NOTRUN -> [SKIP][11] ([i915#1839])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-tglb3/igt@feature_discovery@display-3x.html

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
    - shard-hsw:          NOTRUN -> [SKIP][12] ([fdo#109271] / [i915#1099])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-hsw8/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-hsw:          [PASS][13] -> [FAIL][14] ([i915#2389])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-hsw1/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-hsw4/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#1436] / [i915#716])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-glk8/igt@gen9_exec_parse@allowed-all.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-glk3/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][17] ([fdo#112306]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-tglb3/igt@gen9_exec_parse@bb-start-cmd.html
    - shard-iclb:         NOTRUN -> [SKIP][18] ([fdo#112306])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb5/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglb:         NOTRUN -> [SKIP][19] ([fdo#111644] / [i915#1397] / [i915#2411])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-tglb5/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-iclb:         NOTRUN -> [SKIP][20] ([fdo#110892])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([fdo#110725] / [fdo#111614]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb6/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([fdo#111614]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-tglb6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([fdo#111615]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-tglb3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_chamelium@dp-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][24] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-apl6/igt@kms_chamelium@dp-edid-change-during-suspend.html

  * igt@kms_chamelium@hdmi-audio:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb7/igt@kms_chamelium@hdmi-audio.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-kbl:          NOTRUN -> [SKIP][26] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-kbl1/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color@pipe-b-ctm-0-25:
    - shard-iclb:         NOTRUN -> [FAIL][27] ([i915#1149] / [i915#315]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb7/igt@kms_color@pipe-b-ctm-0-25.html

  * igt@kms_color@pipe-c-ctm-0-75:
    - shard-tglb:         NOTRUN -> [FAIL][28] ([i915#1149] / [i915#315]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-tglb2/igt@kms_color@pipe-c-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-25:
    - shard-hsw:          NOTRUN -> [SKIP][29] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-hsw4/igt@kms_color_chamelium@pipe-a-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-25:
    - shard-glk:          NOTRUN -> [SKIP][30] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-glk7/igt@kms_color_chamelium@pipe-d-ctm-0-25.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#109284] / [fdo#111827]) +9 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-tglb8/igt@kms_color_chamelium@pipe-d-ctm-0-25.html
    - shard-iclb:         NOTRUN -> [SKIP][32] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb7/igt@kms_color_chamelium@pipe-d-ctm-0-25.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#109279]) +4 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][34] ([fdo#109278] / [fdo#109279]) +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#109274] / [fdo#109278])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#426])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-tglb1/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#52] / [i915#54])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-glk5/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-glk4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109274]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb4/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:
    - shard-glk:          [PASS][40] -> [FAIL][41] ([i915#79]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [PASS][42] -> [DMESG-WARN][43] ([i915#2635])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-apl6/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html
    - shard-kbl:          [PASS][44] -> [INCOMPLETE][45] ([i915#155])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-kbl4/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-kbl3/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          [PASS][46] -> [DMESG-WARN][47] ([i915#2635])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-glk9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-glk2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-vga1:
    - shard-hsw:          [PASS][48] -> [DMESG-WARN][49] ([i915#2637]) +5 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-hsw4/igt@kms_flip@flip-vs-suspend@a-vga1.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-hsw8/igt@kms_flip@flip-vs-suspend@a-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-kbl:          NOTRUN -> [SKIP][50] ([fdo#109271]) +48 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#111825]) +12 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109280]) +7 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-kbl:          [PASS][53] -> [DMESG-WARN][54] ([i915#180])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][55] ([i915#265])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-glk7/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
    - shard-apl:          NOTRUN -> [FAIL][56] ([i915#265])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][57] ([i915#265])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][58] ([fdo#108145] / [i915#265])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-glk2/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
    - shard-kbl:          NOTRUN -> [FAIL][59] ([fdo#108145] / [i915#265])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
    - shard-apl:          NOTRUN -> [FAIL][60] ([fdo#108145] / [i915#265])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_plane_lowres@pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#112054])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-tglb3/igt@kms_plane_lowres@pipe-d-tiling-yf.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][62] -> [SKIP][63] ([fdo#109441]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-d-wait-forked:
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271]) +38 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-apl3/igt@kms_vblank@pipe-d-wait-forked.html
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109278]) +4 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb2/igt@kms_vblank@pipe-d-wait-forked.html

  * igt@nouveau_crc@pipe-a-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([i915#2530])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb2/igt@nouveau_crc@pipe-a-ctx-flip-detection.html
    - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#2530])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-tglb1/igt@nouveau_crc@pipe-a-ctx-flip-detection.html

  * igt@perf_pmu@busy-accuracy-98@vcs0:
    - shard-hsw:          NOTRUN -> [SKIP][68] ([fdo#109271]) +22 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-hsw8/igt@perf_pmu@busy-accuracy-98@vcs0.html

  * igt@prime_nv_api@nv_i915_import_twice_check_flink_name:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109291]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb4/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html

  * igt@prime_nv_pcopy@test3_3:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#109291]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-tglb8/igt@prime_nv_pcopy@test3_3.html

  
#### Possible fixes ####

  * {igt@gem_exec_schedule@u-fairslice@rcs0}:
    - shard-tglb:         [DMESG-WARN][71] ([i915#2803]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-tglb6/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-tglb7/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-iclb:         [DMESG-WARN][73] -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-iclb3/igt@gem_exec_suspend@basic-s3.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb5/igt@gem_exec_suspend@basic-s3.html
    - shard-glk:          [DMESG-WARN][75] ([i915#2635]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-glk8/igt@gem_exec_suspend@basic-s3.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-glk9/igt@gem_exec_suspend@basic-s3.html
    - shard-hsw:          [DMESG-WARN][77] ([i915#2637]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-hsw4/igt@gem_exec_suspend@basic-s3.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-hsw1/igt@gem_exec_suspend@basic-s3.html
    - shard-kbl:          [DMESG-WARN][79] -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-kbl4/igt@gem_exec_suspend@basic-s3.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-kbl1/igt@gem_exec_suspend@basic-s3.html
    - shard-tglb:         [DMESG-WARN][81] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-tglb7/igt@gem_exec_suspend@basic-s3.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-tglb1/igt@gem_exec_suspend@basic-s3.html
    - shard-apl:          [INCOMPLETE][83] ([i915#2369] / [i915#2502] / [i915#2635]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-apl8/igt@gem_exec_suspend@basic-s3.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-apl2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [DMESG-WARN][85] ([i915#118] / [i915#95]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-glk1/igt@gem_exec_whisper@basic-queues-forked-all.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-glk6/igt@gem_exec_whisper@basic-queues-forked-all.html

  * {igt@gem_vm_create@destroy-race}:
    - shard-tglb:         [TIMEOUT][87] ([i915#2795]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-tglb3/igt@gem_vm_create@destroy-race.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-tglb8/igt@gem_vm_create@destroy-race.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-apl:          [FAIL][89] ([i915#2521]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-apl4/igt@kms_async_flips@alternate-sync-async-flip.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-apl2/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][91] ([i915#180]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [FAIL][93] ([i915#96]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:
    - shard-glk:          [FAIL][95] ([i915#79]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [FAIL][97] ([i915#2598]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-glk:          [FAIL][99] ([i915#49]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
    - shard-apl:          [FAIL][101] ([i915#49]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
    - shard-kbl:          [FAIL][103] ([i915#49]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][105] ([i915#433]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][107] ([fdo#109441]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-iclb4/igt@kms_psr@psr2_basic.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb2/igt@kms_psr@psr2_basic.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][109] ([i915#2684]) -> [WARN][110] ([i915#1804] / [i915#2684])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@runner@aborted:
    - shard-iclb:         ([FAIL][111], [FAIL][112]) ([i915#2295] / [i915#2724] / [i915#483]) -> ([FAIL][113], [FAIL][114], [FAIL][115]) ([i915#2295] / [i915#2426] / [i915#2724] / [i915#483])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-iclb6/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-iclb3/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb7/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb1/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb4/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][116], [FAIL][117], [FAIL][118]) ([i915#2295] / [i915#2426]) -> [FAIL][119] ([i915#2295])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-tglb3/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-tglb6/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-tglb7/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-tglb7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112306]: https://bugs.freedesktop.org/show_bug.cgi?id=112306
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2369]: https://gitlab.freedesktop.org/drm/intel/issues/2369
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2502]: https://gitlab.freedesktop.org/drm/intel/issues/2502
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#2795]: https://gitlab.freedesktop.org/drm/intel/issues/2795
  [i915#2802]: https://gitlab.freedesktop.org/drm/intel/issues/2802
  [i915#2803]: https://gitlab.freedesktop.org/drm/intel/issues/2803
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5912 -> IGTPW_5317

  CI-20190529: 20190529
  CI_DRM_9507: 8b45cf5105ca18b54f9ae4cedf665a4b5b505630 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5317: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/index.html
  IGT_5912: 73871127b295f28340799d0ab55d06d620b4a953 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/index.html

--===============1350721630392496634==
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
<tr><td><b>Series:</b></td><td>i915/i915_query: Add subtests description</t=
d></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/85124/">https://patchwork.freedesktop.org/series/85124/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5317/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5317/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5912_full -&gt; IGTPW_5317_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5317_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5317_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5317=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-apl6/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-apl2=
/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-edp1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-iclb6/igt@kms_flip@flip-vs-suspend@c-edp1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-ic=
lb1/igt@kms_flip@flip-vs-suspend@c-edp1.html">DMESG-WARN</a> +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-glk9/igt@kms_flip@flip-vs-suspend@c-hdmi-a2.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-=
glk2/igt@kms_flip@flip-vs-suspend@c-hdmi-a2.html">DMESG-WARN</a> +4 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5317/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html"=
>INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5317_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5317/shard-glk4/igt@feature_discovery@display-3x.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>) +31 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5317/shard-iclb7/igt@feature_discovery@display-3x.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839">=
i915#1839</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5317/shard-tglb3/igt@feature_discovery@display-3x.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839">=
i915#1839</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile-preempt:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5317/shard-hsw8/igt@gem_ctx_persistence@legacy-engines-=
hostile-preempt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-hsw1/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/sha=
rd-hsw4/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-glk8/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-glk3/ig=
t@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5317/shard-tglb3/igt@gen9_exec_parse@bb-start-cmd.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112306"=
>fdo#112306</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5317/shard-iclb5/igt@gen9_exec_parse@bb-start-cmd.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112306"=
>fdo#112306</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5317/shard-tglb5/igt@i915_pm_rpm@modeset-non-lpsp-stress=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111644">fdo#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1397">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2411">i915#2411</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5317/shard-iclb6/igt@i915_pm_rpm@modeset-non-lpsp-stress=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110892">fdo#110892</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5317/shard-iclb6/igt@kms_big_fb@x-tiled-8bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111614">fdo#111614</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5317/shard-tglb6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5317/shard-tglb3/igt@kms_big_fb@yf-tiled-addfb-size-off=
set-overflow.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111615">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5317/shard-apl6/igt@kms_chamelium@dp-edid-change-during=
-suspend.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5317/shard-iclb7/igt@kms_chamelium@hdmi-audio.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">fd=
o#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1827">fdo#111827</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5317/shard-kbl1/igt@kms_chamelium@vga-hpd-without-ddc.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5317/shard-iclb7/igt@kms_color@pipe-b-ctm-0-25.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i9=
15#1149</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/31=
5">i915#315</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-ctm-0-75:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5317/shard-tglb2/igt@kms_color@pipe-c-ctm-0-75.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i9=
15#1149</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/31=
5">i915#315</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-25:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5317/shard-hsw4/igt@kms_color_chamelium@pipe-a-ctm-0-25=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-25:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5317/shard-glk7/igt@kms_color_chamelium@pipe-d-ctm-0-25.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +5 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5317/shard-tglb8/igt@kms_color_chamelium@pipe-d-ctm-0-25=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +9 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5317/shard-iclb7/igt@kms_color_chamelium@pipe-d-ctm-0-25=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5317/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-512x1=
70-onscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109279">fdo#109279</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5317/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-512x1=
70-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109279">fdo#109279</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5317/shard-iclb2/igt@kms_cursor_legacy@cursora-vs-flipb=
-toggle.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5317/shard-tglb1/igt@kms_dp_tiled_display@basic-test-pa=
ttern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/426">i915#426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-glk5/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5317/shard-glk4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
2">i915#52</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/54">i915#54</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5317/shard-iclb4/igt@kms_flip@2x-blocking-wf_vblank.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
74">fdo#109274</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hd=
mi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5317/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible=
@c-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/79">i915#79</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5912/shard-apl6/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-apl2/=
igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5912/shard-kbl4/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-kbl3/=
igt@kms_flip@flip-vs-suspend@a-dp1.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-glk9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-=
glk2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-vga1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-hsw4/igt@kms_flip@flip-vs-suspend@a-vga1.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-hsw=
8/igt@kms_flip@flip-vs-suspend@a-vga1.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>) +5 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5317/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +48 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5317/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5317/shard-iclb6/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_531=
7/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915=
#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5317/shard-glk7/igt@kms_plane_alpha_blend@pipe-b-alpha-t=
ransparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5317/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-t=
ransparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5317/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-t=
ransparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5317/shard-glk2/igt@kms_plane_alpha_blend@pipe-c-constan=
t-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5317/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-constan=
t-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5317/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-constan=
t-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5317/shard-tglb3/igt@kms_plane_lowres@pipe-d-tiling-yf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
12054">fdo#112054</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb=
6/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-forked:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5317/shard-apl3/igt@kms_vblank@pipe-d-wait-forked.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a>) +38 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5317/shard-iclb2/igt@kms_vblank@pipe-d-wait-forked.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278=
">fdo#109278</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-detection:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5317/shard-iclb2/igt@nouveau_crc@pipe-a-ctx-flip-detecti=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2530">i915#2530</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5317/shard-tglb1/igt@nouveau_crc@pipe-a-ctx-flip-detecti=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2530">i915#2530</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-98@vcs0:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5317/shard-hsw8/igt@perf_pmu@busy-accuracy-98@vcs0.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a>) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_i915_import_twice_check_flink_name:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5317/shard-iclb4/igt@prime_nv_api@nv_i915_import_twice_=
check_flink_name.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109291">fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_3:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5317/shard-tglb8/igt@prime_nv_pcopy@test3_3.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#=
109291</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@rcs0}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-tglb6/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2803">i9=
15#2803</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5317/shard-tglb7/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5912/shard-iclb3/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-icl=
b5/igt@gem_exec_suspend@basic-s3.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5912/shard-glk8/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shar=
d-glk9/igt@gem_exec_suspend@basic-s3.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5912/shard-hsw4/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shar=
d-hsw1/igt@gem_exec_suspend@basic-s3.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5912/shard-kbl4/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-kbl1=
/igt@gem_exec_suspend@basic-s3.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5912/shard-tglb7/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1=
602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1887">=
i915#1887</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5317/shard-tglb1/igt@gem_exec_suspend@basic-s3.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5912/shard-apl8/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2369">i915#2369</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2502">i915#25=
02</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i=
915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5317/shard-apl2/igt@gem_exec_suspend@basic-s3.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-glk1/igt@gem_exec_whisper@basic-queues-forked-all.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118=
">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5317/shard-glk6/igt@gem_exec_whisper@basic-queues-forked-all.html">P=
ASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_vm_create@destroy-race}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-tglb3/igt@gem_vm_create@destroy-race.html">TIMEOUT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2795">i915#2795</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shar=
d-tglb8/igt@gem_vm_create@destroy-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-apl4/igt@kms_async_flips@alternate-sync-async-flip.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2521">i9=
15#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5317/shard-apl2/igt@kms_async_flips@alternate-sync-async-flip.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i9=
15#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5317/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/96=
">i915#96</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5317/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hd=
mi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/79">i915#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5317/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@c-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2598">i915=
#2598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5317/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5912/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-=
draw-pwrite.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/49">i915#49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5317/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-prims=
crn-cur-indfb-draw-pwrite.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5912/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-=
draw-pwrite.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/49">i915#49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5317/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-prims=
crn-cur-indfb-draw-pwrite.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5912/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-=
draw-pwrite.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/49">i915#49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5317/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-prims=
crn-cur-indfb-draw-pwrite.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-t=
glb5/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-iclb4/igt@kms_psr@psr2_basic.html">SKIP</a> (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb2/i=
gt@kms_psr@psr2_basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/sh=
ard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-iclb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-iclb3/igt@runner@aborted.h=
tml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2724">i915#2724</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/483">i915#483</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5317/shard-iclb7/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-iclb1/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5317/shard-iclb4/igt@runner@aborted.html">FAIL</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2724">i915=
#2724</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/483"=
>i915#483</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5912/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_5912/shard-tglb6/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5912=
/shard-tglb7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/shard-tglb7/igt@run=
ner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5912 -&gt; IGTPW_5317</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9507: 8b45cf5105ca18b54f9ae4cedf665a4b5b505630 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5317: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5317/index.htm=
l<br />
  IGT_5912: 73871127b295f28340799d0ab55d06d620b4a953 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============1350721630392496634==--

--===============1153402619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1153402619==--
