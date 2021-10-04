Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7200506945020523404=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 04 Oct 2021 15:36:19 -0000
Message-ID: <163336177947.1480.9638090744189520834@emeril.freedesktop.org>
References: <20211001085319.789392-1-stylon.wang@amd.com>
In-Reply-To: <20211001085319.789392-1-stylon.wang@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fhdr=3A_Fix_failure_to_read_output=5Fbpc_on_AMD_hardware?=
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
To: Stylon Wang <stylon.wang@amd.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============7200506945020523404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_hdr: Fix failure to read output_bpc on AMD hardware
URL   : https://patchwork.freedesktop.org/series/95313/
State : success

== Summary ==

CI Bug Log - changes from IGT_6229_full -> IGTPW_6274_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/index.html

Known issues
------------

  Here are the changes found in IGTPW_6274_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#1099]) +7 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-snb6/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][2] ([i915#3354])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-snb2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#2846])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl4/igt@gem_exec_fair@basic-deadline.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl6/igt@gem_exec_fair@basic-deadline.html
    - shard-apl:          NOTRUN -> [FAIL][5] ([i915#2846])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl7/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][6] ([i915#2842])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl4/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#2842])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-tglb:         [PASS][9] -> [FAIL][10] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb5/igt@gem_exec_fair@basic-pace@vcs1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb3/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#2842]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-glk7/igt@gem_exec_fair@basic-pace@vecs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-glk5/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][13] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb5/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-snb:          NOTRUN -> [SKIP][14] ([fdo#109271]) +484 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
    - shard-iclb:         NOTRUN -> [SKIP][15] ([fdo#109313])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb8/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
    - shard-tglb:         NOTRUN -> [SKIP][16] ([fdo#109313])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb8/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_reloc@basic-wc-cpu-active:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#62]) +6 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-apl3/igt@gem_exec_reloc@basic-wc-cpu-active.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl1/igt@gem_exec_reloc@basic-wc-cpu-active.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][19] -> [SKIP][20] ([i915#2190])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb5/igt@gem_huc_copy@huc-copy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([i915#768])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_userptr_blits@input-checking:
    - shard-apl:          NOTRUN -> [DMESG-WARN][22] ([i915#3002])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl6/igt@gem_userptr_blits@input-checking.html

  * igt@gen3_render_linear_blits:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([fdo#109289]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb8/igt@gen3_render_linear_blits.html

  * igt@gen3_render_mixed_blits:
    - shard-iclb:         NOTRUN -> [SKIP][24] ([fdo#109289])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb4/igt@gen3_render_mixed_blits.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-tglb:         NOTRUN -> [SKIP][25] ([i915#2856])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb2/igt@gen9_exec_parse@bb-chained.html

  * igt@i915_pm_backlight@fade_with_suspend:
    - shard-tglb:         [PASS][26] -> [INCOMPLETE][27] ([i915#4173] / [i915#456])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb1/igt@i915_pm_backlight@fade_with_suspend.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb7/igt@i915_pm_backlight@fade_with_suspend.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][28] ([i915#454])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html
    - shard-tglb:         NOTRUN -> [FAIL][29] ([i915#454])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb6/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#109293] / [fdo#109506])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#109506] / [i915#2411])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#1769])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb6/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [PASS][33] -> [DMESG-WARN][34] ([i915#118] / [i915#95]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#110725] / [fdo#111614])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb1/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#111614]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-kbl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#3777])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([fdo#110723])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb1/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-apl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#3777]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([i915#2705])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb1/igt@kms_big_joiner@2x-modeset.html
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#2705])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb3/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#3689] / [i915#3886]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb1/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#3886]) +8 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl3/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [i915#3886]) +12 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl3/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([i915#3689]) +14 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb5/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][46] ([fdo#109271] / [i915#3886])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-glk9/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109278] / [i915#3886])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb4/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_chamelium@dp-hpd-fast:
    - shard-glk:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-glk6/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-audio:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb8/igt@kms_chamelium@hdmi-audio.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827]) +21 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl3/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-snb:          NOTRUN -> [SKIP][51] ([fdo#109271] / [fdo#111827]) +24 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-snb6/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +21 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl6/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html

  * igt@kms_color@pipe-d-ctm-blue-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109278] / [i915#1149])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb4/igt@kms_color@pipe-d-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb3/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html

  * igt@kms_concurrent@pipe-d:
    - shard-tglb:         NOTRUN -> [FAIL][56] ([i915#1385])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb6/igt@kms_concurrent@pipe-d.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([i915#3116])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb8/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#3116])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-kbl:          NOTRUN -> [TIMEOUT][59] ([i915#1319]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl3/igt@kms_content_protection@legacy.html
    - shard-apl:          NOTRUN -> [TIMEOUT][60] ([i915#1319])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#111828])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb5/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109278] / [fdo#109279]) +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][63] -> [DMESG-WARN][64] ([i915#180]) +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-random:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([i915#3359]) +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:
    - shard-apl:          NOTRUN -> [FAIL][66] ([i915#3444])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
    - shard-kbl:          NOTRUN -> [FAIL][67] ([i915#3444])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:
    - shard-kbl:          NOTRUN -> [SKIP][68] ([fdo#109271]) +208 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl4/igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#3319]) +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#109279] / [i915#3359]) +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109278]) +23 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb8/igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([fdo#111825]) +32 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109274] / [fdo#109278]) +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-toggle:
    - shard-apl:          NOTRUN -> [DMESG-WARN][74] ([i915#62]) +6 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl1/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([i915#3788])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb3/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglb:         [PASS][76] -> [INCOMPLETE][77] ([i915#2411] / [i915#4173] / [i915#456]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb3/igt@kms_fbcon_fbt@fbc-suspend.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb7/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [PASS][78] -> [INCOMPLETE][79] ([i915#155] / [i915#180] / [i915#636])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#109274]) +6 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb1/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:
    - shard-glk:          [PASS][81] -> [FAIL][82] ([i915#79])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@b-dp1:
    - shard-apl:          [PASS][83] -> [DMESG-WARN][84] ([i915#180])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-apl2/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl3/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109280]) +16 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglb:         [PASS][86] -> [INCOMPLETE][87] ([i915#1373] / [i915#2828] / [i915#4173])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb1/igt@kms_hdr@bpc-switch-suspend.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_lease@invalid-create-leases:
    - shard-kbl:          NOTRUN -> [FAIL][88] ([i915#4262])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl6/igt@kms_lease@invalid-create-leases.html
    - shard-apl:          NOTRUN -> [FAIL][89] ([i915#4262])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl7/igt@kms_lease@invalid-create-leases.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][90] ([i915#265])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-glk9/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
    - shard-apl:          NOTRUN -> [FAIL][91] ([i915#265])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][92] ([i915#265])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][93] ([fdo#108145] / [i915#265]) +4 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][94] ([fdo#108145] / [i915#265]) +3 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][95] ([fdo#108145] / [i915#265]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-glk4/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_plane_cursor@pipe-d-viewport-size-256:
    - shard-glk:          NOTRUN -> [SKIP][96] ([fdo#109271]) +67 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-glk3/igt@kms_plane_cursor@pipe-d-viewport-size-256.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([i915#3536]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb7/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_plane_lowres@pipe-b-tiling-none:
    - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#3536]) +3 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb5/igt@kms_plane_lowres@pipe-b-tiling-none.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-glk:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#658])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-glk3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
    - shard-tglb:         NOTRUN -> [SKIP][100] ([i915#2920]) +2 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-apl:          NOTRUN -> [SKIP][101] ([fdo#109271] / [i915#658]) +3 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:
    - shard-kbl:          NOTRUN -> [SKIP][102] ([fdo#109271] / [i915#658])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109441]) +4 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-tglb:         NOTRUN -> [FAIL][104] ([i915#132] / [i915#3467]) +3 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb2/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [PASS][105] -> [SKIP][106] ([fdo#109441])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb1/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglb:         NOTRUN -> [SKIP][107] ([fdo#111615]) +6 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][108] ([i915#31])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-snb2/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][109] -> [DMESG-WARN][110] ([i915#180] / [i915#295])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle:
    - shard-apl:          NOTRUN -> [SKIP][111] ([fdo#109271]) +284 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl2/igt@kms_vblank@pipe-d-ts-continuation-idle.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-kbl:          NOTRUN -> [SKIP][112] ([fdo#109271] / [i915#533]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl3/igt@kms_vblank@pipe-d-wait-idle.html
    - shard-apl:          NOTRUN -> [SKIP][113] ([fdo#109271] / [i915#533]) +2 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl7/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][114] ([fdo#109271] / [i915#2437])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-glk3/igt@kms_writeback@writeback-fb-id.html
    - shard-tglb:         NOTRUN -> [SKIP][115] ([i915#2437])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb3/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-kbl:          NOTRUN -> [SKIP][116] ([fdo#109271] / [i915#2437])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl6/igt@kms_writeback@writeback-pixel-formats.html
    - shard-apl:          NOTRUN -> [SKIP][117] ([fdo#109271] / [i915#2437])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl7/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-c-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][118] ([i915#2530]) +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb6/igt@nouveau_crc@pipe-c-source-rg.html
    - shard-tglb:         NOTRUN -> [SKIP][119] ([i915#2530])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb8/igt@nouveau_crc@pipe-c-source-rg.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-tglb:         NOTRUN -> [SKIP][120] ([fdo#112283])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb3/igt@perf_pmu@event-wait@rcs0.html

  * igt@prime_nv_pcopy@test3_5:
    - shard-tglb:         NOTRUN -> [SKIP][121] ([fdo#109291]) +2 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb3/igt@prime_nv_pcopy@test3_5.html

  * igt@sysfs_clients@fair-3:
    - shard-kbl:          NOTRUN -> [SKIP][122] ([fdo#109271] / [i915#2994])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl6/igt@sysfs_clients@fair-3.html

  * igt@sysfs_clients@recycle-many:
    - shard-apl:          NOTRUN -> [SKIP][123] ([fdo#109271] / [i915#2994]) +2 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl6/igt@sysfs_clients@recycle-many.html

  
#### Possible fixes ####

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [TIMEOUT][124] ([i915#2369] / [i915#2481] / [i915#3070]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-iclb5/igt@gem_eio@unwedge-stress.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb8/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          [FAIL][126] ([i915#2842]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl1/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglb:         [FAIL][128] ([i915#2842]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb5/igt@gem_exec_fair@basic-pace@rcs0.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb3/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-iclb:         [FAIL][130] ([i915#2842]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-iclb2/igt@gem_exec_fair@basic-pace@vecs0.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb2/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-apl:          [DMESG-WARN][132] ([i915#180]) -> [PASS][133] +2 similar issues
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - shard-tglb:         [INCOMPLETE][134] ([i915#2411] / [i915#4173] / [i915#456]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [DMESG-WARN][136] ([i915#180]) -> [PASS][137] +5 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/index.html

--===============7200506945020523404==
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
<tr><td><b>Series:</b></td><td>tests/kms_hdr: Fix failure to read output_bpc on AMD hardware</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/95313/">https://patchwork.freedesktop.org/series/95313/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6229_full -&gt; IGTPW_6274_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6274_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-snb6/igt@gem_ctx_persistence@legacy-engines-queued.html">SKIP</a> ([fdo#109271] / [i915#1099]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-snb2/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#3354])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl4/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl4/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb5/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb3/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-glk7/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-glk5/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb5/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109271]) +484 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb8/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb8/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-active:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-apl3/igt@gem_exec_reloc@basic-wc-cpu-active.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl1/igt@gem_exec_reloc@basic-wc-cpu-active.html">DMESG-WARN</a> ([i915#62]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb5/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-linear.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl6/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb8/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen3_render_mixed_blits:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb4/igt@gen3_render_mixed_blits.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb2/igt@gen9_exec_parse@bb-chained.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade_with_suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb1/igt@i915_pm_backlight@fade_with_suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb7/igt@i915_pm_backlight@fade_with_suspend.html">INCOMPLETE</a> ([i915#4173] / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb6/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109293] / [fdo#109506])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109506] / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb6/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> ([i915#1769])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118] / [i915#95]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb1/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb1/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb1/igt@kms_big_joiner@2x-modeset.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb3/igt@kms_big_joiner@2x-modeset.html">SKIP</a> ([i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb1/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl3/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl3/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb5/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html">SKIP</a> ([i915#3689]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-glk9/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb4/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109278] / [i915#3886])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-glk6/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb8/igt@kms_chamelium@hdmi-audio.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl3/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-snb6/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl6/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb4/igt@kms_color@pipe-d-ctm-blue-to-red.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-limited-range:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb3/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-d:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb6/igt@kms_concurrent@pipe-d.html">FAIL</a> ([i915#1385])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl3/igt@kms_content_protection@legacy.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl7/igt@kms_content_protection@legacy.html">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb5/igt@kms_content_protection@lic.html">SKIP</a> ([fdo#111828])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html">SKIP</a> ([i915#3359]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">FAIL</a> ([i915#3444])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">FAIL</a> ([i915#3444])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl4/igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen.html">SKIP</a> ([fdo#109271]) +208 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen.html">SKIP</a> ([i915#3319]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement.html">SKIP</a> ([fdo#109279] / [i915#3359]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb8/igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge.html">SKIP</a> ([fdo#109278]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> ([fdo#111825]) +32 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-toggle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl1/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html">DMESG-WARN</a> ([i915#62]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb3/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html">SKIP</a> ([i915#3788])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb3/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb7/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#2411] / [i915#4173] / [i915#456]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#155] / [i915#180] / [i915#636])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb1/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> ([fdo#109274]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-apl2/igt@kms_flip@flip-vs-suspend@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl3/igt@kms_flip@flip-vs-suspend@b-dp1.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([fdo#109280]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb1/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb7/igt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</a> ([i915#1373] / [i915#2828] / [i915#4173])</li>
</ul>
</li>
<li>
<p>igt@kms_lease@invalid-create-leases:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl6/igt@kms_lease@invalid-create-leases.html">FAIL</a> ([i915#4262])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl7/igt@kms_lease@invalid-create-leases.html">FAIL</a> ([i915#4262])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-glk9/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-glk4/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-d-viewport-size-256:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-glk3/igt@kms_plane_cursor@pipe-d-viewport-size-256.html">SKIP</a> ([fdo#109271]) +67 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-y:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb7/igt@kms_plane_lowres@pipe-a-tiling-y.html">SKIP</a> ([i915#3536]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-none:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb5/igt@kms_plane_lowres@pipe-b-tiling-none.html">SKIP</a> ([i915#3536]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-glk3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html">SKIP</a> ([i915#2920]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> ([fdo#109441]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb2/igt@kms_psr@psr2_sprite_mmap_cpu.html">FAIL</a> ([i915#132] / [i915#3467]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb1/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> ([fdo#111615]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-snb2/igt@kms_setmode@basic.html">FAIL</a> ([i915#31])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#180] / [i915#295])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl2/igt@kms_vblank@pipe-d-ts-continuation-idle.html">SKIP</a> ([fdo#109271]) +284 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl3/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl7/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-glk3/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb3/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl6/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl7/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-rg:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb6/igt@nouveau_crc@pipe-c-source-rg.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb8/igt@nouveau_crc@pipe-c-source-rg.html">SKIP</a> ([i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb3/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_5:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb3/igt@prime_nv_pcopy@test3_5.html">SKIP</a> ([fdo#109291]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl6/igt@sysfs_clients@fair-3.html">SKIP</a> ([fdo#109271] / [i915#2994])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl6/igt@sysfs_clients@recycle-many.html">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-iclb5/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#2481] / [i915#3070]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb8/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl1/igt@gem_exec_fair@basic-none@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb5/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb3/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-iclb2/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-iclb2/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">INCOMPLETE</a> ([i915#2411] / [i915#4173] / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-tglb2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6274/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
</li>
</ul>

</body>
</html>

--===============7200506945020523404==--
