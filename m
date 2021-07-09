Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 09 Jul 2021 08:52:16 -0000
Message-ID: <162582073687.9810.14196954667185000719@emeril.freedesktop.org>
References: <20210708164902.18250-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20210708164902.18250-1-venkata.sai.patnana@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgVkRTQyBB?=
 =?utf-8?q?DLP_related_patches_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1874807313=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: venkata.sai.patnana@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1874807313==
Content-Type: multipart/alternative;
 boundary="===============5674019928119351573=="

--===============5674019928119351573==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: VDSC ADLP related patches (rev2)
URL   : https://patchwork.freedesktop.org/series/92324/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10319_full -> IGTPW_6000_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6000_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_dp_dsc@xrgb8888-dsc-compression} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-tglb1/igt@kms_dp_dsc@xrgb8888-dsc-compression.html
    - shard-iclb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb7/igt@kms_dp_dsc@xrgb8888-dsc-compression.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10319_full and IGTPW_6000_full:

### New IGT tests (6) ###

  * igt@kms_dp_dsc@basic-dsc-enable:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-a:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [1.18, 1.21] s

  * igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-b:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [1.15, 1.16] s

  * igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-c:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.14] s

  * igt@kms_dp_dsc@xrgb8888-dsc-compression:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_6000_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-tglb:         [PASS][3] -> [INCOMPLETE][4] ([i915#750])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-tglb2/igt@device_reset@unbind-reset-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-tglb2/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_create@create-clear:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#1888] / [i915#3160])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-glk7/igt@gem_create@create-clear.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-glk7/igt@gem_create@create-clear.html

  * igt@gem_create@create-massive:
    - shard-apl:          NOTRUN -> [DMESG-WARN][7] ([i915#3002])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-apl1/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#1099]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-snb6/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][9] ([i915#3354])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-snb6/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [PASS][10] -> [FAIL][11] ([i915#2846])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-glk9/igt@gem_exec_fair@basic-deadline.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-glk3/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][12] -> [FAIL][13] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#2842]) +4 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-glk6/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [PASS][16] -> [FAIL][17] ([i915#2842] / [i915#3468])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-apl1/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][18] -> [SKIP][19] ([fdo#109271])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_params@secure-non-master:
    - shard-tglb:         NOTRUN -> [SKIP][20] ([fdo#112283])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-tglb2/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][21] ([i915#3633])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb2/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_exec_whisper@basic-contexts-priority:
    - shard-iclb:         [PASS][22] -> [INCOMPLETE][23] ([i915#1895])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-iclb7/igt@gem_exec_whisper@basic-contexts-priority.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb7/igt@gem_exec_whisper@basic-contexts-priority.html

  * igt@gem_exec_whisper@basic-forked-all:
    - shard-glk:          [PASS][24] -> [DMESG-WARN][25] ([i915#118] / [i915#95]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-glk7/igt@gem_exec_whisper@basic-forked-all.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-glk6/igt@gem_exec_whisper@basic-forked-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-glk:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#2190])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-glk9/igt@gem_huc_copy@huc-copy.html
    - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#2190])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb8/igt@gem_huc_copy@huc-copy.html
    - shard-kbl:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#2190])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap_gtt@big-copy-xy:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#307])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-glk7/igt@gem_mmap_gtt@big-copy-xy.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-glk5/igt@gem_mmap_gtt@big-copy-xy.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#768])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb2/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([fdo#109312])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb6/igt@gem_softpin@evict-snoop.html
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#109312])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-tglb6/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-apl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#3323])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-apl8/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          NOTRUN -> [DMESG-WARN][35] ([i915#180])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-apl6/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen3_render_tiledy_blits:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#109289])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-tglb7/igt@gen3_render_tiledy_blits.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#112306])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-tglb2/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([fdo#112306]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb3/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-glk:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#1937])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-glk2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-iclb:         [PASS][40] -> [DMESG-WARN][41] ([i915#3621])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-iclb5/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb1/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-apl:          NOTRUN -> [SKIP][42] ([fdo#109271]) +300 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-apl8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([i915#3689]) +7 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-tglb7/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs:
    - shard-snb:          NOTRUN -> [SKIP][44] ([fdo#109271]) +370 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-snb2/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109278]) +9 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb3/igt@kms_ccs@pipe-d-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_chamelium@dp-mode-timings:
    - shard-apl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [fdo#111827]) +21 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-apl2/igt@kms_chamelium@dp-mode-timings.html

  * igt@kms_chamelium@hdmi-crc-nonplanar-formats:
    - shard-glk:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-glk9/igt@kms_chamelium@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium@vga-hpd:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-tglb5/igt@kms_chamelium@vga-hpd.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-snb:          NOTRUN -> [SKIP][49] ([fdo#109271] / [fdo#111827]) +16 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-snb5/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-kbl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl3/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb3/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_content_protection@legacy:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109300] / [fdo#111066])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb8/igt@kms_content_protection@legacy.html
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#111828])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-tglb1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-apl:          NOTRUN -> [TIMEOUT][54] ([i915#1319]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-apl3/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109278] / [fdo#109279])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb1/igt@kms_cursor_crc@pipe-b-cursor-512x512-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:
    - shard-kbl:          NOTRUN -> [SKIP][56] ([fdo#109271]) +94 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl4/igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x10-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#3359])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-32x10-sliding.html

  * {igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-b} (NEW):
    - shard-iclb:         NOTRUN -> [DMESG-WARN][58] ([i915#1226]) +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-b.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][59] -> [FAIL][60] ([i915#79])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109274]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb3/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#111825]) +18 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-tglb7/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][63] ([fdo#109271]) +73 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-glk6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109280]) +13 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][65] -> [DMESG-WARN][66] ([i915#180]) +4 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-kbl2/igt@kms_hdr@bpc-switch-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#1187])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-tglb6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-glk:          NOTRUN -> [SKIP][68] ([fdo#109271] / [i915#533])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-glk2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][69] ([fdo#109271] / [i915#533])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
    - shard-apl:          NOTRUN -> [FAIL][70] ([fdo#108145] / [i915#265]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][71] ([i915#265])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][72] ([fdo#108145] / [i915#265])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_lowres@pipe-d-tiling-x:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#3536])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-tglb1/igt@kms_plane_lowres@pipe-d-tiling-x.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
    - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#658]) +3 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-apl8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
    - shard-glk:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#658]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-glk8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
    - shard-kbl:          NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#658]) +2 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#658])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#2920])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-tglb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][79] -> [SKIP][80] ([fdo#109441])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109441]) +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb4/igt@kms_psr@psr2_cursor_render.html
    - shard-tglb:         NOTRUN -> [FAIL][82] ([i915#132] / [i915#3467]) +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-tglb5/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          NOTRUN -> [FAIL][83] ([IGT#2])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-apl2/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          NOTRUN -> [SKIP][84] ([fdo#109271] / [i915#533]) +5 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-apl1/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#2437])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-apl8/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-tglb:         NOTRUN -> [SKIP][86] ([i915#2437])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-tglb5/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-kbl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#2437])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl6/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-glk:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#2437])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-glk6/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-iclb:         NOTRUN -> [SKIP][89] ([i915#2437])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@prime_nv_pcopy@test2:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([fdo#109291]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb1/igt@prime_nv_pcopy@test2.html

  * igt@prime_nv_test@i915_blt_fill_nv_read:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([fdo#109291]) +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-tglb7/igt@prime_nv_test@i915_blt_fill_nv_read.html

  * igt@sysfs_clients@fair-7:
    - shard-apl:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#2994]) +4 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-apl7/igt@sysfs_clients@fair-7.html

  * igt@sysfs_clients@pidname:
    - shard-glk:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#2994]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-glk2/igt@sysfs_clients@pidname.html

  * igt@sysfs_clients@split-50:
    - shard-kbl:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#2994]) +3 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl2/igt@sysfs_clients@split-50.html
    - shard-iclb:         NOTRUN -> [SKIP][95] ([i915#2994]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb2/igt@sysfs_clients@split-50.html
    - shard-tglb:         NOTRUN -> [SKIP][96] ([i915#2994]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-tglb3/igt@sysfs_clients@split-50.html

  
#### Possible fixes ####

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [TIMEOUT][97] ([i915#2369] / [i915#2481] / [i915#3070]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-iclb1/igt@gem_eio@unwedge-stress.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb8/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [FAIL][99] ([i915#2846]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-kbl6/igt@gem_exec_fair@basic-deadline.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [FAIL][101] ([i915#2842]) -> [PASS][102] +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html
    - shard-tglb:         [FAIL][103] ([i915#2842]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-kbl:          [FAIL][105] ([i915#2842]) -> [PASS][106] +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-kbl4/igt@gem_exec_fair@basic-none@vecs0.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl6/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [FAIL][107] ([i915#2851]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][109] ([i915#2849]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - shard-glk:          [DMESG-WARN][111] ([i915#118] / [i915#95]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-glk2/igt@gem_exec_whisper@basic-fds-priority-all.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-glk4/igt@gem_exec_whisper@basic-fds-priority-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [INCOMPLETE][113] ([i915#3698]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-iclb5/igt@i915_pm_dc@dc6-psr.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:
    - shard-glk:          [FAIL][115] -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-glk4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-glk5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][117] ([i915#180]) -> [PASS][118] +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-kbl:          [DMESG-WARN][119] ([i915#180]) -> [PASS][120] +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][121] ([fdo#109441]) -> [PASS][122] +3 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-iclb4/igt@kms_psr@psr2_cursor_plane_onoff.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [FAIL][123] ([i915#3343]) -> [INCOMPLETE][124] ([i915#3698])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb5/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][125] ([i915#1804] / [i915#2684]) -> [WARN][126] ([i915#2684])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
    - shard-iclb:         [SKIP][127] ([i915#2920]) -> [SKIP][128] ([i915#658]) +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
    - shard-iclb:         [SKIP][129] ([i915#658]) -> [SKIP][130] ([i915#2920]) +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-iclb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][131], [FAIL][132], [FAIL][133], [FAIL][134], [FAIL][135]) ([i915#180] / [i915#1814] / [i915#2722] / [i915#3002] / [i915#3363] / [i915#3744]) -> ([FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#2505] / [i915#2722] / [i915#3002] / [i915#3363] / [i915#3744])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-kbl7/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-kbl7/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-kbl2/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-kbl3/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-kbl2/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl7/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl6/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl2/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl7/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl3/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl7/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl7/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl1/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147]) ([i915#1814] / [i915#2722] / [i915#3002] / [i915#3744]) -> ([FAIL][14

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/index.html

--===============5674019928119351573==
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
<tr><td><b>Series:</b></td><td>VDSC ADLP related patches (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/92324/">https://patchwork.freedesktop.org/series/92324/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6000/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_6000/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10319_full -&gt; IGTPW_6000_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6000=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_dp_dsc@xrgb8888-dsc-compression} (NEW):</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6000/shard-tglb1/igt@kms_dp_dsc@xrgb8888-dsc-compression=
.html">SKIP</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6000/shard-iclb7/igt@kms_dp_dsc@xrgb8888-dsc-compression=
.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10319_full and IGTPW_6000_=
full:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [1.18, 1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [1.15, 1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@xrgb8888-dsc-compression:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6000_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-tglb2/igt@device_reset@unbind-reset-rebind.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/sha=
rd-tglb2/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a> ([i915#7=
50])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-clear:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-glk7/igt@gem_create@create-clear.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-glk7/ig=
t@gem_create@create-clear.html">FAIL</a> ([i915#1888] / [i915#3160])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-apl1/igt@gem_create@create-massive.html">DME=
SG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-snb6/igt@gem_ctx_persistence@legacy-engines-=
mixed-process.html">SKIP</a> ([fdo#109271] / [i915#1099]) +1 similar issue<=
/li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-snb6/igt@gem_eio@unwedge-stress.html">FAIL</=
a> ([i915#3354])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-glk9/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-gl=
k3/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-=
tglb7/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/sh=
ard-glk6/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]=
) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-=
apl1/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842] / [i915=
#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-=
kbl4/igt@gem_exec_fair@basic-pace@vecs0.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-tglb2/igt@gem_exec_params@secure-non-master.=
html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-iclb2/igt@gem_exec_reloc@basic-wide-active@v=
cs1.html">FAIL</a> ([i915#3633])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-iclb7/igt@gem_exec_whisper@basic-contexts-priority.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6000/shard-iclb7/igt@gem_exec_whisper@basic-contexts-priority.html">INCOMPL=
ETE</a> ([i915#1895])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-glk7/igt@gem_exec_whisper@basic-forked-all.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/sha=
rd-glk6/igt@gem_exec_whisper@basic-forked-all.html">DMESG-WARN</a> ([i915#1=
18] / [i915#95]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6000/shard-glk9/igt@gem_huc_copy@huc-copy.html">SKIP</a>=
 ([fdo#109271] / [i915#2190])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6000/shard-iclb8/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> ([i915#2190])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6000/shard-kbl7/igt@gem_huc_copy@huc-copy.html">SKIP</a>=
 ([fdo#109271] / [i915#2190])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy-xy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-glk7/igt@gem_mmap_gtt@big-copy-xy.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-glk5/i=
gt@gem_mmap_gtt@big-copy-xy.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-iclb2/igt@gem_render_copy@yf-tiled-to-vebox-=
x-tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6000/shard-iclb6/igt@gem_softpin@evict-snoop.html">SKIP<=
/a> ([fdo#109312])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6000/shard-tglb6/igt@gem_softpin@evict-snoop.html">SKIP<=
/a> ([fdo#109312])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-apl8/igt@gem_userptr_blits@dmabuf-sync.html"=
>SKIP</a> ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-apl6/igt@gem_workarounds@suspend-resume-cont=
ext.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-tglb7/igt@gen3_render_tiledy_blits.html">SKI=
P</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-tglb2/igt@gen9_exec_parse@bb-start-out.html"=
>SKIP</a> ([fdo#112306])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-iclb3/igt@gen9_exec_parse@unaligned-jump.htm=
l">SKIP</a> ([fdo#112306]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-glk2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi=
-a.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-iclb5/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/s=
hard-iclb1/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">DMESG-WARN</a> ([i9=
15#3621])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-apl8/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-0.html">SKIP</a> ([fdo#109271]) +300 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-tglb7/igt@kms_ccs@pipe-a-bad-pixel-format-y_=
tiled_ccs.html">SKIP</a> ([i915#3689]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-snb2/igt@kms_ccs@pipe-b-bad-pixel-format-y_t=
iled_ccs.html">SKIP</a> ([fdo#109271]) +370 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-iclb3/igt@kms_ccs@pipe-d-bad-rotation-90-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109278]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-mode-timings:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-apl2/igt@kms_chamelium@dp-mode-timings.html"=
>SKIP</a> ([fdo#109271] / [fdo#111827]) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-glk9/igt@kms_chamelium@hdmi-crc-nonplanar-fo=
rmats.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-tglb5/igt@kms_chamelium@vga-hpd.html">SKIP</=
a> ([fdo#109284] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-snb5/igt@kms_chamelium@vga-hpd-without-ddc.h=
tml">SKIP</a> ([fdo#109271] / [fdo#111827]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6000/shard-kbl3/igt@kms_color_chamelium@pipe-a-ctm-blue-=
to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6000/shard-iclb3/igt@kms_color_chamelium@pipe-a-ctm-blue=
-to-red.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6000/shard-iclb8/igt@kms_content_protection@legacy.html"=
>SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6000/shard-tglb1/igt@kms_content_protection@legacy.html"=
>SKIP</a> ([fdo#111828])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-apl3/igt@kms_content_protection@srm.html">TI=
MEOUT</a> ([i915#1319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-iclb1/igt@kms_cursor_crc@pipe-b-cursor-512x5=
12-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-kbl4/igt@kms_cursor_crc@pipe-d-cursor-256x25=
6-onscreen.html">SKIP</a> ([fdo#109271]) +94 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x10-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-32x10=
-sliding.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>{igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-b} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable@edp-1-=
pipe-b.html">DMESG-WARN</a> ([i915#1226]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-=
hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_6000/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-=
a1-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-iclb3/igt@kms_flip@2x-flip-vs-fences-interru=
ptible.html">SKIP</a> ([fdo#109274]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-tglb7/igt@kms_flip@2x-plain-flip-ts-check.ht=
ml">SKIP</a> ([fdo#111825]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-glk6/igt@kms_frontbuffer_tracking@fbcpsr-rgb=
101010-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +73 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-iclb2/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-pri-indfb-draw-render.html">SKIP</a> ([fdo#109280]) +13 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-kbl2/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl7=
/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> ([i915#180]) +4 simila=
r issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-tglb6/igt@kms_hdr@static-toggle-dpms.html">S=
KIP</a> ([i915#1187])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-glk2/igt@kms_pipe_crc_basic@compare-crc-sani=
tycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-kbl6/igt@kms_pipe_crc_basic@hang-read-crc-pi=
pe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-=
7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-=
7efc.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-x:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-tglb1/igt@kms_plane_lowres@pipe-d-tiling-x.h=
tml">SKIP</a> ([i915#3536])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-apl8/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-glk8/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-kbl2/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6000/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-2.html">SKIP</a> ([i915#658])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6000/shard-tglb1/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-2.html">SKIP</a> ([i915#2920])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-i=
clb3/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6000/shard-iclb4/igt@kms_psr@psr2_cursor_render.html">SK=
IP</a> ([fdo#109441]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6000/shard-tglb5/igt@kms_psr@psr2_cursor_render.html">FA=
IL</a> ([i915#132] / [i915#3467]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-apl2/igt@kms_sysfs_edid_timing.html">FAIL</a=
> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-apl1/igt@kms_vblank@pipe-d-wait-idle.html">S=
KIP</a> ([fdo#109271] / [i915#533]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-apl8/igt@kms_writeback@writeback-check-outpu=
t.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6000/shard-tglb5/igt@kms_writeback@writeback-invalid-par=
ameters.html">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6000/shard-kbl6/igt@kms_writeback@writeback-invalid-para=
meters.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6000/shard-glk6/igt@kms_writeback@writeback-invalid-para=
meters.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6000/shard-iclb6/igt@kms_writeback@writeback-invalid-par=
ameters.html">SKIP</a> ([i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-iclb1/igt@prime_nv_pcopy@test2.html">SKIP</a=
> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_blt_fill_nv_read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-tglb7/igt@prime_nv_test@i915_blt_fill_nv_rea=
d.html">SKIP</a> ([fdo#109291]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-apl7/igt@sysfs_clients@fair-7.html">SKIP</a>=
 ([fdo#109271] / [i915#2994]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@pidname:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-glk2/igt@sysfs_clients@pidname.html">SKIP</a=
> ([fdo#109271] / [i915#2994]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-50:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6000/shard-kbl2/igt@sysfs_clients@split-50.html">SKIP</a=
> ([fdo#109271] / [i915#2994]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6000/shard-iclb2/igt@sysfs_clients@split-50.html">SKIP</=
a> ([i915#2994]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6000/shard-tglb3/igt@sysfs_clients@split-50.html">SKIP</=
a> ([i915#2994]) +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-iclb1/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i9=
15#2369] / [i915#2481] / [i915#3070]) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_6000/shard-iclb8/igt@gem_eio@unwedge-stress.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-kbl6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([=
i915#2846]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_6000/shard-kbl2/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10319/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL=
</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_6000/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS=
</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10319/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL=
</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_6000/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS=
</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-kbl4/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> =
([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_6000/shard-kbl6/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> +1 sim=
ilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (=
[i915#2851]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_6000/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL<=
/a> ([i915#2849]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6000/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-glk2/igt@gem_exec_whisper@basic-fds-priority-all.html">=
DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_6000/shard-glk4/igt@gem_exec_whisper@basic-fds=
-priority-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-iclb5/igt@i915_pm_dc@dc6-psr.html">INCOMPLETE</a> ([i91=
5#3698]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_60=
00/shard-iclb2/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-glk4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0=
.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_6000/shard-glk5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DME=
SG-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_6000/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html=
">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend@p=
ipe-b-planes.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl1/igt@kms_plane@plane-pan=
ning-bottom-right-suspend@pipe-b-planes.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-iclb4/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a=
> ([fdo#109441]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_6000/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a> +=
3 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html">FAIL</a> ([i915#334=
3]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/sh=
ard-iclb5/igt@i915_pm_dc@dc9-dpms.html">INCOMPLETE</a> ([i915#3698])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a>=
 ([i915#1804] / [i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_6000/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html"=
>WARN</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-=
4.html">SKIP</a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6000/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-s=
f-dmg-area-4.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-iclb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-are=
a-3.html">SKIP</a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_6000/shard-iclb2/igt@kms_psr2_sf@overlay-primary-updat=
e-sf-dmg-area-3.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10319/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-kbl7/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_10319/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10319/shard-kbl3/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_10319/shard-kbl2/igt@runner@aborted.html">FAIL</a>) ([i915#180] / [i915#1=
814] / [i915#2722] / [i915#3002] / [i915#3363] / [i915#3744]) -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl7/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_6000/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl2/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_6000/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl3/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_600=
0/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_6000/shard-kbl7/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6000/shard=
-kbl1/igt@runner@aborted.html">FAIL</a>) ([i915#1436] / [i915#180] / [i915#=
1814] / [i915#2505] / [i915#2722] / [i915#3002] / [i915#3363] / [i915#3744]=
)</p>
</li>
<li>
<p>shard-iclb:         ([FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147])=
 ([i915#1814] / [i915#2722] / [i915#3002] / [i915#3744]) -&gt; ([FAIL][14</=
p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============5674019928119351573==--

--===============1874807313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1874807313==--
