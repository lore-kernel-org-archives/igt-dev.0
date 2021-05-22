Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 22 May 2021 17:51:51 -0000
Message-ID: <162170591110.491.788214741632869028@emeril.freedesktop.org>
References: <1621570724-24132-1-git-send-email-vidya.srinivas@intel.com>
In-Reply-To: <1621570724-24132-1-git-send-email-vidya.srinivas@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?drm=5Fread=3A_drm=5Fread_fails_for_subtest_invalid-buffer_on_ch?=
 =?utf-8?q?rome?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0021827349=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0021827349==
Content-Type: multipart/alternative;
 boundary="===============4282166970752534767=="

--===============4282166970752534767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/drm_read: drm_read fails for subtest invalid-buffer on chrome
URL   : https://patchwork.freedesktop.org/series/90391/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10117_full -> IGTPW_5830_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5830_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5830_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5830_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-suspend@c-edp1:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-iclb6/igt@kms_flip@flip-vs-suspend@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb3/igt@kms_flip@flip-vs-suspend@c-edp1.html

  
Known issues
------------

  Here are the changes found in IGTPW_5830_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1099]) +8 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-snb2/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][4] -> [TIMEOUT][5] ([i915#2369] / [i915#3063])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-tglb7/igt@gem_eio@unwedge-stress.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb8/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-apl:          NOTRUN -> [FAIL][6] ([i915#2846])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl8/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-apl:          [PASS][7] -> [SKIP][8] ([fdo#109271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-apl6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl1/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-tglb:         [PASS][9] -> [FAIL][10] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-tglb3/igt@gem_exec_fair@basic-pace@vcs1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb7/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#2842]) +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-glk2/igt@gem_exec_fair@basic-throttle@rcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-glk:          NOTRUN -> [FAIL][13] ([i915#2389]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-glk5/igt@gem_exec_reloc@basic-wide-active@bcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][14] ([i915#2389]) +4 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb2/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_reloc@basic-wide-active@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][15] ([i915#2389]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb6/igt@gem_exec_reloc@basic-wide-active@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#2190])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-tglb:         [PASS][17] -> [INCOMPLETE][18] ([i915#2910] / [i915#3468])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-tglb8/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb1/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-snb:          NOTRUN -> [INCOMPLETE][19] ([i915#2055] / [i915#3468])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-snb5/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-iclb:         [PASS][20] -> [FAIL][21] ([i915#2428])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_gtt@cpuset-big-copy-xy:
    - shard-iclb:         [PASS][22] -> [FAIL][23] ([i915#307])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy-xy.html

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-snb:          NOTRUN -> [INCOMPLETE][24] ([i915#3468])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-snb2/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@gem_pread@exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][25] ([i915#2658])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb3/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][26] ([i915#2658])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-glk5/igt@gem_pread@exhaustion.html
    - shard-apl:          NOTRUN -> [WARN][27] ([i915#2658])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl8/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][28] ([i915#2658])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb5/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][29] ([i915#2658])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-snb5/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][30] ([i915#2658])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl1/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@x-tiled-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#768])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb5/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([i915#3297]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb1/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#110542])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb7/igt@gem_userptr_blits@coherency-sync.html
    - shard-iclb:         NOTRUN -> [SKIP][34] ([fdo#109290])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb3/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#3323])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([i915#3297]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb6/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-snb:          NOTRUN -> [FAIL][37] ([i915#2724])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-snb6/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([fdo#109289]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb6/igt@gen7_exec_parse@batch-without-end.html
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#109289])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb6/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#112306]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb7/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#112306]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb1/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-large:
    - shard-kbl:          NOTRUN -> [FAIL][42] ([i915#3296])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl1/igt@gen9_exec_parse@bb-large.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#1937])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109293] / [fdo#109506]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#109506] / [i915#2411]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@i915_selftest@live@execlists:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][46] ([i915#2782] / [i915#3462] / [i915#794])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl4/igt@i915_selftest@live@execlists.html

  * igt@i915_suspend@debugfs-reader:
    - shard-apl:          NOTRUN -> [DMESG-WARN][47] ([i915#180])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl1/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][48] -> [DMESG-WARN][49] ([i915#180]) +3 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-kbl2/igt@i915_suspend@forcewake.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl4/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#110725] / [fdo#111614]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb5/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#111614])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb2/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#110723])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_joiner@basic:
    - shard-apl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [i915#2705])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl8/igt@kms_big_joiner@basic.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo:
    - shard-snb:          NOTRUN -> [SKIP][54] ([fdo#109271]) +598 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-snb2/igt@kms_ccs@pipe-a-ccs-on-another-bo.html

  * igt@kms_ccs@pipe-d-bad-rotation-90:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109278]) +18 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb3/igt@kms_ccs@pipe-d-bad-rotation-90.html

  * igt@kms_chamelium@hdmi-aspect-ratio:
    - shard-glk:          NOTRUN -> [SKIP][56] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-glk2/igt@kms_chamelium@hdmi-aspect-ratio.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +23 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl8/igt@kms_chamelium@vga-hpd.html

  * igt@kms_chamelium@vga-hpd-with-enabled-mode:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109284] / [fdo#111827]) +9 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb6/igt@kms_chamelium@vga-hpd-with-enabled-mode.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-snb:          NOTRUN -> [SKIP][59] ([fdo#109271] / [fdo#111827]) +30 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-snb6/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-75:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#109284] / [fdo#111827]) +10 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb2/igt@kms_color_chamelium@pipe-b-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes:
    - shard-kbl:          NOTRUN -> [SKIP][62] ([fdo#109271] / [fdo#111827]) +12 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl1/igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][63] ([i915#1319])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content_type_change:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109300] / [fdo#111066]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb5/igt@kms_content_protection@content_type_change.html

  * igt@kms_content_protection@srm:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#111828]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb5/igt@kms_content_protection@srm.html
    - shard-apl:          NOTRUN -> [TIMEOUT][66] ([i915#1319])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl3/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109278] / [fdo#109279]) +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#109279] / [i915#3359]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#3319]) +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#3359]) +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-kbl:          NOTRUN -> [SKIP][71] ([fdo#109271]) +176 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl1/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge:
    - shard-glk:          [PASS][72] -> [DMESG-WARN][73] ([i915#118] / [i915#95]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-glk3/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109274] / [fdo#109278]) +4 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109349])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#111825]) +31 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb7/igt@kms_flip@2x-plain-flip-ts-check.html
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109274]) +4 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb6/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-apl:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#2672]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109280]) +27 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][80] ([i915#180]) +3 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][81] ([fdo#109271]) +87 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-glk2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_invalid_dotclock:
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109310])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb3/igt@kms_invalid_dotclock.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][83] ([fdo#108145] / [i915#265]) +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][84] ([fdo#108145] / [i915#265]) +2 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][85] ([fdo#108145] / [i915#265])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-glk7/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][86] ([i915#265])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([fdo#111615]) +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb6/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([fdo#112054])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
    - shard-kbl:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#2733])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl1/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-kbl:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#658]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-2:
    - shard-apl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#658]) +5 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl7/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([i915#658]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
    - shard-glk:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#658])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-glk7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([i915#2920]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109441]) +3 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-tglb:         NOTRUN -> [FAIL][96] ([i915#132] / [i915#3467]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb3/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][97] ([i915#31])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-snb2/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-kbl:          NOTRUN -> [SKIP][98] ([fdo#109271] / [i915#533]) +2 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl1/igt@kms_vblank@pipe-d-wait-idle.html
    - shard-apl:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#533]) +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl7/igt@kms_vblank@pipe-d-wait-idle.html
    - shard-glk:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#533])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-glk9/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_vrr@flip-suspend:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([fdo#109502]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb6/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@flipline:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([fdo#109502]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb7/igt@kms_vrr@flipline.html

  * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
    - shard-apl:          NOTRUN -> [SKIP][103] ([fdo#109271]) +213 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl7/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html
    - shard-iclb:         NOTRUN -> [SKIP][104] ([i915#2530]) +2 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb3/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html

  * igt@nouveau_crc@pipe-c-source-outp-complete:
    - shard-tglb:         NOTRUN -> [SKIP][105] ([i915#2530]) +2 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb1/igt@nouveau_crc@pipe-c-source-outp-complete.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-iclb:         NOTRUN -> [SKIP][106] ([fdo#112283])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb1/igt@perf_pmu@event-wait@rcs0.html
    - shard-tglb:         NOTRUN -> [SKIP][107] ([fdo#112283])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb1/igt@perf_pmu@event-wait@rcs0.html

  * igt@prime_nv_api@i915_nv_import_twice:
    - shard-iclb:         NOTRUN -> [SKIP][108] ([fdo#109291]) +2 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb5/igt@prime_nv_api@i915_nv_import_twice.html

  * igt@prime_nv_api@i915_nv_import_vs_close:
    - shard-tglb:         NOTRUN -> [SKIP][109] ([fdo#109291]) +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb6/igt@prime_nv_api@i915_nv_import_vs_close.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-iclb:         NOTRUN -> [SKIP][110] ([fdo#109295])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb6/igt@prime_vgem@fence-flip-hang.html
    - shard-tglb:         NOTRUN -> [SKIP][111] ([fdo#109295])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb6/igt@prime_vgem@fence-flip-hang.html

  * igt@sysfs_clients@create:
    - shard-apl:          NOTRUN -> [SKIP][112] ([fdo#109271] / [i915#2994]) +3 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl1/igt@sysfs_clients@create.html

  * igt@sysfs_clients@fair-3:
    - shard-kbl:          NOTRUN -> [SKIP][113] ([fdo#109271] / [i915#2994]) +2 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl3/igt@sysfs_clients@fair-3.html

  * igt@sysfs_heartbeat_interval@precise@vecs0:
    - shard-iclb:         [PASS][114] -> [FAIL][115] ([i915#1755])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-iclb6/igt@sysfs_heartbeat_interval@precise@vecs0.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb6/igt@sysfs_heartbeat_interval@precise@vecs0.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [FAIL][116] ([i915#2842]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-glk4/igt@gem_exec_fair@basic-none-share@rcs0.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-kbl:          [FAIL][118] ([i915#2842]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-kbl7/igt@gem_exec_fair@basic-none@vecs0.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-tglb:         [FAIL][120] ([i915#2842]) -> [PASS][121] +1 similar issue
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-tglb3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb2/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][122] ([i915#2842]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][124] ([i915#2190]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb8/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-tglb:         [INCOMPLETE][126] ([i915#3468]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-tglb6/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb7/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
    - shard-iclb:         [INCOMPLETE][128] ([i915#3468]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-iclb6/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb3/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][130] ([i915#454]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb1/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_draw_crc@draw-method-rgb565-render-xtiled:
    - shard-glk:          [FAIL][132] -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-glk:          [FAIL][134] ([i915#49]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-glk9/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-glk2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][136] ([i915#

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/index.html

--===============4282166970752534767==
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
<tr><td><b>Series:</b></td><td>tests/drm_read: drm_read fails for subtest invalid-buffer on chrome</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90391/">https://patchwork.freedesktop.org/series/90391/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10117_full -&gt; IGTPW_5830_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5830_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5830_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5830_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@flip-vs-suspend@c-edp1:<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-iclb6/igt@kms_flip@flip-vs-suspend@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb3/igt@kms_flip@flip-vs-suspend@c-edp1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5830_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-snb2/igt@gem_ctx_persistence@legacy-engines-queued.html">SKIP</a> ([fdo#109271] / [i915#1099]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-tglb7/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb8/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl8/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-apl6/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl1/igt@gem_exec_fair@basic-none-share@rcs0.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-tglb3/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb7/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-glk2/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-glk5/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb2/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@rcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb6/igt@gem_exec_reloc@basic-wide-active@rcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl1/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-tglb8/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb1/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">INCOMPLETE</a> ([i915#2910] / [i915#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-snb5/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">INCOMPLETE</a> ([i915#2055] / [i915#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy.html">FAIL</a> ([i915#2428])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-xy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-snb2/igt@gem_mmap_gtt@fault-concurrent.html">INCOMPLETE</a> ([i915#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb3/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-glk5/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl8/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb5/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-snb5/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl1/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb5/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb1/igt@gem_userptr_blits@access-control.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb7/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([fdo#110542])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb3/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([fdo#109290])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl2/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb6/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-snb6/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#2724])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb6/igt@gen7_exec_parse@batch-without-end.html">SKIP</a> ([fdo#109289]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb6/igt@gen7_exec_parse@batch-without-end.html">SKIP</a> ([fdo#109289])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb7/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> ([fdo#112306]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb1/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> ([fdo#112306]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl1/igt@gen9_exec_parse@bb-large.html">FAIL</a> ([i915#3296])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109293] / [fdo#109506]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([fdo#109506] / [i915#2411]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl4/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> ([i915#2782] / [i915#3462] / [i915#794])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl1/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-kbl2/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl4/igt@i915_suspend@forcewake.html">DMESG-WARN</a> ([i915#180]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb5/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb2/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl8/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109271] / [i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-snb2/igt@kms_ccs@pipe-a-ccs-on-another-bo.html">SKIP</a> ([fdo#109271]) +598 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb3/igt@kms_ccs@pipe-d-bad-rotation-90.html">SKIP</a> ([fdo#109278]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-aspect-ratio:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-glk2/igt@kms_chamelium@hdmi-aspect-ratio.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl8/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb6/igt@kms_chamelium@vga-hpd-with-enabled-mode.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-snb6/igt@kms_chamelium@vga-hpd-without-ddc.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-75:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb2/igt@kms_color_chamelium@pipe-b-ctm-0-75.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl1/igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl1/igt@kms_content_protection@atomic.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb5/igt@kms_content_protection@content_type_change.html">SKIP</a> ([fdo#109300] / [fdo#111066]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb5/igt@kms_content_protection@srm.html">SKIP</a> ([fdo#111828]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl3/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding.html">SKIP</a> ([fdo#109279] / [i915#3359]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen.html">SKIP</a> ([i915#3319]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen.html">SKIP</a> ([i915#3359]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl1/igt@kms_cursor_crc@pipe-d-cursor-suspend.html">SKIP</a> ([fdo#109271]) +176 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-glk3/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html">DMESG-WARN</a> ([i915#118] / [i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> ([fdo#109349])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb7/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> ([fdo#111825]) +31 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb6/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> ([fdo#109274]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([fdo#109280]) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> ([i915#180]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-glk2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +87 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_dotclock:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb3/igt@kms_invalid_dotclock.html">SKIP</a> ([fdo#109310])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-glk7/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb6/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html">SKIP</a> ([fdo#111615]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html">SKIP</a> ([fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl1/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html">SKIP</a> ([fdo#109271] / [i915#2733])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl7/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-glk7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> ([fdo#109441]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb3/igt@kms_psr@psr2_primary_mmap_gtt.html">FAIL</a> ([i915#132] / [i915#3467]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-snb2/igt@kms_setmode@basic.html">FAIL</a> ([i915#31])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl1/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl7/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-glk9/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb6/igt@kms_vrr@flip-suspend.html">SKIP</a> ([fdo#109502]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb7/igt@kms_vrr@flipline.html">SKIP</a> ([fdo#109502]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl7/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html">SKIP</a> ([fdo#109271]) +213 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb3/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html">SKIP</a> ([i915#2530]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-complete:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb1/igt@nouveau_crc@pipe-c-source-outp-complete.html">SKIP</a> ([i915#2530]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb1/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb1/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb5/igt@prime_nv_api@i915_nv_import_twice.html">SKIP</a> ([fdo#109291]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_vs_close:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb6/igt@prime_nv_api@i915_nv_import_vs_close.html">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb6/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([fdo#109295])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb6/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([fdo#109295])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@create:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-apl1/igt@sysfs_clients@create.html">SKIP</a> ([fdo#109271] / [i915#2994]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl3/igt@sysfs_clients@fair-3.html">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vecs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-iclb6/igt@sysfs_heartbeat_interval@precise@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb6/igt@sysfs_heartbeat_interval@precise@vecs0.html">FAIL</a> ([i915#1755])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-glk4/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-kbl7/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-tglb3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb8/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-tglb6/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">INCOMPLETE</a> ([i915#3468]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-tglb7/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-iclb6/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">INCOMPLETE</a> ([i915#3468]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb3/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-iclb1/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-xtiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10117/shard-glk9/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">FAIL</a> ([i915#49]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5830/shard-glk2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          [DMESG-WARN][136] ([i915#</li>
</ul>
</li>
</ul>

</body>
</html>

--===============4282166970752534767==--

--===============0021827349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0021827349==--
