Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 15 Jul 2021 16:40:42 -0000
Message-ID: <162636724254.18697.12748823948466372366@emeril.freedesktop.org>
References: <20210624173525.1526215-1-markyacoub@chromium.org>
In-Reply-To: <20210624173525.1526215-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fvblank=3A_Turn_on_hardware_before_testing_invalid_vblank?=
 =?utf-8?b?LiAocmV2OSk=?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0747810488=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0747810488==
Content-Type: multipart/alternative;
 boundary="===============5807569399897018278=="

--===============5807569399897018278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_vblank: Turn on hardware before testing invalid vblank. (rev9)
URL   : https://patchwork.freedesktop.org/series/90382/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6140_full -> IGTPW_6024_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6024_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6024_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6024_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_schedule@independent@vecs0:
    - shard-tglb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb3/igt@gem_exec_schedule@independent@vecs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb3/igt@gem_exec_schedule@independent@vecs0.html

  * igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant:
    - shard-tglb:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb3/igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant.html

  
Known issues
------------

  Here are the changes found in IGTPW_6024_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@legacy-engines-hostile@bsd2:
    - shard-iclb:         NOTRUN -> [FAIL][4] ([i915#2410])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb2/igt@gem_ctx_persistence@legacy-engines-hostile@bsd2.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#1099]) +5 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-snb5/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-tglb:         [PASS][6] -> [TIMEOUT][7] ([i915#3063])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb7/igt@gem_eio@in-flight-contexts-10ms.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb7/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][8] ([i915#3354])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-snb6/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-apl:          NOTRUN -> [FAIL][9] ([i915#2846])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl7/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          [PASS][10] -> [FAIL][11] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk1/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][12] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_reloc@basic-parallel:
    - shard-tglb:         [PASS][15] -> [TIMEOUT][16] ([i915#3737] / [i915#3779])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb3/igt@gem_exec_reloc@basic-parallel.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@gem_exec_reloc@basic-parallel.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-apl:          NOTRUN -> [FAIL][17] ([i915#3633]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl8/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][18] ([i915#3633])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#2190])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][20] ([i915#2658])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl3/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][21] ([i915#2658])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-snb5/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-glk:          NOTRUN -> [SKIP][22] ([fdo#109271]) +55 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk9/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#768])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([fdo#109312])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb5/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-iclb:         NOTRUN -> [SKIP][25] ([fdo#109312])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb8/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@input-checking:
    - shard-snb:          NOTRUN -> [DMESG-WARN][26] ([i915#3002])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-snb2/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#3297])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb2/igt@gem_userptr_blits@unsync-unmap.html
    - shard-tglb:         NOTRUN -> [SKIP][28] ([i915#3297])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb2/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#112306])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb6/igt@gen9_exec_parse@bb-start-cmd.html
    - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#112306])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb6/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#3288])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb3/igt@i915_pm_dc@dc9-dpms.html
    - shard-iclb:         NOTRUN -> [FAIL][32] ([i915#3343])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglb:         [PASS][33] -> [WARN][34] ([i915#2681] / [i915#2684])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb3/igt@i915_pm_rc6_residency@rc6-idle.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb5/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#111644] / [i915#1397] / [i915#2411])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#110892])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-kbl:          [PASS][37] -> [INCOMPLETE][38] ([i915#151] / [i915#155])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl2/igt@i915_pm_rpm@system-suspend-modeset.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl2/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_selftest@live@gt_heartbeat:
    - shard-tglb:         [PASS][39] -> [DMESG-FAIL][40] ([i915#3768])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb6/igt@i915_selftest@live@gt_heartbeat.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb5/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-glk:          [PASS][42] -> [DMESG-WARN][43] ([i915#118] / [i915#95]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#111614]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-apl:          NOTRUN -> [SKIP][45] ([fdo#109271] / [i915#3777])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#111615]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb5/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-apl:          NOTRUN -> [SKIP][47] ([fdo#109271]) +250 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#110723])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs:
    - shard-snb:          NOTRUN -> [SKIP][49] ([fdo#109271]) +365 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-snb6/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#3689]) +10 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb7/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> [SKIP][51] ([fdo#109271] / [fdo#111827]) +22 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl2/igt@kms_chamelium@vga-hpd.html

  * igt@kms_chamelium@vga-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl2/igt@kms_chamelium@vga-hpd-for-each-pipe.html

  * igt@kms_color@pipe-d-ctm-green-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109278] / [i915#1149])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@kms_color@pipe-d-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-5:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109284] / [fdo#111827]) +9 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb2/igt@kms_color_chamelium@pipe-b-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb7/igt@kms_color_chamelium@pipe-c-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-degamma:
    - shard-glk:          NOTRUN -> [SKIP][56] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk8/igt@kms_color_chamelium@pipe-d-degamma.html
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@kms_color_chamelium@pipe-d-degamma.html

  * igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
    - shard-snb:          NOTRUN -> [SKIP][58] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-snb6/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][59] ([i915#1319])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl2/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][60] ([i915#2105])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl7/igt@kms_content_protection@uevent.html
    - shard-apl:          NOTRUN -> [FAIL][61] ([i915#2105])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#3319]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109278]) +16 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-max-size-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#3359])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-max-size-offscreen.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109274] / [fdo#109278]) +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109349])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([i915#426])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb2/igt@kms_dp_tiled_display@basic-test-pattern.html
    - shard-tglb:         NOTRUN -> [SKIP][68] ([i915#426])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb2/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109274]) +5 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb7/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][70] -> [DMESG-WARN][71] ([i915#180]) +5 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [PASS][72] -> [DMESG-WARN][73] ([i915#180]) +4 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#2672]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109280]) +15 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          NOTRUN -> [SKIP][76] ([fdo#109271]) +91 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([fdo#111825]) +22 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-apl:          NOTRUN -> [DMESG-WARN][78] ([i915#180])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl8/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#109289]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb5/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][80] ([fdo#108145] / [i915#265]) +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][81] ([fdo#108145] / [i915#265])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk8/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][82] ([i915#265]) +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant:
    - shard-iclb:         [PASS][83] -> [SKIP][84] ([fdo#109278])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-iclb7/igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb2/igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_lowres@pipe-b-tiling-none:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([i915#3536])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb6/igt@kms_plane_lowres@pipe-b-tiling-none.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][86] ([fdo#112054])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-apl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#658]) +5 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
    - shard-kbl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#658]) +3 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html
    - shard-iclb:         NOTRUN -> [SKIP][89] ([i915#2920])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#2920]) +2 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html
    - shard-glk:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#658]) +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk9/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([i915#658]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([fdo#109642] / [fdo#111068] / [i915#658])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb6/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][94] -> [SKIP][95] ([fdo#109441])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-tglb:         NOTRUN -> [FAIL][96] ([i915#132] / [i915#3467])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][97] ([i915#31])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-snb5/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          NOTRUN -> [SKIP][98] ([fdo#109271] / [i915#533]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl3/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@nouveau_crc@pipe-a-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][99] ([i915#2530]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb5/igt@nouveau_crc@pipe-a-source-rg.html
    - shard-tglb:         NOTRUN -> [SKIP][100] ([i915#2530]) +2 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb6/igt@nouveau_crc@pipe-a-source-rg.html

  * igt@nouveau_crc@pipe-d-source-outp-complete:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([fdo#109278] / [i915#2530])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@nouveau_crc@pipe-d-source-outp-complete.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-iclb:         NOTRUN -> [SKIP][102] ([fdo#109289]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb6/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#112283])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@perf_pmu@event-wait@rcs0.html

  * igt@prime_vgem@fence-write-hang:
    - shard-iclb:         NOTRUN -> [SKIP][104] ([fdo#109295])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb1/igt@prime_vgem@fence-write-hang.html
    - shard-tglb:         NOTRUN -> [SKIP][105] ([fdo#109295])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@prime_vgem@fence-write-hang.html

  * igt@sysfs_clients@fair-1:
    - shard-glk:          NOTRUN -> [SKIP][106] ([fdo#109271] / [i915#2994]) +2 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk1/igt@sysfs_clients@fair-1.html
    - shard-iclb:         NOTRUN -> [SKIP][107] ([i915#2994]) +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@sysfs_clients@fair-1.html
    - shard-tglb:         NOTRUN -> [SKIP][108] ([i915#2994]) +2 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb3/igt@sysfs_clients@fair-1.html

  * igt@sysfs_clients@fair-7:
    - shard-apl:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#2994]) +5 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl3/igt@sysfs_clients@fair-7.html

  * igt@sysfs_clients@sema-25:
    - shard-kbl:          NOTRUN -> [SKIP][110] ([fdo#109271] / [i915#2994]) +2 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl2/igt@sysfs_clients@sema-25.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-tglb:         [TIMEOUT][111] ([i915#3063]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb1/igt@gem_eio@in-flight-contexts-1us.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [DMESG-WARN][113] ([i915#180]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl2/igt@gem_eio@in-flight-suspend.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl4/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          [FAIL][115] ([i915#2842]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl4/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl2/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [FAIL][117] ([i915#2842]) -> [PASS][118] +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [SKIP][119] ([fdo#109271]) -> [PASS][120] +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-glk:          [FAIL][121] ([i915#307] / [i915#3468]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk1/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk7/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [DMESG-WARN][123] ([i915#3698]) -> [PASS][124] +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-iclb7/igt@i915_pm_dc@dc6-psr.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-kbl:          [DMESG-WARN][125] -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl7/igt@i915_pm_rpm@drm-resources-equal.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl6/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-iclb:         [DMESG-WARN][127] -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-iclb2/igt@i915_pm_rpm@drm-resources-equal.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-glk:          [DMESG-WARN][129] -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk5/igt@i915_pm_rpm@drm-resources-equal.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk1/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-tglb:         [DMESG-WARN][131] ([i915#2411]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb3/igt@i915_pm_rpm@drm-resources-equal.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb3/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [DMESG-WARN][133] ([i915#118] / [i915#95]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk2/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [INCOMPLETE][135] ([i915#155]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][137] ([i915#2122]) -> [PASS][138] +1 similar issue
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-glk:          [FAIL][139]

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/index.html

--===============5807569399897018278==
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
<tr><td><b>Series:</b></td><td>tests/kms_vblank: Turn on hardware before testing invalid vblank. (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90382/">https://patchwork.freedesktop.org/series/90382/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6140_full -&gt; IGTPW_6024_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6024_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6024_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6024_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_schedule@independent@vecs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb3/igt@gem_exec_schedule@independent@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb3/igt@gem_exec_schedule@independent@vecs0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb3/igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6024_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile@bsd2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb2/igt@gem_ctx_persistence@legacy-engines-hostile@bsd2.html">FAIL</a> ([i915#2410])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-snb5/igt@gem_ctx_persistence@legacy-engines-queued.html">SKIP</a> ([fdo#109271] / [i915#1099]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb7/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb7/igt@gem_eio@in-flight-contexts-10ms.html">TIMEOUT</a> ([i915#3063])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-snb6/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#3354])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk1/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-parallel:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb3/igt@gem_exec_reloc@basic-parallel.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a> ([i915#3737] / [i915#3779])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl8/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#3633]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a> ([i915#3633])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl7/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl3/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-snb5/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk9/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([fdo#109271]) +55 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#768])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb5/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb8/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-snb2/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb2/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb2/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb6/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([fdo#112306])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb6/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([fdo#112306])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([i915#3288])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html">FAIL</a> ([i915#3343])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb3/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb5/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2681] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl2/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl2/igt@i915_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a> ([i915#151] / [i915#155])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb6/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb5/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> ([i915#3768])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-0.html">DMESG-WARN</a> ([i915#118] / [i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb5/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#111615]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([fdo#109271]) +250 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-snb6/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs.html">SKIP</a> ([fdo#109271]) +365 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb7/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html">SKIP</a> ([i915#3689]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl2/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl2/igt@kms_chamelium@vga-hpd-for-each-pipe.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-green-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@kms_color@pipe-d-ctm-green-to-red.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-5:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb2/igt@kms_color_chamelium@pipe-b-ctm-0-5.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb7/igt@kms_color_chamelium@pipe-c-ctm-0-5.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-degamma:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk8/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-snb6/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl2/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl7/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl7/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding.html">SKIP</a> ([i915#3319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html">SKIP</a> ([fdo#109278]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-max-size-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-max-size-offscreen.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> ([fdo#109349])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb2/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb2/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb7/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> ([fdo#109274]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">DMESG-WARN</a> ([i915#180]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109280]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +91 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#111825]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl8/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb5/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk8/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-iclb7/igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb2/igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant.html">SKIP</a> ([fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-none:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb6/igt@kms_plane_lowres@pipe-b-tiling-none.html">SKIP</a> ([i915#3536])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html">SKIP</a> ([fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html">SKIP</a> ([i915#2920])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html">SKIP</a> ([i915#2920]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk9/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb6/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@kms_psr@psr2_primary_mmap_gtt.html">FAIL</a> ([i915#132] / [i915#3467])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-snb5/igt@kms_setmode@basic.html">FAIL</a> ([i915#31])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl3/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-rg:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb5/igt@nouveau_crc@pipe-a-source-rg.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb6/igt@nouveau_crc@pipe-a-source-rg.html">SKIP</a> ([i915#2530]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-outp-complete:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@nouveau_crc@pipe-d-source-outp-complete.html">SKIP</a> ([fdo#109278] / [i915#2530])</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb6/igt@perf@per-context-mode-unprivileged.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb1/igt@prime_vgem@fence-write-hang.html">SKIP</a> ([fdo#109295])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@prime_vgem@fence-write-hang.html">SKIP</a> ([fdo#109295])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk1/igt@sysfs_clients@fair-1.html">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@sysfs_clients@fair-1.html">SKIP</a> ([i915#2994]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb3/igt@sysfs_clients@fair-1.html">SKIP</a> ([i915#2994]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-apl3/igt@sysfs_clients@fair-7.html">SKIP</a> ([fdo#109271] / [i915#2994]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl2/igt@sysfs_clients@sema-25.html">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb1/igt@gem_eio@in-flight-contexts-1us.html">TIMEOUT</a> ([i915#3063]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb1/igt@gem_eio@in-flight-contexts-1us.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl2/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl4/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl4/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl2/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk1/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">FAIL</a> ([i915#307] / [i915#3468]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk7/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-iclb7/igt@i915_pm_dc@dc6-psr.html">DMESG-WARN</a> ([i915#3698]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@drm-resources-equal:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl7/igt@i915_pm_rpm@drm-resources-equal.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl6/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-iclb2/igt@i915_pm_rpm@drm-resources-equal.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-iclb3/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk5/igt@i915_pm_rpm@drm-resources-equal.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk1/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb3/igt@i915_pm_rpm@drm-resources-equal.html">DMESG-WARN</a> ([i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-tglb3/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk2/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">INCOMPLETE</a> ([i915#155]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6024/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          [FAIL][139]</li>
</ul>
</li>
</ul>

</body>
</html>

--===============5807569399897018278==--

--===============0747810488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0747810488==--
