Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 15 Jul 2021 18:23:32 -0000
Message-ID: <162637341233.18699.14593278161154233368@emeril.freedesktop.org>
References: <20210715100932.2605648-1-matthew.auld@intel.com>
In-Reply-To: <20210715100932.2605648-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaWd0L2dl?=
 =?utf-8?q?m=5Fuserptr=3A_Exercise_new_PROBE_flag?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1049298144=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1049298144==
Content-Type: multipart/alternative;
 boundary="===============5048970011588988096=="

--===============5048970011588988096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: igt/gem_userptr: Exercise new PROBE flag
URL   : https://patchwork.freedesktop.org/series/92580/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6140_full -> IGTPW_6027_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6027_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6027_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6027_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_userptr_blits@probe} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb3/igt@gem_userptr_blits@probe.html

  * igt@gem_userptr_blits@process-exit-busy:
    - shard-snb:          [PASS][2] -> [DMESG-WARN][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-snb5/igt@gem_userptr_blits@process-exit-busy.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-snb6/igt@gem_userptr_blits@process-exit-busy.html
    - shard-tglb:         [PASS][4] -> [DMESG-WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb1/igt@gem_userptr_blits@process-exit-busy.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb1/igt@gem_userptr_blits@process-exit-busy.html
    - shard-glk:          [PASS][6] -> [DMESG-WARN][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk2/igt@gem_userptr_blits@process-exit-busy.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-glk6/igt@gem_userptr_blits@process-exit-busy.html
    - shard-iclb:         [PASS][8] -> [DMESG-WARN][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-iclb3/igt@gem_userptr_blits@process-exit-busy.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb8/igt@gem_userptr_blits@process-exit-busy.html
    - shard-kbl:          [PASS][10] -> [DMESG-WARN][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl2/igt@gem_userptr_blits@process-exit-busy.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-kbl1/igt@gem_userptr_blits@process-exit-busy.html

  * igt@kms_atomic_transition@modeset-transition@1x-outputs:
    - shard-tglb:         [PASS][12] -> [INCOMPLETE][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb3/igt@kms_atomic_transition@modeset-transition@1x-outputs.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb6/igt@kms_atomic_transition@modeset-transition@1x-outputs.html

  
New tests
---------

  New tests have been introduced between IGT_6140_full and IGTPW_6027_full:

### New IGT tests (1) ###

  * igt@gem_userptr_blits@probe:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_6027_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#1099]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-snb5/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][15] ([i915#3354])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-snb6/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-apl:          NOTRUN -> [FAIL][16] ([i915#2846])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl6/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl4/igt@gem_exec_fair@basic-none@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-kbl3/igt@gem_exec_fair@basic-none@rcs0.html
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#2842]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-glk7/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-apl:          NOTRUN -> [FAIL][21] ([i915#3633]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl2/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][22] ([i915#3633])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-snb:          NOTRUN -> [INCOMPLETE][23] ([i915#2055])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-snb5/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][24] ([i915#2658])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-snb7/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-glk:          NOTRUN -> [SKIP][25] ([fdo#109271]) +54 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-glk9/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html
    - shard-iclb:         NOTRUN -> [SKIP][26] ([i915#768])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb1/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([fdo#109312])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb1/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#109312])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb7/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@input-checking:
    - shard-snb:          NOTRUN -> [DMESG-WARN][29] ([i915#3002])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-snb7/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([i915#3297])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb7/igt@gem_userptr_blits@unsync-unmap.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#3297])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb1/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          NOTRUN -> [DMESG-WARN][32] ([i915#180])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl6/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#112306])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb5/igt@gen9_exec_parse@bb-start-cmd.html
    - shard-iclb:         NOTRUN -> [SKIP][34] ([fdo#112306])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb5/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#3288])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb1/igt@i915_pm_dc@dc9-dpms.html
    - shard-iclb:         NOTRUN -> [FAIL][36] ([i915#3343])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#1937])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#111644] / [i915#1397] / [i915#2411])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#110892])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          [PASS][40] -> [INCOMPLETE][41] ([i915#2199])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-glk9/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb1/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-glk:          [PASS][43] -> [DMESG-WARN][44] ([i915#118] / [i915#95])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-glk8/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#111614]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb1/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-tglb:         [PASS][46] -> [DMESG-WARN][47] ([i915#402])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb1/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb2/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
    - shard-iclb:         [PASS][48] -> [DMESG-WARN][49] ([i915#1226])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-iclb2/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb4/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-iclb:         [PASS][50] -> [DMESG-WARN][51] ([i915#3621]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-iclb8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-apl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [i915#3777]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#111615]) +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb5/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-apl:          NOTRUN -> [SKIP][54] ([fdo#109271]) +251 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#110723])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#3689]) +8 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb3/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html

  * igt@kms_chamelium@dp-mode-timings:
    - shard-apl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +26 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl1/igt@kms_chamelium@dp-mode-timings.html

  * igt@kms_chamelium@vga-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-kbl6/igt@kms_chamelium@vga-hpd-for-each-pipe.html

  * igt@kms_color@pipe-d-ctm-green-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109278] / [i915#1149])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb3/igt@kms_color@pipe-d-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-5:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb6/igt@kms_color_chamelium@pipe-b-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb6/igt@kms_color_chamelium@pipe-c-ctm-0-5.html
    - shard-glk:          NOTRUN -> [SKIP][62] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-glk1/igt@kms_color_chamelium@pipe-c-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
    - shard-snb:          NOTRUN -> [SKIP][63] ([fdo#109271] / [fdo#111827]) +20 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-snb7/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][64] ([i915#1319])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl2/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-glk:          [PASS][65] -> [FAIL][66] ([i915#3444])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk9/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][67] -> [DMESG-WARN][68] ([i915#180]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#109279] / [i915#3359])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#3319]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109278]) +14 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb6/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-max-size-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#3359])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-max-size-offscreen.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109274] / [fdo#109278]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109349])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb3/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([i915#426])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb8/igt@kms_dp_tiled_display@basic-test-pattern.html
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#426])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb1/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][77] -> [FAIL][78] ([i915#3451])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109274]) +4 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb4/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-apl:          [PASS][80] -> [DMESG-WARN][81] ([i915#180]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-apl1/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl6/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#2672]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-snb:          NOTRUN -> [SKIP][83] ([fdo#109271]) +379 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109280]) +16 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          NOTRUN -> [SKIP][85] ([fdo#109271]) +97 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-kbl3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][86] ([fdo#111825]) +25 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([fdo#109289]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb1/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
    - shard-tglb:         [PASS][88] -> [DMESG-WARN][89] ([i915#2868]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb5/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb5/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][90] ([i915#265]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          NOTRUN -> [FAIL][91] ([fdo#108145] / [i915#265]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#3794])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb2/igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_lowres@pipe-b-tiling-none:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([i915#3536])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb5/igt@kms_plane_lowres@pipe-b-tiling-none.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([fdo#112054])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb2/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
    - shard-apl:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#2733])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl1/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-apl:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#658]) +6 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
    - shard-kbl:          NOTRUN -> [SKIP][97] ([fdo#109271] / [i915#658]) +3 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
    - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#2920]) +2 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html
    - shard-glk:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#658]) +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-glk7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html
    - shard-iclb:         NOTRUN -> [SKIP][100] ([i915#2920])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([i915#658]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         NOTRUN -> [SKIP][102] ([fdo#109642] / [fdo#111068] / [i915#658])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb6/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_basic:
    - shard-tglb:         NOTRUN -> [FAIL][103] ([i915#132] / [i915#3467]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb7/igt@kms_psr@psr2_basic.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][104] -> [SKIP][105] ([fdo#109441])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb1/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         NOTRUN -> [SKIP][106] ([fdo#109441]) +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          NOTRUN -> [SKIP][107] ([fdo#109271] / [i915#533])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl7/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@nouveau_crc@pipe-a-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][108] ([i915#2530]) +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb7/igt@nouveau_crc@pipe-a-source-rg.html
    - shard-tglb:         NOTRUN -> [SKIP][109] ([i915#2530]) +2 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb1/igt@nouveau_crc@pipe-a-source-rg.html

  * igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:
    - shard-iclb:         NOTRUN -> [SKIP][110] ([fdo#109278] / [i915#2530])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb6/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-iclb:         NOTRUN -> [SKIP][111] ([fdo#109289]) +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb7/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-iclb:         NOTRUN -> [SKIP][112] ([fdo#112283])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb5/igt@perf_pmu@event-wait@rcs0.html
    - shard-tglb:         NOTRUN -> [SKIP][113] ([fdo#112283])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb2/igt@perf_pmu@event-wait@rcs0.html

  * igt@prime_vgem@fence-write-hang:
    - shard-iclb:         NOTRUN -> [SKIP][114] ([fdo#109295])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb7/igt@prime_vgem@fence-write-hang.html
    - shard-tglb:         NOTRUN -> [SKIP][115] ([fdo#109295])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb5/igt@prime_vgem@fence-write-hang.html

  * igt@sysfs_clients@fair-1:
    - shard-glk:          NOTRUN -> [SKIP][116] ([fdo#109271] / [i915#2994]) +2 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-glk3/igt@sysfs_clients@fair-1.html
    - shard-iclb:         NOTRUN -> [SKIP][117] ([i915#2994]) +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb4/igt@sysfs_clients@fair-1.html
    - shard-tglb:         NOTRUN -> [SKIP][118] ([i915#2994]) +2 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb2/igt@sysfs_clients@fair-1.html

  * igt@sysfs_clients@fair-7:
    - shard-apl:          NOTRUN -> [SKIP][119] ([fdo#109271] / [i915#2994]) +3 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl3/igt@sysfs_clients@fair-7.html

  * igt@sysfs_clients@sema-25:
    - shard-kbl:          NOTRUN -> [SKIP][120] ([fdo#109271] / [i915#2994]) +2 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-kbl2/igt@sysfs_clients@sema-25.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-tglb:         [TIMEOUT][121] ([i915#3063]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb1/igt@gem_eio@in-flight-contexts-1us.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb3/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [DMESG-WARN][123] ([i915#180]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl2/igt@gem_eio@in-flight-suspend.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-kbl6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-kbl:          [FAIL][125] ([i915#2842]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-kbl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          [SKIP][127] ([fdo#109271]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][129] ([i915#2842]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-glk:          [FAIL][131] ([i915#307] / [i915#3468]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk1/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-glk6/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-kbl:          [DMESG-WARN][133] -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl7/igt@i915_pm_rpm@drm-resources-equal.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-kbl4/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-iclb:         [DMESG-WARN][135] -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-iclb2/igt@i915_pm_rpm@drm-resources-equal.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb6/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-glk:          [DMESG-WARN][137] -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk5/igt@i915_pm_rpm@drm-resources-equal.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-glk1/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-tglb:         [DMESG-W

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/index.html

--===============5048970011588988096==
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
<tr><td><b>Series:</b></td><td>igt/gem_userptr: Exercise new PROBE flag</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/92580/">https://patchwork.freedesktop.org/series/92580/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6140_full -&gt; IGTPW_6027_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6027_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6027_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6027_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_userptr_blits@probe} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb3/igt@gem_userptr_blits@probe.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-busy:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-snb5/igt@gem_userptr_blits@process-exit-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-snb6/igt@gem_userptr_blits@process-exit-busy.html">DMESG-WARN</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb1/igt@gem_userptr_blits@process-exit-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb1/igt@gem_userptr_blits@process-exit-busy.html">DMESG-WARN</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk2/igt@gem_userptr_blits@process-exit-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-glk6/igt@gem_userptr_blits@process-exit-busy.html">DMESG-WARN</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-iclb3/igt@gem_userptr_blits@process-exit-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb8/igt@gem_userptr_blits@process-exit-busy.html">DMESG-WARN</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl2/igt@gem_userptr_blits@process-exit-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-kbl1/igt@gem_userptr_blits@process-exit-busy.html">DMESG-WARN</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition@1x-outputs:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb3/igt@kms_atomic_transition@modeset-transition@1x-outputs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb6/igt@kms_atomic_transition@modeset-transition@1x-outputs.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6140_full and IGTPW_6027_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gem_userptr_blits@probe:<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6027_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-snb5/igt@gem_ctx_persistence@legacy-engines-queued.html">SKIP</a> ([fdo#109271] / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-snb6/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#3354])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl4/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-kbl3/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-glk7/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl2/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#3633]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a> ([i915#3633])</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-snb5/igt@gem_fenced_exec_thrash@no-spare-fences.html">INCOMPLETE</a> ([i915#2055])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-snb7/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-glk9/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([fdo#109271]) +54 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb1/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#768])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb1/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb7/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-snb7/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb7/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb1/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl6/igt@gem_workarounds@suspend-resume-context.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb5/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([fdo#112306])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb5/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([fdo#112306])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb1/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([i915#3288])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html">FAIL</a> ([i915#3343])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk1/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-glk9/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE</a> ([i915#2199])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb1/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-glk8/igt@kms_big_fb@linear-32bpp-rotate-0.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb1/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb1/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb2/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#402])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-iclb2/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb4/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#1226])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-iclb8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">DMESG-WARN</a> ([i915#3621]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb5/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#111615]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([fdo#109271]) +251 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb3/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html">SKIP</a> ([i915#3689]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-mode-timings:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl1/igt@kms_chamelium@dp-mode-timings.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-kbl6/igt@kms_chamelium@vga-hpd-for-each-pipe.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-green-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb3/igt@kms_color@pipe-d-ctm-green-to-red.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-5:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb6/igt@kms_color_chamelium@pipe-b-ctm-0-5.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-5:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb6/igt@kms_color_chamelium@pipe-c-ctm-0-5.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-glk1/igt@kms_color_chamelium@pipe-c-ctm-0-5.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-snb7/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl2/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk9/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html">FAIL</a> ([i915#3444])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen.html">SKIP</a> ([fdo#109279] / [i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding.html">SKIP</a> ([i915#3319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb6/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html">SKIP</a> ([fdo#109278]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-max-size-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-max-size-offscreen.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb3/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> ([fdo#109349])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb8/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb1/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html">FAIL</a> ([i915#3451])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb4/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> ([fdo#109274]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-apl1/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl6/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> ([fdo#109271]) +379 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109280]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-kbl3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +97 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#111825]) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb1/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb5/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb5/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html">DMESG-WARN</a> ([i915#2868]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb2/igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant.html">SKIP</a> ([i915#3794])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-none:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb5/igt@kms_plane_lowres@pipe-b-tiling-none.html">SKIP</a> ([i915#3536])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb2/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html">SKIP</a> ([fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl1/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html">SKIP</a> ([fdo#109271] / [i915#2733])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html">SKIP</a> ([i915#2920]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-glk7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html">SKIP</a> ([i915#2920])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb6/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb7/igt@kms_psr@psr2_basic.html">FAIL</a> ([i915#132] / [i915#3467]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb1/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl7/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-rg:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb7/igt@nouveau_crc@pipe-a-source-rg.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb1/igt@nouveau_crc@pipe-a-source-rg.html">SKIP</a> ([i915#2530]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb6/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html">SKIP</a> ([fdo#109278] / [i915#2530])</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb7/igt@perf@per-context-mode-unprivileged.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb5/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb2/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb7/igt@prime_vgem@fence-write-hang.html">SKIP</a> ([fdo#109295])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb5/igt@prime_vgem@fence-write-hang.html">SKIP</a> ([fdo#109295])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-glk3/igt@sysfs_clients@fair-1.html">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb4/igt@sysfs_clients@fair-1.html">SKIP</a> ([i915#2994]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb2/igt@sysfs_clients@fair-1.html">SKIP</a> ([i915#2994]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-apl3/igt@sysfs_clients@fair-7.html">SKIP</a> ([fdo#109271] / [i915#2994]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-kbl2/igt@sysfs_clients@sema-25.html">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-tglb1/igt@gem_eio@in-flight-contexts-1us.html">TIMEOUT</a> ([i915#3063]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-tglb3/igt@gem_eio@in-flight-contexts-1us.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl2/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-kbl6/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-kbl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk1/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">FAIL</a> ([i915#307] / [i915#3468]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-glk6/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@drm-resources-equal:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-kbl7/igt@i915_pm_rpm@drm-resources-equal.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-kbl4/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-iclb2/igt@i915_pm_rpm@drm-resources-equal.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-iclb6/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6140/shard-glk5/igt@i915_pm_rpm@drm-resources-equal.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6027/shard-glk1/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         [DMESG-W</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============5048970011588988096==--

--===============1049298144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1049298144==--
