Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1129538792997998248=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 10 Aug 2021 19:18:59 -0000
Message-ID: <162862313913.29684.14503251191399204977@emeril.freedesktop.org>
References: <20210810081440.21803-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20210810081440.21803-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9p?=
 =?utf-8?q?ntel=5Fmemory=5Fregion=3A_Add_missing_forward_declaration?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1129538792997998248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/intel_memory_region: Add missing forward declaration
URL   : https://patchwork.freedesktop.org/series/93540/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10463_full -> IGTPW_6107_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/index.html

Known issues
------------

  Here are the changes found in IGTPW_6107_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-massive:
    - shard-snb:          NOTRUN -> [DMESG-WARN][1] ([i915#3002])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-snb7/igt@gem_create@create-massive.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][2] ([i915#3002])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk7/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1099]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-snb2/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglb:         NOTRUN -> [SKIP][4] ([i915#280])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb7/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#2842]) +4 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-glk7/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk1/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][7] ([i915#2842]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb5/igt@gem_exec_fair@basic-pace-solo@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][8] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb8/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-tglb:         [PASS][9] -> [FAIL][10] ([i915#2842]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-tglb7/igt@gem_exec_fair@basic-pace@vecs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb6/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#2190])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap_gtt@cpuset-big-copy-xy:
    - shard-iclb:         [PASS][12] -> [FAIL][13] ([i915#307])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-iclb5/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb4/igt@gem_mmap_gtt@cpuset-big-copy-xy.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][14] ([i915#2658])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-snb6/igt@gem_pread@exhaustion.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-tglb:         NOTRUN -> [SKIP][15] ([fdo#110542])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb7/igt@gem_userptr_blits@coherency-sync.html
    - shard-iclb:         NOTRUN -> [SKIP][16] ([fdo#109290])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb8/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][17] ([i915#3297])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb2/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][18] -> [DMESG-WARN][19] ([i915#180]) +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-apl7/igt@gem_workarounds@suspend-resume-context.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl6/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-apl:          NOTRUN -> [SKIP][20] ([fdo#109271]) +254 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl3/igt@gen7_exec_parse@basic-offset.html
    - shard-tglb:         NOTRUN -> [SKIP][21] ([fdo#109289]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb2/igt@gen7_exec_parse@basic-offset.html
    - shard-iclb:         NOTRUN -> [SKIP][22] ([fdo#109289]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb6/igt@gen7_exec_parse@basic-offset.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([i915#2856]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb6/igt@gen9_exec_parse@bb-start-cmd.html
    - shard-iclb:         NOTRUN -> [SKIP][24] ([i915#2856])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb1/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         NOTRUN -> [SKIP][25] ([i915#1904])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb3/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][26] -> [FAIL][27] ([i915#454])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#109289] / [fdo#111719])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-glk:          NOTRUN -> [SKIP][29] ([fdo#109271]) +65 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk1/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#579]) +4 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@i915_query@query-topology-unsupported:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#109302])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb3/igt@i915_query@query-topology-unsupported.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [PASS][32] -> [DMESG-WARN][33] ([i915#118] / [i915#95]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-glk1/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#111614])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-apl:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#3777])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-kbl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#3777])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111615]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb3/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#3689]) +10 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb3/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#3886]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk9/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#3886]) +6 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl7/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#3886]) +11 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl6/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109278] / [i915#3886])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb8/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][43] ([i915#3689] / [i915#3886])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb6/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs:
    - shard-snb:          NOTRUN -> [SKIP][44] ([fdo#109271]) +320 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-snb5/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_chamelium@dp-crc-single:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb5/igt@kms_chamelium@dp-crc-single.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - shard-snb:          NOTRUN -> [SKIP][46] ([fdo#109271] / [fdo#111827]) +17 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-snb6/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-kbl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl1/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +21 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl7/igt@kms_chamelium@vga-hpd.html
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#109284] / [fdo#111827]) +11 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb5/igt@kms_chamelium@vga-hpd.html

  * igt@kms_color@pipe-d-ctm-negative:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109278] / [i915#1149])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb5/igt@kms_color@pipe-d-ctm-negative.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-25:
    - shard-glk:          NOTRUN -> [SKIP][51] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk7/igt@kms_color_chamelium@pipe-d-ctm-0-25.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][52] ([i915#1319])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          NOTRUN -> [TIMEOUT][53] ([i915#1319])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl2/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][54] ([i915#2105])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl4/igt@kms_content_protection@uevent.html
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#111828]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb1/igt@kms_content_protection@uevent.html
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109300] / [fdo#111066])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:
    - shard-kbl:          NOTRUN -> [SKIP][57] ([fdo#109271]) +169 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding:
    - shard-glk:          [PASS][58] -> [FAIL][59] ([i915#3444])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-glk5/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
    - shard-kbl:          [PASS][60] -> [FAIL][61] ([i915#3444])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#3319]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#109279] / [i915#3359]) +5 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109278] / [fdo#109279])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb4/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109278]) +14 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb3/igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#3359]) +4 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@pipe-d-single-bo:
    - shard-kbl:          NOTRUN -> [SKIP][68] ([fdo#109271] / [i915#533])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl3/igt@kms_cursor_legacy@pipe-d-single-bo.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109274]) +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb1/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][70] ([i915#180]) +4 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          NOTRUN -> [DMESG-WARN][71] ([i915#180]) +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109280]) +9 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([fdo#111825]) +31 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][74] -> [SKIP][75] ([i915#433])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
    - shard-glk:          NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#533])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk3/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#533]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][78] ([fdo#108145] / [i915#265]) +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
    - shard-kbl:          NOTRUN -> [FAIL][79] ([fdo#108145] / [i915#265]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][80] ([i915#265])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_lowres@pipe-b-tiling-y:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([i915#3536])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb3/igt@kms_plane_lowres@pipe-b-tiling-y.html

  * igt@kms_plane_lowres@pipe-d-tiling-y:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([i915#3536]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb2/igt@kms_plane_lowres@pipe-d-tiling-y.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([i915#658]) +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-apl:          NOTRUN -> [SKIP][84] ([fdo#109271] / [i915#658]) +8 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html
    - shard-tglb:         NOTRUN -> [SKIP][85] ([i915#2920]) +3 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-3:
    - shard-kbl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#658]) +3 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl2/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][87] -> [SKIP][88] ([fdo#109642] / [fdo#111068] / [i915#658])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb5/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr2_su@page_flip:
    - shard-glk:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#658]) +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk6/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][90] -> [SKIP][91] ([fdo#109441]) +2 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-tglb:         NOTRUN -> [FAIL][92] ([i915#132] / [i915#3467]) +2 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb8/igt@kms_psr@psr2_sprite_plane_onoff.html
    - shard-iclb:         NOTRUN -> [SKIP][93] ([fdo#109441])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb5/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][94] ([i915#31])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-snb6/igt@kms_setmode@basic.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-glk:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#2437])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk3/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-tglb:         NOTRUN -> [SKIP][96] ([i915#2437])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb7/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-a-source-rg:
    - shard-tglb:         NOTRUN -> [SKIP][97] ([i915#2530]) +3 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb2/igt@nouveau_crc@pipe-a-source-rg.html

  * igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([i915#2530]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb4/igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame.html

  * igt@prime_nv_api@i915_self_import:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([fdo#109291]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb2/igt@prime_nv_api@i915_self_import.html

  * igt@prime_udl:
    - shard-iclb:         NOTRUN -> [SKIP][100] ([fdo#109291])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb4/igt@prime_udl.html

  * igt@prime_vgem@basic-userptr:
    - shard-tglb:         NOTRUN -> [SKIP][101] ([i915#3301])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb1/igt@prime_vgem@basic-userptr.html
    - shard-iclb:         NOTRUN -> [SKIP][102] ([i915#3301])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb4/igt@prime_vgem@basic-userptr.html

  * igt@sysfs_clients@create:
    - shard-glk:          NOTRUN -> [SKIP][103] ([fdo#109271] / [i915#2994])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk5/igt@sysfs_clients@create.html
    - shard-tglb:         NOTRUN -> [SKIP][104] ([i915#2994])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb7/igt@sysfs_clients@create.html
    - shard-apl:          NOTRUN -> [SKIP][105] ([fdo#109271] / [i915#2994]) +4 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl7/igt@sysfs_clients@create.html
    - shard-iclb:         NOTRUN -> [SKIP][106] ([i915#2994])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb3/igt@sysfs_clients@create.html

  * igt@sysfs_clients@pidname:
    - shard-kbl:          NOTRUN -> [SKIP][107] ([fdo#109271] / [i915#2994]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl3/igt@sysfs_clients@pidname.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [FAIL][108] ([i915#2842]) -> [PASS][109] +3 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl2/igt@gem_exec_fair@basic-pace@rcs0.html
    - shard-tglb:         [FAIL][110] ([i915#2876]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-tglb7/igt@gem_exec_fair@basic-pace@rcs0.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb6/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [SKIP][112] ([fdo#109271]) -> [PASS][113] +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl2/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [FAIL][114] ([i915#2842]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html
    - shard-iclb:         [FAIL][116] ([i915#2849]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-iclb:         [FAIL][118] ([i915#307]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb1/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-random:
    - shard-kbl:          [FAIL][120] ([i915#3444]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][122] ([i915#180]) -> [PASS][123] +3 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:
    - shard-iclb:         [SKIP][124] ([i915#3788]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-iclb2/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb3/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][126] ([fdo#109441]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-iclb1/igt@kms_psr@psr2_dpms.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb2/igt@kms_psr@psr2_dpms.html

  * igt@kms_vblank@pipe-a-wait-forked-busy-hang:
    - shard-glk:          [SKIP][128] ([fdo#109271]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-glk3/igt@kms_vblank@pipe-a-wait-forked-busy-hang.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk3/igt@kms_vblank@pipe-a-wait-forked-busy-hang.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][130] ([i915#2684]) -> [WARN][131] ([i915#1804] / [i915#2684])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:
    - shard-iclb:         [SKIP][132] ([i915#658]) -> [SKIP][133] ([i915#2920])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-iclb4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:
    - shard-iclb:         [SKIP][134] ([i915#2920]) -> [SKIP][135] ([i915#658]) +2 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#2505] / [i915#3002] / [i915#3363]) -> ([FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148]) ([i915#180] / [i915#1814] / [i915#2505] / [i915#3002] / [i915#3363] / [i915#602])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-kbl7/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-kbl6/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-kbl6/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-kbl6/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-kbl6/igt@runner@abort

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/index.html

--===============1129538792997998248==
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
<tr><td><b>Series:</b></td><td>i915/intel_memory_region: Add missing forward declaration</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93540/">https://patchwork.freedesktop.org/series/93540/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10463_full -&gt; IGTPW_6107_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6107_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-snb7/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk7/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-snb2/igt@gem_ctx_persistence@legacy-engines-queued.html">SKIP</a> ([fdo#109271] / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb7/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-glk7/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk1/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb5/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb8/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-tglb7/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb6/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl7/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-xy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-iclb5/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb4/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-snb6/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb7/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([fdo#110542])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb8/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([fdo#109290])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb2/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-apl7/igt@gem_workarounds@suspend-resume-context.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl6/igt@gem_workarounds@suspend-resume-context.html">DMESG-WARN</a> ([i915#180]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl3/igt@gen7_exec_parse@basic-offset.html">SKIP</a> ([fdo#109271]) +254 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb2/igt@gen7_exec_parse@basic-offset.html">SKIP</a> ([fdo#109289]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb6/igt@gen7_exec_parse@basic-offset.html">SKIP</a> ([fdo#109289]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb6/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2856]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb1/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2856])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb3/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#1904])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-iclb1/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> ([fdo#109289] / [fdo#111719])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk1/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([fdo#109271]) +65 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([i915#579]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb3/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-glk1/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118] / [i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb3/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#111615]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb3/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk9/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl7/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl6/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb8/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb6/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-snb5/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs.html">SKIP</a> ([fdo#109271]) +320 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-single:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb5/igt@kms_chamelium@dp-crc-single.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-snb6/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl1/igt@kms_chamelium@hdmi-hpd-storm.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl7/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +21 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb5/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +11 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-negative:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb5/igt@kms_color@pipe-d-ctm-negative.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk7/igt@kms_color_chamelium@pipe-d-ctm-0-25.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl6/igt@kms_content_protection@atomic.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl2/igt@kms_content_protection@legacy.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl4/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb1/igt@kms_content_protection@uevent.html">SKIP</a> ([fdo#111828]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb6/igt@kms_content_protection@uevent.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen.html">SKIP</a> ([fdo#109271]) +169 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-glk5/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">FAIL</a> ([i915#3444])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">FAIL</a> ([i915#3444])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen.html">SKIP</a> ([i915#3319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb4/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html">SKIP</a> ([fdo#109278] / [fdo#109279])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb3/igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen.html">SKIP</a> ([fdo#109278]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement.html">SKIP</a> ([i915#3359]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-bo:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl3/igt@kms_cursor_legacy@pipe-d-single-bo.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb1/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> ([fdo#109274]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">DMESG-WARN</a> ([i915#180]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html">SKIP</a> ([fdo#109280]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#111825]) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk3/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-y:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb3/igt@kms_plane_lowres@pipe-b-tiling-y.html">SKIP</a> ([i915#3536])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-y:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb2/igt@kms_plane_lowres@pipe-d-tiling-y.html">SKIP</a> ([i915#3536]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html">SKIP</a> ([i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +8 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html">SKIP</a> ([i915#2920]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl2/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb5/igt@kms_psr2_su@frontbuffer.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk6/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb8/igt@kms_psr@psr2_sprite_plane_onoff.html">FAIL</a> ([i915#132] / [i915#3467]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb5/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> ([fdo#109441])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-snb6/igt@kms_setmode@basic.html">FAIL</a> ([i915#31])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk3/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb7/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-rg:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb2/igt@nouveau_crc@pipe-a-source-rg.html">SKIP</a> ([i915#2530]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb4/igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_self_import:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb2/igt@prime_nv_api@i915_self_import.html">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_udl:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb4/igt@prime_udl.html">SKIP</a> ([fdo#109291])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb1/igt@prime_vgem@basic-userptr.html">SKIP</a> ([i915#3301])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb4/igt@prime_vgem@basic-userptr.html">SKIP</a> ([i915#3301])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@create:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk5/igt@sysfs_clients@create.html">SKIP</a> ([fdo#109271] / [i915#2994])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb7/igt@sysfs_clients@create.html">SKIP</a> ([i915#2994])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-apl7/igt@sysfs_clients@create.html">SKIP</a> ([fdo#109271] / [i915#2994]) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb3/igt@sysfs_clients@create.html">SKIP</a> ([i915#2994])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@pidname:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl3/igt@sysfs_clients@pidname.html">SKIP</a> ([fdo#109271] / [i915#2994]) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl2/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-tglb7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2876]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-tglb6/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl2/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy.html">FAIL</a> ([i915#307]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb1/igt@gem_mmap_gtt@cpuset-big-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x128-random:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html">FAIL</a> ([i915#3444]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-iclb2/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html">SKIP</a> ([i915#3788]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb3/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-iclb1/igt@kms_psr@psr2_dpms.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb2/igt@kms_psr@psr2_dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-wait-forked-busy-hang:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-glk3/igt@kms_vblank@pipe-a-wait-forked-busy-hang.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-glk3/igt@kms_vblank@pipe-a-wait-forked-busy-hang.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-iclb4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html">SKIP</a> ([i915#2920])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html">SKIP</a> ([i915#2920]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html">SKIP</a> ([i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/shard-kbl6/igt@runner@abort">FAIL</a>, [FAIL][141]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#2505] / [i915#3002] / [i915#3363]) -&gt; ([FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148]) ([i915#180] / [i915#1814] / [i915#2505] / [i915#3002] / [i915#3363] / [i915#602])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============1129538792997998248==--
