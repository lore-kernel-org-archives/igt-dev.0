Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 30 Dec 2020 11:44:48 -0000
Message-ID: <160932868899.26069.13678689141835623471@emeril.freedesktop.org>
References: <20201230100511.753653-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201230100511.753653-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fbalancer=3A_Exercise_non-persistent_behaviours?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1689352392=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1689352392==
Content-Type: multipart/alternative;
 boundary="===============6744053271552324159=="

--===============6744053271552324159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_exec_balancer: Exercise non-persistent behaviours
URL   : https://patchwork.freedesktop.org/series/85310/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5928_full -> IGTPW_5340_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5340_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5340_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5340_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_create@basic-files:
    - shard-iclb:         [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-iclb3/igt@gem_ctx_create@basic-files.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb6/igt@gem_ctx_create@basic-files.html

  * igt@gem_eio@in-flight-contexts-immediate:
    - shard-hsw:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-hsw4/igt@gem_eio@in-flight-contexts-immediate.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-hsw4/igt@gem_eio@in-flight-contexts-immediate.html

  
New tests
---------

  New tests have been introduced between IGT_5928_full and IGTPW_5340_full:

### New IGT tests (3) ###

  * igt@gem_exec_balancer@nohangcheck:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 4.67] s

  * igt@gem_exec_balancer@noheartbeat:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 4.72] s

  * igt@gem_exec_balancer@persistence:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 4.70] s

  

Known issues
------------

  Here are the changes found in IGTPW_5340_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-tglb:         NOTRUN -> [SKIP][5] ([fdo#109314])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb5/igt@gem_ctx_param@set-priority-not-supported.html
    - shard-iclb:         NOTRUN -> [SKIP][6] ([fdo#109314])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb7/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@engines-queued:
    - shard-hsw:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1099])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-hsw4/igt@gem_ctx_persistence@engines-queued.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglb:         NOTRUN -> [SKIP][8] ([i915#280])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb3/igt@gem_ctx_sseu@mmap-args.html

  * {igt@gem_exec_balancer@nohangcheck} (NEW):
    - shard-snb:          NOTRUN -> [SKIP][9] ([fdo#109271]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-snb7/igt@gem_exec_balancer@nohangcheck.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [PASS][10] -> [FAIL][11] ([i915#2389])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-apl4/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-glk:          [PASS][12] -> [FAIL][13] ([i915#2389])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][14] ([i915#2389])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         NOTRUN -> [FAIL][15] ([i915#1567])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html
    - shard-glk:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#658])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk6/igt@i915_pm_dc@dc3co-vpb-simulation.html
    - shard-apl:          NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#658])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-apl3/igt@i915_pm_dc@dc3co-vpb-simulation.html
    - shard-iclb:         NOTRUN -> [SKIP][18] ([i915#588])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
    - shard-kbl:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#658])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-kbl3/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-hsw:          NOTRUN -> [SKIP][20] ([fdo#109271]) +92 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-hsw2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [PASS][21] -> [FAIL][22] ([i915#2597])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-tglb2/igt@kms_async_flips@test-time-stamp.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb5/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-apl:          NOTRUN -> [SKIP][23] ([fdo#109271]) +48 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-apl3/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-iclb:         NOTRUN -> [SKIP][24] ([fdo#110725] / [fdo#111614]) +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb2/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][25] ([fdo#111614]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([fdo#110723])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][27] ([fdo#111615]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_ccs@pipe-d-bad-rotation-90:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#109278]) +9 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb8/igt@kms_ccs@pipe-d-bad-rotation-90.html

  * igt@kms_chamelium@hdmi-crc-single:
    - shard-glk:          NOTRUN -> [SKIP][29] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk5/igt@kms_chamelium@hdmi-crc-single.html
    - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb3/igt@kms_chamelium@hdmi-crc-single.html

  * igt@kms_chamelium@vga-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][31] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-kbl4/igt@kms_chamelium@vga-hpd-for-each-pipe.html
    - shard-apl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-apl6/igt@kms_chamelium@vga-hpd-for-each-pipe.html
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb5/igt@kms_chamelium@vga-hpd-for-each-pipe.html

  * igt@kms_color_chamelium@pipe-c-gamma:
    - shard-hsw:          NOTRUN -> [SKIP][34] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-hsw2/igt@kms_color_chamelium@pipe-c-gamma.html

  * igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb7/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html

  * igt@kms_content_protection@mei_interface:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#109300] / [fdo#111066])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb2/igt@kms_content_protection@mei_interface.html
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111828])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb3/igt@kms_content_protection@mei_interface.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#109279]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109278] / [fdo#109279]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding:
    - shard-apl:          [PASS][40] -> [FAIL][41] ([i915#54])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-random:
    - shard-glk:          NOTRUN -> [SKIP][42] ([fdo#109271]) +45 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk3/igt@kms_cursor_crc@pipe-d-cursor-64x21-random.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][43] -> [DMESG-WARN][44] ([i915#2635])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][45] -> [DMESG-WARN][46] ([i915#2637]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-hsw2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-hsw8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][47] -> [DMESG-WARN][48] ([i915#1602]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:
    - shard-tglb:         NOTRUN -> [FAIL][49] ([i915#2122])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-glk:          [PASS][50] -> [FAIL][51] ([i915#49])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-iclb:         [PASS][52] -> [FAIL][53] ([i915#49]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#111825]) +8 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109280]) +8 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@bpc-switch:
    - shard-kbl:          [PASS][56] -> [DMESG-WARN][57] ([i915#180] / [i915#78])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-kbl6/igt@kms_hdr@bpc-switch.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-kbl2/igt@kms_hdr@bpc-switch.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][58] ([fdo#108145] / [i915#265]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk8/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
    - shard-apl:          NOTRUN -> [FAIL][59] ([fdo#108145] / [i915#265]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
    - shard-kbl:          NOTRUN -> [FAIL][60] ([fdo#108145] / [i915#265]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#112054])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb3/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_psr@cursor_plane_onoff:
    - shard-kbl:          NOTRUN -> [SKIP][62] ([fdo#109271]) +48 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-kbl4/igt@kms_psr@cursor_plane_onoff.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][63] -> [SKIP][64] ([fdo#109441]) +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb1/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109441]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb1/igt@kms_psr@psr2_primary_render.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#2437])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb3/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-kbl:          NOTRUN -> [SKIP][67] ([fdo#109271] / [i915#2437])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-kbl3/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-apl:          NOTRUN -> [SKIP][68] ([fdo#109271] / [i915#2437])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-apl2/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-glk:          NOTRUN -> [SKIP][69] ([fdo#109271] / [i915#2437])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk9/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-iclb:         NOTRUN -> [SKIP][70] ([i915#2437])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb2/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@nouveau_crc@pipe-c-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([i915#2530])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb3/igt@nouveau_crc@pipe-c-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-d-source-outp-inactive:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#2530]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb6/igt@nouveau_crc@pipe-d-source-outp-inactive.html
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109278] / [i915#2530])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb8/igt@nouveau_crc@pipe-d-source-outp-inactive.html

  * igt@prime_nv_api@i915_nv_import_twice:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109291]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb6/igt@prime_nv_api@i915_nv_import_twice.html

  * igt@prime_nv_test@nv_write_i915_cpu_mmap_read:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#109291]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb8/igt@prime_nv_test@nv_write_i915_cpu_mmap_read.html

  * igt@prime_vgem@sync@vcs0:
    - shard-tglb:         [PASS][76] -> [INCOMPLETE][77] ([i915#409])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-tglb8/igt@prime_vgem@sync@vcs0.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb8/igt@prime_vgem@sync@vcs0.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-tglb:         [DMESG-WARN][78] ([i915#2867]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-tglb2/igt@core_hotunplug@unbind-rebind.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb8/igt@core_hotunplug@unbind-rebind.html

  * {igt@gem_exec_fair@basic-none-share@rcs0}:
    - shard-tglb:         [FAIL][80] ([i915#2842]) -> [PASS][81] +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html

  * {igt@gem_exec_fair@basic-none@rcs0}:
    - shard-glk:          [FAIL][82] ([i915#2842]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-glk6/igt@gem_exec_fair@basic-none@rcs0.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html

  * {igt@gem_exec_fair@basic-none@vcs0}:
    - shard-kbl:          [FAIL][84] ([i915#2842]) -> [PASS][85] +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html
    - shard-apl:          [FAIL][86] ([i915#2842]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-apl6/igt@gem_exec_fair@basic-none@vcs0.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html

  * {igt@gem_exec_fair@basic-pace@vcs0}:
    - shard-iclb:         [FAIL][88] ([i915#2842]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-iclb8/igt@gem_exec_fair@basic-pace@vcs0.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb5/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-hsw:          [FAIL][90] ([i915#2389]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-hsw7/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-hsw1/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - shard-glk:          [DMESG-WARN][92] ([i915#118] / [i915#95]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-glk3/igt@gem_exec_whisper@basic-fds-priority-all.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk4/igt@gem_exec_whisper@basic-fds-priority-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][94] ([i915#454]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][96] ([i915#2370]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [FAIL][98] ([i915#2598]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:
    - shard-glk:          [FAIL][100] ([i915#79]) -> [PASS][101] +2 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-kbl:          [FAIL][102] ([i915#49]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
    - shard-glk:          [FAIL][104] ([i915#49]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-glk4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
    - shard-apl:          [FAIL][106] ([i915#49]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-iclb:         [INCOMPLETE][108] ([i915#1185] / [i915#1602] / [i915#250]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-iclb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-apl:          [DMESG-WARN][110] ([i915#1602] / [i915#2635]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-glk:          [DMESG-WARN][112] ([i915#1602] / [i915#2635]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-glk6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-hsw:          [DMESG-WARN][114] ([i915#2637]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-hsw6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-hsw8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-tglb:         [INCOMPLETE][116] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-tglb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-kbl:          [DMESG-WARN][118] ([i915#1602]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-kbl:          [DMESG-WARN][120] ([i915#165]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-kbl2/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-kbl7/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][122] ([fdo#109441]) -> [PASS][123] +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-iclb5/igt@kms_psr@psr2_basic.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb2/igt@kms_psr@psr2_basic.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][124] ([i915#2684]) -> [WARN][125] ([i915#2681] / [i915#2684])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][126] ([i915#2681] / [i915#2684]) -> [FAIL][127] ([i915#2680])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][128], [FAIL][129]) ([i915#1814] / [i915#2295] / [i915#483]) -> [FAIL][130] ([i915#2295] / [i915#483])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-kbl1/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-kbl7/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-kbl3/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][131], [FAIL][132]) ([i915#1814] / [i915#2295] / [i915#2724]) -> [FAIL][133] ([i915#2295] / [i915#2724] / [i915#483])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-iclb4/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-iclb4/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb8/igt@runner@aborted.html
    - shard-apl:          ([FAIL][134], [FAIL][135]) ([i915#1814] / [i915#2295]) -> [FAIL][136] ([i915#2295])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-apl8/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-apl6/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-apl1/igt@runner@aborted.html
    - shard-glk:          ([FAIL][137], [FAIL][138]) ([i915#1814] / [i915#2295] / [i915#483] / [k.org#202321]) -> ([FAIL][139], [FAIL][140]) ([i915#2295] / [k.org#202321])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-glk7/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-glk6/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk6/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk9/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][141], [FAIL][142]) ([i915#1814] / [i915#2295] / [i915#2667]) -> ([FAIL][143], [FAIL][144]) ([i915#2295] / [i915#2426] / [i915#2667] / [i915#409])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-tglb3/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-tglb6/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb8/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/index.html

--===============6744053271552324159==
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
<tr><td><b>Series:</b></td><td>i915/gem_exec_balancer: Exercise non-persistent behaviours</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85310/">https://patchwork.freedesktop.org/series/85310/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5928_full -&gt; IGTPW_5340_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5340_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5340_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5340_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ctx_create@basic-files:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-iclb3/igt@gem_ctx_create@basic-files.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb6/igt@gem_ctx_create@basic-files.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-immediate:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-hsw4/igt@gem_eio@in-flight-contexts-immediate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-hsw4/igt@gem_eio@in-flight-contexts-immediate.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_5928_full and IGTPW_5340_full:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@gem_exec_balancer@nohangcheck:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 4.67] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 4.72] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@persistence:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 4.70] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5340_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb5/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109314">fdo#109314</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb7/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109314">fdo#109314</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-queued:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-hsw4/igt@gem_ctx_persistence@engines-queued.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb3/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_balancer@nohangcheck} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-snb7/igt@gem_exec_balancer@nohangcheck.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-apl4/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html">FAIL</a> ([i915#1567])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk6/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#658])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-apl3/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#588])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-kbl3/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-hsw2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +92 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-tglb2/igt@kms_async_flips@test-time-stamp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb5/igt@kms_async_flips@test-time-stamp.html">FAIL</a> ([i915#2597])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-apl3/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +48 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb2/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110725">fdo#110725</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb8/igt@kms_ccs@pipe-d-bad-rotation-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-single:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk5/igt@kms_chamelium@hdmi-crc-single.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [fdo#111827]) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb3/igt@kms_chamelium@hdmi-crc-single.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / [fdo#111827]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-kbl4/igt@kms_chamelium@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [fdo#111827]) +5 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-apl6/igt@kms_chamelium@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [fdo#111827]) +5 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb5/igt@kms_chamelium@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / [fdo#111827]) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-gamma:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-hsw2/igt@kms_color_chamelium@pipe-c-gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb7/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb2/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109300">fdo#109300</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111066">fdo#111066</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb3/igt@kms_content_protection@mei_interface.html">SKIP</a> ([fdo#111828])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-random:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html">FAIL</a> ([i915#54])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x21-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk3/igt@kms_cursor_crc@pipe-d-cursor-64x21-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +45 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html">DMESG-WARN</a> ([i915#2635])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-hsw2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-hsw8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html">DMESG-WARN</a> ([i915#2637]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html">DMESG-WARN</a> ([i915#1602]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite.html">FAIL</a> ([i915#49])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">FAIL</a> ([i915#49]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> ([fdo#111825]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-kbl6/igt@kms_hdr@bpc-switch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-kbl2/igt@kms_hdr@bpc-switch.html">DMESG-WARN</a> ([i915#180] / [i915#78])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk8/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / [i915#265]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / [i915#265]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / [i915#265]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb3/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html">SKIP</a> ([fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_onoff:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-kbl4/igt@kms_psr@cursor_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +48 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb1/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb1/igt@kms_psr@psr2_primary_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb3/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-kbl3/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#2437])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-apl2/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#2437])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk9/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#2437])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb2/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-detection:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb3/igt@nouveau_crc@pipe-c-ctx-flip-detection.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-outp-inactive:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb6/igt@nouveau_crc@pipe-d-source-outp-inactive.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb8/igt@nouveau_crc@pipe-d-source-outp-inactive.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / [i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb6/igt@prime_nv_api@i915_nv_import_twice.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@nv_write_i915_cpu_mmap_read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb8/igt@prime_nv_test@nv_write_i915_cpu_mmap_read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@sync@vcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-tglb8/igt@prime_vgem@sync@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb8/igt@prime_vgem@sync@vcs0.html">INCOMPLETE</a> ([i915#409])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-tglb2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#2867]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb8/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none-share@rcs0}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none@rcs0}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-glk6/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none@vcs0}:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-apl6/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace@vcs0}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-iclb8/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb5/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-hsw7/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-hsw1/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-glk3/igt@gem_exec_whisper@basic-fds-priority-all.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk4/igt@gem_exec_whisper@basic-fds-priority-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-iclb2/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> ([i915#2370]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> ([i915#2598]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">FAIL</a> ([i915#49]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-glk4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">FAIL</a> ([i915#49]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">FAIL</a> ([i915#49]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-iclb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">INCOMPLETE</a> ([i915#1185] / [i915#1602] / [i915#250]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">DMESG-WARN</a> ([i915#1602] / [i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-glk6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">DMESG-WARN</a> ([i915#1602] / [i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-hsw6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">DMESG-WARN</a> ([i915#2637]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-hsw8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-tglb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">INCOMPLETE</a> ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">DMESG-WARN</a> ([i915#1602]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-x:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-kbl2/igt@kms_plane_lowres@pipe-a-tiling-x.html">DMESG-WARN</a> ([i915#165]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-kbl7/igt@kms_plane_lowres@pipe-a-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-iclb5/igt@kms_psr@psr2_basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb2/igt@kms_psr@psr2_basic.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2681] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> ([i915#2680])</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-kbl7/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#483]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-kbl3/igt@runner@aborted.html">FAIL</a> ([i915#2295] / [i915#483])</p>
</li>
<li>
<p>shard-iclb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-iclb4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-iclb4/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2724]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-iclb8/igt@runner@aborted.html">FAIL</a> ([i915#2295] / [i915#2724] / [i915#483])</p>
</li>
<li>
<p>shard-apl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-apl6/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-apl1/igt@runner@aborted.html">FAIL</a> ([i915#2295])</p>
</li>
<li>
<p>shard-glk:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-glk7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-glk6/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#483] / [k.org#202321]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-glk9/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [k.org#202321])</p>
</li>
<li>
<p>shard-tglb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5928/shard-tglb6/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2667]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5340/shard-tglb2/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2426] / [i915#2667] / [i915#409])</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<p>[fdo#111825</p>

</body>
</html>

--===============6744053271552324159==--

--===============1689352392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1689352392==--
