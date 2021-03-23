Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 23 Mar 2021 19:05:43 -0000
Message-ID: <161652634350.20052.7801830598063208929@emeril.freedesktop.org>
References: <20210322184723.124410-1-arek@hiler.eu>
In-Reply-To: <20210322184723.124410-1-arek@hiler.eu>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbWVzb246?=
 =?utf-8?q?_Drop_=27=3A=27_in_test_names?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1844412659=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arek@hiler.eu>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1844412659==
Content-Type: multipart/alternative;
 boundary="===============2542495476408343348=="

--===============2542495476408343348==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: meson: Drop ':' in test names
URL   : https://patchwork.freedesktop.org/series/88297/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9881_full -> IGTPW_5637_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/index.html

Known issues
------------

  Here are the changes found in IGTPW_5637_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         NOTRUN -> [SKIP][1] ([i915#658]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb3/igt@feature_discovery@psr2.html

  * igt@gem_create@create-clear:
    - shard-glk:          [PASS][2] -> [FAIL][3] ([i915#1888] / [i915#3160]) +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-glk6/igt@gem_create@create-clear.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk9/igt@gem_create@create-clear.html

  * igt@gem_create@create-massive:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][4] ([i915#3002])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl3/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#1099]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-snb6/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_eio@kms:
    - shard-glk:          NOTRUN -> [FAIL][6] ([i915#3115])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk6/igt@gem_eio@kms.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-apl:          NOTRUN -> [FAIL][7] ([i915#2846])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [PASS][8] -> [FAIL][9] ([i915#2842]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html
    - shard-apl:          NOTRUN -> [FAIL][10] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl7/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#2842]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk6/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-iclb:         [PASS][13] -> [FAIL][14] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-iclb3/igt@gem_exec_fair@basic-pace@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb8/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-tglb:         NOTRUN -> [SKIP][15] ([fdo#109283])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb7/igt@gem_exec_params@rsvd2-dirt.html
    - shard-iclb:         NOTRUN -> [SKIP][16] ([fdo#109283])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb1/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][17] ([i915#2389]) +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb3/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][18] ([i915#2389])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][19] ([i915#2389]) +4 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb2/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@vcs0:
    - shard-kbl:          NOTRUN -> [FAIL][20] ([i915#2389]) +4 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl6/igt@gem_exec_reloc@basic-many-active@vcs0.html

  * igt@gem_exec_reloc@basic-parallel:
    - shard-kbl:          NOTRUN -> [TIMEOUT][21] ([i915#3183])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl4/igt@gem_exec_reloc@basic-parallel.html
    - shard-apl:          NOTRUN -> [TIMEOUT][22] ([i915#3183])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl2/igt@gem_exec_reloc@basic-parallel.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-apl:          NOTRUN -> [FAIL][23] ([i915#2389]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl2/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_reloc@basic-wide-active@rcs0:
    - shard-snb:          NOTRUN -> [FAIL][24] ([i915#2389]) +5 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-snb7/igt@gem_exec_reloc@basic-wide-active@rcs0.html

  * igt@gem_exec_schedule@u-fairslice@vecs0:
    - shard-iclb:         [PASS][25] -> [DMESG-WARN][26] ([i915#2803])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-iclb2/igt@gem_exec_schedule@u-fairslice@vecs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb4/igt@gem_exec_schedule@u-fairslice@vecs0.html

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-glk:          [PASS][27] -> [DMESG-WARN][28] ([i915#118] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-glk6/igt@gem_exec_whisper@basic-fds-all.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk9/igt@gem_exec_whisper@basic-fds-all.html

  * igt@gem_mmap_gtt@big-copy-xy:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#307])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-glk1/igt@gem_mmap_gtt@big-copy-xy.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk7/igt@gem_mmap_gtt@big-copy-xy.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-iclb:         [PASS][31] -> [FAIL][32] ([i915#2428])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-iclb7/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-medium-copy:
    - shard-iclb:         [PASS][33] -> [FAIL][34] ([i915#307])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-iclb8/igt@gem_mmap_gtt@cpuset-medium-copy.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb3/igt@gem_mmap_gtt@cpuset-medium-copy.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][35] ([i915#2658])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-snb5/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][36] ([fdo#109271]) +93 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl3/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#768])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#1317]) +3 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb6/igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@wc:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#1317]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb7/igt@gem_userptr_blits@mmap-offset-invalidate-active@wc.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> [INCOMPLETE][40] ([i915#2502] / [i915#2667])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl7/igt@gem_userptr_blits@vma-merge.html
    - shard-iclb:         NOTRUN -> [INCOMPLETE][41] ([i915#2502] / [i915#2667])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb6/igt@gem_userptr_blits@vma-merge.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][42] ([i915#2502] / [i915#2667])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl4/igt@gem_userptr_blits@vma-merge.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#112306])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb7/igt@gen9_exec_parse@batch-zero-length.html
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#112306])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb8/igt@gen9_exec_parse@batch-zero-length.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([i915#1902])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb6/igt@i915_pm_lpsp@screens-disabled.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-apl:          NOTRUN -> [SKIP][46] ([fdo#109271]) +232 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl1/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_selftest@live@client:
    - shard-glk:          [PASS][47] -> [DMESG-FAIL][48] ([i915#3047])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-glk1/igt@i915_selftest@live@client.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk6/igt@i915_selftest@live@client.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          NOTRUN -> [INCOMPLETE][49] ([i915#2782])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-snb5/igt@i915_selftest@live@hangcheck.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-glk:          NOTRUN -> [SKIP][50] ([fdo#109271]) +23 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk1/igt@kms_big_fb@linear-8bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#111614])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb5/igt@kms_big_fb@linear-8bpp-rotate-90.html
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#110725] / [fdo#111614])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb2/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([i915#2705])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb5/igt@kms_big_joiner@invalid-modeset.html
    - shard-kbl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [i915#2705])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl1/igt@kms_big_joiner@invalid-modeset.html
    - shard-apl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [i915#2705])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl8/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@pipe-c-random-ccs-data:
    - shard-snb:          NOTRUN -> [SKIP][56] ([fdo#109271]) +335 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-snb6/igt@kms_ccs@pipe-c-random-ccs-data.html

  * igt@kms_chamelium@hdmi-mode-timings:
    - shard-kbl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl1/igt@kms_chamelium@hdmi-mode-timings.html
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb5/igt@kms_chamelium@hdmi-mode-timings.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [fdo#111827]) +25 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl1/igt@kms_chamelium@vga-hpd.html

  * igt@kms_color_chamelium@pipe-a-ctm-green-to-red:
    - shard-glk:          NOTRUN -> [SKIP][60] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk3/igt@kms_color_chamelium@pipe-a-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb6/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
    - shard-snb:          NOTRUN -> [SKIP][62] ([fdo#109271] / [fdo#111827]) +22 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-snb2/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          NOTRUN -> [TIMEOUT][63] ([i915#1319])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          NOTRUN -> [TIMEOUT][64] ([i915#1319])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#111828])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          NOTRUN -> [DMESG-WARN][66] ([i915#180])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109278] / [fdo#109279])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#109279]) +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - shard-apl:          NOTRUN -> [DMESG-FAIL][69] ([IGT#6])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_cursor_legacy@pipe-d-single-bo:
    - shard-kbl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#533])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl7/igt@kms_cursor_legacy@pipe-d-single-bo.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [PASS][71] -> [INCOMPLETE][72] ([i915#155] / [i915#180] / [i915#636])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109274])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb7/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
    - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#2642])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
    - shard-glk:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#2642])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
    - shard-kbl:          NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#2642])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([fdo#111825]) +10 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109280]) +8 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][79] -> [DMESG-WARN][80] ([i915#180]) +3 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([i915#1839])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#533]) +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl3/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][83] ([i915#265])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][84] ([fdo#108145] / [i915#265]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
    - shard-apl:          NOTRUN -> [FAIL][85] ([fdo#108145] / [i915#265])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109278]) +3 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb1/igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([fdo#111615]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb6/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-apl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#658]) +7 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
    - shard-kbl:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#658])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-3:
    - shard-glk:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#658])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk6/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][91] -> [SKIP][92] ([fdo#109642] / [fdo#111068] / [i915#658])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb8/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [PASS][93] -> [SKIP][94] ([fdo#109441])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109441])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb7/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_sysfs_edid_timing:
    - shard-kbl:          NOTRUN -> [FAIL][96] ([IGT#2])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl6/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][97] -> [DMESG-WARN][98] ([i915#180] / [i915#295])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vrr@flipline:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([fdo#109502])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb5/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-check-output:
    - shard-iclb:         NOTRUN -> [SKIP][100] ([i915#2437])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb2/igt@kms_writeback@writeback-check-output.html
    - shard-kbl:          NOTRUN -> [SKIP][101] ([fdo#109271] / [i915#2437])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl6/igt@kms_writeback@writeback-check-output.html
    - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#2437])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb3/igt@kms_writeback@writeback-check-output.html
    - shard-glk:          NOTRUN -> [SKIP][103] ([fdo#109271] / [i915#2437])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk8/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-apl:          NOTRUN -> [SKIP][104] ([fdo#109271] / [i915#2437])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl3/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sysfs_clients@split-10@bcs0:
    - shard-apl:          NOTRUN -> [SKIP][105] ([fdo#109271] / [i915#3026])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl8/igt@sysfs_clients@split-10@bcs0.html

  
#### Possible fixes ####

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [TIMEOUT][106] ([i915#2369] / [i915#2481] / [i915#3070]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-iclb2/igt@gem_eio@unwedge-stress.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb6/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [FAIL][108] ([i915#2846]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-glk4/igt@gem_exec_fair@basic-deadline.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [FAIL][110] ([i915#2842]) -> [PASS][111] +3 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [FAIL][112] ([i915#2842]) -> [PASS][113] +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-glk8/igt@gem_exec_fair@basic-none-share@rcs0.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_schedule@u-fairslice@rcs0:
    - shard-iclb:         [DMESG-WARN][114] ([i915#2803]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-iclb2/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb4/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-glk:          [DMESG-WARN][116] ([i915#118] / [i915#95]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk4/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][118] ([i915#2190]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap_gtt@cpuset-big-copy-xy:
    - shard-iclb:         [FAIL][120] ([i915#307]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-iclb2/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb7/igt@gem_mmap_gtt@cpuset-big-copy-xy.html

  * igt@kms_cursor_crc@pipe-a-cursor-dpms:
    - shard-kbl:          [FAIL][122] ([i915#54]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
    - shard-apl:          [FAIL][124] ([i915#54]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-dpms.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][126] ([i915#180]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][128] ([i915#79]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-tglb:         [FAIL][130] ([i915#79]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [FAIL][132] ([i915#2598]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [DMESG-WARN][134] ([i915#180]) -> [PASS][135] +1 similar issue
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-apl6/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl8/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][136] ([i915#180] / [i915#533]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [SKIP][138] ([fdo#109441]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-iclb5/igt@kms_psr@psr2_primary_render.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb2/igt@kms_psr@psr2_primary_render.html

  * igt@kms_pwrite_crc:
    - shard-snb:          [SKIP][140] ([fdo#109271]) -> [PASS][141] +1 similar issue
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-snb6/igt@kms_pwrite_crc.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-snb6/igt@kms_pwrite_crc.html

  * igt@sysfs_clients@recycle-many:
    - shard-glk:          [FAIL][142] ([i915#3028]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-glk4/igt@sysfs_clients@recycle-many.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk8/igt@sysfs_clients@recycle-many.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][144] ([i915#2681] / [i915#2684]) -> [WARN][145] ([i915#1804] / [i915#2684])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [FAIL][146] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][147] ([i915#1319])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-apl8/igt@kms_content_protection@atomic.html
   [147]: htt

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/index.html

--===============2542495476408343348==
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
<tr><td><b>Series:</b></td><td>meson: Drop &#39;:&#39; in test names</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88297/">https://patchwork.freedesktop.org/series/88297/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9881_full -&gt; IGTPW_5637_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5637_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb3/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-clear:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-glk6/igt@gem_create@create-clear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk9/igt@gem_create@create-clear.html">FAIL</a> ([i915#1888] / [i915#3160]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl3/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-snb6/igt@gem_ctx_persistence@smoketest.html">SKIP</a> ([fdo#109271] / [i915#1099]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk6/igt@gem_eio@kms.html">FAIL</a> ([i915#3115])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl7/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-iclb3/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb8/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb7/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb1/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb3/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb2/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl6/igt@gem_exec_reloc@basic-many-active@vcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-parallel:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl4/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a> ([i915#3183])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl2/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a> ([i915#3183])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl2/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@rcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-snb7/igt@gem_exec_reloc@basic-wide-active@rcs0.html">FAIL</a> ([i915#2389]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vecs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-iclb2/igt@gem_exec_schedule@u-fairslice@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb4/igt@gem_exec_schedule@u-fairslice@vecs0.html">DMESG-WARN</a> ([i915#2803])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-glk6/igt@gem_exec_whisper@basic-fds-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk9/igt@gem_exec_whisper@basic-fds-all.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy-xy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-glk1/igt@gem_mmap_gtt@big-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk7/igt@gem_mmap_gtt@big-copy-xy.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-iclb7/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">FAIL</a> ([i915#2428])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-iclb8/igt@gem_mmap_gtt@cpuset-medium-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb3/igt@gem_mmap_gtt@cpuset-medium-copy.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-snb5/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl3/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([fdo#109271]) +93 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb6/igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt.html">SKIP</a> ([i915#1317]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@wc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb7/igt@gem_userptr_blits@mmap-offset-invalidate-active@wc.html">SKIP</a> ([i915#1317]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl7/igt@gem_userptr_blits@vma-merge.html">INCOMPLETE</a> ([i915#2502] / [i915#2667])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb6/igt@gem_userptr_blits@vma-merge.html">INCOMPLETE</a> ([i915#2502] / [i915#2667])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl4/igt@gem_userptr_blits@vma-merge.html">INCOMPLETE</a> ([i915#2502] / [i915#2667])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb7/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> ([fdo#112306])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb8/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> ([fdo#112306])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb6/igt@i915_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#1902])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl1/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([fdo#109271]) +232 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-glk1/igt@i915_selftest@live@client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk6/igt@i915_selftest@live@client.html">DMESG-FAIL</a> ([i915#3047])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-snb5/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> ([i915#2782])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk1/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([fdo#109271]) +23 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb5/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([fdo#111614])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb2/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb5/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl8/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-snb6/igt@kms_ccs@pipe-c-random-ccs-data.html">SKIP</a> ([fdo#109271]) +335 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-mode-timings:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl1/igt@kms_chamelium@hdmi-mode-timings.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb5/igt@kms_chamelium@hdmi-mode-timings.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl1/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-green-to-red:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk3/igt@kms_color_chamelium@pipe-a-ctm-green-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb6/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-snb2/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl7/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl1/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb2/igt@kms_content_protection@uevent.html">SKIP</a> ([fdo#111828])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding.html">SKIP</a> ([fdo#109278] / [fdo#109279])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html">SKIP</a> ([fdo#109279]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">DMESG-FAIL</a> ([IGT#6])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-bo:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl7/igt@kms_cursor_legacy@pipe-d-single-bo.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#155] / [i915#180] / [i915#636])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb7/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> ([fdo#111825]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> ([fdo#109280]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> ([i915#180]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl3/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb1/igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max.html">SKIP</a> ([fdo#109278]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb6/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html">SKIP</a> ([fdo#111615]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-3:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk6/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb8/igt@kms_psr2_su@frontbuffer.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb7/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl6/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#180] / [i915#295])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb5/igt@kms_vrr@flipline.html">SKIP</a> ([fdo#109502])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb2/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl6/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb3/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk8/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl3/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl8/igt@sysfs_clients@split-10@bcs0.html">SKIP</a> ([fdo#109271] / [i915#3026])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-iclb2/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#2481] / [i915#3070]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb6/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-glk4/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk2/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-glk8/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-iclb2/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> ([i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb4/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked-all.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk4/igt@gem_exec_whisper@basic-contexts-forked-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb3/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-xy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-iclb2/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">FAIL</a> ([i915#307]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb7/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-dpms:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-dpms.html">FAIL</a> ([i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-dpms.html">FAIL</a> ([i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-dpms.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> ([i915#2598]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-apl6/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-apl8/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">DMESG-WARN</a> ([i915#180] / [i915#533]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-iclb5/igt@kms_psr@psr2_primary_render.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb2/igt@kms_psr@psr2_primary_render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pwrite_crc:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-snb6/igt@kms_pwrite_crc.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-snb6/igt@kms_pwrite_crc.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-glk4/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i915#3028]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-glk8/igt@sysfs_clients@recycle-many.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5637/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9881/shard-apl8/igt@kms_content_protection@atomic.html">FAIL</a> ([fdo#110321] / [fdo#110336]) -&gt; <a href="htt">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2542495476408343348==--

--===============1844412659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1844412659==--
