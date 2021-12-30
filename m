Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5287449122036976722=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 30 Dec 2021 10:19:09 -0000
Message-ID: <164085954982.9665.2833697284535640590@emeril.freedesktop.org>
References: <20211230081422.11703-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211230081422.11703-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIHN0?=
 =?utf-8?q?art_offset_and_alignment_detection_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============5287449122036976722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add start offset and alignment detection (rev3)
URL   : https://patchwork.freedesktop.org/series/98402/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11040_full -> IGTPW_6525_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6525_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6525_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/index.html

Participating hosts (19 -> 7)
------------------------------

  ERROR: It appears as if the changes made in IGTPW_6525_full prevented too many machines from booting.

  Missing    (12): shard-tglu-7 shard-tglu-6 shard-tglu-8 shard-tglu-1 pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 shard-tglu-3 shard-tglu-4 shard-tglu-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6525_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@kms:
    - shard-tglb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-tglb7/igt@gem_eio@kms.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-tglb8/igt@gem_eio@kms.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-glk:          [PASS][3] -> [FAIL][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-glk4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11040_full and IGTPW_6525_full:

### New IGT tests (1) ###

  * igt@gem_softpin@safe-alignment:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_6525_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#1099]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-snb6/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([i915#4525]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-iclb4/igt@gem_exec_balancer@parallel-contexts.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb6/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][8] -> [FAIL][9] ([i915#2846])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-kbl1/igt@gem_exec_fair@basic-deadline.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl6/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [PASS][10] -> [FAIL][11] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-iclb2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [PASS][12] -> [FAIL][13] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][14] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [PASS][15] -> [FAIL][16] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-tglb8/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#2851])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#2842]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-glk7/igt@gem_exec_fair@basic-pace@vecs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-glk1/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_lmem_swapping@basic:
    - shard-kbl:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#4613])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl3/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-apl:          NOTRUN -> [SKIP][22] ([fdo#109271] / [i915#4613])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-apl2/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([i915#4270])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-tglb1/igt@gem_pxp@create-regular-context-2.html
    - shard-iclb:         NOTRUN -> [SKIP][24] ([i915#4270])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb8/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][25] ([i915#3297])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-tglb8/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][26] ([i915#3297])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb1/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#1436] / [i915#716])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-apl3/igt@gen9_exec_parse@allowed-all.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-apl3/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglb:         NOTRUN -> [SKIP][29] ([i915#404])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-tglb2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-iclb:         NOTRUN -> [SKIP][30] ([i915#404])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#111615])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-iclb:         NOTRUN -> [SKIP][32] ([fdo#110723])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#3689] / [i915#3886]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-tglb6/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html
    - shard-glk:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#3886])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-glk1/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#109278] / [i915#3886])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb6/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#3886]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl1/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111615] / [i915#3689])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-tglb1/igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs.html

  * igt@kms_chamelium@dp-frame-dump:
    - shard-kbl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl7/igt@kms_chamelium@dp-frame-dump.html

  * igt@kms_chamelium@hdmi-hpd-after-suspend:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109284] / [fdo#111827])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb5/igt@kms_chamelium@hdmi-hpd-after-suspend.html
    - shard-apl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [fdo#111827])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-apl1/igt@kms_chamelium@hdmi-hpd-after-suspend.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-5:
    - shard-snb:          NOTRUN -> [SKIP][41] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-snb7/igt@kms_color_chamelium@pipe-d-ctm-0-5.html
    - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-tglb3/igt@kms_color_chamelium@pipe-d-ctm-0-5.html
    - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-glk9/igt@kms_color_chamelium@pipe-d-ctm-0-5.html
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-0-5.html

  * igt@kms_content_protection@legacy:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109300] / [fdo#111066])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb1/igt@kms_content_protection@legacy.html
    - shard-glk:          NOTRUN -> [SKIP][46] ([fdo#109271]) +34 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-glk9/igt@kms_content_protection@legacy.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][47] ([i915#1319]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl4/igt@kms_content_protection@legacy.html
    - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#111828])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-tglb8/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#109279] / [i915#3359]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109278] / [fdo#109279]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb4/igt@kms_cursor_crc@pipe-c-cursor-512x512-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-max-size-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#3359]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-max-size-onscreen.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109274] / [fdo#109278])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@pipe-d-single-move:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109278]) +6 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb3/igt@kms_cursor_legacy@pipe-d-single-move.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [PASS][54] -> [INCOMPLETE][55] ([i915#180] / [i915#636])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][56] -> [FAIL][57] ([i915#79])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#111825]) +12 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-tglb8/igt@kms_flip@2x-plain-flip-fb-recreate.html
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109274]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109280]) +7 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][61] ([fdo#109271]) +66 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-snb4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-kbl:          NOTRUN -> [SKIP][62] ([fdo#109271]) +125 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl3/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-apl:          NOTRUN -> [SKIP][63] ([fdo#109271]) +36 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-apl3/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109289])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb4/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html
    - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#109289])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-tglb8/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#533])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
    - shard-apl:          [PASS][67] -> [DMESG-WARN][68] ([i915#180]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][69] ([i915#265])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
    - shard-apl:          NOTRUN -> [FAIL][70] ([fdo#108145] / [i915#265]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html
    - shard-kbl:          NOTRUN -> [FAIL][71] ([fdo#108145] / [i915#265]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][72] ([fdo#108145] / [i915#265])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-glk2/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#2733])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-apl1/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html
    - shard-kbl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#2733])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl4/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html
    - shard-glk:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#2733])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-glk5/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#111068] / [i915#658])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
    - shard-kbl:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#658]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#2920])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-tglb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
    - shard-apl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#658])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-apl4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
    - shard-glk:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#658])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-glk1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][81] -> [SKIP][82] ([fdo#109441]) +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_writeback@writeback-check-output:
    - shard-kbl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#2437])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl7/igt@kms_writeback@writeback-check-output.html

  * igt@nouveau_crc@pipe-d-source-outp-complete:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109278] / [i915#2530])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb3/igt@nouveau_crc@pipe-d-source-outp-complete.html
    - shard-tglb:         NOTRUN -> [SKIP][85] ([i915#2530])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-tglb5/igt@nouveau_crc@pipe-d-source-outp-complete.html

  * igt@prime_nv_pcopy@test2:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109291])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb2/igt@prime_nv_pcopy@test2.html
    - shard-tglb:         NOTRUN -> [SKIP][87] ([fdo#109291])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-tglb2/igt@prime_nv_pcopy@test2.html

  * igt@sysfs_clients@busy:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([i915#2994]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-tglb3/igt@sysfs_clients@busy.html
    - shard-glk:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#2994]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-glk8/igt@sysfs_clients@busy.html

  * igt@sysfs_clients@fair-0:
    - shard-apl:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#2994])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-apl6/igt@sysfs_clients@fair-0.html
    - shard-iclb:         NOTRUN -> [SKIP][91] ([i915#2994])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb4/igt@sysfs_clients@fair-0.html

  * igt@sysfs_clients@pidname:
    - shard-kbl:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#2994]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl1/igt@sysfs_clients@pidname.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@smoketest:
    - shard-kbl:          [FAIL][93] ([i915#2896]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-kbl4/igt@gem_ctx_persistence@smoketest.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl7/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [DMESG-WARN][95] ([i915#180]) -> [PASS][96] +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-kbl4/igt@gem_eio@in-flight-suspend.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [SKIP][97] ([i915#4525]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-iclb5/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb2/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-glk:          [FAIL][99] ([i915#2842]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-glk4/igt@gem_exec_fair@basic-none@vcs0.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-glk9/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-kbl:          [FAIL][101] ([i915#2842]) -> [PASS][102] +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl3/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [SKIP][103] ([i915#4281]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb6/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_selftest@live@requests:
    - shard-tglb:         [DMESG-FAIL][105] -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-tglb5/igt@i915_selftest@live@requests.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-tglb1/igt@i915_selftest@live@requests.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [DMESG-WARN][107] ([i915#118]) -> [PASS][108] +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-glk8/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][109] ([i915#72]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][111] ([i915#2122]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-glk1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-iclb:         [SKIP][113] ([i915#3701]) -> [PASS][114] +2 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-glk:          [FAIL][115] ([i915#1888]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-glk7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-glk7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][117] ([fdo#109441]) -> [PASS][118] +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  
#### Warnings ####

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [TIMEOUT][119] ([i915#3063] / [i915#3648]) -> [FAIL][120] ([i915#232])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-tglb6/igt@gem_eio@unwedge-stress.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-tglb5/igt@gem_eio@unwedge-stress.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][121] ([i915#658]) -> [SKIP][122] ([i915#588])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][123] ([i915#1804] / [i915#2684]) -> [WARN][124] ([i915#2684])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-iclb:         [SKIP][125] ([fdo#111068] / [i915#658]) -> [FAIL][126] ([i915#4148])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-iclb8/igt@kms_psr2_su@page_flip-nv12.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#3002] / [i915#4312] / [i915#602]) -> ([FAIL][133], [FAIL][134], [FAIL][135], [FAIL][136]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#92])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-kbl4/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-kbl4/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-kbl4/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-kbl4/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-kbl3/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-kbl4/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl6/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl4/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl1/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl4/igt@runner@aborted.html
    - shard-apl:          ([FAIL][137], [FAIL][138], [FAIL][139]) ([fdo#109271] / [i915#1814] / [i915#3002] / [i915#4312]) -> ([FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146]) ([fdo#109271] / [i915#180] / [i915#1814] / [i915#3002] / [i915#4312])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-apl7/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-apl2/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-apl8/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-apl4/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-apl4/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-apl7/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-apl3/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-apl8/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-apl6/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-apl2/igt@run

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/index.html

--===============5287449122036976722==
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
<tr><td><b>Series:</b></td><td>Add start offset and alignment detection (re=
v3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/98402/">https://patchwork.freedesktop.org/series/98402/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_6525/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11040_full -&gt; IGTPW_6525_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6525_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_6525_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/index.=
html</p>
<h2>Participating hosts (19 -&gt; 7)</h2>
<p>ERROR: It appears as if the changes made in IGTPW_6525_full prevented to=
o many machines from booting.</p>
<p>Missing    (12): shard-tglu-7 shard-tglu-6 shard-tglu-8 shard-tglu-1 pig=
-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 shard-tglu-3 shar=
d-tglu-4 shard-tglu-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6525=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-tglb7/igt@gem_eio@kms.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-tglb8/igt@gem_eio@=
kms.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-glk4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-=
ytileccs-upscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_6525/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11040_full and IGTPW_6525_=
full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gem_softpin@safe-alignment:<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6525_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6525/shard-snb6/igt@gem_ctx_persistence@legacy-engines-=
mixed-process.html">SKIP</a> ([fdo#109271] / [i915#1099]) +1 similar issue<=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-iclb4/igt@gem_exec_balancer@parallel-contexts.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/=
shard-iclb6/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> ([i915#4=
525]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-kbl1/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kb=
l6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-iclb2/igt@gem_exec_fair@basic-none-share@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/=
shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2=
842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-k=
bl3/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6525/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html=
">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/=
shard-tglb8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2=
842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-k=
bl3/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2851])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-glk7/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-=
glk1/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +1 sim=
ilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6525/shard-kbl3/igt@gem_lmem_swapping@basic.html">SKIP<=
/a> ([fdo#109271] / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6525/shard-apl2/igt@gem_lmem_swapping@verify-random.htm=
l">SKIP</a> ([fdo#109271] / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-tglb1/igt@gem_pxp@create-regular-context-2.ht=
ml">SKIP</a> ([i915#4270])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-iclb8/igt@gem_pxp@create-regular-context-2.ht=
ml">SKIP</a> ([i915#4270])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-tglb8/igt@gem_userptr_blits@create-destroy-un=
sync.html">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-iclb1/igt@gem_userptr_blits@create-destroy-un=
sync.html">SKIP</a> ([i915#3297])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-apl3/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-apl=
3/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> ([i915#1436] / [i915=
#716])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-tglb2/igt@kms_atomic@plane-primary-overlay-mu=
table-zpos.html">SKIP</a> ([i915#404])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-iclb6/igt@kms_atomic@plane-primary-overlay-mu=
table-zpos.html">SKIP</a> ([i915#404])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#111615])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-iclb1/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#110723])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-tglb6/igt@kms_ccs@pipe-a-bad-pixel-format-y_t=
iled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +1 similar iss=
ue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-glk1/igt@kms_ccs@pipe-a-bad-pixel-format-y_ti=
led_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-iclb6/igt@kms_ccs@pipe-a-bad-pixel-format-y_t=
iled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6525/shard-kbl1/igt@kms_ccs@pipe-b-bad-aux-stride-y_til=
ed_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +2 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6525/shard-tglb1/igt@kms_ccs@pipe-b-crc-primary-basic-y=
f_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-frame-dump:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6525/shard-kbl7/igt@kms_chamelium@dp-frame-dump.html">S=
KIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-after-suspend:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-iclb5/igt@kms_chamelium@hdmi-hpd-after-suspen=
d.html">SKIP</a> ([fdo#109284] / [fdo#111827])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-apl1/igt@kms_chamelium@hdmi-hpd-after-suspend=
.html">SKIP</a> ([fdo#109271] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-5:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-snb7/igt@kms_color_chamelium@pipe-d-ctm-0-5.h=
tml">SKIP</a> ([fdo#109271] / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-tglb3/igt@kms_color_chamelium@pipe-d-ctm-0-5.=
html">SKIP</a> ([fdo#109284] / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-glk9/igt@kms_color_chamelium@pipe-d-ctm-0-5.h=
tml">SKIP</a> ([fdo#109271] / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-0-5.=
html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-iclb1/igt@kms_content_protection@legacy.html"=
>SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-glk9/igt@kms_content_protection@legacy.html">=
SKIP</a> ([fdo#109271]) +34 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-kbl4/igt@kms_content_protection@legacy.html">=
TIMEOUT</a> ([i915#1319]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-tglb8/igt@kms_content_protection@legacy.html"=
>SKIP</a> ([fdo#111828])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6525/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-512x5=
12-onscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +2 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6525/shard-iclb4/igt@kms_cursor_crc@pipe-c-cursor-512x5=
12-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +2 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-max-size-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6525/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-max-s=
ize-onscreen.html">SKIP</a> ([i915#3359]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6525/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipb=
-atomic-transitions.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6525/shard-iclb3/igt@kms_cursor_legacy@pipe-d-single-mo=
ve.html">SKIP</a> ([fdo#109278]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl4/=
igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#180] / [i915#636]=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-=
hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_6525/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-=
a1-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-tglb8/igt@kms_flip@2x-plain-flip-fb-recreate.=
html">SKIP</a> ([fdo#111825]) +12 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-iclb4/igt@kms_flip@2x-plain-flip-fb-recreate.=
html">SKIP</a> ([fdo#109274]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6525/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109280]) +7 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6525/shard-snb4/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +66 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6525/shard-kbl3/igt@kms_frontbuffer_tracking@psr-rgb101=
010-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +125 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-apl3/igt@kms_pipe_b_c_ivb@disable-pipe-b-enab=
le-pipe-c.html">SKIP</a> ([fdo#109271]) +36 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-iclb4/igt@kms_pipe_b_c_ivb@disable-pipe-b-ena=
ble-pipe-c.html">SKIP</a> ([fdo#109289])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-tglb8/igt@kms_pipe_b_c_ivb@disable-pipe-b-ena=
ble-pipe-c.html">SKIP</a> ([fdo#109289])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6525/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc=
-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend@p=
ipe-a-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_6525/shard-apl8/igt@kms_plane@plane-panning-bottom-right-s=
uspend@pipe-a-planes.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6525/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-alpha-=
transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-7=
efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-7=
efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6525/shard-glk2/igt@kms_plane_alpha_blend@pipe-c-consta=
nt-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-c=
lipping-clamping:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-apl1/igt@kms_plane_scaling@scaler-with-clippi=
ng-clamping@pipe-c-scaler-with-clipping-clamping.html">SKIP</a> ([fdo#10927=
1] / [i915#2733])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-kbl4/igt@kms_plane_scaling@scaler-with-clippi=
ng-clamping@pipe-c-scaler-with-clipping-clamping.html">SKIP</a> ([fdo#10927=
1] / [i915#2733])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-glk5/igt@kms_plane_scaling@scaler-with-clippi=
ng-clamping@pipe-c-scaler-with-clipping-clamping.html">SKIP</a> ([fdo#10927=
1] / [i915#2733])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-kbl3/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-tglb2/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area.html">SKIP</a> ([i915#2920])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-apl4/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-glk1/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-i=
clb1/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> ([fdo#109441]) +3 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6525/shard-kbl7/igt@kms_writeback@writeback-check-outpu=
t.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-outp-complete:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-iclb3/igt@nouveau_crc@pipe-d-source-outp-comp=
lete.html">SKIP</a> ([fdo#109278] / [i915#2530])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-tglb5/igt@nouveau_crc@pipe-d-source-outp-comp=
lete.html">SKIP</a> ([i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test2:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-iclb2/igt@prime_nv_pcopy@test2.html">SKIP</a>=
 ([fdo#109291])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-tglb2/igt@prime_nv_pcopy@test2.html">SKIP</a>=
 ([fdo#109291])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@busy:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-tglb3/igt@sysfs_clients@busy.html">SKIP</a> (=
[i915#2994]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-glk8/igt@sysfs_clients@busy.html">SKIP</a> ([=
fdo#109271] / [i915#2994]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-0:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-apl6/igt@sysfs_clients@fair-0.html">SKIP</a> =
([fdo#109271] / [i915#2994])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-iclb4/igt@sysfs_clients@fair-0.html">SKIP</a>=
 ([i915#2994])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@pidname:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6525/shard-kbl1/igt@sysfs_clients@pidname.html">SKIP</a=
> ([fdo#109271] / [i915#2994]) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-kbl4/igt@gem_ctx_persistence@smoketest.html">FAIL</a> (=
[i915#2896]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_6525/shard-kbl7/igt@gem_ctx_persistence@smoketest.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-kbl4/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a>=
 ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_6525/shard-kbl1/igt@gem_eio@in-flight-suspend.html">PASS</a> +2 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-iclb5/igt@gem_exec_balancer@parallel-keep-submit-fence.=
html">SKIP</a> ([i915#4525]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_6525/shard-iclb2/igt@gem_exec_balancer@parallel-keep-subm=
it-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-glk4/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (=
[i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_6525/shard-glk9/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> =
([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_6525/shard-kbl3/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> +1 sim=
ilar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([i915#428=
1]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/sh=
ard-iclb6/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-tglb5/igt@i915_selftest@live@requests.html">DMESG-FAIL<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/sh=
ard-tglb1/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG=
-WARN</a> ([i915#118]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_6525/shard-glk8/igt@kms_big_fb@linear-32bpp-rotate-180.html">PA=
SS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legac=
y.html">FAIL</a> ([i915#72]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_6525/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cur=
sor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le@bc-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#2122]) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-glk1/igt@kms_flip@2x-pla=
in-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp=
-ytile-downscaling.html">SKIP</a> ([i915#3701]) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-iclb8/igt@kms_flip_scaled_c=
rc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">PASS</a> +2 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-glk7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-=
ytile-downscaling.html">FAIL</a> ([i915#1888]) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-glk7/igt@kms_flip_scaled_crc=
@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> =
([fdo#109441]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_6525/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> +1 si=
milar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-tglb6/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i9=
15#3063] / [i915#3648]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_6525/shard-tglb5/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i=
915#232])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a=
> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_6525/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i=
915#588])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a=
> ([i915#1804] / [i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6525/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.htm=
l">WARN</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-iclb8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([f=
do#111068] / [i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_6525/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html">FAIL</a=
> ([i915#4148])</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-kbl4/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11040/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-kbl4/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_11040/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-kbl4/igt@runner@aborted.h=
tml">FAIL</a>) ([i915#1436] / [i915#180] / [i915#1814] / [i915#3002] / [i91=
5#4312] / [i915#602]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_6525/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl4/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_6525/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-kbl4/igt@runner@aborted.h=
tml">FAIL</a>) ([i915#180] / [i915#3002] / [i915#4312] / [i915#92])</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11040/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11040/shard-apl2/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11040/shard-apl8/igt@runner@aborted.html">FAIL</a>) ([fdo#109271] / [i=
915#1814] / [i915#3002] / [i915#4312]) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_6525/shard-apl4/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-a=
pl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_6525/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-apl3/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_6525/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6525/shard-apl6/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_6525/shard-apl2/igt@run">FAIL</a>) ([fdo#109271] / [i915#180] / [=
i915#1814] / [i915#3002] / [i915#4312])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============5287449122036976722==--
